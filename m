Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EF1B8C6C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 10:13:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBE01-0001hN-NC; Fri, 20 Sep 2019 08:10:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ihh=XP=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iBDzz-0001gz-U2
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 08:10:39 +0000
X-Inumbo-ID: 211bb618-db7e-11e9-9686-12813bfff9fa
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.118]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 211bb618-db7e-11e9-9686-12813bfff9fa;
 Fri, 20 Sep 2019 08:10:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9FGvEUYtKTiBFT7dYUgH+Ag5RNiwpYZAobJCv4siHqP6Pz94ZO3DsXEemNNfDey1k00NfrvHAd7gcJ1U5GfasY67C/YGWr52d9MIhc47IiEcHn6/phEMDqPjspOQcWslF6TXKMYSIZaj/BNxqT5BkzCtoNx+JZF7FsjyGBULaHwxozZk96DJtNXr10wjV9tW8/mFFaBmcjJNECVp0/Pp1jNLkZEEBq0UytRguwirH9IVHxgXJJBF0JzoULXXQQhpkmfHFZhzaFNiUXzUdE2Q8uWjMeK45E/IATltgfOMWD/OYF77ZI/FiKLoGbx6UGpzSUIj1vUzNZMXviW+bLR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zvCm5f1eG+9IFPr00XNzDPlF1AgaIWqvgyPA+Q8Z3g=;
 b=aZ05Yi2UZXaVvdhVxq3J+nB4aFSvZTSliYeHhmfrqUZmfZXmy91V7TGOuf5jSiMM7Seb1SEt9QMVe3I1I8KJIupd76Cj9XRDK5JBrzbZz5G6Smt9eWtNB9P5tgmx1DP1+JgekKQKyWsjICt4KvTRDXfZV/Z/j4ktMR5UvF9cT0dA8f8RrcRXtoovzDNFnqPaOiAY1RXS4czFllVSrP9uYZYXrSGZTeJq1oZ3Juyi8LC8hBcIYhBSGAsKKJfNRd2dvuWGs6tEXQMja+RlLwAfedcBzLSUWdH4nf7BJSZXav2gruRGBoIJKvBcm8t1AeifFNBXaj3Ar/7AemWRmSP3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zvCm5f1eG+9IFPr00XNzDPlF1AgaIWqvgyPA+Q8Z3g=;
 b=PNS7L5VdVq8/Saj83pnJKy6b6JQlnxJlEe+s0jmvgSxHB3u2XbJ+jMB8wvU1WUAx7O62O0dUC3wmtNcXE6HS+ffH5lpTOHMl5m2Jiu5N0LbCYuYvojx2olxC7rvzeIGbwyKmE9grjAhycdN1dFQCqgo4uj4v2Ko81tUT/qCWx2A=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5782.eurprd02.prod.outlook.com (10.141.172.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 20 Sep 2019 08:10:37 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2284.023; Fri, 20 Sep 2019
 08:10:37 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v11] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVbuqvObi2c4eeME6qC/Xll4ji7KczB5JAgAEwWQA=
Date: Fri, 20 Sep 2019 08:10:37 +0000
Message-ID: <fa1f5444-41cb-e991-3547-858d28ea734c@bitdefender.com>
References: <20190919130338.3132-1-aisaila@bitdefender.com>
 <9cfad3f4fdb34a34ba40a7534c209af0@AMSPEX02CL03.citrite.net>
