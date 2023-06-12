Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E9672CA93
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 17:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547344.854678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jkF-0005vZ-AO; Mon, 12 Jun 2023 15:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547344.854678; Mon, 12 Jun 2023 15:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jkF-0005sj-78; Mon, 12 Jun 2023 15:46:15 +0000
Received: by outflank-mailman (input) for mailman id 547344;
 Mon, 12 Jun 2023 15:46:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8jkE-0005sd-7h
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 15:46:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41036c24-0938-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 17:46:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8875.eurprd04.prod.outlook.com (2603:10a6:20b:40a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 15:46:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 15:46:08 +0000
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
X-Inumbo-ID: 41036c24-0938-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fe5X7uONqIOMC/Yu9080WjRN48SrshBJLa+7Pc3gq+8jXVn7+V6HM3fUp7eKVN/wpLafEfypO/SBPrk0YcjwL9O9Ev00lIf0cFs+gH7sNB9Gx7AL832jSDgYsGjeGZvv8IRA1Pqb6WFKplgiyJ+lt+l/nFfTLGm0/Y2bgVK/Pq83sBrmlvlwnyLAny4pCtyLK48NLA1KRkJXrhRpeBoiNBvg7OMGMesdKcjbDlhgnncE0Mcc+clYfDxLjUJx+vKkNGaV+HuYSP2RUxY/Xl8yM9Y08PIvrFE1CqqEfnRyXT2e/hBdsFptVufGCp0FFWZzh6TTvjA39K49l8jWX3U16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opIJUjeOOdIvt6uK4bx8GnlcFwhSXQZCFymCmhtb3Tw=;
 b=n1Em4ltnrtyu7eYfEcxzJSQTrP/+46Ibl9PQn5AMnpmckc41w6witpHCEvHaNt1/bDC+5M8nRaUfPAwT3JjVGOkPAN3YKcIYzYrjQRjLeToGBwKJ8t1mBhJa+HRcHFbbKTEvPyEW15a1u4cYF8YFuKW1helmlHbnUlF8rs7hPq3BTaCYG2Qj8gV5zxrvJj9EgDLqxUFwXve8YgQ6eS5pBhaG3XsGy478lb37ZNvdwpiFuIBeh35kSfhBClbSl+cdTNKb01pTl4s3vNCuHh/E3Tu7w0E/dhN9sdk0dSxGf7t1aC7ClAYqBLyjg27u7jewozmFBahJ5QZk7QO/5OKSsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opIJUjeOOdIvt6uK4bx8GnlcFwhSXQZCFymCmhtb3Tw=;
 b=LUJBvYz+/KWMJG8j3tEfBXdgsBLyEetZ3lbaL0bgKAeE9Q7fApFlyx3Y3Tdj+T5JRx+m9SjY+uxFnW934XsQWksjrKMS1KmeBGKseUBb9ahut4u45NeL4MwrfQ78t49OlNvE15Yg8yOKxYdY6oSJFrpil9AepjIhF/Rqlo/chL6BH5OaSnzIAHcdbGwoqodQApDbv3SSfCMrj7FLrlnxzq0YcvD0G4rH9sJj5M+pHO7AO8EpbD/ZmRvw0ksgs2AJ0Nf5FCRIMp69KqN1zUr1oLvSR6TGLVEQ0nMs3CjVWnT839thG0rEZ8wOMfzCdps4Pe89bygbQexi0Vb/35pV7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ee9e687-b8ac-adfb-552e-522a21e128de@suse.com>
Date: Mon, 12 Jun 2023 17:46:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/4] x86: Read MSR_ARCH_CAPS after
 early_microcode_init()
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-3-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230605170817.9913-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: f6047e2f-d77f-4fc8-839f-08db6b5c23f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9RIjN4S5niUwur/Z8hB1Z46UnC2Q6rnS5LsqPZ2nUGHVtv0cOPFJUg7m26itatXwVY0qE2YAMNue23zF5OmyhzWPCfbmCKE7xbTk/HdpR9rreDzG4N8O0GlhnryFZWz8gd0SLL3IYpBxzzP/JcgV2+JKgNYTxi8daAD7z6MGWDH8HWb+31vTjKjJc+is4Q2y/dAa7S1ROBlAbKX2GrE+eODv3X8LK9th/4gOQsNf1U848iIoCsJfiqzXkv9Q4tqAD4dybeEtRHOLmrwZKsVV2hOesfaOfeQvqXeihQuWZ1gnVz02AQjvzouYsTxLkhWhRLnpUc1YNXJswiKJG0wCZcr8CMQw6OedIQrEuJEh1ofnK0Mzmzju5tvuaOfz84/JJYTcRLIYvLQUN6fqR83DWM9eoOVGgTUvZOCxqhWhAmp9KlsC7iO5cMCcQ7t77u6hGXA1XBn0yDfO4bwRN1ohxOPk7EiYwEj8fajuYeUy4tceIJroo0SbHeUIhiNX6wroxODgG9ehjypGFPIdaUMwu/Fzb7q0gnc7L9B0TYcwnfUiNuIF8ImaHwBjFNNuBdVv14SxgUEbOPAqot2hIsLAsMe++FiL/t62dzwPbtyHhiZ6RmIEOoXiBBmYGcRZIH+iIvT2MjhTWlcrZ0DbEiAEkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199021)(4326008)(66556008)(316002)(6916009)(66476007)(31686004)(41300700001)(186003)(2906002)(54906003)(478600001)(66946007)(8676002)(8936002)(5660300002)(6486002)(53546011)(6506007)(6512007)(26005)(83380400001)(36756003)(86362001)(2616005)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTFIbHd0bmtIOXlYeXlucXM1NjRHMjJwczR1S3NJWVN6QjdqSjBXYzFkNXpr?=
 =?utf-8?B?bWd6Nld0c0lCWGN4c1RBaW51dlVxdVRvQll3RG9LN2UzYXBZb1I0SCtNTGRX?=
 =?utf-8?B?L2N1cStZckRoWFAydGRvcjEyTExoc2hTWWkrU0VERDFPOTg1d2U2K0ZQb29T?=
 =?utf-8?B?MGZpUi9aSzh5LzQxT0pYdHEvaXZVa1pEMUwrZkh5QUpSbzZpL0d5NkRrM0tZ?=
 =?utf-8?B?aUQ3TGdnZnprK2V1ZVlVK0ZsRjVoNEFrbTFZeVphSzFYL21Tc3Znc256Sjhs?=
 =?utf-8?B?TXptbDdEUWJDdkRkQS9kRVY5UUZFc2hvVkZJOGhNRkwrT1Yyelc1UVlEbDdI?=
 =?utf-8?B?UFdMV3BIWTZ3dUhvR0hhYXZCemRUcWZIYmhUQ1ptOUxMOTNrTVZSenF3S2R2?=
 =?utf-8?B?N1FhNERTOFB6dzM2ZU03bXhKcVhBOUxnZ1NoQ2sydklyYXNnK0hoYWIvMUM1?=
 =?utf-8?B?cVg4WjY0NDQxUDNHT0VUNmVNTmZ3QmVqRzhFOCtYNTFGNG93OW8zd3pSaFpU?=
 =?utf-8?B?UU5BQWJJTzI1WjhKT1dpbkIxQ1QxclJKTmQ5eURhdzdnM1NUbWRwdWV5TjdK?=
 =?utf-8?B?Tm5mUE00eExEeDkyWjE2MHNWSjNvRi9oVHdONkVjNkcvdVBEOC9IQ0xXUlg2?=
 =?utf-8?B?YW1ZZkF2eW9Kak1QeUI3QmJwWnRpOG9CdzVyMGdBRXg2c01IMDQ4YURsR3Vn?=
 =?utf-8?B?VmJhRG9EUmljRTY1RURPSU1IOUhtaDVlblVVQ0dMMUc0Nnd4bGNZcUpGTlk5?=
 =?utf-8?B?N2phYzYxQlYxVWFXMUFsY2F4UGF1aHVmdXJMUkVld2FGdzMydlRTMzFYNndQ?=
 =?utf-8?B?ZnBoL2RHVU9aUk9OSmdic0VSa1dZVk5BcysxSWx3YXpleDNJVlRVSnVvekls?=
 =?utf-8?B?a0xJRW1ZbU9aK0lPYWl5OUs0TTE4U0sydHN6RXRrVmN1dklGcDg3QlJvcDJC?=
 =?utf-8?B?c0VORUtxM3F0SHdDNHBrTThScmtqUithanJqMVdhSEc5eUowbnp1dEhQdGY2?=
 =?utf-8?B?RFQ1SlhWalk5TVk5UUVLbERId0pYbXNDYmdKL1BIbllqUzRUQkZUeGtpbGFV?=
 =?utf-8?B?OEZwUTg0SkNERTZHMStmRG4wNSs2d0F0anNYM2RGb0crZ0Vtb01OZGx2THFD?=
 =?utf-8?B?MGtjMVlkV2ZobExvSHdtTXBTZTlvZE1OUnZjSkdwdE1oMG0wZ01jUjZFWlRo?=
 =?utf-8?B?d0NubkVOTDFvY1BVelBwenFMcXZYMUpDeXFIcmlYMmc1ZWF1aVZOZHVqaWlv?=
 =?utf-8?B?YWdkU0lxU2Z2QVpKdmF2MHI4YW0zeU1UYjVSbk9WellPRllaNk5oU0c3cWpK?=
 =?utf-8?B?ckRRdG96MG51bzlzMG9YZG1xc2lSejlRLzFqU3k1SFM0N2JPZDMzZy9VTzl3?=
 =?utf-8?B?NDBEbTNKWmp3SkNzWGhJakMrUDdhYXRsZ1RuSTIxRVpOazZla2dTK0d2alZ4?=
 =?utf-8?B?c0pOdkd4RmdYRThkWllBanpLd2dLMnF2S0EvT29KeDNxMEEzZWk1dWtUakxo?=
 =?utf-8?B?NVdsVDBZcWs4WHRLaWJteHhvK01PdnVwTENoKzZXMjBrZm4xSHRldjJmTFht?=
 =?utf-8?B?MUFaYVFFMmJkeGhjR2RRRFVQV0o3WFBrZUd6MktDN2ExZ244V3lweHpYUSt5?=
 =?utf-8?B?YnJKcGlxNm56VEp2bUw4WHg2YjYrRFhaSVVXSmFhampsbFdLbzMwdHhjeUJk?=
 =?utf-8?B?LzZsVnUvU2IyMjBaNVM3dkk2UDR5WnRjRHpCbWlCZmE4UE9xcFo2d0hLWEF6?=
 =?utf-8?B?M2JIck5iRTV4UVNOcjh5ZDVHZjBWd1BoQm5XSlRKUFlnV0NUZ20wS1VVQlEr?=
 =?utf-8?B?cGptY0NrcVBmdktmNGhTZU9RZTMrclJVSVI5R0xYY2ZVbkV6S0wzbk1tWm9G?=
 =?utf-8?B?aHR0bDNMY1RieEpxZUphL2VXSGE3Ynp6OUl3V0pPMFpySkMyRTBvQmthS3NX?=
 =?utf-8?B?U3BZbE1jSjdpU3BLL3d0U21uWmVCRXBKd1RxWmljSkpaWk9Cc3BuTkhHalhh?=
 =?utf-8?B?MXZhV2V3SDBVSmVVdzEvNTY0UEdMYUdnMm82NFkwZUg3OHBwSHl2anh2amg1?=
 =?utf-8?B?RkF0NVd5bEUrNm9Nb0ZOVHkrcEprVzRtSTl5eWlNa1pqbWM3emo2QU5pWWpU?=
 =?utf-8?Q?1PCUFmCuC8yWWEu5dXaW0CU/9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6047e2f-d77f-4fc8-839f-08db6b5c23f9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 15:46:08.8993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMU+LE078bCEl7T8ucgErKYLH0BT1c4JIZ0ivpWPK6Vtg8XAQ2oPtzY9JwlIFrmnRvKF/yxGSMm3hrtBJpTe1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8875

