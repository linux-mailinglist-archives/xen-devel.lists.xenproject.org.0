Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEEF58F8D0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 10:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383711.619623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3CE-0006FN-H5; Thu, 11 Aug 2022 08:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383711.619623; Thu, 11 Aug 2022 08:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3CD-0005wT-Po; Thu, 11 Aug 2022 08:05:37 +0000
Received: by outflank-mailman (input) for mailman id 383711;
 Wed, 10 Aug 2022 15:51:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIlE=YO=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1oLnzr-00016w-KA
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 15:51:51 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59340c41-18c4-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 17:51:51 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 186-20020a1c02c3000000b003a34ac64bdfso1222800wmc.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 08:51:51 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.126.24.threembb.co.uk.
 [188.28.126.24]) by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b003a342933727sm3004519wmb.3.2022.08.10.08.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:51:50 -0700 (PDT)
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
X-Inumbo-ID: 59340c41-18c4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=KeuLRkJHac7T18EvJz7V2qjxDYwlB1JNeLqOJx59kSU=;
        b=NwaYFZmlXQkYLPFX3ZTPko8HcLgEHLwlrcyFvHq9hm7vQV2IwxrttH0/p8/BnnmZQl
         BTO0b3I01yD4gVwVuca1h/jbv+Cfysmr/pwkJd2AgCZmA4nNJaqDDMtHbPuEcJweTVo2
         579S6P3KHIkfq4qhjgykgSQx3GEN7jkMGKOWCq1fqwahARcWVFoKAElwF2/ur8B6ClIo
         4VUYL64JbAwxyO16ryqLgQ35TM4VOjpGgJE30dWaAoTd8zwN9ejtzD9yLFz3cxaGQo9r
         I+xFxR/ul8X0T8pEmed+ACyAEzgpzPI6KoqWeaF80317jz0w1JJi3GWEirlZLAj1Zjjz
         DcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=KeuLRkJHac7T18EvJz7V2qjxDYwlB1JNeLqOJx59kSU=;
        b=u/Jrh0sBT780/L3Zu3KiTav3P/a5x4g4mEpqGuwdVeCdIsG04IB6tPO0Ec+hQB3Sbg
         brDxP3y8OXV70ZR1bD04+c2jObcRXwIlGoFnhB8kneooDTCUVUa6Nxbir0hBBUzZk1pY
         MgtuP+Tpw5Q2j0+tlGPrVUM2PCjT11BTMzvPolIzQFUaArMxnvbctbh1QFm7tSGl9lmc
         H4CxNp9egwW5V+5P1SW1KpH8eyjzKhuncyjGQ/brNIDenV2JUISrPJZufHM2tuY1R/zZ
         QwKVgE9c8tlF+GaggjdPBOGlBCLFkQauRuUleGuWvpfgiXp0Jw9MyJ9Mwg2pKQkkQZrZ
         aFyw==
X-Gm-Message-State: ACgBeo0TuqNA424/8aNu+Airqp7Brmh0JQdB8w99EO96SMgy54rO2Dfs
	QgaIeJEeaOePRmXW0yg0Ngk=
X-Google-Smtp-Source: AA6agR6Ld0dgt8VkL4NPznZl6LE5uIBV6RhDIhjeXAmILYOIjoMjQERHnQMZ5pvfGHOhFOpmDqlmgQ==
X-Received: by 2002:a7b:c852:0:b0:3a5:407a:76df with SMTP id c18-20020a7bc852000000b003a5407a76dfmr2851591wml.101.1660146710481;
        Wed, 10 Aug 2022 08:51:50 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@fb.com,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [RFC net-next io_uring 10/11] io_uring/notif: mark notifs with UARGFL_CALLER_PINNED
Date: Wed, 10 Aug 2022 16:49:18 +0100
Message-Id: <19cad183acc3a44b17b76c1719ad30c80aeff1ef.1660124059.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <cover.1660124059.git.asml.silence@gmail.com>
References: <cover.1660124059.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We always keep references to active notifications and drop them only
when we flush, so they're always pinned during sock_sendmsg() and we can
add UARGFL_CALLER_PINNED.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/notif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/notif.c b/io_uring/notif.c
index 5661681b3b44..dd346ea67580 100644
--- a/io_uring/notif.c
+++ b/io_uring/notif.c
@@ -66,7 +66,7 @@ struct io_kiocb *io_alloc_notif(struct io_ring_ctx *ctx,
 	nd = io_notif_to_data(notif);
 	nd->account_pages = 0;
 	nd->uarg.skb_flags = SKBFL_ZEROCOPY_FRAG | SKBFL_DONT_ORPHAN;
-	nd->uarg.flags = 0;
+	nd->uarg.flags = UARGFL_CALLER_PINNED;
 	nd->uarg.callback = io_uring_tx_zerocopy_callback;
 	/* master ref owned by io_notif_slot, will be dropped on flush */
 	refcount_set(&nd->uarg.refcnt, 1);
-- 
2.37.0


