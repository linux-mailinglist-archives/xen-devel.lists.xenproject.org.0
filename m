Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02822645C2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 14:11:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGLQY-0007cF-Lk; Thu, 10 Sep 2020 12:11:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGLQX-0007cA-GA
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 12:11:45 +0000
X-Inumbo-ID: e34baedc-f7d6-4b9d-9ec4-a8cfc22ed640
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e34baedc-f7d6-4b9d-9ec4-a8cfc22ed640;
 Thu, 10 Sep 2020 12:11:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D68DAD52;
 Thu, 10 Sep 2020 12:11:59 +0000 (UTC)
Subject: [PATCH 1/6] tools/include: adjust population of acpi/
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
Message-ID: <095cad04-fe20-c31c-9761-880c3a9d568a@suse.com>
Date: Thu, 10 Sep 2020 14:11:45 +0200
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

Limit what gets exposed - in particular cpufreq/ and apei.h are
hypervisor private headers which the tool stack building shouldn't see
or use. Also don't pass -f to ln, to allow noticing name collisions
right away.

Additionally acpi/ also has been in need of deleting at the start of
the rule, or alternatively the respective ln would have needed to also
be passed -n.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -16,15 +16,16 @@ XEN_PUBLIC_INCLUDES = $(wildcard $(XEN_R
 XEN_LIB_X86_INCLUDES = $(filter-out %autogen.h, $(XEN_ROOT)/xen/include/xen/lib/x86/Makefile $(wildcard $(XEN_ROOT)/xen/include/xen/lib/x86/*.h))
 
 xen/.dir: $(XEN_PUBLIC_INCLUDES) $(XEN_LIB_X86_INCLUDES)
-	@rm -rf xen
-	mkdir -p xen/libelf
+	@rm -rf xen acpi
+	mkdir -p xen/libelf acpi
 	ln -sf $(XEN_ROOT)/xen/include/public/COPYING xen
 	ln -sf $(XEN_PUBLIC_INCLUDES) xen
 	ln -sf $(addprefix $(XEN_ROOT)/xen/include/public/,arch-x86 arch-arm hvm io xsm) xen
 	ln -sf ../xen-sys/$(XEN_OS) xen/sys
 	ln -sf $(addprefix $(XEN_ROOT)/xen/include/xen/,libelf.h elfstructs.h) xen/libelf/
 	ln -s ../xen-foreign xen/foreign
-	ln -sf $(XEN_ROOT)/xen/include/acpi acpi
+	ln -s $(XEN_ROOT)/xen/include/acpi/platform acpi/
+	ln -s $(XEN_ROOT)/xen/include/acpi/ac*.h acpi/
 ifeq ($(CONFIG_X86),y)
 	ln -sf $(XEN_ROOT)/xen/include/asm-x86 xen/asm
 	mkdir -p xen/lib/x86


