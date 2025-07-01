Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639EDAF02AE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 20:14:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029907.1403614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWfTq-0004GI-G7; Tue, 01 Jul 2025 18:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029907.1403614; Tue, 01 Jul 2025 18:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWfTq-0004DH-BZ; Tue, 01 Jul 2025 18:13:18 +0000
Received: by outflank-mailman (input) for mailman id 1029907;
 Tue, 01 Jul 2025 18:13:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdAb=ZO=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uWfTp-0004DB-2v
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 18:13:17 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0811478d-56a7-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 20:13:04 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-553b5165cf5so8027315e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 11:13:04 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55627987d9csm32027e87.254.2025.07.01.11.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 11:13:02 -0700 (PDT)
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
X-Inumbo-ID: 0811478d-56a7-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751393584; x=1751998384; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIasU34fgys1zFgFxlYSy8beZ5zDvc8SoqLGKHephJA=;
        b=aIxhpqbRMk0mI1W7PNkvXlGZjIlDmVonTvj25pmghWVimuEB5lnapkX4ZPtC8zeoNT
         2Pm+9WT8PoJ9LjrTAtGbHs9LA9rcuTnoY1Tau/6aOBWStRcTuu3W/BUAxHY5t0mkUVjF
         r5o7zfV2n1HncsX9UQJVoXIJqfkc+BW1VbqWtpiYrGtmpZMdQv7F0iZgxdpwSpVX2dPa
         Dti9DDCfOLToWDIb9O5oTYuF6cLcuGv52DP4dJ30cUtme/qmraEQxRHnz5PWWwH/WnO1
         0fxzAhD1SNKPkHHOS47DbnhNkzvBYljUmeagfCSvJYslL98AkM2Zd4gp4UqKsoeEWalP
         2R1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393584; x=1751998384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIasU34fgys1zFgFxlYSy8beZ5zDvc8SoqLGKHephJA=;
        b=XBtlX5lY1md99VZ7YE4eJhcZMbqFRGVLroeTKyEnnAuuK1my/OIAGoQgLszdiR4gxw
         XB8ywXM9jncV+9b4OtCpt0KNRimPt/+kC3ya18YX4bPefpL2+v0zEQ1P4g9Z9FGI8/Ny
         OPs9+z6doGilhKvE81ZGUOmq2+U8ugjHe69SN3MVKC03KqDhTfrH0DCRoV93kOx4foEM
         C7oYAC6P2/yrYrrkgqsgmPMBABefY4lx5ecG0jZjNhyJY9dRji6iKVi9t+xn++lJXZ2I
         jq5d9jrVvsttHjcndSoXcd40zNAHMfrqIToRsC/x2R2DZZlQ3NZk0A3wCz6LnP94atI/
         fUbw==
X-Gm-Message-State: AOJu0YwFLDIO0X5atEPK+VAjvV+01anTAYDIwvVLtGWWxas8SDcYTOE2
	cBI18ez40/NTd4ikZHuUjrnQPEy+/JIvNo2xLvxze2yGFgeuKRTcnNSlCcWdXXMR
X-Gm-Gg: ASbGncszh0/zcBwZkX1CVbR66mkLbYHAlhUnclyENPTHlXtQSrsg1FYTkahsmcmC4TV
	x/irFLWokVR+ESo3eq6FPoc16BSX+95VrJdDsWdoCIwG6XdI12BfLSTRvtm7luWIbWhX1ecpKG7
	NcEl1W6FsuxuV/BolYK9uVPBWGX3Q9d/Pr2EkTuUMSzgFWiIG+KkadXgFCneNIVRUOHBBb1NjXV
	sy5FmIeBlHzX4HQ1Se9RnW+SRfZZPGr15LuF7QnumQrXcIMt11Som/wfOUqBeCf3KLBPQOo0VA0
	CupY+xM8Iy/jKfepyLL/J03nPmV9RjzMDBbdnv7q7DF8IDSjSmnhPqUj8FTkCqJDBV08dC9fQzc
	y7SRFwr+TN1yv3t/cNfflp2UBoI5r7iPdEEMX
X-Google-Smtp-Source: AGHT+IH86WwP1Is/6cyQV86JF6ypE2PtGNRWZf2Ct5+lWIYRcgdbAaGBoYsmcNKBSv4w1FDXQ2/wXQ==
X-Received: by 2002:a05:6512:3986:b0:553:a456:a0c1 with SMTP id 2adb3069b0e04-5550ba21664mr6416821e87.43.1751393583252;
        Tue, 01 Jul 2025 11:13:03 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] SUPPORT.md: Document guest PSCI support
Date: Tue,  1 Jul 2025 21:12:18 +0300
Message-ID: <a20eef8513bc15e9fd87e14420eada7e7eb5d859.1751393256.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under "Virtual Hardware, Hypervisor" for guest PSCI
support on ARM. This documents support for all mandatory functions of
PSCI 1.1, and separately lists the supported optional functions.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
Addressed review comments from:
https://patchew.org/Xen/cover.1751020456.git.mykola._5Fkvach@epam.com/401d3745a295812fef14a22b0c2a3c6017d588c1.1751020456.git.mykola._5Fkvach@epam.com/#f891958a-35cf-4c6d-b1b9-51d34559f221@xen.org
---
 SUPPORT.md | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index f0b5718e84..6a82a92189 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -956,6 +956,15 @@ by hwdom. Some platforms use SCMI for access to system-level resources.
 
     Status: Supported
 
+### ARM: Guest PSCI support
+
+Emulated PSCI interface exposed to guests. We support all mandatory
+functions of PSCI 1.1. See below for the list of optional PSCI call
+implemented and their status.
+
+   Status, Mandatory: Supported
+   Status, MIGRATE_INFO_TYPE: Supported
+
 ## Virtual Hardware, QEMU
 
 This section describes supported devices available in HVM mode using a
-- 
2.48.1


