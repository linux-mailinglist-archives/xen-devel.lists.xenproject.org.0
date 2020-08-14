Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328532444AF
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 07:56:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6ShG-0007Ug-BL; Fri, 14 Aug 2020 05:56:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jt9a=BY=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1k6ShF-0007Ub-4E
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 05:56:09 +0000
X-Inumbo-ID: fab6f9ee-b5b1-4238-99f0-bd0283349cac
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fab6f9ee-b5b1-4238-99f0-bd0283349cac;
 Fri, 14 Aug 2020 05:56:06 +0000 (UTC)
IronPort-SDR: cSlacmw4raOYB+4dr8M5suy7zitzpPBAZU/8XriOThLaJCnH5V/dZmOpPYN0xP8HZFjFw39wjG
 MfbuAP5KNctQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="142205410"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="142205410"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 22:56:04 -0700
IronPort-SDR: xuY6dUKfQzhQdDoq/JFbr7pLeQUKSGLXvEm5CbDhfxR0fFZAx4fPru5L+m5PnFT6Ib9tn/luCc
 ORJ8EcbXskHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="277046609"
Received: from orsmsx603-2.jf.intel.com (HELO ORSMSX603.amr.corp.intel.com)
 ([10.22.229.83])
 by fmsmga007.fm.intel.com with ESMTP; 13 Aug 2020 22:56:04 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 13 Aug 2020 22:56:04 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 13 Aug 2020 22:56:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 13 Aug 2020 22:56:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYe+5myFEKJr+VqMz9mwifOt0zC+31gduTOeSpMOxPPjZ7gzkzRhIWuB/aeeb048uIXuXvEJxIThXAdtIWeiDTaSyXzxXy4/XTlKdXUhPsf+u08XemBc/AOX/X/ttpp1ycVwrmAb3xkxeGp7j4pqxCXvuQx9qWZMgML+V1LHjbkXdMSkctndS4o/1Qr3wghTtyA1tU/87nXQkMWc115pI3HywFq8U9m/52tbK041DJREp5PgNz9PXgNt86hiZwnuUIr4K1/yVQ0z57TX1Bau9tbGBCJOLKCnimBiSXNCdrG+R060chTtKV/yR04s4SnylH9eX2vNBs84iZr+SqLWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aICuG8feeZDQm3/J03UBMKQuEf4XxnE2rrj+DhovQD0=;
 b=lWMzeL1daPBRWgXvDiMs/ZdnacFn4PJyA9TTxrsRK1vk3Rjkbt9IaMV/oxV5CH2m9JnMFo1t8mHL/BaVvIJWdL8BTwD3UhoBfEJNh9e9SPobdeGbUwJGPaE8ozrXo06kt4vyE5WEL5ymnUVhheKH7GFfQpFSnVCZZ/eTxe4Yy1C5Hb5ne+1EWsv7ZxEXxWhlh4puw8rluklYeonVH7FYmmktFcgUpzvbq3xVhuH3IjOhnQynJMPws+iGs1dJ9ZTfZj/+d+7OLTD/fmd2hdl5hcNNsnarS+WHtZxMLouUKEh1wsv3BbbwMcMofz5UNOvl5Gj00+recOUC6iptB0tV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aICuG8feeZDQm3/J03UBMKQuEf4XxnE2rrj+DhovQD0=;
 b=j8jJhCBPCOlpHTymHeuvVUQath0QM3MTs+QXiTc2TojoDJI05evebGhp3auTGE9mBWBsh4TTJTnrPLaQpKKHXFNJApz8OtHQR7EkjsOZtCpfEZoKCd66sUF670EVnyhFbJQKyR3Zbf4jfcNsp+Zqqbtz81MO+pW0+qcAWOTYRCs=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1725.namprd11.prod.outlook.com (2603:10b6:300:2a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Fri, 14 Aug
 2020 05:56:02 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3283.016; Fri, 14 Aug 2020
 05:56:02 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH 1/5] x86/hvm: change EOI exit bitmap helper parameter
