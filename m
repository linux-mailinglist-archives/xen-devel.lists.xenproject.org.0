Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E9E1260C3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:22:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihtpo-00051z-A6; Thu, 19 Dec 2019 11:19:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNyU=2J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihtpm-00051u-Q9
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 11:19:10 +0000
X-Inumbo-ID: 5bacfdcc-2251-11ea-a914-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bacfdcc-2251-11ea-a914-bc764e2007e4;
 Thu, 19 Dec 2019 11:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576754342;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9LH1fOsndUmLMvAmMPEdlQ1RqEXRAvvuqu7sMNrjoqk=;
 b=fBlDSYtoUfPhe9nlv7IerBIrqW/LR96qQVXBf35RbNdutcEpdyB2M6bR
 JP6BdB03DTapXsrEk+vBTx4rX1XZuLuPkfVNiYTJ0X2kEENS3hsK6fhJk
 Ksbjv1SRT6l7600CDYDmzvjVd8WJXv0x+dnj9ztrxwZLFoQ94w9K75oAu 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I+oyCHkW4P2m/yF2NlZyqrvdi8qqFnWd2JUY09P0zxP+AF/sEExDVKDobq5aVBYuox3rk+903L
 T/HZsYo+LX6AkVYXof+Hw7tyG8ALAotPHJwjYks/9rQxYMXdWKdIqIKAFBnn3/g/eJn60puYir
 SueKWUWWEy6eOGQmFs2IMbLvxo1oTwzdHtv9ZpPlNNWi+57EXbWt8Z7ooexGy66XPHOAnyKXTu
 yy7QfohK3z+4ZPacLCduJ/cgCsjIVYMTO4qdIpaEPU/4urpfSH3KAf7+nSqOPyI5gWUk9NJIP9
 WqY=
