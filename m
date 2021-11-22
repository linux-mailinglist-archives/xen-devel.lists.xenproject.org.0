Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8891D458B6E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 10:28:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228707.395806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp5cj-0001uy-Pk; Mon, 22 Nov 2021 09:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228707.395806; Mon, 22 Nov 2021 09:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp5cj-0001sR-LA; Mon, 22 Nov 2021 09:28:29 +0000
Received: by outflank-mailman (input) for mailman id 228707;
 Mon, 22 Nov 2021 09:28:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJ+P=QJ=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mp5ci-0001sH-GW
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 09:28:28 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c5b7ded-4b76-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 10:28:27 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id k37so77889838lfv.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Nov 2021 01:28:27 -0800 (PST)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f14sm1040024lfv.180.2021.11.22.01.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 01:28:26 -0800 (PST)
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
X-Inumbo-ID: 8c5b7ded-4b76-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zg3iZjdBhPM1qkPiUTQLoFjD2MnrQYA7FWoXHxq7Vsc=;
        b=gMx/OX1D2vWbGVChKeBF07TAJL/K6t3SsIh9tsJMrL6hQjYuxVLnWm/Y1sojH4A7ae
         WXJkV8PJ61NYCYYW5q+lPFBQgyog0Bv88EdQRjWeTTnjcqepKKU3Sg417UHL7uOVjVaY
         KrjnR4e3Bab+1tPFv0YeKDMVWcfS0zXKC+iSzY+bpthJXLS4viBKlpITfMs0HKgiwhT0
         CFtPEu9I0AXkEEBTEi4N4NacJi22Xu/ci4U/uJkt64umLuXn5fnEMVRLX5+cL8RGPNvD
         CeijPkrzpspE7n5/Pp5J6BcfmUNpmr5+GwBRr3z9QeO8OwsZ58rYNB4kp8CdwNCx8MwO
         xhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zg3iZjdBhPM1qkPiUTQLoFjD2MnrQYA7FWoXHxq7Vsc=;
        b=b8MQH3JGxo/lhVpSgDxTDp8by7oNkc7Y6+SE/g5KIwloCCss5/GN/91xnpDt+eMywT
         oc85yjLCEmP5KpSz1sAXMo+2H67fk0HH46CzFXk0GXY7q4MT6Fd9phbTlnKInEzkN6Ve
         6J/8S7+vjYNw6/4moD3JguyaCn9PviXp+1QpvlI3uKxa5lKpPRksGtSWT02Vp4CwiDND
         b7HgTsZ1D5zG/zBd2JYGiQVWeo53p8hN6X0ecM73BaK+PiEedgl52kfKaMTWRI2/QB2/
         zjCRRodWqM/xAKq+/4ew6HPmCnD2io5narCs45Nu5lOiwH/Sj/yFlipQoNzeTV1m91SM
         5utQ==
X-Gm-Message-State: AOAM530XVt51ggOiDL0lSwQ2dW336hNPIFzYKsk6LVL3kZhyUuA8pxZ6
	6xtTQ2e166BMGoJEjzWdmDH/vRCsMLgGCQ==
X-Google-Smtp-Source: ABdhPJxkpNrQE0DVLm7TlDxXIxfBbWfPGn47mLNIME9nDHZDqo/bHErYH1ynEHHJ085IbeCwGEL8ag==
X-Received: by 2002:a2e:a287:: with SMTP id k7mr49993229lja.295.1637573306891;
        Mon, 22 Nov 2021 01:28:26 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	jbeulich@suse.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 1/2] rangeset: add RANGESETF_no_print flag
Date: Mon, 22 Nov 2021 11:28:24 +0200
Message-Id: <20211122092825.2502306-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are range sets which should not be printed, so introduce a flag
which allows marking those as such. Implement relevant logic to skip
such entries while printing.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/common/rangeset.c      | 3 +++
 xen/include/xen/rangeset.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 885b6b15c229..939883a1d145 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
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
index 135f33f6066f..543540a88b6f 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -51,6 +51,9 @@ void rangeset_limit(
  /* Pretty-print range limits in hexadecimal. */
 #define _RANGESETF_prettyprint_hex 0
 #define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
+/* Do not print entries marked with this flag. */
+#define _RANGESETF_no_print 1
+#define RANGESETF_no_print  (1U << _RANGESETF_no_print)
 
 bool_t __must_check rangeset_is_empty(
     const struct rangeset *r);
-- 
2.25.1


