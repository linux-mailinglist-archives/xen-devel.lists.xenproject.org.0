Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE9EB10A5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 16:06:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Pfz-0001Pq-CT; Thu, 12 Sep 2019 14:02:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8Pfx-0001Pl-Bi
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 14:02:21 +0000
X-Inumbo-ID: ef3b11b6-d565-11e9-959a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef3b11b6-d565-11e9-959a-12813bfff9fa;
 Thu, 12 Sep 2019 14:02:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CE38BAFA8;
 Thu, 12 Sep 2019 14:02:18 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-25-jgross@suse.com>
 <de1280ef-a2f0-b96c-8c7a-049027cf1b34@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4fa2cb71-5b66-b344-6ab2-502008ba5f69@suse.com>
Date: Thu, 12 Sep 2019 16:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <de1280ef-a2f0-b96c-8c7a-049027cf1b34@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 24/48] xen: switch from for_each_vcpu()
 to for_each_sched_unit()
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMTkgMTc6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC01MDQsMjIgKzUxMSwyMSBAQCBpbnQgc2No
ZWRfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpCj4+ICAg
ICAgIGlmICggSVNfRVJSKGRvbWRhdGEpICkKPj4gICAgICAgICAgIHJldHVybiBQVFJfRVJSKGRv
bWRhdGEpOwo+PiAgIAo+PiAtICAgIHZjcHVfcHJpdiA9IHh6YWxsb2NfYXJyYXkodm9pZCAqLCBk
LT5tYXhfdmNwdXMpOwo+PiAtICAgIGlmICggdmNwdV9wcml2ID09IE5VTEwgKQo+PiArICAgIHVu
aXRfcHJpdiA9IHh6YWxsb2NfYXJyYXkodm9pZCAqLCBkLT5tYXhfdmNwdXMpOwo+IAo+IEkgZmlu
ZCBpdCBjb25mdXNpbmcgdGhhdCBhbiBhcnJheSBvZiB1bml0cyAoYXMgcGVyIHRoZSB1c2UgYmVs
b3cpCj4gaXMgZGltZW5zaW9uZWQgYnkgdGhlIGRvbWFpbidzIHZDUFUgY291bnQuIElzbid0IHRo
ZXJlIGEgY29ycmVsYXRpb24KPiBiZXR3ZWVuIHZDUFUgSURzIGFuZCB1bml0cyBJRHMsIHBlcmhh
cHMgYWxvbmcgdGhlIGxpbmVzIG9mIENQVQo+IEFQSUMgKHRocmVhZCksIGNvcmUsIGFuZCBzb2Nr
ZXQgSURzPyBJZiBzbywgdGhlIGFycmF5IHNpemUgY291bGQKPiBiZSBib3VuZGVkIGhlcmUgYnkg
YSBzbWFsbGVyIChkb3duIHRoZSByb2FkKSB2YWx1ZS4KCkknbGwgYWRkIGEgY29tbWVudCBpbiB0
aGlzIHJlZ2FyZCBpbiB0aGlzIHBhdGNoIGFuZCB3aGVuIHRoZSBudW1iZXIKb2YgdmNwdXMgcGVy
IHVuaXQgZ2V0cyBhZGRlZCAocGF0Y2ggMzEpIEknbGwgbW9kaWZ5IHRoZSBhcnJheSBzaXplLgoK
PiAKPj4gQEAgLTg4MCwxOCArODg5LDM2IEBAIHZvaWQgdmNwdV9mb3JjZV9yZXNjaGVkdWxlKHN0
cnVjdCB2Y3B1ICp2KQo+PiAgICAgICB2Y3B1X21pZ3JhdGVfZmluaXNoKHYpOwo+PiAgIH0KPj4g
ICAKPj4gK3N0YXRpYyBib29sIHNjaGVkX2NoZWNrX2FmZmluaXR5X2Jyb2tlbihzdHJ1Y3Qgc2No
ZWRfdW5pdCAqdW5pdCkKPiAKPiBjb25zdAoKT2theS4KCj4gCj4+ICt7Cj4+ICsgICAgc3RydWN0
IHZjcHUgKnY7Cj4gCj4gY29uc3QKCk9rYXkuCgo+IAo+PiBAQCAtOTEwLDE4ICs5MzcsMjAgQEAg
dm9pZCByZXN0b3JlX3ZjcHVfYWZmaW5pdHkoc3RydWN0IGRvbWFpbiAqZCkKPj4gICAgICAgICAg
ICAgICAgICAgICAgIGNwdXBvb2xfZG9tYWluX2NwdW1hc2soZCkpOwo+PiAgICAgICAgICAgaWYg
KCBjcHVtYXNrX2VtcHR5KGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KSkgKQo+PiAgICAgICAgICAg
ewo+PiAtICAgICAgICAgICAgaWYgKCB2LT5hZmZpbml0eV9icm9rZW4gKQo+PiArICAgICAgICAg
ICAgaWYgKCBzY2hlZF9jaGVja19hZmZpbml0eV9icm9rZW4odW5pdCkgKQo+PiAgICAgICAgICAg
ICAgIHsKPj4gLSAgICAgICAgICAgICAgICBzY2hlZF9zZXRfYWZmaW5pdHkodiwgdW5pdC0+Y3B1
X2hhcmRfYWZmaW5pdHlfc2F2ZWQsIE5VTEwpOwo+PiAtICAgICAgICAgICAgICAgIHYtPmFmZmlu
aXR5X2Jyb2tlbiA9IDA7Cj4+ICsgICAgICAgICAgICAgICAgc2NoZWRfc2V0X2FmZmluaXR5KHVu
aXQtPnZjcHVfbGlzdCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5p
dC0+Y3B1X2hhcmRfYWZmaW5pdHlfc2F2ZWQsIE5VTEwpOwo+PiArICAgICAgICAgICAgICAgIHNj
aGVkX3Jlc2V0X2FmZmluaXR5X2Jyb2tlbih1bml0KTsKPj4gICAgICAgICAgICAgICAgICAgY3B1
bWFza19hbmQoY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLCB1bml0LT5jcHVfaGFyZF9hZmZpbml0
eSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1cG9vbF9kb21haW5fY3B1bWFz
ayhkKSk7Cj4+ICAgICAgICAgICAgICAgfQo+PiAgIAo+PiAgICAgICAgICAgICAgIGlmICggY3B1
bWFza19lbXB0eShjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSkpICkKPj4gICAgICAgICAgICAgICB7
Cj4+IC0gICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19ERUJVRyAiQnJlYWtpbmcgYWZmaW5p
dHkgZm9yICVwdlxuIiwgdik7Cj4+IC0gICAgICAgICAgICAgICAgc2NoZWRfc2V0X2FmZmluaXR5
KHYsICZjcHVtYXNrX2FsbCwgTlVMTCk7Cj4+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxP
R19ERUJVRyAiQnJlYWtpbmcgYWZmaW5pdHkgZm9yICVwdlxuIiwKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgdW5pdC0+dmNwdV9saXN0KTsKPj4gKyAgICAgICAgICAgICAgICBzY2hlZF9zZXRf
YWZmaW5pdHkodW5pdC0+dmNwdV9saXN0LCAmY3B1bWFza19hbGwsIE5VTEwpOwo+PiAgICAgICAg
ICAgICAgICAgICBjcHVtYXNrX2FuZChjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSksIHVuaXQtPmNw
dV9oYXJkX2FmZmluaXR5LAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVwb29s
X2RvbWFpbl9jcHVtYXNrKGQpKTsKPj4gICAgICAgICAgICAgICB9Cj4+IFsuLi5dPiBAQCAtOTY0
LDE3ICs5OTIsMTggQEAgaW50IGNwdV9kaXNhYmxlX3NjaGVkdWxlcih1bnNpZ25lZCBpbnQgY3B1
KQo+PiAgIAo+PiAgICAgICBmb3JfZWFjaF9kb21haW5faW5fY3B1cG9vbCAoIGQsIGMgKQo+PiAg
ICAgICB7Cj4+IC0gICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKPj4gKyAgICAgICAgc3Ry
dWN0IHNjaGVkX3VuaXQgKnVuaXQ7Cj4+ICsKPj4gKyAgICAgICAgZm9yX2VhY2hfc2NoZWRfdW5p
dCAoIGQsIHVuaXQgKQo+PiAgICAgICAgICAgewo+PiAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgZmxhZ3M7Cj4+IC0gICAgICAgICAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCA9IHYtPnNj
aGVkX3VuaXQ7Cj4+ICAgICAgICAgICAgICAgc3BpbmxvY2tfdCAqbG9jayA9IHVuaXRfc2NoZWR1
bGVfbG9ja19pcnFzYXZlKHVuaXQsICZmbGFncyk7Cj4+ICAgCj4+ICAgICAgICAgICAgICAgY3B1
bWFza19hbmQoJm9ubGluZV9hZmZpbml0eSwgdW5pdC0+Y3B1X2hhcmRfYWZmaW5pdHksIGMtPmNw
dV92YWxpZCk7Cj4+ICAgICAgICAgICAgICAgaWYgKCBjcHVtYXNrX2VtcHR5KCZvbmxpbmVfYWZm
aW5pdHkpICYmCj4+ICAgICAgICAgICAgICAgICAgICBjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgdW5p
dC0+Y3B1X2hhcmRfYWZmaW5pdHkpICkKPj4gICAgICAgICAgICAgICB7Cj4+IC0gICAgICAgICAg
ICAgICAgaWYgKCB2LT5hZmZpbml0eV9icm9rZW4gKQo+PiArICAgICAgICAgICAgICAgIGlmICgg
dW5pdC0+dmNwdV9saXN0LT5hZmZpbml0eV9icm9rZW4gKQo+PiAgICAgICAgICAgICAgICAgICB7
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAvKiBUaGUgdmNwdSBpcyB0ZW1wb3JhcmlseSBwaW5u
ZWQsIGNhbid0IG1vdmUgaXQuICovCj4+ICAgICAgICAgICAgICAgICAgICAgICB1bml0X3NjaGVk
dWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCB1bml0KTsKPj4gQEAgLTk4MiwxNCAr
MTAxMSwxNSBAQCBpbnQgY3B1X2Rpc2FibGVfc2NoZWR1bGVyKHVuc2lnbmVkIGludCBjcHUpCj4+
ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPj4gICAgICAgICAgICAgICAgICAgfQo+PiAg
IAo+PiAtICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfREVCVUcgIkJyZWFraW5nIGFmZmlu
aXR5IGZvciAlcHZcbiIsIHYpOwo+PiArICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfREVC
VUcgIkJyZWFraW5nIGFmZmluaXR5IGZvciAlcHZcbiIsCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHVuaXQtPnZjcHVfbGlzdCk7Cj4+ICAgCj4+IC0gICAgICAgICAgICAgICAgc2NoZWRfc2V0
X2FmZmluaXR5KHYsICZjcHVtYXNrX2FsbCwgTlVMTCk7Cj4+ICsgICAgICAgICAgICAgICAgc2No
ZWRfc2V0X2FmZmluaXR5KHVuaXQtPnZjcHVfbGlzdCwgJmNwdW1hc2tfYWxsLCBOVUxMKTsKPj4g
ICAgICAgICAgICAgICB9Cj4+ICAgCj4+IC0gICAgICAgICAgICBpZiAoIHYtPnByb2Nlc3NvciAh
PSBjcHUgKQo+PiArICAgICAgICAgICAgaWYgKCBzY2hlZF91bml0X2NwdSh1bml0KSAhPSBzY2hl
ZF9nZXRfcmVzb3VyY2VfY3B1KGNwdSkgKQo+PiAgICAgICAgICAgICAgIHsKPj4gLSAgICAgICAg
ICAgICAgICAvKiBUaGUgdmNwdSBpcyBub3Qgb24gdGhpcyBjcHUsIHNvIHdlIGNhbiBtb3ZlIG9u
LiAqLwo+PiArICAgICAgICAgICAgICAgIC8qIFRoZSB1bml0IGlzIG5vdCBvbiB0aGlzIGNwdSwg
c28gd2UgY2FuIG1vdmUgb24uICovCj4+ICAgICAgICAgICAgICAgICAgIHVuaXRfc2NoZWR1bGVf
dW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIHVuaXQpOwo+PiAgICAgICAgICAgICAgICAg
ICBjb250aW51ZTsKPj4gICAgICAgICAgICAgICB9Cj4+IEBAIC0xMDAyLDE3ICsxMDMyLDE3IEBA
IGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXIodW5zaWduZWQgaW50IGNwdSkKPj4gICAgICAgICAg
ICAgICAgKiAgKiB0aGUgc2NoZWR1bGVyIHdpbGwgYWx3YXlzIGZpbmQgYSBzdWl0YWJsZSBzb2x1
dGlvbiwgb3IKPj4gICAgICAgICAgICAgICAgKiAgICB0aGluZ3Mgd291bGQgaGF2ZSBmYWlsZWQg
YmVmb3JlIGdldHRpbmcgaW4gaGVyZS4KPj4gICAgICAgICAgICAgICAgKi8KPj4gLSAgICAgICAg
ICAgIHZjcHVfbWlncmF0ZV9zdGFydCh2KTsKPj4gKyAgICAgICAgICAgIHZjcHVfbWlncmF0ZV9z
dGFydCh1bml0LT52Y3B1X2xpc3QpOwo+PiAgICAgICAgICAgICAgIHVuaXRfc2NoZWR1bGVfdW5s
b2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIHVuaXQpOwo+PiAgIAo+PiAtICAgICAgICAgICAg
dmNwdV9taWdyYXRlX2ZpbmlzaCh2KTsKPj4gKyAgICAgICAgICAgIHZjcHVfbWlncmF0ZV9maW5p
c2godW5pdC0+dmNwdV9saXN0KTsKPiAKPiBBbGwgdGhlIC0+dmNwdV9saXN0IHJlZmVyZW5jZXMg
bG9vayBib2d1cyBjb25zaWRlcmluZyB3aGVyZSB5b3UncmUKPiBtb3ZpbmcsIGJ1dCBJIGNhbiBv
bmx5IGd1ZXNzIHRoYXQgYWxsIG9mIHRoaXMgd2lsbCBuZWVkIHRvdWNoaW5nCj4gYWdhaW4gbGF0
ZXIgaW4gdGhlIHNlcmllcy4gSSB3b25kZXIgdGhvdWdoIHdoZXRoZXIgdGhlc2Ugd291bGRuJ3QK
PiBiZXR0ZXIgY2hhbmdlIGludG8gZm9yLWVhY2gtdkNQVS1pbi11bml0IGxvb3BzIHJpZ2h0IGF3
YXkuCgpFc3BlY2lhbGx5IHRoZSB2Y3B1X21pZ3JhdGUgcGFydCBpcyBtb3JlIGNvbXBsaWNhdGVk
LiBJIHRoaW5rIGl0IGlzCm11Y2ggZWFzaWVyIHRvIHJldmlldyB3aXRoIHRoZSBtb3JlIG1lY2hh
bmljYWwgY2hhbmdlcyBzcGxpdCBmcm9tIHRoZQpsb2dpY2FsIGNoYW5nZXMuCgo+IAo+PiAgICAg
ICAgICAgICAgIC8qCj4+ICAgICAgICAgICAgICAgICogVGhlIG9ubHkgY2F2ZWF0LCBpbiB0aGlz
IGNhc2UsIGlzIHRoYXQgaWYgYSB2Y3B1IGFjdGl2ZSBpbgo+PiAgICAgICAgICAgICAgICAqIHRo
ZSBoeXBlcnZpc29yIGlzbid0IG1pZ3JhdGFibGUuIEluIHRoaXMgY2FzZSwgdGhlIGNhbGxlcgo+
PiAgICAgICAgICAgICAgICAqIHNob3VsZCB0cnkgYWdhaW4gYWZ0ZXIgcmVsZWFzaW5nIGFuZCBy
ZWFxdWlyaW5nIGFsbCBsb2Nrcy4KPj4gICAgICAgICAgICAgICAgKi8KPj4gLSAgICAgICAgICAg
IGlmICggdi0+cHJvY2Vzc29yID09IGNwdSApCj4+ICsgICAgICAgICAgICBpZiAoIHNjaGVkX3Vu
aXRfY3B1KHVuaXQpID09IHNjaGVkX2dldF9yZXNvdXJjZV9jcHUoY3B1KSApCj4gCj4gSXMgY29t
cGFyaW5nIHRoZSAocHNldWRvKSBDUFUgdmFsdWVzIGhlcmUgdGhlIG1vc3QgZWZmaWNpZW50IGFw
cHJvYWNoCj4gZ2VuZXJhdGVkIGNvZGUgd2lzZT8gQ2FuJ3QgdGhlcmUgYmUgc29tZSBwb2ludGVy
IGNvbXBhcmlzb24gdGhhdCdzCj4gY2hlYXBlcj8KClllcywgeW91IGFyZSByaWdodC4gdW5pdC0+
cmVzID09IGdldF9zY2hlZF9yZXMoY3B1KSBpcyBlcXVpdmFsZW50LgoKPiAKPj4gQEAgLTEwMjMs
OCArMTA1Myw4IEBAIGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXIodW5zaWduZWQgaW50IGNwdSkK
Pj4gICBzdGF0aWMgaW50IGNwdV9kaXNhYmxlX3NjaGVkdWxlcl9jaGVjayh1bnNpZ25lZCBpbnQg
Y3B1KQo+PiAgIHsKPj4gICAgICAgc3RydWN0IGRvbWFpbiAqZDsKPj4gLSAgICBzdHJ1Y3QgdmNw
dSAqdjsKPj4gICAgICAgc3RydWN0IGNwdXBvb2wgKmM7Cj4+ICsgICAgc3RydWN0IHZjcHUgKnY7
Cj4+ICAgCj4+ICAgICAgIGMgPSBwZXJfY3B1KGNwdXBvb2wsIGNwdSk7Cj4+ICAgICAgIGlmICgg
YyA9PSBOVUxMICkKPiAKPiBTdHJheSBjaGFuZ2U/CgpZZXMuCgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
