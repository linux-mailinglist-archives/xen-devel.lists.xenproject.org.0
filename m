Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C9E1E04A9
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:23:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd2m5-0001ij-1c; Mon, 25 May 2020 02:23:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HJX=7H=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jd2m3-0001ie-QA
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:23:31 +0000
X-Inumbo-ID: b9109682-9e2e-11ea-ae71-12813bfff9fa
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9109682-9e2e-11ea-ae71-12813bfff9fa;
 Mon, 25 May 2020 02:23:30 +0000 (UTC)
IronPort-SDR: 50EyUgrY01Bi04spkkuLiQSIBaSCvBivcvalZ07IiGvAPRseYkrc/I4kIUqsW+XUdglCdLmHZv
 MQh9Vc1gmu+w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2020 19:23:29 -0700
IronPort-SDR: unpRITaDVihedDHsd1pyS0il930zIp7e3H+1/vBeNO39cLG0/h1MIY1DfLYgokUfZEkPDiEtgX
 yysZKGig247A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,431,1583222400"; d="scan'208";a="413373530"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga004.jf.intel.com with ESMTP; 24 May 2020 19:23:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 24 May 2020 19:23:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 24 May 2020 19:23:28 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 24 May 2020 19:23:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Sun, 24 May 2020 19:23:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrcE6iMwum8rLs8kCGb0YLOmGqqT0jKr1ilaNfl2bp7FxhWhsDyoc/4jwO2k5oTFQeKMitUv2LJ/KvmE7cwZ+ansGlTgkunQAkhCxQKMnVH551wgemQcc3KuWEWgn36Zh4aHnIKZleNW27qpIjJk8uvjCqvTrqz776jsc+Oozgwant+WO9B7tQakwTqJNUCMBbo1FIr8Xl0ZKvqQUQQdmv6yD5ipFY1p0Q3B1sbG+UCpsaSe7CrnvlCjGXbUrbxtFndwC0oZUb7VqwBQ8u1Rwnc4wKVm2WtF7AF1xmvIIxcdYOuc6FcR1pCOBbme0/AGK7ix7wOgukzY7nZzgJ3Oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqPAxylaS6SBe/APk128XonbFl3wXDRqrfyy3LBRXco=;
 b=HlakCpWjneAQRHRfbD6TFjGL4WByw9A2EYxBIZBkaO1Mu+l88qI53qE4Nm3ht+ngWsqol0qaYH3D96QO5sPhrQpc8/TwOLSbMaw6skredXbhVU1UR+uw4rmfTqFBvzk4O9HOnNeYy9/ZnYkdBCPDQTUxFGem/8fArf+v3sQ9GswHyldPekDraOjXA6sSQX3TGep/QIwCKxqYiJVkOq4kbB81ihqBAWJLyrACv6V8oESujStsEiOQ6sboZu2ITjNnGZsw5tnC+zTZwpXEL3aKrVVdn6+OMtfs/5bLl6CddNwvWpWhNKZwDMvWR63+CzyrVFu34Gt9dUqrYby4W5BYjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqPAxylaS6SBe/APk128XonbFl3wXDRqrfyy3LBRXco=;
 b=Kw5Bv4IWih1pHNed/jaiOr2X6vUzjEpDfW2IDDIfMmIRPIABQbTdiiEx8yDznQg1Xzk4+fQ/68Uojc669Gi/poB5r3OfJdreLaKVUkQO8TCO0O4fvcQXE+04dz/YQxcHrWki5amOkjTzqjM1JMKYcRti5L3wZ8Zgb6XNdEUYiiE=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1693.namprd11.prod.outlook.com (2603:10b6:300:2b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Mon, 25 May
 2020 02:23:26 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::b441:f6bd:703b:ba41]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::b441:f6bd:703b:ba41%2]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 02:23:26 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v10 01/12] xen/vmx: let opt_ept_ad always reflect the
 current setting
Thread-Topic: [PATCH v10 01/12] xen/vmx: let opt_ept_ad always reflect the
 current setting
