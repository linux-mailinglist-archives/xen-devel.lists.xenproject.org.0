Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA2D4A6151
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 17:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263632.456432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEvy0-0005Uv-Hn; Tue, 01 Feb 2022 16:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263632.456432; Tue, 01 Feb 2022 16:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEvy0-0005Lm-Dv; Tue, 01 Feb 2022 16:25:16 +0000
Received: by outflank-mailman (input) for mailman id 263632;
 Tue, 01 Feb 2022 16:25:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=scQ7=SQ=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nEvxy-0005Ky-Ns
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 16:25:14 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8833c48b-837b-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 17:25:13 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id b9so34965825lfq.6
 for <xen-devel@lists.xenproject.org>; Tue, 01 Feb 2022 08:25:13 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id z20sm2037887ljn.92.2022.02.01.08.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 08:25:12 -0800 (PST)
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
X-Inumbo-ID: 8833c48b-837b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fkt1iiffJfOyIvWsY76Bn/20kVLeJA6ML116mlUONbo=;
        b=E5ZvE1ExDici3mLfBGRByMNhSMDR1z1V0Jl1J1xe2WutHFL5N09fhAdb5VLIUW9HK+
         P/lkLUCSA5p4M7u5kSwIuvzRYJV4wZYdiN9pr+Lkkxk/95xSt+agiquiiB5eAmbduPDe
         pv3jHuzZjqHlEVl122Sf6sJuAju4KN3omOsBmbNzSLS34f/KtYRhM98b95hrCgVRbkEp
         xWVMi9jjXf9RaWhY4vp9sYypkMBS1vT4aAqdr/6k5HgbrnZM7MiT6sfq/r4VOGbXqeRP
         kdmqeeQpeAyQUfoIHRQvjCbtRe67gmA1oE10VD36Ctt20olU2eCTxgUxDXRFjOhAIS12
         vfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fkt1iiffJfOyIvWsY76Bn/20kVLeJA6ML116mlUONbo=;
        b=2PUeynavqCW2sADe+r+GRKrj2jVCdQ09NT0uI9DKmG0BaTsqyDNJTkkJo8o7LWmnuK
         bNbk3l6+4pifIgBfR7bHHbbqkXVowvmx7FHiPH0eEO5+grCRRJKx0Tjpc0OcK6Smlu7F
         QpvqfkeaICHwDYVdLR+SID79qNYoe/gl2jb5d20Z+3ksXKl+jnBKq73MttkjiOawCsht
         p6Ud9OoA8P5n0B/FaSg7B+rB2jDqVVQF3de5U8A39K57Iw4cKJG9o/KuKvmS4QDTnyfu
         usc3ddbpcdsva/m2xlQtq8aHqL9Qjy/HEZHtP5Blv/psYYoa2IIqUGA/efVfO/7+6aU0
         bEDQ==
X-Gm-Message-State: AOAM5309QEcrmobCtVqFxJgZogNylz2J+uDBUtWGbYQS3XBdWd6+YhY0
	CqNEv4F/IMlanwAA2O06xjzjCiC1OKk=
X-Google-Smtp-Source: ABdhPJz7aQDwqw7IoCOwv24upNdvgpBXk6PPFLGQPG6c+KV0NT+moFC8V+wUyvqK76n3mynaOJyREg==
X-Received: by 2002:a05:6512:a83:: with SMTP id m3mr19008711lfu.67.1643732712600;
        Tue, 01 Feb 2022 08:25:12 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 1/4] rangeset: add RANGESETF_no_print flag
Date: Tue,  1 Feb 2022 18:25:05 +0200
Message-Id: <20220201162508.417008-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201162508.417008-1-andr2000@gmail.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are range sets which should not be printed, so introduce a flag
which allows marking those as such. Implement relevant logic to skip
such entries while printing.

While at it also simplify the definition of the flags by directly
defining those without helpers.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Since v5:
- comment indentation (Jan)
Since v1:
- update BUG_ON with new flag
- simplify the definition of the flags
---
 xen/common/rangeset.c      | 5 ++++-
 xen/include/xen/rangeset.h | 5 +++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 885b6b15c229..ea27d651723b 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -433,7 +433,7 @@ struct rangeset *rangeset_new(
     INIT_LIST_HEAD(&r->range_list);
     r->nr_ranges = -1;
 
-    BUG_ON(flags & ~RANGESETF_prettyprint_hex);
+    BUG_ON(flags & ~(RANGESETF_prettyprint_hex | RANGESETF_no_print));
     r->flags = flags;
 
     safe_strcpy(r->name, name ?: "(no name)");
@@ -575,6 +575,9 @@ void rangeset_domain_printk(
 
     list_for_each_entry ( r, &d->rangesets, rangeset_list )
     {
+        if ( r->flags & RANGESETF_no_print )
+            continue;
+
         printk("    ");
         rangeset_printk(r);
         printk("\n");
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 135f33f6066f..f7c69394d66a 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -49,8 +49,9 @@ void rangeset_limit(
 
 /* Flags for passing to rangeset_new(). */
  /* Pretty-print range limits in hexadecimal. */
-#define _RANGESETF_prettyprint_hex 0
-#define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
+#define RANGESETF_prettyprint_hex   (1U << 0)
+ /* Do not print entries marked with this flag. */
+#define RANGESETF_no_print          (1U << 1)
 
 bool_t __must_check rangeset_is_empty(
     const struct rangeset *r);
-- 
2.25.1


