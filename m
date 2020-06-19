Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EF620013F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 06:30:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm8eW-0001k6-0A; Fri, 19 Jun 2020 04:29:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhgK=AA=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jm8eU-0001jn-PE
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 04:29:18 +0000
X-Inumbo-ID: 6fb3a752-b1e5-11ea-bca7-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fb3a752-b1e5-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 04:29:17 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id l12so8715266ejn.10
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 21:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8eQIxO3Kr7u1l5tfF2Odv1QyLJr1FfEFhmjrwVHW0Ek=;
 b=l2h4A1LUXHp/LA9pW4BB2lU0bs11DK9zT61+VkW19o1vxRVSIhGPZek5t8Wb6/XFTl
 JytqtRyh0sizHYHNaqFFKNvsntJZeGHhXZu+Vv5P923LevpmD6I3V3yTPBQOZxaFZxyy
 HqZ5uouugq8IVEiavAkv4m8mNrSggUeQ3uw0KOxDo/VcHeUzoE6y/pXl52I4vwVkQxpb
 obECXrz38jPF5ZBT94TIOqST41nRimE+qrpiE4ccGB+Zi2zTDtcursQq8a1lOLykmeEk
 wLEPn6DDFtQsAK5ryTwAvsH9XnW8xaqK/5hxSiiKIAHvhRGr5caOpCAk5BTR4mVjR7uJ
 9Wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8eQIxO3Kr7u1l5tfF2Odv1QyLJr1FfEFhmjrwVHW0Ek=;
 b=h9v9VtCrwwq9QBcfHAuk5DEw/eN7WeUI85Gz4kb1zoN8la03f5+kKbqE95wPEZYmSn
 W8YGXr5hm/juqVlSfflce3lffuzapyh+Phscb9Wny6+T6U2aRwr5zIj4n8PR4bB93K9B
 /jncKx3RY0WmOPN0ZlFjVz0ahcCTnymbznJtCRXW1JXRaenG7TKWpJFPj9eUGA8/8yN3
 il8Nj9tU10knQACrDLcqeaOcjUOCua4KKQ3Z1eh6cMImnRUW+GWgLUqLChcgzze5tWlh
 tMfE08VGka1B7cmVmd/WMenm7uP0fLrdiMtIPUDkI3npZAfetPkuUMop0910YegPhzp/
 fxbw==
X-Gm-Message-State: AOAM5326reAnesc5r76zdhYcI/8V2hQDS1NJroVM5j+GV2c8eLIW5VjL
 Sy7nI7O8l5nr6YkUPmsJ9TU1ZdVQrQRZjg==
X-Google-Smtp-Source: ABdhPJwiMjEShCiwwpQZHUvfRcmIfP+8hj1OHmGB2RDX9ojZsWDGLtIm3nK2pRQCGZux2of8l4Tolw==
X-Received: by 2002:a17:906:8614:: with SMTP id
 o20mr1943356ejx.444.1592540956313; 
 Thu, 18 Jun 2020 21:29:16 -0700 (PDT)
Received: from localhost.localdomain (public-gprs354184.centertel.pl.
 [37.47.14.201])
 by smtp.gmail.com with ESMTPSA id r6sm3850340edq.44.2020.06.18.21.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 21:29:15 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
Date: Fri, 19 Jun 2020 04:28:47 +0000
Message-Id: <b56bc897f22acc537a15740d779cb096fb2d6733.1592539868.git.gorbak25@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1592539868.git.gorbak25@gmail.com>
References: <cover.1592539868.git.gorbak25@gmail.com>
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
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 j.nowak26@student.uw.edu.pl,
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
Cc: artur@puzio.waw.pl
Cc: jakub@bartmin.ski
Cc: j.nowak26@student.uw.edu.pl

Changes in v2:
- Check pm timer access width
- Proper timer width is set when xpm block is not present
- Cleanup timer initialization

---
 xen/arch/x86/acpi/boot.c    |  8 ++++++--
 xen/arch/x86/time.c         | 15 +++++++--------
 xen/include/acpi/acmacros.h |  8 ++++++++
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index bcba52e232..8d514388b4 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -478,7 +478,9 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
 	if (fadt->header.revision >= FADT2_REVISION_ID) {
 		/* FADT rev. 2 */
 		if (fadt->xpm_timer_block.space_id ==
-		    ACPI_ADR_SPACE_SYSTEM_IO) {
+		    ACPI_ADR_SPACE_SYSTEM_IO &&
+		    (fadt->xpm_timer_block.access_width == 0 ||
+		    ACPI_ACCESS_BIT_WIDTH(fadt->xpm_timer_block.access_width) == 32)) {
 			pmtmr_ioport = fadt->xpm_timer_block.address;
 			pmtmr_width = fadt->xpm_timer_block.bit_width;
 		}
@@ -490,8 +492,10 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
  	 */
 	if (!pmtmr_ioport) {
 		pmtmr_ioport = fadt->pm_timer_block;
-		pmtmr_width = fadt->pm_timer_length == 4 ? 24 : 0;
+		pmtmr_width = fadt->pm_timer_length == 4 ? 32 : 0;
 	}
+	if (pmtmr_width > 24 && !(fadt->flags & ACPI_FADT_32BIT_TIMER))
+		pmtmr_width = 24;
 	if (pmtmr_ioport)
 		printk(KERN_INFO PREFIX "PM-Timer IO Port: %#x (%u bits)\n",
 		       pmtmr_ioport, pmtmr_width);
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index d643590c0a..e9180175e0 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -457,16 +457,16 @@ static u64 read_pmtimer_count(void)
 static s64 __init init_pmtimer(struct platform_timesource *pts)
 {
     u64 start;
-    u32 count, target, mask = 0xffffff;
+    u32 count, target, mask;
 
-    if ( !pmtmr_ioport || !pmtmr_width )
+    if ( !pmtmr_ioport )
         return 0;
 
-    if ( pmtmr_width == 32 )
-    {
-        pts->counter_bits = 32;
-        mask = 0xffffffff;
-    }
+    if ( pmtmr_width != 24 && pmtmr_width != 32 )
+        return 0;
+
+    pts->counter_bits = (int) pmtmr_width;
+    mask = (1ull << pmtmr_width) - 1;
 
     count = inl(pmtmr_ioport) & mask;
     start = rdtsc_ordered();
@@ -486,7 +486,6 @@ static struct platform_timesource __initdata plt_pmtimer =
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