X-SBRS: 2.7
X-MesageID: 10072178
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,331,1571716800"; d="scan'208";a="10072178"
To: Tamas K Lengyel <tamas.lengyel@intel.com>, <xen-devel@lists.xenproject.org>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <cacdc0909f85b78b69c07ba5230b84ceae82954a.1576697796.git.tamas.lengyel@intel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a8af0ab7-0396-f57b-2610-4417220034e2@citrix.com>
Date: Thu, 19 Dec 2019 11:18:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cacdc0909f85b78b69c07ba5230b84ceae82954a.1576697796.git.tamas.lengyel@intel.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 04/20] x86/mem_sharing: cleanup code and
 comments in various locations
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMTIvMjAxOSAxOTo0MCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+IGluZGV4
IDVhM2E5NjJmYmIuLjFlODg4YjQwM2IgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9o
dm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiBAQCAtMTkwMiwxMiArMTkwMiwx
MSBAQCBpbnQgaHZtX2hhcF9uZXN0ZWRfcGFnZV9mYXVsdChwYWRkcl90IGdwYSwgdW5zaWduZWQg
bG9uZyBnbGEsCj4gICAgICBpZiAoIG5wZmVjLndyaXRlX2FjY2VzcyAmJiAocDJtdCA9PSBwMm1f
cmFtX3NoYXJlZCkgKQo+ICAgICAgewo+ICAgICAgICAgIEFTU0VSVChwMm1faXNfaG9zdHAybShw
Mm0pKTsKPiAtICAgICAgICBzaGFyaW5nX2Vub21lbSA9IAo+IC0gICAgICAgICAgICAobWVtX3No
YXJpbmdfdW5zaGFyZV9wYWdlKGN1cnJkLCBnZm4sIDApIDwgMCk7Cj4gKyAgICAgICAgc2hhcmlu
Z19lbm9tZW0gPSBtZW1fc2hhcmluZ191bnNoYXJlX3BhZ2UoY3VycmQsIGdmbiwgMCk7CgpUaGlz
IGlzIGEgbG9naWNhbCBjaGFuZ2UuwqAgSXMgaXQgaW50ZW5kZWQgdG8gYmUgaW4gYSBsYXRlciBw
YXRjaD8KCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVu
L2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiBpbmRleCBlZmI4ODIxNzY4Li4zMTlhYWYzMDc0
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gKysrIGIveGVu
L2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiBAQCAtMTk4LDI0ICsyMDAsMjYgQEAgc3RhdGlj
IGlubGluZSBzaHJfaGFuZGxlX3QgZ2V0X25leHRfaGFuZGxlKHZvaWQpCj4gICNkZWZpbmUgbWVt
X3NoYXJpbmdfZW5hYmxlZChkKSBcCj4gICAgICAoaXNfaHZtX2RvbWFpbihkKSAmJiAoZCktPmFy
Y2guaHZtLm1lbV9zaGFyaW5nX2VuYWJsZWQpCj4gIAo+IC1zdGF0aWMgYXRvbWljX3QgbnJfc2F2
ZWRfbWZucyAgID0gQVRPTUlDX0lOSVQoMCk7IAo+ICtzdGF0aWMgYXRvbWljX3QgbnJfc2F2ZWRf
bWZucyAgID0gQVRPTUlDX0lOSVQoMCk7Cj4gIHN0YXRpYyBhdG9taWNfdCBucl9zaGFyZWRfbWZu
cyAgPSBBVE9NSUNfSU5JVCgwKTsKPiAgCj4gLS8qKiBSZXZlcnNlIG1hcCAqKi8KPiAtLyogRXZl
cnkgc2hhcmVkIGZyYW1lIGtlZXBzIGEgcmV2ZXJzZSBtYXAgKHJtYXApIG9mIDxkb21haW4sIGdm
bj4gdHVwbGVzIHRoYXQKPiArLyoKPiArICogUmV2ZXJzZSBtYXAKPiArICoKPiArICogRXZlcnkg
c2hhcmVkIGZyYW1lIGtlZXBzIGEgcmV2ZXJzZSBtYXAgKHJtYXApIG9mIDxkb21haW4sIGdmbj4g
dHVwbGVzIHRoYXQKPiAgICogdGhpcyBzaGFyZWQgZnJhbWUgYmFja3MuIEZvciBwYWdlcyB3aXRo
IGEgbG93IGRlZ3JlZSBvZiBzaGFyaW5nLCBhIE8obikKPiAgICogc2VhcmNoIGxpbmtlZCBsaXN0
IGlzIGdvb2QgZW5vdWdoLiBGb3IgcGFnZXMgd2l0aCBoaWdoZXIgZGVncmVlIG9mIHNoYXJpbmcs
Cj4gLSAqIHdlIHVzZSBhIGhhc2ggdGFibGUgaW5zdGVhZC4gKi8KPiArICogd2UgdXNlIGEgaGFz
aCB0YWJsZSBpbnN0ZWFkLgo+ICsgKi8KPiAgCj4gIHR5cGVkZWYgc3RydWN0IGdmbl9pbmZvCj4g
IHsKPiAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuOwo+IC0gICAgZG9taWRfdCBkb21haW47IAo+ICsg
ICAgZG9taWRfdCBkb21haW47Cj4gICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7Cj4gIH0gZ2Zu
X2luZm9fdDsKPiAgCj4gLXN0YXRpYyBpbmxpbmUgdm9pZAo+IC1ybWFwX2luaXQoc3RydWN0IHBh
Z2VfaW5mbyAqcGFnZSkKPiArc3RhdGljIGlubGluZSB2b2lkIHJtYXBfaW5pdChzdHJ1Y3QgcGFn
ZV9pbmZvICpwYWdlKQoKU2VlaW5nIGFzIHlvdSdyZSBmb2xkaW5nIHRoaXMsIHRoZSBpbmxpbmUg
Y2FuIGJlIGRyb3BwZWQuwqAgSW4gLmMgZmlsZXMsCmZ1bmN0aW9ucyBzaG91bGQganVzdCBiZSBz
dGF0aWMuCgo+IEBAIC00MzcsMjUgKzQ0MSwyOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbWVtX3No
YXJpbmdfZ2ZuX2Rlc3Ryb3koc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwKPiAgICAgIHhmcmVlKGdm
bl9pbmZvKTsKPiAgfQo+ICAKPiAtc3RhdGljIHN0cnVjdCBwYWdlX2luZm8qIG1lbV9zaGFyaW5n
X2xvb2t1cCh1bnNpZ25lZCBsb25nIG1mbikKPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFnZV9p
bmZvKiBtZW1fc2hhcmluZ19sb29rdXAodW5zaWduZWQgbG9uZyBtZm4pCgpTZWVpbmcgYXMgdGhp
cyBpcyBjbGVhbnVwLCB0aGUgcG9zaXRpb24gb2YgdGhlICogY2FuIG1vdmUuwqAgU2ltaWxhcmx5
LAppdCBzaG91bGRuJ3QgZ2FpbiBhbiBpbmxpbmUuCgpJIGNhbiBmaXggYWxsIG9mIHRoaXMgdXAg
b24gY29tbWl0IChhbmQgYSBmZXcgb3RoZXIgYnJhY2UgcG9zaXRpb24KaXNzdWVzKSBpZiB5b3Ug
d2FudCwgdG8gc2F2ZSByZXdvcmtpbmcgYSB0cml2aWFsIHYyLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
