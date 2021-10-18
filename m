Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954104311F3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211784.369438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNmJ-0000H0-7M; Mon, 18 Oct 2021 08:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211784.369438; Mon, 18 Oct 2021 08:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNmJ-0000EP-40; Mon, 18 Oct 2021 08:13:51 +0000
Received: by outflank-mailman (input) for mailman id 211784;
 Mon, 18 Oct 2021 08:13:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcNmI-0000EJ-EV
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:13:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5255c4f8-2feb-11ec-82ce-12813bfff9fa;
 Mon, 18 Oct 2021 08:13:49 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-4TQnxubdOmid0gkNln7arQ-2; Mon, 18 Oct 2021 10:13:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 08:13:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:13:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P250CA0014.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 08:13:43 +0000
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
X-Inumbo-ID: 5255c4f8-2feb-11ec-82ce-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634544828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xlvw/4hZx1tozqsc0YYpIF3EOF4lf9Rp0LuzwCZv2yQ=;
	b=AlDE+aT/lVWgI1eqgBJywPCicocepsa2XFdobBsT+ns0qa8bYToJUGmM5MKwNn4qw69atm
	AOeArO88D4dGVIV6qiw0qiuhfT61fsbhOdMID/k30ieJgQB2hx8OLvNmvIcikcevAGrBhE
	Jy1o/2+An3Vr/KxMApFGFMy3rDnu9eI=
