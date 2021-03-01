Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437BE328116
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 15:39:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91558.172986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGjhs-0005xj-Uu; Mon, 01 Mar 2021 14:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91558.172986; Mon, 01 Mar 2021 14:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGjhs-0005xK-R3; Mon, 01 Mar 2021 14:39:32 +0000
Received: by outflank-mailman (input) for mailman id 91558;
 Mon, 01 Mar 2021 14:39:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b02j=H7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lGjhr-0005xF-M5
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 14:39:31 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9ea0d4b-b117-468c-ac42-f1b3196a2cca;
 Mon, 01 Mar 2021 14:39:30 +0000 (UTC)
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
X-Inumbo-ID: a9ea0d4b-b117-468c-ac42-f1b3196a2cca
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614609570;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2s7/jpucbryLMd/CgBEC63KtswULGB+1xWcUaD9hRqw=;
  b=V386zDBmJiBB1IPkvZKstcDbLl4sKd+T9yVPcPaF8P4xximb3F1yIZED
   4MAbnhfoRHmb3zJRzDWKwJLuIA8lGaHo9SIyOKJ2TVeIWhd4IFon+i/hj
   ny6zCLKqu5cgP+PuPVxKDAPDNZSRu+CjovjLK12hThLqTe0iE5WwfCJNJ
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WixwaUwfPGjh23YRBqHwapn7I0xlNemX5rq86OFdbR1/dsW7/3H86cOH99Uc3pkEJy+SrTdhXK
 bsg5hdhiIRMR1+j4paXeFikAsYP0WEXjjZB3S8vVgcaWxnqjsgPBgLLrys0wjc7jgnTgCGex8c
 iKvaEbM/gLgYpir0YUqfvTW0rKD+pjsktwUbEtW1IYj+ZvgHuXs3RxHhcwFfDscIyWEEOGtuni
 ASP5UoPKV6lQ80T1HMbZiDeed4GpmwOKGcuhtPiBL0XxnZJURIjhd1tRECl3tevAJJ+fQ66DWA
 qgs=
X-SBRS: 5.2
X-MesageID: 38258231
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38258231"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AILkgrJAbRqHBI+HmkDIWtQDISsL7zNU6xoVte5R5FTGDXSjLRRwk8xpegRZbuzj+pXGbMGNNDvcBDhUyY7ag+Memj53P5lJ1jcApfo+OG2XEjVUj0lWbvPtKlbvPw/2ZdfOkdSYCd2F0ejU9DPYBfkFWF1LG5UEmaZUYBgPqWAOJoqf22dX0G4YFlcrZZT+5gWAYA4GXtBHyP4RitVjiBIYMT4WW9qiLEk0965J127COtucqd5LAnUT4U/dROb5JFiJJFlhABomZUxfiO42LfHp0ZBkPX+ds/cMFPwDwKMeO+zDNEOYkdc2DQW+r6hCNwEUrQZPDVx7F5w5X4rgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2s7/jpucbryLMd/CgBEC63KtswULGB+1xWcUaD9hRqw=;
 b=HCO04tomrdpPhAEDe8rVyjG2rlIpw6O+bIaKJrGtxuWorxgCH9OBqINi4oeV8uKoqL1NcjFqns/ag7ze3dkrkzLxPSK4cCOggVZFpwkHBBDGMkMim5GW+0fF9QiFsbooPnPIuhp4PBR+AjJFT0qfXWGyD0+4NRCrHyatheGvM/CCJ/0U5eJ1Uttvclue08EJ1MtOiTfqY5rikMOx53xZdjZL+G4uWaqv2le4whjzA87V6qHzSCVEAkUpf4kqyfCgwpFDa6280oIQlirTNs20KrZ6S1mOYFV8IK4CvhTcfRV9SjpBDFiE7f3BF4tLwP7UjB0C5+UIBouEJJN+l10vzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2s7/jpucbryLMd/CgBEC63KtswULGB+1xWcUaD9hRqw=;
 b=OXa1XwSc0DWMTBqYeuAzlxQPhP5o+ZJw+5VBxHUWRsPPvNB9ua0I+9S81StKtSncXVe3NwvyD/4Y4tJPhjWlNpuKtqvQK39xromaKcM72Xr4yuTJjnsX9gjygPAWmEvFqZ/HrHmQrht3VV+U2dWVCWhX5y7WBbg6imJE1dZcv80=
