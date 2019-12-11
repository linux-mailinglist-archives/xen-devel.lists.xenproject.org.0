Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E525411A8EF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 11:30:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iezEH-0002iw-Vh; Wed, 11 Dec 2019 10:28:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SbsP=2B=amazon.com=prvs=241424563=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iezEG-0002iq-VO
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 10:28:24 +0000
X-Inumbo-ID: f6301bba-1c00-11ea-8aeb-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6301bba-1c00-11ea-8aeb-12813bfff9fa;
 Wed, 11 Dec 2019 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576060105; x=1607596105;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cMc8Yika+smwEQIeRWeF+bUwktvAzmDJjNHREQLu/dI=;
 b=pVGnX+gnGNq65bEBV5rECVQz60fz+bhHyAZZ8FbbFFyNY153p+Sjxc7l
 7y1F8/L/CUxWw7MqdmicstL5y+DNthyKTOekmDoEy6uSEyLvLy8/xlbMg
 aoU7kp0bSRULFG6u/Q8nQBCzmjNfyRyp7SXuZMg25pb3Eho1vFmRXGz+W Y=;
IronPort-SDR: tsaW+098i8pRLfQOtdDVNdH/QJwdDCxqKFk1tvR7J+trkXyo6MHk8K0gPndiEnnt1OC/k6+S+D
 9NaNtlS/FiOw==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="8072609"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 11 Dec 2019 10:28:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id C3C4FA074E; Wed, 11 Dec 2019 10:28:21 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 10:28:20 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 10:28:20 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Wed, 11 Dec 2019 10:28:20 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Topic: [PATCH v2 1/2] x86/mm: factor out the code for shattering an l3
 PTE
Thread-Index: AQHVr21Mya/2xs4A+0SBttLhz9PjBqe0vI6A
Date: Wed, 11 Dec 2019 10:28:20 +0000
Message-ID: <477a3393debd18473fd15a4ec28a31d76376d320.camel@amazon.com>
References: <cover.1575891620.git.hongyxia@amazon.com>
 <3375af1e708b4ec3205f493a17da6e0369249096.1575891620.git.hongyxia@amazon.com>
 <3ab3715f-487c-8351-726f-5155c5454d83@suse.com>
In-Reply-To: <3ab3715f-487c-8351-726f-5155c5454d83@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.172]
Content-ID: <5ABAF6949A11EA428F77B22330084E3F@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDE5LTEyLTEwIGF0IDE2OjIwICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
DQo+ICAgICAgICAgb2wyZSA9IGwyZV9mcm9tX2ludHB0ZSgNCj4gICAgICAgICAgICAgICAgICAg
IGwyZV9nZXRfaW50cHRlKG9sMmUpICsgKFBBR0VfU0laRSA8PA0KPiBQQUdFVEFCTEVfT1JERVIp
KTsNCj4gDQo+IE9mIGNvdXJzZSwgYXMgbWVudGlvbmVkIGJlZm9yZSwgSSdtIG5vdCBvdmVybHkg
aGFwcHkgdG8gc2VlIHR5cGUNCj4gc2FmZXR5IGxvc3QgaW4gY2FzZSBsaWtlIHRoaXMgb25lLCB3
aGVyZSBpdCdzIG5vdCBuZWVkZWQgbGlrZSBlLmcuDQo+IGZ1cnRoZXIgdXAgdG8gY29udmVydCBm
cm9tIEwzIHRvIEwyIGVudHJ5Lg0KPiANCg0KT2theSwgc28gSSBkaWQgYSBjb21wYXJpc29uIGJl
dHdlZW4gdGhlIGVmZmljaWVuY3kgb2YgdGhlIGFzc2VtYmx5DQp1bmRlciBhIHJlbGVhc2UgYnVp
bGQuDQoNClRoZSBvbGQgInR5cGUtc2FmZSIgd2F5IHJlcXVpcmVzIDE2IGluc3RydWN0aW9ucyB0
byBwcmVwYXJlIHRoZSBmaXJzdA0KbDJlLCBhbmQgZWFjaCBpdGVyYXRpb24gb2YgdGhlIGlubmVy
IGxvb3Agb2YgcG9wdWxhdGluZyBsMnQgcmVxdWlyZXMgNw0KaW5zdHJ1Y3Rpb25zLg0KDQpUaGUg
bmV3IHR5cGUtdW5zYWZlIHdheSByZXF1aXJlcyA2IHRvIHByZXBhcmUgdGhlIGZpcnN0IGwyZSwg
YW5kIGVhY2gNCml0ZXJhdGlvbiBvZiBwb3B1bGF0aW5nIGwydCB0YWtlcyA1IGluc3RydWN0aW9u
cy4NCg0KU28gdGhlIGRpZmZlcmVuY2Ugb2YgcG9wdWxhdGluZyBsMnQgaXMgMzYwMCB2cy4gMjU2
NiBpbnN0cnVjdGlvbnMsDQp3aGljaCBpcyBub3QgdmVyeSBzbWFsbC4NCg0KSSBoYXZlIG5vdCB0
ZXN0ZWQgdGhlIHBhY2tlZCBiaXQgZmllbGQgd2F5IHlvdSBzdWdnZXN0ZWQsIGJ1dCBJIHRoaW5r
DQppdCBjb3VsZCBldmVuIGJlIGhpZ2hlciB0aGFuIDM2MDAgZHVlIHRvIG1hc2tpbmcsIHNoaWZ0
aW5nIGFuZCBhbHNvDQpvdmVyZmxvdyBoYW5kbGluZy4NCg0KSG9uZ3lhbg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
