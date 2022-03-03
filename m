Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6AF4CBCDC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 12:37:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283191.482136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjlh-0006Gw-LI; Thu, 03 Mar 2022 11:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283191.482136; Thu, 03 Mar 2022 11:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjlh-0006EJ-Hs; Thu, 03 Mar 2022 11:37:13 +0000
Received: by outflank-mailman (input) for mailman id 283191;
 Thu, 03 Mar 2022 11:37:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPjlf-0005yA-AZ
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 11:37:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43181560-9ae6-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 12:37:10 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-B6R19pSgN5aOdcSxGGUpAA-1; Thu, 03 Mar 2022 12:37:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 11:37:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 11:37:06 +0000
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
X-Inumbo-ID: 43181560-9ae6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646307430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpjXLiGCFO/Mj+gth8FFwvGTmNeKigMGoIqY7FvfHGw=;
	b=ZQWT6JmN5CKCtmZ8kiVbTbqP0gJ22wiAD1Emx9q5/Wj5q9GYImaHofGRfybGp6w2YxrhuN
	tLb4u4tQEFwBCnwZJv2+uzD4qbzMd/mMbhBL8HkxImpdCDlh63UFPYUYNIVdgLWoDv32lC
	5vHfmKPOhdK4V6AuGZtMQlRKyhEdITs=
X-MC-Unique: B6R19pSgN5aOdcSxGGUpAA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAHtSrjSmR0W5jS1Go2bltfypzN7lghpKFpEwZY7vb4CsSLqY24+04LLFG6YulVGLNsAASfvle3RId3GQqIOUK4gPoPr2V04cAauzxRANp2WpHr9GKcFOtj3lZiwXZlWHPba0kpDDCtUcEQuVwE9PWL+XclOc3/VByOL8bwMeMU1rhLXpN6Wy6QNZYzow876Bm6ViVKhDdmJ3JkE8ew+J12bqIVUvkYoCuDy3a5UC6MJRWZRRXx9Ya1bOlKlKEcsJFHl08Dm3uuiOqGWavjzL8fYNzPGsOqeuU3TtBNgaeu51rfzVELnYwThmsHqX0YsRZAw4VYW+dvbJi5yiNrWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpjXLiGCFO/Mj+gth8FFwvGTmNeKigMGoIqY7FvfHGw=;
 b=KEPVTOcIohKm+z1rc78LBWq/Aib84suJUmdfPeFyl2ygOFeO3Zf1xTh4bHd5Q45IpqgTMnl5Z0Om42DjShW4kTOcNStMXkZVXDqIqBaZ0OKpKtjH5ALiO4YDx79rF5d/teVISctWUlDbx2tf8mD0QsFvV8yZljwaS9hA3gUuANyQH0GW4Z0nWkmzqUcG1eV5wdWCxZPleV0kjl+ZyizZ7l8gwlNdnyUzTkG/GKTJfPfPA9B7LszkExls6GacfHLbum5MCwfOfw/3sc1H/tV10sZUd1LSJo1UyliG37Ls6AJZeRmj2T5kf6YRQNgdkNzN9goRvAB7Dh+hYBq1rST1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <240602ab-412c-8607-ed6c-916cf37343f7@suse.com>
