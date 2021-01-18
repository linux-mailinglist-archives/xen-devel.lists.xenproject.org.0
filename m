Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF73E2F9D3E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 11:55:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69578.124633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1SBg-0007Zz-Mb; Mon, 18 Jan 2021 10:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69578.124633; Mon, 18 Jan 2021 10:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1SBg-0007Zd-JF; Mon, 18 Jan 2021 10:55:08 +0000
Received: by outflank-mailman (input) for mailman id 69578;
 Mon, 18 Jan 2021 10:55:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1SBe-0007ZY-Vu
 for xen-devel@lists.xen.org; Mon, 18 Jan 2021 10:55:07 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11798dcb-4f2e-4803-a1df-422a2936b5a6;
 Mon, 18 Jan 2021 10:55:05 +0000 (UTC)
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
X-Inumbo-ID: 11798dcb-4f2e-4803-a1df-422a2936b5a6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610967304;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OJpATAZNkym63ieAAQsdv3LGR0loOLLqCUh3WdG4+GU=;
  b=Xcug7o/PpmHYKP3zzWYe7Ay1/BH+SIe26sWnA/vOx4nhYDlyM0kmWDKI
   mMFt5Q+aTl7HTRmKHQhhY049huSalwHPFD5O0YWMFEZBYl5nMV1pgGLVj
   OniUBIUiBssBa+J6lxTenHWwQYcnkOik8LDp6gGtUz2TqV6b8VB2vANKR
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3jYeWhbK+hReBmfwOYtcTU5ykpVOqKZjlJrzBYafK085RxMfEfm6hgWRaVEWDNm5DUlKd/08cH
 9AShoeA7h+DBFvUvPT7iZmxxhUtscEo55sEhZqlHKzdYk5vT4636zbbim86bAo3DZvdLUVC3Hj
 YoS8oO7X/3Ex8tqWyJw1GVbz0qkIMjljHnX1uZyItqFkpHXUKHioFzxZO/zwKb+wm9Ov/+gtLg
 0bVHowDWPQiYcZOilJMmIAN56ua/XGyT1M48DBE59JZ6/CGq7UTyY1nJilhu93+GRfMAPwnDBx
 xWg=
X-SBRS: 5.2
X-MesageID: 35292486
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35292486"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMS99ZaBo8OIkZGo6pqBxx8m3oFIPSQ6Ni7fxgIz8HFujmhy+TvaDWIP7Dls6SAjqb+LgpftPa5jyxbwpgJOJJAY8jpXRhbeJeykjNIPISQEtCI2Li2dcRrEvIuYN/2ONswTs7p1OcO1nab6p772TUGPNovkgwD/9cGKW+Cm2nJ/kHuj2biuZofpcyKopo5DHT0UnK3lwjoC3i+KEZMKwb9oZwBhPiAdQ+9U/rJi7qKR8Vt4qSAZK98A3JeEynqtUUHEOBYPErjGSsnL+3E5ow17padb6+6C7lXAMwBmu3v9pV+JRy1WnfPfMf4mXQNWyzymYLWniucwUE+v2UkYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECoIQ7F03ROWxHh0rOIMyqtYBExm0vtddF9D5UGzx3o=;
 b=NzW1irUYVR7ez0b2ZfU/4TdN+h5BiE2HZMnKCYuqzEIzyy50J+wudhfIT7yHvvOYNJ8fU9Hs90oKDavEXN17xj9wPO5hu6w/DDV38gdzPspDkZcrUGhHm+AabDRP2ARQw3TdSazUHiAYKOr37I3L8Qpv4ifVtyasJCcBrAkooOf/RCljhA+nAoYrsDEd9n6Q7sylUYTgcOXh78Fe5M+/p8Sn7xcwT8yqGiZMqgy9FJ7NRmUxNA10AGWb8Rep8V96WY9mmHAKzf3j0GPEG3y/XU6GZn25HTAFvxoe5ZfbsKpI5YVcsVCt6Nw9rzwTDaID40xE8hjVihy17S4QlaBByw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECoIQ7F03ROWxHh0rOIMyqtYBExm0vtddF9D5UGzx3o=;
 b=cRuf9Dk6iKg/hJ/fC9fwEuJ7iPVobEHP+/YvjElpNRFTUcSjUSRHX9tg4r8GUzIp90ug8sW1w+YAHTpFKkTLLhD8tEjQ67JrdUDzWfmzxhJIGr6UwNBUtPmTkDvLLPCI6CKqDVaL7bIiHL+73Ox4advhf/FfgocwoAVwLhKeq+I=
