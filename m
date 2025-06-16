Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25091ADB5EE
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 17:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017433.1394425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRC94-0006H7-AP; Mon, 16 Jun 2025 15:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017433.1394425; Mon, 16 Jun 2025 15:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRC94-0006FJ-6x; Mon, 16 Jun 2025 15:53:14 +0000
Received: by outflank-mailman (input) for mailman id 1017433;
 Mon, 16 Jun 2025 15:53:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/Gb=Y7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uRC92-00060y-EF
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 15:53:12 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01923b91-4aca-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 17:53:12 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so2664296f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 08:53:11 -0700 (PDT)
Received: from gmail.com (140.red-213-97-47.staticip.rima-tde.net.
 [213.97.47.140]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a53f79sm11291109f8f.4.2025.06.16.08.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:53:09 -0700 (PDT)
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
X-Inumbo-ID: 01923b91-4aca-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750089191; x=1750693991; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeqjX2kaombgFMNPY6Wbvs43WcIJodVrLA2njPKaH3s=;
        b=cf8mbWBtwqt0L1dny3DgybPDZPDXQUlOupKDP3ug0E2/koaNAPWN4T9ZEXg6AZmQes
         9y8Gbo+jFEYmv3x4mDAKJQgEYvSg4PvIHVCQminUPpStkCFrdE4NHboL0AOKrBqCcxt5
         9FyNzrfQKSL5jGDkIgcQin1UNGxgj0okOx6gufbVVzkYWKFOIb5bWBBeJeQGek+gKYgl
         XqpQv5yQMFa/Q60eY8RPXJZzub++D8VKLs7zmHZf8K7f8vPg3P8sc1/9/9k05kuT1Jci
         csE7oAJ34TLxqP2Enaa0AL3svpxMpTZS8BYlWvI/XZKz50h4Zysic9j73kt3OOu0sE/b
         Txug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089191; x=1750693991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeqjX2kaombgFMNPY6Wbvs43WcIJodVrLA2njPKaH3s=;
        b=lbkbmPr7n7Zrwpq4ceOunewoMiXIAi9/TSLYJW4ujuWkOOwLMUEp89TgIbf4lMHPzh
         9KWeRT26kdVzla+cYQRMJbMY/BAFUY0/K/6xfzMhabXumthZfJzwwvNR4xt4bQpbCt8W
         0CsxELYKc1bkTwMw24GWNz8Qo6LAQDVyJcZI2J6hQAUhSfxOcby2D7o93clN+6KzSnE6
         v4n+dCjjVBy2ijBXT/pGExvGY9orhFyhW3Mram/cBi+bttZ35D1GP/r6c1aRK2ikOZFn
         10BUK7lek8GhdQKEQSuFhf4ZyM8sk36oQK7HJTTDTzbM+3XjGXO7oC65E7HJn4gBXaWI
         qBHw==
X-Gm-Message-State: AOJu0Yz5UI5ykmgyDxI/ZFnf/PLQ8g1grwNT3D6S8TD+3Dn7o1Q0U+kv
	UNxbOcPAvFe+09JLCwCRDWG1uzGzEADJrwNGsQypTWB/LHjs4D2VRdfKjLf7xx3toN8=
X-Gm-Gg: ASbGncsJoaKiqSopyferfSq/C+hp4Amw9Vhyw2gFUza4VEcXlC6VXBMM42ZOVzh7QaZ
	dIkZ7DDTCeHqrhdH1PDuRuXphb1sUce1na2WAax2uVLLxbuNKlbcBzC0Kkz9RAFwnRsSrnQqop3
	CSZ9q71dwMU/481g6XoyjkTTMx/Ey/xZQg4wHoN2yvj4XhI8BQR9CqrwyH5EHa9IDhgvC/AKR40
	+efA76+6VBZ6D1LOv1PR2IJ1HzVcMhwWfTrAw0dJkKnz4w29gWoQycT1xfMPOEy/JPpFoNoeqMk
	cZSLThFu25GplNGdAuBPMPajyHkFCQlGdcWjEo0AaJjo4hxYxWse4twd8nnPvrM/rqM5pK+UywY
	wPkbCigPZitm+nXbBGoUr2GXjsj8H/EbpLINa7Gvqc+s=
X-Google-Smtp-Source: AGHT+IEJnKqlLvXwblVqEE9CNuulNgsEyIc7AgnBYT7dSL/fPlVN589Joy5AFmHdvEb+ksj6ka1jtg==
X-Received: by 2002:a5d:64e3:0:b0:3a0:b565:a2cb with SMTP id ffacd0b85a97d-3a572384056mr10323750f8f.1.1750089190856;
        Mon, 16 Jun 2025 08:53:10 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	rosbrookn@gmail.com,
	gwd@xenproject.org,
	edgar.iglesias@amd.com,
	Christian Lindig <christian.lindig@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v5 4/5] tools/ocaml: Update bindings for CDF_TRAP_UNMAPPED_ACCESSES
Date: Mon, 16 Jun 2025 17:53:05 +0200
Message-ID: <20250616155306.405257-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616153826.404927-1-edgar.iglesias@gmail.com>
References: <20250616153826.404927-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
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


