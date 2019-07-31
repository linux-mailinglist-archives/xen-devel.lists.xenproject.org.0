Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084F37C3AE
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 15:36:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsoin-0004e2-Bf; Wed, 31 Jul 2019 13:32:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QWEJ=V4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hsoil-0004dx-DI
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 13:32:47 +0000
X-Inumbo-ID: ae5b3ffa-b397-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ae5b3ffa-b397-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 13:32:46 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=PermError smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: PermError (esa2.hc3370-68.iphmx.com: cannot
 correctly interpret sender authenticity information from
 domain of Andrew.Cooper3@citrix.com) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qdF510ffzlY+trSaFhjTBqEbruKwTOSvTUD6MaW4cVZv7OrzfPI5+BBZLV0DcR/527VxRXZGvQ
 3B6gIMzQ8/Dyvb5A1FsREDnDCYpPZIIzpq2N6UcFF+e2KBbcPjMAchBNdgHT3KAQ8bWnP6+8xt
 6f+5TqTcV8V8geAryEfHY9XMnI0oF+2PMSg4RnJq9/Umyoh7hWeI2AfsSbJfeNwpaGEDx613c6
 KmBWoamoYUozrQj2notCqLPKaJDYYHqtqY/rMIHvJrLO367GrZRfra9ycwYtMO1fdjcfMHW1/i
 x/8=
X-SBRS: 2.7
X-MesageID: 3668193
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,330,1559534400"; 
   d="scan'208";a="3668193"
To: Jan Beulich <JBeulich@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-8-andrew.cooper3@citrix.com>
 <3a6217c6-25d3-3882-99da-846a957d4c02@suse.com>
 <88cead08-46ab-7623-c01a-adfd7267e9e1@citrix.com>
 <0ec79656-2132-441e-99c6-2fcfb842ff99@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <86e748a1-6b40-d5cc-d5b0-9fa15345685d@citrix.com>
Date: Wed, 31 Jul 2019 14:32:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0ec79656-2132-441e-99c6-2fcfb842ff99@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 07/10] xen/nodemask: Drop nodes_{setall,
 clear}() and improve the initialisers
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDcvMjAxOSAxNDoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzEuMDcuMjAxOSAx
NDo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gSSBkb24ndCBzZWUgYSB3YXkgdG8gYXZvaWQg
ZXhwYW5kaW5nIG5vZGUgdHdpY2UsIGJ1dCBnaXZlbiB0aGF0IGl0cyB3cmFwcGVyIGlzIGluIEFM
TF9DQVBTIGFuZCBvYnZpb3VzbHkgYSBtYWNyby4KPj4KPj4gRnVydGhlcm1vcmUsIGV4cGVyaW1l
bnRpbmcgd2l0aCBhIGRlbGliZXJhdGUgYXR0ZW1wdCB0byBwcm92b2tlIHRoaXMsIEkgZ290Cj4+
Cj4+IG51bWEuYzogSW4gZnVuY3Rpb24g4oCYbnVtYV9pbml0bWVtX2luaXTigJk6Cj4+Cj4+IC9s
b2NhbC94ZW4uZ2l0L3hlbi9pbmNsdWRlL3hlbi9ub2RlbWFzay5oOjkwOjEwOiBlcnJvcjogbm9u
Y29uc3RhbnQgYXJyYXkgaW5kZXggaW4gaW5pdGlhbGl6ZXIKPj4KPj4gIMKgwqDCoMKgwqDCoMKg
wqAgWyhub2RlKSAvIEJJVFNfUEVSX0xPTkddID0gMVVMIDw8ICgobm9kZSkgJSBCSVRTX1BFUl9M
T05HKcKgwqDCoMKgwqAgXAo+Pgo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIF4KPj4KPj4gbnVtYS5j
OjI3NDoyMzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmE5PREVNQVNLX09G4oCZCj4+
Cj4+ICDCoMKgwqDCoCBub2RlX29ubGluZV9tYXAgPSBOT0RFTUFTS19PRihmb28rKyk7Cj4+Cj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+
fgo+Pgo+PiAvbG9jYWwveGVuLmdpdC94ZW4vaW5jbHVkZS94ZW4vbm9kZW1hc2suaDo5MDoxMDog
bm90ZTogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9yIOKAmChhbm9ueW1vdXMpLmJpdHPigJkpCj4+
Cj4+ICDCoMKgwqDCoMKgwqDCoMKgIFsobm9kZSkgLyBCSVRTX1BFUl9MT05HXSA9IDFVTCA8PCAo
KG5vZGUpICUgQklUU19QRVJfTE9ORynCoMKgwqDCoMKgIFwKPj4KPj4gIMKgwqDCoMKgwqDCoMKg
wqDCoCBeCj4+Cj4+IG51bWEuYzoyNzQ6MjM6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDi
gJhOT0RFTUFTS19PRuKAmQo+Pgo+PiAgwqDCoMKgwqAgbm9kZV9vbmxpbmVfbWFwID0gTk9ERU1B
U0tfT0YoZm9vKyspOwo+Pgo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXn5+fn5+fn5+fn4KPj4KPj4gZnJvbSBHQ0MgNi4zLCB3aGljaCBJIHRoaW5rIGNv
dmVycyBldmVyeXRoaW5nIHdlIG5lZWQsIGFuZCB3aWxsIHByZXZlbnQgc2lkZSBlZmZlY3RzIGZy
b20gZG91YmxlIGV4cGFuc2lvbiBpbiBwcmFjdGljZS4KPiBBaCwgcmlnaHQuIFdpdGggdGhpcyBt
eSBSLWIgYXBwbGllcyB0byB0aGUgY2hhbmdlIGFzIGlzICh3aXRoIHRoZQo+IGFkZGl0aW9uYWwg
YWRqdXN0bWVudHMgZm9sZGVkIGluIHRoYXQgeW91J3ZlIHBvaW50ZWQgb3V0KS4KCkkndmUgYWN0
dWFsbHkgdHdlYWtlZCBpdCBhIGZyYWN0aW9uIG1vcmUgdG8gbm90IGJpZnVyY2F0ZSBOT0RFTUFT
S19PRigpCmluIGFuIGlmZGVmLCB3aGljaCBtZWFucyB3ZSdsbCBnZXQgZGlhZ25vc3RpY3MgbGlr
ZSB0aGF0IG91dCBvZiB0aGUKY29tcGlsZXIgZXZlbiB3aGVuIEkgaGF2ZW4ndCBoYWNrZWQgTk9E
RVNfU0hJRlQgdG8gNyBsb2NhbGx5LgoKSG93ZXZlciwgaXQgbm93IHRvdWNoZXMgQVJNIGNvZGUg
c28gSSdsbCBwb3N0IGEgZnVsbCB2NCBzZXJpZXMgd2l0aCB0aGlzCmFuZCBsYXRlciBpc3N1ZXMg
aW4gdGhlIHNlcmllcyBhZGRyZXNzZWQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
