Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C3118C65
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:22:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehIm-0008GJ-22; Tue, 10 Dec 2019 15:19:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iehIk-0008GA-Rm
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:19:50 +0000
X-Inumbo-ID: 80adeb56-1b60-11ea-8981-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80adeb56-1b60-11ea-8981-12813bfff9fa;
 Tue, 10 Dec 2019 15:19:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A9A9AE46;
 Tue, 10 Dec 2019 15:19:47 +0000 (UTC)
To: Hongyan Xia <hongyxia@amazon.com>
References: <cover.1575891620.git.hongyxia@amazon.com>
 <3375af1e708b4ec3205f493a17da6e0369249096.1575891620.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ab3715f-487c-8351-726f-5155c5454d83@suse.com>
Date: Tue, 10 Dec 2019 16:20:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3375af1e708b4ec3205f493a17da6e0369249096.1575891620.git.hongyxia@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
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
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxMjo0OCwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L21tLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+IEBAIC01MTUxLDYgKzUxNTEsNTEg
QEAgbDFfcGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9sMWUodW5zaWduZWQgbG9uZyB2KQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZmx1c2hfYXJlYV9sb2NhbCgoY29uc3Qgdm9pZCAqKXYsIGYp
IDogXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmx1c2hfYXJlYV9hbGwoKGNvbnN0IHZv
aWQgKil2LCBmKSkKPiAgCj4gKy8qIFNoYXR0ZXIgYW4gbDMgZW50cnkgYW5kIHBvcHVsYXRlIGwy
LiBJZiB2aXJ0IGlzIHBhc3NlZCBpbiwgYWxzbyBkbyBmbHVzaC4gKi8KPiArc3RhdGljIGludCBz
aGF0dGVyX2wzZShsM19wZ2VudHJ5X3QgKnBsM2UsIHVuc2lnbmVkIGxvbmcgdmlydCwgYm9vbCBs
b2NraW5nKQo+ICt7Cj4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiArICAgIGwzX3BnZW50cnlfdCBv
bDNlOwo+ICsgICAgbDJfcGdlbnRyeV90IG9sMmUsICpsMnQgPSBhbGxvY194ZW5fcGFnZXRhYmxl
KCk7Cj4gKwo+ICsgICAgaWYgKCBsMnQgPT0gTlVMTCApCgpOb3dhZGF5cyB3ZSBzZWVtIHRvIHBy
ZWZlciAhbDJ0IGluIGNhc2VzIGxpa2UgdGhpcyBvbmUuCgo+ICsgICAgICAgIHJldHVybiAtMTsK
Ci1FTk9NRU0gcGxlYXNlIChhbmQgdGhlbiBoYW5kZWQgb24gYnkgdGhlIGNhbGxlcikuCgo+ICsg
ICAgb2wzZSA9ICpwbDNlOwoKVGhpcyBjb3VsZCBiZSB0aGUgdmFyaWFibGUncyBpbml0aWFsaXpl
ci4KCj4gKyAgICBvbDJlID0gbDJlX2Zyb21faW50cHRlKGwzZV9nZXRfaW50cHRlKG9sM2UpKTsK
ClRoZXJlJ3Mgbm90aGluZyAib2xkIiBhYm91dCB0aGlzIEwyIGVudHJ5LCBzbyBpdHMgbmFtZSB3
b3VsZCBiZXR0ZXIKYmUganVzdCAibDJlIiBJIHRoaW5rLgoKPiArICAgIGZvciAoIGkgPSAwOyBp
IDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCj4gKyAgICB7Cj4gKyAgICAgICAgbDJlX3dy
aXRlKGwydCArIGksIG9sMmUpOwo+ICsgICAgICAgIG9sMmUgPSBsMmVfZnJvbV9pbnRwdGUoCj4g
KyAgICAgICAgICAgICAgICBsMmVfZ2V0X2ludHB0ZShvbDJlKSArICgxIDw8IChQQUdFVEFCTEVf
T1JERVIgKyBQQUdFX1NISUZUKSkpOwoKSW5kZW50YXRpb24gbG9va3Mgb2RkIGhlcmUgKGFsc28g
ZnVydGhlciBkb3duKS4gSWYgdGhlIGZpcnN0IGFyZ3VtZW50Cm9mIGEgZnVuY3Rpb24gY2FsbCBk
b2Vzbid0IGZpdCBvbiB0aGUgbGluZSBhbmQgd291bGQgYWxzbyBiZSB1Z2x5IHRvCnNwbGl0IGFj
cm9zcyBsaW5lcywgd2hhdCB3ZSBkbyBpcyBpbmRlbnQgaXQgdGhlIHVzdWFsIDQgY2hhcmFjdGVy
cwpmcm9tIHRoZSBmdW5jdGlvbiBpbnZvY2F0aW9uLCBpLmUuIGluIHRoaXMgY2FzZQoKICAgICAg
ICBvbDJlID0gbDJlX2Zyb21faW50cHRlKAogICAgICAgICAgICAgICAgICAgbDJlX2dldF9pbnRw
dGUob2wyZSkgKyAoMSA8PCAoUEFHRVRBQkxFX09SREVSICsgUEFHRV9TSElGVCkpKTsKCmFuZCB0
aGVuIHNsaWdodGx5IHNob3J0ZXIKCiAgICAgICAgb2wyZSA9IGwyZV9mcm9tX2ludHB0ZSgKICAg
ICAgICAgICAgICAgICAgIGwyZV9nZXRfaW50cHRlKG9sMmUpICsgKFBBR0VfU0laRSA8PCBQQUdF
VEFCTEVfT1JERVIpKTsKCk9mIGNvdXJzZSwgYXMgbWVudGlvbmVkIGJlZm9yZSwgSSdtIG5vdCBv
dmVybHkgaGFwcHkgdG8gc2VlIHR5cGUKc2FmZXR5IGxvc3QgaW4gY2FzZSBsaWtlIHRoaXMgb25l
LCB3aGVyZSBpdCdzIG5vdCBuZWVkZWQgbGlrZSBlLmcuCmZ1cnRoZXIgdXAgdG8gY29udmVydCBm
cm9tIEwzIHRvIEwyIGVudHJ5LgoKPiArICAgIH0KPiArICAgIGlmICggbG9ja2luZyApCj4gKyAg
ICAgICAgc3Bpbl9sb2NrKCZtYXBfcGdkaXJfbG9jayk7Cj4gKyAgICBpZiAoIChsM2VfZ2V0X2Zs
YWdzKCpwbDNlKSAmIF9QQUdFX1BSRVNFTlQpICYmCj4gKyAgICAgICAgIChsM2VfZ2V0X2ZsYWdz
KCpwbDNlKSAmIF9QQUdFX1BTRSkgKQo+ICsgICAgewo+ICsgICAgICAgIGwzZV93cml0ZV9hdG9t
aWMocGwzZSwKPiArICAgICAgICAgICAgICAgIGwzZV9mcm9tX3BhZGRyKChwYWRkcl90KXZpcnRf
dG9fbWFkZHIobDJ0KSwgX19QQUdFX0hZUEVSVklTT1IpKTsKPiArICAgICAgICBsMnQgPSBOVUxM
Owo+ICsgICAgfQo+ICsgICAgaWYgKCBsb2NraW5nICkKPiArICAgICAgICBzcGluX3VubG9jaygm
bWFwX3BnZGlyX2xvY2spOwo+ICsgICAgaWYgKCB2aXJ0ICkKPiArICAgIHsKPiArICAgICAgICB1
bnNpZ25lZCBpbnQgZmx1c2hfZmxhZ3MgPQo+ICsgICAgICAgICAgICBGTFVTSF9UTEIgfCBGTFVT
SF9PUkRFUigyICogUEFHRVRBQkxFX09SREVSKTsKPiArCj4gKyAgICAgICAgaWYgKCAobDNlX2dl
dF9mbGFncyhvbDNlKSAmIF9QQUdFX0dMT0JBTCkgKQoKVW5uZWNlc3NhcnkgcGFpciBvZiBwYXJl
bnRoZXNlcyAod2hpY2ggYWxzbyB3YXNuJ3QgdGhlcmUgaW4gdGhlCm9yaWdpbmFsIGNvZGUpLgoK
PiArICAgICAgICAgICAgICAgIGZsdXNoX2ZsYWdzIHw9IEZMVVNIX1RMQl9HTE9CQUw7CgpUb28g
ZGVlcCBpbmRlbnRhdGlvbi4KCj4gKyAgICAgICAgZmx1c2hfYXJlYSh2aXJ0LCBmbHVzaF9mbGFn
cyk7Cj4gKyAgICB9Cj4gKyAgICBpZiAoIGwydCApCj4gKyAgICAgICAgZnJlZV94ZW5fcGFnZXRh
YmxlKGwydCk7Cj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4gK30KCkFsc28gcGxlYXNlIGFkZCBibGFu
ayBsaW5lcyBiZXR3ZWVuCi0gTDIgcG9wdWxhdGlvbiBhbmQgbG9jayBhY3F1aXJlLAotIGxvY2sg
cmVsZWFzZSBhbmQgVExCIGZsdXNoLAotIFRMQiBmbHVzaCBhbmQgZnJlZS4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
