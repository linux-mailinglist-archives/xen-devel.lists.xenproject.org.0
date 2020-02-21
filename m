Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4BF1680DE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:54:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59fh-0004ft-S7; Fri, 21 Feb 2020 14:52:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TqQj=4J=amazon.com=prvs=31305ddda=hongyxia@srs-us1.protection.inumbo.net>)
 id 1j59ff-0004fU-S7
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:52:51 +0000
X-Inumbo-ID: d494dc92-54b9-11ea-868f-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d494dc92-54b9-11ea-868f-12813bfff9fa;
 Fri, 21 Feb 2020 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582296771; x=1613832771;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ibl89eDsZCjVbfJxXj4UpTjNXyiSIwbRFj/OoFBwvk8=;
 b=S8hJP0//AL1CwQIg5QeknYMueFhU6Gf5VjL+IPa+w72OhYuvMGW8WlHM
 mRFZiXBAzK58njbkMw8KCTCNMlWkpTD4JeO3XGOzfUMfxBu2YNSlspc8H
 ZoiD7XMYVDzW5PhDJlViOFcpYgr2vrWp++WKwVabbjnI/U50LacMGqisX g=;
IronPort-SDR: 30oV7dCST8HS7zTlWetDubjic/hQgQ6ucXFyBaSfGMWeeTS7/g4IkDbIFVqOCeewjRcSYA/acf
 faKjKL7jnqeQ==
X-IronPort-AV: E=Sophos;i="5.70,468,1574121600"; d="scan'208";a="28090928"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 21 Feb 2020 14:52:48 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7AC56A26B0; Fri, 21 Feb 2020 14:52:46 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 21 Feb 2020 14:52:45 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 21 Feb 2020 14:52:44 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Fri, 21 Feb 2020 14:52:44 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Topic: [PATCH v2] x86/domain_page: implement pure per-vCPU mapping
 infrastructure
Thread-Index: AQHV3R91Y+G0jACGEk2zD96+LQsgPqgln+yAgAARR4CAAArnAIAAFswA
Date: Fri, 21 Feb 2020 14:52:44 +0000
Message-ID: <bf3284ac2e2a5a95d9a32b742108c553c6d09a02.camel@amazon.com>
References: <4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com>
 <20200221115017.tuo2i5db5mhd5yyt@debian>
 <2326943257e6f04bc9a858ef5667295651395c85.camel@amazon.com>
 <c373d061-4a1d-502b-98a3-d40ffa11ba47@suse.com>
In-Reply-To: <c373d061-4a1d-502b-98a3-d40ffa11ba47@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.15]
Content-ID: <AAE5F5D0BB4C5A488234A01FFC711E08@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
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

T24gRnJpLCAyMDIwLTAyLTIxIGF0IDE0OjMxICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMjEuMDIuMjAyMCAxMzo1MiwgWGlhLCBIb25neWFuIHdyb3RlOg0KPiA+IE9uIEZyaSwgMjAy
MC0wMi0yMSBhdCAxMTo1MCArMDAwMCwgV2VpIExpdSB3cm90ZToNCj4gPiA+IE9uIFRodSwgRmVi
IDA2LCAyMDIwIGF0IDA2OjU4OjIzUE0gKzAwMDAsIEhvbmd5YW4gWGlhIHdyb3RlOg0KPiA+ID4g
PiArICAgIGlmICggaGFzaG1mbiAhPSBtZm4gJiYgIXZjYWNoZS0+cmVmY250W2lkeF0gKQ0KPiA+
ID4gPiArICAgICAgICBfX2NsZWFyX2JpdChpZHgsIHZjYWNoZS0+aW51c2UpOw0KPiA+ID4gDQo+
ID4gPiBBbHNvLCBwbGVhc2UgZmx1c2ggdGhlIGxpbmVhciBhZGRyZXNzIGhlcmUgYW5kIHRoZSBv
dGhlcg0KPiA+ID4gX19jbGVhcl9iaXQNCj4gPiA+IGxvY2F0aW9uLg0KPiA+IA0KPiA+IEkgZmx1
c2ggd2hlbiBhIG5ldyBlbnRyeSBpcyB0YWtpbmcgYSBzbG90LiBZZWFoLCBpdCdzIHByb2JhYmx5
DQo+ID4gYmV0dGVyDQo+ID4gdG8gZmx1c2ggZWFybGllciB3aGVuZXZlciBhIHNsb3QgaXMgbm8g
bG9uZ2VyIGluIHVzZS4NCj4gDQo+IFF1ZXN0aW9uIGlzIHdoZXRoZXIgc3VjaCBpbmRpdmlkdWFs
IGZsdXNoZXMgYXJlbid0IGFjdHVhbGx5DQo+IG1vcmUgb3ZlcmhlYWQgdGhhbiBhIHNpbmdsZSBm
bHVzaCBjb3ZlcmluZyBhbGwgcHJldmlvdXNseQ0KPiB0b3JuIGRvd24gZW50cmllcywgZG9uZSBh
dCBzdWl0YWJsZSBwb2ludHMgKHNlZSB0aGUgcHJlc2VudA0KPiBpbXBsZW1lbnRhdGlvbikuDQoN
ClRoZXJlIGlzIGNlcnRhaW5seSByb29tIGZvciBpbXByb3ZlbWVudC4gSSBhbSBjb25zaWRlcmlu
ZyBmbHVzaGluZw0KZW50cmllcyBpbiBiYXRjaGVzIHRvIHJlZHVjZSB0aGUgb3ZlcmhlYWQsIGUu
Zy4sIGluIGEgc2ltaWxhciB3YXkgdG8NCnRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGFzIHlv
dSBzYWlkLg0KDQpJIHdhbnQgdG8gZGVmZXIgdGhhdCB0byBhIHNlcGFyYXRlIHBhdGNoIGJlY2F1
c2UgdGhpcyBpcyBhbHJlYWR5IGEgaHVnZQ0KcGF0Y2guIEZyb20gdGhlIGJlbmNobWFya3MgSSBo
YXZlIGRvbmUgc28gZmFyLCBpdCBkb2VzIG5vdCBsb29rIGxpa2UNCnRoaXMgaGFzIGFueSBub3Rp
Y2VhYmxlIG92ZXJoZWFkIGFuZCBpdCBhbHJlYWR5IGFsbGV2aWF0ZXMgdGhlIGxvY2sNCmNvbnRl
bnRpb24sIHBsdXMgdGhpcyBpcyBjdXJyZW50bHkgdXNlZCBvbmx5IGluIGEgZGVidWcgYnVpbGQs
IHNvIEkNCndvdWxkIGxpa2UgdG8gZGVmZXIgdGhlIG9wdGltaXNhdGlvbiBhIGJpdC4NCg0KSG9u
Z3lhbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
