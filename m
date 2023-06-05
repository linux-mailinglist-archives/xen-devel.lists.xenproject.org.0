Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C53721FAB
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 09:36:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543499.848541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q64kN-000847-Ut; Mon, 05 Jun 2023 07:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543499.848541; Mon, 05 Jun 2023 07:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q64kN-000810-S3; Mon, 05 Jun 2023 07:35:23 +0000
Received: by outflank-mailman (input) for mailman id 543499;
 Mon, 05 Jun 2023 07:35:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+s6H=BZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q64kM-00080u-45
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 07:35:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 861531fe-0373-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 09:35:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9437.eurprd04.prod.outlook.com (2603:10a6:102:2a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 07:35:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 07:35:16 +0000
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
X-Inumbo-ID: 861531fe-0373-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocJMtQ2jz00kP0oGxbEe6hXDWLsOSkQ7d8NTQe5tespwxTeVh90lzNQpltFpElaveL27IB0w0wbNo8vtO/jAiY8Q/CTDKwBBKarpeDDeGUYfyQUx02AGcTIsKgzTCBDH0CBT6thf4y/97Ydjdh9Ws0VWAVZHDTetBywVh091NhHz20h8RIxe4hD6dS24h0sv35qzVqDliqUBC6mQLFPMn8Pp8FIW932wEA4pQ6YujxdKNcEJQTtVZ66En4qzgaThd/IsJfiUQuHRvWUILeHynK7aR0C/j8Ojbf6CALwfkxSbAzEatfi0/Uu2624jD/Cy+GgN4A1J5FsXX0OQYS8cpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5v/XTrrWLoijRJu9jih6Zh60Os7YKwA6mkBmmWPzVGc=;
 b=E/5tP9lIoxJmEPX98K89JnsI8VGPZ8z0WAcVgplArXJBm8+LPJJp9EBvt2OJ8w+SmRArsEdr0qgczfr2Lk3PSoLrzVpk9N5Zv8FN00rXinAFDNe1fB7VLC5pZV5LGRePQtXdO2ZAygdbpbGLQ8jpumT4arBJVGJyc/4kEUy5mzD6+8UKU5Nm/S1bgd31EI1KPGOcZKquKpAeuo1Tg/VdqlAcMlu/uffy3dmVdt2SzXrYYwXo/UpHW2Q9LNBZ4nNaukOWEWSV1cuBlpTcG4m0oP25jdKbcNc+1fuXu8C7Hq1aZJac/oozF/DzDb46vm2/XJsGrgbr32cRMvTzRDXhyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5v/XTrrWLoijRJu9jih6Zh60Os7YKwA6mkBmmWPzVGc=;
 b=ZmZFzQpBec/eHeDyQYbRWdEkjzRVzoxMIBTYPY01NxZkVvtnP42QFTXyFO3kXZeRP16St/qdne4LmkMneqR5iCO5Wul+iCTyEIgXcu6JZzoOJbupsulLyNGtJxAmiBMgYW8qmTR11zVsQe03rQYwWcTnajpecxExNCkLLHBiMeh6XXAlhNowGNRcoTYarJHNCq3Wlj7szQKSXhIMOkcd+uea1zWttwSkXFAGZnxtdnHDijKePPWQZSUphSH+zHvmD+NrPWJ9KOvflPdOQ+JBC5VyaBmQJPc5kTB0rpAAr+47Wrkvkaz36fNhviCmw5V4D/KBJHzG/1esxPbMc2u8Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5c112f1-a0ac-63a8-17b4-b42ab5fd2ad9@suse.com>
Date: Mon, 5 Jun 2023 09:35:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: c09295e2-d017-47b5-1686-08db6597678f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4ws60zQRuPaMPsaiozd0dbIu3nYKSzqspltzJxf53ace0qIM7Ct8FEpTo6GNnHrsLaZu6QvvLyAxCiLZ+s04vySUXJXwtzUvE7YAahuD+Qnw8XjPcKGivTw4cD7+q12KdjeRILVZ3IVis4V2qL1I/Bbsij+qkTOxD/owUWooJFomLn51hSgRHaVlwGRxZd5hk+WhNZWNL+2fG240vA6FPwHlovUo5dKWu6C/WkW5e6PmH1IPry2cHXoI1GdZZ+RmvHnyHBZpRFRKzS7eeGB6F3BG+zLs6psOPEF9nryDS5cb8zmJBt7juysGvWMJf80ilOwLFANFvje4uyA0hYQxk1uKYmiZA7EmqsqgWx12zOTxTMvR9D60o9+A5CxoD6D4y+fCM6jk8cYBbUZyZxfacPW1zukvD1Glg1/MJ3hPW5leFsgn1hyXRePX1JM3tudVbLiqRglmorLwTrwcKC8w0ucxvo67r4xLqlD+fEdy7AjPu8QNJQsjkykaJ9H5E3tTEZ+UxOZ4Q8jc9PQO0Z9cMY+2mVR/uCoSLUFqT3g6PA7Oh1ynx8GXre48tsSm1tMA/B2ztjya+fPp7y2OpgJwsx6CdCTn52gTOQO4OlXW6K91HLG+sEtMQzTKxyIP9o5lhuXzZVXPEUG9pw332d3Ziw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199021)(6486002)(2906002)(4744005)(66946007)(66556008)(66476007)(54906003)(36756003)(38100700002)(8936002)(5660300002)(86362001)(8676002)(31696002)(41300700001)(6916009)(4326008)(316002)(478600001)(2616005)(53546011)(26005)(6506007)(6512007)(31686004)(186003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2JUUkZDVFczZk13TmRIdTNDWVlETDNHRy9hbDhva1RudmcxeTJJM0U1ZUda?=
 =?utf-8?B?SUQvU3h6Z0l0ZzcvREdITTdQdCtjeXpBQ1JxaTdLSzV1a3FqWko4QXdiSm1s?=
 =?utf-8?B?MTJaQ3Bkd2RlL0c5M0dCa2k1bElaQ1JWamVRTzFDWk5KYSsyL1E0VXhVN252?=
 =?utf-8?B?S3AvVFFqVFRuUGFOc0MwQzRCYjk5THRRSFdpUDdsQkRhdDYzT1AwUHIyTlRM?=
 =?utf-8?B?Vkx2ZHdJalMzUXdwWldNRFNtWXI2WmpXM1BXcEZTLzZscGxSZlo2cnNmd2ZD?=
 =?utf-8?B?RmF6R050MVJPV0xTaitGTEl4WnY0ZXZ6M3h4TEw0SXFaeEpMdEZTVHJ1UW5v?=
 =?utf-8?B?cnlpWU1OSHd5UlloSS9NcDNld3ZBdU1KVm1ZeEs3SVpiZDBTb01yZ2Y0cHdF?=
 =?utf-8?B?MXoyejlJMjZGRVYvQ3RPd3FwU2JvN1g3QTBoYmppakFVQWpwYmJrbjlDUjFy?=
 =?utf-8?B?MmRaQWtTY0hrQS82YXIrSmpQSFVIeUk5YkFTNCsxTDR5NjF5OG1xRWFmdmRU?=
 =?utf-8?B?S05xQjlTR0RCMGpZU3ZncUFYRVZPN1NSdEJlUjV1NENJVkozd3Z4Y1BodVhU?=
 =?utf-8?B?YlViZlBPV1lIdlJncHhjNlN6V3p2dVJuVHZXQU5hc3ZyQndwWU1UWWdRa1dX?=
 =?utf-8?B?VnJWbEplanZ4bTNJaVIzRUJFcCtxZGZnMVlTSW1aa1Y0Z3gwRTZzbjNlRm9w?=
 =?utf-8?B?MElKalRMSzhVYmI3bzFnQkF0Qzlldjg1ZklILzlJR1I2Qkp2RVVyY3VJdmk3?=
 =?utf-8?B?VjJMeTY2OGE4NWpMN1BUeFllQThXMzUvVXR0SmI1aGtXRUdBenQ5K3Z2Z3JP?=
 =?utf-8?B?WFhySlFrM3RqZDR1WUpUbWNzR1pTQmVOZFRBWGNLQloyWFNzck1tbkQwUUVi?=
 =?utf-8?B?L0llbExnTmRPUjVUTk4veEM5RlNndHpvZXdvZi9NM2EwZkQ3ZEhEZ1ljYk51?=
 =?utf-8?B?RW1lblY4WkRuc3ZNRllpeVAvMWxzR2RKNDBTRlY3L2tGYjRCdUEwTEpPdG1E?=
 =?utf-8?B?UkVkZWxjZkE0czhadG83ZFE4cUtsdWV3N25wYjM3UFFSYlFLL1p4UytJVXNC?=
 =?utf-8?B?dUVJcWtUR1dsRUxsM2xwZTVRYVlkOGc4ZDVQNU1TeWsvYkM5NXNtdlJKSmFw?=
 =?utf-8?B?RXZucWgyREhscklleEIxcEhna1NETklXNjRJNy9JTkZSTHZkdEQwR2s3MWhu?=
 =?utf-8?B?aWVBNFh3M0xuWHMyVjVES01jTE00Y2RneHhBaVZKSm5rbTBtMWcyejhjdHJo?=
 =?utf-8?B?dVZpYjZJV0kveTRRT05MRlRFb3BLWVV4bWRTaGgvQXFIQmk4V1ZnUXpWazZh?=
 =?utf-8?B?WllFRHlVR1k0V01sc1hYZHpkcG9FL0VzYUozL2dVZ0NXOWhMNW1CK3g3OTUw?=
 =?utf-8?B?Q1lCNkVKTzhRcjdRTlQrMEZFN2hWT0R5YjR3SnRWdXBvc0pGZW0ycm9ObDZm?=
 =?utf-8?B?ckRvelpwcGhXQVYyemVCa3ZsM1RobUtwNm05aERFdWxubVIwQTYwRnVCNHFC?=
 =?utf-8?B?UnNFSW1ZaU90cjNEZ0wxeWZ0Y2t3RTdBenREMHAvek5JMUxMZ0RsbkhQbjhD?=
 =?utf-8?B?RFF4MitUalYwNHZXUnRjR1I0WHNlRTk3SlhpTWJjNG5XaGVubitXd29JbXZn?=
 =?utf-8?B?TVFsZTJiKzFwdUhQNXc0VElNUjU3UUhwL2tIY3JiT3NLdlMzd29jTm1mWXkv?=
 =?utf-8?B?bjRvbVpYZUpYMnZWRVQwcDdiaEFBZFVIbVh0d21KMWYwUC94Vm0yY00vYlVK?=
 =?utf-8?B?YnNSTlNFQ0RlOE5yajJMdklsTlZPOEU4VWNvcW1oQ3ZzbUVScTI0RnpuYUFC?=
 =?utf-8?B?VTJ6dVZrYWkvd0ZpaFE0K2xoRHdkYzNrc21Od1k5WDdNeTFrYW15MUQwRHVa?=
 =?utf-8?B?NVpYdzhKRnRuRnhkTWpnRW5LSEMxd2diSVBxZGRTaUJlQURLYVoxT1YrcDFH?=
 =?utf-8?B?cUROTUVtMzgxMTFFemY0bHFUNWNpSklDRUkyalFCZ203QldXZkpRZmR2a3Zm?=
 =?utf-8?B?TDNWaWpwUWhySlozN2M3MVpDN0Y4cHJxaUpEcTdIUzhZZnlaTk9hMUI2aDRP?=
 =?utf-8?B?N2JGSjNoaUpDa2U2WWJ2THM3ZFRaS3FuOEQ1ZUo5OXlWVVdORWd6VjYvMllv?=
 =?utf-8?Q?olVHoRgrp4al7z3i/Tk1u0eH9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09295e2-d017-47b5-1686-08db6597678f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 07:35:15.7034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R590nGsR1Dz8N7voLcCM2yph/CgIevijKy2txgdXXmHOtlinHCIPPhCwfEVG3swU/gLupukuQlR0ephAXJC4mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9437

On 05.06.2023 07:28, Roberto Bagnara wrote:
> Finally, Xen seems to rely on explicitly undefined behavior, namely
> C99 UB 58: "A structure or union is defined as containing no named
> members (6.7.2.1)." All instances but one occur via macro BUILD_BUG_ON_ZERO,
> the remaining instance concerns struct
> `cpu_policy::<anonymous union>::<anonymous struct>::<anonymous union>::<anonymous struct>'.
> Reliance on undefined behavior might be hard to justify.

For starters just a comment here: I'm pretty sure this case was discussed
before, and that it was agreed that if need be we'd simply add _ as the
name there. Yet then - how did you notice this? Code inspection? I would
expect no analysis tool would spot it because it's used for gcc < 4.6
only. And I doubt you run analysis tools in combination with this old a
gcc?

Jan


