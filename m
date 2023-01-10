Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9BE6645FE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 17:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474812.736182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHSC-0001nd-6B; Tue, 10 Jan 2023 16:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474812.736182; Tue, 10 Jan 2023 16:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHSC-0001km-2f; Tue, 10 Jan 2023 16:26:24 +0000
Received: by outflank-mailman (input) for mailman id 474812;
 Tue, 10 Jan 2023 16:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFHSA-0001Yc-Nd
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 16:26:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82f000bb-9103-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 17:26:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8369.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 16:26:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 16:26:17 +0000
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
X-Inumbo-ID: 82f000bb-9103-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qp603CpyuUIuk6v2fWazQ3C+jU5EgSaqMbi2t4EgzmCR5B3klYpcgH/aC6uu9wnbwJAgPzEbbRgVMaKgEdigbHDXxD3MnTVNrarwCp7Mqkct5VeApCIwhLTk/j5G/Gr/4cMVN/VelsoKlnWR9wWEq28p6h9QImKjre1vqBOT61Fik5tzWNjRGlLYxC+cgO2jcmdfFMBNFrZjkLQINrcrTZ7Gb0M1iZYtXXkpx8eemGc0pQnVcjw3vpFE5KkNGUc9rO6Fj3TSZ7eSvhvgXtjYzOI13GL8lcH3ATXW06uZhu0rfLu30P4lQxiJSPTo7kegnlENCqPTFkAkdZx24/lACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9J1WlR7LO6Tw6yrMCIzapZHEArRLyuLNDKQFmwiito=;
 b=hDIX5+MFN9P+odkOOG0m9I/7TmFlrbzFbkbp/DJW+Q/iC9lECbGf7AYeTl/ki4BR9RiDfCu7rgF1TEFF8TejN7VgTNGWoFsx/2cmy4hzr4F6CqLMHVkEHpeWrc1yyvQEccxIIEINmSilkXiI8Ll9HkRilN/LZXf3S1Ddt5OcPzPXqcWIFvHJBBFSW6ejgEGu5FCGJuSWcY2/vmvmxtYSjMegRdzbSRiTXZDAqiWabWjhNJVVJzzKy/tZGPzyfMB2R58jR+BfBeaVg/ABFXOY0FtDuvHD5P8evGRJUbgAubBlGE2i2RB3AVrzFLL92EVIi19ZU4mFCnJfHc9tu2wHBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9J1WlR7LO6Tw6yrMCIzapZHEArRLyuLNDKQFmwiito=;
 b=cKSti12YLkATAtUMByco8iWisRaAeYexBCdEDfO1ASI8IbvU4NMHV0xo1KkES4iPwuPt/7Nr7NRqP2wzhRHwU7n62essm2dfkeqUyZRxSzzbAt3aSYIjYOvdybBCQpSjg4Dbc2l+K4CJDmg6EdF2k0tzbSOnM5Mwuwy1L3yZE9cTFW3ZS8sCJZCltVLV76ECcjJBFMcnMjEt4rPXvDvOX/c/u+TIs0fQwJcuFqrYYTzHhDizFXALINpaJtjxT9LU7HmzdqDoJi2ww1RcBTPpvTvDkxUlh83uy7WaggpdCGfGpAoK9bn08xXqmHtihy+qdgrrDJ11/iA6hZlWlJOUbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <80b2ea4d-d52b-14c5-38ea-b8ab7e3a713c@suse.com>
