Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C6E58ABE6
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 15:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381297.615911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJxpT-0003LK-Nc; Fri, 05 Aug 2022 13:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381297.615911; Fri, 05 Aug 2022 13:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJxpT-0003Ip-Kv; Fri, 05 Aug 2022 13:57:31 +0000
Received: by outflank-mailman (input) for mailman id 381297;
 Fri, 05 Aug 2022 13:57:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJxpS-0003Ij-6O
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 13:57:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b03613f-14c6-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 15:57:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6019.eurprd04.prod.outlook.com (2603:10a6:208:141::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 13:57:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 13:57:26 +0000
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
X-Inumbo-ID: 8b03613f-14c6-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CU0+kPDOe7No2VdPZujzlzEZTmJ3a6Ef9CTn3NJ85Z2WAnc3LYX1trf2UNQRNc+0JbMu2YkpgmGH++ULojxJl6jSKjSn+lgh/foES+kAUohmelV/6qdoqcnopMpiutdyrYoLCDDpBnjkeTAVflL+juIfFNpie/5zk2PSsyuuGHdXYfmqN1VHeKwtDf5RrCyoOqo17HXVSZ+TUKw4dYd0DYzPcAZX/saDSt2utKQ1yUsYOocB/YVYJmVSS9t6AgCffMseTDYtDYqj8aqsAlp5sDRPFmqBXvvK5TnN4lTKrUD/KrsGbXHrKVUwAzC/aJepb1MQftub0BiVOhncyro2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vxc05xjFoqlXm5elSu/oqEeEzAN6Oce92bcqa3mfRnU=;
 b=FfFQtd3j7tCMh0zU2Zd8jkRsPy8Jft5TfEjL0KSj/hdK8oh+VtCkRNAzen/82O1FKg/dp0Y1AKvbfDjRhZVHeidExPoQOhubXWDD2f+UKAuJ0h8xNMBnVjp48HmAvPNUMzw4+ZW7EG6aO5PsGrA7Hv3exQCtRVLHOADs/L6za5c6fJfKrimHeURJIxy5oeMD3f+UrAmvZCBM1Ha5xH4qchsRv2Z2PdZdECOVQ97SQSRvZ5RPl3X1kNhbuDP6xTFOEOd0H5Uhlb2HpcUHJiyUVYJEC1LPyfbhV43PskKfjftZaHkuB/BLsh+9dQBFbjN3GllgdFKUnJLB5KS4a++iHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vxc05xjFoqlXm5elSu/oqEeEzAN6Oce92bcqa3mfRnU=;
 b=onkzdpEp3EQ4xWmnBef2bVakrYHvEWLssSgQIPIUOi6DneCPLxwfkLkDIgMusoTBKm1pxv35zUR2etJfQ15K8lAZOaY5kZ9i4zRIsRVpO5m1JkCk0p6GRC8KZGWHWNgTlPT/B3TOVr4RX13nREvUYh4kl99KKEYUy+Wp6Fd+VhvVY1bIg+Onq6IOkS4fGbvXSLpUBv3oVqCpt3wEHMJ6HUtIKA4M2lzaKdvSNqS99MHFZP+BSb0/0/M6NqttvMdfUPuaFkX8kX4AdyC2/mAlaW0XCqDu5Ll66F/d+W1PHsPdCcuWuBMb9G/oWY3b6PuJt2lCsLfrsSkvTAUIqcoMPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <14c8f7dd-f619-8008-c08e-d9031023be25@suse.com>
Date: Fri, 5 Aug 2022 15:57:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/3] xen/cpu: Minor coding style fixes
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220805124442.1857692-1-burzalodowa@gmail.com>
 <67c9bf09-7639-bbb2-6942-9fce583bf700@suse.com>
 <4749e664-0052-a6d1-c4a1-42cebc17e610@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4749e664-0052-a6d1-c4a1-42cebc17e610@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a042dab-8b43-4014-726f-08da76ea6da4
