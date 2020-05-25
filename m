Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508AE1E04BF
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:34:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd2vk-0002ep-3x; Mon, 25 May 2020 02:33:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HJX=7H=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jd2vj-0002ek-Cl
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:33:31 +0000
X-Inumbo-ID: 1e1f5ed6-9e30-11ea-b9cf-bc764e2007e4
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e1f5ed6-9e30-11ea-b9cf-bc764e2007e4;
 Mon, 25 May 2020 02:33:29 +0000 (UTC)
IronPort-SDR: uHwM7ujdEqmmpeOYslF5Lbpw0yuH32rFRDdNIjMkmQLTcBvLrz3EEQT2uenvPFxahl1JxZ0fO1
 6D3+K1MZyrGQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2020 19:33:28 -0700
IronPort-SDR: vMHLu0t7D/NyD7s4L6q7Xwpl80XDocytsW1mjDz5sa7gdObN8qVglpaiz/SvPVY2A41pMzEVTA
 OcyyXWxCTAkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,431,1583222400"; d="scan'208";a="467829781"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by fmsmga005.fm.intel.com with ESMTP; 24 May 2020 19:33:27 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 24 May 2020 19:33:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 24 May 2020 19:33:27 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 24 May 2020 19:33:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 24 May 2020 19:33:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNCWDyBIO5ILJEmT7XnLzB7e8TJnULbR4hHg++ElgAEjzzGK/bTuDtliXaO8wCIRL7UYlnyw/Y5Plh8BNejOrq3e15UEl5wB4K1RJzpDRZrEF20XL2FdVmsrFkfAS6+7VEwli+llVOIkCFkfFSOJ5rDep6AZ9yk45OYpkkmKaJds6vsDAYkWrHEQxncAvUZPNbjwcrujWF4Q9hbYLBj+Q4mF2wK80fkrKnxAVTLBExQ3SFfsK/oMfmMtXr9pTb5BLpxmuD4Hvm5CsLvaqejEfqt8co13RQicZppdQRyj7FSr7NXGDExLOXiczX2pugGwVQzwfJI6ycE6L7jD6oWXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HgphL6cEfsGgB11HgodpgfBNCryVIgilxOHkxsMPl4=;
 b=fAcAwuA8/wPSx9I/txwU/gIE6SjmTKlOpNMqnsUD6QYjRfNM6bGTfJbxkhg6Py+Zo+AYX3XyCI17JtcEvCRjzJ+5pWnhM0svuKS7BzN18GBgVKBSPpUO+D6bu9s69DsNma21nB+k8vCt4pbTBojHzfXgYvKs5dwmCWGDLdCyU49VJ4/+ScJAzYHk/sBoLrgq5MuUpwDKG2u/d0CKoUHuvk58Nge+2Qk0xQgN4YYcOQc1UHCS1iIs+HF4VmuizHKxcDY9JmDBktCv94XfHz/UWNd0wYm4AhG2hsIxSZ0iXJiXC03OkZZifCffzLY3cp7bCgzwl2MBu0XOUyr4vcHxww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HgphL6cEfsGgB11HgodpgfBNCryVIgilxOHkxsMPl4=;
 b=fsB9UVAEt5HvXl0aAmwqqSc62EQBazYJcJenWIxwGuboPzUp4CJrsgUiz6hy7KOChnxE2gSsdDbTXoJv+00NAnbO8/ZA1/rqNNZx0uuJAQNmgLbKqDe7bi/1QREfYFEva3T6zhS1BVp041KyOvA0yXiJoLuvmHqoWKSrTxWABvo=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1406.namprd11.prod.outlook.com (2603:10b6:300:23::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Mon, 25 May
 2020 02:33:25 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::b441:f6bd:703b:ba41]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::b441:f6bd:703b:ba41%2]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 02:33:25 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 for-4.14 1/2] x86/mem_sharing: block interrupt
 injection for forks
Thread-Topic: [PATCH v2 for-4.14 1/2] x86/mem_sharing: block interrupt
 injection for forks
Thread-Index: AQHWMFbYrI+6YEB8D0iGHN/GPjct36i4F49g
Date: Mon, 25 May 2020 02:33:25 +0000
Message-ID: <MWHPR11MB1645167038AA1273F6CC6D848CB30@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
In-Reply-To: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fcf4800-cd2a-4467-a9e5-08d800540056
x-ms-traffictypediagnostic: MWHPR11MB1406:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB140632FDFDE702EE4F125C628CB30@MWHPR11MB1406.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F1mh5Po4PD8nwEOrpPJIv0ZrLOMZhzPWNd0NKGwH+ud/DfsIgSL0qZqsEdkB9zlqCTXDQWBRYPNFDPo+shQ5+Fv76fwBr+IC8UfpbJ2sJcrQyRHJwBLjhZOX8PiHH8wOkDO/gkpkMIdhbfL5eEd1othrTWbCxdziml1/P9l43578UhwA6oOYlcTHkxQPSmgPlfOmp2ErqnQJrsTWk68INnTi4h5ueRyUNLifhL4ZKGw0fr2YaBCHrGXlpvSMGPJdMdRTS79erWqNQ3M8royYw7/BEX1LUHNEp7dxgpORprKvo61hwDjG+g5UgHbVWifwOg2QExS/gHrY/+GOS7xsbA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(376002)(136003)(366004)(346002)(396003)(478600001)(316002)(6506007)(33656002)(86362001)(64756008)(66946007)(66476007)(66446008)(7416002)(7696005)(66556008)(4326008)(110136005)(52536014)(76116006)(54906003)(55016002)(71200400001)(8936002)(2906002)(9686003)(26005)(186003)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qywZ3SKdBI1eiMtachTZwos3cQ86EFYvezgMFmjTl7nR0RiBPU0ZHNYyHZcMZULSrdwvf7btbhTCuPi7B4E8ZBwB34U/yJSwXF4+ia2Cwl6QAzrNsFSh7svo8A/cvqVlWEAfjDrUz75njaofAFZAOPyMBzwspm4ZZEWa+lC9qAXryR9KoPTLbsEEct/pnzsD4TEofrJlGQV2zNDgJJIryIupXlEeel5XnxYsDsMuLGZuuOuWMTpiiOnvH5wkhLHuUaCE+WQqe70Bo2pAY1P/HdcWRglckA0cGD8cUU8kzdkK27z+M/fS4+f8F1uDNQCYd4KoFbQQLLJrLtTnU7Qirq37r/xXvc5glCypQH+7+8mzYik1j5yDRFVk6YNOoYOrn8kggoCMD0NqaH1OCgQCfJfy/+T2VljAicBpUw6MQNNniZVO2Z+066dncv2w46XEPht1e2Ncav1l2QXYBeRrsDA8/UJupZ910Zz5PDj0wm4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcf4800-cd2a-4467-a9e5-08d800540056
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:33:25.3738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W9rfYKGTWtMqIId5strOUxJo0dHJSl5wwzV60tGhw5E/MH/qcIgbhjt7oLve/h4Ixb+nBoWsOm3XTq7lGFNorw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1406
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tamas
 K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> From: Lengyel, Tamas <tamas.lengyel@intel.com>
