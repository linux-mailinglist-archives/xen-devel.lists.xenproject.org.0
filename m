Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A48681CC1B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659507.1029212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhJt-0003qH-El; Fri, 22 Dec 2023 15:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659507.1029212; Fri, 22 Dec 2023 15:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhJt-0003nr-Be; Fri, 22 Dec 2023 15:20:13 +0000
Received: by outflank-mailman (input) for mailman id 659507;
 Fri, 22 Dec 2023 15:20:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDs-0007Ie-Jq
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:14:00 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb08e225-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:58 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50e6984db43so736004e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:58 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:57 -0800 (PST)
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
X-Inumbo-ID: bb08e225-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258038; x=1703862838; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PCAiHEQXj9LjYzTOkcuB9LrGjzg6HI3eMNpgS8Jl0o=;
        b=AI1nOfU+iSE3m+CWoUqLy6iCFy+nwBWg4J2TiPuMmM1vUW5JKhur0QZNMRGb1D/AL8
         1XFpULd0bISGJRrd836dS+Z0E+5NsaHaFTMJGWs0psm0Q4HqP5ooQ/Y0iJNTtPhBZymV
         6RTenbhsCTMhwtBbo2ZGLCorH+dsSs2jGJ9FzO079BUNB/Yt1Z1vxhnLRujCmP/c34W3
         l3d9OEXIOTb0/QuM4NMBSj9RAMXJ9OPm92fKhxBCYt8YeZYfefrbL3erlaxFmEggcUG3
         vJILdBOLZ+UfRcmdC/gjW09ard3yeSCwgJA4Hg/E4kBP33+TIWrJ5kuPnw0VsX5UmkzG
         qOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258038; x=1703862838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PCAiHEQXj9LjYzTOkcuB9LrGjzg6HI3eMNpgS8Jl0o=;
        b=ItKj4cwGW1ZUpJCoYeED3Lx7fucB7JCdkL31pVWUbMvR5uXIJi2awykHq3K3JlRIXG
         2vUFoghwQlODYX1g3pUv0tUiZhLrNDyIIfZnPBzh84JR2q+s4OdbUeVi73woQleY9Irm
         kXgQXXWJR5fWRE1o4i/IhARDMRHs8PYpGAn9UBESWihbf1mKorEjegiBtG+wnr6qIJub
         46feSQkrjRUdhDhd1+GvgSK9W1zMCrxtxMkDOw0nk1NfK192JhzknqTdOSom+IDrjiib
         lk2pByBpTYHW4yR2d/UWPwKduScQQ/fng9m90QA0WEt94Suh3gRrAwrX6lj7avRVadUL
         A6Eg==
X-Gm-Message-State: AOJu0YzENETG68pRDTf2p8ks8hHG5gf1npNgQWixnnU0KBTKnH4+Euxu
	z40cufcKxk4Of2Cs0etpzDxSd97Zlkc=
X-Google-Smtp-Source: AGHT+IGwLed/YeTdr1fhgZs8ZC3Lq3tWyDc+Ndpo2my/wfjs9YALjcx+wYNbzm9t5EZLNp7Os3M20g==
X-Received: by 2002:ac2:5b9a:0:b0:50e:3e13:e142 with SMTP id o26-20020ac25b9a000000b0050e3e13e142mr701162lfn.118.1703258037991;
        Fri, 22 Dec 2023 07:13:57 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 34/34] xen/README: add compiler and binutils versions for RISC-V64
Date: Fri, 22 Dec 2023 17:13:18 +0200
Message-ID: <c4d579f02b431d6ac9366dee73ebd7ab74e44715.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V3:
  - new patch
---
 README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/README b/README
index c8a108449e..1015a285c0 100644
--- a/README
+++ b/README
@@ -48,6 +48,9 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 13.2.1 or later
+        - GNU Binutils 2.40 or later
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.43.0


