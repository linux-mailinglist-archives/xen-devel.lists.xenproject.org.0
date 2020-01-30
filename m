Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D8B14DB5D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 14:13:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix9aB-00022b-Mh; Thu, 30 Jan 2020 13:10:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tz6E=3T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ix9aA-0001vN-Bg
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 13:10:06 +0000
X-Inumbo-ID: d4d111c6-4361-11ea-b211-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4d111c6-4361-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580389805;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+I/OdJuW6E1EEL0tdPJPuPDJeU2NGzoITaLrHWB/fZA=;
 b=hX+MvOu8h6/+Zkvbb6rkODaWffhCwK5S007u+1YyjXD4avpgNOqo7W+h
 LOmXSgKfpm3517uK5ud9pIyy/6tf5vyMXvY2gp9EGDxvu5XgHxdJCk8G0
 khEHddvDyfbjyK33vjYmHRovwT180UdZzJPKSgnYwIR/wI62evep5nf99 Y=;
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
IronPort-SDR: NTFj2YOypNrpugAdilyS4NlfArlF+SNHRw+8SU0RFl+fhACQ056mTKJWp8Xy3Ecgfe0d4WEgqp
 rCV1bGH+2VRv8CA9rdgUjrq8V/Mcual1oWhhpFwkRzqGFC2cFFJztAnMnQLR5Yk63yHp/YD9qp
 jeaL0Po4f4FI6OhQ6pXQKQZvF9MCy++H83U66y80Sa1SBnUYewwSg8O2mOgU5Fma2ThA9EWooa
 7mf7+159xzmcxbNK1WY4hsUXuJDfvHPmOehpICiQZV0X/JvAkAfNz7a9utdz67udJHEmCgeuN+
 CDk=
X-SBRS: 2.7
X-MesageID: 12046150
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="12046150"
To: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
 <20200129121235.1814563-5-anthony.perard@citrix.com>
 <20200130091251.GB4679@Air-de-Roger>
 <20200130124431.GO1288@perard.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3a85286d-e90f-c492-64b2-f860ad09efb3@citrix.com>
Date: Thu, 30 Jan 2020 13:10:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200130124431.GO1288@perard.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/5] OvmfPkg/XenPlatformPei: Calibrate APIC
 timer frequency
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
Cc: Julien Grall <julien@xen.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Liming Gao <liming.gao@intel.com>,
 Michael D Kinney <michael.d.kinney@intel.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDEvMjAyMCAxMjo0NCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gVGh1LCBKYW4g
MzAsIDIwMjAgYXQgMTA6MTI6NTFBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4g
T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMTI6MTI6MzRQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4+PiArICBQYXJhbWV0ZXJzLmRvbWlkID0gRE9NSURfU0VMRjsKPj4+ICsgIFBhcmFt
ZXRlcnMuZ3BmbiA9IChVSU5UTikgUGFnZVB0ciA+PiBFRklfUEFHRV9TSElGVDsKPj4+ICsgIFJl
dHVybkNvZGUgPSBYZW5IeXBlcmNhbGxNZW1vcnlPcCAoWEVOTUVNX3JlbW92ZV9mcm9tX3BoeXNt
YXAsICZQYXJhbWV0ZXJzKTsKPj4gSSdtIGFmcmFpZCB0aGlzIHdpbGwgbGVhdmUgYSBob2xlIGlu
IHRoZSBwMm0sIGFuZCBoZW5jZSBmcmVlaW5nIHRoZQo+PiBwYWdlIGJhY2sgdG8gT1ZNRiBpcyB3
cm9uZyAoSSBhc3N1bWUgdGhpcyBpcyB3aGF0IEZyZWVQYWdlcyBkb2VzIGluCj4+IENhbGlicmF0
ZUxhcGljVGltZXIpLCBhcyB0aGUgcGh5c2ljYWwgYWRkcmVzcyB3b3VsZCBiZSB1bnBvcHVsYXRl
ZAo+PiBhZnRlciB0aGUgY2FsbCB0byBYRU5NRU1fcmVtb3ZlX2Zyb21fcGh5c21hcC4KPiBJIGd1
ZXNzIHRoZXJlJ3MgbW9yZSByZWZhY3RvcmluZyB0byBkbyBpbiBPVk1GLCB0aGVyZSBhcmUgb3Ro
ZXIncyBvZgo+IHRoaXMga2luZCBvZiBjYWxsLCBtb3N0bHkgaW4gdGhlIFBWIGRyaXZlcnMsIFhl
bkJ1c0R4ZS4KPgo+Pj4gKwo+Pj4gKyAgU2hhcmVkSW5mbyA9IEFsbG9jYXRlUGFnZXMgKDEpOwo+
PiBIbSwgaXQncyBub3QgdGhlIGJlc3QgYXBwcm9hY2ggdG8gdXNlIGEgcmVndWxhciBtZW1vcnkg
cGFnZSB0byBtYXAgdGhlCj4+IHNoYXJlZCBpbmZvOiBtYXBwaW5nIGl0IGlzIHZlcnkgbGlrZWx5
IHRvIGNhdXNlIHN1cGVycGFnZSBzaGF0dGVyaW5nLAo+PiBhbmQgb25jZSB1bm1hcHBlZCBpdCBs
ZWF2ZXMgYSBob2xlIGluIHRoZSBwMm0uCj4gOi0oCj4KPj4gQXMgYSByZWZlcmVuY2UgeW91IGNv
dWxkIG1hcCB0aGUgc2hhcmVkIGluZm8gcGFnZSBhdCBtYXhpbXVtIHBoeXNpY2FsCj4+IGFkZHJl
c3MgYWxsb3dlZCAoYWZ0ZXIgY2hlY2tpbmcgaXQncyBub3QgcG9wdWxhdGVkKSBsaWtlIFdlaSBp
cyBkb2luZwo+PiBmb3IgdGhlIFhlbiBvbiBIeXBlclYgd29yay4KPiBJJ2xsIGxvb2sgYXQgd2hh
dCBjYW4gYmUgZG9uZSB3aXRoIE9WTUYuCj4KPiBJcyB0aGVyZSBzb21lIGtpbmQgb2YgaW5mb3Jt
YXRpb24gdGhhdCBYZW4gY291bGQgZ2l2ZT8gT3IgaXMgaXQgYWxsCj4gaW5mb3JtYXRpb24gdGhh
dCBPVk1GIHNob3VsZCBrZWVwIHRyYWNrIG9mPyBPciBpZiBYZW4gb25seSBoYXZlCj4gWEVOTUVN
X21lbW9yeV9tYXAsIHRoZW4gT1ZNRiBhbHJlYWR5IGhhdmUgdGhpcyBpbmZvcm1hdGlvbi4KCldl
IG5lZWQgdG8gYWN0dWFsbHkgdGFja2xlIHRoZSBtZW1vcnkgcHJvYmxlbSwgYW5kIHByb3ZpZGUg
c29tZXRoaW5nCmNvcnJlY3QgdmlhIFhFTk1FTV9tZW1vcnlfbWFwICgvc2ltaWxhcikuCgpTbyBm
YXIsIG5vb25lIGhhcyBhY3R1YWxseSBzdGFydGVkIHRvIHRyeSBmaXhpbmcgdGhlIHByb2JsZW0u
wqAgUGVyaGFwcwpub3cgaXMgYSBnb29kIGVub3VnaCBraWNrIHRvIGdldCBzdGFydGVkLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
