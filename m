Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1251259FA40
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 14:47:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392556.630997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpmh-0007DZ-6g; Wed, 24 Aug 2022 12:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392556.630997; Wed, 24 Aug 2022 12:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpmh-00079s-2i; Wed, 24 Aug 2022 12:47:03 +0000
Received: by outflank-mailman (input) for mailman id 392556;
 Wed, 24 Aug 2022 12:47:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQpmg-000796-1o
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 12:47:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8ece830-23aa-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 14:47:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3796.eurprd04.prod.outlook.com (2603:10a6:208:11::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 12:33:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 12:33:08 +0000
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
X-Inumbo-ID: d8ece830-23aa-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DK7OsHg7XeVqS303vF+WcYzgYVEN1+OW8X7I64+XE4X+6EfsvNPOmt8BFe3TRnPcac8rsYnDRdjDA1ON3+Hr/GX41CEXdzbYaauBXOpcQA3Bu2c266/QzmA+njKVm1O9nKwcFdHIHHHFzjp+wzMEDZifTCUL31++KjJw2njGeSQ6Bch/Joc0V7hBTZhjuwjOr7ud3v9wk/gLSEK/Of9ylVKWjhFQ9fSEOPN1JJLuFGr/oaXPYjioBbTUPW7/V5nzuQdYaWaBp4ocoSlDH3TiSOPMrxXaBNc5L6SsryYubub6aO0QopL+qLyWmdNA8zvoDq3lN9WG9Id49l9UnSCZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjiSw0+oR37MnXYpyF2iC1Q6ey9w7qhXBSA03B3hZe0=;
 b=DOaRJet8uaj5sFVuxX799DFfeK63r8VcmbQQ8TU6hdt5LhU2xZy9QkVLJmA8Xteoz7pb96qUX+0KKzXvb4GebzlHTYPNXSHypBdyiAHWV0tYJj79R/ep3G+nY784Lxsc88wwH2qM3TkRozpbnqHFbhgFLZDbK76IGeNOl4ZEgeZhq9PCAI0u4dl79BYv7I2viCkR1Tr4npYoG/jqODb3nZzGBTnBIZXNx8djqWOglWwumFkozDWVB6/a1BZAiWjYxWx0qICta1q7apPMhW76WGlEHh4UWPzBevy+qxFe92HkYHOlkmiPXApKuplSu2/GJOBDxC+Ia/p8NaRqvci+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjiSw0+oR37MnXYpyF2iC1Q6ey9w7qhXBSA03B3hZe0=;
 b=G9afci9qJl1UE2i27LsYTv0JrKmrfYnk586UcRa84zBV/IY+syFjZO40GSrJPMG8b5mvdSmltG3kFmqz9ibQp9cMQ6iZLwBB83gmNOKr3yzR6x2jHpxry/7Sbo55kAjoi/yYGZ8Gh9hNd33PUy1IiPEVyOxVOgcwPV6cQwT/iExOXg/KLYaDoAd3yidNm++XCC4q6L/J1sWPxmJ6pW2aT9f1IAz5bP/HkEC8AVm1PSrINuT3Bhm5wSLwMMd9aOfpEkVj13E4jZ/xJtQ/9612a3qOyodZh6ykRdxUj0qZKB4FqCBMpaYlE6bCr5JW0jcmHggvI1J2UYaVL4ypirWhvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <031ce9f6-ede4-f371-da04-ff8c2df209dc@suse.com>
Date: Wed, 24 Aug 2022 14:33:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] Arm32: correct string.h functions for "int" -> "unsigned
 char" conversion
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
Content-Language: en-US
In-Reply-To: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3db1b082-9be0-4b84-2ce5-08da85ccccb0
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3796:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n3ON2sBECBSAppuV5NoYCf4/kHIc5w8F6ZJhbYctbWnlJwHryLCG5Oy+nDgHl08VzozK/I7RQhmYXfW++DCFybOClStJDUj5+W0Eb4qaJNk4nlkKITSqw3Hk+TTHNkQPqusPd5uGwLSh54YD83yLEyJFozRvjSazGyxDahR8yiPkzK5PaVP0iFz35ZwOrPh3xwcve+scUCBvjU8Suey16Jcsq1ijvvSHgedZPpCgOvQ80Nhm8TD5RdtRcJUgA6ibxGolYDGUQVqheOqPAaIjCXTLhzk/MhChmGNlxG7flqJJnugB3PvV07bg50qOLkkvipf+tE5fYn4nh5YgN0L0RinuyHxtL5UvEFKvehrd073VyK13MAvK41jrPmChFYkYlmGwiya1uD3ro1HGg7Azsfe7J/8qcHpOGn5pZlnaaB7TQl3L12mxW5ONXAmCcyxvQ/IJ6Ug7powTWF4I2ywh8+DZ6iBxhAXa1ujBRzG9IyEQxJS8Cf+jWfyHUi5JDJ4AmPHuRqZ+oGziMVrMNIQPJw+xy+DywR+AE87HN9hO97mPSZ/AML65mwY6vPz9gkovvhNMC3SWcQrxDgW0disBg27BXE3VkoZX1cdy3sAUZGr6zvHRKxV8s+2R90B/m7tbgg/7YsrE0hG270pZH5JqNsDkpJa9qQhRBWRoICEfh6K4Z5Ne3tah8OBWJmESEv9+btqMYPWBKdMvBWpjaxw4n3/p145ONFV4uxAMoDFWinMp61+3pIOyimD7mk/D4Ow8QS4u54dt/rWYqdWVD43BYxBFxCsdeacpSaMqAlek2/8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(396003)(366004)(346002)(376002)(54906003)(38100700002)(6916009)(6512007)(31696002)(31686004)(316002)(86362001)(6506007)(36756003)(5660300002)(66476007)(66556008)(8676002)(66946007)(186003)(2906002)(26005)(2616005)(8936002)(4326008)(41300700001)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEFOTmUycy9XY2pNK1ZyVjZwcUZ3ekV0ZjdUdG13M0tGUUd1ejJoTmZYQU02?=
 =?utf-8?B?RGpMbVI5ZEhjTFBlRGN5RUJabng1dzBSOEJSdTRCM0FRalZEQWVXWmV6Um96?=
 =?utf-8?B?d0RvNHRBRDNWdXB1ZXpqMlIwZkN0UndYNVR2NWt6a05aaERaa1RBcnVKTCtF?=
 =?utf-8?B?aGJpTzRFdlJFYUxwVHJXSmNzWkwwMHhXeHBjVDNFam9RRmhCV01wd1VUN1dr?=
 =?utf-8?B?MHhhcUx5T1g5UmJhYUNhYlNzRFVqR0I3UjVtYkR3LzNUWjEwL3gzaU8wK1Bp?=
 =?utf-8?B?all0VzFQQmZIM283L081d3ZFU3R6cWQwVzBhZlNFTlB0V3FJL2lrWjVjRG9I?=
 =?utf-8?B?dFRsLzU2aVg2TklSUFhxd3ViMkRIUHJyTUlLN1djWFlYMVlOTWZEYTJ5OW9F?=
 =?utf-8?B?RE9UZ3p6OENGOG9EQ3A1MjdzeU9DV1VkaXkzM2lEQ2xwbzMyNjVQUWVna0VU?=
 =?utf-8?B?RkprNkxlbFVMUWxaV0R1WUp3ZjcwbEw2OE1wa2lFaUJhYllrR0NUenZ2R1FJ?=
 =?utf-8?B?NEZpNHRPTVhud0dGcmJib1dzT1Z5S0F2eGlQckd5bnZ2N0MrSDgyNWFPNDlV?=
 =?utf-8?B?Nk0wMzJER2ViYllaZDJrbFNleHF6UFBCMnVMaFlaLzNNdDlmSVAwU3pxd2VS?=
 =?utf-8?B?bUIwQjcvZThHdXNjYVM1VDNLdTFOZkVJb3ZMbGVCMzh4Mm5OTC9yVjI2aXhn?=
 =?utf-8?B?KzE5Szl0dDVGZHJ0ODFKODF1U2g1ak9MVWdKYzZHbHhRWWtSYWdTc1Ryak83?=
 =?utf-8?B?T0NkbGZRQ3ZDMWhKTEdZRzZWTEpJREgwQlRvTGV5c1B6MDBmUldGU2UyRC9m?=
 =?utf-8?B?OE0rQkR5YVdLR284TFI0c2ZQY1VzdU5laFZwNFFmL1dZMlVPWm9yZlRnTmFG?=
 =?utf-8?B?N1kwdEpPQ0NVK21ZZjNRdHNzbEJ1N3lqTDNYZUxEOWZoa2ZnRXlyTElOTFFD?=
 =?utf-8?B?QnZPeVpkSEs2MUlWN3hESzBwUGExY0pBRW5BSzBFUk5MOXVkVWR3ZXhKVXNQ?=
 =?utf-8?B?dkk4WTRzNUhEaEx4Z08xeE5HZHczUWx3dmRmT2gvTEpicnNsOEp5OWhWWkJQ?=
 =?utf-8?B?SHlKODlRZXcxV1NxMzZGTnBNbktQMi83ZHdXY2N6NFZWRDRxZWJOMTVRbGxC?=
 =?utf-8?B?M0dnRjJTcVQyTzJCcTI1aTlZeVpnOXJRNmlFUEdadkhBR0xua0JzV25jNmt1?=
 =?utf-8?B?aU9JT2w2NHZYZDM1U3lKQUF6cEN1bktqd1ZWajlDOUtzNGdkaUQ3d3phZkQ5?=
 =?utf-8?B?RGozb2pITW0xVVVUWER2aWwyYkRjOGtJTzBaU0lUaTlHZFlxbXJTTmNML2xy?=
 =?utf-8?B?dzA5QWMxcFkxMXdaMGFQQlc2UkdNY1ZqZG52ZkxndzdiU0dHcCtMOGNlT2pV?=
 =?utf-8?B?V1NkcmljWEJhVUI2RmU4b0lZdG1OUkc5cDBxbVhtZEVsbTl6b2N4eS9UbTJF?=
 =?utf-8?B?YzExYTh5TXZFSGlKaktrWElSWkQvenBUc21DNDduaW1QU2l6eklDM1NDY0Q1?=
 =?utf-8?B?bksrM1ovVTRESWFGb0FkMHJmNmpObERzaUVlVHp5YmtSOUFlVmxTN3J1SmRs?=
 =?utf-8?B?QjFjV0RPRmVBQ01YU2N0aktnbHFGTGl4c0NZZWpVYzFhV3NTOWRZekg0NVlm?=
 =?utf-8?B?SGJYdFRtb1ZudU1zellGd0w2b2llc2tTbmtQVEFBRGlDbVN6bFVJQTVoazBD?=
 =?utf-8?B?UllDdlNrUExaUWUyNnlKWmtBRkQ4SWJMODhUc296T2pQbmJKR3lKN1dad2ZH?=
 =?utf-8?B?SmZGWEhzSHhLVG5nUVZTVUYyM3dkcFVyM2psME1xY2R3Z3Y0L3BXS0lUT25Z?=
 =?utf-8?B?VFZJR1h4cEtCaXdPOXBFUmdzZDFrNUhGUy9IQU1nRndjV21vUEVXMVY3eWda?=
 =?utf-8?B?VlVFSHhBZVU4QlM0R29BMUplK2pIend1VWRCUXp3T3ZjVUJjM25aR0Vqc05D?=
 =?utf-8?B?QXgrQUYzTHh1d1g0QXI1dnBvYitjdytuTSs4MWdpSndxUW04Q1JSaTRkZVMv?=
 =?utf-8?B?bS9ta0wzVEE0dEdjZzR5NEpCMkthTHNCMzFUTndVclpkSE91cmgyWEZJbHI4?=
 =?utf-8?B?cHJick10M1lmdmFmamFXYUluOWcrS1FDck9iUGY2QThndlpNc3ZuM0l5TFRW?=
 =?utf-8?Q?eT/1wz8glDcNDe49vQl8eHLQV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db1b082-9be0-4b84-2ce5-08da85ccccb0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 12:33:08.1985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mF1W2hznHrKFtbcEwgBkC+BFcleXJNkU9XvbVPdpnlKM/D5DFMub5g2QDyNypUDb6CPuf5LkVv7VTaNgpEcGGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3796

