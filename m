Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE69498714A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805200.1216241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stld3-0001CM-Kr; Thu, 26 Sep 2024 10:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805200.1216241; Thu, 26 Sep 2024 10:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stld3-00019B-I1; Thu, 26 Sep 2024 10:21:45 +0000
Received: by outflank-mailman (input) for mailman id 805200;
 Thu, 26 Sep 2024 10:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stld2-000190-Pm
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:21:44 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 209acdf3-7bf1-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 12:21:43 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2f75428b9f8so11306431fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:21:43 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf48c418sm3096744a12.20.2024.09.26.03.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 03:21:41 -0700 (PDT)
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
X-Inumbo-ID: 209acdf3-7bf1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727346102; x=1727950902; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0h9Qp9z/vHrnGnaehgnwUwuvIx6CBhpYySgFS8gRAg=;
        b=KF2ds2E8Sg31Fn7siYmUMraehqnBED580C2GpNPOCP7waQyRPMODcSsSSerBLzOBj0
         hMFk2J+1cXP2lkkMIEhQE+whB5aFk7CtR+2L+gkOCKiDK0RtpRTVe0bxq2aS4BNAXezM
         8nnNsF6lFxaLbME/dS694v1X1AkGQ2Pl7STGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727346102; x=1727950902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0h9Qp9z/vHrnGnaehgnwUwuvIx6CBhpYySgFS8gRAg=;
        b=dXniErczxXm8HuiwoIE8Z8L3zJAiKL3R2mfv0/6RyfGwuTacDb0IQcSoyJNbZzERXa
         Mzq0EyMIQB6wNgjyCNT+LArSBYj15coqvZmQnlYeCu9KzSFozY4rEzudYzpfQ4glwub1
         xL0H4tPlINx41euwtz6920aO4ukMweKNVay0yzpxZ1hQdTTgy2dbfuJ978O2l64J/F8V
         qw0v5spbzxNDBydUJFYvwD7JoAi5/fSpNd7DV39MOLGUTAAQdgJmittKAspJTaHN6LWu
         zKXrjd3cMZf3Vyroy0BhgQ1ZkAnJhnoxIo5mLznpueDz244kFGLWlhRcib+kM7h4mjCc
         1BsQ==
X-Gm-Message-State: AOJu0YxBT8a4cPGVd48QrFzzaypR99DyJwnKt8ZAAqHL+Ucxan7mHzDP
	cgIDdONQOnnWYgkV/QX/9g1fQmGoGb4G8VHN/LnCndMLxOUU5dJk7aPB9fvMfDcVfnbygkYTEIp
	S
X-Google-Smtp-Source: AGHT+IHG/vhuzGqMY3F5cP7Ea3RFRygyMB+yC2K3kZxcfq9boMDqzVy/JcHw7dX5cphacsluH7IFOg==
X-Received: by 2002:a05:651c:1991:b0:2f7:562d:cb6c with SMTP id 38308e7fff4ca-2f915fc0a2dmr56663991fa.2.1727346102256;
        Thu, 26 Sep 2024 03:21:42 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 0/5] xen/livepatch: improvements to loading
Date: Thu, 26 Sep 2024 12:14:26 +0200
Message-ID: <20240926101431.97444-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Series started as a bugfix to do the build-id checks earlier, but has
expanded a bit into alternatives also.

Thanks, Roger.

Roger Pau Monne (5):
  xen/livepatch: drop load_addr Elf section field
  xen/livepatch: simplify and unify logic in prepare_payload()
  xen/livepatch: do Xen build-id check earlier
  x86/alternatives: do not BUG during apply
  x86/alternative: build time check feature is in range

 xen/arch/arm/arm32/livepatch.c             |   8 +-
 xen/arch/arm/arm64/livepatch.c             |   4 +-
 xen/arch/x86/alternative.c                 |  46 ++++-
 xen/arch/x86/include/asm/alternative-asm.h |   3 +
 xen/arch/x86/include/asm/alternative.h     |   6 +-
 xen/arch/x86/livepatch.c                   |   4 +-
 xen/common/livepatch.c                     | 205 +++++++++++----------
 xen/common/livepatch_elf.c                 |  20 +-
 xen/include/xen/livepatch_elf.h            |  11 +-
 xen/include/xen/livepatch_payload.h        |   1 -
 10 files changed, 178 insertions(+), 130 deletions(-)

-- 
2.46.0


