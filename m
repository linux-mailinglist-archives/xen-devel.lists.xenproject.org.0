Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B52107466
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 15:58:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYALq-0005OB-Dj; Fri, 22 Nov 2019 14:56:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cGBV=ZO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iYALp-0005O6-0Q
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 14:56:01 +0000
X-Inumbo-ID: 31f00ea8-0d38-11ea-a354-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31f00ea8-0d38-11ea-a354-12813bfff9fa;
 Fri, 22 Nov 2019 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574434560;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1cYWttDfY3k5snfHGUZqLNqy7jB8qpfX8gE8tMLtde4=;
 b=WL/t3kvJ4KQyFGpiesfvPf9Db3WGg8qYNCStxGd7DYPcnV3E3o5FId58
 8KF/FpdJ+Nsv0/FbcJ4d2LZuBwz+/ybpU65qT8BK+E91KdskRqbb4H2uo
 Vl0V6cK/tA6k686hR5gbzpaYWT6UCGHKv8l1qTIBn9Oyixh/jmW9cGICl E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: afFt0n90fksaeTAr554CC/QqYD763KOhWmRkAEpdv7JPc6Ys766XCacUFZjhKN7GrubKJhWpSR
 hhLK63Ym4z9cPMauWQpXuAq2/XAKgRJEZTSRW+PkuQoNAIqcFIOnF7TxOOcI/twp5CIs73yCUw
 ulf4fpHbZGzEJGdSkzOmmmCjX3ceLi41sM7HCrjNf9FhEE3oHzXPuKrIS1nRigOfeJJGPmqhyO
 tPP7CLYm6Z4y5ByV8Bbtu5+hHFA/AClIiZMLPFaIEOnA/+REvQsxH0xbLLkEM5L2pROWx1KhsQ
 nQo=
X-SBRS: 2.7
X-MesageID: 8720037
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,230,1571716800"; 
   d="scan'208";a="8720037"
To: Jan Beulich <jbeulich@suse.com>
References: <20191121221551.1175-1-andrew.cooper3@citrix.com>
 <20191121221551.1175-3-andrew.cooper3@citrix.com>
 <e2fe7f81-2852-dc74-d4b8-b990c186f1cf@suse.com>
 <c60b3c89-5617-caa4-3ca8-4648c378c2f6@citrix.com>
 <8ef29318-259e-b505-eee0-276f1377c0b8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <53929e69-4551-8c60-a042-0dd85f27e22a@citrix.com>
