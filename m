Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264A5679837
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 13:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483548.749764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKIcc-00009I-S9; Tue, 24 Jan 2023 12:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483548.749764; Tue, 24 Jan 2023 12:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKIcc-000070-P5; Tue, 24 Jan 2023 12:41:54 +0000
Received: by outflank-mailman (input) for mailman id 483548;
 Tue, 24 Jan 2023 12:41:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jOcK=5V=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pKIca-0008Um-Hd
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 12:41:52 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7909615f-9be4-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 13:41:50 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id tz11so38739581ejc.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jan 2023 04:41:50 -0800 (PST)
Received: from uni.router.wind (adsl-208.109.242.227.tellas.gr.
 [109.242.227.208]) by smtp.googlemail.com with ESMTPSA id
 bj10-20020a170906b04a00b0086b0d53cde2sm825419ejb.201.2023.01.24.04.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:41:49 -0800 (PST)
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
X-Inumbo-ID: 7909615f-9be4-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmfm31eZhrV7KPD8IshZRyc6q/g4zltkTtUdKEtttQQ=;
        b=EQFj81wwdwMkQd5RRP8BhkKgYUtuOOVbwCt217519o9TM4cqXC+TKEmtodfCdRYMjn
         bYd3GEsh/dpy7/g84zlbSI9/4SRAjZdlcpIt+kWsh6rgIUhb8V4mD1s1sVN3HePWV2n8
         UrJ/+xkJlKoCrJFU53NA9yap0QxBVFot0BK5Ph24AzexkUnfE7gVvVXyYeN9WbwUzq2C
         GTTxM5GYE465NX4dnqrkQkenKVrg3f4w7tiQWQCav7D9Mx4o2F4ku8kB9UQu6q9UJ98z
         z6zYsv6XlX6Q1meO0bMdQGIXvMK/HI54+4tyG+xlliQ8VQZ8wZlPhJ/kiic2s2rmq7GV
         oZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmfm31eZhrV7KPD8IshZRyc6q/g4zltkTtUdKEtttQQ=;
        b=BBWlPf23+2aEFFt9vOsRp6RGKgVSyENw6Ga1rYk/j/k5fyrxvR+NSwkWAt+JQnbKNQ
         V/3roW57+Ko1E9/erXPr9YWlasZNjfs2p357MvXXWGNPvgH8DrbduYdGIKVQBpBzAo6H
         UnbRNiiq/GkBblQfXFhzCt+Z/us36A4Vh1y/b02y2AOnFC5vK1R4kQWLqJcR6a6TOwdn
         b0NnkSIypp2IsCPwmlwboBzsDqkwPZ69Xi7uWNzcjNUQA32qpFP8t1268GZL4f6WZna3
         tN9tuWdkKo3Z6mwyohSu8TaHMUdiC58q9M2naKSwzpzSOXLC095nx+DyTc431f5SHVIu
         nh1A==
X-Gm-Message-State: AFqh2ko2Y8N4WyePL8mF3uqH1idh5J/9jZ69kS+M3zYx4WkeQZmAp4kV
	wDzZ3Xl2OCKgdTq3UMnbkxRqQ14j3dM=
X-Google-Smtp-Source: AMrXdXsBSp8DWfrFCuLMLBmMTWvsN+rMvrspA2sLzBE5wcEmUbwdVPYEG1X/KxMGCAdUAQRwS51wxA==
X-Received: by 2002:a17:907:6745:b0:86c:f7ac:71f7 with SMTP id qm5-20020a170907674500b0086cf7ac71f7mr30134092ejc.8.1674564110000;
        Tue, 24 Jan 2023 04:41:50 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/5] x86/iommu: snoop control is allowed only by Intel VT-d
Date: Tue, 24 Jan 2023 14:41:38 +0200
Message-Id: <20230124124142.38500-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230124124142.38500-1-burzalodowa@gmail.com>
References: <20230124124142.38500-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AMD-Vi driver forces coherent accesses by hardwiring the FC bit to 1.
Therefore, given that iommu_snoop is used only when the iommu is enabled,
when Xen is configured with only the AMD iommu enabled, iommu_snoop can be
reduced to a #define to true.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

No changes in v4

Depends on Jan's "x86/shadow: make iommu_snoop usage consistent with HAP's"
being applied first.

 xen/include/xen/iommu.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 4f22fc1bed..626731941b 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -74,7 +74,12 @@ extern enum __packed iommu_intremap {
    iommu_intremap_restricted,
    iommu_intremap_full,
 } iommu_intremap;
-extern bool iommu_igfx, iommu_qinval, iommu_snoop;
+extern bool iommu_igfx, iommu_qinval;
+#ifdef CONFIG_INTEL_IOMMU
+extern bool iommu_snoop;
+#else
+# define iommu_snoop true
+#endif /* CONFIG_INTEL_IOMMU */
 #else
 # define iommu_intremap false
 # define iommu_snoop false
-- 
2.37.2


