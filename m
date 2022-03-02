Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8804CA24F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 11:35:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282185.480795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPMJn-0001Pn-IK; Wed, 02 Mar 2022 10:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282185.480795; Wed, 02 Mar 2022 10:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPMJn-0001Nm-Eo; Wed, 02 Mar 2022 10:34:51 +0000
Received: by outflank-mailman (input) for mailman id 282185;
 Wed, 02 Mar 2022 10:34:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPMJm-0001Ng-Ae
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 10:34:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6282b247-9a14-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 11:34:48 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-conUHcwJOCa4Df_h8YlQlQ-1; Wed, 02 Mar 2022 11:34:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4299.eurprd04.prod.outlook.com (2603:10a6:5:23::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Wed, 2 Mar
 2022 10:34:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 10:34:46 +0000
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
X-Inumbo-ID: 6282b247-9a14-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646217288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dmtRXkNm8o6QvTiZB5cYk8DL7WcNj2rLA6YWCfutXt4=;
	b=Mc4R7d1W1+kzuXOBqBddO16lqDLs2OgCTnFNnj1EMycI6J/HGUblURHNL0owB1i8Q/wgLp
	mVGhB+KDuUKLJR6Q+dRwRxqKUIkgUuqG59JcW1zmo4wvtLm0D7k0GDaAG0ufVc0yHiQb+B
	JsbF+awrhKjz/ui5ThSic36otHigOEc=
X-MC-Unique: conUHcwJOCa4Df_h8YlQlQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0FZlPMbRNXySYYnbPD68a19cNjPiFKYwnq43HTwSENA11ZcQ5BU7i90ouFQuN5LoKmqj7tF1pkFAtqbjeBTRkVAbJs9n687yc3iL+JofhTBUW0vFNVzawJFtPHO/hu3bc7tPKY6MVvL2zmDnaBWJqAvE53kNkrGLRe96Fg0p617PYsgEEYzL5JIMSNk2RWxTw8uAYdu/rzsv7f51IFsdjCCXVA2WhI9sosenLAClXHtpyoHmY0jRKRSD4Yj+dkAKIIjlhBEpF29DLPoy6DPaCHgW+M7z3qNwxgdvbB4a0wTE/SvSDBfjZTnRkcnXo7jHk9+oPvMpTUfexLLxcb1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Lf0OBWBxnjnxgVBYGzhfgzUzdicXERsBIsCzj8mHTw=;
 b=Wh0irMgyVHkj7m0gD6TL9G/OR98alJx0H/im0u9IdcBKx8jSEqJwSrk3JlIKLc5+1YredQYADVoShEFmSOhJB7KhhYr6/FJRISVMsj8QUU/tL96iTk6dsCbxuwV5kxultVLR7oldJbXWPfhbIrShQAy4d4+4dYPM2BKdWjWRyi/K3KxvQio/RYi8+yKYCx74vPcSkyr2Hi9eOQCZ/jp3A/oQThU7SjW8/wlzXKr61Qw57kPEdPyvCayQdPHAe8wQOqpHUavORjl7aBf6iHXCjd/05ThmCAO9cXGeI7RRvQObUt9keK33DKTPmhtnln02QaZfsEFyEE9Rjc+8W4EcAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <67ff91f4-e5fe-47d5-fdb8-9a302beb6e2a@suse.com>
Date: Wed, 2 Mar 2022 11:34:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220222114711.19209-1-andrew.cooper3@citrix.com>
 <e8b71b3a-55a0-31a2-b2ab-3b2470680709@suse.com>
 <5fae516a-17c1-0ce4-c46e-909a83c0e273@citrix.com>
 <60f3c942-3822-87dd-df6e-8b64ed4d17c4@suse.com>
 <e41848a6-9aaa-f0d3-0c81-2e0e4e96a6a4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e41848a6-9aaa-f0d3-0c81-2e0e4e96a6a4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0124.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b58e2113-41c5-4442-a05e-08d9fc384541
X-MS-TrafficTypeDiagnostic: DB7PR04MB4299:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB429952EEB37EF5C692996CACB3039@DB7PR04MB4299.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ROkGjCv/3qqLgQzt/vfADxM/ZAKeL6a+QFddZLZqj9VlLo0UqjMi3tVpK9xqW5kXm3dRDdTErsX8aZF3s2Y3PbiE6EqL5Toq5iGEu6AlZ1BLrp1HO2y+CVhDU4Dm524RKb0soCl1ui4uvEP3lkb9HbE/N3b7v72CSFxYd1+FE/t1De8g/vzBx1x+hs641jkE7WEzPQAyQ+iJO0+OiZe82dwkEqBR+Kn7yHTJWoHMFrVJhlqRWuIIbQFsfErg9AonTK7XcVidbq2bRQ5LpDs3iwtenfkOLybnLltEVr56clhlPfPvjVmBlgoaIFzvwdwSt1MpMG7QFkllTSBi1YMlr3i9GlVsFFpHAISaa0V/5Ulv01YdMttioOOJ4+nhf+xrsu4r+a1lyr3ZXrRz9ZXiBtw9hMmw7+87H46whJjZwvevNP+/w+ZxiAQugCp9dnPptaePMJ1rHq16jWI0c2OncjU0YUHgsIdMAwrw051206tl1MXUmou28j7G+gFDS/N2AnrsDVi7vUyrb4j/Qc1V780Ro0g9kjH3qxNr90kMmr1hOEIqmQrMVEpdN7pAli53zgRCOOMnPcF6WUxr5XzzeSgYbZl4/aSiAEBs09DQDZIMoGqv9h3TfR8bK2LIjnSWl5PaVe1gOsE3FxRizNLq1dukl+ieb77MnfxmUBnKw5wyQ1Ah/xLqdQTeCsycnSnPU0woK8jlSYX8nB+N+ghbq37qXN7gnHqWo04YfyALbMpiGh2NOz3Wl5yaJPEFTbmm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(508600001)(5660300002)(26005)(6486002)(86362001)(31696002)(54906003)(2906002)(36756003)(38100700002)(8936002)(2616005)(4326008)(8676002)(66946007)(66476007)(66556008)(186003)(83380400001)(53546011)(6506007)(6512007)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?biXtyQKcZEQXs4+eImQ9jidNE2OmBpTMPQJLwe6PvlaLrSMcey3SpRd9FQUd?=
 =?us-ascii?Q?punwx0sRMT+YqzcZ6hcL36gTjWJODtHT1P+upW2rKRFS8QxpAB3acLC9ZtA8?=
 =?us-ascii?Q?BNUiv9WbtJDaVlCsjqSTra0k2241AZzqxwX5J5Yq8KoO2wqFBpFIMYRVEKkI?=
 =?us-ascii?Q?588YknxqrpqU5jM8BvO05E/gIPstlFRE14EXR+oG9tjDjABcow8ADlwJq9Ob?=
 =?us-ascii?Q?uFZISc4NNtT7MYm3T8y3uKauUJjqdQv6blhn5ZMnNRfsa3KxcZ/WHrTzYz73?=
 =?us-ascii?Q?WvPNzR0MADrIzIP76y0fo2F5/uax/uJtKI+q0q11r7MbSwrwkne1mIrwaWNr?=
 =?us-ascii?Q?P5kyINlEfIcmwHkD+CRXOccV07nrdGBLx2QxTxNczRxgzLuli6qqhFHOtnMm?=
 =?us-ascii?Q?izp+QzFrMf/4isJ3WlClIFgxdz3CbqhJlBRZ7+LeTRNbTtH4O4ZwIGfSArY3?=
 =?us-ascii?Q?0dVNsl8lAN+D6kfaP/3Oy7vBh4m7/Sfqn7NvFbnWS2XYIEN9q+yXeNynCGzR?=
 =?us-ascii?Q?VQWOpb+9LY+WKh7scY9Q0XRylGXx3R3/O9AG0L/rYPf7dq008ptMCWvCBLh0?=
 =?us-ascii?Q?w7frA9D6DTvfmARqCCARmxYXAD+yjgOHueGR4vOzGnID2Z7qjw+sLHIZpF9b?=
 =?us-ascii?Q?1p1sdDgtKGDXObu/FNQzv6aNY3i+hzdN/0pDtvS5cUKpIhKZf4Ic3wMNCQit?=
 =?us-ascii?Q?tv6Yd2bLokPb17kkprWTi31QZZjK4T9aWiZQWLRQaPMUZT/JIiuMVLAiCgQk?=
 =?us-ascii?Q?rcv3MkcVJYY+bbEp+tSLRikFxqur5fLCKtl38qXZa9QpW1OQx/ZhMXEEFr+p?=
 =?us-ascii?Q?dzWULiyrG2GerCgJzolA83U4WzjYCNIv/+9d9NcR1DAiiMT4izn4OzRQuTM8?=
 =?us-ascii?Q?r0XAhtDr519bp/sXRoAuOQ4WUERCU/kwALPrwofP95rYMNJRUauvLfODpeZs?=
 =?us-ascii?Q?fCmy/+a95v8DD//yHjeHKniO5JvTjshJA60YnSfYiVV6SWRdw9qwDaX/EfHl?=
 =?us-ascii?Q?OjTfO/zdMhP9Sa5TQuLjejOwseB81CYUBNT8rgVZ+SgW90xqVwRZuqWxHvN0?=
 =?us-ascii?Q?D4hNSNoLc7HHELW5bPwAj8R/ntTRcmwDnGgE6qJBtBlABRduTPQl3pkHH5Rc?=
 =?us-ascii?Q?JwVR8Ua/M+RtMeLRfumrxYvrFOfGVVw/iWsOuZFafzCJZ2AYNo8P0XDR9tDG?=
 =?us-ascii?Q?DDuZocFqH74uCvbTVHsMdUdUmHdlNhEuiSpK3Cndlwa01lmwibjXWv66LW+/?=
 =?us-ascii?Q?gfD9D1qxsMAvkP7kI8ou0fbomHWYfuY3XtrOyA411Qd1t8LrCo3NLmbyuHHZ?=
 =?us-ascii?Q?hpEddPvph7+XvmIvccb8q1/3IcbzU/hzDOVb0mkvsF3FrIgqhhor64RrR1pm?=
 =?us-ascii?Q?/0VeXnoPr2nFSfWB//qACxmlP3wzbTg8gUnpIq9DSS+yIG3Xgcd/o/2J+lxL?=
 =?us-ascii?Q?8nW6ilvNrCUm7q7XOL3GMjnk5pJEMC+rrc2aqfTq+LfE0YERIx0/YFw/nBlR?=
 =?us-ascii?Q?3RGAOxnq9pOccSeO9Z0IcWqio5EjWQ/z7tAlqb+vrAp+CkxlpChsHeWj9YHZ?=
 =?us-ascii?Q?1WzkfxSi/ii/2K4rCAbAf3dXN6/lJB3jRh7sTziBQszpdykejgfA7fGZKHSR?=
 =?us-ascii?Q?FIsg1yciZS1U2ypVmw+CLVA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58e2113-41c5-4442-a05e-08d9fc384541
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 10:34:46.2276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5H/Y5hMAnz++Hc9G6rlrZwfwb3H9+CGIVCvIBDadSDorA8KRfn9TnsjECcSZfqaEjGGIpv84kqTw6jsbEAnw2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4299

On 02.03.2022 11:12, Andrew Cooper wrote:
> On 02/03/2022 08:10, Jan Beulich wrote:
>> On 01.03.2022 15:58, Andrew Cooper wrote:
>>> On 25/02/2022 08:24, Jan Beulich wrote:
>>>> On 22.02.2022 12:47, Andrew Cooper wrote:
>>>>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>>>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>>>> @@ -628,7 +628,7 @@ static void cf_check amd_dump_page_tables(struct =
domain *d)
>>>>>                                hd->arch.amd.paging_mode, 0, 0);
>>>>>  }
>>>>> =20
>>>>> -static const struct iommu_ops __initconstrel _iommu_ops =3D {
>>>>> +static const struct iommu_ops __initconst_cf_clobber _iommu_ops =3D =
{
>>>> Following my initcall related remark on x86'es time.c I'm afraid I don=
't
>>>> see how this and ...
>>>>
>>>>> @@ -2794,7 +2793,7 @@ static int __init cf_check intel_iommu_quaranti=
ne_init(struct domain *d)
>>>>>      return rc;
>>>>>  }
>>>>> =20
>>>>> -static struct iommu_ops __initdata vtd_ops =3D {
>>>>> +static const struct iommu_ops __initconst_cf_clobber vtd_ops =3D {
>>>> ... this actually works. But I guess I must be overlooking something, =
as
>>>> I'm sure that you did test the change.
>>>>
>>>> Both ops structures reference a function, through .adjust_irq_affiniti=
es,
>>>> which isn't __init but which is used (besides here) for an initcall. W=
ith
>>>> the ENDBR removed by the time initcalls are run, these should cause #C=
P.
>>> This doesn't explode because the indirect calls are resolved to direct
>>> calls before the ENDBR's are clobbered to NOP4.
>> I'm afraid I don't understand: The problematic call is in do_initcalls()=
:
>>
>>     for ( call =3D __presmp_initcall_end; call < __initcall_end; call++ =
)
>>         (*call)();
>>
>> I don't see how this could be converted to a direct call.
>=20
> Oh.=C2=A0 iov_adjust_irq_affinities()'s double use is hiding here.
>=20
> The safety rule for cf_clobber is that there must not be any
> non-alt-called callers.=C2=A0 We need to fix it:
>=20
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c
> b/xen/drivers/passthrough/amd/iommu_init.c
> index 657c7f619a51..b1af5085efda 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -831,7 +831,12 @@ int cf_check iov_adjust_irq_affinities(void)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> =C2=A0}
> -__initcall(iov_adjust_irq_affinities);
> +
> +int cf_check __init initcall_iov_adjust_irq_affinities(void)
> +{
> +=C2=A0=C2=A0=C2=A0 return iommu_call(&iommu_ops, adjust_irq_affinities);
> +}
> +__initcall(initcall_iov_adjust_irq_affinities);
> =C2=A0
> =C2=A0/*
> =C2=A0 * Family15h Model 10h-1fh erratum 746 (IOMMU Logging May Stall
> Translations)
>=20
>=20
>> Afaics only pre-SMP initcalls are safe in this regard: do_presmp_initcal=
ls()
>> is called immediately ahead of alternative_branches().
>>
>> Isn't this (previously?) working related to your "x86/spec-ctrl: Disable
>> retpolines with CET-IBT"?
>=20
> No.=C2=A0 It's because AMD CPUs don't have CET-IBT at this juncture, and =
will
> never encounter a faulting situation.

I'm still lost. An exactly matching construct exists in VT-d code (and
my initial comment also was on VT-d). The AMD one is actually a clone
of that much older one. The initcall really wants to move to vendor
independent code, but I'd still like to understand why no fault was
ever observed.

Jan


