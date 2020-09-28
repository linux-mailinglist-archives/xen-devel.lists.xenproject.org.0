Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E5427AFDC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 16:18:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMtxU-0001lq-7H; Mon, 28 Sep 2020 14:16:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UvNi=DF=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1kMtxS-0001lk-O8
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 14:16:50 +0000
X-Inumbo-ID: e01b00e5-f300-4b79-b176-b469492ac90c
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e01b00e5-f300-4b79-b176-b469492ac90c;
 Mon, 28 Sep 2020 14:16:46 +0000 (UTC)
IronPort-SDR: ufREc4JlyDTabfZKTyrXqdcrclxTlpX0NqXUN1irwqYjZBE9mZ+7+SrKkh2ijqWdWfRvnTLxff
 IptTCOnAO3KA==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="180159123"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="180159123"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 07:16:44 -0700
IronPort-SDR: rohNWeBtfCm63VJCI4DTqziQ4QDqc1wz2KB7VAfAK0vfhHH4MgL1zwUr9H11nWUFrfclZucrNx
 Ph0nYW5/kPCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="324296678"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga002.jf.intel.com with ESMTP; 28 Sep 2020 07:16:44 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 28 Sep 2020 07:16:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 28 Sep 2020 07:16:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 28 Sep 2020 07:16:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJZtHoWzla5LQzcNBEFKFPeyifsA/xDg6X4dYtTr93lWlKal7fD0PEUl/KFoTz4BtUH37x1nvU2QEzeaIEgWaVkVmmp9IIByKkUGdVVaaHl6SzViubjGgRf/fh4WFb/gUFtXNCxg/i23GLHcpR+AHSCufyHR+HBGgbRo+AmGEMsAZMM/zDz4J/ItoU9jEodmxjuxg21pDimKbjO+XfW1fbJIKxUn1lG4NPEqbT0gfPTuIcMC9dhBI0Gi99bp08BG6SMCMWrKbzkA3APsCXLQK3TC2LlOg6VMJ4BKb30yiHYas0yfsTeobidlDHwio2wtv1OVnLzbw6d2+7NpTWWJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR2JJ2a6leAr57AlBdsHLHniKHnVM0KDc02glP3Lm8U=;
 b=Rwk12B38pyZIXnnoXcX38jIupRBAmWnqQi3D+3g5bF6K4EcGmylKTpOa6EPpdu1A6OfDcz+mePgy1khWa9xzstk5/p9f0S0wz7fLhStb/oybsE8lTOmxvGlfN8k2InB5CJGjxnQAwywcMGscEWq8WFItgoGCTjLKygirhh1X1sWNx0wrdG25d7DreMgOBWNG3+XBQahT3noSo3eWRABuH2WtV5a+ivWUggaxKV0os52HvYmvt2vNMU80tnkkaMzTNSkvJW8rdvR80zWDpXMZlwSInT9AU/BZlhxkVnQatMNWkxEts3bPUjZT46ydgPdsaXJSNOK0AOFIbTDCtTmduA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR2JJ2a6leAr57AlBdsHLHniKHnVM0KDc02glP3Lm8U=;
 b=y3XUFmVf23YdwkLZVA76nOo2G5OXe622EHngDotfahFJ8isv6ZWZMHfpxr/1ZLemk0/VKuEzSdGeaCPJCLo9We+tyt+8DVU9B/hAgU+kOdCrEbcezEvchnNahaJsP2JAWpAYmfqwpD731DCC2ltDC4ENGNhMPJLxVtE7hCGZv+M=
Received: from CY4PR11MB0056.namprd11.prod.outlook.com (2603:10b6:910:7c::30)
 by CY4PR1101MB2117.namprd11.prod.outlook.com (2603:10b6:910:17::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Mon, 28 Sep
 2020 14:16:42 +0000
Received: from CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::d8a4:c8e2:c60f:60fa]) by CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::d8a4:c8e2:c60f:60fa%7]) with mapi id 15.20.3326.030; Mon, 28 Sep 2020
 14:16:42 +0000
