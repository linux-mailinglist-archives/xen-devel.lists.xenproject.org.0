Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3C084BB8C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 18:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677045.1053440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXOr9-00055b-15; Tue, 06 Feb 2024 17:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677045.1053440; Tue, 06 Feb 2024 17:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXOr8-00053Y-T5; Tue, 06 Feb 2024 17:03:34 +0000
Received: by outflank-mailman (input) for mailman id 677045;
 Tue, 06 Feb 2024 17:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3u1=JP=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1rXOr7-00053O-8S
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 17:03:33 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6c05e2e-c511-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 18:03:30 +0100 (CET)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6de3141f041so4113855b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 09:03:30 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 h4-20020aa786c4000000b006dbda1b19f7sm2168838pfo.159.2024.02.06.09.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 09:03:27 -0800 (PST)
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
X-Inumbo-ID: a6c05e2e-c511-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707239009; x=1707843809; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umeDhyeqcFKdvC6xxd3vUkMjNRJ2Irf8wU+CDgjfryk=;
        b=PCGX82r/Mw+WkO9TYmyLG8mmozOBgfB3YIXndMVZz10J0woGLP93/fqtNx+WTC5qCh
         U40+AXm7oHphHD8XypW4VeviAHLngItOcaTV7UwtBLFZPcFojG81VoqWr5ClMvu3rN3+
         d0OzzczcbXYVYAanGukr8J0CriMVpPrUY70PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707239009; x=1707843809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umeDhyeqcFKdvC6xxd3vUkMjNRJ2Irf8wU+CDgjfryk=;
        b=Y7ziGN6ZaceSI5da3/RzJc5yLaOL2qL+Z2WCWxeRrOoiY7iEHTmMxE+XoMfgIFV5pN
         Ft1H3ROuY5SzgUWtUrCr6vKDpwYFyMM6z9OjXj+GW6yy0tTmYvizTxTCTXd1Oou6hqBC
         7GPkcw/S568rG/TJThX2Xuc/ddt0uiP74TuvuGnwZHGWQxYC6oRiLTsstOsgaF/zIlus
         xE4HMcqLkDoLLKiIDeYJAWOUXvsbgjoGn8SV46ACzc9C0NCf9cCYgRRLnv2G98w1ell+
         i+5Uf5ZEiMHg0diHoCAqpg9MdMifaB88/TXrnIBx31nabaO8IiOWLkdstx+txZAJN5l8
         Q8KA==
X-Gm-Message-State: AOJu0Ywh8oZDFYKgkugP7jQYnY3IuIvlU637COA4TW+PAyrBkrjfPew0
	nZuep6jLpITnMnGF4uCe0zNtmjPRZji8XEJj78JLHCqR0ywDFX9Qe0pIphuruQ==
X-Google-Smtp-Source: AGHT+IGvoigLJEbHKpYBrrZJJVxKU9n0m5DvgYvJ8ZsIdLNHqnrzt3qcY0VxotJUZVvRPos9blAcsQ==
X-Received: by 2002:a05:6a00:842:b0:6e0:28eb:275e with SMTP id q2-20020a056a00084200b006e028eb275emr102249pfk.22.1707239007816;
        Tue, 06 Feb 2024 09:03:27 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWfB/tr7pyFK2HPXESsJ1h9TpKXYrK9eOqf81YqGqlYqEBLTPjHVqjnFSch/E1RwQgtmUg6t/v1lbDkytUEOHoI+aPHG9TJb8Fjr1LUujkShO2c0Xt8LdUmwvicI/JBXQ2643PJqQGtsn/SOX8WNNhexsAZBeu/5DERV85KCPtfxGgG65Nj+Q0Q0nNft5VzbKWpP6fOg0dV1CRjqPX+zVrjeWj5NsaSfE6hrXbQav7R/+4KuONSyqslgF6VURAuJ8bjkvxUDAH/4PFKePXGPHpiSI2lGiW0evYlY2s=
