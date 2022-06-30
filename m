Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B74560F03
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 04:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358143.587173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6jiO-0005al-KE; Thu, 30 Jun 2022 02:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358143.587173; Thu, 30 Jun 2022 02:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6jiO-0005Ys-G9; Thu, 30 Jun 2022 02:15:32 +0000
Received: by outflank-mailman (input) for mailman id 358143;
 Thu, 30 Jun 2022 02:15:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0xB=XF=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1o6jiM-0005Ym-Kc
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 02:15:30 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8171f9a7-f81a-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 04:15:28 +0200 (CEST)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 19:15:26 -0700
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Jun 2022 19:15:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 29 Jun 2022 19:15:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 29 Jun 2022 19:15:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 29 Jun 2022 19:15:25 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 29 Jun 2022 19:15:25 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN6PR11MB2941.namprd11.prod.outlook.com (2603:10b6:805:dc::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 02:15:22 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 02:15:22 +0000
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
X-Inumbo-ID: 8171f9a7-f81a-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656555328; x=1688091328;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q67O8NPS7kbCJUjPjQIzJxZ73OAVeYTuFXN0uy/HgJM=;
  b=PKbHR1XB6o6HEk8PqW/chwO39GlVtl4UhBJ/YuvKoo/u6McFYe1v2n0A
   foKqMKY31FXRxniugOQnauEHoZDhwQU5WsB5P47K3aNGZ97sTHuW8gFf4
   XPI2LLju0BsCbviAElV4YRdIhdqJppWEMfNFFOAh/r6dARzDkdnjJrhiG
   M7+D8iQl8BSteSdUm/p/4eMJ7hzddEWs98fdKEK4uCDo9Sgz1+9ITcqWy
   G0f6mjlOM31XQataxBQzMIm13CYH1ZSmPeDZAILp73+pljjEMHm803T8D
   ejo9jqOYKU3dErt0cFcLiHjwKHFsCSv5Po1isqtDaM8eOELjl3vKY5QDk
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="368532552"
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; 
   d="scan'208";a="368532552"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; 
   d="scan'208";a="680774086"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFmhK/zJHz4z592XKIqSIFoFNHi/KJYRziI6r8wuHgcHiRHcre3zsbpvPS5dI4WdQ41E40i4DC9Xa4cKMSbVHIl1IdJM3mzOow1d5ptaKvsgzBAaRLK7fxZJS03bowENR9YJzux3P5rTlHY9+qQzVUPXD6WPWtjBH3v76uz+yU4TTjaKH2YsKDDgt1JNipDw3UgpTO3Z0oeFL8h7Sxm5/Rqkf76aa6FDhYJSjm//iv64oSlpGygk5GVONpe5X5HSN4g/j86LraoH2lKH9AL1OA/bN9otgzSzW/WeT5fYqYQwcFbbxHWHxiq6uju0gL1FsaBGm6zj7l7KVVuQNZln0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q67O8NPS7kbCJUjPjQIzJxZ73OAVeYTuFXN0uy/HgJM=;
 b=E3LWBC48pWs15gXTDoYOg2H7UJVKrlJCUPLNi4yKD+9200v1P6mCQyZA3D0JpF1+GeIvdmJQ3EJaThUwuGfzaK1l1hAjAGWhr/SovCQifzxMRJetXKCmE0ckQakgRsoa99THB79DurFw4DyksNz6yNMcJ+YZtm5Nrra9ox36fBs/auu7CLFSs2nORDXl+GbBUNkilVKrjb7SvicTVotJH8O2HKB+RqCgofXxobxVHQf1Q/bYqtoC8X3MNeK4C+pqq/6x0EmGzLdVFOVsqXV/7p1nV+vsR52YsbN1feOwf/FAskmUoVArq/0qyEtIiFHFThaLYeUhYqZW1dXEoKre1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jane Malalane <Jane.Malalane@citrix.com>, "Beulich, Jan"
	<JBeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Gross, Jurgen" <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Nakajima, Jun"
	<jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH RESEND v10 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH RESEND v10 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYi8Ai6ihqZv9P00+2HZAdh00G3K1mcQoAgAAN4ACAALfGIA==
Date: Thu, 30 Jun 2022 02:15:22 +0000
Message-ID: <BN9PR11MB527622D32D748EC5668C25DD8CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220629135534.19923-1-jane.malalane@citrix.com>
 <20220629135534.19923-2-jane.malalane@citrix.com>
 <efb34738-49a9-fa4f-900a-fd530ff835ce@suse.com>
 <3e4443ec-de14-b02b-99f2-e6b63b06ca41@citrix.com>
In-Reply-To: <3e4443ec-de14-b02b-99f2-e6b63b06ca41@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 376484bb-e541-408a-451b-08da5a3e62ea
x-ms-traffictypediagnostic: SN6PR11MB2941:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3FQerlRXRN/h/RGJfF8CswCTQKoIfxHkWbk0FqyfIhtsnyHXtI7K/wnklwwo8mO8JSX/sktqEaSR47J/HnFZAwXoXTq5SSYGcDGo3KhEXl5BGThwuG2Mwm/mfWFJX6B3RTLDN4LxB6pQ5THm25ZeaLtqgk9mdLwjmqO1Qu3dI97jJvKLTWhGwYJuORdDNeCQsjDPN8AO3Td91F3lTpbGP5Tdc4cszfz1UsmFqNFsLiERWK6w7ApQbt1R1PfHADyRCkUSxpVr04K7Vz+dl/OoszlmM8r7JylGI5mUKnv5efFUMyWQ3B28U94mVyP3pm1lJB01ZF/XiJku7VPuYA+4DgetWt2jGQva55iCmbs8N8ggG6cRAXGjVRfM+KpXbtNTsutA4JVNnF3An7YiyWV1m6V3VWu2QusovPWp+WqoWW5Ox7JAmekEqYKK6p/f9GNHVPVF4kj5bHYau0XkADMRVfNOMvP0C+S6gU8szCQbH6yNBfbepPyeHA+NFCwUn4YQHL4AQcHIMI/F99pfB22yOJ3mVhNhq+lHf9KALPMDao2AHePxlIfoMqFFk2P34hFY2sHPkn5AQR309aHmzT6KbWHmyft2jgyEA6+C52qb2b3dIEmfkkbAC7ZitaQQiIaLZcbt7TwLdyjshTcXD76XwmMEDVRVcBn17tTFF2qWAsxKeFYnzxPbLMh9za0nhEPgCPoaKjxf9QGr4EPLnIxAFUv3G1zAX15tBLBBB5GRPIbZObNWy7AJsJ56sQWplBZOWkm8JKQ0+qMFk7M7dFPK8rULtaG1uQPfrgHLxgmbSr3dBOft6j6g0oxusqZwTwhL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(366004)(376002)(39860400002)(136003)(66556008)(26005)(8936002)(53546011)(186003)(9686003)(71200400001)(66446008)(76116006)(8676002)(83380400001)(7696005)(41300700001)(33656002)(86362001)(6506007)(55016003)(4326008)(66946007)(38100700002)(64756008)(38070700005)(478600001)(66476007)(54906003)(110136005)(52536014)(5660300002)(316002)(82960400001)(7416002)(2906002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWhCWjd4Qm1NZ0pXdllkdFZKRE4yd2VFS3FKNDFRWjVwWFdNcHFtYVg0NFpZ?=
 =?utf-8?B?SFNWcWxWNVA0NTZ6VFMyRkg1d0xWcTRZSmplcmVxZXFPVnYrdk15Wjd6U3Qr?=
 =?utf-8?B?WmNVSDFQQXpLcTdXcUpBYUFHRVlyNVYrSG5JUkdBQTl3cEs1OEVHakxmZCtv?=
 =?utf-8?B?QlYzVVNERjc1RTQ0TmMvRm5YZTZQRDJRR0Y5K0MvM1pxaWhIL1hKWGNwanN3?=
 =?utf-8?B?cXVUL1YrS1JObXJpaE1STmpCS1Y2RkU0NllRY3NURjlWeFR4cEVnTXhocHBC?=
 =?utf-8?B?UlI3bHVOb24vNEo5M1ZQV0V0VUMyWFZqeXdyUE0vV0lNOGt0YVRkNm5EaEts?=
 =?utf-8?B?bCsxWVNsM3JWWHFqbVB4ays0eHJmb2EzbUNPdWxvemtUT2dhK040Umt2bXFS?=
 =?utf-8?B?RkRLZUJGb2ROeldGYVJ5eVZjSnRSYmZ4SEtuUjZPVU1LNWlyTjRDelowbjNC?=
 =?utf-8?B?SVh2TktuQWNCY0JYTnV1cFFzTFZpOWdXNHN6aFA3ckFOWUl3b3oxeStINjQ2?=
 =?utf-8?B?MDlFbWd4UGZ2NWV2YWlpRk12WTdIRlNHUXpWaWlEN3FRYzMxa2pNTXpiVVdr?=
 =?utf-8?B?cDRCT2tKU1lHMU5HQ1Nibi9oSVJOa0xxNFdWd0ZiOXNJay85Wmo4bE9SZlNy?=
 =?utf-8?B?QnZHT0lCb3o5NFlZRGZ6VVNVYSt2c3NpQ3BhMVJ6NlZRQ05JRGZtS0g3Wjdh?=
 =?utf-8?B?Qk1DbWFEdDM4K0NWUjhIMFp0WTRMaEtHMFk5NTdyQ1hyM1VHVG9URXpHRkFV?=
 =?utf-8?B?ODY4enkvWm52ZERmczlWRFphV0FZZmJJNE1BQ25GWjZTd0VObWRiL3FIUGNY?=
 =?utf-8?B?OWJRanc2VFFnUmp5Z3R0SDNxZVgxaXVTZGRnM1VtTG0ycnI1VW95R0VoRk5Y?=
 =?utf-8?B?eGkxRmMvMk5MdS9rZkZCelZIZTNZRVhaaDNNR09jQW94TlpZK0xsbGdmRC9a?=
 =?utf-8?B?TmRCRDdQcnBvVFFwRXNKajVxZ3F6c2hudzE0RXFoL1k2Q2owOWhiNkt0bW5a?=
 =?utf-8?B?c09Ccko1MWo3ZFhCZ29GUlQzRVFPZWMrVGxVVFp4ZHhlK1JCWkJHMHgxampB?=
 =?utf-8?B?NExHK1dBc0kvcmpYL0pGUkJ1QU5INHBMWE9OMEFoMmR5MnlpMFI5ZDd3bHUz?=
 =?utf-8?B?UGJyajNGK1RkdHEycTh2MEFFQW9DekFQU2pGS3FWeVJTUXZWYlVKaGZJbVU4?=
 =?utf-8?B?eHBWd1ZZTWwxeWV4OWJKaC9ES25lTTMzNFY0K2lJWUt2WTZ6MzBDbDlENnVF?=
 =?utf-8?B?akNqZXJ4MXlKRUpuTjJaNTdtcFh6cEFOMnVVVmhiT1V5bGZsVjQ0RjNadFo1?=
 =?utf-8?B?enJGa3U1WkU1KzREVFpIc0I4dTM1VE1QZlp5ZEtvTklXNFFCNTkzOC9oL1Zj?=
 =?utf-8?B?ZjNvYXJiRFZaMnpzcDNMdldSTnlRUkEvTDZPamJDRE9qMzd2ZHM1VTFIQmFS?=
 =?utf-8?B?NUdVblMzNkRzbGJhTHozQ2R1S3E1QUVuQUJQQllyL2hodk5yQm43ekxSdDgw?=
 =?utf-8?B?cDN4ZXJsS2lOY29PajAwNFNqSXEwZXkyTmlkQUVLQlhzT3NiemtDY2sxQlUz?=
 =?utf-8?B?NjBBbjdQbFJRQUpKbzZWWTI3NzMwZDRaMk9TYjhkQ0kvVVFWbVFjdytjY2ZT?=
 =?utf-8?B?OGxwWmZWYmppS0lQRVpFcXI5K1laaVA3Mm02QytFRUk2V2k5bHNiMVQzdUFK?=
 =?utf-8?B?TXpza0tnbkN3VmVGbWdPZXFqRTR1ZjdrU2JYZkphMUxvWUNpaDZQbEhBdGNi?=
 =?utf-8?B?a3NDYmRRditHMjZhVnVLUHVuRDErazJrTmhPRkljcXQxOE5zQ1I4K0l2bmY2?=
 =?utf-8?B?cjJtWGU1M01SMW1lZ1poZkd4Zk1lS1FZTGthNnhLSDQxbTA2Nk9IYnVYaUpr?=
 =?utf-8?B?Q2ZFUDljU29hUEpwRTRLT2haVzNJdkR1MkNiNEM4bTl2VHJLTERMYTJmN09Y?=
 =?utf-8?B?NFplTVZMQ054Y0lTcTBPaWFQMit4U2NtL0FRdzMrN3BmZDhETmd5MVdwNSty?=
 =?utf-8?B?bmplZURJdHpOcXRlZzQwdUFLK29ocUxkeFdBdGNFTlJYSXlXa2ZDT0JvZktD?=
 =?utf-8?B?YzMrQytIaU8xajhXUlFGaEpzekVUdkZRQm9kU0VyVURBalVWblNsaU9YZzkw?=
 =?utf-8?Q?7HTR+sWY/+2W2XVRvxNW6hlBZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 376484bb-e541-408a-451b-08da5a3e62ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 02:15:22.0183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dEQ7zk5SP9eLQg6U8STb4fZ33TTmUi0rFd2qPIc7bjaqmk3hBs7aObsQ8D7EXKyvoT7mmYhly61/ZlT3Jr7H0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2941
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW5lIE1hbGFsYW5lIDxKYW5lLk1hbGFsYW5lQGNpdHJpeC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgSnVuZSAyOSwgMjAyMiAxMToxNyBQTQ0KPiANCj4gT24gMjkvMDYvMjAyMiAx
NToyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gT24gMjkuMDYuMjAyMiAxNTo1NSwgSmFuZSBN
YWxhbGFuZSB3cm90ZToNCj4gPj4gQWRkIFhFTl9TWVNDVExfUEhZU0NBUF9YODZfQVNTSVNURURf
WEFQSUMgYW5kDQo+ID4+IFhFTl9TWVNDVExfUEhZU0NBUF9YODZfQVNTSVNURURfWDJBUElDIHRv
IHJlcG9ydCBhY2NlbGVyYXRlZCB4QVBJQw0KPiBhbmQNCj4gPj4geDJBUElDLCBvbiB4ODYgaGFy
ZHdhcmUuIFRoaXMgaXMgc28gdGhhdCB4QVBJQyBhbmQgeDJBUElDIHZpcnR1YWxpemF0aW9uDQo+
ID4+IGNhbiBzdWJzZXF1ZW50bHkgYmUgZW5hYmxlZCBvbiBhIHBlci1kb21haW4gYmFzaXMuDQo+
ID4+IE5vIHN1Y2ggZmVhdHVyZXMgYXJlIGN1cnJlbnRseSBpbXBsZW1lbnRlZCBvbiBBTUQgaGFy
ZHdhcmUuDQo+ID4+DQo+ID4+IEhXIGFzc2lzdGVkIHhBUElDIHZpcnR1YWxpemF0aW9uIHdpbGwg
YmUgcmVwb3J0ZWQgaWYgSFcsIGF0IHRoZQ0KPiA+PiBtaW5pbXVtLCBzdXBwb3J0cyB2aXJ0dWFs
aXplX2FwaWNfYWNjZXNzZXMgYXMgdGhpcyBmZWF0dXJlIGFsb25lIG1lYW5zDQo+ID4+IHRoYXQg
YW4gYWNjZXNzIHRvIHRoZSBBUElDIHBhZ2Ugd2lsbCBjYXVzZSBhbiBBUElDLWFjY2VzcyBWTSBl
eGl0LiBBbg0KPiA+PiBBUElDLWFjY2VzcyBWTSBleGl0IHByb3ZpZGVzIGEgVk1NIHdpdGggaW5m
b3JtYXRpb24gYWJvdXQgdGhlIGFjY2Vzcw0KPiA+PiBjYXVzaW5nIHRoZSBWTSBleGl0LCB1bmxp
a2UgYSByZWd1bGFyIEVQVCBmYXVsdCwgdGh1cyBzaW1wbGlmeWluZyBzb21lDQo+ID4+IGludGVy
bmFsIGhhbmRsaW5nLg0KPiA+Pg0KPiA+PiBIVyBhc3Npc3RlZCB4MkFQSUMgdmlydHVhbGl6YXRp
b24gd2lsbCBiZSByZXBvcnRlZCBpZiBIVyBzdXBwb3J0cw0KPiA+PiB2aXJ0dWFsaXplX3gyYXBp
Y19tb2RlIGFuZCwgYXQgbGVhc3QsIGVpdGhlciBhcGljX3JlZ192aXJ0IG9yDQo+ID4+IHZpcnR1
YWxfaW50cl9kZWxpdmVyeS4gVGhpcyBhbHNvIG1lYW5zIHRoYXQNCj4gPj4gc3lzY3RsIGZvbGxv
d3MgdGhlIGNvbmRpdGlvbmFscyBpbiB2bXhfdmxhcGljX21zcl9jaGFuZ2VkKCkuDQo+ID4+DQo+
ID4+IEZvciB0aGF0IHB1cnBvc2UsIGFsc28gYWRkIGFuIGFyY2gtc3BlY2lmaWMgImNhcGFiaWxp
dGllcyIgcGFyYW1ldGVyDQo+ID4+IHRvIHN0cnVjdCB4ZW5fc3lzY3RsX3BoeXNpbmZvLg0KPiA+
Pg0KPiA+PiBOb3RlIHRoYXQgdGhpcyBpbnRlcmZhY2UgaXMgaW50ZW5kZWQgdG8gYmUgY29tcGF0
aWJsZSB3aXRoIEFNRCBzbyB0aGF0DQo+ID4+IEFWSUMgc3VwcG9ydCBjYW4gYmUgaW50cm9kdWNl
ZCBpbiBhIGZ1dHVyZSBwYXRjaC4gVW5saWtlIEludGVsIHRoYXQNCj4gPj4gaGFzIG11bHRpcGxl
IGNvbnRyb2xzIGZvciBBUElDIFZpcnR1YWxpemF0aW9uLCBBTUQgaGFzIG9uZSBnbG9iYWwNCj4g
Pj4gJ0FWSUMgRW5hYmxlJyBjb250cm9sIGJpdCwgc28gZmluZS1ncmFpbmluZyBvZiBBUElDIHZp
cnR1YWxpemF0aW9uDQo+ID4+IGNvbnRyb2wgY2Fubm90IGJlIGRvbmUgb24gYSBjb21tb24gaW50
ZXJmYWNlLg0KPiA+Pg0KPiA+PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEphbmUgTWFsYWxhbmUgPGph
bmUubWFsYWxhbmVAY2l0cml4LmNvbT4NCj4gPj4gUmV2aWV3ZWQtYnk6ICJSb2dlciBQYXUgTW9u
bsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4gPg0KPiA+IENvdWxkIHlvdSBwbGVhc2UgY2xh
cmlmeSB3aGV0aGVyIHlvdSBkaWQgZHJvcCBLZXZpbidzIFItYiAod2hpY2gsIGENCj4gPiBsaXR0
bGUgdW5oZWxwZnVsbHksIGhlIHByb3ZpZGVkIGluIHJlcGx5IHRvIHY5IGEgd2VlayBhZnRlciB5
b3UgaGFkDQo+ID4gcG9zdGVkIHYxMCkgYmVjYXVzZSBvZiAuLi4NCj4gPg0KPiA+PiB2MTA6DQo+
ID4+ICAgKiBNYWtlIGFzc2lzdGVkX3h7Mn1hcGljX2F2YWlsYWJsZSBjb25kaXRpb25hbCB1cG9u
IF92bXhfY3B1X3VwKCkNCj4gPg0KPiA+IC4uLiB0aGlzLCByZXF1aXJpbmcgaGltIHRvIHJlLW9m
ZmVyIHRoZSB0YWc/IFVudGlsIHRvbGQgb3RoZXJ3aXNlIEkNCj4gPiB3aWxsIGFzc3VtZSBzby4N
Cj4gDQo+IEl0IHdhc24ndCBpbnRlbnRpb25hbCBidXQgeWVzLCB0aGF0IGlzIHJpZ2h0LiBUaGVy
ZSB3YXMgYSBjaGFuZ2UsIGFsYmVpdA0KPiBtaW5vciwgaW4gdm14IGZyb20gdjkgdG8gdjEwIHNv
IEkgZG8gcmVxdWlyZSBLZXZpbiBUaWFuIG9yIEp1biBOYWthamltYQ0KPiB0byByZXZpZXcgaXQu
DQo+IA0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=

