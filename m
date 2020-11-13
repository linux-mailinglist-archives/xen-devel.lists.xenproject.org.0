Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB82B221C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 18:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26819.55327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdcnD-0003ce-W4; Fri, 13 Nov 2020 17:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26819.55327; Fri, 13 Nov 2020 17:23:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdcnD-0003cF-SF; Fri, 13 Nov 2020 17:23:23 +0000
Received: by outflank-mailman (input) for mailman id 26819;
 Fri, 13 Nov 2020 17:23:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D1Nx=ET=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kdcnC-0003cA-JE
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:23:22 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b9dbdb4-f78e-47e1-90b1-4ab070329c59;
 Fri, 13 Nov 2020 17:23:21 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=D1Nx=ET=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
	id 1kdcnC-0003cA-JE
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:23:22 +0000
X-Inumbo-ID: 6b9dbdb4-f78e-47e1-90b1-4ab070329c59
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6b9dbdb4-f78e-47e1-90b1-4ab070329c59;
	Fri, 13 Nov 2020 17:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605288203;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xcZnNLvEltjBS2mrvn2AD3E70LHztdkJvzTOkdF5n84=;
  b=DLuk6nqSQmC249Thuc0SRR/f7kN+Tmf2eYJcTLVChO4S4nFtRJMDowvv
   /GRqQ3DqCITyH+P2FYGegiFiGsXyE0+T2hL87JqAYHPE1wR3wbZOOhVlK
   4wQ1l2q5Fu5rS/U6tyVUp81uhsLrgdQU0r3VvLUlPTyd+GvUMPDJd8MHz
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 67AIAydRUNt67hum4sZePS2UW1MVWiRtdlsl9GMNGOuAZqg842Rvwu7Wz/dhWNfzBA4MDhwoFP
 KUKTWqZcLhO58SwKyc8VYDfve2UkbVevvZ87lm4g5+R2YtXgE6ZPxErBc5lTGhZ2kQcbTZRRqs
 rWZpn6xZQFH8ttbpgmTjPnlxe0uUheh1sSwGfqrNW9AtaBoSaxgTVYeKkNyidHClOvuqtPko5Y
 5fI1dAff00vTMc1P91QNPAuoZqnK1y16InNPC16JQayx4PWmug40IJjvXdEHxLNtOQelkTMjFO
 y6U=
X-SBRS: None
X-MesageID: 31114015
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,476,1596513600"; 
   d="scan'208";a="31114015"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNTf+TMB/vkTPuE7O95Sed7mBdIvsYqZPYnwBoGnBrSmnFrpHC5Hs8xcgnUQY7eStWL8oHWOswwLOtPxSGb8R4j5isoSk5FHReUm8qrLxLHXcKYcphk2ySLcUz2Lcy7swhHPy5mulR1MTs674UiBB5LOZ3xFC3RKgbdXb5QS22RrVyyxJ1sqBOLOAwxhNsxuhAkVYiU9yP+EwBbUaC9iPOkv6YzQDVQQ5CjIScRoXHZ2f8BJSPrgFLCq+3l7xGCDlDEkplXMnUNRkb3jDDlJtItWRwp/HQWNjbniIg71dDe0WYUm82CA9bmfXxshyCt+mNmpfzhRmxZlDJLOO7H3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcZnNLvEltjBS2mrvn2AD3E70LHztdkJvzTOkdF5n84=;
 b=JweJlzV6EeA+q8vJjGrjmjFINUNp8JJk4qi4jLmOWvbTnurczUZDQljIHN1aTY2vd+1hhrwKJ1DDNJ2o9aX1eLRhdbveLhb6EDLGSs7jqBSj7RI2RVF5pbWzSFAeYuLMh1CdickCSripJ/iEVRGtfRwX0fRlKC/uGGUrrsB41GHZa3g9Qm7WNDEJ5bLIajfOf2ywbYrhHFnm8NZWTbbenyzyze0ZIasuF4NN6/9+f8pj8FXBvtWaEFG44ZUrUcNcISMZ5nOFUHh1oXmMo3ZocY/pv5e7SnkZMdrF+osG+wRWARvgyQlIE4TF3NgS4vZ8Oi6jY5CKvBXCpaAdjQQK8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcZnNLvEltjBS2mrvn2AD3E70LHztdkJvzTOkdF5n84=;
 b=RVSKOqsNQl1MLMlX/Av6C1xFEiOhFAKL2Z+hL/ZuLUGpT988jK02rmoxCD0sw6rd9OEQRXJvsakVvQNDi2n6izuY8Iu3P/ZodYRGxoV1RqcLMb/waoHxnaMKSf5x710VSvkaUmM+J0omzNVThMNOzlYAjcRubRhXsYw4/0DPJH8=
