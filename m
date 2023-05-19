Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848B708FA9
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 08:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536671.835240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pztBC-0000yp-3E; Fri, 19 May 2023 06:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536671.835240; Fri, 19 May 2023 06:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pztBC-0000vj-0Q; Fri, 19 May 2023 06:01:30 +0000
Received: by outflank-mailman (input) for mailman id 536671;
 Fri, 19 May 2023 06:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pztBA-0000vd-Jq
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 06:01:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2074.outbound.protection.outlook.com [40.107.7.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 973b9ade-f60a-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 08:01:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9363.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 06:00:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 06:00:56 +0000
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
X-Inumbo-ID: 973b9ade-f60a-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQPJjjGTGtC/hZw4sw+gZ34TqHInWAiIC+ERcQFb/fIVYRdNHkW5DU/BjxZ9Cc7eC5LCmhj/EIOhATOqloX/AA8mPKx+y310pE4NRvnZew+UlJMmvgkXJ8fETjLppDqn/wIBmXW88v5HdcdDECnUjWRKi3NIaCqk+zYf61yzkOY4MsVX7pLem8OBhNUHMwGdgHQlBW35pbvGyXkqjOKpCyxb7eaY7y3Di6pcDfbOrrFgoK9s+juV9gWS5ahP5LtS3V9mfppfecWm/w7SCTN4qo9zVlu0B1hQzWogMOXraCaNiyR4jA0PseDYOng2aF9N2PdjqkheHmmnOG9eM01wNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSeGtClR+KejmygyDgqPrvKuUAT9gGUEr5MA54PAiMk=;
 b=OCfPRe/2lyDVhjAUE/el2gNRqXoyGihtuTpNHMfAIoBZIlq7jfpIj6kU+B6MHTx7pEfS9CyGz3QKRDPDrTAtylwbC+x1lL65QqN3aN/B/dvxFSqj8DyL6T+sCoEe0X3T9uzLIhfIneeSNENSZETbAOVGwi1jtC6eslKhxwJabuYA+p6Tj7Ve66ochI/ZOBMZNLLgLTEfo9TdAMFMBaCnEfqyVxPrcOAKet+FMN+AQBTABY4JxEH2msWrtZRV0XZ7/6LIf3t7cxDS6YB244U3TngNc3F9RCTK/mEB0E6heKE9361yMBnw1d/ADj9djBz2zdwkr5JjZ27vMlXlgS7NGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSeGtClR+KejmygyDgqPrvKuUAT9gGUEr5MA54PAiMk=;
 b=4YFFoat30/hHxubgQTk2J1M9HB5gB7l2M8dYgCCcL2ZrHO6uL5iYzSMcogAYKn6iiFuHDs4WtZEJWmyfTMwa39zkHiEcXTT/7PjnWQq6QRSNaAyYcR3zWG91+yPG++DSneac2gG01u709QBhcWWTD4+TkzTzYZCFhC5lJfkJML8KQpUCgJfM+Rx8SDBUWICOQ1gdLulVvB1ZhaK0uQBU+NuV9WKvIQ983kME843DlbkCA3hwZ73oAcmAkvx1Ns2DhRdSUhUmKROx3OgiBb1DlM36gr/lF8GhaIm4drFLtXF+Dbaq1KPY/NQWvk48l+ZoKjvmfr7O4/fV7CFw1EsVfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb95d033-7a71-7cc1-bb8f-ee2a74d1c5cf@suse.com>
Date: Fri, 19 May 2023 08:00:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 4/4] x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS check
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-5-andrew.cooper3@citrix.com>
 <1d06869b-1633-7794-c5c9-92d9c0885f19@suse.com>
 <42cd2479-1eba-11c7-26d8-441045c230ed@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <42cd2479-1eba-11c7-26d8-441045c230ed@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9363:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f9dce8-e67f-43a1-c74b-08db582e6952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oDNyHy5GL0Ber8dmkqhAUouro2YoQWDXxNgyImu8MrWmzMnb4YulEszqQ0VUssnLjscF3YVgp9/0L9rAL/lpmVF052M2hxoEEA7Ms7G8oeaOZ8cBKdaD/8SHoflrkmjafieZa8ka2bNwoe8E+nrCTYxieNJXAsHUiFx9LHGIs39ol8RuSIphl2WL457kbxTeDppG0qTrenmgIe12/Z2QSlAJ90TXMHY0/++E0iStgFg2XlaVka9wzxOP777vxQGN2T4oArso2bbld5ZCmWCLgqEJrHKquH/tQ1z1JpTvszx50reY3bMB1i4xkYCpjJ6RREt6fyneHJIu8qfMkHeVy0/lp5FE9ksLOBMJUxl+/pLu4VVW7zIpkaKqXa4tafmtMp6b+Oqfw1R+O4q5yQWCdyKfuAa8FFwQARPApx6Z45mJnMazQ4m7cCZlI90m0sfqxBga5a6bdt2kNLwaeOUzD+PmwQYY3NEdLpoWMHbLdNCPTgaMRSQ4bNA5gH2Q3dtykpPAmAjeTB3IWCOtCUR8hneUW4aCmOqk7Iavx7iAC7BbAbyte8V9Kt/hxScDKaKo/ZshngiM4TUptegQUUQFmuuydMXqRT0rxz1tuGZkXn5NM/EZrEznAg4/aWo7EuyeqlBFJLR1jZcTj4dLUjASfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199021)(2906002)(8936002)(478600001)(41300700001)(8676002)(31686004)(316002)(54906003)(6486002)(6916009)(4326008)(66946007)(66476007)(66556008)(5660300002)(6506007)(53546011)(6512007)(26005)(186003)(83380400001)(86362001)(38100700002)(2616005)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uy9ac1hLM01QS3lteHFidldOL2xYS0FzbW5GYlB2Z2tyRUJwcHJWTHNwSnll?=
 =?utf-8?B?c1l2T0o3SE1jaFpzZFQvNjZhRjY0dSs1WjgrSDBlTGs3eG9FMHFkVGZ3dWRt?=
 =?utf-8?B?aW5rUEFQZWswUnB4eHFqTktMM25mang0MU40cG1VZlhUK3JkMURLeU15QVN4?=
 =?utf-8?B?cTNUQ0RoOTY0Vm1QbFUzaUpLMjlhdXRsdHh2RGFDdm1CcFlocnEvcHlieDRp?=
 =?utf-8?B?aHA4SU5pN01XYXpvd2VFMkxjZkJYZys0dnRDZCtQRjBITEcrTjgxTHFzVlpM?=
 =?utf-8?B?RDN1VEYrOE40WGF4OCttZ2VjN3FDUDRlNktkZVA4eUlwVlRwZGJIekdnd1dU?=
 =?utf-8?B?bk5LMjhLb3dhV2ljQUNQb2pwd2lDd0FKL1lDREtqMEkybkcwUnZwQjl6OVBV?=
 =?utf-8?B?OGZiZG1DcnA0Z3JNeGd0SXdqNnpkdXNEYzVyOWFhN3hiSlM2QUhnUDdpZ1R1?=
 =?utf-8?B?aHJOM0d1ZStnYVJmSWpuTmNnNlFxZHJjaUxIVlNwNndPcWpFYTFjM3hTazdo?=
 =?utf-8?B?Mk5rL0U0L0I1TkkvWW8yeXZlV0FSYkZFSW5nSGhVYjF0VVY4STgxREg3c1Vo?=
 =?utf-8?B?VUZVdGxGRzUydURMV1dVVlUrUzFUajBPQXhBVVdISHN2cnRBdlNUNkNJNC8v?=
 =?utf-8?B?NDlwcHZ2Rzc0NHh5Mzl0eUphNWllWUVtbDdsdC80dG1rWmNTUWxEbDFsZ1R5?=
 =?utf-8?B?Tkg2SDkvaTJjeDQ0ajRHK25jM0VPUzBnYUkyVnoxQ1lLRHZaZThUdjdHeEEx?=
 =?utf-8?B?NHI4M1hVeFhiOTFlbllPbm90bmg4NnEraW9TUmpLazVyQXpzeFBHSXB2RGNF?=
 =?utf-8?B?WWx4Y1lnNWJ5NERtQ1ppTDVCRi91VkRUaE10YnEyKzNWSU5zem5LRFNwRXBI?=
 =?utf-8?B?ZzlYa28rVUhZZm15ck1qY0I4akJ2TWE3emkzOTlnV2RVcURBK0lYa09yQ2l4?=
 =?utf-8?B?VDRabWFIYXo4VmdBQ3pXbXhGL1dzWGsrWE4vQWM2L2NCNXZXb2NDbXA2VG1I?=
 =?utf-8?B?byt5Q3MrK0U5blQ4c2NxUXRtc3EvS1VkNElNM3JkVUNmNzhVazZHWTloK3NW?=
 =?utf-8?B?ZjE2K3VhT3ZOVWRhSEJGSmVvWmo3clZKUTM3clAwQ3hWQTRoaHBwRGIyc2Ra?=
 =?utf-8?B?dUxDa2l3bEZPNWRHKzJFWVlkNXVEbFl6T3pjTFFKaHFaczZtQkI2NSs1OS94?=
 =?utf-8?B?VFVvYnRmZ1ptVzI2Z1FlVndIZWlyQ1MrK2drVmFyMDlFeHgzeUxSSUFKbVFp?=
 =?utf-8?B?aHRBeUUzMGlHQ1dudUsvMDVNc1FiVGxEZFJIYXFsM2FKSmFwNDZTdnBKWVdL?=
 =?utf-8?B?aXhpSDQzeW53NXJWbHMxb0RTYVBlMGg4eHFNVHFZZnVTRE1pQjJYTlVsZ1ZO?=
 =?utf-8?B?UkxxSVhvVkRyaXVNaEoxbWtleWkyRDNsUE1vS2hxbkhzZkZRcytzTzZQTnpn?=
 =?utf-8?B?enRuaWhyaVRWU2kyRjZXQVZvdXRsWU9SMW4xK1lVUHJiQVMyNld2Z2Vka0d5?=
 =?utf-8?B?SXVyTGR0RVJUNHJBLzRZVk1yZGlUVDR5M05tSjFmQVhiSkkzYmF0TTJ4cU56?=
 =?utf-8?B?cUdVMFV6S3UvWklCTW5yZkxsVEFYV09pWWRld0F2cE94SktUWkFWTWJvQUlS?=
 =?utf-8?B?WHVzWVBvaWtHcHVMTGUvc3VOR1V5cmJldnphOVVFVXNIU0M4SWFBWlh4NHUx?=
 =?utf-8?B?ZlREWXIvUjBHbk5ZNG4xSFFXMjJzUW0xa3orQnhIa2NwenB0a3VWalZmSFAv?=
 =?utf-8?B?K2RCMGNtQ1BGVHAxa0w4bXNlb2Y5U2JMZjg3ZWFnT2pSQncyN2QxZGlQS1Nu?=
 =?utf-8?B?NGJuZlRTM3JVa3pjS3JNcnlzQWVHSXdGYngzcHpYcktJcUZpUDBUR2NwUGlx?=
 =?utf-8?B?di9sb2ZJMGZoc3gxbVJ4cE4rcklZU2JraEpUS0N0YWxsaUE1WndQVU10RTFT?=
 =?utf-8?B?Q1BrcVEvUWlmSjZZM3BFam1TV0FSbUEyYkZtbjRzVEhvQkljeGh0V3c5d0tV?=
 =?utf-8?B?djc3MWFERklrQjQzUHYyaFQ2Qi91WkkxWmdKMDdXVXdGVFh2cTY2dE9RbEJJ?=
 =?utf-8?B?ZWxvQ201aGpUd0NVOThUUVJaZ0U4dHN2cEpXaTVNSU10YWYwRVdLZ1dMbU1r?=
 =?utf-8?Q?fcPP8F3zhpkVVCG7GrMRy3Z3K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f9dce8-e67f-43a1-c74b-08db582e6952
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 06:00:56.4215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyjRmGZuiXEkwTyNFm563fLe2HOHWNgL5Zn3CzNDPoJpLDmAqcTomA01hmlJks5gBl4LEZxG2j2ljbbHLZiHLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9363

