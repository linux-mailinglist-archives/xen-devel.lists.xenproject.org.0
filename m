Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEC5771CF5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577889.904984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwL5-0003Jw-QX; Mon, 07 Aug 2023 09:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577889.904984; Mon, 07 Aug 2023 09:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSwL5-0003HE-NR; Mon, 07 Aug 2023 09:15:47 +0000
Received: by outflank-mailman (input) for mailman id 577889;
 Mon, 07 Aug 2023 09:15:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSwL4-0003H8-8M
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:15:46 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc423868-3502-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 11:15:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7081.eurprd04.prod.outlook.com (2603:10a6:10:fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 09:15:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 09:15:41 +0000
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
X-Inumbo-ID: fc423868-3502-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nk0nFrDQCRDnC24AI2gRFoECFwGzx6UZ4QBARx6HmBZGWQpKWXEGSzlvvaiEJWSx2hOJSxQ6N8GqiTqMe/626w8ys5+qrpZJ6XHgsy44mxOyXSu28rKNJtmxD4+JtprvIvJa49MLTVp0HXRnQN/g2RIHXRFPBRSZUY5f4+yVZFfg8EDZrquDUuy3hplEqtKwGe5l/zTuTQ3v3K/V+Bd6yBU5jsfPmkRGV63u2zYju61TRqOpi04OMGMLidMmy9qVW1fgoEmxsAIrToiVrKmNvCpLhiRxnVce4oStRHFys7r1haBMl3AjST0r6yaG9nCRkT0X4aLo6ijqz42d/W7ffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4h6z3WyN3wa+yY6xiHVHLFx4QglzfI4KodSAg0zofwQ=;
 b=lL9FQ7P8ILenxGOkgybY1zxonAiJ1EviKs469bOjKMxFwFH0OB9agtw6lKHxdMQaA8bOObtImww2wlA5NlavFCn/GO8+YzZcN2HCdVqszcGbFkfS8u8augeNqcMVVysqjOyhRKDezLZNkYS5Ry9DDjD9erjtDNn3AAMyyGvzX21+b+dlNg+z/H6vbNF+RLOFG/ssnIHwn6zOHxsCjg0w/mY50cKv5/e19YHLh4gUedjPcDvDb6Txgb4yAz7GJruakE/3PFVF6Yy7Uh19Mcmm5/hhS6HDp0YNbJ1IfBquSAwgA0471jQiNv+JXdjTzTZ/4BbE3a1ldMYAVjee/GFZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4h6z3WyN3wa+yY6xiHVHLFx4QglzfI4KodSAg0zofwQ=;
 b=Dg9JRtK2xA7ktHrtCFSJkcI/bnwu7/vKqQXv0HGEY86GzdlyiSUub63pPCf2YamM29nkDN0E26WVvEqB/QBNJWOiDxNte0kamDysdLEVmbmgkIEu+JvxZxJxyNxLEWK27uVUnXp+OBkORVz5b0JatGaCmowCLIAhq7qBv+pltPxJfW4OKbn2BQPD+LDBLf6uP0Fh2Ybzn8BTZb9fwcO6jYDUq8tK7Na+sNNXk4eR9UbymlRRY/ItFrwWSpgItFFS5XpMhHFsa003BLNAteenkAB2PV7Ne5e/fMQV3P2TokdFlgPcbnF3Yu2DzhrNho/kh+LD8urtlCsteihKsuQ2cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9918b8ef-0629-d8fb-3c58-6b20b56b1a93@suse.com>
Date: Mon, 7 Aug 2023 11:15:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 3/6] xen/delay: address MISRA C:2012 Rule 5.3.
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <e67bd46f204bef64cefdbe7a0b447148f7f9c9c6.1691162261.git.nicola.vetrini@bugseng.com>
 <fed4b27c-91ec-7605-1a71-a0b7c6d7e2e2@suse.com>
 <486ba9e1-2bf0-4446-9ac4-33a256f8d51e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <486ba9e1-2bf0-4446-9ac4-33a256f8d51e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ddb34b2-61c5-42ff-578d-08db9726df0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XFRGcAizW3DEjtd8vhIyubjQtVH6Rlg8M5+LkfJXFw8weR54NwJMNMov2d+2bSFGvfd8/HYPiJpK8MsyONO4D1ik53qTk5++ZqOjmet3KEmTRJ+gL7+YJoPVHxME8J/HOnIo43sWSQ5TC90F5mLa33pDeG8NNvYMNG+dZbU8AopMe0pu4Jx2OMdfPBW0Kp+bgC5w16Weu1P3qvErBIPOUXrkgG4ObEhrBb2qyXFQ0uhWCrVY4T7jwBzi2rJ281vw3/nOUC9i4IqXBOQqRgVwEnVVx2mdLRFVzxKpHygo7se03Jz69TQcMyfWc0ZA37vTQJtY/v2D0cwjskrUvPTWaF7/AfQ95vGuQHpOKwa1Q9RzGPjnizSds7/qnBSl2b24CTSLtJnvVLrDxJXne2l1A6UCy43C/0FUkNwa52U27az2y6x7rYk9vLIYDxAVzGo6tbtjExRiXZYp41qNGKp5A3hy8LQjPpkcHn0Hk+y3Bh2qf7tFVIa1lYsRveqJ8RoQYfQdTANn6gqAT0a9O8/FMb9EECOJxM91DfV0PVbbqHmcmxywwJ5bevWkG2oH2Vau3S3zXZ7YuOVJRaed4LVY2dPsho/HVYofNrgwb7EMAz4hXYS0bKZsYvEwi77boNkOOv6rpuCxL1LCi7XLZauLyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(316002)(86362001)(478600001)(54906003)(110136005)(38100700002)(66946007)(6486002)(66476007)(66556008)(31696002)(53546011)(6506007)(41300700001)(26005)(8676002)(8936002)(4744005)(2906002)(7416002)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnBDMi9yQUVhMHJHaUVCSlg0UmZPeU1uZUpGdFlIWlFtb0R2Uy9GQlBkZ3hl?=
 =?utf-8?B?YTMybFY4UXMxaWFkOHg5R2xvMmxLRU9sOWw1c2hoR0Y4V0xEdFVkdlBEOElL?=
 =?utf-8?B?VkMrK0VxK0JqNmNnVUxub2VuU0hyanZLRDFRQkRsTUdrMHV4SnF5QnMrbU1D?=
 =?utf-8?B?TURDUXdKc3hmSUJhMzBpczJ6YWkxeEZzSW4zS1VOeXgxRHRaV21Iem1WdFo1?=
 =?utf-8?B?d0V5VmtsNGxKTjdSaU1CQm16cUU3a0k3Q1NFUnVyVGVVQlBzV2E1TjJVemJt?=
 =?utf-8?B?UFBEQlhBMStaRnREaHR0cHdud2dHckhtbHdRMG1xU2VxNytrbWJwMUtIbVpv?=
 =?utf-8?B?YVNYT3phNWpYc2MrZExjcHFhdm55aHhZNDlGd1BwQkM0dnpxekZ3S0s5bUQx?=
 =?utf-8?B?N25JdUtUYjU2TEdHM0xNR25DNXdYVjJ5NUhoQWs4YXVpNDdJSUZQWVArRHQw?=
 =?utf-8?B?L01XVlhncnNaZ1B6UjdlcmRVUEp4UEdRT0V3R1VTR09EMEN0TDVFK045RWtE?=
 =?utf-8?B?ZndlOGhQTkxYMEw2L2loTEk1UmpoQnpiSk5TbW80elRZWmg2QzZRRkxIbWtP?=
 =?utf-8?B?RnZBR0dZb0h3SG9GemJSdlJzWTRVL0JteDFPendEbEkxWkx2MTJJdFRET3hY?=
 =?utf-8?B?dENiVitEMkhyOUNWRWg2ajJIVmtpVmxkRkZ0MDlNN3dEK3kxdjhudTNjWG1t?=
 =?utf-8?B?WDBxZTRuU0VoTUJvcE9zZjBacXpOenFZTTFmK1dyUmg4ZGhRV0xWcHphUUFV?=
 =?utf-8?B?UjhQOFp6eml0Qk9zWG5leCtDYklTTzk1TnBOUWRXZ1YwbTZMeUJTQ2QzV3hy?=
 =?utf-8?B?Mjl6Yk5LcnAzSzl6K3FMZWsrbFJoZHVUUXgvMi9PNGxVYlFTZUJKSGppWkpu?=
 =?utf-8?B?S3FVRUlaaHJ2YjAxb3MzeTllQjcySGpuV1lqQS9BSUhSZjFHUVk3Z2tuSjNX?=
 =?utf-8?B?bUplY0xhY3NKTWFRUTEwRllJSmR2L3pnQ1BhaGJmd3NyZXc5ZlprZGtqb0lq?=
 =?utf-8?B?ek9jWWJ6cEZHOXA1M280QU5YS21aUUZyYmR2NTdhWDFmOXRSU3M2MnpwM2Ji?=
 =?utf-8?B?cWZNOUJoc0xIc0U4cDc3N0JKNERhMWdwS1YxdUdWNUNVdVNvbkc2TVhCZnBM?=
 =?utf-8?B?VmtWc3lTMGhjNjdObGU0dlRKdXZrR0djS3J5UTVlbVVqUFZlSFFwY04xcVUv?=
 =?utf-8?B?dC9SUUlNeEdYTXM1bEhtVk5vUzlxREx2SmN4S25iTUZRUTVvV01EN2dWdjd0?=
 =?utf-8?B?U2FvL3ArRFhPYi95cDZubTBmS3UrbW1abHkzczUrM3RIbThaQmZ3YjVXbmsr?=
 =?utf-8?B?SDJFcEFjdkphT2djMWJZejJDck1JbngrcjA5T1dsUXQ2QnJxNDZtUWpqb2Rw?=
 =?utf-8?B?ei9SQ1RkQldZY0VMdk9YWHdYL3hWNXV4Uk9Ed1hTTXpqbVRkb2xtTXFjNnRa?=
 =?utf-8?B?ZmpqV2JXQXhzN2t3b2tqNy9hNnJHaG9wWDBXUjZwZjNFWG43U2xzTkx0dGhi?=
 =?utf-8?B?Y2duMlpGdkdUaDdxWHJNTURoNDBaZGF1MFhpMUxNYmRFcW0vT0ltVjZPdlRF?=
 =?utf-8?B?cVdSQmZTRTIzU2Q2NFpFZTNXNWRuYjZOdkZ6Slpvd1g5dDJCdXQvdEI2SDZJ?=
 =?utf-8?B?Ym1yOUNDT1VQZnNqQkRrQm03TVVZWngwOHJqT3lHa3VzQjRkV2tiOUNGWlI5?=
 =?utf-8?B?RC9yNWJYRnVPM2REdFFSZzUwdEZlaXVnM2o3U2pHTHVqWXhjTlRkWG9iZVcw?=
 =?utf-8?B?eEtOS0puRkJQcjVjamQxcTZqY3dhRm9DYWsrcEhrc1lGbEhlR0xrMDFYOERh?=
 =?utf-8?B?WE01WG84Ti94anYrTVNWV3hJY1U3eXRyRFZHZVVpVVpEM01VRjhCZ1Y3NVhQ?=
 =?utf-8?B?bWtEbHdlYXd0b0V2UElQeW14WmdzazRXTVVCR0tCeFFadEM1dXJCTFVTYzIz?=
 =?utf-8?B?TDk2c1BKSS8xcktKSE5uVHRjYmVjZ0JIZDY0TmlEdHVmbDdGSWNBVGsrRVpu?=
 =?utf-8?B?S3ZDbEloOVd3K0R1Q05FVmRZbGR3Ty9nNHhhWEVSeG9SMk1tb1hpQmVxcTdC?=
 =?utf-8?B?dHQxMlAwUEFyc1pwVWZwL2ZDbFZoYXY3ZjJMR29BcWdjWWQwNVJzWXYxY1Ez?=
 =?utf-8?Q?SLPiQktNWZpsJfevmZJqayEIP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddb34b2-61c5-42ff-578d-08db9726df0a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 09:15:41.0669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cj0hJzXgIDaV/HzeYzgmEitdDBmGTgT03TaNB7dgTqhc1VUD68uDoUS9FMZV6YeQA+ljgSm/Zg+rB0/OFmutQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7081

On 07.08.2023 11:01, Julien Grall wrote:
> On 07/08/2023 09:14, Jan Beulich wrote:
>> On 04.08.2023 17:27, Nicola Vetrini wrote:
>>> --- a/xen/include/xen/delay.h
>>> +++ b/xen/include/xen/delay.h
>>> @@ -5,6 +5,6 @@
>>>   
>>>   #include <asm/delay.h>
>>>   #define mdelay(n) (\
>>> -	{unsigned long msec=(n); while (msec--) udelay(1000);})
>>> +	{unsigned long msec_=(n); while (msec_--) udelay(1000);})
>>
>> As elsewhere, please also adjust style while touching the line, at
>> least as far as the obviously wrong case goes:
>>
>> #define mdelay(n) (\
>> 	{unsigned long msec_ = (n); while (msec_--) udelay(1000);})
>>
>> Even better would be
>>
>> #define mdelay(n) ({ \
>> 	unsigned long msec_ = (n); while (msec_--) udelay(1000); \
>> })
> 
> If you are touching the style, about converting to a staging inline and 
> also splitting the line in multiple one?

I'd be happy about this being done, but I wouldn't want to go as far with
on-commit adjustments. Nicola, are you up to doing so in v2?

Jan

