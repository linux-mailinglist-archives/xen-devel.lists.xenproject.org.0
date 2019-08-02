Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7577FB67
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:45:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htXpc-0002Q6-A9; Fri, 02 Aug 2019 13:42:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htXpa-0002Pz-OJ
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 13:42:50 +0000
X-Inumbo-ID: 6a1098ec-b52b-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6a1098ec-b52b-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 13:42:49 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 13:42:47 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 13:41:04 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 13:41:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4hAzlEj4UPtxwadxJ9LHPKGniWzQzmWrgLReXeVlp/7R7XdeO4EjbOIdN32mck3js2VQ5re5mcsywhuOUBZt64V0X0xH2RDsABowgNYmmr0lMLWFWu2uK7n7HfDkd7n85QcbqQQnLpP254u17Jn6gJeD/WfGvzvOCkr3NCbY7ZkkEqLR60VQK0H+h3BXMexgv4Q7mFsh4BOCif+4J/ieJ0QGpF6yYGxBWVPx6MdoyjRM62qYzWjdDPaxOz4niy0K6BptQboqUF9EE1oFWk9JKjDMXS/Zc1S+dINZqXOLqXY1zMue5d3zn5Uy37yMBtUyYlQ65pigVFRo1Lf/Qymdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10Yvrmoj7gEFHwEZfK0OMgxIUv7ZuAHcPul75pjcY0M=;
 b=SyYzWCnpkExhkON9aJaA05Yb2VFjr6AH1JWOP6oYJQPCZPvjP/Hap3Sq1BbmU+2GgIr8jj3RE1t2a0S18XAlS5toyG3oUY3kp882FqA7GXkm5GpL31zZsH4tdyy2SGFxcRgr+iS03zVzyLJ7OiiTBQ45a5ze89YzXvEd0pTLnuw10QGUYV++QHRm87xgfDrWBAKbowT0qv3JT+mhKlJ3fuClT4PRsAORrbtIBUzeyj7RNzqEBl2Ppibw0XvrMMJ7KMZmZWH0XDlAEvjm0TRZYvalDotNNNscXy+keN4SxTUjSmK+/0T6StEfvEtztuL+frRqBN5nadmzytDmcfIHtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2665.namprd18.prod.outlook.com (20.179.106.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Fri, 2 Aug 2019 13:41:03 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 13:41:03 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 05/16] microcode/amd: distinguish old and mismatched
 ucode in microcode_fits()
Thread-Index: AQHVSTft0Jn4EtXTWU+qyZHe+cUhLQ==
Date: Fri, 2 Aug 2019 13:41:03 +0000
Message-ID: <1d86021b-50d6-d53b-fd35-83b0e69bd24f@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-6-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-6-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0101.eurprd07.prod.outlook.com
 (2603:10a6:207:7::11) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e53eb3fc-533c-4a34-7dd9-08d7174f0ff2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2665; 
x-ms-traffictypediagnostic: DM6PR18MB2665:
x-microsoft-antispam-prvs: <DM6PR18MB2665A4BD572E7A387BD651FDB3D90@DM6PR18MB2665.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(199004)(189003)(31686004)(316002)(54906003)(71200400001)(71190400001)(256004)(476003)(2616005)(11346002)(446003)(486006)(99286004)(80792005)(76176011)(52116002)(6116002)(3846002)(6246003)(4744005)(53936002)(6436002)(6512007)(66946007)(66476007)(2906002)(26005)(66446008)(386003)(68736007)(25786009)(229853002)(4326008)(53546011)(6506007)(102836004)(478600001)(186003)(86362001)(6916009)(6486002)(66556008)(64756008)(66066001)(5660300002)(14454004)(8676002)(36756003)(81156014)(305945005)(81166006)(8936002)(31696002)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2665;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wmc8Htne1sEEMmmTgmrDc26Bk8L5cZGGLHtqy+DobPR5GHBlPLcPIMWYZW5E0N+tcX8ryhKLjNeBiu23cwi/fh37KMCT1tw2iYuoYpMA8IK0c/8W0LTfUEkAQ0J3bkvRFlLD5JmvC5bGiJ+GcIIc0cucjdOV0yNYJhKY4ANL8+choLGZLq5VLuMhbbojT7OY6S/KnZltVgfP1RzX8hTRITTcMqtizLeGHM4qbA/GaeSoRaH8k4JTqInzjEVB1lX9zlSQvA6o4UPxRbr65wxShgukB4tYRcwjwHCEk8Q5kjDtC1SktJYS9DOD0wmRBnGLloCrO6owKf0dt2SMF+IV5jjL7OXjynhumv1vq4avk542IyTgl+qwwc3nndiKE9t4N4qICjOggLTRDUCVn1IsBBV5+yao2d7vLihXcWRhgAg=
Content-ID: <F2E6D977DDFF4540AB6CFD5C296BC299@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e53eb3fc-533c-4a34-7dd9-08d7174f0ff2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 13:41:03.5219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2665
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 05/16] microcode/amd: distinguish old and
 mismatched ucode in microcode_fits()
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
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IFNvbWV0aW1lcywgYW4gdWNv
ZGUgd2l0aCBhIGxldmVsIGxvd2VyIHRoYW4gb3IgZXF1YWwgdG8gY3VycmVudCBDUFUncw0KPiBw
YXRjaCBsZXZlbCBpcyB1c2VmdWwuIEZvciBleGFtcGxlLCB0byB3b3JrIGFyb3VuZCBhIGJyb2tl
biBiaW9zIHdoaWNoDQo+IG9ubHkgbG9hZHMgdWNvZGUgZm9yIEJTUCwgd2hlbiBCU1AgcGFyc2Vz
IGFuIHVjb2RlIGJsb2IgZHVyaW5nIGJvb3R1cCwNCj4gaXQgaXMgYmV0dGVyIHRvIHNhdmUgYW4g
dWNvZGUgd2l0aCBsb3dlciBvciBlcXVhbCBsZXZlbCBmb3IgQVBzDQo+IA0KPiBObyBmdW5jdGlv
bmFsIGNoYW5nZSBpcyBtYWRlIGluIHRoaXMgcGF0Y2guIEJ1dCBmb2xsb3dpbmcgcGF0Y2ggd291
bGQNCj4gaGFuZGxlICJvbGQgdWNvZGUiIGFuZCAibWlzbWF0Y2hlZCB1Y29kZSIgc2VwYXJhdGVs
eS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+DQoN
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
