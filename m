Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AAE6FB14D
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 15:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531565.827328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw0l0-0005rr-FT; Mon, 08 May 2023 13:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531565.827328; Mon, 08 May 2023 13:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw0l0-0005p7-Bv; Mon, 08 May 2023 13:18:26 +0000
Received: by outflank-mailman (input) for mailman id 531565;
 Mon, 08 May 2023 13:18:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pw0kz-0005od-B9
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 13:18:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfb06236-eda2-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 15:18:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6960.eurprd04.prod.outlook.com (2603:10a6:803:12d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 13:18:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 13:18:22 +0000
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
X-Inumbo-ID: cfb06236-eda2-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfWN+H1uAMUpoMXaldDpKZ/Z42pc2mh7q4TGXESMhcPIwv1NrCn+wWkbGz/XeQyNH4sR/5nvBVBuAm2+WFBF6757/GCfO0SQ4mAr+rAKCABa3XIi06dg6OxYqklW8PUS7xFVh4SkUcKq305gtGqDbI/XRTCat8BMXFrjtQ6HjdUaLWgdC01nEpJmvKySjCyyFj/66IELgQGFBQthxL12G9108+3ok8hhYnBFwVXRB79zxlbXLCwk00oBhMaNYUAe/yHakeXw0Ft4O7mD8LfYoTfdJY+0fZwUFGFR1jfhZbuL2BkRs4Y1n1TfnLQQQbSjlqpNpwWURT9EUOob8H2wRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWRPL6YneaoJ91jGEXzcRq759h8bxvZnyP2YvrxalZQ=;
 b=JezcqsJmsQEbTP45NYM7m2gml4Xw+4tG3wE02FRrI5AyPoaMcNl411mqeflATSJRUzu3YTNhJcg4h5NaOslhneUSy0YEDobDqgf66nAoiRIyePOi5c9ChpjF4EBXsEgYJFawRFiAPlRD+67VHCxLhN3J138s0RIH9bLnCxKsxCcXYTGuZf4Vx2tQeIPo5brXsdnZHFtOaydM0RsVTQsjYmqjVB/mMbEHJaWq9+n9EvhYfTLlKefMX7/yza0wzivpH3glF3HBvsMO4b65WFiQDh6qoZVbbHgky3Nq1MI+WafxuMIJITtoh+rxo+NWDXVrJ1HKR3/V2vtZ/gDvKQepYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWRPL6YneaoJ91jGEXzcRq759h8bxvZnyP2YvrxalZQ=;
 b=Glm/1kuGBMwg1S9vunwndR48fmCjYwRwcKR51FHsXYvJct9aosctaLMEnJuoB5DPUBB+0kEBGudI0caRC929CCFdqddKvrXLs+dkzHn9sHchEz007Onx7QAESE2SCLvR2pZ3xJEK8Jr5+Z/mVACFqvQnvObdEm8RqcGPFsIreQFOqguQ1WAtP7owkv9M2Mb1y/whweHCXLFefG0MrGFs2peM1AOEHpj62rW46iluvcAnQ66ixHOGfj+gCsgSkhsgRenYwYDnCl/vJqCc+s3oWRt69M6ePF+RXDGS/MzprsGOlqG346fWIC/eoL0wMUm2n0oNjAH10z4cZFd2vXylIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d8c9728b-b615-7229-2e76-106d81802a20@suse.com>
Date: Mon, 8 May 2023 15:18:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] x86: Use CpuidUserDis if an AMD HVM guest toggles
 CPUID faulting
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
 <20230505175705.18098-4-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230505175705.18098-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: 281687fc-17d3-4262-a086-08db4fc6b2ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UyctBTik5JSqZ9P4vksq2NsXMP80FY0ZNyHrBxCZ12G17RpK/6CZg8wRNknn4ZGdob8+7FSw+kzFRXlwGMRGrOeoAQ5FKNGAYW5MR+vExEJ9cJJeq8CU31vz0j8JRmtAc0bhZduRyvZIUkA0OjMsr3VgYSUGErAyLjh0OG86UVh3wOZOF7JISZnXZELO7QT7xgaShD529jPVNgnP2zVYSlQubtzI760CIDCo6wN+O2+nJeNChI7J/gg0bYptuy91dFYSCoytW2AAKLkKHs5HSvoY/Qky4DOfnZnaGb/F8Cxe5z7ylMY6tUp7BqODoAQHiL4zAxHfAvCZWchqkYcH4JKb56KEkbteOu3mGG1IhySohRumrPnMJN8dFvl9grdDj2i/+su7N9G2uPFiLqyd0DxaGx2lHYLNHOUeuDbiesm7b6VtVLqt68pRfToyiFEiwuUFK51/NvVCqyLauVChUWgJQN59ModLaLLYpGsugjAHpI8IifL0zgdPxg6X4ZCZ46f/7o6Oqtwn7k3bQ4fRzEbvTYCr10pfsXimh3eBQWTu0Jf6Nd1yiqmcSQxtSOcF6+t44jMnuCNn25Gzkx4OXpFBC+PrNouDcwxloRHkG5yM1tLkyrGWRvPRW+iU7cUu7kGVjF7RtOJkd//NDiwSGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(136003)(366004)(39850400004)(451199021)(31686004)(66556008)(6916009)(4326008)(66946007)(316002)(478600001)(6486002)(54906003)(86362001)(31696002)(66476007)(36756003)(83380400001)(2616005)(6506007)(26005)(6512007)(53546011)(5660300002)(41300700001)(8936002)(8676002)(2906002)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGJRVkZybmhUbjJFWU1wWE9GWnQ5MGRKNFFxVkhJY2YzWU93MG5hRHlsKzZF?=
 =?utf-8?B?YUFhOW5uWEFUaFFMMXk3MWh1WnNPcjE0Z2t5MmpweGtIeWh1d1VLZXRoY1hK?=
 =?utf-8?B?am4xWU9vSUNUTlkwUHN6UE95ZjZEbVhMYWJqSUx5UkZCQkJCbFB0Qk5wU20r?=
 =?utf-8?B?ZFFyQ0tZcHNjSi9uWmk3WCtRRXdyQ3FOWDlmL0VXTjdFUStKQXVmdVFqWGUr?=
 =?utf-8?B?bTFVT1h0R0RNMTRpSG9uMlBnUFpEU2lsSHdrTHc3d0RIN1MzWGZicU04VU9U?=
 =?utf-8?B?RzRGYTh2R2NpOERUcGlxYnRLVnpubURwNXR2WHgzcllYN2JCQXo1NzFSUk5I?=
 =?utf-8?B?b2JrdDNLWjJsL1ZaYWpXRE53QXFjQ0E2OGtSNVpNc1RoNjVHczI2dEZDT2Rz?=
 =?utf-8?B?anBHaVVxTE9WM2hZTFdsaEdCcVhmTFYzK0pPM3ZqSGZLVFJteTlPV3FQVFN3?=
 =?utf-8?B?R2ZQZm5RM1A4NmRDN0J4bDFzUUVmQnhWQW1TTXlTY1hPSVgra3hZUmVYT0xK?=
 =?utf-8?B?Nmh4czZOc2p0MWM5RUJTSzN3SW4zUWg1a2lROTVPTXh2S1V4dGZhV1RBaEFQ?=
 =?utf-8?B?ZS91Y2hweGIveUVFcnppMG54bDNPamV0VXhvOCtSTTdwSjBHeUdUZHBTYzF5?=
 =?utf-8?B?UkRldjBhUEZISk9lT0pGTzhKMnczVkJPajhGcEFlT1lMRXBIekVPVFhiY0xG?=
 =?utf-8?B?Mm5UK05lTWpzaEYxQmNKWS9qSFpqZWNrY2lMd05VWGI1MVNlYUNSWHRrUXQ4?=
 =?utf-8?B?S3B5QWJkZFZ5SlRyaXN2VHVKRGRKbzJ3c2tYcnlzeE0zNUJzSEF5WTRCNUZ4?=
 =?utf-8?B?NVhHSGZuZ2k5djE0dlc5aDlRWHpoYUx2YnJDZm9pbU1tWnR3ZW9OTGtHbmdI?=
 =?utf-8?B?MTFjRlN2YzB1dnYvalF2amQyM3ViN0VMWkdPM0U2M0pBM1krOXhlM09RYjhY?=
 =?utf-8?B?aTk1bmNtUmdoY3paWkVYMEQzVGkwRUlLK29wMGpMaTRaMVZBa1ZUc3VteTA5?=
 =?utf-8?B?SER5K0JQN3BxWHprOUdtVXhWWTZDWVh5bkR6djJUVldOT0dpQkhGVllKcFBs?=
 =?utf-8?B?c05LMkNkNU1ucm05Skd0bVkvTnlmUlhqaGI1UUliK25tM095WGF6UFVTRlho?=
 =?utf-8?B?RGhXcE1tVlBOVVhWa3ZhYjhyQ3plYmhEaVdkL0lhQ1ZaejRYUGRwb1Nwb1RS?=
 =?utf-8?B?dmduOUxCNlBialBFTzViYXRybW00T3pLY2Zic2QzTFpESHA5S3RVK2xUQ3Ar?=
 =?utf-8?B?eFJvd1IvVHVJVVFXemQ5QVE5bk5oT2tFdVNxV2NMWGd2SjJPSTVWcVo1RUtx?=
 =?utf-8?B?Z3FramY2R3dvZ1VNbjN1MEFWTnJtN1hwWlczVTZNQ2NWZTBMSndxbC9VUUhK?=
 =?utf-8?B?Q1hKeVgvL05hNDZZZWpjclRTS3V0VmVsK1hsMkpWZVZFUlVWRVRoeGVYM3U4?=
 =?utf-8?B?a3RuQWlTV0Q4ZkY5M1lkdHdYTnZWQVpyT3dqVmlEanQwb1lVbUdRN0JUcVJp?=
 =?utf-8?B?QWgzTFRzajNsMGJON0RicTdGQmR4TG95NGhRRmZTTVhsZkJSRSs1VlRLYXkx?=
 =?utf-8?B?MlVYWi9XWHJuU2hyWC9DekY4REpsMVlmcFB4RzZ4dFNrazhzZ1NrVUFpdFRx?=
 =?utf-8?B?MWdpbE9TNDRXSFVDUDJGWjlqT0hZWng3Q096aFRya3F2TFIxaFl1ZlRDNjg3?=
 =?utf-8?B?Vi9LS1RmWS94SytBcjVCb3N5Q2RscjNOaUtoeUdZcXYvUFhBY0NEeWh0ODkz?=
 =?utf-8?B?VXNhcEkvOU0xMnFjS2hlSlBieGRCYjVHazJ3My9DKzYrcUdSRit2Q01YZ0Uv?=
 =?utf-8?B?WDNiam5jTkRyQ0crenpFMERRZGR0VE9XRFZMeURoR0xJMnJPajVhS0NybzlO?=
 =?utf-8?B?NTJYSmhUSlVnR3pKa3NPWGtUbWpGRis2QjMvUks0NDArSFkxdnpBWHE2d0V4?=
 =?utf-8?B?RVFZaTVRYVM4UUlPS2F2RHRVSllZbXJIM1lKdldUbTZlQy9tL0RFVHhtVXUz?=
 =?utf-8?B?eHFodFlQelB2enpYRGVMaC9uMmJOdWxlNUxSUXpkd04zQm1pQ05YMktxdjA2?=
 =?utf-8?B?VHRoQzRjNjY0QlpnYzYzK28rWGpvMXYrNXZkcVgvY29xUnZpeC9YWndSMDlI?=
 =?utf-8?Q?wWkgeAqMsLmPQORjvPs800Npm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281687fc-17d3-4262-a086-08db4fc6b2ca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 13:18:22.6322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8Gb5HPm8gE9PVNJvmQOVHVh8hk9MoI6+9m7jaFjdydQSe21v/rXHpIfO+Fx16JmWlvVtAL/DDKAYvFxx+CVqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6960

On 05.05.2023 19:57, Alejandro Vallejo wrote:
> This is in order to aid guests of AMD hardware that we have exposed
> CPUID faulting to. If they try to modify the Intel MSR that enables
> the feature, trigger levelling so AMD's version of it (CpuidUserDis)
> is used instead.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/arch/x86/msr.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Don't you also need to update cpu-policy.c:calculate_host_policy()
for the guest to actually know it can use the functionality? Which
in turn would appear to require some form of adjustment to
lib/x86/policy.c:x86_cpu_policies_are_compatible().

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -431,6 +431,13 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>      {
>          bool old_cpuid_faulting = msrs->misc_features_enables.cpuid_faulting;
>  
> +        /*
> +         * The boot CPU must support Intel's CPUID faulting _or_
> +         * AMD's CpuidUserDis.
> +         */
> +        bool can_fault_cpuid = cpu_has_cpuid_faulting ||
> +                               boot_cpu_has(X86_FEATURE_CPUID_USER_DIS);

I'd like to suggest that in such a comment it not be emphasized that
it's the boot CPU (alone) we check. In fact I'm not convinced any
comment is needed here at all. I'm further inclined to suggest to
omit this (single-use) variable altogether.

Jan

