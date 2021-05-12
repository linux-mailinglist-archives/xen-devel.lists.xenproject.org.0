Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E7A37BA17
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 12:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126201.237542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lglpE-0000vq-66; Wed, 12 May 2021 10:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126201.237542; Wed, 12 May 2021 10:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lglpE-0000ty-2i; Wed, 12 May 2021 10:10:44 +0000
Received: by outflank-mailman (input) for mailman id 126201;
 Wed, 12 May 2021 10:10:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIkv=KH=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lglpB-0000ts-RR
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 10:10:42 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae80655b-2853-4542-925c-33bfeeabe3fa;
 Wed, 12 May 2021 10:10:40 +0000 (UTC)
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
X-Inumbo-ID: ae80655b-2853-4542-925c-33bfeeabe3fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620814240;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=49NqqAUb/f9b6xqL4ZGzsx4JsxgsR90+zv1EeNS7iPY=;
  b=BGJ9gSNwPKZYwnL7NxSr0CTl+z7GXnLg+6HjT5uqtkw8vLUkHjLeEX6d
   Jo4BKVsxW//hdVaMSAPFFSZ6SljVRCs3ZaO8TUk/AYWoRzNMbStJIG3sC
   08XwEvdZZ6ZXe74A7w1YXOiwBjaIqUNhN59aDEq5Lm+jSs47KjXGzIhIj
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Olt9xyHhBEzydiYP+HW1aDS1aNiVqnilQRkVblpWh3dgudQY4lSKsZcrsppoPSkbB+zgdJdun1
 DnEMM4QvxBLznD/HnepiaBF8dEsLxWmIbz/fU8NFebRVVA3acMqfyoymJ/+w3hPU1XyfNYtxtQ
 +YOobRbOx2iTpcBh9P60/uwi3byR8JWH+b8na7PZhjJQ9a5xXgGGB1H5XYeDT4LeiJkl0EvYrZ
 ujDlsHhLEodELYnVCdeO//HjVvHCiOHhozCtb9mr5sNyOzZ14HY3MZM9uMv9MUidDCmvWptjLU
 7lg=
X-SBRS: 5.1
X-MesageID: 43726071
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VtM9D6yYanLDy87x7+gHKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.82,293,1613451600"; 
   d="scan'208";a="43726071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHThLjmNj+xxCTjWhtrtIO7bKKS+QQkfnv4lACqjyIa3632imPkyhEKDSnBEVpl34ACdU3ohqXrIoc2p0t800UFTSdM1ZcfGuhFEUuIDMC1dngq+K6TUMxceODJBsw5Du/VtB1gMwm2RtYQtaVp9x6RFs6r+SbOScpUG2qVX3yY3Yypuz50SL0luMQvAMfEGbXW3wF8q+bTeFRfw0HOhSKVorn7zxZH5wLgLhZSbk+xF1QDj2LMJscGhyfetncuUZa2A4R9R3dXNa2Sl8zskNhLOE/kVQS0vsNYFEFx6PxguBlsHRMzXixnxPx2MgfhaOwl63uPkZfFERgCRlCOXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49NqqAUb/f9b6xqL4ZGzsx4JsxgsR90+zv1EeNS7iPY=;
 b=TZvbzof4XqULQvsJQ/APICaHRVQ+9Wl0P+79ZHWaysCb+FaroPpDN7buYltL/Acyz7oj7W4MCSiSgo/B/LPDEjUhLzw4wKFt1bmtigE6sNjj3IZ2Fqbh91eMUnY7wWOeVq7Xpr29zMnwwlm+DXbQDKXP+6SjSgXhhysUTOC0MJC5vKiKbP0OmGnD1mZKejb7l501DjN3UGEc1o7+v0PWTjuyfmMtjOwvTGbsXpgnArVX++G3wwns0aiXv7IiDI1oPxfSzfMKgaKJ54Ma8+l5GWeljpc4hJMiXdSBkNYVSodg3L4f11n8zOhPLmRQfFNwVrzgaTiH2YMXx9J1GxVt+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49NqqAUb/f9b6xqL4ZGzsx4JsxgsR90+zv1EeNS7iPY=;
 b=Ei6+nHp61u6fJO7356NTkbGu6PEHIa3lVfxOqOBQ1H5hjhcPPIjVg+Koh4zzPUxSosgB2fC6HRxLe68U+9GocJA4YrLkaMJDb1mk1iNvGkdz3uWVlDaz9HdyIp27esL6E89iSU1XNXDhEzFCbW6WFRQY0dCyOoQcqN06oN1JBF4=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>, "wl@xen.org"
	<wl@xen.org>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "dave@recoil.org"
	<dave@recoil.org>, George Dunlap <George.Dunlap@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>
