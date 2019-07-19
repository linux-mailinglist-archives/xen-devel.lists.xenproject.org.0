Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931196E350
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 11:21:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoP2f-00063L-2L; Fri, 19 Jul 2019 09:19:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoP2d-00063G-B0
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 09:19:03 +0000
X-Inumbo-ID: 3bf4675e-aa06-11e9-aab6-5fd71de8ceb8
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bf4675e-aa06-11e9-aab6-5fd71de8ceb8;
 Fri, 19 Jul 2019 09:18:57 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 09:18:52 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 09:18:39 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 09:18:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFZdcdDZlS5hoDl5Bdwf786yyxYE+/g7ioWhckmcgH3AjAOTOEs5psSECu7l1oDgNW7GutJup4Et3MfG1mXHAdayIdf7JkDOPk1QQVfhgPTMI9QU4ddxZgzcrtoiSlt9Oste7XOe2o/mP0BIhpjXzUGztDEKEN2uwKEYdEPv2XJCBuCo3LWQ4OS5IyzRZZEhjaCAiBWKeq0VEHgwpWWMrYFL7WJ2VZRv/ckclJ9zt4db6uzsqM6YhCb/3tj2lq8vuC+6jDnnPfle1/sW4a29Pi8KaLeoFYE7zEUVWkPNr5bWu1jNvkyFerUfA4hNnWAFgvq5mP9TPca0sSUmryN0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUruGD6hj3uefEcQWStlh8gh2a5qms0HXTQB/3ccb2s=;
 b=iZxyhUvKmGA5zl6C3Gytw1csfgS4MU4EsoZL5UpXnb25h0T+stMgnXFIYos1BfGHtBp0us5Rm8PPSiaTn6quB360HQudM70LVEOmzG/3e/9SOixYSs7zm3aScHrY0fR/BKWTgFIX5a7m16GFVNDVYUBYn1ouwlnfuXPQWC58hF+8bfHUL+IhOcA6bRZB7aWwCfELFyBnH2t5EA2aEXMlP+LiFIPVHtsPS5GIvpITEQYAIg6SuDhmyOG1c5UKvk/cr2Cc4qU75Bu8gTtDpICOYZmepTEQHBro9cvqoGubDNvOWQEEFbJ7rFED1xB8+gWFoY5pRYYD2Hx8AoQYlz+V2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2475.namprd18.prod.outlook.com (20.179.104.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 09:18:38 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 09:18:38 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/2 RESEND] CODING_STYLE: explicitly call out label
 indentation
Thread-Index: AQHVPhLyGXH0Q4NjDEWXJddchwyDaA==
Date: Fri, 19 Jul 2019 09:18:38 +0000
Message-ID: <7072cc5e-8137-762b-53a1-c4a80d19ff08@suse.com>
References: <f1a5d1b0-564e-8f04-f43e-f5c68466751b@suse.com>
In-Reply-To: <f1a5d1b0-564e-8f04-f43e-f5c68466751b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0d2d5a4-6128-4632-ce66-08d70c2a1554
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB2475; 
x-ms-traffictypediagnostic: DM6PR18MB2475:
x-microsoft-antispam-prvs: <DM6PR18MB247594604DF27F02DAD3FF17B3CB0@DM6PR18MB2475.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(189003)(199004)(52116002)(81156014)(81166006)(14454004)(4744005)(6916009)(4326008)(80792005)(186003)(5660300002)(31696002)(66066001)(6512007)(478600001)(66946007)(2906002)(66556008)(66446008)(64756008)(66476007)(54906003)(86362001)(316002)(6486002)(6436002)(446003)(68736007)(11346002)(305945005)(8676002)(3846002)(476003)(2616005)(5640700003)(2351001)(99286004)(71200400001)(71190400001)(7736002)(8936002)(31686004)(36756003)(486006)(76176011)(102836004)(6506007)(386003)(6116002)(26005)(53936002)(25786009)(256004)(2501003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2475;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j30iyvxu0G57vZ03+AvhouXY5IbUisKcTC7sSTh+UVAtTsSSQiy30pPcQQgkAvVk/7AxIrAgsFTgr3V346nBNs4PtFfmhYBHjTLvEBKH8a7sgdUrQbGgd2r3Zh58+fSPyLP3TUNQkMhZOaYLe+dRs6azZZ1zLisbMc3LxcsQYaxjgv49Lh+O0oOpBjrLr5qzrgJzOpTqiGQxRcUECzGQ8Flz2HWr3B4r9z7YkBM6dPTiHLNjSZe3V3Hz9T19UfxBJhgmFyQOQzwuVQVzIcfQgPJPJEOMpl1sHU5KQEYGE3NH5ohsAXGxOYsz44yDP94y8R2GE3MuIXGMiyAlrgEzeqOxZj2PZQkw1qaqnAcZWQ4OPXW+ai3HT74y8K3151p9Od37HvARw1T7hVz+rt1MURtw9MunqoWb25wUFzwaCLE=
Content-ID: <7BE2001B7426BC47AE98267D77F33588@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d2d5a4-6128-4632-ce66-08d70c2a1554
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 09:18:38.4002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2475
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH 1/2 RESEND] CODING_STYLE: explicitly call out
 label indentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, JulienGrall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgdGhlIGJlaGF2aW9yIG9mICJkaWZmIC1wIiB0byB1c2UgYW4gdW5pbmRlbnRlZCBsYWJl
bCBhcyBjb250ZXh0DQppZGVudGlmaWVyIG9mdGVuIG1ha2VzIGl0IGhhcmRlciB0byByZXZpZXcg
cGF0Y2hlcywgbWFrZSBleHBsaWNpdCB0aGUNCnJlcXVpcmVtZW50IGZvciBsYWJlbHMgdG8gYmUg
aW5kZW50ZWQuDQoNClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCg0KLS0tIGEvQ09ESU5HX1NUWUxFDQorKysgYi9DT0RJTkdfU1RZTEUNCkBAIC0zMSw2ICsz
MSwxMCBAQCB2b2lkIGZ1bih2b2lkKQ0KICAgICAgfQ0KICB9DQogIA0KK0R1ZSB0byB0aGUgYmVo
YXZpb3Igb2YgR05VIGRpZmZ1dGlscyAiZGlmZiAtcCIsIGxhYmVscyBzaG91bGQgYmUNCitpbmRl
bnRlZCBieSBhdCBsZWFzdCBvbmUgYmxhbmsuICBOb24tY2FzZSBsYWJlbHMgaW5zaWRlIHN3aXRj
aCgpIGJvZGllcw0KK2FyZSBwcmVmZXJyZWQgdG8gYmUgaW5kZW50ZWQgdGhlIHNhbWUgYXMgdGhl
IGJsb2NrJ3MgY2FzZSBsYWJlbHMuDQorDQogIFdoaXRlIHNwYWNlDQogIC0tLS0tLS0tLS0tDQog
IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