Thread-Topic: [PATCH 1/5] x86/hvm: change EOI exit bitmap helper parameter
Thread-Index: AQHWcKbWwWOIDQI7HU2Ykn1wPUczEak3HccA
Date: Fri, 14 Aug 2020 05:56:01 +0000
Message-ID: <MWHPR11MB164551C111173EFFB2E549E68C400@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-2-roger.pau@citrix.com>
In-Reply-To: <20200812124709.4165-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd6f7054-1f08-49f1-d46f-08d84016b9b2
x-ms-traffictypediagnostic: MWHPR11MB1725:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB172528C922BA3CD4E06AECFB8C400@MWHPR11MB1725.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4SbsL3r5z9ep+kI1riX1yTWtWznjc3BQyKIIk6pFfsLwd78wA870hFbyw9VtKHgwpc3lZM3OIPf3fftymWCqqR40FTpM5Y5BMbr5YEZW35W0j0VEc0WtfvS49O7lxUV47p4fbluDgWXBX+BPYeKMrrPdN7t8thL31F2BniknlWN98i88vDyC/IL94HoxCm7YIPHw5BBiOrDTJo5CLlGs1w7SVieHWr0pvKLhPVZoKZmCDf+un2HEL69364hM9oRW7hZPX/KIEbfU1N/Zy3uSjERLZ5vC8xZlg7ITIaQg5wZXjrELSRFyjI4hIKsE8uZ/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(55016002)(86362001)(9686003)(71200400001)(8936002)(478600001)(76116006)(6506007)(5660300002)(8676002)(33656002)(186003)(4326008)(110136005)(316002)(7696005)(54906003)(52536014)(66946007)(66446008)(64756008)(66556008)(66476007)(2906002)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 3ORgaT4vCDaLD2LNSrt9g1+izFzHph3FINAtD6uiKCEMq85dj0EEgd1Hm4FOkqmE+3aneZMI7kLNmVER53Lx7z6FnZyKkH+1fdnCohNfJ01kuKHlhGgkskfvfVIaxlZg6EilVfLapP47OBF0mkH0VHcIASEblaUKCZlrPS0QO//Y7RWtO+ex3ZmVwx8oTklFghhFWzZyH4nRHAqMrdfjszPaukWWxiYiVRqGVLHqdb9sXZGZ3Uz/2zwKXBr/gjULk6ngyG83/7JsG68ZajMyFBcwlhJsMD5Btw9/HQkl/V1siHfS+VPHihkAUYmIaPVI1PSaB+iv7OOphg6q2vAN/gVI4k/AoLTFaVHV4rYK4/jyLIGg6XR0drQ//dGJ4lb6vw3mjiC5BwziEPmHeqUfEToYae6egng/to5M/imGH0mSS+XNfJsIGJzXBmRIogI4lPCFb2PMfSYV7405QwlaCTFmcRanlvedV3wL9rDYgPxbhcQ+GysJGsPP5ziMOzByETfJXH4UPjaxuMRQufvxTyYiqTAlAuZQpAoH1NKqDE9EkV8KOC0+0Jczyys19Y4vqmKvW7TZbX2fR/XjZvbRTpomHJkseMB+/CHoYcCJlxSbDugZBRmluMIABQkSpAZLN2+4cY3Dut9ciY+pTobsqg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6f7054-1f08-49f1-d46f-08d84016b9b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 05:56:01.9579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/uN9/bkQ+WcIq/b8CnpXqJqLc+EJQ4g2/YbqpNyLtyzyz86x8Vp598RGsj6CEj3Nj+fagZtFs+cI7h75k9vNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1725
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

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIEF1Z3VzdCAxMiwgMjAyMCA4OjQ3IFBNDQphcmFtZXRlcg0KPiANCj4gQ2hhbmdl
IHRoZSBsYXN0IHBhcmFtZXRlciBvZiB0aGUgdXBkYXRlX2VvaV9leGl0X2JpdG1hcCBoZWxwZXIg
dG8gYmUgYQ0KPiBzZXQvY2xlYXIgYm9vbGVhbiBpbnN0ZWFkIG9mIGEgdHJpZ2dlcmluZyBmaWVs
ZC4gVGhpcyBpcyBhbHJlYWR5DQo+IGlubGluZSB3aXRoIGhvdyB0aGUgZnVuY3Rpb24gaXMgaW1w
bGVtZW50ZWQsIGFuZCB3aWxsIGFsbG93IGRlY2lkaW5nDQo+IHdoZXRoZXIgYW4gZXhpdCBpcyBy
ZXF1aXJlZCBieSB0aGUgaGlnaGVyIGxheWVycyB0aGF0IGNhbGwgaW50bw0KPiB1cGRhdGVfZW9p
X2V4aXRfYml0bWFwLiBOb3RlIHRoYXQgdGhlIGN1cnJlbnQgYmVoYXZpb3IgaXMgbm90IGNoYW5n
ZWQNCj4gYnkgdGhpcyBwYXRjaC4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVk
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4N
Cg0KPiAtLS0NCj4gIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgIHwgNCArKy0tDQo+ICB4
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaCB8IDIgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3ZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4gaW5k
ZXggZWI1NGFhZGZiYS4uMWMwNGE3ZTNmYyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS92bXgvdm14LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4gQEAgLTE4
ODUsOSArMTg4NSw5IEBAIHN0YXRpYyB2b2lkIHZteF9zZXRfaW5mb19ndWVzdChzdHJ1Y3QgdmNw
dSAqdikNCj4gICAgICB2bXhfdm1jc19leGl0KHYpOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyB2b2lk
IHZteF91cGRhdGVfZW9pX2V4aXRfYml0bWFwKHN0cnVjdCB2Y3B1ICp2LCB1OCB2ZWN0b3IsIHU4
IHRyaWcpDQo+ICtzdGF0aWMgdm9pZCB2bXhfdXBkYXRlX2VvaV9leGl0X2JpdG1hcChzdHJ1Y3Qg
dmNwdSAqdiwgdWludDhfdCB2ZWN0b3IsIGJvb2wNCj4gc2V0KQ0KPiAgew0KPiAtICAgIGlmICgg
dHJpZyApDQo+ICsgICAgaWYgKCBzZXQgKQ0KPiAgICAgICAgICB2bXhfc2V0X2VvaV9leGl0X2Jp
dG1hcCh2LCB2ZWN0b3IpOw0KPiAgICAgIGVsc2UNCj4gICAgICAgICAgdm14X2NsZWFyX2VvaV9l
eGl0X2JpdG1hcCh2LCB2ZWN0b3IpOw0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9odm0vaHZtLmggYi94ZW4vaW5jbHVkZS9hc20tDQo+IHg4Ni9odm0vaHZtLmgNCj4gaW5kZXgg
MWViMzc3ZGQ4Mi4uYmUwZDhiMGE0ZCAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9odm0vaHZtLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgNCj4gQEAg
LTE5Miw3ICsxOTIsNyBAQCBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlIHsNCj4gICAgICB2b2lk
ICgqbmh2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMpKHN0cnVjdCBkb21haW4gKmQpOw0K
PiANCj4gICAgICAvKiBWaXJ0dWFsIGludGVycnVwdCBkZWxpdmVyeSAqLw0KPiAtICAgIHZvaWQg
KCp1cGRhdGVfZW9pX2V4aXRfYml0bWFwKShzdHJ1Y3QgdmNwdSAqdiwgdTggdmVjdG9yLCB1OCB0
cmlnKTsNCj4gKyAgICB2b2lkICgqdXBkYXRlX2VvaV9leGl0X2JpdG1hcCkoc3RydWN0IHZjcHUg
KnYsIHVpbnQ4X3QgdmVjdG9yLCBib29sIHNldCk7DQo+ICAgICAgdm9pZCAoKnByb2Nlc3NfaXNy
KShpbnQgaXNyLCBzdHJ1Y3QgdmNwdSAqdik7DQo+ICAgICAgdm9pZCAoKmRlbGl2ZXJfcG9zdGVk
X2ludHIpKHN0cnVjdCB2Y3B1ICp2LCB1OCB2ZWN0b3IpOw0KPiAgICAgIHZvaWQgKCpzeW5jX3Bp
cl90b19pcnIpKHN0cnVjdCB2Y3B1ICp2KTsNCj4gLS0NCj4gMi4yOC4wDQoNCg==

