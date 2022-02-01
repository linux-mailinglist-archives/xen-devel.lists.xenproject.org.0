Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F97B4A6152
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 17:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263631.456425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEvy0-0005Lp-8N; Tue, 01 Feb 2022 16:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263631.456425; Tue, 01 Feb 2022 16:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEvy0-0005LJ-2X; Tue, 01 Feb 2022 16:25:16 +0000
Received: by outflank-mailman (input) for mailman id 263631;
 Tue, 01 Feb 2022 16:25:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=scQ7=SQ=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nEvxx-0005Kx-R9
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 16:25:14 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86e4b828-837b-11ec-8f75-fffcc8bd4f1a;
 Tue, 01 Feb 2022 17:25:11 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id u14so34939759lfo.11
 for <xen-devel@lists.xenproject.org>; Tue, 01 Feb 2022 08:25:11 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id z20sm2037887ljn.92.2022.02.01.08.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 08:25:09 -0800 (PST)
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
X-Inumbo-ID: 86e4b828-837b-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z8QBBgxgg9jgM5JlU/AFTcZzdzBI1+RHxwbZNGkSfGo=;
        b=HHoWplrH2/O/gS5JyrlfY6uF2nC+pDWqd0ZCSbiL2yHExvT3dYcp/oz90ASFwPv/eN
         L8WalXDH+Xog521RaTmxFLe5bVcmtp6BsGLL96m+uGRC5x6bNzrhbBiKKcbA9xt+1/hb
         anpF04WjrdAx5vUFpQhjHqKqNO7Kt2csUaki8Hyk1tUI8lfOwLDoQjUSQeNEWr7Nq7Fe
         70pcC0l+o/nu+HZNX/u7dxDKOjlq1Dh3mRQ8CC15g8fesrg8jCDs+bodVlJd/oV/ulDi
         EjPhEs7c55MVw29NFAeDgK8OQJVdeJa3CW+nGHpFgF8DaYmmTid3oMy2mikTjnyUnPH+
         Av9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z8QBBgxgg9jgM5JlU/AFTcZzdzBI1+RHxwbZNGkSfGo=;
        b=4z3UpNFuGXikEi8Al8P+vBn6jqAMOcp7bDY0c16AVsbNtWzYBzNJ8DnVUkiczKonEo
         ZTv37aa+xeprPL/dvyxlhIIohoy+LOvuP6gE46MiI4GzYdjOVsxsTckyJ8hvVYzckeKv
         u8C8KsF6/C5MfMMUED/XYCQCbYRYYXSBXDRYPXvjESvgznGBUqDe43mcV65dj0/pOyJx
         Iny3m2DQAJPJ3XleeQfTXGHMaqOZHKD0TvKovGRD/2+TALA57pN42pnClmrhDnlDprqc
         kk/h7jQBwa4ok0NTHFEgGFsqwTZMMptOYXsDf4TRtF5kDm9sSqnopOBbR/5bZYVSIvpE
         zOCg==
X-Gm-Message-State: AOAM533YcXumJ1KnFvwAYoG5wBgeeCdhiT+MKNwkblRc4X2R2QYXBvfd
	r4oDszrK+0t8tmRFvvEf6OozOtbSU3g=
X-Google-Smtp-Source: ABdhPJwWYeejKik/e10L3fDwQBEbCw1OKIZ2T71/9ruvwRRi087u1uu4sUMq3x/b1X0MFIyTZZ/gbA==
X-Received: by 2002:a05:6512:32c5:: with SMTP id f5mr14848277lfg.361.1643732710909;
        Tue, 01 Feb 2022 08:25:10 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 0/4] PCI devices passthrough pre-req patches
Date: Tue,  1 Feb 2022 18:25:04 +0200
Message-Id: <20220201162508.417008-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Hi, all!

While working on vPCI series [1] I have created number of patches that
either add some useful helpers or serve as the ground for the upcoming
vPCI changes or both.

To ease the task of reviewing the bigger vPCI series I am sending these
now with the hope they can be accepted.

I would like to thank Roger and Jan for providing valuable comments and
ideas, some of which have materialized here.

Thank you,
Oleksandr

[1] https://patchwork.kernel.org/project/xen-devel/list/?series=585781

Oleksandr Andrushchenko (3):
  rangeset: add RANGESETF_no_print flag
  rangeset: add rangeset_reset helper function
  vpci: shrink critical section in vpci_{read/write}

Roger Pau Monne (1):
  vpci: move lock outside of struct vpci

 tools/tests/vpci/emul.h       |  5 ++-
 tools/tests/vpci/main.c       |  4 +--
 xen/arch/x86/hvm/vmsi.c       |  8 ++---
 xen/common/rangeset.c         | 11 +++++-
 xen/drivers/passthrough/pci.c |  1 +
 xen/drivers/vpci/header.c     | 21 ++++++++----
 xen/drivers/vpci/msi.c        | 11 ++++--
 xen/drivers/vpci/msix.c       |  8 ++---
 xen/drivers/vpci/vpci.c       | 64 ++++++++++++++++++++++-------------
 xen/include/xen/pci.h         |  1 +
 xen/include/xen/rangeset.h    |  8 +++--
 xen/include/xen/vpci.h        |  3 +-
 12 files changed, 94 insertions(+), 51 deletions(-)

-- 
2.25.1


