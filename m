Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1371458F8D3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 10:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383693.619552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3C8-0004fG-TK; Thu, 11 Aug 2022 08:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383693.619552; Thu, 11 Aug 2022 08:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3C8-0004Yj-LJ; Thu, 11 Aug 2022 08:05:32 +0000
Received: by outflank-mailman (input) for mailman id 383693;
 Wed, 10 Aug 2022 15:51:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIlE=YO=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1oLnzf-00016w-62
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 15:51:39 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5186db06-18c4-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 17:51:38 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id l22so18237621wrz.7
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 08:51:38 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.126.24.threembb.co.uk.
 [188.28.126.24]) by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b003a342933727sm3004519wmb.3.2022.08.10.08.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:51:37 -0700 (PDT)
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
X-Inumbo-ID: 5186db06-18c4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=mveucMTZdZPLlN4D5K1kqfZw5UNWDwp9Ns7O7VRFK+I=;
        b=FeHdakLvXxtWgjpPF+aflE98THue/ZKUpEuSPYY/vwKS6pLky2/FycS8L1DaAOP7p2
         gbmwq+ySuj1nbkojJhrktc86MeoeDdNZHmrmEXeui4TvX9dWZtL5o1pn/n2SFPu2UKqJ
         LwG8Bt1+6Z9HVd12TbOjrwFHHO7Xbx+0NZ4knAvVP00VnvWpTA1vdoX8qFWZUEU1a0Hc
         WTzV9hRGh/acAWBr/K4D/fYN2WXLMaChMzaEobWBKN01dp0GD77rhc2rXo7Zw1Rse8vI
         EoYL8E2KpOU5sN0NjoXacILSTjNTJslWSxRKaYX/is4eawuPkbRaWRlUK6vsWA5Q252i
         fHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=mveucMTZdZPLlN4D5K1kqfZw5UNWDwp9Ns7O7VRFK+I=;
        b=EeFksYZ35i1qaPE28k27EygXi9Hk0amzquZl8wc9o0iOIXgXQymyoA3wd+YBcLMyCf
         LYoU+9zv7noUhKgoy3FbGRcTuPHbmb5jb5tZPpA3AQsfuXVndYoG6y8JQT0RhCrWZ5a5
         M7rA4cCtB6pqxqawNGTeqwXoHFOHjLciPLpaFkPdRFZktgDdZ7LRMlz/SpBp3VF0/jOk
         pg7p+O0EqXrSBWakpb8YROAsDOBAg/lWE250apcV5bqE1tys6fDxcPeX3ymuC6ldA8nX
         Peuez7rvbi2ckMGCeJJlMSLBUxgHzBmAHmdAZONLF7I/TxY2wr8neuXvhyEk+PBSThDF
         IA6g==
X-Gm-Message-State: ACgBeo1uwcLFx4gJmOQQ6iZaaN7fa7NAcz4iKUAojh38mEv6czDFFrcB
	WD4azZs9gnduOGFLdkZ9DQY=
X-Google-Smtp-Source: AA6agR6IVj+Term37QFPdVaJx8duP8zGzs+p0efJL76vLIQCk5ivpP0E95/E2mMnqsqquEDgBKZAtg==
X-Received: by 2002:a05:6000:3c6:b0:220:5efd:423c with SMTP id b6-20020a05600003c600b002205efd423cmr18135634wrg.214.1660146697602;
        Wed, 10 Aug 2022 08:51:37 -0700 (PDT)
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
Subject: [RFC net-next io_uring 01/11] net: introduce struct ubuf_info_msgzc
Date: Wed, 10 Aug 2022 16:49:09 +0100
Message-Id: <d43f3ed1cb75c5572c1fc3bb32f2bb47c682da93.1660124059.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <cover.1660124059.git.asml.silence@gmail.com>
References: <cover.1660124059.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're going to split struct ubuf_info and leave there only
mandatory fields. Users are free to extend it. Add struct
ubuf_info_msgzc, which will be an extended version for MSG_ZEROCOPY and
some other users. It duplicates of struct ubuf_info for now and will be
removed in a couple of patches.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/skbuff.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index ca8afa382bf2..f8ac3678dab8 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -554,7 +554,28 @@ struct ubuf_info {
 	} mmp;
 };
 
+struct ubuf_info_msgzc {
+	struct ubuf_info ubuf;
+
+	union {
+		struct {
+			unsigned long desc;
+			void *ctx;
+		};
+		struct {
+			u32 id;
+			u16 len;
+			u16 zerocopy:1;
+			u32 bytelen;
+		};
+	};
+
+	struct mmpin mmp;
+};
+
 #define skb_uarg(SKB)	((struct ubuf_info *)(skb_shinfo(SKB)->destructor_arg))
+#define uarg_to_msgzc(ubuf_ptr)	container_of((ubuf_ptr), struct ubuf_info_msgzc, \
+					     ubuf)
 
 int mm_account_pinned_pages(struct mmpin *mmp, size_t size);
 void mm_unaccount_pinned_pages(struct mmpin *mmp);
-- 
2.37.0


