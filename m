Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998A763D72
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570665.892737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi8a-0004SQ-Uf; Wed, 26 Jul 2023 17:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570665.892737; Wed, 26 Jul 2023 17:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi8a-0004Hb-NM; Wed, 26 Jul 2023 17:17:24 +0000
Received: by outflank-mailman (input) for mailman id 570665;
 Wed, 26 Jul 2023 17:17:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi2v-00062Z-3b
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:11:33 +0000
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [2607:f8b0:4864:20::a29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77ad7ed3-2bd7-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 19:11:32 +0200 (CEST)
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-4864cc561aeso20610e0c.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:11:32 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:11:30 -0700 (PDT)
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
X-Inumbo-ID: 77ad7ed3-2bd7-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391491; x=1690996291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fKIbOA4RKJwyWZPk8ACAEU8hAgIi7aDz2OnDwWBK4c=;
        b=cEqPDTYN4jp1bM38ONyapZb5sjjHHtuoRMvn7/AOYco0cl9A39Uw+AeJ7Vx0yGadKh
         g+GryXW4l38nradggkyUGKrTGZSAG7a3yOXd9d2ULPO1TR39s115caF4uK5ZRZhuAcXI
         gbgcQh2kyRlTkSaolEQ5nKAk4nAykM2Ux5RQWAdkYUlw2+IDVv87ugyxd2PfoYuxQ95O
         yiYqzJzMOB/ATv6MHqkU0fiEVQzc7y9HNGXMj1oL1V7U281QwgPsGpeH6e4dXPj/yJbX
         GN7DPHi/8k4p2l3+MwtfPLtoB2u7hURT57nUzVmTvYW2HxEdxPkFskS0dW6A1gWzJM/U
         NKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391491; x=1690996291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fKIbOA4RKJwyWZPk8ACAEU8hAgIi7aDz2OnDwWBK4c=;
        b=F5D5TdJIGrkJqXw92S0Z5HWRIv+4KFZjNYNL2Lcnav7AWo0dXdwvyeBsbzq09y0QUr
         uuYh7fEslSZCjbMA+bY15FW3sOLLPyHICbLU36tyukB53i4rqDaVw6s+KQaP6O5yYIbH
         ZKbIakxLrv6+f/jSnZB+v1Id0cFWvJwUiiSj0CCEJLdcOQXVMpPpPs5FcUdoY1/+vSKb
         owdSRa6CYPDhZHml58uFZc471GDoEN9UM3PVMs8YxhBKvASWEzNOtBO5RFA0GCRKHK7w
         S4WR79Jpe71XgRhMXQO0Lj3JrEFRZ3GaOr1FwjZj4FLARWtA4zgB7woX88Azdkv0Jh9+
         KCeg==
X-Gm-Message-State: ABy/qLax+V1rpxbqkgWNXryiWZMaViLqCYOCg4bVgtrA64y01sxMZd0t
	KSAdmrDGUZgkOTuPrvZ90j6qLPT0h9k=
X-Google-Smtp-Source: APBJJlEWDBNLI3jM2iCnuUvrRJIpeItyiY4vKwD9Ygri4G5qaqR/i40OGmB/BoJ79bDVPyjBY8Tohw==
X-Received: by 2002:a1f:dd44:0:b0:486:4c0e:9ae5 with SMTP id u65-20020a1fdd44000000b004864c0e9ae5mr1882323vkg.13.1690391490884;
        Wed, 26 Jul 2023 10:11:30 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v7 15/15] CHANGELOG: Add Intel HWP entry
Date: Wed, 26 Jul 2023 13:09:45 -0400
Message-ID: <20230726170945.34961-16-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726170945.34961-1-jandryuk@gmail.com>
References: <20230726170945.34961-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Henry Wang <Henry.Wang@arm.com>
---
v3:
Position under existing Added section
Add Henry's Ack

v2:
Add blank line
---
 CHANGELOG.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7d7e0590f8..8d6e6c3088 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -24,7 +24,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - xl/libxl can customize SMBIOS strings for HVM guests.
  - Add support for AVX512-FP16 on x86.
  - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
-
+ - Add Intel Hardware P-States (HWP) cpufreq driver.
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
-- 
2.41.0


