Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D045D8AA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230875.399139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWp-0001tt-Gb; Thu, 25 Nov 2021 11:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230875.399139; Thu, 25 Nov 2021 11:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCWp-0001nR-9P; Thu, 25 Nov 2021 11:02:59 +0000
Received: by outflank-mailman (input) for mailman id 230875;
 Thu, 25 Nov 2021 11:02:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCWn-0001K8-Ua
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:02:57 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3efb707d-4ddf-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 12:02:57 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id n12so15409277lfe.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:02:57 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:02:56 -0800 (PST)
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
X-Inumbo-ID: 3efb707d-4ddf-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yH9Aud+KhB6bv78AcEs/8owAaYp6cfId4snOD7ig8jw=;
        b=H6hIR2MODuSq0+XyMmOSWqwDEGA5m/qhgk4HpL+cT36B24u7WSDtOZtFBD5Gonc6X9
         A2YcV5BwlB5Arrn4G5EifURgaMBJqRZK8IRn5rm1oxoWty2cm/lH5axD2Bi6FdQqJhfI
         s8qjpY3ANqiUyRszD9eE7H7yP0+Deek5MWp0QAac7sgjB5VtWIUFdHKHBq8ZGt93qqG1
         229RojPvgxEpATw+xVDtgFzS7UN5g8j15TDI7tAPT2ETs3oQiRLNXQYqC4XFoP36FqVG
         DGylLfdG1xpKlBqdIMj5/gGzzv1srJRhrelqRMkgOM5akHquECv4ubNECaLzkUNhTwbD
         fsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yH9Aud+KhB6bv78AcEs/8owAaYp6cfId4snOD7ig8jw=;
        b=5TBQH/0BD50HCTaJQc+hATh1jYbCJMgL9gpVy/C0JcAMwh8RSXxB36dqeX9Uag0PuZ
         LSBxj9BcnHzH9fjTxCh6TPoqomTKP5TbjP9bW5lo/IhCIFYjFE5sBJ5/g0lMy7zwwNBb
         qEI+aJ2Fpqh+DPNABcIFK2+hdcPUntW+yNkKKS0ElAuoXYfjQV0YPxu1D5EnJeeLptsi
         3Rzc51ms4fNUHJCaNO6bNFJ8WYkAC6uik/ljhLQ423nVrLAsg9yfaV5eBWr2Z5w8X72r
         K+4YeL1xwxcWKQN10rly6YBZT83ePGUAPekYOsjJIaMRv+DYckraUjAbtemaaU0szYRE
         FZ7A==
X-Gm-Message-State: AOAM532IPiFv6vc+m56L1GiasQapoRNV6bJn+3GEXS9o4MRcH7utmVpY
	F436DumOkBAh26eKy9U9ugLDgjy4WbzZZQ==
X-Google-Smtp-Source: ABdhPJy61wspGeTsK95YYXpRFa8RWw8M9gAX8WvjKHapgNGt7DEmMrCdL8E19Upw8eZ8yKk+WomS5Q==
X-Received: by 2002:ac2:5cc7:: with SMTP id f7mr16096375lfq.412.1637838176471;
        Thu, 25 Nov 2021 03:02:56 -0800 (PST)
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
Subject: [PATCH v5 02/14] vpci: fix function attributes for vpci_process_pending
Date: Thu, 25 Nov 2021 13:02:39 +0200
Message-Id: <20211125110251.2877218-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

vpci_process_pending is defined with different attributes, e.g.
with __must_check if CONFIG_HAS_VPCI enabled and not otherwise.
Fix this by defining both of the definitions with __must_check.

Fixes: 14583a590783 ("7fbb096bf345 kconfig: don't select VPCI if building a shim-only binary")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Cc: Roger Pau Monné <roger.pau@citrix.com>

New in v4
---
 xen/include/xen/vpci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9ea66e033f11..3f32de9d7eb3 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -247,7 +247,7 @@ static inline void vpci_write(pci_sbdf_t sbdf, unsigned int reg,
     ASSERT_UNREACHABLE();
 }
 
-static inline bool vpci_process_pending(struct vcpu *v)
+static inline bool __must_check vpci_process_pending(struct vcpu *v)
 {
     ASSERT_UNREACHABLE();
     return false;
-- 
2.25.1


