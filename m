Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05B58F8D2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 10:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383692.619541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3C8-0004YT-F2; Thu, 11 Aug 2022 08:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383692.619541; Thu, 11 Aug 2022 08:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM3C8-0004VI-CM; Thu, 11 Aug 2022 08:05:32 +0000
Received: by outflank-mailman (input) for mailman id 383692;
 Wed, 10 Aug 2022 15:51:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIlE=YO=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1oLnze-00016q-5Z
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 15:51:38 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 509c43d0-18c4-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 17:51:36 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id bv3so18211431wrb.5
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 08:51:36 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.126.24.threembb.co.uk.
 [188.28.126.24]) by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b003a342933727sm3004519wmb.3.2022.08.10.08.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:51:35 -0700 (PDT)
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
X-Inumbo-ID: 509c43d0-18c4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=eLUXa/7f03mrrlxRZvP1+mfNlm5ZK61/IOpf+UOnfpA=;
        b=WqSg1M4LPvRvE7ifojxAgf7wRBU1icJ6/c02Okmzy1I7MNcWnJciMvgd9E29H25H4Q
         hOSe7+Md7Co6t5MC+3/kIvdRVkg5NK+48WzlsJpoKmlT00h4hLNZDfBAFl5jNzjUkw2L
         tDwbjfZBV458pAPRzXjVRiCGwRDFyQTytaD+8YF9Tuc0TmbJm9yw+HSJc6BXCFKIzpEK
         D9d891nlEEq+OcCtS7778AT52Q5yAJ9ZCs40vzIlwX+6P3K1D46S8DHPJLWHUfGr37ct
         L8IZcVVnoD/jWZzALGwunGKNX3cSyxrT1U/+O4o866OfJT0bJ2tZvGB0V4x8e0v/HdlK
         ai3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=eLUXa/7f03mrrlxRZvP1+mfNlm5ZK61/IOpf+UOnfpA=;
        b=iVuUgPGZSblF0iDAwVMXsJMi3cEdZf2NMlyFuTFGs5QW2rodO3j9h0Ly8VKXzFS+i9
         RS+T+dbXWwxzi29BAwU75Ji+deSrnPFNoLWfSyk7w89L7pwmmFaWMtCtCGrRXqnQqayX
         AEh9aSpL8Tkv60opG+T2/zD3LpZF2tS24KS0nWrc1/eINGmHaMcOu5FF8XV7E7o8NESu
         fvrnzte55scRA2BZ5qzxz7ZiBaT7y6hEaSqduTQibXWT3ORd95SgATYtKrUh5chW48kL
         dy9fjbskRmiXkIwE6lj9gYinrqy8fXKpCoxLXiH/tfFrSdsQpy6Y4x8CSawKAgBlBK2M
         kvtQ==
X-Gm-Message-State: ACgBeo32nm4MIrhlDSaMS5zvf5daAf1VnIeGAmmUW08DSYnWsW8+eBk+
	ZCUm7Glkh0Awp7T6epUx3Pk=
X-Google-Smtp-Source: AA6agR5DJfVKYDlrSNLa3wNyuLPvwubsZF8VZQM6JU+GS2BugrOvjw9AFh0IiP8A3TZSNH/OEieLog==
X-Received: by 2002:a05:6000:785:b0:220:6d7f:dd1f with SMTP id bu5-20020a056000078500b002206d7fdd1fmr18016045wrb.578.1660146695975;
        Wed, 10 Aug 2022 08:51:35 -0700 (PDT)
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
Subject: [RFC net-next io_uring 00/11] improve io_uring's ubuf_info refcounting
Date: Wed, 10 Aug 2022 16:49:08 +0100
Message-Id: <cover.1660124059.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a couple of tricks we can do with io_uring to improve ubuf_info
refcounting. First, we ammortise reference grabbing and then give them
away to the network layer, which is implemented in 8 and 11. Also, we
don't need need additional pinning for TCP, which is removed by 7.

1-4 are needed because otherwise we're out of space in io_notif_data and
using ->desc or some other field of ubuf_info would be ugly. It'll also
facilitate further ideas like adding a simpler notification model for UDP.

liburing/examples/io_uring-sendzc benchmark using a branch containing the
patchset and some more [1] showed ~1.6% qps improvement for UDP (dummy dev),
and ~1% for TCP (localhost + hacks enabling zc).

I didn't specifically test xen and vhost and not sure how, would love
some help with that.

[1] https://github.com/isilence/linux/tree/net/zc-ref-optimisation

Pavel Begunkov (11):
  net: introduce struct ubuf_info_msgzc
  xen/netback: use struct ubuf_info_msgzc
  vhost/net: use struct ubuf_info_msgzc
  net: shrink struct ubuf_info
  net: rename ubuf_info's flags
  net: add flags for controlling ubuf_info
  net/tcp: optimise tcp ubuf refcounting
  net: let callers provide ->msg_ubuf refs
  io_uring/notif: add helper for flushing refs
  io_uring/notif: mark notifs with UARGFL_CALLER_PINNED
  io_uring/notif: add ubuf_info ref caching

 drivers/net/xen-netback/common.h    |  2 +-
 drivers/net/xen-netback/interface.c |  4 +--
 drivers/net/xen-netback/netback.c   |  7 +++---
 drivers/vhost/net.c                 | 17 +++++++------
 include/linux/skbuff.h              | 35 +++++++++++++++++++++++---
 io_uring/net.c                      |  8 +++++-
 io_uring/notif.c                    | 21 ++++++++++------
 io_uring/notif.h                    | 22 +++++++++++++++-
 net/core/skbuff.c                   | 39 ++++++++++++++++-------------
 net/ipv4/ip_output.c                |  3 ++-
 net/ipv4/tcp.c                      | 11 +++++---
 net/ipv6/ip6_output.c               |  3 ++-
 12 files changed, 123 insertions(+), 49 deletions(-)

-- 
2.37.0


