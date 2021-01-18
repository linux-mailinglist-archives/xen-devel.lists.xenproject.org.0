Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5FA2FA452
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:16:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69736.124946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WFz-0000ys-6I; Mon, 18 Jan 2021 15:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69736.124946; Mon, 18 Jan 2021 15:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WFz-0000yT-2O; Mon, 18 Jan 2021 15:15:51 +0000
Received: by outflank-mailman (input) for mailman id 69736;
 Mon, 18 Jan 2021 15:15:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1WFx-0000yO-8w
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:15:49 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00b9a760-9854-4358-ba02-8f83df09080b;
 Mon, 18 Jan 2021 15:15:48 +0000 (UTC)
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
X-Inumbo-ID: 00b9a760-9854-4358-ba02-8f83df09080b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610982947;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ZvoqJAfEketjlKz4zfIY94yJwiVMCNgf7cpnGMh8MQg=;
  b=Xcmi5trY7WSJU5cV8QqXcFK4YJkErD18w7snvuuYasGv8GBxudqFPGEV
   3SSnIDpU2cSCfKRvI/Xayuu/1TVF/0Fa1VWdpQO7H1sg3iIhS4Ss+1XTg
   rcZgn8sl2UeDwnTapkbTHoj1Uhl6788CMk8fiYF58DJqUgqvrPTopHLcB
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Y83MYN4NDffAqUbvcFxaH5yKXlhbMq0V3XFE7B9f1x18ewnHbsZtYiX6SMSoyp8/tAoYAUhZcR
 4qGfE/Zn8Zcn5CaySklj8hE7YBOGcSgNR6y5jfOLxiI+7ECtfgY/CEWKJy/3WLNT9dB64uhNOx
 47PsT1Rj7Vp/WStw3dgWN0lCHwu2iqMraDT9bvnTPElsKzv/8DBwmEgvuInJeFK/UWdxpi3N4B
 GofwyccRoHg6XfaGF6fPgnM5B2jpspFDkBfz0Ojh4TC1arxm5ZFqmm9QxfQtoa71Mr7n/0qgqv
 gcU=
X-SBRS: 5.2
X-MesageID: 35684672
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35684672"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCnNe4zYfzKqE5QS6cN114pMCkX8zyo/LYMfeCkYIzvA8aSCVM8FXfmWiDGlj1eV9yLwep1CGJjMI+bhoXrEtr3CAIaR+5jvAlptL/SasPAcuVc9/ep0p0EDr/zyaik257Xin4ecxpRm+bqSw2w+k6+CI4lwEJPdoBvfSUKMCNjkbqyjmoq5nP0hd85wtASkscr1ute4w9bnwHs93M6kZzZlHM5pLWY+Zs6F4kV6adRyvFGHZYDMQZFvCsSDDeUPEZ9/LXeCpmcwJNnrglhC7j3+ZXFgqL9ThRbaqC4V/MB4Ldhpa2ktQL6oKPaPRzCl1+N3dXlDnHluYkqJMi2VpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guD3dwThuVjNlUiHYl4Q2Z+Crgc3pWLg845vDPYqznE=;
 b=SASDiVJBNSa1zMGKp+a8twOrD3c5XyiKcYtNj/KU341XdlwYpJkSY/4D6u7yeeIOGenGC0iDRSYOhYdBM+qYu6aEojhtSF3uH7MC3e533klNypQ+zyJZGQ61ZAgn6TKGAKb/Dt0+vK+oBpdLS5n800KcXoDqDRW69ZApgyIpBawvrV0DHxr5Gsig8lid390Rh87tcaKR910k/Qad2T4Af5ykCTgt7A2ACRPAPFTs21YiOU6gjuzNIp7gg/KeK8xMfVpLamXefMgERfZfCRm2wCEWntn7atm3yRX6R3BoH+P76Ftj3lApRlW9+VZvdULkwP1P+kn4pt9YZPqPf4hwFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guD3dwThuVjNlUiHYl4Q2Z+Crgc3pWLg845vDPYqznE=;
 b=XWgrzI8kHxQT+Jchgv9QGP852M3fKafE1bb+6/JtnWXSaV5Iz4hG94aSTqrX0P1hTFWjp1/tDW1fS7lQBau6r8GTazuRlzaUywKKSvVvsrSWCbWomfhTV3LZi0JvmWbKjBZgHo36IbIjfebzhGjOIoaulHMMQf5qeEh/MW7Wycs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Arthur Borsboom
	<arthurborsboom@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>,
	<xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>
