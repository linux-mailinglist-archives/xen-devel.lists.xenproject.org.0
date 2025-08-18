Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A63AB29CB0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085665.1443984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvZ8-0006WK-Gt; Mon, 18 Aug 2025 08:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085665.1443984; Mon, 18 Aug 2025 08:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvZ8-0006Pe-As; Mon, 18 Aug 2025 08:50:06 +0000
Received: by outflank-mailman (input) for mailman id 1085665;
 Mon, 18 Aug 2025 08:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFvU=26=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1unvZ6-0005gf-Sv
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:50:04 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54d520fc-7c10-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 10:50:03 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-55cf526f6b5so1268147e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:50:03 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351579sm1571950e87.4.2025.08.18.01.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 01:50:01 -0700 (PDT)
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
X-Inumbo-ID: 54d520fc-7c10-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755507003; x=1756111803; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDyBEr2C8bHK7ao0mUQj4cm53R0gNtsq0NOW3g9oj/Q=;
        b=A1rjufAi3lZXZTSURI0bfI2U/Pdc6x5j4iDByNK7ByFmpoQfM0zS22+4w1syyVupVv
         9WQB/bQhMFY3NeqI0rwTX6LprJe5jaZ50Ixt2UX2iUxLT9eI2c8k/67ohtF4g7F3UaHI
         LbMMmzaP0umoAJOuK+BLJY9zpOv2Gf1HxNLnJJndBtUgkLYLQ+P/JmhdPNedDXUhamsz
         zsdlxne2GFHCQG1EPXNrsWjXQlhk1hnFz5vaTp1oYuP6Pqp13zHMtX8gvQVVrtWCJsNH
         MPNbfC0lT+MwpmDAybdUBox3kniuI8hd8SiLtEesN9JV+SYvmFauR6XuvBI0/w4mvawj
         3OMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507003; x=1756111803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDyBEr2C8bHK7ao0mUQj4cm53R0gNtsq0NOW3g9oj/Q=;
        b=J61AtUyZknAWN0zKCztKDbNHft3fHQ/VJX4CLvXtXBzeTB37vj1lEUOdCH0KIpDzEV
         RQNZClRUBnrinCjXdPVLMwTvQZFcp97Ouf27Xfikvubg0OsZJBjVHuDC4Rdhn0WLERKq
         aovoExkt4/r/4D7aMKF6q0ZC2I3C27GkWI5YOHOJ8ynPUsJUnc4RYH890Cun3g5eQkYX
         mT/jrr66LNFif6MqFPLgrPw8J9gyf0H7Ye+Wg6SSbPdxyEJjmsXEjy2g7sZ2lSH4cl/Z
         Z10BaEzQlW87R0f2YyzQ8ooDN2G34mMDS6Os3tl+tKUkgd5TyU/CjVZiak/xyKZ64DUQ
         nhxA==
X-Gm-Message-State: AOJu0Yw1HYQ1pRsNNzcUPUOokxizNxV3rYSLDtPDKP32GTSMj1hGEnN1
	6iiJaGifHhxx5DTetpH3PNXge3VNzrXXR0BqvMBCvKasVmI1A4VXpjWbFeYnVQ==
X-Gm-Gg: ASbGncuoOykF3xFysDu3m/0vWN1GVAgPCKVD0yqnAKPSgVWqUGqoxbah+eXmarS5Fhd
	3IL+/BY6zywIMK9RLJKL5iCmpkpDtc1G3SttHeGQz9uayv9RYEGBeifbjUGoN+AD9ItqDjIch4k
	ZsRWZdh/Z7k1Qk0xIMgXn1y/Dn020wBlD1Mg4ee4pXEdZPD+ol8vH+hySStcbFvy6j42Ks2aldK
	yscFsFsRMX7LMkW+nUYSfoftABi1uoTH8dVxqzBAMU2Ngjh4rep19fts/eSHXKuF9Q48ajoFrqz
	EKcL2tKxl/6BkcEDg/dOt40n4j4DpuszkhPNPoqFGcLfQW2ntdWBI9z32+1+aKP1n3q3/WCU/0r
	r7KGz1DfGAopo3Noe431OfQj1cC//I8JIg21ce42aOaZn+q5u6qs9/TuIQ03PUcY43Js5r5tG
X-Google-Smtp-Source: AGHT+IGr02AXeA3n+BBNzDAuN5HRALbJi4k1/BBbrpK7ZkUVsp5aYN7mgH3NCmtvPfPRLdgTDba5hQ==
X-Received: by 2002:a05:6512:3da1:b0:55c:c9d5:d344 with SMTP id 2adb3069b0e04-55ceeb69a1fmr2850612e87.28.1755507002219;
        Mon, 18 Aug 2025 01:50:02 -0700 (PDT)
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
Subject: [PATCH v9 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
Date: Mon, 18 Aug 2025 11:49:26 +0300
Message-ID: <433d74567cabf33c2a672afc0f96e58efec75c54.1755506449.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1755506449.git.mykola_kvach@epam.com>
References: <cover.1755506449.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under the "Virtual Hardware, QEMU" section documenting
support for the optional PSCI SYSTEM_SUSPEND function exposed to guests.

This function is available via the virtual PSCI (vPSCI) interface and
allows guest domains (domUs) to initiate system suspend operations.

The feature is currently marked as Experimental.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v6:
- Dropped the generic guest PSCI support entry (merged in a separate patch)
- This patch now documents only the SYSTEM_SUSPEND optional function
- Reworded commit message to match the final form after rebase

Changes in v5:
- Dropped ARM/PSCI entry: this refers to internal use of PSCI SMC calls,
  which is not relevant for SUPPORT.md
- Added a dedicated entry for PSCI SYSTEM_SUSPEND instead of generic guest
  PSCI info; guest PSCI support was documented in a separate patch
---
 SUPPORT.md | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 6a82a92189..b5ab049b52 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -962,8 +962,9 @@ Emulated PSCI interface exposed to guests. We support all mandatory
 functions of PSCI 1.1. See below for the list of optional PSCI call
 implemented and their status.
 
-   Status, Mandatory: Supported
-   Status, MIGRATE_INFO_TYPE: Supported
+    Status, Mandatory: Supported
+    Status, MIGRATE_INFO_TYPE: Supported
+    Status, SYSTEM_SUSPEND: Experimental
 
 ## Virtual Hardware, QEMU
 
-- 
2.48.1


