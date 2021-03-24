Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1068E347A78
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 15:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101006.192863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP4Ko-0001FD-SK; Wed, 24 Mar 2021 14:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101006.192863; Wed, 24 Mar 2021 14:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP4Ko-0001Eo-Ov; Wed, 24 Mar 2021 14:18:10 +0000
Received: by outflank-mailman (input) for mailman id 101006;
 Wed, 24 Mar 2021 13:28:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8uro=IW=gmail.com=unixbhaskar@srs-us1.protection.inumbo.net>)
 id 1lP3Z9-0004SL-EM
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 13:28:55 +0000
Received: from mail-qk1-x734.google.com (unknown [2607:f8b0:4864:20::734])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c808549-f3bf-4382-83eb-b18b74097656;
 Wed, 24 Mar 2021 13:28:54 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id y18so17922405qky.11
 for <xen-devel@lists.xenproject.org>; Wed, 24 Mar 2021 06:28:54 -0700 (PDT)
Received: from Slackware.localdomain ([156.146.36.138])
 by smtp.gmail.com with ESMTPSA id k138sm1620627qke.60.2021.03.24.06.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 06:28:53 -0700 (PDT)
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
X-Inumbo-ID: 3c808549-f3bf-4382-83eb-b18b74097656
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZA4TMh4IQBJtlxJtgRg6PC7dBsn/y/DHlKXiLg69OBw=;
        b=vIAeFill0cXse/9RJBHavhpguN7xSunFa2f+v2bdmqARM2G7mS5PMrrSXhVx41lH6C
         KEoxKR6UuHlDbKnwsl3p8z1F9EFzOiKeQiP6l1rb3/izBA9tTqaPzehpikrq0vZSDJqX
         4aYH5LwedhVmaeOhOF27DD4tsZ7vIEXYAtxgGiJFJze7Yym/DsuR2d8v52g6HBlbPBSJ
         Q83bXj2BXfllIoypNNVaug2C5phbhumK16MeagjM7IQ1G0/qdfuzKUrqONR+ykO933p9
         oUZtP2EDjgf8AIShCLpnSfIN1xoyKJiMYl4vIR+CYy9PfPkNg11J+z29APLScd3neX/j
         inRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZA4TMh4IQBJtlxJtgRg6PC7dBsn/y/DHlKXiLg69OBw=;
        b=Hdkg9AOg7EiP0HwZS2DF/j79ctybFdYSBXow4KcpzVP8P99zxqqJgY2DxV1DUicJL9
         KDY4UzXApQumyrZOfu+qO3INioocHlhCwq89ILOJ5U74Y6c7wo3ShrIpAHqS6cDwOU/S
         KmDRh1qPuujV0oiZjFgV8IsU7jeRuy9Y4rcdVGj44E8tUSCP4avElih5iJfjDUGsXBoO
         /tTKEo295FaODoo8JeYswJFfooKffj2Ag5OvSu5h8OFt+UaoAmSWGt15kaIL45NvZC1n
         wJoD3NjbuddjYXZEyMuRTCblFZkrQjyUfEv5BZXBmplFH16CJZuswkQQ2S9gqlK5KSCb
         yVUA==
X-Gm-Message-State: AOAM5303t7rkWMbUfYbsTuvdt3Qu8AvyYrRU2S91M45i4A8aeCwOi2Cc
	qqEarmjWTg8pxd95lHq7bbE=
X-Google-Smtp-Source: ABdhPJy2CjjpOmQpimqajsFZOrQh+V4XiC9VHO5NNVgJMDvkS8TP9WHAV0Aahm5348sd/33RwTJrfA==
X-Received: by 2002:a37:a2c2:: with SMTP id l185mr2986406qke.178.1616592534322;
        Wed, 24 Mar 2021 06:28:54 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: sstabellini@kernel.org,
	linux@armlinux.org.uk,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rdunlap@infradead.org,
	Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] ARM: xen/mm.c: A mundane typo fix
Date: Wed, 24 Mar 2021 19:00:36 +0530
Message-Id: <20210324133036.17665-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s/acrros/across/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/arm/xen/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 467fa225c3d0..be7c942c74bf 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -105,7 +105,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
 	 *	- The Linux page refers to foreign memory
 	 *	- The device doesn't support coherent DMA request
 	 *
-	 * The Linux page may be spanned acrros multiple Xen page, although
+	 * The Linux page may be spanned across multiple Xen page, although
 	 * it's not possible to have a mix of local and foreign Xen page.
 	 * Furthermore, range_straddles_page_boundary is already checking
 	 * if buffer is physically contiguous in the host RAM.
--
2.30.1