From: "Lengyel, Tamas" <tamas.lengyel@intel.com>
To: "paul@xen.org" <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: 'Paul Durrant' <pdurrant@amazon.com>, 'Andrew Cooper'
 <andrew.cooper3@citrix.com>, 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Ian Jackson'
 <ian.jackson@eu.citrix.com>, 'Jan Beulich' <jbeulich@suse.com>, "'Julien
 Grall'" <julien@xen.org>,
 =?utf-8?B?J01hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSc=?=
 <marmarek@invisiblethingslab.com>, =?utf-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?=
 <roger.pau@citrix.com>, 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>, 'Wei Liu' <wl@xen.org>
Subject: RE: [PATCH v9 0/8] domain context infrastructure
Thread-Topic: [PATCH v9 0/8] domain context infrastructure
Thread-Index: AQHWknRuHXFGg/c6C0CkM2JZfSFRjal4LpeAgAEhBgCABM4f0A==
Date: Mon, 28 Sep 2020 14:16:42 +0000
Message-ID: <CY4PR11MB005625159210BF9EBF024135FB350@CY4PR11MB0056.namprd11.prod.outlook.com>
References: <20200924131030.1876-1-paul@xen.org>
 <CY4PR11MB0056034DE1EE8445CE816494FB390@CY4PR11MB0056.namprd11.prod.outlook.com>
 <001301d6933a$4409fda0$cc1df8e0$@xen.org>
