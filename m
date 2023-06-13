Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04F272DA9E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 09:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547833.855448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8yIH-00009V-Lx; Tue, 13 Jun 2023 07:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547833.855448; Tue, 13 Jun 2023 07:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8yIH-00007D-Iy; Tue, 13 Jun 2023 07:18:21 +0000
Received: by outflank-mailman (input) for mailman id 547833;
 Tue, 13 Jun 2023 07:18:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8yIG-000077-01
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 07:18:20 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2055.outbound.protection.outlook.com [40.107.13.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7828a357-09ba-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 09:18:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9784.eurprd04.prod.outlook.com (2603:10a6:10:4e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Tue, 13 Jun
 2023 07:17:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 07:17:48 +0000
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
X-Inumbo-ID: 7828a357-09ba-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JktSPI1gaqu2aUO8xum3XVPqOFbb+1fdXi/k48fL0GMnkIwh40Gcq55YyQcyc/Fs74DSyUYt5b0uAdfl9B8GxnK9+ltbW16nCf1jBQW0uy2ob0+FYP8tTG0hDBdnDxoz1z8PeP4dcRvr1PQ8EnplBvIJzIo+VE4OqHZzdmcrSzl9cDpYdKafOliW8znFnrT0NJHkwt7qozBn9lb96vt2JXMoJoFUBYJNPfCzo94Jm6Z8cgkcUUGz9EbahT0IEAr2PS1K3WXR/p+2uzoSbsJ0h1aushSGzpqaDa1RI57KM655G45Z/bXFF+ztZS/R10ZbbKQV3IVUtyqGyNHfHDGLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F531f/giZ3iCPJsfsXLG97Gf77R+b6XiuNGbz3dJ3vM=;
 b=UvLEhmC6UBDCr/irn/AZf0zrWJXDzrUTcD1KW9BhQDHAxY3YLXfzDB+f0YXYcvPmYyF7879aF9AOUHyMX53uHmpxuktsFG3gEzlyEQlaVJZYAy6E/IhvS8h3Yg2+GuR6n2u66bxIng9fd4flGxDsIwOGcTUSS0j0+64Lda2kMMnSY2ZcUPRHdoURVOCKVIY/boJDM7a2VxNorxPZz/PlskfODEPA/rtdtI0p/HRyibYq8qv64MqoZKmz2A00YiTKj9K/MrpkhsolGI1pp5RznhgswSl8o2pvr0S0pftv/D9glQhqapk0gYh0eYGbkET3TXlZqSFZoH+zycb2Ymz++g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F531f/giZ3iCPJsfsXLG97Gf77R+b6XiuNGbz3dJ3vM=;
 b=qABEu45vGSLFKcsrZYHj9D6Qeyperm6HjnC2/FI00993fW6xwenjg80L6ILyopbM+eZcEwGmFXo5NJ0Mj5VHc4WcihgzkNuSKgHJN9kSz4lU78vIc3lImuBwRY1MZIMaAOhHi1UWOKpw2/7YFkdrkcTka0hnDleulXqtJPoKM63KyFdPlK9TmLCRBW4BD50LAea5HJ0GJS0sjBLTOw7ZF9Dh5ELt/NwvRRbKlOkcwCZ74fcSj5oAJ2G5VwWiDIGwYg89FH0i8/ieoRtvWVALsBi2TxuIWTUHLOSKYUOPn0bm47v1467vFH/g5lciz0v/lWZ76eqRewk2EZijGQLbXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4653fce-1a63-f5de-fb4e-6ed1a11188e6@suse.com>
Date: Tue, 13 Jun 2023 09:17:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] xen: fixed violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: nicola.vetrini@bugseng.com
References: <e139df541183df7c92b3bd73841cf1fb2851e054.1686575613.git.nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e139df541183df7c92b3bd73841cf1fb2851e054.1686575613.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9784:EE_
X-MS-Office365-Filtering-Correlation-Id: 738ed6f4-8b6f-477b-f183-08db6bde4a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b9q9oN56XBKq3Za8+TMxeU5Us+/75Gf75pGb3gMvdP5lKKBejhlXrzm2xzygVsV6bK+NuLR76Kmd1tI6Tf64KC8yuVlOgX3SkoxbAg47+GCfBlBj24CHOKKacuyd2Sty6fhgSDT+vgbKhCyE0M8yiEkAKZRj30bYm5c9JlKmVoa+g3a3Kj+EACDI3NUMr82VXcgXezMMqDNNY8xn0H/F8v/EOkjRsKUXwBY3BcRQDpVl/MDiNS4iCKKQiMlnpOZsFjJ+JSZ5emYJJwQrEn3rm+WtbEPJ3FMpW+rY3OhDPfOSAxjHwpuAtUkSGFv3SxlXiEiat6JWJ+aXGYSpiknAuYr+SfxjZf7pERFob+FSOfnK9pML7FZGL0Jrf4pFnueEhNRInoRQYNBEiNfeyHS6lW+g1ceDEuif3smCSo8//16CjMFymgbhDMmRiswvflsKzbbmprrB28dzbrHxK7Bn2T4g6xX0UEI3+1O2GpkBiNw2IpCKg5z8nGEtQQiKcUfKwSH9yaaYXfEyAqHxMAjRhK+gwnnfVchoh0p5lGDfeDxMwE8B1ExEviCZLXvTPXP+wA9r3XYmU0kD3U+D+gp8m8IGPKBybLW60WpdWycknPkawE09uTCfEjCYTXfOz1jStVh9CnBrv2z4Nq0X4mbViQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(66476007)(66556008)(66946007)(8676002)(8936002)(36756003)(5660300002)(6666004)(6916009)(4326008)(478600001)(31686004)(41300700001)(966005)(316002)(6486002)(38100700002)(53546011)(86362001)(6506007)(186003)(6512007)(26005)(2616005)(2906002)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXBaV3o0Uk9CZm1IRTN5R1lsMUd3SDBrVUh5NjF0aExsVldvRHBiNWdHR3dY?=
 =?utf-8?B?TzVsMlVTUzZRK2lTbUZldWQxZytiblNmQkQ3SXBnV0EvTjJKZkN0T2pobzlz?=
 =?utf-8?B?K1RIa0gwSUNDWkdNRllkZnBlZmZtblg2WWxOckFLTHJ4YkRGbWVKb2pURlpk?=
 =?utf-8?B?akJuazk1d1NCajQ2NWZzT0tNbEk1d3lSSXlwZlVwUkxkMTR2aG0rWW54SG9C?=
 =?utf-8?B?dEZ3SnAwajBlSVIrLy8yVi8vQy9yK0w3UmdaZ3I3a1libFFDVVhyVVh1ZTZO?=
 =?utf-8?B?RjltWkloUCtEK3NheTFid1ZKRG1EYjZRbTFoMU0rQ1ZrS0FlOW82QVBESlF6?=
 =?utf-8?B?T2xtbFpiM0REMERjQjJYQVRlTzNPZ3djY3N1NFV4dzZXZ1NkQUxuQUd0ZGdT?=
 =?utf-8?B?Tm5OdWpJcTUxMDdFV1o1bVU2eXUwVUpXMlVKdXpMbnBON1ZhU0lXanl4UFpS?=
 =?utf-8?B?ajVncGlYMFlPTFdDMWMvcW1pbmVEaEU0aUxHVVh1bUpnOUlxMjI4TVp5S29s?=
 =?utf-8?B?ZFpZWDZITkhUTnhINkMyZjhWYURTZFhDR3k0RTlibnFKZHhSYnFvUHVqeUZF?=
 =?utf-8?B?UGRHVVdXU0ZYWWkyVHY2N2pXeDdtZ0tOK3prMnFGUGpLWFRWOGxXT3dVV0p4?=
 =?utf-8?B?R3dnNDRRNVZ1alJWVVQvR1hqWFhHWGdwTm5IN2RlUCt1VFFyL1ZOOGNCNCt0?=
 =?utf-8?B?RlpDT1BzTzlReFNoRExmY0ZCY1RyY084U0NMMlhEQmhUSmg0MnVCcHJyQW45?=
 =?utf-8?B?T3ZkUmZvaks5TmxUMVhNbG5xdFNMNnZtZjE2ZlM4M2pnYlNpc1ljRW9yUWF5?=
 =?utf-8?B?R1hVYzdjeXNPYUVyaFMrTFVpVllsZ2hNVGV4RGwxM3hrOTJ4ZWxvMXdqcnY2?=
 =?utf-8?B?OWk1SjlxWGh6Z0FhZHljS0ZxRUpHUndhTWNUeEpVeElsN3pVVFIvZ1V5NGMy?=
 =?utf-8?B?bmQxZCtKS29xb2hWYlFZSXVicWJ1TWJrTWRSQWZJRzYzQVZvdk5Kc1lQUTha?=
 =?utf-8?B?TUljQ2QvMHUwbGp4YUEyZWFnNFhXSThYclR3VDBUelVNMElFanJMSmV6bzhC?=
 =?utf-8?B?TkFaZjBUUjFFcSttNkM5Ry80UlZSd1JaTjlSYkp6NHBTdTdJRUdaOU9xWDJX?=
 =?utf-8?B?bG9ncnFSSU84MGYrVGUxd3J5Mk4xSHA2ZU9VcUxxUXlId2Fjejc2UmxXa3Vu?=
 =?utf-8?B?UHNTaUhvVkpVSmt6NFFUUURWQk1IMDlVRU5Xdi83aWxpeGtIc1Rpd1VoWW5H?=
 =?utf-8?B?MXg4SHI4M01CZUZBUFVqY094Q01CeExLVGN1WlBWZmR3RmFxYVlzcHdRNEFP?=
 =?utf-8?B?WFlVK1BkY2gxM1VEQWVwdmtDakRKY29oRkU2YkIrc0RjS0NRcTBxYUxsTXdz?=
 =?utf-8?B?Z3d0cU11eE0wbCtxN2tkRnJMLzRxMGJrU2szc2hiU2dISGF6T3RRSlN1enVn?=
 =?utf-8?B?WG1oeFBTMG1tbjFCSHd2SWNPYzBOMTZ2VE9MNk1LeTlBcTNYSjkzdDNWTXZx?=
 =?utf-8?B?ZjVkbXdLNjI4b0Rwc2Z5Qm5XNEhKRE04ZXRLYlh5eXMySVQzQ2RuR0cvb3Vs?=
 =?utf-8?B?K05CalJmNFBQNWxQNTdqbjY5Zzd3RWcxamVmdzZMZTBoYkNEc3RZTEZxbHZJ?=
 =?utf-8?B?dUtSdWtSMlFRYXdERzg5Ykw4OWNmZ2NZOGYzQ0cyY3pKMmZkTGFqSjR3aUkr?=
 =?utf-8?B?cVZDeWpLYjR2SGl3ZmpCREg5S2puamVtR0JJYmpXNVR2aXE0c3ZzaG1GMTRG?=
 =?utf-8?B?YkpzLzFzZGRBeDJNSFFBZnkwUVkydzZmZVdDSXZjeldTc29XVk1MNktqcTVD?=
 =?utf-8?B?L1hOU0V0blY2cU1wamFabDF1aDFrNXAzZHdVd1djamRwRjlBN2Z6Yzc0UnJM?=
 =?utf-8?B?Mkx6aElselJIOHZESDZlTG5Oc1JKY29RcERIZVdXOFdWYzZRQ3UySVBoZVFT?=
 =?utf-8?B?Q295eW1MYWp2SUs4bWVCYkoycU05R2V5b250NmVZMzdGcVgrSCtZN2RrWVFl?=
 =?utf-8?B?c05hMUNjZU42TjM1d1g2QlhqTHpSbHU2eDBja1pRbUdWQkhianlSdXRSUzlK?=
 =?utf-8?B?NWp3ckNISG1rOEZYd0ZENzljQmdxVElaN1JzQUdaRnAzSHBLanE5dnpuN3NK?=
 =?utf-8?Q?KyadE5JWHpqbFvHfH9w/kopG7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738ed6f4-8b6f-477b-f183-08db6bde4a46
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 07:17:47.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SP3+w5pQ88x0f0jGcYK+vEdfiYoJRm5KJktqRhFVYIFNQroSsL51Xgm00JaCQSG7NKYBhCUgRnpo42Z3NlkKlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9784

On 12.06.2023 18:10, nicola.vetrini@bugseng.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> The xen sources contain several violations of Rule 3.1 from MISRA C:2012,
> whose headline states:
> "The character sequences '/*' and '//' shall not be used within a comment".
> 
> Most of the violations are due to the presence of links to webpages within
> C-style comment blocks, such as:
> 
> xen/arch/arm/include/asm/smccc.h:37.1-41.3
> /*
>  * This file provides common defines for ARM SMC Calling Convention as
>  * specified in
>  * http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
>  */
> 
> In this case, we propose to deviate all of these occurrences with a
> project deviation to be captured by a tool configuration.

Here "propose" is appropriate in the description, as this is something
the patch does not do. Further down, however, you mean to describe what
the patch does, not what an eventual patch might do.

Somewhat similarly you don't want to use past tense in the title, as
that wants to describe what is being done, rather than describing a
patch that has already landed.

> There are, however, a few other violations that do not fall under this
> category, namely:
> 
> 1. in file "xen/arch/arm/include/asm/arm64/flushtlb.h" we propose to
> avoid the usage of a nested comment;
> 2. in file "xen/common/xmalloc_tlsf.c" we propose to substitute the
> commented-out if statement with a "#if 0 .. #endif;
> 3. in file "xen/include/xen/atomic.h" and
> "xen/drivers/passthrough/arm/smmu-v3.c" we propose to split the C-style
> comment containing the nested comment into two doxygen comments, clearly
> identifying the second as a code sample. This can then be captured with a
> project deviation by a tool configuration.

Finally I find the use of "we" somewhat suspicious. Who besides you is
it that you're talking about?

Also please don't forget to Cc relevant maintainers.

> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -1045,15 +1045,18 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>  	/*
>  	 * Ensure that we've completed prior invalidation of the main TLBs
>  	 * before we read 'nr_ats_masters' in case of a concurrent call to
> -	 * arm_smmu_enable_ats():
> +	 * arm_smmu_enable_ats().
> +	 */
> +	/**
> +	 * Code sample: Ensures that we always see the incremented
> +	 * 'nr_ats_masters' count if ATS was enabled at the PCI device before
> +	 * completion of the TLBI.
>  	 *
>  	 *	// unmap()			// arm_smmu_enable_ats()
>  	 *	TLBI+SYNC			atomic_inc(&nr_ats_masters);
>  	 *	smp_mb();			[...]
>  	 *	atomic_read(&nr_ats_masters);	pci_enable_ats() // writel()
>  	 *
> -	 * Ensures that we always see the incremented 'nr_ats_masters' count if
> -	 * ATS was enabled at the PCI device before completion of the TLBI.
>  	 */
>  	smp_mb();
>  	if (!atomic_read(&smmu_domain->nr_ats_masters))

I don't really know this code, but the use of inner comments looks
unnecessary to me here. The same could e.g. be achieved by

	 *	unmap():			arm_smmu_enable_ats():
	 *	TLBI+SYNC			atomic_inc(&nr_ats_masters);
	 *	smp_mb();			[...]
	 *	atomic_read(&nr_ats_masters);	pci_enable_ats(); (i.e. writel())


and it would avoid the somewhat odd splitting of adjacent comments
(which then is at risk of someone later coming forward with a patch
re-combining them).

> --- a/xen/include/xen/atomic.h
> +++ b/xen/include/xen/atomic.h
> @@ -71,7 +71,10 @@ static inline void _atomic_set(atomic_t *v, int i);
>   * Returns the initial value in @v, hence succeeds when the return value
>   * matches that of @old.
>   *
> - * Sample (tries atomic increment of v until the operation succeeds):
> + */
> +/**
> + *
> + * Code sample: Tries atomic increment of v until the operation succeeds.
>   *
>   *  while(1)
>   *  {

Somewhat similarly here: I don't think the inner comment provides
much value, and could hence be dropped instead of splitting the comment.

Jan