While Arm64 does so uniformly, for Arm32 only strchr() currently handles
this properly. Add the necessary conversion also to strrchr(), memchr(),
and memset().

As to the placement in memset(): Putting the new insn at the beginning
of the function is apparently deemed more "obvious". It could be placed
later, as the code reachable without ever making it to the "1" label
only ever does byte stores.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: For memset() use the "more obvious" adjustment.

--- a/xen/arch/arm/arm32/lib/memchr.S
+++ b/xen/arch/arm/arm32/lib/memchr.S
@@ -14,6 +14,7 @@
 	.text
 	.align	5
 ENTRY(memchr)
+	and	r1, r1, #0xff
 1:	subs	r2, r2, #1
 	bmi	2f
 	ldrb	r3, [r0], #1
--- a/xen/arch/arm/arm32/lib/memset.S
+++ b/xen/arch/arm/arm32/lib/memset.S
@@ -15,6 +15,7 @@
 	.align	5
 
 ENTRY(memset)
+	and	r1, r1, #0xff
 	ands	r3, r0, #3		@ 1 unaligned?
 	mov	ip, r0			@ preserve r0 as return value
 	bne	6f			@ 1
--- a/xen/arch/arm/arm32/lib/strrchr.S
+++ b/xen/arch/arm/arm32/lib/strrchr.S
@@ -14,6 +14,7 @@
 		.text
 		.align	5
 ENTRY(strrchr)
+		and	r1, r1, #0xff
 		mov	r3, #0
 1:		ldrb	r2, [r0], #1
 		teq	r2, r1

