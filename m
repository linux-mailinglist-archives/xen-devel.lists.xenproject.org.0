Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E477DBDA7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625282.974433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxV0i-0000PT-Vq; Mon, 30 Oct 2023 16:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625282.974433; Mon, 30 Oct 2023 16:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxV0i-0000Mn-Su; Mon, 30 Oct 2023 16:21:04 +0000
Received: by outflank-mailman (input) for mailman id 625282;
 Mon, 30 Oct 2023 16:21:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxV0h-0000LL-3k
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:21:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 508d48f3-7740-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:21:01 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8409.eurprd04.prod.outlook.com (2603:10a6:10:244::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 30 Oct
 2023 16:20:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 16:20:57 +0000
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
X-Inumbo-ID: 508d48f3-7740-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFyZniiLYdvqh7VA8FG8mWZrGHT9DoIvJEreo1RslKY+qC1EfUv29hR1exON+dA4coM2MaFfQzAPKysbqLc3cpTYfAo+5Fe75zCTLS+VO/NsVmHxan9+YPV9rC059AaiLHbxvlGbUhinPO0tFpjQ4qyeoeBAegKKLXoxtNmBDFyzvUq/mZyEcYDXb2IwtQZDGpXW0mQINB/zmwTlrjrnGYzLMgJ8xZYDMvlbSoTMV67PeQus4k06dmuYcVMxtnfXjchSPpCtmkLuQB0V3/aRyBtOvvtF0pdcpz2OuHTMCkDcPH4xqxrGY+VWQl4EzySRPFsm1+h6ltWeaJ+kbG+ZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6geNRyVnAZFztF+B5xdlA8rKGH2UDWHlouDjL9Omh8=;
 b=KzWUAX+Go9c2caz2Nbzoah303ZluQpSOQ/qYsJFp1DiFzQzJSXWROiTmhiEnd/WT45NtWXBHmcm5oJFSdkm5lEDOvPfHEAko/wCd6U3/lvzU16FF9euivLVVnFbGMv0OQvpWJXKwqXigckXcQHqXza1iwMtevW9v3gec/sg5+A4wOO2kFUndVoKSLJ0lOnhgs5uzJN7VRnFlfpOJU850/iywf4dPyOKtajoZG/6hjBIq0s3lc3k5wM0d7Mskktif+buSdKJAFIN1yHjDh2jzLUEciQLH+7YC054RiDnJ2VHsvV9YmxdyBgHTRu9DFfVuvXePz0xY9Wyu5fFyFMLeJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6geNRyVnAZFztF+B5xdlA8rKGH2UDWHlouDjL9Omh8=;
 b=l8IeiXl2NiTosIIBlDysSUUjpYM8yWBD6AxqSRAOEu+fvX75Jzh1RuVGy85QwPpnQaPujoeiBJK7hcVZz9qpvJcJESeywwVbo98lhmDNbJP3usGFCNYVpIMJQWmKXG8NJxInfzbAeEc0sXNlBj2bclyznHybNttcXvdm0WIDnAwD04A1XqSDSGvceWjDRW09fKuSp4s4WxPa+hiDTL4waAIqbrL1oqSgLzwAH9Hb9ftx0YuPtawN3shOas9vVXIJb5cQdWjco0+Po+GIvDawvbDaTddQbqq07KSKsNLcEijsS+Ae18Jif2JhQ9QEUdBTVKifLFDg8k2/8qOALDOC1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6fc915a9-4415-3337-3b3d-cef0e9f735c1@suse.com>
Date: Mon, 30 Oct 2023 17:20:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH 02/22] x86/msr: implement MSR_SMI_COUNT for Dom0 on
 Intel
