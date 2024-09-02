Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120A3968408
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 12:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787718.1197159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3uk-0006dU-LM; Mon, 02 Sep 2024 10:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787718.1197159; Mon, 02 Sep 2024 10:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3uk-0006bz-IL; Mon, 02 Sep 2024 10:04:02 +0000
Received: by outflank-mailman (input) for mailman id 787718;
 Mon, 02 Sep 2024 10:04:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl3uj-0006bt-Ct
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 10:04:01 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acbb487e-6912-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 12:04:00 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a86933829dcso488105166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 03:04:00 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89940980a1sm480884466b.47.2024.09.02.03.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 03:03:58 -0700 (PDT)
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
X-Inumbo-ID: acbb487e-6912-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725271439; x=1725876239; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMAwDS/CcS7+LltDEgvIf6YsNX7RMEQnOx38vzG9QIg=;
        b=LPa6IFVojg19ZkZtydhlmSW6RoibZDEseZhwLMEESEvinhEQcP1tEVc/4waLyiAwEA
         7JCB7DU8LrQ6lkzOn/FZhRoYF6lvImc6+70TSSdwo0XMCiuh3Ab2rfbLmFu3quT6i03j
         aAcQqZxTG86tRR9Vn2vxPvPmvNxWOxW+Wno6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271439; x=1725876239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMAwDS/CcS7+LltDEgvIf6YsNX7RMEQnOx38vzG9QIg=;
        b=OChkWL46ACANp2gTLw3WZTvVYgGIx64zDuduQr47QXJc+yVx00OOUUJvXE+335Dhq+
         wGstDUalbXe+DJ2LhCbGCO+SAouKItZiHxgLd5yUWeg3A9DVVPDXFtBufk4a0xjTZTrs
         iNIkymch9FB1SVUItgyDYinpX5xSTungV9xVIkyWbQW0YuuNq/eExHoABxPCgvkBHiDT
         mCwEYfvZsVQPy7ViViHzE1IPjvYIv2xIXxyv49A5Eg3oN20IVUUG6CXan2T9enKe3ZH+
         lNo9KxYy2s/PtNjWRliGyTSg8a/MkzaF0Z9PN2R8CrU3lhaF9BFkZSLYUrbqwyyw1zjk
         Ccqw==
X-Gm-Message-State: AOJu0Yy2tu2MVmePHvGtxBwQhrPacvd9DUhNHpo0anpW+T33zZfc77YB
	xl4CD6gPgvaNuJi6RkLHFF12er5vh3FDyaGFSROiqzFQO+rIgfZSCkvq6uSHpSbV1gM7BhrtAmS
	b
X-Google-Smtp-Source: AGHT+IH3ANyf7odu1TtN1uQ+SCs9274OZu5QFmKie74mOIIMg1GfIOys1/bw1taBwNP3dpGuU2/l0w==
X-Received: by 2002:a17:907:26c8:b0:a86:812a:d2b6 with SMTP id a640c23a62f3a-a89fadc10c5mr238645966b.23.1725271438712;
        Mon, 02 Sep 2024 03:03:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 0/4] ARM: Cleanup following bitops improvements
Date: Mon,  2 Sep 2024 11:03:51 +0100
Message-Id: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 has been posted before, but is included here just so it doesn't get
lost.

Patch 2 is a bugfix found by code inspection.

Patches 3 and 4 switch to a more efficient form.

Andrew Cooper (4):
  ARM/div: Drop __div64_fls()
  ARM/vgic: Correct the expression for lr_all_full()
  ARM/vgic: Use for_each_set_bit() in gic_find_unused_lr()
  ARM/vgic: Use for_each_set_bit() in vgic-mmio*

 xen/arch/arm/gic-vgic.c          | 15 +++++++------
 xen/arch/arm/include/asm/div64.h | 18 +++-------------
 xen/arch/arm/vgic/vgic-mmio-v2.c |  3 +--
 xen/arch/arm/vgic/vgic-mmio.c    | 36 +++++++++++++++++++++-----------
 4 files changed, 35 insertions(+), 37 deletions(-)

-- 
2.39.2


