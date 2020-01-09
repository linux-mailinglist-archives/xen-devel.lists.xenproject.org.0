Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9FE135CF2
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 16:39:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipZrT-0005al-UM; Thu, 09 Jan 2020 15:36:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jlRd=26=amazon.com=prvs=27044ddb7=hongyxia@srs-us1.protection.inumbo.net>)
 id 1ipZrS-0005af-E2
 for xen-devel@lists.xen.org; Thu, 09 Jan 2020 15:36:38 +0000
X-Inumbo-ID: d2bf4e38-32f5-11ea-b9fa-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2bf4e38-32f5-11ea-b9fa-12813bfff9fa;
 Thu, 09 Jan 2020 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578584198; x=1610120198;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ow2kfdgCcSUcQsljHA2pYViILQjxfEp5pSXigODlwM4=;
 b=cK2xMrbX5pft1yyq4k8tVm1xniCAS2RcOtm5HwHO4oVdu4EXuChB7Ghs
 lKeJkeQWB6E9YSpy5k6E4ATzahAU2aKVaqoEFgaw41zBbyIW8srdzxVJp
 Ygk7/kYWmWLCG5yBNFzIkX/Y3ACRwJdFzL7JDqcc/LY7F+1NCMiqpU53W Q=;
IronPort-SDR: RchIDVd+ckByKax/QfTO4cvQdiQ47QuFQiuioMvMcO+xYKjynAqQJixA9IXjDPP0T93bQCnyZY
 CY+4oGcroE9g==
X-IronPort-AV: E=Sophos;i="5.69,414,1571702400"; d="scan'208";a="17701027"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 09 Jan 2020 15:36:27 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 89762A21A8; Thu,  9 Jan 2020 15:36:25 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 9 Jan 2020 15:36:24 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 9 Jan 2020 15:36:24 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Thu, 9 Jan 2020 15:36:24 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Thread-Topic: [Xen-devel] Xen 4.14 and future work
Thread-Index: AQHVxv5czFoQ1JW5tU6BoM2yvU1hMqfidxuA
Date: Thu, 9 Jan 2020 15:36:24 +0000
Message-ID: <910b7c4bee89536dd7fe0174af6c61099ccda761.camel@amazon.com>
References: <941cf23c-13ed-14a1-fd25-45b001d9564a@citrix.com>
In-Reply-To: <941cf23c-13ed-14a1-fd25-45b001d9564a@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.5]
Content-ID: <1A19657CA62C924F8346422440B7269E@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] Xen 4.14 and future work
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDE5LTEyLTAyIGF0IDE5OjUxICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiAuLi4NCj4gDQo+IE90aGVyIGFyZWFzIGluIG5lZWQgb2Ygd29yayBpcyB0aGUgYm9vdCB0aW1l
IGRpcmVjdG1hcCBhdCAwICh3aGljaA0KPiBoaWRlcw0KPiBOVUxMIHBvaW50ZXIgZGVmZXJlbmNl
cyBkdXJpbmcgYm9vdCksIGFuZCB0aGUgY29ycmVjdCBoYW5kbGluZyBvZg0KPiAlZHI2DQo+IGZv
ciBhbGwga2luZHMgb2YgZ3Vlc3RzLg0KPiANCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IHRv
IHRoaXMgdGhyZWFkLiBUYWxraW5nIGFib3V0IHRoZSBkaXJlY3RtYXAsDQp3aWxsIHdlIGhhdmUg
dGltZSBhbmQgZW5naW5lZXJpbmcgcG93ZXIgdG8gbG9vayBhdCB0aGUgZGlyZWN0IG1hcA0KcmVt
b3ZhbCBzZXJpZXM/IEkgaGF2ZSBiZWVuIG1haW50YWluaW5nLCB0ZXN0aW5nIGFuZCBiZW5jaG1h
cmtpbmcgaXQNCnNpbmNlIGxhdGUgNC4xMyBhbmQgaXQgd291bGQgYmUgbmljZSB0byBoYXZlIChw
YXJ0IG9mKSBpdCBpbiA0LjE0Lg0KDQpUaGUgYnVsayBvZiB0aGUgc2VyaWVzIGlzIG1vdmluZyB0
aGluZ3MgZnJvbSB4ZW5oZWFwIHRvIGRvbWhlYXAgc2l0ZSBieQ0Kc2l0ZSwgd2hpY2ggc2hvdWxk
IG5vdCBiZSBkaWZmaWN1bHQgdG8gcmV2aWV3LiBUaGUgZGlyZWN0IG1hcCBpcyBvbmx5DQpyZW1v
dmVkIGF0IHRoZSBmaW5hbCBzdGFnZSBvZiB0aGUgc2VyaWVzLCBzbyBiZWZvcmUgdGhhdCBjb21l
cyBpbiwNCmRvbWhlYXAgaXMgc3RpbGwgbWFwcGVkIHZpYSB0aGUgZGlyZWN0IG1hcCBhbmQgdGhl
cmUgd2lsbCBub3QgZXZlbiBiZQ0KcGVyZm9ybWFuY2UgZGlmZmVyZW5jZXMuIEkgYW0gdGhpbmtp
bmcgdGhhdCB3ZSBjb3VsZCBhdCBsZWFzdCBtZXJnZQ0KbW9zdCBvZiB0aGUgdHJhbnNpdGlvbnMg
dG8gZG9taGVhcCBpbiA0LjE0Lg0KDQpIb25neWFuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
