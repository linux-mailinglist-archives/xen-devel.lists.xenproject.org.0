Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D620B6CB388
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 04:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515528.798500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgyfL-0000tv-J9; Tue, 28 Mar 2023 02:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515528.798500; Tue, 28 Mar 2023 02:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgyfL-0000rQ-Cu; Tue, 28 Mar 2023 02:02:27 +0000
Received: by outflank-mailman (input) for mailman id 515528;
 Tue, 28 Mar 2023 02:02:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t3nS=7U=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pgyfJ-0000rK-9Q
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 02:02:25 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92711b53-cd0c-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 04:02:22 +0200 (CEST)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 19:01:59 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 27 Mar 2023 19:01:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 19:01:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 19:01:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 19:01:57 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 19:01:57 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH7PR11MB6747.namprd11.prod.outlook.com (2603:10b6:510:1b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Tue, 28 Mar
 2023 02:01:55 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::73e9:b405:2cae:9174%8]) with mapi id 15.20.6222.032; Tue, 28 Mar 2023
 02:01:55 +0000
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
X-Inumbo-ID: 92711b53-cd0c-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679968942; x=1711504942;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gp3/FYgyN6VOxSkveE+QbhuxPGByHAClcMqKqStIm6w=;
  b=ButkUBwv/06mWYJDjx/ZzyI5mhZQZK1qIkhNokZe6Wc8MHvp1B4AaBQ6
   Cd4CEBBG+Qo7A+thlrhZEAEYTXE9IfHOIJmeb6oHPXer9N5w7ZevVO+vJ
   3PPhu8koctRIZc17P3BPkLq8yqEHOHK9NK3Tp5xwloYWxvRofqvfgR1Bm
   inpqI1oGECkzVMV44iuZ8eVCfUTb5h9InGBfSOjSOXiTrURsRVp0CCKlN
   PrbB2IfGTPMCDjzQ+76HiAxTFYd/h7R/U4JgVnP8yATO5JUM5KM8zyi5V
   Wxe31ufNZ/TGs4FFt8YU5Zo80Nw5nRHEy6b1V3XO5k0idUuA76UEdkape
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="328891775"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="328891775"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="677174645"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="677174645"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwLkDmD5FmPcqAiZlQ8ekSY08K4kt1tnNs0t1zqflQU3CeLfk7ZCRo9E4JNmlkuwbbEUvMNgjC3npanxFLA8jHb26yRWGGVazCzZFqCX2PWn9g3oUjvrbrka4nDod1c9cvK7DJwtoAomryXqLqqKkbXhhpGOouh+gbWIzu2ayYItfqGWDHvufvkBtdw1IexSZ8W0Li90dGC19o1DPxRk+kXRvuZtndqgzTIq5NJ4wfptqvLdUYqCNz1RR1xPtRP94psQou4PZfx4oJwivgZf9Cpe9XcXrQiwIK9LKNzJbO5S5pmXeA2tB19pDDEYCMjywNx20N7djh4FogBcQqW0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gp3/FYgyN6VOxSkveE+QbhuxPGByHAClcMqKqStIm6w=;
 b=U6jKxsGtVpo5AZPNAjxaUCCqOVRfRlhhGwHd+PamTzM17KDHv//1jTvK5zOoEtNoj/BEU0xYi5jHp1NQyrrxndWg6tDxeWVSzAD92vvA+fmMOJluBnr82KP3nUvCjQcEMJiriksLKWm+hEmZJeOI8ja7dvRsWN1WeZtG1AmyM5/ItCt/K0febhOp3ZJtF5fP2K4muvqr/YJT/Wnw+jsRDY/NoCzGCqHAiD1c7XhtQIJ87l0yfIvMt8Qb4Ko1TkcyJ4D3iDFNyQ778U0DWkl41EtsagoK9n1P0Er4Dp4gjCF0fOcobol4XdOLyE/wEqlyJMvZ3jy9rgQJbtQDInHHBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Gross,
 Jurgen" <jgross@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Beulich, Jan" <JBeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, =?iso-8859-1?Q?Pau_Monn=E9=2C_Roger?=
	<roger.pau@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, "Anton
 Belousov" <abelousov@ptsecurity.com>
