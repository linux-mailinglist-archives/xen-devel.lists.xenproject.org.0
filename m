Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DDC82EFD2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 14:40:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667775.1039371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPjfI-0001Fq-2F; Tue, 16 Jan 2024 13:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667775.1039371; Tue, 16 Jan 2024 13:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPjfH-0001DZ-U0; Tue, 16 Jan 2024 13:39:39 +0000
Received: by outflank-mailman (input) for mailman id 667775;
 Tue, 16 Jan 2024 13:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=egl4=I2=oss.nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rPjfG-0001DS-6W
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 13:39:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aff7bd15-b474-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 14:39:35 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by VI1PR04MB7165.eurprd04.prod.outlook.com (2603:10a6:800:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Tue, 16 Jan
 2024 13:39:05 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6%3]) with mapi id 15.20.7181.022; Tue, 16 Jan 2024
 13:39:05 +0000
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
X-Inumbo-ID: aff7bd15-b474-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m46DZNX6uuNfw3kfH6RUhOccnw+wub7vWobPBDfePxFT1ii5gKPmWD6cS+iDK+CWTWMzu6VMBK9e8BqD+MZzoFKCXw3CgcBoqo1lJOf/N61AayMmUPSQyeGpWkJQRqujwhiRIHGptHXL3SeCo+MSvv7fpQgCy5vLKGvfvdxMRFbDSY7TIESKH29gWjdR+av51PunzMilOqhqVEEITO7A8onZQWWbXLq2tzNlH6JjAObOXSTDpAEI+rLWl0/oruv8Md1Fn5QjTBdPMg+BOrBlcsxecN+lUX5oqTH8LPV2jjZM84McxkRgr8DSycc2/IMQ42VW+nw8xLFjsK0FWBaDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2U3E52DW1E9L3OhbwVGkXyBGddYCJr05awnT7+GVbJI=;
 b=Hqr9VMzieG7k/8ErrHHdFXicspAcPaZoRbMn3xOLMix6kmGsw5wfAYP+i4sHoS7/xBu5NTp7SbZyEi/CyrO7z1+uh2k3x0Ps8hckjlDtK4WjpkHNIvDdRdo4IRK50kC6o+5Degorx0TKgSNosH5nrKu0ap2uYxdo97bGyQgxPu99Z+MfRaI01c2jN1ffuW6jnIBReSd7GrJl5aJaYccWh5jKt/NUg8bUidJZOaa6GPOeZTFGrkgCvz5PKOEtGN8EHqM5eZDwmrl4cXDf+yZsGHsiKw7Y8V+infay5xJ+8xWh8VtXBulMopGl1iCX+nDwNwwMs8lKV2jFFHaCM2Ja5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2U3E52DW1E9L3OhbwVGkXyBGddYCJr05awnT7+GVbJI=;
 b=M+OwdT3ltHWziOOjbww5uwjUX8/CGPsPNRYLMwshPiB9B3FjL03fescWZfzzWWIuE67ID6Ig1FGV5Rn62xDfF+gG4MueO7ft2REAOwR7+374GxxqEJJPpVMc4RvShnC3M1qxNI56D9J+WH13DHG/zL5I4PZ7IlU39ap8FkB7T80=
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
Subject: [PATCH] xen: Drop out of coroutine context xen_invalidate_map_cache_entry
Date: Tue, 16 Jan 2024 22:36:22 +0800
Message-Id: <20240116143622.6641-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.35.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|VI1PR04MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: ab96e1b3-9e2a-4afb-fa7e-08dc169881f4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ITbcP3AkQVCnDyJwonkpEyUr6qh/O+ZJA5WYa+WC2NhGg4K6heknvGj/RZhtF6tg1nx8vqSSG548a+hKKrbS+77stmLcPiAEJ1QURx+3TEsI6hHrs9kNF73zOYdgN7OfSu3MxeJYDAdXfRnHCrC/8kyr3P55DJqbdeVpp2Y8dsmULC0wEerJCQEQjht5F3+6iBJ6RXRgnewXQKqS6ebcSZFhWnztG40hCzGT2UaMXRTm+/amdSOciYGTQ5SqeOw5grLoBeBsNhljgh1x0kpOY/oa8BvvDc7JHSLIiCOzXv542vDNfeyoZBATAam/kjpOqfnGTSDqjvzJeQ0i15CWO1oM1bs86VSEEbZxntDbSRvYnPwhvNtKsM/veInoV7pUtZNplvznOzrGuvcj98tOnGzRKgQIEnG9423auUtpMe5B40YDUFaBt1/RwUldOzn6tPn3SzHgTQcsD+yj3GQpbNkat2tt5pKsrdWTGCtx2SDB7ghKfEsGxuF4ni9wgFZIY6vyAU+cI9h6586fif23R+KHBYu3WElFB0wtXLRl7U0DfnUg5q290aeGdjRXPO1pe9zVN6Wz8IKtmGHvjEcjqHezluy2xpOp3g8xM4lMPNxQSQXXh7wizkPFDyKaMIY0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(26005)(52116002)(1076003)(38100700002)(38350700005)(86362001)(2616005)(2906002)(83380400001)(6512007)(478600001)(6506007)(6666004)(8936002)(8676002)(316002)(4326008)(41300700001)(66476007)(6486002)(5660300002)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GxCOyVvI4qwCwfGZz2QjLk7s2cCvqezCcy8FPqhH5MqinoB2WaBo25L4bLH1?=
 =?us-ascii?Q?sPcfT/Tfh3DUUJXpdq0RX37RUriOiwZx9oGT6JYXyg5czbaawoII/H6y4viO?=
 =?us-ascii?Q?Hx2CgpmsjuLF6GdmeFHLPsjMVpy/Hth7a0al9lmYA01VwGPOOwky4rluUhgC?=
 =?us-ascii?Q?NGP8Cv0unrXQ1aHsftT9o/BgLgGlU1p5xT0LvnXNtHwZbhBBlqEqahhIiH1x?=
 =?us-ascii?Q?P+ingplUZKG6bkYLt0n7tQb234LHOR2BeMgdqf6mSnDUq/cD3jhPPoatVd0y?=
 =?us-ascii?Q?/EdZ9Sf13R5Jhvlxa+kimRqr7+OvgZqaNSwaYKRGEuJW9JSD7Qncvxl33yId?=
 =?us-ascii?Q?BzW8jCW+gZLqrE/3J6/U2jx5h2RW2AHWkX2bFM5AsswUYBgWKwJh+/sLTJIC?=
 =?us-ascii?Q?jzkAzV7qTYLWVyUSS1ObWnEdPnwnqEUJjjxVS4cOH6bml1jpScjQ8RE4J9Jj?=
 =?us-ascii?Q?7dX0yPB1mZiiYzb17GqcPDC3gGpcSBMjJxMv/jCmqPEUFJPTDKtGB43TQ+SX?=
 =?us-ascii?Q?ndHKGIFpPQCbxFeK5L4TycQtDP/JPg9GJhnmEyyWRjgdhR3A1oRk+ng4uB+s?=
 =?us-ascii?Q?D5036r4g6JA3BLEjj0nWowRk2lpDqVdVgh41Ed73HGRSiLXppx0T0yuF8m0A?=
 =?us-ascii?Q?U72FNJtNc5WeGdm7tnGmhIVUgqF8+v/Bb1LcqIGsRrjV18LEodVDjDYP062z?=
 =?us-ascii?Q?sh8mZSe9zJoDD7nbwwFQYKcGMvmN4ecE1dJUTTdPLm9YLXlK3GuM8VRwY3dY?=
 =?us-ascii?Q?/OyHgJb0yLnvZ1bEiFlMP3h/iF8QRsuViL948floCdMRKe+L8fGX1gQoAy7N?=
 =?us-ascii?Q?9P2yXP+W60d0rP6TYOx8HEkcIBRJQ+TE+BfF8kHurQ/DjD2rVLMYeyHbIWDG?=
 =?us-ascii?Q?C1PraVW0lCd9t2kYwkzokFxNUFtZjtjDXT7bz0tm+tzDCuBk5MKCUMFOBvhh?=
 =?us-ascii?Q?2kbCoCxk9M6dHpb1l5aPl5vysWowmtpBbUnBbkcr7HseNnv0iNzLfikQVgDV?=
 =?us-ascii?Q?EUzxV4Kut9o3diyILOfZk2BMCxDrzSWwlULdoxjz6pn3TlcU+SQfVXaZAyTR?=
 =?us-ascii?Q?o4MEWjk9PwC/gj0Et646rpjfiWvyaEssdrZIQWOdMTjPn9n7Ckk7aytF9/QJ?=
 =?us-ascii?Q?+yvZT1Rz+m5KZkOB/B8J1cNkz1CmD98L9U9ze1xJ2ewwOgptEmHSnH9j0+Zp?=
 =?us-ascii?Q?4z3yQlj6+kk6YyMwo9CBlu7FTq6Ud+3Pm/AB4X1Z3xBOSk3d6w0uVeChYRdb?=
 =?us-ascii?Q?xah+p1A0rCp7XhUBvgV5+WKNc77u4pVFRYcR+bbaaZQQKitcNLXlfeqXggoc?=
 =?us-ascii?Q?9vgbjHrS7LUUbm/pzCm3ytSr55GgmVVprmbWU2DFTxOiQBzmotl0aKqbBz8R?=
 =?us-ascii?Q?pb9BA7Hpml0hsyBA9NsghaAF0xQ9VY56Gq/M6rVx4vBPRIKoMwFu59ssGNS+?=
 =?us-ascii?Q?sngE+sj6rFgOSRxtjH8D6RCA+Z2E3Wvdv+7j4FxkoXVrE1hcEKn/jDm0hqfB?=
 =?us-ascii?Q?BlGP1TYqBJq8mOu/Xo969dM4jxsQhSHOhokrDQASaqJXoWpHutNjPpT2c4Ux?=
 =?us-ascii?Q?q0cQfint5NWhlb3hgq27DrjKnvLmj+lYNQcEn3Yr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab96e1b3-9e2a-4afb-fa7e-08dc169881f4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 13:39:05.3808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZTaoXNRwsYtgOX/r3mpqE5cPXCkItBJJVC2H+qedwgKQiezY43BUs+WcRLkJi5ZbPmVt6DCBB0lcT5jcDBbIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7165

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
 hw/xen/xen-mapcache.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index f7d974677d..4e1bb665ee 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -481,11 +481,38 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
     g_free(entry);
 }
 
-void xen_invalidate_map_cache_entry(uint8_t *buffer)
+typedef struct XenMapCacheData {
+    Coroutine *co;
+    uint8_t *buffer;
+    int ret;
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