From: Edwin Torok <edvin.torok@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, "doebel@amazon.de" <doebel@amazon.de>
CC: "wl@xen.org" <wl@xen.org>, Christian Lindig <christian.lindig@citrix.com>,
	"jgrall@amazon.co.uk" <jgrall@amazon.co.uk>, "elnikety@amazon.de"
	<elnikety@amazon.de>, "iwj@xenproject.org" <iwj@xenproject.org>
Subject: Re: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
Thread-Topic: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
Thread-Index: AQHWueBOvwB25jmdBUW60qKjlgfroqnGT5aA
Date: Fri, 13 Nov 2020 17:23:16 +0000
Message-ID: <39f0b457514c3b6bcc7419d9eaf5770a5c073333.camel@citrix.com>
References: <20201113141823.58712-1-doebel@amazon.de>
	 <5ac379ad-33fd-2973-dfdb-9e06ea539809@suse.com>
	 <0e6b09fe-ffc4-195f-1b6c-67abc0cff92c@amazon.de>
	 <c1352a2a-112a-966f-7410-b917cabe1d91@citrix.com>
In-Reply-To: <c1352a2a-112a-966f-7410-b917cabe1d91@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13453398-95a5-4f56-5da3-08d887f8cec6
x-ms-traffictypediagnostic: BYAPR03MB3591:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB35917830E122A798F7115AA09BE60@BYAPR03MB3591.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7V4uYFX6beWzlKDzFxcsgV7iuON0i/n8hikqB9QbyrkAlxuBVVbmSEIqmXbO8s0eT2Be2RyZW8PBXtMBwNTxs3aiECr0DYvaYhiv55NVoNQGxmKU8p/HBjr3Kzm1CuMQCYTCX9myx5xjFCijoOzUZ0lErZPMWLOZcQjm5TrecCI2+oNC23ztiw3fXpHpt19gqBtG2tsiN7UTXTkqG4n9HAzliWyxuhFsMqKUL6HvC537HIx8zJyXI0pQWw/KMXTeyR/Ujm3CRKa0MRDLcHxHP4cZVIOWJxfHvktbfixOwsTUGerc3Vn24awhCKsJxhVli8Uxcq8HaFao3v8ipmwF4rJX3Bc9CiJb5GK8annS70U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(316002)(54906003)(86362001)(110136005)(26005)(36756003)(83380400001)(6512007)(4001150100001)(53546011)(2906002)(186003)(6506007)(71200400001)(2616005)(966005)(4326008)(66446008)(66476007)(66556008)(64756008)(6486002)(5660300002)(8676002)(66946007)(76116006)(478600001)(91956017)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: lxc/qbiqWNPZfvh2PC78qOLHwuDZHjrtGDq38bU0h9QkOi23HV88dxcnCg+UCbaXfV0hlEI5QKMqdmA22UuTnjCS+XzkLjpoUtmkIX6wlSrULooA2Z8bx+UnJrLlFbd+TZbw9Ug1tHGRpV9srD9wyjZCDcJK0KMxCy/7WX+fhKC3E2rqHF+C1M4xW+u1su9krlhwyfmzRelUJDv0o/5B4efof0dMUzQnvUW2lhwMLp7izvlX8cY8A2+zk4nq1BY2SBWQTnd06SZE2xlObTDduit921auxqsnoMXAiRNw4L3ZADIS9G+9Vdikx1DfW4pNJeiA/zUBhad6U4wgsD0DIKFhw3JpA4nUTHg8puvnOKye5+q5Jpq9EKBn6pORPNMyOmf+iY+S5pdY3MI3AuYSNzboHWq7jQOuf8gExhz+McshaTnn4/+0lokinIszzsn/V7C8lERbLvEVuWnPqFjyUCavUnBV0c4NDKtEOfavbKuOV3XL7u9m0ZgNq0iVXPaem4Utb0NP4gBeJ6JPK45oUoNtVPW5t5EMvXBqjCL6zhMPeHz7m4ibxWSBb22FmpA4QCM23x1ZsCRwu+EcUCkC2qKe5Rg4fwnE1marUJgxBGPtbV0U0BSj/g9IdpxCyfbCPzaUbMIvA6ewA5wnMprYxtF0b0BspFy47nwTIaHW14vOy9Mcp4fVC+B/KpfCV8GC5wh27kv2+6l9K8fJc4tbrmQGhIG4KmT92eu3JKH8Q3thXfzT7M4H/WvfsxpFbtbMAJMRsKKOhdGCJNdQZx3DRASIvOONMXN0zbucRPdpT8cdAPuke9957FAD3qCyl1PMnn6L09yGpdFw+vyYvY5Seh9R688QMN5hqdzHaVVAQzVlWHAo4kxE8QUvxfuIj452djEQRKsiC3dULRbadfmXgQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFB295523EA4EA4F9CD7512AC96A52C3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13453398-95a5-4f56-5da3-08d887f8cec6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 17:23:16.2645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q1zZa8fuCHC70S7A31M5Ls0OfGKQADbHw+NBNLXRiaMif8/ObgDxrlNZ8OP6aQkpKLHIJ5Lmxz8KKXZe2t/ngQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3591
X-OriginatorOrg: citrix.com

