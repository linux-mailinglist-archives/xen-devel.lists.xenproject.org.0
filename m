Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB841EF54
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 16:20:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200658.355201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWJOJ-0007xB-Qk; Fri, 01 Oct 2021 14:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200658.355201; Fri, 01 Oct 2021 14:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWJOJ-0007uX-Ng; Fri, 01 Oct 2021 14:19:59 +0000
Received: by outflank-mailman (input) for mailman id 200658;
 Fri, 01 Oct 2021 14:19:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWJOI-0007uR-37
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 14:19:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6a6bf7a-22c2-11ec-bdad-12813bfff9fa;
 Fri, 01 Oct 2021 14:19:56 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-PlamOJ8PNa-is6FXeEormA-1; Fri, 01 Oct 2021 16:19:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 14:19:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 14:19:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0101.eurprd04.prod.outlook.com (2603:10a6:20b:31e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Fri, 1 Oct 2021 14:19:50 +0000
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
X-Inumbo-ID: a6a6bf7a-22c2-11ec-bdad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633097995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EFA3Mz6g9J+y/mj3uFG2Q48UVqwmg78UIH6qNplzTRw=;
	b=aibUWJlJbMATvTK7sMOnRTm5NYvoZ67sHPbCUXm2o45mwLJ2vPaqn8vMUqL7OYuc3WKV2M
	WsTBRz5lL+5/mxnSQ7qjMkFevrpWTFKHHeQO2hbHQOnOCQbKxIthaxCsO9MZDAdbV/dKee
	/E17kwkLzgGkfYptIHb9VcRLtiVL3SQ=
X-MC-Unique: PlamOJ8PNa-is6FXeEormA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=US4KmR/23x7/RbAGbhAagvZfEYpVUl2RhZFeWjyD6CVdBvObkMiH9XgezXaJ6DHHTGS6azuMOZ+10W/1B9lKh0S3G9u17JkqDSacB55JeuY7kkFjg9GlaONEihsWQhkeLHn5qHc/ojtcuW3r7YivxYBxtcGJxaW4VYTqkCY/87AQJ4fOVVIj5eVdsTQGnq2zt9GCfwWVTCapk3mRhqMPmXt0JSR79TuqhhNXEPsCoavz7mXTXEE4HITicaNUF7GVptgTenc6WOXTdFsH572v6Lyf+G60CHbccPem0b0x4e7IlujljfJ1SZjS9A46L6dRUHztPclbPmdQCGezKmNBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFA3Mz6g9J+y/mj3uFG2Q48UVqwmg78UIH6qNplzTRw=;
 b=NoRGoUOWXuBaIIC6PtOr06B39yyzXAui1WXm23sfvUdsDUzMf/UoRTRzkTXEIL7sELH2Z1E5iimGcfzpKLQbnnzlov7w3IWnZG4CMg71V5ABuP8Bjo7xOx9LoF/+1tqFf3o2iU0cevAMIwoy2vd6g17n9GCBxO6/mFEsDrInHQh/JxKaqYkPlwJzYcUs6+IIATek+M7QEbRJCCee/lb7LEI79TwV6SQe5uEqMfj1Ybqi8a2vA5oSY0bRl6us1Ew/J44MCSi8iuxgVoEzU3PkMXYrHrMCmbaf+eU+J7vDuF0xF3/aY+QCckVUp5tg0KPZvDqP0hYH1X5vZaQRu5poEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/1] x86: centralize default APIC id definition
To: Alex Olson <this.is.a0lson@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Alex Olson <alex.olson@starlab.io>, xen-devel@lists.xenproject.org
References: <cover.1632512149.git.this.is.a0lson@gmail.com>
 <85b59046315b8a84afa8538aacdea92b19200faa.1632512149.git.this.is.a0lson@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d899b058-a201-e2f8-35d2-f0e59ab4bab3@suse.com>