Date: Tue, 10 Jan 2023 17:26:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] x86/vmx: Calculate model-specific LBRs once at start
 of day
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230109120828.344-1-andrew.cooper3@citrix.com>
 <20230109120828.344-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230109120828.344-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aee1e9c-b77c-4761-69ba-08daf327665f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qlKMGVvM7cQaofyTqfo3BMrO/4HeVhEdWOtik139efI/cv9d9dmITgYXHy2OHTCYxm/SycAMecGpThO1PsgCed1uU7y7P7KpUR6EYmVYsL98eoXNRPAFpGk90RfVUCBdDdqaPlEAUUDoPIE5MBu09A4jCW2VjLrOJjA0bHuTHVQXCTFTdm8sLP7BrIBTltoByUHKb/mTmlKPcNahh7WOs8sMxjtQHlnudL97gwNspNCrkCFmBZGFa8EFXvqzsiadG670gi8fOnbAGpoueMfLrGJWMR+2EH1nGSwH7dA3LeSxLEM/yNvVoz3NrgWKFbS3MxCBJt+xsSJO39MCISmh4XZ7VjLQOmJdBpcekcUVrtZn4XgeXb7H6628t19ltL79jicv/GD3ag3OUkX8nVvgjQoUbqg+9jWdV2pNmShRYjDPdT8cvfptT9s0rDi/KTm2lH8huGr2YHl4e0fnDYZiN/i5vLRrUlq7cv5O07HY5VIr1w8eu1Gne2Pcii0YH/7Am4xj4+TOwd1DLuK+YE6PsqjQmWG3SX7zluIb5+aLjM1Nv4Ea9BIhATMbJqyqbuo3RiX/qvDKSw/XVobYq6BMvjyjIhMTXQeKt6AYcna4bmIbp/WGL1RqV9nPWGIZef0dr2OJS96DBb7/OgBH+rOo6LYCSenQ3Gfo9Yd4XWS6TQpUC0v/CS7J9Th6HW7BVYjiZmNCZjelKivZA4kD+4YnwefgQCsHjB1sAc4FS9xw/C4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199015)(66946007)(31686004)(41300700001)(2906002)(8936002)(36756003)(5660300002)(8676002)(6916009)(66476007)(66556008)(6512007)(316002)(54906003)(478600001)(6486002)(53546011)(6506007)(186003)(4326008)(26005)(2616005)(31696002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akxRajBoWHRCNktuMk1NSWdsbktTM1RtUmpMLytrSG1yNWp3N2JVVHZKK3Iv?=
 =?utf-8?B?dHUvNW9qNEdieUx4T3RIN0kxMjZwOWpyaEdVVm5HNFdJRlVYUXkrL0xMaTQ5?=
 =?utf-8?B?WTNhdHNuMDBQUEo2TG1zanBzZWpQbDdQeXM2ZVlGMC9NVjY5cndqTXBXdlNG?=
 =?utf-8?B?WVVuQkZPeHlKNVk2RTFTMUNsSHJLNjBUV1g4YnYvZjFicHRnSktQcHhtSUNO?=
 =?utf-8?B?cmpJYnNXeVd1dzFwQjA2Tm9zU3JOeG5FZzVzWVcxTjVGNS90OHhVcjBxOGgy?=
 =?utf-8?B?cnprTGJSRGlKUFIyaXJocXlXQ1U4VWZocktjY2k4dnVRYmlpYXVyb3dHUmFy?=
 =?utf-8?B?MDFTN0grZklkTDFsbjZvYWlBNiswaEU1VmpQdk9uaHFUVDRMb1FNT2M1ZmFC?=
 =?utf-8?B?UitSRFNuL3FJY2lEbXAzQmVZRmFGKzBtZitYQXI0emZTU0M2YmV2ZlZPelBl?=
 =?utf-8?B?UDlrQ2dUVFFPTGszMGxCSDRUQ21xaHcxcWlKcEoraWg3dzU1cms0Y0FHdXlw?=
 =?utf-8?B?aElTN0s2dnNuOVBjOHpXRzFpN0NTRVNCbC9tbklONXUzUjBwMDM3MFdLOG1O?=
 =?utf-8?B?NDRZRy82bEorWUZpeFhWWndaYjVXS1I0amI3VzBPblZ4UUNLMUl0cXdMVER1?=
 =?utf-8?B?dVdXL0tzMWFxSWJKazlQbEd1UWRQVTZKVmExV2xmZGs1Z3hDY202TkxIdSta?=
 =?utf-8?B?MFpjWWVFTFlFK2RoSFFZLzJOTkdlSEVxYysxV1JsQVBoQ3hacklEQWNHR1Ft?=
 =?utf-8?B?Y3VOQzkyYXVtTWxIWUtuQVhIbDZuZ0lPMWFpSnhYaUFaR1RjM2ZicVo4VVIx?=
 =?utf-8?B?cW1XczhPWG1NblVXckhCMlRQZGg5L0NqQzBESS9jZjAvRHZvUG9QUkFGSVVu?=
 =?utf-8?B?N2NmMXNwK1p2VTVva3NxV3JtVkhEUFdtNG1DbXdqQW5MUGJqTU05R1FONmhE?=
 =?utf-8?B?Q1FEMzJ0Smw2akIvVXY4UzFxNGtONmp5NXFsVisxRWo3ZHhkdGROcTYraFYv?=
 =?utf-8?B?MHVXYklad2NOSzdoM2tQTkZZblpJRlVIOUorTnBpNnR1L3R5V3hlTER3azJs?=
 =?utf-8?B?TGx2ZDFYdnQ0UGpxMnVkRmFEWmVjV1VtU3hVM3dkRTM5SWJHS1VRZWo5QTBl?=
 =?utf-8?B?OGlwREhDbU5veVNRY3JUZWNwRDFHbmtJZDVuYVBSK1l1aWZIZlhIWWV3cGZP?=
 =?utf-8?B?SWY0dWZkcTdoZVR1TTRCMzdxbnEwclVBaHN3aG5Ob25wNkdBZ3oyZFNqc0lG?=
 =?utf-8?B?Y1dUL1RRUStaRWpXc3JlRkpEbEU0dVhFdS91YlFRdU4yekhtRG9KRDhJU0E0?=
 =?utf-8?B?ZS9DR005T1lYdk1USFR4a0YwUVBuQzJBVzhraVZtaXk0ZVU4TFV2VkFsMHU3?=
 =?utf-8?B?bEdWdjBzb3NxSEFtOWp5NUwvN1hRcnZkSlJqMFdLaVVwb2licEFOb0RER1lU?=
 =?utf-8?B?QjZLV2lDbFh0SUh5ajJmaW1MM2pEb20yZHlGZ3krUy9lZllrRlVTZERCKzdo?=
 =?utf-8?B?Sk9aOVRFZnhHZy9LNFNRLzFpYm11T1hBYzRnU3ZzeUtTRC9tbWIzaVZJakE1?=
 =?utf-8?B?UVUwek9mUSsxOVZwWTBMTlluQWJ6SmpVSUxxNnZLa2Nzc2FranFGZ2N1ajBt?=
 =?utf-8?B?MXpnSjNZRjFaQW1DS1pzdEZBVFcvVUE0bHgvQnNZYzEyTmVoNzNuYTFteDk1?=
 =?utf-8?B?WEJRM1lORzlWNDZGbWxZRkxqVGJ1THRzNDRFS295M2xMQWNRZlBWMmpFU2Jl?=
 =?utf-8?B?TzNoUkR3QjFzdkJ1aFFEU1J4MXRkeWpZYUU2NnZCYWszUEVMQVlBUUtJbWRB?=
 =?utf-8?B?UjlQSjhBaGY0OEwzb2NzY0I5S1VZemlmUXFnYTRNME9aMW1HMWFncUVyLy94?=
 =?utf-8?B?TDA0bXFoV3A0czdidHhqaExXUWNLWFJiOUxVVFVWeFJoUVpESUJ6c0JZQXY3?=
 =?utf-8?B?YmRsazdva1pCaUQzWDNTWStPUkxwYlpza3JxK3NRNlZZMGFWanF4NnQ2WDRH?=
 =?utf-8?B?dVpyQkZwUTJwSWt1RnB3bzdsdFo1aWp1VWNFbWVjb1F2K2NIUjhTYmNZcWNm?=
 =?utf-8?B?Wm9jYlBCZlJLUnF5V1g5MHdjWU1kb3VrRVBzbDkyQys3NW5qaUVUdGJNeWNJ?=
 =?utf-8?Q?GDqhqQ2LbIn2hHnS9G6pK/Uk5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aee1e9c-b77c-4761-69ba-08daf327665f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 16:26:17.5024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpreWjj9xJCQKH71Kl+xskiY9jyqsb42J70dZ7EcOWW6q7ZhyVxVbhpD9Jj61dJeysERbtwRc6oguKcYqC6tgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8369

On 09.01.2023 13:08, Andrew Cooper wrote:
> There is no point repeating this calculation at runtime, especially as it is
> in the fallback path of the WRSMR/RDMSR handlers.
> 
> Move the infrastructure higher in vmx.c to avoid forward declarations,
> renaming last_branch_msr_get() to get_model_specific_lbr() to highlight that
> these are model-specific only.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit:

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -396,6 +396,142 @@ void vmx_pi_hooks_deassign(struct domain *d)
>      domain_unpause(d);
>  }
>  
> +static const struct lbr_info {
> +    u32 base, count;
> +} p4_lbr[] = {
> +    { MSR_P4_LER_FROM_LIP,          1 },
> +    { MSR_P4_LER_TO_LIP,            1 },
> +    { MSR_P4_LASTBRANCH_TOS,        1 },
> +    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
> +    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
> +    { 0, 0 }
> +}, c2_lbr[] = {
> +    { MSR_IA32_LASTINTFROMIP,       1 },
> +    { MSR_IA32_LASTINTTOIP,         1 },
> +    { MSR_C2_LASTBRANCH_TOS,        1 },
> +    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_C2_LASTBRANCH_FROM_TO },
> +    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_C2_LASTBRANCH_FROM_TO },
> +    { 0, 0 }
> +}, nh_lbr[] = {
> +    { MSR_IA32_LASTINTFROMIP,       1 },
> +    { MSR_IA32_LASTINTTOIP,         1 },
> +    { MSR_NHL_LBR_SELECT,           1 },
> +    { MSR_NHL_LASTBRANCH_TOS,       1 },
> +    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
> +    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
> +    { 0, 0 }
> +}, sk_lbr[] = {
> +    { MSR_IA32_LASTINTFROMIP,       1 },
> +    { MSR_IA32_LASTINTTOIP,         1 },
> +    { MSR_NHL_LBR_SELECT,           1 },
> +    { MSR_NHL_LASTBRANCH_TOS,       1 },
> +    { MSR_SKL_LASTBRANCH_0_FROM_IP, NUM_MSR_SKL_LASTBRANCH },
> +    { MSR_SKL_LASTBRANCH_0_TO_IP,   NUM_MSR_SKL_LASTBRANCH },
> +    { MSR_SKL_LASTBRANCH_0_INFO,    NUM_MSR_SKL_LASTBRANCH },
> +    { 0, 0 }
> +}, at_lbr[] = {
> +    { MSR_IA32_LASTINTFROMIP,       1 },
> +    { MSR_IA32_LASTINTTOIP,         1 },
> +    { MSR_C2_LASTBRANCH_TOS,        1 },
> +    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
> +    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
> +    { 0, 0 }
> +}, sm_lbr[] = {
> +    { MSR_IA32_LASTINTFROMIP,       1 },
> +    { MSR_IA32_LASTINTTOIP,         1 },
> +    { MSR_SM_LBR_SELECT,            1 },
> +    { MSR_SM_LASTBRANCH_TOS,        1 },
> +    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
> +    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
> +    { 0, 0 }
> +}, gm_lbr[] = {
> +    { MSR_IA32_LASTINTFROMIP,       1 },
> +    { MSR_IA32_LASTINTTOIP,         1 },
> +    { MSR_SM_LBR_SELECT,            1 },
> +    { MSR_SM_LASTBRANCH_TOS,        1 },
> +    { MSR_GM_LASTBRANCH_0_FROM_IP,  NUM_MSR_GM_LASTBRANCH_FROM_TO },
> +    { MSR_GM_LASTBRANCH_0_TO_IP,    NUM_MSR_GM_LASTBRANCH_FROM_TO },
> +    { 0, 0 }
> +};
> +static const struct lbr_info * __ro_after_init model_specific_lbr;
> +
> +static const struct __init lbr_info *get_model_specific_lbr(void)

Please move __init:

static const struct lbr_info *__init get_model_specific_lbr(void)

Jan

