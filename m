Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934581FFFA6
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 03:27:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm5os-0003ay-1B; Fri, 19 Jun 2020 01:27:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYJs=AA=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jm5oq-0003ar-UB
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 01:27:48 +0000
X-Inumbo-ID: 14afe87a-b1cc-11ea-b7bb-bc764e2007e4
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14afe87a-b1cc-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 01:27:47 +0000 (UTC)
IronPort-SDR: 5cQN70sYRDBDUgKM6/Jv6UJpBdbnkcaeIrUUapb3Q7FcFSnTzc5+ZHVgdufo4vZHHizDAJI5te
 n/c/z2FL5dbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="160897144"
X-IronPort-AV: E=Sophos;i="5.75,253,1589266800"; d="scan'208";a="160897144"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 18:27:46 -0700
IronPort-SDR: zpGYIWk+nr+0Gpvxm8VTM6Qr/0DjX3+SBXWecR5T1hgP4oet72IlNj0457sr5F85Ee7YTtZuoZ
 tjG1ipVY6wMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,253,1589266800"; d="scan'208";a="383693782"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jun 2020 18:27:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 18 Jun 2020 18:27:46 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 18 Jun 2020 18:27:45 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 18 Jun 2020 18:27:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 18 Jun 2020 18:27:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWqbPTyeUgc7lVAaHjfkp2MWkcZjR3RdboiFVf7gPAPsSNmFNnemolAOv8NngHTiwVlHVbZNB2mXRfmC2FwWlMpA9AKqX5HlWiS8Cp+dFhZYYA2NuLpzD5jdqQ+EIeXJHrJD9eiw21mHyfnucr3fICOxejvdHvoRC6Hy5wUHUetIrKS3OfPp0sjortw9nq/rRtJiylCHHffo7YYZwCZ4Nul8m2rD8HT32gPfeKtcClV27Z2e54sKM2pJQUVQ7vlO/DZ91KisxRtvaxw6EyuSi4GvQsfuzRz3N6z98x46H7Z6a7Omt4aMkE/taXBaPmj6VcZ4xLn9W1KuCMctej0gXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Irwg3jMVO+U7YBGlwxYPxnl6+M8wEfdDrLbZpDSWY9k=;
 b=SfMaAMHCqW0XV1+UWzTxzQnrtz26lKCAoNlRjrHCEYF+iDczAW2ZCYiL+BEgmOrV141HW2cuoyoUBRg8urF2r4TG7mWBP4PtLGps/OzZZoeAn37aRhRpN99vuhZHd2pSMvANSgPu1oIXNQo/fidnsOHN3OO7G7XQI3UzhSGTstXfHoLqDXhFB9J8r412OqdZ9vBQuLk3ZDXCdw2dImCkbLlRQk1WFdGsgQK+wNQ31NXOlzGUpzkX0K+1Le4fipVfXQI0tLjuD9y3OiBnHJdm0L61of/At2eW6ucF/l06clMUxk2SXELhlEclMFo6y34KK4lXm1O0YYsShq/emTZL3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Irwg3jMVO+U7YBGlwxYPxnl6+M8wEfdDrLbZpDSWY9k=;
 b=J/xxAwPyTMjPReeS/rgG8Q4KC6WrUgjp9tcDsWdOv88BWLZu1ssytzzutoGoj4nBleMeksw6XrLZGrJcRE+W9TUnlUBz60ICpDGXKX+MqCwgp9wqKVx1U2feSzg8DPphwlmZzS5OBGmwW4lyg4ZlJoC1wLtdjflEAM0xVj67K9M=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1391.namprd11.prod.outlook.com (2603:10b6:300:23::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 01:27:44 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb%5]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 01:27:43 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs
 instead of P2M_UNSHARE
