Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E546640287
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 09:53:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451578.709353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11n6-0008Dg-RG; Fri, 02 Dec 2022 08:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451578.709353; Fri, 02 Dec 2022 08:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11n6-0008An-O5; Fri, 02 Dec 2022 08:53:04 +0000
Received: by outflank-mailman (input) for mailman id 451578;
 Fri, 02 Dec 2022 08:53:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sBZT=4A=citrix.com=prvs=328bd9ba2=lin.liu@srs-se1.protection.inumbo.net>)
 id 1p11n5-0008Af-4x
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 08:53:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8ad01b9-721e-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 09:53:00 +0100 (CET)
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
X-Inumbo-ID: b8ad01b9-721e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669971181;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=qqj1QKn9p38OC5FgLpJnXTkkTnf1m/IVXt+K5+MGMhU=;
  b=f/kha6m+6rNOMeyAfGr78bsxGcm1wmOQ4yEECkVPdgdRILObUpWHBsDp
   DUV9qL1z3YYQvFaKQc2FmvyraZe3erDHfPkEPVJGeIomw1bc+ASnUBbBq
   Z3vXZUMnpfv562L/T+SLpAeXCl6QypsB7E7HDHwWtXksKuAxDOQAsdu8R
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88748218
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pNlVkqj+rGQ4NdwFl5KpzKjPX1610xAKZh0ujC45NGQN5FlHY01je
 htvWzvVbP6CazT8c9EgO4qyph4Gu5bdn9FiSVRkr3hgHn8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5geEzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRHNRczPz+4m9mu3ayCSvUwjMQpAuDkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglH7cjserFOIjaE2/3LS3Ep6172F3N/9KozVGZUPxxbwS
 mTu4nznMDA6KO6k8Tei4FKSlPPAhg7JR9dHfFG/3qEz2wDCroAJMzUOXFG2p/iRkEOyW9tDb
 UcT/0IGrrU4/WSoQ8P7Uhn+p2SL1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 luImc75QD9iqruYTVqD+bqO6zC/Iy4YKSkFfyBsZQ0I/9XuvqktgR/VCNVuCqi4ipvyAz6Y6
 z2GsS03lbgPpcEM0Kq/8BbMhDfEjprGVAku/S3MQ3moqAh+YeaNfJe04FLW6fJBKoexTVSbu
 nUA3c+E44gmAZiTmSmlTOwTEbSt4PiZdjvRnTZHGJ0s9C+k/XK5SpxB+zF1JEpvMcEsdCfgZ
 QnYvgY52XNIFCL0N+ktOdv3Upl0i/i7fTj4ahzKRoVTRaYgWzSbxzlze3eQwzznkEICuK5qb
 P93bv2QJXodDK1myh+/SOEczaIny0gC+I/DeXzo50/5iOTDPRZ5XZ9AaQLTNb5hsMtotS2Pq
 75i2922JwKzuQEUSg3e6sYtIF8DNhDX7rim+pUMJoZvzueLcVzN6sM9I5t7I+SJfIwPzI8kG
 01RvWcGoGcTfVWddW23holLMdsDp6pXo3MhJjALNl21wXUlaovHxP5BKcpmJOh5rbc9lKMco
 xw5lyKoW6Qnd9g6025FMcmVQHJKK3xHej5izwL6OWNiLvaMtiTC+8P+fxuHycX9JnPfiCfKm
 JX5jlmzacNaF2xf4DP+NKrHI6WZ4SJMx4qfniLgfrFuRakb2NMzcHyq16BueZFkxNeq7mLy6
 jt6yCww/YHly7LZOvGQ7UxYh+9Fy9dDI3c=
