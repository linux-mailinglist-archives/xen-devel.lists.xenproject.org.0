Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7F4E5E03
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 18:03:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOOUD-00046j-FI; Sat, 26 Oct 2019 16:00:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oLo/=YT=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1iOOUC-00046e-3n
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 16:00:16 +0000
X-Inumbo-ID: b0decae0-f809-11e9-8aca-bc764e2007e4
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.128]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0decae0-f809-11e9-8aca-bc764e2007e4;
 Sat, 26 Oct 2019 16:00:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1otJN+i7K0IxPTp2SCLIOq9kfQBHebWl22BsdIOwO+lfeH3HvABUe3d6tlAMdQ4/+cNakZnOlOc0PsWtQq/vZzOe5QA1ZzK0+G70UXd16ynS5AoKbaqHcm6eXSOzw+Dhs66i26GgG+DCsQxno+1afyzftiw5d3+yHVIxy3CNMwsbNOBZVL99e4B8xnhIdxYEyTbJzagweIXzhiG7P05HfWBI/aCnEmEcv1rXbsTdowfcLrfastHSgg4FX0czRcVPcfimU/quW+kbONZNJnkawQ70uV4cqXf/LKrzJisOV8WfJfUr5pEoAAHzvW7EEtUtvGAjwLhflG4HTfTsVLaDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDh311AR5C3UO3ZDVJ9QMlXyM7NV0b5DJFHLXoKiWdQ=;
 b=DR/n6q1hvViLiyH2dhRQVd48nUk33D9ddCbn0nAUfe4ju3c2l2MTaKQep5GehM80KOC72TpMjC6+ii1fwOlnwSsis8eI4dhPVbNyemXqR5nyK1GpFQN5np0sb7+lLTQ/Ja4Ij42HhXCeuHGaBeLpJIKwUT2EbbJJpTMCX2BoFNrWivJgX434MK+0C6Ti27Gfs253ByekLUxC2k9Et3VaBFkY3RLscmF/VJv6kBdGrj5ijJQJT1695yFgqjL2pAAzQokYKQtGGtE8o/tdVHmCtIrgFugWA5B2Afc5rU0qV2R2kJZCPz1vCmpQZgxwD5Fr3QwHao+MV8c8onV5MQb6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDh311AR5C3UO3ZDVJ9QMlXyM7NV0b5DJFHLXoKiWdQ=;
 b=glfT0ssI2oUc/PbIYZhm2en/n5w4E89kZ6qhNB4szn3CTLHD+1g6X7j4sku3yzbb0923OeS/84RyHBQINl6uhWm6x6kM604iBXVKqg8Hs9EXoRE+SVNJ8zH5+Fhs9kyty+sLSoAHkqhlK4Cws/642KdtfGZD8+IHfAyWp7qK/As=
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com (20.177.200.18) by
 VI1PR06MB5982.eurprd06.prod.outlook.com (20.178.124.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Sat, 26 Oct 2019 16:00:10 +0000
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::d067:c8d1:e873:5632]) by VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::d067:c8d1:e873:5632%5]) with mapi id 15.20.2387.021; Sat, 26 Oct 2019
 16:00:09 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: Steven Haigh <netwiz@crc.id.au>
Thread-Topic: [XEN PATCH 0/3] read grubenv and set default from it
Thread-Index: AQHVi4bTyBvpbwXj3ku6LOJzISE5YqdszMAAgABJEAA=
Date: Sat, 26 Oct 2019 16:00:09 +0000
Message-ID: <alpine.LFD.2.21.1910261644150.2712@austen3.home>
References: <cover.1572038720.git.m.a.young@durham.ac.uk>
 <1572089916.2390.0@crc.id.au>
