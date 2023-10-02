Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1F67B4DE1
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 10:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611250.950774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEg8-0005f7-Fr; Mon, 02 Oct 2023 08:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611250.950774; Mon, 02 Oct 2023 08:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEg8-0005V3-3S; Mon, 02 Oct 2023 08:53:24 +0000
Received: by outflank-mailman (input) for mailman id 611250;
 Mon, 02 Oct 2023 08:53:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3Nz=FQ=kernel.org=devnull+j.granados.samsung.com@srs-se1.protection.inumbo.net>)
 id 1qnEg5-0004Uc-NI
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 08:53:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 213a2963-6101-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 10:53:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AD2D660C90;
 Mon,  2 Oct 2023 08:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3E6DC433C7;
 Mon,  2 Oct 2023 08:53:14 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D7B6CE784AE;
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
X-Inumbo-ID: 213a2963-6101-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696236795;
	bh=aJvesTjncjdehvjoOzgicraxwh/rWiTjr7edG2Q6mv4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rPJCnXgUng12Mon8WGDiqrOeKzLo4FZckcbZDHD68j4g1fnP9YKcXfgzclJhytoy2
	 oOW8aFHbf4p0+lhSyPbWIsBBO7PuynlLP2Y0iKKbgiKWiNQ3+H6AlZTJ4wYgN9dlgk
	 Q9wejDVQM4kbaKc2Tv+xLWx4xXubVibEp4GGIDuKpshDB5p9qCUxCCThzTUHnpaxbS
	 cc3ZbKgy2+N7QoE8P0vgp9CEl9492viaO2HInM2bUVAhdZQzIB9wL+XJK88DcYfnJj
	 ET4RubMDksXAXcizyUzFlBMwTqDl/c56ZDUwN27AbdIuXCczipjwXcox/lVGwHQuQl
	 ibKXUsjL97NtQ==
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 10:55:19 +0200
Subject: [PATCH v2 02/15] hpet: Remove now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:
 <20231002-jag-sysctl_remove_empty_elem_drivers-v2-2-02dd0d46f71e@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=872; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=D4/jh8s1FOZmHUkzA2HIKPxBmTVEhKvdOly6Ejtyi9s=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoV8RaCzxdAOWtuPnRt7Wux7rupM5tB7FtyrW
 q9lIZ9XZ+CJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFfAAKCRC6l81St5ZB
 Ty/0C/4uqqq0dHDfGdoGvuiIuxvDhp5ZXfs4li1OUAa9vw/kKRAFFw0BHlJ83pzvScsZ12deUPj
 2Edd0uFUigRsFKLXFTi+/uSJEvha9/UaNQhJzk7mT89m0s5xBmtni5vkcDiSCWnMUv/U7+2H8Y3
 OOOQGjWxSMOZV2e2bXOSlpOLLBDTgaTXQrlHrCOx1ytKm4tYvFHLCe9HOwJKwWZq2QN4WG6Byk+
 wy5Kw93OwbxQlqaev/qEHFhZhtyb3JFmwMCUpNCg00dHkOgnVjaiYmJGZsZE6DBCn5DYoevLBAF
 GrueOiTX1qtk2NNIdj7MkIufi7Z0ardeaO9/RrZ5RlBLMoRFDydK79kGi0ANS2wc0/7vZKx/7Wq
 u9TmBsyJfFw7cevn8fkD5kdY6jEIG3mdhoiSB+9triRBP99C9cWvJoxla/GvwN6tcj9mjG3fvsX
 rXq0YzVTqo/8UPLlRfKC0CMM6mVj4hSse2wU+7FAlYPUF1kbaX8QA1SwyLdmfT5IDcfJI=
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

Remove the last empty element from hpet_table.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/char/hpet.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
index ee71376f174b..f09c79081b01 100644
--- a/drivers/char/hpet.c
+++ b/drivers/char/hpet.c
@@ -728,7 +728,6 @@ static struct ctl_table hpet_table[] = {
 	 .mode = 0644,
 	 .proc_handler = proc_dointvec,
 	 },
-	{}
 };
 
 static struct ctl_table_header *sysctl_header;

-- 
2.30.2


