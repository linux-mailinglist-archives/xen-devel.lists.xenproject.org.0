Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CFD7B4DFB
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 10:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611259.950852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEgI-0007yG-7p; Mon, 02 Oct 2023 08:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611259.950852; Mon, 02 Oct 2023 08:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEgH-0007Wn-8R; Mon, 02 Oct 2023 08:53:33 +0000
Received: by outflank-mailman (input) for mailman id 611259;
 Mon, 02 Oct 2023 08:53:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3Nz=FQ=kernel.org=devnull+j.granados.samsung.com@srs-se1.protection.inumbo.net>)
 id 1qnEgA-0004XI-77
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 08:53:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2334ff78-6101-11ee-878e-cb3800f73035;
 Mon, 02 Oct 2023 10:53:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 57E4F60CFB;
 Mon,  2 Oct 2023 08:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35C14C4E766;
 Mon,  2 Oct 2023 08:53:16 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 203EEE784AF;
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
X-Inumbo-ID: 2334ff78-6101-11ee-878e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696236796;
	bh=Uls7XPBqn6bEdL1vvvSumrQjEL8zidoGeMiRdIO1DJY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Znf3uRMkmmRKi1FLLfPuqGTg8TxGkA5vUnml0sGBj/lNU6zqUvRBzjrq7wi6dn8Og
	 wCyjSubCD1peM1ABs9alnKNnpygl6FEODH191I9gcvsuadwWzNddgNJLQ/JgQBBv+f
	 8csrmLrTP4RdqSuxbZr9GYMPwcXEuGmtg+LPqUoGh+DRcxC+Qy2q/ZuXv425c7elRW
	 hkQarTUdR4UlN5ftzxnKDuhuw+TtiQl8eB3UkN0Zv8gpgtXrHFXol+boWHu8rBPpUr
	 zx65s2Dja0H0a8xRbJUggKI4s2EqqSkQcPlKnKgxeHG0EWBhH9TalmbyI4rwQ0Ut/+
	 goBAiOgxVi5AA==
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 10:55:32 +0200
Subject: [PATCH v2 15/15] intel drm: Remove now superfluous sentinel
 element from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20231002-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v2-15-02dd0d46f71e=40samsung=2Ecom=3E?=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=944; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=XQdPHHjf+SEqXH5I2ue4u4cYp825opd75wWUwOtUAHg=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoWAu+BY9dasS5g5jzpwW+wb0CuXVsnRm7zPL
 9PCLIz16zuJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFgAAKCRC6l81St5ZB
 T4dBC/4sGw23E9mtpKFCRILNBVXTFFu7WRasCAH0c42eC8QRvWM22jnATwXrejlfZcSArtKRPCv
 wfyjPWWRmMsX2Y9QgdzQR4eDIR4OQdGxaQ4/9XSwkGOLd7l9gxEAAEi8llY4tPInfqJ8yVVRHRL
 kJdHEMgrOkdkoJVo/FH8l7kkyKTHVZqEqBuIpYMRQq0vs3giMG4Coo88yES1bFU47AyR49UdfVf
 QtcI7yfGBkHj9WuAuCZdvwlb/C7Y33lOTv/rXp5qxbGJFG/XZqtnhH8eAWrdaVnpC/lfeExJC/N
 Lm13PvtkIVR5sYCBtNXqApWpo7PjFw1K6HNYNoyRM+LXYRWZYjNM8T5OszX4OLnIjcam1EOtduK
 Z+VeE5uN753bvNh48r2JUIj/GExe1vTcY7a9da8tDlmzB+FEWZo9JbdpakNtfcKKjgKksTFXm75
 ulwZaMeS//8aNIMyrqyVcm4mjJ3q1QRxkcIptFtjcjFnbIGeIGcqc+bJIjQ8SiOblodg8=
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

Remove sentinel from oa_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 04bc1f4a1115..23e769aa214c 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4896,7 +4896,6 @@ static struct ctl_table oa_table[] = {
 	 .extra1 = SYSCTL_ZERO,
 	 .extra2 = &oa_sample_rate_hard_limit,
 	 },
-	{}
 };
 
 static u32 num_perf_groups_per_gt(struct intel_gt *gt)

-- 
2.30.2


