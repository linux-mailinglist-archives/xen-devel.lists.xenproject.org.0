Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA820839E1E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 02:17:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670660.1043595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSRtV-0005wk-D8; Wed, 24 Jan 2024 01:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670660.1043595; Wed, 24 Jan 2024 01:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSRtV-0005tr-8b; Wed, 24 Jan 2024 01:17:33 +0000
Received: by outflank-mailman (input) for mailman id 670660;
 Wed, 24 Jan 2024 01:17:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVXY=JC=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rSRtT-0005t9-Vz
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 01:17:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 574ddbff-ba56-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 02:17:29 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM8PR04MB7762.eurprd04.prod.outlook.com (2603:10a6:20b:241::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Wed, 24 Jan
 2024 01:17:26 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6%3]) with mapi id 15.20.7202.031; Wed, 24 Jan 2024
 01:17:26 +0000
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
X-Inumbo-ID: 574ddbff-ba56-11ee-98f5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsOIIZEGkiOnhEAd5lO0OpQ1gShAfXrmGgF27OYBuh17stwK1s0BvEiogVVOL2ttHlDlqu8VP7N9fCWD1LuepXjaukflMexnrkpFpFn+sLE+qv7icdtEA70FsqWVyyymEcuZVu/XkcEYt/Sf0ZqUvC0udjmDPVHE6tTwZWjhHAhS7Fm4sW9sJNQ/+a5ciHz8noc5XRi+OHdPCAM/8z6X/sPHxGdU+p/yyWQNbS6UCx2t3FG6PBhhLBccPhR5ZVeY7MUIAaX3w9gMU177L3HlBesInYmrbFawdzHUwWHi3w+UtZ+NVc2tQAig04ZQ2+NlrsCduh5MvBR0wMb1dlHVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVBKLm1qoZuRH8kQqDRCj98oWwM+1CDRbyjg8jWXcbM=;
 b=JeR44muDASxXVv2Pb76ScZw8bWgtrmfSNNjIAF4BNxCgJaJ7Gy7gCJZIHeRd1+ILgAJWiY7txwf8HN1i4QkJnZA3Z+1XzB+pDtWKAxN+QFfhe5dBvW7SgIiBTy5yFZlAwCSfSlF7TfsX5tcYLwm7cvDh/mMRu2ci8n5OIwJqVouoJ0a1KMFIt/gv8rNYZV1KNDrgVgPvgeQhDcMOo/yiVpBxiLeaUKPxuutoPCesn7TU9z3ysyTeHfuJqLDuZobmU1Fr2PwgvVc0jl6m4WppCw1vfJsaVe2ot5PYPM1qlXNX02aEHLW72SFqBj14kfpHDjOGGhp9kR61zP1IrrgeCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVBKLm1qoZuRH8kQqDRCj98oWwM+1CDRbyjg8jWXcbM=;
 b=bIT7RenYa8PFU+2NQRvQBg4fgaTD8034d/KDnvzKlTYM4H0vPeKP4xVt8CN8aO4YbzNF9Ga9Iu9Km0HZupuaSqNSGWl24g3DdpFElw6yb0WYSpNbZmYsm+byDKy6RpoD30zbK7stkUNLBkoAzfCSkx85tUAojLCzgkf8rLCGigs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: sstabellini@kernel.org,
	anthony.perard@citrix.com,
	paul@xen.org,
	vikram.garhwal@amd.com,
	viresh.kumar@linaro.org
