Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518DC40D3DC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 09:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188166.337245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQlwG-0002Lv-HF; Thu, 16 Sep 2021 07:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188166.337245; Thu, 16 Sep 2021 07:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQlwG-0002K8-Dt; Thu, 16 Sep 2021 07:36:08 +0000
Received: by outflank-mailman (input) for mailman id 188166;
 Thu, 16 Sep 2021 07:36:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URfn=OG=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mQlwE-0002K1-IH
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 07:36:06 +0000
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfda514a-16c0-11ec-b5af-12813bfff9fa;
 Thu, 16 Sep 2021 07:36:05 +0000 (UTC)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 00:36:04 -0700
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 16 Sep 2021 00:36:04 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 00:36:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 16 Sep 2021 00:36:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 16 Sep 2021 00:36:03 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR1101MB2338.namprd11.prod.outlook.com (2603:10b6:404:9c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 07:36:02 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 07:36:02 +0000
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
X-Inumbo-ID: bfda514a-16c0-11ec-b5af-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="308051006"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="308051006"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="433702686"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJHwkzcNfTgAidpnW5CmJQpxtUIGAzRfjbGg9GTPl2lmzfRvVeYAokJHg5Cy9r77TR+fDlHCypq3siWBfVII8X4lFlSFdGis7tw+QmiZlVTjEZVP6D2CMqMkMsFR/c34VdHpsB3prCCwiYNJZCrELwZleiFAeEAJc+/8ALUn+cJfqp2PRhTVn1XP3agofhBjjpcEVUJjgha1p05IrV325kFX+EHR6vtOxXDyBbR0Ye14l/o0IVa0rM3o8Zwh+N/tJQ5okAC9ngSa7jPf3WRrePb+CmLvbl1fWDxVEnEpQrwGV2F/GDJ3y5u+O4vJ32LlxOoTGObZww8nCaGIFlY4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YAMzS/7IF+dEZEaR1J3XvF85uPgjy1S6Ax1BxFc0brU=;
 b=RAgSDnIcOWHBmWkNAoKQN+ZUck4/Wjxzjau+WFN6cir6VRzhddohMDFGn4Cr0L26ENFHtaZR3oFrXmgI69EsRTQEBfGen6yTmz/R/gOGw68ik8o07xQQk81Dv2dkjKR2kYllzyrxh0/E4eYO/KvN4cOJXm4cGfF/ScizubW2fbSURDRzzoeXxn3VVYRj+8hxtQOrCGwVHBGU5tNbnsHmeoa0WQlV1WlrW+D8kcgqoWBvXsvFBeWRQvXdID5ojhUNier7LPfLqVLNM0J3i1rZAO5xTNj1Q5WJ9CjufUdI/TPcvy6eW7ZXj5765bm4h4lR3W6mpPQXtPvH/293H75QLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAMzS/7IF+dEZEaR1J3XvF85uPgjy1S6Ax1BxFc0brU=;
 b=vFyHZIsR3PFdl9Rnax6mDPaxITyXuGXoviLc9/9tFz4RwBAiKqyTVbV/AREtoxdS0k6I0DrGH6GKR90AHBbN2ZqlTcgbEj9zPKmi6RpEBYL7eGu0Eb621r6fIR9zSy8I6S6W11gux+6ImahClTZH79sm1x0P1srUc88RXfC/T2U=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH 16/17] VT-d: show permissions during page table walks
