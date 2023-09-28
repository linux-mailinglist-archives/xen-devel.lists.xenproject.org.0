Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C0A7B1E01
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 15:22:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609729.948922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqyh-0002fX-6F; Thu, 28 Sep 2023 13:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609729.948922; Thu, 28 Sep 2023 13:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqyg-0002Pi-Jt; Thu, 28 Sep 2023 13:22:50 +0000
Received: by outflank-mailman (input) for mailman id 609729;
 Thu, 28 Sep 2023 13:20:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6vw=FM=kernel.org=devnull+j.granados.samsung.com@srs-se1.protection.inumbo.net>)
 id 1qlqwg-00087E-0H
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 13:20:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1edb375-5e01-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 15:20:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D863961C67;
 Thu, 28 Sep 2023 13:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28DEAC3277C;
 Thu, 28 Sep 2023 13:20:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0F863E732D0;
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
X-Inumbo-ID: d1edb375-5e01-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695907237;
	bh=WESDWSBIxBgTV46NKfEUHelTwfrWg95I2h4/Iqr/LRM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X1KG2CslKyXTmAHOE9ut19dU3D1ndZDLDdqUloNr92yULn+YqrPZji2xw2INBYpUm
	 6F9yTU649cXeMkhlXPNSEgx9CZEqSU2KI7nIVnuEAcHdctqE7BBYS5qhtEf2yOfQnG
	 R1mpQOonF6UvHW7ScvUsXX6PuQxhn8SfiZiDQ0St7xAhbhnYOBS6MvxU2R0XUDnGt/
	 DBV2CmPFYybbpaGP/rLAB1yXMe/SnzrzBKC0su2BZmK87DmShTLpzxZCLR/mQ4v1pN
	 8cUsQWYemfXRz8FCPMeF9hl3BfYwspIRCViLCTG6Pj0iu6BAbtFCXNuyprY8KmJO9t
	 qJcclRkDU4adA==
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Sep 2023 15:21:36 +0200
Subject: [PATCH 11/15] sgi-xp: Remove the now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20230928-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v1-11-e59120fca9f9=40samsung=2Ecom=3E?=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=pY2XyujxOt+Rj6u6+44+o009/nkYZtGGPZk9nN2iFyE=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlFX3fe3sdkuVX/cH9+wfjrH5ueAgUPjamrIOH4
 /3zyIkdfAqJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRV93wAKCRC6l81St5ZB
 TwpRC/4lSj5L+OahMU8+3S1fvTtKAyIY/uKM1bPNHdispZZPQR1Rd3tvqJTptup1mzRuFuO8L1m
 8PJXRwGmMWlfPnW6wWYP/M4Aqq1CITeSckvnMuyUa9IAlZg0a3oKSGu5yX6zSvvAQ0+k7mBAb3y
 UBqDMmlaWuIsDoJskRRHROj9+KwmhMmsEKZWwN5UGxnjSX57Ws5oYdteVXY5AI8Zp7Hy8Tx0heX
 FCndhRyQrnj2jq8I3cC94HaHBQ+r/FbCmV0KJSg5xqjdEy9VmQiEja6TCN2IAUta6kgV5r3iSsz
 uRL2Spqp9oaZW9r25KtgCboTiH5fnCIkTB16pgKJEydjH49JsnKqmlAleVwBd/WjEU86E4be+/t
 V9Kx7iqRDYUo2aZWNOMBizEJlyYBMYHFFIiSdMNx4xMMW78VnCfWmHYPolywQlOL/IO7kdASIva
 qz9zA7cr0tjD3lcLzXnQuXIHAhNUbhz37de0+vmc7TtbbfZaFsJe0s2ItUEMGxrc4UUuo=
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

Remove sentinel from xpc_sys_xpc_hb and xpc_sys_xpc

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/misc/sgi-xp/xpc_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
index 6da509d692bb..c898092ff3ac 100644
--- a/drivers/misc/sgi-xp/xpc_main.c
+++ b/drivers/misc/sgi-xp/xpc_main.c
@@ -109,8 +109,7 @@ static struct ctl_table xpc_sys_xpc_hb[] = {
 	 .mode = 0644,
 	 .proc_handler = proc_dointvec_minmax,
 	 .extra1 = &xpc_hb_check_min_interval,
-	 .extra2 = &xpc_hb_check_max_interval},
-	{}
+	 .extra2 = &xpc_hb_check_max_interval}
 };
 static struct ctl_table xpc_sys_xpc[] = {
 	{
@@ -120,8 +119,7 @@ static struct ctl_table xpc_sys_xpc[] = {
 	 .mode = 0644,
 	 .proc_handler = proc_dointvec_minmax,
 	 .extra1 = &xpc_disengage_min_timelimit,
-	 .extra2 = &xpc_disengage_max_timelimit},
-	{}
+	 .extra2 = &xpc_disengage_max_timelimit}
 };
 
 static struct ctl_table_header *xpc_sysctl;

-- 
2.30.2


