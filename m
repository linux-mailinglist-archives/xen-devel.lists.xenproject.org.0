Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024725EAB0A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 17:29:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411962.655109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocq39-0003qn-Cy; Mon, 26 Sep 2022 15:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411962.655109; Mon, 26 Sep 2022 15:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocq39-0003oo-A2; Mon, 26 Sep 2022 15:29:39 +0000
Received: by outflank-mailman (input) for mailman id 411962;
 Mon, 26 Sep 2022 15:29:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocq37-0003oi-VY
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 15:29:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 073445ab-3db0-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 17:29:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8743.eurprd04.prod.outlook.com (2603:10a6:10:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 15:29:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 15:29:34 +0000
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
X-Inumbo-ID: 073445ab-3db0-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jx40fp2TjTvmwnsQfkkBSJnHWYCX2fA/LVM2UvbKY+HNwbuMF3zQTv5bjpo0iSO0rUJcdce5Okw6CsDwCWAERPcGqk1ZB2M/NeLyTnc8Y/C1fKN4m9F7a1WUQHhHuuVw3oa/6a/3Yjc9/6JDn7uAM7jjbXHubP9UcbTj8Tjs4kBhjeayOqB2U2FcPKYlWKlG8dUYGWT7LtghLRg6GsUMkz2ELHFeEs7JiFyr2mSbN9J561yBol0qXRM910e5QXK2Kh3tFw2fv0b9j49afMK/DMf1xBRAOaL0dh1RCqEovU1d+8teJUuk8LgybuO5zT3AErFfQKiXtSIMqANZgrhJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HY0O8rOWHJgE2ypf8yinz4Uk0wsWLwEPUUlPrIlZH4=;
 b=COUzUNS4rLD1+8MSy5iC3R7tSAR2VDbrAWJWEHlVxM60uHyz7gR7IFXRLhilphVIlpvb2xl7SgFWoZuyVbJa2pEEiTT129xp54jy+7H4xYkxyNt0UR6GufFfgy8HFrE9/6IRAPGehIl7AZmibKlkK2W/wR9+foRVREXUXGcn/DvowT+2EXm/iarxubGB/ebW7QOLVbGdTcpquXtBsgTBLfzBb/1V2rlhCRjjk4wIHCWoNBSVDIammcveSG+ValpGCyKOmUbCMynyQ7YRiCx5FWlDwbhE5Ulj5xDa1MO4crog8jyJ56kPCxAqbowEweoCHcyyeKJnsZpZzNvHr+RZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HY0O8rOWHJgE2ypf8yinz4Uk0wsWLwEPUUlPrIlZH4=;
 b=PSEwpFpQqRboTWF0Ecyb46HJjW8eFdK8fIJnKn7ZzbZOcSARHIKSctu2ezQypMGJkgKlunFmg1AG6iGEQoWkxZ5AubymfZqOoINu/jXb9CvqBlIA9CuS1gyu1SvqnjlEK6aMGHqYnN8rDtP83jRiY6865RaqMrqj+Nn6L5iNXLX4WwXIqrq0Y28F5wbyyT/zd08yJa8GvsRNvUPe8LFym/MF4cQx5x6Xji4U1JkeiIHRNVXAZ0tduxvoXmAs+zfa7x9c/tcNKV7uRxg7dlvYjQ0oBoSmuE7VyfMMOw2mn+6UoetuIEqPyLtKzCg6d3ZdAwGNpQjEu/VibJG/N+WCJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3e43a0a-35cd-e695-0291-5d28616cc818@suse.com>
Date: Mon, 26 Sep 2022 17:29:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/3] xen/pv: allow pmu msr accesses to cause GP
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
References: <20220926141849.21805-1-jgross@suse.com>
 <20220926141849.21805-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220926141849.21805-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 24786e85-a242-426a-b506-08da9fd3e9f2
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wlLCAs5VVeYDuqeFud2ptCIAlpaZ4gFPwqtDZgXW9WP4VmnXsXUmkfDNChmh30/D94I82jjnxAQIG+wU4hRRHuqWRqPliMh4a+kTy8RkAh81sS7WAy0j7lOfQtqzksYDrylSHN/5cJYAcPHxIj6X7b3GeCChtkwn5sGcAS3p8/Zg3PnMyKYisO3H2msy+CupuWHWE64ZIf08G1DWdh+clvgKKaUbYg80iXg/+wNSALMzfPY6tX5w5TI73IWIo5FxzP6tchhSxZ70pSPeE1ztyi9ATLnFi4Mlfrn3MxzmQwVMHrM8wbu8u3fXXXOjrDT2bMcbfGO9zbbvSO3USFcM1xG6gnv4ZPtojCAEzBJZGLtEV65xwwDLQke4SqQxwpwuwLx1tpIPtLqhnw0Eqew60apEK3R/5g6ADVLKDsm6CqipeVOE5bOObnCpiqPXZZYXRCELxVEorkxgf0aZB+qNsN1oQUdRHXtnNz4R6f72xmOIEAaBZB0IjHg8m1tOKw4Jdw7ZYqtLlLXVA0yx7FeT/5oMV4NFEobDxFE4VoCyImTfYILybyQxW+FPc4lwz/iwshge/jsiSUrcsCq45B/wR7vSICbt3B3lEsEPCMNkN8/l3SBNL+c7aHDAyRSstMBSyrKgTBUv8gIvsIkMjTcssZL+ho/mKYZMNTTOe0Kb+lb+w0p5o82ZscCikjOsgc3U0d2/oL7nBityfkBHOEpVNj1wko7RAf8wImFitc1WksbTE31UtOBdKerzNxhQZj13Hq1mWI5jBokIN0rjjvJnNzN8DEu0GqFaYgyzhOrcpRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(6636002)(37006003)(54906003)(4326008)(6486002)(66946007)(66476007)(66556008)(478600001)(8676002)(316002)(5660300002)(31686004)(41300700001)(8936002)(6862004)(53546011)(6512007)(26005)(6506007)(2616005)(83380400001)(38100700002)(2906002)(186003)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RStFcGJFaHNrbUNOSEJteklEMGZoVkkvY3BiaVlxdnY5eDBFdmhZd0ppU2Rr?=
 =?utf-8?B?a3RsZkt6OGUxMTBIMitqNG8xTWJDU1BJdzZNVnVHbFFsUVlHNTYvcEJpWEZi?=
 =?utf-8?B?YkUwMFRBQlFPdVdYdDFkK2JCTnFxdjVjZVA5aEZENmowWUZDUklZRDIybGNw?=
 =?utf-8?B?eitSRHYwUzJaZUhGVDFLK3hNZldRbVVPMmo0NmJ1ZXg4ZnhHdmdpVzhpb0E4?=
 =?utf-8?B?VGhucC9aYzlNNHZiYXZ1bzgxZUM2SzlKVis1WXVJaklZOW9lU010ZVFESVRo?=
 =?utf-8?B?bjNvWExod3JpUExGWm5zNTBxQVNySFVNS2NSUWIrY0VlR3NZWHVaV2dqVGsx?=
 =?utf-8?B?K1VDQlZyKzZ6WHBiNDlYT2Q5RDRKU1FBY1QzZCtYeDhpYitTN1VDMlhweHJK?=
 =?utf-8?B?Uk4rS2d0eldLeXh3c3Y5alVoRm9aSDRMSjBxQWRKNHJvSXhUVWZSbUowdm9R?=
 =?utf-8?B?dEFiTy8xVU5kNk5xb3BNZ2dQUlRpa1JqMmlIaUxBMTAyZ2V1MTY3dzhWNzdJ?=
 =?utf-8?B?WkZXeGl3V3RxYlNFZEQ1WEE0cUJ6SWQ3Um96RWI1STl1Vjd2NWxZNWtkbFF3?=
 =?utf-8?B?dnQrNWJ2bFB3ejVhOEwvcUVnL2lQVGxMcUh1NGloZzhzblRtQmYwU2NiMTNq?=
 =?utf-8?B?aHh4WnVHc2grNWtGZElZcDVaWmxtdVc4OWVPNktISWVEU0thTlErNktvRFQw?=
 =?utf-8?B?SHpwNy84ZmZldTY0WWc1bnl6Tzc4d2pLV0FtcG1YRVExb0hXUXNwc1RiSWFk?=
 =?utf-8?B?dHcwYm5OVklDZ2F1TmVvdk5tL0dUZFJUZTZYNm8wQk4vcEtuck9ZUnBwektz?=
 =?utf-8?B?eDI4eHMyUFB0bWpXWEhBa2d3bkZnSjJvR081bUkrdU1tekNHZ1pNTENZdG9z?=
 =?utf-8?B?eFR1ZE8vU25qZ0JsTGsvREtYMmcxaFA3QzRvaFhRdUdhdEc5eFN5Nm5nWGZa?=
 =?utf-8?B?RUUrUHRoWThnTktOVzhnMVpXejNnN0p0cFNaWnRmL3R0cVh3ZWZ2RHBRMmRT?=
 =?utf-8?B?QUdPN0ZQR240dFRhNldscUNGejhNYy9qSjhDd1EyWnJEbkRiK2t5M1N2eXRC?=
 =?utf-8?B?dFg0Mm1DNXQyUlV6TFQ1eUVWa1g2WExESml2c2NCYUhtblJTSEwrdUU3OGN6?=
 =?utf-8?B?VGRJQVZ2Ym94S1pFYVdFczR2c29nZkpWcm1hd2hzM2NLeGNBdGJ5WUl5djIx?=
 =?utf-8?B?cENqZnhYRHNCNEo1VkJoZFg4NXhqcXA2Qi9ydEN4RjhES3RnR2ZsVWsyQ2tr?=
 =?utf-8?B?Nm42L21xSXNVa2RCZ0xhSUN0WHNZWEVReHVHOFB3SmNwanMyMFMzQ3FNcGRl?=
 =?utf-8?B?QkpITUJtdEhSblBGY05EWkxqSXJGMjdSQ1hOeCthM2lJU2d2QUNFUHNiQm9z?=
 =?utf-8?B?dW45ZGdIY3FNZzh6RTNTQmVIMytkVVhMNVhGL2c4QlIrM2lEbGw2bTNWQ1Vu?=
 =?utf-8?B?RFFNTW9nQ3BsZGp3d2tNNXRoaDFhSDNWRDBLU1RnZnRsWG9jdERVcGU4Z2dG?=
 =?utf-8?B?dkYycGVjbS9xQXFheHZkNHpDMC95OWtzSjRrSzRRRHRHU0xiU0tydGJrYk1R?=
 =?utf-8?B?ZjB3em52dFdTZmpiU0tQUGg1MDdmWi9WTHR0VDFyWEZEQ1hwdkh6OGtuZ0ti?=
 =?utf-8?B?K1JNaWcvbVl2cFVQMncrcGUvVkxlc0JPQk9LSmRvQW0ycG5VV2J1MGwrbm1V?=
 =?utf-8?B?VitjQXBscmZWNE96QkFKYnJnbmh4aUE0cVd4VHdwd3lXckphaHZ5cHZqcDNK?=
 =?utf-8?B?MXRXWEI0OHJ0cmtUeEtzUFk4VENSYkNmNDJrYTluRlQ0ODFoVWt6WjJyVzZl?=
 =?utf-8?B?WTRPK3FuYVpBOHdJSW5uR2FFaFNmaTlJMCtRNW1zeGxXQkRPbGVTUElpaXlo?=
 =?utf-8?B?WjFLNkxOVFo3azEyb1FSUmhlQnZPQm1SS1VWU1hMZWNEZVZUb0U3ZFd1Q1Js?=
 =?utf-8?B?TGpZNmcrMk5rcHhpYlVQLzZyVFJGR29Qa2g2K2NzQ0JyK1J2WEVEV0pNVy9W?=
 =?utf-8?B?VlZ1ZUFMMjdqdkQ5eFVyeDNzRVlMbE9RdjdYUndnUm0xMm04bGM5aTFoSmYy?=
 =?utf-8?B?L0xoYUpYS3FlYTZsZER0ZTU1TmNnNHZWZnBBUzI5ZTBjcWlITmJ6dlF3WElt?=
 =?utf-8?Q?rHoHkPQEhdXF+XS5gNnrCBBYV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24786e85-a242-426a-b506-08da9fd3e9f2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 15:29:33.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HW/+la+40AhrjEQnNfIrNfZGQDx8hVu9xqt4l7TWgaNvKeBoaLVbLjbtkwHjgZ7szNmG3b1kQAH7zFLaGyaQtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8743

