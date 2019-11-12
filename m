Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B169F969D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 18:06:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUZYU-0007TN-6g; Tue, 12 Nov 2019 17:02:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jBsL=ZE=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iUZYT-0007TH-6z
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 17:02:13 +0000
X-Inumbo-ID: 2b0f1150-056e-11ea-a21f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b0f1150-056e-11ea-a21f-12813bfff9fa;
 Tue, 12 Nov 2019 17:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573578132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xzapXTPZ36gGex88wreJZoPKk+GslaLEQphcfjIOj2Q=;
 b=ZfnBzZZkGg8cJXaq3rPfTQ+JriLQ640FfPF66z9eWyIHjSJJYkR1lHeN
 mldNvOktiMEAqAD/QPxrQAFTQHojHLXZl+f9E6re7o8OAnGtda/DqS98m
 0wTbr4aiDYMpFxUVwoMG2KE5Yk6z6a+MNDoWP1o08lqGA7F83+jCX0HoY 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xS1IA+xawEq70c58Hi7v8Dd9MRiZ9grZTcYYqpKiX03LQrWTWSRLZlQ+zmWQ1+9x9a8Hs/xcrD
 hSlZPuQfgPC97w2cGMd35vwm14Hn6UJZYDFdnziToX/28s9ferJVLrqx1Bl4hl9M0IrYKJax8/
 88nc9bOsKm0yxA7QdDDdhT9lzBzLxdE6tXa4IyHjVJgzp68+DAcSItEGakSF0Th1dqX/sQrrSm
 7NDM+h6WGYuxVz2bDnB0Ie3LR7qulY5CFmjpfMn9avuOz/91rVJkKOSwR21y3fJbzXpS8V7lrN
 5gs=
X-SBRS: 2.7
X-MesageID: 8626679
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,297,1569297600"; 
   d="scan'208";a="8626679"
From: George Dunlap <George.Dunlap@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Thread-Topic: [BUGFIX PATCH for-4.13] sched: fix dom0less boot with the null
 scheduler
Thread-Index: AQHVlLsbXPpLuEV2Y0Se8uiYdZggxKeHu5sA
Date: Tue, 12 Nov 2019 17:02:08 +0000
Message-ID: <57B42244-E0DC-4842-9649-5032A0F26B5C@citrix.com>
References: <157305592941.20672.10855835711915878073.stgit@Palanthas>
In-Reply-To: <157305592941.20672.10855835711915878073.stgit@Palanthas>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3601.0.10)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <6CD086210AC443459E104BE4590F29F4@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [BUGFIX PATCH for-4.13] sched: fix dom0less boot
 with the null scheduler
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 George Dunlap <George.Dunlap@citrix.com>, "jgross@suse.de" <jgross@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTm92IDYsIDIwMTksIGF0IDM6NTggUE0sIERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lv
bGlAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gSW4gYSBkb20wbGVzcyBjb25maWd1cmF0aW9uLCBp
ZiB0aGUgbnVsbCBzY2hlZHVsZXIgaXMgdXNlZCwgdGhlIHN5c3RlbQ0KPiBtYXkgZmFpbCB0byBi
b290LCBiZWNhdXNlIHRoZSBsb29wIGluIG51bGxfdW5pdF93YWtlKCkgbmV2ZXIgZXhpdHMuDQo+
IA0KPiBCaXNlY3Rpb24gc2hvd2VkIHRoYXQgdGhpcyBiZWhhdmlvciBvY2N1cnMgc2luY2UgY29t
bWl0IGQ1NDVmMWQ2ICgieGVuOg0KPiBzY2hlZDogZGVhbCB3aXRoIHZDUFVzIGJlaW5nIG9yIGJl
Y29taW5nIG9ubGluZSBvciBvZmZsaW5lIikgYnV0IHRoZQ0KPiByZWFsIHByb2JsZW0gaXMgdGhh
dCwgaW4gdGhpcyBjYXNlLCBwaWNrX3JlcygpIGFsd2F5cyByZXR1cm4gdGhlIHNhbWUNCj4gQ1BV
Lg0KPiANCj4gRml4IHRoaXMgYnkgb25seSBkZWFsIHdpdGggdGhlIHNpbXBsZSBjYXNlLCBpLmUu
LCB0aGUgdkNQVSB0aGF0IGlzDQo+IGNvbWluZyBvbmxpbmUgY2FuIGJlIGFzc2lnbmVkIHRvIGEg
c2NoZWQuIHJlc291cmNlIHJpZ2h0IGF3YXksIGluDQo+IG51bGxfdW5pdF93YWtlKCkuDQo+IA0K
PiBJZiBpdCBjYW4ndCwganVzdCBhZGQgaXQgdG8gdGhlIHdhaXRxdWV1ZSwgYW5kIHdlIHdpbGwg
ZGVhbCB3aXRoIGl0IGluDQo+IG51bGxfc2NoZWR1bGUoKSwgYmVpbmcgY2FyZWZ1bCBhYm91dCBu
b3QgcmFjaW5nIHdpdGggdmNwdV93YWtlKCkuDQo+IA0KPiBSZXBvcnRlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYXJp
byBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPg0KPiBUZXN0ZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4NCg0KV2l0aCBvbmUgbWlub3Igbml04oCm
DQoNCj4gKyAgICAgKiBhbmQgaXQncyBwcmV2aW91cyByZXNvdXJjZSBpcyBmcmVlIChhbmQgYWZm
aW5pdGllcyBtYXRjaCksIHdlIGNhbiBqdXN0DQoNCml0cyAobm8g4oCYKS4gIEnigJlsbCBjaGFu
Z2UgdGhpcyBvbiBjaGVjay1pbi4NCg0KIC1HZW9yZ2UNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
