Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3CB8AAC62
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 12:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708907.1108091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxl6D-0002OA-UY; Fri, 19 Apr 2024 10:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708907.1108091; Fri, 19 Apr 2024 10:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxl6D-0002Md-Qt; Fri, 19 Apr 2024 10:04:05 +0000
Received: by outflank-mailman (input) for mailman id 708907;
 Fri, 19 Apr 2024 10:04:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3Bi=LY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rxl6C-0002MX-NB
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:04:04 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2649d7f3-fe34-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 12:04:03 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-78f05b62602so116668285a.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:04:03 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 w9-20020a0ca809000000b00696b1050be8sm288969qva.133.2024.04.19.03.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 03:04:01 -0700 (PDT)
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
X-Inumbo-ID: 2649d7f3-fe34-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713521042; x=1714125842; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mKR8cD63qoJZQ2BlFIfk3IKhRffUhy1uBSc8G+xLNrY=;
        b=Wz+hNLtbAYoXrNWkPa/gs3K/aNk1pOLEQzUq9riPLTOlupyS/JfOr3PbStg4Jl31r0
         Ryt7ICj0cqO7bqNbe2uySrHkxqjU77BB06+xuak9n/BQmxEBjHktShPcLjbFAiuELo9t
         CkgHaVVmrDcy5TQWCcTaZpTsItHvyChXGa/1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713521042; x=1714125842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKR8cD63qoJZQ2BlFIfk3IKhRffUhy1uBSc8G+xLNrY=;
        b=nspukc7xXJauhXmc2PNIVDgnrW7uvjxkLUj2cVme/wh+dSDvYGwfOFj2LFDPZ8cPzW
         pIsI6p/UwNjjHBcqxF8e6dcDfcYHK1lFc4B2sWb1uGHC8yhFfZWFh2pyJUubkmaOo5Xl
         W2wzhtH9AacjtApzKkZHrOLiAvVX8zclD4qerfqoyg22eB+2GuLB0Hny2lDABzBMU9VG
         eMLCA7ii3kvH3Xf9QOMC12pPzrSaEciWm3kmtCJPiPOWcWLaLtbqA8ftae+4vnUqjgaZ
         NA3sUNENmbOSll0am6gnxkV0Y9nYrWn3+UwVGJ7sWI/VS+mSvMFDGkjxOsRyNXwC0ds3
         378g==
X-Gm-Message-State: AOJu0Yx9LSLlHNuxcNNmf7oyvkvKb/o9IfeHwSkkpAcvIT9V8/aKtbgC
	qnrxPsiZiMoZDCtLQMx1X4/B3wNKdb/YGZT6a7N58qKbaBGrhGjMEHSpOitJgTJgEpaOxSMGw+b
	8
X-Google-Smtp-Source: AGHT+IHoZSUtBF4XySFdFmRGgBEIIoe46yNDThrp671ATKBmWOtenwJw8XPhjju4pvSTrIlWpaz/6w==
X-Received: by 2002:ad4:504f:0:b0:6a0:556e:3b09 with SMTP id m15-20020ad4504f000000b006a0556e3b09mr1656297qvq.23.1713521041858;
        Fri, 19 Apr 2024 03:04:01 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 0/2] livepatch: make symbol resolution more robust
Date: Fri, 19 Apr 2024 12:02:15 +0200
Message-ID: <20240419100217.12072-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Previously a single patch, now with a pre-patch to place the init
section markers into a common file.

Thanks, Roger.

Roger Pau Monne (2):
  xen: introduce header file with section related symbols
  livepatch: refuse to resolve symbols that belong to init sections

 xen/arch/arm/mmu/setup.c   |  3 +--
 xen/arch/x86/setup.c       |  3 +--
 xen/common/livepatch_elf.c | 16 ++++++++++++++++
 xen/include/xen/sections.h | 17 +++++++++++++++++
 4 files changed, 35 insertions(+), 4 deletions(-)
 create mode 100644 xen/include/xen/sections.h

-- 
2.44.0


