Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C507F296997
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 08:15:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10691.28572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVqLT-0007yU-5l; Fri, 23 Oct 2020 06:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10691.28572; Fri, 23 Oct 2020 06:14:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVqLT-0007y5-2W; Fri, 23 Oct 2020 06:14:35 +0000
Received: by outflank-mailman (input) for mailman id 10691;
 Fri, 23 Oct 2020 06:14:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3Pz=D6=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kVqLQ-0007y0-Mc
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 06:14:32 +0000
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e282ee3b-c436-4df9-a51a-263ea46f29b9;
 Fri, 23 Oct 2020 06:14:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 23:14:24 -0700
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2020 23:14:22 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 22 Oct 2020 23:14:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 22 Oct 2020 23:14:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 22 Oct 2020 23:14:19 -0700
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR1101MB2093.namprd11.prod.outlook.com (2603:10b6:301:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Fri, 23 Oct
 2020 06:14:19 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::c88f:585f:f117:930b]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::c88f:585f:f117:930b%8]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 06:14:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=q3Pz=D6=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
	id 1kVqLQ-0007y0-Mc
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 06:14:32 +0000
X-Inumbo-ID: e282ee3b-c436-4df9-a51a-263ea46f29b9
Received: from mga09.intel.com (unknown [134.134.136.24])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e282ee3b-c436-4df9-a51a-263ea46f29b9;
	Fri, 23 Oct 2020 06:14:28 +0000 (UTC)
IronPort-SDR: L/bTAiSO9kjSHnSN2uvOTj7xOAodvbqofjbh50JrVDNJzmySe0sG9FfOI8P1SKOjaXkD6OVF7a
 nTR9wqHXZwlg==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="167756536"
X-IronPort-AV: E=Sophos;i="5.77,407,1596524400"; 
   d="scan'208";a="167756536"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 23:14:24 -0700
IronPort-SDR: fNoKPtKDIoEM1Ovyrm8WnfHIz35JN5/rAHF/wTQPGuonrvcAsJGl5QpUrbuR625UyUTUqoG1Zz
 kswpY+B4iXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,407,1596524400"; 
   d="scan'208";a="423334573"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2020 23:14:22 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 22 Oct 2020 23:14:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 22 Oct 2020 23:14:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 22 Oct 2020 23:14:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLVWEOAJ86jajKGH0M9WMFacu1xI5OGoviQYsb0Jz+KWmWlJ/kGzoCzWr3q0RMRgaMXGqJ/8aSddW+JjCAidK1Yj/z/sPS2PEFEYVqTvZXQZweqgLsXvCFkOLoAfWTzMa7u5h0PAMzcMnWXtQHddVzYNFJrjK6hDC0Wahx85+ZmKndv/RLFdvWVJ2bKCpbHMCrrvP+PqN5z1rAZMO6mzOjPd5VKN6naUShezf9YWS9U8mY1mbLYC7IEbIpwevXBzbws5tJtSjShF1vNxcy2gYkj82Mpz4mj0hxPkhU7gmlgC/+Ovm2imQ/65ltIoiIBfRjY3+102yD9rZJsAv452Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+4hRcPBg99tlqBnoQ1lN1cY0rIsJir5Oqdog60o+EE=;
 b=YWJ9rpaQvdTyzBH0/jp8QxRU2EQO4RrYL1qVg8NUWKynWvoQwEjFqQmWz37dg574Jy78VToz+HvTFv1awHgmKix8f7F6SyQd008cuMydmdQiLjOscbG3eD6JlJqiUqmmnqCcVcQiKXClXPG1PnLnp96l4U65WkoSVD8nImunCp7LJNSjwBCMv6xYsUeafS1gX78xqrbZQskG8q9xqoImMgaLWzXx9ntCJRMi2ZDFRsXzyhv936kWyoCFFDhc3MoauYDUlkAxdwZw0BuEOmE2qPQHaaqPW3yfNjArvxQWXJjoiJgTrTzFvhLA1PywmRzTfZ2BKAb4JQLQikDiY/AwSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+4hRcPBg99tlqBnoQ1lN1cY0rIsJir5Oqdog60o+EE=;
 b=w3lvqTo5oMBa4KR+BveE6jkbtECtgolqsrG6mHnX14iy1o8HqYrEsnI/lgB+ac76ce8sSq58UPyzcJ4dyhuyohollZtPEIGXQtOHG50ekz6DIy2Bqzab7IenRHglorP2q8ZDu5qEsofvBhNniUYJUPYsdGtyNZUOTXKjSBZ2ElM=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR1101MB2093.namprd11.prod.outlook.com (2603:10b6:301:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Fri, 23 Oct
 2020 06:14:19 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::c88f:585f:f117:930b]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::c88f:585f:f117:930b%8]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 06:14:19 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before re-entering
 guest"
