Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137EFBCA01
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:18:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClab-0006gT-3h; Tue, 24 Sep 2019 14:14:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iClaZ-0006gH-Np
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:14:47 +0000
X-Inumbo-ID: a962b7b0-ded5-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a962b7b0-ded5-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 14:14:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5A58AEBD;
 Tue, 24 Sep 2019 14:14:45 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-29-jgross@suse.com>
 <6e3467cf-4a96-032d-f568-b6dd2e3cfce1@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <71f007f3-b431-9530-6c6f-1d6da4951808@suse.com>
Date: Tue, 24 Sep 2019 16:14:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6e3467cf-4a96-032d-f568-b6dd2e3cfce1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 28/47] xen/sched: add code to sync
 scheduling of all vcpus of a sched unit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMTkgMTg6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTU1LDYgKzU1LDkgQEAgYm9vbGVh
bl9wYXJhbSgic2NoZWRfc210X3Bvd2VyX3NhdmluZ3MiLCBzY2hlZF9zbXRfcG93ZXJfc2F2aW5n
cyk7Cj4+ICAgaW50IHNjaGVkX3JhdGVsaW1pdF91cyA9IFNDSEVEX0RFRkFVTFRfUkFURUxJTUlU
X1VTOwo+PiAgIGludGVnZXJfcGFyYW0oInNjaGVkX3JhdGVsaW1pdF91cyIsIHNjaGVkX3JhdGVs
aW1pdF91cyk7Cj4+ICAgCj4+ICsvKiBOdW1iZXIgb2YgdmNwdXMgcGVyIHN0cnVjdCBzY2hlZF91
bml0LiAqLwo+PiArc3RhdGljIHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IHNjaGVkX2dyYW51
bGFyaXR5ID0gMTsKPiAKPiBEaWRuJ3QgeW91IGluZGljYXRlIGVhcmxpZXIgdGhhdCB0aGlzIHdv
dWxkIGJlIGEgcGVyLXBvb2wgcHJvcGVydHk/Cj4gT3Igd2FzIHRoYXQganVzdCBhIGxvbmdlciB0
ZXJtIHBsYW4/CgpUaGF0IHdhcyBwbGFubmVkIGZvciBsYXRlci4KCj4gCj4+ICsvKgo+PiArICog
UmVuZGV6dm91cyBiZWZvcmUgdGFraW5nIGEgc2NoZWR1bGluZyBkZWNpc2lvbi4KPj4gKyAqIENh
bGxlZCB3aXRoIHNjaGVkdWxlIGxvY2sgaGVsZCwgc28gYWxsIGFjY2Vzc2VzIHRvIHRoZSByZW5k
ZXp2b3VzIGNvdW50ZXIKPj4gKyAqIGNhbiBiZSBub3JtYWwgb25lcyAobm8gYXRvbWljIGFjY2Vz
c2VzIG5lZWRlZCkuCj4+ICsgKiBUaGUgY291bnRlciBpcyBpbml0aWFsaXplZCB0byB0aGUgbnVt
YmVyIG9mIGNwdXMgdG8gcmVuZGV6dm91cyBpbml0aWFsbHkuCj4+ICsgKiBFYWNoIGNwdSBlbnRl
cmluZyB3aWxsIGRlY3JlbWVudCB0aGUgY291bnRlci4gSW4gY2FzZSB0aGUgY291bnRlciBiZWNv
bWVzCj4+ICsgKiB6ZXJvIGRvX3NjaGVkdWxlKCkgaXMgY2FsbGVkIGFuZCB0aGUgcmVuZGV6dm91
cyBjb3VudGVyIGZvciBsZWF2aW5nCj4+ICsgKiBjb250ZXh0X3N3aXRjaCgpIGlzIHNldC4gQWxs
IG90aGVyIG1lbWJlcnMgd2lsbCB3YWl0IHVudGlsIHRoZSBjb3VudGVyIGlzCj4+ICsgKiBiZWNv
bWluZyB6ZXJvLCBkcm9wcGluZyB0aGUgc2NoZWR1bGUgbG9jayBpbiBiZXR3ZWVuLgo+PiArICov
Cj4gCj4gVGhpcyByZWN1cnJpbmcgbG9jay91bmxvY2sgaXMgbGlhYmxlIHRvIGNhdXNlIGEgbWFz
c2l2ZSBjYWNoZSBsaW5lCj4gcGluZy1wb25nLCBlc3BlY2lhbGx5IGZvciBzb2NrZXQgb3Igbm9k
ZSBzY2hlZHVsaW5nLiBJbnN0ZWFkIG9mCj4ganVzdCBhIGNwdV9yZWxheCgpIGJldHdlZW4gdGhl
IG1haW4gdW5sb2NrIGFuZCByZS1sb2NrLCBjb3VsZCB0aGVyZQo+IHBlcmhhcHMgYmUgbG9jay1s
ZXNzIGNoZWNrcyB0byBkZXRlcm1pbmUgd2hldGhlciB0aGVyZSdzIGFueSBwb2ludAo+IGF0IGFs
bCByZS1hY3F1aXJpbmcgdGhlIGxvY2s/CgpIbW0sIHRoaXMgaXMgY2VydGFpbmx5IGFuIGlkZWEg
Zm9yIGltcHJvdmVtZW50LgoKSSB3aWxsIHRoaW5rIGFib3V0IHRoYXQgYW5kIGluIGNhc2UgSSBj
YW4gY29tZSB1cCB3aXRoIHNvbWV0aGluZyBJJ2xsCnNlbmQgZWl0aGVyIGEgZm9sbG93dXAgcGF0
Y2ggb3IgaW5jbHVkZSBpdCBpbiB0aGUgc2VyaWVzLCBkZXBlbmRpbmcgb24KdGhlIGNvbXBsZXhp
dHkgb2YgdGhlIHNvbHV0aW9uLgoKPiAKPj4gK3N0YXRpYyB2b2lkIHNjaGVkdWxlKHZvaWQpCj4+
ICt7Cj4+ICsgICAgc3RydWN0IHZjcHUgICAgICAgICAgKnZuZXh0LCAqdnByZXYgPSBjdXJyZW50
Owo+PiArICAgIHN0cnVjdCBzY2hlZF91bml0ICAgICpwcmV2ID0gdnByZXYtPnNjaGVkX3VuaXQs
ICpuZXh0ID0gTlVMTDsKPj4gKyAgICBzX3RpbWVfdCAgICAgICAgICAgICAgbm93Owo+PiArICAg
IHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc2Q7Cj4+ICsgICAgc3BpbmxvY2tfdCAgICAgICAgICAg
KmxvY2s7Cj4+ICsgICAgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPj4gKwo+PiArICAg
IEFTU0VSVF9OT1RfSU5fQVRPTUlDKCk7Cj4+ICsKPj4gKyAgICBTQ0hFRF9TVEFUX0NSQU5LKHNj
aGVkX3J1bik7Cj4+ICsKPj4gKyAgICBzZCA9IGdldF9zY2hlZF9yZXMoY3B1KTsKPj4gKwo+PiAr
ICAgIGxvY2sgPSBwY3B1X3NjaGVkdWxlX2xvY2tfaXJxKGNwdSk7Cj4+ICsKPj4gKyAgICBpZiAo
IHByZXYtPnJlbmRlenZvdXNfaW5fY250ICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIC8qCj4+ICsg
ICAgICAgICAqIFdlIGhhdmUgYSByYWNlOiBzY2hlZF9zbGF2ZSgpIHNob3VsZCBiZSBjYWxsZWQs
IHNvIHJhaXNlIGEgc29mdGlycQo+PiArICAgICAgICAgKiBpbiBvcmRlciB0byByZS1lbnRlciBz
Y2hlZHVsZSgpIGxhdGVyIGFuZCBjYWxsIHNjaGVkX3NsYXZlKCkgbm93Lgo+PiArICAgICAgICAg
Ki8KPj4gKyAgICAgICAgcGNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIGNwdSk7Cj4+ICsK
Pj4gKyAgICAgICAgcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKTsKPj4gKyAgICAgICAg
cmV0dXJuIHNjaGVkX3NsYXZlKCk7Cj4+ICsgICAgfQo+PiArCj4+ICsgICAgbm93ID0gTk9XKCk7
Cj4+ICsKPj4gKyAgICBzdG9wX3RpbWVyKCZzZC0+c190aW1lcik7Cj4gCj4gSXMgdGhlIG9yZGVy
IG9mIHRoZXNlIHR3byByZWxldmFudD8gQSB3aGlsZSBhZ28gdGhlcmUgd2VyZSBhIGNvdXBsZQo+
IG9mIGNoYW5nZXMgbW92aW5nIHN1Y2ggTk9XKCkgaW52b2NhdGlvbnMgcGFzdCBhbnl0aGluZyB0
aGF0IG1heSB0YWtlCj4gbm9uLW5lZ2xpZ2libGUgdGltZSwgdG8gbWFrZSBhY2NvdW50aW5nIGFz
IGFjY3VyYXRlIGFzIHBvc3NpYmxlLgoKTm8sIEkgZG9uJ3QgdGhpbmsgdGhlIG9yZGVyIGlzIHJl
bGV2YW50LiBJIGNhbiBzd2FwIHRoZW0uCgo+IAo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc29m
dGlycS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zb2Z0aXJxLmgKPj4gQEAgLTQsNiArNCw3
IEBACj4+ICAgLyogTG93LWxhdGVuY3kgc29mdGlycXMgY29tZSBmaXJzdCBpbiB0aGUgZm9sbG93
aW5nIGxpc3QuICovCj4+ICAgZW51bSB7Cj4+ICAgICAgIFRJTUVSX1NPRlRJUlEgPSAwLAo+PiAr
ICAgIFNDSEVEX1NMQVZFX1NPRlRJUlEsCj4+ICAgICAgIFNDSEVEVUxFX1NPRlRJUlEsCj4+ICAg
ICAgIE5FV19UTEJGTFVTSF9DTE9DS19QRVJJT0RfU09GVElSUSwKPj4gICAgICAgUkNVX1NPRlRJ
UlEsCj4gCj4gU2VlaW5nIHRoZSBjb21tZW50LCBpcyB0aGUgaW5zZXJ0aW9uIHlvdSBkbyBhcyB3
ZWxsIGFzIHRoZSBwcmUtCj4gZXhpc3RpbmcgcGxhY2VtZW50IG9mIFNDSEVEVUxFX1NPRlRJUlEg
c3RpbGwgYXBwcm9wcmlhdGUgd2l0aAo+IHRoZSByZW5kZXp2b3VzLWluZyB5b3UgaW50cm9kdWNl
PwoKUHV0dGluZyBTQ0hFRF9TTEFWRV9TT0ZUSVJRIGJlZm9yZSBTQ0hFRFVMRV9TT0ZUSVJRIGlz
IGRvbmUgb24gcHVycG9zZSwKYXMgSSB3YW50IHNsYXZlIGV2ZW50cyB0byBoYXZlIGhpZ2hlciBw
cmlvcml0eSB0aGFuIG5vcm1hbCBzY2hlZHVsZQpldmVudHMuCgpXaGV0aGVyIGJvdGggd2FudCB0
byBiZSBhdCB0aGF0IHBsYWNlIG9yIHNob3VsZCBiZSBtb3ZlZCBpcyBzb21ldGhpbmcKd2hpY2gg
c2hvdWxkIGJlIGNvbnNpZGVyZWQgY2FyZWZ1bGx5LiBJcyBpdCBva2F5IHRvIHBvc3Rwb25lIHRo
YXQKcXVlc3Rpb24/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
