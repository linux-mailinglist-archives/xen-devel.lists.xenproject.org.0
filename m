Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C5F2FB580
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 11:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70256.126028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ohu-0001FM-OD; Tue, 19 Jan 2021 10:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70256.126028; Tue, 19 Jan 2021 10:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ohu-0001Ew-Kj; Tue, 19 Jan 2021 10:57:54 +0000
Received: by outflank-mailman (input) for mailman id 70256;
 Tue, 19 Jan 2021 10:57:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jC7I=GW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1oht-0001Er-BL
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 10:57:53 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c5a55ee-f701-4724-96ea-15fa3ae4163e;
 Tue, 19 Jan 2021 10:57:52 +0000 (UTC)
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
X-Inumbo-ID: 5c5a55ee-f701-4724-96ea-15fa3ae4163e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611053871;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=iK8jd78dLvu/tlu5XkqzG7D7XKHjR0HbANOJb7ps2lU=;
  b=NMTxlp6PB1PSjbOu2+guUrDsz+m76fLqHZe8bb6z8QC11Kf68o3g1d3y
   /WZbu74LwK8PeLHrpXOr3K04r/ks45oJs9R89tTNGJ+l6NeD2mu35sUwQ
   ImzU9F84H4QyJh3oY0mq2wxY/2itB0nJM+nAYbvSUlJydXNLf1csaNG3W
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 17gTlZIbzd7sL/XiQMS2YLsvQwYSifJ8ZPENs3vQpr/YDxhW41rPOESsQo7WK4S7jSm3tFn9CZ
 YEbhYsx1tQPE3EfgyM4gra+MPWyKQuBuJm1Fcqg7TdDIKD9GFq+J+7G15tyPcvr19U36q/52Hn
 VvbjIXJxJ8Xtw9ktNbDiKDgiKvNIGP64cYfDcFejrtXMIqBiC5N3S9lNkiMjpt43hN76kViFCx
 aaaToqGnETFhe3/JeOmPz1xnzASS+hi2Zmm2Ppm3c3uBLEAfH4n0J6xX5fpww9IB/pwQNnZohj
 w8Y=
X-SBRS: 5.2
X-MesageID: 35343970
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="35343970"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUecLFIEM7JRqF/OltFpq8WsuLXn9YmlY0fBkkHUXmW3FaNlidkVOacLbXZ3X/RePEU0ETtnVo/uRITNsBp12PXpo7mHQxk3XOC75bZvQ6bCqRh2tg6z4rDzk+HLVRGusEkEdHuGua1/wnFTgIQXoJEJ4o2ou7+KNJL6YLYeyzXl1bs2PFRw+itB6kPdkB3WGlvFnJlPUE2ppPPoO9+knwJPrMy+ljv71KFx9+Lab3ovvtAYmMSQh6Tcst7MpLdG9FMatuyi1MyWw+hRaKTbDvPaJTW1qMRBU1C9B9HzDPpQ6muAa+A/Gcj5kO1uNEr9DU4Dc9aeO01Sp2z5fUt4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIvHd6W0GKH5u0ipSQVsqdGtbvGsnHygDlqsV8dlnEc=;
 b=VKWS0KLlGoeaQ6IxvuM40N5GGuSRBv+YqNJaSY804zLxV01t/GIxmS3iSdZEAdiLP1qCDTTsV07GuLjFez1lVDm0eW34UNMynil1Os2GTT46i4lcXOXV+phVPYAz9dUzY2NYc4YHZ0KNnr7d3BvZpKwotD7t3tfDcJ9xGwcuktxAzOl4HhK+M3VEPj6CmyGGNK72RzuuCDhO22p5bu6QVoE97AeYiuiCT8dhZGfGS4Y2LfUHOx7XuB5duGiF2zidbzzzGogkfpLYleiR3gz0ZuSrIRNBr/UOObG1qCEJUegQzkZRLyBpAF4azSWHMTHDnLAhaDzoksN+j4mk/u20PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIvHd6W0GKH5u0ipSQVsqdGtbvGsnHygDlqsV8dlnEc=;
 b=COHotLdSS007ho5YunbGa/rQ/sf+gihBHAK/GmHONnQNoxrpwtMixMKScm2qGBidF4rR6YJplGLGweWRmbrNdFYJKAKeVpXekYal+pjFJz+PkUe+2a3AzzZSj8JUDlhp3X2dbShCDzgeNEVaQXKy7iW2XQwZWQWzUxz7KVLPA8I=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Arthur Borsboom
	<arthurborsboom@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>,
	<xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>
