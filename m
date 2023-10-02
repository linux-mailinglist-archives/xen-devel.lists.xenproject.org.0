Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670027B4DDA
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 10:53:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611248.950752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEg6-00050z-IA; Mon, 02 Oct 2023 08:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611248.950752; Mon, 02 Oct 2023 08:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEg6-0004s4-7m; Mon, 02 Oct 2023 08:53:22 +0000
Received: by outflank-mailman (input) for mailman id 611248;
 Mon, 02 Oct 2023 08:53:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3Nz=FQ=kernel.org=devnull+j.granados.samsung.com@srs-se1.protection.inumbo.net>)
 id 1qnEg4-0004Uc-NF
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 08:53:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21f76f51-6101-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 10:53:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3F059B80E53;
 Mon,  2 Oct 2023 08:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0009C32785;
 Mon,  2 Oct 2023 08:53:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CF8C0E7849A;
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
X-Inumbo-ID: 21f76f51-6101-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696236796;
	bh=BSn//RwfVMrvPoAKalhFYY/8mhovHq+kd6dT13gD9k8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SSaI6BvxQjmcs4GEFZYC3EtPh56M5+I3SEdeEvMdmsRlgOl0/nTzwWXn3SVikiv79
	 1ayAq0JLHvsOpnFr5pG6EjoOpv9TTpuf0rPByflnwmE3lod1nOxMPklWlhHWdlkOwB
	 JxkBU8vSXXU2NXqSZvSYKDdDiKqUqYs7wzdyJfEl6qERmKKcNKalyNcXpDOswSgooA
	 5c+BntKi8u8CTorQZd0u0T3GHtZMlIV3DN6PTFtcnuw7TGDWyFGWM4dENwf+CLDzQv
	 Qkb7Cgk905aYCAcBgsqVot56xdPAlCTn26GtrBXNC8z8OXh3gWOgnhgFrHh2wT1dB/
	 xtNJm+wd4VwCw==
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 10:55:29 +0200
Subject: [PATCH v2 12/15] fw loader: Remove the now superfluous sentinel
 element from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20231002-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v2-12-02dd0d46f71e=40samsung=2Ecom=3E?=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1030;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=dSbsqoYM5F0forI6JAxGBllYsHihbal0Nnr9OSk3MCA=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoV/KvOoFfWIcmAF/sCqbEzd0ciPPa7ANRQeV
 5eLgFZ3QDOJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFfwAKCRC6l81St5ZB
 T2T1C/0Ue0/pX8RJDJSDBCMCjQ3HVnnkiI6/qCOH0fnL8+CWShqnWrkdXO6K5PzvyZvto0MaV1O
 qwtKHF0/he5rQjfT19MmMeap2SqXGkznWmnHlVdYtjAcu+eKD7lgElb+2YoOSxzCgrp66NaIHCT
 Rfn9REm0zsNr40oIeungH2jJmzpq48UW91InfOQrc8fNEs7gvVBWFN8x5lsPbgIfzkO0O9Sne0t
 o3E8YDJU+2PoW4qWEeuUOmAVROIwT110ScNs32qOQ+hWxeSXnH5vPTVt651tV9nJinTWPuPoNo8
 GklO6k76kbbl3rN3a4pHNPp5JUfxThANZaFjTs4M54UNA6XL/KY4YSE9kXWGJrE4tWHAMbXYX8M
 1wY9+Tla39Vmi6M2EY0kVNR6xj+LTfD8Qz0P5E2FqXUCFRuwdg5vabCaSNTAdr1FH077BSkS4Z3
 sTt6P68liUw7QyehRCrWLRyiEE4yxcGT9ADxewgJ9bZe1CfP0Y8NhVrZg6/OlaRWYBziM=
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

Remove sentinel from firmware_config_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/base/firmware_loader/fallback_table.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/base/firmware_loader/fallback_table.c b/drivers/base/firmware_loader/fallback_table.c
index e5ac098d0742..8432ab2c3b3c 100644
--- a/drivers/base/firmware_loader/fallback_table.c
+++ b/drivers/base/firmware_loader/fallback_table.c
@@ -44,7 +44,6 @@ static struct ctl_table firmware_config_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
 	},
-	{ }
 };
 
 static struct ctl_table_header *firmware_config_sysct_table_header;

-- 
2.30.2


