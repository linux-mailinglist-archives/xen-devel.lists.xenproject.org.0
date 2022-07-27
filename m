Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7143D5824A6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 12:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376038.608617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGeUA-0004JQ-0n; Wed, 27 Jul 2022 10:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376038.608617; Wed, 27 Jul 2022 10:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGeU9-0004Hb-TD; Wed, 27 Jul 2022 10:41:49 +0000
Received: by outflank-mailman (input) for mailman id 376038;
 Wed, 27 Jul 2022 10:41:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGeU8-0004HV-Ev
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 10:41:48 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2081.outbound.protection.outlook.com [40.107.104.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6c48218-0d98-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 12:41:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2263.eurprd04.prod.outlook.com (2603:10a6:4:49::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 10:41:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 10:41:45 +0000
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
X-Inumbo-ID: b6c48218-0d98-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PF7fg2INjWL+tlmoWK1I8Z/3KMieIP0ebd9HhQjTAzMPQmTF+V/TQAC17YJrs7Zw0CRHcOn04wRzXYrDrV2Hqf7ac6PtyYRBS3EtFP6+1agoPoUNIG1bBVCUSbW6hjImZW3ReIi5SELEd2ezZu7ejkcLu/VOTv2VYM1NUBlDbACgyObyO3ulBtbGusDwnT9VF+6TIGmFY7ul9X2mhJXECW0EYriio9QF/RIifM8l8BCOwgK15KQgXwTAnZ+gf7v7i4lylduAkZWhmunE9Z4SC+yhQ6Q36bnC+Kf5yKpR3WIX5zAnMTEra4jw5HfPvgYW7N9Rb/R//FMfJbWdcFpvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abVLJPaXhdvr7TD3QprCKD6PStejJb80/q+pxQSuBV4=;
 b=Jn4uB0jXFhFI0mj1Gqj50g7fsLRwIAxrJm3Xlfr4mOeC57+6zZQF/kHf0KHWR+Nt89vOJ6Dp0F0FODdQ/IcHIAyFpysI6J1tIZMjH2rNQ0R92PrEPGSYH/rxZ6NH5oi3kZ69GTB9KCReLB1V3KdpVJ7MNwFIEEIGPcKOSoDOztxag1YRtAA63e881q29L947/3tmygpVxqsS9WUOUObdrXCjuuyJI5G6NHd2YOEIdGVEOew2ff5z2ovy5kJuA2iSVcOxw7YWkmRurbRvF+lqZY2oYCxpmnAPI6O4XWEaOm0Vr5Xqmf+RqmSBl2HuPN6mK5pkCboVDn9ZFBFH8PAylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abVLJPaXhdvr7TD3QprCKD6PStejJb80/q+pxQSuBV4=;
 b=qvhkLwmlA9TXz6RHMx3lTzIUSVX8NemzR7zWiJt02W8pzA+PPwXCOonabzIPWSoqxHP57P74Ju0FdXO/TLoFtR0WEEl+EOj4/vQAOsT1llX4DOfWOeXxH2nn+NNfkFbHHS/ZlfHEX754BLD/zb7CdA4oXn8U+O6jCtm7DcopyXKhB6U9Cp8L4T8v/7LAPCdg1+KGoaVPOC8qL0snh7rxM+YfNDLdQzlj/7EneqxorZ5nIWLuMQL/sn3WtN5bQJct7tui7H7xH1XpWui+m4uXtGNH27kRo4iRvQpB2VLKLXhQr3PLJtG0nMQFwvwY8SKVxF+pF1E5KRktu6nLQfc0lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13f6ca1c-559d-b89e-207b-d2685ea80bef@suse.com>
Date: Wed, 27 Jul 2022 12:41:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: correct post-preemption progress recording in
 iommu_memory_setup()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52e20b5d-a248-4764-72ff-08da6fbc99d7
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2263:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G4jyMaDRVc+1X/TQdn7CcQyFO7u8aawv09WBijP4HhXG/n2WAFrfG3Cyk2aeZgJMpaHI0dfxcx0ydfO4MwgXl+XcljjZ5LsUQfKx6qBAHkL39AGrBuszslf4Chnvje1IpW1dbf1oVNsV6D49y85US4zSrJmB3fyoXCbQPLSwCBV8yIG/FxQksWN8m8prjwG7eAwXJ9hm/PQN4KciCYMsDK7j56FWeSt/rf5wmMtRyGMWqLcR3EaJQSB4KfQUmOvkhx8/8qZOI+Haqhf/xr5SZ4uQOE2T42e9oB0wqzEcT5qe9Y5xrioSinKFRokAPPSHdlOIr7EPSH4bQjPJZZ8KkwtyYKusbksRasK6PuBIEmqZ/HpEgOIZQch0vCHxRrwWNCnNYEGhfl+YSCVfjTk3wbygH6xJSBowA572R4InQwcWeerS/pl9ejTMXiEfIveVAGLZUe8TyXlNJqCqqldjdGQfLQyyoAWtpTswH9K5Mkske85ArN9lOXKwQoKkMDLklzYLj63Ou8VZXCUmyAGrgRNzYN4oEX9u7HoSuPGhDdjnprsL9nHwNUMTT82ai2TcFmoVv3iEYbJSTFwA4gYVc0pMw+4l0q2n6DEs6zHyrgauVHOAqRulFPQ8mpk/YtgxLavcn1wf629P3X506qQERwRhn11f2gyUw3etAnfZgf8cGsp57cpblZLDOulENosfGW1rrOk6kj9GcIpirIh2wjJFUp0cAxRlKFUAxq/t6We4LY7lREsMoCbjgjRbus5OS/S1FCUnIpb1j5jmR6YQ58VWMKktiiPmYw1nA5b2i29Gd2TdYtlqjPawIhNfPfkgvyWF97Gje6mP21q5jvsE+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(376002)(136003)(396003)(346002)(31696002)(186003)(2616005)(6506007)(86362001)(2906002)(6486002)(41300700001)(478600001)(38100700002)(66946007)(8676002)(6512007)(66556008)(4326008)(8936002)(54906003)(66476007)(6916009)(31686004)(26005)(5660300002)(316002)(4744005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG9MdDdNQkxMNUcwRGJrVGN6SUJWckFSTnV1ZFUvbFNNQlpJd2JqVllZUWF2?=
 =?utf-8?B?WjZna1p2Z0hLT05ERHJSajYyY3BBMS9qN3d4T3hiMjdqWjdCcUg1VjRWdGUr?=
 =?utf-8?B?djMrazRKb0loQndlWis1WktJTnFrYUk1WEhMMzNZUno1SmtMQ1A3bDk0V1E3?=
 =?utf-8?B?RWt1VzlkbXAyQkQyeHRvMVhkUERGOHBLTjFMZTE2WVkxWVB6Y2JJZExlMFlv?=
 =?utf-8?B?cTVjWElEcjczeWZscUYzdjlPamdSb2ZTYlFKV002cVhOVHNjSmxIMDlhSC9M?=
 =?utf-8?B?RnhDa21UL004bElhbmlvSTl4RmEwQ1V6WFJvRlZXYkxhZk1XRkpRSFBBOSti?=
 =?utf-8?B?STBYamNXQnVKVXNBR2Y5MjhFYU5sd3pjTkVkVE1oOTBzYkFFaGN1UWdlMzU4?=
 =?utf-8?B?UmtZbzJ1U0RzUDNaT2xkaHc2U3dqZ09qU1poNEVsWnVGSGoyZlRYb2JkUmlt?=
 =?utf-8?B?WEcvY0lUY3Z4bW45QU1BQnA5WWo0ZC9CL3B2MWlEZ0laWXFwNjNTeCtzNXNS?=
 =?utf-8?B?VGJwSnBVYVBjNzc4WGI1UHNqNmdUYXNUQnY5aXNlR2U5YmJMaCtFTkQxbmJS?=
 =?utf-8?B?bjJXcG16Sm1RdlU1a1JQZDNIMkp4bldlR2RQcHZ2cTMveDhBMjd5cEhBRHNX?=
 =?utf-8?B?THJXUzFBWFo5QkIwZ0JuRTNYb2VWK2lBWENYalZocisyNFdmcEpnT0ZkQUt6?=
 =?utf-8?B?c0ROdFhSNWlUWWZ2bjhZK3M1V0tES2hGMm82WDkwUlhjby8rVE5iaUVkUzkv?=
 =?utf-8?B?dWlDUTkxQ2FEN2RNZW5abHc0MzVnb3d3b3JmVG5NeXZnUzYwaXZDbDZEdHB1?=
 =?utf-8?B?YkNOY1VTVFY2V0cvMnlvRHEzenFRZDBWemhZS0UxZy92MGU5WU1WSWsrTjZn?=
 =?utf-8?B?MXQxYTc2ekdjM1lEcjBlRTZVdkRWeDZxc2p2UUlCMm96VHp0VkxOby9jcDNB?=
 =?utf-8?B?SmQ0TEZFL1g5K1ExdzdEYlRXaTBWZG5mRDV0d1pSWVJueWc3d2RhN1Z6eWZ2?=
 =?utf-8?B?SGRUa0F4RmxyYkt3b1N4TXRVQ2ZlOHBPazVsdDZXQmlVM0ZrQ29ZVHI4aDYz?=
 =?utf-8?B?bXFIMDZCejd0OHRmTGhpbWp6cDRSMXZJR1NvSldrTHA0Nk03N0RBTjJjT0xy?=
 =?utf-8?B?RG11UGN0WExSYzNTSnZNVk5LMnhJT0V6ZGt1NUVoeWVHbzZRWlJGRVdVbVpk?=
 =?utf-8?B?cndWYkxDcTdyeTBxaldwd2dRZnFSdERLdlBBelZRQlM5SSsrN0Q0akg3Z0lU?=
 =?utf-8?B?OWx5MTlWYUVwaXFQQ25LdFFRVU1GeENwbXNMNEcwWC93MjFKN08wRnlBeFpP?=
 =?utf-8?B?QmhNcmh6dytkaVJ4ZXJyalJ1SFFidkU4TjBPSjZvVGNyaUN0QkZhSkNOSkNa?=
 =?utf-8?B?aG03QjhzTCtLT2xySWVqR3RTc1FwZ1k2cHROU2ZGTm5WdThUZHpOd3FvdmZo?=
 =?utf-8?B?WVgvdGladkJIOGtuYWN4aktYTXNxOGkzQ09SL2d0RjBHQ1gzL213V1hmT2tl?=
 =?utf-8?B?a3QyUDJnZXliZFp3dkI5WGVLZ1B2andacUtGMlpXSTJPeFp5K1NCaTRzRXpw?=
 =?utf-8?B?eFZ3OFQ4MzZpMzRsb2Nqa1dva1lsZmxnazBnY2dYUW8yNHRXejV2U2ZoWEVv?=
 =?utf-8?B?L0pQRzhtL2w0dm9SMUJvMFFhNThpMzRRYkZYY0tZQnlqNXBYZkZibUJwWTFX?=
 =?utf-8?B?NlUvZFYrL2lyMklsc3BWK2dYKzhiOERTU3QzYzNYSjNUWmxLT1VKbDViQ0Y1?=
 =?utf-8?B?VHlzNWNSaFMwMk4vSnlvSWp6TFNyQTRLSVZ4V1plQVVXY2R4Z3ZENW1IR3RU?=
 =?utf-8?B?bkR6Mnl4UGliN1drS1hXVmRhVDY1dHZ3b0d4ZElXNUh0VWIvZXlyMXhxdG1q?=
 =?utf-8?B?Ni9TQlgyRWhYRm9ab1RhaGFtYjQydjE0a3JMRzlrdGtaQ1ptQjRYQ3BVelVs?=
 =?utf-8?B?VE1SbmsvQ3JpdzQrTGwxS2w5RlJNL05FL0s1a2dTN2g4U2NNQTZteWtOWlpP?=
 =?utf-8?B?dUt6RS9mQzlRa29xTFhHM0VVbE5DK0ErS3M5Y29zamt1MldQNWllOTRXQlJM?=
 =?utf-8?B?V2h1em1KaHl3QlY1TEFNdXV6RFZacVI0RUpMbE9iYjRoenlrNGY2c3dDcGY3?=
 =?utf-8?Q?JJvmYCE+zIIZ027XranfMNXCu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e20b5d-a248-4764-72ff-08da6fbc99d7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 10:41:45.3321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNR8XKQV18XQaqxFmdi2fe9ZNub59TNmAjizDHvc3o4DqRnUUAteSy+BP6H7HnLMpljM+mOMBnhdk5ux0lV5gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2263

Coverity validly points out that the mfn_add() as used was dead code.

Coverity ID: 1507475
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -130,7 +130,7 @@ static void __init iommu_memory_setup(st
                             IOMMUF_readable | IOMMUF_writable | IOMMUF_preempt,
                             flush_flags)) > 0 )
     {
-        mfn_add(mfn, rc);
+        mfn = mfn_add(mfn, rc);
         nr -= rc;
         /* See comment below. */
         for ( ; rc--; ++page )

