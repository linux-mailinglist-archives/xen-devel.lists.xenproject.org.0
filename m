Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F878A82D1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707422.1105328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx45T-0006qD-Jk; Wed, 17 Apr 2024 12:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707422.1105328; Wed, 17 Apr 2024 12:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx45T-0006nz-Ge; Wed, 17 Apr 2024 12:08:27 +0000
Received: by outflank-mailman (input) for mailman id 707422;
 Wed, 17 Apr 2024 12:08:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bxKY=LW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rx45S-0006LA-En
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:08:26 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31b3aae2-fcb3-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 14:08:25 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56e6affdd21so1722892a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 05:08:25 -0700 (PDT)
Received: from EPUAKYIW03DD.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 zh17-20020a170906881100b00a5271ae4458sm3484247ejb.16.2024.04.17.05.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 05:08:23 -0700 (PDT)
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
X-Inumbo-ID: 31b3aae2-fcb3-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713355705; x=1713960505; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOIA53yAdQfWR8cyvYLHAZc46xc+jabx7ASlkAFV0zA=;
        b=C3oIxryTqVnfz2rRPcHwKpJiavFxbAUYk907efWStcT6sSyMxgk8jEOueO3jfz49kr
         NscMwh3s5kek89HRuUq6kkt7M4AMAKWjRe4ymNqoWHehaloh0T1CmcgLX2IEwEko5HqR
         cwJxPd8q8mgJzU3JYK0MxP/rKhlSM8uqAXl18zrWcTa/LsNfChVsNm+NhHcKoQWbkjt8
         8eR7B0C3rOmYiljcK3fvWxU23pfa/yc5ASxZ10o35ZO1DP8p1gQ4rhxrzd6fiFdIYxa4
         +4lwlYI3sd7u0ojcyxnOVxT+f4/+0fNN4PuOADEHc/dnuuBRciMTK6HWAKqtp7JnlwZ7
         HtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713355705; x=1713960505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOIA53yAdQfWR8cyvYLHAZc46xc+jabx7ASlkAFV0zA=;
        b=ZP59HLQkvCwHp4jawu0xd24M0bq7CZH0fF5uGq7XEn9fer9k0fk6o0oRPkQZSDjJos
         GrSvLPCGkfc455A4UBVcePsu3iUORN+RMQkQZ9TCRLDjztAW7JRkwFMqR/LJ3aG2ZB+g
         DDdQgaapR2lRxlNHIE5727MDJ5gk0a+k5WB9Xk82Yic7/3dXADV2JSG3H1dNb4e8fXyZ
         7C9EZFrjqLSjpCWOrw9FXSeLaRHHdnkFSHxSNiytG5ZGGk1R13iQ2eSsyzY+L49AGMif
         Hd+50sBEbfedo6jMjCKtLLFtM+tjMTMjaLUSwZaZKVMd+q7mRSuiiyGFKEMUDvzqOEA5
         vqEg==
X-Gm-Message-State: AOJu0YzN2rbQD5zWJ0Sm41B1W0cW3zHmVGS2kQLU0P9HnAXLP1OAKevQ
	YkM2/JG5VfHA6+WkSi0Yv7V9nbUWETXU08ycvS/Q/65W5sQY7aHeiE48wQ==
X-Google-Smtp-Source: AGHT+IH3uZrttCb+wuhssXHg+F41A77cgKNUwsAacqWI6tT2aaC+du7EjRH7Yhud75BuABibl2hInQ==
X-Received: by 2002:a50:d6d3:0:b0:56e:64b:8733 with SMTP id l19-20020a50d6d3000000b0056e064b8733mr10813063edj.40.1713355704873;
        Wed, 17 Apr 2024 05:08:24 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [ImageBuilder 2/5] uboot-script-gen: Extend DOMU_ENHANCED to specify "no-xenstore"
Date: Wed, 17 Apr 2024 15:07:38 +0300
Message-Id: <20240417120741.2453431-3-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417120741.2453431-1-olekstysh@gmail.com>
References: <20240417120741.2453431-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

We need some Xen services to be available within single dom0less DomU.
Just using "enabled" will lead to Xen panic because of no Dom0.

(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) At the moment, Xenstore support requires dom0 to be present
(XEN) ****************************************

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 README.md                | 7 ++++---
 scripts/uboot-script-gen | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index 3b4b16f..97db7aa 100644
--- a/README.md
+++ b/README.md
@@ -217,9 +217,10 @@ Where:
   If set to 1, the VM is direct mapped. The default is 1.
   This is only applicable when DOMU_STATIC_MEM is specified.
 
-- DOMU_ENHANCED[number] can be set to 1 or 0, default is 1 when Dom0 is
-  present. If set to 1, the VM can use PV drivers. Older Linux kernels
-  might break.
+- DOMU_ENHANCED[number] can be set to 0, 1, or 2. Default is 1 when Dom0
+  is present. If set to 1, the VM can use PV drivers. Older Linux
+  kernels might break. If set to 2, "no-xenstore" is specified, see Xen
+  documentation about dom0less "no-xenstore" option.
 
 - DOMU_CPUPOOL[number] specifies the id of the cpupool (created using
   CPUPOOL[number] option, where number == id) that will be assigned to domU.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 7cb8c6d..98a64d6 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -348,6 +348,9 @@ function xen_device_tree_editing()
         if [[ "${DOMU_ENHANCED[$i]}" == 1 || ("$DOM0_KERNEL" && "${DOMU_ENHANCED[$i]}" != 0) ]]
         then
             dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
+        elif [ "${DOMU_ENHANCED[$i]}" == 2 ]
+        then
+            dt_set "/chosen/domU$i" "xen,enhanced" "str" "no-xenstore"
         fi
 
         if test -n "${DOMU_SHARED_MEM[i]}"
-- 
2.34.1


