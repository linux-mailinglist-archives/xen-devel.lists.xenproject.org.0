Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6827FD6F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:23:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZMU-0001yE-E8; Fri, 02 Aug 2019 15:20:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htZMS-0001xu-UD
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:20:52 +0000
X-Inumbo-ID: 18c6f52e-b539-11e9-940e-43a8fd37c937
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18c6f52e-b539-11e9-940e-43a8fd37c937;
 Fri, 02 Aug 2019 15:20:48 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 15:20:38 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 15:15:32 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 15:15:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oV83W670QkXLfZXfbF8L2xiJZyOhGjF9cADNQ6CfcuMF/fhd6RoA4IqCXUU27M+jekS8l7o0TfeT3hwRYkxP9gswL49u6+H7GOl+xYEzelAMcPsHee0awDIKzrboe8d7nkWJXFHzFbsTby4SkvbipjQB7+bTsTfZk+Xkfa/2anmaVhJEwgE8DpEHW6fXbUZ6UqSw2WrNkSNXA1vuvCLsCHau0mXECAq0ks2lmwfjVBh69FhD8xwSDmmXgO41ptqe5Yvvk1kiCSb61nTGy1K0dpwktLFPRVDmGhLlNEHtcUatA3Xt3b0WSbdszCD1TlfeaJPGnfJUODbt0hdnxeSluQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mUCAWcZpC7HLwu1Ft0sME9+Tp+9Iedz39qeBDra5Vc=;
 b=CIe3Js0VJBvDWtAhtTx1fgnZoEIRmq2br2VmamcXq+HMFT2GxCn7SKyDy5wfGiPP7FzSwvsthovzHin6c45gy5SuCAKgnqzaR0C7jAxh266fxa3k8UXSiQLYhc2P92DGCAVr2Dae9hUVWbNcJ7qwCQasXvQbKw3oImMaKfHw3c5n/R8Qp3/SOa0uoaFejSIXUSvJGoPfdzE5RCd+5IAZ33EWB0ptlAGkjonqqW1cVf1FkBB/0yDrwVDoZ+Ky0BPBdGF3JtQx7j1ltlf5SkPB7dWDIc2zQm4By9YIKaeV2l0fNFVFfXaFqAQptF4xQTRE5uXQPnnAcL1tyUR6ucKECw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2684.namprd18.prod.outlook.com (20.179.107.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Fri, 2 Aug 2019 15:15:31 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 15:15:30 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 09/16] microcode: remove pointless 'cpu' parameter