From: Kees Cook <keescook@chromium.org>
To: Juergen Gross <jgross@suse.com>
Cc: Kees Cook <keescook@chromium.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] xen/gntalloc: Replace UAPI 1-element array
Date: Tue,  6 Feb 2024 09:03:24 -0800
Message-Id: <20240206170320.work.437-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=keescook@chromium.org;
 h=from:subject:message-id; bh=U8HuNwUdlEEPLHdv3QRnH+uJMA60aHmIoxCx5CgE2PE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlwmZc1Jfxj5fa/YwMvoyvAPkFWN+gRJLJEPn7F
 n308vxItD6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZcJmXAAKCRCJcvTf3G3A
 Jm0GD/oDXr7gvAa43q/4w9dV1f3MZINBzTm2QNk9mHvC7Lp7XSOmcgrCG2Fi8o4c5s5TyWIybl8
 slT25ToB1KNPSc6IPGYoFcQTXwRn39TzQq9T6n+5z5alG6Bz6ZcAk34BQcIm6vfpD3/N11fHF5F
 pdXab4HtiJd2JS9uhggiaHQbN59FGqFQjmpFiouIQ/v5r3awL2QgSC+DznPmZAbee6vD1Rz7G3F
 Ko9yltkr64NVBYCrLDQEylWIDjzGcaMn7kb9npaAYzOCcDcDcQgyfA41idDc+YZlQhxJhuTBe+h
 kHCag8yYsbha7fMXGE+7jHPzjKzE92858eEHiqDJUS+n7u5FMMzarLFrfzeX2LRKJT3oKVKLNhA
 pZ8OYm0q7YJihVOtzaWRo2aNTZ1TpHpDtp7xQo0UFmVh8lcE8p41nIm3bKoC/PbT6ygufKRWEgT
 F1cqwtPM+91yYdVb5HqaHdJ1hIahqo84hQrS6uoeJb2fDi7VWnvopFiUKfVEjWhqUqDo4DCatRo
 9wGXoVt2ljvrVqDQoE56vPuRpeLfSDuLDp/koDL82+UGsSCzmRyXeFrADIlakadryKPFCIqd6xf
 eyoiFXJ0khVBIixLTkPKRY4vvEmldd97HWkoEuj0POSSL7w/8LzGaHlA9x8qqoGsFQwQ6Uvf4U+
 Vekxg2a ltTDiLAQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Without changing the structure size (since it is UAPI), add a proper
flexible array member, and reference it in the kernel so that it will
not be trip the array-bounds sanitizer[1].

Link: https://github.com/KSPP/linux/issues/113 [1]
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/xen/gntalloc.c      | 2 +-
 include/uapi/xen/gntalloc.h | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
index 26ffb8755ffb..f93f73ecefee 100644
--- a/drivers/xen/gntalloc.c
+++ b/drivers/xen/gntalloc.c
@@ -317,7 +317,7 @@ static long gntalloc_ioctl_alloc(struct gntalloc_file_private_data *priv,
 		rc = -EFAULT;
 		goto out_free;
 	}
-	if (copy_to_user(arg->gref_ids, gref_ids,
+	if (copy_to_user(arg->gref_ids_flex, gref_ids,
 			sizeof(gref_ids[0]) * op.count)) {
 		rc = -EFAULT;
 		goto out_free;
diff --git a/include/uapi/xen/gntalloc.h b/include/uapi/xen/gntalloc.h
index 48d2790ef928..3109282672f3 100644
--- a/include/uapi/xen/gntalloc.h
+++ b/include/uapi/xen/gntalloc.h
@@ -31,7 +31,10 @@ struct ioctl_gntalloc_alloc_gref {
 	__u64 index;
 	/* The grant references of the newly created grant, one per page */
 	/* Variable size, depending on count */
-	__u32 gref_ids[1];
+	union {
+		__u32 gref_ids[1];
+		__DECLARE_FLEX_ARRAY(__u32, gref_ids_flex);
+	};
 };
 
 #define GNTALLOC_FLAG_WRITABLE 1
-- 
2.34.1