On 05.06.2023 19:08, Alejandro Vallejo wrote:
> tsx_init() has some ad-hoc code to read MSR_ARCH_CAPS if present. In order
> to suuport DIS_MCU_UPDATE we need access to it earlier, so this patch moves
> early read to the tail of early_microcode_init(), after the early microcode
> update.
> 
> The read of the 7d0 CPUID leaf is left in a helper because it's reused in a
> later patch.
> 
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> I suspect there was an oversight in tsx_init() by which
> boot_cpu_data.cpuid_level was never read? The first read I can
> see is in identify_cpu(), which happens after tsx_init().

See early_cpu_init(). (I have to admit that I was also struggling with
your use of "read": Aiui you mean the field was never written / set,
and "read" really refers to the reading of the corresponding CPUID
leaf.)

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -840,6 +840,15 @@ static int __init early_microcode_update_cpu(void)
>      return microcode_update_cpu(patch);
>  }
>  
> +static void __init early_read_cpuid_7d0(void)
> +{
> +    boot_cpu_data.cpuid_level = cpuid_eax(0);

As per above I don't think this is needed.

> +    if ( boot_cpu_data.cpuid_level >= 7 )
> +        boot_cpu_data.x86_capability[FEATURESET_7d0]
> +            = cpuid_count_edx(7, 0);

This is actually filled in early_cpu_init() as well, so doesn't need
re-doing here unless because of a suspected change to the value (but
then other CPUID output may have changed, too). At which point ...

> @@ -878,5 +887,17 @@ int __init early_microcode_init(unsigned long *module_map,
>      if ( ucode_mod.mod_end || ucode_blob.size )
>          rc = early_microcode_update_cpu();
>  
> +    early_read_cpuid_7d0();
> +
> +    /*
> +     * tsx_init() needs MSR_ARCH_CAPS, but it runs before identify_cpu()
> +     * populates boot_cpu_data, so we read it here to centralize early
> +     * CPUID/MSR reads in the same place.
> +     */
> +    if ( cpu_has_arch_caps )
> +        rdmsr(MSR_ARCH_CAPABILITIES,
> +              boot_cpu_data.x86_capability[FEATURESET_m10Al],
> +              boot_cpu_data.x86_capability[FEATURESET_m10Ah]);

... "centralize" aspect goes away, and hence the comment needs adjusting.

> --- a/xen/arch/x86/tsx.c
> +++ b/xen/arch/x86/tsx.c
> @@ -39,9 +39,9 @@ void tsx_init(void)
>      static bool __read_mostly once;
>  
>      /*
> -     * This function is first called between microcode being loaded, and CPUID
> -     * being scanned generally.  Read into boot_cpu_data.x86_capability[] for
> -     * the cpu_has_* bits we care about using here.
> +     * While MSRs/CPUID haven't yet been scanned, MSR_ARCH_CAPABILITIES
> +     * and leaf 7d0 have already been read if present after early microcode
> +     * loading time. So we can assume _those_ are present.
>       */
>      if ( unlikely(!once) )
>      {

I think I'd like to see at least the initial part of the original comment
retained here.

Jan

