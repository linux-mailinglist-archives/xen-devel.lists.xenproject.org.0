Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434477B4DE5
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 10:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611252.950791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEgA-00065c-8H; Mon, 02 Oct 2023 08:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611252.950791; Mon, 02 Oct 2023 08:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEg9-0005sF-NM; Mon, 02 Oct 2023 08:53:25 +0000
Received: by outflank-mailman (input) for mailman id 611252;
 Mon, 02 Oct 2023 08:53:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3Nz=FQ=kernel.org=devnull+j.granados.samsung.com@srs-se1.protection.inumbo.net>)
 id 1qnEg6-0004Uc-NM
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 08:53:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2154869c-6101-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 10:53:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0761E60A2B;
 Mon,  2 Oct 2023 08:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15E89C433B8;
 Mon,  2 Oct 2023 08:53:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E6D5AE7849A;
 Mon,  2 Oct 2023 08:53:14 +0000 (UTC)
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
X-Inumbo-ID: 2154869c-6101-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696236795;
	bh=5V+ck7zme+riQyx1xmqb0Z0EeDR6wxHbTqGoKbjtrmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h9YSxCOBiZI18TS8F7IFLh6Qq5+WpoHRSjCXtJkW74v79cxU+xHBab6ovMTly8LKe
	 IDFqi8nG5On9c5mUzM2nMlLg9u/xCra/9Lupu7tXNo+obgVRsiSTMsjN8q8qMhZJwW
	 OZMb4LcQIuvVtxOSe5yyZwJwU7XQJTCScPZiAEqAQ6Vkh29H2SZ2WK88rj6FFDCll8
	 DP0Rxd0R3nyUifHTS43/yIIYwnebe2P7wSqXDQ/poAMdzJ4NNjLpkUftDL2+5srhXP
	 9tiFoq42TchWR1nIGuWKvALBVYUFpStNC/KPFdeVqueWUJZ1tJWqRhEb5xnTl49iW+
	 PgMcLW7jUn/tg==
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 10:55:20 +0200
Subject: [PATCH v2 03/15] xen: Remove now superfluous sentinel element from
 ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:
 <20231002-jag-sysctl_remove_empty_elem_drivers-v2-3-02dd0d46f71e@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=846; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=8Nedf2Lwq/OA3aANfJ6n4h5+UsWWU6lX+VhCPVGEdNQ=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoV8XTr6pqPXL2Smxc+bYMHo1/P6P4+Xz5jGM
 LVmxskaoPCJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFfAAKCRC6l81St5ZB
 T9KdC/0drEL8+dTyGyZg/6XaWVheHfUsBsgDQaWMOuKpb0rMHpDrn/Nci5oHt1wDz5sWP1TWjgs
 FKsSDVxdnNBN+9X0ckqjWyGf5rl/Xxm/E9lR6RQB6eV9u8YjlU7L3mSPq3a4ZHmjFF6Pti2XKv+
 Ca4WXU7SAKiu/C8OW/RyYQl32fKwwgcV6kONqEbCrLSbK4LveVwISI+vDPkola1wrfM+muUVDRw
 FRJxuiV6BavJ4pXOXDh7tOjva65fGwnLqIA88sPKLc7utjrUtGNWNGYrMglM8hKWZwcYObt0s7V
 C5U2+0FZ7+qLORCw2Yclx+UcLpl2pPXjwpWJu3ak3VT0hyjEXvIvIx1UYsdwlorQAitkTer2eKf
 HDMMBMPbtS8OxA+Lb35G/9PWV/3LOjSYvqo4AEH+OQHh7/7ej55TZAEbYIlQCnXXLoOatbyUZ6I
 beZVa+UQo/zcDzjjh9tSz1eY8UnBeuglio1DFA0Yfa5pbmOPP8X9qngGhl19spS4f0lqQ=
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

Remove sentinel from balloon_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/xen/balloon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 586a1673459e..976c6cdf9ee6 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -94,7 +94,6 @@ static struct ctl_table balloon_table[] = {
 		.extra1         = SYSCTL_ZERO,
 		.extra2         = SYSCTL_ONE,
 	},
-	{ }
 };
 
 #else

-- 
2.30.2