Content-Language: en-US
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <9d950b3c5502b5fb5fad62845b56b15d1bacc2d6.1698261255.git.edwin.torok@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9d950b3c5502b5fb5fad62845b56b15d1bacc2d6.1698261255.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c7264b-4412-4a8b-58fc-08dbd96432f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dY8f0IRp5XkTAVw51mOEVMgGw0KTfO2nIwCoXePM3cZ8FOhXw/T5pczeKgq96ylRYcN42x69aoRQligzARzt30WBrl625PSk8BPAqdi/y2k7s4aGNSC/hv1Yu2Pcp4M+1nyCgSCISzTAEoaNSicAWL/IoOXkgU+2dLIGpWx56wW1bHKV58zN0B0cGBxkk+U9s4+vBBDSXD1Mh6fn0XLubl9AAocAlpG2jeC93mcP2off6u97SyKFJB/qeJiuNcA5imrpKHueKNE2P1oLICjO98NSErKq3n2HIDvKgtmZwPfQcY85rDQLEmWt45CZGRmENL1kTsZYzb1OteWediqlpy1rcnZA+cAwa3HUzb0ptd3LrHfSAxd6V9kuaVtw5LAbaK4bojnENYxgoezsOn3v64vMPUtCWfTSmwPfa1BQzwE3iHE3pgVOm9lxZfpf7P6OU6Z/aU8Sl7bpBFzyua7QudXRuN1u/mSxVwZ9UJn4FLYLPiTeGycTxPxShUAY1YlhMitH5YSRDnxfratt0qKugh5dJIwSLqC4fZPpkndpby3Z10YleL5qXaUwkHIF5a0xQAZTFEBf0Hsk3sT28C06AJo4/+ct8dTnFtlNitsWGZ47DM59sN0wpqieXr6Ogal5P8GpVcwfWbX57eOtL8K+Lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(26005)(53546011)(2616005)(36756003)(38100700002)(6512007)(6506007)(66946007)(316002)(478600001)(86362001)(54906003)(6916009)(66476007)(31696002)(6486002)(83380400001)(66556008)(66574015)(31686004)(4326008)(41300700001)(8676002)(8936002)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTIrOXA4UkEzREpuK0VLQktXTGdHdk93UEw5YWVRMWlLVXFXS05tZDI2bFFD?=
 =?utf-8?B?K0R4dmVSbTZqZ3ZDYS9zVmFONWwvY2l0SlhQYkNOai9RQU52N2YrT1hzcXVm?=
 =?utf-8?B?S3piZFhPNnNSSFVuUnVRT0EyZTFTWFRmR2o4S25zTDBvNUZMQ2xQeXFuREdH?=
 =?utf-8?B?dGl1OE5EMGhLaS96Q3NZMjJwK213aTZtaVFzSC9wMWVEZWZrcTQ2MjJjZ3A5?=
 =?utf-8?B?R3V0Q1NOdW9EdDdweDBPZzFYSFViaUhNMzI5VWszVkx1ZU40VlQ5WFIwc3gy?=
 =?utf-8?B?NWVLV0NOdDBSMm82bWw1eWRETmpjSXNDYitUMlpxSnhQWFlYSFoxSVdtdXhj?=
 =?utf-8?B?SnNueHF1VVo3d2RHZ2tuTGZsTVplU3B5b3V1bTdzalhway9GUjV2Mlh5OGVw?=
 =?utf-8?B?Skh3QThzTmxJZi9KZXl1T2l2OGFKUG5xaElYUHVZcEY1Z3BMV0N2b0FIY0pu?=
 =?utf-8?B?UEl3YXZUSEpRMGVybVhsUjJ0dUtXU2FhbmlWb09lTTljK3EvU2ZuQm9uMC9a?=
 =?utf-8?B?a2hnUnNvVCtBQ1BjSE9WY1JBYTFENUlyeDdFMTJVR291T1JpT2dUamhuaTRh?=
 =?utf-8?B?UnprWUVDOE9weFY5dFRRNml5MnJWVVpwcGhxMXBwQjFFODNyWmFuWXEyYWFY?=
 =?utf-8?B?QzA4bzVDNGhCTnBFV3NvY3ByM2ptbHFWd1ZIcStNMmVMWnZCVXZObnBFMisr?=
 =?utf-8?B?bFp6QmZxS1liTVlabFNmeTRQM2ZhWEovLzA0c2pVblR3V1k1S1dUSkRWUUt5?=
 =?utf-8?B?UCsrZi9wVDkvOUJtQUs5UkRuRjZOTU9QcjVrMjVFL3FrQ2ZtYXdXZ2w1bHhj?=
 =?utf-8?B?aWhTYktNelFuOHV2bExvaSs3V1J6WHBhSGN5ZjlPc0s4QUlBaDNoOEZYb05Y?=
 =?utf-8?B?b094c3F0OXhlZFd5ZEZNc3drbThOekoxZi9GZjZZb3d6QXZkOFdiQXBRZWpv?=
 =?utf-8?B?NXZ6TGo1Sm5BVHFXTlUwdXNnUjgwdVhXd1dndW5zWUF2ZWZRU2dzcXRRdzRa?=
 =?utf-8?B?aXduQzNhdDU0RERoQjlTVUdQVFFlQU12a2JKSnFJWW4vM0ZOcytjRGdESHpS?=
 =?utf-8?B?a0pLVlpmMVdGcTI4dlY4ZWhhQUJFTVFTK1JvS2JaRVJUNDhYKzN4eTNzWkR3?=
 =?utf-8?B?M3BMbHRVNUZNN1QxSld0b2NwbTBXdzJ5bG4rb01jYlNWZVdtQXdYc2g3WGF0?=
 =?utf-8?B?VTNmSkJBUUYvOWRGYytXTXJDb3I3MWtzUkhuWVM3OHdnOWFaWitOK09PNkdu?=
 =?utf-8?B?VVE5Yk1wZVpHUzlYUzgxekxrTk4vVlZPZWdXTWdBRTc0LzZDRHhveFBIaWkz?=
 =?utf-8?B?R0IwQWZKQm5MbjROeWlzWVBVbXBOREZiVDVVWnRudzUwbTFHWXBZSDhKeVFv?=
 =?utf-8?B?ZjJ5OVc0WjFTRk5YRjVOUjFQbGtJU0c1SDRXcjZpNlhmODJLUnhZNzFPdXJQ?=
 =?utf-8?B?WTl6WWRpWWlZbXNKQTQyNjRsR3BGS3lyblBmTCt3Mm1lRFovL2drWlRTeEdQ?=
 =?utf-8?B?K3B2MkhkNG5DUzIxSVg0aU96OEE2OVM0M09qeE9aVit2aWZkUGs2TStPYVdE?=
 =?utf-8?B?SStLZ0pvVWYwcUJMRnA0R2VPUXRKMG5OZ3lQTEJPS3pCYXAzQXlDZHRRR3lh?=
 =?utf-8?B?M245TDIwaEwzNWtvTFF1OGR1cWM3ak1yenQxalJEVTlvZUticGRxYVNiSzlp?=
 =?utf-8?B?ZFdVVEsyYmpnN0RXeVBJeEFGU0NKM1BlQVF5ekNGWGNKV3JYRWtoWlpQd084?=
 =?utf-8?B?eTdSazNVeUJ1QmMvT1hXZHNtc2ZhWG5STHJSR24vWHVNZ05rOGE4SjRPMDdS?=
 =?utf-8?B?ckIvSUlWYmFSaXhZTDVrd0hhdlgxbTFvUXc1WTlZMnBmZVNKZXZyTjdUL1Vq?=
 =?utf-8?B?dHV5ZFlXcHRLSC93Y3ZzOU5hSU9CdzA3NTU1SFVpdGJoeTZjdUdBOUJ2eHln?=
 =?utf-8?B?OUFpVFR5Y0R4WElsaFpUNlpSRFN1TFlEL2lQVmZLeEZDUzFZMXZEYWtmMFFK?=
 =?utf-8?B?MFNKcnQyZG90RjgrR0ltSE9PaWppSlBOSWVkKzI5andDUjRiL1QyZXc2QXBV?=
 =?utf-8?B?d0pna1lXOUJ3ZU0zYzQ5WTZic0JsYXkvZERDWjFTSmRWb0NiRW9UZkI2NHps?=
 =?utf-8?Q?hXs2F3IOk4iKsK+fgwPp9s95j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c7264b-4412-4a8b-58fc-08dbd96432f5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 16:20:57.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wT5DT1bTwnYHJYyjgqyK+d2IpqPEq8Cs34FfyANxi/cHY8ufs1y8Yax9f343OcBDob7+ZiiZm5tcLofM62/cog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8409

