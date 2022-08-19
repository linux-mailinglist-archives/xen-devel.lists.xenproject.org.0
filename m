Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B83599653
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 09:50:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390053.627240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwlS-0007xi-77; Fri, 19 Aug 2022 07:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390053.627240; Fri, 19 Aug 2022 07:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwlS-0007vg-3h; Fri, 19 Aug 2022 07:49:58 +0000
Received: by outflank-mailman (input) for mailman id 390053;
 Fri, 19 Aug 2022 07:49:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOwlQ-0007vW-Nt
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 07:49:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84142997-1f93-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 09:49:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7655.eurprd04.prod.outlook.com (2603:10a6:20b:292::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 07:49:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 07:49:53 +0000
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
X-Inumbo-ID: 84142997-1f93-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9jU7UQEEEUBuISkTU24kuI6qDygnXYuE7GakadlFbfV0cz37IT2cS/0aWR+86ld7oHVuUwYS63h9DIbpG4/lhGDdeDfRLciVQNpuNBE40dO4XbPTF4555lFUCzdISQKoiQqBzD24nQPVb3DWalQQz+rXkx0OPBhvPLBJdaamr6coxDwaqFRUM/jvpcJyBUd8Z1TBg7BAb6dLUF6F9ou41D8s4nvzgQPJMG26tvfEBxwShetsKGNjprYFi8WuxMBP7tKD4+6l5hmgAM463ZeVbAVCySO4DPduPYickTpisuQmnT3QlXwm8YvTgAU7IpnEwVSoajgcAnHg6MWEBhtnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3RXVG+eaVf926YK1W8KCyqneq7P2OQCjFonkAYO/ek=;
 b=PdN3cI+DFcv5swa5LDbGUulF6aVcsrBunWFFvDAhaJajP8IIG7wTN+RM/fn2grfOyEWb5W4MPjCs/oKHmCcteq71UrShO4613T3ZPw46YLxKyvjJ/ft/I88nH7ZZGfr54WmBtLFA4KfVQMKOu/9gyV9Uzcvd4P4xyVkEDT+CzUMKlnCuW4nZ6ZFXcxWTJR7kKV1Lv2x1jMElrDFddYsDqrgmixGLw8TL5+ajZoGE6ID/Vpakp+0A37DKcPXJJiY3L5DNotvFoDHzptUtF3N5FORiH6NDJ2TBhvNFt+lqjg50+lC8yAd7qXyxeD4BkVQg6VXriSR6Bf9MAF5gqd5pqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3RXVG+eaVf926YK1W8KCyqneq7P2OQCjFonkAYO/ek=;
 b=c4p6p6dfmKIqv6Oh6uCVrSbzLasSdgjRyQEhkcl7mZqJ01aLPbkVIgvOhXCcUO0T/tItvJWLvclATKUOl4yx7V6pYGS9o2yeCGmjgtSHj4iahI6dd1B6Lan9TWDj+U7BnXpRLH8CUfRbnAi7qteDP/vPfUQtazkIDjK5TPS1rKbHqPmL9A1dcGm4dKrTs2U/SiL2H3uBnnsWceo1FZT/nf1NGNUGY3/CpAKQGf6s+A5WnkMh/e286WLKyFu7vdQ7o6AnNcnQCKW5YOlApWWySFO8GzpMsMX/6ouNlpbxnMbGL1NK6M9EBnKXmUud3xWPmzulxSrDLaTPl0IgfXV5GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <14e9bd8c-3f4c-4d7c-401a-c9de7b483308@suse.com>
Date: Fri, 19 Aug 2022 09:49:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH 1/2] Arm32: correct string.h functions for "int" -> "unsigned
 char" conversion
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
In-Reply-To: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0133.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfe121e3-f231-4bf5-f7c4-08da81b76724
X-MS-TrafficTypeDiagnostic: AS8PR04MB7655:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nx+akOKrmMn8xTe0LC2hdtELXOYglTRZ3zFvyGw6skJhN6Kuj08AQIO8f531eMu5QgXLO/RXE1hyEmBYDDaRLRJFZ3w55UF5Hbj+vun2a3NsGkVu13fgqn4kSe1vrt/conqMpoZkNl1vxp7PRnuqPDr6cxPjQyEtBmwm4nnvPri5aewlB3sCYivEuqIY5DJ+OsGrcXGm6SSfyRH8wpnAJh8FfNs462EQD7caMwJwYsoVFTLUaejoT+AZLhXOXfU/RtiVk1kAt+BJzH8cRdi04N4FFBEpEX8s3vTqvv5UgJZP5PnL6ARR+xRug6VaRIqIAS9Y8oPczDOEGyhDLRmDXbkqgEqAFbiw/JhCiouOc7aM9xGZitxAP0VaNe2RDrlS6APk+DQr9hHrgLONiQKflT36JqbqFe0/P6xMeYOxaioSF3LJXvrZ8Y6nZideq3PIZbURKQnN+cENdkde1luQHZphJ/+Fzq+cuEClQzDZD1CNn0ciJ4rXGqb1JR2YwOW2D8qfCQY24k0YzudBAdwoQbNNG2UQR9Q5IDN9cBe0wZH4E6JWjX7lXijJS2IL9M2/i1Q9fhYQdNZTmevr5DHyJ67MSYcarTvpbso2TEJ8vOeeEAJS6Jrn+40wBR/fSv4rJSvYQcbsF7AXfZLSuGioqjDfR+QkqgLqzjkh+iNQPN4UK/bUhpwbZurtB2S4JgG4EEBtqxNJ68YDBn9DuZauCRwLO3QBhYtH5x7S/5Hw+e+G1gyni8s60Wp146RkN446iz9Yy7EZ7WgaOVVdIWeRVgHySbzvbecq0LZ63xxI3e4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(39860400002)(376002)(366004)(6506007)(26005)(6512007)(86362001)(31696002)(41300700001)(6486002)(38100700002)(478600001)(2616005)(186003)(66476007)(66556008)(66946007)(54906003)(6916009)(5660300002)(8676002)(4326008)(316002)(2906002)(31686004)(36756003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUFCU3JMaUw1NkYzYWV1b0pSQmJ6elh0WXRLRVM0RnRoTGVrVEdPOFF0bE9J?=
 =?utf-8?B?RUhKY0xFOEdkc3pkOXkrUTg1dkNlZmdEdGFIUkRXYjhraDl2OXlpUHJPK05V?=
 =?utf-8?B?ZFhFbXhOcWp5OEcxU0c2cmlzTzlVTGFTc0xMWk9LdzBrQi9sZ0NuRmh5SkVO?=
 =?utf-8?B?WDdMYmMrODJjSk5ENDNucnlaOTM4WkFzQUl5bW0rbnVObi9xQmVzTU9PUDdi?=
 =?utf-8?B?L2tiQTBGcGhoeG9RbUJxK25UZFZvdW9SdUpOc042WVZTYVNRK3JGQW9oaGtY?=
 =?utf-8?B?d0R6Wnl3VlkwRmJ3QW5iYWxzVTJXSktTUzA5YmVKWitTRDM4QmJBL0JiZWM5?=
 =?utf-8?B?UjFVbGV1cDI1Z2FsQnp6WFlWTUdoZFVXbTB1ZlFod0VFU0ZBd1hyL1FPcjRV?=
 =?utf-8?B?L0JEa0ZEeTRzeUIzNlBSMkpSekR4dlI0MTgySDVBYkJaYmpSQUdzK25OekYw?=
 =?utf-8?B?UXVyWWZoMVo4ZVNsU1JaOFZQek1LRjY5SHFyUVpIdmlDN1dySDBKQUoyV1Ja?=
 =?utf-8?B?dDRCT080YlpSVXJLMHhnTzllRkFNQVRqREVjRHJlUWNlTW1SMGw2bnFTdnhs?=
 =?utf-8?B?T0k0Q2pTZUd6dEhDSFZYVFZ2MHl1eVcrTDdMdG5QM1JQOEJ4ejdXZkdubS9V?=
 =?utf-8?B?a3Jac0hFUmtPSS9MMFplVmZpWWtJS1h4UHpucEpSbGhHRjYxSHZmSFhrWHlW?=
 =?utf-8?B?M1ZhYXFQMmpRZnFyUngzREt1cDkzUmx2NVdEUlZaS2VKOVBqSWw4YlpTeWNP?=
 =?utf-8?B?RHJmNTNpSGtHT0haRlU1am80Yms2OXd5OWc3cThtdi83RENvQmNnMTdGUlJn?=
 =?utf-8?B?Tmd4WHp1RW96V2xha0EvRzRSeVlSeWM2eTI3R2huaXhHU0hjWVdtY1lSeHVL?=
 =?utf-8?B?RStKZWxwZVZCdXAwWk9xU0VaYTZKc2ZOWVFSNXlSaHI4Q1JXQk5nWTgxVFhl?=
 =?utf-8?B?TldvRFpuZXp0MEIra0NKSGx3WjBnNEY2RnhSU1RlY1FpcWtGVGxaWk4zSDVa?=
 =?utf-8?B?blhkakJId0s5R1BPa0JRMmF3T3ViRWRXaHNWcDNjOXJ3c0tKS3RPK1FhbzBo?=
 =?utf-8?B?T1RsY1FzcFRMRVptcDJseW9NYW1DZWVya1U2allHN1RJSUpYU3N3M2MzaUhX?=
 =?utf-8?B?QThsNWw0czlzNnk5MUNMdHhGcFdxYUIxQ09tUEZ1S1ZGdmtGa3ByS0NVTXhP?=
 =?utf-8?B?T2FHRWFwVmhKTENuQTdSUG5vT3VWOHRNMjRuUU5wS2VFeTlvL2FtQnVGVmRO?=
 =?utf-8?B?cmpzQ3Y4bzhKcW1nZ1BLMzQ5L0dPMDN6V2tKQjR3eWdkS1owTExZY0hjQ2FH?=
 =?utf-8?B?ZmhxT0pQMzk1bjg1alhuRnRKN2Z3QmVjdWg2elFlWW9Ueld6dHlqN1E1b1JG?=
 =?utf-8?B?bzc3YlhNNmVKellhbDFpT3pxVVZ0WUVUbGtYd3lQd1RkR0NaT1BuQnlOZDQ2?=
 =?utf-8?B?OUFmdlhzdFgzSEhpT05hN1dGWDk3dmdPRXUzT1UyeUNEc3IxZFo2Vk9TVXBW?=
 =?utf-8?B?bTlXZnZXN25KWnYzOHIxUjM4VjRaaVRWWDAvbDZPazBOK1ZIcGFlcDQxbjdr?=
 =?utf-8?B?bGg1S1Q4UzI4VWd4S0ZRTENxR0hCRlRTMDV3YWc3b29aSDhQTHRFOVA1M0RO?=
 =?utf-8?B?RHlPcEhtNjVDeUtlcWtlV1BsWXdQd1c2OGZOa1dqVXQxQjNCMTcrT3hrNjk5?=
 =?utf-8?B?cisrMDVBbldBelRaRStIV0NDMGJTYXI1VkI0cU1nQ3d4VE1ET1FtMndtMHVh?=
 =?utf-8?B?QUtSTWVVVldEcnRSNTQ4K082cnYwRFZBRWlXL2VnZUxSeStIa0pWd2dlc1JR?=
 =?utf-8?B?T3Bud0FONzJkVGp3V3B3UXpudjYvNTRFWloyT0J5WWprVlh4bTN1UmZhZ3ZD?=
 =?utf-8?B?TjRCOFpocGNhaVNrN1FZNEtua1pqY1pqelp3bHVGNlFSbW9vaEo5WWdBVURx?=
 =?utf-8?B?QVdkRjYzRHpScXZxNTQ2N05CWlJ1Rlo0emhPUi9xTWZnelBlS3pYb0xaZkVk?=
 =?utf-8?B?c2g0WlVBRWVTV3pEYmliRHo4YXVwYWUzNUNJS1FFcnh3bW90NjBYUitKVmht?=
 =?utf-8?B?a0lRUjk0RFl6M3ZDOXQrdWZqa01GZDFZMDM2bWdteXYyK1hSek1YZ3ZNemtp?=
 =?utf-8?Q?08kjaoy6T1n9l/V3LS2hoJYO8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe121e3-f231-4bf5-f7c4-08da81b76724
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 07:49:53.7226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcOMmDrAAJ0L0pswp0m2bQOVN0hLfXn4KS2/rL5TeZhRrb0F8haOzk2tJe4aRnEowh1/9wFfytcaR37ptaJBXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7655

While Arm64 does so uniformly, for Arm32 only strchr() currently handles
this properly. Add the necessary conversion also to strrchr(), memchr(),
and memset().

As to the placement in memset(): Putting the new insn at the beginning
of the function could perhaps be deemed more "obvious", but the code
reachable without ever making it to the "1" label only ever does byte
stores.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -21,7 +21,8 @@ ENTRY(memset)
 /*
  * we know that the pointer in ip is aligned to a word boundary.
  */
-1:	orr	r1, r1, r1, lsl #8
+1:	and	r1, r1, #0xff
+	orr	r1, r1, r1, lsl #8
 	orr	r1, r1, r1, lsl #16
 	mov	r3, r1
 	cmp	r2, #16
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