From: George Dunlap <George.Dunlap@citrix.com>
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Dario
 Faggioli" <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Topic: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Index: AQHXCYx4A6OUUHr1gkqxWv1TEOLkuqpnnLaAgABcP4CAB0VMgA==
Date: Mon, 1 Mar 2021 14:39:26 +0000
Message-ID: <F8E5E0F1-0E6C-4659-95E3-01CA52CFCC3F@citrix.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <25034a7a-83ed-0848-8d23-67ed9d02c61c@citrix.com> <87k0qx9gw0.fsf@epam.com>
In-Reply-To: <87k0qx9gw0.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 994ead64-15df-4f5f-6189-08d8dcbfd047
x-ms-traffictypediagnostic: PH0PR03MB5718:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB571810DC7007C2DAB71DEB6B999A9@PH0PR03MB5718.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y86HmnN7av9at1rUtMW8fOxpZHk2CqTfRI0QI+tPZl/DpPmF/iFTE7xeTDAeRcDZGUBeHRmSJXCi8KKRKZ5SXP+bp/Rf9/nR3L7Zh/xX3cTDx0xMTCOZW4FceMp4gA9tPcfiyZ74vGLHK7DCk5uCHr6p0C9vN8Y9+aaaAtL+5IjgB7XyWSqh9lFhsPrjDm0ugUB0FgVnOgn1YPa3zOMl7g8J1MGTgGBdAIuTlMBgJ8WmGcOY1sBOfGEN+CIrbG9HdGOhqEBfOBXe7P5Xh+ISWVCk7/ysDl0cqugCLHPnfXqfsc/uuvy8GxuAf+2/NCoSo7vIqvErMUYjudNU51TZRwRCIMnB4CLodM4mNMHWJ8rqcLe27VT7UPl2vcpYkJbRcuyL6HrQuBWv8+6Qug9cGWErnsxItnFlnD4I7FQTl6Y+0dDi1UPDKuGhUmSdVH2/MCijJTl5YPJ46Y89cjIbHrVloHaiLM/nPoXhg8eSsW1UTO6uyJVZr0n30IXkzc3l1yoTwtv9JBk9L84AOsZzdQdNX3UU76Rd5uJLEM6Afiv9WTHzqp3/Hu6BSUQLv5974wUK94bokxH7oxnt1viA/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(66446008)(66556008)(71200400001)(66946007)(53546011)(6512007)(5660300002)(83380400001)(6916009)(4326008)(66476007)(64756008)(76116006)(86362001)(6506007)(91956017)(2616005)(8676002)(186003)(6486002)(8936002)(26005)(54906003)(2906002)(478600001)(36756003)(316002)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TlhoM2FEQTBaWnpCTlFrYTVMNnNMczdKTGZ6N1NKQUplVm9VV05VU0xtaDhz?=
 =?utf-8?B?QjQ2bVFnQmlKYUZGdVlmYzdqUlVaUWZlall1NFB4V1Fkc0lqYm0rdUduSkl2?=
 =?utf-8?B?TERUWkhyZ3RxZll4aFIyY2dnRmNPb09zb0JwUC80TitGZjV1YzJuOFFyMmpO?=
 =?utf-8?B?aDEydzI4MkxMdWVxUFM3elJlcXNOb096VDFUaFkrUnEyUFlocE90dGdhOUNi?=
 =?utf-8?B?eE5iVFZwOUwwUjZaVHIrUHVhZWFqa0ZSR0ZzcnN3emZyZzYwSXl0LzVhZDdI?=
 =?utf-8?B?NHdLMVNNUUlPVlRVWEEyNk1TVzVCUWZmdHlmbCs2SEgxY3p0VnFhNlFHS1NZ?=
 =?utf-8?B?QnlaQkdFWDROL0tnQXNSNk9vYThhOWJKdGRqYjFWVkxsUE12NXVNTS9WSGIw?=
 =?utf-8?B?bitHWU5ENEhMOEY0WmxVWmM3Wkx3YzNmeks5cHhOaktsTjF3aDI1QjNPVHRz?=
 =?utf-8?B?bjdwT04zMzRpcVFNbWQ4b3pnbWQ3NlFpQi9ybnVXLzhoT3lLa1BlMTg4bFlR?=
 =?utf-8?B?cTJMcGUwdlJaSDlMR1FDRWltVG1OUVBTM3hGWnJuTlgwK3pSQk1CTWZwSUdl?=
 =?utf-8?B?ZFdld0ZFODRwUVlHd1pBMmppT1IwazZ4RmsxekxXMmh3UlY5Wm9IMXl3UWV3?=
 =?utf-8?B?YnNCdUdLYk84b3BwRUpiaEpoczRLRVJGQ1NZcCsrWlBJM2MxbFVlZENGRGdx?=
 =?utf-8?B?UERwc3pGVFZCY2NycGhtVjl1TWh1TENkaHRMQ1dBeU9IcUZHc0JHT1FzaGVM?=
 =?utf-8?B?VGNRbG51L2pxQTc0S053aG5QaGVoeXcrRlN4TTNsZUUyYzkyR3BQbU9UUGp5?=
 =?utf-8?B?alVFSjE0QWpCTGJSL0EwSzVRK3RCVUtVbEM4WDRoTXN0NlFqL0l0dEZ0dk5R?=
 =?utf-8?B?ZkhKS0E4emZtWE5CbFlXWXlhenZyOUM3WWdTNldxcktLZEFlZ1J4L1JicnI2?=
 =?utf-8?B?WkF2SFFob2xDL1Z3Tm92UzNOcWNpUzZpZi8xQjkrZ0VOck1vTUVwanBDSGor?=
 =?utf-8?B?eTNiZlhoQXZRQ3JTaTFiSndMdDEyeWh3Y054VitZNkFHVlpKWlpudlcrM3VJ?=
 =?utf-8?B?c1dObFRQRVVMVnZaZUxycWdIRUphK2VtMlhyWGJoNHIvT0ZteVEydzRWc1Mz?=
 =?utf-8?B?MFZtZ1RQQ0dhTmZhaVJ6WEQ3T0h1UnNGb05YaTZOR2hLem5sWVVmeFJHRzdR?=
 =?utf-8?B?d3ZqRUV0MWVHT1E3MDdRMFlEWXozVXRVdjA4cmlCWkRHdS8rYWgrbmMvZUdQ?=
 =?utf-8?B?OG1IaWtQTzhZWHJpem5QdHB6K0gvSW9zbWNHWFBoUThZcGYrM3pGajFGeTdr?=
 =?utf-8?B?S214SE1rdk1DTVlrdjNRZStJd1d6THZjRlRBUHFJb041ZGhpUmJtWSt4cnRL?=
 =?utf-8?B?M1BxWktHRWFwQ3VPeW0rT21CTkU1a3RKWWJHWEovRUpSYzROZlh2VzRSZUxt?=
 =?utf-8?B?K08yb3plOUE5WmltbkVzZi81cWpFMEFyUGZxSlRweTdCL0M5NHl2OGZ5WGF3?=
 =?utf-8?B?S0lZRmhOY0w4ajJqOFNKSDAySjM0WWt0S3F4TDNSbjJFdkcwUHZPTHZJMjNn?=
 =?utf-8?B?N0VTQjBVeVdzL0NWMTl4TThXL1hYUDJPUGp5ajZvVStSdU5iWk44cVJYVFBa?=
 =?utf-8?B?Mjl1WWZNa08vZG1UNVY5RHJELzB1K2tyMUZhY1dKS0RIVFZic2tYREdsSlE1?=
 =?utf-8?B?V3E0RmZFak5EbkFyY0xyWEhWa1dsV2xNODJ5c2xPT0JGM2l4QW9hT3FKaytj?=
 =?utf-8?B?SGJ5L09sWCtuSisyS1FxaGl1bWcxdVVOR0l0RUxqUVlNdVh2QW1Qc1pMcVNX?=
 =?utf-8?B?N2JXamYvakt3N1F5eWIwQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <918A185FDC64A24DAB7FFD6070AB38C7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994ead64-15df-4f5f-6189-08d8dcbfd047
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 14:39:26.2973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m58b0YYjaYiCc/NwlsOmpLKVEbbJ5jyG0SO6v6M/oV3umaZHPxUCW3d9EWXFfrn/D2/yTtbd8ashbyK7DCC77TTnCWN88pJ7GmBy9pIX+Tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5718
X-OriginatorOrg: citrix.com

