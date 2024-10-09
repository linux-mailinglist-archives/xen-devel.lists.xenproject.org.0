Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB7996C8A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 15:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814529.1228100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syX0h-0005Ar-3p; Wed, 09 Oct 2024 13:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814529.1228100; Wed, 09 Oct 2024 13:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syX0h-00059H-0t; Wed, 09 Oct 2024 13:45:51 +0000
Received: by outflank-mailman (input) for mailman id 814529;
 Wed, 09 Oct 2024 13:45:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wKy=RF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syX0f-00059A-9V
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 13:45:49 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca65dac7-8644-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 15:45:48 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c924667851so492715a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 06:45:48 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e0598947sm5435334a12.11.2024.10.09.06.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 06:45:46 -0700 (PDT)
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
X-Inumbo-ID: ca65dac7-8644-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728481547; x=1729086347; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=deOu+9egEsSlbA8NvC5euDA9HuMpXm2iHCRytSCVdS4=;
        b=BuNAw7M/Mi30waGtrfeMkmG7nXnBfs37jqexofBOq7D8e/FbI+py5amKlR1zvmLCgL
         WPxrNerwSRvYv0sKB7TXFCFAcDLWRr9cpFWENRTwO+GT+yn7K3CNOYOo1H29UFsPQKbA
         AWsIHVOIXRu+C/yktDF4QMqnfoDLqGb5lbuYTrx9vO1oov1upudGn/NjIMs/NMTFRxEl
         li0bBTluSzSAyTLpVUUSWUe95HZNeQkG3bQ5bn0us8JA8w11FekZUCcnBKaJVr4pGW/8
         RHMgp6dai/u4V/x+DlHtxEMnZtN6K5pU/8zzWT01cz76RhHt+wwAOy9C/VRs+9m1BuGV
         LzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728481547; x=1729086347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=deOu+9egEsSlbA8NvC5euDA9HuMpXm2iHCRytSCVdS4=;
        b=hqRB6U/UhzLQE8Vlf3qeFqoe7piFeTYjqcz1UWdRsIwVHdekcNY1ozfAbsqQd4JaoZ
         YhUcWmn9fSLb/L96J5mUbfCPco4rbuxGzQ9F7fe0Yd1Igdy8Al0jwSClUvzKGnHwVHHg
         nYq7/Yn5MUsLvHkULy4DCVAXCwV1j7gEHpJtIjNuKJdu3+WUfJ781pUtWP1JR2wKXtDB
         2+ylSvTKUrkF+n+ejDD7JoryBsc86ydpIRs65+D+Is40OxaUSW6Fy82KRt+/s8uIDA7L
         cfoD6qHnNzefIy8czdoYI4y18LceNOMxuDAt5vKnnMKQY+vWC+H0G1INjHvLhntlQlUq
         1K6w==
X-Gm-Message-State: AOJu0Yyk9PCKMOlzU8oknD77XhlBTxIc76yOnbmJNlVz1+BZ35w15zxn
	Gg5dAsH+Pr4aJ+jW+2Exv6jVr9n4DaY38Eqp7WcSD58GvyUavpIPd3wRQQ==
X-Google-Smtp-Source: AGHT+IGeS1D1xksQt4QvfoToMRP7VvFlmsfdy0LWDjUrVTz4LXuoheR7Ww29RvprXCulU0igmOqQew==
X-Received: by 2002:a05:6402:4314:b0:5c8:aee5:9b05 with SMTP id 4fb4d7f45d1cf-5c91d6707fbmr1684463a12.26.1728481547224;
        Wed, 09 Oct 2024 06:45:47 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/3] Register Xen's load address as a boot module
Date: Wed,  9 Oct 2024 15:45:38 +0200
Message-ID: <cover.1728472163.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series registers Xen's load address as a boot module and
introduce virt_to_maddr(), and drops LINK_TO_LOAD() to use virt_to_maddr()
instead.

---
Changes in V3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com> for patches:
   - xen/riscv: switch LINK_TO_LOAD() to virt_to_maddr()
   - xen/riscv: register Xen's load address as a boot module
 - Minor changes for patch 1 (xen/riscv: implement virt_to_maddr())":
   add an explanation comments, update the commit message and drop pointless
   ASSERT().
---
Changes in V2:
 - Update the commit message ( drop depency from "device tree mapping" patch
   series as it was merged to staging )
 - Other changes please look at the specific patch.
---

Oleksii Kurochko (3):
  xen/riscv: implement virt_to_maddr()
  xen/riscv: switch LINK_TO_LOAD() to virt_to_maddr()
  xen/riscv: register Xen's load address as a boot module

 xen/arch/riscv/include/asm/config.h |  4 ++++
 xen/arch/riscv/include/asm/mm.h     | 22 +++++++++++++++++++++-
 xen/arch/riscv/mm.c                 |  9 ++++-----
 xen/arch/riscv/setup.c              |  6 ++++++
 4 files changed, 35 insertions(+), 6 deletions(-)

-- 
2.46.2


