Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFBA7B4DE3
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 10:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611255.950812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEgC-0006eQ-Cr; Mon, 02 Oct 2023 08:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611255.950812; Mon, 02 Oct 2023 08:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEgC-0006MY-0E; Mon, 02 Oct 2023 08:53:28 +0000
Received: by outflank-mailman (input) for mailman id 611255;
 Mon, 02 Oct 2023 08:53:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3Nz=FQ=kernel.org=devnull+j.granados.samsung.com@srs-se1.protection.inumbo.net>)
 id 1qnEg8-0004XI-6g
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 08:53:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 230265cf-6101-11ee-878e-cb3800f73035;
 Mon, 02 Oct 2023 10:53:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 40E8160DC5;
 Mon,  2 Oct 2023 08:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 233BCC32791;
 Mon,  2 Oct 2023 08:53:16 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF3CE784B4;
 Mon,  2 Oct 2023 08:53:16 +0000 (UTC)
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
X-Inumbo-ID: 230265cf-6101-11ee-878e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696236796;
	bh=CWlJL9Lw1/ldMKMXIXxw/hUhoDe/0uo8LXE4rcCIDvg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dr780/9OgUcsdtC82ja0MVSV0MPcrkXtIHn1pfiy0bouUWxiebn11JLyTjawcIz1B
	 ACtOMw8UJL7kZBt4+Lypa11r9YIbBL2pUR4tV7r3QIOnCIuJuaBBW/9q4JfKHjx1rO
	 6DzPgfGQxmcnE3sD8DWla26vXCXsl+oyLhwVGCFiYwBOrRxzVfX7ROfuVdzYIv7UN4
	 DLxNvEoWgw3dN2cyVkNUBQeJlZ7BFF4dfqBAUktV8qF7Fxq4p/dDrq364NaHDDdMbT
	 HPQK4lMcdLy+TTpsVeHkfkPs0w8oUjzfHoz+Rpqcu+CKTvTQz3xFFRsIiD83pD1xv0
	 sGtUhoGU9ETOw==
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 10:55:31 +0200
Subject: [PATCH v2 14/15] Drivers: hv: Remove now superfluous sentinel
 element from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20231002-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v2-14-02dd0d46f71e=40samsung=2Ecom=3E?=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=aRo7NVdYCvLdNgGSBgQ6l0+E6oBOdQJH07rUCLQlR94=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoV/RVrZ++DlZt66bGmFv2tACCjFtyc9bKCyt
 Xh72+xBYa2JAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFfwAKCRC6l81St5ZB
 T9wCC/9S9uDWtQoaUtTyJySq/BwgMLnAny2OrneSlhO0UKqMZFvbOgUuQGiJNs8VyC7IlWrxHVm
 2gbT3WD/mQhI9WX/B0z4TarGuU+BJmzwoPPun5D3G6oUedf0JdyIZLs9TJwZyL4KbQHIhVQ8skt
 9d2ELBqWveNmV8f+e8MKgjsdagi/9I77W0Dlj2eujgXgyIiPLQ/ZS+2g+heBSUicyN16ibHEu82
 LllVj4x/NiItYuyLOncHEA6dI2/PYrOmYAHIkg5yUqWOhwDEKS4RmcYq0Y0lzUl8APdk06uQkJb
 FFdVwsBnc3/rIeI8WobAqGTPjJ+p7k6APq5wq2IG+SuGmix2X7nozc7PdKVDApIkihzXIqIdVzt
 YXt3lgmdjZI5hmlPt6RyTPvW/lX88Ru+QtyDLF7HtMgyQnjyq5zqqu1URjGJnly2oy19F7wlilb
 AGIwY7o8qjN9C7sQC6yGWy2cGGyxw/g56tiwhVyVidw8uSz1wSXK/WM5kW7C0TiW0R8hQ=
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
 drivers/hv/hv_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index ccad7bca3fd3..4372f5d146ab 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -148,7 +148,6 @@ static struct ctl_table hv_ctl_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE
 	},
-	{}
 };
 
 static int hv_die_panic_notify_crash(struct notifier_block *self,

-- 
2.30.2


