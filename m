Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA13154512
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 14:38:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izhJT-0003up-Rw; Thu, 06 Feb 2020 13:35:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izhJT-0003uk-0w
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 13:35:23 +0000
X-Inumbo-ID: 85ef8bda-48e5-11ea-af85-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85ef8bda-48e5-11ea-af85-12813bfff9fa;
 Thu, 06 Feb 2020 13:35:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 916E0AE44;
 Thu,  6 Feb 2020 13:35:21 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
 <90e7ed4e-aff5-1b0b-e3a8-fbb4c058a7d1@suse.com>
 <a7952dfe113849daaca3ed4467f0b0eb@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <63cd9e13-ea21-3bc2-2898-352e7f763a74@suse.com>
Date: Thu, 6 Feb 2020 14:35:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <a7952dfe113849daaca3ed4467f0b0eb@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/7] x86/HVM: introduce "curr" into
 hvmemul_rep_{mov, sto}s()
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAyMCAxNDoyNiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbgo+PiBCZXVsaWNoCj4+IFNlbnQ6IDMx
IEphbnVhcnkgMjAyMCAxNjo0Mwo+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cj4+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+OyBBbmRy
ZXcgQ29vcGVyCj4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkKPj4gTGl1IDx3bEB4ZW4ub3JnPjsgUGF1bCBE
dXJyYW50IDxwYXVsQHhlbi5vcmc+Cj4+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NCAz
LzddIHg4Ni9IVk06IGludHJvZHVjZSAiY3VyciIgaW50bwo+PiBodm1lbXVsX3JlcF97bW92LCBz
dG99cygpCj4+Cj4+IFRoZXJlIGFyZSBhIG51bWJlciBvZiB1c2VzIG9mICJjdXJyZW50IiBhbHJl
YWR5LCBhbmQgbW9yZSBtYXkgYXBwZWFyCj4+IGRvd24gdGhlIHJvYWQuIExhdGNoIGludG8gYSBs
b2NhbCB2YXJpYWJsZS4KPj4KPj4gQXQgdGhpcyBvY2Nhc2lvbiBhbHNvIGRyb3Agc3RyYXkgY2Fz
dHMgZnJvbSBjb2RlIGdldHRpbmcgdG91Y2hlZCBhbnl3YXkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogUGF1bCBE
dXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKVGhhbmtzLgoKPiAuLi53aXRoIG9uZSBzdWdn
ZXN0aW9uOgo+IAo+PiAtLS0KPj4gdjQ6IE5ldy4KPj4KPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9lbXVsYXRlLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKPj4gQEAgLTE3
NDcsNyArMTc0Nyw4IEBAIHN0YXRpYyBpbnQgaHZtZW11bF9yZXBfbW92cygKPj4gIHsKPj4gICAg
ICBzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCAqaHZtZW11bF9jdHh0ID0KPj4gICAgICAgICAgY29u
dGFpbmVyX29mKGN0eHQsIHN0cnVjdCBodm1fZW11bGF0ZV9jdHh0LCBjdHh0KTsKPj4gLSAgICBz
dHJ1Y3QgaHZtX3ZjcHVfaW8gKnZpbyA9ICZjdXJyZW50LT5hcmNoLmh2bS5odm1faW87Cj4+ICsg
ICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Owo+PiArICAgIHN0cnVjdCBodm1fdmNwdV9p
byAqdmlvID0gJmN1cnItPmFyY2guaHZtLmh2bV9pbzsKPj4gICAgICB1bnNpZ25lZCBsb25nIHNh
ZGRyLCBkYWRkciwgYnl0ZXM7Cj4+ICAgICAgcGFkZHJfdCBzZ3BhLCBkZ3BhOwo+PiAgICAgIHVp
bnQzMl90IHBmZWMgPSBQRkVDX3BhZ2VfcHJlc2VudDsKPj4gQEAgLTE4MDcsOCArMTgwOCw4IEBA
IHN0YXRpYyBpbnQgaHZtZW11bF9yZXBfbW92cygKPj4gICAgICB9Cj4+Cj4+ICAgICAgLyogQ2hl
Y2sgZm9yIE1NSU8gb3BzICovCj4+IC0gICAgKHZvaWQpIGdldF9nZm5fcXVlcnlfdW5sb2NrZWQo
Y3VycmVudC0+ZG9tYWluLCBzZ3BhID4+IFBBR0VfU0hJRlQsCj4+ICZzcDJtdCk7Cj4+IC0gICAg
KHZvaWQpIGdldF9nZm5fcXVlcnlfdW5sb2NrZWQoY3VycmVudC0+ZG9tYWluLCBkZ3BhID4+IFBB
R0VfU0hJRlQsCj4+ICZkcDJtdCk7Cj4+ICsgICAgZ2V0X2dmbl9xdWVyeV91bmxvY2tlZChjdXJy
LT5kb21haW4sIHNncGEgPj4gUEFHRV9TSElGVCwgJnNwMm10KTsKPj4gKyAgICBnZXRfZ2ZuX3F1
ZXJ5X3VubG9ja2VkKGN1cnItPmRvbWFpbiwgZGdwYSA+PiBQQUdFX1NISUZULCAmZHAybXQpOwo+
IAo+IFNpbmNlIHdlIGhhdmUgbW9yZSB0aGFuIG9uZSAnY3Vyci0+ZG9tYWluJywgSSB0aGluayBp
dCB3b3VsZCBiZSBuaWNlIHRvCj4gYSBsYXRjaGVkICdjdXJyZCcgZG9tYWluIHBvaW50ZXIgdG9v
LgoKSSBkaWQgYWN0dWFsbHkgY29uc2lkZXIgaXQsIGJ1dCBkaWRuJ3QgZG8gc28gYmVjYXVzZSAo
YSkgaXQncyBqdXN0CnR3byByZWZlcmVuY2VzICh3aGljaCBtZWFucyB0aGUgdmFyaWFibGUgaXMg
bGlhYmxlIHRvIGVuZCB1cCBpbgptZW1vcnksIHlpZWxkaW5nIG5vIGltcHJvdmVtZW50KSBhbmQg
KGIpIGl0J3MgYmV0dGVyIGluIHN5bmMgd2l0aAp0aGUgc3RvcyBjb3VudGVycGFydCBvZiB0aGUg
ZnVuY3Rpb24gdGhpcyB3YXkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