In-Reply-To: <1572089916.2390.0@crc.id.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.21 (LFD 202 2017-01-01)
x-originating-ip: [2a00:23c4:921a:2100:1097:224c:243b:f186]
x-clientproxiedby: LO2P265CA0260.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::32) To VI1PR06MB4720.eurprd06.prod.outlook.com
 (2603:10a6:803:90::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-x-sender: michael@austen3.home
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3eccd0fc-e4b1-45f7-e5ea-08d75a2d93d3
x-ms-traffictypediagnostic: VI1PR06MB5982:
x-microsoft-antispam-prvs: <VI1PR06MB5982C2A162F20A3B0EC010F387640@VI1PR06MB5982.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0202D21D2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(189003)(199004)(486006)(5660300002)(4744005)(36756003)(386003)(76176011)(4326008)(2906002)(99286004)(52116002)(54906003)(58126008)(786003)(316002)(66476007)(11346002)(46003)(66946007)(66556008)(66446008)(64756008)(446003)(6246003)(186003)(102836004)(476003)(6436002)(6116002)(9686003)(6506007)(6512007)(6486002)(478600001)(8676002)(81166006)(229853002)(81156014)(256004)(8936002)(7736002)(305945005)(14454004)(6916009)(71190400001)(71200400001)(25786009)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB5982;
 H:VI1PR06MB4720.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8GUys2iNGGdRDwgWIApylIx8JbzdUeIYreF+/IWwFngwy/X28AgLUdxLChwF88qimsdWOsXz2isrwLFN7Sg9IikAiGtQI6+UMvcctB8Q1gm1AHz0Ro6p49dtFUmgMefg2Q4OT3DWmcxwTBk6sX19q5W5Buz1GNbHGdKFImmARJyvpJbfkZVzk83IVEYT4LBHamYBA/6gfzh1a5XPmc8in7d27ZLXPvpl1+ONI9d8Dhukzb5CO4HBcjV5NfmFoJiB5FPPwve4lP1zkx3TZ+u+hH20ZgiFLm5c7GZakyzz1bBHgzvQ+G5NSbrI81h52LJYOG63xLPuuM02rwcmsHPX6EWSkxV5qA7Yupe3tjd43BjWplbtCQWcZoDKV5ig4PuU0X+1ZXCgv71RFzsS+px1h4wdgmIvseMg4NmdBhyF8Tyu7iKvzvNPNhhY46958iXu
x-ms-exchange-transport-forked: True
Content-ID: <A56C80E472C044408594806038E38F36@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eccd0fc-e4b1-45f7-e5ea-08d75a2d93d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2019 16:00:09.8609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c96YhLrfP2QC7CDtWxBs/tKuOElkyHU68QvhmNk6c0NPm+GFjYVNLHys88fDXjSILlOhl2hfl8cOcRKjzHnT8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5982
Subject: Re: [Xen-devel] [XEN PATCH 0/3] read grubenv and set default from it
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCAyNiBPY3QgMjAxOSwgU3RldmVuIEhhaWdoIHdyb3RlOgoKPiBJZiAvIHdoZW4gcHln
cnViIGlzIGFibGUgdG8gcHJvcGVybHkgcmVhZCBhbmQgYm9vdCBmcm9tIEJMUyBiYXNlZCAKPiBj
b25maWd1cmF0aW9ucyAoSSdtIG5vdCBzdXJlIGlmIHRoaXMgcGF0Y2hzZXQgbWFrZXMgcHlncnVi
IEJMUyBjb21wYXRpYmxlLCBvciAKPiBqdXN0IGZpeGVzIHRoZSBleGlzdGluZyBpc3N1ZXMpIC0g
YnV0IHdlIGNhbiBsb29rIGF0IHJldmlzaXRpbmcgcmVtb3ZpbmcgCj4gdGhlc2Ugd29ya2Fyb3Vu
ZHMgZnJvbSBhbmFjb25kYSAvIGdydWIyIHBhY2thZ2VzIGluIEYzMCAvIEYzMSAvIFJhd2hpZGUu
CgpUaGUgcGF0Y2hzZXQgZG9lc24ndCBhZGQgQkxTIGNvbXBhdGliaWxpdHkgYnV0IHNob3VsZCBi
ZSB1c2VmdWwgZm9yIHdoYXQgSSAKZXhwZWN0IEJMUyBzdXBwb3J0IHRvIGxvb2sgbGlrZSAoSSBo
YXZlIGEgaWRlYSBvZiB3aGF0IHdvdWxkIGJlIHJlcXVpcmVkIAp0aG91Z2ggSSBoYXZlbid0IHdv
cmtlZCBvdXQgdGhlIGRldGFpbHMgeWV0KS4KCiAJTWljaGFlbCBZb3VuZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
