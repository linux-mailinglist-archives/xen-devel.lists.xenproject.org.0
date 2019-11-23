Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5471C107CA5
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 04:27:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYM1J-00059L-UW; Sat, 23 Nov 2019 03:23:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x1S1=ZP=prgmr.com=srn@srs-us1.protection.inumbo.net>)
 id 1iYM1J-00058t-2m
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 03:23:37 +0000
X-Inumbo-ID: a229fbb2-0da0-11ea-984a-bc764e2007e4
Received: from mail.prgmr.com (unknown [2605:2700:0:5::4713:9506])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a229fbb2-0da0-11ea-984a-bc764e2007e4;
 Sat, 23 Nov 2019 03:23:35 +0000 (UTC)
Received: from [192.168.1.71] (unknown [99.0.85.144])
 (Authenticated sender: srn)
 by mail.prgmr.com (Postfix) with ESMTPSA id 859E67200AF;
 Sat, 23 Nov 2019 03:23:51 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com 859E67200AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
 s=default; t=1574497431;
 bh=mQBh3/UeZGXDsF/rWZS4530fiBG0kteR5c1nP6bjJ1I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=USzy+3ClU4u8J3Rcy1OzZy9cEVMlBne3pjiB/paoTfl6akdKLVKxh/1dBPhqShhBt
 da4eYjfPUtK+KG8XxZ7NAh5B5DSUMmLbihUPvH8+SSBnovW/WtT+MR4pZiKhmPS1pA
 TlLoXnq9ZRAOEt1XWne444Cx5rRvTcuEwMU2FWqA=
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191105194317.16232-3-andrew.cooper3@citrix.com>
 <20191105194909.32234-1-andrew.cooper3@citrix.com>
