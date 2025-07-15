Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1530BB054E9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043769.1413829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubb4P-0006KO-Qv; Tue, 15 Jul 2025 08:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043769.1413829; Tue, 15 Jul 2025 08:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubb4P-0006HY-JY; Tue, 15 Jul 2025 08:31:25 +0000
Received: by outflank-mailman (input) for mailman id 1043769;
 Tue, 15 Jul 2025 08:31:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V4bE=Z4=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubb4N-0005rV-JQ
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:31:23 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16c412bf-6156-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 10:31:22 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a4f64cdc2dso749952f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 01:31:22 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560f22cd14sm84787075e9.30.2025.07.15.01.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 01:31:21 -0700 (PDT)
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
X-Inumbo-ID: 16c412bf-6156-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752568282; x=1753173082; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb/Ky+NjHb2U/AUnw3rA7qjcFJaFaS7qOBSec9pqZjI=;
        b=bBTNDY132zWh1vy4NPCwkJUKF4JL40G0ImyvxStYSn6f0MwyyXZ+9taJdM2iqBgORH
         19VCMWpzUugm5wbh2n5eDPzSnnMZL4Th5fq8xmkJY0FjCf/RKcKRjuQk3IKItbr9OAZc
         vZZ5udW5GM213KGlfFMlI0eVtKPZkNysMzOSQVNS9j/HH033ZAMd78OeqDHM9jyGxkoe
         qP08/Rx6PLpFhkdiF60lqGvWOW+t1ML8zJ4OB149AHpP9RrxDA1ZnrTQT6Oxeo2YldfV
         FhIzRCuQLogoZDFvFuzK+K3C614lkFR7hlsHcxMvdFRNqUWA3tZvLSlrV5soEfeQMPNZ
         Mr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752568282; x=1753173082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pb/Ky+NjHb2U/AUnw3rA7qjcFJaFaS7qOBSec9pqZjI=;
        b=Yw+4Hv2jol+MymfU4cf1PAocuA1dEJDv3SG45p+N/zO1p5Kgpfq3AEnC3ju7ybZxpc
         A99cRJUkOntIedduvlEW1C7cQBkLY8M3AvIcKj/LVuW7XWIRq/olT/mssPrUwQB5E93B
         YQGfIgJmZzgfwRmjL5kvMQyuz4MACW7Gwmmvrrfd4Slp+PDs4zfB1GMMfuKkfUx8z7dD
         S3udiycGJ6uciSpZN1TqHVZbd/2rWzGqSHnn7TRFhgYtKd6rFZVBfPRUIZmHHghjprYU
         RFeLVAMtQuqkNXpjq9Hah4YnM40v3caQVktw6f8KEVrKSNTOL4O0YauQ26P0//Wj5KhX
         /LYQ==
X-Gm-Message-State: AOJu0YzoQzcbzq8WhPPFtozODAM9xXYrj9gMC137spiKc6kf3uKWlfak
	2u9/a980np6C5aDd7sydwF+HgpuV6Cxs5Y60CqCA2znJEbjHKtlcDxTxsOaygQ==
X-Gm-Gg: ASbGncvMyc1+XeEPf2zrRYVxz1MrPf4cY0o9eSHFjikR/jxBpbbcTRDf+lw0YfVAzSz
	n2ijPrm5hlVd/6oTDg6RYumBXfrLiAgoLFqXep7hFWVoYnrCdjFB7LbFg8Lc5XGc6P/MPHgfzsU
	CdGoQYHXt92n09pga8FzezYm39NvH2EdzAoSK58cKSjH2Kv364PGoyoDQYfZwwPmUbJ7krBR/AX
	KXUMZiOlw5UNXHvr+Qoklbbdw2fGPyMiBdw0rnLtgv71wPtSn0FKTSGmt+9LhZo/5Mg8xZ7F1Mo
	p2LKspYdvVOBfPMJ+iLmGqn4/DLHYJ7/eAOO/KEKs46D/zG7+DOYEhN5jKP2R9ZvxDu1ezz9f9/
	V/wOHTfMMghoyqhRrhsXcZbWVBG0/QrKOuoyWhU/t0GXlxv4aWU9iRX8a0DpzNgB/npV+zmPuZ3
	uT9aKcOTQ2YTRtn9d3nOMNMw==
X-Google-Smtp-Source: AGHT+IFZOsinfU0cIcmHi9pWiaPdGc5n59QUav1VxuvnfLAqQjttpbsSsMjdIz/TQ3GfmoAGRE1+Rg==
X-Received: by 2002:a05:600c:c111:b0:456:2137:5662 with SMTP id 5b1f17b1804b1-456291b4cd8mr2340595e9.7.1752568281554;
        Tue, 15 Jul 2025 01:31:21 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v9 4/6] tools/libxl: Activate the altp2m_count feature
Date: Tue, 15 Jul 2025 08:31:12 +0000
Message-Id: <fc4fa1d5d2b7064c14e39c020f565f689e4405bd.1752568020.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752568020.git.w1benny@gmail.com>
References: <cover.1752568020.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This commit activates the previously introduced altp2m_count parameter,
establishing the connection between libxl and Xen.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/libs/light/libxl_create.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 4301f17f90..a796178050 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -596,6 +596,10 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
             .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
+            .altp2m = {
+                .opts = 0, /* .opts will be set below */
+                .nr = b_info->altp2m_count,
+            },
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
             .cpupool_id = info->poolid,
         };
-- 
2.34.1


