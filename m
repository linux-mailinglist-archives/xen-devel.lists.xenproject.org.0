Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F73612B508
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 14:59:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikq7n-0004bd-Bc; Fri, 27 Dec 2019 13:57:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F8X0=2R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ikq7l-0004bY-Cf
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 13:57:53 +0000
X-Inumbo-ID: db16c308-28b0-11ea-a914-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db16c308-28b0-11ea-a914-bc764e2007e4;
 Fri, 27 Dec 2019 13:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577455064;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=JuR5EppxobFggmMEY/qLF+fvK7glVOvVlxk+45w0GC8=;
 b=K78Rnl/eDlgDknUvFFyLc7IgYyM+ONOTnSt16Ewy6OXVwF0Ch9zojL28
 JQCzhKZhCKBeDfdzUJXWZ3SISWDdG+MGHog5KWbD3k1U6lpmleeI8ag2N
 ovoWeFwOFbvJR2X5DiscMAUCJ6mHgxDzw38dy4mffTmQ1jhNxg5GLpCCn U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XrI91idOkyzizio5T7vWgnzvRpL1jvR5s/PcL2KEDPzDrFuXJAw0KdtxP4dNrN3kRlvefP2J9I
 q3HH+iZ7p/AOjx0uG5c6jp9tsEwPvjrwMW+hNBfb7g5Ot9YMsJsEzOp9NwnvEkerrR+T4ZmKOd
 H8pWgBto8mEeH+jhQF4IH3V3NwPCHTJ8Gp4d7PxBUQbRo3OPcqA8iYtpx/6kjh8IRBHfDQrA/W
 Oj5KJRqEUK//XhKg34Ff/Z7BqKfo+/rSqCnlBw5ZgdbW6/A8EQ+M6j/LrmMM9F49sQEXpz8gEf
 3Vk=
X-SBRS: 2.7
X-MesageID: 10559547
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10559547"
To: George Dunlap <george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20191223164329.3113378-1-george.dunlap@citrix.com>
 <20191223164329.3113378-3-george.dunlap@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <13eb1da8-4de8-c08b-5771-c0b150c0fb18@citrix.com>
