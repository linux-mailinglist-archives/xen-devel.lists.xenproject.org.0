Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A727D348505
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 00:06:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101211.193412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPCZL-0007hG-5V; Wed, 24 Mar 2021 23:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101211.193412; Wed, 24 Mar 2021 23:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPCZL-0007gu-2Q; Wed, 24 Mar 2021 23:05:43 +0000
Received: by outflank-mailman (input) for mailman id 101211;
 Wed, 24 Mar 2021 23:05:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8uro=IW=gmail.com=unixbhaskar@srs-us1.protection.inumbo.net>)
 id 1lPCZJ-0007gp-GU
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 23:05:41 +0000
Received: from mail-qt1-x82c.google.com (unknown [2607:f8b0:4864:20::82c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee4404f4-84b5-47ef-bcc3-8101b4c863fa;
 Wed, 24 Mar 2021 23:05:40 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id x9so360612qto.8
 for <xen-devel@lists.xenproject.org>; Wed, 24 Mar 2021 16:05:40 -0700 (PDT)
Received: from Slackware.localdomain ([156.146.55.193])
 by smtp.gmail.com with ESMTPSA id i14sm2469165qtq.81.2021.03.24.16.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 16:05:39 -0700 (PDT)
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
X-Inumbo-ID: ee4404f4-84b5-47ef-bcc3-8101b4c863fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v9ZgYPAV5pW+3XJfUObq1OKDOd+yO9AzIKh8BGAyxbg=;
        b=KzoKhamrTRrMxphlj7fx+9rr9/duDd3NAJV74WetzwLcxfGF3aWdxrJqDlaEjdcZv8
         OGjEIzp0SQ865SEX0+Pa960oUbKrZhLJS9+WSRLofUM6rCn1r/S23A57nfMMSG5QPxA4
         U28uMnTQ2xZTkb6DXHm6vPi9TGRanq/4ebhS99MxtVGCNVjyWMAIPnkdwte29XDHKVG5
         9gjU1dRChcSTbYXnpVmiSW+2mfVIgVsd6OxyD1BRKGAu8eaWq7HAwnaafzrlFYt7VZmn
         hF/QbXeIx8C8LB4w00jJrnhj3NhbTSGpNLbhUa8dylq7TsE8u5Eq6ylnrNfEtXJKMS3j
         g/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v9ZgYPAV5pW+3XJfUObq1OKDOd+yO9AzIKh8BGAyxbg=;
        b=YyiMpMAywjwzFyMxTosA8J3A7EX0OUyghEussVp54OJxxOaZDd2EZzyIdVHHjQBkUv
         ThMhPBDQ8xa5j5NNwYY0y6S9psEUUgLPDU4O6Ida89pfqYRkUtWlZ0bo6VTFkH6NeW04
         zduHeEaMyv05KbXbEuidJLPuBEd4U8s/ysZU018XsmhbfMCgWenL1hXFWHj12hzkCV6c
         oVAneAoVMw1h+qYmKHKQX9xS4g6nmNgfwVCBNkidJ7niFQz3VxpwoBL/3Ou6kGofyo1M
         RwCzPM2MXgidaXFN7foHQ0CSyoD2qdl1Baql19nuFBbmv/E0MN4A9HlKOhD2bStW+dio
         8Gpg==
X-Gm-Message-State: AOAM5311OWTS9dTZSGTa9zGT0AeOn+lZ08nF4OM+cUsbw5OOKCbUrFXs
	aEGszANht8CrjqHsN+88lX4=
X-Google-Smtp-Source: ABdhPJz2BebuSA40Vdzk5htYesmp/PuEjJIxloaJ2qKs7iFRMQWVilb2ccB524lYZyZ9FyJ9LxGEQg==
X-Received: by 2002:ac8:777c:: with SMTP id h28mr5133646qtu.63.1616627140346;
        Wed, 24 Mar 2021 16:05:40 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: sstabellini@kernel.org,
	linux@armlinux.org.uk,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rdunlap@infradead.org,
	Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH V2] ARM: xen/mm.c: A mundane typo fix
Date: Thu, 25 Mar 2021 10:05:26 +0530
Message-Id: <20210325043526.16289-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s/acrros/across/

Plus some words need prural version...so did it.(page->pages)

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Changes from V1:
  Randy's findings incorporated.

 arch/arm/xen/mm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 467fa225c3d0..8596dd32dcd5 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -105,8 +105,8 @@ bool xen_arch_need_swiotlb(struct device *dev,
 	 *	- The Linux page refers to foreign memory
 	 *	- The device doesn't support coherent DMA request
 	 *
-	 * The Linux page may be spanned acrros multiple Xen page, although
-	 * it's not possible to have a mix of local and foreign Xen page.
+	 * The Linux page may be spanned across multiple Xen pages, although
+	 * it's not possible to have a mix of local and foreign Xen pages.
 	 * Furthermore, range_straddles_page_boundary is already checking
 	 * if buffer is physically contiguous in the host RAM.
 	 *
--
2.30.1


