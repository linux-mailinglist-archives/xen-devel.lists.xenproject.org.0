Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FCE80A811
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 17:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650717.1016480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdJE-0002Ty-39; Fri, 08 Dec 2023 16:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650717.1016480; Fri, 08 Dec 2023 16:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdJD-0002Oz-VO; Fri, 08 Dec 2023 16:02:35 +0000
Received: by outflank-mailman (input) for mailman id 650717;
 Fri, 08 Dec 2023 16:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsQu=HT=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rBdJC-0002KL-PV
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 16:02:34 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32d90217-95e3-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 17:02:34 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33350fcb2c7so1662199f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 08:02:34 -0800 (PST)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a5d69c3000000b00333320cf08bsm2300535wrw.102.2023.12.08.08.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 08:02:31 -0800 (PST)
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
X-Inumbo-ID: 32d90217-95e3-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702051352; x=1702656152; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+zyK/oiTkm1dgGGOn54iVXU0W1VNBdMRp0zkH25QpU=;
        b=WsHDQYryihwTO81AxY6ZSk7THz5P6uH8YWUvt0AJnbL+AK7HGjH64fqQxnegaukXa0
         W37/An6F4QQRI0NtRQ1yKUKbfNKXC4RIgsY8PEeEPp9J+0Cn/K7Z1VV6vyM7BlN3aEcV
         LMT+eT7HqTfttJJ1LJfe+6tlfyXJFEuYzazuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702051352; x=1702656152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+zyK/oiTkm1dgGGOn54iVXU0W1VNBdMRp0zkH25QpU=;
        b=D7+5goBeZiFU5NCCOIrW0vY9I2Y2M6vDzDO9/UCTXrkDc6SHollao/B8L/waC+4k2w
         kr9MZ59zxN9xT3kFyvafmD48w1OVowr3VL8Qu6/CRuIGPPhB1e5xxUldK59G5WdFm4Qr
         +9OqaZkfneZ3vx9sZCZXL+0h6qTh/JxR7oah0R1mSR2Mv3pYs8NkfapU1bBexRLyOGJ9
         CSMxpF1P9igpM1Iw/TzpX/+GAeXciMFslSDbytTjweeKMAQ4hcyVLdCbnncKlaytT2qH
         7sErAoW6uZASKGeYF2c38CBLaEv91IGhO39eYCLTBm0XlJ9orMF5ox9WJ0n2aD0JHvCY
         TB2Q==
X-Gm-Message-State: AOJu0Yze+yZZYJFZevseHOOM+SSvvWQI1S/O72EAQXF2w2pD3hO3EOHM
	jjPZ1Yy5TpjGPD31bZQoYthrovcwneOwU1vD0kU=
X-Google-Smtp-Source: AGHT+IFQTdIlvsMdCJ+RHxBahKu2ud4weU+5uTYJfRDWIuC1a6AKQKRCP34gb8bDVY+ezFs6Mp73Tw==
X-Received: by 2002:a05:6000:369:b0:333:2fd2:8166 with SMTP id f9-20020a056000036900b003332fd28166mr153110wrf.131.1702051352114;
        Fri, 08 Dec 2023 08:02:32 -0800 (PST)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [OSSTEST PATCH 1/3] create_build_jobs: Set reset pvops_kconfig_overrides
Date: Fri,  8 Dec 2023 16:02:24 +0000
Message-Id: <20231208160226.14739-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208160226.14739-1-anthony.perard@citrix.com>
References: <20231208160226.14739-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those two variables, and especially "pvops_kconfig_overrides", aren't
reset for the next loop of `for arch ...`. So when
"pvops_kconfig_overrides" is for "armhf", it is also set for "arm64"
as this is the next "arch" in the loop.

Avoid this by setting default values for the variables before the
`case` command.

This changes Linux arm64 builds which will not have "CONFIG_EXT4_FS=y"
anymore, but should get "CONFIG_EXT4_FS=m" instead from
`ts-kernel-build`. But resulting build still have "CONFIG_EXT4_FS=y",
so no change.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 mfi-common | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/mfi-common b/mfi-common
index 51eb4a9c..1a131c27 100644
--- a/mfi-common
+++ b/mfi-common
@@ -284,6 +284,11 @@ create_build_jobs () {
 
     build_matrix_branch_filter_callback || continue
 
+    pvops_kconfig_overrides=""
+    pvops_kernel="
+      tree_linux=$TREE_LINUX
+      revision_linux=${REVISION_LINUX:-${DEFAULT_REVISION_LINUX}}
+    "
     case "$arch" in
     armhf)
       case "$xenbranch" in
@@ -314,12 +319,6 @@ create_build_jobs () {
         revision_linux=${REVISION_LINUX_ARM:-${DEFAULT_REVISION_LINUX_ARM}}
       "
       ;;
-    *)
-      pvops_kernel="
-        tree_linux=$TREE_LINUX
-        revision_linux=${REVISION_LINUX:-${DEFAULT_REVISION_LINUX}}
-      "
-      ;;
     esac
 
     case "$arch" in
-- 
Anthony PERARD


