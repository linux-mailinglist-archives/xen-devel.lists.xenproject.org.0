Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADDE330A34
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 10:22:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94715.178278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJC5e-00021e-34; Mon, 08 Mar 2021 09:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94715.178278; Mon, 08 Mar 2021 09:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJC5d-00021E-Vd; Mon, 08 Mar 2021 09:22:13 +0000
Received: by outflank-mailman (input) for mailman id 94715;
 Mon, 08 Mar 2021 09:22:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJC5d-000218-0A
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:22:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 314afd13-a55b-4dde-a39c-d5bbfb0002bc;
 Mon, 08 Mar 2021 09:22:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3419AC54;
 Mon,  8 Mar 2021 09:22:10 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 314afd13-a55b-4dde-a39c-d5bbfb0002bc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615195330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBPEIIF1GkKi/wEzrj3sY/FjwcZUTOVXQqJe8a6sZ7I=;
	b=POzOGYtBSbb+2Htpn0nR23n/YVEHsg76seL8gd2jcK2CDFy2ieAwfizkEYh7PZaRj7IX+m
	MVcq46rNI4vIUR80Y8B8OvcUYFaXEDyuW7IjuAT9k/pA3M5uxElm6hk9a4ZGOFkC+/Pf45
	oAttEarzg+ed7MgmqXIWwrbNs2A5Iuc=
Subject: [PATCH 1/2][4.15?] tools/x86: don't rebuild cpuid-autogen.h every
 time
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d08ec3ba-dff1-cb1c-9103-949e15774fd5@suse.com>
Message-ID: <336aaf51-f163-8ee7-d8ee-297f6f3052fd@suse.com>
Date: Mon, 8 Mar 2021 10:22:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d08ec3ba-dff1-cb1c-9103-949e15774fd5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The first thing the "xen-dir" rule does is delete the entire xen/
subtree. Obviously this includes deleting xen/lib/x86/*autogen.h. As a
result there's no original version for $(move-if-changed ...) to compare
against, and hence the file and all its consumers would get rebuilt
every time. Introduce a "prep-y" rule to move xen/lib/x86/ on the side,
to then recover any *autogen.h from there prior to invoking the
respective recursive $(MAKE) invocation.

Fixes: eddf9559c977 ("libx86: generate cpuid-autogen.h in the libx86 include dir")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/.gitignore
+++ b/.gitignore
@@ -234,6 +234,7 @@
 tools/hotplug/NetBSD/rc.d/xendriverdomain
 tools/include/acpi
 tools/include/_libxl*.h
+tools/include/.xen*/*
 tools/include/_xentoolcore_list.h
 tools/include/xen/*
 tools/include/xen-xsm/*
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -10,15 +10,15 @@ include $(XEN_ROOT)/tools/Rules.mk
 # Relative to $(XEN_ROOT)/xen/xsm/flask
 FLASK_H_DEPEND := policy/initial_sids
 
-.PHONY: all all-y build xen-dir
+.PHONY: all all-y build prep-y xen-dir
 all build: all-y xen-foreign xen-dir xen-xsm/.dir
-all-y:
+all-y prep-y:
 
 .PHONY: xen-foreign
 xen-foreign:
 	$(MAKE) -C xen-foreign
 
-xen-dir:
+xen-dir: prep-y
 	@rm -rf xen acpi
 	mkdir -p xen/libelf acpi
 	ln -s $(XEN_ROOT)/xen/include/public/COPYING xen/
@@ -36,7 +36,15 @@ ifeq ($(CONFIG_X86),y)
 	ln -s $(XEN_ROOT)/xen/include/xen/lib/x86/Makefile xen/lib/x86/
 endif
 
+# Arrange for preserving of auto-generated headers (to avoid them getting
+# rebuilt every time): Move the entire xen/lib/x86/ to a temporary place.
+prep-$(CONFIG_X86):
+	rm -rf .xen-lib-x86
+	test ! -d xen/lib/x86 || mv xen/lib/x86 .xen-lib-x86
+
 all-$(CONFIG_X86): xen-dir
+	$(if $(wildcard .xen-lib-x86/*autogen.h),mv .xen-lib-x86/*autogen.h xen/lib/x86/)
+	rm -rf .xen-lib-x86
 	$(MAKE) -C xen/lib/x86 all XEN_ROOT=$(XEN_ROOT) PYTHON=$(PYTHON)
 
 # Not xen/xsm as that clashes with link to
@@ -78,7 +86,7 @@ uninstall:
 
 .PHONY: clean
 clean:
-	rm -rf xen xen-xsm acpi
+	rm -rf xen xen-xsm .xen* acpi
 	$(MAKE) -C xen-foreign clean
 
 .PHONY: dist


