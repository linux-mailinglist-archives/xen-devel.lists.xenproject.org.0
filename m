Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9A852A52A
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 16:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330996.554429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyTE-0002nf-Fh; Tue, 17 May 2022 14:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330996.554429; Tue, 17 May 2022 14:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyTE-0002lr-Ct; Tue, 17 May 2022 14:46:44 +0000
Received: by outflank-mailman (input) for mailman id 330996;
 Tue, 17 May 2022 14:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqyTD-0002ll-Bm
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 14:46:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a4b7cbd-d5f0-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 16:46:42 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-NGZHOApKNxmfoC3Omza_Hw-1; Tue, 17 May 2022 16:46:39 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8152.eurprd04.prod.outlook.com (2603:10a6:20b:3fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 14:46:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 14:46:37 +0000
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
X-Inumbo-ID: 2a4b7cbd-d5f0-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652798802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O476b6RKUYGNB0++/9szmd5u5BrzgkRxrIunygRHuYE=;
	b=O4l9qrCPqCFaiNReQzUF8NYA7KH53A+Gvwr8w6jycQ32EZwjW+O3vfc0mTJke5EIeQ5yLx
	vyFwEkSDPZToWHb2mbn7pqot6qIGbsFvjUH8p/9OxxHruW747/Qc1unyTVpmsNTww67s3s
	S3tvRi76DYSAxP4vpI4Ob2CITUDdXII=
X-MC-Unique: NGZHOApKNxmfoC3Omza_Hw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izhzs9cVpYjnbec1LisRX9RUKSCLf+BUttRkJYudzuNbwCxcGVbRytk98OfxvTNPveZW/CP45+HNSwB8QRJZB7jjS6dZaFj3DeH3K4V+hgZif/3JoMtLvV7mG4QxGpcTlheOC39iNq6RTZvfcWzM8XK9MiCSBw1kUNOqlGAjKGAcuaeopr5WfqjUDsQPzhlsihtFOHygoNatEC+ZV8/jiYjsKVeWul9NVPsLw0pTm2Yd9yuzeBOJqkBPuApGv7KlI4kfhByp6zuVxEJ77OBgpvGfAdG3P2I+6/fFjTAUNbjLYjV9dHS9BhT2QLV3erYjTH4Xha8PM7z/CY/sfDXgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZ4StM5I8P4/Hrtr+HHrySuBxmRpRNklggJ8ZNj6KKY=;
 b=lJPYgb7WqCXPcekwz0CGsk0TtWjD3R+uI5i5Kktz/REk3bcBD6GJdYMe0bqCASuJtS98hz0MU26FD1pUt09u66EvTlc1hyfHWDqTAq+W9IjD5IrSNUiSnOQZGGjvnAKHV2mueXsan1GRW0tmgYZQsXJROanQ6d/Wq838Nu1idOCvNT+mhzVoMOYU3YJgxlWw96JDTkbeCBlQYpm2aMNrAhrH5nGidREHK+o8bwvgx/gDfHsenjoBjspm9O5NqHnT/IQJGMtmNjhLMEVFM5YVNbtAzlrsU9ivQtuhi7etG7EF7KOEdUgpwCxa7ItIvrMAdC35pL3wmhqNXHciDJVPqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95d9658b-dda2-0c05-297c-a75959f7653d@suse.com>
Date: Tue, 17 May 2022 16:46:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for
 HVM guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220503082650.23049-1-roger.pau@citrix.com>
 <20220503082650.23049-3-roger.pau@citrix.com>
 <7525a9e0-2334-7b6d-5d42-fb68fc6ef0c1@suse.com>
 <YnjrrG6iQmUgB1r/@Air-de-Roger>
 <5ba9bc92-6cb3-7d7e-150f-077c709acc3a@suse.com>
 <YoOm4iVYO3jdjzw3@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoOm4iVYO3jdjzw3@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0410.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8911a564-ea80-4755-1769-08da38140b9e
X-MS-TrafficTypeDiagnostic: AS8PR04MB8152:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8152971F7D1D8E1B0A36A546B3CE9@AS8PR04MB8152.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wlNmCZMBbpc1ALwxZ481bNSJwdmxELs6bk7ksRIFAIDfzHjgRSw4DNkPFBRqXvowOiuTU98pZrbMg+nuZVe07RlPLRg1wZ4chLs312bQnlfZJDcdy5c9Uzx4ZOmp8Sn0kXxMGD7bggozKiT/qyd5KcjRXyRVVpcJFr9miHpbZMn8Jb6j9fK8NBkkEI22pVFIE3JnU/iaNk0MaQmmraU6fZHJLit6+ehNOrfoqLK/8URfzl7PJXX7Ki7g+/26ok89ATYSbm9nlCOSpwgNaAqbXL3O8zlV9QiiN62Fs0MSzk7UcI+98CFKXAj41t1kxYd0PVwVaHEcHr/LAcFlrP1f3ujgXyAEusJcRoiXN7igfmd1iiMRHiF7roTKl89FGgePe65bg7eNTXLhdxDJ+Mr4XgnVDIOlRm7spo8rCSsn0lx5/B/KSAevjKfkU1w/mpxcrt/1KeQa3DEDTVAfvsdzHu791QzEKmM214yaqHcszL75Ha7/debzwf3AnlK3U4u/di9txA4oe0JGARY+uoDy1ndmPvlCjKmUEheKjFyl48DbCzpZThJlOQZ/mhatsveogZleOLSWX9iS3Vra0ceVnfsAecm5HUHKvw9KPbwVuEWlGFK8eePxQmM+36arP8svLIsKfWj3/43QkYqBazIlvfGxCmWXlnW8r34E4G+QwPUJkUpnMITMxMJcpXtLU4d3+1K4AznMkEDHTZdSr0WWTJCokm34Prz9gMg5AZNeH3E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(6666004)(2906002)(6512007)(26005)(6486002)(8936002)(508600001)(316002)(66476007)(8676002)(6916009)(31696002)(83380400001)(31686004)(2616005)(36756003)(66556008)(4326008)(86362001)(54906003)(66946007)(6506007)(38100700002)(53546011)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mHMWhPZl+Bm8utpIzcV+Gx78tVeUO+sNhrs0AC4GzxqdS40ett+SmWtb3oWg?=
 =?us-ascii?Q?jwsFQtT9l9/N0t6EGBo5g8da0zoJVoC/Jgb04lUajSJrO2U1jHDtfUhJO4VX?=
 =?us-ascii?Q?7nv0iOHBX+gpVTQv3SeG6ks+R368Ip8b59NtiIiGN6IpM9GcijoE8s/gpNgb?=
 =?us-ascii?Q?aDNu8FNQJ3ZVED0/NuVqk80GbxTNmuJ9xXami98jfc+TI434U/wjtD5dpbYQ?=
 =?us-ascii?Q?MIkSg5Eu3Ow/IL6R8EalG9aQbVOG6luZJLCU7/opymn1TOgWXMdk79ffQOpU?=
 =?us-ascii?Q?QNWXeI3aol7pdks07kb1eXrrO2oCrv+VIPayNqdG88o9VjMIOIoSh8haXWDL?=
 =?us-ascii?Q?QuL8avrP9cOM8eeIEJAlkbdTS6IG8A58RnqD4UFX57L2mN572cgplx4ShP2S?=
 =?us-ascii?Q?OG+Lw63NGoUiq4uFXgvaS9s7adaVo6DfWuPACzq3qOvIAtK3nLVjbVktpKDk?=
 =?us-ascii?Q?L42sUjFnhgx7hD0RU+sNq8IOqsyyp3hOyvQSLC7EDHwPUglzOO8LvQQVtns8?=
 =?us-ascii?Q?zUhvmf74UMyj8NNAYFUUqh1MY2a74iUnh+bMSqwLYMCf8ofbQrrsnaYOIZgq?=
 =?us-ascii?Q?GdkHbiHQMTDfGaOid07jPyYShrSwHFqKk6Gld8IWKitARIs+RMxaClo2gn4k?=
 =?us-ascii?Q?ytlQhmDNaloq/mup8gNzVq3gKk/6G/jiIKBk4/d2XRI+ktSOc02y/1nfvdRs?=
 =?us-ascii?Q?wm9+tnijk2qus11FSaZVa5u/qi4CSebKZihrhlRDghUtnqJA1VDi3lQBaora?=
 =?us-ascii?Q?4zyd+yRGnnVUaPTL4mwGJvxo9mCYCq8FYDWUO6FcRFi1NkhV/0InOPJJQOTh?=
 =?us-ascii?Q?2lwEcGAuCMpRiAOC0JvY/8ZpkzlhiI9HP8rz0jSyytexolqPxyOhCKgxnMXK?=
 =?us-ascii?Q?eC4nyopAMRhFipL7CFEn4+uWGTPJeUvbwErvn0prYZGVBYSGu1ij34F+Q9DC?=
 =?us-ascii?Q?WNuPUgRlWvi+jMPXi6F0BdwzWHJomIzUWbeRWY6TLuBafqSMEJfpVZjZvxKA?=
 =?us-ascii?Q?uKoBFs1jQ5Q/pye4lL0I6uK9Q5g6YYFCfH4KRn3Ir3ewYfgLelt0AHfG+Ozt?=
 =?us-ascii?Q?dYb8gSJbGRURrxMdj6fxgPPF+sM8AWgkQfS4jcI8tYojdVNxiAZF7M/1QvW8?=
 =?us-ascii?Q?hCW6sFVlvaKNlrP2Fgwg5j9D0/vbhHyMoZaP8IbDhyD2vhMi+cjbThpxXkGZ?=
 =?us-ascii?Q?6PTNZwq1/YEBmhX3iFgmtNvzHgFChRfG5xg+LCIfiHLLib9PI6ctBDR2XsTJ?=
 =?us-ascii?Q?SE5JsI7q0MW0tfatZzycnYo5/q3x0aYYvimi/pbypg0ZnikDF+d3IEqjYBEW?=
 =?us-ascii?Q?EcYy8cdeo57+v6svMAHZrYkrnHpTF48VCKtAr7zfhY13koo30kbzvQCPr+dc?=
 =?us-ascii?Q?QScUtin7JaqsUMCnV8T1T4HrwOZkEUkhJqRbKoRXpekAxZ54cnrFfPkkafMP?=
 =?us-ascii?Q?GVlAxd+5g7RNlVji6zPnRADMZV5z2QZnvZbZEnn95x7gTw6cEleiiTl2MllM?=
 =?us-ascii?Q?7yHMmdcufhgHPNlS4UILkbKAIeZWSTMjvIKzom9pF5NakqVho8bGrWApsMWY?=
 =?us-ascii?Q?F/JWNdLwffwmWvWw5lfmTATviRuXu1FkwpFrNLTGAucB8NCysJpaZOT4/bCZ?=
 =?us-ascii?Q?fYZwIbFH5LnSLnkyr6BiYqmS1n4100XFUba/jHCM8GMbwRPaG57E0HY2Gi+P?=
 =?us-ascii?Q?+xQz8hNWnpAHnNQbwlJc3de57u+QzHM2KD87dU3D/frVcLiaWK8Cs0aAp+He?=
 =?us-ascii?Q?GyVC+g00Cg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8911a564-ea80-4755-1769-08da38140b9e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 14:46:37.3164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M88KFCdhteGu8Wl9a8M/vgy2pwb0rH/anCzKL5k+D6HbHN5UX3LzqMY5axFjIJn+6aFEH68n8vxGP4B5P58+Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8152

On 17.05.2022 15:45, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 17, 2022 at 02:10:29PM +0200, Jan Beulich wrote:
>> On 09.05.2022 12:23, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, May 06, 2022 at 02:15:47PM +0200, Jan Beulich wrote:
>>>> On 03.05.2022 10:26, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/cpuid.c
>>>>> +++ b/xen/arch/x86/cpuid.c
>>>>> @@ -541,6 +541,9 @@ static void __init calculate_hvm_max_policy(void)
>>>>>           raw_cpuid_policy.basic.sep )
>>>>>          __set_bit(X86_FEATURE_SEP, hvm_featureset);
>>>>> =20
>>>>> +    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
>>>>> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
>>>>> +
>>>>>      /*
>>>>>       * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (funct=
ional
>>>>>       * availability, or admin choice), hide the feature.
>>>>
>>>> Especially with the setting of VIRT_SSBD below here (from patch 1) I
>>>> don't think this can go without comment. The more that the other
>>>> instance ...
>>>>
>>>>> @@ -597,6 +600,13 @@ static void __init calculate_hvm_def_policy(void=
)
>>>>>      guest_common_feature_adjustments(hvm_featureset);
>>>>>      guest_common_default_feature_adjustments(hvm_featureset);
>>>>> =20
>>>>> +    /*
>>>>> +     * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
>>>>> +     * VIRT_SC_MSR_HVM is set.
>>>>> +     */
>>>>> +    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
>>>>> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
>>>>> +
>>>>>      sanitise_featureset(hvm_featureset);
>>>>>      cpuid_featureset_to_policy(hvm_featureset, p);
>>>>>      recalculate_xstate(p);
>>>>
>>>> ... here is about default exposure, so cannot really be extended to
>>>> the condition under which this is put in "max" (except that of course
>>>> "max" needs to include everything "def" has).
>>>
>>> Would you be OK with adding:
>>>
>>>     /*
>>>      * VIRT_SC_MSR_HVM ensures the selection of SSBD is context
>>>      * switched between the hypervisor and guest selected values for
>>>      * HVM when the platform doesn't expose AMD_SSBD support.
>>>      */
>>
>> I'm afraid this doesn't explain what I'm after. In
>> calculate_hvm_def_policy() the comment explains why / when the feature
>> is exposed by _default_. Taking into account patch 1 (where another
>> maximum exposure of the feature was introduced), I'd like the
>> comment in calculate_hvm_max_policy() to focus on the difference
>> between default and maximum exposure (which could be as simple as "if
>> exposed by default, also needs exposing in max, irrespective of the
>> further max exposure below(?)").
>=20
> So something like:
>=20
> /*
>  * When VIRT_SSBD is exposed in the default policy as a result of
>  * VIRT_SC_MSR_HVM being set  also needs exposing in the max policy.
>  */
>=20
> Would address your concerns?

Yes (with - nit - the double blank dealt with, perhaps by inserting
"it" and maybe a comma).

Jan


