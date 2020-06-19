Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40939201DB3
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2020 00:01:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmP3r-0004kk-5M; Fri, 19 Jun 2020 22:00:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhgK=AA=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jmP3p-0004kT-DR
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 22:00:33 +0000
X-Inumbo-ID: 499234ce-b278-11ea-bca7-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 499234ce-b278-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 22:00:29 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id o15so11735016ejm.12
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 15:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HfYUNEU41EvFg2RZy0do+m9ixRVuyVGzvdL5MBLFCAo=;
 b=UP8cug/qv3i80NJ5OH4fU+mt5dwnKjMvJo5F0FYD8RXUqbA+0IJbWqQ31njqbWpRuX
 aICuVrkg2AiQgY5+PtIr/cp4JasmhkGdTCpIGnQjX9fj85TeG83nacgaAPm/yIBFS0gj
 5A+mf0e9cdnOdKOizyidr57hpNwEQfxrv7EWbW8vSA/rrrtXkVwfpNpwQEcVYiIMlVd0
 maiWHDbjmONRUunBPofhi9gQLCifu2Wvw/AYuPRIcWSpNR68HMvyP2UA4Qg5pvY+7YPW
 kZzPhyBC0JRxHXCG6WIvWkK7y2kpSNtBYJfxhITfNccX6oKzGbZKxLL49K6d1WCg9MjK
 Vlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HfYUNEU41EvFg2RZy0do+m9ixRVuyVGzvdL5MBLFCAo=;
 b=H9ap1MvpcbHhrNhGY4TnlwaSwSkXyqVqLyFNIvrZXlpJwMENZlrsohnXiSkdH1dl3C
 WO61NA0cCzRSTsVnAJGEXV7+pAzLa+4ewauy5gbH7mak5Dz5U4EKyrYbUCJGz9IKlaJf
 3Jk3ynoYu+3Zx8LiH/RxHm0o7memDgc/758BSf5d46HJ/LFuqbzu9OwKehHQPURNrzag
 fj/V1WV0vGH7ljdyKqaU9PdQzB+bFMNAgufL4n8eaGeyiFpheRUOoiVggi/O9JLP4BSB
 GKpfOtHqXLRoDHP06PRZS5TmMaDS0GyQpCteJfKFih9SyZ50F27K/chnhcAU/vQ8Aq4C
 idhQ==
X-Gm-Message-State: AOAM530de3miXoX+ajVm72Ma89u7tvuirFg4ASVmkHAEj3KUwsJkBH32
 19lIkcWmwsYZeA2e8BZ+RoMpsfhmf0RTmg==
X-Google-Smtp-Source: ABdhPJwNHICadOoy5W3bfZb4CTH5KXnZ/0Dc2VMPfnFG4+wxe72TSXxvaRJpe2cFnmA71uGUv6SCfg==
X-Received: by 2002:a17:906:cc58:: with SMTP id
 mm24mr5930152ejb.134.1592604028264; 
 Fri, 19 Jun 2020 15:00:28 -0700 (PDT)
Received: from localhost.localdomain (public-gprs354184.centertel.pl.
 [37.47.14.201])
 by smtp.gmail.com with ESMTPSA id b4sm5261360ejp.40.2020.06.19.15.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 15:00:27 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
Date: Fri, 19 Jun 2020 22:00:16 +0000
Message-Id: <de0e33d2be0924e66a220678a7683098df70c2b5.1592603468.git.gorbak25@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1592603468.git.gorbak25@gmail.com>
References: <cover.1592603468.git.gorbak25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 j.nowak26@student.uw.edu.pl, contact@puzio.waw.pl,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On some computers the bit width of the PM Timer as reported
by ACPI is 32 bits when in fact the FADT flags report correctly
that the timer is 24 bits wide. On affected machines such as the
ASUS FX504GM and never gaming laptops this results in the inability
to resume the machine from suspend. Without this patch suspend is
broken on affected machines and even if a machine manages to resume
correctly then the kernel time and xen timers are trashed.

Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: marmarek@invisiblethingslab.com
Cc: contact@puzio.waw.pl
Cc: jakub@bartmin.ski
Cc: j.nowak26@student.uw.edu.pl

Changes in v2:
- Check pm timer access width
- Proper timer width is set when xpm block is not present
- Cleanup timer initialization

