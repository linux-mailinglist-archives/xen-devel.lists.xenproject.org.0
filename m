Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C27B1E03
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 15:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609734.948945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqyk-0003UH-2q; Thu, 28 Sep 2023 13:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609734.948945; Thu, 28 Sep 2023 13:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqyj-00035T-85; Thu, 28 Sep 2023 13:22:53 +0000
Received: by outflank-mailman (input) for mailman id 609734;
 Thu, 28 Sep 2023 13:20:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6vw=FM=kernel.org=devnull+j.granados.samsung.com@srs-se1.protection.inumbo.net>)
 id 1qlqwh-000873-N0
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 13:20:47 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2a8f04f-5e01-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 15:20:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 549DDCE21D5;
 Thu, 28 Sep 2023 13:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 156AFC3277A;
 Thu, 28 Sep 2023 13:20:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id EE3F5E732D4;
 Thu, 28 Sep 2023 13:20:36 +0000 (UTC)
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
X-Inumbo-ID: d2a8f04f-5e01-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695907237;
	bh=lrXHVV3iKHeN1GBo4fXrfsJZ5+V8aEe9bhvkg3xQu78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TWsVtO1se30j6NzRsQjznKd0IGCNIY2VgIg21hGNa14HC3vwxzs1aVq4U4DLOEsfT
	 vQbxlngy5nU2UnJYZDYUyFIYmMWGnsQnlKbC22dRFKc074V3GF2R65SppEJW2FUD6N
	 IXO4n+4W6rJ6vuS2fVDGW2rfRnJ509II8Amksn6W8cNuHoWjUjPqnPiMHHFuQl2GtJ
	 4EN9T0bOlFEfubaFgkknSCgzfOEIbfjhhaJdVWQnxqL/g3zNbR9XAg06lmEDArens3
	 5pg3ppf9QpErzQbOwwM6QfDuD/ut8bNLQAA9LcKsi0cVAHbIjDQOnVyunv179quYiT
	 9Pd5mZe9q6Tqg==
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Sep 2023 15:21:35 +0200
Subject: [PATCH 10/15] vrf: Remove the now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20230928-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v1-10-e59120fca9f9=40samsung=2Ecom=3E?=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=957; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=1NLC9qP1CY5hbDPyr23yN2zoH2+i6NGjxa91ihvztxA=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlFX3efmxA5MIacGiPYUJqzMHLsUucZXUhKmZvp
 uwNl2wpIdyJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRV93gAKCRC6l81St5ZB
 T7zVC/9nccm8Jt9uhH7oQGv/uUE1TUHdyD8riQXjy6Q7siM8V6fZZKtqQAuVbgk+dQ+XYCY0MXU
 +gofOFghmvbuZW33bSsn6BpCMPsZitmR2AIrJz40JNmDes9atMglKzaw6YK2sktVhAl5vRjsBF6
 C5J/9HUHSFTD8MEiz/KG9qmfVDtOhZJrKQgG/eDxaK/tTOWULGYjcrTRsBdqVkhYUwiQyEmiisu
 obKNXMg1SnhtJyaW6u1yDjXdEuCYd7wdKEyFxJI/TVAsD80Usfi+gJ22UC1YiyxBWVYbaLTcm3/
 zXaEujj/bV6H7Mg+H3VBldoOzwUvs2J/KXMTzFHPGN3CideOlJrNCrkFP8axi7opC2TPD+ep4pW
 0zw45g4ZcDDdEZ7ttDDSQIcb3A6YNO2mXHNC8l8Op9uQPlfVSgcF0E0Tm7cxZd0lrEy+neUKS8q
 GUMrJtSPCvRNPD4xWGcwfpGrX5UX9Vuuit+whdxcOw2k8YWghpbrglRWCjHk82JtuA8a4=
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

Remove sentinel from vrf_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/net/vrf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/vrf.c b/drivers/net/vrf.c
index a3408e4e1491..94eed8708467 100644
--- a/drivers/net/vrf.c
+++ b/drivers/net/vrf.c
@@ -1962,8 +1962,7 @@ static const struct ctl_table vrf_table[] = {
 		.proc_handler	= vrf_shared_table_handler,
 		/* set by the vrf_netns_init */
 		.extra1		= NULL,
-	},
-	{ },
+	}
 };
 
 static int vrf_netns_init_sysctl(struct net *net, struct netns_vrf *nn_vrf)

-- 
2.30.2


