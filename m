Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B724162489
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 11:29:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j405d-0003D6-W5; Tue, 18 Feb 2020 10:26:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Xbw=4G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j405c-0003D1-Ob
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 10:26:52 +0000
X-Inumbo-ID: 2d13be48-5239-11ea-bc8e-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d13be48-5239-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582021612;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=SwHXpMQryYR96+zqoh77dvz0FfrJWJTwVpqoQHSXt0A=;
 b=LAZHSuwb/UJY/I2x86uyVklqf2KVWB09uHcWFmPvqVStNMZ6rLHnifAJ
 AiKHA8Gziq3OW8Mh7IPr1w/0q8gh3oSoLzrw9TJ4NFKvE2cinu4oTWEHH
 MUGtPn6c4KNamuroe5s2QC7H6xicRQ52L+/xU9en6Ev23MkZlIuc7yvTr o=;
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
IronPort-SDR: ah+2ZeTx6m4jH+O3XQSuwsgFWeiFsNUctKPBXrBaZmNW4nk7SzmZq/BUetjGbyoWXTkFp86aG1
 mq8lAUGCpzdGLc5EnAPqkZfjqWlCiO/5UFThMIDOg7v81I/NYJSJdF00LPuGn8lUhS5aJfZgBl
 luUQ3GO5rvUd/z4/qjX94sIilQcN2zXn0rWG5ebavQXuS0yuv2zaaeO1/TUTyYj86+JkGLhRep
 uS1GRjsCq09VVUUo7+Al7aVWU/ezKbWdxXNaY8FWzsRiYfDXMMrkp8GeqA6nU4u9LnoNDvCBMJ
 72o=
X-SBRS: 2.7
X-MesageID: 12612778
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12612778"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Roger Pau Monne
 <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <cec31639-00ce-8ef1-4a7e-1d85a92b820e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <acbbb801-7181-b1c4-0473-7262024d9978@citrix.com>