X-MS-TrafficTypeDiagnostic: AM0PR04MB6019:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zHxmR4Sqbsd75La8rlWGQBktRHHW1HT0ll/bGliHxoRNLFy537avPP8aC2AUFguVUDU4Pp0vbMQXmGUntizCXt8xph9SLTqMolkRT6OTxseGPq7ZoAbJMRtEF5A9JbvTQsPKukUG6sdiN6pvXTv3CyZDJYKYlI+NCFXU1N2Ny75zQK9CE/W/V8oIvdsOFKKoAchMCM0Gv0FzIPJbx+QwmnqcPbzU4Qlfl6EzO+NDDOoAJNHPbMqxTYpxq/73H+ugHpaFLOsjyHD99TET6lX2GlJYjUXq9lnhb+N+Ra1AZfyVk5lrdrIsbeLh4e0ZFZs4jBMb+LUXafu5PI/LBDVlLflMe0Cb3DJ0qdgARaAxJNXt0n6u5S8/NY0FADJR6RRVTxr6S8AL7VaCFCFTDZPmnoeggQziI1765PDUUJgkK7OaclR6pZALsTidfA5qwz/zarQjMq2IkTMbiLsPooxfz6sPETkbOoZPFmJ3NQ1xATVzbP91KoKaoyBpIsLAVeX5VtxjyR0y5lE2+IwgSSmy3tw78JfYHL02jswpbb2de90P27ajB4DzQ8AQEaDtU4dcVdcgo/Oc/Ss73U6kzTZL9dxXv46AHuGTm1IPNp4EPqwvWndHE3A1e4jHmI3UkC7/IYsdhVVounSmN5HkV0HwHY/ZR+3Saf+agWC/f7IsJT48suIsX0CS+tIOXddf/a5KnIgPKOxpNGW1UE/t0oR3jBt9+Fr/aXeZz49NUNnlomwIU99v2ALp3Kq13Xy+DwAEe9+15ob7XH2PMcTj6TgEIsqvi7tIDYw8+eQceQUXr9QBNey4hBxIY/aNESZSJc7eb7yZp/dDjSv+1YmdJ6TOBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(396003)(346002)(366004)(136003)(6506007)(41300700001)(6666004)(26005)(6512007)(6486002)(54906003)(6916009)(38100700002)(478600001)(31696002)(53546011)(316002)(86362001)(186003)(2616005)(66556008)(83380400001)(4326008)(66946007)(66476007)(8676002)(5660300002)(8936002)(31686004)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0FnSXM2N3N2MzVOQ2plNUdCWTRtYkhXWDdNZWVPOTBmZ0FsbWVCc0hlZzFh?=
 =?utf-8?B?TXl4S0tveUlYNTUrTS9RZ21HOGpMWWVPL3E3b3NGdStORGJheDFxZHVWaWc0?=
 =?utf-8?B?NUFvZlg1WGRYYnRSdXdBU1hvMWlOK0pMV0dHQ3ZEL0dzTTgrOHh3NHN3d29q?=
 =?utf-8?B?YTVtQ3ovOUo5NnpvVHBHZWJ3VVI3WEFOTjVWVWhlblVBZmJlMnVCZWtmN1FX?=
 =?utf-8?B?ZGNQcHROVXFQUWtUSUROOHozME5kSHZUcXJmL1k3a2VuOFQ4UHV1N3dpQ0pl?=
 =?utf-8?B?RmVzOU5yT3M2N0Q4bHQvcjNHdlZXZkkxNlRJTEJWWUdkcmQ3MzZ4cjVNSEFY?=
 =?utf-8?B?TUZLZC9ZVXFTOU1tVHdybExYNTMyUXZKY0dBYmk0M0szR3hiZFhsSTI2cXd5?=
 =?utf-8?B?OEthV2wvVUl3enEySlNKVVM1NU1tOHN5SjZZV2RuVkkrVWttR284OHRLbzJD?=
 =?utf-8?B?c3VPMGtVZjJVY0JFQWtDaytXd0x5NFZQS0x6ZHUwaW9ZRE9DOWtNdWkzbjlz?=
 =?utf-8?B?UEhpSkNramdtbllaT1JpVnFKU2hXWm5mcVZXSk82VGdMeVBzOGNKRHVudHph?=
 =?utf-8?B?ZjZGMS9uMEZSNFc4U1FEbDJYMSt2NytVNmRQSWxYeGRrV0crN2dBSXA2Vmtr?=
 =?utf-8?B?ZmwydSs0UmtRaEJEb3Jyek8vSk5uTlZaTVI5Mm54SnhPa3JPaUdlNzRtZ0pa?=
 =?utf-8?B?VVhwN3F2TnpuY3lzK0JOVlZJUFNEMVdEaS9mQ1pHdlIxanBNdVZCYmgxK3Vv?=
 =?utf-8?B?SzdmR29Ma1VBajJVcXdrMWVQcGtyTkdWK0UyREZPT3lOVUJTdkc5ZFl2N0sw?=
 =?utf-8?B?MkhTWStyWHh0RTZ3MVVVTXBRK2VaT1RrRXF3S0V5TmpiOTltUTlnRVpRdkJr?=
 =?utf-8?B?a3hJdFlYUW55QVNRUm1tMUk1ODRHRVBYdWRUdElNczZwVmp0dkJJenVkbVZq?=
 =?utf-8?B?M3J1dGdBOVBVL0ovYUxZazZoNkVrY2h4eVZhYzREaGZBVnk1VVhvdnJKclZs?=
 =?utf-8?B?cGpJeE9iQWE3V0ZpVTdTTWd2RWprdnpRam5OUUs2dkZ6S2lEWnN0b3VEU1ph?=
 =?utf-8?B?T0xlUHZiV0NhU1ZwQkgzbG5jR3lVVjQ0RVdYekhRQmpFdmhSWmpHVWt5V1Y5?=
 =?utf-8?B?SWVyU3E0ckp2OWs2b2FteDU4bXRjM1FGaVByK0hOOUV3QVdjOTNia0M0dXVp?=
 =?utf-8?B?TThqdnoyc3VRemNPV3lpR3VpMjJ5Q3VRM0c3c3JEakdrUEZ6bEVkRCs0NHJ2?=
 =?utf-8?B?RExrUE5DUEFXUHJBL3BJQ2d0YTI1NkZLQ1JCYjEvQTdtb3JjOFdsTGtVOGhC?=
 =?utf-8?B?bmx1THVSVlpLZ1VXRXM1NnFzSkdtMzVvYWYvdmJxbVFGbS9hM29JZy9UNjdM?=
 =?utf-8?B?KzJPL1BNZUF2SkpjOHpBbGlBMzdZNkVYd1NES3BGWDNZK3JsMmZ4dGxuV3F6?=
 =?utf-8?B?RS9DdFFNSG9hTGpKK3drT04vbE9SRG9XYXppWTRsaTg1cjZuOHNBSUw3MllM?=
 =?utf-8?B?MkNzRzlSNjBnUjMxMzNHUUxmNEJ0Z0NDTzNLMHRFUFlIS1hwOU1YTGllUGZH?=
 =?utf-8?B?MzJkcjd6TkRlWnpwQjhqaVRDR2JudHFnVmFKcXJiRkZMdjNKeWZ5RDNVd3hW?=
 =?utf-8?B?WmtGUVMzNGJESHowUGprTVl5VTE2a1d1TFR2d1V3MjVwdkhSMm5IY0pTZWFy?=
 =?utf-8?B?a0RaaGo1dHlPeHk2V2xOUHdTRWpHSnN2ZjB2VzJKRTlLaitMT3o4RXdsU05J?=
 =?utf-8?B?bnAxQTI3c3hWZ1EyamM2VFp0bE44akJRYVR6RFkvcXlZMkFzNTE1NVU2Mkww?=
 =?utf-8?B?bU1MWFlWWEJkSUJ5TTZPdzZlRHpuL2FBRHppVWZRQXRYQUVuc0ZqSVBFQVpn?=
 =?utf-8?B?Q3FyUE83U1I4YzJwYjlJSTRqZG15bnNOOGdoREU2R2Fja0RvMDVNeHJic1Y5?=
 =?utf-8?B?byszT0FiYVlCaUprRTJvSUdEa3VjZlJ2aE9lb25HZytKMHhVWnRkWkMrNlJs?=
 =?utf-8?B?M1paTys1QmtrLzFETjZ6WC9qcUdGamVUM3Y2OThFMTh2Tjk1RktsRU1lM0Z3?=
 =?utf-8?B?VFRRSkRaSS9kVExkY3d0TmVhVjhXQUplWXYwZ0x6bmZLOURlYlkzcmJnRi9G?=
 =?utf-8?Q?a7nmsYHTvCGxYJ/DWzNdXrYgL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a042dab-8b43-4014-726f-08da76ea6da4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 13:57:26.1671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdLYGKrx7k5UA3JEb7eHXKUEu88VLjVg7SnkJU/DQIAy61i19IGdgZxlTjeAaUDZDBWJF+oYcZmw6kUjuW5tgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6019

