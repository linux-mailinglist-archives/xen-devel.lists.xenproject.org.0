Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA67B1DFA
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 15:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609714.948860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqyb-0000wF-GJ; Thu, 28 Sep 2023 13:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609714.948860; Thu, 28 Sep 2023 13:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqyb-0000fo-0h; Thu, 28 Sep 2023 13:22:45 +0000
Received: by outflank-mailman (input) for mailman id 609714;
 Thu, 28 Sep 2023 13:20:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6vw=FM=kernel.org=devnull+j.granados.samsung.com@srs-se1.protection.inumbo.net>)
 id 1qlqwc-000873-Lh
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 13:20:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d226ec99-5e01-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 15:20:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 23E9A61CB6;
 Thu, 28 Sep 2023 13:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 694BAC32792;
 Thu, 28 Sep 2023 13:20:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 505F0E732D7;
 Thu, 28 Sep 2023 13:20:37 +0000 (UTC)
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
X-Inumbo-ID: d226ec99-5e01-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695907237;
	bh=qEbYGqUMnAni5CU3u1xnFGdb1FPLHz8knsrTsoBqy2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EHLQaBcOwLswCBdGO23q6TptXW6rEuRsuyDDju9YDgRwtTJAFZW1glERTx2pWCUDF
	 tOjVoIbCmJcAzVL9/nTdUYWAUEoFOLTZaeqDmRP7/hYb80DQCpMkK431kVYV4MtfFt
	 nuFRCQTcKbRTwk6aFUMiInxZgGf9g5PN30MfE6Qn8BPKnhdkF5OHjDHyNHlefR16a7
	 kovNGZEJ82o8HzdaJTXh1lfiwnQ7miRpMa5No/lMwaB3fxzvkpo62uyXd+OJ7Lamtz
	 GFU10q1sSUCvk3aoq4J6ku2lDemCv1JH5wQAVTiONg+P8BHZEPDbPLIxqj2PRpLtAJ
	 88YnEQ7UZgt5Q==
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Sep 2023 15:21:39 +0200
Subject: [PATCH 14/15] hyper-v/azure: Remove now superfluous sentinel
 element from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20230928-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v1-14-e59120fca9f9=40samsung=2Ecom=3E?=
References:
 <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
In-Reply-To:
 <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Phillip Potter <phil@philpotter.co.uk>, 
 Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Doug Gilbert <dgilbert@interlog.com>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Corey Minyard <minyard@acm.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Robin Holt <robinmholt@gmail.com>, Steve Wahl <steve.wahl@hpe.com>, 
 Russ Weight <russell.h.weight@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Song Liu <song@kernel.org>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-serial@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-rdma@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org, 
 linux-raid@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=4F2+ffa3GXhFGEYppFEHm2Mtt4QSfNMs1+9vGf3WJxo=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlFX3f7bbg+0UaO56WXQOXlIq7JJTQoGGJcP1ef
 /0I3/y2l9yJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRV93wAKCRC6l81St5ZB
 T4FKC/9a2qdj27UKReYhOR67fov89RkcBAc0SAtrPXpSnnrATI2eCpgilBgK1TJnsd0vUJGn0v3
 HjutmUfnoXup+S3WT9l3Slop3hFazPlp4SGiLhCk1S23c/OlDwWO3IiAx8fA32NnNESs+MiBioa
 mXZu1jueoTISV7491NrBE5AqSzUD6+hA+gD6YfMNt4IFj5W3Hgy97oNrKmbVPktauNusnunZZ3F
 o192QRllKpTe1YlCVbYhL7flWa+1/barEVZyZWVtxgNuB0P57zgVImqQ8XQmCxmECx8AD0wq5Ks
 O59WWgdwa2mnVSl6yc2foQ8tNalHJ38XJAfBwByhMtcPnw4jsyyRTs/yPy24cW1Ht3s4r+RdWr1
 SWhzfXIIcW9zXul6wENWenDvXgVnHgPonLkKr/3w7ZFnRaLRczi94+a9SLqVIsthKPjIE+3Oj1E
 nOgzwMEh2XX72oDthoVuqB9I+Pl7Reo4jpwdDfbqp1O6tARRauhhozGbiE+umxbAGQwJo=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received:
 by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
Reply-To: <j.granados@samsung.com>

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which
will reduce the overall build time size of the kernel and run time
memory bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove sentinel from hv_ctl_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/hv/hv_common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index ccad7bca3fd3..bc7d678030aa 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -147,8 +147,7 @@ static struct ctl_table hv_ctl_table[] = {
 		.proc_handler	= proc_dointvec_minmax,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE
-	},
-	{}
+	}
 };
 
 static int hv_die_panic_notify_crash(struct notifier_block *self,

-- 
2.30.2


