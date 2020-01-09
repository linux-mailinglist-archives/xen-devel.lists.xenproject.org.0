Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAFD135CD8
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 16:33:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipZlR-0005Hb-Te; Thu, 09 Jan 2020 15:30:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zaws=26=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipZlR-0005HU-Au
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 15:30:25 +0000
X-Inumbo-ID: f43b1156-32f4-11ea-b9f9-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f43b1156-32f4-11ea-b9f9-12813bfff9fa;
 Thu, 09 Jan 2020 15:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578583824;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=r7fVXoSltw+PZqHG6p+J3q13Cd4U3Vnk72zpqOZrngo=;
 b=JMk7pAhj363zW0tvRVkdMdf1JwHzNbwG5H5Su1/4PiVshNFegziKeiUk
 0xY4yOqy07cbyiVggXZzouj2ZgMyy4+nIQQCyPNi15NjaNWzZxxDPcUgJ
 lJzVnOCR3X6n/YwbQpNfq3qLJBIe1jcownIKSFS8lIpWt26tvVRJyUUo8 c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: neq3m4V5UNUIx2XU9M5XO9bbatP8bNkVJ5VjSJ0ZimTev7eSSHDRv9c9+H/82huTrxm7CUz65L
 ZHy7WHFyiHzIXQLDFidYyyBlmNLEvfgzR2fRsBuJDm7d0PVU65rMBEqY1qeW7aIUtmV5bzIe02
 hFvCWLxAJ/eIwZLxk8+YWR9jIOkkZrFCKI5+qd/u/esZyCXg6/5avMjczYCDLCu3X2aBnJtl7g
 7pbNDTKIIBv/yEpm+1jjACeOKbnOZwFGbkMqazwLvGiKK/QdVWvAKnJ8UXUf2yHEw7z2snBuqq
 Bh4=
X-SBRS: 2.7
X-MesageID: 10675619
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,414,1571716800"; d="scan'208";a="10675619"
To: Jan Beulich <jbeulich@suse.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-11-andrew.cooper3@citrix.com>
 <4503eb28-fb43-a3bf-29d0-6e9a3e419dfb@suse.com>
 <7229f757-5764-aa9b-013b-c7772cff7b9a@citrix.com>
 <ee3c5bf5-03f5-f1f8-ef20-7fb5e8b34fcf@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <94245c21-3e0b-4099-fe22-f2639651f1db@citrix.com>