Subject: [PATCH v2] xen-blkfront: allow discard-* nodes to be optional
Date: Tue, 19 Jan 2021 11:57:27 +0100
Message-ID: <20210119105727.95173-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0002.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47ed5be3-976c-41f9-503c-08d8bc690ecc
X-MS-TrafficTypeDiagnostic: DM6PR03MB4297:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB429786D7C05D281605E074F38FA30@DM6PR03MB4297.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QnbNfng8Pir32hH70q69DetXY7T6rn31g6Q8GYMYa1LjX6BUYP2eOFepeMOKiCEABzU1yvb43kcKz3fQk9QDpksoCbD8uK7qqmu2P9/ZaTs9PVJ28g5lOnpXJ+v5/b55pnp4FXBDgga7+b8MZoqAOwuaLDKq3EfeKGR9BF0P6FIWuUbUND4vg1lVskQYClR7bqx1icoFq8jVuwuJy/2674O3ZLIFBVz/n4vVZifyRqn246uuM5ETXxsZDZzck/Hq9OEFozxfwODm44CzeExFKcec4OVTPbSnRq77BbeItuT/Smg/5AJlxm4toUpUHhvs0uOfbYK9V2t1hbkQ1yEsRZDJGThinQUKcgHZ7+J08e/fSfK9rszDgdT/FDY2QsnYDOdZQwo4nwJKtBASCgW//ayOFiObBUz77J1HdCH7XwxCiKnmJQ6WAfe9hfw4ZYKB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(66556008)(956004)(316002)(54906003)(6666004)(36756003)(86362001)(6496006)(478600001)(1076003)(4326008)(66476007)(6486002)(6916009)(26005)(2616005)(16526019)(8936002)(66946007)(5660300002)(186003)(83380400001)(2906002)(8676002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L05hNjgyVkJXa0RIMlRGdTMrb0Vpd0E5TS92ZHZiUk9vZkc3RXhhaWNrdThT?=
 =?utf-8?B?VGlpT0FQWXNjek4waExOYWxUdXJCdTl0MG9ZL1gxMGZ0U2FkWHhsVTRzRWFS?=
 =?utf-8?B?VnBQd2hFUHd6TVVST3d4WFhZM1JGOHlmV0V4b3ZYWDA1dkpHbUJKSWl6WEdP?=
 =?utf-8?B?RWkyVkdnbkF1Q2xqRFJPVVg2UTdjdWRKY2x3YnppTmplMm80ZkJLSWNjYWk0?=
 =?utf-8?B?c2hUQWZTVGVZdUdmUEJ1WVlaRkFQUGNlb2JEMWo4blYxMFdobFpEVWtrcXVB?=
 =?utf-8?B?eGJpTmJYbHAvVmZvZHVOYWZUbHpEb0Vha1BZUjJZaGFNTzgyYmtZU1ExUzg1?=
 =?utf-8?B?SWVadDV1WXJWcEpzOTVhN1gzTmhnRjV2eG01dFcwTjlvRkkwcDlQQzJWK0lw?=
 =?utf-8?B?MVRFSHBEZE5tWWtacSsxeFdjUUlxdEQ2MWRCd1JsekFFc2V0SWJvcnR3M1J0?=
 =?utf-8?B?MmtZZGFBbmtZZ0JqclV6d3d4YnNQejVWaGJhdnNKbWduazdxaVNHOTFZVW5t?=
 =?utf-8?B?cGJSUHgvTUtSZytvemFWUUlwaXA5NWx0WTBwK0huc0NXUXh3ZEp3c1FGOFJT?=
 =?utf-8?B?UkFGSStXQlBjNVdWU2pDcDh5M1dFSDdjRTYvS0JYbThqZERKdmZSY1ZveCs4?=
 =?utf-8?B?dzFFbzBvaUg4cDNCSG1jRDc4cFRHdWlicnRxbjlpa3MvbEZyVzZhajM5aGl4?=
 =?utf-8?B?aGlTRW4xYUlZbytHY1ZOR1prUHNXcVU1WHpMQ2Yrc3l5WlVtUkxBRENXTG0r?=
 =?utf-8?B?REg5aWV6VUVLVXJtcG0wZkFiUVVQUW9pNWYvVE5XTU9XOHlseGc3b0hNa0Nq?=
 =?utf-8?B?cGVheHQ5S2o3OE05UnZPN21zNlpudVBpZ2pNTHNYbmlPWTBRSG41S3lTYmRU?=
 =?utf-8?B?YTRWTU1nSkllNld4Y1pST3hWQUpyd0Q4SDBWYVVlSkROd0hmL01PZ1hlZHVy?=
 =?utf-8?B?Q2dxaGNaNlNXbDZDT3ltYW5jS3BuUGtYZWwvRkF3bytORUtRRTdnKzJSSloz?=
 =?utf-8?B?eHBpQnA4azVKb3l3UHhESWYyZUl4UDVhYUROUXhvMHJBNWtaUTIxMGNxdUNo?=
 =?utf-8?B?TnN0YktaU1lQQmM2cTBYRGw3UTVxaVZ1WTNacThpL0I3QmNxSXh0ZERhK0Jv?=
 =?utf-8?B?VVJJOTMwUzIxZVEwNTZtTTBtT1dPNUw2T2JKNUFjVVgyelpDdHB6NDdRR2Vy?=
 =?utf-8?B?ekhFVnorUzZWdlFHcEJHczEwNFFXUzN6RTlFcHhzaUI4T3daYTU4WXFwNGhI?=
 =?utf-8?B?cnJ3bUVGOUplT0dwQW1IaDV4WWJ0WERUZUswVzRGU0l6UFlXeFRUYWQ2SUdG?=
 =?utf-8?Q?yAd9gP9tQogsroy/06eG+bI2JOvHx/duZ1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ed5be3-976c-41f9-503c-08d8bc690ecc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 10:57:48.1093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnlxLvJ36lShVYXEbpUGCEkGPV+TCt99V04oQ2y8XPJbBhreZsMhMR8Utn7FEJorFIQ8ECU/wBbnSzdzc4Upow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4297