Date: Fri, 22 Nov 2019 14:55:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8ef29318-259e-b505-eee0-276f1377c0b8@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/svm: Write the correct %eip into
 the outgoing task
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMTEvMjAxOSAxNDozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjIuMTEuMjAxOSAx
NDo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjIvMTEvMjAxOSAxMzozMSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyMS4xMS4yMDE5IDIzOjE1LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+ICsgICAgICAgIC8qIEZhbGx0aHJvdWdoICovCj4+Pj4gKyAgICBjYXNlIDB4NjI6IC8q
IGJvdW5kICovCj4+PiBEb2VzICJib3VuZCIgcmVhbGx5IGJlbG9uZyBvbiB0aGlzIGxpc3Q/IEl0
IHJhaXNpbmcgI0JSIGlzIGxpa2UKPj4+IGluc25zIHJhaXNpbmcgcmFuZG9tIG90aGVyIGV4Y2Vw
dGlvbnMsIG5vdCBsaWtlIElOVE8gLyBJTlQzLAo+Pj4gd2hlcmUgdGhlIElEVCBkZXNjcmlwdG9y
IGFsc28gaGFzIHRvIGhhdmUgc3VpdGFibGUgRFBMIGZvciB0aGUKPj4+IGV4Y2VwdGlvbiB0byBh
Y3R1YWxseSBnZXQgZGVsaXZlcmVkIChyYXRoZXIgdGhhbiAjR1ApLiBJLmUuIGl0Cj4+PiBzaG91
bGRuJ3QgbWFrZSBpdCBoZXJlIGluIHRoZSBmaXJzdCBwbGFjZSwgZHVlIHRvIHRoZQo+Pj4gWDg2
X0VWRU5UVFlQRV9IV19FWENFUFRJT04gY2hlY2sgaW4gdGhlIGNhbGxlci4KPj4+Cj4+PiBJT1cg
aWYgImJvdW5kIiBuZWVkcyB0byBiZSBoZXJlLCB0aGVuIGFsbCBvdGhlcnMgbmVlZCB0byBiZSBh
cwo+Pj4gd2VsbCwgdW5sZXNzIHRoZXkgY2FuJ3QgY2F1c2UgYW55IGV4Y2VwdGlvbiBhdCBhbGwu
Cj4+IE1vcmUgZXhwZXJpbWVudGF0aW9uIHJlcXVpcmVkLsKgIEJPVU5EIGRvZXNuJ3QgYXBwZWFy
IHRvIGJlIHNwZWNpYWwgY2FzZWQKPj4gYnkgU1ZNLCBidXQgaXMgYnkgVlQteC7CoCBWVC14IGhv
d2V2ZXIgZG9lcyB0aHJvdyBpdCBpbiB0aGUgc2FtZSBjYXRlZ29yeQo+PiBhcyAjVUQsIGFuZCBp
ZGVudGlmeSBpdCB0byBiZSBhIGhhcmR3YXJlIGV4Y2VwdGlvbi4KPj4KPj4gSSBzdXNwZWN0IHlv
dSBhcmUgcmlnaHQsIGFuZCB0IGRvZXNuJ3Qgd2FudCB0byBiZSBoZXJlLgo+Pgo+Pj4+ICsgICAg
Y2FzZSAweDlhOiAvKiBjYWxsIChmYXIsIGFic29sdXRlKSAqLwo+Pj4+ICsgICAgY2FzZSAweGNh
OiAvKiByZXQgaW1tMTYgKGZhcikgKi8KPj4+PiArICAgIGNhc2UgMHhjYjogLyogcmV0IChmYXIp
ICovCj4+Pj4gKyAgICBjYXNlIDB4Y2M6IC8qIGludDMgKi8KPj4+PiArICAgIGNhc2UgMHhjZDog
LyogaW50IGltbTggKi8KPj4+PiArICAgIGNhc2UgMHhjZTogLyogaW50byAqLwo+Pj4+ICsgICAg
Y2FzZSAweGNmOiAvKiBpcmV0ICovCj4+Pj4gKyAgICBjYXNlIDB4ZWE6IC8qIGptcCAoZmFyLCBh
YnNvbHV0ZSkgKi8KPj4+PiArICAgIGNhc2UgMHhmMTogLyogaWNlYnAgKi8KPj4+IFNhbWUgcGVy
aGFwcyBmb3IgSUNFQlAsIGFsYmVpdCBJJ20gbGVzcyBjZXJ0YWluIGhlcmUsIGFzIGl0cwo+Pj4g
YmVoYXZpb3IgaXMgdG9vIHBvb3JseSBkb2N1bWVudGVkIChpZiBhdCBhbGwpLgo+PiBJQ0VCUCdz
ICNEQiBpcyBhIHRyYXAsIG5vdCBhIGZhdWx0LCBzbyBpbnN0cnVjdGlvbiBsZW5ndGggaXMgaW1w
b3J0YW50Lgo+IEhtbSwgdGhpcyBtYXkgcG9pbnQgYXQgYSBiaWdnZXIgaXNzdWUgdGhlbjogU2lu
Z2xlIHN0ZXAgYW5kIGRhdGEKPiBicmVha3BvaW50cyBhcmUgdHJhcHMsIHRvby4gQnV0IG9mIGNv
dXJzZSB0aGV5IGNhbiBvY2N1ciB3aXRoCj4gYXJiaXRyYXJ5IGluc25zLiBEbyB0aGVpciBpbnRl
cmNlcHRzIG9jY3VyIHdpdGggZ3Vlc3QgUklQIGFscmVhZHkKPiB1cGRhdGVkPwoKQmFzZWQgb24g
b3RoZXIgYmVoYXZpb3VyLCBJJ20gZ29pbmcgdG8gZ3Vlc3MgeWVzIG9uIFNWTSBhbmQgbm8gb24g
VlQteC4KCldlJ2xsIHRha2UgdGhlICNEQiBpbnRlcmNlcHQsIHJlLWluamVjdCwgYW5kIHNob3Vs
ZCBzZWUgYSB2ZWN0b3JpbmcgdGFzawpzd2l0Y2guwqAgVGhlIHR5cGUgc2hvdWxkIG1hdGNoIHRo
ZSByZS1pbmplY3QsIHNvIHdpbGwgYmUgU1dfSU5UL0VYQyB3aXRoCmEgbGVuZ3RoIG9uIFZULXgs
IGFuZCBiZSBIV19FWENFUFRJT04gd2l0aCBubyBsZW5ndGggb24gU1ZNLgoKRWl0aGVyIHdheSwg
SSB0aGluayB0aGUgbG9naWMgcHJlc2VudGVkIGhlcmUgd2lsbCB3b3JrIGNvcnJlY3RseS4KCj4g
KFRoZXkgd291bGRuJ3QgY3VycmVudGx5IG1ha2UgaXQgaGVyZSBhbnl3YXkgYmVjYXVzZSBvZgo+
IHRoZSBYODZfRVZFTlRUWVBFX0hXX0VYQ0VQVElPTiBjaGVjayBpbiB0aGUgY2FsbGVyLikgSWYg
dGhleSBkbywKPiBhcmUgeW91IHN1cmUgSUNFQlAtI0RCJ3MgZG9lc24ndD8KCklDRUJQIGl0c2Vs
ZiBkb2Vzbid0IGdldCBpbnRlcmNlcHRlZC7CoCBPbmx5IHRoZSByZXN1bHRpbmcgI0RCIGRvZXMs
CndoaWNoIHdpbGwgd2lsbCB0cmlnZ2VyIGEgI0RCLXZlY3RvcmluZyB0YXNrIHN3aXRjaCwgaXJy
ZXNwZWN0aXZlIG9mIGl0cwpleGFjdCBvcmlnaW4uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
