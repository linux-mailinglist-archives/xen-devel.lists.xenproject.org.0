Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C54867E0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 17:49:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254168.435759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5VwF-0007LS-MC; Thu, 06 Jan 2022 16:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254168.435759; Thu, 06 Jan 2022 16:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5VwF-0007Jc-Iv; Thu, 06 Jan 2022 16:48:31 +0000
Received: by outflank-mailman (input) for mailman id 254168;
 Thu, 06 Jan 2022 16:48:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5VwE-0007JW-9n
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 16:48:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 790ee1fa-6f10-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 17:48:28 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-PWNUk4mCNSqt3yaK7VkTsA-1; Thu, 06 Jan 2022 17:48:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Thu, 6 Jan
 2022 16:48:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 16:48:26 +0000
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
X-Inumbo-ID: 790ee1fa-6f10-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641487708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ULdw1I5WCA1dyFXWU7GIPOBk5CGSg8kyJ/kSdYP4sBY=;
	b=X5ZG20I6fHhkLQgdh1PEMEL1cnqK16uzAvG1qjSyw3ZV0p2CAv3Tqz6Ip9deNJ4rGZ9lWE
	qp+fLw8Kq3NhJo5dBg0GpNKgVh5ZtDcDgZYvYzxYhCgeI7c/QuTIElAZu6pqfq0eqOjXGH
	04S3gBjMAT/GqEU0Oz7Ev3hKlr6yB0c=
X-MC-Unique: PWNUk4mCNSqt3yaK7VkTsA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebAXuaLmkUCb8WvfTU5NHiYSXD6K4AeexrPCuM2n+6UzoOMEr9Iu0XIpGEjB+8pN0lZLGcNgaZdxB1cssZLG4md+Re89UzloXZXoH7ut2E5yFY/gm8RFD0/OD+Je4+j4WBmK3/qgfv6Ho443PkJXwGEh2F6WItfUX+PD2/B8ZBKzHFZ6UHveFG80oFWU/9ONEviWA6kR3NsFwhYnsFMrOoL1r2/aHv7POE4nrW3oD0ojf4Zdwx4b5pVJmAw6EaeuzTT2O3+YkkbldiyaCfFu5A5bXAbktP9R9Pk77oRmCUlZvU7Q6gFkOrxb062xxrSRZy999oJ7gyFhNYBItb7cSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULdw1I5WCA1dyFXWU7GIPOBk5CGSg8kyJ/kSdYP4sBY=;
 b=hUnYaRXou2VfTFW5DbPzoVGFEtu8J8qX5GNX4usvk1Ee+u7HcSX5/1b/dFgnT2dKPGpgatr7obDLTybiKn42NAm+Lh/oNZHiUq06oIpRPHESgIUT5PiQFVg4itjXRwJCo4AGYFCZAM3HM5Mx8Gt+aK3izLMgQXyucFEN1YGIChs6SOQvTKT+qlNWjotC/IyR8bqq6IWSO5Gdcgw9d1Dhbs1Y9pQpp1n7GzKSke447Q41qy5DFFCleq0BvzixFygYh9JXVgdhLdQhHp6qaVIypUUNJXAgDyuxmWDC+LJ0umu499uHLC4EWX6eeNLnfVeVpSpbz1A0NzV3taI12TRWBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a67bf5fe-ed29-0767-f8ff-eea4a07db1d6@suse.com>