X-MC-Unique: 4TQnxubdOmid0gkNln7arQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRgIJ3bZz7KoCuGNicHZDKu+ihhn5/fFOosfN58T7Q69wnCJApAUWjw9rzcyYQsE2koUIbLZwX6isC2UUAp3Y1bMMvukbEbRLcCsatZLk50JbXM52D733UlySgGFW1Wtpz4RqOXiNHVWmJGdIl1IiTui0nzy8EUv2pSueFcaB0Wny/ShY0j3KqWQMjazhc4pTY70poAFuNoW6MOOuBau/lffxboj/U1ZHRVgE6/fOBFZg+wunyFDQvYRT4CaGP5MCPpc0nmsdeb7FrPsPIDPtuTGWpn5WRx6U4tOyUGLl39a9sITdGevQX+5KtHZ5qAVHvdoRQ6yKNA9hb4fNwbZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlvw/4hZx1tozqsc0YYpIF3EOF4lf9Rp0LuzwCZv2yQ=;
 b=RgDuqemzdys00wglV9NxqVCE7Fzci9yzMP1rm3/nMAR+mp+ku/xXK74etopq9mIu/RdQh5LSDuGM66wQJRycUbuIq3VZB89sTYChKqGzHbSFFEXWD8DTvb6AYuIj+WDP0knFqIw5P8ZDmJxoEnO4ItdvKxajdqc0O4ZLZiFwLGQJvGkbqm3ziQD/9eaHT9S4w/ycVNOsMwr1SMPi0ftwdzWpkY+ZZQVyz6jfJHKml4kx5qI+PmUR1ubAVEsyDT7QAhD8ERhomiZ260YB85jVDTGq17Cgay7wxINZBc7bn3jRYSCCD+TGQ445lSjCvBGsPUJHqpRwPIEBTIlV8/Bf3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Ping: [PATCH v2] x86/AMD: make HT range dynamic for Fam17 and up
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <36df1141-5c3b-6f8a-3a83-1f954b1e27a6@suse.com>
Message-ID: <84798d50-f362-f18d-a979-6ec973d95216@suse.com>
Date: Mon, 18 Oct 2021 10:13:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <36df1141-5c3b-6f8a-3a83-1f954b1e27a6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0014.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ffadb10-a0fb-4bbe-4ae4-08d9920f338a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5598DAE7119960F7E7DE6453B3BC9@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5rLoBp1l4Xm8Nf2gMKsaBj6RZaME+a4g6kp2V5rrTtQtcmQdL6FTrl0lIlFeihIlj18w3vXff7MS219NuLHu34xvC9EEx7ydIZYOiwaVuyEzfxAw/KYA1fw8pTNoCk1QqSQEL2iUGLFfUzRKCyXHs0h94TaA1aU0c2U3NizXCNSpcVGRg9iLlrGmdQM/WGTeK6x6ayHAEF3UZmY2JjcB/Id0VOPWCZGqEH/N4URFErs6OIb3ovM33El9Vrw4/lMlOHzfbuOBS5VUEmEuFUYEex7ZefItq8vTuJ1rsjUyzLIgUy8IeMzQjJ1911o+n82pObxcKxgpwewUG6/NLwu7Gwp47WbNXndK0kuEqr9cooeQK7+hsZtoSTki3QTARrCtTQ6q2KfpE9QG1T/02d1dn+4+Ev1NISeWH06K4ajsAldVd/Z8+OPdyU7tAcBeEvy6xX7r+Kth//+v2swtg2mXJH82gWQ2W5jnPEclfCKKK7KF7mzn+WnBUzX77BBWM5iXuJDn698rIyJc4VVJOGT4OlMgL0YEdjYNb7LewDiNG//8KQRPD7HR9zsLNG18YGVdCyOBPrhLZVPZ5vCRgIY561V5U+vi9HrG4VCqDxg1HgRlxdlVKjEXX8jmr36lKzMuje+gUBJqMTYzNqEqYt/wo42jHXxq8wI5+8pqO19s+ylYMvp/auYjdZOdoj/d4Vvuk6qt14DfYXI1RrsImTt9Q2PsUXqdvSXM0Nlh1cjKI1s4E33Xkswy/4EPtSvSrzbs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(36756003)(508600001)(16576012)(6486002)(31686004)(66556008)(26005)(66476007)(38100700002)(86362001)(5660300002)(8676002)(8936002)(31696002)(66946007)(2906002)(956004)(2616005)(83380400001)(316002)(110136005)(186003)(53546011)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1cvUUg2MU8wcGRrMVZzZ05VZlA0dmR5V05aMWVLdnZWeXVKNlQyMFp1am9B?=
 =?utf-8?B?bnBpSmlmUmVVeGUvaUlKTDA1ZGtNWEpEUzVPTmZOd24zaG8weG43RlBjNTdz?=
 =?utf-8?B?VnVPbzEyZUNidTVHQS8ySVAwUmJkYk5JTmk2UWlUcjNCaXlwRWxqdXkvRjZI?=
 =?utf-8?B?bWFtUlF1Smg2blJ6Z1pTSXcvMitUNUlGQUVRb0Jvd0dvQi9SSWxNR0N0dlNL?=
 =?utf-8?B?bXhsa2JTaUdPV052TGl5d0dQb21oL1ErOWFBemtOaEQ1VWtMQUlENWo2cFY4?=
 =?utf-8?B?bXh1bndrWVBGOFByM3hsSWJ5YW1TTkFRTkpENlZ4a2NqZ21jazNyWU91dGN6?=
 =?utf-8?B?U0V6ZE4wdE9JbVd3cDZDclRsck5maW1WYVNGeVFkRXQrNHdPSU5NaHc1T0Q2?=
 =?utf-8?B?TCtJSnllb0JHRzhzY1FOSjNybitlOW8rZ0ROcERYRjNnWFFCL3dvbXV3andO?=
 =?utf-8?B?LzkyanYrYXpoL3d0SE8vZ1FyT3JJbTdkTHlaT3J4UWRka2NaTFloTzd0VWNM?=
 =?utf-8?B?RS9WSEVNRDJVSE5DMEViT090eXRYQ3VSbWhOVmlvemwwZEtOcHZQMVVDUGlN?=
 =?utf-8?B?MVAvbkw2VndWV2hRblpTQ1hIM21PRHJuMERZOHo3YnlLSmp3VTlIT3VLcENO?=
 =?utf-8?B?Q0tORGQrQUFaNXpRUnhiK1g4OGs2c0Nld0F0UDhVT1E2QVc1eUtWTDY1dnVr?=
 =?utf-8?B?Wm1zbFJ1TmNCSGl0b28xU1UxNWRKVkF2TitmeUo1Tng1ZWc2T2Q5OVRDT24r?=
 =?utf-8?B?bTRkOHFKRDcvUjFtbE9nbGtPNHhXMHNKazlFL2l6TEI0M0V3NUVneTliK3hU?=
 =?utf-8?B?NklHN1cxeVZIMnllaGlJdmsyUlEyRkJCTGpJSldrS1pjaHYzT0R6WmVpa0p3?=
 =?utf-8?B?UHVCR3kvYXZJancxeE9hUlFMK3I4SWNSbWhtNnN5TVlsTzFSZzFxajAzZ3Va?=
 =?utf-8?B?RndrRENQNEJzdFpiUHFTbDVkaHNYNEE0bWY5T1RnZDZ6eUJxOTBHWkpaS1hT?=
 =?utf-8?B?SmR6UTQrZlQrZFcxMWJFcCtOMVVlSXlKaVMzM2NScFZjdW9hL0ZvNlVOL01R?=
 =?utf-8?B?NHZsYS83dzJWak5CYThYd252U0tlakx1Z2FUbGs1T2laVzV3RHUvTmlERVdI?=
 =?utf-8?B?R2h3OHNhY1pNbTFDTXBYRTBoTDE2dVgxUWg5Tm91eWEwVFNVcmVoN1ljbzJr?=
 =?utf-8?B?S1NsTkc2OVZodW9BR2wyaVAzV0VFc3p5d1FkRDRyVHFHZ1MvUzJ6SnE3b2Iy?=
 =?utf-8?B?OFRwTGxoRzZqOEFsdUJIU3R2dllCRGl1NDFLTXJDdjVHVllVZGxObisvS0JZ?=
 =?utf-8?B?ZE02Y042WVFTUkRIV2ZIcXpYem5WY0dSYitIZVdQZXptVUNtK2h3bnJHRVp5?=
 =?utf-8?B?OXFqYUV6YUkrQ2djWnR6L2FCMERWaVBuVmFzRHpLV0tPRGdOWTBzK2Z1RnRR?=
 =?utf-8?B?NnJ4cFAwbE4vQ3lQa21UYUNRcHNNbW1YN0Ywc3o2ODRvL2M2T2hoRStUbERN?=
 =?utf-8?B?SmttTy93WkFlZTR6b2pwUWVPbUxlMWJySGxhMlF3a0RrMTVJemtuaDBiR0pG?=
 =?utf-8?B?ZzJNVlJVa3NhNlhweDJUbjhnMXZ1TWxZL2M4ZHJrTmVUSEFvbVdrNXJJTWtB?=
 =?utf-8?B?MmhMUmg2ZWNyVk9nQkNsSkJXWCt1THpDb2V5VDA2aDFRV2V6SUZITzMzMlBG?=
 =?utf-8?B?Nlk4T21hZCt4LzJHWXA4bVlMYitwQVA3UWlJakloR0UvTjJvOVBIbW9Hc3I3?=
 =?utf-8?Q?9KLMP93IeqKzhTkx1tuUHQxH8hqWfpei58BGe6N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffadb10-a0fb-4bbe-4ae4-08d9920f338a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:13:43.7251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJmTWSmTFoOq1ar8RbHHmXkLL+dUqj/MGkVmkMS56FOPQybGwQZh2ak4DEnnHxTo4sOmuaZZWHfnIQzV1PxP4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

