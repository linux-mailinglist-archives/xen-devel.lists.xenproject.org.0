Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C04E14C859
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 10:48:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwjv3-0000kH-Nm; Wed, 29 Jan 2020 09:45:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwjv2-0000kC-4H
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 09:45:56 +0000
X-Inumbo-ID: 2483e824-427c-11ea-a933-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2483e824-427c-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 09:45:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B040BAC79;
 Wed, 29 Jan 2020 09:45:53 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <93b4ae81-6bfb-f7bd-06be-62032fd9a445@suse.com>
 <20200128145422.GP57924@desktop-tdan49n.eng.citrite.net>
 <682a8462-ded7-3f73-d8fe-ffa42738a61e@suse.com>
 <20200128172521.GS57924@desktop-tdan49n.eng.citrite.net>
 <5b54a96e-a579-3442-71ef-b8904cbe7897@suse.com>
 <20200129093838.GU57924@desktop-tdan49n.eng.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <320bcfd2-e54e-efa7-e626-fa71aa745df8@suse.com>
Date: Wed, 29 Jan 2020 10:45:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129093838.GU57924@desktop-tdan49n.eng.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/HVM: relinquish resources also from
 hvm_domain_destroy()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxMDozOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEph
biAyOSwgMjAyMCBhdCAwOTowMTozNEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjguMDEuMjAyMCAxODoyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFR1ZSwgSmFu
IDI4LCAyMDIwIGF0IDA0OjQ5OjA5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDI4LjAxLjIwMjAgMTU6NTQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+IE9uIFR1ZSwg
SmFuIDI4LCAyMDIwIGF0IDAyOjE2OjUzUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9ydGMuYwo+Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9ydGMuYwo+Pj4+Pj4gQEAgLTg0NCw3ICs4NDQsOCBAQCB2b2lkIHJ0Y19kZWluaXQoc3Ry
dWN0IGRvbWFpbiAqZCkKPj4+Pj4+ICB7Cj4+Pj4+PiAgICAgIFJUQ1N0YXRlICpzID0gZG9tYWlu
X3ZydGMoZCk7Cj4+Pj4+PiAgCj4+Pj4+PiAtICAgIGlmICggIWhhc192cnRjKGQpICkKPj4+Pj4+
ICsgICAgaWYgKCAhaGFzX3ZydGMoZCkgfHwgIWQtPmFyY2guaHZtLnBsX3RpbWUgfHwKPj4+Pj4+
ICsgICAgICAgICBzLT51cGRhdGVfdGltZXIuc3RhdHVzID09IFRJTUVSX1NUQVRVU19pbnZhbGlk
ICkKPj4+Pj4KPj4+Pj4gWW91IGNvdWxkIGFsc28gY2hlY2sgZm9yIHRoZSBwb3J0IHJlZ2lzdHJh
dGlvbiBBRkFJQ1QsIHdoaWNoIGlzIG1heWJlCj4+Pj4+IG1vcmUgb2J2aW91cz8KPj4+Pgo+Pj4+
IFlvdSBjYWxsZWQgdGhhdCBhcHByb2FjaCBkaXJ0eSBhYm92ZSAtIEknZCBsaWtlIHRvIHJlc3Ry
aWN0IGl0Cj4+Pj4gdG8ganVzdCB3aGVyZSBubyBiZXR0ZXIgYWx0ZXJuYXRpdmUgZXhpc3RzLgo+
Pj4KPj4+IEFjaywgaXQgZGlkbid0IHNlZW0gdGhhdCBiYWQgaGVyZSBiZWNhdXNlIHRoaXMgaXMg
YSB4ODYgZW11bGF0ZWQKPj4+IGRldmljZSB0aGF0IHJlbGllcyBvbiBJTyBwb3J0cywgd2hpbGUg
dGhlIGlvcmVxIGNvZGUgKGFsYmVpdCB4ODYKPj4+IHNwZWNpZmljIEFUTSkgY291bGQgYmUgdXNl
ZCBieSBvdGhlciBhcmNoZXMsIGFuZCBoZW5jZSB3b3VsZCBsaWtlbHkKPj4+IHByZWZlciB0byBh
dm9pZCB1c2luZyB4ODYgc3BlY2lmaWMgZGV0YWlscyBmb3IgZ2VuZXJpYyBmdW5jdGlvbnMsIGxp
a2UKPj4+IHRoZSBpbml0IG9yIGRlaW5pdCBvbmVzLgo+Pgo+PiBMaWtlbHksIGJ1dCB0aGUgcG9y
dCBJL08gaGFuZGxlciByZWdpc3RyYXRpb24gaXMgZ29pbmcgdG8gcmVtYWluCj4+IHg4Ni1zcGVj
aWZpYywgYW5kIGhlbmNlIHRoZXJlIHdvdWxkIHByZXR0eSBjZXJ0YWlubHkgYWxzbyBiZSBhbgo+
PiBhcmNoLXNwZWNpZmljIGluaXQgKGFuZCBtYXkgYSBkZWluaXQpIGZ1bmN0aW9uLgo+Pgo+Pj4+
PiBJIGFsc28gd29uZGVyIHdoZXRoZXIgYWxsIHRob3NlIHRpbWUtcmVsYXRlZCBlbXVsYXRpb25z
IGNvdWxkIGJlCj4+Pj4+IGdyb3VwZWQgaW50byBhIHNpbmdsZSBoZWxwZXIsIHRoYXQgY291bGQg
aGF2ZSBhIGQtPmFyY2guaHZtLnBsX3RpbWUKPj4+Pj4gaW5zdGVhZCBvZiBoYXZpbmcgdG8gc3By
aW5rbGUgc3VjaCBjaGVja3MgZm9yIGVhY2ggZGV2aWNlPwo+Pj4+Cj4+Pj4gUXVpdGUgcG9zc2li
bGUsIGJ1dCBub3QgaGVyZSBhbmQgbm90IG5vdy4KPj4+Cj4+PiBTdXJlLgo+Pj4KPj4+IFJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4KPj4gVGhh
bmtzLiBUaGVyZSBhcmUgdHdvIHNtYWxsIGNoYW5nZXMgSSBpbnRlbmQgdG8gZG8sIG9uZSBkaXJl
Y3RseQo+PiBhbmQgb25lIGluZGlyZWN0bHkgcmVzdWx0aW5nIGZyb20gUGF1bCdzIGZlZWRiYWNr
OiBBbHNvIGRyb3AKPj4gcnRjX2RlaW5pdCgpIGZyb20gaHZtX2RvbWFpbl9kZXN0cm95KCkuIEFs
c28gZHJvcCBub3cgcG9pbnRsZXNzCj4+IGlmKCkgZnJvbSBodm1fZG9tYWluX3JlbGlucXVpc2hf
cmVzb3VyY2VzKCkuCj4gCj4gSSBhc3N1bWUgdGhpcyBpcyB0aGUgaWYgY29uZGl0aW9uIGFyb3Vu
ZCB0aGUge3BtdGltZXIvaHBldH1fZGVpbml0Cj4gY2FsbHM/CgpZZXMuIFRoZSBvdGhlciB0d28g
aWYoKS1zIG9idmlvdXNseSBjYW4ndCBnbyBhd2F5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
