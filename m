Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84412A6A9F8
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922631.1326519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHt1-0000QA-M0; Thu, 20 Mar 2025 15:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922631.1326519; Thu, 20 Mar 2025 15:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHt1-0000Np-Im; Thu, 20 Mar 2025 15:32:47 +0000
Received: by outflank-mailman (input) for mailman id 922631;
 Thu, 20 Mar 2025 15:32:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvHt0-0007l8-5Y
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:32:46 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91862c8d-05a0-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 16:32:44 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3913cf69784so785764f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:32:44 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556afsm51545035e9.19.2025.03.20.08.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 08:32:43 -0700 (PDT)
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
X-Inumbo-ID: 91862c8d-05a0-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742484763; x=1743089563; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/8OKxq5tdUvL+relQi7wdXNnmHOUxgp/8lJVL44Vxo=;
        b=FVvMZ/zc+40vav7yn4lT7d8+V4n592o55XBp4lkQGbLBSBjwzTYZbyDWbx0hQ4IT6k
         i0a1LPutuuHrEbpcflc5lMcvTqEd0z78e9DBxho95rIuBk2/jW1/VQgZeslf3tGx5lPT
         DEyemr+zzVgLg24tyADwUw/RzCVLcUEUor5Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484763; x=1743089563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/8OKxq5tdUvL+relQi7wdXNnmHOUxgp/8lJVL44Vxo=;
        b=J8sPxq01iduVDWkniwWGPWe/Md6dq/bmbZ4yNanFKS56KEaoNqYeRcdRCjVIwthP3n
         OYc4nPdHdTu0UbqlYMvGPF2D2l6GMjva9ZZKY0H+RdYO8P9ssA+uJ3CaquTkIlqQVQ+C
         NgIOY+UjeWq8iOSP5phVdtW8hCEjijmBIjitNVq+lK5WP5D+ra61Z3g47DN8cd1P+F0J
         6dIkDxagAToS1n50u2LrEfwUkZlalBaKlyoobQFiD0tOiVgosd3aAMDTwbwBCVHduYm6
         XWBB9ICMY4vXaxFbPIguqH5OaadblvtkSGuDcPD4dBOEwbWKwHqEpvNtM2D1w55Tz/pf
         3WKw==
X-Gm-Message-State: AOJu0YyWx2P04ry2iVpV0CLq4HEe7+uUHaUZ4p0hP0M8Pn8MRpxsSXhN
	pbeki44s7Wg958vQQnyskcG0uMobf0RXPKDAxozoqT9G4T+sWlQB62wFmci+Ni90ecgZsPaDmKw
	c
X-Gm-Gg: ASbGncubyZViU0Z3ySU4Fssw8vcfg3p6ZHzwQaMT0RQn2MSQ8PuS90KLps6DXXy2Kwr
	pKFKGUwgz9A6ow7IO9SoVX2IoUUDhfgGmZjuk1YuvKAQBc+Pq9b9wYx/7g11e1E9FtZDM4Scvu/
	XNO1r/WZWhzm2k5gSq/K+fBMHUosPmW7ptkQKt4usgPhndlrjFmNbAkQSsJ2nLVkM/0RtJGcBoz
	0/9+IYr1YLcifm6mFSPqaDN3X3XTalnjgYObFatViyS58sjMCDwN+or3SI4fm657ihXY1ZLXyxL
	tDrtuIr1TvheSVXjFDjc0XscwSRNQwbLuqmhML4PmteJ+q7J5f0ONL9HtUYgozPtTdpLibpUByv
	fyXolJ4Lvbx1fd//YfutN80tH90Qv
X-Google-Smtp-Source: AGHT+IHMsztN2psHN4+fMHqrXpoGBIaJKeXm+cOLJf0uja+D+GkIFTwd7Y99M+rXWlWcEmQqKJseNQ==
X-Received: by 2002:a5d:47aa:0:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-399739c23afmr8225419f8f.15.1742484763546;
        Thu, 20 Mar 2025 08:32:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/3] Xen: CI changes for new toolchain baseline
Date: Thu, 20 Mar 2025 15:32:38 +0000
Message-Id: <20250320153241.43809-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prep work to allow us to start making changes based on the toolchain
requirements.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1726628670
https://cirrus-ci.com/build/5232741505040384

Andrew Cooper (3):
  CI: Update build tests based on new minimum toolchain requirements
  Xen: Update compiler checks
  CHANGELOG: Minimum toolchain requirements

 CHANGELOG.md                         |  3 ++
 automation/build/centos/7.dockerfile | 72 ----------------------------
 automation/gitlab-ci/build.yaml      | 30 ++++--------
 xen/include/xen/compiler.h           | 16 ++-----
 4 files changed, 17 insertions(+), 104 deletions(-)
 delete mode 100644 automation/build/centos/7.dockerfile


base-commit: 6e5fed7cb67c9f84653cdbd3924b8a119ef653be
-- 
2.39.5


