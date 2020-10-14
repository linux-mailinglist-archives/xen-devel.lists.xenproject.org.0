Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B5F28DA46
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 09:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6454.17246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSar1-0000QD-SJ; Wed, 14 Oct 2020 07:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6454.17246; Wed, 14 Oct 2020 07:05:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSar1-0000Po-OV; Wed, 14 Oct 2020 07:05:43 +0000
Received: by outflank-mailman (input) for mailman id 6454;
 Wed, 14 Oct 2020 07:05:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSar0-0000Pi-H8
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 07:05:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1363ac7b-77ba-4f62-b021-16281843ecfb;
 Wed, 14 Oct 2020 07:05:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC8B2B169;
 Wed, 14 Oct 2020 07:05:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSar0-0000Pi-H8
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 07:05:42 +0000
X-Inumbo-ID: 1363ac7b-77ba-4f62-b021-16281843ecfb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1363ac7b-77ba-4f62-b021-16281843ecfb;
	Wed, 14 Oct 2020 07:05:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602659141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=buQ33p2+rSRUtvOyS1U4qMMS2XBpZyaV3p+/tEWXhHU=;
	b=OJ4POUJQC6kBOwBh7vNmDpuf6vob77ZMGdYHEf+jRoxqS58RwMal0k32mheldvQ4Fm1ml5
	eKTppyF6JyklGs1zWLlSFxnjH52U5yyQVL7jTLuyyPU/jJIIs894w9c2odu4hS4yWAhyAj
	I3AtjDZroKMr5auZUSHSnoUzrrDVSp0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EC8B2B169;
	Wed, 14 Oct 2020 07:05:40 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] kexec: some #include adjustments
Message-ID: <c786bd7e-960a-6496-ec9a-4e04a771b80a@suse.com>
Date: Wed, 14 Oct 2020 09:05:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In the context of working on x86's elf_core_save_regs() I noticed there
were far more source files getting rebuilt than I would have expected.
While the main offender looks to have been fixmap.h including kexec.h,
also drop use of elfcore.h from kexec.h.

While adjusting machine_kexec.c also replace use of guest_access.h by
domain_page.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -16,8 +16,9 @@
  */
 
 #include <xen/types.h>
+#include <xen/domain_page.h>
+#include <xen/elfstructs.h>
 #include <xen/kexec.h>
-#include <xen/guest_access.h>
 #include <asm/fixmap.h>
 #include <asm/hpet.h>
 #include <asm/page.h>
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -10,6 +10,7 @@
 #include <xen/lib.h>
 #include <xen/acpi.h>
 #include <xen/ctype.h>
+#include <xen/elfcore.h>
 #include <xen/errno.h>
 #include <xen/guest_access.h>
 #include <xen/param.h>
--- a/xen/include/asm-x86/fixmap.h
+++ b/xen/include/asm-x86/fixmap.h
@@ -21,7 +21,6 @@
 
 #include <xen/acpi.h>
 #include <xen/pfn.h>
-#include <xen/kexec.h>
 #include <asm/apicdef.h>
 #include <asm/msi.h>
 #include <acpi/apei.h>
--- a/xen/include/xen/elfcore.h
+++ b/xen/include/xen/elfcore.h
@@ -56,7 +56,7 @@ typedef struct
     int pr_fpvalid;              /* True if math co-processor being used.  */
 } ELF_Prstatus;
 
-typedef struct {
+typedef struct crash_xen_info {
     unsigned long xen_major_version;
     unsigned long xen_minor_version;
     unsigned long xen_extra_version;
--- a/xen/include/xen/kexec.h
+++ b/xen/include/xen/kexec.h
@@ -5,7 +5,6 @@
 
 #include <public/kexec.h>
 
-#include <xen/elfcore.h>
 #include <xen/kimage.h>
 
 typedef struct xen_kexec_reserve {
@@ -51,7 +50,7 @@ void machine_reboot_kexec(struct kexec_i
 void machine_kexec(struct kexec_image *image);
 void kexec_crash(void);
 void kexec_crash_save_cpu(void);
-crash_xen_info_t *kexec_crash_save_info(void);
+struct crash_xen_info *kexec_crash_save_info(void);
 void machine_crash_shutdown(void);
 int machine_kexec_get(xen_kexec_range_t *range);
 int machine_kexec_get_xen(xen_kexec_range_t *range);

