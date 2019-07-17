Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC876BB37
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 13:16:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnhsp-0004B2-Ud; Wed, 17 Jul 2019 11:14:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3fL=VO=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hnhso-0004Ax-9V
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 11:14:02 +0000
X-Inumbo-ID: f9c975bf-a883-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.138]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f9c975bf-a883-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 11:14:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NM93C0XWw0P7U1tJC6al8LEVYlVqkBuAI+GJdwkdXXIvgDXkQYqzFTQQZg/gcnKfy6nZavwZOSlgSXHyn91NB4AndbMBahwXBubgqLOCdUAJBpbmCB4IKgVYNg40NpoKBiizY1vvtaa19lu5N5cB6Ilh5srQcLXtPDR/WudfUPl+ry4lBIPdGp2oXC3J0ZoBwfGi6T4pwk6mcFRIlAe5rnn3EuTIxgDnpW7h2jt0bbCorXEG8jpOXKYGY4gk8qAvRsnFAvJcUdO7z3S7nikY760dLSrjuO8+aiWJ5HOK2QZMCRVcAuA0nrlXD+WonG+UlGS4UL03u2JE1ZKxYj7jtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTqAm44VLDhqHIoXOyZZh7w6Edf9U+5rqctb+ym7Uas=;
 b=BwmJxlel79BUvlb+dRA3dHVe8ctIMv/wjIc4s7dqX2OAAmgTq0e9rWs9IrheDamT1M/+17bAR0YsmTsqSNpuIRuvOYifhtzrJWa9zxWVbwB140P+SMmtI64Invxd3vTHJtjTtRiJaqO8gVQOGhj15lsRVw0t0V37NI8VxB5VNPug4L31K159975NbljBQxkZnGZQulEDe5hmZ3GqDElEyUCycJ+mM8f/zQm/tSCAQ59vT7DYv0zB42/LfkH8cQDAG0BLUUUyaE/4TQCWMuUaa7PkchHcC48h65SN6d9RBW6MfASisi8cKWThSBlaQQW2ri0dKPVpbZ0aljULP5q8Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTqAm44VLDhqHIoXOyZZh7w6Edf9U+5rqctb+ym7Uas=;
 b=WsuDBTsuNa4g3AIxnQ01agjGjLEcX6//E1LJaxpoRYDPjXUqEvM1c/UrzQniDU47FFRkuBPoJXwPSMFjE5QcFFuHOs0t4+LqPGsFbxOoNJNRXixizG88aEGmjLU4Fit9dVXOi766WmrHOwM1wwn8GQ6ubAN8QEAzHCbOza/mt7Q=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2846.eurprd02.prod.outlook.com (10.171.108.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 11:13:57 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03%8]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 11:13:57 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 04/10] vm_event: Simplify vm_event interface
Thread-Index: AQHVO/jscQ7S3nXJr0+glNLMU2FtHabOqX4A
Date: Wed, 17 Jul 2019 11:13:57 +0000
Message-ID: <f7123f4a-b0fa-ddea-e3fc-a11d64f66530@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <46863526d6b28433a75914399d52954c4ca19950.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <46863526d6b28433a75914399d52954c4ca19950.1563293545.git.ppircalabu@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::18) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a9e4208-e9cb-40b1-3ac1-08d70aa7dc52
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2846; 
x-ms-traffictypediagnostic: VI1PR0202MB2846:|VI1PR0202MB2846:
x-microsoft-antispam-prvs: <VI1PR0202MB28464DB4612D6D92956B1A19ABC90@VI1PR0202MB2846.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(376002)(396003)(39860400002)(366004)(189003)(199004)(486006)(476003)(31696002)(316002)(6486002)(25786009)(26005)(14444005)(256004)(68736007)(6512007)(102836004)(31686004)(66476007)(11346002)(446003)(66446008)(66556008)(2906002)(2616005)(6506007)(64756008)(386003)(4744005)(71190400001)(71200400001)(86362001)(2501003)(53546011)(66946007)(5660300002)(107886003)(36756003)(76176011)(3846002)(6116002)(305945005)(66066001)(7736002)(81156014)(81166006)(8676002)(110136005)(54906003)(6436002)(14454004)(8936002)(99286004)(478600001)(52116002)(186003)(229853002)(53936002)(6246003)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2846;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UM+efCY8RGARlwssjopWA+Ds7AjQyvaEOf7hu7NwTYjcGBsNyJAqjNwQBmni5EcON7qOiPsaQT+H/ISfygBljmlkTEa8VcA/aWYNWqlZAYWLetH02v5G5Z4jMNsz1oF4WlGcLiRW1SBh+i6eakRoW3UGX/DkKLQDSSELsYda1T0zD5FoY9F7jHhunYRXG6Ql4mbZR+WJyWdcoQMnd79gBjPsLd4Px3uKTHBFwFqiqSP0RSS6Xvi0+ZKEzOSWUrrxlVemeOsiQqF2z2lhKfY9A6hT7doXmou0CedesfMtc7N5uJ06ckze7BlMGllf4EZOU0QIxH2D577yo9I0MsHDEQtsB21DRp8lEgS2ZP2hIYLuDBONEwVTtaikoAed9oQAO1w/7klIbmHgRPBeqyBEsBwQAv/RtnLu9n/UkfpHGDw=
Content-ID: <E59447B297683D44BAD467E69FA83D48@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9e4208-e9cb-40b1-3ac1-08d70aa7dc52
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 11:13:57.1599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2846
Subject: Re: [Xen-devel] [PATCH v2 04/10] vm_event: Simplify vm_event
 interface
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE2LjA3LjIwMTkgMjA6MDYsIFBldHJlIFBpcmNhbGFidSB3cm90ZToNCj4gUmVtb3Zl
IHRoZSBkb21haW4gcmVmZXJlbmNlIGZyb20gY2FsbHMgdG8gdm1fZXZlbnQgaW50ZXJmYWNlIGZ1
bmN0aW9uDQo+IGFuZCB1c2UgdGhlIGJhY2twb2ludGVyIGZyb20gdm1fZXZlbnRfZG9tYWluLg0K
PiANCj4gQWZmZWN0ZWQgZnVuY3Rpb25zOg0KPiAtIF9fdm1fZXZlbnRfY2xhaW1fc2xvdCAvIHZt
X2V2ZW50X2NsYWltX3Nsb3QgLyB2bV9ldmVudF9jbGFpbV9zbG90X25vc2xlZXANCj4gLSB2bV9l
dmVudF9jYW5jZWxfc2xvdA0KPiAtIHZtX2V2ZW50X3B1dF9yZXF1ZXN0DQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPg0KDQpS
ZXZpZXdlZC1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