IronPort-HdrOrdr: A9a23:fNU3xKx4vlslGeBNzlgOKrPxaeskLtp133Aq2lEZdPU1SL3sqy
 nKpp906faaslYssQ4b6Ky90cW7IE80lqQFkrX5Q43SPjUO0VHAROtfBODZsl7d8kPFh4tgPa
 wJSdkANDWZZ2IXsS6QijPWLz7uquPrzImYwd77i1NRZUVSbadkhj0JeDpy0CdNNXd77V5SLu
 vt2iKDzQDQCEj/Ff7LYkUtbqz4vtjWk5CjSQcebiRXkTWmvHeT8bvnFBrd9QsfVj4n+8ZezU
 H11zbh47mlsbWdwhvRvlWjiKh+qZ/a095eA87JrNYTJi6EsHfPWK1RH4eauSwzoqWUyHtCqq
 i1nz4Qe/5r7m/XfCWOrQDz1xLG2DIjgkWSsmOwsD/YuMnkQzB/NMZbn4JedXLimjAdgO0=
X-IronPort-AV: E=Sophos;i="5.96,210,1665460800"; 
   d="scan'208";a="88748218"
From: Lin Liu <lin.liu@citrix.com>
To:
CC: Lin Liu <lin.liu@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, "moderated list:XEN HYPERVISOR INTERFACE"
	<xen-devel@lists.xenproject.org>, "open list:NETWORKING DRIVERS"
	<netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH net] xen-netfront: Fix NULL sring after live migration
Date: Fri, 2 Dec 2022 08:52:48 +0000
Message-ID: <7ae75e4582993c6d3e89511aec9c84426405f6a4.1669960461.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

A NAPI is setup for each network sring to poll data to kernel
The sring with source host is destroyed before live migration and
new sring with target host is setup after live migration.
The NAPI for the old sring is not deleted until setup new sring
with target host after migration. With busy_poll/busy_read enabled,
the NAPI can be polled before got deleted when resume VM.

BUG: unable to handle kernel NULL pointer dereference at
0000000000000008
IP: xennet_poll+0xae/0xd20
PGD 0 P4D 0
Oops: 0000 [#1] SMP PTI
Call Trace:
 finish_task_switch+0x71/0x230
 timerqueue_del+0x1d/0x40
 hrtimer_try_to_cancel+0xb5/0x110
 xennet_alloc_rx_buffers+0x2a0/0x2a0
 napi_busy_loop+0xdb/0x270
 sock_poll+0x87/0x90
 do_sys_poll+0x26f/0x580
 tracing_map_insert+0x1d4/0x2f0
 event_hist_trigger+0x14a/0x260

 finish_task_switch+0x71/0x230
 __schedule+0x256/0x890
 recalc_sigpending+0x1b/0x50
 xen_sched_clock+0x15/0x20
 __rb_reserve_next+0x12d/0x140
 ring_buffer_lock_reserve+0x123/0x3d0
 event_triggers_call+0x87/0xb0
 trace_event_buffer_commit+0x1c4/0x210
 xen_clocksource_get_cycles+0x15/0x20
 ktime_get_ts64+0x51/0xf0
 SyS_ppoll+0x160/0x1a0
 SyS_ppoll+0x160/0x1a0
 do_syscall_64+0x73/0x130
 entry_SYSCALL_64_after_hwframe+0x41/0xa6
...
RIP: xennet_poll+0xae/0xd20 RSP: ffffb4f041933900
CR2: 0000000000000008
---[ end trace f8601785b354351c ]---

xen frontend should remove the NAPIs for the old srings before live
migration as the bond srings are destroyed

There is a tiny window between the srings are set to NULL and
the NAPIs are disabled, It is safe as the NAPI threads are still
frozen at that time

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Fixes: 4ec2411980d0 ([NET]: Do not check netif_running() and carrier state in ->poll())
---
 drivers/net/xen-netfront.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 9af2b027c19c..dc404e05970c 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1862,6 +1862,12 @@ static int netfront_resume(struct xenbus_device *dev)
 	netif_tx_unlock_bh(info->netdev);
 
 	xennet_disconnect_backend(info);
+
+	rtnl_lock();
+	if (info->queues)
+		xennet_destroy_queues(info);
+	rtnl_unlock();
+
 	return 0;
 }
 
-- 
2.17.1


