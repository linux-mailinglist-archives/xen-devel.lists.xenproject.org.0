Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D286925F20A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 05:26:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kF7n1-0004Wp-4g; Mon, 07 Sep 2020 03:25:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tOn7=CQ=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kF7n0-0004Wk-1A
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 03:25:54 +0000
X-Inumbo-ID: e8c4651d-0330-45a0-9800-df0757ace766
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8c4651d-0330-45a0-9800-df0757ace766;
 Mon, 07 Sep 2020 03:25:51 +0000 (UTC)
IronPort-SDR: dhcFp/fjfZ86R/FP1K5NmKyC+Da/p/QOwa+S1Ds723cEdBfg2Tc9x1b9UGzDWAZMJetBfGX41i
 QJwbIgJEF6zw==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="157212787"
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="157212787"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2020 20:25:50 -0700
IronPort-SDR: A0FBRaKbSSBFR9COQGVI6HvCyxrbiMbKQFmnziKojqLIzAuVGBtKl1erz3LJc8Lts/Nyy5B9J3
 I3shcCmyxanw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="503870129"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2020 20:25:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 6 Sep 2020 20:25:50 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 6 Sep 2020 20:25:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 6 Sep 2020 20:25:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 6 Sep 2020 20:25:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyBwB7YFJKYFAK1CFHNt75aUkvmKI5C5c+9Ai9OsOmYkZrbplIaUJ1KF8h8mSqSXPXh/JkbqBcQAHBDWNCdTaDWodDwTzF9Xva5PuMpWA4r4ovdTis2PDwKGxfFSIm4yyxZrhpYRZc2MUsYw7EfOxZgXI43Oqc4LDV4dkcCw2kUB9dV2qIVgm6/3f2pN2NoCf7Pp9Xf0860Fbdk/mP8cICY4m4tLOTxws4QmAhrbOK3fAN1ABbfg4xMGSUY027tvzEU3Pdszlpr6QK93nvMygIDN2b0lDOH2m8MHOhElLvhisYVy+GGd6pIm0JODhtER7zDTk13xUzVY0oW8cLOu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZKDT1b6XQRtnhhGeI0OCHK6fj3WdevE08Ehkp9TJF0=;
 b=Lv3CTX+XfPzofMYstzvfxGjYm1CShUmi0hEKVuGhM7D/PQVDIAyJ7k1yY2p83fyceBSqaqvxO83UNnJjkkPcI+0C25ogoRwFKJU1LCeBSMAfD2jvVxLgSVqaGkaFd6emlof/Hye6aO3xawr6uYossYnbLEjWHXBEwP81Ct53O5anU6SPOFV2V31K2nHP4CEsu/ZvmEnKfO3pxZnRQ7PE9K6QVdD3+IvuE9ddDx6e9CLeRgFCBL6V5FAKRullwinpLEuxleFAVRtNg8D+Ouj7P8S3OA2P5oC+Tl0M/CeSDEjfeiQ1n8so8C1586UG19i5g29P5qANYKXYZLf5m3HBjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZKDT1b6XQRtnhhGeI0OCHK6fj3WdevE08Ehkp9TJF0=;
 b=frwe0lYNT0oMCCYC6HPJUe1qNKfFbf2lg/zjMYRBLolm0M0TP5vyK43WCkd8DojQu3FsB+KJEmac5OPTqJGsJZ93Uy+f7G+b04t+3jiAM8VyLHvwIrD4jSjL5mnJFret2LbXWUykNYOED1GozxXVLiR/w+uJIiNjKYU5keSE9KM=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR1101MB2288.namprd11.prod.outlook.com (2603:10b6:301:53::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Mon, 7 Sep
 2020 03:25:48 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 03:25:47 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v3 1/8] x86/vmx: handle writes to MISC_ENABLE MSR