Date: Tue, 18 Feb 2020 10:26:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cec31639-00ce-8ef1-4a7e-1d85a92b820e@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 0/6] x86: fixes/improvements for scratch
 cpumask
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDIvMjAyMCAwNzo0MCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxNy4wMi4yMCAx
OTo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiBIZWxsbywKPj4KPj4gQ29tbWl0Ogo+Pgo+
PiA1NTAwZDI2NWEyYThmYTYzZDYwYzA4YmViNTQ5ZGU4ZWM4MmZmN2E1Cj4+IHg4Ni9zbXA6IHVz
ZSBBUElDIEFMTEJVVCBkZXN0aW5hdGlvbiBzaG9ydGhhbmQgd2hlbiBwb3NzaWJsZQo+Pgo+PiBJ
bnRyb2R1Y2VkIGEgYm9ndXMgdXNhZ2Ugb2YgdGhlIHNjcmF0Y2ggY3B1bWFzazogaXQgd2FzIHVz
ZWQgaW4gYQo+PiBmdW5jdGlvbiB0aGF0IGNvdWxkIGJlIGNhbGxlZCBmcm9tIGludGVycnVwdCBj
b250ZXh0LCBhbmQgaGVuY2UgdXNpbmcKPj4gdGhlIHNjcmF0Y2ggY3B1bWFzayB0aGVyZSBpcyBu
b3Qgc2FmZS4gUGF0Y2ggIzUgaXMgYSBmaXggZm9yIHRoYXQgdXNhZ2UsCj4+IHRvZ2V0aGVyIHdp
dGggYWxzbyBwcmV2ZW50aW5nIHRoZSB1c2FnZSBvZiBhbnkgcGVyLUNQVSB2YXJpYWJsZXMgd2hl
bgo+PiBzZW5kX0lQSV9tYXNrIGlzIGNhbGxlZCBmcm9tICNNQyBvciAjTk1JIGNvbnRleHQuIFBy
ZXZpb3VzIHBhdGNoZXMgYXJlCj4+IHByZXBhcmF0b3J5IGNoYW5nZXMuCj4+Cj4+IFBhdGNoICM2
IGFkZHMgc29tZSBkZWJ1ZyBpbmZyYXN0cnVjdHVyZSB0byBtYWtlIHN1cmUgdGhlIHNjcmF0Y2gg
Y3B1bWFzawo+PiBpcyB1c2VkIGluIHRoZSByaWdodCBjb250ZXh0LCBhbmQgaGVuY2Ugc2hvdWxk
IHByZXZlbnQgZnVydGhlciBtaXNzdXNlcy4KPgo+IEkgd29uZGVyIHdoZXRoZXIgaXQgd291bGRu
J3QgYmUgYmV0dGVyIHRvIGhhdmUgYSBjb21tb24gcGVyY3B1IHNjcmF0Y2gKPiBjcHVtYXNrIGhh
bmRsaW5nIGluc3RlYWQgb2YgaW50cm9kdWNpbmcgbG9jYWwgb25lcyBhbGwgb3ZlciB0aGUKPiBo
eXBlcnZpc29yLgo+Cj4gU28gYmFzaWNhbGx5IGFuIGFycmF5IG9mIHBlcmNwdSBjcHVtYXNrcyBh
bGxvY2F0ZWQgd2hlbiBicmluZ2luZyB1cCBhCj4gY3B1ICh0aGlzIHNwYXJlcyBtZW1vcnkgYXMg
dGhlIG1hc2tzIHdvdWxkbid0IG5lZWQgdG8gY292ZXIgTlJfQ1BVUwo+IGNwdXMpLCBhIHBlcmNw
dSBjb3VudGVyIG9mIHRoZSBuZXh0IGZyZWUgaW5kZXggYW5kIGdldF8gYW5kIHB1dF8KPiBmdW5j
dGlvbnMgYWN0aW5nIGluIGEgbGlmbyBtYW5uZXIuCj4KPiBUaGlzIHdvdWxkIGhlbHAgcmVtb3Zp
bmcgYWxsIHRoZSBzdGlsbCBleGlzdGluZyBjcHVtYXNrcyBvbiB0aGUgc3RhY2sKPiBhbmQgYW55
IGlsbGVnYWwgbmVzdGluZyB3b3VsZCBiZSBhdm9pZGVkLiBUaGUgb25seSByZW1haW5pbmcgcXVl
c3Rpb24KPiB3b3VsZCBiZSB0aGUgc2l6ZSBvZiB0aGUgYXJyYXkuCj4KPiBUaG91Z2h0cz8KCkkg
bGlrZSB0aGUgYXBwcm9hY2gsIGJ1dCB0aGVyZSBpcyBhIG1ham9yIGNhdmVhdC4KCkl0IGlzIGNl
cnRhaW5seSBwcm9ibGVtYXRpYyB0aGF0IHdlIGhhdmUgYm90aCBjcHVtYXNrX3NjcmF0Y2ggYW5k
CnNjcmF0Y2hfY3B1bWFzayB3aXRoIGhhdmUgZGlmZmVyZW50IHJ1bGVzIGZvciBob3cgdG8gdXNl
IHNhZmVseSwgYW5kIG5vdwp3ZSdyZSBnYWluaW5nIGN1c3RvbSBsb2dpYyB0byBmaXggdXAgdGhl
IHJlY3Vyc2l2ZSBzYWZldHkgb2Ygb25lIG9mIHRoZW0uCgpUaGF0IHNhaWQsIEknbSBwcmV0dHkg
c3VyZSBpdCB3aWxsIGJlIHg4NiBzcGVjaWZpYywgYmVjYXVzZSB0aGUgc2FmZXR5Cm9mIHRoaXMg
aXMgdGllZCB0byB1c2luZyBwZXItcGNwdSBzdGFja3MgcmF0aGVyIHRoYW4gcGVyLXZjcHUgc3Rh
Y2tzLsKgClRoZSBvbmx5IHJlYXNvbiB0aGUgc2NoZWR1bGVyIGNwdW1hc2tzIGFyZSBzYWZlIGZv
ciB1c2Ugb24gQVJNIGlzCmJlY2F1c2UgdGhlIHNjaGVkdWxlciBjb2RlIHdoaWNoIHVzZXMgdGhl
bSBkb2Vzbid0IGNhbGwgc2NoZWR1bGUoKSBpbgp0aGUgbWlkZGxlIG9mIHVzZS4KCkFzIGEgY29u
c2VxdWVuY2UsIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBpbmZyYXN0cnVjdHVyZSB3aGljaCB3b3Vs
ZCBiZQpzYWZlIGZvciBjb21tb24gY29kZSB0byB1c2UuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
