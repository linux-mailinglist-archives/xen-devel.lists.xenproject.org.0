Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B242513165
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 12:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316419.535343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk1YU-0005IT-Hr; Thu, 28 Apr 2022 10:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316419.535343; Thu, 28 Apr 2022 10:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk1YU-0005FR-E7; Thu, 28 Apr 2022 10:39:26 +0000
Received: by outflank-mailman (input) for mailman id 316419;
 Thu, 28 Apr 2022 10:39:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nk1YT-0005FL-Cv
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 10:39:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 783a1ac2-c6df-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 12:39:24 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-yb0f5BHSO_iZvZtG0dn_Qg-1; Thu, 28 Apr 2022 12:39:21 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBAPR04MB7415.eurprd04.prod.outlook.com (2603:10a6:10:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 10:39:21 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 10:39:20 +0000
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
X-Inumbo-ID: 783a1ac2-c6df-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651142363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lEDezbWKENeWgQHA+ZYebJ9iu3swu/0Z4wX2q7pOqQY=;
	b=c9YyUhr7uynaebmZ1tmE4unbAsdzPieQ/k3CYIk2Bsy4vhtbn5MEsi0iXw4DnM4Yc/277b
	E6/twqy7UAVEKCVuN1SVTrZzc8KEHHgz+RmyUqRmHap1GCyVPNIshtwVMTGhixrKG98xrc
	Td2G1GDlZPHpkUMUOXa+6TovnolSRrE=
X-MC-Unique: yb0f5BHSO_iZvZtG0dn_Qg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1OWSYfBkdWhWbcnyu+2zvMO23/E2cHPCOcPN0bNRKZ7nYuTRjObJnstOJYazGzioHufJ7orUMtDXCXmrCLVsZyo44Za3ph5lWnUO81hUEfGoWL3rGD3kVVVv0DZljGBdCY80eifYzUfOgYJeRdwUJYmlOum7kaaxx0HiJ0VU8aII2cSZ7lCuAwT9QysYs6tlDuBXwVUI1YZ6q+qKHj8DWZQvNZMOpc2lbtAzGE1s3WJwNUNBtQ+kqmxdZH5LqQjAwOvTD265iBoVS2bT9/dyG7QTQoIjfISGXuhgpA+2DgdMbBj70/HwRyBVYis74oggzwK1M6UM1ng7M81ah93mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEDezbWKENeWgQHA+ZYebJ9iu3swu/0Z4wX2q7pOqQY=;
 b=MklIyz2Ph/jN/OoBvgxjqvv9zs0yp8xNX43Da+lh2nBCKFphxGPQoHRenohtr3sjiHpUenBSGFNjjzrlPnjCPerDpybNiMbYXouj2CkQF6dsfzivz2RK/WKgCjUnKfmwMcK6dDCdsg9djbBoRwZGyEoKCRbC8sks7YZ3qxa7jnUxz2FVH3jS3vt6GMfxJSjigBHaLKCFNNWTISlf17w1X36800soUi2gAC36msItoZ2OGSzhri9Bq8Iff9hknn4vKY1Fb+GoGsLPHkOvHHUnF1OwOzVdrsCXdnu5kKPELjIoojNeLxs0YuPSBzVFjee389AQiSnflZQ5CHcMX/gnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4843821d-4e9b-f57d-cf84-375f0b8a3ff2@suse.com>
Date: Thu, 28 Apr 2022 12:39:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] x86/msr: handle reads to MSR_P5_MC_{ADDR,TYPE}
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Steffen Einsle <einsle@phptrix.de>, xen-devel@lists.xenproject.org
References: <20220428091359.90431-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220428091359.90431-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0033.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 372bb576-5222-4955-de94-08da29035a82
X-MS-TrafficTypeDiagnostic: DBAPR04MB7415:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB7415B86AA231D065F305EE84B3FD9@DBAPR04MB7415.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KnkRFYt+wXkRA8lPfAAOryMKddEyss05JppshC0GRwtMuF9Hh8xUlMWPrmrq+QC9C1cnNr9dKz/ykBaWopREh+Buep0qY/xMHhkAzKq/zi/4HNtI9SQ/CiOXRJRIp6Ibf3es4/QzgdAqzzuhXH5VImC7HIxMkb3LL7Y9bWdf/MVz+8zmpVoe0FnZxscxlVWzvaP/DuixfTNIZ16b7jveDPw/WZHwIWNA+2upSOQo927ILcsPSWb8eAxxAWVQoksSYz1NJmGs69S2kuZNiD1vJbJxABeRzpm6Pe0S0uB2PDMJM4CJCcSE4hUDcMm8HWKjdee4+2KndvFqeZHmP+DLBEy8GwaW0fqxX9ESCRXOYRq6lUDzgoks0Tib2Mau/HCsoK3anq9LyPieRK6mF/B/aNmx2FJrI4IpYrAkXTsDlhFuFeS7lNbQYjC8pMfYzax7mj5F4dgTEZ620AmloV0jQhftkzoHg0GY++8XNaZ9R5mbIakxjdDqXQ2W8SaJdhiT1/NRqOCs66SRzdoj64FLZ2rHDYnCZrg18iymZli2/FVfrfhLRA3g3DcmOApR22goSFJPp1BSQCW4OBOelz1+R+56n028SBJPtfMSRhQCPjBgau+ztjXQtNOVmp6gczhIOOso2AKmmD4meeH7e/uvLnVUqWN1u0M9IS9+MkXKyFPzXkc1CBLJDLyl4yPo521hD9vCW/HH1Meh9IDpmUyEahZcx8CZGW9PqEZxWa+WJwk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(66946007)(36756003)(66556008)(2906002)(186003)(316002)(8676002)(4326008)(83380400001)(66476007)(6916009)(54906003)(31686004)(8936002)(2616005)(86362001)(6486002)(31696002)(508600001)(38100700002)(26005)(53546011)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWphd05FL2JTdGdDVExUZHNJOGFKS2xsU1VkUUJDaU9qMk9YSWY3a3dDNkhI?=
 =?utf-8?B?bllzZVBsSExWNEdEK05uV2dNV3dhWFI2RlU1U0MweDNqR1k4SjdmdU8raDFO?=
 =?utf-8?B?cG4xQlZUN1dDMFlpaXFNZHFFZlNvVW0yemI4cXh4VGhpUFIyR3diYmUzRVIy?=
 =?utf-8?B?bHFNYWNMK1Y1bXR6M0dZRVJJcHN5T1hkSTZCN3pYNXo4TjNDaWlJQXJNZE9i?=
 =?utf-8?B?UnhEY3lVUmN5TUJSZWxiQUVjeFZlQy9VU05DL0JaN21ZZGNuRTBqalB6Umpm?=
 =?utf-8?B?Qk5VVW9Sb3h4Yjc5aU42Ky9qbmVmbE1jeUhRSjJ5M3lxM0h0UklRbjE2NVJN?=
 =?utf-8?B?ODBsc21sQVFmSGt0OWxBRjAyQTNCVDM3dkttbERmdUlVbHlVSXYyUGhQcGRT?=
 =?utf-8?B?RWdNUkNMdXgrQW0rMDVkZmhCSENRenZRVUw2RE0zVC9BaEVockNvZzJpN1I2?=
 =?utf-8?B?MEp2WVR6dXhmQnllNmRqbWVJUlVwUEFZUHJOTkNWTkhVQ0s3NlM0aXE1QVpB?=
 =?utf-8?B?YktldjlaUHdseGZad0l4dERPbWVvaTdoWnc5ZlhXUnNXbldPeFk1blVQSlRU?=
 =?utf-8?B?VXFGSlA3S1hIZWlmQi9sK2hGZU5HOHBsL3c2ZTR0cXlMYTBTOGcycDRha3Bp?=
 =?utf-8?B?WWpyTFlpS3NNa0dqL0ZqdHUvQnJKMWlHNFBjNGlrV1I3WHQrVkI2SFhMZVlM?=
 =?utf-8?B?TGZ0bE9Cd2pDZFFubHhBdVhUQzN3UVVsZ3lrV3dlWnZPT3psUnFzR0hOd095?=
 =?utf-8?B?TmZZU21IWWh1dGQrVzBuNFlYdU9Eb2FNbGxHTDZVZFgwZEJyd0h4Wk52S3Ny?=
 =?utf-8?B?Y0pjeDUrbFhUQUZBWmlaWnRrWlNMUmI4YUlramMvZy9sb24zV3dVTHhKOXkx?=
 =?utf-8?B?VFJFR01hbjdBQVlCd042TWN6aTNNM09EVGVZVytvOURHU0Fhd0NYZHJxbm5x?=
 =?utf-8?B?QkgrOU1TUEFnTUM3MUEyWUhUMnlnRDBxRUFJQy94YXRnV2xNRkZTb0Vkc3FP?=
 =?utf-8?B?OWdGVkc4bloyS3ZiaTY2b0l1N1dtUDBGREVncFRZK0JjS2FubWpRMFBMdHBa?=
 =?utf-8?B?M3FjLzlHVjcreVVGeDd5M3FqSndZQi9zbGphQVAvODZSbkdqc3lmSGNmc096?=
 =?utf-8?B?bk1XWHcvYTZuV3l1YVBHa2MwWmljZXNxSStvTlRyby9PM3EwQmJ1Q2lLSHoy?=
 =?utf-8?B?Y25LaGZic2RWRGR3bE40elk0cURvbUR6R05mcGtXazQrQjVEVW9zWkN4d2lY?=
 =?utf-8?B?ZjloQUZCWUEvNllEeGYrbCtQVHBZRWw2d0h3czErcktMaTJJeDZaZzRsZVov?=
 =?utf-8?B?RjRyT3dBWjYyV2NpOE1JU1pSTEJaTU1mS1VleVlLclNxbTYrdEFGSkluQVRl?=
 =?utf-8?B?MURlTlg2cUIydWVic0l4Tm96ZU1IMlljOWNVTENUcGRqYVA2RUljeUx0ZVBK?=
 =?utf-8?B?NXBWODNkTkZGdmVRSFBEbzEyMnh4ZDFnb0Nqc1pVN2h4cUdYZ25xTXVGSnpH?=
 =?utf-8?B?UTVUKy9FMFBaL2FoaGIvL2MxVGRmSk45V3pHT3k1MEx3RDZnOGhNMEdwaThp?=
 =?utf-8?B?Ymo5VWlnTktVcXJhendacHBDalFWTDA4Rm51dEpsUE1hWXV2eitqaWVVdml5?=
 =?utf-8?B?bW14TmRqa1lnb1lVdEJFQXIzeEt4ZXMxWVhIZjVVbEZiU1Y0LzFKZU83WENB?=
 =?utf-8?B?QlQ2YzdSS080K0RwYUZlZU1mWm9PZFJSaFcvQWJBNWlBa3p5N3JyWGJHQTJU?=
 =?utf-8?B?cUd4UG1FbmU5SlNlN1B1eHoxZTU0NlJhTFVVUlNnOVFDWmxpaTdPb2Q0MnBk?=
 =?utf-8?B?NGlNNDFxYmlySTBxYm15dnJDRVIrL24xbEs5SW0vK2VqaWdrZmV3SUFueTlj?=
 =?utf-8?B?aENOQjMrNldRbzhmb2ZaYTVNQS9OOXdDSVZtaHVDcGJMWnhIL1M4OTdtWVVZ?=
 =?utf-8?B?aXhFSmZLMGhvNTYvdVVyYXBXNGZWWGRPVzQ0c2JXb240UW5mVnZmLy9kVTBa?=
 =?utf-8?B?Q053dzM4b3I4WlhZdlBRNkc4Tmg1Nmt0T2t4NHRXSGhPMjdyd2JmcnE4cVFS?=
 =?utf-8?B?dmVYTEZ1NmR4bytHTWpldmd0NnN1NVhDdEV2dU54NC9Pd0hHbVEyd3ZnYnNL?=
 =?utf-8?B?ZklCam1EcTB5MEdKWEh4UUpxWmx4WGt3a1pyMFV2L0RIdGRVQXdYZjdNZ2FX?=
 =?utf-8?B?ajBsdldDUGtlRExrenArVlNJNFNIMzJoczZCTVBPQ08zOGJBWkgrYUluR3BW?=
 =?utf-8?B?c0F5TTF3aUZkN2VFenZBYUkzdUhodFBlcnhRaWZZSVhFRENqRXRWUDU1R1dT?=
 =?utf-8?B?OVI5d3BueEExRXpURm81SXk3RlpzbUI4VVZoeU9YYnRrSmQ1NSthUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 372bb576-5222-4955-de94-08da29035a82
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 10:39:20.7919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7e4awNuBFJrTEtzPPXCmGcLMGrsxgoEvPGwFfpMLMIhphqV7TRtT2qH6eZSX7uKbeKEsqjsVSvdXfEE7bUFzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7415