Changes in v3:
- Check pm timer bit offset
- Warn about acpi firmware bugs
- Drop int cast in init_pmtimer
- Merge if's in init_pmtimer
---
 xen/arch/x86/acpi/boot.c    | 19 +++++++++++++++----
 xen/arch/x86/time.c         | 12 ++++--------
 xen/include/acpi/acmacros.h |  8 ++++++++
 3 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index bcba52e232..24fd236eb5 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -475,10 +475,17 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
 
 #ifdef CONFIG_X86_PM_TIMER
 	/* detect the location of the ACPI PM Timer */
-	if (fadt->header.revision >= FADT2_REVISION_ID) {
+	if (fadt->header.revision >= FADT2_REVISION_ID &&
+	    fadt->xpm_timer_block.space_id == ACPI_ADR_SPACE_SYSTEM_IO) {
 		/* FADT rev. 2 */
-		if (fadt->xpm_timer_block.space_id ==
-		    ACPI_ADR_SPACE_SYSTEM_IO) {
+		if (fadt->xpm_timer_block.access_width != 0 &&
+		    ACPI_ACCESS_BIT_WIDTH(fadt->xpm_timer_block.access_width) != 32)
+			printk(KERN_WARNING PREFIX "PM-Timer has invalid access width(%u)\n",
+			       fadt->xpm_timer_block.access_width);
+		else if (fadt->xpm_timer_block.bit_offset != 0)
+			printk(KERN_WARNING PREFIX "PM-Timer has invalid bit offset(%u)\n",
+			       fadt->xpm_timer_block.bit_offset);
+		else {
 			pmtmr_ioport = fadt->xpm_timer_block.address;
 			pmtmr_width = fadt->xpm_timer_block.bit_width;
 		}
@@ -490,8 +497,12 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
  	 */
 	if (!pmtmr_ioport) {
 		pmtmr_ioport = fadt->pm_timer_block;
-		pmtmr_width = fadt->pm_timer_length == 4 ? 24 : 0;
+		pmtmr_width = fadt->pm_timer_length == 4 ? 32 : 0;
 	}
+	if (pmtmr_width < 32 && fadt->flags & ACPI_FADT_32BIT_TIMER)
+        printk(KERN_WARNING PREFIX "PM-Timer is too short\n");
+	if (pmtmr_width > 24 && !(fadt->flags & ACPI_FADT_32BIT_TIMER))
+		pmtmr_width = 24;
 	if (pmtmr_ioport)
 		printk(KERN_INFO PREFIX "PM-Timer IO Port: %#x (%u bits)\n",
 		       pmtmr_ioport, pmtmr_width);
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index d643590c0a..8a45514908 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -457,16 +457,13 @@ static u64 read_pmtimer_count(void)
 static s64 __init init_pmtimer(struct platform_timesource *pts)
 {
     u64 start;
-    u32 count, target, mask = 0xffffff;
+    u32 count, target, mask;
 
-    if ( !pmtmr_ioport || !pmtmr_width )
+    if ( !pmtmr_ioport || (pmtmr_width != 24 && pmtmr_width != 32) )
         return 0;
 
-    if ( pmtmr_width == 32 )
-    {
-        pts->counter_bits = 32;
-        mask = 0xffffffff;
-    }
+    pts->counter_bits = pmtmr_width;
+    mask = (1ull << pmtmr_width) - 1;
 
     count = inl(pmtmr_ioport) & mask;
     start = rdtsc_ordered();
@@ -486,7 +483,6 @@ static struct platform_timesource __initdata plt_pmtimer =
     .name = "ACPI PM Timer",
     .frequency = ACPI_PM_FREQUENCY,
     .read_counter = read_pmtimer_count,
-    .counter_bits = 24,
     .init = init_pmtimer
 };
 
diff --git a/xen/include/acpi/acmacros.h b/xen/include/acpi/acmacros.h
index 6765535053..86c503c20f 100644
--- a/xen/include/acpi/acmacros.h
+++ b/xen/include/acpi/acmacros.h
@@ -121,6 +121,14 @@
 #define ACPI_COMPARE_NAME(a,b)          (!ACPI_STRNCMP (ACPI_CAST_PTR (char,(a)), ACPI_CAST_PTR (char,(b)), ACPI_NAME_SIZE))
 #endif
 
+/*
+ * Algorithm to obtain access bit or byte width.
+ * Can be used with access_width of struct acpi_generic_address and access_size of
+ * struct acpi_resource_generic_register.
+ */
+#define ACPI_ACCESS_BIT_WIDTH(size)     (1 << ((size) + 2))
+#define ACPI_ACCESS_BYTE_WIDTH(size)    (1 << ((size) - 1))
+
 /*
  * Macros for moving data around to/from buffers that are possibly unaligned.
  * If the hardware supports the transfer of unaligned data, just do the store.
-- 
2.27.0