Date: Thu, 9 Jan 2020 15:30:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ee3c5bf5-03f5-f1f8-ef20-7fb5e8b34fcf@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 10/12] docs/migration: Specify X86_{CPUID,
 MSR}_POLICY records
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDEvMjAyMCAxNTozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMDEuMjAyMCAx
NTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDMvMDEvMjAyMCAxNDo0OSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyNC4xMi4yMDE5IDE2OjE5LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IEBAIC00MzksNiArNDQ5LDM0IEBAIGRlZiB2ZXJpZnlfcmVjb3JkX3N0YXRpY19kYXRh
X2VuZChzZWxmLCBjb250ZW50KToKPj4+PiAgICAgICAgICAgICAgcmFpc2UgUmVjb3JkRXJyb3Io
IlN0YXRpYyBkYXRhIGVuZCByZWNvcmQgZm91bmQgaW4gdjIgc3RyZWFtIikKPj4+PiAgCj4+Pj4g
IAo+Pj4+ICsgICAgZGVmIHZlcmlmeV9yZWNvcmRfeDg2X2NwdWlkX3BvbGljeShzZWxmLCBjb250
ZW50KToKPj4+PiArICAgICAgICAiIiIgeDg2IENQVUlEIHBvbGljeSByZWNvcmQgIiIiCj4+Pj4g
Kwo+Pj4+ICsgICAgICAgIGlmIHNlbGYudmVyc2lvbiA8IDM6Cj4+Pj4gKyAgICAgICAgICAgIHJh
aXNlIFJlY29yZEVycm9yKCJ4ODYgQ1BVSUQgcG9saWN5IHJlY29yZCBmb3VuZCBpbiB2MiBzdHJl
YW0iKQo+Pj4+ICsKPj4+PiArICAgICAgICBzeiA9IGNhbGNzaXplKFg4Nl9DUFVJRF9QT0xJQ1lf
Rk9STUFUKQo+Pj4+ICsgICAgICAgIGNvbnRlbnRzeiA9IGxlbihjb250ZW50KQo+Pj4+ICsKPj4+
PiArICAgICAgICBpZiBjb250ZW50c3ogPCBzeiBvciAoY29udGVudHN6ICUgc3opICE9IDA6Cj4+
Pj4gKyAgICAgICAgICAgIHJhaXNlIFJlY29yZEVycm9yKCJSZWNvcmQgbGVuZ3RoICV1LCBleHBl
Y3RlZCBtdWx0aXBsZSBvZiAldSIgJQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAoY29udGVudHN6LCBzeikpCj4+Pj4gKwo+Pj4+ICsKPj4+PiArICAgIGRlZiB2ZXJpZnlfcmVj
b3JkX3g4Nl9tc3JfcG9saWN5KHNlbGYsIGNvbnRlbnQpOgo+Pj4+ICsgICAgICAgICIiIiB4ODYg
TVNSIHBvbGljeSByZWNvcmQgIiIiCj4+Pj4gKwo+Pj4+ICsgICAgICAgIGlmIHNlbGYudmVyc2lv
biA8IDM6Cj4+Pj4gKyAgICAgICAgICAgIHJhaXNlIFJlY29yZEVycm9yKCJ4ODYgTVNSIHBvbGlj
eSByZWNvcmQgZm91bmQgaW4gdjIgc3RyZWFtIikKPj4+PiArCj4+Pj4gKyAgICAgICAgc3ogPSBj
YWxjc2l6ZShYODZfTVNSX1BPTElDWV9GT1JNQVQpCj4+Pj4gKyAgICAgICAgY29udGVudHN6ID0g
bGVuKGNvbnRlbnQpCj4+Pj4gKwo+Pj4+ICsgICAgICAgIGlmIGNvbnRlbnRzeiA8IHN6IG9yIChj
b250ZW50c3ogJSBzeikgIT0gMDoKPj4+PiArICAgICAgICAgICAgcmFpc2UgUmVjb3JkRXJyb3Io
IlJlY29yZCBsZW5ndGggJXUsIGV4cGVjdGVkIG11bHRpcGxlIG9mICV1IiAlCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIChjb250ZW50c3osIHN6KSkKPj4+IFdoaWxlIEkgY2Fu
J3QgZXZlbiBzZWUgYSB0aGVvcmV0aWNhbCBjYXNlIG9mIHRoZSBDUFVJRCBhcnJheQo+Pj4gaGF2
aW5nIHplcm8gZWxlbWVudHMsIGlzIGl0IHJlYWxseSBlbnRpcmVseSBpbXBsYXVzaWJsZSB0byBo
YXZlCj4+PiBhbiBlbXB0eSBNU1JzIGFycmF5PyBJLmUuIHdvdWxkbid0IHRoZSBsZWZ0IHNpZGUg
b2YgdGhlICJvciIKPj4+IGJldHRlciBnbyBhd2F5Pwo+PiBNU1JzIHdpbGwgbmV2ZXIgaGF2ZSAw
IGVudHJpZXMsIGJlY2F1c2UgdW5saWtlIENQVUlELCB3ZSBjYW4ndCBvbWl0Cj4+IHJlY29yZHMg
d2l0aCAwcyBhcyB0aGVpciBjb250ZW50LsKgIFRoaXMgYmVjb21lcyBhbWJpZ3VvdXMgd2hlbiB0
aGUKPj4gcG9saWN5IGRlZmF1bHQgaXMgbm9uemVyby4KPiBJc24ndCB0aGUgc2FtZSB0cnVlIGZv
ciBDUFVJRCwgaW4gcGFydGljdWxhciBzb21lIG9mIHRoZSBub24tYm9vbGVhbgo+IGZpZWxkcz8K
CkkgcGVyaGFwcyBtaXNzcG9rZS7CoCBXZSBjYW4gb21pdCBDUFVJRCBsZWF2ZShzKSBiYXNlZCBv
biBpbmZvcm1hdGlvbgphbHJlYWR5IHNlbnQgKG1heF9sZWFmIGFuZC9vciB0aGUgYWJzZW5jZSBv
ZiBhbiBlbnVtZXJhdGluZyBmZWF0dXJlKS7CoApJbiB0aGVzZSBjYXNlcywgdGhlIGRlc3RpbmF0
aW9uIHNpZGUgY2FuIHN0aWxsIGZpbGwgdGhlIHJlbWFpbmRlciBpbgp3aXRoIDAncy4KClRvcCBs
ZXZlbCBsZWF2ZXMgd2l0aG91dCBhbiBlbmNvbXBhc3NpbmcgZmVhdHVyZSBkbyBuZWVkIHNlbmRp
bmcgaW4gZnVsbC4KClRoZSBiZXN0IHByYWN0aWNhbCBleGFtcGxlIGlzIGZvciBub3Qgc2VuZGlu
ZyBhbGwgNjMgc3VibGVhdmVzIG9mIHRoZQp4c2F2ZSBzdGF0ZSBsZWFmLCB3aGVuIG1vc3Qgb2Yg
dGhlbSBhcmUgb3V0c2lkZSBvZiB0aGUgcG9saWN5IFhDUjB8WFNTIGJpdHMuCgo+Cj4+IFdoZW4g
d2UgZG8gZ2FpbiBtb3JlIE1TUnMsIEkgd2lsbCBzZWUgYWJvdXQgb3JnYW5pc2luZyBlbGlzaW9u
IGJhc2VkIG9uCj4+IENQVUlEIGZlYXR1cmVzLCBzbyB3ZSBkb24ndCBoYXZlIHRvIHNlbmQgYSAw
IGZvciBldmVyeSBzaW5nbGUgTVNSIGluIHRoZQo+PiBwb2xpY3ksIGJ1dCBNU1JzIHdpdGhvdXQg
Q1BVSUQgZW51bWVyYXRpb24gbXVzdCBhbHdheXMgYmUgc2VudC4KPj4KPj4gVGhpcyBtZWFucyB0
aGF0IHRoZSBvbmUgTVNSIHdlIGhhdmUgY3VycmVudGx5IChNU1JfSU5URUxfUExBVEZPUk1fSU5G
Two+PiBmb3IgQ1BVSUQgRmF1bHRpbmcsIHdoaWNoIHdlIGFsc28gdmlydHVhbGlzZSBvbiBBTUQg
aGFyZHdhcmUpIHNoYWxsCj4+IHVuY29uZGl0aW9uYWxseSBiZSBwcmVzZW50IGZvcmV2ZXIgbW9y
ZS4KPiBIbW0sIHllcy4gU3RpbGwgdGhlIHNwZWNpYWwgY2FzaW5nIG9mIHRoZXJlIG5lZWRpbmcg
dG8gYmUgYXQgbGVhc3QKPiBvbmUgZW50cnkgbG9va3MgYSBsaXR0bGUgb2RkIGhlcmUgKGFuZCBh
bHNvIGZvciBDUFVJRCkuIEkgd291bGQKPiBmaW5kIGl0IG1vcmUgbG9naWNhbCBpZiB0aGVyZSB3
YXMganVzdCB0aGUgcmVtYWluZGVyLW11c3QtYmUtemVybwo+IGNoZWNrLiBCdXQgdGhpcyBpcyBs
aWJ4YyBjb2RlLCBzbyBJJ20gbm90IHRoZSBvbmUgdG8gcmVhbGx5IGp1ZGdlCj4gYW55d2F5LgoK
VGhlIG1pZ3JhdGlvbiBzdHJlYW0gaXMgc3BsaXQgaW50byByZWNvcmRzIHdpdGggbm8gcGxheWxv
YWQgKG1hcmtlcnMKd2l0aCBleHRlcm5hbCBjb250cm9sIGZsb3cgbWVhbmluZyksIGFuZCBkYXRh
IHJlY29yZHMsIHdoaWNoIGhhdmUgYSBwYXlsb2FkLgoKSXQgaXMgYW4gZXJyb3IgZm9yIGEgZGF0
YSByZWNvcmQgdG8gaGF2ZSBubyBwYXlsb2FkLCBiZWNhdXNlIGl0IG1lYW5zCnRoZXJlIGlzIGEg
c291cmNlIHNpZGUgZ2VuZXJhdGlvbiBidWcuwqAgSW4gdGhlIGNhc2Ugb2YgWGVuIHJldHVybmlu
ZyAwCk1TUnMsIHRoZSByZWNvcmQgd291bGQgYmUgb21pdHRlZCBlbnRpcmVseSwgcmF0aGVyIHRo
YW4gYmUgc2VudCB3aXRoIDAKTVNScyB3b3J0aCBvZiBkYXRhLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