On 28.04.2022 11:13, Roger Pau Monne wrote:
> --- a/xen/arch/x86/cpu/mcheck/mce.h
> +++ b/xen/arch/x86/cpu/mcheck/mce.h
> @@ -169,6 +169,11 @@ static inline int mce_vendor_bank_msr(const struct vcpu *v, uint32_t msr)
>          if (msr >= MSR_IA32_MC0_CTL2 &&
>              msr < MSR_IA32_MCx_CTL2(v->arch.vmce.mcg_cap & MCG_CAP_COUNT) )
>              return 1;
> +
> +    case X86_VENDOR_CENTAUR:
> +    case X86_VENDOR_SHANGHAI:
> +        if (msr == MSR_P5_MC_ADDR || msr == MSR_P5_MC_TYPE)
> +            return 1;
>          break;

You want to have some fall-through annotation there, perhaps preferably
the pseudo-keyword one.

> --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
> +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
> @@ -1008,8 +1008,24 @@ int vmce_intel_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>  
>  int vmce_intel_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
>  {
> +    const struct cpuid_policy *cp = v->domain->arch.cpuid;
>      unsigned int bank = msr - MSR_IA32_MC0_CTL2;
>  
> +    switch ( msr )
> +    {
> +    case MSR_P5_MC_ADDR:
> +        /* Bank 0 is used for the 'bank 0 quirk' on older processors. */
> +        *val = v->arch.vmce.bank[1].mci_addr;
> +        return 1;
> +
> +    case MSR_P5_MC_TYPE:
> +        *val = v->arch.vmce.bank[1].mci_status;
> +        return 1;
> +    }

Could I ask you to add a reference to vcpu_fill_mc_msrs() in the comment?

> +    if ( cp->x86_vendor & (X86_VENDOR_CENTAUR | X86_VENDOR_SHANGHAI) )
> +        return 0;

I think this better would be !(cp->x86_vendor & X86_VENDOR_INTEL).

Jan