On 25.10.2023 21:29, Edwin Török wrote:
> Dom0 should always be able to read this MSR: it is useful when
> investigating performance issues in production.

While I'm not outright opposed, I'm also not convinced. At the very least
...

> Although the count is Thread scoped, in practice all cores were observed
> to return the same count (perhaps due to implementation details of SMM),
> so do not require the cpu to be pinned in order to read it.

... this, even if matching your observations, is going to be properly
misleading in case counts end up diverging.

> This MSR exists on Intel since Nehalem.
> 
> Backport: 4.15+

If this was a backporting candidate, I think a Fixes: tag would need
to indicate what's being fixed here. Otherwise this is merely a new
feature.

> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -641,6 +641,9 @@
>  #define MSR_NHL_LBR_SELECT		0x000001c8
>  #define MSR_NHL_LASTBRANCH_TOS		0x000001c9
>  
> +/* Nehalem and newer other MSRs */
> +#define MSR_SMI_COUNT                       0x00000034

See my comment on the other patch regarding additions here.

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -139,6 +139,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>          *val = msrs->misc_features_enables.raw;
>          break;
>  
> +    case MSR_SMI_COUNT:
> +        if ( cp->x86_vendor != X86_VENDOR_INTEL )
> +            goto gp_fault;
> +        if ( is_hardware_domain(d) && !rdmsr_safe(msr, *val) )
> +            break;
> +        return X86EMUL_UNHANDLEABLE;

Why #GP for non-Intel but UNHANDLEABLE for DomU?

Jan

