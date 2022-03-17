Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E83A4DC373
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 10:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291454.494646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUmtv-000458-3g; Thu, 17 Mar 2022 09:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291454.494646; Thu, 17 Mar 2022 09:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUmtu-00042S-WD; Thu, 17 Mar 2022 09:58:35 +0000
Received: by outflank-mailman (input) for mailman id 291454;
 Thu, 17 Mar 2022 09:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUmts-00042M-SX
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 09:58:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccacd163-a5d8-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 10:58:31 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-rOs40LkkPPubQGGw5NAyUQ-1; Thu, 17 Mar 2022 10:58:29 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR04MB3068.eurprd04.prod.outlook.com (2603:10a6:7:21::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.29; Thu, 17 Mar
 2022 09:58:25 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 09:58:24 +0000
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
X-Inumbo-ID: ccacd163-a5d8-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647511110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZklsvcfisBfRstzsvUpH+Z1Nwq1WZ+inWhlObqE1dg8=;
	b=gPa364GkehT7UNV3TiQ6VxKe/MmnxJDJ8pAPSOy/ohFfj73kKZS3k5mDAps57UyDbXtZSx
	pUKTfYVsfeDljxu7Z4u/9ECFkMlGDchHpXvwVXB7fYEE4CFtFiih3n73IB/uHGKl8s94+z
	cYGvZjZNHGCcZmorGmbm5oCFy4COnzs=
X-MC-Unique: rOs40LkkPPubQGGw5NAyUQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mexw3tiNTs+OOoCSiERhjezTsbEWrjJ5rYP4XvEuamv2ENkL8MHgXN+z5C1ozIKbYdorUTOLF1sfKuiNk+txDOmqd4d12pG4d4pj8bjI596P1o9G7OGanxWj5cKVhW/bYxm7T6cLjljopSF+9pKcTtMzH0PeRvT2voNsT7ThOouGgwU2QFHTBj9g6Jul2C1pbF6xz9vTZajAlBTymxtvmG/fr4h/ukzuEsfiPq6b7cjLVirOifbu5wqrLYNcKR3OAgZfdSjrxMMj2sueCN5qn12yUt/iYcgKUFOSDU5q9YNdnQoDyB4JXw4Mk331ZrRPz+Vcg/KZ3wgsA5AXsfZ7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZklsvcfisBfRstzsvUpH+Z1Nwq1WZ+inWhlObqE1dg8=;
 b=IEMTwPKXZNDMyaBukM5cjV/coq+fUd0qcZK7J0VB04CYoRl7/2PqN1CqvqOiZ/0l2pWT/AEvAadjOHYfuifQGZXm5jo51AjZyw2iMX1SWy80c19/jfrSMdvcVqL8ojn/S7sbkgQ7N2FYbHkq5zlgUli616DIrT67494pxrLxeYmYKLlfWwhcGApy01vPUcmlq6k/3AZA4idfG5xhxhLEUsTQ1CDv6utxGIctJDB3kgHY7/nU2rrepYi7cNGU6W3DqjG9KAzeo0RTWarLSt9adOw93J0jsRPGs8gCb0u8dWo5u+NSHIHQImHv6n21p1w4KNMmJpqfXm8td6CMexo35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33b82344-733f-8567-5b6d-5a972ebc367a@suse.com>
Date: Thu, 17 Mar 2022 10:58:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/spec-ctrl: Knobs for STIBP and PSFD, and follow
 hardware STIBP hint
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220316140035.32057-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220316140035.32057-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0053.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::33) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a79a0db3-8921-42c5-4993-08da07fcad3f
X-MS-TrafficTypeDiagnostic: HE1PR04MB3068:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB306840E42C6A72A1A4B1A9EAB3129@HE1PR04MB3068.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BAudGUNu8C5+Z9BR89pDj3wuEpGSyu+C7eIL2mCWNz4RScgyciIV0wpzF70d2XprAC7spHUp4rYSWlEfMUFTX63IAtnt+21ko05bqNvmE1Kn21X3I6Bd6tPUW+GwbTHUnHf5lCXNgGnCLOfjqGK7iD66QigYSQwP5eGsG/chd2EHAzaEka/0MZj3tmlRpEsPqIEfNGW1zLCq9NUdfIMBqWapp72PcyjQ0Zl+D1a1StDcqkp8UrySzgcxG//B+x2cHxZ85xXGwwRJao3jHdIN9PLigO2fKfRQ5eDI4w9U4uYPDJ0bmNKmgE2Eu/QRBq0yModBhtYDJQ87Rb/RXoClvyZ4tp9pRtn0WQEFWspsoxQlWE2CSIAhWqdDE5hBT6u6rJYtVp0fKzxSsBNGo6FT+hsune7+thvihrh7/V6kT5fpZGcEJDRWV3L6EuBp8uiHILEtivw8QQfSogg89S3t5GbB7AcbelDz5oRptmLQYgF4Tc6skhDdAy4c1sWm++SlATDSvge6lbzA3nNsNt2O4ICjUgbb9myBgji2qnTOOozPApCyrJCKl1x79+cB9pdo3Icnu9ZB7vHL7dpG52/jxuWkmfGg9trl8jYO+tdjaAFNcf1RiQEiMsoEbti1j0HIWA1gpasSDzDB2TcAtCYz8ENV6CY4S0YgwBt9FGqj/zSkIs80+n4hLI8OxsqMOf3xty7nj/yCulTXLhU/6LyvK7Cp8279O23v6ZjW8WiEQkJag2Nz9IZXMfbUfrLZOn4cg2wUnNLqcqEO0CY5iNeouQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(83380400001)(66556008)(2616005)(4326008)(186003)(8676002)(66476007)(66946007)(31696002)(6486002)(54906003)(6916009)(86362001)(508600001)(53546011)(316002)(6512007)(6506007)(8936002)(36756003)(31686004)(2906002)(5660300002)(38100700002)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWZhK1E5Z1hvV24yck5RcmtFbUFSQUtmeFh3SE9rQkU1OW1XV2hvei9LQ0F5?=
 =?utf-8?B?bEFHY1A4dG9sa01HeW1LWTZJWGs4ZHpEQVZmdHJFOVhjNHY3OWF2Si92anps?=
 =?utf-8?B?aDI0cGJubUFRbnZUV3B3T0gySzNuNXZGblpXWlR6aFVrV29yRGw2c21QU3Zn?=
 =?utf-8?B?d09Sc1MvemIxeEVHRFAvNFU3MDNuRE5rdFBvRFN4VkoyZDRhdTNGNWNTcmNF?=
 =?utf-8?B?OERGNjR0ZmF3NFI5WEJVYWJEMFdMcUM2Wm8zdEJESHJFOG5HaysyZVZyYzBu?=
 =?utf-8?B?M3FJUm92ZXhPREVIMmQvTHNRVXhnTUs4eFV4VWxmN3NwODZkQlBjNlFDSlVJ?=
 =?utf-8?B?WGN1dmF5OHJEbDNPWWZZS0paeDlFVUcrekxicTlKL25WcWZMVkFKdTV0d2t3?=
 =?utf-8?B?SUZ4Tm5UQXpZNEdoY0ZNWUs5c2FPbGd2NllldGxEWDJ1VjQ3U2JQQ3FQZE15?=
 =?utf-8?B?eU56UjFCMGJ0eUx4Znl5TnZ6QjhNeThmckt6amUyZk0wLzV5WXlOVVVwcWJL?=
 =?utf-8?B?Tmd0a3VEc0tRS2hRVmpxdFNTK0FpQmZJbUxhbU9Hb05DR2h3VHJDWmk3T01r?=
 =?utf-8?B?RXpKKzBuVkVQbGRYY3l0U3NtUk1nTmpOMGhpVmdLVk10dGFEa2FKRXJPR0J1?=
 =?utf-8?B?SWRKVGJTei9MZ1cwUTAxa2xkeHlIeDJRNGdpcmlZODZReWJtOGlOOGRqVFh6?=
 =?utf-8?B?Mjk1WDVJcWlmbTZEeHJkRy92NE9TbDR4bHZPNUdENmtRT3JvQ1d3QVNBZGhh?=
 =?utf-8?B?WVFOUEIzMHdUS2dzR2pEVUl5RWc1R0lNYkVtWTAxTzQ3UFRTeVFIdzhVVmEr?=
 =?utf-8?B?TFFjWU9qd3B6Zmx6bWtYNEl5b0xPZXRkdnJTVGlCcmJ2eUQzcDJUQ2ZLbG5K?=
 =?utf-8?B?a21wRUd1KzIzMk91M3NSWXF1dE16OVlrYklXTEt3Y0Nob2pWK3NsbS83a2Jk?=
 =?utf-8?B?eGlHVG9pS2kwWWxZeXRVZE5Hem5jbkNzWjlRckpwN1BhaVRYdHAxM1pjRm1t?=
 =?utf-8?B?R3VTQUFoSTFVOUQ0K0JnNG9GOENJQ0hleVR4VS8vUng0QzJraU1ycTUrYVpQ?=
 =?utf-8?B?UDI3QlJpSC9HazJHQk1tcGtGcnMwcmpkWEhlRXVXcDdoWVhSTWtXbVJVamNt?=
 =?utf-8?B?Q1JoKzhPNzNKbVUrZUZHeHlSZ0ZHRjdmMHRlbmltOWRHdndpeWNvRXN3TVVx?=
 =?utf-8?B?aFdUZUMyNnBCRk5FVUlnVVhZNzJreUhEb1BoMExEZlNqamMvSEx4Zmg4dUpH?=
 =?utf-8?B?NHhOWFh1WmdTZzlUcU4rVTZ0OFFDL0Vtb3FoV2p1WldBYkpYRHVHczBKUG8z?=
 =?utf-8?B?NjRhMjNVNTk4dU55aC8xV0syVGNHYTVyWCtaNFViNUJGMWRNUDBTZGpNQ2FC?=
 =?utf-8?B?ZElBeWFYSGFUMkIreXdIb1pvS09lK2ZsdHYzSzg4ZUlzcXQvWEFjRFduaUxJ?=
 =?utf-8?B?TTJzSVlrUk5BSWVZZkFWcVhPTTl2ekMwR1FPQkxHcWJsY084YllGL2FneENQ?=
 =?utf-8?B?VE9yejdFRUlRNFlMeEtaMkh3dDdLNmsvTlNTRm9MS2twUDVZcitpUnNoVlQz?=
 =?utf-8?B?SENNa0FIek9MWnpSM214YzIvdzQ3WCtqeDhJYmh1djdrcVBueVcxMVNlM1JT?=
 =?utf-8?B?eGRUNy85eE5EV1FOTjB3WWdFYmpDTUVhOGp5N3gvKzFKNnhDZnFnY01jSm01?=
 =?utf-8?B?Z1FMcVVaajdFWFkrclZoZkdhYWNtQ1EydnBveUk0UlVZNzVzdHZDcnFYeVFV?=
 =?utf-8?B?c0doMHZUdUF5bTBuMmRMMG9oeFliWnRvbWRqY081UEdOSWl4RDVVK2dRbEZO?=
 =?utf-8?B?NldrVmxpUGtRaDJIak1zdzVaeHB2OWZRbTVHMUtpMXdpTXVXaVhWOEh4N3JV?=
 =?utf-8?B?QkFSOURtUElwZVdFQStzTXJhSjRhZWhjb3lnQ3JjV21IcGpBQ0pobDRybXJI?=
 =?utf-8?Q?E7NeeAgpe3A2THOBaxZH99XyL/5zg2wy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79a0db3-8921-42c5-4993-08da07fcad3f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 09:58:24.7823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSq3WOJtIugLDpinnHPa7Llb+Sj4ltuPtDk4PHgD8302KdcEnT0Mtp1Lxtxcs+tlbrPDn8lQFlHhugpNaWqJuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3068