Subject: Re: [PATCH v2 00/17] live update and gnttab patches
Thread-Topic: [PATCH v2 00/17] live update and gnttab patches
Thread-Index: AQHXRpBYbSP9+kXyy06RGaCma1VeS6retOQAgADsBAA=
Date: Wed, 12 May 2021 10:10:23 +0000
Message-ID: <7c1a9a8b317fcbc778acaa218ee96e01d15b98d5.camel@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
	 <c744d834-659a-e361-df97-128032402950@citrix.com>
In-Reply-To: <c744d834-659a-e361-df97-128032402950@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.4-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 903b8e73-3c64-4d99-87c5-08d9152e27fa
x-ms-traffictypediagnostic: BY5PR03MB5013:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR03MB50136802AE119AF812CE98EB9B529@BY5PR03MB5013.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sDJFT4N22HAMx50WoDP/kw4Ra0E/0te9iWcSJYFA0vH+2I+QJYvTNiEd+cHpZ0A5IjdxNtdabkzHOoYlYT7A/B46W6n7P2uRpX0X8DSypi321vzogWnfOnEz5LXhOEsWJqK1Bg0iWDS01guT3nuwx6twnInJjLGXrPFO6ldl4JXbpgIX8CYQLVd2kHe77T6LVDiDbPvTpJNXm3AbFRbGTn/O/pO3sdgycIJf4vlNo8rJjYN/CC4O4RmDOWWSzN3HBDtli+t+qoFYxY6CyTeD0F4SGpKb+KHfXLLwEnT+7md1cNsg+TNwppC/siWk1P8pQCgtUmMHgu25SQ9koVuh+shMjKGbfFF87yN5DBuq4Ara+pvdUfRw88RTsb3/FjC9R1QKF+cq6nYuYlftngEjAYBJBRO5Cq8KwWHdS5958MwaDA7fOIUNhJfhct3zZcdudQRf1nB6RuJ8RaIVO8RpVBdB2MMHyoAcGUrZbqx3ACPzi6Q8u10gsYl82GENNAZkh2n61zxQbwafJOcE7GfgWeAFOVWFfqK+UqxqsiSQ9X0btpLkXqeSyHvpWiQjWTU8aM6NGxT0CTcAMV6U8911G4JmraC6mGEbfsPc5rnOaXmF5EHIu1Oj5pk2GTGOEsS0w2J+emnvnLZKd/g+rUfc9xJpT/B4ckyefvi6JDpmW7Fye7gGQ/mK3ARXdoLhlI9x
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(8936002)(8676002)(6506007)(53546011)(83380400001)(86362001)(2906002)(66574015)(71200400001)(15650500001)(26005)(122000001)(186003)(66946007)(66446008)(2616005)(478600001)(38100700002)(6512007)(66476007)(36756003)(5660300002)(66556008)(91956017)(76116006)(110136005)(6486002)(316002)(54906003)(107886003)(966005)(64756008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VlpMbW5FdzRwZkRXcUlxYWpySlgvaU5rYUNKcHN3Ni9OUm1QaUJTUkhDbDVF?=
 =?utf-8?B?V2pYYmxqQkhFR1BJS251YTVpQlBPSUMxVFJ3K0g0eDNuU09jQXlncGVMakRp?=
 =?utf-8?B?YWkwNWQrcFZENmxUVXlKT3ZMV2QvM0xXQzNnR0JjYW81dTBMREF2djFXTFVO?=
 =?utf-8?B?bmZvNXQ2U1NBbmljZXJJNWJ4WWVjYzQxaHhWc0xiZk40di9IRWlqM0tVWmFM?=
 =?utf-8?B?djdqdTA1c1dYN0NxZWtmaHgxU1IyeU94R2V3cXQweFpzNkorVWRoTjEwREd0?=
 =?utf-8?B?YUMzVEpFM0IxbGR1SDRBa0VNQ2xkRTF4d2JJbkNXUHVaOVBpM2dpK0k3ME93?=
 =?utf-8?B?Mjdsd1lxamFVM2lFdHQrQ3NEQUFldFNlUzE2cWdyV1orWEZzaWlDc1BLbVVo?=
 =?utf-8?B?Zkd6eG5UbGdsczZQS0I1bzg1V3NwWjBSN3c2NytCMkM0TWpDNU5DRmdvQzlj?=
 =?utf-8?B?cW5oTmRQbkRtRzJGY1Z0MzQ1MmFHLzVwaXJHT0VTcTZ5ektodml3NytqV3Bs?=
 =?utf-8?B?WkZBNkRsZkc3d3J1RGg0eUxVNVdzcU1DQUF6NThuV0ZEY3BSNTlQMXU0K0xx?=
 =?utf-8?B?clhML0FxYVNncDlnUjJZd00rUjVUTXdTdThYeUIvVlEzVzBHRE9zWnZxZXcy?=
 =?utf-8?B?NnR5elBBR01SUWlieU93dit0eWNiS0drem9LSG9ORWZZSDU1RHd5UHpDd1B1?=
 =?utf-8?B?VUlUZDA5eWZMWS9EUXM0SW9kNHhqek1ibGZxdFJQNU1TSmMxbnJUT0l5WXV5?=
 =?utf-8?B?NFYvRDRnUlZHNlNtVXBmYThNR3V1Y1I5ZVdMTGR6UnlUZ3A4Z2V1Q25FZWVi?=
 =?utf-8?B?c3U2RmhDbGs1UTFsVlN5UDVDdjhIUkhBSkVoK2hnd094OThBMDJidUl5U0dK?=
 =?utf-8?B?Z0hQUkhYMWtSa1BsUCtCNWx2YXVjeG10YnBiVWNBK1IzOGJ1QkZRVVNsK01K?=
 =?utf-8?B?aTFmQWJ1MTR6NDN1L1h2QmVQb1BZL2l3T2RkbWVtcU41d2poTVRNTkNUZ1Rn?=
 =?utf-8?B?eDU5UHJOTTd5czVtc2wrWG9sbWVyZkM4MlRXNWF3RytVK2o0RVJoMlFpUE9v?=
 =?utf-8?B?cUtDc2poWDRXSjFxS2NmWlo0bTZLQVBEenlucWhyQm4rWUczUEhrMEhqdmxz?=
 =?utf-8?B?U2VQNzBza2x6RS9oczJZa0NSZGRlS0N2dTQxaXU3N2k5d0t0N2Fic2NKSHRL?=
 =?utf-8?B?UlF1dVZJam1tRkt0c3J1bmJnbEZBQVZSa3JHVDVQOEI2Y0p3L1NqM09RRUw4?=
 =?utf-8?B?ZHE2TllrRGFXa2d1c29PK0R0UkJJL1QyazlJd0praDFWVTJjK0lDUzZJNDlK?=
 =?utf-8?B?RHgzL1JValI5a24zTEZrZzdhT3pTRE1LZ1ZwZHhGSENjQlNmVU9lVlBHTjcz?=
 =?utf-8?B?Z2pNbHRwQk8zK20xSldiOHoyWUZ3cmd3UXJzRTlDbVlKckxBV3VVTXdBWSs3?=
 =?utf-8?B?MUZGaW5WRXgzcjdGYkJVK2RSTUlIZ0UraEJKTkVWbktwQkNTNHV4aUlYNUhr?=
 =?utf-8?B?elRCczRkVXh1UngvUXRUWFU2Z2lTZDN5WGwyMU1KdTd3ME5oMUpKZ2JwK3pn?=
 =?utf-8?B?bkt6NDllV1FCVS9IK2FmL0xNL095T1NiTFlEV0oyY3dOdXYyQlZ4Q1VocVR2?=
 =?utf-8?B?K2l1ZjM0dkxxMm8wZVFNZi9xemVtWG9Weml1U1FsbGJLenExK29NekNHcSta?=
 =?utf-8?B?TWNQQ05GTCtNNy9lY0VmMmhuQ1ZLL1VRaFdySnBUOVkrU1NEdGwvYmoreUJp?=
 =?utf-8?Q?M5MEPoKidGv+Mvah7ex2mIinrCSb8MwYzmX2DKW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CFAABE32F1C91459E0EB6590694864F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903b8e73-3c64-4d99-87c5-08d9152e27fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2021 10:10:23.1481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cVcypFykuW1E2tG997DybKXm06oOtI0VZX3DuR4WNeU0WYRGWMacM39cr+DO0wMzZR1HXBlURoc/C4hEhujXPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5013
X-OriginatorOrg: citrix.com

T24gVHVlLCAyMDIxLTA1LTExIGF0IDIxOjA1ICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAxMS8wNS8yMDIxIDE5OjA1LCBFZHdpbiBUw7Zyw7ZrIHdyb3RlOg0KPiA+IFRoZXNlIHBh
dGNoZXMgaGF2ZSBiZWVuIHBvc3RlZCBwcmV2aW91c2x5Lg0KPiA+IFRoZSBnbnR0YWIgcGF0Y2hl
cyAodG9vbHMvb2NhbWwvbGlicy9tbWFwKSB3ZXJlIG5vdCBhcHBsaWVkIGF0IHRoZQ0KPiA+IHRp
bWUNCj4gPiB0byBhdm9pZCBjb25mbGljdHMgd2l0aCBhbiBpbi1wcm9ncmVzcyBYU0EuDQo+ID4g
VGhlIGJpbmFyeSBmb3JtYXQgbGl2ZS11cGRhdGUgYW5kIGZ1enppbmcgcGF0Y2hlcyB3ZXJlIG5v
dCBhcHBsaWVkDQo+ID4gYmVjYXVzZSBpdCB3YXMgdG9vIGNsb3NlIHRvIHRoZSBuZXh0IFhlbiBy
ZWxlYXNlIGZyZWV6ZS4NCj4gPiANCj4gPiBUaGUgcGF0Y2hlcyBkZXBlbmQgb24gZWFjaC1vdGhl
cjogbGl2ZS11cGRhdGUgb25seSB3b3JrcyBjb3JyZWN0bHkNCj4gPiB3aGVuIHRoZSBnbnR0YWIN
Cj4gPiBwYXRjaGVzIGFyZSB0YWtlbiB0b28gKE1GTiBpcyBub3QgcGFydCBvZiB0aGUgYmluYXJ5
IGxpdmUtdXBkYXRlDQo+ID4gc3RyZWFtKSwNCj4gPiBzbyB0aGV5IGFyZSBpbmNsdWRlZCBoZXJl
IGFzIGEgc2luZ2xlIHNlcmllcy4NCj4gPiBUaGUgZ250dGFiIHBhdGNoZXMgcmVwbGFjZXMgb25l
IHVzZSBvZiBsaWJ4ZW5jdHJsIHdpdGggc3RhYmxlDQo+ID4gaW50ZXJmYWNlcywgbGVhdmluZyBv
bmUgdW5zdGFibGUNCj4gPiBsaWJ4ZW5jdHJsIGludGVyZmFjZSB1c2VkIGJ5IG94ZW5zdG9yZWQu
DQo+ID4gDQo+ID4gVGhlICd2ZW5kb3IgZXh0ZXJuYWwgZGVwZW5kZW5jaWVzJyBtYXkgYmUgb3B0
aW9uYWwsIGl0IGlzIHVzZWZ1bCB0bw0KPiA+IGJlIHBhcnQNCj4gPiBvZiBhIHBhdGNocXVldWUg
aW4gYSBzcGVjZmlsZSBzbyB0aGF0IHlvdSBjYW4gYnVpbGQgZXZlcnl0aGluZw0KPiA+IHdpdGhv
dXQgZXh0ZXJuYWwgZGVwZW5kZW5jaWVzLA0KPiA+IGJ1dCBtaWdodCBhcyB3ZWxsIGNvbW1pdCBp
dCBzbyBldmVyeW9uZSBoYXMgaXQgZWFzaWx5IGF2YWlsYWJsZSBub3QNCj4gPiBqdXN0IFhlblNl
cnZlci4NCj4gPiANCj4gPiBOb3RlIHRoYXQgdGhlIGxpdmUtdXBkYXRlIGZ1enogdGVzdCBkb2Vz
bid0IHlldCBwYXNzLCBpdCBpcyBzdGlsbA0KPiA+IGFibGUgdG8gZmluZCBidWdzLg0KPiA+IEhv
d2V2ZXIgdGhlIHJlZHVjZWQgdmVyc2lvbiB3aXRoIGEgZml4ZWQgc2VlZCB1c2VkIGFzIGEgdW5p
dCB0ZXN0DQo+ID4gZG9lcyBwYXNzLA0KPiA+IHNvIGl0IGlzIHVzZWZ1bCB0byBoYXZlIGl0IGNv
bW1pdHRlZCwgYW5kIGZ1cnRoZXIgaW1wcm92ZW1lbnRzIGNhbg0KPiA+IGJlIG1hZGUgbGF0ZXIN
Cj4gPiBhcyBtb3JlIGJ1Z3MgYXJlIGRpc2NvdmVyZWQgYW5kIGZpeGVkLg0KPiA+IA0KPiA+IEVk
d2luIFTDtnLDtmsgKDE3KToNCj4gPiAgIGRvY3MvZGVzaWducy94ZW5zdG9yZS1taWdyYXRpb24u
bWQ6IGNsYXJpZnkgdGhhdCBkZWxldGVzIGFyZQ0KPiA+IHJlY3Vyc2l2ZQ0KPiA+ICAgdG9vbHMv
b2NhbWw6IGFkZCB1bml0IHRlc3Qgc2tlbGV0b24gd2l0aCBEdW5lIGJ1aWxkIHN5c3RlbQ0KPiA+
ICAgdG9vbHMvb2NhbWw6IHZlbmRvciBleHRlcm5hbCBkZXBlbmRlbmNpZXMgZm9yIGNvbnZlbmll
bmNlDQo+ID4gICB0b29scy9vY2FtbC94ZW5zdG9yZWQ6IGltcGxlbWVudCB0aGUgbGl2ZSBtaWdy
YXRpb24gYmluYXJ5IGZvcm1hdA0KPiA+ICAgdG9vbHMvb2NhbWwveGVuc3RvcmVkOiBhZGQgYmlu
YXJ5IGR1bXAgZm9ybWF0IHN1cHBvcnQNCj4gPiAgIHRvb2xzL29jYW1sL3hlbnN0b3JlZDogYWRk
IHN1cHBvcnQgZm9yIGJpbmFyeSBmb3JtYXQNCj4gPiAgIHRvb2xzL29jYW1sL3hlbnN0b3JlZDog
dmFsaWRhdGUgY29uZmlnIGZpbGUgYmVmb3JlIGxpdmUgdXBkYXRlDQo+ID4gICBBZGQgc3RydWN0
dXJlZCBmdXp6aW5nIHVuaXQgdGVzdA0KPiA+ICAgdG9vbHMvb2NhbWw6IHVzZSBjb21tb24gbWFj
cm9zIGZvciBtYW5pcHVsYXRpbmcgbW1hcF9pbnRlcmZhY2UNCj4gPiAgIHRvb2xzL29jYW1sL2xp
YnMvbW1hcDogYWxsb2NhdGUgY29ycmVjdCBudW1iZXIgb2YgYnl0ZXMNCj4gPiAgIHRvb2xzL29j
YW1sL2xpYnMvbW1hcDogRXhwb3NlIHN0dWJfbW1hcF9hbGxvYw0KPiA+ICAgdG9vbHMvb2NhbWwv
bGlicy9tbWFwOiBtYXJrIG1tYXAvbXVubWFwIGFzIGJsb2NraW5nDQo+ID4gICB0b29scy9vY2Ft
bC9saWJzL3hiOiBpbXBvcnQgZ250dGFiIHN0dWJzIGZyb20gbWlyYWdlDQo+ID4gICB0b29scy9v
Y2FtbDogc2FmZXIgWGVubW1hcCBpbnRlcmZhY2UNCj4gPiAgIHRvb2xzL29jYW1sL3hlbnN0b3Jl
ZDogdXNlIGdudHRhYiBpbnN0ZWFkIG9mIHhlbmN0cmwncw0KPiA+ICAgICBmb3JlaWduX21hcF9y
YW5nZQ0KPiA+ICAgdG9vbHMvb2NhbWwveGVuc3RvcmVkOiBkb24ndCBzdG9yZSBkb21VJ3MgbWZu
IG9mIHJpbmcgcGFnZQ0KPiA+ICAgdG9vbHMvb2NhbWwvbGlicy9tbWFwOiBDbGVhbiB1cCB1bnVz
ZWQgcmVhZC93cml0ZQ0KPiANCj4gR2l0bGFiIENJIHJlcG9ydHMgZmFpbHVyZXMgYWNyb3NzIHRo
ZSBib2FyZCBpbiBEZWJpYW4gU3RyZXRjaCAzMi1iaXQNCj4gYnVpbGRzLiAgQWxsIGxvZ3MNCj4g
aHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3BhdGNoZXcveGVuLy0vcGlwZWxpbmVzLzMw
MTE0NjExMiBidXQNCj4gdGhlDQo+IHRsO2RyIHNlZW1zIHRvIGJlOg0KPiANCj4gRmlsZSAiZGlz
ay5tbCIsIGxpbmUgMTc5LCBjaGFyYWN0ZXJzIDI2LTM3Og0KPiBFcnJvcjogSW50ZWdlciBsaXRl
cmFsIGV4Y2VlZHMgdGhlIHJhbmdlIG9mIHJlcHJlc2VudGFibGUgaW50ZWdlcnMgb2YNCj4gdHlw
ZSBpbnQNCg0KVGhhbmtzLCB0aGlzIHNob3VsZCBmaXggaXQsIEkgcmVmcmVzaGVkIG15IGdpdCB0
cmVlICh0aGVyZSBpcyBhbHNvIGENCmZpeCB0aGVyZSBmb3IgdGhlIG9sZGVyIHZlcnNpb24gb2Yg
TWFrZSk6DQpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGF0Y2hldy94ZW4vLS9waXBl
bGluZXMvMzAxMTQ2MTEyDQoNCk5vdCBzdXJlIHdoZXRoZXIgaXQgaXMgd29ydGggY29udGludWlu
ZyB0byBzdXBwb3J0IDMyLWJpdCBpNjg2IGJ1aWxkcywNCmFueSBtb2Rlcm4gSW50ZWwvQU1EIENQ
VSB3b3VsZCBiZSA2NC1iaXQgY2FwYWJsZSwgYnV0IHBlcmhhcHMgMzItYml0IGlzDQpzdGlsbCBw
b3B1bGFyIGluIHRoZSBBUk0gd29ybGQgYW5kIGtlZXBpbmcgMzItYml0IEludGVsIHN1cHBvcnRl
ZCBpcw0KdGhlIGVhc2llc3Qgd2F5IHRvIGJ1aWxkLXRlc3QgaXQ/DQoNCmRpZmYgLS1naXQgYS90
b29scy9vY2FtbC94ZW5zdG9yZWQvZGlzay5tbA0KYi90b29scy9vY2FtbC94ZW5zdG9yZWQvZGlz
ay5tbA0KaW5kZXggNTk3OTQzMjRlMS4uYjc2NzhhZjg3ZiAxMDA2NDQNCi0tLSBhL3Rvb2xzL29j
YW1sL3hlbnN0b3JlZC9kaXNrLm1sDQorKysgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvZGlzay5t
bA0KQEAgLTE3Niw3ICsxNzYsNyBAQCBsZXQgd3JpdGUgc3RvcmUgPQ0KICAgICAgICAgICAgb3V0
cHV0X2J5dGUgY2ggaQ0KIA0KICAgICAgICBsZXQgdzMyIGNoIHYgPQ0KLSAgICAgICAgICAgYXNz
ZXJ0ICh2ID49IDAgJiYgdiA8PSAweEZGRkZfRkZGRik7DQorICAgICAgICAgICBhc3NlcnQgKHYg
Pj0gMCAmJiBJbnQ2NC5vZl9pbnQgdiA8PSAweEZGRkZfRkZGRkwpOw0KICAgICAgICAgICAgb3V0
cHV0X2JpbmFyeV9pbnQgY2ggdg0KIA0KICAgICAgICBsZXQgcG9zID0gcG9zX291dA0KQEAgLTIx
Myw3ICsyMTMsNyBAQCBsZXQgd3JpdGUgc3RvcmUgPQ0KIA0KICAgICAgICBsZXQgcjMyIHQgPQ0K
ICAgICAgICAgICAgKCogcmVhZCB1bnNpZ25lZCAzMi1iaXQgaW50ICopDQotICAgICAgICAgICBs
ZXQgciA9IGlucHV0X2JpbmFyeV9pbnQgdCBsYW5kIDB4RkZGRl9GRkZGIGluDQorICAgICAgICAg
ICBsZXQgciA9IEludDY0LmxvZ2FuZCAoSW50NjQub2ZfaW50IChpbnB1dF9iaW5hcnlfaW50IHQp
KQ0KMHhGRkZGX0ZGRkZMIHw+IEludDY0LnRvX2ludCBpbg0KICAgICAgICAgICAgYXNzZXJ0IChy
ID49IDApOw0KICAgICAgICAgICAgcg0KIA0KQEAgLTI5Myw3ICsyOTMsNyBAQCBtb2R1bGUgTGl2
ZVJlY29yZCA9IHN0cnVjdA0KICAgICAgICB3cml0ZV9yZWNvcmQgdCBUeXBlLmdsb2JhbF9kYXRh
IDggQEAgZnVuIGIgLT4NCiAgICAgICAgTy53MzIgYiAoRkQudG9faW50IHJ3X3NvY2spOw0KICAg
ICAgICAgICAgICAgICAoKiBUT0RPOiB0aGlzIG5lZWRzIGEgdW5pdCB0ZXN0L2xpdmUgdXBkYXRl
IHRlc3QgdG9vIQ0KKikNCi0gICAgICAgTy53MzIgYiAweEZGRkZfRkZGRg0KKyAgICAgICBPLncz
MiBiIDB4M0ZGRl9GRkZGDQogDQogICAgbGV0IHJlYWRfZ2xvYmFsX2RhdGEgdCB+bGVuIGYgPQ0K
ICAgICAgICByZWFkX2V4cGVjdCB0ICJnbG9iYWxfZGF0YSIgOCBsZW47DQo+IA0KPiB+QW5kcmV3
DQo=