X-OriginatorOrg: citrix.com

This is inline with the specification described in blkif.h:

 * discard-granularity: should be set to the physical block size if
   node is not present.
 * discard-alignment, discard-secure: should be set to 0 if node not
   present.

This was detected as QEMU would only create the discard-granularity
node but not discard-alignment, and thus the setup done in
blkfront_setup_discard would fail.

Fix blkfront_setup_discard to not fail on missing nodes, and also fix
blkif_set_queue_limits to set the discard granularity to the physical
block size if none is specified in xenbus.

Fixes: ed30bf317c5ce ('xen-blkfront: Handle discard requests.')
Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: xen-devel@lists.xenproject.org
Cc: linux-block@vger.kernel.org
Cc: Arthur Borsboom <arthurborsboom@gmail.com>
---
Changes since v2:
 - Allow all discard-* nodes to be optional.
---
 drivers/block/xen-blkfront.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 5265975b3fba..e1c6798889f4 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -945,7 +945,8 @@ static void blkif_set_queue_limits(struct blkfront_info *info)
 	if (info->feature_discard) {
 		blk_queue_flag_set(QUEUE_FLAG_DISCARD, rq);
 		blk_queue_max_discard_sectors(rq, get_capacity(gd));
-		rq->limits.discard_granularity = info->discard_granularity;
+		rq->limits.discard_granularity = info->discard_granularity ?:
+						 info->physical_sector_size;
 		rq->limits.discard_alignment = info->discard_alignment;
 		if (info->feature_secdiscard)
 			blk_queue_flag_set(QUEUE_FLAG_SECERASE, rq);
@@ -2179,19 +2180,12 @@ static void blkfront_closing(struct blkfront_info *info)
 
 static void blkfront_setup_discard(struct blkfront_info *info)
 {
-	int err;
-	unsigned int discard_granularity;
-	unsigned int discard_alignment;
-
 	info->feature_discard = 1;
-	err = xenbus_gather(XBT_NIL, info->xbdev->otherend,
-		"discard-granularity", "%u", &discard_granularity,
-		"discard-alignment", "%u", &discard_alignment,
-		NULL);
-	if (!err) {
-		info->discard_granularity = discard_granularity;
-		info->discard_alignment = discard_alignment;
-	}
+	info->discard_granularity = xenbus_read_unsigned(info->xbdev->otherend,
+							 "discard-granularity",
+							 0);
+	info->discard_alignment = xenbus_read_unsigned(info->xbdev->otherend,
+						       "discard-alignment", 0);
 	info->feature_secdiscard =
 		!!xenbus_read_unsigned(info->xbdev->otherend, "discard-secure",
 				       0);
-- 
2.29.2


