Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4743ACC83
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:43:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144655.266229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luElx-0004yA-TE; Fri, 18 Jun 2021 13:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144655.266229; Fri, 18 Jun 2021 13:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luElx-0004vJ-ON; Fri, 18 Jun 2021 13:43:01 +0000
Received: by outflank-mailman (input) for mailman id 144655;
 Fri, 18 Jun 2021 13:43:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=axfQ=LM=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1luElw-0004nd-It
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:43:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d95b56b-7821-474e-ac9b-34fba1eb8c92;
 Fri, 18 Jun 2021 13:42:58 +0000 (UTC)
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
X-Inumbo-ID: 4d95b56b-7821-474e-ac9b-34fba1eb8c92
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624023778;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=govfGUbBDrKO4hTp6bLafsGHvf3JHixr+3zDBDqBrBU=;
  b=ey65oLXli9EFNVRlpghYWjewTYC7TMo01/bld9g0V8SpdbB6diS5S5Ey
   phjt7KYLGje94NYU8CRS8pUbFZrW6Qty2TXQOl29ibEpEo93xn8NtbRYb
   l7ywp7+MsRlb8R7dQnaJ97SN9DouYn67iYc/OIGRH5daStc3bPY/2J3Bh
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rrWpM8aFJu+vYM+CJMbUuEq6gLcdEzeTajbB7gXQ048oG368LK4Wli37xzyyYW9Ur1DxJLg7xD
 pF0+zLMIBfE/y8WjjKK34jOyTOIrjxtgw0KPpaYU0sY79xr7joD2eTty4bQU5D/nRVXTS02dkt
 dquEzdPNOPRmiHrW3euG05toSy6723yG8dV2s+UlHzNQdBub0IoyaFWO2GC/mdqf/w76ECdFUO
 z6eNvPAbmpZuy5PRlwY7fj7+d3EJG7xAaEI+4Gf0AFeizT6T472/K305jziYxkACuEYx23nV8R
 DUE=
X-SBRS: 5.1
X-MesageID: 46460937
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ufgPI6i3nf09o/bp44b6Yl0M1HBQXrkji2hC6mlwRA09TyX4ra
 CTdZEgviMc5wx9ZJhNo7q90cq7IE80i6Qb3WB5B97LYOCMggeVxe9Zg7ff/w==
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46460937"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFo4MsSPIc1U1onEpdxIv4LKjnROBEtXeYOCkACrA9fQQ4U74OzVooXIP0aG6JM7vlojPWTVOOtvgRAWHb1/DyvNHGDS1Reu+olvISwoG3ra2HvqMA4Wg5itEuccVxvZmKvxzTe0A3lIqEnJfO5cPmvIBrMGIRARdat+aE63mcfFGaIsKHHm34rqPa7IWc9347HtaQg/Sjk8OImI2cAcf0sFfjOiVgFGRtAa24xYDHaSpaSS221fT/MdK+uRK57tiebJeebZSw8uqCQJv+xz1Hq2XT9XTp3ToCk2XYazCpEOH/SXVCy4vnenoeAnQbMKCA5yDPPGZSR3dgS2YWvXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=govfGUbBDrKO4hTp6bLafsGHvf3JHixr+3zDBDqBrBU=;
 b=mz122f3vQJeCGXMHAOTY3Eqnj9vjzEq679LhcNVl1Gnf9mcJdgJgtkbFSpnhlD+aHiIwnSc6l7iIxb85WK87VWtCkYkkCiszoIYwlNykqfr8WsrPpB6GEj+cY8N74tL4mRT4QyQDzJFyQedaHxjUY03BF81kKWro8vrWCRxA3gPYANfiIW5b9zwRjBQPF8Wdkkv68LmdwUaWA4tiU8hb4+AyoWJhp9frwr4nLzmRf2pVOvj4tIuR+B5YfI6YxoigL3RLkr8vZTku7UFm1Azn8T0Pl8AFPdjjAYbdYGZVhvnL5Wbu/rSemkLDchwIsSjuEsLGMs9zE9uAkJLrFbjpaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=govfGUbBDrKO4hTp6bLafsGHvf3JHixr+3zDBDqBrBU=;
 b=cqktPiPNg3L6C5dkOTIXpsDF6lfKjrnkDVnemRv3ya6s8cOQqJO2qJP/oudrMmhmGawN/gBS5dOx3JkMtn4BRP1QPnOycn9lFZOdUCp6lq6AZxSYXFfSK7lp3whZr1WB7DpPQqpLc674VvLYFbbbrz6M/vGBChro3MvDV39GTFE=
From: Edwin Torok <edvin.torok@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "David
 Scott" <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] tools/ocaml/libs/xc: add OCaml stubs to query CPU policy
