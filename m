Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17A3415BE4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193618.344885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLrT-0006qv-C0; Thu, 23 Sep 2021 10:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193618.344885; Thu, 23 Sep 2021 10:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLrT-0006p7-8f; Thu, 23 Sep 2021 10:21:51 +0000
Received: by outflank-mailman (input) for mailman id 193618;
 Thu, 23 Sep 2021 10:21:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTLrR-0006p1-TU
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:21:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f2f9240-1c58-11ec-ba25-12813bfff9fa;
 Thu, 23 Sep 2021 10:21:48 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-cbpoAIkrNb-bo3_13yAlxA-1; Thu, 23 Sep 2021 12:21:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 10:21:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 10:21:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0167.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Thu, 23 Sep 2021 10:21:42 +0000
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
X-Inumbo-ID: 0f2f9240-1c58-11ec-ba25-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632392507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JrgImIEQSTJMYdhj/jza9NFuxXx8r4A++zE1f1dQ9+c=;
	b=ns2jo6l+r38FGF15zHYATHRVxm7x99pjC3hle4XlgZyJDqlCoxHNcd1k8tOWWVW0RIW0lJ
	muj0s8S4acoSCTotBgCom/xz4/Wb3h4L6Vy+0cJ1ZDkphOzlbiBvCbDwBPy1WRcSmLb9XM
	AtxOHlnlRkGaH+fTfV5RcJNOTi9yvm4=
X-MC-Unique: cbpoAIkrNb-bo3_13yAlxA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1YFijOdOmhgTceZlvK6Ihwe58MXzfQQPCf1CMfuBqJUotrJ1q/4tASsFqAQ5q2h9Rf6ljflzc0JUYvOfB5Zm1mfK3UjtOv++vM2o293N7sx4wpT3bHK7yPeGC3AODpuE6uXio1DMzyVuwcXXv2p2wE/yHm+uPHD9vHRSwScKMmWYjrYmnVbQa3MnhT6uYtOnU51p/xreyoYX6B7a4EVghOxtm/Dv+GGBRplKI87AysXFQW4+Rv6VAV2pPq3mz8WpDWQ1nH2M1+qpdiOiKMGg6HUMAry5MbVHNnW+ZY5QHkbd0CHDzu3yI4i3gS5m96C8UFsDZl1oDNhXIGMJ8rUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NiOTVezOCSVmFKxp430lQNuv8bpFt1RKty7SyjiGnVo=;
 b=ZL20qdFnntRplvNgjwW40dDMgaRJQds5jUrMmYRcVfYIk9GQTFoXanSbEmExcHOnwcLpqQeDqgEhNZGaqj9U7QuZfUALfw+cRVfcFbvSQy/Ze/VXWeuyNUFNdTQ1qPmQyLqZN4agtCbcQmV0irQNaNJ9GYbEs+Yxf8taCMMPeDI3lo9VTvRqEuptUQmrNKVmvfchtJjepMar/Zrimifg4G+Qhfay77d2aRUO7JqmsPU7INtpU+w1p5L9b2b1S//d7/WG8sa89QOcfvmFSKSJsSywWmQF7D/MAhneWXTcDDMMTjCaonPApuuPY6GsJs1EUOlQwrKK/bOpmzT+Akm/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 5/9] x86/PVH: actually show Dom0's register state from
 debug key '0'
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <4ae1a7ef-d6e8-75db-ddf5-987f10175196@suse.com>
 <YUtQPUHjZ8GnfeCE@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d58fdb48-0452-321a-5ded-d949740682c5@suse.com>