Date: Thu, 6 Jan 2022 17:48:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] x86/hvm: save/restore per-VCPU event channel upcall
 vector
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220106155442.160258-1-dvrabel@amazon.co.uk>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220106155442.160258-1-dvrabel@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0100.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5db0b5c4-4124-43ac-1d57-08d9d1345c06
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3295236A00EA56D9F0C61976B34C9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B/IhY5Bv+WxwW4h9A3hyHiSiScKPuioqDes7KKShX6TuOgj+5zn0kDAJHaHR+Mh8UGUIg5pVjCGUNgzdaFf+px2LdRolc8PTRUoRgour20htcvQsD4Q169sEROW/hTmdENQqu18vSLmRBHf/+VQvF57ID6TS+VrZgN5YQTeWOhd0I9wpvEheQdIOrBUwf1CiMfvxwG+p/Eke6KvqZ5pkD5rnvsozpsH8XndGFDIdXPPSygYzwCPTr/smcyRvBH5r+WMX2ElqlXJ3VTxVebb2MvYceVIsUD3XHRg6tWiIhXVtDgwcmBA9DI+L/PIWguDFTb9f2P6LZJviTMk1SkgCHWS+dDLw5uSvV0E1ihHNI5n/C2R8vn1JT13hSI6SJcZXmiT7GxtMGUgWCUeh7b6SG2+qRGV+5cc6/obY56grWLuZ2XvBxub2psgihWlylij+WH7H6QE8HskOVlM0LFTh/4NAAv3z7PmbFiBkfXRf5fqPWxf5Sh9YWKnuMv4m9B18vVhCQvBSIBUxKjsfTbljm/58hdyK/Gw9ppPjsQ8Z35KUgcq9HfQg7hEpTueWmxhhVFFbVkijDQ87EGfUqFz4+wWVKIPK0GPPcsxT98iKnf0CiLe9w9XzYS8yaBHynJ73ERMn89kypxltacTedIkr350gB5NKXprYPKUn8LwhwouMw9Lk1Ytn6WVtI8DkJ9Y8nEEF0keIPGOOKmyjekEP71FeUwtIpIbtSaRs7f0W5CvOChz7fX6CQj5IR0s1zC9gs6cidUFlnfiVyDAYHFm/uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(31686004)(8936002)(186003)(6486002)(66556008)(66476007)(2906002)(66946007)(38100700002)(508600001)(2616005)(36756003)(53546011)(6506007)(8676002)(6512007)(86362001)(31696002)(4326008)(6916009)(5660300002)(316002)(26005)(60793003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmlPamFUdzNoemdhOWh3bXN0ZkRRNHRYTC9zaUJaMjFxRnhVZVgyZEtWZHB1?=
 =?utf-8?B?bTBKcVVXT3R5OU9VMjJ2QVg1cFoyUlZGUjVPMUFuZnlBa01uL3dqNkNDSGlw?=
 =?utf-8?B?Y3NWaWZncC9hQlREV28xNnBjdzRqdnhTazdPemlCZnBYM1U2b3NZT1V2S1ll?=
 =?utf-8?B?K0JKaEVxOEVsUnFnZEVmQXVqTFJRQlZPMXRFR0NwR1NPYUlWYVNpV01wMWIz?=
 =?utf-8?B?MnVQWk93UExsVmZYRE11SHkrSENxR3J1U0NldDZhTEovZm1tUWpEelhhN21V?=
 =?utf-8?B?TkxDZ0YzSVlNb1Z3QU9HNjRheDRJUUFGOUxlQTErdWtuUS9zNGFUT3lNQkUv?=
 =?utf-8?B?d0xreHo4UmhwemYzYjR6Ym1scksycWVrNUlUelhLWlJwTDVQVHpTdmpZUVY0?=
 =?utf-8?B?VlFEZkZRbllkKytUa29ITEtwT3dTZExCK0d1dFhHUEJFRFB2WjhtaWtNOXlJ?=
 =?utf-8?B?ZFdzb21UWkNsYk9IWlBpNUlMYm5NdWw0S0ZsZTdEK09nQ2RscUpBR2hxNFVv?=
 =?utf-8?B?UnhHWHlzTE4zajRRaVVmWGJHSUQrLzF6V2xpN0RJZHV5eHNMbHhlamJPZ3Nh?=
 =?utf-8?B?YWZMY2V5RGwvb0dnVXBIMmdibDFnQXU0cTdVZHZBSlFReE4zbVZuSTJWNDlM?=
 =?utf-8?B?dWw2OVB1VG10S2lEcWNza1FaV00weUJQczVwNTk5NDNZQmVOdWdZMW5iUEZN?=
 =?utf-8?B?N01DckxJVXNFQUN0R0p2bDlDTnEwUWF4aGZ0Yk1DVy9MUnhza0QrKytSK1JZ?=
 =?utf-8?B?VzBReWgzaTRiUS9TeFZzZXI5TmFiWGFtRytXWDZzUElyb0k3TDFQbHRxUnE3?=
 =?utf-8?B?NDhMb2NPUnlRQ0VBT2hxUE1selpIZTVuZjFzRkNHdmlSTnRueUg1b2ZTWTZG?=
 =?utf-8?B?V1FxZnUra3R5UnRic0lDTmFaQktWYTRlZERJVnRYVWxxb29aaW1XOUNDY2tU?=
 =?utf-8?B?c0FaMDFSaE9KalR4V1pnZXlGY1JibG1BbXZ2SXR0aERiSUdOTVBoZmVFZjR3?=
 =?utf-8?B?OTJhWWh3MDlndTZkMFFkWWZrN1FwTDVIbTgyeUEvTkJlMVhiOUV2aEpaV3p3?=
 =?utf-8?B?cDlqUERmeTBhbnJXbnppeGo4blVXQ2lJQWFKeTUzYTBpVXRRVEMvSi9rczhJ?=
 =?utf-8?B?ZHhCMWgwbWp1U1R6ZVhzdm45V1BuVUFZMEkrK1RPZHI3Zkw4VmU1YjNZTnJU?=
 =?utf-8?B?UFJRTGt3RjNscmkrV2J3b2JTdWpHZlh1eFVTUloxUTN0QTJ3cnhkZ3pkU0gy?=
 =?utf-8?B?NldmS1RkZUZaK2tRT3dvTWR0bWxYdFpGNUY5YWRmWnBEcXhIeXVOQUVpTFBq?=
 =?utf-8?B?Qi9QZWhLOEdQL1hzZ3FTRTM2ZUpNZHIvTlhhZUhzS1dtSkd3Yzl2MVlvVEJW?=
 =?utf-8?B?Ym5XdUpDZ0xQVzJuZ0toYWV0RDBSU3Z6Zk4yK3M3dCtESm1UN1k1cDhVbE9p?=
 =?utf-8?B?TjdsZ1JOTHdGcGc3L042L0JnVDIxL25xRDJvamVuT2ZaMVk5UGMxS2s5LzFG?=
 =?utf-8?B?d3FrbGtoaFRqWmZUWWVQZlhLMXhTZ0lCNGdtWDJYYnZEUGJkb0duM3BLY0Rp?=
 =?utf-8?B?aXZGYWR4WVVQNDhZVVNCV0JqMmlRaEdCRmYzemh4eWVrTG1xai9kRUtwOEwz?=
 =?utf-8?B?SWJKbWcrc3VpYVJ3M1ZjN2owcjlXSlNJWk1iaEExMlhkcWhBREMxR2c0Ymhm?=
 =?utf-8?B?c1hZQlBiMktnWlEweE45b3M2ZkpNeVBOVUg1REFEeS9IYjhDMEpiRE5YdTU0?=
 =?utf-8?B?YVpmWDZLaUsrbFk5U01ldHllcy9NcDZHNnBoTTBlVTB0ZXlUQTh3VHRkYTNK?=
 =?utf-8?B?SS9rZlZEdnNSRUc0cDBRWmRLZmlaWnNaWmdFOW5LSitPV21HWWFHTGhobU1U?=
 =?utf-8?B?UEllR0lPWkdKVE40M2MwaGM3VjlvSE1MSEpHc3VkU3RqUTFXZUxKVUtoSEVi?=
 =?utf-8?B?YWhBVEtKcjk0T3J3RUk4b25NOE1VUmhmWjBhYm92Zm42eDR4SlF4dDV0eTg0?=
 =?utf-8?B?azA2dFhVYlRSdWJNczZWc1dqaXpWTm9ZRW9ibGk1c0tudnh6MDA4OENCb3Vl?=
 =?utf-8?B?d0oxU2Q2WENoc0hvMElSSW5oT0VZazRheEJOeG0rM1dWSTdvdHREQVppVUEw?=
 =?utf-8?B?M2pINUtpbU1qTElyb1JBTHR3aldkS1V4blBBMWtVM1F2WHNwRnd0ZzM2bzhO?=
 =?utf-8?Q?jUjMpr4HdeiFAADliDisYMA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db0b5c4-4124-43ac-1d57-08d9d1345c06
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 16:48:26.3254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U9G8II3YdtX1xsAz0PeLZL5MH1swUEqaYNOD/aH8qNOzfnF11IyvZghz7Y2n5OZPee+6MIH435fkjACwwnYh/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 06.01.2022 16:54, David Vrabel wrote:
> The Windows XENBUS driver sets the per-VCPU LAPIC vector for event
> channel interrupts using the HVMOP_set_evtchn_upcall_vector hypercall
> (rather than using a vector-type callback in the CALLBACK_IRQ HVM
> parameter since the vectors might be different for different VCPUs).
> 
> This state needs to be saved/restored or a restored guest may not be
> able to get an event channel interrupts.
> 
> Note that the Windows XENBUS driver workarounds this by reissuing the
> hypercall when resuming after a migration, but this workaround would
> not be possible in an guest transparent live migration or a live
> update.

Why would this be needed only for this one form of "via"? And how do
you guarantee no observable change in behavior for existing guests?
It would seem to me that this information is something to be saved /
restored _only_ during transparent migration, as aware guests may
deliberately defer re-registration.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4071,6 +4071,52 @@ static int hvmop_flush_tlb_all(void)
>      return paging_flush_tlb(NULL) ? 0 : -ERESTART;
>  }
>  
> +static void hvm_set_evtchn_upcall_vector(struct vcpu *v, uint8_t vector)
> +{
> +    printk(XENLOG_G_INFO "%pv: upcall vector %02x\n", v, vector);
> +
> +    v->arch.hvm.evtchn_upcall_vector = vector;
> +    hvm_assert_evtchn_irq(v);

While asserting is needed during guest initiated registration, is
this really correct also when registering "behind the back" of the
guest?

> +}
> +
> +static int hvm_save_evtchn_upcall_vector(
> +    struct vcpu *v, hvm_domain_context_t *h)
> +{
> +    struct hvm_evtchn_upcall_vector upcall;
> +
> +    /* Skip record if VCPU is down or the upcall vector is not used. */
> +    if ( test_bit(_VPF_down, &v->pause_flags) )
> +        return 0;
> +    if ( v->arch.hvm.evtchn_upcall_vector == 0 )
> +        return 0;

Aren't you assigning meaning here to vector 0 which hasn't been
assigned so far? Shouldn't you check callback_via_type instead?

> +    upcall.vector = v->arch.hvm.evtchn_upcall_vector;
> +
> +    return hvm_save_entry(EVTCHN_UPCALL_VECTOR, v->vcpu_id, h, &upcall);
> +}
> +
> +static int hvm_load_evtchn_upcall_vector(
> +    struct domain *d, hvm_domain_context_t *h)
> +{
> +    unsigned int vcpuid;
> +    struct vcpu *v;
> +    struct hvm_evtchn_upcall_vector upcall;
> +
> +    vcpuid = hvm_load_instance(h);
> +    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
> +        return -EINVAL;
> +
> +    if ( hvm_load_entry(EVTCHN_UPCALL_VECTOR, h, &upcall) != 0 )
> +        return -EINVAL;
> +
> +    hvm_set_evtchn_upcall_vector(v, upcall.vector);
> +
> +    return 0;
> +}

Don't you need to also set callback_via_type accordingly?

Jan


