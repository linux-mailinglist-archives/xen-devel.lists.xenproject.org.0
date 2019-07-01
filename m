Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CD55BC25
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 14:53:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhvlh-00035X-Ia; Mon, 01 Jul 2019 12:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QKbV=U6=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hhvlg-00035S-3K
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 12:50:48 +0000
X-Inumbo-ID: d6764ec0-9bfe-11e9-b93d-1bb673faf843
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.127]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6764ec0-9bfe-11e9-b93d-1bb673faf843;
 Mon, 01 Jul 2019 12:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQTo4IBkAFBlgiMvaRPEpPpTBZH+OMHOZp+1C1cK2qM=;
 b=hcOUHyUNZ5M6jm1b3nD3YEfwSgCLk/Io+Gy0mOrxWciPvDYv1ivmiXWo0VB2tv03vKmyKUTBwLq/x5A/dAwUyYzvoupwxmvljfKMTyEnfuA3OnN6NeoVCV34g5vKxPPMBPzHsLb/hgCoQqWGFF2dxQItxZ6Dg8JVKoRTpgIEvI4=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2847.eurprd02.prod.outlook.com (10.171.102.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 12:50:40 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3%4]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 12:50:40 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] x86/hvm: make hvmemul_virtual_to_linear()'s
 reps parameter optional
Thread-Index: AQHVMAR4OjWE2hDEnkaj7tfjtET7f6a1tx+A
Date: Mon, 1 Jul 2019 12:50:40 +0000
Message-ID: <bdeed557-f34b-f4a7-6cac-3f24c5ec2fb0@bitdefender.com>
References: <b31e57d7-0fff-ea12-ac47-191e88ff460d@suse.com>
In-Reply-To: <b31e57d7-0fff-ea12-ac47-191e88ff460d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0136.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::28) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 589a98aa-7457-4fcc-4b21-08d6fe22b8ba
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2847; 
x-ms-traffictypediagnostic: VI1PR0202MB2847:|VI1PR0202MB2847:
x-microsoft-antispam-prvs: <VI1PR0202MB28477A36A013455910A61A60ABF90@VI1PR0202MB2847.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(366004)(136003)(39860400002)(346002)(189003)(199004)(76176011)(5660300002)(478600001)(71190400001)(71200400001)(66066001)(486006)(4744005)(4326008)(2616005)(11346002)(476003)(99286004)(446003)(66476007)(66556008)(316002)(8676002)(66446008)(81156014)(81166006)(64756008)(3846002)(102836004)(110136005)(54906003)(86362001)(73956011)(8936002)(6116002)(6246003)(6436002)(66946007)(186003)(52116002)(14454004)(6486002)(2906002)(31686004)(7736002)(26005)(6512007)(36756003)(2501003)(256004)(229853002)(53936002)(305945005)(68736007)(31696002)(386003)(6506007)(25786009)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2847;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5jKfdrQ1pfaFzcIgB5jDroB5wgut3tZwsQeAZch6VwIaVTVUMH7v6RkFitmDN/uaianb/Hx5ky/KgDPicE3dXVDrSTwsOTSgu6ooOA2pq0JEDYSUSRdB76wNebRACwjPAmiGu98IncZBAXDOZje8R+K0XfYFP/NsbzRm9gcbO/zxbehT0qp2s5X3VB6mqUs6H8IAuKhh8yuX0SczsYvCzrud9i3qNg1V57j/w3RhWdgTRgrCkvmLjJVBEtb59cSWdkKHdE4Qz6iwWSH/ulUbcj+tp4+9HFQKhcMDiRI3jfUqjJo3sTX6O/ZAC78nFQ2a+V3RTOiyBqdBYk9zgsZHomJjol/56yuhHebHktoAvC+FcAiQ3BrfWEuC9K3D3PRVTB3gduSChrArfH7TmuLhep9ixG5cHVAYTtQf65aV4EM=
Content-ID: <083345268E6A2445826DA0098B985130@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589a98aa-7457-4fcc-4b21-08d6fe22b8ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 12:50:40.3785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2847
Subject: Re: [Xen-devel] [PATCH] x86/hvm: make hvmemul_virtual_to_linear()'s
 reps parameter optional
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlZnVsIHBhdGNoLCBnbGFkIHRvIGhhdmUgaXQgb24gdGhlIHRhYmxlLg0KDQpPbiAwMS4wNy4y
MDE5IDE0OjU5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gQSBtYWpvcml0eSBvZiBjYWxsZXJzIHdh
bnRzIGp1c3QgYSBzaW5nbGUgaXRlcmF0aW9uIGhhbmRsZWQuIEFsbG93IHRvDQo+IGV4cHJlc3Mg
dGhpcyBieSBwYXNzaW5nIGluIGEgTlVMTCBwb2ludGVyLCBpbnN0ZWFkIG9mIHNldHRpbmcgdXAg
YSBsb2NhbA0KPiB2YXJpYWJsZSBqdXN0IHRvIGhvbGQgdGhlICIxIiB0byBwYXNzIGluIGhlcmUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoN
ClJldmlld2VkLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4N
Cg0KPiAtLS0NCj4gTm90ZSB0aGF0IHRoaXMgY29uZmxpY3RzIHdpdGggYWRkaXRpb25zL2NoYW5n
ZXMgbWFkZSBieSAieDg2ZW11bDoNCj4gZnVydGhlciB3b3JrIi4gV2hhdGV2ZXIgZ29lcyBpbiBs
YXRlciB3aWxsIG5lZWQgcmUtYmFzaW5nLg0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