In-Reply-To: <9cfad3f4fdb34a34ba40a7534c209af0@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::34) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4f31f7e-2984-4063-5524-08d73da204b7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5782; 
x-ms-traffictypediagnostic: AM7PR02MB5782:|AM7PR02MB5782:|AM7PR02MB5782:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB5782C8736039B56123E18041AB880@AM7PR02MB5782.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(396003)(39860400002)(346002)(136003)(13464003)(189003)(199004)(5660300002)(81166006)(81156014)(8676002)(2616005)(99286004)(11346002)(36756003)(6512007)(3846002)(2501003)(66066001)(6246003)(6116002)(8936002)(110136005)(305945005)(31686004)(7736002)(229853002)(6436002)(14454004)(54906003)(316002)(2906002)(6486002)(66946007)(14444005)(86362001)(66476007)(446003)(53546011)(31696002)(25786009)(256004)(66446008)(486006)(186003)(64756008)(102836004)(4326008)(26005)(71200400001)(71190400001)(52116002)(478600001)(386003)(476003)(6506007)(76176011)(66556008)(3714002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5782;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3vjmrXESqW5yRx+1MYYBws6lE6gw1e/R9Pd7M05BnelY8E50pIBi07067Z82C695BlRn28j09fXLLyZ4RqaoXD5Eur8wu6gMfDJxrt8SD6FHNa2ETjlIEAOEi9PpPU2H3Vg+6oOqvnvO/03Y45x2bNCfw7Ssc8HKbL7AtEe5mYuaMOhQhBsuaQbqGxHadox/4vPwZba74t9HGv63Tm0C/ibLCYKaictQotdbcRa8JTD6JRWry0Ae3GjIuJCleFwG5Ir6uvhw61toh2cx4xzn0/xdscEiqmk+oivHzCHv7Ck8x+aD0SxSSblkAlCnIZfEfFIKASUD01lqvjw1bX3LQsAErxBonzAxu/DZWZKFjkPH2BJx/q5tNwfZAhj2fnkDxkEJxX+pGtBWVb6EBPWD5mNOLcJlS45koEsT8WTUK8E=
Content-ID: <9F9639EAEEFAB04095CF91C370BAA1D2@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f31f7e-2984-4063-5524-08d73da204b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 08:10:37.0595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EbNutnh1u/CIzgnCe4lP+YcYmhGJf02fII2xcKi0+za/ja0/8y8GC6Xyn0fDkNEl2ibvTjCHxwUMK3FfssQZ8hswULYygsk7MafOCer4dOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5782
Subject: Re: [Xen-devel] [PATCH v11] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE5LjA5LjIwMTkgMTc6MDksIFBhdWwgRHVycmFudCB3cm90ZToNCj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0u
YyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4+IGluZGV4IGZkYjFlMTdmNTkuLjRjYzA3N2Ji
M2YgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQo+PiArKysgYi94ZW4v
YXJjaC94ODYvaHZtL2h2bS5jDQo+PiBAQCAtMzIzNiw2ICszMjM2LDE5IEBAIHN0YXRpYyBlbnVt
IGh2bV90cmFuc2xhdGlvbl9yZXN1bHQgX19odm1fY29weSgNCj4+ICAgICAgICAgICAgICAgcmV0
dXJuIEhWTVRSQU5TX2JhZF9nZm5fdG9fbWZuOw0KPj4gICAgICAgICAgIH0NCj4+DQo+PiArICAg
ICAgICAvKg0KPj4gKyAgICAgICAgICogSW4gY2FzZSBhIHZtIGV2ZW50IHdhcyBzZW50IHJldHVy
biBwYWdlZF9vdXQgc28gdGhlIGVtdWxhdGlvbiB3aWxsDQo+PiArICAgICAgICAgKiBzdG9wIHdp
dGggbm8gc2lkZSBlZmZlY3QNCj4+ICsgICAgICAgICAqLw0KPj4gKyAgICAgICAgaWYgKCAoZmxh
Z3MgJiBIVk1DT1BZX2xpbmVhcikgJiYNCj4+ICsgICAgICAgICAgICAgdW5saWtlbHkodi0+YXJj
aC52bV9ldmVudCkgJiYNCj4+ICsgICAgICAgICAgICAgdi0+YXJjaC52bV9ldmVudC0+c2VuZF9l
dmVudCAmJg0KPj4gKyAgICAgICAgICAgICBodm1fbW9uaXRvcl9jaGVja19wMm0oYWRkciwgZ2Zu
LCBwZmVjLCBucGZlY19raW5kX3dpdGhfZ2xhKSApDQo+PiArICAgICAgICB7DQo+PiArICAgICAg
ICAgICAgcHV0X3BhZ2UocGFnZSk7DQo+PiArICAgICAgICAgICAgcmV0dXJuIEhWTVRSQU5TX2Jh
ZF9nZm5fYWNjZXNzOw0KPiANCj4gVGhpcyBkb2Vzbid0IG1hdGNoIHRoZSBjb21tZW50IGFib3Zl
LiBEaWQgeW91IG1lYW4gdG8gcmV0dXJuIEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQ/IEknbSBndWVz
c2luZyBub3QsIGluIHdoaWNoIGNhc2UgdGhlIGNvbW1lbnQgbmVlZHMgdG8gYmUgZml4ZWQuDQoN
ClllcywgaXQgc2VlbXMgSSBtaXNzZWQgdGhhdCBidXQgZ2l2ZW4gdGhhdCB0aGUgcmV0dXJuIG5h
bWUgd2lsbCBjaGFuZ2UgSSANCndpbGwgaGF2ZSB0aGUgY29tbWVudCBmaXhlZCBpbiB0aGUgbmV4
dCB2ZXJzaW9uLiBUaGFua3MgZm9yIHBvaW50aW5nIA0KdGhpcyBvdXQuDQoNCkFsZXgNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