On 28.06.2021 13:48, Jan Beulich wrote:
> At the time of d838ac2539cf ("x86: don't allow Dom0 access to the HT
> address range") documentation correctly stated that the range was
> completely fixed. For Fam17 and newer, it lives at the top of physical
> address space, though.
> 
> To correctly determine the top of physical address space, we need to
> account for their physical address reduction, hence the calculation of
> paddr_bits also gets adjusted.
> 
> While for paddr_bits < 40 the HT range is completely hidden, there's no
> need to suppress the range insertion in that case: It'll just have no
> real meaning.
> 
> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Move adjustment last, to leave hap_paddr_bits unaffected. Add
>     comment.

If there are any further adjustments needed here (or if the whole
situation needs to be addressed differently altogether), could
respective requests please be voiced? Or else may I please ask for
an ack?

Jan

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -349,16 +349,23 @@ void __init early_cpu_init(void)
>  
>  	eax = cpuid_eax(0x80000000);
>  	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
> +		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
>  		eax = cpuid_eax(0x80000008);
> +
>  		paddr_bits = eax & 0xff;
>  		if (paddr_bits > PADDR_BITS)
>  			paddr_bits = PADDR_BITS;
> +
>  		vaddr_bits = (eax >> 8) & 0xff;
>  		if (vaddr_bits > VADDR_BITS)
>  			vaddr_bits = VADDR_BITS;
> +
>  		hap_paddr_bits = ((eax >> 16) & 0xff) ?: paddr_bits;
>  		if (hap_paddr_bits > PADDR_BITS)
>  			hap_paddr_bits = PADDR_BITS;
> +
> +		/* Account for SME's physical address space reduction. */
> +		paddr_bits -= (ebx >> 6) & 0x3f;
>  	}
>  
>  	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -524,8 +524,11 @@ int __init dom0_setup_permissions(struct
>                                           MSI_ADDR_DEST_ID_MASK));
>      /* HyperTransport range. */
>      if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
> -        rc |= iomem_deny_access(d, paddr_to_pfn(0xfdULL << 32),
> -                                paddr_to_pfn((1ULL << 40) - 1));
> +    {
> +        mfn = paddr_to_pfn(1UL <<
> +                           (boot_cpu_data.x86 < 0x17 ? 40 : paddr_bits));
> +        rc |= iomem_deny_access(d, mfn - paddr_to_pfn(3UL << 32), mfn - 1);
> +    }
>  
>      /* Remove access to E820_UNUSABLE I/O regions above 1MB. */
>      for ( i = 0; i < e820.nr_map; i++ )
> 
> 