Subject: [PATCH] xen-blkfront: don't make discard-alignment mandatory
Date: Mon, 18 Jan 2021 16:15:28 +0100
Message-ID: <20210118151528.81668-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af7a4c56-e8a7-4d5a-ada6-08d8bbc3ecf1
X-MS-TrafficTypeDiagnostic: DM6PR03MB4538:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4538A591A62907462E8DB29A8FA40@DM6PR03MB4538.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKKfLtZenNpYLG8JUgw+FcApWXdRSV33AWxKWt1J5jxcm/pUiVtWnf57EiSUyJTFnfzVrCxr8LMwvYXI+07ZuipE5YfDi5dYBBqazE2bXFUajQ5f63rOMFBPbiixcQh+9KRHE7yN3JGk3asySMfR4aOmBv/P34LHMXtRTC75y/Sr1oMujxPoyjn0UwjuwfA+t5PW9QyHH1YgsETwRKSa3IJVeOMKcUhaaPUXcnneTZHXBRT0IFtI79Ep36at0VAysDOJ/2iyKr6DPjY9T3dBMMhPxr5orL+KZrKTDUxDL8nDaquqvjBISe9vOOqYVNgEd2cPnSGsQKkVXbC15j3l+tMycewdS/eGDRik9yY41zSrr3pmfCG2jVIbN0sZLUdsg6bE7guY3EnE6HGSUknawFmfhr4d5Qi4f2z4b0aqoxvfIfh+ehONHZAyKfen4ZDpyhc5u/txdW+7jAEPXI9J9E3kh1NY9ARd+w+3HYHDIBby9I/X4xP3QS/Q1Apck/sO/kFGuMNf7VVJ2UtPAMM0zwdWsx5LmZzhBRHRrSN1f0bSs3dJJJygD3vM5xTz+PoStFHSD9hQXuBpIilFu9iKVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(4326008)(6496006)(478600001)(6916009)(86362001)(956004)(316002)(83380400001)(6486002)(2616005)(66946007)(66556008)(66476007)(54906003)(8936002)(8676002)(186003)(36756003)(6666004)(16526019)(2906002)(26005)(1076003)(5660300002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDRDa1BVdHc1MjM1UnliaU9HUXczTkRMQWpMY2phcVFZTm9vVW5jT1AxZlEy?=
 =?utf-8?B?WW96cm5MYU00QzhFdVdEY1ZOa0R3R0tqNnZmRkNjQ1ZnVk1ndE42SDNsOEor?=
 =?utf-8?B?R0tZNytwSUR1bmVST0JDYnNMNUY3RmY0TkZrS1h0V1pyN1JlbVlKUGRNbUdU?=
 =?utf-8?B?THB6ZzcwTlYwTG9yNkxFb0dmak50anJucjFCOFhocG1HZjZOMWxDUHdjb2xx?=
 =?utf-8?B?UU1DdmtWVjdMT09vdVEyNllPTzFueXl3ZnFUaWlFMFllSHBUL3IzbEI2MXVq?=
 =?utf-8?B?azlRVW11RmJ3bW1jWUtNdmpsOVV3aGM3R0RWaG5rV3JENUlZd2VtY3VoQi9H?=
 =?utf-8?B?YzRFL1V1YmtkT3N5c0d0NFMwRlNaWktSVXMrNEc0TldjMHN5UEUwbkVOZXNI?=
 =?utf-8?B?N3YzemRzZlZpcmM5SDRnNkZqa0k0dWY3NjZ0TnFqOXFwaklyeHQ3SW12SFNY?=
 =?utf-8?B?RWhUSU05b04wZDhxOUIwdXowNDlGeHB3NjFYQUZKTkdxSlc4dXJEU2pFelNK?=
 =?utf-8?B?K0tPVzBOcHhhbjhLMnVsRWpaRkV2TGJsa2ZoY2VKNEhpdmgvT2xhYUcrNTJX?=
 =?utf-8?B?MGkzWTJVN3lvb09MN21ZZmlKMkpNeWlwRUF3amh6M3Njakhmb1FHTlVaTDZv?=
 =?utf-8?B?Ni9QRDBJSjBEYkZZSlpzZmlESnYxbFhZOWJRMmg1cElLL3F6eVA1aDlRSTlL?=
 =?utf-8?B?elNoSVg0UXp0RFFGc0NHQjRKUTkyT2RwaW1CTEZwaStIZVhwU3JjamxYQXlE?=
 =?utf-8?B?dHJPZFlLZjhxeWNVVDJ3cDF3cG1jbHZOYmJtQnFlaUIxZVo1elVsMFpGall3?=
 =?utf-8?B?NVZuem4ybzJBZHdYOGFYbU9JQ0VJVVlZQUcvRWdLL2licUNORTJSNjBDakM0?=
 =?utf-8?B?OVRrUXJzT1lNckU5SkY4aE1IUklzWUM3UWRmSEFFazloK2s5UE9OSytLN0tt?=
 =?utf-8?B?alNFOVRvY0FTRUJ2bWIzNjVKa3pNRitXZFF6VmVWNitOOUNHR0wzYmxJTEN5?=
 =?utf-8?B?MmpBLzhKZDZrd1dlUW9DWmJFSG9nR1BINjQvSllMN2NCTDZUTTdZSitVTlZY?=
 =?utf-8?B?SnBlNmdNRUZUVUtLOVhHOW1tNEMxWXhsYkZTQjdPbCtXdS83UXhkTDZoYUxI?=
 =?utf-8?B?QjU0NXVsR3ZXTDZWRWtmeks1QXlZYWFMdUV0MWVRN1ZmbXpTcUNLZkVRMmZC?=
 =?utf-8?B?TzFwYnkrR21pYjEwQkRDbDB5aTJidWVDVFA1R3oycGp5ZGlNSTRCU0ZsNHZt?=
 =?utf-8?B?M0ZaeGh1OTdITmorTUpjMkJJQTd0cy9wTFM1ajVUMEZla1gyWXV3dkx6SXdT?=
 =?utf-8?Q?Of4y8hgGuRqEsaWikZYcOcGaymWxgE8uBx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af7a4c56-e8a7-4d5a-ada6-08d8bbc3ecf1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 15:15:44.3503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zd2OJOM8Nih2a0hTWb4Wzt4xEenI0nwfDxlugs89hSdPhLNhOyq+Pvg3aHYpodMmeQA8MvpxaWlyOf9jzluYHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4538
X-OriginatorOrg: citrix.com

Don't require the discard-alignment xenstore node to be present in
order to correctly setup the feature. This can happen with versions of
QEMU that only write the discard-granularity but not the
discard-alignment node.

Assume discard-alignment is 0 if not present. While there also fix the
logic to not enable the discard feature if discard-granularity is not
present.

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
 drivers/block/xen-blkfront.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

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
-- 
2.29.2


