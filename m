Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D593E79406E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 17:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596683.930666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qduW6-0007aG-2M; Wed, 06 Sep 2023 15:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596683.930666; Wed, 06 Sep 2023 15:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qduW5-0007YE-VF; Wed, 06 Sep 2023 15:32:29 +0000
Received: by outflank-mailman (input) for mailman id 596683;
 Wed, 06 Sep 2023 15:32:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qduW4-0007Y8-8n
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 15:32:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94ab3a5f-4cca-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 17:32:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7120.eurprd04.prod.outlook.com (2603:10a6:800:124::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.28; Wed, 6 Sep
 2023 15:32:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 15:32:24 +0000
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
X-Inumbo-ID: 94ab3a5f-4cca-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9TRt6Adz2I9s62Ix2y3qdqbrkBvW7Y2xZSzi723PgEQur0QI+7m0XUYhu8hSIE+Bd9qYTMPwsG3Y0N7P5Kiv+MTAtxHi5PmdgGwR5LpjYJhQiSnjNEs08gb/a4VYSJTowAsP9e14E2Mz5FHx4M9AasS97lgGRs4EKN9JR4nto2Z+Z80IyGde12Z1RrbFGn9NnqVLipPdgvnNsO/rcQJtrykvou1Mhd7C+Ci0iNUWhejeYMMr+u5M0yc564h1Bt4xHD3F0eOIVNhYpcUxCiPPF8MWK0gUSEsaIC3xIGe+Ygi41KiyG5GHz1rA6eXvTunvmvvPsmoJgD/7UuD+/Xjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptpIpSjfDcZazuS1CWcVHyuPjuxME/AUNX+LSBsJlvw=;
 b=W5wcxmpfcgcTECI0tWLgoAwJpMPByzKTQRejs1EKuhtd7TOc51GZ8tg7nRf8SnYGyhvwmawUuPT5+PwBiAuevD4mA3POT2YMMpvHrcPAIfGUJQi/XlxW8QhQ2r3mZQPb5MzU4Uey4U34gERgflfCdS3/dAoQeBwe2b+CpR8YXRy0RvWsjayyEiHXzkd+IJO+3tUpad4RTJPZ03vYRa9p9yfiI3TacgBAUqBZOKeow9sIVjty9VL6iK/MosrgruH5qxrU6AkdboXWyGXKGrVJqcGNKQZaU5TduniSzMbBp5u+SbDsFavaLH1626Yb7hm8xbWWAUdObhIqXzCHj0tsNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptpIpSjfDcZazuS1CWcVHyuPjuxME/AUNX+LSBsJlvw=;
 b=xiV2zzc0BegQjVy/Qo3brimN0gu5Sal5F3Amb7Ckze+9Bd8wCFwQ/8FU/r5QodaZT7J5FQFwjTVeEsetsE9my3yxiRubhxOCtxmr1/4PQAc9ALx3xyvv4CRZl5YxLQG4yTrZSkwJfWNZ3gIq1mdDm6sPvWH5FiXqQlJtAMmReF6Q94Q1R5TYghSwYfKSy3Ls6qybUTSuZ+ACKq5OdEsa/rWAgZhhowQUBND1EBnchTgIygMYQ0pwBH4mpvKImJ+SwhRRyBBw1rrInpk+3Bl4pYA40I1sGMkTovjJLZIJnZ2d+k0myNXJ4EFDQo+a9uRwg3K0hTc6dE0jFBlt3ZkluQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa3cf62a-2d91-c2d9-b475-e5c58a312e29@suse.com>
Date: Wed, 6 Sep 2023 17:32:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] MAINTAINERS: consolidate vm-event/monitor entry
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e3ccc381-1fd5-b99c-e37e-5870af401dd0@suse.com>
 <09a93c71-28ed-4593-b8b4-fbb4d2a240f7@perard>
 <9a42f222-7803-aab6-99c2-6919fb1cc4c3@suse.com>
 <54be3f6e-3a54-4cbf-ae9a-9ceda5a0c5a0@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <54be3f6e-3a54-4cbf-ae9a-9ceda5a0c5a0@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bbfa008-6ecc-40a8-0d2b-08dbaeee77cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+yUnIgm31a25+kjV7CLBh1J37YMI+keXn4MgB0LZ216V7A9vM0M9Lyt/uNd2oZ2tnPc2VCfO0SuiCqYxqutonPf0SolDhdeARwDM/tdDB+UvudttFDX+8cGikdStOTR0UXide1VD151WeciSqnj6IniwYbmxVYxoXWkcrObCGbBwFEMP9FTiCQNZrIiHFYI0Wnv1DYtv6KLKG26aQm7wOE1B8Q0jNWZUNL+fUE4ZbONUqUkA16kmgslG1uwHHQsoq2ACNSqYtFSK1ZKXnr+VpFw7olLtCF4mwi/Pq54/XuRY2JtlWU31lJ6yMYCGj9PKti7sGUWN8CVL1aNQBk53uQjvrpDxoSrUiZrZEtw0lTwFBUIKgDFRP85MXpGbqR+H4YPFj+/rUXbZxPOXdYza2Q79VZAn7vo2161m1ULw5pIYmAwJaTDnKsL0BGG7IXS2N7l4VPgER1PFROzLFwzUBbSGyxM0tkJU76hfFhnyulbCalwtE9+pj492mxK2YWY0empm3MK4j943/P4y00G2SUbgjcjM40/jKPvG9j+ULmhlOc7LMp3yEREasOenZ703F5bpFVquWCrHTmGP4FpqdAYODdxZ1FxTWAfxxKXx/WO96w61hNE/m7/DguUaRWkH4lS9lyTVR5CpcApBQMGthA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(346002)(39860400002)(186009)(1800799009)(451199024)(6506007)(2616005)(66556008)(478600001)(38100700002)(6486002)(66946007)(6666004)(66476007)(54906003)(53546011)(2906002)(6916009)(4326008)(6512007)(8936002)(8676002)(316002)(26005)(86362001)(5660300002)(31696002)(36756003)(83380400001)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEhOdnNTUkJKUTRXSTFLZUxqKzZnWUVSSERMRXhCZ29BWG03RTczc0g4SHZC?=
 =?utf-8?B?VE5CSkJxdWpFVUJNTXFubHMrOVovak5ISzgxM1EzekJFVm9hVVZOd2xVYlNl?=
 =?utf-8?B?ZnR3UnhXM0JycEFyTmo0THN1YXFLenRWaTA4a3VOQkpwUnVPL2hkQ1AwWTJh?=
 =?utf-8?B?Uk5DUDhyeERwbWV6a1BiU2IvUmp2YXpscDUyc3NEY2ZZbFpmUElyaENZTzZZ?=
 =?utf-8?B?NEp6N253aXpuYTRyTDhxMTUvSHhQT1ArQXJRL2RwdkR1SmhuSFVmcHVjZFhN?=
 =?utf-8?B?T3FrMjFXUFRmdHFVdGdvY1RnakJqSFhMUzJXMmpGN1E1WW51dkFncnpUd2VN?=
 =?utf-8?B?TTBtRnExUjhDc3BQQ3RWRlJNbDliZldxTjNZdVpPMmJra2E1T2lxWXJtQXRY?=
 =?utf-8?B?SHFCS1pBdUpIUXFrSlROYkl6c2hWK2w4QzF1ZzRRbnkvclhMeVBvc2M5c1lu?=
 =?utf-8?B?dHBLdWJEdnVjL1VWdWdGZnd1MGd5STQ1RlN3Yithek9kNUxyZUt5SHIrMmk4?=
 =?utf-8?B?NXJGcDdPMWp0R2xJemYrWnlua0pLbTRTMWdWZTdMQktGQzJCN21ORmJwNi9Z?=
 =?utf-8?B?R3cwTlQrNElhbjNjOWVCSE5RSCtxSitVSXJmQVB3c1VtbWcxUUVpbER0andT?=
 =?utf-8?B?b1Q0MlRxWXdxeXdubXdLK2JqSWNyK0RrTlUyZllvaEFxcVhOcVM0R2ZycEZZ?=
 =?utf-8?B?cnZjZFEyWlRHV2JvVUxTKzFndE5kS0w2ekY4Q0R1cUtseG9Ma0pQMjQzWXAx?=
 =?utf-8?B?L0o2WTVJZ0ZWeGNSUkhsNWRWc3pZVXEyUUh5Si9ZOVNpNmRsWUpMWkdkQVRx?=
 =?utf-8?B?Y3ZsUy9oMWxhdi94WTRtK0Rqakw5U3lZR3RLSHlVbW9QVXg5bk4yeGR1S0R3?=
 =?utf-8?B?dlNwSHFxY2hjMnVIVWNOVU9wS3FPRUlidXVXbFc1Mk9zQmY3ZnM0cTFVNW1W?=
 =?utf-8?B?b1hFcW0rRmIwaktzbHVMY1JtT3RUaG9ZOVhBYWU3VktHbUFMNjdiUXlXNnQ1?=
 =?utf-8?B?YnBGbmJRV1NiTXJhT2FPT0JZSnJsbloxaFExMkxmWkdtbnJLUytmdEhQRU5o?=
 =?utf-8?B?UUcxUlVhb0luTktuVVlHWVZMdC95NGVNdmhnTlRtT2xNMkJYcTV1L3VKVmI5?=
 =?utf-8?B?V3ByamJRNXZxOWtEUGZkVUVlOGVPREpGcHNJVWtGeDZma0h3dkpmQi84SUZX?=
 =?utf-8?B?UGRtdER6c09CTVlDMTFPcy8xRVpjTy9TZHU2emhFTEhsRDU0THd4ME9aYzMx?=
 =?utf-8?B?clZHRTd6enlKVm1YQUVhZkFJMDduUmtOaVRhcC9IZkpNQ242SFZsVXllN1gx?=
 =?utf-8?B?bEEzNXVka1llWHR2eVVNUzFMc285ZisrSEloY1N2VHFMK3BCTC9yeHFtSzJO?=
 =?utf-8?B?VVRHZGNBeHFueEx3VDY1ZkkzQ3RBWXhURm1ROEszaHM0SCs1ZUVNMDIybUYr?=
 =?utf-8?B?RkhtVGR1cXJnbHBCWVJ3d2FPVm50ODRZc21pNFozd2xRMDRMNzdOVlcxcUgw?=
 =?utf-8?B?YnpkTnUraUpkdjNYU0R5S2xQVWowWkM5TDI0a0FpM1JvMW9lTDZoNUpiVisz?=
 =?utf-8?B?RUYvQUQvZXkzekVDS2tkVXBmMDdJTk0wRmlkR2xWNEM0Q3JybytkUzBLRzNn?=
 =?utf-8?B?TGU5MVBnWTRQdldFT2k4SlYreHpOTjAveUVFNCt5M29FV3lqb01Zb3d5ZFlZ?=
 =?utf-8?B?VGh5cDFjc3RKSjkrZVBBVmxtTTRJT1AxRkwyaHkzMjVBbTNKdXQ3WWVGa2t5?=
 =?utf-8?B?NW5LbjRPdkw0dklZMTdNNldnVTdQcTIyU05sb3U2ZDV0dEdEZ3dDOGFSSWhu?=
 =?utf-8?B?VVB5M0xqTlR0dUlLSkxseWJoZHErK0tIeXJBemhNbFB1ZnBhVnZVNGkrTFJr?=
 =?utf-8?B?c21rOStqQVgxOG9zMmxLOEtGTGhnaTRZMTA2eHdHS0RlaVhiMGI0K3dGYlFB?=
 =?utf-8?B?d0hyZFdrdFQyVUpyTFhFOVJzNHdXeWhicXhPdTFsYWU5WUNqUG1uWXlPR1Bq?=
 =?utf-8?B?R2lISkFUUlVEUjVyTTNvRkY4Um1HN0RzM2Yrd3EwU05lQ053RFdKZzZxNmRj?=
 =?utf-8?B?SUh4WnUwYTQvenhKTXB3VVdURW5jT0gwTFdUVGlrY0xZWnE5UUhqaEJMbjlN?=
 =?utf-8?Q?Zq+OpMCR4Y0oAoZIO8/7pqnH9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbfa008-6ecc-40a8-0d2b-08dbaeee77cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 15:32:23.9653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dzhx2+AVqTS7TCh5fLBl5pkB7UsZ37TQFhFt+gWpEtrhCfP7H0xn/1TK9ZtQga7MDC5+AIhrHcvTLl3iKjEh5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7120

