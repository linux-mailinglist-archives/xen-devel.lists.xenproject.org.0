Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05B722631F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 17:20:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxXam-0003F1-3E; Mon, 20 Jul 2020 15:20:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxXak-0003Ew-Pv
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 15:20:34 +0000
X-Inumbo-ID: 8de45cbb-ca9c-11ea-9fc2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8de45cbb-ca9c-11ea-9fc2-12813bfff9fa;
 Mon, 20 Jul 2020 15:20:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A0AEB893;
 Mon, 20 Jul 2020 15:20:23 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/S3: put data segment registers into known state upon
 resume
Message-ID: <3cad2798-1a01-7d5e-ea55-ddb9ba6388d9@suse.com>
Date: Mon, 20 Jul 2020 17:20:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "M. Vefa Bicakci" <m.v.b@runbox.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

wakeup_32 sets %ds and %es to BOOT_DS, while leaving %fs at what
wakeup_start did set it to, and %gs at whatever BIOS did load into it.
All of this may end up confusing the first load_segments() to run on
the BSP after resume, in particular allowing a non-nul selector value
to be left in %fs.

Alongside %ss, also put all other data segment registers into the same
state that the boot and CPU bringup paths put them in.

Reported-by: M. Vefa Bicakci <m.v.b@runbox.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -52,6 +52,16 @@ ENTRY(s3_resume)
         mov     %eax, %ss
         mov     saved_rsp(%rip), %rsp
 
+        /*
+         * Also put other segment registers into known state, like would
+         * be done on the boot path. This is in particular necessary for
+         * the first load_segments() to work as intended.
+         */
+        mov     %eax, %ds
+        mov     %eax, %es
+        mov     %eax, %fs
+        mov     %eax, %gs
+
         /* Reload code selector */
         pushq   $__HYPERVISOR_CS
         leaq    1f(%rip),%rax

