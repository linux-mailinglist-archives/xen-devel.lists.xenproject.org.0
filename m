Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBE1A1D06
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 10:01:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM5dp-0003bQ-Hh; Wed, 08 Apr 2020 08:00:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jM5do-0003bL-3E
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 08:00:56 +0000
X-Inumbo-ID: 12047fea-796f-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12047fea-796f-11ea-83d8-bc764e2007e4;
 Wed, 08 Apr 2020 08:00:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9D864AD2C;
 Wed,  8 Apr 2020 08:00:52 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/EFI: also fill boot_tsc_stamp on the xen.efi boot path
Message-ID: <7ed6f7cc-c540-88fb-6073-10ef1a2da6e7@suse.com>
Date: Wed, 8 Apr 2020 10:00:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit e3a379c35eff ("x86/time: always count s_time from Xen boot")
introducing this missed adjusting this path as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -8,6 +8,7 @@
 #include <asm/edd.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
+#include <asm/setup.h>
 
 static struct file __initdata ucode;
 static multiboot_info_t __initdata mbi = {
@@ -673,6 +674,8 @@ static void __init efi_arch_cpu(void)
     uint32_t eax = cpuid_eax(0x80000000);
     uint32_t *caps = boot_cpu_data.x86_capability;
 
+    boot_tsc_stamp = rdtsc();
+
     caps[cpufeat_word(X86_FEATURE_HYPERVISOR)] = cpuid_ecx(1);
 
     if ( (eax >> 16) == 0x8000 && eax > 0x80000000 )
--- a/xen/include/asm-x86/setup.h
+++ b/xen/include/asm-x86/setup.h
@@ -10,6 +10,7 @@ extern char __2M_init_start[], __2M_init
 extern char __2M_rwdata_start[], __2M_rwdata_end[];
 
 extern unsigned long xenheap_initial_phys_start;
+extern uint64_t boot_tsc_stamp;
 
 void early_cpu_init(void);
 void early_time_init(void);

