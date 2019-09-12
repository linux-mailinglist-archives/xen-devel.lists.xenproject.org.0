Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7622B0C44
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 12:07:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8LyH-0002JM-Nv; Thu, 12 Sep 2019 10:05:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8LyG-0002JH-Nl
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 10:05:00 +0000
X-Inumbo-ID: c771617e-d544-11e9-83e6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c771617e-d544-11e9-83e6-12813bfff9fa;
 Thu, 12 Sep 2019 10:04:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 724B2B018;
 Thu, 12 Sep 2019 10:04:58 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-22-jgross@suse.com>
 <18ec96a1-b3c3-adbf-4b0e-1fcb7185e046@suse.com>
 <13f2cf63-2b61-07fa-f43d-044c61601bca@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5aeddfeb-e01f-2cef-59ff-d66bcc067d37@suse.com>
Date: Thu, 12 Sep 2019 12:04:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <13f2cf63-2b61-07fa-f43d-044c61601bca@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 21/48] xen/sched: use sched_resource cpu
 instead smp_processor_id in schedulers
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxMTozNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwOS4wOS4xOSAx
NjoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIwMTkgMTY6NTgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBAQCAtMTgyNSw4ICsxODI1LDkgQEAgc3RhdGljIHN0cnVjdCB0YXNr
X3NsaWNlCj4+PiAgIGNzY2hlZF9zY2hlZHVsZSgKPj4+ICAgICAgIGNvbnN0IHN0cnVjdCBzY2hl
ZHVsZXIgKm9wcywgc190aW1lX3Qgbm93LCBib29sX3QgdGFza2xldF93b3JrX3NjaGVkdWxlZCkK
Pj4+ICAgewo+Pj4gLSAgICBjb25zdCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+Pj4g
LSAgICBzdHJ1Y3QgbGlzdF9oZWFkICogY29uc3QgcnVucSA9IFJVTlEoY3B1KTsKPj4+ICsgICAg
Y29uc3QgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPj4+ICsgICAgY29u
c3QgdW5zaWduZWQgaW50IHNjaGVkX2NwdSA9IHNjaGVkX2dldF9yZXNvdXJjZV9jcHUoY3B1KTsK
Pj4+ICsgICAgc3RydWN0IGxpc3RfaGVhZCAqIGNvbnN0IHJ1bnEgPSBSVU5RKHNjaGVkX2NwdSk7
Cj4+Cj4+IEJ5IHJldGFpbmluZyBhIGxvY2FsIHZhcmlhYmxlIG5hbWVkICJjcHUiIHlvdSBtYWtl
IGl0IGNsb3NlIHRvCj4+IGltcG9zc2libGUgdG8gbm90aWNlLCBkdXJpbmcgYSByZS1iYXNlLCBh
biBhZGRpdGlvbiB0byB0aGUKPj4gZnVuY3Rpb24gc3RpbGwgcmVmZXJlbmNpbmcgYSB2YXJpYWJs
ZSBvZiB0aGlzIG5hbWUuIFNpbWlsYXJseQo+PiByZXZpZXcgaXMgYmVpbmcgbWFkZSBoYXJkZXIg
YmVjYXVzZSBvbmUgbmVlZHMgdG8gZ28gaHVudCBhbGwKPj4gdGhlIHJlbWFpbmluZyB1c2VzIG9m
ICJjcHUiLiBGb3IgZXhhbXBsZSB0aGVyZSBhIHRyYWNlIGVudHJ5Cj4+IGJlaW5nIGdlbmVyYXRl
ZCwgYW5kIGl0J3Mgbm90IG9idmlvdXMgdG8gbWUgd2hldGhlciB0aGlzIHdvdWxkbid0Cj4+IGJl
dHRlciBhbHNvIHVzZWQgc2NoZWRfY3B1Lgo+IAo+IE9rYXl5LCBJJ2xsIHJlbmFtZSAiY3B1IiB0
byAibXlfY3B1Ii4KCldlJ3ZlIGdvdCBhIG51bWJlciBvZiBpbnN0YW5jZXMgb2YgInRoaXNfY3B1
IiBpbiBzdWNoIGNhc2VzIGFscmVhZHksCmJ1dCBubyBzaW5nbGUgIm15X2NwdSIuIE1heSBJIHN1
Z2dlc3QgdG8gc3RpY2sgdG8gdGhpcyBuYW1pbmcgaGVyZQphcyB3ZWxsPwoKPiBJIHVzZWQgY3B1
IGluIHRoZSB0cmFjZSBlbnRyeSBvbiBwdXJwb3NlLCBhcyBpdCBtaWdodCBiZSBpbnRlcmVzdGlu
ZyBvbgo+IHdoaWNoIGNwdSB0aGUgZW50cnkgaGFzIGJlZW4gcHJvZHVjZWQuCgpSaWdodCwgdGhh
dCdzIGhvdyBJIHVuZGVyc3Rvb2QgaXQ7IGl0IHNpbXBseSBzZWVtZWQgbGlrZSB0aGVyZQptaWdo
dCBiZSBhIHNpbWlsYXJseSB2YWxpZCB2aWV3IHRvIHRoZSBjb250cmFyeS4KCj4+PiBAQCAtMTk2
Nyw3ICsxOTY4LDcgQEAgY3NjaGVkX3NjaGVkdWxlKAo+Pj4gICAgICAgaWYgKCBzbmV4dC0+cHJp
ID4gQ1NDSEVEX1BSSV9UU19PVkVSICkKPj4+ICAgICAgICAgICBfX3J1bnFfcmVtb3ZlKHNuZXh0
KTsKPj4+ICAgICAgIGVsc2UKPj4+IC0gICAgICAgIHNuZXh0ID0gY3NjaGVkX2xvYWRfYmFsYW5j
ZShwcnYsIGNwdSwgc25leHQsICZyZXQubWlncmF0ZWQpOwo+Pj4gKyAgICAgICAgc25leHQgPSBj
c2NoZWRfbG9hZF9iYWxhbmNlKHBydiwgc2NoZWRfY3B1LCBzbmV4dCwgJnJldC5taWdyYXRlZCk7
Cj4+Cj4+IEFuZCBpbiBhIGNhc2UgbGlrZSB0aGlzIG9uZSBJIHdvbmRlciB3aGV0aGVyIHBhc3Np
bmcgYSAic29ydCBvZgo+PiBDUFUiIGlzbid0IHN1ZmZpY2llbnRseSBjb25mdXNpbmcsIGNvbXBh
cmVkIHRvIGUuZy4gc2ltcGx5Cj4+IHBhc3NpbmcgdGhlIGNvcnJlc3BvbmRpbmcgdW5pdC4KPiAK
PiBJIGd1ZXNzIHlvdSBtZWFuIHNjaGVkX3Jlc291cmNlLgoKTm90IHN1cmUgLSB3aXRoIHNjaGVk
dWxpbmcgYWN0aW5nIG9uIHVuaXRzLCBpdCB3b3VsZCBzZWVtIHRvIG1lIHRoYXQKcGFzc2luZyBh
cm91bmQgdGhlIHVuaXQgcG9pbnRlcnMgd291bGQgYmUgdGhlIG1vc3QgYXBwcm9wcmlhdGUgdGhp
bmcuCgo+IEkgZG9uJ3QgdGhpbmsgY2hhbmdpbmcgdGhlIHBhcmFtZXRlciB0eXBlIGlzIGEgZ29v
ZCBpZGVhLiBXZSBuZWVkIGJvdGgKPiAocmVzb3VyY2UgYW5kIGNwdSBudW1iZXIpIG9uIGNhbGxl
ciBhbmQgY2FsbGVlIHNpZGUsIGJ1dCB0aGUgbWFpbgo+IG9iamVjdCBjc2NoZWRfbG9hZF9iYWxh
bmNlKCkgaXMgd29ya2luZyBvbiBpcyB0aGUgY3B1IG51bWJlci4KCkkgc2VlLiBQYXJ0IG9mIG15
IHRoaW5raW5nIGhlcmUgYWxzbyB3YXMgdG93YXJkcyB0aGUgYWRkZWQgdHlwZQpzYWZldHkgaWYg
cGFzc2luZyBwb2ludGVycyBpbnN0ZWFkIG9mIG51bWVyaWMgdmFsdWVzLgoKPj4+IEBAIC0xOTc1
LDEyICsxOTc2LDEyIEBAIGNzY2hlZF9zY2hlZHVsZSgKPj4+ICAgICAgICAqLwo+Pj4gICAgICAg
aWYgKCAhdGFza2xldF93b3JrX3NjaGVkdWxlZCAmJiBzbmV4dC0+cHJpID09IENTQ0hFRF9QUklf
SURMRSApCj4+PiAgICAgICB7Cj4+PiAtICAgICAgICBpZiAoICFjcHVtYXNrX3Rlc3RfY3B1KGNw
dSwgcHJ2LT5pZGxlcnMpICkKPj4+IC0gICAgICAgICAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCBw
cnYtPmlkbGVycyk7Cj4+PiArICAgICAgICBpZiAoICFjcHVtYXNrX3Rlc3RfY3B1KHNjaGVkX2Nw
dSwgcHJ2LT5pZGxlcnMpICkKPj4+ICsgICAgICAgICAgICBjcHVtYXNrX3NldF9jcHUoc2NoZWRf
Y3B1LCBwcnYtPmlkbGVycyk7Cj4+PiAgICAgICB9Cj4+PiAtICAgIGVsc2UgaWYgKCBjcHVtYXNr
X3Rlc3RfY3B1KGNwdSwgcHJ2LT5pZGxlcnMpICkKPj4+ICsgICAgZWxzZSBpZiAoIGNwdW1hc2tf
dGVzdF9jcHUoc2NoZWRfY3B1LCBwcnYtPmlkbGVycykgKQo+Pj4gICAgICAgewo+Pj4gLSAgICAg
ICAgY3B1bWFza19jbGVhcl9jcHUoY3B1LCBwcnYtPmlkbGVycyk7Cj4+PiArICAgICAgICBjcHVt
YXNrX2NsZWFyX2NwdShzY2hlZF9jcHUsIHBydi0+aWRsZXJzKTsKPj4+ICAgICAgIH0KPj4KPj4g
QW5kIHRoaXMgbG9va3MgdG8gYmUgYSBwcmV0dHkgZ3Jvc3MgYWJ1c2Ugb2YgQ1BVIG1hc2tzIHRo
ZW4uCj4+IChOZXZlcnRoZWxlc3MgSSBjYW4gc2VlIHRoYXQgdXNpbmcgYSBDUFUgYXMgYSB2ZWhp
Y2xlIGhlcmUgaXMKPj4gaGVscGZ1bCB0byBsaW1pdCB0aGUgc2NvcGUgb2YgdGhlIGFscmVhZHkg
bG9uZyBzZXJpZXMsIGJ1dCBJCj4+IHRoaW5rIGl0IG5lZWRzIHRvIGJlIG1hZGUgbXVjaCBtb3Jl
IGFwcGFyZW50IHdoYXQgaXMgbWVhbnQuKQo+IAo+IEkgZG9uJ3QgdGhpbmsgaXQgaXMgYW4gYWJ1
c2UuIFRoaW5rIG9mIGl0IGFzIGEgY3B1bWFzayB3aGVyZSBvbmx5Cj4gdGhlIGJpdHMgcmVsYXRl
ZCB0byB0aGUgcmVzb3VyY2UncyBtYXN0ZXJfY3B1cyBjYW4gYmUgc2V0LgoKV2VsbCwgSSB1bmRl
cnN0YW5kIHRoYXQgdGhpcyB3YXMgeW91ciB0aGlua2luZyBiZWhpbmQgcmV0YWluaW5nCnRoZSB1
c2Ugb2YgQ1BVIG1hc2tzIGhlcmUuIFdpdGggdGhlICJtYXN0ZXJfY3B1IiBuYW1pbmcgaXQgbWF5
CmluZGVlZCBlbmQgdXAgbG9va2luZyBsZXNzIGFidXNlLWxpa2UsIGJ1dCBJIHN0aWxsIHdvbmRl
ciAoYXMKYWxzbyBzdWdnZXN0ZWQgZWxzZXdoZXJlKSB3aGV0aGVyIGFuIElEIGNvbmNlcHQgc2lt
aWxhciB0byB0aGF0Cm9mIEFQSUMgSUQgdnMgKGRlcml2ZWQpIGNvcmUvc29ja2V0L25vZGUgSUQg
d291bGRuJ3QgYmUgYmV0dGVyCmluIGNhc2VzIHdoZXJlIGFuIElEIGlzIHRvIHJlcHJlc2VudCBt
dWx0aXBsZSBDUFVzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