Date: Thu, 3 Mar 2022 12:37:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220302150056.14381-1-jane.malalane@citrix.com>
 <20220302150056.14381-2-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220302150056.14381-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0030.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 074d8917-258b-4904-6c21-08d9fd0a24de
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7883551A2694E27C1F8D3606B3049@DBBPR04MB7883.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WBVc3+rmkO6u7v8zQQGlDqqVCK8lYgs6M32Wd0Kp2UjN01Noxi1zYuxUdNM6/IzkXFuKPcWxfP/+xj7Bz2aWzC+6g3znHM1zSzGQL9iTKSfNHkqT1R4ZhiBeYn02zhbidYM4fJlICkGnYGuhNekWT8VpRuXmSEXKjETbPt7vmFIFGrmQYpDM9TzcKYGxoa5K2c8K1Ku1jlh3tLS6gp160MvraUrfOv70hepz8PUxz9pvOg7stC4RagSgCFuRXE/nUvGPmcsTwyqFJgFuYvVzFBB6P6kc7Q0uMvUTy7pAAWFaVJn5upRlshprlTTxWB0G5EZ149PYiDnJMMKH70g5NDUkOHTbuF1obMbF85+P2FbqCDMUfyCSa/KTTlG2fxYAGpPPIP6b0m+GNQvWKZkcJAQpl4vVfQGxAdwS+JZE9rw3VdESp368bDJRm4sK5NipZuVJOn43amKXeUjTeNfrG6zm+XRUamoNZ8wlxg9H3gsgBcXW6h6fQLObj8EZ6UdyUDr5ygu1KT3LGLYtgXGBYgYqd+jyItpND6Li+EQiOVByEY6vABoCFmfo7UWuB72K5jf2nnysp+9qR47M+WKIZpj5eYcAzEKXyxVoltVpAfxHtgCZDzdMGDNJSsAeLxb6/pL84GsxZSAjAmnCZXBg/HtbeI1AkLt9GvSPJxs5yUuocQVchZITjmZCi3EeScqQp83u+plhalDkD13BqzCBtSbQ1Gfg6/XnaQccu9giJtw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(7416002)(186003)(6916009)(26005)(54906003)(8936002)(2616005)(53546011)(508600001)(66476007)(66556008)(6512007)(6666004)(66946007)(6506007)(5660300002)(4326008)(8676002)(6486002)(31696002)(86362001)(83380400001)(31686004)(2906002)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cG5lTkJxNWNwZHBzSDd1UXZrWnlaaVY5a2w2S3p2NW1OTnRQdGRKNUIvaVVh?=
 =?utf-8?B?Y1JzY1c1SEJxNGE4M0oxUUluTE91YThYc3ZIeU9ieFF6K1czUTFhNHFEM2tB?=
 =?utf-8?B?ekV0U3dJU0xVZGxhZ0FVYWJaMUNLNis4WU1UeTZXOVRqdmUyUDczNHZNdDBE?=
 =?utf-8?B?ejFoZnRvRXkxeDBhM09WMm1FTUZUOGRTTFJZWThmN1ZLeVdKVitCZkFqb3Fp?=
 =?utf-8?B?MzI4QjdqVnNBb3ovNUpRMGRId3ViQ3QvR3JxbHRuRjBPcjMxa3N5R1JSa2Rl?=
 =?utf-8?B?L1FQYlZHZEg5Q1diOTd5TXlqZktMM3FVdjNMRnRIQmh6TjRoR1RtTzZMS20v?=
 =?utf-8?B?WnhTVUdFQmxLSjZvRTlYcm9Ba3BGUFlpSmNwczNSN2RqNGpEYjkzWGtCajdU?=
 =?utf-8?B?OFczU3hNM1lCYTVORUZNTVpXRlVYNjZUSmQvdjZmTG41OHNXNmlTSWVxdDNi?=
 =?utf-8?B?bWppTkExZlBkU3RSQ0tLblZWaGpTYnBMYUpkZnJWUEJMR1JvWmx3ZXNISkZS?=
 =?utf-8?B?STl2QXJFMFJRTGljOGY2d0EwNFp0R2c2S2VaaG1VL1VZWTEwM2NZKzcxRTg2?=
 =?utf-8?B?L2Q4UVNQVnMvYno4bXlrSVNHcm1VcVBuVzNCcXdqTlM5eDlROUNYN2hCZFd0?=
 =?utf-8?B?ZHZLNWtFU2NJdDMzRnlkc2FuOUNkSExNR25xdjhtVmJYelJmT1JVV0tUTzIz?=
 =?utf-8?B?TUd4QmRFN3puNnhmS3pZNTcxY25Wdko5dEtsd3E3UEl4WjlZMnllYTlaMW01?=
 =?utf-8?B?T21ocVBsOFhYeHR6ZnR0OENzbjNHbjJQbTRxNy9ISkg2eHNrdytSMG1pN1U0?=
 =?utf-8?B?T0o1WUpTdHo0REdRMHpIMzdldmRoWGZORks5RVR4ek1HdkxUTXl1Q2tMQ294?=
 =?utf-8?B?VVRNNWVZeXZsNkZCS1ZIY0lsR25JL3R4NWNmK2VwYzBqelhsN2Zkd2ltWDQ0?=
 =?utf-8?B?eXFrbTNUMENMS2pOVXpmNnhLR2tvVlk4ZzV6L3ZaSGtlVEkreTdjZ1FsNEY2?=
 =?utf-8?B?R1BIR2JzUTY4U1dmbVhZOG11djU3M05oWWJ1TzFES2pVZ0piZnpyT0VCMGJ2?=
 =?utf-8?B?eU1CQzBQSDlLSUZPbHE3OWQ3cFkvUHdiK25PZnNHclBBdXEwV1h6blNmNnMx?=
 =?utf-8?B?emtLdXdKS1BJdUUzWER0Um9ab2w5WHV2K0g0M1FlMkIxdDdFeFAwNFRrdmsw?=
 =?utf-8?B?czZCVDc4LytmeDc0ZDdmQlFQS295ejNoSDQyczhOb2RyMlpMSWM5U2ZITEFn?=
 =?utf-8?B?UXNta29rdHpwcGJXLyt5MVZQUXJzRld0MDBBRkErQThQNTBtUkp4bnhkMzdl?=
 =?utf-8?B?OGZxR2l0dHBpMUY3SWZyd1FRL1hHQjkvKzNUU2xFSVVjUEVKeFEyQlZmblJT?=
 =?utf-8?B?M0w0VytCMVB4NjQ1U3BCNzNXVEZPNmpJMHNIQU9SKzVWb3NLenFwTGVGc0No?=
 =?utf-8?B?OGZxOFNsL2NFaDJzeXNYd09ycFh0d3dueU1GOXc3SkVUd1d1b3NTK3hORVli?=
 =?utf-8?B?UmJBOHZXTUVoYzd1elhIQ1BCcE1XckprQXE5RlFmT1FmdVA2S1VPbDZITE5P?=
 =?utf-8?B?RklPNTF3d2Z6dGNpTHI0UTZmbDBqdXQ3TUJTTmZHZEtJVFR3eHFlY0ZrWVds?=
 =?utf-8?B?N1AwcVZQalI4WXZaS3dYY2ZJeWt1RnV2RjZSRjNLem40Vi9UT0lkdUlNRjNi?=
 =?utf-8?B?Ymw1Rms5Tmh0TzZYS085RERiM29JVEwraW9ka25iWlpIZkRiZGZaeGN5WEky?=
 =?utf-8?B?VGRVTFlhMkp5RWZtRVkxbldxK3l5blJTdkxFYUQ1cW4xYmVNUEFZL1Y5aWg3?=
 =?utf-8?B?U21CU21qVWZOdWNHUytpYlhIUFZISzN6Q2VteWRFQ3RsNlEwRUtoMUhuNUM1?=
 =?utf-8?B?cmo3eWd2RnNraUtqYWI3YS91K2dXT2VwZ09kSUpwSDVObVVHZFcwbk1Ed2Rx?=
 =?utf-8?B?endyRGxiSStVWjdpTDZDbm1FMkE2YkJrNzdnTDRFRTdML2pEV2hSSEhOL1lx?=
 =?utf-8?B?bDEzUCtHQkk5WVpnd2o1NkdNVFk3WUI4SEI4cE1xZXFDVkk5NXRaa20vTlg0?=
 =?utf-8?B?Q3B3VUhJc2xEcTRlaUVEWUxOYWRsK1VHTnM4ektkT0grRkJaTUZmQURpVjlE?=
 =?utf-8?B?RUl6UHFraGFxMCthZ2tnbm0rcWwvQStTWFh6T29Tb2p3aFMxK1paL2dCUWxl?=
 =?utf-8?Q?YpAXRq5LLZP3f/IyJJWqaO0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074d8917-258b-4904-6c21-08d9fd0a24de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 11:37:06.1723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adQLSEEQGVhmGZidb4LpFxJPMp931FfjPbY2jYgDR4sBS8oWk6CTbx42tImEMcnuJus6TYM2UzMF2OHmGa/sSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7883

