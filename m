Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C35510FA5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 05:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314308.532307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njYd3-0004e5-E3; Wed, 27 Apr 2022 03:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314308.532307; Wed, 27 Apr 2022 03:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njYd3-0004ac-AE; Wed, 27 Apr 2022 03:46:13 +0000
Received: by outflank-mailman (input) for mailman id 314308;
 Wed, 27 Apr 2022 03:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/sE=VF=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1njYd1-0004aV-Rx
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 03:46:11 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92997f2e-c5dc-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 05:46:10 +0200 (CEST)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 20:46:08 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2022 20:46:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 20:46:07 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 20:46:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 20:46:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 20:46:07 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS7PR11MB6293.namprd11.prod.outlook.com (2603:10b6:8:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 03:46:04 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 03:46:04 +0000
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
X-Inumbo-ID: 92997f2e-c5dc-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651031170; x=1682567170;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ED0zf14XLPDcAAB3Y/J2KkZc5MWKv9PWCbkFeXzBf/w=;
  b=MG2WohwmOp+ARkX/UXeLKI9LhNzgfROiA3nHbzp14K9Hdq/1xAl16tiw
   JEAnDZE+ph9pL6woZEd9gbIm8xEkxckKFZ4AQfCmtTsOYsFEoSHrRVhgK
   82qhh/z1AqBcz4L2zA3tJ11iksem6T2ReP6xO6mDee/VbNqKbCYz0pYTd
   1ej3cTQA+7w8GryCWXSvVBoEEXrmk/XaSf1xa8lF80jyQsPSffrwvNCiE
   qvy2pvWnlU6Txxk9IB+z98MZzm+QZHCgz0mEgqxM9VxCPgfNq4UCXTf/l
   geDCpctN5SvWbvzyrHsWdNS0mC2Qx0+oEi/irY8MZMurlY6zn/oQNi46R
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="263392588"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="263392588"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="650509562"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W35q4bBPWOTvaRH7fUOKQk3b3FmYx2ysaFfNEsTo5F0nlw9JdY4b61R6qPYbvh4aKj3jn897ummhj9cC70ADgTdooJoociLrE7KGkUIh42uSOaf+3aDy6hCk3gyY1mRQhVAIIrhBvOVTwtaSIJE3S8pczeEHsaU8WSt88pFz1tEGAvm+11upA3x19qX7qXfA0IkEoVq1ekbXvubct7UTvSr7fDVgYhix7mRCxTg6hTV3R1eSAzmI6Wkspq9dGeNRXMmeowlg6sbFF6gecXacD6ODi+nWtEdnZ8x65EvY/Ty1DYskflOgomeMGn8atExK9MoRsIQwynlQMttYibhKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MESCVaAqrZZfas5dAL1T/f210czPz9VfNXs2i7kXDdI=;
 b=dn4amNsr4qVUzDf+bCxlmWxK7zIkUrRvd0cMzz0yxsNcfHd2oCtwOlcuuOSsjoDYuRNSlOMS6n0V0Peoj3syQfUDxB5EGj1SfF6nOBqUw5KeZH+JAJYPB1mg5urGfjFRfQ29UiUaOMbXMEUI1l9nRY2nXpUZBU3iVuin6Tn6OE9sH3eKz/EcY2gdEwpssy1p2QxwyZxTbIPB/jZ3Bed5mPoA1YWa+3AKm0ODz8UnLtpxDkVisr/cda/X+Gmxg9xdDtPObv9qrWaj8lBeIMJ4fCJhClVoG9DEU4Y0xbK+ah/SacZWFLBgkjeHb2FlDwW5bE43FhqX8BZbHFP3hwUhFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, "Beulich, Jan"
	<JBeulich@suse.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Pau_Monn=E9=2C_Roger?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, George Dunlap
	<george.dunlap@citrix.com>
Subject: RE: [PATCH v5] x86/vmx: add hvm functions to get/set non-register
 state
Thread-Topic: [PATCH v5] x86/vmx: add hvm functions to get/set non-register
 state
Thread-Index: AQHYQE0JDO4TZ1lTNEeFxdnKer9Q960DUDGQ
Date: Wed, 27 Apr 2022 03:46:04 +0000
Message-ID: <BN9PR11MB527638D2BE6087C1A4D796D48CFA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
In-Reply-To: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1347a452-7bad-42fc-11c7-08da28007460
x-ms-traffictypediagnostic: DS7PR11MB6293:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DS7PR11MB629353C9AE08981BB19B121A8CFA9@DS7PR11MB6293.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: amAh4NrbGMk290MawpG17Lku3SO5Snq/dEn4K3UYPLjXjm7yNQe5VSEIUo5/LkbthsbrqCydDb+V5+mZtoqHx+O40YPVw23zwG5JEx20EgKnGJyWtohXUYliDv1JigCJVivLysiTpfqwGZeGDMw/+ZV3aV2q3LQ6IpbbhHRfiAomTfMYuxnTaB5FJyVa7rZVxLBPSRTD1Axj3+L9eXb3rLFaxbcZeaOOj02u15L8QzTvPgA5I4BK7NX74JBR3Ik0MYNEFwygoi5D9VnLP4rioA+lebs3WvrS/YI6M+jRXkyz38rIvvPSMm5FYNWtFCBn08Y+M+x6C1VkcZpEyVZjFVDbYmzvJwlnP03Ptv1jSf+RgA06pDN+1w0Q29fbgl0P+de5YhMvYcJ/c0iktZgP4r/J4WklVcTetjF6zYFI86385NIwcd7oUJsovTB0oLbXJe1uqcM7wqkHMwyhd/EIk4JjjTw3XB25fDIFeeDRUD58/SkRg8mlshSbX/bN9wF6wcSdW5/bWdAGbujUR+zNDGW05KiMcby4XOL3DaeUISYHQcAPcFI4YKxZ8IgT4+aQ4Ylq+XCs+QQyMFejSvD9qL02jWAwkoN9A83WnITZ+AKL/hF8OzuXBB3yZX9g+JkKOowdtfyAgDMJO4ok91/qKxUoLW+CQODGoM985AFvPhpeQXh+DZh/4lvAdCiHCTge4f1SnpaJj4tLqk/7CwamlQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(76116006)(6506007)(122000001)(4326008)(8676002)(66446008)(64756008)(83380400001)(110136005)(5660300002)(55016003)(82960400001)(186003)(316002)(54906003)(2906002)(8936002)(9686003)(71200400001)(508600001)(66476007)(66556008)(38100700002)(38070700005)(7696005)(52536014)(86362001)(26005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gRdNpACfKHsV84aOeqI87LQjmCVHbRhyHqnRb4+eiLxaOrwiTfK6YVfn+t?=
 =?iso-8859-1?Q?Fl50DZ2b4tjp56ZR722RFCr0kA5RgqX7IJ5R11Y7EipCXC7Gl3jP/LNDkT?=
 =?iso-8859-1?Q?mpxMuqxH802jFYh3i3nu/at1beTzm6wa+6+fQjH/Hvpa05mm2CpSzOWpp4?=
 =?iso-8859-1?Q?U6ZnphHhcyxtF72UXSeZ1+CRhZ9XJbRxAlJ+AJPvVZu939WV0udOiskycY?=
 =?iso-8859-1?Q?8SUsvXHY8vUD2FxxY/CAM79KpYzhQgXBUjWHzcpXqvH6nA5w2jpsotir9+?=
 =?iso-8859-1?Q?JBQ02mDOLs9qS9q7qJomOmADsxSsOpQ7OVH+uBSqYzyrS9iD/5C59viPxF?=
 =?iso-8859-1?Q?y6buoFWrt0JvSClpbLZMDJBwWk+G03ep7LQhJXQp1BlZyaxQSeq50rj7RP?=
 =?iso-8859-1?Q?GoxBZMxV7LjCaK+yRf8OEITxCjlc2DbUZGfZbVtayer/eDTczqrjzzDSe6?=
 =?iso-8859-1?Q?57Yb+HXVGolPlW8kGPgGBe6y4t14AfgHiUJjjWsdTKhAAu22UOnt4EaUh+?=
 =?iso-8859-1?Q?Wu0RkcLuIB7BQZpKt/vmPYOC5xpuAgZmeT3kHJr5Emd6cw5oY2HAtY09st?=
 =?iso-8859-1?Q?6h83TLA9omzK0ID5A8qlqtiJXWpqFk8d3+kA2GyrdWB9IiL18JehYBZK+C?=
 =?iso-8859-1?Q?Z2XOpUpASbRkSrFkHqxe1jgHhD3q5Hw5qiPpWQvU9Yita8lXJMq3a9SI9D?=
 =?iso-8859-1?Q?Yz4toN+AVdNv4WfEgrBAY2J3vJUiE86ab7MWaRqYqsJKYhatNaOA+Sjh6g?=
 =?iso-8859-1?Q?UGhP/wamx65nOMtx9fVoMHcgIhtIZB09HXgS1VJFd3jTFvPnL8i5nsxRiz?=
 =?iso-8859-1?Q?rTTG78NVrAfTBWds3VFlQl4466dKQFw+6MJuUxxQ4zDOiOUFfNhKdE03cE?=
 =?iso-8859-1?Q?903CUwqvMKFD7e1nUr8bZYF8FFwvz07vMpestmMDBjVBVyxa9NZhTvuJ6I?=
 =?iso-8859-1?Q?nm3SglhuI0nA03GpoykWN8yMzJoPwZKvx268mdQVKCrBsuTZKJzS5iBFKZ?=
 =?iso-8859-1?Q?y8vF0U2Hb/Nqw9agRMcBFs6BkHc7Ensbjn4t4SrNbs5/63TzU1BkOtj1/h?=
 =?iso-8859-1?Q?cHMtZJg/irtf+OHGHAj9kO/5Qvj8Buo7BMtheoHEa8SpsOJH96Vn0RZcYB?=
 =?iso-8859-1?Q?GW8j54XvN+hGk5ZatSAmmIpxS+55T5727WovtqassP5aj9xDYd6lgcvmj2?=
 =?iso-8859-1?Q?rKzuv2YQkvqB5wtbtPXOaByvbWS2A7+I56LcWM0p33i6mIeD7mUx3SkPQz?=
 =?iso-8859-1?Q?qt6e39sLkkFbUJExg/flFqBR6o0qrKQLordaHGl+/U9KCq5TRDMG31gIRL?=
 =?iso-8859-1?Q?rZUCtxiOBAI7AifrcGFQ1pOjSh4Mlu5vNEOxRloQ/wtSKFvRPVUF/Rvinb?=
 =?iso-8859-1?Q?Y+UQ+L4FAvKifUYTCfBOQkp5RYYLC3OZKGxi+ZPBr5rkfU/5+MMu6+d/zW?=
 =?iso-8859-1?Q?6GxtUcc0Qcp7IGw9avisOKFfL2Hipvcgu+XQ7nGjVokQ0POk68yNEb5cn2?=
 =?iso-8859-1?Q?NvwNcaqKYzJfmScZS9+2j7UIkyOBjXB0ghcdoG0ouiQ6UXsUkkhFypEbFe?=
 =?iso-8859-1?Q?nycUIsCL0mlkm1CgRUOVTQrUiwcNFZ0Fz00rhq4VdOKBwBKZow9wqQxrUu?=
 =?iso-8859-1?Q?PrPlKt5gYVaJRj+ZVqAT4cozMw3e2zVjnOsrnAH3iY4SNU/z3IDInKwnDB?=
 =?iso-8859-1?Q?5wxTovQeNyqhM3ZPIy0tco7b0jF29+OhkFFuuZEbxBKFmwVcHOe5nQE5G/?=
 =?iso-8859-1?Q?+KpOgvtm+DrmDfrfhSI+DD86ywsZuQBD8yRA1/9Rr4oq+3BAedDHdjXf52?=
 =?iso-8859-1?Q?pPvc53MUsw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1347a452-7bad-42fc-11c7-08da28007460
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 03:46:04.3285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uByuK9Uvsxnylahf2PzaaoPu4ha1zfBBa2H0G0YgnKCsNzU4ZjpNnQAnwcN8AVa7/LlbVvLUxIwxNMnUauoqvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6293
X-OriginatorOrg: intel.com

> From: Lengyel, Tamas <tamas.lengyel@intel.com>
> Sent: Friday, March 25, 2022 9:33 PM
>=20
> During VM forking and resetting a failed vmentry has been observed due
> to the guest non-register state going out-of-sync with the guest register
> state. For example, a VM fork reset right after a STI instruction can tri=
gger
> the failed entry. This is due to the guest non-register state not being s=
aved
> from the parent VM, thus the reset operation only copies the register sta=
te.
>=20
> Fix this by adding a new pair of hvm functions to get/set the guest
> non-register state so that the overall vCPU state remains in sync.
>=20
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
> v5: Switch to internal-only hvm funcs instead of adding to hvm_hw_cpu
> ---
>  xen/arch/x86/hvm/vmx/vmx.c         | 32 ++++++++++++++++++++++++
>  xen/arch/x86/include/asm/hvm/hvm.h | 40
> ++++++++++++++++++++++++++++++
>  xen/arch/x86/mm/mem_sharing.c      | 11 +++++++-
>  3 files changed, 82 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index c075370f64..2685da16c8 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -1334,6 +1334,36 @@ static void cf_check vmx_set_interrupt_shadow(
>      __vmwrite(GUEST_INTERRUPTIBILITY_INFO, intr_shadow);
>  }
>=20
> +static void cf_check vmx_get_nonreg_state(struct vcpu *v,
> +    struct hvm_vcpu_nonreg_state *nrs)
> +{
> +    vmx_vmcs_enter(v);
> +
> +    __vmread(GUEST_ACTIVITY_STATE, &nrs->vmx.activity_state);
> +    __vmread(GUEST_INTERRUPTIBILITY_INFO, &nrs-
> >vmx.interruptibility_info);
> +    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &nrs->vmx.pending_dbg);
> +
> +    if ( cpu_has_vmx_virtual_intr_delivery )
> +        __vmread(GUEST_INTR_STATUS, &nrs->vmx.interrupt_status);
> +
> +    vmx_vmcs_exit(v);
> +}
> +
> +static void cf_check vmx_set_nonreg_state(struct vcpu *v,
> +    struct hvm_vcpu_nonreg_state *nrs)
> +{
> +    vmx_vmcs_enter(v);
> +
> +    __vmwrite(GUEST_ACTIVITY_STATE, nrs->vmx.activity_state);
> +    __vmwrite(GUEST_INTERRUPTIBILITY_INFO, nrs-
> >vmx.interruptibility_info);
> +    __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS, nrs->vmx.pending_dbg);
> +
> +    if ( cpu_has_vmx_virtual_intr_delivery )
> +        __vmwrite(GUEST_INTR_STATUS, nrs->vmx.interrupt_status);
> +
> +    vmx_vmcs_exit(v);
> +}
> +
>  static void vmx_load_pdptrs(struct vcpu *v)
>  {
>      uint32_t cr3 =3D v->arch.hvm.guest_cr[3];
> @@ -2487,6 +2517,8 @@ static struct hvm_function_table
> __initdata_cf_clobber vmx_function_table =3D {
>      .load_cpu_ctxt        =3D vmx_load_vmcs_ctxt,
>      .get_interrupt_shadow =3D vmx_get_interrupt_shadow,
>      .set_interrupt_shadow =3D vmx_set_interrupt_shadow,
> +    .get_nonreg_state     =3D vmx_get_nonreg_state,
> +    .set_nonreg_state     =3D vmx_set_nonreg_state,
>      .guest_x86_mode       =3D vmx_guest_x86_mode,
>      .get_cpl              =3D _vmx_get_cpl,
>      .get_segment_register =3D vmx_get_segment_register,
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h
> b/xen/arch/x86/include/asm/hvm/hvm.h
> index 5b7ec0cf69..9dee0f87a3 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -84,6 +84,17 @@ enum hvm_intblk {
>  /* update_guest_cr() flags. */
>  #define HVM_UPDATE_GUEST_CR3_NOFLUSH 0x00000001
>=20
> +struct hvm_vcpu_nonreg_state {
> +    union {
> +        struct {
> +            uint64_t activity_state;
> +            uint64_t interruptibility_info;
> +            uint64_t pending_dbg;
> +            uint64_t interrupt_status;
> +        } vmx;
> +    };
> +};
> +
>  /*
>   * The hardware virtual machine (HVM) interface abstracts away from the
>   * x86/x86_64 CPU virtualization assist specifics. Currently this interf=
ace
> @@ -122,6 +133,10 @@ struct hvm_function_table {
>      /* Examine specifics of the guest state. */
>      unsigned int (*get_interrupt_shadow)(struct vcpu *v);
>      void (*set_interrupt_shadow)(struct vcpu *v, unsigned int intr_shado=
w);
> +    void (*get_nonreg_state)(struct vcpu *v,
> +                             struct hvm_vcpu_nonreg_state *nrs);
> +    void (*set_nonreg_state)(struct vcpu *v,
> +                             struct hvm_vcpu_nonreg_state *nrs);
>      int (*guest_x86_mode)(struct vcpu *v);
>      unsigned int (*get_cpl)(struct vcpu *v);
>      void (*get_segment_register)(struct vcpu *v, enum x86_segment seg,
> @@ -744,6 +759,20 @@ void hvm_set_reg(struct vcpu *v, unsigned int reg,
> uint64_t val);
>          d_->arch.hvm.pi_ops.vcpu_block(v_);                     \
>  })
>=20
> +static inline void hvm_get_nonreg_state(struct vcpu *v,
> +                                        struct hvm_vcpu_nonreg_state *nr=
s)
> +{
> +    if ( hvm_funcs.get_nonreg_state )
> +        alternative_vcall(hvm_funcs.get_nonreg_state, v, nrs);
> +}
> +
> +static inline void hvm_set_nonreg_state(struct vcpu *v,
> +                                        struct hvm_vcpu_nonreg_state *nr=
s)
> +{
> +    if ( hvm_funcs.set_nonreg_state )
> +        alternative_vcall(hvm_funcs.set_nonreg_state, v, nrs);
> +}
> +
>  #else  /* CONFIG_HVM */
>=20
>  #define hvm_enabled false
> @@ -863,6 +892,17 @@ static inline void hvm_set_reg(struct vcpu *v,
> unsigned int reg, uint64_t val)
>      ASSERT_UNREACHABLE();
>  }
>=20
> +static inline void hvm_get_nonreg_state(struct vcpu *v,
> +                                        struct hvm_vcpu_nonreg_state *nr=
s)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +static inline void hvm_set_nonreg_state(struct vcpu *v,
> +                                        struct hvm_vcpu_nonreg_state *nr=
s)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +
>  #define is_viridian_domain(d) ((void)(d), false)
>  #define is_viridian_vcpu(v) ((void)(v), false)
>  #define has_viridian_time_ref_count(d) ((void)(d), false)
> diff --git a/xen/arch/x86/mm/mem_sharing.c
> b/xen/arch/x86/mm/mem_sharing.c
> index 15e6a7ed81..857accee58 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1643,6 +1643,13 @@ static int bring_up_vcpus(struct domain *cd,
> struct domain *d)
>      return 0;
>  }
>=20
> +static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu
> *cd_vcpu)
> +{
> +    struct hvm_vcpu_nonreg_state nrs =3D {};
> +    hvm_get_nonreg_state(d_vcpu, &nrs);
> +    hvm_set_nonreg_state(cd_vcpu, &nrs);
> +}
> +
>  static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
>  {
>      unsigned int i;
> @@ -1651,7 +1658,7 @@ static int copy_vcpu_settings(struct domain *cd,
> const struct domain *d)
>=20
>      for ( i =3D 0; i < cd->max_vcpus; i++ )
>      {
> -        const struct vcpu *d_vcpu =3D d->vcpu[i];
> +        struct vcpu *d_vcpu =3D d->vcpu[i];
>          struct vcpu *cd_vcpu =3D cd->vcpu[i];
>          mfn_t vcpu_info_mfn;
>=20
> @@ -1694,6 +1701,8 @@ static int copy_vcpu_settings(struct domain *cd,
> const struct domain *d)
>=20
>          hvm_vmtrace_reset(cd_vcpu);
>=20
> +        copy_vcpu_nonreg_state(d_vcpu, cd_vcpu);
> +
>          /*
>           * TODO: to support VMs with PV interfaces copy additional
>           * settings here, such as PV timers.
> --
> 2.25.1