Date: Mon, 18 Jan 2021 11:54:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Arthur Borsboom <arthurborsboom@gmail.com>
CC: xen-devel <xen-devel@lists.xen.org>
Subject: Re: Xen VM call trace on fstrim: Error: discard_granularity is 0.
Message-ID: <20210118105454.gjhtltla25dqm3uy@Air-de-Roger>
References: <CALUcmUnh_tos4BnXmrsudtD_Fyw53O7FceJ54xVOxjnfeQ_Qtw@mail.gmail.com>
 <20210118101915.phxn26c5spars6od@Air-de-Roger>
 <CALUcmU=ndK_-U_LVdnYxzx=bRDEc40KAy8k5myFDSq5aYTUwqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALUcmU=ndK_-U_LVdnYxzx=bRDEc40KAy8k5myFDSq5aYTUwqA@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0165.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a31b03df-83a7-4cf7-3c34-08d8bb9f8073
X-MS-TrafficTypeDiagnostic: DM6PR03MB5273:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5273BA1EC91D12825E71B0008FA40@DM6PR03MB5273.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y48XMXBj9Ymgar8jstcmvjGS1DbXo/JUH3H4bCmyRHsSr5YhvmAYBUQmydJFrZaf5j7iXwJZNDqMFGKWhz8E5uDHd3XbObF5FwwX6oYo+7CUFGjuw3aJcLASwvs1Ahe8f7Q3ulNyKP+ryJ4PTXRD9AyoSKjhHEvmpPhSwZhcKD+MyQN8LKXCgP3/PAWOhSgfNZK4eoAYXjXnhiVUBxwGrlxJSTsH3wtKhpn5sGjlhQD9q3AEJwcZNk+aiTvKcpOdc9fst9P/4OkRy1YDKt9p6DlrN2mRWZMHXuV348pBaWYOn4ZaLlugHmW8PQbao4bb3vj9qqbR6PmxvynFA+enLZyU/C6eBiuoq4Z6Gxp13Ep1utkZAOr2bcLyNt4fNumKifLB9Yrcb7UVkXjj3DtMMSzqP00RsTco1WXAF7MtDcvdpslbW1SjidAR48Uf6WP0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(478600001)(186003)(16526019)(26005)(8676002)(1076003)(83380400001)(316002)(66556008)(6496006)(66476007)(4326008)(2906002)(8936002)(9686003)(33716001)(66946007)(86362001)(5660300002)(85182001)(6916009)(956004)(6666004)(6486002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWd4U1ZFRFZvZzRIanQzdnhyejBleW4rNlRlZ1ZaOHFNQnRmaWpXR0w1d00y?=
 =?utf-8?B?V1RaZEFuWmhQbm4xU2k0Tk91VCtYa2lkUFBNYko2YUhKZVhkbWs5R2hiTFhI?=
 =?utf-8?B?RUdkNkpRWjB1d0l6cGpJQ3lKZkpvcUcvb3ZTTmZmNEtwV2pUdEdKNzl2Ym91?=
 =?utf-8?B?dmpUUUV2b1BwY1hSZnBmZUw0dnQ4MGo1NFE1ZFF3SUcxdEpGRHJaQ2Q0a0pH?=
 =?utf-8?B?YVFYWEJLdG9kM1BJY01nTjFFemdhR2hkdzRDLzRpdXM4R3dsZk1qM1hzWVBC?=
 =?utf-8?B?VXVwWE5kQzhKbTZXenA0NnZTRVoyeXNMUGQrNXlZdm91Yzc4d1prSzZWYVdT?=
 =?utf-8?B?TndEN213NmFwbzUvSzJETERHS0xSUHNGYmJTeXo0dWthRkZxajExdTMxRFhy?=
 =?utf-8?B?NTRkTDB2aXMxVVgvc2dqZDZoSWwvYitCQ2MvY0FvU0NscG52THQ2clE0Vm00?=
 =?utf-8?B?VmxnSERlbFpLc1N3bUlKamhIc1pVYjZoazYyYUxUbEkrS2trdWdTR2REMlpF?=
 =?utf-8?B?YS9oMWxpQmtoeXZvdUhDU0pTK1hvRytORUxvakhuYWd6MFUzVFZkZXJVU3k4?=
 =?utf-8?B?MStMNTdUQXE2blNYQWo3UnJkblplZUllSk03RWpHalI4QnlpVm0ra2Z0RXVK?=
 =?utf-8?B?aWRHVTBsZG1vbHpSdHpkZzNwTVRyeDdaaEpCcmdvdldoYmZBQWNuZjNlK3pr?=
 =?utf-8?B?SytCNE8wdlgyZDRmV1BqaVducGdDcE91ZzVTTXFYdmh5aXhOalVGRDNwc0Zz?=
 =?utf-8?B?aW1JUGlFSDBVdXF3UU00ZVVWRlBEbWJKeGFIZDkwNnA2ZWNEZE9DQkRPZS9Q?=
 =?utf-8?B?dTdwL0ZEQjhyRWNMRkJQN1lYRHRwQ2QzVVZNYk9RNGZiZUdlRFdYam9vdTZB?=
 =?utf-8?B?c3BPMFdRbFc2SUpQaTRRSTUzQ3h1cTRVQTkxNzFnTWZ1VVJ4NnFPMG5TNFFB?=
 =?utf-8?B?MFUxSFo5VDMxYWdjR2l5Vm50dVRLVis2ZDZ2QXZkR0x1OUp0YWJPSTd4SlBV?=
 =?utf-8?B?Q1IzNDBiRVZDcDZ0V0d5ajNXcWNEd3kxNHYrdW01b0Foemw3UUJpOFlCSlhr?=
 =?utf-8?B?dkpnQ0JrMFhuS0lRQWc1QVhkdGdYU21UYTNmN3RTcUEvUXNaZHc3SDFxVWlR?=
 =?utf-8?B?NTgwUEkvazJNOWZCLzJ2VzJpdEwzRDdHNFZ0TFpkSXMzOG9hSm4zRzZscnQ0?=
 =?utf-8?B?OEg4ejBXcllicFhQMVFhckdmZHF2TGE1dm12V0NqRkhVams1cTZpdVpJc3BS?=
 =?utf-8?B?U0NpRVl5S085RGlDb3Y4MWFYeTFkQVdRNjdjOEIzd0tpZys4aS9TUXBZb0Jl?=
 =?utf-8?Q?aWMoKHtZU5QzL6ZJsikl+7nHZLhZjkU+uV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a31b03df-83a7-4cf7-3c34-08d8bb9f8073
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 10:55:00.4982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvPT+Y3xGw1dmi/RcK0WkrDH3wE/kKAn3fxyAL7oDedZre1WK2ToIvBSkZOoED7Nw++Pg1T2McJ0J4gFCtNnag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5273
X-OriginatorOrg: citrix.com

On Mon, Jan 18, 2021 at 11:25:49AM +0100, Arthur Borsboom wrote:
> Find attached the output of xenstore-ls

Thanks, that's very helpful. I think this is ude to QEMU not writing
the discard-aligment node, which leads to blkfront only setting the
discard feature partially.

Could you give a try to the following patch on on domU? I think it
should solve your issues (I've only build tested it).

---8<---
diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 5265975b3fba..5a93f7cc2939 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2179,22 +2179,23 @@ static void blkfront_closing(struct blkfront_info *info)
 
 static void blkfront_setup_discard(struct blkfront_info *info)
 {
-	int err;
-	unsigned int discard_granularity;
-	unsigned int discard_alignment;
+	unsigned int discard_granularity = 0;
+	unsigned int discard_alignment = 0;
+	unsigned int discard_secure = 0;
 
-	info->feature_discard = 1;
-	err = xenbus_gather(XBT_NIL, info->xbdev->otherend,
+	xenbus_gather(XBT_NIL, info->xbdev->otherend,
 		"discard-granularity", "%u", &discard_granularity,
 		"discard-alignment", "%u", &discard_alignment,
+		"discard-secure", "%u", &discard_secure,
 		NULL);
-	if (!err) {
-		info->discard_granularity = discard_granularity;
-		info->discard_alignment = discard_alignment;
-	}
-	info->feature_secdiscard =
-		!!xenbus_read_unsigned(info->xbdev->otherend, "discard-secure",
-				       0);
+
+	if (!discard_granularity)
+		return;
+
+	info->feature_discard = 1;
+	info->discard_granularity = discard_granularity;
+	info->discard_alignment = discard_alignment;
+	info->feature_secdiscard = !!discard_secure;
 }
 
 static int blkfront_setup_indirect(struct blkfront_ring_info *rinfo)