Thread-Topic: [PATCH] tools/ocaml/libs/xc: add OCaml stubs to query CPU policy
Thread-Index: AQHXZC8pdx4Fbe3SD0u2mLoPzHVclasZvgMAgAAJS4A=
Date: Fri, 18 Jun 2021 13:42:54 +0000
Message-ID: <787E5F69-FC38-4B6B-B893-13A5AD417179@citrix.com>
References: <5fdb7b4cdee69af8e2b9d77b56b1027a8799cf04.1624012999.git.edvin.torok@citrix.com>
 <70BA77FE-045D-4F67-A61E-030CFAACC8B1@citrix.com>
In-Reply-To: <70BA77FE-045D-4F67-A61E-030CFAACC8B1@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73b210ea-1859-44a7-9f5c-08d9325ef987
x-ms-traffictypediagnostic: SJ0PR03MB6421:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR03MB64213E8B3BA18DF1172C0B509B0D9@SJ0PR03MB6421.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7ALaMwNE80vIX1PjXEnYsjiz1hXM2v/zIGG9+PW+rv9BefcAMKp7a6Vg8xSbrECe9eY1acZKGL2SEarO8XEERKnDAGMgO5Mbkbdc9ReBBnGK2ZNM+SW0vci8OvWhW6pBjFGSwyJvqgEWukjJckoQMHOgZ9DgCMnuKzliO8WEgovaYErdcnLWvySgbW5DDDSeaZwIxXYHIidGvi4KUzRXp+Efhy8Qeyh8S7ojGeQS9oOcpeedWv+uLbP0WNfBdHFzOyFjK/kskPb2mrpdaivPf2pLN6svJkwasJKNlUnwLis3r0OKqZ8i1dyn60JVsYoO5H9rTUIfO7k5wAG4QXGo/MeWbueOqMCH3onfSGRtM0MpZaGZ3iYdaLEWFHhPB4BDrK1XpnfKdff9BKFkErYYr19S1I5Op5i+kyvDI//isBll9e0vgecb2vtitXtB2uY/svFQLKGuDg281GkZTgAfYs+fRabCCjxkJLeqelKxCLLHa5x7IQBu9bh6cqac2cmR60fqThaIwUbb40TF9oNNMF7vS1t+sd//aUnCN9quwTpc7eYzoQSQP3m4t1xoZSdEYg+HiqIcdzozO5919sfEBryISvUvJbxCRntGPM7dyTSzSdA+LliYFCMPo0cNTiKH0CEWDEaLk6GUqhkRD/h1RQpaW2cPm5QYXamU3bAtp7o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(83380400001)(6486002)(66574015)(8936002)(26005)(4326008)(186003)(91956017)(76116006)(6506007)(37006003)(71200400001)(6512007)(5660300002)(53546011)(107886003)(2906002)(54906003)(8676002)(122000001)(64756008)(6862004)(38100700002)(86362001)(33656002)(66946007)(478600001)(66446008)(6636002)(2616005)(36756003)(66476007)(316002)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2V5U0dUOUdIS2hNTktQOUlnSXo5NlVmbFIxTE9MeTBidGRxMXZLOFM2Nklu?=
 =?utf-8?B?S040QWJYNkNOYVRESVJzbnp0dnJUd0pnL0hTUWRBM2VhWVUvY0dGaWVjM3lI?=
 =?utf-8?B?Tk82cUFSUFpjektXeTFFVkVZdVpZSWd6NWRTM2NpYXphWVRHSzdObUdQVytN?=
 =?utf-8?B?K2dTUkxlbzU3anNkWXFHeXB3a1lwNDFwcVEyTEJRMU1tOHd4S1ZGeExETkJo?=
 =?utf-8?B?c3pTN1ZyVEJHK0JmdDR3ZFc5TUlSK2JGYm1kaEpJK3d2OFJSUlFXZnlNNmN1?=
 =?utf-8?B?YnRRR2xPYyszN1E1WW1NZCtMK3EyL2ZPVnoyRVpwdzBDaE8yMnhURXdRbVZj?=
 =?utf-8?B?Sm1oRDd5cCtneGhybUF5NWRyQ3VRNkl0aDNtbThnOWJ0azFHQzdwRkorQkJm?=
 =?utf-8?B?NzY1Z0pwUDRESzk0cG03Mk5jRmJidUp4bGxpUkFPcks5eFBCTVo4RCtRSHJW?=
 =?utf-8?B?T043ZG1oaGVBaXkvZE9McWM2VmhNanI2andCQWRlcDBiMWZJV0g3Ym40M1F3?=
 =?utf-8?B?dG0rQmRFcit3MUtJdnFIcGZ2cEZUNG9YUi8rMjNlVzIwZ1FPazNuLzhWVVdp?=
 =?utf-8?B?MEx5NHQweW5rZFlQbDVROHFaMUVWUGFZY0pnNkd2cU5OZ00vb1RvTzczN245?=
 =?utf-8?B?dzAyNzhsYUF1a2ZLVFhVMlBXVitaREV5QUliZmcyaUQ2K3o4SGVpMmFkSXV4?=
 =?utf-8?B?azBFeFBjTmxac0JuNGR5WGJkN0VUNUh5QVFJRUJTcjhKd2lyZHUxa1U4bmwv?=
 =?utf-8?B?RFd3L1M5Q2l0QzFJQzBwN1loK1h1MVRURFBVSmpaMm1ta0hQUHJXK01OblUw?=
 =?utf-8?B?aTVYaVlXMVBEUEdhUDkyMFRDK0YwVEVwOEdVT3hLU3g2b0czandKRkFoWUpP?=
 =?utf-8?B?WGhibUhoaDFlTEd3NEQyT0tIa0UvaGhpRCtzU3ZMTUJGdW01eXJmMzJDVVBW?=
 =?utf-8?B?MEtSdFJkejdtdFd4Yk9rRlduZ0F0UGxGMThMbStoWXZlNCtTZXJJd0MzOXNs?=
 =?utf-8?B?TmlFai95bjdGL1g4YWF4TG01bXVDS04vTG9Ja2VZRHRvMmswRUlLL2YxSUtY?=
 =?utf-8?B?eDZhcHNmMm02eDRDSSswRTE5YzJTR3RNM0lwUWMwdjEvOVZmZDNQcTNrdU1i?=
 =?utf-8?B?emVuLzB5WENxbHE5eUZBdTVWa2JwZTRrVUNUSkVqbVBWVmV5Rm5ya1VySlRZ?=
 =?utf-8?B?MjBOejduZXpGYnNrcG5jTmRoNk5wemRrL2p5OGRkbUtBYlBlOTdtakVsaTRk?=
 =?utf-8?B?YXBTcHcyTFlBVFRiM2ZJSjFBM2tFU1RicC8xSFMxNkh3cnBGLzZwM2Z5RlF2?=
 =?utf-8?B?djU5OU4rVmdtckF0cUVJcEhXZ1U0aXd5N0phOHJycjRxUGh4NndjdGIyUVNj?=
 =?utf-8?B?V3hucFVXV1F1QUZmdzFFa3dVZXBQVzBHbTRCUFpTdWRtZi9IMXpxRUl0cDFi?=
 =?utf-8?B?YytIT1BiK1NFSWUwdUFKWW9zTHowa3k4cjUwbDV1ZlkxeCszbUdzcjZsZlpm?=
 =?utf-8?B?Q00vVTNLZGU1aGlDYzFOakdRc050NGhJbnB0NUJvWDlTTTlkbFUvd0NDTHJ3?=
 =?utf-8?B?SGN5ZGdNdG1Xcm9iVEwrOTJ2N3NMdVNDc3Azcm01LzFhbGlTSVhIbzJFVE9y?=
 =?utf-8?B?ZlJXUUlZbTNtM05XSmxHVEpiL1Azelp5aG9nTlh4M2NkUHdLOWIvMkZQalcy?=
 =?utf-8?B?ais1MnVtTWlNSHY0MFlhSUFjdVVROGNreTgrTDN5cyt2clZnTkJGMTNUODlU?=
 =?utf-8?Q?Q4LdCmj1DUxN8Sx0OSoReqbNNTX2zbBw3xpSh6N?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <303581C41ACBBD44B69750D761D6DAA7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b210ea-1859-44a7-9f5c-08d9325ef987
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 13:42:54.3349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kNpV+1MR4juJ06zSx2NaTyUxj9giAv8XTOmUSgPoTKWIXnmmdLRDdew9XAzbrKAAXxAanCxAhxu7e/gWGGPtHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6421
X-OriginatorOrg: citrix.com

