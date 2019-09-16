Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE4B365C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 10:25:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9mH1-0005Gq-DG; Mon, 16 Sep 2019 08:22:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9mH0-0005Gl-Ip
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 08:22:14 +0000
X-Inumbo-ID: 14ad34b9-d85b-11e9-95d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14ad34b9-d85b-11e9-95d9-12813bfff9fa;
 Mon, 16 Sep 2019 08:22:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D2E78B7DB;
 Mon, 16 Sep 2019 08:22:11 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-15-git-send-email-chao.gao@intel.com>
 <754c2336-d380-48ff-0e2e-185282256210@suse.com>
 <20190916031855.GA20697@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad3172e3-19ee-6e69-5701-7fb14d2d88db@suse.com>
Date: Mon, 16 Sep 2019 10:22:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190916031855.GA20697@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 14/16] microcode: rendezvous CPUs in NMI
 handler and load ucode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDkuMjAxOSAwNToxOCwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gRnJpLCBTZXAgMTMsIDIw
MTkgYXQgMTE6MTQ6NTlBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEyLjA5LjIw
MTkgMDk6MjIsIENoYW8gR2FvIHdyb3RlOgo+Pj4gQEAgLTM1NCw2ICszNjAsNTAgQEAgc3RhdGlj
IHZvaWQgc2V0X3N0YXRlKHVuc2lnbmVkIGludCBzdGF0ZSkKPj4+ICAgICAgc21wX3dtYigpOwo+
Pj4gIH0KPj4+ICAKPj4+ICtzdGF0aWMgaW50IHNlY29uZGFyeV90aHJlYWRfd29yayh2b2lkKQo+
Pj4gK3sKPj4+ICsgICAgY3B1bWFza19zZXRfY3B1KHNtcF9wcm9jZXNzb3JfaWQoKSwgJmNwdV9j
YWxsaW5fbWFwKTsKPj4+ICsKPj4+ICsgICAgcmV0dXJuIHdhaXRfZm9yX3N0YXRlKExPQURJTkdf
RVhJVCkgPyAwIDogLUVCVVNZOwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgaW50IHByaW1hcnlf
dGhyZWFkX3dvcmsoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpCj4+Cj4+IEkg
dGhpbmsgaXQgd291bGQgYmUgbmljZSBpZiBib3RoIGZ1bmN0aW9ucyBjYXJyaWVkICJubWkiIGlu
IHRoZWlyCj4+IG5hbWVzIC0gaG93IGFib3V0IHtwcmltYXJ5LHNlY29uZGFyeX1fbm1pX3dvcmso
KT8gT3Igd2FpdCAtIHRoZQo+PiBwcmltYXJ5IG9uZSBnZXRzIHVzZWQgb3V0c2lkZSBvZiBOTUkg
YXMgd2VsbCwgc28gSSdtIGZpbmUgd2l0aCBpdHMKPj4gbmFtZS4KPj4gVGhlIHNlY29uZGFyeSBv
bmUsIG90b2gsIGlzIE5NSS1zcGVjaWZpYyBhbmQgYWxzbyBpdHMgb25seQo+PiBjYWxsZXIgZG9l
c24ndCBjYXJlIGFib3V0IHRoZSByZXR1cm4gdmFsdWUsIHNvIEknZCBzdWdnZXN0IG1ha2luZwo+
PiBpdCByZXR1cm4gdm9pZCBhbG9uZ3NpZGUgYWRkaW5nIHNvbWUgZm9ybSBvZiAibm1pIiB0byBp
dHMgbmFtZS4gT3IsCj4gCj4gV2lsbCBkby4KPiAKPj4gcGVyaGFwcyBldmVuIGJldHRlciwgaGF2
ZSBzZWNvbmRhcnlfdGhyZWFkX2ZuKCkgY2FsbCBpdCwgbW92aW5nIHRoZQo+PiBjcHVfc2lnIHVw
ZGF0ZSBoZXJlIChhbmQgb2YgY291cnNlIHRoZW4gdGhlcmUgc2hvdWxkbid0IGJlIGFueQo+PiAi
bm1pIiBhZGRlZCB0byBpdHMgbmFtZSkuCj4gCj4gRXZlbiB3aXRoICJ1Y29kZT1uby1ubWkiLCBz
ZWNvbmRhcnkgdGhyZWFkcyBoYXZlIHRvIGRvIGJ1c3ktbG9vcCBpbgo+IE5NSSBoYW5kbGluZyB1
dGlsIHByaW1hcnkgdGhyZWFkcyBjb21wbGV0aW5nIHRoZSB1cGRhdGUuIE90aGVyd2lzZSwKPiBp
dCBtYXkgYWNjZXNzIE1TUnMgKGxpa2UgU1BFQ19DVFJMKSB3aGljaCBpcyBjb25zaWRlcmVkIHVu
c2FmZS4KCk9mIGNvdXJzZS4gTm90ZSB0aGF0IEkgc2FpZCAiY2FsbCBpdCI7IEkgZGlkIG5vdCBz
dWdnZXN0IHRvIHJlcGxhY2UKc2Vjb25kYXJ5X3RocmVhZF9mbigpLgoKPj4+ICtzdGF0aWMgaW50
IG1pY3JvY29kZV9ubWlfY2FsbGJhY2soY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3Ms
IGludCBjcHUpCj4+PiArewo+Pj4gKyAgICB1bnNpZ25lZCBpbnQgcHJpbWFyeSA9IGNwdW1hc2tf
Zmlyc3QodGhpc19jcHUoY3B1X3NpYmxpbmdfbWFzaykpOwo+Pj4gKyAgICB1bnNpZ25lZCBpbnQg
Y29udHJvbGxlciA9IGNwdW1hc2tfZmlyc3QoJmNwdV9vbmxpbmVfbWFwKTsKPj4+ICsKPj4+ICsg
ICAgLyogU3lzdGVtLWdlbmVyYXRlZCBOTUksIHdpbGwgYmUgaWdub3JlZCAqLwo+Pj4gKyAgICBp
ZiAoIGxvYWRpbmdfc3RhdGUgIT0gTE9BRElOR19DQUxMSU4gKQo+Pj4gKyAgICAgICAgcmV0dXJu
IDA7Cj4+Cj4+IEknbSBub3QgaGFwcHkgYXQgYWxsIHRvIHNlZSBOTUlzIGJlaW5nIGlnbm9yZWQu
IEJ1dCBieSByZXR1cm5pbmcKPj4gemVybywgeW91IGRvIF9ub3RfIGlnbm9yZSBpdC4gRGlkIHlv
dSBwZXJoYXBzIG1lYW4gIndpbGwgYmUgaWdub3JlZAo+PiBoZXJlIiwgaW4gd2hpY2ggY2FzZSBw
ZXJoYXBzIGJldHRlciAibGVhdmUgdG8gbWFpbiBoYW5kbGVyIj8gQW5kCj4+IGZvciB0aGUgY29t
bWVudCB0byBleHRlbmQgdG8gdGhlIG90aGVyIHR3byBjb25kaXRpb25zIHJpZ2h0IGJlbG93LAo+
PiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBjb21iaW5lIHRoZW0gYWxsIGludG8gYSBz
aW5nbGUgaWYoKS4KPj4KPj4gQWxzbywgdGhyb3VnaG91dCB0aGUgc2VyaWVzLCBJIHRoaW5rIHlv
dSB3YW50IHRvIGNvbnNpc3RlbnRseSB1c2UKPj4gQUNDRVNTX09OQ0UoKSBmb3IgcmVhZHMvd3Jp
dGVzIGZyb20vdG8gbG9hZGluZ19zdGF0ZS4KPj4KPj4+ICsgICAgaWYgKCBjcHUgPT0gY29udHJv
bGxlciB8fCAoIW9wdF91Y29kZV9sb2FkaW5nX2luX25taSAmJiBjcHUgPT0gcHJpbWFyeSkgKQo+
Pj4gKyAgICAgICAgcmV0dXJuIDA7Cj4+Cj4+IFdoeSBub3QKPiAKPiBBcyBJIHNhaWQgYWJvdmUs
IHNlY29uZGFyeSB0aHJlYWRzIGFyZSBleHBlY3RlZCB0byBzdGF5IGluIE5NSSBoYW5kbGVyCj4g
cmVnYXJkbGVzcyB0aGUgc2V0dGluZyBvZiBvcHRfdWNvZGVfbG9hZGluZ19pbl9ubWkuCgpPaCwg
aGVyZSBJIHNlZSBob3cgeW91ciByZW1hcmsgYWJvdmUgbWF0dGVycy4gUGxlYXNlIGFkZCBjb2Rl
CmNvbW1lbnRzIHRoZW4gdG8gbWFrZSB0aGlzIGNsZWFyIHRvIHRoZSByZWFkZXIuCgo+Pj4gLS0t
IGEveGVuL2FyY2gveDg2L3RyYXBzLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCj4+
PiBAQCAtMTI2LDYgKzEyNiw4IEBAIGJvb2xlYW5fcGFyYW0oImxlciIsIG9wdF9sZXIpOwo+Pj4g
IC8qIExhc3RFeGNlcHRpb25Gcm9tSVAgb24gdGhpcyBoYXJkd2FyZS4gIFplcm8gaWYgTEVSIGlz
IG5vdCBpbiB1c2UuICovCj4+PiAgdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgbGVyX21zcjsK
Pj4+ICAKPj4+ICt1bnNpZ25lZCBpbnQgX19yZWFkX21vc3RseSBubWlfY3B1Owo+Pgo+PiBTaW5j
ZSB0aGlzIHZhcmlhYmxlIChmb3Igbm93KSBpcyBuZXZlciB3cml0dGVuIHRvIGl0IHNob3VsZCBn
YWluIGEKPj4gY29tbWVudCBzYXlpbmcgd2h5IHRoaXMgaXMsIGFuZCBwZXJoYXBzIGl0IHdvdWxk
IHRoZW4gYWxzbyBiZXR0ZXIgYmUKPj4gY29uc3QgcmF0aGVyIHRoYW4gX19yZWFkX21vc3RseS4K
PiAKPiBIb3cgYWJvdXQgdXNlIHRoZSBtYWNybyBiZWxvdzoKPiAjZGVmaW5lIE5NSV9DUFUgMAoK
VGhpcyBpcyBhbm90aGVyIG9wdGlvbiwgeWVzLiBJZiB0aGVyZSdzIGFueSBpbnRlbnRpb24gdG8g
ZXZlciBhbGxvdwpvZmZsaW5pbmcgQ1BVIDAsIHRoZW4gaGF2aW5nIHRoZSB2YXJpYWJsZSBpbiBw
bGFjZSB3b3VsZCBzZWVtIGJldHRlcgp0byBtZS4gQnV0IEknbGwgbGVhdmUgaXQgdG8geW91IGF0
IHRoaXMgcG9pbnQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
