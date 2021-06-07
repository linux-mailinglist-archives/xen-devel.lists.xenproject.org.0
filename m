Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A980039DBFE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 14:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137899.255392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqE5W-0004fg-7m; Mon, 07 Jun 2021 12:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137899.255392; Mon, 07 Jun 2021 12:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqE5W-0004d4-4B; Mon, 07 Jun 2021 12:10:38 +0000
Received: by outflank-mailman (input) for mailman id 137899;
 Mon, 07 Jun 2021 12:10:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v64b=LB=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lqE5U-0004cy-QG
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 12:10:36 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b71311f-4588-4690-9b17-b966091e7132;
 Mon, 07 Jun 2021 12:10:35 +0000 (UTC)
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
X-Inumbo-ID: 5b71311f-4588-4690-9b17-b966091e7132
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623067835;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lty+9wvpX5M+uoA0u8g2Kgx9pOB3SNCum4VbbJTJl3E=;
  b=NqTcRVLa3K8Lqyv/VRZmDL8Pk5w3swEI09ntVw2NepUKWe3SNRX4LyOS
   DyTzLbick5eozjnDMn4FxdKA4bDVoOZLSdtpUwHM5lBc8uoHYQ3ajfM5p
   o4+NJGG+s8r9/4DFViK+B6FByc3mMvutpBQZjWvrZ0SzDcwsYyCrod3o1
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Tn4tcp6KGSrHmthdplQFfZ8Jrd64hNGWDx2gM814EtlZ8bM6FH1RXGGWyAZq6zsfUoEL/eiCGZ
 VuojP5O9YSUtJLEmIZG529FESpycmqZ3g7vTe/OZ4Qta61Gm+hlVQwk9DgpUXsNZo6URKkL5MZ
 RqBQzYJhw4NhhLUcy/+gEC/Rv6jJlSN9BRXtCKQ6pAm45z8glgXpibBV7t+bb46/DALVbaN/KL
 CYjtjVvyg70QVi4PRBV0givcviF+tpP/6mN/aFPKzQIhj/rmfYwNMBcb9TjgRxvnb+N96Y4HG6
 h1Y=
X-SBRS: 5.1
X-MesageID: 45889658
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:OuCCI6q0I0ZEopa6o8zrB3gaV5obeYIsimQD101hICG9Ffb1qy
 nOppsmPHrP4wr5N0tPpTntAsi9qBHnhP1ICPgqXYtKNTOO0AHEEGgF1/qG/9SKIVydygcy79
 YHT4FOTPH2EFhmnYLbzWCDYq8dKQC8gcSVbDHlvhBQcT0=
X-IronPort-AV: E=Sophos;i="5.83,255,1616472000"; 
   d="scan'208";a="45889658"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnuRjpSHYO7iVRdfPmwLHtSTHUHAxUEcuWjiHRnEiySSvLE8ZELrnxCgOro1B35MgW3m/VjwcyKKJ7nta76ULsSc6FIIj5SuB8f+iUeDpl8NigtIZZd3LZQSTdm75x9CGUqoxZGJ6Ap/nPU+oaeXql1ljjY1HDdtew2uMY5L3JJf3RBJCH5a+pZIOWw9KTG0Y0Srjv9hA65MvRG7GXmhGIf19gxPyAqyL/2gxAlvOWyurRgIE8997rQVVEbd00chRy5WrofmkxUJJgZox6R0tZWJKszxBC87K/etI81hk0lo/TwprHT6EGR8iaWq3lOaxTbvyx2UxJE2ywnN/Uhr1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lty+9wvpX5M+uoA0u8g2Kgx9pOB3SNCum4VbbJTJl3E=;
 b=ELdNMEdOLBUfDC+cJOpO5kNLGqcfU8/8yaroV7D4no3zDnjEzwod9IUbh1b2TQRcnn6FW4Zs4Nicm4szOFlnbSiezMKShMTBMtDtHeBvDVP7vUUP5FXo0CBBVWrbpkphaHB5PxvdhR18UnW+PC2bAx5n3wqVbTXGFdfSclvwSOU6EI/bgurtcnVg0cMN2KxQuMDxU0iMv5CU1FNfNP3g9SCjHZC0hHWbauTUVL2O9RwJeP4CAa1Bb1tNrorj7NeLQMd8BQer/lQ+mUVNFLfVm+xf/IhoADNFh4eahScERodbUXPfkHo83BI5NyMx7/8+OthoXEjwOuElqsx45AlgaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lty+9wvpX5M+uoA0u8g2Kgx9pOB3SNCum4VbbJTJl3E=;
 b=tBHmzs07oNVufuKt3+SYB5349JBZPl5DTGMBfpbS+7pbat1Eir4edAWlvG4+vPTlE+2VAuep+72I3COrRyquYIjoA37aqh40rtuG73Ag9pnzk7VH3ALjxFNbvQfov1WocfXS1bG7vT9lUc46HwLXjcEKay8+DGbCYrX+Sgds0nc=
