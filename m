Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3887B1E06
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 15:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609737.948953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqyl-0003lI-IE; Thu, 28 Sep 2023 13:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609737.948953; Thu, 28 Sep 2023 13:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlqyk-0003TQ-Il; Thu, 28 Sep 2023 13:22:54 +0000
Received: by outflank-mailman (input) for mailman id 609737;
 Thu, 28 Sep 2023 13:20:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6vw=FM=kernel.org=devnull+j.granados.samsung.com@srs-se1.protection.inumbo.net>)
 id 1qlqwi-000873-NH
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 13:20:48 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3ddcd6d-5e01-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 15:20:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 681E5CE21D7;
 Thu, 28 Sep 2023 13:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D24DC3278F;
 Thu, 28 Sep 2023 13:20:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 65ACDE732D0;
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
X-Inumbo-ID: d3ddcd6d-5e01-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695907237;
	bh=ZUiksl6W6uAlLzfzmV82mN2ZY2mOo2/OdWLFk3qByI8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XAmlR43N6LnlJWcxBRfJ4bGYX3efFf3VyDERCl9d9561sagPAB7JBOqTCKHhzbBws
	 Co5bW1LR04BRjXSzgqgigGnspcMgU7Ay7e7Dswa57sw5pcE6eLuRpRmV0qB9dyFpJo
	 ePxhk5Q1d+Wg4yRBouhE37dS8A8LHGsGW/jjgvFD4QC1wFaogI1GXyCa0PQV4OCVRC
	 NjTSXs4ab4JtUkPvyk3A/6ypSj1z8UEtEd2jT17geAa3bVI7XSijzJ/y7ZPKJM3mfw
	 JCFOFie1GX3MB32wgsEqQ9dPhxu5u+5L3oj+Gz6KUuq2yEeQEVLF6JScdvZYV7FKaD
	 tL3TGuj7xNI7w==
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Sep 2023 15:21:40 +0200
Subject: [PATCH 15/15] intel drm: Remove now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20230928-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v1-15-e59120fca9f9=40samsung=2Ecom=3E?=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=Z9ZtfK3DEA99EXZ7fr8sV5mKU3DvB0mjVyvX0TU3lCI=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlFX3gFlneS4Mf90CaCbyJH1c7W29aNmmDMi/fY
 CLHmU/OGzqJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRV94AAKCRC6l81St5ZB
 T+SdC/9jFG0RUkuS7dLpAVcMO6D7jlVD+ZtX/jfu+rwthZV8WGVLtJ8kcAR7BPdgAWXivaJ86Dp
 P8HoauS68D0RI9Rl9X/gHaLDOKz2eejqJOE8LOTNyc5oeWYoHn33YzNJbhBnz6UoWV0vUdddE34
 GRQqY6MKoVxUSV4CWxcsjFchdIDzBQiMIwUqspGaJghb9FT9hzSCLfXyl5vJzx8A+y2J8mT49k2
 Zu4B/1iFwUdke4OebC6tbh93+vu6byFilf9UV3QNKYcRyJ5GGOmA8VWdq1U89/l+7ecOpeI+39E
 VAvGXaumDhZWUpNQ1QcR6XhGrFL3IBE/XkZwVuXcVyY6NfbR19/0xgBykkluiUglYLyjlLnmfcl
 5XmrIaXdLBsIKU3e2gt+wdTGHqGSyzFDdbp0RF2kkLOO1GnpNivaGGSl8okOViY6fb1bAGKWSZM
 FhB8ybdTYNi+IqN7tj+lwciJDUGicuxAJy3KGeA8aLCwF3Lo29sNp5FS7A428ifTZoZbQ=
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
 drivers/gpu/drm/i915/i915_perf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 04bc1f4a1115..97ef6d2ad037 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4895,8 +4895,7 @@ static struct ctl_table oa_table[] = {
 	 .proc_handler = proc_dointvec_minmax,
 	 .extra1 = SYSCTL_ZERO,
 	 .extra2 = &oa_sample_rate_hard_limit,
-	 },
-	{}
+	}
 };
 
 static u32 num_perf_groups_per_gt(struct intel_gt *gt)

-- 
2.30.2


