Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FA12009BA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 15:16:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmGsM-00086v-AF; Fri, 19 Jun 2020 13:16:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jb/V=AA=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jmGsK-00086L-Cn
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 13:16:08 +0000
X-Inumbo-ID: 07a4126a-b22f-11ea-bb7d-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07a4126a-b22f-11ea-bb7d-12813bfff9fa;
 Fri, 19 Jun 2020 13:16:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqhAmZvxCsPKRU+/gfVNSOiqPU0Uw6+dYvKCgZVXpbfwjih6NfvNKz7fYYh3odzkK7MfrLA9JIKozqsExxd0sToZ1sAnp0Wao8AgiH7jqhSLH5FzEzV7/bY7xaUvE8YREvgxDxOgh8suWmWZ6z1O8L4f3KG31f9IvBGxuWqH97FTz0P+LUCgajus2DooOriIK/rJkgnrzaIEykCKeyT4pp8ooZVKjfX3aygULb+Opyrq2GsRkAJ81vOHm6H/lm5XlzKNjzOK/fqS9f8it16X2xXwmObUylmCM7ypXsuUy6XlEaki3H9sYtpheYVvs3M0m1JI7A6O30UhIJN5GePP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEdNxY+g7LQrXV8ZeUkIs+/yYdtSpwkUlHJjyyLUgeg=;
 b=SPNTcWdugMK5P8J/FBCyiJQB03xjVz8irHqlzQRw/D9XKMVES6LAmMXj+csLo9OzyUx0ZwY6W44X0w6jht9RpekTMecr7G7otkQsVXJJcjiydPGcF/SGspglrpgzGD34a11GMx6OVqewkF1fYaFgRoviiJGtgksXUTZbhzahtWes6zwJeacEbRMOeJ6ffEE43Yx92RjE4i2C03qdD3zQujDjSmceBniHD/9TGj0daIgDjAH33kACwgjMNXqheNhIBNebVojRG4vMECG3aAcmy7zqfCFJ+slL/p3a48+N2sKaXhCRjDvsmGsZE8eW8MPzNNndkaLJdOTWS3N50m0jAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEdNxY+g7LQrXV8ZeUkIs+/yYdtSpwkUlHJjyyLUgeg=;
 b=Icj+zMYy652aMy2tz3e4ncHg7aEh6W8mqr19XGpVAmkANTOV/X1ZXVArYzJeo66X0/D+ZVDCjFHbRV4ejuamPt/s/tLk30tyg4xqGJLiwUFfIEwg/8s0HEjbjEQ7yHIlKLUCp5/YrB48cR75DRJ2KU70fdzne+nCFATs/gYN3zA=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2919.eurprd04.prod.outlook.com (2603:10a6:4:9b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 13:16:04 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3088.028; Fri, 19 Jun 2020
 13:16:03 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Julien Grall
 <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: RE: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWN5exllox/cqJUUS0HFcLChNz8ajHt2rggADieACAAAFjAIAVVnEAgACes4CAAHgUgIAADcUAgADl4QCAAAQjgIAAAVWAgAACJ4CAAAHkgIAAAn4A
Date: Fri, 19 Jun 2020 13:16:03 +0000
Message-ID: <DB6PR0402MB2760B7DF20EEDEB32B02191188980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <17a14578-6fc7-925d-6f69-8b2fcbf40ff3@epam.com>
 <9d4a6e78-49d3-01c3-251b-6d66f56c2761@xen.org>
 <ebf32205-55b0-8a40-1935-d3591be058ce@epam.com>
 <d7334aea-363e-49f6-f8c3-336e3c20eb0f@xen.org>
 <424cfbdc-0744-fcf7-5bb4-52aca2357df7@epam.com>
In-Reply-To: <424cfbdc-0744-fcf7-5bb4-52aca2357df7@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [49.72.109.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 54c4c149-85d0-4000-5b17-08d81452eb3d
x-ms-traffictypediagnostic: DB6PR0402MB2919:
x-microsoft-antispam-prvs: <DB6PR0402MB29195D63ADF6329BDE0209A788980@DB6PR0402MB2919.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rj+KAp8p2p15Ue4rDYvbLXbYC2JnchUlxHt9aKm/W1mJPsyPRph7R4krHyRap9J9aLFA91RjGxu5pnMxzTCupj84/c/rHtAyhCGKzzsAgc8BxPkkwvzYAj0MbAoNcil6POAJ/j0CTRMn+5dtSFJhhp4grtivrPIgNI98SnWVHORozWw9GvzzK8xv+PN8gGDU43Yc8QZBFXPoW0e2k3aa11hdDaxeq8u9ZslNSzl2NxL3uJ6zAYNKQ6lEyrfXAr9SUdLP3TyrHpGTiqIdbnymddhU6td6FH0exqUgi4fnfAmpf2u+nz7mJnFFU0Fh/LTtyKtp9wAyXupZRAbiMIHAJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(26005)(52536014)(66946007)(71200400001)(44832011)(66556008)(64756008)(76116006)(66476007)(66446008)(5660300002)(186003)(86362001)(9686003)(4326008)(55016002)(53546011)(7416002)(316002)(8676002)(110136005)(2906002)(478600001)(6506007)(54906003)(8936002)(33656002)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: LlbiR0yH6DnOqvg5z6P+oOWVIISWM8sNWUeY0gldd55nbWWl3kqjx7/BsC3JqBnRV1ZB+l5xyCinI5xXBwQtjNZ/A8MfTEJHSC/RCfEtOtZgmoAcXjJ2aLMQRJiqwWmdhqh47zgfUeeWz8/EPcVpjLwR+03eN+vkK+MUApmA4Naydk+xB5Vcw0u2Hf6Z7sexGmVu23+Yg7LgaeRlH5wmmgWQuB4mYoEwaXKKDowVWgX2noUpbUSRkefetkFbwQBKJW0/qjAkTE4PFPv+oTXMR2RM97zJTuKWY0Icu6qPBDckC18q6FHouovLEBbwhrZejYsQiGDs7GNIodHwFL/mqHfAKXC58vncyp/6K1fZ9y3OZShGG4f9W21Kjwfz9uAzYTnTBo6XTZbUqJvqag8LCByno32ri9MXwFwprktHN5R2cdq9cPlQzO2VuuY+IK7yyaQtbuDsvZhQsXUrRnFA6LU2FwL9shHedMALvRR2eJc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c4c149-85d0-4000-5b17-08d81452eb3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 13:16:03.8156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yv6Cqkee5qJaZtvs4OaJCPrQw5CtU2MB6ap/4UODRWX+v4WQhLxquOya7MfK2VVpfgADNOo657HXE7eUtB53nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2919
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBTdWJqZWN0OiBSZTogVUVGSSBzdXBwb3J0IGluIEFSTSBEb21Vcw0KPiANCj4gDQo+IE9uIDYv
MTkvMjAgMzo1OSBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+IEhpLA0KPiA+DQo+ID4gT24g
MTkvMDYvMjAyMCAxMzo1MSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+ID4+IE9u
IDYvMTkvMjAgMzo0NyBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+Pj4gVGhleSB3aWxsIG5v
dCBiZSBhdmFpbGFibGUgZnJvbSB0aGUgZmR0LCBidXQgeW91IGNhbiByZXRyaWV2ZSB0aGVtIHdp
dGggYW4NCj4gaHlwZXJ2aXNvciBjYWxsIChzZWUgSFZNX1BBUkFNX1NUT1JFX1BGTiwNCj4gSFZN
X1BBUkFNX0NPTlNPTEVfUEZOKS4NCj4gPj4gWWVzLCBhbmQgaXQgdXNlZCBpbiB0aGUgcmVsZXZh
bnQgcGllY2VzIG9mIGNvZGUgKGh5cCBjYWxscykNCj4gPj4+IE9uZSBxdWVzdGlvbiB0aG91Z2gs
IHdoeSBkbyB5b3UgbmVlZCB0byBtYXAgdGhlbSBpbiBhZHZhbmNlPw0KPiBDb3VsZG4ndCB5b3Ug
bWFwIHRoZW0gb24gZGVtYW5kPw0KPiA+Pg0KPiA+PiBXZWxsLCB3ZSBuZWVkIHRvIGF0IGxlYXN0
IGVzdGltYXRlIHRoZSBwZ190YWJsZSBzaXplIHNvIHdlIGNhbiByZXNlcnZlIGFuZA0KPiBhbGxv
Y2F0ZSBtZW1vcnkgbGF0ZXIsDQo+ID4NCj4gPiBPaCwgc28gVS1ib290IGRvZXNuJ3Qgc3VwcG9y
dCBydW50aW1lIHBhZ2UtdGFibGUgdGFibGUgYWxsb2NhdGlvbi4gSXMgdGhhdA0KPiByaWdodD8N
Cj4gQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcgbm8sIHdlIHByb3ZpZGUgYSBtZW1vcnkgbWFwIGFu
ZCB0aGUgdGFibGVzIGFyZQ0KPiBhbGxvY2F0ZWQgYmVmb3JlaGFuZA0KDQpZb3UgYXJlIHJpZ2h0
Lg0KDQpSZWdhcmRzLA0KUGVuZy4NCj4gPg0KPiA+Pg0KPiA+PiBzbyBJIGhhdmUgdG8gcHJvdmlk
ZSBtZW1vcnkgcmFuZ2UgZnJvbSBlaXRoZXIgYnkgY29kaW5nIGEgY29uc3RhbnQgb3INCj4gbG9v
a2luZyBpbnRvIHRoZSBkZXZ0cmVlIGF0DQo+ID4+DQo+ID4+IGh5cGVydmlzb3IgeyByZWcgPSA8
PjsgfS4gSXQgaXMgYSBiaXQgdHJpY2t5IHRob3VnaA0KPiA+DQo+ID4gTG9va2luZyBmb3IgYSBu
b2RlIGluIHRoZSBkZXZpY2UtdHJlZSBzaG91bGRuJ3QgYmUgdG9vIGRpZmZpY3VsdCBnaXZlbiB0
aGF0IHlvdQ0KPiBoYXZlIGZkdF8qIGF2YWlsYWJsZS4NCj4gPg0KPiA+IEhvd2V2ZXIsIHBsZWFz
ZSBub3QgdGhhdCA8cmVnPiBkb2Vzbid0IHJlZmVyIHRvIHRoZSBndWVzdCBtYWdpYyBwYWdlcy4N
Cj4gSW5zdGVhZCwgaXQgcHJvdmlkZXMgYSByZWdpb24geW91IGNhbiB1c2UgZm9yIG1hcHBpbmcg
dGhlIGdyYW50LXRhYmxlIGZyYW1lcw0KPiANCj4gSW5kZWVkLCB0aGlzIGlzIGluIG15IGNhc2Ug
MHgzODAwMDAwMCwgYnV0IHRoZSBtYWdpYyBpcyBhdCAweDM5MDAwMDAwDQo+IA0KPiBTbywgSSBu
ZWVkIHRoZSBtZW1vcnkgcmFuZ2Ugc2V0IHVwIGJlZm9yZWhhbmQsIGJ1dCBJIGNhbid0IGFzIHRo
ZXJlIGlzIG5vIGN1dGUNCj4gd2F5IHRvIGdldCB0aGF0Lg0KPiANCj4gT2YgY291cnNlLCBJIGNh
biBpc3N1ZSBhIGh5cCBjYWxsIHRvIGdldCBIVk1fUEFSQU1fQ09OU09MRV9QRk4gYW5kIHVzZSBp
dA0KPiBhcyB0aGUgYmFzZSBhZGRyZXNzLA0KPiANCj4gYnV0IHRoaXMgc21lbGxzIGxpa2UgYSBo
YWNrLiBJIGNhbiBjYWxsIG90aGVyIEhWTV9QQVJBTV8gdG8gZ2V0IHRoZWlyIHBmbnMgYW5kDQo+
IHNldCB1cCB0aGUgbWVtb3J5IHJlZ2lvbnMsDQo+IA0KPiBidXQgdGhpcyBsb29rcyBhIGJpdCB3
ZWlyZC4gSSBuZWVkIHRoYXQgY29uc3RhbnQgYmFkbHkgOykNCj4gDQo+ID4NCj4gPiBDaGVlcnMs
DQo+ID4NCg==

