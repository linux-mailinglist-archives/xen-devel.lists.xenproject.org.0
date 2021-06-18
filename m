Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29303ACDD9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 16:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144717.266328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luFmL-0007Va-2r; Fri, 18 Jun 2021 14:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144717.266328; Fri, 18 Jun 2021 14:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luFmK-0007Sl-Vk; Fri, 18 Jun 2021 14:47:28 +0000
Received: by outflank-mailman (input) for mailman id 144717;
 Fri, 18 Jun 2021 14:47:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luFmJ-0007Sf-Ec
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 14:47:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f631ad9-c799-4198-923f-1c708ecad13a;
 Fri, 18 Jun 2021 14:47:26 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-7GvDr04aO6CJJewxtSDw8A-1; Fri, 18 Jun 2021 16:47:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3936.eurprd04.prod.outlook.com (2603:10a6:803:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Fri, 18 Jun
 2021 14:47:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 14:47:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.9 via Frontend Transport; Fri, 18 Jun 2021 14:47:16 +0000
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
X-Inumbo-ID: 7f631ad9-c799-4198-923f-1c708ecad13a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624027645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNWu5hnyURETxB0XB+avamY+nelrsgtZgfMod+YF+lg=;
	b=j8OQyS0qB+6L1gWcaSlDjPTrIybryz9EgbLhcW7iU1aa/5iaCiOWMFxPcItJ1lo9UCCaZh
	YPdtd5mJFDm95TAajijPtxICci0kD1FKVQ1oIIDAFJJSF0+D4LIGzQQkKdewldcKo+zWbM
	1qn+ubG0MUOi2CtfHyGBOLSisc6rvo0=
X-MC-Unique: 7GvDr04aO6CJJewxtSDw8A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3Ct3gdkK/JOx7RvisnqFqKD1zv0OU6JjfxEZwLVJVIrmVEfLRneWfsUm7wIm5GjTal/kfE68pM24I6zMzMxlTL33fxEhaoxjiUVY6uwgrPpxDYmGbZEdqNBuJUJhpkU8BN82LZ1TNjS0Sv7cF/1Mwek6xD3g7ave0ZFHQCwIv06Qfa0GPpjnIns0G9DAYY9UostS/82ukv2BqWEq8WjYqHD4A7znlIqJp3xmAE+gANIuE6FZr7lTGLKZ42ikWiasdsP0PGYHUCF+3YS7OhQ9oKX/L+B+yKjNoTCnwhAxp+mO5breAoQcB/sPaldibxvomh1R3cUDSNRH0bh9Vy2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNWu5hnyURETxB0XB+avamY+nelrsgtZgfMod+YF+lg=;
 b=RLVuBLYghuKTmcqMoz06kHg0rImAFLhjGiM9kTZBNCHAdnDn5PKdiwyGbnzfrv2o9z3wmqwUQrKmMOsIdGLteu5ZadQagpzuMNJKv/4LMP1vXoaaMjSLMSi7zGSkKuWI9FjkA1xEsIkOtbekD8S1lWk916io/bhp3YVRrRgxbgDQAZ0bKxdyJKkpSk49FQ5lXMEauR8WNgJ1FkSXGdgHlXcWF8rT5mivUHXPgbfSFz+D6i7E0b1hF099E5DBbtnQnU7D+4mLyqayjSJY08wsVhfB4JSaTgJXSN5b+wsa73p4KKvB+Cptn377n/iBrykRkF70AQCoL1aAG13AU4Pw2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH 05/10] hardware domain: convert to domain roles
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: sstabellini@kernel.org, julien@xen.org, Volodymyr_Babchuk@epam.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 wl@xen.org, roger.pau@citrix.com, tamas@tklengyel.com, tim@xen.org,
 jgross@suse.com, aisaila@bitdefender.com, ppircalabu@bitdefender.com,
 dfaggioli@suse.com, paul@xen.org, kevin.tian@intel.com,
 dgdegra@tycho.nsa.gov, adam.schwalm@starlab.io, scott.davis@starlab.io,
 xen-devel@lists.xenproject.org
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
 <20210514205437.13661-6-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dc8f6715-057b-6af8-8846-8b61fba5478d@suse.com>