On 26.09.2022 16:18, Juergen Gross wrote:
> Today pmu_msr_read() and pmu_msr_write() fall back to the safe variants
> of read/write MSR in case the MSR access isn't emulated via Xen. Allow
> the caller to select the potentially faulting variant by passing NULL
> for the error pointer.

Maybe make this "the sole caller" or some such? Because if there were
multiple, they might easily disagree on what the best meaning of passing
NULL is.

> --- a/arch/x86/xen/pmu.c
> +++ b/arch/x86/xen/pmu.c
> @@ -293,22 +293,24 @@ static bool xen_amd_pmu_emulate(unsigned int msr, u64 *val, bool is_read)
>  bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err)
>  {
>  	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL) {
> -		if (is_amd_pmu_msr(msr)) {
> -			if (!xen_amd_pmu_emulate(msr, val, 1))
> -				*val = native_read_msr_safe(msr, err);
> -			return true;
> +		if (!is_amd_pmu_msr(msr))
> +			return false;
> +		if (!xen_amd_pmu_emulate(msr, val, 1)) {
> +			*val = err ? native_read_msr_safe(msr, err)
> +				   : native_read_msr(msr);
>  		}
> +		return true;

Minor remark: Fold this and ...

>  	} else {
>  		int type, index;
>  
> -		if (is_intel_pmu_msr(msr, &type, &index)) {
> -			if (!xen_intel_pmu_emulate(msr, val, type, index, 1))
> -				*val = native_read_msr_safe(msr, err);
> -			return true;
> +		if (!is_intel_pmu_msr(msr, &type, &index))
> +			return false;
> +		if (!xen_intel_pmu_emulate(msr, val, type, index, 1)) {
> +			*val = err ? native_read_msr_safe(msr, err)
> +				   : native_read_msr(msr);
>  		}
> +		return true;

... this by moving them ...

>  	}
> -
> -	return false;
>  }

... above here? You might even de-duplicate the native_read_msr{,_safe}()
invocations by moving them out of the if/else ...

Jan

