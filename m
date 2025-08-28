Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174DB3A2C5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 16:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099034.1452981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ure1C-0007pA-Su; Thu, 28 Aug 2025 14:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099034.1452981; Thu, 28 Aug 2025 14:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ure1C-0007mi-PD; Thu, 28 Aug 2025 14:54:26 +0000
Received: by outflank-mailman (input) for mailman id 1099034;
 Thu, 28 Aug 2025 14:54:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mimg=3I=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ure1B-00074Y-Bu
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 14:54:25 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2b3d3d1-841e-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 16:54:23 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-55f42e4c3ebso1107934e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 07:54:23 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f42101509sm2635661e87.106.2025.08.28.07.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 07:54:21 -0700 (PDT)
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
X-Inumbo-ID: e2b3d3d1-841e-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756392863; x=1756997663; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hngrpYued6VRjNdXSCXsejFnZ9+NvVTFmNBYrfCV2Ms=;
        b=ceYJLsAzje1QUHsMJBeLXUVxlnPLL2nAjl9WRViQIiT0J0ARGHuObrtoM7kPVJ1+9+
         j+4agPiW/xrRrOh27GF9mDN9OFnauv/Qztc1Mxc1or8aksPABAz3w4uAh/5dp8iUSXgG
         fumj72DjkiXxJu3Ns5L4fmRRXSuwhwUA6IykIFicvdYfoxnbueSr7MkPnr1IZ+kBZo9u
         fKTocmjXcHW3sp/21sPe4XKxG3IobJs0zLfr1MQtRI0gWDGVtPjB6RfQOSpsd7gU0ZT8
         WNkbARGcIfGK1ToBt4xJYuQcGV3vxGQZmKuVxvTwN6zo/5ErfHIYSIm95X2xiP7O55On
         wxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756392863; x=1756997663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hngrpYued6VRjNdXSCXsejFnZ9+NvVTFmNBYrfCV2Ms=;
        b=V/RY2uQQzo4tBpmZVz8PPJeew0EjDMJLXz+g/1rY8MgOTlO3DM0aCbo7wuNTsz/EpP
         3rfh+OpQehHvwZlOrVhDmlrLJL3ezC1Y3ezLZlpvQj7l2gHFvQ7kkietVccSo+z1StRt
         LEritl385qeiFVLc1vfYees+dvFM3AtAOzN0USL+APDEuv5HeT11x4eQV8rLxpCjJurR
         ArWK3VGLVz28dKC+1HyoXEJgLbom6C1kZH8v2TDikpGf28qr2mv5kItQi1AVwtTYqSXV
         cPV4Xv0dMHVy9FCHFeXEx/KfxnKN/dO0z5Zxbp0GD+Yk8f9tW/zI26VGhbZafc3xYZsK
         PaKg==
X-Gm-Message-State: AOJu0YxkxpWVi0Ev57fYKWQ8PsH+hWRMjtZ0Z+BXEEKVfwpIVXmLEKJR
	Yd2Eg0RT4DqwJKjHJTG5dBw8UfUcXUzcfW+sKtfdQhvop/m2EgazCmhkZ4bjbg==
X-Gm-Gg: ASbGncuabFKOajMQEbSbGcYU+h8yoX8UKaJ19KjhtrvpWJ0YIWtqwSjvQs5FablphIM
	UCE6qCLE9No8OmIVSd+/kjX6xfxhcElF5DcKVfz/ueQZc0L6Zn4F7FpHw1wBNmoc+lZNQwbNN9K
	1ZeuUxIZLIvf7XOdQ70SLZq++a7mcaet26Kpin08ox4X3gnQ4dZPbF2+awmmjrfwe0CG0kgeiKp
	yj24kyJ33I4cYbnorVT3BhcAum5B3KF22mTxXpQv5yhoD+pb0P1RBc+rtbJm/A/HNj3Rrww8y95
	Fh8mY5Ph34CjSrwGnogD+wf2IZ5Er230N1NLA+uZd0JTgtbOEiYRbx/t/PfRGER5/J3iMyuykMl
	I3R2nbbhEojp34j6AL3MOrk7EDofgsP2ky3cXCrvB++SLtUoGSpgQDS1EJx02sBSUwmiC3YbG
X-Google-Smtp-Source: AGHT+IF1HeaKj2cz2cnnr0EE+aGs2CLKOQzVrtI+RGDtiy5IgEELvtKlOaKXC3CZjCTvrGIn+BQwWQ==
X-Received: by 2002:a05:6512:3181:b0:553:2c58:f96f with SMTP id 2adb3069b0e04-55f0c6a0f73mr6639899e87.1.1756392862710;
        Thu, 28 Aug 2025 07:54:22 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v11 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Thu, 28 Aug 2025 17:54:07 +0300
Message-ID: <6fa6038c90109a2e9990a691fbcf2aceb5aa9694.1756392094.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756392094.git.mykola_kvach@epam.com>
References: <cover.1756392094.git.mykola_kvach@epam.com>
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