Date: Fri, 18 Jun 2021 16:47:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210514205437.13661-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb14c8ad-ff21-454a-6aab-08d93267f875
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3936:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39368880CD54FCAF563AE9BBB30D9@VI1PR0402MB3936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fAqa6/VT/vcN+pR19X8HYT+n2nUdEkz6vgjuMwTzunm3vQB2WrV4JlDlwWtvB+M9r49UN2iwyGi1oabeVUPQLej2PZ+INupWX3ENaIwAw9psc1Tq8uNGHkwrLm+3hlB/3i0A3dwNOY45SeqMtrFoZWGusvMGlPCUs3ZuBh074UXNsi6pPEH/oF02wPNEQGupMkhF7lElkjHY0+wFhy4bRVaSODa7nOCYOq620H2Cv7aEhhWdILBp2ERFPBE1cq8a+RK7awBpoUWlsorh0TMdyoQF4tjwBRqTx4Vh8lU7XXCWBBEbSNzS5CU9GJIEAxGfEq5OTmi5HGnfIzSbiOppAzRG6B+nog7wNHP/2RUNrUg42N5gC96KtfZWpxe0ZsMEb0X+SlL7RdcvTmsN8CUD1UlBzBoIg3sszEfBV1n5Pi0UbKyjze21G7L3NSTjOadS1uyVJB6+TpcE2NVpzrA0IpmV4LomUlLmU0NkLSXv7gjS/G7NmhSbij9KGP8xwxfb/atVgiVvwR1L/BOlT0ykdd63TQLH06Imwqyu1emPZqKcWYuiwpYkEC0Y4tFiLMdKIQLh/H33fihqqD2S1KzcEzJCGe+vdkmcc6uPYe4f0TgqdSXkRmCnBIQuzqCMSr98z5zgWxC+5GoKbfji6zLEf6h2Aua8E4PdeSTpTelSmhyFTzWCj/vi6JljFne7I/rw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(39860400002)(396003)(376002)(66946007)(36756003)(16576012)(478600001)(5660300002)(66476007)(38100700002)(53546011)(66556008)(186003)(86362001)(956004)(7416002)(4326008)(6486002)(6916009)(83380400001)(2616005)(316002)(8676002)(2906002)(31696002)(16526019)(31686004)(8936002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVcrdmVsZzhZRm9tYVpVS3E2SlY3U0k5SHJkc29mVGx1K1hnbDNvS0s1d3l2?=
 =?utf-8?B?ZGswZ253UFkzbUsyTCtmUG1jL24xRHllMlk3Wnh2Y2E0SmhLclNCWndjL1VK?=
 =?utf-8?B?cVdqTUNLMTlVS2EvQ3ExRll0amN5Qm4rVnNXUkM2VkxSS25CWnd4MXR2LzV2?=
 =?utf-8?B?UFRBR0l3eFYydUoyY0xQVytLb0M4UjVoOXFaYlVPMG9LK2dnd2VpWlVSSHA0?=
 =?utf-8?B?eTN2bENkaGNmRHBkQmNKYUdlbGp5ZjJyOTBsU20zbExIK2dmT3NST3hYdDRr?=
 =?utf-8?B?Wkl1VGNad0R4c1lLNEF1ZWxPcHlQWFd4TEFWd2thc2oyQWp5ZmZZUGNQRzNB?=
 =?utf-8?B?TDFZeXgzMkxjdmZtZUpHNTFBSHEvQVkvU3JJeEVVRDRiNHRxalcxMnRiWURm?=
 =?utf-8?B?UjVFaXZUb2R1bDFXd2o5UGJ4Szc0QmN6MlhQbktEck9QODIwLytYNHBMdjdu?=
 =?utf-8?B?dUlDbVdnZ3hFOTl3c3dLMEx5c0xBOSsvNC90WVVuRERPUE1rV0wza1NkcXFa?=
 =?utf-8?B?SUlZdmJ5dkZjT1NvT21TOTEzaE1xVVg1NjE3cVRXR3FsRWxWakhvM21EZmU4?=
 =?utf-8?B?K25NNVJkZFlYaUV2eUVhWUN2N2hsaWMrWlJUM21nU01QV2QxNThGbUJzbXFM?=
 =?utf-8?B?K00xeDIyWE9WM1MxTUtuWURNd0RoNG9OdHNFYThmQjQwdjJCdzJ5MEdPSUlJ?=
 =?utf-8?B?amVCSUxjdlFoVHRsSjMwNlUwV2xvb296bjc1cGtrTzYwbmJSSk1MVTlsbVZr?=
 =?utf-8?B?Yi9MNWIzK0dlY1FibmNNdEVCNHZ6YkVuLy9VR1RodUZZRmFlNTR0RFRNdXJX?=
 =?utf-8?B?Sks3MUsxdTE5QUVRc2VHelVjQkxMdjJrZW04Mk00SkxjNjFlVXBjYVh4NlFF?=
 =?utf-8?B?bVB5Q3JWbThVWXg4aXFZblU4cUtrSnozV3g0bE1Pb1E2clRGdUxKZUI2TlJQ?=
 =?utf-8?B?VEx3MFVBUEtwMTJIWHZtOVFsOVl2anpHM3B6VktGZEdHWHZEajZhUzNhNUxD?=
 =?utf-8?B?aXJKSUNpbUJ1NFBtSS9rVUJ3Sy9YVW03MmJ0cS9vRG45aTRCWkN5Q1ZvZFJF?=
 =?utf-8?B?SVRONDB2Z2t0RlJzR1c5WFpOTytYeGNlUGgwUloyT0Q2SWRubHA5blJnWXRF?=
 =?utf-8?B?dEFoNElOdTY1eXBQeWlRY0FXZSs2VkhiOVBxZHlaNXh2NlJwU0E1dlYzV0Vh?=
 =?utf-8?B?T2NTMUdHZy9GK1gxRldqRHBnUEFJTTIvMXJOdW1SZGNOekFxelZ3aWxGZllF?=
 =?utf-8?B?VFEzb1lxYkJQNEdJOEwzOTVWUHBFa2U0Y3FaT243anVMTkJsalRUWUV4eHMx?=
 =?utf-8?B?MFAzbEt0ZHhEVHlCTjZOZU5RUXJ6aXpqM3ByeXBlTnplRGVvRGRzUlAvR2tx?=
 =?utf-8?B?b3VjY0RGanpiVUxYL3hNc0ZxL0kzZnc2bnZNcTBoM29jVU1ST1d4dEdJeHVv?=
 =?utf-8?B?WmJoa3MvekZycEUzNFFjWnhhUEdCTTB1WUd3WDJ2NmNSOW5uN2QzQ0NFclJ1?=
 =?utf-8?B?V1Y5Nlpod3QzTXlSSzBERU1JMjVQSGxRNGp6VSt3TVNqU2dUYm9semxqQnQ2?=
 =?utf-8?B?N2NvNmVnUGlXZUJUS2FWLzNERlRsdmFxc0NmUFZ3NEo0eDdWZFRhV3hsTDVa?=
 =?utf-8?B?NWVsUVRGU1BPSDJYeUF0MFpSajFJL3BiQmo4YVdKNDhoaCtyYU5TTjhBWmVU?=
 =?utf-8?B?UnZsT2hYVFpnc2RNQ25KeDVWZU1Fc2EraUorbjEwbmZxbFk1cXBqSk1rWG55?=
 =?utf-8?Q?+Vs21komRlWZQeeEoPjB1HJ9fnLyyhtnGi75WVE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb14c8ad-ff21-454a-6aab-08d93267f875
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 14:47:18.2589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImQphL3WqcXkACd2R/7Bt2HKfRHlAiOy7LTk4BvDqFDESYf9Jausiupakz4EyRnIf7hhx3SV0Hav3Zoi1U6lzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3936

On 14.05.2021 22:54, Daniel P. Smith wrote:
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -169,13 +169,14 @@ int vpmu_do_msr(unsigned int msr, uint64_t *msr_content,
>  static inline struct vcpu *choose_hwdom_vcpu(void)
>  {
>      unsigned idx;
> +    struct domain *hwdom = get_hardware_domain();

When introducing new pointer variables, please make them pointer-
to-const whenever possible.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4917,7 +4917,7 @@ mfn_t alloc_xen_pagetable_new(void)
>      {
>          void *ptr = alloc_xenheap_page();
>  
> -        BUG_ON(!hardware_domain && !ptr);
> +        BUG_ON(!ptr);

This loses an important aspect: We should not crash here anymore once
we've made it far enough to have started constructing Dom0. As you can
see ...

>          return ptr ? virt_to_mfn(ptr) : INVALID_MFN;

... here, the case does actually get handled.

If you make behavioral changes in, especially, an otherwise largely
(seeing its overall size) mechanical change, please make sure you call
them out in the description.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -776,6 +776,9 @@ static struct domain *__init create_dom0(const module_t *image,
>      if ( IS_ERR(d) || (alloc_dom0_vcpu0(d) == NULL) )
>          panic("Error creating domain 0\n");
>  
> +    /* Ensure the correct roles are assigned */
> +    d->xsm_roles = CLASSIC_DOM0_PRIVS;

Didn't an earlier change put this in place already? This shouldn't be
needed in arch-specific code. The cover letter also doesn't mention
that you're not touching Arm code in this RFC, so a similar change
would then be missing there.

> @@ -302,23 +303,50 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>      return NULL;
>  }
>  
> -static int late_hwdom_init(struct domain *d)
> +/* pivot_hw_ctl:
> + *  This is a one-way pivot from existing to new hardware domain. Upon success
> + *  the domain *next_hwdom will be in control of the hardware and domain
> + *  *curr_hwdom will no longer have access.
> + */
> +static int pivot_hw_ctl(struct domain *next_hwdom)
>  {
>  #ifdef CONFIG_LATE_HWDOM
> -    struct domain *dom0;
> +    bool already_found = false;
> +    struct domain **pd = &domain_list, *curr_hwdom = NULL;
> +    domid_t dom0_id = 0;
>      int rv;
>  
> -    if ( d != hardware_domain || d->domain_id == 0 )
> +#ifdef CONFIG_PV_SHIM
> +    /* On PV shim dom0 != 0 */
> +    dom0_id = get_initial_domain_id();
> +#endif

The suddent need for shim specific logic here also wants explaining
in the description (or, if possible, splitting into a separate
change).

> @@ -559,17 +589,19 @@ struct domain *domain_create(domid_t domid,
>      /* Sort out our idea of is_control_domain(). */
>      d->is_privileged = is_priv;
>  
> -    if (is_priv)
> +    /* reality is that is_priv is only set when construction dom0 */
> +    if (is_priv) {
>          d->xsm_roles = CLASSIC_DOM0_PRIVS;
> +        hardware_domain = d;
> +    }
>  
>      /* Sort out our idea of is_hardware_domain(). */
> -    if ( domid == 0 || domid == hardware_domid )
> +    if ( domid == hardware_domid )

With this change it looks to me as if ...

>      {
>          if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
>              panic("The value of hardware_dom must be a valid domain ID\n");

... this was rendered dead code.

> -        old_hwdom = hardware_domain;
> -        hardware_domain = d;
> +        d->xsm_roles = CLASSIC_HWDOM_PRIVS;

Yet another place where this value gets stored. Ideally there would
be exactly one such place.

> @@ -682,12 +714,14 @@ struct domain *domain_create(domid_t domid,
>          if ( (err = sched_init_domain(d, 0)) != 0 )
>              goto fail;
>  
> -        if ( (err = late_hwdom_init(d)) != 0 )
> +        if ( (err = pivot_hw_ctl(d)) != 0 )
>              goto fail;
>  
>          /*
>           * Must not fail beyond this point, as our caller doesn't know whether
> -         * the domain has been entered into domain_list or not.
> +         * the domain has been entered into domain_list or not. Additionally
> +         * if a hardware control pivot occurred then a failure will leave the
> +         * platform without access to hardware.
>           */

s/will/would/, considering the initial "Must not ..."?

> @@ -711,8 +745,6 @@ struct domain *domain_create(domid_t domid,
>      err = err ?: -EILSEQ; /* Release build safety. */
>  
>      d->is_dying = DOMDYING_dead;
> -    if ( hardware_domain == d )
> -        hardware_domain = old_hwdom;
>      atomic_set(&d->refcnt, DOMAIN_DESTROYED);
>  
>      sched_destroy_domain(d);

Isn't this dealing with earlier failures, and hence needs if not
retaining, then replacing?

> @@ -808,6 +840,42 @@ out:
>  }
>  
>  

I realize you've found a pair of blank lines here, but rather than ...

> +bool is_hardware_domain_started()
> +{
> +    bool exists = false;
> +    struct domain **pd = &domain_list;
> +
> +    if ( *pd != NULL) {
> +        rcu_read_lock(&domlist_read_lock);
> +
> +        for ( ; *pd != NULL; pd = &(*pd)->next_in_list )
> +            if ( (*pd)->xsm_roles & XSM_HW_CTRL )
> +                break;
> +
> +        rcu_read_unlock(&domlist_read_lock);
> +
> +        if ( *pd != NULL )
> +            exists = true;
> +    }
> +
> +    if (exists)
> +        ASSERT(*pd == hardware_domain);
> +
> +    return exists;
> +}
> +
> +

... adding more and ...

> +struct domain *get_hardware_domain()
> +{
> +    if (hardware_domain == NULL)
> +        return NULL;
> +
> +    ASSERT(hardware_domain->xsm_roles & XSM_HW_CTRL);
> +
> +    return hardware_domain;
> +}
> +
> +

... yet more, please insert in the middle of those original two
blank lines. Patch application (especially when larger offsets
are involved, e.g. during backporting activities) benefits from
meaningful context lines rather than many almost identical ones
(and then even relatively close to each other).

As to is_hardware_domain_started() - I'm afraid this is too much
overhead in case there are hundreds or thousands of guests.

> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -228,12 +228,12 @@ static void dump_hwdom_registers(unsigned char key)
>  {
>      struct vcpu *v;
>  
> -    if ( hardware_domain == NULL )
> +    if ( is_hardware_domain_started() )
>          return;

Aren't you inverting the original condition?

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -776,7 +776,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      ret = 0;
>      if ( !pdev->domain )
>      {
> -        pdev->domain = hardware_domain;
> +        pdev->domain = get_hardware_domain();
>          ret = iommu_add_device(pdev);
>          if ( ret )
>          {
> @@ -784,7 +784,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>              goto out;
>          }
>  
> -        list_add(&pdev->domain_list, &hardware_domain->pdev_list);
> +        list_add(&pdev->domain_list, &pdev->domain->pdev_list);

It's not immediately obvious that pdev->domain couldn't have changed
by the time we make it here - did you check? I consider this possible
in principle, if e.g. in an error case the device got associated
with the quarantine domain.

> @@ -879,7 +879,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>      if ( ret )
>          goto out;
>  
> -    if ( pdev->domain == hardware_domain  )
> +    if ( is_hardware_domain(pdev->domain) )
>          pdev->quarantine = false;
>  
>      pdev->fault.count = 0;
> @@ -1403,7 +1403,7 @@ static int device_assigned(u16 seg, u8 bus, u8 devfn)
>       * domain or dom_io then it must be assigned to a guest, or be
>       * hidden (owned by dom_xen).
>       */
> -    else if ( pdev->domain != hardware_domain &&
> +    else if ( !is_hardware_domain(pdev->domain) &&
>                pdev->domain != dom_io )
>          rc = -EBUSY;

May I ask that you split out such cleaning up of cases of open-coded
helpers into a separate (prereq) patch, especially when (like here)
the containing patch is already a pretty big one?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -475,6 +475,7 @@ struct domain
>  #define XSM_XENSTORE  (1U<<31) /* Xenstore: domain that can do privileged operations on xenstore */
>  #define CLASSIC_DOM0_PRIVS (XSM_PLAT_CTRL | XSM_DOM_BUILD | XSM_DOM_SUPER | \
>  		XSM_DEV_EMUL | XSM_HW_CTRL | XSM_HW_SUPER | XSM_XENSTORE)
> +#define CLASSIC_HWDOM_PRIVS (XSM_HW_CTRL | XSM_DEV_EMUL)

Oh, maybe I was wrong with saying that the same value gets put in
place in multiple locations. The fact that you start distinguishing
Dom0 and hwdom needs calling out in the description. I'm not
convinced of the inclusion of XSM_DEV_EMUL.

I also think CLASSIC_DOM0_PRIVS then should use CLASSIC_HWDOM_PRIVS
instead of re-enumerating what the latter contains, unless there's
a definitive plan for the latter to include bits the former
shouldn't include.

Jan


