Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1AF7656ED
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571173.894395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2ZS-0007lH-4T; Thu, 27 Jul 2023 15:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571173.894395; Thu, 27 Jul 2023 15:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2ZS-0007j1-1k; Thu, 27 Jul 2023 15:06:30 +0000
Received: by outflank-mailman (input) for mailman id 571173;
 Thu, 27 Jul 2023 15:06:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP2ZQ-0007in-FW
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:06:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2815d524-2c8f-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 17:06:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8805.eurprd04.prod.outlook.com (2603:10a6:10:2e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 15:06:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 15:06:23 +0000
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
X-Inumbo-ID: 2815d524-2c8f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BATfU5EK254/ErXNuuUS8tDCxuhNP2IOfLA/y//g+FT7Lf1kDOBFUfLiLNYl268niSF/UiduA2dfbHK6GI4MIJarWPt/Zkv403IoNw4jndjSROWLZqp+QlL3a98WV71bW4rBLJMo+2qeoEEGGTFr5N/R8sfViyPGKaPAl3xBbsPVWYN0zsgmRxVJOmTfiw17NBX+ylXmBIilVH0f5YId7o/Vb38FcpL5WqFGAsliSVlrTjkJzD0H61NUKeNsNvZqju8Q0svIlqdNMDguSSTZ3y17dWJmFEqdIMDoPxPsN+TMmawobJqXbGsFdTpWYHw719T+4JW6/FgWkjHCTWWo1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S190/nkthK0y/DeQv0OlSOhUH6hhPHvCDOj/hWEuRfQ=;
 b=LNJRKS/98y2jpT6GJZvoZ7jvVapu8f4WD+EggN5ZI7XcM9HJOmaDK5at7Df4DWUkWcKfbkU/VIXtEVQP3asm25tticlV3EXk+EWhCKkEYHGwO1nEvhI4JirX6+WZaFXN+KNgXesH4ZQJIMacVH+WXOWqdpyRvMkh/4GPLASlJFbek+KSvrS5wuikooOeoveoOa/UJUu9/OJN1jJ1bVyWlo85Re/pQgTF/7ipOk2RMPXrRxLzytDvcTHJmzHjcTGLh2k+BTM3yvMmQMA8QieepUmU1TiWnhx3e+3H2oYC0zDrh1++/GEbs+tsNSsOSj9BZoqgxXz0ySmfiINfW/4kPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S190/nkthK0y/DeQv0OlSOhUH6hhPHvCDOj/hWEuRfQ=;
 b=VnJS6yKcyYkLuJwkdst21LnhZIPlv7vzw2PIJCkXV37eLzGkrb+GlaOLXHpj/ReStu4+C7DTPgTyl0dd6YnVDzmuEKNE8mS4uTbTjFoB1gHXuQH056Zwc5OumvPxUo56mMtNITA4ZAy4WkCRfmpbu1Cv2Jnrp2uBNRPasv8sQA/GuwQUSxVGoDkmYKeo66uwqdg3llUGzHIk9tyq1hlUTnkVNVt62QCz8SY0g2VVNSJyWjtR+7VIwN6HTy4gbMSG0OHVr2PhqM2x3mKlB7CGt2T/6KRZPQwm4zpGzkyfHLHke+Q8A70LJjxDgDRtWXzeHNRBjpKrxpsXd9FyCJF54Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9db05529-b4ed-89c0-a140-118c0ccf44bb@suse.com>
Date: Thu, 27 Jul 2023 17:06:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 2/4] x86/emulate: move a variable declaration to
 address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
 <bc3a28abf9f00bf67cf5ee64bd89e7d38e321c06.1690449587.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bc3a28abf9f00bf67cf5ee64bd89e7d38e321c06.1690449587.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1cf55c-db6c-41f3-f345-08db8eb30ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jwblc8zSlSxWcI6WcdnBbuksxmfgB1WXd8UC6VH+Vq1meexTpC6uNx40tszRosSrYvXR1oZIs3symbPEAhtFPjgjqVlQys7fpKcpj6N1sIwpTrgeQ9kSMy9SmPAlI2Q/nXIFHvJvxYXqqi4MwxuSxIJt44/xE1DcCTDmMFzvZ9V9J8diMZMaFrv9MCXCNAGd+/CJ/BP8UVltSg4DAr/2tyEuZGs1k5n/gXtxhD145LsF6DLKi+mz8QdEbIO128TWjjbu5hfiDgW9Tj8Zdx2s2/cH6U6vwskdb2+ACqqRnUztzy9EnRo8zLwrqa+dBpnuYj/ivw+5cn1kguHdQlok2K2LH5CmE8V7YZYR7lbrj3tCI8F4P/5jwN27aCESyEhFOyQPzGxcHrUWmPuaKrgO4EwAUNfqXYJlv+u/2Wgicz34wcPBxOBofot/8EJNfHTmi0SA6gFp4iIJr8mpcnfZaEvqA5QyFLDGoc/EfBFL1FKeGSGxGWYaGrN2ZWAP4jHR/IWOewEciSFZsUz33HSzZJW5uOLMkzHlSaim6Nr03z1sKuNCwM0Hg/A++r9ymcgrVUG+9r1BJi+wgKtlA/PZgPPQTZrg0NAWs72d16TTFyWByxaKHrPhrlo8GhUOg+cd08YVXJ7Qw5l7XfxTMhtJmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199021)(5660300002)(7416002)(6916009)(4326008)(66476007)(66946007)(66556008)(4744005)(316002)(2906002)(478600001)(54906003)(66899021)(8676002)(31686004)(8936002)(41300700001)(6486002)(86362001)(6512007)(31696002)(53546011)(6506007)(26005)(186003)(36756003)(38100700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXBtd21vanRSRTNvREV3S3VEMTh3V29oSDFaS1FPUUFKbGlQcEtTK0lXeVI5?=
 =?utf-8?B?M1g1V1hnSjZoNGQxZCs5c1BINWo4VzNsdTdZeU9MbGFTbDV3MFRGd2kwbWRF?=
 =?utf-8?B?T2YrbG4ySkQ5UjhDeHhkazRoOVE3YW96cWhhRW4rNTdIYXRteHF1TGVnem9r?=
 =?utf-8?B?ckc5Vm9IaEppQXoyV2tRaWEzMkJONSsrSXRXekczS2Rkb1pLRENiVk5Rb1BK?=
 =?utf-8?B?dXZDTzZ6Z3RIazJyQ3c0RHBmcjk5cGlaZ2QvVTc4ZmZpeHc2cEhqZGJDakx3?=
 =?utf-8?B?ejQ1SHJjdFU2bzZmbWRhcndWMlVJalFzTk05NkdIUmczcVBGRERVbXhtdE5J?=
 =?utf-8?B?NHhmYUF0K2tJbEFPRUVQRnJ4MGM4bTdZampxY3JzMkJXWHFwdHQ5MnlTSWY0?=
 =?utf-8?B?V3JiSVhaVGtIWlYrcUV6dTBVUndRYWxhYXV4ZTA2aFB5Rk52dUdXV2pnTE5J?=
 =?utf-8?B?R0JrZ2ZkTEhhVEpDTzA0S3h5elQ0NjFEb01PVXpXRGgzVVh0UGJwd2I5V3Er?=
 =?utf-8?B?dkJHVlhFTU13QW94SDlZUTBmRjQxeW56YmtLb0JXZEdoNXB6ZzBITVNJWFZl?=
 =?utf-8?B?alBGS3c3ZVl1MWZJZ3N4NlowNDNUZXhxc0pGVjQybVV4RmFORFhYQWtycnFl?=
 =?utf-8?B?WVFJM2pyWU9HWjJYNzM3eWxDZ29sanVuU1lIRGVlUEp1S3NJQjIyZGN0QWls?=
 =?utf-8?B?MnUzMFRVTjAxdEcxeldNSEloTGg3Uk1HaFAzMndJOGRWMjRYN1dPZXdxR2FE?=
 =?utf-8?B?RHF3eDJKTngvYUhCdjBoRlFNYUoxdTJqTU5OQjNsaDBPeElFZ0pnVEd5WFpr?=
 =?utf-8?B?dUVkZVdKRXpkM1JBaHE1Rlo0MEdLUVV1aUxldkVnaW12K3hvN1FCQUF0andQ?=
 =?utf-8?B?VGk4L1B1bFhYYklHbzg4d1Zlc2tnek5nampneVBzNDIvWC9mOW9ZWWRGc29F?=
 =?utf-8?B?aWs3RVF3QmFhNzBWcEpMK0ZpcFZBRmkxdFpQRnpyaTdKdThoOTRsN0NJZytm?=
 =?utf-8?B?RnNOMG1PNGFRUXFrZFZpR1ErWUp0UC9LaFI0eUlwZzNHMk00UGdXZWxoZU9G?=
 =?utf-8?B?SG1jVUtTVFFVcldWU0ZiY1E3d3NuNU1obUw3aHJZTHc4L1hXTUY4Q1Nnb05j?=
 =?utf-8?B?RGJmYTl5dUtzV3c4a0ozZXpaZUQvZzM0NHhtUE95alV3UmtUaFo5ZGhuSDd5?=
 =?utf-8?B?dW1Od2cwTDF5WHBWRjRPQ0o2a0twOXRTbXJ2aUNWYXM1SHpMaXFiWkNWeXlL?=
 =?utf-8?B?eXp0eXorek1tZmwxQWMvb1M4STFJd05iQS9BZUViZ2lPKzc0eCtXemlVV3J0?=
 =?utf-8?B?cGV5Zks1aklHWVVlRHVaSDh6eVJMdGNFN3huL3M0UFZvRTVQQWZnanJ1MndJ?=
 =?utf-8?B?eHpQL1hoYTB5UjRzZWkyOVp2eXBxY2lrTFRNdndYUjVWRlFEYzR2NGxueFZH?=
 =?utf-8?B?S1g4UVRIZnFyYm9BZGVtYUpmdkd4VTNMNUIwUitLTnZRWCt2cUhudnhaSG8r?=
 =?utf-8?B?Uk9kU3JEMVQ0R09MN29xQTRZVklPVVcwUjRib2tZSTBhSVRMMDB3TzNEdmpN?=
 =?utf-8?B?bTRjNmZSYXNLd3YrRmFYQXR6d1hwQml1NUgzdVB0VDB0djNhT1hwdTdoWVh0?=
 =?utf-8?B?K0dGVnNLZ044cCtVWHZVVEVJK2YvVSs3cFBIS0d1SkhCa0JKVy9KWlh1Z2p6?=
 =?utf-8?B?OHFxMUJhWU1mTGF2T2gxbGNBRStoYlRhcFU1UjNPdFQyWnpob0FjQWNHeFhu?=
 =?utf-8?B?ekxkbUJCMnlRYTRkcTNjYmtYMTg5aExTczUwbmo5bjZVdEgwQTZVeFAxK2Js?=
 =?utf-8?B?aThISGhmeDN1WmF1NHMxMGQwdWRCTE9TSHJJd0VQMVVQL21UNTJTSWJBVW5s?=
 =?utf-8?B?aGh2aHV3L3llWFVmRk80NDd0S0xGS0RrbEg1QWdoSkFlb3VtOElaVW0xUDNS?=
 =?utf-8?B?K0tGUWtPdVRmeFFEK3hYMnNJV3JWNVAyM3FjUTQ2emtnNzlWL05YWXVXSVNY?=
 =?utf-8?B?SXJ4a0E5eWRqd2VYOWhXM1VzdEk5elpiK0dQOTJqb1RENWt1WVNlNStZOVhG?=
 =?utf-8?B?cEZycTNVbHdRYnVhVW9PN3dpamRLTU0ray9xUFllTWdPbHg5RVlFZ0pQZ3NZ?=
 =?utf-8?Q?/8ENHfkfOqlornBIEW9EheBT8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1cf55c-db6c-41f3-f345-08db8eb30ae0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 15:06:23.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcA5qNye7s59Me8rU3s+AxLh1pJTb+7PvtHVsg1cogi4kFXyvTGwKByLuw0cDqLFyvBUo+ayw3Dp4Q4T2UNGvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8805

On 27.07.2023 12:48, Nicola Vetrini wrote:
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2024,15 +2024,15 @@ static int cf_check hvmemul_rep_stos(
>  
>      switch ( p2mt )
>      {
> -        unsigned long bytes;
>          char *buf;
>  
>      default:
>          /* Allocate temporary buffer. */
>          for ( ; ; )
>          {
> -            bytes = *reps * bytes_per_rep;
> -            buf = xmalloc_bytes(bytes);
> +            unsigned long bytes_tmp;
> +            bytes_tmp = *reps * bytes_per_rep;
> +            buf = xmalloc_bytes(bytes_tmp);
>              if ( buf || *reps <= 1 )
>                  break;
>              *reps >>= 1;

This wants dealing with differently - the outer scope variable is unused
(only written to) afaics. Eliminating it will, aiui, address another
violation at the same time. And then the same in hvmemul_rep_movs(), just
that there the variable itself needs to survive. I guess I'll make a
patch ...

Jan

