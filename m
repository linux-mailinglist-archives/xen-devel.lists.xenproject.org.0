Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847734C2E08
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 15:16:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278319.475516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNEuo-00061o-OS; Thu, 24 Feb 2022 14:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278319.475516; Thu, 24 Feb 2022 14:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNEuo-0005z5-LF; Thu, 24 Feb 2022 14:16:18 +0000
Received: by outflank-mailman (input) for mailman id 278319;
 Thu, 24 Feb 2022 14:16:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNEum-0005yz-VN
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 14:16:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53d7e077-957c-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 15:16:15 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-9wXxfC1kN4S2oaTK5brpdA-2; Thu, 24 Feb 2022 15:16:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4777.eurprd04.prod.outlook.com (2603:10a6:10:15::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 14:16:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 14:16:11 +0000
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
X-Inumbo-ID: 53d7e077-957c-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645712175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PM/GDhpfC64e+DXbihrc4fpa1OhHEQcfKhNwcLWZrhQ=;
	b=lCg+IZkjvYMPXUoDd8yrZJNXMVy97iukF3TrrTeruCxzaH1OL9Iv+d148am+Y574wj3SMN
	jZwPqJIQbJlFqibatelfTkeX24A6ysh0ABD5HTsA/YncJCH+7koqyLbDx/57BEQ93TGYuB
	0GlyUeU1//Zf08r/qBow400a328ocJ0=
X-MC-Unique: 9wXxfC1kN4S2oaTK5brpdA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOW/zDNk34gQKHntulfifCnAraKbj4so/acFxeh6iA6ffWr9zJHykQwO6Ywf6SBK8lKE1GX25sYVTIJJCnG7M12FhcEPMqrspmgxHL1Y6rV0Ad8vMsjof0A4fh8Y8oroQ+EthPU/jk0BJCkCwUjxxcGmuBJMo8XQJrC2qvmg5DS2OxrHPMiIN64afuIgH/C9blaik5UBv+tWZWxFRhYDcpedoxc8TUqOHrCIffeznkCc4q2i8i8TCiP6gjkjmVw+QFOVm08H0UUgmcwBcO2ogEDEITbLcVOlypHtRtH84fpWo4Cfy8E5BOMROoQ6SvZE6QUZ5chO2vr7KOnxuCjpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM/GDhpfC64e+DXbihrc4fpa1OhHEQcfKhNwcLWZrhQ=;
 b=NOrLWH8Cd11JpvziSI/3VHmSoPRbzuk71vGt9SuMbX1kd1wtl0NeHn6nRhqfSFc45BiJ9T61vkJH0TDorYJBp595c0wyH98uI+Fwx5N6VHuImcLt+e5mbEaIOUNImf47JyTR0OCzM17H6B/gTC2d61hKzb7+ZIFHsW/Z/SkGPOkWlWwRaXodXFR63hz/SkpBtb7760JOL4AQn4p/ckD2R4YbCK/cLSt35uWKLY1+e7UsVhqBHItErYTcX8jYxZoNikWJGI+ymbimBqHB4IjUmJHQufjDVp4EP+bZYlVQjx4s39K2xkJokPKICTxA1IKKWt/cGio4p5cF4pceGP1O/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b83773ec-c97a-7aea-e61a-c2e34b270816@suse.com>
Date: Thu, 24 Feb 2022 15:16:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-3-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220218172943.12182-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0040.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8776d6d0-2718-4bf3-9b5c-08d9f7a03528
X-MS-TrafficTypeDiagnostic: DB7PR04MB4777:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB47776DE5FBB8004817C91D44B33D9@DB7PR04MB4777.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U/pb9r8PjY9mUp8DehDwMlSFU1hY7NGASAfMbozoLuhsSnzORNhv69XJvx4lzOKLVUfmyqpAoIyclWoHkzv8Qteyv4S8mqPsDQT/mIw3Kk4+BvhuWlol+gLn7QCz/f7PTQH1OxEJvCjBxCTzLjaloApLMos/TQzeHD0p6Z7jMdmb4NNHEvpootoTwCWYCzvLXRHAf2zpCEW/ANeHu6w1ecUWypSca/I1jkCFDZzAumb4vmRyfWyPfOLa2IMWYNQnWIzfp/a3840yHcyseszET926jQa2Z1tS51WFDZJci8sQQFarkfnkL4Dy2mcXRDcqDr/zpbsfKkqfKuwMbdXl6y3zkjqaHXos+VAlq7BczaHB4xVKfnPKC6FspEWKjSWopIsaq3u4ls5vjIB2vIWNi43QP1J0PewF32DNP8itab5edYQX/Cym8PS27gQQzPFBuKlDLc6jdlw8MTkxr/JJonIYWpdvB9DdbHV37ot67AKZ/EWUb1GYtgesFPL/voUy3mcA5u2c+ZyG8PEla9PKw8z5lIzkpZvDbvMBazKFzGCe2oDOkrsStHwCFxTfYJQaaLG1aluxjK41fRY/eWmlLR7V/ezgAhSlemWzXFq4RS/93IDD8mFiCDoiMog7CJJrzQbieWdM2RHqXeAJ/SgCkc5d70f0dYDNyYM5oJVt3RReCUHQrFkZVR/sgplcfOi3CdjGDG3SPC3hOB15NorWWoZquoACNk8Dw2abPQ/O5Vnvd394XGbuEqfHP579NWCS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(26005)(2616005)(36756003)(6512007)(8936002)(186003)(86362001)(6506007)(7416002)(31686004)(6486002)(8676002)(66556008)(83380400001)(5660300002)(54906003)(508600001)(53546011)(4326008)(66476007)(66946007)(6666004)(31696002)(38100700002)(6916009)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVVKd2lqVE5rMmhoTUFsb08xTDhOTWVDY1BMeGtYTWJNSGRYQXAxNmVtZVh4?=
 =?utf-8?B?d1oxQXdTbHQxMFBzRUcwb2x4OGg0eW9mUzFPNGRUMCtTSW8zUGc0UTlCbk9p?=
 =?utf-8?B?dWZGZ0xFeHVwRkRPcklGNUp1K1R6N3puQ0xHKzF0RXRSUzdwdEFLcGF0R3Br?=
 =?utf-8?B?SGduS1ZObVp5OUJZVEpiK08wZThieUxzZlBBbkNRaDhVeUNLQWVDNmdNZkNa?=
 =?utf-8?B?dmFOdjFlSmFPdWhkL0tIb29jQWlod0lCVFpmYjZQT2c3dnpjdm1zcVpEYnBs?=
 =?utf-8?B?T3hKanN3WjN1YUZsb1JhWmZrRWIzc2ZCV0I4RTZzUlJPMEV3QndhUDQ1NjhV?=
 =?utf-8?B?TjJQVDZxN29RQUtJTys1VWZPN1o2U3JOZkxsUmoyazFsR0NMTmFXNnJjZ0Uz?=
 =?utf-8?B?N01XbUlWL3U5TC9GWTUzS1FwM3M5UFhGWkI0K3ZsRU9RaWZtUkdJdi8wTlcx?=
 =?utf-8?B?c2I4dDVKdWRZdC9hNUs3YzJ2SGtuSVRLd1pZR3J5ZkZsUzNRTmlJdlRjbkVp?=
 =?utf-8?B?dmtCVDdFVTRGd2FGRnBqQ2gvM1h3cXpXZDZMU041OTRxS1BnZzNJS09ndksr?=
 =?utf-8?B?bmEzSjQvMnlDN25XRFdURjBhMHRtWVZMRFVzdTcxY1pGc2hIdG1rTUE4R0VG?=
 =?utf-8?B?MmJEc0xITHNiRU9VeHFuVmpTbmtaRDNPUStUVW5MWnkyODFWS2VlcmhVWjZr?=
 =?utf-8?B?b0pqbXo1dlVGb1BOVTRyaXFUd0EwcEIrdXdwdEdDelJ0Z3FFdGk5REFIMzFP?=
 =?utf-8?B?S0VueHV5K1JBTDNZNE5RTFpwUlpHdnQwWEJwZUhqTnlrQ25NMk5HSjNGcGxL?=
 =?utf-8?B?eEhmeVdLSC8ydXFuOWV3ZjRXbmJ4S1hpeWYraG5ZSmZlZTVqa2JDOXNBQ0Vx?=
 =?utf-8?B?aGxKcW1vZmRZcDlqcXRwZkVzeUFUcXVMa2NPR3dsYlJuN0Q2VkJGZTQ5T0lj?=
 =?utf-8?B?bi9PUFI2STlocTlWSzExU2tFNjFBM1k1ZjRlNUt6TEFEbVF1Rm0reGczajYx?=
 =?utf-8?B?SlJBemxzVHhvL0pHM2hjVnMvZFE4d2xZS3AyMHZyZ3hzaUc4RVV3anI0cnV5?=
 =?utf-8?B?dkFlVFBMVitHQTdKd0MyMG83VS9UakJ6YnppMmpPSlMwSnVBa080VVpGUjUv?=
 =?utf-8?B?UW5BZnowT01DV2hGcHBrY2J2RkdVTW10U1RVSnBHS2I3RitXUjJ3TEtwZEh4?=
 =?utf-8?B?VWdZMEdGWkY4bnJYak45M1JrUjdYM1p4anhxSGJpcWVZRmlQUytOQ3ZMU2c3?=
 =?utf-8?B?SzMvTFhwcVg3Y08ySGI2NVZ0bExoRXAxZ3VLWUlCT0dnVEt2aGowTzFyTDZw?=
 =?utf-8?B?ZGo0R2RjRUhKbGpwMTJ6bzU3VUgwdSs0QjRiVVJyWmdhRU5xb3VCYTVVc3Nr?=
 =?utf-8?B?RC8yTHVLV3NKMmVJbU5TZG9FbW1zV0xaRGhBUTNFd3R0bm9UeFBNeG85RHZ3?=
 =?utf-8?B?Uys0RjhudXdEcFJBcXFDZWVoZ1lOMk9rMjhsRlY3b0I0WEZaVWk1bUF5aC8z?=
 =?utf-8?B?N2tQNERqU2NFUWZFYk8wYjcyUjdHUVJqbHBYU0Q4SmFqOC9tSTNhTnRKLy8v?=
 =?utf-8?B?U0FlNURvR2lRRTNiaGU3Z0hyQ3hTc3UrSHBZd1FmK3lVSmN5eXdwMkFTYnBr?=
 =?utf-8?B?VHMxeElWQmllMFZPaHpXTkZ3UURVQnRIR3h6UHlZaE1NT0cveGZYU202NldW?=
 =?utf-8?B?UzBuSVg5aVIxbS85WHpHNHRKL1gyV2FLREc3QjR2Y29hZ3RGdmhFUkRaa3lt?=
 =?utf-8?B?ZHJPdTN4azgzY28ybUs5dlR1Q200cUJ2S0RsVlBGOGRQSUVDcElYeHIvdEE5?=
 =?utf-8?B?ZnpUM0NqZW9DZS9tOEJNR2tmd0hFQS92OUJVZUhUMTA4bElINVFCT2UyYzU5?=
 =?utf-8?B?TGMwbHRNMC9MdjRacm5xT2dsN2t5eTVzaG01MmxIeENGQkoxT2VvS1ZRS1ls?=
 =?utf-8?B?RWQ0SXZwZ1V3cFpTcklEbTVBQ045Y0pCUURyY0RSMmlUQXJHMXRRZFRnQmRj?=
 =?utf-8?B?MmgzMzlERUxCbXBneHdNc1U4S0hnbTQ1Y05ueWZ5bG4wV3BPNE5WTXVTdEhx?=
 =?utf-8?B?NEFCOUhiN0s5OXdic0FCbTQ1MzdhZ3IyYjZ2RHhFVlR0YXh4bnUxblRjNkY0?=
 =?utf-8?B?WngxTWw5dE1mcnlCQWJjd2ZpYkh1NHZPZ0ExWWxOV0U3VnEyR3BNVy8xakFw?=
 =?utf-8?Q?U8wUkfNmfmbl5An7X6CgYc0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8776d6d0-2718-4bf3-9b5c-08d9f7a03528
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 14:16:11.1442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W58BZoSCaNiv8WWmdeE3kHd6kHiu6MktkAaRnEHkeSjei0/7LymgOo6E7QWVOR1QwTiFcwCvWDFDk4bobko00g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4777

On 18.02.2022 18:29, Jane Malalane wrote:
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3333,15 +3333,15 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
>  
>  void vmx_vlapic_msr_changed(struct vcpu *v)
>  {
> -    int virtualize_x2apic_mode;
> +    bool virtualize_x2apic_mode;
>      struct vlapic *vlapic = vcpu_vlapic(v);
>      unsigned int msr;
>  
>      virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
>                                  cpu_has_vmx_virtual_intr_delivery) &&
> -                               cpu_has_vmx_virtualize_x2apic_mode );
> +                               v->domain->arch.hvm.assisted_x2apic );

Following from my comment on patch 1, I'd expect this to become a simple
assignment of v->domain->arch.hvm.assisted_x2apic (at which point the
local variable could go away), just like ...

> -    if ( !cpu_has_vmx_virtualize_apic_accesses &&
> +    if ( !v->domain->arch.hvm.assisted_xapic &&
>           !virtualize_x2apic_mode )
>          return;

... here.

> @@ -1124,9 +1125,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>           * and wrmsr in the guest will run without VMEXITs (see
>           * vmx_vlapic_msr_changed()).
>           */
> -        if ( cpu_has_vmx_virtualize_x2apic_mode &&
> -             cpu_has_vmx_apic_reg_virt &&
> -             cpu_has_vmx_virtual_intr_delivery )
> +        if ( cpu_has_vmx_apic_reg_virt && cpu_has_vmx_virtual_intr_delivery &&
> +             v->domain->arch.hvm.assisted_x2apic )
>              res->a |= XEN_HVM_CPUID_X2APIC_VIRT;

While within the 80 cols limit, I think it would help readability if you
kept it at one sub-condition per line.

Jan