Cc: xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2] xen: Drop out of coroutine context xen_invalidate_map_cache_entry
Date: Wed, 24 Jan 2024 10:14:50 +0800
Message-Id: <20240124021450.21656-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.35.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AM8PR04MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c19dfd0-2a01-4ea2-b171-08dc1c7a39d0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BpGthZYJRSu0W14QPZUkKdUXdMiCYILvqcPPhCP58+SpLn9JwtXY7dBsYyLGknbs6GOABAYytOF+yXIdIgC0iqn9ihhzYFrOYNbw32j2Vi6GAucTlETxssWGMtxcz+1cvqRBTIFB/p7e7YPtDckp8fTx7lh5uTyZKwsFOiV1nJ+0F0UwgF5UphOpQI8VZLfPkE6HPOjnaZ1s44Sw3k6ljcwe7FltKHgqSzil2CnA4X8DzY/h8GPwYD5fjuwE1hpRRx2C7qfn0REzFhQvYnG+0jA/DtzxMiR+dL14AvQ3tZysJ0wYQocePsED+dII5ZHQk+xWxsjhglWjFo8/p/dR2vi69P0wZsvjMBkDmd1bLbZuorZaPeev3+TyT9kx5etknd+WIAkOgMreGaVRERfEt/BlcZc8AkwfLrCIUs7XaP9YugpYZgcbIOL80E2inshzb5krUmJT/nqEcI41FX0Pq2kVEBVrAjtG19Sm/HyhLzzCUhiuIK6VaJAwFx/sg24HU7rUGqmvT9e0fVw8cfpGtP4Ee3AQeLlqx6DW/94xz5FnhLTNIDMOo6IETxASCC9hkghqoU0Og6paGmmtpevpXzhMkD72QrVY37lICLg2WwgEjKet60HuwKLZW13SE9Qm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(52116002)(8936002)(8676002)(6506007)(6666004)(478600001)(66556008)(66946007)(6486002)(66476007)(316002)(2616005)(1076003)(6512007)(83380400001)(4326008)(41300700001)(5660300002)(2906002)(86362001)(26005)(38350700005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HgNDveB8WQlnPPKWBMZtGS6yE/hWQd9y6yEFJK+5GbkSAnSEPqs8eqACByNc?=
 =?us-ascii?Q?89DzWlnHFlE+OD++KLjifXs2sXrqL0PCFlql/MyfkCH3cgKRyCV4wORjUhrA?=
 =?us-ascii?Q?iw7pqHCBvf6/IpHsvYQW1U/l6LodwEX27J1hhJ5xVZ+6YKXVbuzBSl+btsz8?=
 =?us-ascii?Q?qunFHO0arTpiUuPeWQqEQelCr9IV5jb9pTgVNeYppFZ77CgPJsFxbMz/dque?=
 =?us-ascii?Q?hvInGtbf65NItbpYJ6n58c0sqIQD4cGFwG5gZryze3KDiFDnk+ajIUvPWW/3?=
 =?us-ascii?Q?eLoSIxh5XFgOhds3+EROBWdTh1EJF3nxNT6F8htiumU+Bp0LcqafzZr3iLBx?=
 =?us-ascii?Q?54rp1DWE7lnwkpxhIF+sl3CnYrAJwF/8eG1RNwqgZkCNzch5Cedqt09U0524?=
 =?us-ascii?Q?Y5WJQ/rd1VKs7ShkvnWfsZUZg0cB9rDAiYCne+XF9b3mv9PP36fe2OoNU9Gi?=
 =?us-ascii?Q?dOK6EohXsWKUYW819pRzTRt0DtUX1NAjoLrX+uk3T6PnXAb6SirDOEJH2v6o?=
 =?us-ascii?Q?ieNRjlWKvFWjAdIujCzDROIMreD88Zc+LoxpXlyT4lwG1j98rZyWGqJ57K1p?=
 =?us-ascii?Q?sE38xpW6l50mHJ0kFBMyXA56MMxpZCoPO0CHf+uQwqtutEOizq9d6vIWskC1?=
 =?us-ascii?Q?T9n85z7xLzwclM6iwztJ8M6gNWTBAi4uk5lWXqSq2k/PFxgnWqpsVixacQES?=
 =?us-ascii?Q?u3Nlt7294KCI8lyYsqq/y55lKDDzP4dOlSpzXwrfnhV2BJ7b4ylueNvgPlJ2?=
 =?us-ascii?Q?4CiyQK1/klZ42dZ0fEBBHViAqD+pXgndynrwV6sSp57itXLFmADb+7DN1rLC?=
 =?us-ascii?Q?3xx+XTlVub9J9s1eUWkVrr56/a83sHGW6SHn65ZwH/leoZ+xAwE20p1ECMub?=
 =?us-ascii?Q?hm/2s6SM60XJz/fwS5zaAkYBYJDQbyA4pGSMDXRmJ+o5h5Mym72axu2kSdnV?=
 =?us-ascii?Q?BpoxGOYBve6B6C9sjc4OWPU1uC7cZmPrkHx7nuFm45UDBLi5Tga0tnPiL5MP?=
 =?us-ascii?Q?tZG0/64Odt0AGtJKgWj+Y1bEMVCsLGF+NCxa8wZLNo69NkiBE/kAZUl7Cwz8?=
 =?us-ascii?Q?z9XmoXTixuz+c9N+fcNwD5BNxq472hlBaRKG8vDDyyW/NDQv2X/nmaQCq+IT?=
 =?us-ascii?Q?2u6dwafcCge3k+F1sikzE9WrAwYz8a3DirxyNwTFslx6g25c3E4KZp5iIKhX?=
 =?us-ascii?Q?uGuoM1Fh/2pX74bjimcPLTKOE6J4yutvq8fP+rwkzSFuf4QB/ohhFvF7sZs6?=
 =?us-ascii?Q?4In+ZqOkH4sjUrUZ6pjY9rgx0kVMSH16RYb04xezEBfwkrYJ+my+as760htU?=
 =?us-ascii?Q?1sv/GIsiDo8/7iR4BjUVtoqnyC+dFD4PxBSVzUw+fi2E6iRRF5HZoUzvKNab?=
 =?us-ascii?Q?bar+4jg3/h1id44Fo0V0ETsoUY+L2WH5Uwvl9ZQq3gIJXknTKnprKpQsVCBB?=
 =?us-ascii?Q?5zEeo1NlVTRo6QBAUcph5/dnrchmuLFpQrsCTKkT+QTFf8oIp5ZCjjHaXccc?=
 =?us-ascii?Q?AeZNZfC+FVoV2Ek/l2dBQc0Qfxvx1aELtkD2kr5zCpCVJBbscdcqaxKrCXJR?=
 =?us-ascii?Q?ICMFppb9vl9YlgJAsZw1f0RaX1s5NOpTTG+91qkS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c19dfd0-2a01-4ea2-b171-08dc1c7a39d0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 01:17:26.5001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAUAlSHRDKM9dcaUPrUOlhrk3taBPYWVWEVKfERehpFJeO+/bV5AbZLAPsrH/eUylDBJJUlzgH/vz0gnGR+K+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7762

From: Peng Fan <peng.fan@nxp.com>

xen_invalidate_map_cache_entry is not expected to run in a
coroutine. Without this, there is crash:

    signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
    threadid=<optimized out>) at pthread_kill.c:78
    at /usr/src/debug/glibc/2.38+git-r0/sysdeps/posix/raise.c:26
    fmt=0xffff9e1ca8a8 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",
    assertion=assertion@entry=0xaaaae0d25740 "!qemu_in_coroutine()",
    file=file@entry=0xaaaae0d301a8 "../qemu-xen-dir-remote/block/graph-lock.c", line=line@entry=260,
    function=function@entry=0xaaaae0e522c0 <__PRETTY_FUNCTION__.3> "bdrv_graph_rdlock_main_loop") at assert.c:92
    assertion=assertion@entry=0xaaaae0d25740 "!qemu_in_coroutine()",
    file=file@entry=0xaaaae0d301a8 "../qemu-xen-dir-remote/block/graph-lock.c", line=line@entry=260,
    function=function@entry=0xaaaae0e522c0 <__PRETTY_FUNCTION__.3> "bdrv_graph_rdlock_main_loop") at assert.c:101
    at ../qemu-xen-dir-remote/block/graph-lock.c:260
    at /home/Freenix/work/sw-stash/xen/upstream/tools/qemu-xen-dir-remote/include/block/graph-lock.h:259
    host=host@entry=0xffff742c8000, size=size@entry=2097152)
    at ../qemu-xen-dir-remote/block/io.c:3362
    host=0xffff742c8000, size=2097152)
    at ../qemu-xen-dir-remote/block/block-backend.c:2859
    host=<optimized out>, size=<optimized out>, max_size=<optimized out>)
    at ../qemu-xen-dir-remote/block/block-ram-registrar.c:33
    size=2097152, max_size=2097152)
    at ../qemu-xen-dir-remote/hw/core/numa.c:883
    buffer=buffer@entry=0xffff743c5000 "")
    at ../qemu-xen-dir-remote/hw/xen/xen-mapcache.c:475
    buffer=buffer@entry=0xffff743c5000 "")
    at ../qemu-xen-dir-remote/hw/xen/xen-mapcache.c:487
    as=as@entry=0xaaaae1ca3ae8 <address_space_memory>, buffer=0xffff743c5000,
    len=<optimized out>, is_write=is_write@entry=true,
    access_len=access_len@entry=32768)
    at ../qemu-xen-dir-remote/system/physmem.c:3199
    dir=DMA_DIRECTION_FROM_DEVICE, len=<optimized out>,
    buffer=<optimized out>, as=0xaaaae1ca3ae8 <address_space_memory>)
    at /home/Freenix/work/sw-stash/xen/upstream/tools/qemu-xen-dir-remote/include/sysemu/dma.h:236
    elem=elem@entry=0xaaaaf620aa30, len=len@entry=32769)
    at ../qemu-xen-dir-remote/hw/virtio/virtio.c:758
    elem=elem@entry=0xaaaaf620aa30, len=len@entry=32769, idx=idx@entry=0)
    at ../qemu-xen-dir-remote/hw/virtio/virtio.c:919
    elem=elem@entry=0xaaaaf620aa30, len=32769)
    at ../qemu-xen-dir-remote/hw/virtio/virtio.c:994
    req=req@entry=0xaaaaf620aa30, status=status@entry=0 '\000')
    at ../qemu-xen-dir-remote/hw/block/virtio-blk.c:67
    ret=0) at ../qemu-xen-dir-remote/hw/block/virtio-blk.c:136
    at ../qemu-xen-dir-remote/block/block-backend.c:1559
