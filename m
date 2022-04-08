Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13AD4F8CE2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 05:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301102.513816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncfd6-00008f-GJ; Fri, 08 Apr 2022 03:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301102.513816; Fri, 08 Apr 2022 03:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncfd6-00005V-B2; Fri, 08 Apr 2022 03:49:48 +0000
Received: by outflank-mailman (input) for mailman id 301102;
 Fri, 08 Apr 2022 03:49:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XiXL=US=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1ncfd4-00005P-0l
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 03:49:46 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e96df4ab-b6ee-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 05:49:41 +0200 (CEST)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 20:49:36 -0700
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 07 Apr 2022 20:49:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Apr 2022 20:49:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Apr 2022 20:49:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Apr 2022 20:49:36 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN2PR11MB4192.namprd11.prod.outlook.com (2603:10b6:208:13f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 03:49:33 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%9]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 03:49:33 +0000
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
X-Inumbo-ID: e96df4ab-b6ee-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649389781; x=1680925781;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VsUhYrABAvhixG0HToXLVsh6lPWgrKHiTOKfvrp0woc=;
  b=QqZDhv6SpbnJPaqVbUWNFpq+YZv3XVjT0MA4N28ZP6tRNvUG7lPfDlHj
   tZVU1chDDXV+pcqRrA+1ckBIj9EiN9Djlojngj01IEj36SS4ohj6u2lh6
   W9MwPOYK+P4LrXG6OBtlnGd42Q34wpKy5XCVcYKWHlFcqDjcslTDfJjJ2
   ew25ORcnnuwn/3a4fyhqGVtxuta2b8eTzLHmi/s6lyJvXnhT12Y+ld7rL
   Ka4tFSjoXLs6L1TgHndVdyq6NsDxwOkxIq1kwU4QEhn7fZbkP/ndKcqbc
   MJG+wRZQI96aIshsMewASXVJEHG6ZJQBnNqKkN1pE3QsGZAlutlMPLKj/
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="243634531"
X-IronPort-AV: E=Sophos;i="5.90,243,1643702400"; 
   d="scan'208";a="243634531"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,243,1643702400"; 
   d="scan'208";a="506412958"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eljQ3yfUAeR+6Wd2/WnDJqkD0m+67Ix8rIE9FmqwTNa2mOZWKvXStf/2lh+Bc9O30cqT3kIg6+60qqeOPBQTozg7UroDlen37DmIc1T0xZBpuLZwRW4MPqH+PxEVMPzPLo6iDnVGpGMAru2vp7xFlLmOiZmmo8q+4/KgNUdImtPX64qKfzoQexcMqaPAL89HC052O/c7NzoSJL8wdQT74im+KQ07oU6sLQuOLAGVOOSURqseKXjvFA2ZgxckPWwrMjkNH8wzp76axKECmsCU2+Qaf8yqLdpdwG76t+RQ3RU1rF/Ve7bEysEMTbYfU7nHnJSgTil9bhYW1UWv1jIQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+VtECB6xpr3PRbgy+fyvwfhQ7Zi8rfhiTacVSs9lCs=;
 b=hq2MXtCzMMjLcSIThCsjmZryyEQzkBdo5Du+LiVhESVfA4Imd8Z2PhU+0QlMcUYmXRhL4H9a7TF+F6FmKvqCDBvF7KRr2lTxj8PdpqZHdWbLwMIGfHs3Y4vIHx+OSs1SRKEP6JCuk48uI8CN04JSx7nS4Vpx6XuAsRN7qm+AwIF7ire8hfP35XbBr1SwD72QkP6/fgKmRwNUt6/smR4NfRxBigWig9CEFjwiOo7priyYn9wsUAya0+VLG1l92+EqbD6DNQ3SxpbtP3ydbInCTh8mRTL4yzoRoRQQsTFAG9AKSk65V7jLHNNAPwZFyya1aqW6XB5rPBNx+UJtll9wKQ==
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
Thread-Index: AQHYQE0JDO4TZ1lTNEeFxdnKer9Q96zlc1KQ
Date: Fri, 8 Apr 2022 03:49:33 +0000
Message-ID: <BN9PR11MB52762BD5E8F62281A5C326F88CE99@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
In-Reply-To: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dee95e1b-4930-4bf8-c3ab-08da1912cb4f
x-ms-traffictypediagnostic: MN2PR11MB4192:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB4192844D5BB4A083BD8558E78CE99@MN2PR11MB4192.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hox3YpF5eszroIqEDBGUrWpwXjWzfgTrT/vd/HnUOSFqmOh5u572EZ68EPxno7WLr7MPAxUYiK/iMPnq6jd2nJrSB7jHBH+UKjVDtMxJUy84HMe0+O5T78MyhA7rgkl0c9laqi623HyG0Aqj5ziwz7Ri7UJTI89Hf/Fa033CeAcUJ/2Zvpkl0M0js4wWKEnqTEOp9aOGpzOAqapME6Bgq64tSFzJD5aBcUiQRCKDWCfk8QmYzeCNj27LCTef5a+ghcg6tWSwskmrdU4Ag3B26hWwCa9kmbpROGqKHnx8mZ3VtFiK8gzUaR6rRsBHz7kn/RH16IDRnxsBqldJdNJNsZjcXwZyRls6tdV93/pZ4kR6vyvY2cZ8uh+KaDzNfh6oTlpnhaA8o3hqG+HZNd3ltIIX/TbCRCzcREFlQ5ZrHnQ341KM+yiqqVGj8aBYsJM+s5wRjwxds6MFFmLoUu//WpsDNWyJ5gyP2IyPWj63Tr2hN9QXZeeBIOVNnWPeWFhkh0Pfk91O1jjdanhY8ZZiAJZLhYTbX4oeBvFzaBnmhSiRRnkMVascsdoQdMp+GdFLmkyENYhn2lytQcjX51CNvNTb4Smm8EElSxHglGYBX8QSnNIt7Vf/agw4/XqFEl2KaM4vuTk+b3BBrygnFQwLBULgeEH/38J4Fl4bH5vP6WbqIl0Dddbz3Ds3v+MUaoah8pn5rHrjNVO4DuUe7Oc4DA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38070700005)(52536014)(110136005)(54906003)(8936002)(64756008)(66446008)(66476007)(66556008)(8676002)(4326008)(83380400001)(71200400001)(86362001)(316002)(508600001)(82960400001)(122000001)(5660300002)(33656002)(76116006)(38100700002)(26005)(2906002)(66946007)(186003)(55016003)(9686003)(7696005)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wWwGrmSI5DTjxLjAWWVpWV7rkxZ4y0FBTjb4CCqoQd9kk0uaQyLHGbHCGO?=
 =?iso-8859-1?Q?IG/5NosqGK0XZFbOVA3OT5uOT2W8UpTZL19WQBwm5RXQtexv7QaZ6iS19k?=
 =?iso-8859-1?Q?jTr8kKfzI3aNU+FR+u3HSfVOdAacSDsnVoQ4l7UYOZTYx8wLH5sFCzDCyL?=
 =?iso-8859-1?Q?JpiiF+dRSAOMoq6j1XJkdN12g7VuFpQn9vJoxGymV/xIJznt8d02GdjtGZ?=
 =?iso-8859-1?Q?mg38V7yTKg790yin93kCGb8usHPQJqdXM7tlG1AbL/MafyogMxiYRzS2GA?=
 =?iso-8859-1?Q?U2LTbeaEaEzfD9JI5oNfN+mHTDR6w7eDhVjfXazeBU++cWz76yvKTVCyys?=
 =?iso-8859-1?Q?iZ/ZUC0oCXHGAdWdvJj9SC+sgnGGvLwCI1AAuSa9sVCnNExWQrSF4xE5yi?=
 =?iso-8859-1?Q?ReyLkcioOwjpy2bex+x4bZW/32ApdLXDYSb517TRYckrDZV6Wpsc4/Ydn3?=
 =?iso-8859-1?Q?2Qlq8nQBfTchS2xWlqRPqL4lrtebNO+BN9/Wkl+wNe0evq7S+V6iuL7URg?=
 =?iso-8859-1?Q?eKfojB6Z7DHKFU2ymHw4TjVojvBxH1HzXXU/C8qi/PS7/3R2FCd15OFnpf?=
 =?iso-8859-1?Q?zd1WEyRk7lsr7vj+lCsb7/xYiK9SPuLnmcdVTKtXMKsGnWBEkpSzUC6N9O?=
 =?iso-8859-1?Q?oyo4aQP3kpWTHUpn7mCpjnEyYo1fqp9sKqMdPa1annxQqcusQLr4p4bx1w?=
 =?iso-8859-1?Q?Qqu7KpzbtQLUWqLwq/A0k9dY6W+wBK94bfK+BbLvBpXvHhEPWjZouWhsCC?=
 =?iso-8859-1?Q?6DtvIvTqQbsyev2dfXJWTozRRGeRCcEP99F05prplPMQEZCEsc1MPJp7TX?=
 =?iso-8859-1?Q?PsEqza5bWdY8EfNRNkV99fFfERmC70bAkqLhsq4i6L1YbBLt7auJi5BBXv?=
 =?iso-8859-1?Q?zC/TYJxzepWOYRxfoO8C8u2AtPTqhD1WbTVJQpKJF3ge/yvCZSAdDgVVnT?=
 =?iso-8859-1?Q?+77cPXWhxGGIcSWrLHYLW9N5P+YnGKeJhu19jZNk4k6qsa+YAocgEcCVQK?=
 =?iso-8859-1?Q?Woz5vXMjIig/BwFS2CLwcKB0aTgEw5Fc7dNElLww/SmTL7z4mt3hkPDR0r?=
 =?iso-8859-1?Q?xLB8mSFHK8/mthnCLorqjtx0qcPBi2ykvWfFCK7+47CE+OBgbRv1vLwh49?=
 =?iso-8859-1?Q?+K2UgYA1IOVRfoTfjmcVNotuyjqK24wuzuVEdrD46jQtLHR08lakcSpew9?=
 =?iso-8859-1?Q?Ak5vDrMJDlpWJNQUejQ9GiRf4oMK0nduxujutkw3jJFCO1nV8mWN22GJnB?=
 =?iso-8859-1?Q?bAROI2lT2wZ+UiUskGqi0DAIjZs0FOWfRwLdpUPbGFeUNsTtYqGA1tg09h?=
 =?iso-8859-1?Q?5k2zxCi9E0nSwBzCuGdp3wIEIOhsjZA/Tu4SEhPjNm8gu/Dqv0zSEzX9pi?=
 =?iso-8859-1?Q?tzIQ17xic+5rvdOE4OiYxwuYQftDcqvuZ6Bv0IvfGfLC9Y8ADUSbvVAzLf?=
 =?iso-8859-1?Q?7Nr1OZ+KbSbO0FY2RdZYlm1m/AXXOiKIEVI5Y5IUFazaRSWn4LBWtta7e8?=
 =?iso-8859-1?Q?1swmEDEUG7FpC1zy2tG4GmLkauNU1l0M1LEHwWmnSZV1xkJq8AOWnYsLaa?=
 =?iso-8859-1?Q?H5pkDXyWgTYLb74QtE34AmZKLN+i/teXsnoNO2iUpJQAXUycWUT/HqtY8k?=
 =?iso-8859-1?Q?91IamJLwM2F4SxHw5B0stfsKzi9gkbXyoY/TaFChmz6NIVXU+SHjk12gC2?=
 =?iso-8859-1?Q?D57YlkLTbfaye3celvbUDl6SlRHTgL/N2FSEhHVN9gWXrAu9r7olD+RusJ?=
 =?iso-8859-1?Q?9Roiey84orh10ky55zlVay6J0i4EMnB9cHSaf3z7fQFesGCrvmSXIPD+4G?=
 =?iso-8859-1?Q?F4Dno62r8g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee95e1b-4930-4bf8-c3ab-08da1912cb4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 03:49:33.5892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZ6Rog95mpPdYSSPjgDUjeRJzguP/tf45JLf3enBHWwLbOPBmEOq21LScv0r/R1ZSQlJIZ5MC0BivbHYEOMDFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4192
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

There lacks of explanation somewhere how those states are selected.
Your discussion with Andrew leaves me the impression that Andrew sees
more issues in general save/restore path while you only want to deal with
the requirements for your own usage. But according to v1 your usage only
cares about the interruptiblity info. This implies that v5 is kind of in a =
state
between your original intention and what Andrew actually wants...

Thanks
Kevin

