Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7B0674204
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 20:04:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481275.746047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIaCv-0002HU-Tz; Thu, 19 Jan 2023 19:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481275.746047; Thu, 19 Jan 2023 19:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIaCv-0002F1-Qy; Thu, 19 Jan 2023 19:04:17 +0000
Received: by outflank-mailman (input) for mailman id 481275;
 Thu, 19 Jan 2023 19:04:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tmj6=5Q=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pIaCu-0002Ev-3p
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 19:04:16 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e529f3a-982c-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 20:04:11 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2CAD05C0164;
 Thu, 19 Jan 2023 14:04:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 19 Jan 2023 14:04:10 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 14:04:09 -0500 (EST)
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
X-Inumbo-ID: 0e529f3a-982c-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1674155050; x=1674241450; bh=DWSmhiY53c1fCxHo8+QDF152rmPtSJZJfbo
	sjDMfwaA=; b=mIINDxvzEWW1TOvsfQmK1217TTk1+rcauO+ev2im7SruFDL9Z+x
	I55qi7LfuGXU580EJe6mvU4RT7u0J3pg94ZMtAuJIISKsDjBgGYHm/1qUR0H4mpD
	WM4Jwzgadwn5ZNCtd7cLSP4GryJwgDS5tcqiZ2WuF0VFHlEmP0H12XXwgw/bA2VM
	D+ORqlOnF1PXQlBxQpvla9356m5aUhMW3cuir7ViyU9szXwO4+XtoqBT5aEiz5Z7
	ql0MnXUoqLcmdaq7T/SdfozkryrUH03Gdwqm8AVPB3xW7HVRnQ1y36b9h4dUJvWi
	8I5N/bGK0y223R25ysBur+t/EufqWCdd5Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1674155050; x=1674241450; bh=DWSmhiY53c1fC
	xHo8+QDF152rmPtSJZJfbosjDMfwaA=; b=UoYj+qtsnWGUKKUdT4zCotFPuyjZs
	ve1NZ2BaZwMeJ+xH9VClymTkxYMPmU8X6ky3uNjs14U7UyKqCuY0gNGW2nslmRFU
	JUOc0SzGRsxNmQZaJICDHvnanyJeSIJyq4qJkHvlVH3rsKnzOV1ip8oWbCSaK/G8
	ZY9p2YKLdoisEOPKoIY3YBttNmwp4onjcG0Dc/YQgOE8g5iwuzNH4KQRhZ8Ndq46
	AQQxtVI952u5yMcNOzkWIpTc5U6zwE7GrpHabea+8R2Jb14xo/lgRPS8yRNckDYK
	xqsdEcZAaBe7PJvXkRN6eOLjM/CMAUiJKFHP4rsN0Aq6KfFvwaO0XFURQ==
X-ME-Sender: <xms:KZTJY5kxRBbHsi58SSGXG0thzHypBrE0ywzVyRgSh8rhyiH1g3VK-Q>
    <xme:KZTJY02wmm7OwC6JqVT4x2pEI4Ek4GZ_RtIfkFVT9Ul4nJWPrkyIHH2DV1qStLBgB
    vFQ4VZUBhJmX9k>
X-ME-Received: <xmr:KZTJY_qWnlZnCAO0qq42vjpQRJ6z44snfew9zof9wJiNHQBaEyRhIAAcj6RftpriZbTjj9YNVRJD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddutddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:KZTJY5lQhpx0TLu1FIedmKRxrwKBKNsirPTu2rgwc81AdXdowggaqg>
    <xmx:KZTJY32L6Yg4VlAjM-EBSUH6sB3f_BMV-kTrynK3dmsKf0fx3Dgh9Q>
    <xmx:KZTJY4tO5ZxrmnCj9Or9SivEJ5tQP29NyVj_9NIaj9B3vSUHZDyRhg>
    <xmx:KpTJYxovdbTDQlMID3b5Xe01VE9uVnvHDQo-ibZJhp2YeqNeyiGVzQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/5] efi: Support ESRT under Xen
Date: Thu, 19 Jan 2023 14:03:55 -0500
Message-Id: <b18879e0329c785d35f2aa2164413bb56419c684.1674153153.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20221003112625.972646-1-ardb@kernel.org>
References: <20221003112625.972646-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes handling of EFI tables when running under Xen.
These fixes allow the ESRT to be loaded when running paravirtualized in
dom0, making the use of EFI capsule updates possible.

Demi Marie Obenour (5):
  efi: memmap: Disregard bogus entries instead of returning them
  efi: xen: Implement memory descriptor lookup based on hypercall
  efi: Apply allowlist to EFI configuration tables when running under
    Xen
  efi: Actually enable the ESRT under Xen
  efi: Warn if trying to reserve memory under Xen

 drivers/firmware/efi/efi.c  | 22 ++++++++++++-
 drivers/firmware/efi/esrt.c | 15 +++------
 drivers/xen/efi.c           | 61 +++++++++++++++++++++++++++++++++++++
 include/linux/efi.h         |  3 ++
 4 files changed, 90 insertions(+), 11 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