Thread-Topic: [PATCH v3 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs
 instead of P2M_UNSHARE
Thread-Index: AQHWRX5CY0soX8hKWUKiNsqVFtfc26jfJoww
Date: Fri, 19 Jun 2020 01:27:43 +0000
Message-ID: <MWHPR11MB1645B147FF7E16AE37D290778C980@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <a7635e7423f834f44a132114bd3e039dd0435a00.1592490545.git.tamas.lengyel@intel.com>
In-Reply-To: <a7635e7423f834f44a132114bd3e039dd0435a00.1592490545.git.tamas.lengyel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.202]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38ec0f2b-364b-4d74-741b-08d813eff744
x-ms-traffictypediagnostic: MWHPR11MB1391:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB139108606C2645C34F279C038C980@MWHPR11MB1391.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RlBh7SERJqEFsnbncd6Vf8+pRdeqEL9HrhddtqLYYvLW86NH5LAZxRmfOqo7OzRHiY97fNMUUtYUPDLdN54tpCdw7R44l+9Ys7UrlHSDsQC1aMARmRC2qL03R/Jg2jfepCW7aoCl9g0FMcrJmgOcoBNWkK2jDAhosMAerM8DJA157ss51FAxiEvbE66bC/2cZvklBxn6zkOidwPAXP/Pf3Mooh7bItNVvNa4oDMcz8jiDJby+VRqsbLiEElQbs9kpBd2UWh8qGIJL2II5a24mQk+UdBkfhFJzSfOqsz3Zz8nJk0hf1AsDD4p7a3JPN1O
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(26005)(52536014)(66946007)(71200400001)(64756008)(66556008)(76116006)(66476007)(66446008)(5660300002)(55016002)(9686003)(186003)(4326008)(86362001)(316002)(8676002)(83380400001)(2906002)(33656002)(110136005)(8936002)(478600001)(54906003)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bKZWRrhbK6MzL2Cl2KU9prvog1uo42JqzfZW801/laZNSZTvXC/v6dDeNTMYjOMRwIG6wmAJFRhoEn+AiOCpHgUoqs7NY4i8uy+yB+gm0oA8cacG8sxkGf8xCp36absXl88Tz7K1dNPykpMD2y/R2otlIZp7Ws5Qfe+NAwsryjh7RZXAujcxvH2hwx5lU9qgrPrpLwMz9qadxJjfKLfs0W7vY9zC2c7SItxcyBaCXF85TBFuAjGYivpzgWag5beqV9CymLUzYES+zcClNjSpDnsWxfHrLvJLqAi4GGHR6QeqvwMmGpQjsAyOYT3XWVfreNNXgPQsOj5Jd/u5lsWOAobTB9qPs3QuChpLgotdRz7WMT+4/AtHCdWzRGjz/zzXaX3GIQ6OebhH5AR65C7pJCbtKd+/PPbU8Bx4d7F8fhPFMc4IPop1WetHti7JSr+/ZiTdokqLpzZfDldJqHr/QgtNTR9BlspAMv2lCwDg01OBGOzscopothsmxmEs3L7I
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ec0f2b-364b-4d74-741b-08d813eff744
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 01:27:43.8745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: evccvtA3OGQ9+hO/G+LPJ3l8K/J9GtlCIr8z8bagf3SLB+RpZc/uB2Ld7nwvwqbmlin+uMcyGjjA4eAoe2xkEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1391
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
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> From: Lengyel, Tamas <tamas.lengyel@intel.com>
> Sent: Thursday, June 18, 2020 10:39 PM
>=20
> While forking VMs running a small RTOS system (Zephyr) a Xen crash has
> been
> observed due to a mm-lock order violation while copying the HVM CPU
> context
> from the parent. This issue has been identified to be due to
> hap_update_paging_modes first getting a lock on the gfn using get_gfn. Th=
is
> call also creates a shared entry in the fork's memory map for the cr3 gfn=
. The
> function later calls hap_update_cr3 while holding the paging_lock, which
> results in the lock-order violation in vmx_load_pdptrs when it tries to
> unshare
> the above entry when it grabs the page with the P2M_UNSHARE flag set.
>=20
> Since vmx_load_pdptrs only reads from the page its usage of P2M_UNSHARE
> was
> unnecessary to start with. Using P2M_ALLOC is the appropriate flag to ens=
ure
> the p2m is properly populated.
>=20
> Note that the lock order violation is avoided because before the paging_l=
ock
> is
> taken a lookup is performed with P2M_ALLOC that forks the page, thus the
> second
> lookup in vmx_load_pdptrs succeeds without having to perform the fork. We
> keep
> P2M_ALLOC in vmx_load_pdptrs because there are code-paths leading up to
> it
> which don't take the paging_lock and that have no previous lookup.
> Currently no
> other code-path exists leading there with the paging_lock taken, thus no
> further adjustments are necessary.
>=20
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
> v3: expand commit message to explain why there is no lock-order violation
> ---
>  xen/arch/x86/hvm/vmx/vmx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index ab19d9424e..cc6d4ece22 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -1325,7 +1325,7 @@ static void vmx_load_pdptrs(struct vcpu *v)
>      if ( (cr3 & 0x1fUL) && !hvm_pcid_enabled(v) )
>          goto crash;
>=20
> -    page =3D get_page_from_gfn(v->domain, cr3 >> PAGE_SHIFT, &p2mt,
> P2M_UNSHARE);
> +    page =3D get_page_from_gfn(v->domain, cr3 >> PAGE_SHIFT, &p2mt,
> P2M_ALLOC);
>      if ( !page )
>      {
>          /* Ideally you don't want to crash but rather go into a wait
> --
> 2.25.1


