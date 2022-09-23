Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78655E8007
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 18:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410878.654022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obliy-00041o-6Q; Fri, 23 Sep 2022 16:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410878.654022; Fri, 23 Sep 2022 16:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obliy-000401-3k; Fri, 23 Sep 2022 16:40:24 +0000
Received: by outflank-mailman (input) for mailman id 410878;
 Fri, 23 Sep 2022 16:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kfh5=Z2=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1obliw-0003zv-St
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 16:40:22 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a71f7df-3b5e-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 18:40:21 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso303407wms.5
 for <xen-devel@lists.xenproject.org>; Fri, 23 Sep 2022 09:40:21 -0700 (PDT)
Received: from 127.0.0.1localhost (188.28.201.74.threembb.co.uk.
 [188.28.201.74]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d60cd000000b0022af6c93340sm7717399wrt.17.2022.09.23.09.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:40:20 -0700 (PDT)
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
X-Inumbo-ID: 6a71f7df-3b5e-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ztanNduUnGSd7dD7GDwGomWb/rDw7QbXu95GTvi4NF0=;
        b=Dhj86Nu8sys2qFmqK/V06KlGFM2Xk5QRqvHqBbWESeHJK9IBEpXdsYMqurS6oqL8sh
         BCTS7yoYRCIOdEjH+HTth7f3xzp+tPFJMKJrZyfMTCwEe1xcXyHNGSlDHVZnY+FKP+2m
         jTA5CspELwx9Zv2Wi4x2gjsEAscYjvZZkNMx2OqKEsIRXgRxAA94lCgWqyO22rNYSFKN
         QfOhOg05PssrfrtXTvYS+CM0qNdZNrzBccmM/798kaCfBPfgbAsGyHs9/gg98+tbhByt
         p5Y4WKhyD05rBc2YBOQOA0iDfLR24IG7sBHDko59ezP0BaeeJm/r8uUkUePTM869Q0fs
         WSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ztanNduUnGSd7dD7GDwGomWb/rDw7QbXu95GTvi4NF0=;
        b=abuYRcWRBG0AMlmc2gOGQFHMSIekU5YZwa/wv/GLD05KckJSje63w4Ta6i627gTUDm
         nP4Mzk4A18bRbTX2pc0uVqVvoeDFvLW2b4OYSsV/spG5F7acm01DBFLIJW2X/gjO3zZQ
         +7G1skx5fGNZoENi2iOe6oN26Ug4cNprM32pTsSznPwVqgJuZ/vHrnAvOTpY7HTIZQYU
         k+zL/p5MG8/B4FdkggYGHoloAvHYKkmTtwPIms8ev93bNYjlmodEPeTwQd2Jbkfot07B
         2WFwADErprpPp08ZUUZnVOrEGKjthfQ2bXW0Eexp5S9Zv24MQvDq1OI912NEGfOWufdv
         h+Qw==
X-Gm-Message-State: ACrzQf1w7ipMlU9pWVHiwvzjQDq1vXr8eUXlu9tsrNdaInalDG6MTPtw
	N56KtT1TIOh7tD8uqNUkQWU=
X-Google-Smtp-Source: AMsMyM4C/qvRMCrjlrQA/eLAYcbH57QXfOy2gaKCJNxGZjqOxXCGU/x4mo6mBgMbZcqI31K1kHtZHw==
X-Received: by 2002:a1c:7716:0:b0:3b4:b2ba:d190 with SMTP id t22-20020a1c7716000000b003b4b2bad190mr6595467wmi.35.1663951221338;
        Fri, 23 Sep 2022 09:40:21 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [PATCH net-next 0/4] shrink struct ubuf_info
Date: Fri, 23 Sep 2022 17:39:00 +0100
Message-Id: <cover.1663892211.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct ubuf_info is large but not all fields are needed for all
cases. We have limited space in io_uring for it and large ubuf_info
prevents some struct embedding, even though we use only a subset
of the fields. It's also not very clean trying to use this typeless
extra space.

Shrink struct ubuf_info to only necessary fields used in generic paths,
namely ->callback, ->refcnt and ->flags, which take only 16 bytes. And
make MSG_ZEROCOPY and some other users to embed it into a larger struct
ubuf_info_msgzc mimicking the former ubuf_info.

Note, xen/vhost may also have some cleaning on top by creating
new structs containing ubuf_info but with proper types.

Pavel Begunkov (4):
  net: introduce struct ubuf_info_msgzc
  xen/netback: use struct ubuf_info_msgzc
  vhost/net: use struct ubuf_info_msgzc
  net: shrink struct ubuf_info

 drivers/net/xen-netback/common.h    |  2 +-
 drivers/net/xen-netback/interface.c |  4 +--
 drivers/net/xen-netback/netback.c   |  7 +++---
 drivers/vhost/net.c                 | 15 ++++++------
 include/linux/skbuff.h              | 11 +++++++--
 net/core/skbuff.c                   | 38 ++++++++++++++++-------------
 net/ipv4/ip_output.c                |  2 +-
 net/ipv4/tcp.c                      |  2 +-
 net/ipv6/ip6_output.c               |  2 +-
 9 files changed, 48 insertions(+), 35 deletions(-)

-- 
2.37.2