Date: Fri, 1 Oct 2021 16:19:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <85b59046315b8a84afa8538aacdea92b19200faa.1632512149.git.this.is.a0lson@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0101.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7f33d82-b48b-4687-0738-08d984e68876
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54727D87AF9392D2DDC606CEB3AB9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LMEq9kKKPe3Jh/jkmIGoiU+YKznpCevN1qSuxu1mWSwyIRE33jGgNZ5uKPJGs4cEVH6DR3k4lueJbVb266D33+MuJ8/5fKV/u60mFqBNdLyf/ItZkL5m/r8BVC7TCN6uw5/7P7B4ywqlaXPb6b/zmxIZ2qN/++C3DdO80YAb0UF6TkNr1ZGM8/MQcrXeHpUof4bpH65WHTS/VP4nfY3fxAyOyOzEDXrNY+NqEv/gXM9CGh2RaZYFhiGor8cxfS+AUWLTrVCsE7BM72sA3XFax+p1PjLjJMi1siJOlNyojtGKcq8ObkTH79B4TXPjSezXkN2OOE1kGmZutZ+RyQ3r+JcF1Lqdycu1co0AFs1YxUHM2QK8jZczegmZRwEW/4r4fuC+rQwMihJzVqwllMfnHh8VdQLz0ldBUiP+IceUjYaxTiY5HCsf8YLQXmdb38R0XTcaQzaSv3aCI4/UoRa+nUKTzzkOrOVdnS2OONicktbVBwtTa4c8szErMH6/Y1isRJuy5VNGJZ0yqzvqXaj4T16rHfUrRA6Gm0RM9nPZOU7cWhBOZ7D5sB3JWjfo1Wl5xM0RgsgOZ58TXVJkzsccQrWN9mS78Y7S2Tk8JfM5K7mgGS5FxbJHrHFv+NN8LRiS85GF4wXMHvM+YKqZXmdc9/TqBgp+o1DGfb062za/QbOqeCJ0MHVadB3bP8PrWqt1pIAwXEitmw1jD2wPcY3ZLtI9U4hRafdf/X1mXneFk8e7LfNuJIVL6tC8SH5P1Zbq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(8676002)(956004)(5660300002)(66946007)(54906003)(316002)(6486002)(16576012)(38100700002)(8936002)(2906002)(66556008)(66476007)(53546011)(4326008)(83380400001)(186003)(2616005)(6916009)(31686004)(7416002)(508600001)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2dBNW4xRXk1RHpOcHlidTlUNGlaWjdaMnYydVowYjNac0hGUU5NbkpPakJv?=
 =?utf-8?B?MnJoa3pPMysrNkhvM3lOWkNHSHd5MU03ZGR4TnVsVHBHeGRDMzJBMzNkSVdN?=
 =?utf-8?B?bVI2OS9ZRHU0VWIyRnJSanFVekFCR2pjWU1hSlpXRmsxakFNY2dtQ3ZJQzVv?=
 =?utf-8?B?RzhRblRFRnN5d3FCdTNZOWo4cTJHK091eGVRV1dJNm9wQ1hLd3BVRE40aStF?=
 =?utf-8?B?eUl0YXZuWi9DdFNnSTlkSUpENjNZdEhqTHloQkZMamtqNGlLWngzWkVnZTQ4?=
 =?utf-8?B?UGgzNC91TmczWklpeTRhM1pHMDBLYlk0anJHb0tldzhqR1JXNjR6TXh4WE5W?=
 =?utf-8?B?a0czbWZhOHRBcEU5d2g2MC9wVmxDSXVhTEhyTFVqRHBsM0V6aWxlajN5ZUtM?=
 =?utf-8?B?b3JON2QydXhXYU94b054V0x6VSszTkNPK1ZXV2F1WUZ3RWxGZXNPUjdQTXVB?=
 =?utf-8?B?dDdjNDlYdUE0bFJrVU5xcy9CaXduaE4wL21reDBtUXkwZmtuYUFqUTgyUGhX?=
 =?utf-8?B?OE5aQkdsWG5kaDF2L2x3THp5bWxzT3N5ajg0U0tyQTE4V3dZM05ZRnJOenNv?=
 =?utf-8?B?VnVRSXp5OVgvSFI5MzMwaDVHODJ6Z253M0J4RVVQOFlFU2EzcWY4Wi80enRE?=
 =?utf-8?B?amxhcmtjNDhPb2lFSVhabGlyK0RWVFF1T1B4RUJkSlU2UWRzeUl6MTBJM3dC?=
 =?utf-8?B?VSs1ZXV0d0ljRWd5S0VyS1ZRclQ5SW9hTHFuVG53dlFDVlFQM0xRUzkwUTA5?=
 =?utf-8?B?b3RCRWNyU3FhbFk1ZHc2anV2VnMyVHNFcmQzZ2xuamxUUEdxWk9oT2VaTFcz?=
 =?utf-8?B?ZmJ2OFBWN1FXM0NYU3psSVVXZmRmeVRnWExzUGFEdGJKd2llcThxQ3hRK0Z4?=
 =?utf-8?B?UnFoQnNOeERpUGswWGRaM1d3MmZOOEZ3RVFRRDFOKzBncDNYTHp1VEpkRDNt?=
 =?utf-8?B?MlZraWNldjk5ajhLaHByQVYxaGRiR3VYMHBydjhUR2FqVHNYenVWOHZBSHl5?=
 =?utf-8?B?bG9hYnZJRGJpTmx4anRBcVlLeTZaMHc5ekw0M2pFemVWQUFla2YrRnZscTBn?=
 =?utf-8?B?QUd0cTFJVjcvUndtc21nVW1BSW81RXlzSm96MWF3VXFlWUNPVldYSFJFN1Fx?=
 =?utf-8?B?Nk5OL0RuYmRUbGJVUUJUdm5zb3ZkRGhWYUROa0FwM3FGbU11MmkwMXkvSFF3?=
 =?utf-8?B?S1BBUmo0YVozUUwzK1owTzhsdnVXeHNMejBURHY1cTJNazVieEE3bm5ucHQx?=
 =?utf-8?B?NnZDUjBKcWNuSjhmNkljcXhpdGJOVEhtMW5hZnJlMldPSTM5c1p1cDlsN0t3?=
 =?utf-8?B?Wm1UVWVEV2xIRUNaNmRMSkFOMDFVU3luRGs1NHJCc3ZoWkVWQVppQmUxT0p5?=
 =?utf-8?B?bVloVXBLUC9lVU1YeTcrZnB6YWErc0o3akltVjRoQ0NyWFR5ZC9OaDZHVVRv?=
 =?utf-8?B?NDkzSkthc0J3MHlZVUhGQytvMWI5dWVLNGxka2ZXOFcxV2FCSnFhd2pZUkFy?=
 =?utf-8?B?YWM2WDRtT24zb3BVL04vUUpvNHEzUHZCa3NHU3UrZ3ZNa283bEg0QXQ5Slc2?=
 =?utf-8?B?ZmVWaE95QWRvVmw4b1BuOE1jYjlGWUdQdU1pTnFLR2RRWW9LQ3NLWUtZbUND?=
 =?utf-8?B?enJ0dWUvUjVjaTh6T2dXY2VOV0E2cTBobUdkUzZ0Z05iMTVlSHpEZ3VpbEEv?=
 =?utf-8?B?amNHVVhxeS85Q1JQeUU0WC9VZUQyNVhSRVJjZXFEQVlXOWlNd2ZzRmQzR3V2?=
 =?utf-8?Q?DuktVmmLFyVE11nKwuKk711uiO7huzbHohYyrUx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f33d82-b48b-4687-0738-08d984e68876
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 14:19:51.7616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBcybx8RfoN3KidUpFbmx+pYFvZR84okqdQOwiNCIDuExIOj1Xw9gfCK5Nc9ha4x2Qbs+3cAOk+Qz6caudb27g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 24.09.2021 21:39, Alex Olson wrote:
> Inspired by an earlier attempt by Chao Gao <chao.gao@intel.com>,
> this revision aims to put the hypervisor in control of x86 APIC identifier
> definition instead of hard-coding a formula in multiple places
> (libxl, hvmloader, hypervisor).
> 
> This is intended as a first step toward exposing/altering CPU topology
> seen by guests.
> 
> Changes:
> 
> - Add field to vlapic for holding default ID (on reset)
> 
> - add HVMOP_get_vcpu_topology_id hypercall so libxl (for PVH domains)
>   can access APIC ids needed for ACPI table definition prior to domain start.
> 
> - For HVM guests, hvmloader now also uses the same hypercall.
> 
> - Make CPUID code use vlapic ID instead of hard-coded formula
>   for runtime reporting to guests

