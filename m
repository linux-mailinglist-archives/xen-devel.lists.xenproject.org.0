Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD37B6FA2F6
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 11:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531315.826907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvwpa-00083J-P6; Mon, 08 May 2023 09:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531315.826907; Mon, 08 May 2023 09:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvwpa-00080a-ML; Mon, 08 May 2023 09:06:54 +0000
Received: by outflank-mailman (input) for mailman id 531315;
 Mon, 08 May 2023 09:06:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvwpZ-0007yZ-EM
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 09:06:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abc41864-ed7f-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 11:06:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7914.eurprd04.prod.outlook.com (2603:10a6:10:1f0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 09:06:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 09:06:50 +0000
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
X-Inumbo-ID: abc41864-ed7f-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3E2U2j9hj7ITOMupBLBdqJoAIfMfLXyZ1GdXZ1I6PfIEMj4QrqUwRiYj5P+C/CNOgZqi+n+GDuZJvyJqukYLTm594mx2BtcIdLstMVV4bwB8VQOBwL5sP/f60zE7sxaX61bY5AD+SFTvlGa15tivsSK0nDtI8reSUoAGVjjpB/gZWm5r2JdvG78lXMkFwFHZ6t1sK6yjQL7RsIpQUpgTl0gr72wV0NxsQOBp1pn/W/u/Y/2zqyO0h/jcju507/YtoQreWC5+vO21Kz11XQ8yGymlX/Bkn4qqTc+4t7b0+ATsY5kAeqYE/9Dr406d56g6P+2OCNdmjs6FqCPmQindQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iR+3mk6Pn9vKssQCx3/HtfIvIl3z3pMrxq7NHaT7Tg=;
 b=cUHjSiuZCFpHw+3pn+wn3yQuJOitk/gdbnXMuT7S3AGyeLneqsCA0YST/j+y3pFTVOIV9uuRJwn6/WCB99f5VfbeyOL4cwzg166LHZH2sGgDP9XXEqbleEIGpQTlUPa/pmm77Wq05FRf+mYB48/go6O4wUOE4lDReMUkbwPhtJNXWjmEMi/8E+kzEjkHmocWQ/klKMS2JyBhTdT+rD18LxHm+n2BzNjS8ISeBP9YidDWd6Fn8RxoQsU1FaweQKjiMrMIuomYg3BZY0U7DN8mNAMHGgmDzxQ3SBI6/J4xjbIrWRgK8VnnCbnh5i6GACvRrZR8SUzka5D3gGEBWQa1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iR+3mk6Pn9vKssQCx3/HtfIvIl3z3pMrxq7NHaT7Tg=;
 b=ZQm2dgMe29WxG+WOl6KPrdV3M3E50/Mu/yv2sNTB0wi2QK7fjpPK3TcUlyW+Ci3VeCbChXu3mH0Br13fKwV9HEqpUSVfbbWyaFsvxQJgQ0d+bG3M4d+Kgym5FtE6NjjFJ4775ifiBywPb5YkvsJ103dfYaCMSOQt2knHpoV1i9JaAzYAckrPD59DeGRv6OEdXKoUnDd6/abAvIM5R6ITBScNZL9C+77sQ9+y2nqsxsu27SJE5G8hS40TqPYmnOW7dIslTrunD3Ktp4iB1Gn2dTD89hdrZbJUurk2coo2vSEfR6N0rmkAR7Z3CJslK28XohG1Y5K82khIk+yt+TUgqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <05b27f59-f906-79af-6c3c-6b6fae7cb1a9@suse.com>
Date: Mon, 8 May 2023 11:06:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 0/3] Add CpuidUserDis support
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: d0078734-529c-433b-9eb0-08db4fa38ee5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xA6FRKwtCGVMjMxi81FMuQLHiqqOYt5t0tuH/g2uOn1aDjkIIW1A/7VP1jYN3S4P+/I+iMWVa6iJST2+Nt+RlvIT8sMKubJC0tueFhQWaUn2k74IUloGXjVBI34O0iivgmRqMbt1dTqvrmr+xl4nn1jHEsjkMNC7z94W8MVX/fm5NtiQVbkhZfP0nZrMIhjqLkHWLti/A6RDJStHal1cAkg+Ds4DakfI47uKi6RYJsWOnisCOV7nyV7Pa413J3V7mIqZESKjx1e/KTZJUUlN9INiaO7kIJ6XKBQ6StKbJOlTFgMvfstmdCeCEINF5DBxdZOjIqMZkiPZjWvJvK2lw2iM5D64Yh6TVC7g45F30rrTpiGxGopdSS0K2C1RF6VPP9JdTL5Nkp14jt7KwSfhta5NlO2RozwrJh73QJyzhycOA/q9k+QjxpSzJzhLXjVGDM6WjIuxbItiDeBwAjlOHjfWSofc+Fkpj7hXzRiMoANrzrxv1Q6z1T6tejssq3mWuT1xVoOtsGnC3q3Cx/YHCdKHpvK8Uls38SylyMPlFIckssHkwl3YQZce5M8Dp/ZwI0n1TDW255hSP0egKUboXtPqOhRnC/lHjjqFBg1NAsZOuMgGO5XmzXP8E0LV2E3kARPaQXyYL7w/rVb4NIEcaw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199021)(31686004)(36756003)(38100700002)(2906002)(8676002)(8936002)(5660300002)(316002)(31696002)(86362001)(6916009)(66946007)(66556008)(41300700001)(66476007)(4326008)(83380400001)(53546011)(186003)(6512007)(6506007)(26005)(6486002)(478600001)(6666004)(2616005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnE3cnV4c1QyOVp3WE9QY1BFeVlIS0xZdFR2L2w1clJ1MzdPVmZkOUhzOHJC?=
 =?utf-8?B?OElXVkJJVjFhUjZoQlZpZnMvZk9DQzd6cmJOQk9QbDJXbGptSGo0d0R5QXUx?=
 =?utf-8?B?L2Y1WmNXaEYwUmR4QnpKYXZCcXBldXg1ekw3SmQyQjllcmVEVXFmYTU0NEZZ?=
 =?utf-8?B?QTFmY0licFVTSUtHQzlXUTNFRGRFTEVmNFdzV0hBWEw1bVo1ZDlteHZjc2tU?=
 =?utf-8?B?Mm1CQUZDVGZSeE05L0VQRW5ZcFFzZm5MZURJQkZaRzJGWEQxMUJFYk9tbWQv?=
 =?utf-8?B?WXF3SjZvaHN6MGd5Zzl2TktiT0pvWjR1cWFPeUxNSTB0dTEyeW05dGdHcUUw?=
 =?utf-8?B?S29zcStFdUZoMlZZWlRNb3pTdVdoczZnSllIblBDSTNFVXd5VUZFZTQrbnpw?=
 =?utf-8?B?Y2FUb2lUMjdadDAySllnd3dVS1VkK1lzVy9RVWg1OE03NGlUNHYrcC9GaWpO?=
 =?utf-8?B?dWNNRmhlTCs5UlNUWmdjYnY2V1gyUm9jQUYzTmRUenpYdy9tUFh1dGF5N0RG?=
 =?utf-8?B?enM3a1hzelhEdzVpZFJrbzYrYll3Zm5aNEp2NmVXM0dSa3VLV1c1R2ZKb2s0?=
 =?utf-8?B?S0VqU0FwSUtDVWY5dFovNDBxMGhTVDVJTnFaeXZwUVNvbml4V2FmR3paZWY4?=
 =?utf-8?B?TE44TTlnVTNNb2NJMVhJdlpucG9FdVdyZHZ3K3UxYm0zNksrSHhvZ0txRDZh?=
 =?utf-8?B?RzBRWnhpZ3NoTE1VdkNpbnp4VGFWYmF1ck1kWHY5a0I0SllZdnloVGd5Uk5P?=
 =?utf-8?B?QjdVbWVyVlVpVGRQemI2SXpaN2N1RU5oUm9VUmtTUXJVWmFKNkIweWdLUkMw?=
 =?utf-8?B?UStYVTNmcmh5L0VFRWxCSnRJLzVoUmRSYTRrMUxwVFgycEJnRW1pbGR5UkY2?=
 =?utf-8?B?ZUZzNktSUDFCS1dmaFBsR2Nhc09qL09CK3RjaGhNZ3NUV1NkbGhpbVRTbGlF?=
 =?utf-8?B?QjJnWUdXQ1YvQ1lOWXVORmljVHg2YTh6WHkwbHdkcEwwbkVHQ2VGNGJ4dU5F?=
 =?utf-8?B?S255c1hqVWJVa0dHT3FDeGdNVXhoYlZ6dDg2OHJWL1QzeWVSenJia3hrdUVq?=
 =?utf-8?B?MXdQODRibWxwNnpwR1pkQU04SS9zTFpBV0tRKzZvM0NPL0JrWVo4SXVBME9J?=
 =?utf-8?B?Z2UvOTE5R3JPa0RHVnVLNU16dkN2UVg0WGkza0orOTI2QkdjVUV2SkdiSHVG?=
 =?utf-8?B?clQyT0FIMDk2Yk5CT0dlM1NuVVJ3azdaeGMzMlM2NVQzNG1ubHJKSDF2VVRP?=
 =?utf-8?B?NmlYMGtaSkQ1b2JaU05LaEFnVzQvZjZTSnQvMEptU0pST2pZVzhOWHBIVDlN?=
 =?utf-8?B?Q084L1FFRFpkdGxXVUs2UWFVelVTTVdsbHEyWGpaWFR3OGdQemtKd2pubkxs?=
 =?utf-8?B?UU9reE1USVlpbnlDRFhVbndGbkJ0UWdSWjFPUlFGWmIzZ3p4NU9XcmVaVlVV?=
 =?utf-8?B?aFd4Wk1wK2djYkNFL0VoZnpyejRNYjJiOW0ya1ZTdWpDNDJYMUtUcmtVR2Zj?=
 =?utf-8?B?TGxtV3d1TmZObDZqK1gybG5ra0t2VlZRdm5IMklxRTFoL2R3NWJ4d2lPV01t?=
 =?utf-8?B?ZnE4c2haTTYrU1lHbUJWSUZCY1llY3hJdU9zei9zdmYrWkJCTHZ0MC8vQk1a?=
 =?utf-8?B?bDhka0xmb2VhbGVpZGNUZnhDZ3ViVEVSSVV3cjlIak1LYkF4cDlOZjU0bERN?=
 =?utf-8?B?dDRKQUwzT0Y0bXlxSnVpM3lFOXNJOFlBMzRDRzQ5d0JqT0xOUDlwL0ZmMHM5?=
 =?utf-8?B?Vk5CVitnU2hjRjVjRUxEWjIzL1VxZVNpaGQ3VFRoSkg2amR0R1NaZTZSdHhE?=
 =?utf-8?B?cnpsZkk1VEs0MDRoZnkvbDdGYWhQbU9VZ0hDSkV3aER3K3Ira3dmd29pd3R3?=
 =?utf-8?B?M08zazBjYXQ1WitvNm5EbFNYalM2SzdRYjdXNTd4Rjg2SWFMQnRwQzJ4Qi9j?=
 =?utf-8?B?dXhrbzloN2l6SjdudGUyalh5SkpicWRHSkNIWkQ0Mm9UMEZYQmExNEhRTUVx?=
 =?utf-8?B?ZUNWZXJSelJKTG5IeUNBRHFBdjZ5Tmp4Y1FEU1AzMHVlazNnUE4yVXg1Zko4?=
 =?utf-8?B?QXFZeGdRb1dYaVpSb1Jxd1pxY05tZVRua2pvVzhHdUMwb1NvWHVycHh1WC9T?=
 =?utf-8?Q?YxcL9ETBkv5PS2BcYGnKCr9LT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0078734-529c-433b-9eb0-08db4fa38ee5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 09:06:50.0121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYds6VyWT7hVBkNSi5LuZtTxkwGgtk/bJdyZ5DLIVCejPI/SK2lMGZ00vRzjt61mK6Ar688jv+U1JwtQXZyzTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7914

On 05.05.2023 19:57, Alejandro Vallejo wrote:
> Nowadays AMD supports trapping the CPUID instruction from ring3 to ring0,

Since it's relevant for PV32: Their doc talks about CPL > 0, i.e. not just
ring 3. Therefore I wonder whether ...

> (CpuidUserDis)

... we shouldn't deviate from the PM and avoid the misleading use of "user"
in our internal naming.

Jan

> akin to Intel's "CPUID faulting". There is a difference in
> that the toggle bit is in a different MSR and the support bit is in CPUID
> itself rather than yet another MSR. This patch enables AMD hosts to use it
> when supported in order to provide correct CPUID contents to PV guests. Also
> allows HVM guests to use CpuidUserDis via emulated "CPUID faulting".
> 
> Patch 1 merely adds definitions to various places in CPUID and MSR
> 
> Patch 2 adds support for CpuidUserDis, hooking it in the probing path and
> the context switching path.
> 
> Patch 3 enables HVM guests to use CpuidUserDis as if it was CPUID faulting,
> saving an avoidable roundtrip through the hypervisor at fault handling.
> 
> Alejandro Vallejo (3):
>   x86: Add AMD's CpuidUserDis bit definitions
>   x86: Add support for CpuidUserDis
>   x86: Use CpuidUserDis if an AMD HVM guest toggles CPUID faulting
> 
>  tools/libs/light/libxl_cpuid.c              |  1 +
>  tools/misc/xen-cpuid.c                      |  2 +
>  xen/arch/x86/cpu/amd.c                      | 29 +++++++++++-
>  xen/arch/x86/cpu/common.c                   | 51 +++++++++++----------
>  xen/arch/x86/cpu/intel.c                    | 11 ++++-
>  xen/arch/x86/include/asm/amd.h              |  1 +
>  xen/arch/x86/include/asm/msr-index.h        |  1 +
>  xen/arch/x86/msr.c                          |  9 +++-
>  xen/include/public/arch-x86/cpufeatureset.h |  1 +
>  9 files changed, 79 insertions(+), 27 deletions(-)
> 