From: George Dunlap <George.Dunlap@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	=?utf-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>, "Dion
 Kant" <g.w.kant@hunenet.nl>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] credit2: make sure we pick a runnable unit from the runq
 if there is one
Thread-Topic: [PATCH] credit2: make sure we pick a runnable unit from the runq
 if there is one
Thread-Index: AQHXU9QMSaNdW1us1k+tzXl6c+sgY6sIhIeA
Date: Mon, 7 Jun 2021 12:10:24 +0000
Message-ID: <5D80842F-4479-46CC-A391-28E4EF364C7E@citrix.com>
References: <162221476843.1378.16573083798333423966.stgit@Wayrath>
In-Reply-To: <162221476843.1378.16573083798333423966.stgit@Wayrath>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc322a63-5c66-40c5-ddd0-08d929ad3b30
x-ms-traffictypediagnostic: PH0PR03MB5669:
x-microsoft-antispam-prvs: <PH0PR03MB566975BD8C43CDF9DA01DA5099389@PH0PR03MB5669.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UEuSaiuYSa/MHs2sabIkD056QOcJqd5D2xTQHacxAqIew0WAFw7QKawMYpKKfvFe9S1u7Er2xsAu+Ddu++F8ECZhqBFiWbv7hhi09lMQTrDPwUdh0nI+vjhD39uJvBtdiJdaR+X3whsTKMB5xIAy87vt/oij1+s1fzYY1D4T+nrg3Vw4wuJwqYWKLBkoDgAMk3GKthFhMoiwovWgIF+OszhkJUuZRuzDLKdwAqX0YT+fdSj1huWZxdgp6q4z3YicKbEBTKgDZgWxEjoEjpuh81IYY1uuNO16uaEI9sx65BMXVzLnbFx6jh9vuQj94ZAIeN3LBH4A70+KgAGGQNlJZsm2LBHSkc4WF7jE9e4qSzMJk1v978m4GxI7POIZU5ujy68gKKdLKepHhh9MXKvMJYhvFWc8ELoXjuGpHm3jsDqx5kNGrLCzcWSaYmgvV5P4D/sBs/CrHgQ5uiNbsAOvShjifayWc5PvTezQeXnRQ30HwAClhEH7Dt+27YPY1lIvFSJhCkzoZKJZh3u05fbHv3gfaMvPTSF6BEvtQuHx/Ec7Y9DfBcTtDKCxFDspwXe8hY8hyVsxVBDxnVvq/KAxCealnRtg5JnRRoQ8F1RVHqrIAlvwEXJ/AP+Cmp7tqQLl3oNQYNntI4e0kKs2x6/T65Yr3YStfzbwl/dhZIY9ocE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(6512007)(54906003)(86362001)(2616005)(2906002)(6486002)(36756003)(71200400001)(186003)(6916009)(4326008)(478600001)(66574015)(33656002)(64756008)(66476007)(66446008)(53546011)(76116006)(8936002)(91956017)(66946007)(8676002)(6506007)(26005)(316002)(5660300002)(38100700002)(66556008)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cWtiSEwzbFdLSTJMMWZacWgvVktvMlVwVWZRSlpiLzlMZkFjZUVJVC83NzlI?=
 =?utf-8?B?R2ZhdjltNkZhWEFGRFQxZTZFVmxMQlN0WGxYRHUyREx2Yk9oOGdLVi8xL3hQ?=
 =?utf-8?B?RkpkTXU2ZGVJMkg4bmRENmJWU2RSUGFzTVFSWmdnYjJuQ3d4WDMzMFF4MHFj?=
 =?utf-8?B?aUFkNCtLYUkxdFhnSDNpb3ZiMlpQZ21SSVRtMVN4TG9wTE9iT0MyblMvSk5F?=
 =?utf-8?B?bEZGYTIxZUFkMTZYcWJ5MVhiSEljMHc2a0tTV2FvODk5MzQ5L1RzWktQVUZV?=
 =?utf-8?B?ekNRSWxCanVrMTcrd3MyTTUyazh3RVMrUDFURENCd3d6T1dyWUNVaVh2RWtt?=
 =?utf-8?B?R1VUSHFndGQ2Uk9sT09DY1hUS0xRcmxmL2g4Ry9Rc0l0d0hLNlAvOU1URDJh?=
 =?utf-8?B?Nk9iTG5kelJCd2RZOThwZWdxY0JIQXhUNVk1OWxXeVYvaU9zdU1CN2ZkUVMr?=
 =?utf-8?B?OXdiY2F5RWZGNWxmR2wxV0lTaktUTkliSXlxYU83WkZ2NGcxNkpSOEZTaVlZ?=
 =?utf-8?B?VndKdkhuSXc1bFl5VlJZeldlbDgvbUdQaVRDQ1FJNStoOG5kTjRhYTF6MXM5?=
 =?utf-8?B?RU81NWFxT1hkaCtXdEQzQmdvYVdKcGhTNUZUK2tMYTg1c2dwVWZVdC9ScnRw?=
 =?utf-8?B?OVRUdndNY3VCQlMwS0pCWHdOWkY0d3hET3JBakFhVGVqTW9zamlESGl4UHpM?=
 =?utf-8?B?TFcwZWpwdDI0NkM4SksxT21aZVJPL3ZyNUxJV3owT3RxUDlUaXpHRnpzTkkv?=
 =?utf-8?B?ZktyNE5uWGx0cnVvdm1jU1EyT3ZlcVU3TExPMkRpaGJDYmdPVmhqRjNlcE5z?=
 =?utf-8?B?QW8vTzFTVU5jb2N5blpMZGZNd3p1QXZQRVFBSnZnYTlPeSsvNFJlWE80ZmRx?=
 =?utf-8?B?VTd2MktoQkc5cE4rcndIckFYcHN6SlpBdGIwaFF6dGxkc3RGdE5rRitNVUcv?=
 =?utf-8?B?OHduV0dURmpOVWlRR3phL0NuZG43NlZHUWd2MFFuOXdGNG5XS0dUU1FFOVJt?=
 =?utf-8?B?K0RYOGk1UkxzZXVZbmhTWGx3M3o2MzZQR3lmTWhYTnpORlNWLzBIOUp4aHFh?=
 =?utf-8?B?SmFjMGNXNS9mTC9EQkVqUWk2MUZJYjNxcWlhSnMxenR6S3hSNmxQRU5oblNu?=
 =?utf-8?B?SVJxQldmN0VqTkNIL3RnN1hXamw5QUcvRzhGeFVkN2VxTDZXVlMyb2hIaFhp?=
 =?utf-8?B?enFCUnYrNWVEQ0N6TFlXTWcrbGJITXNzM2VHQ3dFMDU2RXJkSndFZnVhcG9T?=
 =?utf-8?B?enZLMHFLOVYzRnJQRVdObktwM3NObzFTc1RKVEdTanRIbUM4MU1ranJ3ZkdP?=
 =?utf-8?B?Qng5ck9STXJieHF0eHJkR1dUK0xxZTN0L1VGQ003OTdqa0hLTlhUY2w4S3JB?=
 =?utf-8?B?ZG1BMm5wa28vM0R6dHg4YnFNb0J2NDZ5UTFoalplc3c5YTJkVXNoMnRKd1VH?=
 =?utf-8?B?eDJUL2RGckdzTTUzSVVWQXRHUnlaTlFTMmpOSlZsSkpzU3l2cGFlSlJBYXh2?=
 =?utf-8?B?OE80cVBET3hLaDRKa0dQRlVOOEtUWGx6WllWWTJRMTRXaUIvc0p0MzFKKzdB?=
 =?utf-8?B?cTcxbUk3R0QyUWtWZ1JjSWNJb2xuWVJlSysyMGJpRXVtQUh3alNKbkdpN1dP?=
 =?utf-8?B?Zk5MUGFFb3JnSUovWCt4b3ZuS2o2Z3hER2poZllXR0hDNVhld0pJb0Vka0JD?=
 =?utf-8?B?KzBTU1ZUdS9IZ2F5TWxodzVRb082RWp1WHkrZjh5bXlYY1plTmtQWDRBcHlo?=
 =?utf-8?B?WVoxNTN3ajNubVdtQWxHdGNDeXRtd2hrZFU2QkZ2M1JoQnRkMDBBVzU4N0J4?=
 =?utf-8?B?a21EeCtFNXNXdWdQQmkvdz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC7441EBD64C9E4FBC1F4EDE7E72EFB3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc322a63-5c66-40c5-ddd0-08d929ad3b30
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 12:10:24.7331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NtoWc1Vlc62W6ggp72FEwvvI1fwDR54bGPLYNrbRJYv02u136YTUVxbVEvBY4kziuMtDwKVMkCbsCE+aJlg5GgXN97gYEvDB9pqBWEplY3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5669
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWF5IDI4LCAyMDIxLCBhdCA0OjEyIFBNLCBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dp
b2xpQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IEEgIXJ1bm5hYmxlIHVuaXQgKHRlbXBvcmFyaWx5
KSBwcmVzZW50IGluIHRoZSBydW5xIG1heSBjYXVzZSB1cyB0bw0KPiBzdG9wIHNjYW5uaW5nIHRo
ZSBydW5xIGl0c2VsZiB0b28gZWFybHkuIE9mIGNvdXJzZSwgd2UgZG9uJ3QgcnVuIGFueQ0KPiBu
b24tcnVubmFibGUgdkNQVXMsIGJ1dCB3ZSBlbmQgdGhlIHNjYW4gYW5kIHdlIGZhbGxiYWNrIHRv
IHBpY2tpbmcNCj4gdGhlIGlkbGUgdW5pdC4gSW4gb3RoZXIgd29yZCwgdGhpcyBwcmV2ZW50IHVz
IHRvIGZpbmQgdGhlcmUgYW5kIHBpY2sNCj4gdGhlIGFjdHVhbCB1bml0IHRoYXQgd2UncmUgbWVh
bnQgdG8gc3RhcnQgcnVubmluZyAod2hpY2ggbWlnaHQgYmUNCj4gZnVydGhlciBhaGVhZCBpbiB0
aGUgcnVucSkuDQo+IA0KPiBEZXBlbmRpbmcgb24gdGhlIHZDUFUgcGlubmluZyBjb25maWd1cmF0
aW9uLCB0aGlzIG1heSBsZWFkIHRvIHN1Y2gNCj4gdW5pdCB0byBiZSBzdHVjayBpbiB0aGUgcnVu
cSBmb3IgbG9uZyB0aW1lLCBjYXVzaW5nIG1hbGZ1bmN0aW9uaW5nDQo+IGluc2lkZSB0aGUgZ3Vl
c3QuDQo+IA0KPiBGaXggdGhpcyBieSBjaGVja2luZyBydW5uYWJsZS9ub24tcnVubmFibGUgc3Rh
dHVzIHVwLWZyb250LCBpbiB0aGUgcnVucQ0KPiBzY2FubmluZyBmdW5jdGlvbi4NCj4gDQo+IFJl
cG9ydGVkLWJ5OiBNaWNoYcWCIExlc3pjennFhHNraSA8bWljaGFsLmxlc3pjenluc2tpQGNlcnQu
cGw+DQo+IFJlcG9ydGVkLWJ5OiBEaW9uIEthbnQgPGcudy5rYW50QGh1bmVuZXQubmw+DQo+IFNp
Z25lZC1vZmYtYnk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+DQoNClRoYW5r
cyBmb3IgdHJhY2tpbmcgdGhpcyBkb3duLCBEYXJpbyENCg0KUmV2aWV3ZWQtYnk6IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4NCg0KSnVzdCBvbmUgY29tbWVudDoNCj4g
QEAgLTM0OTYsOCArMzUwMCw3IEBAIHJ1bnFfY2FuZGlkYXRlKHN0cnVjdCBjc2NoZWQyX3J1bnF1
ZXVlX2RhdGEgKnJxZCwNCj4gICAgICAgICAgKiBzb21lIGJ1ZGdldCwgdGhlbiBjaG9vc2UgaXQu
DQo+ICAgICAgICAgICovDQo+ICAgICAgICAgaWYgKCAoeWllbGQgfHwgc3ZjLT5jcmVkaXQgPiBz
bmV4dC0+Y3JlZGl0KSAmJg0KPiAtICAgICAgICAgICAgICghaGFzX2NhcChzdmMpIHx8IHVuaXRf
Z3JhYl9idWRnZXQoc3ZjKSkgJiYNCj4gLSAgICAgICAgICAgICB1bml0X3J1bm5hYmxlX3N0YXRl
KHN2Yy0+dW5pdCkgKQ0KPiArICAgICAgICAgICAgICghaGFzX2NhcChzdmMpIHx8IHVuaXRfZ3Jh
Yl9idWRnZXQoc3ZjKSkgKQ0KPiAgICAgICAgICAgICBzbmV4dCA9IHN2YzsNCg0KQnkgdGhlIHNh
bWUgbG9naWMsIHNob3VsZG7igJl0IHdlIGFsc28gbW92ZSB0aGUgYCghaGFzX2NhcCgpIOKApilg
IGNsYXVzZSBpbnRvIGEgc2VwYXJhdGUgYGlmKHgpIGNvbnRpbnVlYCBjbGF1c2U/ICBUaGVyZSBt
YXkgYmUgcnVubmFibGUgdW5pdHMgZnVydGhlciBkb3duIHRoZSBxdWV1ZSB3aGljaCBhcmVu4oCZ
dCBjYXBwZWQgLyBoYXZlbuKAmXQgZXhoYXVzdGVkIHRoZWlyIGJ1ZGdldCB5ZXQuDQoNCiAtR2Vv
cmdl

