Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F344D7B79
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 08:22:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289926.491637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTf1n-0002xi-Ni; Mon, 14 Mar 2022 07:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289926.491637; Mon, 14 Mar 2022 07:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTf1n-0002vt-KB; Mon, 14 Mar 2022 07:22:03 +0000
Received: by outflank-mailman (input) for mailman id 289926;
 Mon, 14 Mar 2022 07:22:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NoMf=TZ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nTf1l-0002vn-7v
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 07:22:01 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dc2f331-a367-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 08:21:57 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 00:21:55 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 14 Mar 2022 00:21:55 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 14 Mar 2022 00:21:55 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 14 Mar 2022 00:21:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 14 Mar 2022 00:21:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 14 Mar 2022 00:21:54 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BL1PR11MB5287.namprd11.prod.outlook.com (2603:10b6:208:31b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Mon, 14 Mar
 2022 07:21:51 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 07:21:51 +0000
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
X-Inumbo-ID: 6dc2f331-a367-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647242517; x=1678778517;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QCoRZakBNp6atUb69Adv0fUItxLm34NJw4N0ncZ6p1E=;
  b=f8l9TllJqT4IoYjM1KGmjLBR41bZrS+5zS4cR9mm9wVQ8OFamp0FbRMc
   cZed2ZNomGj/poQ6XKxbxq+flSWvCoznrzj2K9RasboTt3WRLgDMPUkZY
   Scneufm/g58eaVZY+3fMFZ1wstT2hcIH9dhhDUVG+Y2+BMzBhJb3zEwZW
   kzhk6toRYv1X0YG/9XcFZSiHawA8D+wLngMDPqK0dfnsIucRM/WSlJoT/
   omoEdFMo6+Se1Aqd0Anxow3zxN0j5hUkDtOG/F7pEukkK0Hb05ixZZNWe
   I8lxyqDw67Y4dDuj7OEXggOvLJ2sZgKbWwJQyeNeve19rDC1z1tm1VGCW
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="342380662"
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; 
   d="scan'208";a="342380662"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; 
   d="scan'208";a="782574952"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzsY2CD/HLQiaTIB0aNiXgsvzlqzgZCcvL4DqTdzWDL7HYYo2DvWHseI8HIyyyuFAEIwF5fJy2b0sjM02HUwA2cvwVAMZT7w8Nu3kVB9tUT7QTsagEfaQ2rw6rzy+TzIeViWOvc/fV6Ze73G7h4zrD05p2giJctCUalF9t3GYPcbhhIHatakR3eLxHYtI6LnQPO8hbA4dqKch11H4J4JcR3linM24wrcU25NVn/jMR8mZPl7xDXzDC5wGxHubz17sw2lqeWgH6BFMUrx3qA1IfNm0Y3LxFnSAirdskY7+a7nx+Bv0NVqjF9KCB/RjBqPEN6AHIXLjb0warJdZcw6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jbx0T/F9cPynn4YQwqMTpQSADVVy0D40ks1XZzL4JgI=;
 b=GozqqyzfztO1gPlSTwllyt6CFRWimxy6nMJozi/s0z8BqA4n3PIaKao6U3LWd1mD1fqK82bZ4acpTnvNePrRzsxe2R75AVvJoaM/kkA/xWbGS6kXbE1AO0OnHnEprpIPgf2WOIbLPBw0JH3AIVe2uU0t7Q0BA3+h2c8iiSzay6ggjWZ0yq85KyThcd4nK9GKcmjKMILYfsRnVXAvwz4fpswIHsKRx6mxbU3OYb6bRdUD6scl1HahkWQ/dMExlKyVuRSXh/pMLfbZEUCpK9SH+LgcRN8qG0ilmkxF0HX/EMFPJotFWBV4yjzLKTJ+8NistNq2pSPu1fsYSEcdTSdAoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Beulich, Jan" <JBeulich@suse.com>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Pau_Monn=E9=2C_Roger?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima, Jun"
	<jun.nakajima@intel.com>
Subject: RE: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
Thread-Topic: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
Thread-Index: AQHYNK72F/eE81SIoUqvccI09xMIhKy+fRzg
Date: Mon, 14 Mar 2022 07:21:51 +0000
Message-ID: <BN9PR11MB5276E96E39209EDCCED5E9198C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
In-Reply-To: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0473a384-871d-4427-63a4-08da058b4f28
x-ms-traffictypediagnostic: BL1PR11MB5287:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL1PR11MB528749CCD498362D6040F9928C0F9@BL1PR11MB5287.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R502oeyNKbF0xWO9tEi1GpKY29qMrCxa0vzAYrkrsPh51fUU7RpWcErEz5scyp9IDy2m1l1MyscmmCp7D8B476nhkXpCnkoWZtNz1tM/DxYCVXsLGcvswRrJSC4PzIpXmh0aLte6CEoq5y/YXYTFf810VOYimHun1wZQ5xKAegyiCV5ZLiL9q726nRbarcOruypwwL19JOAVub5T0m3bNARFqxjkGb2NVe6ak+oQW/fiugT6CjfSZQyONRukvY7W5JWg1tYZZULcuOtIMZjL3YYIdDelbAh6HXA4+m7z38lsvgYmyY5ddsQs8puBx+1uU08q2Kxf+ZrOjs5qkmlLrqoX5/kUsjxd4LbK/T5vQpUCyuuWAWo0cQpIQd4qN06iJ43cpbZnlb/MOeyYPfZXJLDQVabNW2/0Upb5Qlz3JjyN517zCCfzqNCjTLmL5dIawkMYpYyPUI8fsrB6Iwe8ave6ZQtKZxakRHyAibTjHGKvKcqsLQMSxoEo2UwL0o5WCSoXzRRHemaw+kYcghE3sK+y3q/wU+g4H9rnAAz5Y/fJsK9w51l93dTakQHauscbK1OiJWyvMijOkaOuSAKgskEodygYrea1Hiqk/7Fsdbx5YO6RguKSxRPw6bmgIWAsLBq6DWxIJ4pD9p3Sh+gUhmb7+jM1/1cn25I3g/xfFuTM9zR2DC948027+/OKi/VZJMPLFOiqUgX8EcOoDxjaoQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(55016003)(9686003)(33656002)(107886003)(2906002)(83380400001)(122000001)(66446008)(71200400001)(8936002)(38070700005)(66476007)(4326008)(64756008)(82960400001)(66556008)(26005)(76116006)(186003)(8676002)(66946007)(52536014)(38100700002)(86362001)(6506007)(7696005)(316002)(54906003)(110136005)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hMjpJ0gVX/0EcJv+SQ4Q2WyaRrMTYlxYnTEWyK7WzQsY+X4Y6z+JgQhbH2?=
 =?iso-8859-1?Q?cp0XVNUzhSsFOF96nLbigKPC6hkTnJb07wrRTpFoHXJjpGBvyc0Myi07/S?=
 =?iso-8859-1?Q?yVruJb1tdwn/VLLaVryNgB+Xz9Lcus9npWflYe9TO8m36oTwzReKKXDbIr?=
 =?iso-8859-1?Q?+f2rSsEMWVE7JqMyVxDM4F3RFtOtgLJI1gbE1Ql9dH0Hkqws+d5Fwcaaq9?=
 =?iso-8859-1?Q?g1it51vslqwAh1l7SZzB9QFbCurH/OkrGYwZ0iM83USxCBe7yPcc2BexzJ?=
 =?iso-8859-1?Q?UfNa9IH5jtWb2HsoAoZ1gaNV1dCr7mhN+JCQsSuFekTZVtBGTnIRU4OxUq?=
 =?iso-8859-1?Q?8nTiWm8bow/vGbVwdD+tO1RudP93OVZFzn7M1+5WzIFQ6TOVBG0gTPVQ9p?=
 =?iso-8859-1?Q?h8tlKJWf6N7WUp5aqidPsnuZaAq8PtuvehIMfBmiAYoqf4ezgRPs5qBLpi?=
 =?iso-8859-1?Q?Lp72j3RYx3Ij4KXKWnjhfLCGBZYXp7zWGXB0WGV8ptAfTTcPRaG8EI53kB?=
 =?iso-8859-1?Q?Ih68cK8x0ssOyXsZrCUXW9wVX+xH/+MKmY6TViUL2dZVCGEcA11WD9dE5X?=
 =?iso-8859-1?Q?o6j/FlmTA+8SgXZXsWG+JAxALaNnm7DU8UigZpctm+ncnXGgEOBdHG1mcK?=
 =?iso-8859-1?Q?69tJGEvFgodHMP/vrGKijb42XDGX8IkffnUhQcq5PInJZMHHbBS1tamWTD?=
 =?iso-8859-1?Q?cnMxmR+PIuTAUyj+Q+8TIVRp2R7hpnHahVKROkyOFy0Aqw12otIUkIDB0D?=
 =?iso-8859-1?Q?/P0Q8WujhIIurqpCJAGhjLiELLDbCgTTyQHdZPjpfhZuNDANCrD5huYzUV?=
 =?iso-8859-1?Q?XWBh+Oo0K45GHrjFFpS72/rW7SGBK61mKg8331+GvVlgnM8uhwDKS7NiAM?=
 =?iso-8859-1?Q?zjXX69fLZKtBQN/ED1iBEYrjYDaxUiKOYzxX5sxkjv7+5p5I1fzA6eMkqx?=
 =?iso-8859-1?Q?SRO+2hVDxrbJhewVLxsxMLKhk6AwAvvjebHdaM0oU7y16iLlwRl68CQpJc?=
 =?iso-8859-1?Q?DudQASu9ZivVGyVK0GU7sMbHmywI3ozcNJ9jojfnEgMr3kwKjDt7YsvYGD?=
 =?iso-8859-1?Q?6B4GOjpSWUzDwbPb00DX1jnIrE8AQMBRWrtG6PFfa8KGqyIk+hISxzMtEO?=
 =?iso-8859-1?Q?VwGuOw50pwLTXutXFtKxq6kHO7KAr9QCPa4ap9/brGkLBT6fGa+cd1ycLk?=
 =?iso-8859-1?Q?nXMo1OjLKcVjgtH8N6TNFsyGvQ7iaGT5LeIRDAhEiYhMU/DwR6hfX1r4Yo?=
 =?iso-8859-1?Q?h7k95BZexz6wZaAhlvG42EMH1cwNE+CQJmdyeDI1szDraWQ/3OwXFukYc5?=
 =?iso-8859-1?Q?W104qnGSjPsFM5P+QicqfpP4rp9RrIHVGav9k+YI0SajovPvy+hqRI9QAq?=
 =?iso-8859-1?Q?Brwxnv3tqDR2cL/P/rnFxi6epElrB9BWO3OH8JJcYV9feQPxJSmIzTPyiI?=
 =?iso-8859-1?Q?/sRuUi+Hai7fT5egVOzMGOb5/VsEtV1zBBXvE7KKVdOG+iD5K16XFs094r?=
 =?iso-8859-1?Q?HJ9pJdjs9UF0Fds+HHqmwO?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0473a384-871d-4427-63a4-08da058b4f28
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 07:21:51.1268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aZc49Vgbn71e7hz4ZDS6XZNazzqKF/5hRE+lzuAZKS9u4OAkTdK0mZvYtRXbHvIzr6rIJ4vcf1L/lgGhtLmYyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5287
X-OriginatorOrg: intel.com

> From: Lengyel, Tamas <tamas.lengyel@intel.com>
> Sent: Friday, March 11, 2022 2:45 AM
>=20
> During VM fork resetting a failed vmentry has been observed when the rese=
t
> is performed immediately after a STI instruction executed. This is due to
> the guest interruptibility state in the VMCS being modified by STI but th=
e
> subsequent reset removes the IF bit from FLAGS, causing the failed vmentr=
y.

I didn't get the rationale here. Before this patch the interruptibility sta=
te is=20
not saved/restored thus I suppose after reset it will be cleared thus align=
ed
with RFLAGS.IF=3D0. Can you elaborate a bit how exactly above problem is
caused?

>=20
> Include the interruptibility state information in the public hvm_hw_cpu s=
truct
> so that the CPU can be safely saved/restored.
>=20
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
>  xen/arch/x86/hvm/hvm.c                 |  9 +++++----
>  xen/arch/x86/hvm/vmx/vmx.c             |  4 ++++
>  xen/arch/x86/include/asm/hvm/hvm.h     | 26

Why is this change only applied to vmx instead of svm?

> ++++++++++++++++++++++++++
>  xen/include/public/arch-x86/hvm/save.h |  3 ++-
>  4 files changed, 37 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 709a4191ef..b239c72215 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -897,6 +897,8 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v,
> hvm_domain_context_t *h)
>          ctxt.flags =3D XEN_X86_FPU_INITIALISED;
>      }
>=20
> +    ctxt.interruptibility_info =3D hvm_get_interrupt_shadow(v);
> +
>      return hvm_save_entry(CPU, v->vcpu_id, h, &ctxt);
>  }
>=20
> @@ -990,9 +992,6 @@ static int cf_check hvm_load_cpu_ctxt(struct domain
> *d, hvm_domain_context_t *h)
>      if ( hvm_load_entry_zeroextend(CPU, h, &ctxt) !=3D 0 )
>          return -EINVAL;
>=20
> -    if ( ctxt.pad0 !=3D 0 )
> -        return -EINVAL;
> -
>      /* Sanity check some control registers. */
>      if ( (ctxt.cr0 & HVM_CR0_GUEST_RESERVED_BITS) ||
>           !(ctxt.cr0 & X86_CR0_ET) ||
> @@ -1155,6 +1154,8 @@ static int cf_check hvm_load_cpu_ctxt(struct
> domain *d, hvm_domain_context_t *h)
>      v->arch.dr6   =3D ctxt.dr6;
>      v->arch.dr7   =3D ctxt.dr7;
>=20
> +    hvm_set_interrupt_shadow(v, ctxt.interruptibility_info);
> +
>      hvmemul_cancel(v);
>=20
>      /* Auxiliary processors should be woken immediately. */
> @@ -3888,7 +3889,7 @@ enum hvm_intblk hvm_interrupt_blocked(struct
> vcpu *v, struct hvm_intack intack)
>           !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
>          return hvm_intblk_rflags_ie;
>=20
> -    intr_shadow =3D alternative_call(hvm_funcs.get_interrupt_shadow, v);
> +    intr_shadow =3D hvm_get_interrupt_shadow(v);
>=20
>      if ( intr_shadow &
> (HVM_INTR_SHADOW_STI|HVM_INTR_SHADOW_MOV_SS) )
>          return hvm_intblk_shadow;
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index c075370f64..e13817431a 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -1323,7 +1323,9 @@ static unsigned int cf_check
> vmx_get_interrupt_shadow(struct vcpu *v)
>  {
>      unsigned long intr_shadow;
>=20
> +    vmx_vmcs_enter(v);
>      __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
> +    vmx_vmcs_exit(v);
>=20
>      return intr_shadow;
>  }
> @@ -1331,7 +1333,9 @@ static unsigned int cf_check
> vmx_get_interrupt_shadow(struct vcpu *v)
>  static void cf_check vmx_set_interrupt_shadow(
>      struct vcpu *v, unsigned int intr_shadow)
>  {
> +    vmx_vmcs_enter(v);
>      __vmwrite(GUEST_INTERRUPTIBILITY_INFO, intr_shadow);
> +    vmx_vmcs_exit(v);
>  }
>=20
>  static void vmx_load_pdptrs(struct vcpu *v)
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h
> b/xen/arch/x86/include/asm/hvm/hvm.h
> index 5b7ec0cf69..2fb7865a05 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -720,6 +720,22 @@ static inline int hvm_vmtrace_reset(struct vcpu *v)
>      return -EOPNOTSUPP;
>  }
>=20
> +static inline unsigned long hvm_get_interrupt_shadow(struct vcpu *v)
> +{
> +    if ( hvm_funcs.get_interrupt_shadow )
> +        return alternative_call(hvm_funcs.get_interrupt_shadow, v);
> +
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline void
> +hvm_set_interrupt_shadow(struct vcpu *v, unsigned long val)
> +{
> +    if ( hvm_funcs.set_interrupt_shadow )
> +        alternative_vcall(hvm_funcs.set_interrupt_shadow, v, val);
> +}
> +
> +
>  /*
>   * Accessors for registers which have per-guest-type or per-vendor locat=
ions
>   * (e.g. VMCS, msr load/save lists, VMCB, VMLOAD lazy, etc).
> @@ -863,6 +879,16 @@ static inline void hvm_set_reg(struct vcpu *v,
> unsigned int reg, uint64_t val)
>      ASSERT_UNREACHABLE();
>  }
>=20
> +static inline unsigned long hvm_get_interrupt_shadow(struct vcpu *v)
> +{
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}
> +static inline void hvm_set_interrupt_shadow(struct vcpu *v, unsigned lon=
g
> val)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +
>  #define is_viridian_domain(d) ((void)(d), false)
>  #define is_viridian_vcpu(v) ((void)(v), false)
>  #define has_viridian_time_ref_count(d) ((void)(d), false)
> diff --git a/xen/include/public/arch-x86/hvm/save.h
> b/xen/include/public/arch-x86/hvm/save.h
> index 773a380bc2..e944b1756a 100644
> --- a/xen/include/public/arch-x86/hvm/save.h
> +++ b/xen/include/public/arch-x86/hvm/save.h
> @@ -165,7 +165,8 @@ struct hvm_hw_cpu {
>  #define _XEN_X86_FPU_INITIALISED        0
>  #define XEN_X86_FPU_INITIALISED         (1U<<_XEN_X86_FPU_INITIALISED)
>      uint32_t flags;
> -    uint32_t pad0;
> +
> +    uint32_t interruptibility_info;
>  };
>=20
>  struct hvm_hw_cpu_compat {
> --
> 2.25.1