On 05.08.2022 15:05, Xenia Ragiadakou wrote:
> On 8/5/22 15:50, Jan Beulich wrote:
>> On 05.08.2022 14:44, Xenia Ragiadakou wrote:
>>> Xenia Ragiadakou (3):
>>>    xen/cpu: Fix MISRA C 2012 Rule 20.7 violation
>>>    xen/cpu: Add missing white space around arithmetic operators
>>>    xen/cpu: Undefine MASK_DECLARE_ macros after their usage
>>>
>>>   xen/common/cpu.c | 15 ++++++++++-----
>>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> However,
>> - I don't see why patches 1 and 2 needed splitting, when patch 1 already
>>    touches all those lines. It is the usual thing for us to make cosmetic
>>    adjustments when touching a line anyway.
> 
> In my opinion, the initial patch that added the code should not have 
> been accepted in first place without the white spaces around '+'.
> But maybe coding style rules came later.

Iirc the goal was to take it unaltered from Linux.

> Nevertheless, I continue to consider it unfair to rely on and request 
> from new unrelated patches to fix those issues.

I can certainly see where you're coming from, but please also try to take
maintainer perspective: By doing trivial and obvious adjustments at the
same time when touching code anyway, there's one less patch to look at
(and later to apply). And please also consider how "git blame" or alike
works: By touching the same line(s) twice in close succession, finding
the "real" change is made needlessly harder. (Putting the cosmetic change
first is generally disliked because it makes backporting harder, in case
such is wanted / needed.)

I'm sorry if you take such requests as unfair - they aren't meant to be.
They're merely meant to make things as easy as possible for everyone
(which may only be on average, yes).

Jan