Date: Thu, 23 Sep 2021 12:21:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUtQPUHjZ8GnfeCE@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3140388-e855-4087-5cd7-08d97e7bf0a2
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66712D1FD667D57034C712DAB3A39@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eL8oJ3A+BVnt1M8vXs1UIhOIpLKMvt8v1QWfYo5M9GodvQA54tdY+VYoumERLFPaaVfVtqe04WtX6E3J2lh6oqtc6lxXCETLoxQt7LIANw22TFzbxjQ+a9uPaY38pfi3T+TFmKr8t2FfIv6ODTx1qC8OyEope6mBV7+/A0MvPF4Q1LnR1atip/rXfvP02rVPFwHjzV8o6Mi1lXCGH9kvbIiWO539jX1j19EpFXrQz9pu9X9HrJFH+ZTBLLZITbpTdqumLlFaY0J1v08DelrYUSDs9oN5GpQ1vImNm8IxowvjYd7oKGNyoZ2sxNZxRQQfaw7040D0XyMulNYoHdaGFaM1+ueAqGnwN+Ps++sPkv4ISiA8JR8F8uTLi9GJiaZ/65JazO/XxjogYDOxdeQOLNFWX0aMipxPVs7FhtHqqH3t6n3P8T7VNTfvVj4kR7tg4xnnd9c5fk0oGLpsehQorIBiirbudGJADRDKwewRkYfo+zPy/vpKQrQpm747KSXpj3xfTh/mTH3AIC8Rv+0QIN+AR9nIlp9NpCL8TjUPMyHB6lf5E/XwIy9eq70uix37G5a+/mwlJHPkeNudtjoS7rujrDzwQFbmu8lxL4+ya7rnA4wO7ND0eN66naydAIELivJgzWSGdsXCSui7VucmaZLKEAUIHplI+S2HsZM18Kv6UoKBtmwto1zVagea2xCFkGbVsSk+pQABnaeasjvFy2iYCCDzy0igwOfpPSEImdg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(16576012)(53546011)(8936002)(8676002)(36756003)(66946007)(6916009)(2906002)(4326008)(54906003)(956004)(2616005)(86362001)(83380400001)(66556008)(316002)(26005)(31686004)(5660300002)(508600001)(186003)(31696002)(66476007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P6R4TG81A0bv5CfmXqoCW7DbFDtHuvwhH/dN2of7P1iRR2H1zEuapfR3sgu2?=
 =?us-ascii?Q?bNxGE2+nPMnxawotlxt3fyKxVTWFO5XbNG3nA+reXJVkLwXkw02OsQcrx1BQ?=
 =?us-ascii?Q?2nKoqEa79OAM0Hsyhz/TikWpdZ4BlKPFw0mJCllKsMGKJ2OYzkZooycYUiwX?=
 =?us-ascii?Q?BRGk8o3sBsrMpTlPqr3qPr1Jf6w5cEfLlM6AU1tkUDZ/O+KNITcMnw5w1nXW?=
 =?us-ascii?Q?VLbuu4eNlmdeEZANv8BDxtksYqRfZoz18uh2WgxaRYvCAVIPq8kRP1d3fR9p?=
 =?us-ascii?Q?0occV1+0Fa0z33uuCsKXy6O7fuWCfy++krx96yhhXxx5vDVFmVy/blw05Lhg?=
 =?us-ascii?Q?zc64hNksyw3bwgFszTTBFvXg5O8zWEvOYvyOc3SSyQLqohKLyFggVaHr3NhI?=
 =?us-ascii?Q?TCCp5een6r4rOsEU8/xiT8mV5LyfFkcl9DCFDn7w6eXPaUDJfw4RD8y0xcHM?=
 =?us-ascii?Q?z0mY3vBqhCivtzYs/m0VsQTkZqqh2AShFmROGu8wKk/ZWwDWoaunmJ0FczC6?=
 =?us-ascii?Q?mqQd5w0hVV8nmbRpv0Ts3InDrwOKxA8O2RdYwa+B0TzZKWLerr/UDSpXfsSA?=
 =?us-ascii?Q?nsuDhaOcyWfvFl692bKUd3mvmRz3Vi6dCCsxaI/9UCRVuIcyECtyTumjwBMD?=
 =?us-ascii?Q?8PkMBCfsH96whjCjbKRVoMSHdyc/nRfGTDNCIlPD6xo3/MEHc8ii/n/QE0pq?=
 =?us-ascii?Q?D9Tp94TV9SovRjS64glQI76jPt5P767kWuZXRbmER3JJb3dZFyy+lHV3fHSG?=
 =?us-ascii?Q?plYjZqpfnTHQuJAWGBCS2sm+NFf9CkCI50DqXswMdea5Vkke3kV5kspEHxcy?=
 =?us-ascii?Q?BqHlpBdG+gc7g4FqXD8SlQNrRRKn9kUgQ8pNJDTB+YgeuvouaojRsc0WQA3W?=
 =?us-ascii?Q?cux+L9i+w2vmtoZQ2L4go4e20l+QHuWFeNvUfk0NEmBbHJH15nUkxNbNiaVa?=
 =?us-ascii?Q?7MPyENlTGt5eo5IfzUoBv3eKosGzOgH03nmUJn3EIt+ithsCpOdZ92RfVWxr?=
 =?us-ascii?Q?FUhtWcD2otGcAgOvlDtRbL+77pzYxOICkaXuy2JieaaIFXX3cmUW89XthtkJ?=
 =?us-ascii?Q?tSn6Q2pLpYWhJh+3yz8Fz5OhNqXtvqN5Gsi7x5kVz9ROv3s+19CCCcrIV4G+?=
 =?us-ascii?Q?uw9OZIEO7CY5gh8vUIT9C/hEpWHSMkDKO4KVqL0PgzYssHnW3xApECaaIjRP?=
 =?us-ascii?Q?GLJeCoteVitULYA3qqq/I5F0VbhS0eFtJx9Ivqeb07aCGUBF/i20In7iZVhb?=
 =?us-ascii?Q?tacRDbSOhLOTuBndOkOEixvnXC6lBLKEhea/c7xP1aAhKyUD2VIhQpSIM+ar?=
 =?us-ascii?Q?AQS/aEtW/dKFCuexvTKEdPDF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3140388-e855-4087-5cd7-08d97e7bf0a2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 10:21:43.4004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laA7kdw5RTk+5xQ3cfdp1hcJFjBmQLE3IhxQw8CH21+VHr8K72SpyZQcbRKLnPPSeul5YROW/tJkHBxJhUC0lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

On 22.09.2021 17:48, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 21, 2021 at 09:19:06AM +0200, Jan Beulich wrote:
>> vcpu_show_registers() didn't do anything for HVM so far. Note though
>> that some extra hackery is needed for VMX - see the code comment.
>>
>> Note further that the show_guest_stack() invocation is left alone here:
>> While strictly speaking guest_kernel_mode() should be predicated by a
>> PV / !HVM check, show_guest_stack() itself will bail immediately for
>> HVM.
>>
>> While there and despite not being PVH-specific, take the opportunity and
>> filter offline vCPU-s: There's not really any register state associated
>> with them, so avoid spamming the log with useless information while
>> still leaving an indication of the fact.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I was pondering whether to also have the VMCS/VMCB dumped for every
>> vCPU, to present full state. The downside is that for larger systems
>> this would be a lot of output.
>=20
> At least for Intel there's already a debug key to dump VMCS, so I'm
> unsure it's worth dumping it here also, as a user can get the
> information elsewhere (that's what I've always used to debug PVH
> TBH).

I know there is a respective debug key. That dumps _all_ VMCSes, though,
so might be quite verbose on a big system (where Dom0's output alone
may already be quite verbose).

>> --- a/xen/arch/x86/x86_64/traps.c
>> +++ b/xen/arch/x86/x86_64/traps.c
>> @@ -49,6 +49,39 @@ static void read_registers(struct cpu_us
>>      crs[7] =3D read_gs_shadow();
>>  }
>> =20
>> +static void get_hvm_registers(struct vcpu *v, struct cpu_user_regs *reg=
s,
>> +                              unsigned long crs[8])
>=20
> Would this better be placed in hvm.c now that it's a HVM only
> function?

I was asking myself this question, but decided that the placement here
is perhaps at least no bigger of a problem than putting it there.
Factors played into this:
- the specifics of the usage of the crs[8] array,
- the fact that the PV function also lives here, not under pv/,
- the desire to keep the function static.

I can certainly be talked into moving the code, but I will want to see
convincing arguments that none of the three items above (and possible
other ones I may have missed) are really a problem then.

>> @@ -159,24 +173,35 @@ void show_registers(const struct cpu_use
>>  void vcpu_show_registers(const struct vcpu *v)
>>  {
>>      const struct cpu_user_regs *regs =3D &v->arch.user_regs;

Please note this in addition to my response below.

>> -    bool kernel =3D guest_kernel_mode(v, regs);
>> +    struct cpu_user_regs aux_regs;
>> +    enum context context;
>>      unsigned long crs[8];
>> =20
>> -    /* Only handle PV guests for now */
>> -    if ( !is_pv_vcpu(v) )
>> -        return;
>> -
>> -    crs[0] =3D v->arch.pv.ctrlreg[0];
>> -    crs[2] =3D arch_get_cr2(v);
>> -    crs[3] =3D pagetable_get_paddr(kernel ?
>> -                                 v->arch.guest_table :
>> -                                 v->arch.guest_table_user);
>> -    crs[4] =3D v->arch.pv.ctrlreg[4];
>> -    crs[5] =3D v->arch.pv.fs_base;
>> -    crs[6 + !kernel] =3D v->arch.pv.gs_base_kernel;
>> -    crs[7 - !kernel] =3D v->arch.pv.gs_base_user;
>> +    if ( is_hvm_vcpu(v) )
>> +    {
>> +        aux_regs =3D *regs;
>> +        get_hvm_registers(v->domain->vcpu[v->vcpu_id], &aux_regs, crs);
>=20
> I wonder if you could load the values directly into v->arch.user_regs,
> but maybe that would taint some other info already there. I certainly
> haven't looked closely.

I had it that other way first, wondering whether altering the structure
there might be safe. It felt wrong to fiddle with the live registers,
and the "const" above than was the final bit that convinced me I should
go the chosen route. Yet again - I can be talked into going the route
you outline via convincing arguments. Don't forget that we e.g.
deliberately poison the selector values in debug builds (see
hvm_invalidate_regs_fields()) - that poisoning would get undermined if
we wrote directly into the structure.

Jan


