Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5B680A80F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 17:02:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650718.1016494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdJF-0002sf-BD; Fri, 08 Dec 2023 16:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650718.1016494; Fri, 08 Dec 2023 16:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdJF-0002qU-6y; Fri, 08 Dec 2023 16:02:37 +0000
Received: by outflank-mailman (input) for mailman id 650718;
 Fri, 08 Dec 2023 16:02:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsQu=HT=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rBdJD-0002KL-Po
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 16:02:35 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 339894f1-95e3-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 17:02:35 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-332c0c32d19so2680838f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 08:02:35 -0800 (PST)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a5d69c3000000b00333320cf08bsm2300535wrw.102.2023.12.08.08.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 08:02:32 -0800 (PST)
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
X-Inumbo-ID: 339894f1-95e3-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702051354; x=1702656154; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fr3W+U/Mp2tq5rXlzz6Wl7JrCdke4I/2nydwyKcZdGM=;
        b=uiY2U8286Iv7/0a6l9LLCoacW0B5EBA5gmBKIlRk58CfTmEQrU1946HPcRDJrIXiJY
         YnIjXvX8hAldIO6qRUjzHG9EfeAAc6nmymIGBXnGB0Bp5w9Ncs1jWedhDnLkaTglLp5b
         fPZ4KhxRjzM3aqrw+VOUrBZj3namFOUGLp7ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702051354; x=1702656154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr3W+U/Mp2tq5rXlzz6Wl7JrCdke4I/2nydwyKcZdGM=;
        b=Ec7npX82R46h5iKX8aB/DiLWutKZegAwU+UYokfU6TfURb10VDNKSwNkJSl8VIJvW+
         B3Pu4va+vfctm3Sc0U+8U0J8Pe8uZ6/7tZVD1z5+JvcrW4wYAHplBjdssmaffNej+A6R
         x6OibPn8nbRFsSr/cL1II8A2wYZ1Tog33KicHWwNapO2B4luU9PQ8KuDqYph+azUG2lQ
         b+BEFPL5PV2uGXrPj3mdSc6OUQidKoGYK4qxX2j6c114qdrCzQa6HGsY8mgi+YObw3tJ
         cAPOZCt4ykO2o2LJrw2pUi1yU4fEl5OkUaMKsRjcCBn8Y0pKCEi5zvnrGqgu9/zHo3ay
         mJBg==
X-Gm-Message-State: AOJu0YyJH/WupZQqFwNNeqTA3TwGeaRV9QrGcSTJn4lVY/7h5QnvClvR
	hfZ8p0dGgdLojjGWbC8MLAK93Fe0lCuR49CQ18Q=
X-Google-Smtp-Source: AGHT+IE9xrxUFQDJ3sF2wXBv+u9YgkgTTACfK/+HSMfPlKpwhtmu9Hkd5sOKBDQPgvSP24m325ZWzA==
X-Received: by 2002:a05:6000:136d:b0:333:145a:759b with SMTP id q13-20020a056000136d00b00333145a759bmr155989wrz.20.1702051353986;
        Fri, 08 Dec 2023 08:02:33 -0800 (PST)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [OSSTEST PATCH 2/3] create_build_jobs: Enable X86_GENERIC for i386 kernel pvops jobs.
Date: Fri,  8 Dec 2023 16:02:25 +0000
Message-Id: <20231208160226.14739-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208160226.14739-1-anthony.perard@citrix.com>
References: <20231208160226.14739-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is following a failure to build "arch/x86/xen/enlighten.c" in
build-i386-pvops jobs with linux 968f35f4ab1c ("Merge tag
'v6.7-rc3-smb3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6")
in linux-linus branch.

Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 mfi-common | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mfi-common b/mfi-common
index 1a131c27..d8d167fd 100644
--- a/mfi-common
+++ b/mfi-common
@@ -319,6 +319,11 @@ create_build_jobs () {
         revision_linux=${REVISION_LINUX_ARM:-${DEFAULT_REVISION_LINUX_ARM}}
       "
       ;;
+    i386)
+      pvops_kconfig_overrides="
+        kconfig_override_y=CONFIG_X86_GENERIC
+      "
+      ;;
     esac
 
     case "$arch" in
-- 
Anthony PERARD


