Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7866206FC
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 14:32:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRFWj-0000w1-2c; Thu, 16 May 2019 12:30:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRFWi-0000vu-7i
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:30:24 +0000
X-Inumbo-ID: 5f583711-77d6-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5f583711-77d6-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 12:30:22 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 06:30:21 -0600
Message-Id: <5CDD57DB020000780022FA5E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 06:30:19 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-37-jgross@suse.com>
In-Reply-To: <20190506065644.7415-37-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC V2 36/45] x86: make loading of GDT at
 context switch more modular
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDA4OjU2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiBA
QCAtMTYxOSw2ICsxNjE5LDM3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBuZWVkX2Z1bGxfZ2R0KGNv
bnN0IHN0cnVjdCBkb21haW4gKmQpCj4gICAgICByZXR1cm4gaXNfcHZfZG9tYWluKGQpICYmICFp
c19pZGxlX2RvbWFpbihkKTsKPiAgfQo+ICAKPiArc3RhdGljIGlubGluZSB2b2lkIHdyaXRlX2Z1
bGxfZ2R0X3B0ZXMoc2VnX2Rlc2NfdCAqZ2R0LCBzdHJ1Y3QgdmNwdSAqdikKPiArewo+ICsgICAg
dW5zaWduZWQgbG9uZyBtZm4gPSB2aXJ0X3RvX21mbihnZHQpOwo+ICsgICAgbDFfcGdlbnRyeV90
ICpwbDFlID0gcHZfZ2R0X3B0ZXModik7Cj4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiArCj4gKyAg
ICBmb3IgKCBpID0gMDsgaSA8IE5SX1JFU0VSVkVEX0dEVF9QQUdFUzsgaSsrICkKPiArICAgICAg
ICBsMWVfd3JpdGUocGwxZSArIEZJUlNUX1JFU0VSVkVEX0dEVF9QQUdFICsgaSwKPiArICAgICAg
ICAgICAgICAgICAgbDFlX2Zyb21fcGZuKG1mbiArIGksIF9fUEFHRV9IWVBFUlZJU09SX1JXKSk7
Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBsb2FkX2Z1bGxfZ2R0KHN0cnVjdCB2Y3B1
ICp2LCB1bnNpZ25lZCBpbnQgY3B1KQo+ICt7Cj4gKyAgICBzdHJ1Y3QgZGVzY19wdHIgZ2R0X2Rl
c2M7Cj4gKwo+ICsgICAgZ2R0X2Rlc2MubGltaXQgPSBMQVNUX1JFU0VSVkVEX0dEVF9CWVRFOwo+
ICsgICAgZ2R0X2Rlc2MuYmFzZSA9IEdEVF9WSVJUX1NUQVJUKHYpOwoKTWFrZSB0aGlzIGFuZCAu
Li4KCj4gKyAgICBsZ2R0KCZnZHRfZGVzYyk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCBsb2FkX2RlZmF1bHRfZ2R0KHNlZ19kZXNjX3QgKmdkdCwgdW5zaWduZWQgaW50IGNwdSkKPiAr
ewo+ICsgICAgc3RydWN0IGRlc2NfcHRyIGdkdF9kZXNjOwo+ICsKPiArICAgIGdkdF9kZXNjLmxp
bWl0ID0gTEFTVF9SRVNFUlZFRF9HRFRfQllURTsKPiArICAgIGdkdF9kZXNjLmJhc2UgID0gKHVu
c2lnbmVkIGxvbmcpKGdkdCAtIEZJUlNUX1JFU0VSVkVEX0dEVF9FTlRSWSk7CgouLi4gdGhlIHZh
cmlhYmxlcycgaW5pdGlhbGl6ZXJzPyBXaXRoIHRoaXMgYW5kIHdpdGggY29uc3Qgc3VpdGFibHkK
YXBwbGllZCB0byBhbGwgZnVuY3Rpb24gcGFyYW1ldGVycyB3aGVyZSB0aGlzIGlzIHBvc3NpYmxl
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
