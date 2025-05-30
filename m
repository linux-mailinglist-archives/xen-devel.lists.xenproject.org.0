Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56042AC9699
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 22:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001514.1381634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL6OX-0007Xy-Kn; Fri, 30 May 2025 20:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001514.1381634; Fri, 30 May 2025 20:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL6OX-0007VS-Hh; Fri, 30 May 2025 20:32:01 +0000
Received: by outflank-mailman (input) for mailman id 1001514;
 Fri, 30 May 2025 20:32:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2SZ=YO=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uL6OW-0007VM-Ez
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 20:32:00 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2272a382-3d95-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 22:31:58 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-32a6f5cb6f9so13239571fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:31:58 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85bd2d30sm7225011fa.98.2025.05.30.13.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 13:31:57 -0700 (PDT)
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
X-Inumbo-ID: 2272a382-3d95-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748637118; x=1749241918; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vhJaJA/ACQH5wfV2evOmhTU2I88ao20gELtlbDGW3gM=;
        b=UNqvZaI4eqDptmowkQHh/xaPg0CadJaGJH309kaEInmSh69KroKKc20eu+Z1TQwXoD
         a89oogydYUsfyocyAjZ3gJcbQ6oRRpx1cRkrq/adYy+3mnbZgoX/QhLHG4t2pVR/0iXy
         znShZfdGqv4q6MYNLh8t6V2sIMbqgFpmcdCHyMzqxEsCmQm2x3X3Zd0tt1+veHORzg4d
         7LPgxZ9MXwHK5i2FjvzYce7OfLos0SrDt/BRv1WyOAf0jl/xVkqheI5+d2C09gC3XagM
         6scMSbURJP09ap6gTfM9gjlKqyMUmW97RfIHEseFz8w4CcuFtZ7uigx0CGkHu42EfRTE
         mphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748637118; x=1749241918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhJaJA/ACQH5wfV2evOmhTU2I88ao20gELtlbDGW3gM=;
        b=GvrHL60xGjVoycBbdR2uLwYtbwj25td+Va7gjsFxxLov0kjbSs4DZ5Za5MIGSDxbFD
         XYHb2GwEB1ciwV/Ga+e2EfzP8b3ntzlEwv0Ki4W21HsUfUa6EQMvpZPTDrXO1KUVHANz
         3oJdB7BF4QfImK+HyfEto5PqQjAjYLhoD5UCZ2WRkkGz0mNXMj3qOvO9fww+oemilCpk
         dPYHMPDnqhifr5dvxq0hde0YYmMhqIjdHaCKFmtiOr6LjAetMvV6uDSW+EfCQ404dbNz
         GT0jIHHsOJB++qCaohOGymfAbs8jL3fCXR7OakHhN+Q4MURDJHPdE47Dx3mn8yN+/8WI
         3Rgg==
X-Gm-Message-State: AOJu0YxupHFXpY7FmCqZTBbY1wdNSrDp8cVuN5xsjneUYElf29UmEdDw
	Kvw866MLH9urhBZPug8Oq1L/ywGPcSrud1ekrD+DzPpBlzXV3N3T5plQLVU2B5Ba
X-Gm-Gg: ASbGncs51xKWO/AcYz3Eh32EtMrnTg+TVakSJdKd0bztWx2YHvs1JANCNcAwh9XbkO+
	vwr/dSWgYiPc0xksLwFmF+C4Quk7E1OpnvCbepkG/wXnkZLwBvJYORdp2Cr33S9fS8xNSROtaZa
	4kjQVhuT4Ys6x86ESNAoq0xBoItkH3cTvciOIqCKBtj0rwHptiP9sA55ifnAlVSsBmZRG9Lu0i7
	GHifSzg5w+tTGtHE5l3DLbGR17LXB/gfUNi5OGMtD0AlzB/93wAdkgPRGKVKbEPr5W74u31fe3z
	HwjM6HEJU9hLw9kTFVayltPa/xc8hGv5RS+/9qAxShn8swzSKSsvL7CzyHvHkRQj7ETJ+sxY5CY
	zxmMR20QOerWqNAY=
X-Google-Smtp-Source: AGHT+IHwhHGkGKuTPHsPJ23ehLzxewRigP71Da4uqWvefQzcBRPBl3bVxD3yB3xgrTIHOh68+q0pGw==
X-Received: by 2002:a05:651c:542:b0:32a:5fe2:81b2 with SMTP id 38308e7fff4ca-32a8cda3365mr22074511fa.23.1748637117478;
        Fri, 30 May 2025 13:31:57 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm64: head: document missing input registers for MMU functions
Date: Fri, 30 May 2025 23:31:35 +0300
Message-ID: <9b1f50a40e3634f859ad8e7446c24e43caaa38eb.1748637004.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add missing input register descriptions to enable_secondary_cpu_mm
and enable_boot_cpu_mm functions.

Specifically:
- x19 is used in enable_boot_cpu_mm as physical start address.
- x20 is used in both functions for physical offset passed to load_paddr.

This update improves code clarity and consistency in comments.

No functional changes are introduced by this patch.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/arm64/mmu/head.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 634156f83d..033b3a018a 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -313,6 +313,7 @@ END(enable_mmu)
  *
  * Inputs:
  *   lr : Virtual address to return to.
+ *   x20: phys offset (used by load_paddr)
  *
  * Clobbers x0 - x6
  */
@@ -337,6 +338,8 @@ END(enable_secondary_cpu_mm)
  *
  * Inputs:
  *   lr : Virtual address to return to.
+ *   x19: paddr(start) (used by remove_identity_mapping)
+ *   x20: phys offset (used by load_paddr)
  *
  * Clobbers x0 - x6
  */
-- 
2.48.1