Thread-Topic: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before
 re-entering guest"
Thread-Index: AQHWnk5UOwH5YPFK10i1vYA9BQPqg6mVtt4AgAFwXACAAS7uAIACEe2AgARKRQCAAHZigIABC12AgASUbqA=
Date: Fri, 23 Oct 2020 06:14:18 +0000
Message-ID: <MWHPR11MB1645D1ECA854D208D933392A8C1A0@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20201009150948.31063-1-andrew.cooper3@citrix.com>
 <fb4a7a1d-95ad-0b59-7cb9-4a94c3600960@suse.com>
 <01bb2f27-4e0b-3637-e456-09eb7b9b233e@citrix.com>
 <1786f728-15c2-3877-c01a-035b11bd8504@suse.com>
 <82e64d10-50be-68ab-127b-99d205a0a768@citrix.com>
 <6430fef8-23f1-f4ef-8741-5e089eaa0df9@suse.com>
 <8b618252-4535-a8d9-efb9-0c1fba176ff4@citrix.com>
 <4eb096ab-7052-f6a9-a5ee-74d18683dde3@suse.com>
In-Reply-To: <4eb096ab-7052-f6a9-a5ee-74d18683dde3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb90937b-ec62-4e12-1945-08d8771ae05e
x-ms-traffictypediagnostic: MWHPR1101MB2093:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2093FF975DD4620AA780562E8C1A0@MWHPR1101MB2093.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6IMZFA4w6JQgjk/qcHeheIe5oIZpLJL88fVnMeX+tM7vu4Ngs0/G9jt4gO0MAFYZ5KGkI+SVZTsqE01O8F90Ij8xzv1qEU2goksW9WQk0cXAGhp2lDquF2RyNad3pmx+zrTmz0pRGljQZaDrV/eOgSyu65wvh4clbW1FANCVrbifCFYaGQBA4XxlyJuDB8fiOo3QwzLKHrjX1YrfGOKNP11hTwtl2HYaKuC5xxvE2JNHyhdt8HZ7z9brwvHHwGA+1etYBcDVa0BFrHq8qWW0b9WWDmdG9JHJ9+R/VK+khlgNjxLfLm1iZ2FYNg4Zjj+8cb+4cCKWKpPYqSKpE/XpTw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1645.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(76116006)(7696005)(186003)(66446008)(83380400001)(5660300002)(66946007)(66556008)(64756008)(6506007)(71200400001)(8676002)(52536014)(4326008)(53546011)(86362001)(2906002)(316002)(8936002)(66476007)(9686003)(110136005)(26005)(33656002)(6636002)(54906003)(478600001)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 1qg2MuWuGWSEpR/TQwg6ORzn+NeW0xbWQBMkmzT7MXVA85I671YmJZ7cEJN+Lg+C8AiWKoeQHN0A4TwY4aY4/5qa93GGTiXzEKz+/Kxum2PNu2ua8X92driQukK7JT2wEtwlbviKlD/XuQ7YZS52Ze+wxNfaQ0ub9Lh9hxJDM2pOpZQigu2sV305b8GqRrCyU29wWQ8SG+Mgg33DfnWNhbgTUJ+BNrDtJHcB3/AJq2yi9mI2YTMx2lWpMZacwvbr0PGEJja16cAzqIRHdD2YvEynzsMktPH+zpmSFeOWPDePMpJlgTu95TrFi9m0RDBhZAUGOfvYR8QdDGEPtGg+0WjMW8Y7pzP7+7a0kv3aPZi36g9P3w0OGJFSCU8n3Eq1F2XZ0FLHAs1wJlGdJj7zLIGGNhVNgahhKFnwUEK2N0Ma10ps3P3oqSNuQooPQVpyf97x4Eq28UxjF11pV06AYiuFCDV5SuAITxZ1C76QPmeW2uiTc8vHHee1yiEF9UymAWR3eX2UCQxQJpOKZSopc1j4GWf6MFt1PEaDV7FZ9jy7TK+8ZKPIZe0Q1OurpaHm131UMap9j3NEbeV4blpyK05/J6l/Un2JYmMJIxQuf1hJBT2myLBR2qDhK1u29mf7WYt254WlUHOoVdV4KNPylw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb90937b-ec62-4e12-1945-08d8771ae05e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2020 06:14:18.8873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejYb0WxBOovmgeknoagAcKCejeJ3U98AZsPDM4hPm/Wm/4jM/hW2vVyBD5FNqNZxFCxoN3ZG9PEa7AXQY0DitA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2093
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE9jdG9iZXIgMjAsIDIwMjAgNDoxMCBQTQ0KPiANCj4gT24gMTkuMTAuMjAyMCAxODoxMiwgQW5k
cmV3IENvb3BlciB3cm90ZToNCj4gPiBPbiAxOS8xMC8yMDIwIDEwOjA5LCBKYW4gQmV1bGljaCB3
cm90ZToNCj4gPj4gT24gMTYuMTAuMjAyMCAxNzozOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4g
Pj4+IE9uIDE1LzEwLzIwMjAgMDk6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+Pj4+IE9uIDE0
LjEwLjIwMjAgMTU6NTcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+ID4+Pj4+IFJ1bm5pbmcgd2l0
aCBjb3JydXB0IHN0YXRlIGlzIGV2ZXJ5IGJpdCBhbiBYU0EgYXMgaGl0dGluZyBhIFZNRW50cnkN
Cj4gPj4+Pj4gZmFpbHVyZSBpZiBpdCBjYW4gYmUgdHJpZ2dlcmVkIGJ5IHVzZXJzcGFjZSwgYnV0
IHRoZSBsYXR0ZXIgc2FmZXIgYW5kDQo+ID4+Pj4+IG11Y2ggbW9yZSBvYnZpb3VzLg0KPiA+Pj4+
IEkgZGlzYWdyZWUuIEZvciBDUEwgPiAwIHdlIGRvbid0ICJjb3JydXB0IiBndWVzdCBzdGF0ZSBh
bnkgbW9yZQ0KPiA+Pj4+IHRoYW4gcmVwb3J0aW5nIGEgI0dQIGZhdWx0IHdoZW4gb25lIGlzIGdv
aW5nIHRvIGJlIHJlcG9ydGVkDQo+ID4+Pj4gYW55d2F5IChhcyBsb25nIGFzIHRoZSBWTSBlbnRy
eSBkb2Vzbid0IGZhaWwsIGFuZCBoZW5jZSB0aGUNCj4gPj4+PiBndWVzdCB3b24ndCBnZXQgY3Jh
c2hlZCkuIElPVyB0aGlzIHJhaXNpbmcgb2YgI0dQIGFjdHVhbGx5IGlzIGENCj4gPj4+PiBwcmVj
YXV0aW9uYXJ5IG1lYXN1cmUgdG8gX2F2b2lkXyBYU0FzLg0KPiA+Pj4gSXQgZG9lcyBub3QgcmVt
b3ZlIGFueSBYU0FzLsKgIEl0IG1lcmVseSBoaWRlcyB0aGVtLg0KPiA+PiBIb3cgdGhhdD8gSWYg
d2UgY29udmVydCB0aGUgYWJpbGl0eSBvZiBndWVzdCB1c2VyIG1vZGUgdG8gY3Jhc2gNCj4gPj4g
dGhlIGd1ZXN0IGludG8gZGVsaXZlciBvZiAjR1AoMCksIGhvdyBpcyB0aGVyZSBhIGhpZGRlbiBY
U0EgdGhlbj8NCj4gPg0KPiA+IEJlY2F1c2UgdXNlcnNwYWNlIGJlaW5nIGFibGUgdG8gdHJpZ2dl
cmluZyB0aGlzIGZpeHVwIGlzIHN0aWxsIGFuIFhTQS4NCj4gDQo+IEhvdyBkbyB5b3Uga25vdyB3
aXRob3V0IGEgc3BlY2lmaWMgY2FzZSBhdCBoYW5kPyBJdCBtYXkgd2VsbCBiZQ0KPiB0aGF0IGFs
bCB0aGF0J3MgaW1wYWN0ZWQgaXMgZ3Vlc3QgdXNlciBzcGFjZSwgaW4gd2hpY2ggY2FzZSBJDQo+
IGRvbid0IHNlZSB3aHkgdGhlcmUgd291bGQgbmVlZCB0byBiZSBhbiBYU0EuIEl0J3Mgc3RpbGwg
YSBidWcNCj4gdGhlbiwgc3VyZS4NCj4gDQo+ID4+Pj4+IEl0IHdhcyB0aGUgYXBwcm9wcmlhdGUg
c2VjdXJpdHkgZml4IChnaXZlIG9yIHRha2UgdGhlIGZ1bmN0aW9uYWwgYnVnIGluDQo+ID4+Pj4+
IGl0KSBhdCB0aGUgdGltZSwgZ2l2ZW4gdGhlIGNvbXBsZXhpdHkgb2YgcmV0cm9maXR0aW5nIHpl
cm8gbGVuZ3RoDQo+ID4+Pj4+IGluc3RydWN0aW9uIGZldGNoZXMgdG8gdGhlIGVtdWxhdG9yLg0K
PiA+Pj4+Pg0KPiA+Pj4+PiBIb3dldmVyLCBpdCBpcyBvbmUgb2YgYSB2ZXJ5IGxvbmcgbGlzdCBv
ZiBndWVzdC1zdGF0ZS1pbmR1Y2VkIFZNRW50cnkNCj4gPj4+Pj4gZmFpbHVyZXMsIHdpdGggbm9u
LXRyaXZpYWwgbG9naWMgd2hpY2ggd2UgYXNzZXJ0IHdpbGwgcGFzcywgb24gYQ0KPiA+Pj4+PiBm
YXN0cGF0aCwgd2hlcmUgaGFyZHdhcmUgYWxzbyBwZXJmb3JtcyB0aGUgc2FtZSBjaGVja3MgYW5k
IHdlDQo+IGFscmVhZHkNCj4gPj4+Pj4gaGF2ZSBhIHJ1bnRpbWUgc2FmZSB3YXkgb2YgZGVhbGlu
ZyB3aXRoIGVycm9ycy7CoCAoSGVuY2Ugbm90IGFjdHVhbGx5DQo+ID4+Pj4+IHVzaW5nIEFTU0VS
VF9VTlJFQUNIQUJMRSgpIGhlcmUuKQ0KPiA+Pj4+ICJSdW50aW1lIHNhZmUiIGFzIGZhciBhcyBY
ZW4gaXMgY29uY2VybmVkLCBJIHRha2UgaXQuIFRoaXMgaXNuJ3Qgc2FmZQ0KPiA+Pj4+IGZvciB0
aGUgZ3Vlc3QgYXQgYWxsLCBhcyB2bXhfZmFpbGVkX3ZtZW50cnkoKSByZXN1bHRzIGluIGFuDQo+
ID4+Pj4gdW5jb25kaXRpb25hbCBkb21haW5fY3Jhc2goKS4NCj4gPj4+IEFueSBWTUVudHJ5IGZh
aWx1cmUgaXMgYSBidWcgaW4gWGVuLsKgIElmIHVzZXJzcGFjZSBjYW4gdHJpZ2dlciBpdCwgaXQg
aXMNCj4gPj4+IGFuIFhTQSwgKmlycmVzcGVjdGl2ZSogb2Ygd2hldGhlciB3ZSBjcmFzaCB0aGUg
ZG9tYWluIHRoZW4gYW5kIHRoZXJlLA0KPiBvcg0KPiA+Pj4gd2hldGhlciB3ZSBsZXQgaXQgdHJ5
IGFuZCBsaW1wIG9uIHdpdGggY29ycnVwdGVkIHN0YXRlLg0KPiA+PiBBbGxvd2luZyB0aGUgZ3Vl
c3QgdG8gY29udGludWUgd2l0aCBjb3JydXB0ZWQgc3RhdGUgaXMgbm90IGENCj4gPj4gdXNlZnVs
IHRoaW5nIHRvIGRvLCBJIGFncmVlLiBIb3dldmVyLCB3aGF0IGZhbGxzIHVuZGVyDQo+ID4+ICJj
b3JydXB0ZWQiIHNlZW1zIHRvIGJlIGRpZmZlcmVudCBmb3IgeW91IGFuZCBtZS4gSSdkIG5vdCBj
YWxsDQo+ID4+IGRlbGl2ZXJ5IG9mICNHUCAiY29ycnVwdGlvbiIgaW4gYW55IHdheS4NCj4gPg0K
PiA+IEkgY2FuIG9ubHkgcmVwZWF0IG15IHByZXZpb3VzIHN0YXRlbWVudDoNCj4gPg0KPiA+PiBU
aGVyZSBhcmUgbGVnYWwgc3RhdGVzIHdoZXJlIFJJUCBpcyAweDAwMDA4MDAwMDAwMDAwMDAgYW5k
ICNHUCBpcyB0aGUNCj4gPj4gd3JvbmcgdGhpbmcgdG8gZG8uDQo+ID4NCj4gPiBCbGluZGx5IHJh
aXNpbmcgI0dQIGluIGlzIG5vdCBhbHdheXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLg0KPiANCj4g
QWdhaW4gLSB3ZSdyZSBpbiBhZ3JlZW1lbnQgYWJvdXQgImJsaW5kbHkiLiBMZXQncyBiZSBsZXNz
IGJsaW5kLg0KPiANCj4gPj4gIFRoZSBwcmltYXJ5IGdvYWwgb3VnaHQNCj4gPj4gdG8gYmUgdGhh
dCB3ZSBkb24ndCBjb3JydXB0IHRoZSBndWVzdCBrZXJuZWwgdmlldyBvZiB0aGUgd29ybGQuDQo+
ID4+IEl0IG1heSB0aGVuIGhhdmUgdGhlIG9wcG9ydHVuaXR5IHRvIGtpbGwgdGhlIG9mZmVuZGlu
ZyB1c2VyDQo+ID4+IG1vZGUgcHJvY2Vzcy4NCj4gPg0KPiA+IEJ5IHRoZSB0aW1lIHdlIGhhdmUg
aGl0IHRoaXMgY2FzZSwgYWxsIGJldHMgYXJlIG9mZiwgYmVjYXVzZSBYZW4gKmlzKg0KPiA+IG1h
bGZ1bmN0aW9uaW5nLsKgIFdlIGhhdmUgbm8gaWRlYSBpZiBrZXJuZWwgY29udGV4dCBpcyBzdGls
bCBpbnRhY3QuwqAgWW91DQo+ID4gZG9uJ3QgZXZlbiBrbm93IHRoYXQgY3VycmVudCB1c2VyIGNv
bnRleHQgaXMgdGhlIGNvcnJlY3Qgb2ZmZW5kaW5nDQo+ID4gY29udGV4dCB0byBjbG9iYmVyLCBh
bmQgbWlnaHQgYmUgY3JlYXRpbmcgYSB1c2VyPT51c2VyIERvUyB2dWxuZXJhYmlsaXR5Lg0KPiA+
DQo+ID4gV2UgZGVmaW5pdGVseSBoYXZlIGFuIFhTQSB0byBmaW5kIGFuZCBmaXgsIGFuZCB3ZSBj
YW4gZWl0aGVyIG1ha2UgaXQNCj4gPiB2ZXJ5IG9idmlvdXMgYW5kIGxpa2VseSB0byBiZSByZXBv
cnRlZCwgb3IgaGlkZGVuIGFuZCBsaWFibGUgdG8gZ28NCj4gPiB1bm5vdGljZWQgZm9yIGEgbG9u
ZyBwZXJpb2Qgb2YgdGltZS4NCj4gDQo+IFdoeSB3b3VsZCBpdCBnbyB1bm5vdGljZWQgd2hlbiB3
ZSBsb2cgdGhlIGluY2lkZW50PyBJIHZlcnkgbXVjaA0KPiBob3BlIHBlb3BsZSBpbnNwZWN0IHRo
ZWlyIGxvZ3MgYXQgbGVhc3QgZXZlcnkgb25jZSBpbiBhIHdoaWxlIC4uLg0KPiANCj4gQW5kIGFz
IHBlciBhYm92ZSAtIEkgZGlzYWdyZWUgd2l0aCB5b3VyIHVzZSBvZiAiZGVmaW5pdGVseSIgaGVy
ZS4NCj4gV2UgaGF2ZSBhIGJ1ZyB0byBhbmFseXplIGFuZCBmaXgsIHllcy4gV2hldGhlciBpdCdz
IGFuIFhTQS13b3J0aHkNCj4gb25lIGlzbid0IGtub3duIGFoZWFkIG9mIHRpbWUsIHVubGVzcyB3
ZSBjcmFzaCB0aGUgZ3Vlc3QgaW4gc3VjaA0KPiBhIGNhc2UuDQo+IA0KPiBJbiBhbnkgZXZlbnQg
SSB0aGluayBpdCdzIGFib3V0IHRpbWUgdGhhdCB0aGUgVk1YIG1haW50YWluZXJzDQo+IHZvaWNl
IHRoZWlyIHZpZXdzIGhlcmUsIGFzIHRoZXkncmUgdGhlIG9uZXMgdG8gYXBwcm92ZSBvZg0KPiB3
aGljaGV2ZXIgY2hhbmdlIHdlIGVuZCB1cCB3aXRoLiBLZXZpbiwgSnVuPw0KPiANCg0KSG9uZXN0
bHkgc3BlYWtpbmcgYm90aCBvZiB5b3VyIG9wdGlvbnMgbWFrZSBzb21lIHNlbnNlLiBhbmQNCkkg
ZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYSBwZXJmZWN0IGFuc3dlciBoZXJlLiBQZXJzb25hbGx5IEkn
bSBtb3JlDQphbGlnbmVkIHdpdGggSmFuJ3MgcG9pbnQgb24gcHJldmVudGluZyBndWVzdCB1c2Vy
IGZyb20gY3Jhc2hpbmcNCnRoZSB3aG9sZSBkb21haW4uIEJ1dCBsZXQncyBhbHNvIGhlYXIgZnJv
bSBvdGhlcnMnIG9waW5pb25zIGFzIA0KSSBiZWxpZXZlIHRoaXMgZGlsZW1tYSBtaWdodCBiZSBz
ZWVuIGluIG90aGVyIHBsYWNlcyB0b28gdGh1cyANCm1heSBuZWVkIGEgZ2VuZXJhbCBjb25zZW5z
dXMgaW4gWGVuIGNvbW11bml0eS4NCg0KVGhhbmtzDQpLZXZpbg0K