Thread-Topic: [PATCH 16/17] VT-d: show permissions during page table walks
Thread-Index: AQHXmPQslV7KSBUtgUWpDvTxqV2qqqumaQDw
Date: Thu, 16 Sep 2021 07:36:02 +0000
Message-ID: <BN9PR11MB54333C720A1FAB6B1F3C07E88CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <d4619379-3557-05ac-236a-06a169479a4e@suse.com>
In-Reply-To: <d4619379-3557-05ac-236a-06a169479a4e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 934a5ca5-b9d9-4f09-91b7-08d978e4a265
x-ms-traffictypediagnostic: BN6PR1101MB2338:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR1101MB233813AF4905F23A1C9F47898CDC9@BN6PR1101MB2338.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0TYwVLEieFoFGJPjsQbLg0UJSowm/7xRmckhpJsgB4N34p7pZcKTcLoVvhQClubsjOUDAAN7HRXcdGHodRXjmKnJ1+BpsQFTsi5iPlkjGWPqAnmcVooozZTGtJ3jkzDyuYqZaxs5xznrmWvTgEPyQVtrDBRXrzZtdRwSJgOwCGZiPB9FQzVQ3BSbxIbTz42EPCms1bwMAucpJXjTzSLWyg2Vs4ue7AfUR4xWsDLcozdJc5kUyzlORzeJN5vTvmu6RI2OxSu5OG57/0WVSjwWWtPadwPn26iiepaL9PgfHFfcfat7V/OCQ3E3ndW/+bMpcwgLBYzz2GPStT6jpKk9dwlTcbARYWeKO0nfBc5vwgybDZbl1ZafyWLv87BHm2cW5wngmRb2R9K0AFwJxgytQLJ9P2AREgjZ3r2ObNWL2PUMKXtJEyo+pQ1wW2pwpC8M4XZ4mvyuBY4YDmb6JDDQ+c1ofp9aqvBoTmDRKG4lOBo59DfW0FaYE6zK2mQjrzMU2KnUMsYDUbP+CTFWL5FPYan59bzD2OJZYr2Rz57ERIYP3r9dwFbIdj142SOmbwV1Q7CGwegXClsw+YN5GU6ZxvDtLqNwNVb6EaD5UNLaJFSa3j4EhDUfGom4h3Ls853VgGrv3gRxRmnQb4XFmNrAFCNQtXPB45xOhFNEEDVXhIU9s1XbNHTtOeiLwCVIyhmNlImW4sRTFTSPPlSDHT2bGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(64756008)(7696005)(66556008)(66946007)(122000001)(71200400001)(478600001)(66476007)(52536014)(6506007)(8676002)(76116006)(110136005)(9686003)(38070700005)(5660300002)(38100700002)(66446008)(86362001)(4326008)(26005)(186003)(55016002)(33656002)(8936002)(316002)(2906002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXVpUnVIdUlKOTVBNHg1Z1ZUMkNBWGx1cmwzQ1VibGFEYnJBVDdvU25MamV0?=
 =?utf-8?B?eFJ2dVBYbXlRUjVXdWd3bzg2OTJMaWZMUWRoWHd1Q0RjNjJ4eHM4dlNjV2Zo?=
 =?utf-8?B?VUp3ZHBzV3Zaam9JS1FKUU1vZWZYUXpPWVV3UGtQTWhUTTF3a2pGaVRNbnhr?=
 =?utf-8?B?dkpzdTYzVW4yVTl2S1dxS2QyMU5sa0JPeGM0YW5iQ0FhYTllTFZRczB1Y2ZT?=
 =?utf-8?B?d0pTMjArS2dXSHdSa2hVbGlabDNMN0NUbVNQUWdQYlQ5MUhSbE5GTTlaYWpV?=
 =?utf-8?B?TnVoZHdxQ2oweVpUenJSVWJDTE9PT0Znck82MzBPVnRUMDdKSnEva0htNFMz?=
 =?utf-8?B?WDZZNXFVUFAvbElmRklsenVVem5pSk82RzRKQ0xhdVhGUnZEdDNPV1NXaUZK?=
 =?utf-8?B?czlQMjlYc0RTamxTWDgwTW5zRkE3NWE1RkQ5SFRHVEpPMGkwZmJNVW1LTXdL?=
 =?utf-8?B?bnlTYmZwTE96eDFIWW1QWkhiYkIxNEE5YjBQMDQvUHhRUnNOWlVlblV2WFpG?=
 =?utf-8?B?cTZ2anhyUXlKK2hqaExBZitQNnhRRXhMcDJsYS9PY1hZbURnUTFhQSs0UW1p?=
 =?utf-8?B?YlRNTHVyR2JwdUhrcU5pQUErWmVhbDJ0NmhqS3R4Z2hVMzdSeXBQWGZObGNB?=
 =?utf-8?B?eGlrczFwUmd0TzZzdEdCT00rQUdUNmJKRS9SellWMloraDBYWm12R05EdzBj?=
 =?utf-8?B?amVnMTdyc3NiYVFzQm54QWtkUXRUd3BqMVkxaVJJUis2cTNQNDdLL21KUkN4?=
 =?utf-8?B?d01jMGxyOFJMNEVkRWhwZ1p2WEVNVEVaQjFiWnUxSGIvUmlhd25IOS9vd1pw?=
 =?utf-8?B?YW5MSUpDWkV3UEl6aUVtVlhYK3FldHZqWlBRQ3BvL01JeHpXd1NOZ0pnbkh6?=
 =?utf-8?B?ZncrQTFESzRTVE9ZN3FvSGZPelVESTJHS3EwSzd3dGVDa2plMFZjcEd5a0Zr?=
 =?utf-8?B?emtTQjREQUVBTHBlNlFJQzQ3NE4vMk1zbjdKQUhZQmZmc1BhbE1qVXFUdzBJ?=
 =?utf-8?B?dGgvVTJHOVhzK2ptYzVuSmJseXhlQmE4aWgweGorcEVxbDNGZDZiRjI5TFVr?=
 =?utf-8?B?WklXUHFpVmtyOU0yT3I5dVNpbU1IT2FnNTZyQ1ZFc2h6bjYzalZET0t4bysx?=
 =?utf-8?B?ZzZIaDJOS1hGUFQ5S0JWRitqeGpYVkV3elJmd0R1UFVkTHFXb1ZRcGV1YUl3?=
 =?utf-8?B?ajljdE5xbmZ2Z2hYNS9HUGwya05VeCtQQ2xYVHRsU0cyNGNsVXNmbUF6SG1J?=
 =?utf-8?B?dEtsMmVoRmR2am1ROGd1dUc3SzVONXBRb0hvYzZyTjdDZ1pYMDhZU2YwcDZj?=
 =?utf-8?B?YTFQQnBDdVZoWXJFcEx6a1NLTkJrbUJCS0xTN2ZyNVRNQlovNDN2cFhDSG9y?=
 =?utf-8?B?eHB6Y1ZKOVd1Q1RZTEF2blliM2pBV0d2T2JEc3NIZC9YWitVT0g1OXkxcnF1?=
 =?utf-8?B?VUwrSTN5ejFjRi9TUEVxR2tBQ29tMmZuSXJPZjFybm5ieUFjUVRhK0tOZFJM?=
 =?utf-8?B?Y1ZWU0FFNVJ0emhLb285WGhOUFg3YlVtZHRSY0dNdjF0aUZ1bjFwcWxhQXFY?=
 =?utf-8?B?dThSL0E4NFVLMGNsYkZqeVJHZ1M2b2lVY0xwbGxWeUNrM3RpUEFGbndYaGZC?=
 =?utf-8?B?UXJYRm8zemdPRkZOODNsUlNaUGRyaHppa0x2M0drUkgvVVBZSXk0aVJrTXM1?=
 =?utf-8?B?bS8yQXR4RklLY29yOUJsVVh6bWt6QzQ0N3pDaWFzSUxRVG51elFZOWsrN09j?=
 =?utf-8?Q?9FpxGKVZa91HeEzYSgN3PCUw2lpML5ViWNKy9gk?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934a5ca5-b9d9-4f09-91b7-08d978e4a265
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 07:36:02.1599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S0g/xCHiLImBs3pRqGnnmKqROWatLXALiQsjzehAYd6w5eV82m+p3mpl5aeOz/VFwJM3bzwdRwFksPircFn5vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2338
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEF1Z3VzdCAyNCwgMjAyMSAxMDoyNyBQTQ0KPiANCj4gQmVzaWRlcyB0aGUgYWRkcmVzc2VzIHRo
aXMgaXMgdGhlIG5leHQgY3J1Y2lhbCBiaXQgb2YgaW5mb3JtYXRpb24gb25lDQo+IG1pZ2h0IGJl
IGFmdGVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoN
Cj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IEBAIC0yODIyLDEwICsyODIy
LDEyIEBAIHN0YXRpYyB2b2lkIHZ0ZF9kdW1wX3BhZ2VfdGFibGVfbGV2ZWwocGENCj4gICAgICAg
ICAgICAgIHZ0ZF9kdW1wX3BhZ2VfdGFibGVfbGV2ZWwoZG1hX3B0ZV9hZGRyKCpwdGUpLCBuZXh0
X2xldmVsLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGRyZXNz
LCBpbmRlbnQgKyAxKTsNCj4gICAgICAgICAgZWxzZQ0KPiAtICAgICAgICAgICAgcHJpbnRrKCIl
KnNkZm46ICUwOGx4IG1mbjogJTA4bHhcbiIsDQo+ICsgICAgICAgICAgICBwcmludGsoIiUqc2Rm
bjogJTA4bHggbWZuOiAlMDhseCAlYyVjXG4iLA0KPiAgICAgICAgICAgICAgICAgICAgIGluZGVu
dCwgIiIsDQo+ICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpKGFkZHJlc3MgPj4g
UEFHRV9TSElGVF80SyksDQo+IC0gICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpKGRt
YV9wdGVfYWRkcigqcHRlKSA+PiBQQUdFX1NISUZUXzRLKSk7DQo+ICsgICAgICAgICAgICAgICAg
ICAgKHVuc2lnbmVkIGxvbmcpKGRtYV9wdGVfYWRkcigqcHRlKSA+PiBQQUdFX1NISUZUXzRLKSwN
Cj4gKyAgICAgICAgICAgICAgICAgICBkbWFfcHRlX3JlYWQoKnB0ZSkgPyAncicgOiAnLScsDQo+
ICsgICAgICAgICAgICAgICAgICAgZG1hX3B0ZV93cml0ZSgqcHRlKSA/ICd3JyA6ICctJyk7DQo+
ICAgICAgfQ0KPiANCj4gICAgICB1bm1hcF92dGRfZG9tYWluX3BhZ2UocHRfdmFkZHIpOw0KPiAt
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvdXRpbHMuYw0KPiArKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvdXRpbHMuYw0KPiBAQCAtMTU5LDE0ICsxNTksMTEgQEAgdm9p
ZCBwcmludF92dGRfZW50cmllcyhzdHJ1Y3QgdnRkX2lvbW11DQo+ICAgICAgICAgIGxfaW5kZXgg
PSBnZXRfbGV2ZWxfaW5kZXgoZ21mbiwgbGV2ZWwpOw0KPiAgICAgICAgICBwdGUudmFsID0gbFts
X2luZGV4XTsNCj4gICAgICAgICAgdW5tYXBfdnRkX2RvbWFpbl9wYWdlKGwpOw0KPiAtICAgICAg
ICBwcmludGsoIiAgICBsJXVbJTAzeF0gPSAlIlBSSXg2NCJcbiIsIGxldmVsLCBsX2luZGV4LCBw
dGUudmFsKTsNCj4gKyAgICAgICAgcHJpbnRrKCIgICAgbCV1WyUwM3hdID0gJSJQUkl4NjQiICVj
JWNcbiIsIGxldmVsLCBsX2luZGV4LCBwdGUudmFsLA0KPiArICAgICAgICAgICAgICAgZG1hX3B0
ZV9yZWFkKHB0ZSkgPyAncicgOiAnLScsDQo+ICsgICAgICAgICAgICAgICBkbWFfcHRlX3dyaXRl
KHB0ZSkgPyAndycgOiAnLScpOw0KPiANCj4gLSAgICAgICAgaWYgKCAhZG1hX3B0ZV9wcmVzZW50
KHB0ZSkgKQ0KPiAtICAgICAgICB7DQo+IC0gICAgICAgICAgICBwcmludGsoIiAgICBsJXVbJTAz
eF0gbm90IHByZXNlbnRcbiIsIGxldmVsLCBsX2luZGV4KTsNCj4gLSAgICAgICAgICAgIGJyZWFr
Ow0KPiAtICAgICAgICB9DQo+IC0gICAgICAgIGlmICggZG1hX3B0ZV9zdXBlcnBhZ2UocHRlKSAp
DQo+ICsgICAgICAgIGlmICggIWRtYV9wdGVfcHJlc2VudChwdGUpIHx8IGRtYV9wdGVfc3VwZXJw
YWdlKHB0ZSkgKQ0KPiAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgICAgIHZhbCA9IGRtYV9w
dGVfYWRkcihwdGUpOw0KPiAgICAgIH0gd2hpbGUgKCAtLWxldmVsICk7DQoNCg==