On 16.03.2022 15:00, Andrew Cooper wrote:
> STIBP and PSFD are slightly weird bits, because they're both implied by other
> bits in MSR_SPEC_CTRL.  Add fine grain controls for them, and take the
> implications into account when setting IBRS/SSBD.
> 
> Rearrange the IBPB text/variables/logic to keep all the MSR_SPEC_CTRL bits
> together, for consistency.
> 
> However, AMD have a hardware hint CPUID bit recommending that STIBP be set
> uniaterally.  This is advertised on Zen3, so follow the recommendation.  This
> is the only default change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

In principle
Reviewed-by: Jan Beulich <jbeulich@suse.com>
but I have two comments:

> @@ -170,12 +174,18 @@ static int __init cf_check parse_spec_ctrl(const char *s)
>              else
>                  rc = -EINVAL;
>          }
> +
>          else if ( (val = parse_boolean("ibrs", s, ss)) >= 0 )
>              opt_ibrs = val;
> -        else if ( (val = parse_boolean("ibpb", s, ss)) >= 0 )
> -            opt_ibpb = val;
> +        else if ( (val = parse_boolean("stibp", s, ss)) >= 0 )
> +            opt_stibp = val;
>          else if ( (val = parse_boolean("ssbd", s, ss)) >= 0 )
>              opt_ssbd = val;
> +        else if ( (val = parse_boolean("psfd", s, ss)) >= 0 )
> +            opt_psfd = val;
> +
> +        else if ( (val = parse_boolean("ibpb", s, ss)) >= 0 )
> +            opt_ibpb = val;
>          else if ( (val = parse_boolean("eager-fpu", s, ss)) >= 0 )
>              opt_eager_fpu = val;
>          else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )

Personally I find blank lines ahead of "else if" misleading. Could I
talk you into moving ibrs+stibp and ssbd+psfd close to the end of this
(immediately ahead of "else"), prefixing each pair with a comment about
one feature implying the other (and hence the comments replacing the
blank lines)?

Otoh I notice that we already have blank lines elsewhere in the middle
if this block of code, but at least there they're accompanied by a
comment making more obvious why there is such separation. Which means
as an intermediate approach I'd be okay with no re-ordering, but with
comments added.

> @@ -1070,12 +1083,50 @@ void __init init_speculation_mitigations(void)
>  
>      /* If we have IBRS available, see whether we should use it. */
>      if ( has_spec_ctrl && ibrs )
> +    {
> +        /* IBRS implies STIBP.  */
> +        if ( opt_stibp == -1 )
> +            opt_stibp = 1;
> +
>          default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
> +    }
> +
> +    /* Use STIBP by default if the hardware hint is set. */
> +    if ( opt_stibp == -1 && boot_cpu_has(X86_FEATURE_STIBP_ALWAYS) )
> +        opt_stibp = 1;
> +
> +    /*
> +     * Otherwise, don't use STIBP by default.  It has some severe performance
> +     * implications on older hardware.
> +     */
> +    if ( opt_stibp == -1 )
> +        opt_stibp = 0;

I'd find this easier to read if written along the lines of

    if ( opt_stibp == -1 )
    {
        /*
         * Use STIBP by default if the hardware hint is set.  Otherwise,
         * don't use STIBP by default.  It has some severe performance
         * implications on older hardware.
         */
        opt_stibp = !!boot_cpu_has(X86_FEATURE_STIBP_ALWAYS);
    }

FTAOD I'm not going to insist on either adjustment.

Jan