I'm afraid a primary question from back at the time remains: How is
migration of a guest from an old hypervisor to one with this change
in place going to work?

> --- a/tools/libs/light/libxl_x86_acpi.c
> +++ b/tools/libs/light/libxl_x86_acpi.c
> @@ -79,9 +79,13 @@ static void acpi_mem_free(struct acpi_ctxt *ctxt,
>  {
>  }
>  
> -static uint32_t acpi_lapic_id(unsigned cpu)
> +static uint32_t acpi_lapic_id(unsigned cpu, void *arg)
>  {
> -    return cpu * 2;
> +    struct xc_dom_image *dom = (struct xc_dom_image *)arg;

No need for the cast.

> +    uint32_t ret = 0xdeadbeef;
> +    int rc;
> +    rc = xc_get_vcpu_topology_id(dom->xch, dom->guest_domid, cpu, &ret);
> +    return ret;
>  }

No need for the local variable "rc" if you don't evaluate it.

> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -867,8 +867,10 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>      case 0x1:
>          /* TODO: Rework topology logic. */
>          res->b &= 0x00ffffffu;
> -        if ( is_hvm_domain(d) )
> -            res->b |= (v->vcpu_id * 2) << 24;
> +
> +#ifdef CONFIG_HVM
> +        res->b |= vlapic_get_default_id(v) << 24;
> +#endif

How come you drop the is_hvm_domain() here? There also should be no
need for such an #ifdef here ...

> @@ -1049,7 +1051,13 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>              *(uint8_t *)&res->c = subleaf;
>  
>              /* Fix the x2APIC identifier. */
> -            res->d = v->vcpu_id * 2;
> +#ifdef CONFIG_HVM
> +            res->d = vlapic_get_default_id(v);
> +#endif

... or here.

> +        }
> +        else
> +        {
> +            *res = EMPTY_LEAF;
>          }

