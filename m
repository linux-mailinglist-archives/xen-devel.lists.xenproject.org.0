Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF2F56BE43
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 18:38:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363605.594253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9r00-0001rj-0Y; Fri, 08 Jul 2022 16:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363605.594253; Fri, 08 Jul 2022 16:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qzz-0001pV-RK; Fri, 08 Jul 2022 16:38:35 +0000
Received: by outflank-mailman (input) for mailman id 363605;
 Fri, 08 Jul 2022 16:38:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6xB=XN=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o9qzz-0000b9-8f
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 16:38:35 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6801c354-fedc-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 18:38:34 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 15C16320098B;
 Fri,  8 Jul 2022 12:38:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 12:38:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 12:38:30 -0400 (EDT)
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
X-Inumbo-ID: 6801c354-fedc-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1657298311; x=1657384711; bh=ig8GcuWSg8QXfRSyjrDA6qxRNwqouf+sjZK
	0qbI6A6M=; b=UMimGG2Uo4lY7atREe2OP8S17UwSlHLVe/8rwvtepafcUCIerM/
	+faYLQMq+QWk2ePkEKdH0xisdPrkUY8RM9HfbybzshoqXScDXiWukeOrL8SBiC7q
	2bYf7P7djsCJm4p3x9qG9ovXkVz/nuxRmuH/JUDYCnAdC0pxNACm1AAb33Z9rpEt
	uFcN0NbUHA2r7MLfrnH7a/qwob9ehzd/2Wh/ETUf0iH2lWlBpIMGjq7IiY046E80
	OgNKBOHEZE63eLhNRPmXdYjbGVAnVYvjarOgO6Jg83zGr23/yK4kAfsCaiwfMnTm
	zBpmMftHJCm+TP4J8BoN0zlc3y0JpPN4JjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657298311; x=1657384711; bh=ig8GcuWSg8QXf
	RSyjrDA6qxRNwqouf+sjZK0qbI6A6M=; b=KW6PkF5vTTfz/RditvRVGIbRHVSo2
	hJGbgtx3KXGhhsTRKqRnP+nWRgfxd79rqg4T3AXAnxqw7p1zunuMAGmkTZ6PKogF
	z2phKIH8YtcZMqizRwy9TqWcgctfhiWX5BVG6uGylSxM1xEjlVAsePMbGRviqOtY
	QMm6JSAdF9T3DPgMO8DKwAWm/1RIAf4qaFx3ql+dXq97Uaas+PJws0B+Rl56YoAo
	4t9O60v4OzSZ6uH0x4zdd1gNwEI163U1noKNYLtsb7lK8BcNDDwThumvP2n3uGVm
	hh/TH9YT+otbypQrg35LjestKqW97vZdxb36ixcW3O+eKJK0OaYMD1gxg==
X-ME-Sender: <xms:h13IYlkZo5GnC2WvdKmHsEjNptuGF-SpEJzmi4oSoUyhFzxwsKZfTw>
    <xme:h13IYg3dOV9RAJpF_78-yqdxzjZR55vyxPGvMkH3VtJt47ugXnqXUybQ5ZK-gLixM
    I1m74fmCOYXvag>
X-ME-Received: <xmr:h13IYrokmY0DSQPpmJxkfsEquT0kEyEopni4PkLaKeZNa3Yi9jNm4NON-1U6EQ_0S3u5Rd1NObNb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:h13IYlkrj02rP4jMkZm5le5MmptIdM-p5y-JJ5ci7XbJx1jazhpOZw>
    <xmx:h13IYj0vNwemVvGP3w-aR0JLgBgaFckoKV4_DojhDqZX7UIY6Q3wrQ>
    <xmx:h13IYkuHEprtn_-TofDB6ubbUG5RFvheNUR4q7ujIVMrqY4zXF-XzQ>
    <xmx:h13IYtqGXcjCdkBPS5oaHL-zzIlyKd84UaF8K03-JH2n2Bi2VKkC_w>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Linux kernel regressions <regressions@lists.linux.dev>,
	stable@vger.kernel.org,
	Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: [PATCH 4.14] Ignore failure to unmap -1
Date: Fri,  8 Jul 2022 12:37:46 -0400
Message-Id: <20220708163750.2005-3-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708163750.2005-1-demi@invisiblethingslab.com>
References: <20220708163750.2005-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error paths of gntdev_mmap() can call unmap_grant_pages() even
though not all of the pages have been successfully mapped.  This will
trigger the WARN_ON()s in __unmap_grant_pages_done().  The number of
warnings can be very large; I have observed thousands of lines of
warnings in the systemd journal.

Avoid this problem by only warning on unmapping failure if the handle
being unmapped is not -1.  The handle field of any page that was not
successfully mapped will be -1, so this catches all cases wherr
unmapping can legitimately fail.

Suggested-by: Juergen Gross <jgross@suse.com>
Cc: stable@vger.kernel.org
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Fixes: 2fe26a9a7048 ("xen/gntdev: Avoid blocking in unmap_grant_pages()")
---
 drivers/xen/gntdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 2827015604fbaa45f0ca60c342bbf71ce4132dec..799173755b785e2f3e2483855f75af1eba8e9373 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -393,7 +393,8 @@ static void __unmap_grant_pages_done(int result,
 	unsigned int offset = data->unmap_ops - map->unmap_ops;
 
 	for (i = 0; i < data->count; i++) {
-		WARN_ON(map->unmap_ops[offset+i].status);
+		WARN_ON(map->unmap_ops[offset+i].status &&
+			map->unmap_ops[offset+i].handle != -1);
 		pr_debug("unmap handle=%d st=%d\n",
 			map->unmap_ops[offset+i].handle,
 			map->unmap_ops[offset+i].status);
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