Subject: RE: [XEN PATCH v5] x86/monitor: Add new monitor event to catch I/O
 instructions
Thread-Topic: [XEN PATCH v5] x86/monitor: Add new monitor event to catch I/O
 instructions
Thread-Index: AQHZW/1XdYUNBKl0cUuTM/1Eg+CUsa8PenqA
Date: Tue, 28 Mar 2023 02:01:54 +0000
Message-ID: <BN9PR11MB5276A1481CD4996C16EB46988C889@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <7bd5ec4ff75ea0157d782f8820db1d17b6ad1289.1679406554.git.isaikin-dmitry@yandex.ru>
In-Reply-To: <7bd5ec4ff75ea0157d782f8820db1d17b6ad1289.1679406554.git.isaikin-dmitry@yandex.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH7PR11MB6747:EE_
x-ms-office365-filtering-correlation-id: 6f1077df-8b7a-4912-d229-08db2f3067d1
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zAcazFfaN0ir/Ss35EIjdcNtvcznGuKN3EbpjMkgYiB3pLYWCMtD1xyJqXgwbdC9rXaHcwHO7JzgclXJGIR6GbUOJwxx5a9eWQFz0k+J9Pskx7o1Sp6LaGaz0uyUOUDgdkulvyQK89TnrUGzkxTgoNj57d8KyKld5N1Q8Fg8wpod/cKJdeTaK6MUKZ5X4fWLqQag760ySZGAJ+COo5oAYCcSAng+Sk2KKanL+Re90/4Emjij2JSpj8PEoR9saTiX6f9NpZa2JcWSb8+6fpqk/LoSYOFUcwn1lFptarlsSbkWiUsdTkems8BEzmAk4d1FmOR3X+xaY260WxtxRNNsRMDnIrArg6cCC5+8i1BDVkKA2ZPXGBYG059rnXxqoTIAICHpGpq8dMig0DQl6eoro55BMbOOImuCO+ZvT7dWagwxShZjHsqjQcJUBma+rCNhypj0ZNWPkv/AqpUZwrtEvF/C9+NUDn3Fz5lsfEUo7o0JwVG+UObu8h5SeB8t4+zzdEJllJ7Feyz/IfJq9ShSnnRjnkTDR/wUzi0S4DZJn87dPrPD01Z89CkUjXkVMjF/8PFP0cjr4qlxJqFDX24BzdwoUJR4JU9DfkFpA0OxaN7ppJboQ8q/uQ+ywIRnyHSL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(41300700001)(558084003)(52536014)(86362001)(33656002)(5660300002)(38100700002)(8936002)(122000001)(82960400001)(66446008)(54906003)(478600001)(7696005)(71200400001)(76116006)(8676002)(66946007)(66556008)(64756008)(2906002)(66476007)(4326008)(38070700005)(7416002)(55016003)(6506007)(9686003)(316002)(186003)(26005)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3yXIrMoXvVl/AOOPbREBQ/3sZ6CNvxMPrKPfRidm97BaMTH+AZ3uegTYaP?=
 =?iso-8859-1?Q?Hi0c8XUffE3mPZbkm9RRccEO0kOtoko/0G3aWWSYuZccVOJK8+eJ0/40+V?=
 =?iso-8859-1?Q?dWrAPWC9cZN8/wP2+9+81j1UWJHSAYtJveeWelMJd0A87Xt9oyM3eBwz3b?=
 =?iso-8859-1?Q?//XIpo2p9kjCZ+zbMS8uCu/1zP8TJVUDdcWZSWXqCqtsG4mrUfZlyJvDhF?=
 =?iso-8859-1?Q?LTs5lzG3eW9D59KLAGqj8128wG6b+nmD10ruLuQmaqNHiScNXJXcZFLdLm?=
 =?iso-8859-1?Q?c3aYrH0bVPs3NAlMIlLVBZDFuTzaCk8xBnoQHaFfC+dcxSK3Ir/n+pbRZJ?=
 =?iso-8859-1?Q?c/UXJnkc2BsQhPuoEepmb3WKDoGLkoHhAuKTgZDSidCDl8nbYSE2M/D/iH?=
 =?iso-8859-1?Q?+Efn53uNn130w9/oc8w3dEQpkYMv7Y9t71ZrUUCTJ5oqPOr5RGECzM4YPQ?=
 =?iso-8859-1?Q?JpuHrXcSz3hK12HWJQVcaQWFxNmlqjy09PfEC/1360YimWSkAj+fEnRmCT?=
 =?iso-8859-1?Q?2owb9lsyMUqOCQM36s4IE7+vuql7rMX4gH+j6WQt6GSh4VdRBOJdX9fvm4?=
 =?iso-8859-1?Q?fsDEtqvbE0pPzUMl4q+teCPFsyJOEcNexF0Q7oBa/Ehhyxl9uEGAJ7K2zu?=
 =?iso-8859-1?Q?PrieBET+urLy37FTJPe6CFIC9FaEhvGhlZN1p41+jCt1rSWRZJ7XdPhEuU?=
 =?iso-8859-1?Q?APcuE9GzkrLvD00BBdNV3fayp7O1k4Vv9h7R483PPzmXDkeRdnCA1i2dOY?=
 =?iso-8859-1?Q?m7hY4aGt3s0wRfBIjt5eLZXrbXbWyQxGQm+oPlCTWn3qEKpXeko4VKT5hf?=
 =?iso-8859-1?Q?WGiKm3RYsYCafhw3L4r3IzntSp35xaq+Nzj0eabRVt+kGBqVGW9jRLRTO7?=
 =?iso-8859-1?Q?basuZquxXq30ocWJajJ9MzOmEbVN4suwPNsfGxDqge6D8pJg9yT/G2ELyc?=
 =?iso-8859-1?Q?95NKQ9oBITcNYYdpkzEt4ZoQQYt5ncJmfsY6W11pMil0b8uHWgo303FkjX?=
 =?iso-8859-1?Q?oppZ1RiwNBcKbtnIR5Q+cjfH/eV8+NL3BCWrana4lh40eNkELrm6zRNSwD?=
 =?iso-8859-1?Q?N27B96BuIOsurrIbAWEyt2pBFV8JrnD6FWG8F7YUYEIf1UTN76J3/78E57?=
 =?iso-8859-1?Q?J34Ig8poo4jnw01Qn7ILDWqcxJJThII50KqjTb7GJQkzqlpCiBqkVCp+9S?=
 =?iso-8859-1?Q?y+pGXYFqfWXQJbYYcQi3yOI3Am984Lyvj+MKd3hoKAtGkJ21cgxN3gnSDx?=
 =?iso-8859-1?Q?cGsJ9hEmG4BlDzJk/IWyV1c9nPP5PJbf1y2K9VTsKmUuS6lkYYR4jUhn0X?=
 =?iso-8859-1?Q?zU+SaZJSsmRZQvA/7Z5aT1iCTi+w2nB3yCMzzZVwuxC2u6ysDi7X2U+GK2?=
 =?iso-8859-1?Q?qUTc5UfsG6mw6P3jmKDu1WEAZgS9q3ENjOe21Kwe37bkECRIW57UEIYRK+?=
 =?iso-8859-1?Q?t29mcG06MLk/srg6Ulw1CcgJa9rJ5UP0cXslKP1NB3dTds95SzLP9Vz8cn?=
 =?iso-8859-1?Q?h7TkR3yZijqwNlOW0hJUUEiptJ8Waw4hVO9cFHfG3ITRM8TXIn4Ah7r3Os?=
 =?iso-8859-1?Q?VOmiX9nTTlfiEN+DsyhlcTjxQs4oWuEsxSddxbGhAWYl9ehDslnEk2IXEm?=
 =?iso-8859-1?Q?+MjjVqmdC8feqqGenDPqdShcrQbJhwTTVA?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1077df-8b7a-4912-d229-08db2f3067d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 02:01:54.9433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/jIRpCXQt3NpW8khynCaP8+8LL/OKDnqyDuuUIOqqdWPDKo4dFHfmCnO+CbvQR1rBqPG0N5OuK0tRCUSv5TcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6747
X-OriginatorOrg: intel.com

> From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> Sent: Tuesday, March 21, 2023 9:59 PM
>=20
> Adds monitor support for I/O instructions.
>=20
> Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> Signed-off-by: Anton Belousov <abelousov@ptsecurity.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

