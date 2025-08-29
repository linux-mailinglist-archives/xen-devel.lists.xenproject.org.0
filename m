Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEBFB3C06F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101820.1454765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1mw-0007G4-H6; Fri, 29 Aug 2025 16:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101820.1454765; Fri, 29 Aug 2025 16:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1mw-0007Cy-D2; Fri, 29 Aug 2025 16:17:18 +0000
Received: by outflank-mailman (input) for mailman id 1101820;
 Fri, 29 Aug 2025 16:17:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4pU=3J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1us1mv-0006Z8-9m
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:17:17 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a07cdd40-84f3-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 18:17:15 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ce772ce0dbso1302517f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 09:17:15 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0a7691340sm2973328f8f.39.2025.08.29.09.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 09:17:13 -0700 (PDT)
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
X-Inumbo-ID: a07cdd40-84f3-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756484234; x=1757089034; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HF/T7+4Ls9F6d44sa/t+0TCDlA7JApHmbmQIrgANsEw=;
        b=D9LnL7ULRBfQMINODDDXcIJdHZIosy8ennavZQAG2NvI8E7OeRYzBKdZpw0x4XPPmk
         kLb+vAOP+vl3qfx61uecPSvHo5KEnR9h4Yyj0WVoKxP1tbMVBmHk9ufXSA2Fzotfgj6V
         GqTP+/inVGf4wkFD2iB5iU7JVIMQ7CmeK3qEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756484234; x=1757089034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HF/T7+4Ls9F6d44sa/t+0TCDlA7JApHmbmQIrgANsEw=;
        b=k1r6MpspBSQgNHKInZGrXgVU6feNNM5EZ628dJuhbOZ/xNdjA6PkTXMS0PMvW+Rqyg
         QoU4avgmRfE8G9Qo598Shbe5KyRcTZOwvDQiqNdOkvDIR1lyfZh1bBQcZz582K+Fpzrr
         okk/KpUQ4583Bc665gJtT6cTZyBN9yAkB9ZFAXFEIzdFhPlZ8T+2vYQU0BufQYwM9YKJ
         k90K5/qHoRh7NNkRXzOTxRBCs970WeWXTA6uk8hlMlueTyLPxuuFATXx4jzLb3Jas7pM
         CY9rzNSG8c7c9dUv9fOmPCHXnGRpLqX2iEAeLs13qHWmUEjtIGwACJznjLtthC4OVQdZ
         nZfw==
X-Gm-Message-State: AOJu0YxJd/8hrKAHn+55aO4FtDtj4FTj1yk2e9fuRfQF0dzzhD0yi9eW
	Qk/+sQuDmfFg1WWAkEAxBgFkhe/WLme4NNo3650nwv7QUBwQFH3i2bB3hJH/DeBvPu4ESPLfjaw
	6x4bt
X-Gm-Gg: ASbGncsYqQEJ/rlxU3p3pqkA6O7xt6cufmDGMJeds+HP9HAZhmlz8wkppL7KWNbxvMw
	DVPDoKqCs1tydqDf/LzOjqYkQKtgJVsoaeB0xhKezubdKpxMq6XzteD5B0XERgXDOhcq8sRxczG
	k+4V1vdsJcDbaRTsbh3bIWU/E5dy48QVITy3TIVLnnqgJgBPgNVPazenIMmQCj4NoueAlunk1e0
	vAy2xqra8ZlTu2+H46zRLKWljvAipHALs3xdH5nM9GEjF6ONa4GvpYSA/kv+ALhOMn1h1YjVEH1
	w/ijoOnGkh03HE6TfcOqRWjEP0odFi+49lUBFEjqqL6mGcVz04qJGiV1SUS609Pipr6TwnoVu1p
	syThzIVF5gVRpwPM76T6v/f5Alb0LtwA9ufS4U5rkmRO7iL7Fy0HhoHuc5D5ve8UAXZVptAa4F0
	h0
X-Google-Smtp-Source: AGHT+IF9xRJfxl753+olKdRsofxIAWst2inT+AZXQPO1seRioepAvcNi36LHwQq0fGvYrHotlLjlfw==
X-Received: by 2002:a5d:5f8d:0:b0:3c8:89e9:6ab3 with SMTP id ffacd0b85a97d-3c889e96d40mr17411778f8f.46.1756484234445;
        Fri, 29 Aug 2025 09:17:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] x86/apic: Get rid of get_physical_broadcast()
