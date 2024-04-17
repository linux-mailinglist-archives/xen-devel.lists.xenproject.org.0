Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3278B8A82CF
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707421.1105317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx45S-0006b2-B5; Wed, 17 Apr 2024 12:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707421.1105317; Wed, 17 Apr 2024 12:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx45S-0006ZW-89; Wed, 17 Apr 2024 12:08:26 +0000
Received: by outflank-mailman (input) for mailman id 707421;
 Wed, 17 Apr 2024 12:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bxKY=LW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rx45Q-0006LA-H3
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:08:24 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3091711f-fcb3-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 14:08:24 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a523524e5baso658959666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 05:08:24 -0700 (PDT)
Received: from EPUAKYIW03DD.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 zh17-20020a170906881100b00a5271ae4458sm3484247ejb.16.2024.04.17.05.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 05:08:21 -0700 (PDT)
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
X-Inumbo-ID: 3091711f-fcb3-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713355703; x=1713960503; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rc21BLqnZBZmnW+ZTTNZ/eEtQz28m8RtFuzM5WSjFnw=;
        b=bNN2lgW7164Jkelhp/ivIqM+l99yDezzxkxfRkzuF/S0BYuN6iPRkREzz0TuxKGLvb
         IWmvfWj8flw+chg59PyePP3qcHasGHkDOWapwaUn89ivGzwGMGKIwsgMydbuxBpJ8erw
         /+exhx8a53qNAYnXeF1RuDISMREWQBdmxaU2sXlJH7oKGaSPC4VJybTFK6fn37gnue9U
         eCY9PP3QjfxeTG6zmwzc1vIbrtGIKgXoXPccAqdFE9ukoHK/aDhOcmM+BkUmyTTntgkU
         pFMs8aSetW35e2T1xUKbWwUas/p0GDJ1x3hOlxIB8n4acl/cuvKcuFfSzCRkyv/TwEMo
         BThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713355703; x=1713960503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rc21BLqnZBZmnW+ZTTNZ/eEtQz28m8RtFuzM5WSjFnw=;
        b=NKMinyhjgGIPxCAcSb+0WkzWhvxq0H+3i6u/AHcOjIMM4F15yWUjR8T3jnMfDbUrUI
         uAQKtEaCCBAhAQauPGiaLQ80eFFtecz9Ay5RI9IjCFXeB1xbeuPAfqCsS7CxfFF10hUj
         l0TomjDEteRATm9WqAXnjDZ+59gOCmJJj7gPRK6sA2pThfVsNF9VkMyJtxaUgvSgb3Ve
         5u/ev7EGkNKMsMnyW0yaUvevNo2t5C+sBjdPQExVo2PwM2kzrTeiO9OmIG0gBDJhHl3S
         IvVmXwuncQtALYeBF2q54AiuMbOA0ibzCoeNRJaZlM2U0AJuVKGFIBh3msit9CaqrLog
         Qwtw==
X-Gm-Message-State: AOJu0YyEfQCORLRIejncRS9uSZ9AVtVNcV3iQmtLU0GGsqEuakx11lw/
	HshLOWNZwuImdIm6D92Po3j2JUrSPZk1Bg2hjY0q4eaoH2JxUnlY0newxg==
X-Google-Smtp-Source: AGHT+IGPhQebsHwyCOk+OIBgqfov9d0toxo+SH4G4Pn0/4yp2FZc/POdmj0vMVxPkYEqkkVMg1g60w==
X-Received: by 2002:a17:906:70b:b0:a52:6e54:1c96 with SMTP id y11-20020a170906070b00b00a526e541c96mr5427045ejb.15.1713355702737;
        Wed, 17 Apr 2024 05:08:22 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [ImageBuilder 1/5] uboot-script-gen: Update to deal with uImage which is not executable
Date: Wed, 17 Apr 2024 15:07:37 +0300
Message-Id: <20240417120741.2453431-2-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417120741.2453431-1-olekstysh@gmail.com>
References: <20240417120741.2453431-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

uImage is the Image that has a U-Boot wrapper, it doesn't contain
"executable" string which subsequent "file" command is looking for
when inspecting it.

Below the proof:

otyshchenko@EPUAKYIW03DD:~/work/xen_tests/input$ file -L binaries/uImage.gz
binaries/uImage.gz: u-boot legacy uImage, Linux Kernel Image, Linux/ARM 64-bit,
OS Kernel Image (gzip), 9822180 bytes, Fri Sep 29 15:39:42 2023, Load Address: 0X40000000,
Entry Point: 0X40000000, Header CRC: 0XE1EF21BF, Data CRC: 0XC418025

otyshchenko@EPUAKYIW03DD:~/work/xen_tests/input$ file -L binaries/uImage
binaries/uImage: u-boot legacy uImage, Linux Kernel Image, Linux/ARM 64-bit,
OS Kernel Image (Not compressed), 23269888 bytes, Fri Sep 29 15:40:19 2023,
Load Address: 0X40000000, Entry Point: 0X40000000, Header CRC: 0XA0B7D051,
Data CRC: 0X42083F51

Suggested-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 scripts/uboot-script-gen | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 3cc6b47..7cb8c6d 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -505,9 +505,9 @@ function check_file_type()
 
     # if file doesn't know what it is, it outputs data, so include that
     # since some executables aren't recongnized
-    if [ "$type" = "executable" ]
+    if [[ "$type" = "executable"* ]]
     then
-        type="executable\|data\|ARM OpenFirmware"
+        type="$type\|data\|ARM OpenFirmware"
     # file in older distros (ex: RHEL 7.4) just output data for device
     # tree blobs
     elif [ "$type" = "Device Tree Blob" ]
@@ -712,7 +712,7 @@ xen_file_loading()
 {
     if test "$DOM0_KERNEL"
     then
-        check_compressed_file_type $DOM0_KERNEL "executable"
+        check_compressed_file_type $DOM0_KERNEL "executable\|uImage"
         dom0_kernel_addr=$memaddr
         load_file $DOM0_KERNEL "dom0_linux"
         dom0_kernel_size=$filesize
@@ -747,7 +747,7 @@ xen_file_loading()
             cleanup_and_return_err
         fi
 
-        check_compressed_file_type ${DOMU_KERNEL[$i]} "executable"
+        check_compressed_file_type ${DOMU_KERNEL[$i]} "executable\|uImage"
         domU_kernel_addr[$i]=$memaddr
         load_file ${DOMU_KERNEL[$i]} "domU${i}_kernel"
         domU_kernel_size[$i]=$filesize
-- 
2.34.1


