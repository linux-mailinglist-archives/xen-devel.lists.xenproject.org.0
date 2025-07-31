Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC5BB17010
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 13:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065420.1430777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhR3V-0000F9-KS; Thu, 31 Jul 2025 11:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065420.1430777; Thu, 31 Jul 2025 11:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhR3V-0000D6-Gd; Thu, 31 Jul 2025 11:02:37 +0000
Received: by outflank-mailman (input) for mailman id 1065420;
 Thu, 31 Jul 2025 11:02:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8WGx=2M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uhR3T-0000Cq-Bt
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 11:02:35 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc98e4e6-6dfd-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 13:02:34 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so2988035e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 04:02:34 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589edfd950sm22600885e9.14.2025.07.31.04.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 04:02:33 -0700 (PDT)
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
X-Inumbo-ID: dc98e4e6-6dfd-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753959754; x=1754564554; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ws5puNl5/EV89RyJq9SU92MYaGfnQKFxeEbFl7bewdA=;
        b=bI9Tkx/L4g+Lz7wtBYP+KSRSfPOK2ocAPyhDfHJ4NxLpg/NqEeJC2UcbyOHNM8/jMu
         cz/YDuqbLp0xdpdnFZI289wRfL33DLCPYRKR1Gf/lz6FaBVGMeun1kwmhd5OrcyWUYOl
         GrEZWN6xzZsKZnaNwMOorn5zo9HVXrbosBrOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753959754; x=1754564554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ws5puNl5/EV89RyJq9SU92MYaGfnQKFxeEbFl7bewdA=;
        b=ronc7PfB9zFnDVOAIKcxmrt/2pk1dq8FGzCS3motaZGABGkrN8BOvqkyx32AgN0Qhc
         3dqVtmqkTENzArQvXFLQSJl3SJIYdxZsalCdUxaGN2rAjFA5YYvGzDTQafCJn3nhrwJ2
         HxJiRp4acQWB/Ct9o9iyhpgjjsmrW30iu5NMUXt2mjUGLlPWNIUqLNFu4gFCYEubt7bd
         aCbccri7029LQj0zJIAivu8N+6t9OxKDlDyav2IonN/MrhQSIq+XKrkA7WcUUOcr4YIH
         JE8hISFvU0ovKtnd70H7UT/ZotahJV9P7BN1S1BRI44KXhsvteyMH9wWs04Zdd14XCNe
         RgqA==
X-Gm-Message-State: AOJu0YzRAl3uBB/l5FZ7j1g2b8cMqZ3GFyHg4UW/B40e9hif14W4y1zA
	WG62PglhB7e5ckHPO/PKId47Kb4aC7fuUrErxXBTj1P5B2empb5sqOX3QLGVjF8Fu2ApVPOalGq
	iT50Ob1s=
X-Gm-Gg: ASbGnctWE8ckB69ZXx0GXvzzn9I9oM6NjmDGQbnFMBuaTavJKD4zMOJyXsGsUpS3Qhh
	ZxkV9cEVPl6Eft5APlsmgX6sEEC6q6FBuq8fN2axEWI4V7m3vG5CtyTzE+g9AERfEb8cFG5OUj4
	WJotlIK31XMZHnfTwZVbbXBai3Le2S9a8PlGmGh5i8AbN01bzC1mKcBvvABM1cmiDLthchGG6GP
	bN7syiZuc4ClG/C5TLCYKNkFCz57XGemwyKZUCZNIblzfrEYUbwLFxve8vMx6jxDhvgCpVOZumI
	H8QRzB0Xq1ceiGL/waDKUwzVYq9UwKeoq5rSpb1uEN7mDr80Sf7Yn3jPZBsHwJpRdOlDU2Zl0b6
	cZihFmBR1DHuItAxgbpAklyKCdJJARGTB597Y9Y38YIoCr5rFUtPf7MZ/GbfNAKvXlZibSHjBKe
	rC
X-Google-Smtp-Source: AGHT+IEZXifj6KgEX5RUpxUnM1TPb0bDvVH346EgaV4jYfiXy1ladEwzK+rWiHdcRusZozi7HdDl5Q==
X-Received: by 2002:a05:600c:8b83:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-45892bbf78cmr77053615e9.18.1753959753816;
        Thu, 31 Jul 2025 04:02:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 0/2] xen/version: Improvements to buildid handling
Date: Thu, 31 Jul 2025 12:02:29 +0100
Message-Id: <20250731110231.3551636-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mostly for patch 2.

Andrew Cooper (2):
  xen/version: Fold print_build_id() into print_version()
  xen/version: Remove xen_build_id() and export the variable instead

 xen/common/kernel.c        | 14 ++++----------
 xen/common/keyhandler.c    |  1 -
 xen/common/livepatch.c     | 23 ++++++++++-------------
 xen/common/version.c       | 34 ++++++++--------------------------
 xen/drivers/char/console.c |  7 +++----
 xen/include/xen/lib.h      |  1 -
 xen/include/xen/version.h  |  4 +++-
 7 files changed, 28 insertions(+), 56 deletions(-)

-- 
2.39.5


