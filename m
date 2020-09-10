Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FB52645C3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 14:12:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGLQq-0007ep-Ur; Thu, 10 Sep 2020 12:12:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGLQp-0007eg-IZ
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 12:12:03 +0000
X-Inumbo-ID: eab88b06-617b-4594-82f4-727e6ea2d5f7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eab88b06-617b-4594-82f4-727e6ea2d5f7;
 Thu, 10 Sep 2020 12:12:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B06F6AFC8;
 Thu, 10 Sep 2020 12:12:17 +0000 (UTC)
Subject: [PATCH 2/6] tools/include: fix (drop) dependencies of when to
 populate xen/
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
Message-ID: <91bba197-83d5-b9eb-3a1c-8bc00571b844@suse.com>
Date: Thu, 10 Sep 2020 14:12:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Making the population of xen/ depend on the time stamps of a subset of
the headers put there is error prone. The creation of a few dozen
symlinks doesn't take a meaningful amount of time (compared to the
overall building of tools/), and hence - to be on the safe side - should
simply be done always. Convert the goal to a phony one and drop its
dependencies, effectively taking further what 8d8d7d6b3dc1 ("tools: fix
linking hypervisor includes to tools include directory") had already
attempted.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -4,8 +4,8 @@ include $(XEN_ROOT)/tools/Rules.mk
 # Relative to $(XEN_ROOT)/xen/xsm/flask
 FLASK_H_DEPEND := policy/initial_sids
 
-.PHONY: all all-y build
-all build: all-y xen-foreign xen/.dir xen-xsm/.dir
+.PHONY: all all-y build xen-dir
+all build: all-y xen-foreign xen-dir xen-xsm/.dir
 all-y:
 
 .PHONY: xen-foreign
@@ -15,7 +15,7 @@ xen-foreign:
 XEN_PUBLIC_INCLUDES = $(wildcard $(XEN_ROOT)/xen/include/public/*.h)
 XEN_LIB_X86_INCLUDES = $(filter-out %autogen.h, $(XEN_ROOT)/xen/include/xen/lib/x86/Makefile $(wildcard $(XEN_ROOT)/xen/include/xen/lib/x86/*.h))
 
-xen/.dir: $(XEN_PUBLIC_INCLUDES) $(XEN_LIB_X86_INCLUDES)
+xen-dir:
 	@rm -rf xen acpi
 	mkdir -p xen/libelf acpi
 	ln -sf $(XEN_ROOT)/xen/include/public/COPYING xen
@@ -33,9 +33,8 @@ ifeq ($(CONFIG_X86),y)
 		ln -sf $(XEN_ROOT)/xen/include/xen/lib/x86/$$f xen/lib/x86/$$f; \
 	done
 endif
-	touch $@
 
-all-$(CONFIG_X86): xen/.dir
+all-$(CONFIG_X86): xen-dir
 	$(MAKE) -C xen/lib/x86 all XEN_ROOT=$(XEN_ROOT) PYTHON=$(PYTHON)
 
 # Not xen/xsm as that clashes with link to