No need for braces in such a case.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1555,7 +1555,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
>          goto fail1;
>  
>      /* NB: vlapic_init must be called before hvm_funcs.vcpu_initialise */
> -    rc = vlapic_init(v);
> +    rc = vlapic_init(v, v->vcpu_id * 2);

Now that's odd: The goal of the patch is to eliminate such, and
here's you're adding a new instance?

> @@ -5084,6 +5084,40 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_op(arg);
>          break;
>  
> +    case HVMOP_get_vcpu_topology_id:
> +    {
> +        struct domain *d;
> +        struct xen_vcpu_topology_id tid;
> +
> +        if ( copy_from_guest(&tid, arg, 1) )
> +            return -EFAULT;
> +
> +        if (tid.domid != DOMID_SELF && !is_hardware_domain(current->domain))

This wants to be a proper XSM check, I suppose, and allow more than
just the hardware domain to access this in case the controller of
the domain doesn't run in Dom0 (see XSM_TARGET).

Also, nit: Style (see all the other if()s).

> +            return -EPERM;
> +
> +        if ( (d = rcu_lock_domain_by_any_id(tid.domid)) == NULL )
> +            return -ESRCH;
> +
> +        if ( !is_hvm_domain(d))

Nit: Style again.

> +        {
> +            rc = -EOPNOTSUPP;
> +            goto get_cpu_topology_failed;
> +        }
> +
> +        if ( tid.vcpu_id >= d->max_vcpus )

Please use domain_vcpu() ...

> +        {
> +            rc = -EINVAL;
> +            goto get_cpu_topology_failed;
> +        }
> +        tid.topology_id = vlapic_get_default_id(d->vcpu[tid.vcpu_id]);

... to guard this array access.

> @@ -1508,7 +1514,7 @@ static void lapic_load_fixup(struct vlapic *vlapic)
>           * here, but can be dropped as soon as it is found to conflict with
>           * other (future) changes.
>           */
> -        if ( GET_xAPIC_ID(id) != vlapic_vcpu(vlapic)->vcpu_id * 2 ||
> +        if ( GET_xAPIC_ID(id) != vlapic->hw.default_id ||
>               id != SET_xAPIC_ID(GET_xAPIC_ID(id)) )
>              printk(XENLOG_G_WARNING "%pv: bogus APIC ID %#x loaded\n",
>                     vlapic_vcpu(vlapic), id);

As to my initial comment - I expect this warning will trigger for
about every vCPU of a guest migrating in from an older hypervisor.

> --- a/xen/include/public/hvm/hvm_op.h
> +++ b/xen/include/public/hvm/hvm_op.h
> @@ -183,6 +183,23 @@ struct xen_hvm_get_mem_type {
>  typedef struct xen_hvm_get_mem_type xen_hvm_get_mem_type_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_hvm_get_mem_type_t);
>  
> +/*
> + * HVMOP_get_cpu_topology is used by guest to acquire vcpu topology from
> + * hypervisor.
> + */
> +#define HVMOP_get_vcpu_topology_id     16

Careful with the number choice here - 16 used to be HVMOP_inject_msi
until dm-op was introduced. Interfaces exposed to guests themselves
need to not invoke unexpected operations on older hypervisors.

> +struct xen_vcpu_topology_id {
> +    /* IN */
> +    domid_t domid;
> +    uint32_t vcpu_id;

Please make padding explict, checking it to be zero on input.

Jan