--Type <RET> for more, q to quit, c to continue without paging--
    at ../qemu-xen-dir-remote/block/block-backend.c:1614
    i1=<optimized out>) at ../qemu-xen-dir-remote/util/coroutine-ucontext.c:177
    at ../sysdeps/unix/sysv/linux/aarch64/setcontext.S:123

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Drop unused ret in XenMapCacheData (thanks Stefano)

 hw/xen/xen-mapcache.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index f7d974677d..8d62b3d2ed 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -481,11 +481,37 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
     g_free(entry);
 }
 
-void xen_invalidate_map_cache_entry(uint8_t *buffer)
+typedef struct XenMapCacheData {
+    Coroutine *co;
+    uint8_t *buffer;
+} XenMapCacheData;
+
+static void xen_invalidate_map_cache_entry_bh(void *opaque)
 {
+    XenMapCacheData *data = opaque;
+
     mapcache_lock();
-    xen_invalidate_map_cache_entry_unlocked(buffer);
+    xen_invalidate_map_cache_entry_unlocked(data->buffer);
     mapcache_unlock();
+
+    aio_co_wake(data->co);
+}
+
+void coroutine_mixed_fn xen_invalidate_map_cache_entry(uint8_t *buffer)
+{
+    if (qemu_in_coroutine()) {
+        XenMapCacheData data = {
+            .co = qemu_coroutine_self(),
+            .buffer = buffer,
+        };
+        aio_bh_schedule_oneshot(qemu_get_current_aio_context(),
+                                xen_invalidate_map_cache_entry_bh, &data);
+        qemu_coroutine_yield();
+    } else {
+        mapcache_lock();
+        xen_invalidate_map_cache_entry_unlocked(buffer);
+        mapcache_unlock();
+    }
 }
 
 void xen_invalidate_map_cache(void)
-- 
2.35.3