In-Reply-To: <001301d6933a$4409fda0$cc1df8e0$@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.119.195.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8173624-a277-4f09-e112-08d863b91fd1
x-ms-traffictypediagnostic: CY4PR1101MB2117:
x-microsoft-antispam-prvs: <CY4PR1101MB2117E4CDF810639117489C73FB350@CY4PR1101MB2117.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tmFtKgsK9yqw/zUVfk/cFHBxElgHJZEDEQSoPYvRpvo/3SbivdSkPB3ym/a84z8ozWNzyxQqqeyXRzeijJl+eaqhchz9BKtURlQtCtWKe9pJEcPWmV+ruwonq1eg+vamKt/qXbWh6WukbW8QbwJMfgXffhGDU0WlxZKtpDAuVepraLZ7zGoDerT8m/RZhqSrlhXwaYytQwz+gSkYjmOsoh6iX0/NdCGmyWnoftZFUDlLRFBIupCStEQ4VQkBtcRbEo2z6eS8odLEib592uuo0Xe1hiRaDTTY497Ggf+uBEC7Wl1saimxjSG2XttxrOXSb+BiLf+6RNMW7DCL0RJDFmVhd7UDVCq4yVPNRGv9bN2YtH5kSOEISHT1dOFIs3yXXRtCR9lztCv1sVXgrUKqbPTlUShVv+D9FS7BN06kduvH/j0mQZi5/3mnUvC0HLGaNkLoEAHdmsuRZf8iz9Vzew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(86362001)(55016002)(7696005)(66446008)(64756008)(66556008)(66476007)(478600001)(316002)(2906002)(54906003)(71200400001)(110136005)(6506007)(76116006)(7416002)(9686003)(66946007)(5660300002)(52536014)(26005)(8936002)(4744005)(8676002)(4326008)(186003)(966005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: fJH+euGndGCQgcFuG022OTzEBdSJIMm1XBP9BbHqvUxVLjZw+978Uqn68Ap/LCGu55BLp0tOD1w8+O30YHPbbQ1lsRF3eWFbGjvyRYvdSPuhpnsPdTGIKGvYEdCKnlCKxeEVcK10EyZil9Dsh8kfpZ3FDax2Amg8HxJPZN0gDDGPXMCO5e7M51sX3nLsJzg76tOS8c0PPK7NQ590csTRJ0gLLq7njUSajhviyz6ZaJFJHsGmYRhkmA93peSMCkyEINOmz1P9m4Sk8XXxxjwSCiquxv3DUqOjBAKT5viTgx4SFJrifA5RpzikhPNqAlTMQgO17Xtpmh0kROa6vMP+Ny4LXZK6SAQubWKyT0FD4ghEIqY9nF9WQ5xGVzITisJk+gxlp9XVZX0ZNRlkBWNB8g4bIRFxhy9Ad07ubIoRd+Lwy4076DSnncYC8kM0ghbojZGxUhVDOY1d1E3BPw3dQyAOZvkG6ux4+ErGKqlY5e/Nc/Z2XY0Sxxe4PCQuPf8OZTWR+yossR4HJaD4yFOaUgFyyvIT/kR1uclXriwDcWto2HDs3VhbN1o11pPiUWZL4CJshIkEuUZah0OBefXHZTjZ6BNeFAwt44lYuOdR3K7TxsF8jcjnbDo4yrEBa+2a72mbM5NVE8GZoUmB4s50WA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8173624-a277-4f09-e112-08d863b91fd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 14:16:42.5413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tXbyZs8ltBTFUa0pxaJtr7XhilZ4hbxArwdewKCp5WV9P5aFn3+etiWO8SRHz0jpxt0i6U03L6AfsQmOTvi9UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2117
X-OriginatorOrg: intel.com
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IEhpIFBhdWwsDQo+ID4gQ291bGQgeW91IHB1c2ggYSBnaXQgYnJhbmNoIHNvbWV3aGVyZSBm
b3IgdGhpcyBzZXJpZXM/IEkgd291bGQgbGlrZSB0bw0KPiA+IHNlZSB0aGlzIGJlaW5nIGludGVn
cmF0ZWQgd2l0aCBWTSBmb3JraW5nIGFuZCBpZiBpdHMgbm90IHRvbyBtdWNoDQo+ID4gZWZmb3J0
IGp1c3QgY3JlYXRlIHRoZSBwYXRjaCBmb3IgdGhhdCBzbyB0aGF0IGl0IGNvdWxkIGJlIGFwcGVu
ZGVkIHRvIHRoZQ0KPiBzZXJpZXMuDQo+ID4NCj4gDQo+IEhpIFRhbWFzLA0KPiANCj4gICBEb25l
LiBTZWUNCj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXBlb3BsZS9wYXVsZHUv
eGVuLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oDQo+IGVhZHMvZG9tYWluLXNhdmUxNA0KPiANCj4g
ICBDaGVlcnMsDQo+IA0KPiAgICAgUGF1bA0KDQpIaSBQYXVsLA0KSSBhZGRlZCBhIHNtYWxsIHBh
dGNoIHRoYXQgd291bGQgc2F2ZSAmIGxvYWQgdGhlIFBWIGNvbnRleHQgZnJvbSBvbmUgZG9tYWlu
IHRvIGFub3RoZXIgdGhhdCB3b3VsZCBiZSBjYWxsZWQgZHVyaW5nIFZNIGZvcmtpbmcuIFBsZWFz
ZSB0YWtlIGEgbG9vayBhdCBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVvcGxl
L3RrbGVuZ3llbC94ZW4uZ2l0O2E9Y29tbWl0ZGlmZjtoPTE4NDNjYTczMDJlNDE1MzE3ZmRiOWE2
M2IzYTRkMjlhMzg1ZGM3NjY7aHA9ODE0OTI5NmZkZjgwYzczNzI3ZTYxY2VhNmZlMzI1MWFlY2Y4
YjMzMy4gSSBjYWxsZWQgdGhlIGZ1bmN0aW9uIGNvcHlfcHZfZG9tYWluY29udGV4dCBmb3Igbm93
IGFzIHRoYXQgc2VlbWVkIGxpa2UgdGhlIG1vc3QgYXBwcm9wcmlhdGUgZGVzY3JpcHRpb24gZm9y
IGl0LiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhpcyBsb29rcyBnb29kIHRvIHlvdS4gSSdtIHN0
aWxsIHRlc3RpbmcgaXQgYnV0IGlmIGV2ZXJ5dGhpbmcgY2hlY2tzIG91dCBpdCB3b3VsZCBiZSBu
aWNlIHRvIGp1c3QgYXBwZW5kIHRoaXMgcGF0Y2ggdG8geW91ciBzZXJpZXMuDQoNClRoYW5rcywN
ClRhbWFzDQo=

