Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5BA685EC1
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 06:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488101.756005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN5Pf-0003xT-6e; Wed, 01 Feb 2023 05:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488101.756005; Wed, 01 Feb 2023 05:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN5Pf-0003uO-3O; Wed, 01 Feb 2023 05:12:03 +0000
Received: by outflank-mailman (input) for mailman id 488101;
 Wed, 01 Feb 2023 05:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rT7Y=55=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pN5Pd-0003uI-HY
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 05:12:01 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3afa98c-a1ee-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 06:12:00 +0100 (CET)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 21:11:57 -0800
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 31 Jan 2023 21:11:57 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 21:11:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 21:11:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 21:11:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 21:11:56 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 05:11:52 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 05:11:52 +0000
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
X-Inumbo-ID: f3afa98c-a1ee-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675228320; x=1706764320;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=b+bBWUPbIBEuR2EhtfZsUh0jZolhdTF7A/ADX3h27Nc=;
  b=B2wngUx5C0tIItj5xm/Ece9EA867sT4YSRFL4aYSl19LqNAGh4wkxric
   Pfmvbi/m1xsOBU4tmxFCpfhoZy+jV8WFfcaGZXNX6OL1l8oTN1q/IPP4/
   +P1QQsN/q/Oco8uEeVxYTIW4JUOdgwyup7sOV6gkbsXczz7MwLL8oLWfE
   UsDu53xPrqqActlRcchteD5euFCimyYYMZXWbeWwsRp1UGNX0vLgbgHlt
   BcJfq34Nqp+x4MqgthV4PTb8RgEOwcGI/do6faszMVNMvFGGxF1p0p0Lf
   OuCst3g09kzrOQQK3UpYvY0K2N6NnTJRg2qnekTR/siGoQt9aBjpJ4p47
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="326702799"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="326702799"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="666781073"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="666781073"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkoBXURUBpQ+y2D+EHVyOpBN3shn6m5B8pUdBfCFAPT18P4sf7/HnElWpkQw1qKUaDSWnjw59K3EA0BxmM6ETB3VczhXfKoG4IP+j526slrA0+RurUW+xMqu9ZfZ7uufV7mRWgYDLvkE9WDEXoJcG/GdQNRMJ1jHjrqmQaWff1LJJv7kLdkUsUi3hprtu5UDUF13IQFWpJeLftR4w0FxjAJRDmcN380vNazgWJgMRwfFxPGENoDFM9lq8+lffMI8iLjyrL7gooVIGw16Kly1eXqt2o+YRjBgwsHYbnQonDKKRXSMLfGkK6CO+98e6m5clzQVsxOjBAxlHIfoymt00A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+bBWUPbIBEuR2EhtfZsUh0jZolhdTF7A/ADX3h27Nc=;
 b=BgmDy6tTgUoC18RkbLpSN4YrpFoJ0paT22cWJ561DYN7IWfmULat8c9B8ME4dk+HJ3tyEIZGjdEUmz8uNa3N3eZ6RHWZiF7OTAQCkSAeH4CXPPnrJj7tpr7fvtSgCWBSAB/x3BBXbRKZGExy0keY8rGRwq2G7x4nU2WAAEOcfr0h1TQR7ZGEl7AAsJtz36s/dQm25vXCCkK7tdP3t+WHkRLNAeF1zf66WuUfv49g8J0F+WtQxYphzTWD/0TWTllglBlAQVsq1CZQTaLcBzJKV8y7ynV1FS7WGFOco8bUh+7oCfVuoiwFvfU5GEbw7FgULO4/Nhv8/Zevi6jvVZymFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, "Beulich, Jan"
	<JBeulich@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Pau_Monn=E9=2C_Roger?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH v4 3/5] x86/iommu: call pi_update_irte through an
 hvm_function callback
Thread-Topic: [PATCH v4 3/5] x86/iommu: call pi_update_irte through an
 hvm_function callback
Thread-Index: AQHZL/FBdWHP+udJ1U++j3LNg3bXBK65l2Zw
Date: Wed, 1 Feb 2023 05:11:52 +0000
Message-ID: <BN9PR11MB52768373983546E71CF679558CD19@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230124124142.38500-1-burzalodowa@gmail.com>
 <20230124124142.38500-4-burzalodowa@gmail.com>