On 06.09.2023 16:45, Anthony PERARD wrote:
> On Wed, Sep 06, 2023 at 02:50:22PM +0200, Jan Beulich wrote:
>> On 06.09.2023 14:40, Anthony PERARD wrote:
>>> On Thu, Aug 31, 2023 at 08:15:13AM +0200, Jan Beulich wrote:
>>>> If the F: description is to be trusted, the two xen/arch/x86/hvm/
>>>> lines were fully redundant with the earlier wildcard ones. Arch header
>>>> files, otoh, were no longer covered by anything as of the move from
>>>> include/asm-*/ to arch/*/include/asm/. Further also generalize (by
>>>> folding) the x86- and Arm-specific mem_access.c entries.
>>>>
>>>> Finally, again assuming the F: description can be trusted, there's no
>>>> point listing arch/, common/, and include/ entries separately. Fold
>>>> them all.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> -F:	xen/arch/*/monitor.c
>>>> -F:	xen/arch/*/vm_event.c
>>>> -F:	xen/arch/arm/mem_access.c
>>>> -F:	xen/arch/x86/include/asm/hvm/monitor.h
>>>> -F:	xen/arch/x86/include/asm/hvm/vm_event.h
>>>> -F:	xen/arch/x86/mm/mem_access.c
>>>> -F:	xen/arch/x86/hvm/monitor.c
>>>> -F:	xen/arch/x86/hvm/vm_event.c
>>>> -F:	xen/common/mem_access.c
>>>> -F:	xen/common/monitor.c
>>>> -F:	xen/common/vm_event.c
>>>> -F:	xen/include/*/mem_access.h
>>>> -F:	xen/include/*/monitor.h
>>>> -F:	xen/include/*/vm_event.h
>>>> +F:	xen/*/mem_access.[ch]
>>>> +F:	xen/*/monitor.[ch]
>>>> +F:	xen/*/vm_event.[ch]
>>>
>>>
>>> Hi,
>>>
>>> Did you mean to for example change the maintainer ship of
>>> "xen/arch/x86/mm/mem_access.c"? Before it was:
>>>     - VM EVENT, MEM ACCESS and MONITOR
>>>     - X86 MEMORY MANAGEMENT
>>>     - X86 ARCHITECTURE
>>> And now, it's just:
>>>     - X86 MEMORY MANAGEMENT
>>>     - X86 ARCHITECTURE
>>>
>>> (see ./scripts/get_maintainer.pl --sections -f xen/arch/x86/mm/mem_access.c)
>>>
>>> Also, now "xen/include/xen/monitor.h" is only "THE REST".
>>
>> No, no change of maintainership was intended. But there was an uncertainty,
>> which is why I said "assuming the F: description can be trusted". So ...
>>
>>> On the other hand, there's no change for "xen/common/monitor.c", so the
>>> pattern works for this particular file.
>>
>> ... together with this observation, I take it that
>>
>> 	   F:	*/net/*		all files in "any top level directory"/net
>>
>> is actually at best misleading / ambiguous - I read it as not just a single
>> level of directories, but it may well be that that's what is meant. At
> 
> I guess the ambiguity would lie in the word "files". Here, "files" is a
> single file and not a directory, unlike the shell globing which would
> include directories with a '*'.
> 
> The first '*' is described at "any top level directory", but it is also
> "only top level directory". This kind of tells me that there is only a
> single level of directories that is match by '*'.
> 
>> which point the question is how "any number of directories" could be
>> expressed. Would **/ or .../**/... work here? I'm afraid my Perl is far
>> from sufficient to actually spot where (and hence how) this is handled in
>> the script.
> 
> I think you could write a regexp with the "N:" type instead of "F:".
> This is described Linux's MAINTAINERS file, but not ours, yet our
> get_maintainer.pl script has the functionality. It might be nice to be
> able to write just '**' but until someone implement that, we could go
> for a regex, which is more complicated and more prone to mistake.
> 
> So I think in the short-term, you want:
> 
> N:	^xen/.*/mem_access\.[ch]$
> N:	^xen/.*/monitor\.[ch]$
> N:	^xen/.*/vm_event\.[ch]$

Except that as per Linux'es description F: and N: differ beyond how
file names are expressed / matched. I don't think I want to be the
one to introduce something which I've been complaining about on the
Linux side (people being Cc-ed just because at some point they ended
up touching a file).

I conclude that for the time being I ought to revert that change of
mine.

Jan

> As for adding "**", there's maybe something to do with
> "file_match_pattern()" in get_maintainer.pl, this function compare the
> number of '/' in both the pattern and the filepath to find out if a '*'
> only match one level of directory or more.
> 
> Cheers,
> 