Date: Fri, 27 Dec 2019 13:57:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191223164329.3113378-3-george.dunlap@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/4] xen: Add 'synthetic' preemption check
 parameter
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
Cc: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMTIvMjAxOSAxNjo0MywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBJbiBvcmRlciB0byBi
ZXR0ZXIgdGVzdCBoeXBlcnZpc29yIHByZWVtcHRpb24gcGF0aHMsIGFkZCBhbiBvcHRpb24gdG8K
PiBhcnRpZmljaWFsbHkgaW5jcmVhc2UgdGhlIG51bWJlciBvZiBwcmVlbXB0aW9ucy4KPgo+IFdo
aWxlIG1vZGlmeWluZyB4ZW4tY29tbWFuZC1saW5lLnBhbmRvYywgZXNjYXBlIHNvbWUgdW5kZXJz
Y29yZXMKClRoaXMgaXMgcGFuZG9jLCBub3QgbWFya2Rvd24sIGFuZCB1bmRlcnNjb3JlcyBsaWtl
IHRoZXNlIGFyZSBvbmUgb2YgdGhlCmRpZmZlcmVuY2VzLsKgIEkgc3BlY2lmaWNhbGx5IHRvb2sg
dGhlc2UgdW5kZXJzY29yZXMgb3V0IHNvIHRoZSBIVE1MCmFuY2hvciBsaW5rcyB3b3JrIGNvcnJl
Y3RseS4KCj4gLCBhbmQKPiByZW1vdmUgc29tZSB0cmFpbGluZyB3aGl0ZXNwYWNlLgo+Cj4gU2ln
bmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IC0t
LQo+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENDOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gIGRvY3MvbWlzYy94ZW4tY29t
bWFuZC1saW5lLnBhbmRvYyB8IDIwICsrKysrKysrKysrKysrKysrKy0tCj4gIHhlbi9hcmNoL3g4
Ni90aW1lLmMgICAgICAgICAgICAgICB8IDExICsrKysrKysrKysrCj4gIHhlbi9pbmNsdWRlL3hl
bi9zY2hlZC5oICAgICAgICAgICB8IDEwICsrKysrKysrKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAz
OCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBh
bmRvYwo+IGluZGV4IDk4MWE1ZTIzODEuLjFhOWZkYTg2MjcgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9t
aXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5k
LWxpbmUucGFuZG9jCj4gQEAgLTYzNiwxMyArNjM2LDI5IEBAIEF2YWlsYWJsZSBhbHRlcm5hdGl2
ZXMsIHdpdGggdGhlaXIgbWVhbmluZywgYXJlOgo+ICBTcGVjaWZ5IHRoZSBVU0IgY29udHJvbGxl
ciB0byB1c2UsIGVpdGhlciBieSBpbnN0YW5jZSBudW1iZXIgKHdoZW4gZ29pbmcKPiAgb3ZlciB0
aGUgUENJIGJ1c3NlcyBzZXF1ZW50aWFsbHkpIG9yIGJ5IFBDSSBkZXZpY2UgKG11c3QgYmUgb24g
c2VnbWVudCAwKS4KPiAgCj4gLSMjIyBkZWJ1Z19zdGFja19saW5lcwo+ICsjIyMgZGVidWdcX3N0
YWNrXF9saW5lcwo+ICA+IGA9IDxpbnRlZ2VyPmAKPiAgCj4gID4gRGVmYXVsdDogYDIwYAo+ICAK
PiAgTGltaXRzIHRoZSBudW1iZXIgbGluZXMgcHJpbnRlZCBpbiBYZW4gc3RhY2sgdHJhY2VzLgo+
ICAKPiArIyMjIGRlYnVnLXN5bnRoZXRpYy1wcmVlbXB0aW9uCj4gKz4gYD0gPGludGVnZXI+YAo+
ICsKPiArPiBEZWZhdWx0OiBgMGAKPiArCj4gK0FydGlmaWNpYWxseSBpbmNyZWFzZXMgcmF0ZSBh
dCB3aGljaCBgaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKWAKPiArcmV0dXJucyBgdHJ1ZWAsIGZv
ciBkZWJ1Z2dpbmcgcHVycG9zZXMsIHRvIGEgcmF0ZSBvZiBvbmUgaW4gYE5gLiAoVGhlCj4gK2Rl
ZmF1bHQsIGAwYCwgZGlzYWJsZXMgdGhlIGZlYXR1cmUuKQo+ICsKPiArV2hlbiBwcm9tb3Rpbmcg
cGFnZXRhYmxlcywgZm9yIGluc3RhbmNlLCBgaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKWAKPiAr
aXMgY2FsbGVkIGJlZm9yZSBwcm9jZXNzaW5nIGVhY2ggUFRFLiAgU2luY2UgdGhlcmUgYXJlIDUx
MiBQVEVzIHBlcgo+ICtwYWdlLCBhIHZhbHVlIG9mIGAxMDI0YCBzaG91bGQgcmVzdWx0IGluIHBh
Z2V0YWJsZSBwcm9tb3Rpb24gYmVpbmcKPiAraW50ZXJydXB0ZWQgZXZlcnkgb3RoZXIgcGFnZSBv
biBhdmVyYWdlLgo+ICsKPiArT25seSBhdmFpbGFibGUgaW4gREVCVUcgYnVpbGRzLgoKUGxlYXNl
LCBub3QgbGlrZSB0aGlzLsKgIEkgbGVhcm50IHRoZSBoYXJkIHdheSB3aXRoIGh2bV9mZXAgdGhh
dCBpdCBpcwppbXBvcnRhbnQgdG8gaGF2ZSBmdW5jdGlvbmFsaXR5IGxpa2UgdGhpcyBpbiByZWxl
YXNlIGJ1aWxkcyBhcyB3ZWxsLgoKR2l2ZSBpdCBhIEtjb25maWcgb3B0aW9uLCBhbmQgZGVmYXVs
dCBpdCB0byBERUJVRy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