From: Sarah Newman <srn@prgmr.com>
Message-ID: <3743ea93-fcee-1940-a1cd-0c23071dce5f@prgmr.com>
Date: Fri, 22 Nov 2019 19:23:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105194909.32234-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1.5] x86/livepatch: Prevent patching with
 active waitqueues
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
Cc: Juergen Gross <jgross@suse.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvNS8xOSAxMTo0OSBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgc2FmZXR5IG9m
IGxpdmVwYXRjaGluZyBkZXBlbmRzIG9uIGV2ZXJ5IHN0YWNrIGhhdmluZyBiZWVuIHVud291bmQs
IGJ1dAo+IHRoZXJlIGlzIG9uZSBjb3JuZXIgY2FzZSB3aGVyZSB0aGlzIGlzIG5vdCB0cnVlLiAg
VGhlIFNoYXJpbmcvUGFnaW5nL01vbml0b3IKPiBpbmZyYXN0cnVjdHVyZSBtYXkgdXNlIHdhaXRx
dWV1ZXMsIHdoaWNoIGNvcHkgdGhlIHN0YWNrIGZyYW1lIHNpZGV3YXlzIGFuZAo+IGxvbmdqbXAo
KSB0byBhIGRpZmZlcmVudCB2Y3B1Lgo+IAo+IFRoaXMgY2FzZSBpcyByYXJlLCBhbmQgY2FuIGJl
IHdvcmtlZCBhcm91bmQgYnkgcGF1c2luZyB0aGUgb2ZmZW5kaW5nCj4gZG9tYWluKHMpLCB3YWl0
aW5nIGZvciB0aGVpciByaW5ncyB0byBkcmFpbiwgdGhlbiBwZXJmb3JtaW5nIGEgbGl2ZXBhdGNo
Lgo+IAo+IEluIHRoZSBjYXNlIHRoYXQgdGhlcmUgaXMgYW4gYWN0aXZlIHdhaXRxdWV1ZSwgZmFp
bCB0aGUgbGl2ZXBhdGNoIGF0dGVtcHQgd2l0aAo+IC1FQlVTWSwgd2hpY2ggaXMgcHJlZm9yYWJs
ZSB0byB0aGUgZmlyZXdvcmtzIHdoaWNoIG9jY3VyIGZyb20gdHJ5aW5nIHRvIHVud2luZAo+IHRo
ZSBvbGQgc3RhY2sgZnJhbWUgYXQgYSBsYXRlciBwb2ludC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBLb25y
YWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gQ0M6IFJvc3MgTGFn
ZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgo+IENDOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Cj4gCj4gVGhpcyBmaXggd2FudHMgYmFja3BvcnRpbmcsIGFuZCBpcyBs
b25nIG92ZXJkdWUgZm9yIHBvc3RpbmcgdXBzdHJlYW0uCj4gCj4gdjEuNToKPiAgICogU2VuZCBv
dXQgYSBub24tc3RhbGUgcGF0Y2ggdGhpcyB0aW1lLgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2xp
dmVwYXRjaC5jICAgIHwgIDUgKysrKysKPiAgIHhlbi9hcmNoL3g4Ni9saXZlcGF0Y2guYyAgICB8
IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIHhlbi9jb21t
b24vbGl2ZXBhdGNoLmMgICAgICB8ICA4ICsrKysrKysrCj4gICB4ZW4vaW5jbHVkZS94ZW4vbGl2
ZXBhdGNoLmggfCAgMSArCj4gICA0IGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jIGIveGVuL2FyY2gvYXJtL2xp
dmVwYXRjaC5jCj4gaW5kZXggMDBjNWUyYmM0NS4uOTE1ZTlkOTI2YSAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC9hcm0vbGl2ZXBhdGNoLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vbGl2ZXBhdGNoLmMK
PiBAQCAtMTgsNiArMTgsMTEgQEAKPiAgIAo+ICAgdm9pZCAqdm1hcF9vZl94ZW5fdGV4dDsKPiAg
IAo+ICtpbnQgYXJjaF9saXZlcGF0Y2hfc2FmZXR5X2NoZWNrKHZvaWQpCj4gK3sKPiArICAgIHJl
dHVybiAwOwo+ICt9Cj4gKwo+ICAgaW50IGFyY2hfbGl2ZXBhdGNoX3F1aWVzY2Uodm9pZCkKPiAg
IHsKPiAgICAgICBtZm5fdCB0ZXh0X21mbjsKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2xp
dmVwYXRjaC5jIGIveGVuL2FyY2gveDg2L2xpdmVwYXRjaC5jCj4gaW5kZXggYzgyY2Y1M2I5ZS4u
Mjc0OWNiYzVjZiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMKPiArKysg
Yi94ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMKPiBAQCAtMTAsMTAgKzEwLDUwIEBACj4gICAjaW5j
bHVkZSA8eGVuL3ZtYXAuaD4KPiAgICNpbmNsdWRlIDx4ZW4vbGl2ZXBhdGNoX2VsZi5oPgo+ICAg
I2luY2x1ZGUgPHhlbi9saXZlcGF0Y2guaD4KPiArI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgo+ICAg
Cj4gICAjaW5jbHVkZSA8YXNtL25taS5oPgo+ICAgI2luY2x1ZGUgPGFzbS9saXZlcGF0Y2guaD4K
PiAgIAo+ICtzdGF0aWMgYm9vbCBoYXNfYWN0aXZlX3dhaXRxdWV1ZShjb25zdCBzdHJ1Y3Qgdm1f
ZXZlbnRfZG9tYWluICp2ZWQpCj4gK3sKPiArICAgIC8qIHZlZCBtYXkgYmUgeHphbGxvYygpJ2Qg
d2l0aG91dCBJTklUX0xJU1RfSEVBRCgpIHlldC4gKi8KPiArICAgIHJldHVybiAodmVkICYmICFs
aXN0X2hlYWRfaXNfbnVsbCgmdmVkLT53cS5saXN0KSAmJgo+ICsgICAgICAgICAgICAhbGlzdF9l
bXB0eSgmdmVkLT53cS5saXN0KSk7Cj4gK30KPiArCj4gKy8qCj4gKyAqIHg4NidzIGltcGxlbWVu
dGF0aW9uIG9mIHdhaXRxdWV1ZSB2aW9sYXRlcyB0aGUgbGl2ZXBhdGNoaW5nIHNhZmV5IHByaW5j
aXBsZQo+ICsgKiBvZiBoYXZpbmcgdW53b3VuZCBldmVyeSBDUFVzIHN0YWNrIGJlZm9yZSBtb2Rp
ZnlpbmcgbGl2ZSBjb250ZW50Lgo+ICsgKgo+ICsgKiBTZWFyY2ggdGhyb3VnaCBldmVyeSBkb21h
aW4gYW5kIGNoZWNrIHRoYXQgbm8gdkNQVXMgaGF2ZSBhbiBhY3RpdmUKPiArICogd2FpdHF1ZXVl
Lgo+ICsgKi8KPiAraW50IGFyY2hfbGl2ZXBhdGNoX3NhZmV0eV9jaGVjayh2b2lkKQo+ICt7Cj4g
KyAgICBzdHJ1Y3QgZG9tYWluICpkOwo+ICsKPiArICAgIGZvcl9lYWNoX2RvbWFpbiAoIGQgKQo+
ICsgICAgewo+ICsjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCj4gKyAgICAgICAgaWYgKCBoYXNf
YWN0aXZlX3dhaXRxdWV1ZShkLT52bV9ldmVudF9zaGFyZSkgKQo+ICsgICAgICAgICAgICBnb3Rv
IGZhaWw7Cj4gKyNlbmRpZgo+ICsjaWZkZWYgQ09ORklHX01FTV9QQUdJTkcKPiArICAgICAgICBp
ZiAoIGhhc19hY3RpdmVfd2FpdHF1ZXVlKGQtPnZtX2V2ZW50X3BhZ2luZykgKScKCklzIHRoaXMg
c3VwcG9zZWQgdG8gYmUgQ09ORklHX0hBU19NRU1fUEFHSU5HPwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