On 02.03.2022 16:00, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> and x2apic, on x86 hardware.
> No such features are currently implemented on AMD hardware.
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Note that this interface is intended to be compatible with AMD so that
> AVIC support can be introduced in a future patch. Unlike Intel that
> has multiple controls for APIC Virtualization, AMD has one global
> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
> control cannot be done on a common interface. Therefore, for xAPIC HW
> assisted virtualization support to be reported, HW must support
> virtualize_apic_accesses as well as apic_reg_virt.

Okay, here you now describe _what_ is being implemented, but I'm
afraid it still lacks justification (beyond making this re-usable for
AVIC, which imo can only be a secondary goal). You actually say ...

> For x2APIC HW
> assisted virtualization reporting, virtualize_x2apic_mode must be
> supported alongside apic_reg_virt and virtual_intr_delivery.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> 
> v4:
>  * Fallback to the original v2/v1 conditions for setting
>    assisted_xapic_available and assisted_x2apic_available so that in
>    the future APIC virtualization can be exposed on AMD hardware
>    since fine-graining of "AVIC" is not supported, i.e., AMD solely
>    uses "AVIC Enable". This also means that sysctl mimics what's
>    exposed in CPUID.

... more here: You claim similarity with CPUID. That's a possible route,
but we need to be clear that these CPUID flags are optimization hints
for the guest to use, while the new control is intended to be a functional
one. Hence it's not obvious that CPUID wants following, and not instead
the conditionals used in vmx_vlapic_msr_changed() (or yet something else).

What's worse though: What you say is true for x2APIC, but not for xAPIC.
Which effectively is in line with vmx_vlapic_msr_changed() and CPUID
handling also agreeing as far as x2APIC is concerned, but disagreeing on
the xAPIC side. I can only once again try to express that it may well be
that pre-existing code wants adjusting before actually making the changes
you're after.

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -343,6 +343,16 @@ static int vmx_init_vmcs_config(bool bsp)
>              MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>      }
>  
> +    /* Check whether hardware supports accelerated xapic and x2apic. */
> +    if ( bsp )
> +    {
> +        assisted_xapic_available = (cpu_has_vmx_virtualize_apic_accesses &&
> +                                    cpu_has_vmx_apic_reg_virt);
> +        assisted_x2apic_available = (cpu_has_vmx_virtualize_x2apic_mode &&
> +                                     cpu_has_vmx_apic_reg_virt &&
> +                                     cpu_has_vmx_virtual_intr_delivery);
> +    }

If the conditions were to stay as they are, I'd like to suggest pulling
out the cpu_has_vmx_apic_reg_virt into the enclosing if()'s condition.
Additionally I think the comment wants to contain a pointer to what this
wants to remain in sync with. That other side may then want to gain a
comment pointing back here.

Jan


