Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B44C87B4DEA
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 10:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611253.950798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEgA-0006AE-RV; Mon, 02 Oct 2023 08:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611253.950798; Mon, 02 Oct 2023 08:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEgA-00063l-6Z; Mon, 02 Oct 2023 08:53:26 +0000
Received: by outflank-mailman (input) for mailman id 611253;
 Mon, 02 Oct 2023 08:53:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3Nz=FQ=kernel.org=devnull+j.granados.samsung.com@srs-se1.protection.inumbo.net>)
 id 1qnEg7-0004XI-6j
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 08:53:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22bf5f6f-6101-11ee-878e-cb3800f73035;
 Mon, 02 Oct 2023 10:53:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D86B260D39;
 Mon,  2 Oct 2023 08:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF60FC3277B;
 Mon,  2 Oct 2023 08:53:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A6BFDE784A5;
 Mon,  2 Oct 2023 08:53:15 +0000 (UTC)
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
X-Inumbo-ID: 22bf5f6f-6101-11ee-878e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696236795;
	bh=UrT6qFU01UuJnw1on3XWxUGJuijnLYQO/DZrjXeRvo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=REb+bphyh9qkQZyNKwrmSauRwNcqJjzzCSht5YPIFFtd0hF5HQixpMoZA+Q/GcBtZ
	 T1ZY3FGofKg8shHAVt9pHSmeSjq1opArIWx7tRZ9OwlcGG5cwHEs2uZSdgRy0s35FI
	 tXCc0YagUUKuYH5EnZR6cxM3MUgcV9gxAhg1EMW4wE4MzkEDwDsVyDCPkCJpu7pRlf
	 iBySai/SM0BQW4BLrHockZbM5wn55KwPLIIyl3Kzim4hxiGLwfN5kMCJ/idNzy6PfW
	 OS+aK5t8IiinP5Y65qHPfSYwTdmz5xSaHp9ZQkanw+rs8S9+w1va+gO8Xb4Fp+TWV2
	 aXLqCkSz754nA==
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 10:55:27 +0200
Subject: [PATCH v2 10/15] vrf: Remove the now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20231002-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v2-10-02dd0d46f71e=40samsung=2Ecom=3E?=
References:
 <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
In-Reply-To:
 <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
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
Cc: Joel Granados <j.granados@samsung.com>, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-serial@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-rdma@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 netdev@vger.kernel.org, linux-raid@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=887; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=XxeHsAq6JKBX5gFQdKtkOwMDqj3k6LdRrwtSDoG13Qk=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoV+Y6Cm3LhCKnSHOjCZ2v2gHofq/C47K5T/3
 Jb7xTkN9KiJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFfgAKCRC6l81St5ZB
 T6gPC/48wscQhiW7NUFTOR5UQHPuSRPo/W1iU5eo0e4HVHau6IgCW3NQNU+ljioKG8j8vjwyl0B
 eJLH8LvK98LFTDps1N4GMWDUW7M8ef27MYnRvU+2bZIsDiOmKFzjmY2cYDKTGsRvt1wKtYpbPO1
 r+H+B6TU+Np3A7wF0s30M82uN7P/OYHbVwaaX5NjK7wblqTYSu44tf+GprefUEvn2sg6+fm54jr
 hV5XFvzYAMsGRN6izfCFRaBkLZHcbmqYjOkI5EhCzxL/ZZwja2TyFKm2WQyFGgq3VYdrT7ZGDVv
 WeylYoFcNGDPKgqsyDoHi0mVwyjdzClwycDhQ5DvciuWPkt+Ly0lkWJfex7a6fge05zTF+M/zej
 Fn7WWsbDkDL/u/6r9slGqPZcUv1gZE+eaTbnIjoALtIhnaD44hrJ1DAuNJxKWOugdshBDx0uNAy
 8aLnlv5VzYQ8R+Yt/6mQDnXXVnrUe1DhXBYtQjMz54uSUSNfyV0lGXXDIxJar8WWFl34o=
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
 drivers/net/vrf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/vrf.c b/drivers/net/vrf.c
index a3408e4e1491..db766941b78f 100644
--- a/drivers/net/vrf.c
+++ b/drivers/net/vrf.c
@@ -1963,7 +1963,6 @@ static const struct ctl_table vrf_table[] = {
 		/* set by the vrf_netns_init */
 		.extra1		= NULL,
 	},
-	{ },
 };
 
 static int vrf_netns_init_sysctl(struct net *net, struct netns_vrf *nn_vrf)

-- 
2.30.2