Thread-Topic: [PATCH v3 1/8] x86/vmx: handle writes to MISC_ENABLE MSR
Thread-Index: AQHWgFCIit5SqP19VE+bDjLWdpulEqlcjDwQ
Date: Mon, 7 Sep 2020 03:25:47 +0000
Message-ID: <MWHPR11MB16457A9096E266A249386A4A8C280@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-2-roger.pau@citrix.com>
In-Reply-To: <20200901105445.22277-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9365d4e-fd64-4edd-bd2d-08d852ddb6ac
x-ms-traffictypediagnostic: MWHPR1101MB2288:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2288DF43834639EAA1B936138C280@MWHPR1101MB2288.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tj18jfnNdjDWIKiLttnzyqSU4XS7azMay7m6G45/zFXmKEiTvZFbgR8Lgo50QbZqFJqMFKiFcDFbi3pUU9UdwU/ZPpwEI8gF2irg+7M9+xslmGexXwQoZvtp4UKseu9izuWUWH/+1RG5OihrNMLtm4wUlNnXt6h2Mf2Ert5uLmPTBlcj573JWp7pqTC6gi6M2gYPQwNjbqkhMVkC1ENlMsdToAoIkUy8+ayEwPRKjSpvve80OTr/XvA59BWMeS+qCMPQv/ZuHOIM1ixnTSNVkRzhTGNXzFuFg40UrH2gODZqqp/6I8lqxO1xU4C9YCF0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(83380400001)(478600001)(2906002)(316002)(110136005)(33656002)(54906003)(8676002)(55016002)(9686003)(8936002)(4326008)(66446008)(52536014)(66476007)(5660300002)(66946007)(66556008)(7696005)(6506007)(64756008)(76116006)(86362001)(186003)(26005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JcjnCdL6yYDHrRSAznKZfUgeXzp+p2/XGvvUIpDLGmpasS/rr9j1M0cFcE0e/cFcbrWMKtul+RreOQdQMU8iclkTdEsXPCCJzyO7BVcjBfoHSIz6s4+AMzic4tpxREUMZhmDaMidiApYKqm+q/zROEyXEga9ftER6Mqrf61JDKkYd+mqqxIQY8DW7ky+4J9tEM0i8pNKy/BbM6HqPHWQD5TD93cUae0bK8/V/l53B8LAdXVCgUzYoqNx1hbK6bV9v37Vg37gCJHN2As0kgSbkJlxLQfCdcQdNksBB+6R71H2M2+DnVgLnQtylsCEZfXKaidrnr7zgskfFhryLIyU4tzvsX7JoN5tHemjSTgy+CH2naBID5JnXBojBLW+NWAxYNLYElIXJzdV2Kk55bsVN85tpBer208iuQ65Pl1J6KYeHEBVV1nTUeEYHAdqkRp486PPfW09mckTEABHLkTysvZHdeamjjA6SXuYxJD914QpTxi2eaTIgUojvkC+WAj+xBozDXwje/Vx5Ews/r+YdhPrVPVu8dTzae9+Y1VscKr/ShRx+z0///TDxVQByNhrHanoPrrIOdPtLp8Hwv9KZXK+GT18ZS9w9rIC3ehRGEMwLHA872fuE0+P6sTthNT0TjzFy+Qblsj83VIh1H0H9w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9365d4e-fd64-4edd-bd2d-08d852ddb6ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 03:25:47.7309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rw4USANeTjp93VfrQ6nFoab77IqX8KWFB9P7y3lecmOPOzo1MTxPTdWCtGR02mfo3t1rcS4soatuDM7QoFx4tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2288
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

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBU
dWVzZGF5LCBTZXB0ZW1iZXIgMSwgMjAyMCA2OjU1IFBNDQo+IA0KPiBTdWNoIGhhbmRsaW5nIGNv
bnNpc3QgaW4gY2hlY2tpbmcgdGhhdCBubyBiaXRzIGhhdmUgYmVlbiBjaGFuZ2VkIGZyb20NCj4g
dGhlIHJlYWQgdmFsdWUsIGlmIHRoYXQncyB0aGUgY2FzZSBzaWxlbnRseSBkcm9wIHRoZSB3cml0
ZSwgb3RoZXJ3aXNlDQo+IGluamVjdCBhIGZhdWx0Lg0KPiANCj4gQXQgbGVhc3QgV2luZG93cyBn
dWVzdHMgd2lsbCBleHBlY3QgdG8gd3JpdGUgdG8gdGhlIE1JU0NfRU5BQkxFIE1TUg0KPiB3aXRo
IHRoZSBzYW1lIHZhbHVlIHRoYXQncyBiZWVuIHJlYWQgZnJvbSBpdC4NCg0KZm9yIGJldHRlciBy
ZWFkYWJpbGl0eSBjb3VsZCB5b3UgYWxzbyBhZGQgdGhpcyBsaW5lIHRvIHRoZSBjb2RlIGNvbW1l
bnQNCmJlbG93Pw0KDQp3aXRoIHRoYXQ6DQoNCglSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2
aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92
bXguYyB8IDkgKysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14
LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPiBpbmRleCBhMGQ1OGZmYmUyLi40NzE3
ZTUwZDRhIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPiArKysg
Yi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPiBAQCAtMzE2Myw3ICszMTYzLDcgQEAgc3Rh
dGljIGludCB2bXhfbXNyX3dyaXRlX2ludGVyY2VwdCh1bnNpZ25lZCBpbnQNCj4gbXNyLCB1aW50
NjRfdCBtc3JfY29udGVudCkNCj4gDQo+ICAgICAgc3dpdGNoICggbXNyICkNCj4gICAgICB7DQo+
IC0gICAgICAgIHVpbnQ2NF90IHJzdmQ7DQo+ICsgICAgICAgIHVpbnQ2NF90IHJzdmQsIHRtcDsN
Cj4gDQo+ICAgICAgY2FzZSBNU1JfSUEzMl9TWVNFTlRFUl9DUzoNCj4gICAgICAgICAgX192bXdy
aXRlKEdVRVNUX1NZU0VOVEVSX0NTLCBtc3JfY29udGVudCk7DQo+IEBAIC0zMzAxLDYgKzMzMDEs
MTMgQEAgc3RhdGljIGludCB2bXhfbXNyX3dyaXRlX2ludGVyY2VwdCh1bnNpZ25lZCBpbnQNCj4g
bXNyLCB1aW50NjRfdCBtc3JfY29udGVudCkNCj4gICAgICAgICAgLyogTm9uZSBvZiB0aGVzZSBN
U1JzIGFyZSB3cml0ZWFibGUuICovDQo+ICAgICAgICAgIGdvdG8gZ3BfZmF1bHQ7DQo+IA0KPiAr
ICAgIGNhc2UgTVNSX0lBMzJfTUlTQ19FTkFCTEU6DQo+ICsgICAgICAgIC8qIFNpbGVudGx5IGRy
b3Agd3JpdGVzIHRoYXQgZG9uJ3QgY2hhbmdlIHRoZSByZXBvcnRlZCB2YWx1ZS4gKi8NCj4gKyAg
ICAgICAgaWYgKCB2bXhfbXNyX3JlYWRfaW50ZXJjZXB0KG1zciwgJnRtcCkgIT0gWDg2RU1VTF9P
S0FZIHx8DQo+ICsgICAgICAgICAgICAgdG1wICE9IG1zcl9jb250ZW50ICkNCj4gKyAgICAgICAg
ICAgIGdvdG8gZ3BfZmF1bHQ7DQo+ICsgICAgICAgIGJyZWFrOw0KPiArDQo+ICAgICAgY2FzZSBN
U1JfUDZfUEVSRkNUUigwKS4uLk1TUl9QNl9QRVJGQ1RSKDcpOg0KPiAgICAgIGNhc2UgTVNSX1A2
X0VWTlRTRUwoMCkuLi5NU1JfUDZfRVZOVFNFTCg3KToNCj4gICAgICBjYXNlIE1TUl9DT1JFX1BF
UkZfRklYRURfQ1RSMC4uLk1TUl9DT1JFX1BFUkZfRklYRURfQ1RSMjoNCj4gLS0NCj4gMi4yOC4w
DQoNCg==