In-Reply-To: <20230124124142.38500-4-burzalodowa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ0PR11MB5150:EE_
x-ms-office365-filtering-correlation-id: 0a41bcfb-6ec6-4c2e-9ef1-08db0412d49d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: brZKKLlo0i0vjdZRq4HCX12i3WStHRuD6bo3GxV3ZgnDNJC5uMvlnxgScrDNlEUKMQT0CQYWhu3PQOK9HBl71gTaIO8fv5cRBtXHtzXxSl6HMugBXN2U+Ure7TL7WrMOI5gaqONAq6zMCfqXKGkj71SdewBAfgZWkIQE5yKSBSlEroKfqMDI6B+Xj/Xd2LfY2QFM689ArnH6LHKBMvrg5S837dzLMYFQLLUgwtxPrh4dQmCIbeBeUjo7pN3c/J896lc6CnxZnRh0h0b02NFEwRFlZN8pdiXRTpRobtnD+7bktCNL/FKBbexxUft6uPZRx4LnxJcZN5XTynmT8KiaHO72wWOdlwVsVYOY2ghteJobru+B9LMipLGuGdkg74kKB7rC2fEZCdZ4Nx0kAKkWrr2FXRwI3UUEozj/0TL9OqhAlfJwjIrWWR/O8AhiQwYiSncxJyUbOa2J6S4iP3pkhXvfp6AIxT50R7NrNPd42NCjLfmDDCZq7lPDCMMQbczJLd/xKQDYFFTwHZE66vi5QbmnHNMFYHjr+gnNovq4xiGkrUdoVWpA41l37WiaF7IbE0CJVh/UCgSOYAoAevJ82DY60MQL0EOTy7Lt85jpWzBfQBCmAFnDdo+MQurjkeQU3P/fXk2QuQXzuouYtkAsoFWN1OViOIT/QzeaqqsuOB7HHMpbOoQrRRd/p0z+x+Ho8gGFC6t4iz/+R2sW8vfVGQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199018)(82960400001)(122000001)(6506007)(38100700002)(83380400001)(38070700005)(86362001)(7696005)(33656002)(478600001)(26005)(186003)(9686003)(110136005)(54906003)(316002)(71200400001)(8936002)(41300700001)(2906002)(66476007)(76116006)(64756008)(66556008)(66946007)(66446008)(8676002)(4326008)(55016003)(52536014)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HROv6qy7nZNtbzzjiuVSHEXdiTc+YDlxZtbwHZFU3I5IXqrMdjHOuHYboq?=
 =?iso-8859-1?Q?hrCYRf2zHKFs9g8t1SfGRi1hakeYeusrhPtIE+sFE1inpRl8GP7kCmW0JD?=
 =?iso-8859-1?Q?wF7T5g/YHaacpTQ+KqDXkKcK7un2kVDLyh5Cfp5saNFyhL7bESXA61SbIx?=
 =?iso-8859-1?Q?B1adC3PePPvS/aHfS4ZrgYAziRtQLlv5ehoMQ0sjw8gK0NwT8dK4+r2e64?=
 =?iso-8859-1?Q?OVLWFaM1hoyCjhsQo1qVOqHCU1tOPho70n+RvRMO2ImIzryFvmqFvZqNbm?=
 =?iso-8859-1?Q?Gx6XAOocTA4+JZ/GwVEKAHu7SkD4goCaYtcalTC1M4NE4nBJZuQflctZI1?=
 =?iso-8859-1?Q?w7JfRdMdEDaaTqmyju/YK5WcdjvdgtpEs4ZjymHrijjmZCjSzbLjsDB2i5?=
 =?iso-8859-1?Q?W8REaxkVxledlWOoqOFGt35SzLC/mGiNhYvXeSsn4wEtkm1ci7GiIZB0KA?=
 =?iso-8859-1?Q?nLnMDxSMdqL1HE8Ccikg4qwjlZUk9EYKMc4bH0PB+eRkfv2+15r0jV4EQS?=
 =?iso-8859-1?Q?sjC3e26/MjYNsmrAMjwCr8OImpGxF7NadTd5dgipZ5WzMRw+3+X8GxjIHu?=
 =?iso-8859-1?Q?+/YyzTfWrHS04PWBMrPVMkr5gBeSDwRe6ZPVhg/YhQFEucPbzWbB3bNtj4?=
 =?iso-8859-1?Q?OEGynzFSb9qMEPm6BTGfNXnwYCT4kmT1P7eiI+VjTPNpi2bMoUUv3AuY7B?=
 =?iso-8859-1?Q?aPFyY9VOtBCExzNnObSvrHsysZKKG4rxlAlDmlE3nxOXIESS/CM38gpIIc?=
 =?iso-8859-1?Q?DOzwKfU2F4sRILuqUJ/lcf5gQUDEWf5WBvCdWPA5p6VLFRpQRv6wSGxg4e?=
 =?iso-8859-1?Q?JS+wh4kj4I7G8Pu6tCc8tz2YMVOdYNrCH1TR5mKkbZokhBFIdMkHFPzz9V?=
 =?iso-8859-1?Q?B9CgTb/xJGt3VqMFt/HqaXujCSvfujg9Ng+jSonk9ZQRjTgMPxosTH5W0k?=
 =?iso-8859-1?Q?x+CPooNiN8VVr0tx3TfZyk8eqxIUzD5tMCFwIZqPZMi4O7DDLXWTUMIHYt?=
 =?iso-8859-1?Q?xeojnkJZKy8IUULRb2yjLNG+NJ+R54xMVYEYYJYmoCozgOndK6PmFrppKs?=
 =?iso-8859-1?Q?0HatBweOEW2Y+217tMUfMV1GFhAJ5cic+Z+VWlRqfjy/WGQcsecr9JVhUw?=
 =?iso-8859-1?Q?7T0XqwJ1i1+UrivagLgdwc5oGzNXXM9i2AWM1bZK1kNYqVWChwwrHJotMr?=
 =?iso-8859-1?Q?z8qEo/m7tQ+GavCBkBTCIJptlMlv3XPNKYOd+KQWAHHdW5gdJsomFwSVv/?=
 =?iso-8859-1?Q?/sKbBOLg8actZ1aqCv+2s0G4oWLEdzu7As5E7mjgFAmAFPJZBeCv+8c7ql?=
 =?iso-8859-1?Q?jYvdWHWnlu8ed7e8dtuquw217tPjTe1SxmlK46d1s/ldlADS6WJUIq+z6i?=
 =?iso-8859-1?Q?1rgM3e6yGInG80yryC7l6Q3I3+a7sBtnFJv18Qy2FEOgKAc6cu51t9v8RH?=
 =?iso-8859-1?Q?oCsAgxGnDjIRsABEPCneOjfK7xSHxO/luh++vboMFg0+jOCfn/TkEty4GM?=
 =?iso-8859-1?Q?aVzzpA4KQ71Y/3nDRNcX399yJPQTM03tCDGC4MQSUXAlidpQmvmUvsXlBk?=
 =?iso-8859-1?Q?yI1chl76jgaJMlmcRlefN4bI5Uge6QT3U6W2CUK0qM6rQwXrCMVFDNXYWY?=
 =?iso-8859-1?Q?ByVSTJHavxXLxoTmSSWarRXd/wtGwFi9mK?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a41bcfb-6ec6-4c2e-9ef1-08db0412d49d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 05:11:52.5610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SP+liOAcgTHp02Dk0N7ggmDM+BGUHw4juIj3y8TPKxmSC2aoP4vBXWVg3FASL/1BOUqdlBDKGf0tV2B+W6N/HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5150
X-OriginatorOrg: intel.com

> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> Sent: Tuesday, January 24, 2023 8:42 PM
>=20
> Posted interrupt support in Xen is currently implemented only for the
> Intel platforms. Instead of calling directly pi_update_irte() from the
> common hvm code, add a pi_update_irte callback to the hvm_function_table.
> Then, create a wrapper function hvm_pi_update_irte() to be used by the
> common hvm code.
>=20
> In the pi_update_irte callback prototype, pass the vcpu as first paramete=
r
> instead of the posted-interrupt descriptor that is platform specific, and
> remove the const qualifier from the parameter gvec since it is not needed
> and because it does not compile with the alternative code patching in use=
.
>=20
> Since the posted interrupt descriptor is Intel VT-x specific while
> msi_msg_write_remap_rte is iommu specific, open code pi_update_irte()
> inside
> vmx_pi_update_irte() but replace msi_msg_write_remap_rte() with generic
> iommu_update_ire_from_msi(). That way vmx_pi_update_irte() is not
> bound to
> Intel VT-d anymore.
>=20
> Remove the now unused pi_update_irte() implementation.
>=20
> No functional change intended.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

