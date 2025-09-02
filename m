Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D88B3F988
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 11:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105851.1456702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMvo-0000ye-9c; Tue, 02 Sep 2025 09:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105851.1456702; Tue, 02 Sep 2025 09:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMvo-0000vu-69; Tue, 02 Sep 2025 09:04:00 +0000
Received: by outflank-mailman (input) for mailman id 1105851;
 Tue, 02 Sep 2025 09:03:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utMvm-0000FE-Ef
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 09:03:58 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1d77575-87db-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 11:03:56 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-55f78e3cdf9so2564900e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 02:03:56 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827aabf5sm524019e87.137.2025.09.02.02.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:03:54 -0700 (PDT)
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
X-Inumbo-ID: c1d77575-87db-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756803836; x=1757408636; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hngrpYued6VRjNdXSCXsejFnZ9+NvVTFmNBYrfCV2Ms=;
        b=Dt37LKb5Rp5PCjx+5YgLP99BEMwk83BXN/4N2GhrZNooVM2nYxIPN+791CPP526JQq
         5KDL92vf/kdISxdwz3gnh4qs7I9tcVpc8aT7FwaepTs42yNqOswASv4paf/ThEwpGsn4
         KnMuqG3TtWGx5UdLociaC0eAUrJZRdCVIpwHnoCmVT2Np2UzQUkuDfh8xEwQuTkSjWoh
         W9+YEeNJfXHz9D11+qMd9Hrs+8Q9fDGtzptnpIyeme6pLG0aY8tavOmxR7oqG7qVo+YT
         POt5AKk0sbk+Q5kScm54a96S0TBSVBi67OZqO9MR687qbetWjo3e7zd60ThTwSnz1K3s
         /h/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756803836; x=1757408636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hngrpYued6VRjNdXSCXsejFnZ9+NvVTFmNBYrfCV2Ms=;
        b=nv/gpr+42NrkSyQ9J3j0kiBSasZQDLee2VVbIUOJrRwnB9S4+nURpZOV9yldyRIJ1l
         y+v9BO2lCzaloJZIvJpGs/st6LCQQIe1nlX6d+dHnapnXxBIyFez4Pe56tZWPqBurf7E
         QXbLTJJhMZ7ah+phVgtteeosuf4WZnCN7x9Fybk0MUslzePAuqkGOICOSHDX4flHUZmt
         hiIrR8tm5cPa6KCxWluwzL9wq97M3QssGyAjWDMxAq7kIcaidgoaIlfJfcNaYm5NOUrf
         Akl65SDDkFkDll3dpPGtXAGwn3D1MZEm9EjoXPlCQ5knQUnsqorv0KOq2XntEgdah9cl
         NVNg==
X-Gm-Message-State: AOJu0YwxsquG8hxBLq97rbqXEaYVX3JrxC1OQaix2UJz/7czlDiHireQ
	OUwfULPgY7ODHet6PerRxmXmWMN1RZmdFKd74PV4y4a+RWJn6becrdwQxDTsOgSc
X-Gm-Gg: ASbGnctjYOD//K4IfzzOmjE276B1LMpIddWRk24QMQLSb+xUz2X13wNImppaQCRE/lx
	97+4AEe4adUESKSPCz9xJ2K0QmpvUFUqLXjMf6oEYdfkrDLCwCODm2FTzxxC6mgK/CP0j2BP1v0
	X/7Qb+yQDm7BxpR2Xp2hanQSHZY7HlzaIWRAQCikmUkBfq1AqdLvtfuoKE73lhUQeugth86xTjf
	8vW2M+igUeP/CMeG2nCQAW+rZpT6/PIYjK4+3iLDmJe4pL8qQFNgbWZcyu44tjB/drD2rKV9s8p
	3c1FulD3FM+RWkwwLuoNclI3xHjifU3m4Cd2ZDaiC1ha6Alzu2MH6tWwCfPif/2dNl0Znhhh++M
	G/PUTYP4TBNMbd5IuZ6WbXwIuUNPh+hcPozxYCx5Z2NX4cIi0WzVbd6U6HQpYRkhXSg45q7Zi
X-Google-Smtp-Source: AGHT+IEGDR0zvIgC8giLGGenf6ffDNeOkUoGx5o3gXyi/iwQLHqrZHPK8kf1eGYeTBmfAMeKuFRvEg==
X-Received: by 2002:a05:6512:4045:10b0:55f:71ad:5913 with SMTP id 2adb3069b0e04-55f71ad6048mr2708786e87.50.1756803835517;
        Tue, 02 Sep 2025 02:03:55 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v13 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Tue,  2 Sep 2025 12:03:48 +0300
Message-ID: <2b9c5acca22150548c122a851931304c5d1ec565.1756803419.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756803419.git.mykola_kvach@epam.com>
References: <cover.1756803419.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Mention the newly added support for guest suspend and resume to/from
RAM via vPSCI on Arm platforms.

This support is limited to non-hardware domain guests.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Chnages in v6:
- removed reduntand explanation that thi support added for
  both arm32 and arm64.

Changes in v5:
- adjustments to the commit title and message
- expanded the changelog entry to include more context about
  suspend/resume support introduced in this patch series
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index cd34ea87b8..7a75bd37cb 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -36,6 +36,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
  - On Arm:
     - Ability to enable stack protector
+    - Support for guest suspend and resume to/from RAM via vPSCI.
+      Applies only to non-hardware domain guests.
 
 ### Removed
  - On x86:
-- 
2.48.1


