Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16487FD13
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:11:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZAE-0000ep-7P; Fri, 02 Aug 2019 15:08:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htZAC-0000ek-5x
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:08:12 +0000
X-Inumbo-ID: 56c2261b-b537-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 56c2261b-b537-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:08:10 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 15:08:03 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 15:03:25 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 15:03:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQ1HfTZHuWKw4jDXIhsUvx/awRN+Ti/SwSV1zMyEV4j4H+KFVYRnr69qRKF8tqIeo8Oe3XBjAAq+bu2VXfX30AXSJh9ZP3kP8F8Pzws+Nn6a5l7l4OVo0GgTZ3Ha/m4PZFmS41iWdKLq8wtNA2WGhefKU8jWAnX7/DJWxJMINwrDijmI4w9I9lAvZtOlSCo0hVE/ZraDXmS+N3HpBhURjq/BtJC8jRlILUhRFYWUoPCfw8s+hBdoorwvBMbChigctqGAmeyPr4EXKswep7I7ysxbauv2zqiZpwPMY2OWII70WM1HHE36OZBlanEcbXSApmaYcHF5FXW/s0mt+Pa6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMu/hqq+02yrLWxpkXMQb7pUKSr1HD4og2f1mv8y0Ss=;
 b=XP/IqZU6tyHqoRQza+PnQZcYI0b8VZmgeHcejElO9FxQMbl6u5iEXqlej4CwtM+MEFP8jbOzljFDSS7/v90xNkeVfqDy1jbiW5+dHlOOD4CEqoIvL+Bqgje76dY6eJAcNHB5n3pUom/bqMoKQjPHDO6xFvTumPjUZ2g7gS/XT5qGTxqyr3IF26/lXYAXgqq/nOVlVDaYRnzvJuYRp7F74HIiUeYhe9PkXwCvUN0AUsRDxcnWrR9KGA8PIK+Xjs6WLfu1toYdUQ8dL/J/234ooPKNxkjY7VdhzTMUVBqm/c9gm6KlONUTVTr/kVm4TPPhRotpNixyaC5og/XUpDI+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2556.namprd18.prod.outlook.com (20.179.105.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Fri, 2 Aug 2019 15:03:24 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 15:03:24 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 08/16] microcode: remove struct ucode_cpu_info
Thread-Index: AQHVSFKmJ8CepTSUlk2Fo5Ho/LDm2qbn9jIA
Date: Fri, 2 Aug 2019 15:03:23 +0000
Message-ID: <38808120-a984-2442-f703-a316d0702d76@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-9-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-9-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0096.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::36) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11978fcb-363a-49de-2b28-08d7175a9089
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2556; 
x-ms-traffictypediagnostic: DM6PR18MB2556:
x-microsoft-antispam-prvs: <DM6PR18MB2556913695315D890EC3520CB3D90@DM6PR18MB2556.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(189003)(199004)(54906003)(6512007)(53936002)(68736007)(80792005)(66446008)(52116002)(4326008)(2906002)(64756008)(86362001)(66476007)(36756003)(66556008)(4744005)(229853002)(8676002)(71200400001)(31686004)(7736002)(478600001)(305945005)(31696002)(71190400001)(5660300002)(66946007)(316002)(8936002)(2616005)(11346002)(476003)(26005)(81156014)(81166006)(446003)(3846002)(486006)(6486002)(6116002)(102836004)(256004)(14454004)(6916009)(386003)(6506007)(6436002)(53546011)(25786009)(99286004)(66066001)(76176011)(6246003)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2556;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qUCzHv85mJOstfrLA/Yc82VvIB0+Sl5G3uycLAZR40smN61WyiOEJpnSxafbGB9BT52DPDRxbSwd2GirF/4tbtv/Od0+nUYofEmkpMxH/C8vHwVqZ6N3Q0Pqw7A1jE/VkH/0VsudGvkli2Xk2HrsZCflxJD8/qljQX2Ra1d+YWvsTm1VDS86Tf7IrE5/bWZ4xGgcQ5w88nrMpT7xlaQyd7IWn1oda5n48YwxGcr0bDbjV85UzRSG2dM0vlEVZ7FeFdT02tkY0EPhcrdRsn1AUXA6vPVwAu0+7J81KdHwIpbELPo9+LV8T3p9OSsQlxuJVj58V/rn02Tq2GAaZZZZpe47aiHeDEv3NQsJTqS9SEv5NYKnSxESXV0KAY+pOWse1eOeSACkfWtIrq2xCcrmzG5M7jEKomLlTvYgf1Nrjfg=
Content-ID: <A32FADB5BC11234B9DC042D10BA9774F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 11978fcb-363a-49de-2b28-08d7175a9089
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 15:03:23.7337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2556
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 08/16] microcode: remove struct
 ucode_cpu_info
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

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IFJlbW92ZSB0aGUgcGVyLWNw
dSBjYWNoZSBmaWVsZCBpbiBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gc2luY2UgaXQgaGFzDQo+IGJl
ZW4gcmVwbGFjZWQgYnkgYSBnbG9iYWwgY2FjaGUuIEl0IHdvdWxkIGxlYWRzIHRvIG9ubHkgb25l
IGZpZWxkDQo+IHJlbWFpbmluZyBpbiB1Y29kZV9jcHVfaW5mby4gVGhlbiwgdGhpcyBzdHJ1Y3Qg
aXMgcmVtb3ZlZCBhbmQgdGhlDQo+IHJlbWFpbmluZyBmaWVsZCAoY3B1IHNpZ25hdHVyZSkgaXMg
c3RvcmVkIGluIHBlci1jcHUgYXJlYS4NCj4gDQo+IFRoZSBjcHUgc3RhdHVzIG5vdGlmaWVyIGlz
IGFsc28gcmVtb3ZlZC4gSXQgd2FzIHVzZWQgdG8gZnJlZSB0aGUgIm1jIg0KPiBmaWVsZCB0byBh
dm9pZCBtZW1vcnkgbGVhay4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdh
b0BpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
