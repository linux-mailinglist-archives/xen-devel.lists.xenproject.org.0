Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAADACC995
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 16:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004561.1384320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSxk-0006zb-DN; Tue, 03 Jun 2025 14:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004561.1384320; Tue, 03 Jun 2025 14:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSxk-0006xi-7F; Tue, 03 Jun 2025 14:50:00 +0000
Received: by outflank-mailman (input) for mailman id 1004561;
 Tue, 03 Jun 2025 14:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WdC=YS=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uMSxi-00060n-G3
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 14:49:58 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04e74a9c-408a-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 16:49:58 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5532a30ac41so6587144e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 07:49:58 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55337937409sm1926383e87.213.2025.06.03.07.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 07:49:55 -0700 (PDT)
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
X-Inumbo-ID: 04e74a9c-408a-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748962197; x=1749566997; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Rv9jkk9a7Mmckdgwtv3pi1GijaKXKBiRxq1uzaztv4=;
        b=FryjlqXvPvaOSRJF9986RbyZ9g9VnxhhzDqBlwGAArYETqcwI+ZPuyZxtX31LYF0qs
         5Tr6tB9QRTxJEQ78B21iuiqMkgfKhXBtu8obA8A4KJsZY8eYxq1THEa/lhNFjVT/NoUF
         h2SSnMHMe/3RzhRyqCSffeMhaU63JlEHQQ/gIe06BK+Efa8LK3Ie3NOyP+rhdccpEGm5
         0o5e31Y8p5MXssdoD8uhvVWq5TE2i/OuWRCQv97awg0683Q/jXck1+k3rlfsnHjIcwEe
         4LuKZ9BEn9x9M2tDZYHDizdpCO+l13QZkKtnfiu7kksOtCOe2o0WbihA9vFGb7Cep7vc
         EfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748962197; x=1749566997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Rv9jkk9a7Mmckdgwtv3pi1GijaKXKBiRxq1uzaztv4=;
        b=DTh+l7074sLXUbO2ob99odm1QkyDf9E8TYBZDTh8M5+il3cqK8xLCB70sJGWYWWG0L
         dKTFaCqfJbDq92k0NLaDvsdr+19iDBkLica1Of+PgO8/2BjLt15ycRzoHkUCXB/c9YT6
         3rq6eyAD9Wr8fXremDfCg6FBFrhZPLW7tLO8oVVwpJ37D5VtAK6V7I/N5Wo5WhmtBmsq
         Mvxx5TafBsRgXBnBufvUzN1nqJTzvmpT4qqjGd4GrREIbsyeav40R4vhCya7o+YUc2t2
         mSccTs7J85gJse1IdOx+o1jr7ZpfueH315sjwKoTDdkDC/qNFAXy6RISXE+YY3/u103j
         Jp1Q==
X-Gm-Message-State: AOJu0YyMjmwOQ82uQrWt31QHjy1QhB31M+gDElFYZvbsjCX5uFt5nIrY
	NrGA1Wus7yEgRhupO2MP4cqbKJ58IvljVvHCYtIbpjqxcdoYt+FBPJMQmiyvspglmlE=
X-Gm-Gg: ASbGncuVSnTEqTS96P2CoA6OWlOfeqStzGyEFGFBq2RvnawOWcjGZzNn1ZE1G4gCW7V
	ubEqoWQTGbLTWGVOLvOCJW1epiAe2gjNuGk2tiO3sGfuWmqIRNOkPqYrVJoHz+0vzVa5rhWi3In
	35jTtb4oQ0sAMm5pGoyvoA822/33LpzDG6CQ28vQlE4mt0VRz6J5s8N4e8M+xmGnavaDHt1ew+y
	HNZWMTZECB+wRM17t2PNlWQDdC1LAaPndcZu67juANc4XKAtBLLc4mLrZdP6Ob7fQ3WIY8W59cV
	o2qWIbavleaTI+GcEgmqgGjTmPMWU3uH7td6IxrPdp/nPWPG4GC9wtwaBY1tlEjjX5875xQvHbF
	bN6B1xaS5WjMc434LK41UCrM=
X-Google-Smtp-Source: AGHT+IH8/jb/PldOgmQh1jF9CunVlSSRPSF7jucpLmiTBONZ2toTWA1eabhva7I9GfIVjFLmvX3g4A==
X-Received: by 2002:a05:6512:3d2a:b0:553:35c4:db08 with SMTP id 2adb3069b0e04-5533b908034mr5543769e87.30.1748962196978;
        Tue, 03 Jun 2025 07:49:56 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com,
	Christian Lindig <christian.lindig@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 4/5] tools/ocaml: Update bindings for CDF_TRAP_UNMAPPED_ACCESSES
Date: Tue,  3 Jun 2025 16:49:47 +0200
Message-ID: <20250603144948.1685047-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603144948.1685047-1-edgar.iglesias@gmail.com>
References: <20250603144948.1685047-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Acked-by: Christian Lindig <christian.lindig@cloud.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 tools/ocaml/libs/xc/xenctrl.ml  | 1 +
 tools/ocaml/libs/xc/xenctrl.mli | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 2690f9a923..7e1aabad6c 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -70,6 +70,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPMU
+  | CDF_TRAP_UNMAPPED_ACCESSES
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index febbe1f6ae..f44dba61ae 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -63,6 +63,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPMU
+  | CDF_TRAP_UNMAPPED_ACCESSES
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
-- 
2.43.0


