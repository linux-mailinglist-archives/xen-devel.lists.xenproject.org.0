Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5BF8AAD5D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 13:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709002.1108261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxm6n-00019u-Eq; Fri, 19 Apr 2024 11:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709002.1108261; Fri, 19 Apr 2024 11:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxm6n-00017n-Bw; Fri, 19 Apr 2024 11:08:45 +0000
Received: by outflank-mailman (input) for mailman id 709002;
 Fri, 19 Apr 2024 11:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8I7=LY=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1rxm6l-00017h-Gb
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 11:08:43 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ea14849-fe3d-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 13:08:42 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a555faf94fcso208945566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 04:08:42 -0700 (PDT)
Received: from 127.0.0.1localhost ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a17090655cd00b00a4739efd7cesm2082525ejp.60.2024.04.19.04.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 04:08:41 -0700 (PDT)
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
X-Inumbo-ID: 2ea14849-fe3d-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713524922; x=1714129722; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NnZhMrUZqGRI3vIgYFB4ebY43U9G9SiQu0xqMryWhDA=;
        b=GDhNTPol9dwXbU/EtfIWaPCpMOuhVMgVSS66o3WHSaCetuYkGoYGXfk+/HOnwgncpo
         Hb4TLEMUDX4o/s9h16VH+4ZWNJ2r+ZODh/8fKY5D4Fb3Z0k9Opt2DaY3Q5nTyhPYxVVu
         Fc79285JYAsscXrRbLCPpoW65OXCkCQU5ETaB2sbOMDQkAVYv8zyfuucnEGTRAo/VE3g
         WpSoir8lnD0huZCYekNjrtTwUcBTsszSOXCYmYXcLqsEBZg4lt3CQI2D22ce9biM5aNW
         QVGw9QRnvlHwuM4am4itZMZRSMx6O8Li3eYLPcEw+JHY4i0KTkesDNJMqQGPFAAOSLtn
         G20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524922; x=1714129722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NnZhMrUZqGRI3vIgYFB4ebY43U9G9SiQu0xqMryWhDA=;
        b=BjfQrccQYlT8rAdbK1CA3qFcGS0qKua5vVLVKivGHE4K6qi7qtOebsxPoYzjFnI1Yw
         lrtYPv1v0y4BXLurWKukpwyp1tllOX6BULU0tJ5OwX6+kgv/UNYT1tNGakNN4ugVhIMi
         IzfEH7B4UH0G3IeozFPA5Sn9olKnnMuKKLnFsfnI3VcInqyPVzEPoTodPtZ7WAqVOweO
         x/ByjyM/FAJlBPHOegY5pll3gBe2+pebmp2yIhtviYK1FLBEEQYAMQIH8qk4EcwpmUOL
         zbDwp7qbQ+UPAP/YvPLdRseQHK9/EyEI85woxXABbVRWigIYVrRE6U2OV65GN3ilfo9k
         RmvA==
X-Forwarded-Encrypted: i=1; AJvYcCVejIxQEr8MqBy3QlxAxdWOc1ZuFREHRpf908tBoXv/tF61zl1JA2u1OrTYktiQf9WjG793TPA91VikftDbq7KocCOA+ZFUb2CXeyw9LZk=
X-Gm-Message-State: AOJu0YwerOicTxmfdOPYQ2UXxg8fnTfznOVGiuAnUDEs4T9sB4u0DdIx
	OznjjKK4+90+3uD0IbwCyKN+c5nV27WqJzA9y8lo+4LyG1H3iZeD
X-Google-Smtp-Source: AGHT+IFFriJFsUnRrRu7HMBSLly/rtS8cinsWTH9ta/+o0dmkBTmaPB9zq5hLrUgZJ2Zq5CyXnzdXQ==
X-Received: by 2002:a17:906:f8c5:b0:a55:5ddd:e5f6 with SMTP id lh5-20020a170906f8c500b00a555ddde5f6mr1225529ejb.28.1713524921685;
        Fri, 19 Apr 2024 04:08:41 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>,
	asml.silence@gmail.com,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH io_uring-next/net-next v2 0/4] implement io_uring notification (ubuf_info) stacking
Date: Fri, 19 Apr 2024 12:08:38 +0100
Message-ID: <cover.1713369317.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please, don't take directly, conflicts with io_uring.

To have per request buffer notifications each zerocopy io_uring send
request allocates a new ubuf_info. However, as an skb can carry only
one uarg, it may force the stack to create many small skbs hurting
performance in many ways.

The patchset implements notification, i.e. an io_uring's ubuf_info
extension, stacking. It attempts to link ubuf_info's into a list,
allowing to have multiple of them per skb.

liburing/examples/send-zerocopy shows up 6 times performance improvement
for TCP with 4KB bytes per send, and levels it with MSG_ZEROCOPY. Without
the patchset it requires much larger sends to utilise all potential.

bytes  | before | after (Kqps)
1200   | 195    | 1023
4000   | 193    | 1386
8000   | 154    | 1058

The patches are on top of net-next + io_uring-next:

https://github.com/isilence/linux.git iou-sendzc/notif-stacking-v2

First two patches based on net-next:

https://github.com/isilence/linux.git iou-sendzc/notif-stacking-v2-netonly

v2: convert xen-netback to ubuf_info_ops (patch 1)
    drop two separately merged io_uring patches

Pavel Begunkov (4):
  net: extend ubuf_info callback to ops structure
  net: add callback for setting a ubuf_info to skb
  io_uring/notif: simplify io_notif_flush()
  io_uring/notif: implement notification stacking

 drivers/net/tap.c                   |  2 +-
 drivers/net/tun.c                   |  2 +-
 drivers/net/xen-netback/common.h    |  5 +-
 drivers/net/xen-netback/interface.c |  2 +-
 drivers/net/xen-netback/netback.c   | 11 ++--
 drivers/vhost/net.c                 |  8 ++-
 include/linux/skbuff.h              | 21 +++++---
 io_uring/notif.c                    | 83 +++++++++++++++++++++++++----
 io_uring/notif.h                    | 12 ++---
 net/core/skbuff.c                   | 36 ++++++++-----
 10 files changed, 134 insertions(+), 48 deletions(-)

-- 
2.44.0