DQoNCj4gT24gMTggSnVuIDIwMjEsIGF0IDE0OjA5LCBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3Rp
YW4ubGluZGlnQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gMTggSnVuIDIw
MjEsIGF0IDExOjQ1LCBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPiB3cm90
ZToNCj4+IA0KPj4gSW50cm9kdWNlcyBmb2xsb3dpbmcgZnVuY3Rpb25zIGluIFhlbmN0cmwgYW5k
IGFzc29jaWF0ZWQgdHlwZXM6DQo+PiBnZXRfc3lzdGVtX2NwdV9wb2xpY3kNCj4+IGNwdV9wb2xp
Y3lfdG9fZmVhdHVyZXNldCwNCj4+IHN0cmluZ19vZl94ZW5fY3B1X3BvbGljeV9pbmRleA0KPj4g
DQo+PiBUaGVzZSBhcmUgd3JhcHBlcnMgYXJvdW5kIHRoZSBleGlzdGluZyBDIGZ1bmN0aW9ucyBp
biB4ZW5jdHJsLmgsDQo+PiB0aGF0IHdpbGwgYmUgdXNlZCBieSB4ZW5vcHNkIGluaXRpYWxseS4N
Cj4+IA0KPj4gLVduby1kZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQgaXMgZGlzYWJsZWQgdG8g
YWxsb3cgbWl4aW5nDQo+PiBkZWNsYXJhdGlvbnMgYW5kIGNvZGUgdG8gc2ltcGxpZnkgd3JpdGlu
ZyB0aGUgc3R1YnMNCj4+IGJ5IHVzaW5nIHZhcmlhYmxlIGxlbmd0aCBhcnJheXMgb24gdGhlIHN0
YWNrIGluc3RlYWQgb2YNCj4+IGFsbG9jYXRpbmcvZnJlZWluZyBtZW1vcnkNCj4+ICh3aGljaCB3
b3VsZCByZXF1aXJlIGFkZGl0aW9uYWwgZXJyb3ItaGFuZGxpbmcgbG9naWMpLg0KPj4gDQo+PiBT
aWduZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0KPj4g
LS0tDQo+PiB0b29scy9vY2FtbC9saWJzL3hjL01ha2VmaWxlICAgICAgICB8ICAgMiArLQ0KPj4g
dG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sICAgICAgfCAgMzcgKysrKysrDQo+PiB0b29s
cy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpICAgICB8ICA3MSArKysrKysrKysrDQo+PiB0b29s
cy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyB8IDE5NSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+PiA0IGZpbGVzIGNoYW5nZWQsIDMwNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRp
Z0BjaXRyaXguY29tPg0KPiANCj4+IA0KPj4gK3N0YXRpYyBDQU1McHJpbSB2YWx1ZSBWYWxfbGVh
dmVzKGNvbnN0IHhlbl9jcHVpZF9sZWFmX3QgKmxlYXZlcywgdWludDMyX3QgbnJfbGVhdmVzKQ0K
Pj4gK3sNCj4+ICsgICAgQ0FNTHBhcmFtMCgpOw0KPj4gKyAgICBDQU1MbG9jYWwxKHJlc3VsdCk7
DQo+PiArICAgIHVpbnQzMl90IGk7DQo+PiArDQo+PiArICAgIHJlc3VsdCA9IGNhbWxfYWxsb2Mo
bnJfbGVhdmVzLCAwKTsNCj4+ICsgICAgZm9yIChpPTA7aTxucl9sZWF2ZXM7aSsrKQ0KPj4gKyAg
ICAgICAgU3RvcmVfZmllbGQocmVzdWx0LCBpLCBWYWxfY3B1aWRfbGVhZigmbGVhdmVzW2ldKSk7
DQo+PiArDQo+PiArICAgIENBTUxyZXR1cm4ocmVzdWx0KTsNCj4+ICt9DQo+IA0KPiBJcyAgY2Ft
bF9hbGxvYyhucl9sZWF2ZXMsIDApIHRoZSByaWdodCBhbGxvY2F0aW9uPyBUaGUgMCBpcyB0aGUg
dGFnLiBUaGVyZSBpcyBhbm90aGVyIGluc3RhbmNlIG9mIHRoaXMgYmVsb3cuIFdoYXQgaXMgdGhl
IHR5cGUgb2YgdGhlIHJldHVybmVkIHZhbHVlIGZyb20gYW4gT0NhbWwgcGVyc3BlY3RpdmU/DQoN
Cg0KSXQgaXMgYW4gYXJyYXksIHNvIEkgdGhpbmsgdGFnIDAgaXMuIFJpZ2h0ICh0aGF0IGlzIHdo
YXQgdGhlIGltcGxlbWVudGF0aW9uIG9mIGNhbGxfYWxsb2NfYXJyYXkgZG9lcyB0b28pLiBJIGNv
dWxkIHBlcmhhcHMgdHJ5IHRvIHVzZSBjYW1sX2FsbG9jX2FycmF5IGluc3RlYWQgdG8gbWFrZSB0
aGlzIG1vcmUgb2J2aW91cy4NCg0KDQpCZXN0IHJlZ2FyZHMsDQrigJRFZHdpbg0KDQo+IA0KPiDi
gJQgQw0KDQo=