> Sent: Saturday, May 23, 2020 12:34 AM
>=20
> When running shallow forks without device models it may be undesirable fo=
r
> Xen

what is shallow forks? and why interrupt injection is not desired without
device model? If it means just without Qemu thing, you still get local APIC
interrupts such as timers, PMI, etc.

> to inject interrupts. With Windows forks we have observed the kernel goin=
g
> into
> infinite loops when trying to process such interrupts, likely because it
> attempts

what is the relationship between shallow forks and windows forks then?

> to interact with devices that are not responding without QEMU running. By
> disabling interrupt injection the fuzzer can exercise the target code wit=
hout
> interference.

what is the fuzzer?

>=20
> Forks & memory sharing are only available on Intel CPUs so this only appl=
ies
> to vmx.

I feel lots of background is missing thus difficult to judge whether below =
change
is desired...

>=20
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
> v2: prohibit =3D> block
>     minor style adjustments
> ---
>  xen/arch/x86/hvm/vmx/intr.c      | 6 ++++++
>  xen/arch/x86/mm/mem_sharing.c    | 6 +++++-
>  xen/include/asm-x86/hvm/domain.h | 2 ++
>  xen/include/public/memory.h      | 1 +
>  4 files changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
> index 000e14af49..80bfbb4787 100644
> --- a/xen/arch/x86/hvm/vmx/intr.c
> +++ b/xen/arch/x86/hvm/vmx/intr.c
> @@ -256,6 +256,12 @@ void vmx_intr_assist(void)
>      if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
>          return;
>=20
> +#ifdef CONFIG_MEM_SHARING
> +    /* Block event injection for VM fork if requested */
> +    if ( unlikely(v->domain->arch.hvm.mem_sharing.block_interrupts) )
> +        return;
> +#endif
> +
>      /* Crank the handle on interrupt state. */
>      pt_vector =3D pt_update_irq(v);
>=20
> diff --git a/xen/arch/x86/mm/mem_sharing.c
> b/xen/arch/x86/mm/mem_sharing.c
> index 7271e5c90b..0c45a8d67e 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -2106,7 +2106,8 @@ int
> mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op
> _t) arg)
>          rc =3D -EINVAL;
>          if ( mso.u.fork.pad )
>              goto out;
> -        if ( mso.u.fork.flags & ~XENMEM_FORK_WITH_IOMMU_ALLOWED )
> +        if ( mso.u.fork.flags &
> +             ~(XENMEM_FORK_WITH_IOMMU_ALLOWED |
> XENMEM_FORK_BLOCK_INTERRUPTS) )
>              goto out;
>=20
>          rc =3D rcu_lock_live_remote_domain_by_id(mso.u.fork.parent_domai=
n,
> @@ -2134,6 +2135,9 @@ int
> mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op
> _t) arg)
>              rc =3D hypercall_create_continuation(__HYPERVISOR_memory_op,
>                                                 "lh", XENMEM_sharing_op,
>                                                 arg);
> +        else if ( !rc && (mso.u.fork.flags &
> XENMEM_FORK_BLOCK_INTERRUPTS) )
> +            d->arch.hvm.mem_sharing.block_interrupts =3D true;
> +
>          rcu_unlock_domain(pd);
>          break;
>      }
> diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-
> x86/hvm/domain.h
> index 95fe18cddc..37e494d234 100644
> --- a/xen/include/asm-x86/hvm/domain.h
> +++ b/xen/include/asm-x86/hvm/domain.h
> @@ -74,6 +74,8 @@ struct mem_sharing_domain
>       * to resume the search.
>       */
>      unsigned long next_shared_gfn_to_relinquish;
> +
> +    bool block_interrupts;
>  };
>  #endif
>=20
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index dbd35305df..1e4959638d 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -537,6 +537,7 @@ struct xen_mem_sharing_op {
>          struct mem_sharing_op_fork {      /* OP_FORK */
>              domid_t parent_domain;        /* IN: parent's domain id */
>  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
> +#define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
>              uint16_t flags;               /* IN: optional settings */
>              uint32_t pad;                 /* Must be set to 0 */
>          } fork;
> --
> 2.25.1