T24gRnJpLCAyMDIwLTExLTEzIGF0IDE3OjEzICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAxMy8xMS8yMDIwIDE2OjU2LCBCam9lcm4gRG9lYmVsIHdyb3RlOg0KPiA+IE9uIDEzLjEx
LjIwIDE2OjM2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPiA+ID4gT24gMTMuMTEuMjAgMTU6MTgs
IEJqb2VybiBEb2ViZWwgd3JvdGU6DQo+ID4gPiA+IFJpZ2h0IG5vdyB3ZSBkbyBub3QgaGF2ZSBh
IG1lY2hhbmlzbSB0byBkZXRlcm1pbmUgdGhlIHZlcnNpb24NCj4gPiA+ID4gb2YgdGhlDQo+ID4g
PiA+IGN1cnJlbnRseSBydW5uaW5nIHhlbnN0b3JlZCBhdCBydW50aW1lLiBBcyB4ZW5zdG9yZWQg
cnVucw0KPiA+ID4gPiB0aHJvdWdob3V0DQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiBsaWZldGltZSBv
ZiBhIFhlbiBob3N0LCB0aGlzIG1heSBsZWFkIHRvIHByb2JsZW1zIHdoZW4gbmV3ZXINCj4gPiA+
ID4gdXNlciBzcGFjZQ0KPiA+ID4gPiBidWlsZHMgYXJlIHN0YWdlZC4gVGhlbiwgdGhlIHJ1bm5p
bmcgeGVuc3RvcmVkIHdpbGwgbm8gbG9uZ2VyDQo+ID4gPiA+IG1hdGNoIHRoZQ0KPiA+ID4gPiB2
ZXJzaW9uIG9mIHRoZSBpbnN0YWxsZWQgeGVuc3RvcmVkLg0KPiA+ID4gPiANCj4gPiA+ID4gVG8g
YWxsb3cgdXNlcnMgdG8gYWx3YXlzIGlkZW50aWZ5IHRoZSBydW5uaW5nIHZlcnNpb24gb2YNCj4g
PiA+ID4geGVuc3RvcmVkLCBhZGQNCj4gPiA+ID4gYSBsaW5rZXItZ2VuZXJhdGVkIHVuaXF1ZSBi
dWlsZCBJRCB0byBldmVyeSB4ZW5zdG9yZWQgYnVpbGQuDQo+ID4gPiA+IEFkZA0KPiA+ID4gPiBm
dW5jdGlvbmFsaXR5IHRvIGxvZyB0aGlzIGJ1aWxkIElEIGludG8gYSBmaWxlIHVwb24gc2Vydmlj
ZQ0KPiA+ID4gPiBzdGFydHVwLg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmpv
ZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4NCj4gPiA+ID4gUmV2aWV3ZWQtYnk6IE1hcnRp
biBNYXplaW4gPGFtYXplaW5AYW1hem9uLmRlPg0KPiA+ID4gPiBSZXZpZXdlZC1ieTogUGF1bCBE
dXJyYW50IDxwZHVycmFudEBhbWF6b24uY28udWs+DQo+ID4gPiANCj4gPiA+IE5vIHN1cHBvcnQg
Zm9yIG94ZW5zdG9yZWQgb3IgeGVuc3RvcmUtc3R1YmRvbT8NCj4gPiANCj4gPiBZb3VyIHN1Z2dl
c3Rpb24gZnVydGhlciBkb3duIHdpbGwgYXBwYXJlbnRseSBoZWxwIGZvciBzdHViZG9tLiBJIGRv
DQo+ID4gbm90IHNwZWFrIG9jYW1sIGF0IGFsbCAtIGhvdyBkbyB3ZSBhZGRyZXNzIHRoaXM/DQo+
IA0KPiBDQydpbmcgRWR3aW4gYW5kIENocmlzdGlhbiB3aG8gaGF2ZSBkb25lIHRoZSBidWxrIG9m
IHRoZSBveGVuc3RvcmVkDQo+IHJlY2VudGx5Lg0KPiANCj4gSXQgc291bmRzIGxpa2UgaXQgbWln
aHQgbm90IGJlIHBvc3NpYmxlIHJpZ2h0IG5vdywgYnV0IHdvdWxkIGJlDQo+IHBvc3NpYmxlDQo+
IHdpdGggYSBmdXR1cmUgcGxhbiB0byBzd2l0Y2ggdGhlIE9jYW1sIGJ1aWxkIHN5c3RlbSBvdmVy
IHRvIGR1bmUgKHRoZQ0KPiBuZXcvcHJlZmVycmVkIE9jYW1sIHVwc3RyZWFtIHRvb2xjaGFpbiku
DQoNClNlZSBoZXJlIHdoYXQgaXMgcG9zc2libGUgd2l0aCBEdW5lOg0KaHR0cHM6Ly9kdW5lLnJl
YWR0aGVkb2NzLmlvL2VuL3N0YWJsZS9kdW5lLWxpYnMuaHRtbCNidWlsZC1pbmZvDQoNCldvdWxk
IHRoZSBvdXRwdXQgb2YgJ2dpdCBkZXNjcmliZSAtLWFsd2F5cyAtLWRpcnR5JyAocGVyaGFwcyBj
b21iaW5lZA0Kd2l0aCBhIGJ1aWxkIGRhdGUpIHNlcnZlIGFzIGEgdXNlZnVsIGJ1aWxkIElEPw0K
DQo+IA0KPiBJZiBpdCBkb2VzIGVuZCB1cCBiZWluZyBhbiBYU19DT05UUk9MIHN1Yi1vcCwgd2Ug
Y2FuIGltcGxlbWVudCBpdCBhdA0KPiBhDQo+IGZ1dHVyZSBwb2ludCB3aGVuIHdlIGNhbiB1c2Vm
dWxseSBhbnN3ZXIgdGhlIHF1ZXN0aW9uLg0KDQpXb3VsZG4ndCB1c2luZyByZWFkZWxmIG9uIC9w
cm9jLzxwaWQ+L2V4ZSBnaXZlIHlvdSB0aGUgcnVubmluZyBidWlsZGlkPw0KDQpyZWFkZWxmIC1h
IC91c3Ivc2Jpbi9veGVuc3RvcmVkIC9wcm9jLyQocGlkb2Ygb3hlbnN0b3JlZCkvZXhlIHwgZ3Jl
cA0KJ0J1aWxkIElEJw0KICAgIEJ1aWxkIElEOiBiZGQ1MzA0Yzg5ODRlZDIyNTcwZDUxMzA4YWU4
NzE3ZDAzZmU2MGFlDQogICAgQnVpbGQgSUQ6IGJkZDUzMDRjODk4NGVkMjI1NzBkNTEzMDhhZTg3
MTdkMDNmZTYwYWUNCg0KcmVhZGVsZiAtYSAvdXNyL3NiaW4vb3hlbnN0b3JlZCAvcHJvYy8kKHBp
ZG9mIG94ZW5zdG9yZWQpL2V4ZSB8IGdyZXANCidCdWlsZCBJRCcNCiAgICBCdWlsZCBJRDogYjQ0
ZmY5OWIyMTZkYjc1MjZlM2VlNzg0MTA2OGQ1ODRjYzljMmI5NQ0KICAgIEJ1aWxkIElEOiBiZGQ1
MzA0Yzg5ODRlZDIyNTcwZDUxMzA4YWU4NzE3ZDAzZmU2MGFlDQoNCg0KV2hlbiB5b3UncmUgaW5z
aWRlIGEgc3R1YmRvbSBpdCBpcyBwcm9iYWJseSBub3Qgc28gZWFzeSB0aG91Z2guDQoNCkJlc3Qg
cmVnYXJkcywNCi0tRWR3aW4NCg0KPiANCj4gfkFuZHJldw0KDQo=