Date: Fri, 29 Aug 2025 17:17:09 +0100
Message-Id: <20250829161710.1056772-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829161710.1056772-1-andrew.cooper3@citrix.com>
References: <20250829161710.1056772-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a port of Linux commit 517234446c1a ("x86/apic: Get rid of
get_physical_broadcast()") to Xen.  Thomas Gleixner notes:

  There is no point for this function. The only case where this is used is
  when there is no XAPIC available, which means the broadcast address is 0xF.

In Linux, users of get_physical_broadcast() have already been hidden behind
CONFIG_X86_32 suggesting we can drop all of this, but that's a task for some
other time.

In Xen as with Linux, setup_ioapic_ids_from_mpc() and io_apic_get_unique_id()
are only called in pre-xAPIC cases, so can use a broadcast ID of 0xf.  The
only other user is __print_IO_APIC() for diagnostics, which can simply drop
the check.

No functional change.

Link: https://lore.kernel.org/r/20240212154639.057209154@linutronix.de
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

  add/remove: 0/1 grow/shrink: 0/3 up/down: 0/-165 (-165)
  Function                                     old     new   delta
  __print_IO_APIC                              980     975      -5
  setup_IO_APIC                               3018    2992     -26
  io_apic_get_unique_id                        719     686     -33
  get_physical_broadcast                       101       -    -101
---
 xen/arch/x86/apic.c             |  8 --------
 xen/arch/x86/include/asm/apic.h |  2 --
 xen/arch/x86/io_apic.c          | 16 ++++++++--------
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index e3a2b84f1aae..70636b0bb585 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -133,14 +133,6 @@ static bool __read_mostly using_apic_timer;
 
 static bool __read_mostly enabled_via_apicbase;
 
-int get_physical_broadcast(void)
-{
-    if (modern_apic())
-        return 0xff;
-    else
-        return 0xf;
-}
-
 int get_maxlvt(void)
 {
     unsigned int v = apic_read(APIC_LVR);
diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index d8eda6df6d86..d22854953689 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -153,8 +153,6 @@ static inline u32 get_apic_id(void)
 
 void apic_wait_icr_idle(void);
 
-int get_physical_broadcast(void);
-
 static inline void ack_APIC_irq(void)
 {
 	/* Docs say use 0 for future compatibility */
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 1816e1c0b9f4..42a9b653d397 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1217,8 +1217,6 @@ static void /*__init*/ __print_IO_APIC(bool boot)
 	printk(KERN_DEBUG ".......    : physical APIC id: %02X\n", reg_00.bits.ID);
 	printk(KERN_DEBUG ".......    : Delivery Type: %X\n", reg_00.bits.delivery_type);
 	printk(KERN_DEBUG ".......    : LTS          : %X\n", reg_00.bits.LTS);
-	if (reg_00.bits.ID >= get_physical_broadcast())
-            UNEXPECTED_IO_APIC();
 	if (reg_00.bits.__reserved_1 || reg_00.bits.__reserved_2)
             UNEXPECTED_IO_APIC();
 
@@ -1475,6 +1473,7 @@ static void __init setup_ioapic_ids_from_mpc(void)
     int i;
     unsigned char old_id;
     unsigned long flags;
+    const uint32_t broadcast_id = 0xf;
 
     /*
      * Don't check I/O APIC IDs for xAPIC systems. They have
@@ -1504,7 +1503,7 @@ static void __init setup_ioapic_ids_from_mpc(void)
 		
         old_id = mp_ioapics[apic].mpc_apicid;
 
-        if (mp_ioapics[apic].mpc_apicid >= get_physical_broadcast()) {
+        if (mp_ioapics[apic].mpc_apicid >= broadcast_id) {
             printk(KERN_ERR "BIOS bug, IO-APIC#%d ID is %d in the MPC table!...\n",
                    apic, mp_ioapics[apic].mpc_apicid);
             printk(KERN_ERR "... fixing up to %d. (tell your hw vendor)\n",
@@ -1521,10 +1520,10 @@ static void __init setup_ioapic_ids_from_mpc(void)
         {
             printk(KERN_ERR "BIOS bug, IO-APIC#%d ID %d is already used!...\n",
                    apic, mp_ioapics[apic].mpc_apicid);
-            for (i = 0; i < get_physical_broadcast(); i++)
+            for (i = 0; i < broadcast_id; i++)
                 if (!physid_isset(i, phys_id_present_map))
                     break;
-            if (i >= get_physical_broadcast())
+            if (i >= broadcast_id)
                 panic("Max APIC ID exceeded\n");
             printk(KERN_ERR "... fixing up to %d. (tell your hw vendor)\n",
                    i);
@@ -2223,6 +2222,7 @@ int __init io_apic_get_unique_id (int ioapic, int apic_id)
     static physid_mask_t __initdata apic_id_map = PHYSID_MASK_NONE;
     unsigned long flags;
     int i = 0;
+    const uint32_t broadcast_id = 0xf;
 
     /*
      * The P4 platform supports up to 256 APIC IDs on two separate APIC 
@@ -2240,7 +2240,7 @@ int __init io_apic_get_unique_id (int ioapic, int apic_id)
     reg_00.raw = io_apic_read(ioapic, 0);
     spin_unlock_irqrestore(&ioapic_lock, flags);
 
-    if (apic_id >= get_physical_broadcast()) {
+    if (apic_id >= broadcast_id) {
         printk(KERN_WARNING "IOAPIC[%d]: Invalid apic_id %d, trying "
                "%d\n", ioapic, apic_id, reg_00.bits.ID);
         apic_id = reg_00.bits.ID;
@@ -2253,12 +2253,12 @@ int __init io_apic_get_unique_id (int ioapic, int apic_id)
     if ( physid_isset(apic_id, apic_id_map) )
     {
 
-        for (i = 0; i < get_physical_broadcast(); i++) {
+        for (i = 0; i < broadcast_id; i++) {
             if ( !physid_isset(i, apic_id_map) )
                 break;
         }
 
-        if (i == get_physical_broadcast())
+        if (i == broadcast_id)
             panic("Max apic_id exceeded\n");
 
         printk(KERN_WARNING "IOAPIC[%d]: apic_id %d already used, "
-- 
2.39.5


