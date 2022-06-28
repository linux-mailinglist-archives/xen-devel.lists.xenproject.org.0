Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B64255E5DD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 18:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357285.585793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Dic-00069Y-1J; Tue, 28 Jun 2022 16:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357285.585793; Tue, 28 Jun 2022 16:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Dib-000679-Tr; Tue, 28 Jun 2022 16:05:37 +0000
Received: by outflank-mailman (input) for mailman id 357285;
 Tue, 28 Jun 2022 16:05:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5PJw=XD=suse.com=carnold@srs-se1.protection.inumbo.net>)
 id 1o6Dia-000673-P0
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 16:05:37 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10067.outbound.protection.outlook.com [40.107.1.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24560c15-f6fc-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 18:05:34 +0200 (CEST)
Received: from DB9PR04MB8300.eurprd04.prod.outlook.com (2603:10a6:10:243::22)
 by AS8PR04MB8387.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 16:05:33 +0000
Received: from DB9PR04MB8300.eurprd04.prod.outlook.com
 ([fe80::95f6:44a9:7525:1a05]) by DB9PR04MB8300.eurprd04.prod.outlook.com
 ([fe80::95f6:44a9:7525:1a05%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 16:05:33 +0000
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
X-Inumbo-ID: 24560c15-f6fc-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpHs7xj8DinGhJ0+b1NHllpEFoX3myqMxy5zad/m05H6iQQzgBPWITNm1KgI2KXpIQN6vXyK1cprJUbFAik7ZS5e+6T4mMD/IGeJDfeQEuQIDwNvnrqwh0wbdI7u2sNk1B6EYSSN1Surg3DDth/VhPHLQZJk+xHm8pSZ5DxP4/vuExopyT1u4+KLqWvwWPadkBBYYB6vMkQa9Hj8rFmOS5jEwZFQcC7EKSNdhWAY5sajWi05sXZ7HzzBPMnR8xR11x5HwD3kohmFPu3BhGFVkkzc5iIzVDAOGCc/dWqp2ISbwQQI7MtH276CQLU6z6kN4MZaK98uCLs7rvl8fNus3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3l8Y3qZsdbZY8qpM11t9AOxhibLw8tbAwdpafDyLAU=;
 b=k1nqMITeDbafmEMhd2eRTh9sI6VC1B3AbeiVf5O+rc830VTb7MxDvwUfbwg2v1CcTFclcwoVzyG+d9KNw0QhWJqRHb2xkr1kHta9KVKEvmdzWViCe8AsYeV5jgn6Dpe5ao+Ye47YUzoLJpOfgIJ6T5eP3jAcftut8deEv1Xiy+rGu8pY2appXgip+lpEZsxr9YsAOORQxCA8ymJmhTVHPtFB15yOZ+DzAFEMBWKYP6RyL3dpcbxV5VaBzkvxBlzxsbNL3i4DwcNMkcejyme/eDW7Mt3TK5BG5bZDBoF/scqhFelMbaMe5Y7IFwkuGWCxqNtc3vt29sjY8wXX4wmIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3l8Y3qZsdbZY8qpM11t9AOxhibLw8tbAwdpafDyLAU=;
 b=w3n+GNK02D1+MRr4bOWI2S0aY9y2gyerACt53xrs+4LWdUEXxM0t3AZLHhExvBPZFe1J/unJOxmxJLqo048hyT+clTGH3kuxIYaVdhR9RwjmRQ/ixN6Z4IQgRAnwHhN+PTZEkOXkLCwTDXp/eFG2n2IW7ZC61cUMfuRPSl2g7//6FpWOVBp5HSNX65m6NJ83xqbeKz3mbQhNM5Ns5jZxYD3rXyDdNrozcKMIr9xvkeT/zW3jisILuImLu5vEW+4IFfZGdBDbU3X++Vi6QPNpPs0j5A+1+MATjJP4W9ol6122N3esry/msk7Oun/uQyC0htyCy2gthCSIUJbNKd84JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
To: xen-devel@lists.xenproject.org
From: Charles Arnold <carnold@suse.com>
Subject: [PATCH] Fix compilation error with gcc13
Message-ID: <46d17735-e96f-2eee-5d24-fc3d15526c6e@suse.com>
Date: Tue, 28 Jun 2022 10:09:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0737.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::13) To DB9PR04MB8300.eurprd04.prod.outlook.com
 (2603:10a6:10:243::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b7d5919-cd1e-400a-a2b6-08da592007a7
X-MS-TrafficTypeDiagnostic: AS8PR04MB8387:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fX/Pj9labirptvHOUYrIqeiXLaDwW2dXzoaFhw739Cf8qViqvpEBLNyroSA4Uk+0QvOghverRFQmcFwKu4jkRrjtup7OC9AOeKpa6crPu/jH9xT8ZC6HXlQemtNumxPqSt8jvhajYtDBDhwFqrIRdZI113TPYlg2ZhjqLOw+WQCUu3/d5R0o4/LYaoTc+Livhr7c3HW3qm7Q6bWPFpSpJ7e+ccqTRXEwOZzYLBc8MN0sa9w0irHGu/TB3fIUVd+gmE3Jn2bgCQduVbtxPzS4QdV/HfrsLF8M0OkTajc2exKVs/ctMT+/ilY46l18C1E4EYD5qijFqYl7QdrqCNSQ8PODJZQPgNfF0pG939oaiGoBkukKQsUiW1gFAb5yU6rykX97FNEaIBHAKhJfCHWbvPOvDGg05nnth2W/ad1697fiE1s1ieuvJNRv+xsK+nPQpUw4Z4V0vbM9EStUTlsFzk4+N82HS1XHipsz4o20MMPvj49MBeNAtv7g/V6X0raXOp6BEKn3QsE9hPU3L+7aEG2zE3SZPfpzYnJHi7zS12FPaS1155ZP3+VK/OoRARW2ztIc31miqngYLq+vA1x/wT/f9vR7tkQTQvX7pio/wiQrOFzOMtPU/0VhpI+wEQ50VDdmTRKfszWZk1EtY3kq0qRVrXCFatcLWRtkJGZ7Arm4mpwARmq0In81ysepTkZXoN1ezSNOZok7pGzqdpfpSyCjfBBewnBpeQCBTdA0/tgAHHyvOjNgu2iI5RDFZ0mv1xZ6ZX3h2A5b40FkXM61RmFyfvnzA8KL5RdjJDDY+lnmeRlDlfQUBVO53oV+DOvESsJzfzRoNMQXxwiYWivPEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(39860400002)(346002)(376002)(8936002)(38100700002)(2906002)(36756003)(186003)(6916009)(316002)(83380400001)(31686004)(2616005)(5660300002)(86362001)(66476007)(66556008)(8676002)(6486002)(31696002)(66946007)(6506007)(26005)(6512007)(6666004)(53546011)(41300700001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDBlL3J3OXNoNEd5TlZkaTh2TkVaNmNOeTRpVnAwdHB6QXJidFZ3Z3lvd3VC?=
 =?utf-8?B?SEZXdTV6RTA0dHpTRkQ3L21nWEkwWVh2S0xVRjhhc0lhVnRqYnFxd1F2RXBj?=
 =?utf-8?B?aFlJMzVpZllnRjJOSzZibjI4NkEwK3c4NlVFRjlwZHROL2k4YmtPZkRoTW0x?=
 =?utf-8?B?c1B0YSt3M2I5NUNPaVltNVQrb1FZalpnL1d1NHBFenZTYVRFNUJKWXB5dyth?=
 =?utf-8?B?S2tsdVBvOU1MTTZkV3NLdGJQVGRxTkxpVnU4K3FFZngyK1MyKzRwaGVWcGlK?=
 =?utf-8?B?RjNmanBVaEsrTE10N0pQUG5Nd3cwWXBPc0g3azFJVDZWTkNodlRCbHdEY1VQ?=
 =?utf-8?B?eisyM0NmdEJ1bW00dmQ2VERkM2kyU2xBUGdLQUtDTkhza3ZLNGhyMTkwUThs?=
 =?utf-8?B?RG8ycG5YOU5DSk1UK3hhTU5PSVFvYlJZa1FhMUJ2MVZqeGRDM1lXVC9VMHNM?=
 =?utf-8?B?OURmcy9JUnh4M0ZydldJL2pPS0xUYVdJN3E3cnNSbWYxWkw1YThvY0lsMUdz?=
 =?utf-8?B?K2M2Y1daM1V5Vnc4alNzM0kvYnhSb1M5bnh2ODJlK3JveVBJSWdOemtVY2xZ?=
 =?utf-8?B?OFh3V1ZNSEdkRG5HK2cwSnJRYzRLTWhUdzY1eUNwTEVDNUNuWkdUckJvQW54?=
 =?utf-8?B?bktHaVVXTndrMml2RGNLVEc0NHdDVXJBWnBUMTU5N2RWb2pMMnMxUlNYM3pa?=
 =?utf-8?B?QVhhM1NLSXp6TERBcCt1cVA3UWJrTmpnWEhTVzVNT1IvY3JtUG5zdURyR1lx?=
 =?utf-8?B?eXA4Z0VmSDZEaEJJRlpuRk1zbkxlTzdueWN0MEN6a3k1b042Nng1RmcrMHh3?=
 =?utf-8?B?NjZJOHVOS2ZqcnU3RFViSFVPMUZzdjU4MTZYay9yMXhaRzNLazdsTFZ3Y2JM?=
 =?utf-8?B?NDBlYkhtVjNISDBtb2V0SFZvblBpdklsbHhRajFOblRCRnp3Ym5nZ1l1Sktp?=
 =?utf-8?B?ZGpGMUwrampRSEhRNWthbDJNandiSURpUkxsaVpVV2o5eHY2bWM3SUI5ZWds?=
 =?utf-8?B?VHUzbUd3U0tLTVY3N0w5SWg4V2hNamxocFJkVHUzWTh0MEdnb2JyVXJhSmRE?=
 =?utf-8?B?azRaZzc4NGhLdWYxcnZGYTl3bzdleTNvandLNXFiTHQzODZuQi90R2xhSnA1?=
 =?utf-8?B?WTFJMVU5ZEx1L2FPejJTb2h5cDFVakxRZnppUGpiYmdjVEpSYzFId29RQytr?=
 =?utf-8?B?Y3gvSC9OT09LNlJGL3lmOGRkekJnUkJDcldpMlk5bWFKaFdjQVRZdTNnNFFF?=
 =?utf-8?B?WDI3Vkw3ejB0aERyYUZyUHFQdFFxUkxQcGtNMkw4VUx0SWJFRktaT1hSUUV3?=
 =?utf-8?B?ZXNydG8yZ1Z2aHVuUjdnRTRyUzM3NGRsQW9ZeWxNb25JR3BseXRQcDRmZlNZ?=
 =?utf-8?B?ZWVjY3g0a1l3WE5XTVpUOW9QWmZ1ck5KWUYxcVJqRlVqaUZvSVBTNWJlQmFD?=
 =?utf-8?B?Y3hQN0RxUUp4TFozMEZNckU0NEYySXlKeUxvWCtVNWxDaC9ESmNZSHV0K0hh?=
 =?utf-8?B?aHVJTWRJcS9qZlBiUWNjdm5HUFRIbGIwNDNYOHluMUVNZ3Jod3Zrc1EvUmR6?=
 =?utf-8?B?Zy95Mm5UTlo2ejRyeDFiVURaTDY1RWtNdGZrZVZCQ3NuVG1mRWN2T0V2Wk1j?=
 =?utf-8?B?SG9LR0VNVjZqZzZNUVQwMGpnVE1zdkR1a0pyRU9iaXJZOURDTVlyOXkyeXFK?=
 =?utf-8?B?Q3hTNmFmRkErNzZ6NDMrVjV5M2c5Q2JGYWFvOUw4WlNSTEhoellBdGU4aGJN?=
 =?utf-8?B?TjFYUVFXRW1US1FvTzlMY2UvNDd4c0RMVGJPRVJQelRxeDEvM01oQ0ZXbC91?=
 =?utf-8?B?eDdIeFpubFhaT05wSUxCUWZEY0J6SWUrakh6c1p1NXFsS1Z3ajZxTFE3Q0I4?=
 =?utf-8?B?YzhjUUV2UUlMOFEwbjg3VXNFYTdhUVBWMEFUWnp2dnphU2xjWDVzZEY1WEll?=
 =?utf-8?B?emVWbk9EZDNkUDdxcW5tMnMySkQ3VlljTk5ySlBXUlQ3UElZZk5UK1dEMCtD?=
 =?utf-8?B?OGZjZ0tvdWZ2bzJhZzAvNDRJSWxnRElsWjM0V05qY2xwY2Z4bi94aTRqU3ZK?=
 =?utf-8?B?R3BTOXZodjE1RUdUa2diWnNqM2FscUYwVEx0VytuWTlMQnZKRGk2YVRvYVlJ?=
 =?utf-8?Q?QHHKE78s5tNi8HkVXmk4acrz2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7d5919-cd1e-400a-a2b6-08da592007a7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 16:05:33.0785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUr34xABBGmyb8rXaSr9WHNWFE+fOI8gjGKRPeSppMKo5cKlwUQY390pevG5T3uKTnR6S9UYeBbwDoOD/Bb9CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8387

 From 359f490021e69220313ca8bd2981bad4fcfea0db Mon Sep 17 00:00:00 2001
From: Charles Arnold <carnold@suse.com>
Date: Tue, 28 Jun 2022 09:55:28 -0600
Subject: Fix compilation error with gcc13.

xc_psr.c:161:5: error: conflicting types for 'xc_psr_cmt_get_data'
due to enum/integer mismatch;

Signed-off-by: Charles Arnold <carnold@suse.com>
---
  tools/include/xenctrl.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 5464a68eb2..0c8b4c3aa7 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2520,7 +2520,7 @@ int xc_psr_cmt_get_l3_event_mask(xc_interface 
*xch, uint32_t *event_mask);
  int xc_psr_cmt_get_l3_cache_size(xc_interface *xch, uint32_t cpu,
                                   uint32_t *l3_cache_size);
  int xc_psr_cmt_get_data(xc_interface *xch, uint32_t rmid, uint32_t cpu,
-                        uint32_t psr_cmt_type, uint64_t *monitor_data,
+                        xc_psr_cmt_type type, uint64_t *monitor_data,
                          uint64_t *tsc);
  int xc_psr_cmt_enabled(xc_interface *xch);

-- 
2.31.1


