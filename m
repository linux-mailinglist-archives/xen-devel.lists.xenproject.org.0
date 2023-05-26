Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940877120F6
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 09:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539982.841388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2RtO-0003XF-C5; Fri, 26 May 2023 07:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539982.841388; Fri, 26 May 2023 07:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2RtO-0003UD-9E; Fri, 26 May 2023 07:29:42 +0000
Received: by outflank-mailman (input) for mailman id 539982;
 Fri, 26 May 2023 07:29:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xc68=BP=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q2RtM-0003Ci-Nj
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 07:29:40 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.160]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11cfd26e-fb97-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 09:29:37 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4Q7TV64U
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 26 May 2023 09:29:31 +0200 (CEST)
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
X-Inumbo-ID: 11cfd26e-fb97-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685086171; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=H/D+yzWwuRwNmOJCusUnT3mbUQFvhvq4V4befm3R/bj1yR8Iw5A7gv9CTBDnBS1yVJ
    AD0TR2a3h/AJqqKmsLz3VjdLSvulHRzRRliCu5ZLlR+mCjreC6dOITwOz190XPO9/8F+
    +YxJ8dHgPrkuGr3oqfAyzJTbUaH6V6uXaQKQ+DU1CGtE3CGrx9yBhcqt/LdZXUHoJHXB
    yatqjrcgmmTY8hwySxNgS1PoNp+WhVIUPGPLycu+ma+igzsZ8ipwZmWBcr6wgSGHxRTR
    7DntscX9NjZmRhpA4EU3yQoMUpynTmAQdm95ur8PxMJ9aYoPUFU5cKeALcPHKI2sRqPy
    Lbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685086171;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=xlUaEBLrDwvOI31K8HyKZ+e2YJX5bW2ka7iFu75oZV0=;
    b=TolnBD0bn9B5uc4F/hAEjsr97WdpDc6OznbUV6sa/ETcmvT2Ew30QWcBM6m0drjvKi
    bdILLfCWmbS5Fojjxy/kNtGxGF/OTa4oKwpR7pJ1Vzib0acmnPpOnNYSpp79RoWBeW7D
    in45eGYsUiRo+Bq5MHl3IWFqiZeQDkM22osTZvPKnEXCvk60bWDmdNfXW+TNKCigvTR3
    6JU30d6jz7arS8VL5tr4OCI9PxSq7AQlIXJRQZu9uJCv11rHnwS2yb3dH/pLSMoJ8ym0
    IojFsGIy3apHCEaijSBmoV+z7NPAwJZO7qgvfoDlM/1EVX57/QbaGn8/W2rd8mH+LVB/
    nWgA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685086171;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=xlUaEBLrDwvOI31K8HyKZ+e2YJX5bW2ka7iFu75oZV0=;
    b=k0GlIgy9QGsr5QrtCgd0GqyeNVnC15yE/VDdnX3Inglo+desuHaVZUc2iUzjFAC5WC
    +nSfTnJQ6J0rIH+pIPxkJgh+CXWgMH/qEq0evn/v+KnaPV0eVFNuvJW58UIS8JQnX8MS
    oF8wBdjSpQ4gxUQ9dP1fUGuZRqJlwUvY6ugEd50o1EcQ/1eKsxrKzmg3GIANf81N/6jA
    BB7fiuzsbci86YL1WfbpHR0+nqqrs+QJzMmQRZjEzOu6XKywvgqyzzrMc69svmE03Kaq
    u7HYHGTdJc+pffTd4g2uZzW0nXq+WGYOQUYyBkO53GloBMqyHFu4sxfUkH4EPm7zrJD0
    Y6lA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685086171;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=xlUaEBLrDwvOI31K8HyKZ+e2YJX5bW2ka7iFu75oZV0=;
    b=GSWj0tmQJHv1LO/CZ10iNM94Pd5Ry6/9Vp1KdrRND+ItjXNGtFQ53S8BDUztz673cW
    0yuTA3lo+cA98DhB23BQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 1/3] xentrace: allow xentrace to write to stdout
Date: Fri, 26 May 2023 09:29:14 +0200
Message-Id: <20230526072916.7424-2-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230526072916.7424-1-olaf@aepfle.de>
References: <20230526072916.7424-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The output file is optional. In case it is missing, xentrace is supposed
to write to stdout - unless it is a tty, which is checked prior using it.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/xentrace.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/xentrace/xentrace.c b/tools/xentrace/xentrace.c
index 864e30d50c..b81abe8a51 100644
--- a/tools/xentrace/xentrace.c
+++ b/tools/xentrace/xentrace.c
@@ -1152,11 +1152,9 @@ static void parse_args(int argc, char **argv)
         }
     }
 
-    /* get outfile (required last argument) */
-    if (optind != (argc-1))
-        usage();
-
-    opts.outfile = argv[optind];
+    /* get outfile (optional last argument) */
+    if (argc > optind)
+        opts.outfile = argv[optind];
 }
 
 /* *BSD has no O_LARGEFILE */