Thread-Index: AQHWLa4sYjkLeqlY40OG/TZ4iiK9pai4G3aw
Date: Mon, 25 May 2020 02:23:26 +0000
Message-ID: <MWHPR11MB1645A00E365615DD577663E98CB30@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-2-jgross@suse.com>
In-Reply-To: <20200519072106.26894-2-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6d8fad5-8a42-4e61-e553-08d800529b45
x-ms-traffictypediagnostic: MWHPR11MB1693:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1693C9F0D50D5599ED1F23988CB30@MWHPR11MB1693.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y8i8Z+/EfC9t82DlZmERcA8RsqhPxdjr+KZuk3TaBJ+EX/UVchrRda0RksgQfE0T93o8ReXeE9YV4kGsfZf7eMpYgxE1qv5CfmmiM8fmrn+0O39YsAe8UJMh6UAi0kbmwtDKwCBa8l9t1K+21O6DlaH72baF+K93MCSF2raFMTFbval9ZpZkyPaXUj7neUIpXhq4KrlwtualfuT5nExCcqBqhQEhRdNS0o62mnu7FQ/CbCE2dXkVLlQx4ntKaY5Q8YinKSpVerNn96TZVFzTEARg8WuPxw9eG3tmNy0t6GMVBthiJre43SUQlLleZ7OEL8H3Bwgk5Tcn2tg3ym0NQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(376002)(346002)(136003)(366004)(396003)(71200400001)(9686003)(55016002)(33656002)(316002)(5660300002)(66446008)(110136005)(2906002)(54906003)(478600001)(52536014)(64756008)(66556008)(4326008)(86362001)(66476007)(76116006)(66946007)(8676002)(8936002)(7696005)(6506007)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jbsyxuNBiet+V48FbTLP0JGJaLMbuAoLgpwztKLc2gr9rAHaWBsFqwezX/vbe+wcJ+T6PH22XDAGkZ4qwuv2XeHf5mM9MqkBEFvIGpj6uuejwxn4fJ4PbYzYgBvNgYeR9EsEYCDYDMz7bxddXyiNLmj+kcwXiaJuiB/AtJhb2wrO/J20FLl1T5eJO0basqe94bSgMz/LTxaMEq6Q1RwjfE9Ya1schDHbHVcdoe6UmZjQdeQeaezjjBbdoXDwQMRBervqp7Owagfy3HHG5daPLfIr4hzAc1Pvr76H1zMU7NliyJFCdhqcpa59rXwF+XpzSnVpffUaVAroEOV4kOdQ4X2lEWuNzlxYeekAeez3rPoYlIgBQd3h3QQ550qgXnK1yYuS+fQ4n5jYMFTV1wfNLB8sZYt9yYbXu6pBvH2hLujc+lSfZ2mBvxQCK1Ci93pUI5rNCs8MwE15X7GQFcr/zq6Bi7bQkadTK/ZinUSArxc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d8fad5-8a42-4e61-e553-08d800529b45
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:23:26.3783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GXa9uzuGxqzVz6TtvJoPSP5CvtNPlZwNMBF7qH8lhpyvXfmn84wnCQeFjHIEzcLEteSCFtmz7nE3jvXTcrljcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1693
X-OriginatorOrg: intel.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> From: Juergen Gross <jgross@suse.com>
> Sent: Tuesday, May 19, 2020 3:21 PM
>=20
> In case opt_ept_ad has not been set explicitly by the user via command
> line or runtime parameter, it is treated as "no" on Avoton cpus.
>=20
> Change that handling by setting opt_ept_ad to 0 for this cpu type
> explicitly if no user value has been set.
>=20
> By putting this into the (renamed) boot time initialization of vmcs.c
> _vmx_cpu_up() can be made static.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  xen/arch/x86/hvm/vmx/vmcs.c        | 22 +++++++++++++++-------
>  xen/arch/x86/hvm/vmx/vmx.c         |  4 +---
>  xen/include/asm-x86/hvm/vmx/vmcs.h |  3 +--
>  3 files changed, 17 insertions(+), 12 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index 4c23645454..221af9737a 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -315,10 +315,6 @@ static int vmx_init_vmcs_config(void)
>=20
>          if ( !opt_ept_ad )
>              _vmx_ept_vpid_cap &=3D ~VMX_EPT_AD_BIT;
> -        else if ( /* Work around Erratum AVR41 on Avoton processors. */
> -                  boot_cpu_data.x86 =3D=3D 6 && boot_cpu_data.x86_model =
=3D=3D 0x4d
> &&
> -                  opt_ept_ad < 0 )
> -            _vmx_ept_vpid_cap &=3D ~VMX_EPT_AD_BIT;
>=20
>          /*
>           * Additional sanity checking before using EPT:
> @@ -652,7 +648,7 @@ void vmx_cpu_dead(unsigned int cpu)
>      vmx_pi_desc_fixup(cpu);
>  }
>=20
> -int _vmx_cpu_up(bool bsp)
> +static int _vmx_cpu_up(bool bsp)
>  {
>      u32 eax, edx;
>      int rc, bios_locked, cpu =3D smp_processor_id();
> @@ -2108,9 +2104,21 @@ static void vmcs_dump(unsigned char ch)
>      printk("**************************************\n");
>  }
>=20
> -void __init setup_vmcs_dump(void)
> +int __init vmx_vmcs_init(void)
>  {
> -    register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
> +    int ret;
> +
> +    if ( opt_ept_ad < 0 )
> +        /* Work around Erratum AVR41 on Avoton processors. */
> +        opt_ept_ad =3D !(boot_cpu_data.x86 =3D=3D 6 &&
> +                       boot_cpu_data.x86_model =3D=3D 0x4d);
> +
> +    ret =3D _vmx_cpu_up(true);
> +
> +    if ( !ret )
> +        register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
> +
> +    return ret;
>  }
>=20
>  static void __init __maybe_unused build_assertions(void)
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 6efa80e422..11a4dd94cf 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2482,7 +2482,7 @@ const struct hvm_function_table * __init
> start_vmx(void)
>  {
>      set_in_cr4(X86_CR4_VMXE);
>=20
> -    if ( _vmx_cpu_up(true) )
> +    if ( vmx_vmcs_init() )
>      {
>          printk("VMX: failed to initialise.\n");
>          return NULL;
> @@ -2553,8 +2553,6 @@ const struct hvm_function_table * __init
> start_vmx(void)
>          vmx_function_table.get_guest_bndcfgs =3D vmx_get_guest_bndcfgs;
>      }
>=20
> -    setup_vmcs_dump();
> -
>      lbr_tsx_fixup_check();
>      bdf93_fixup_check();
>=20
> diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-
> x86/hvm/vmx/vmcs.h
> index 95c1dea7b8..906810592f 100644
> --- a/xen/include/asm-x86/hvm/vmx/vmcs.h
> +++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
> @@ -21,11 +21,10 @@
>  #include <xen/mm.h>
>=20
>  extern void vmcs_dump_vcpu(struct vcpu *v);
> -extern void setup_vmcs_dump(void);
> +extern int vmx_vmcs_init(void);
>  extern int  vmx_cpu_up_prepare(unsigned int cpu);
>  extern void vmx_cpu_dead(unsigned int cpu);
>  extern int  vmx_cpu_up(void);
> -extern int  _vmx_cpu_up(bool bsp);
>  extern void vmx_cpu_down(void);
>=20
>  struct vmcs_struct {
> --
> 2.26.1