On 17.05.2023 18:35, Andrew Cooper wrote:
> On 17/05/2023 3:47 pm, Jan Beulich wrote:
>> On 16.05.2023 16:53, Andrew Cooper wrote:
>>> @@ -401,6 +400,8 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
>>>          cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
>>>      if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
>>>          cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
>>> +    if ( cpu_has_arch_caps )
>>> +        rdmsrl(MSR_ARCH_CAPABILITIES, caps);
>> Why do you read the MSR again? I would have expected this to come out
>> of raw_cpu_policy now (and incrementally the CPUID pieces as well,
>> later on).
> 
> Consistency with the surrounding logic.

I view this as relevant only when the code invoking CPUID directly is
intended to stay.

> Also because the raw and host policies don't get sorted until much later
> in boot.

identify_cpu(), which invokes init_host_cpu_policies(), is called
ahead of init_speculation_mitigations(), isn't it?

>> Apart from this, with all the uses further down gone, perhaps there's
>> not even a need for the raw value, if you used the bitfields in the
>> printk(). Which in turn raises the question whether the #define-s in
>> msr-index.h are of much use then anymore.
> 
> One of the next phases of work is synthesizing these in the host policy
> for CPUs which didn't receive microcode updates (for whatever reason).
> 
> There is a valid discussion for whether we ought to render the raw or
> host info here (currently we do raw), but I'm not adjusting that in this
> patch.

In the end I think both have their merits to log. So far it was my
assumption that "Hardware {hints,features}:" was intended to cover
raw, while "Xen settings:" was meaning to be close to "host" (but of
course there's quite a bit of a delta).

Jan