DQoNCj4gT24gRmViIDI0LCAyMDIxLCBhdCAxMTozNyBQTSwgVm9sb2R5bXlyIEJhYmNodWsgPHZv
bG9keW15cl9iYWJjaHVrQGVwYW0uY29tPiB3cm90ZToNCj4gDQo+IA0KPj4gSHlwZXJ2aXNvci92
aXJ0IHByb3BlcnRpZXMgYXJlIGRpZmZlcmVudCB0byBib3RoIGEga2VybmVsLW9ubHktUlRPUywg
YW5kDQo+PiByZWd1bGFyIHVzZXNwYWNlLiAgVGhpcyB3YXMgd2h5IEkgZ2F2ZSB5b3Ugc29tZSBz
cGVjaWZpYyBleHRyYSBzY2VuYXJpb3MNCj4+IHRvIGRvIGxhdGVuY3kgdGVzdGluZyB3aXRoLCBz
byB5b3UgY291bGQgbWFrZSBhIGZhaXIgY29tcGFyaXNvbiBvZg0KPj4gImV4dHJhIG92ZXJoZWFk
IGNhdXNlZCBieSBYZW4iIHNlcGFyYXRlIGZyb20gIm92ZXJoZWFkIGR1ZSB0bw0KPj4gZnVuZGFt
ZW50YWwgZGVzaWduIGNvbnN0cmFpbnRzIG9mIHVzaW5nIHZpcnQiLg0KPiANCj4gSSBjYW4ndCBz
ZWUgYW55IGZ1bmRhbWVudGFsIGNvbnN0cmFpbnRzIHRoZXJlLiBJIHNlZSBob3cgdmlydHVhbGl6
YXRpb24NCj4gYXJjaGl0ZWN0dXJlIGNhbiBpbmZsdWVuY2UgY29udGV4dCBzd2l0Y2ggdGltZTog
aG93IG1hbnkgYWN0aW9ucyB5b3UNCj4gbmVlZCB0byBzd2l0Y2ggb25lIHZDUFUgdG8gYW5vdGhl
ci4gSSBoYXZlIGluIG1pbmQgbG93IGxldmVsIHRoaW5ncw0KPiB0aGVyZTogcmVwcm9ncmFtIE1N
VSB0byB1c2UgYW5vdGhlciBzZXQgb2YgdGFibGVzLCByZXByb2dyYW0geW91cg0KPiBpbnRlcnJ1
cHQgY29udHJvbGxlciwgdGltZXIsIGV0Yy4gT2YgY291cnNlLCB5b3UgY2FuJ3QgZ2V0IGxhdGVu
Y3kgbG93ZXINCj4gdGhhdCBjb250ZXh0IHN3aXRjaCB0aW1lLiBUaGlzIGlzIHRoZSBvbmx5IGZ1
bmRhbWVudGFsIGNvbnN0cmFpbnQgSSBjYW4NCj4gc2VlLg0KDQpXZWxsIHN1cHBvc2UgeW91IGhh
dmUgdHdvIGRvbWFpbnMsIEEgYW5kIEIsIGJvdGggb2Ygd2hpY2ggY29udHJvbCAgaGFyZHdhcmUg
d2hpY2ggaGF2ZSBoYXJkIHJlYWwtdGltZSByZXF1aXJlbWVudHMuDQoNCkFuZCBzdXBwb3NlIHRo
YXQgQSBoYXMganVzdCBzdGFydGVkIGhhbmRsaW5nIGhhbmRsaW5nIGEgbGF0ZW5jeS1zZW5zaXRp
dmUgaW50ZXJydXB0LCB3aGVuIGEgbGF0ZW5jeS1zZW5zaXRpdmUgaW50ZXJydXB0IGNvbWVzIGlu
IGZvciBCLiAgWW91IG1pZ2h0IHdlbGwgcHJlZW1wdCBBIGFuZCBsZXQgQiBydW4gZm9yIGEgZnVs
bCB0aW1lc2xpY2UsIGNhdXNpbmcgQeKAmXMgaW50ZXJydXB0IGhhbmRsZXIgdG8gYmUgZGVsYXll
ZCBieSBhIHNpZ25pZmljYW50IGFtb3VudC4NCg0KUHJldmVudGluZyB0aGF0IHNvcnQgb2YgdGhp
bmcgd291bGQgYmUgYSBtdWNoIG1vcmUgdHJpY2t5IGlzc3VlIHRvIGdldCByaWdodC4NCg0KPj4g
SWYgeW91IHdhbnQgdGltZWx5IGludGVycnVwdCBoYW5kbGluZywgeW91IGVpdGhlciBuZWVkIHRv
IHBhcnRpdGlvbiB5b3VyDQo+PiB3b3JrbG9hZHMgYnkgdGhlIGxvbmctcnVubmluZy1uZXNzIG9m
IHRoZWlyIGh5cGVyY2FsbHMsIG9yIG5vdCBoYXZlDQo+PiBsb25nLXJ1bm5pbmcgaHlwZXJjYWxs
cy4NCj4gDQo+IC4uLiBvciBkbyBsb25nLXJ1bm5pbmcgdGFza3MgYXN5bmNocm9ub3VzbHkuIEkg
YmVsaWV2ZSwgZm9yIG1vc3QNCj4gZG9tY3RscyBhbmQgc3lzY3RscyB0aGVyZSBpcyBubyBuZWVk
IHRvIGhvbGQgY2FsbGluZyB2Q1BVIGluIGh5cGVydmlzb3INCj4gbW9kZSBhdCBhbGwuDQo+IA0K
Pj4gSSByZW1haW4gdW5jb252aW5jZWQgdGhhdCBwcmVlbXB0aW9uIGlzIGFuIHNlbnNpYmxlIGZp
eCB0byB0aGUgcHJvYmxlbQ0KPj4geW91J3JlIHRyeWluZyB0byBzb2x2ZS4NCj4gDQo+IFdlbGws
IHRoaXMgaXMgdGhlIHB1cnBvc2Ugb2YgdGhpcyBsaXR0bGUgZXhwZXJpbWVudC4gSSB3YW50IHRv
IGRpc2N1c3MNCj4gZGlmZmVyZW50IGFwcHJvYWNoZXMgYW5kIHRvIGVzdGltYXRlIGFtb3VudCBv
ZiByZXF1aXJlZCBlZmZvcnRzLiBCeSB0aGUNCj4gd2F5LCBmcm9tIHg4NiBwb2ludCBvZiB2aWV3
LCBob3cgaGFyZCB0byBzd2l0Y2ggdkNQVSBjb250ZXh0IHdoaWxlIGl0IGlzDQo+IHJ1bm5pbmcg
aW4gaHlwZXJ2aXNvciBtb2RlPw0KDQpJ4oCZbSBub3QgbmVjZXNzYXJpbHkgb3Bwb3NlZCB0byBp
bnRyb2R1Y2luZyBwcmVlbXB0aW9uLCBidXQgdGhlIG1vcmUgd2UgYXNrIGFib3V0IHRoaW5ncywg
dGhlIG1vcmUgY29tcGxleCB0aGluZ3MgYmVnaW4gdG8gbG9vay4gIFRoZSBpZGVhIG9mIGludHJv
ZHVjaW5nIGFuIGFzeW5jIGZyYW1ld29yayB0byBkZWFsIHdpdGggbG9uZy1ydW5uaW5nIGh5cGVy
Y2FsbHMgaXMgYSBodWdlIGVuZ2luZWVyaW5nIGFuZCBkZXNpZ24gZWZmb3J0LCBub3QganVzdCBm
b3IgWGVuLCBidXQgZm9yIGFsbCBmdXR1cmUgY2FsbGVycyBvZiB0aGUgaW50ZXJmYWNlLg0KDQpU
aGUgY2xhaW0gaW4gdGhlIGNvdmVyIGxldHRlciB3YXMgdGhhdCDigJxbc11vbWUgaHlwZXJjYWxs
cyBjYW4gbm90IGJlIHByZWVtcHRlZCBhdCBhbGzigJ0uICBJIGxvb2tlZCBhdCB0aGUgcmVmZXJl
bmNlLCBhbmQgaXQgbG9va3MgbGlrZSB5b3XigJlyZSByZWZlcnJpbmcgdG8gdGhpczoNCg0KIkkg
YnJvb2RlZCBvdmVyIHdheXMgdG8gbWFrZSBbYWxsb2NfZG9taGVhcF9wYWdlcygpXSBwcmVlbXB0
aWJsZS4gQnV0IGl0IGlzIGEpIGxvY2F0ZWQgZGVlcCBpbiBjYWxsIGNoYWluIGFuZCBiKSB1c2Vk
IG5vdCBvbmx5IGJ5IGh5cGVyY2FsbHMuIFNvIEkgY2FuJ3Qgc2VlIGFuIGVhc3kgd2F5IHRvIG1h
a2UgaXQgcHJlZW1wdGlibGUuIg0KDQpMZXTigJlzIGFzc3VtZSBmb3IgdGhlIHNha2Ugb2YgYXJn
dW1lbnQgdGhhdCBwcmV2ZW50aW5nIGRlbGF5cyBkdWUgdG8gYWxsb2NfZG9taGVhcF9wYWdlcygp
IHdvdWxkIHJlcXVpcmUgc2lnbmlmaWNhbnQgcmVhcmNoaXRlY3Rpbmcgb2YgdGhlIGNvZGUuICBB
bmQgbGV04oCZcyBldmVuIGFzc3VtZSB0aGF0IHRoZXJlIGFyZSAyLTMgb3RoZXIgc3VjaCBrbm90
dHkgaXNzdWVzIG1ha2luZyBmb3IgdW5hY2NlcHRhYmx5IGxvbmcgaHlwZXJjYWxscy4gIFdpbGwg
aWRlbnRpZnlpbmcgYW5kIHRyYWNraW5nIGRvd24gdGhvc2UgaXNzdWVzIHJlYWxseSBiZSBtb3Jl
IGVmZm9ydCB0aGFuIGludHJvZHVjaW5nIHByZWVtcHRpb24sIGludHJvZHVjaW5nIGFzeW5jIG9w
ZXJhdGlvbnMsIGFuZCBhbGwgdGhlIG90aGVyIHRoaW5ncyB3ZeKAmXZlIGJlZW4gdGFsa2luZyBh
Ym91dD8NCg0KT25lIHRoaW5nIHRoYXQgbWlnaHQgYmUgaW50ZXJlc3RpbmcgaXMgdG8gYWRkIHNv
bWUgc29ydCBvZiBtZXRyaWNzIChkaXNhYmxlZCBpbiBLY29uZmlnIGJ5IGRlZmF1bHQpOyBlLmcu
Og0KDQoxLiBPbiBlbnRyeSB0byBhIGh5cGVyY2FsbCwgdGFrZSBhIHRpbWVzdGFtcA0KDQoyLiBP
biBldmVyeSBoeXBlcmNhbGxfcHJlZW1wdCgpIGNhbGwsIHRha2UgYW5vdGhlciB0aW1lc3RhbXAg
YW5kIHNlZSBob3cgbXVjaCB0aW1lIGhhcyBwYXNzZWQgd2l0aG91dCBhIHByZWVtcHQsIGFuZCBy
ZXNldCB0aGUgdGltZXN0YW1wIGNvdW50OyBhbHNvIGRvIGEgY2hlY2sgb24gZXhpdCBvZiB0aGUg
aHlwZXJjYWxsDQoNCldlIGNvdWxkIHN0YXJ0IGJ5IHRyeWluZyB0byBkbyBzdGF0cyBhbmQgZmln
dXJpbmcgb3V0IHdoaWNoIGh5cGVyY2FsbHMgZ28gdGhlIGxvbmdlc3Qgd2l0aG91dCBwcmVlbXB0
aW9uLCBhcyBhIHdheSB0byBndWlkZSB0aGUgb3B0aW1pemF0aW9uIGVmZm9ydHMuICBUaGVuIGFz
IHdlIGdldCB0aGF0IG51bWJlciBkb3duLCB3ZSBjb3VsZCBhZGQgYW4gQVNTRVJUKClzIHRoYXQg
dGhlIHRpbWUgaXMgbmV2ZXIgbG9uZ2VyIHRoYW4gYSBjZXJ0YWluIGFtb3VudCwgYW5kIGFkZCBy
dW5zIGxpa2UgdGhhdCB0byBvc3N0ZXN0IHRvIG1ha2Ugc3VyZSB0aGVyZSBhcmUgbm8gcmVncmVz
c2lvbnMgaW50cm9kdWNlZC4NCg0KSSBhZ3JlZSB0aGF0IGh5cGVyY2FsbCBjb250aW51YXRpb25z
IGFyZSBjb21wbGV4OyBhbmQgeW914oCZcmUgcmlnaHQgdGhhdCB0aGUgZmFjdCB0aGF0IHRoZSBo
eXBlcmNhbGwgY29udGludWF0aW9uIG1heSBuZXZlciBiZSBjYWxsZWQgbGltaXRzIHdoZXJlIHBy
ZWVtcHRpb24gY2FuIGhhcHBlbi4gIEJ1dCBtYWtpbmcgdGhlIGVudGlyZSBoeXBlcnZpc29yIHBy
ZWVtcHRpb24tZnJpZW5kbHkgaXMgYWxzbyBxdWl0ZSBjb21wbGV4IGluIGl0cyBvd24gd2F5OyBp
dOKAmXMgbm90IGltbWVkaWF0ZWx5IG9idmlvdXMgdG8gbWUgZnJvbSB0aGlzIHRocmVhZCB0aGF0
IGh5cGVydmlzb3IgcHJlZW1wdGlvbiBpcyBsZXNzIGNvbXBsZXguDQoNCiAtR2Vvcmdl