Thread-Index: AQHVSFKee/zhap9hQ0ak0CrSHglRmabn+ZYA
Date: Fri, 2 Aug 2019 15:15:30 +0000
Message-ID: <24dd3074-b795-9dcc-3145-c8754040449b@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-10-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-10-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR1PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::25) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05001fa9-02d7-4330-8ea1-08d7175c41c2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2684; 
x-ms-traffictypediagnostic: DM6PR18MB2684:
x-microsoft-antispam-prvs: <DM6PR18MB2684A7A612418D58969D2C3BB3D90@DM6PR18MB2684.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(189003)(199004)(256004)(71200400001)(71190400001)(25786009)(8676002)(53546011)(6506007)(386003)(6116002)(8936002)(81166006)(81156014)(3846002)(14444005)(486006)(478600001)(476003)(316002)(446003)(53936002)(86362001)(2616005)(6512007)(31696002)(52116002)(80792005)(54906003)(11346002)(14454004)(76176011)(99286004)(102836004)(6486002)(186003)(26005)(2906002)(6916009)(31686004)(68736007)(4326008)(6246003)(6436002)(229853002)(36756003)(7736002)(305945005)(66446008)(64756008)(66556008)(66476007)(66946007)(5660300002)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2684;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LpUP/ZpBSu5CyJbp4I6JaWSxX8EwJI9plYdG6KvtVcmZoqeoeR1qhuZROOe1z73swbfqc/ck7q/4e17HSUF8C293JlFHyFRmAwPaDi5sc2EUL9AxqsC0yGjfrA207wQWDSieWkI16gmRvaKSNrL8XlIkYVx4gnMMX67q/zszjOhFSL3vr3BW+3eGy3zj+5GgrwmN/ilgEFIr0mBcUHRs8jmJfAnhFV0c/98oqX/csra26E/j9RfXcfgiwdeAUdIs4go9GCfWXLeJs1xCZOwU597axdJx464YpJUX3Z+/ZUE00Be1SdxjP8XLaJtVZ1KDVCWzxKL9T4F3Cw+YUmkv820+iENy5WJfjCcFXk28x7fgKoQ3Bo+05Whm9+XMTZvrnc9suhBIjCOcZs8eQbxxfUI/Jc7QdilbvbtsC9uybUU=
Content-ID: <D402716A171FEA4FA36AA1DA75A358C0@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 05001fa9-02d7-4330-8ea1-08d7175c41c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 15:15:30.6422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2684
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 09/16] microcode: remove pointless 'cpu'
 parameter
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

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9taWNyb2NvZGVfYW1kLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYw0K
PiBAQCAtNzgsMjMgKzc4LDIzIEBAIHN0cnVjdCBtcGJoZHIgew0KPiAgIHN0YXRpYyBERUZJTkVf
U1BJTkxPQ0sobWljcm9jb2RlX3VwZGF0ZV9sb2NrKTsNCj4gICANCj4gICAvKiBTZWUgY29tbWVu
dCBpbiBzdGFydF91cGRhdGUoKSBmb3IgY2FzZXMgd2hlbiB0aGlzIHJvdXRpbmUgZmFpbHMgKi8N
Cj4gLXN0YXRpYyBpbnQgY29sbGVjdF9jcHVfaW5mbyh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1Y3Qg
Y3B1X3NpZ25hdHVyZSAqY3NpZykNCj4gK3N0YXRpYyBpbnQgY29sbGVjdF9jcHVfaW5mbyhzdHJ1
Y3QgY3B1X3NpZ25hdHVyZSAqY3NpZykNCj4gICB7DQo+IC0gICAgc3RydWN0IGNwdWluZm9feDg2
ICpjID0gJmNwdV9kYXRhW2NwdV07DQo+ICsgICAgc3RydWN0IGNwdWluZm9feDg2ICpjID0gJmN1
cnJlbnRfY3B1X2RhdGE7DQo+ICAgDQo+ICAgICAgIG1lbXNldChjc2lnLCAwLCBzaXplb2YoKmNz
aWcpKTsNCj4gICANCj4gICAgICAgaWYgKCAoYy0+eDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX0FN
RCkgfHwgKGMtPng4NiA8IDB4MTApICkNCj4gICAgICAgew0KPiAgICAgICAgICAgcHJpbnRrKEtF
Uk5fRVJSICJtaWNyb2NvZGU6IENQVSVkIG5vdCBhIGNhcGFibGUgQU1EIHByb2Nlc3NvclxuIiwN
Cj4gLSAgICAgICAgICAgICAgIGNwdSk7DQo+ICsgICAgICAgICAgICAgICBzbXBfcHJvY2Vzc29y
X2lkKCkpOw0KPiAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICAgIH0NCj4gICANCj4g
ICAgICAgcmRtc3JsKE1TUl9BTURfUEFUQ0hMRVZFTCwgY3NpZy0+cmV2KTsNCj4gICANCj4gICAg
ICAgcHJfZGVidWcoIm1pY3JvY29kZTogQ1BVJWQgY29sbGVjdF9jcHVfaW5mbzogcGF0Y2hfaWQ9
JSN4XG4iLA0KPiAtICAgICAgICAgICAgIGNwdSwgY3NpZy0+cmV2KTsNCj4gKyAgICAgICAgICAg
ICBzbXBfcHJvY2Vzc29yX2lkKCksIGNzaWctPnJldik7DQo+ICAgDQo+ICAgICAgIHJldHVybiAw
Ow0KPiAgIH0NCg0KQXJnaCAtIEknZCBiZWVuIHdyb25nIHNheWluZyAiVGhlIG9ubHkgb3RoZXIg
dXNlIG9mICJjcHUiIGlzIGluIGENCnByX2RlYnVnKCkiIGluIGEgcmVwbHkgdG8gdjcuIEkgaGFk
IG1hbmFnZWQgdG8gb3Zlcmxvb2sgdGhlIHVzZSBpbg0KdGhlIHByaW50aygpLiBUaGlzIHN1Z2dl
c3RzIHRoYXQgdGhlIGVhcmxpZXIgc29sdXRpb24gd2FzIGJldHRlciwNCmFzIG5vdyB3ZSBoYXZl
IGF0IGxlYXN0IHR3byBzbXBfcHJvY2Vzc29yX2lkKCkgaW4gdGhlIGZ1bmN0aW9uLCBpbg0KYSBk
ZWJ1ZyBidWlsZCB0aHJlZSBvZiB0aGVtLiBJJ20gc29ycnkuDQoNClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpwcmVmZXJhYmx5IHdpdGggdGhlIGNoYW5nZSBh
Ym92ZSBtb3ZlZCBiYWNrIHRvIGl0cyB2NyBzaGFwZSwgYnV0DQpnaXZlbiB0aGlzIHdhcyBteSBt
aXN0YWtlIEkgd29uJ3QgaW5zaXN0LiBJZiB0aGVyZSB3YXMgbm8gbmVlZCBmb3INCnY5LCB0aGVu
IHRoaXMgY291bGQgYWxzbyBiZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcuDQoNCkphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
