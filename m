Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D573F61289F
	for <lists+xen-devel@lfdr.de>; Sun, 30 Oct 2022 08:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432471.685213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1op2VW-0008HG-0l; Sun, 30 Oct 2022 07:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432471.685213; Sun, 30 Oct 2022 07:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1op2VV-0008EQ-T3; Sun, 30 Oct 2022 07:13:21 +0000
Received: by outflank-mailman (input) for mailman id 432471;
 Sun, 30 Oct 2022 07:13:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/jzH=27=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1op2VU-0008Dn-Ii
 for xen-devel@lists.xenproject.org; Sun, 30 Oct 2022 07:13:20 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 529bb7ea-5822-11ed-91b5-6bf2151ebd3b;
 Sun, 30 Oct 2022 08:13:18 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D9E35C009A;
 Sun, 30 Oct 2022 03:13:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 30 Oct 2022 03:13:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Oct 2022 03:13:14 -0400 (EDT)
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
X-Inumbo-ID: 529bb7ea-5822-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1667113995; x=1667200395; bh=vJbgWUEbOHgWLPm7ppN5SvNsjatY4g8zRiC
	FyL+Xdn4=; b=IwHb1Zgz07Y3pVKscW2hU3i2Gk3zGfp/GIJEDSY1Lss/QbNU4KN
	qGzcy7D8wmGTR8+s7sXppPmh4KRx8dpUORuYucIm+RUGpnGrvt0+gnmR1ZC/PO4t
	r1aVb/4Mo027QXSmQo9QORe21bNc0Nm0KaAJh+hhnDLsvK4uMSPsHdBlWR7JuStf
	ZeEQyXf1lICQohjcILHY8OGKNOijySG8dVn/GBEBgb9YqhHVjDJOAYOiBfg8ERL6
	FWbTFQOlG9NWUoMWqT3tIAlfAqGYGUAQS3+rp/URv0HvZK1hdcSMJqZd64nmGbds
	mS+AEnn0p2dCDw3GCfwF5aiCRibL/lcexbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1667113995; x=1667200395; bh=vJbgWUEbOHgWL
	Pm7ppN5SvNsjatY4g8zRiCFyL+Xdn4=; b=YnAuvN76YQGIKkObsRtmsUAlXuVS/
	JEOrnqn5TBT4Ht3RE+VnSZ7fHsmwL6Mv6dksR5pBse1+Bs16ey+TSxk6Cp6T+z3f
	/S9/EwhDTraScgg7K8Sdsttaj50uOatQHIfEQIwaPuyGy8qmbYyol8n819AGbmm6
	H7FFwwBIHI3fVR5QXTtWi0Y8MnVj7K20kBmM9EsT86Fk/6cwDCIXsaSbKU8cJqu2
	oSV9mTnRBkZREziGyvfjR0+32O8O4CkwZWYmieWKr19jhQ6vlStL5ylxCg6neKvJ
	duBsWolhOOFGK2hTwhSRtUgDP9GA+02wZA8RUsxg3mcqZvtGm8g9G219Q==
X-ME-Sender: <xms:CyReY2hxLEv5GDzru_3jM0_L8IMuSZnhZjbzxx19z2t4qO85gzXqaw>
    <xme:CyReY3DVpfMVHtk1ZO1EXzU8tkL1pbBweI_OLejuJA0GrXkAUdsjJVuEKGmjyXlZw
    m8AxeiTPfZPJWI>
X-ME-Received: <xmr:CyReY-HY_pVboPrCGLOrIj_T_2jFucY2vDXR3_8cyG2VLCqvJbxYAU6KJlnmk9KN4tH2mR9IrRkO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdelgdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkeevkeevgedufffggfelkeduueek
    teelgfevlefhheeutdefvdfgkeelhfetgfefnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    vghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:CyReY_TpqyY7z-qjLgnlactBTBVdNMGtomxgHe6g2xqKFLxjkilLaA>
    <xmx:CyReYzyZl2zdNc_2gVFCQX8wkllfDL_aIoF5gRgCPwAt8AjBYxNSEw>
    <xmx:CyReY97CbjzVVBiPETh6z5vbGB5ehu1PfwHDJGmz8lef-hemxn79vQ>
    <xmx:CyReY6m7CfG1C9-7uwBDgdWdD66SITudXdnqA0O0SHruhmmu_0fuhw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: [PATCH 1/3] Xen/gntdev: don't ignore kernel unmapping error
Date: Sun, 30 Oct 2022 03:12:41 -0400
Message-Id: <20221030071243.1580-2-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221030071243.1580-1-demi@invisiblethingslab.com>
References: <20221030071243.1580-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Beulich <jbeulich@suse.com>

commit f28347cc66395e96712f5c2db0a302ee75bafce6 upstream.

While working on XSA-361 and its follow-ups, I failed to spot another
place where the kernel mapping part of an operation was not treated the
same as the user space part. Detect and propagate errors and add a 2nd
pr_debug().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Link: https://lore.kernel.org/r/c2513395-74dc-aea3-9192-fd265aa44e35@suse.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Co-authored-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/xen/gntdev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 54fee4087bf1078803c230ad2081aafa8415cf53..8cf9f2074c5d57bff81364d7d6a70b0007a85e44 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -407,6 +407,14 @@ static void __unmap_grant_pages_done(int result,
 			map->unmap_ops[offset+i].handle,
 			map->unmap_ops[offset+i].status);
 		map->unmap_ops[offset+i].handle = -1;
+		if (use_ptemod) {
+			WARN_ON(map->kunmap_ops[offset+i].status &&
+				map->kunmap_ops[offset+i].handle != -1);
+			pr_debug("kunmap handle=%u st=%d\n",
+				 map->kunmap_ops[offset+i].handle,
+				 map->kunmap_ops[offset+i].status);
+			map->kunmap_ops[offset+i].handle = -1;
+		}
 	}
 	/*
 	 * Decrease the live-grant counter.  This must happen after the loop to
-- 
2.38.1

