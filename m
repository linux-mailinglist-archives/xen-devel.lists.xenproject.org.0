Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A319A6C4A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 16:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823577.1237591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tVa-0003tn-Ae; Mon, 21 Oct 2024 14:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823577.1237591; Mon, 21 Oct 2024 14:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tVa-0003qn-6j; Mon, 21 Oct 2024 14:35:46 +0000
Received: by outflank-mailman (input) for mailman id 823577;
 Mon, 21 Oct 2024 14:35:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2tVY-0003qg-JN
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 14:35:44 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0ac9314-8fb9-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 16:35:43 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so8241610a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 07:35:43 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b1d8sm1999394a12.72.2024.10.21.07.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 07:35:41 -0700 (PDT)
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
X-Inumbo-ID: c0ac9314-8fb9-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729521342; x=1730126142; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tXb6zgsDmrfdX6HGNDxDlfgEnBGx6ObbDfJiK//3eo0=;
        b=Wcynk9cy4cb8LgV9te4sbi9h32O54rqWK1FN5x+VOT6l+nXa86B8oosC4bva+x35MJ
         7GbMu5zvxUQDPGYqn7d3Dl3FB9yYAchO0Z8kHJ0qYBCOOIufqhxfMUYDSCQem6LDFKeM
         6Rc4Nw8Bxz2Koh3UVujkxSdlkg5IamxuB2vXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521342; x=1730126142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXb6zgsDmrfdX6HGNDxDlfgEnBGx6ObbDfJiK//3eo0=;
        b=gEY6qdDbepzZJGNrp6DMLDRELkwL1aqaRmchTrzkB8ii2CaVGhZFNXIbU/u9VHI4ct
         xHse7jJs24zPn/3VpaHgysTq9j1lIVrm/fo0gR6X5Yihn/l8W1WbHXcOmCdZVIMCYjnw
         y7o6ewqJhCCLKfh9J82U+ne7UPz+TeKtKdFkZxHyaq3hbSgNFDKfabm8wbjqgoSVt8Bx
         FVxTBEMD8ZmCbG1+FEVCDKmp929DkoYjIFjtnvEXSrKHDn/xtknO6XEs/Z96WDAHYyT4
         2+4lgjdS6keulobrwtUJlDp8MaOp1UPc4zqmPb6LayuuVz06fIbDvN2JlIOwarnQgh/d
         a5zA==
X-Gm-Message-State: AOJu0YzFp6WSSsO5oCK7IG6rKSxg4zC3NATofDsWuEB8IdX1h5dLgjps
	yo5u4s1KgQXcLLdZ9PwXfmzMqQCobzZYPiqIp594b7kJV9XsJ3O/MakEYSgXnYjRQn0+gTfGFjb
	Z
X-Google-Smtp-Source: AGHT+IG6NFWWQCzKIXyOzA/1+R5cV9BKX+NNgjwPB0wSkUA7nV+cimJJ08HbcwJPuzxrNYr7NHZb8A==
X-Received: by 2002:a05:6402:26cb:b0:5c5:c444:4e3a with SMTP id 4fb4d7f45d1cf-5ca0afd391cmr10441443a12.0.1729521342286;
        Mon, 21 Oct 2024 07:35:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 0/3] Add {adl,zen3p}-pvshim-* tests
Date: Mon, 21 Oct 2024 15:35:36 +0100
Message-Id: <20241021143539.3898995-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The main patch is patch 3.  Patches 1 and 2 are cleanup to qubes-x86-64.sh.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1505518838
https://cirrus-ci.com/build/4673310460477440

Andrew Cooper (3):
  CI: Minor cleanup to qubes-x86-64.sh
  CI: Rework domU_config generation in qubes-x86-64.sh
  CI: Add {adl,zen3p}-pvshim-* tests

 automation/gitlab-ci/test.yaml     |  16 ++++
 automation/scripts/qubes-x86-64.sh | 138 ++++++++++++++++-------------
 2 files changed, 92 insertions(+), 62 deletions(-)

-- 
2.39.5


