Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FF157A59B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370800.602717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFd-0007Aa-DR; Tue, 19 Jul 2022 17:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370800.602717; Tue, 19 Jul 2022 17:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFd-00077Z-A6; Tue, 19 Jul 2022 17:43:17 +0000
Received: by outflank-mailman (input) for mailman id 370800;
 Tue, 19 Jul 2022 17:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6sG=XY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDrFb-00065X-2k
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:43:15 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43cfb566-078a-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 19:43:14 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id m16so20604420edb.11
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 10:43:14 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b0072af92fa086sm6903268ejb.32.2022.07.19.10.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:43:12 -0700 (PDT)
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
X-Inumbo-ID: 43cfb566-078a-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cpVLKnhd6vjujxD0bO2KThhMDJ+iVwVoqh13SC2q0cs=;
        b=CaEKmCTRcR8/SMRC0bQf+dOv9ySs6y3MjxkY0nxL38jn9DyDTVsUkvy9ZAHNwAQLUb
         9PsHRS/MaA6iyDNGA87wfELTHOAsXgeUi44dzyPCvik1wvaojXPc4Cx5sdfckg0fWebP
         cc219FKu25+5dlHkgUDbhuknkXK8lem6VSZwLGW/7cdxLwwGTYenTN6e3PjlMmAbN2W4
         CS9Sm/Psi7omj8llD7gcATQhopxoKJIfBZvlhyRJbQ3upJpAY5JvVVFv3ikETm0FZci/
         g/ZeKkUGDsrsiaPWABpUrGO/2OwrY9PmD99wwQoNmAYMJsvw3q7zfdJMDKbtNZ4Bw5LB
         /jFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cpVLKnhd6vjujxD0bO2KThhMDJ+iVwVoqh13SC2q0cs=;
        b=kkPEF8SOekhfihud6SJ3BwzPidYZGYxYnKb2p2IX7k9W2ctGEpqYYAzk1KcwOljoNd
         Y19bH9CEqbxsTfcHcCepXv7vL4L6TZ0Q3cziHZW1nFAkkDN+WbUaXeHKTF4+GT8ZXG0j
         pyHsl6fiznMiQaZskDYx6qDL6g3kc7zlYtzsXNazAQII6j+GzgPZ0GZNgWYnkYUHOYao
         fHF08rE5DhCNhyX1cnWEG3cr4lVKuJx/XoYjwE3MRIvw4vU4kHABa0DUkhqJ4yINO7Ay
         1rl6pA31NxJy6xn/xsIp2A1ErE2b2EbH7bDLoEQ/8ThsAHMRDPuvQI/RZkzzuLcCjEfB
         IjNw==
X-Gm-Message-State: AJIora9RIbrwqi+ihS7TYXQXxLExEoIA70owytqJl6sCJ7HEawplO1L7
	8ckZ33c7V8VKM8/FDOyInwRwGX0T73VtgQ==
X-Google-Smtp-Source: AGRyM1tJIw9jRhYJ3lV/7WT5PUgwsKPZGJm0z6/cKEw7ZfGIW7GlhYz1AxpnWJFoCsR9lgCnsRsy1Q==
X-Received: by 2002:a05:6402:5245:b0:43a:a024:82cc with SMTP id t5-20020a056402524500b0043aa02482ccmr45478822edd.56.1658252593657;
        Tue, 19 Jul 2022 10:43:13 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH V7 04/11] rangeset: add RANGESETF_no_print flag
Date: Tue, 19 Jul 2022 20:42:46 +0300
Message-Id: <20220719174253.541965-5-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719174253.541965-1-olekstysh@gmail.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
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
index a6ef264046..f8b909d016 100644
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
index 135f33f606..f7c69394d6 100644
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


