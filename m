Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB5C1711C0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 08:50:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7Dth-000587-7i; Thu, 27 Feb 2020 07:47:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7Dtf-000582-VZ
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 07:47:51 +0000
X-Inumbo-ID: 7486a5da-5935-11ea-aba8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7486a5da-5935-11ea-aba8-bc764e2007e4;
 Thu, 27 Feb 2020 07:47:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9F6D1AD05;
 Thu, 27 Feb 2020 07:47:50 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9faee7d1-a555-dc3f-f7e0-3dcbc8442cc3@suse.com>
Date: Thu, 27 Feb 2020 08:47:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226202221.6555-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 02/10] tools/libxc: Simplify
 xc_get_static_cpu_featuremask()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAyMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBEcm9wIFhDX0ZFQVRV
UkVNQVNLX0RFRVBfRkVBVFVSRVMuICBJdCBpc24ndCB1c2VkIGJ5IGFueSBjYWxsZXJzLCBhbmQg
dW5saWtlCj4gdGhlIG90aGVyIHN0YXRpYyBtYXNrcywgd29uJ3QgYmUgb2YgaW50ZXJlc3QgdG8g
YW55b25lIHdpdGhvdXQgb3RoZXIgcGllY2VzIG9mCj4gY3B1aWQtYXV0b2dlbi5oCj4gCj4gSW4g
eGNfZ2V0X3N0YXRpY19jcHVfZmVhdHVyZW1hc2soKSwgdXNlIGEgMmQgYXJyYXkgaW5zdGVhZCBv
ZiBpbmRpdmlkdWFsbHkKPiBuYW1lZCB2YXJpYWJsZXMsIGFuZCBkcm9wIHRoZSBzd2l0Y2ggc3Rh
dGVtZW50IGNvbXBsZXRlbHkuCj4gCj4gTm8gcHJhY3RpY2FsIGNoYW5nZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4Kd2l0aCB0aHJlZSByZW1hcmtz
OgoKPiAtLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+ICsrKyBiL3Rvb2xzL2xpYnhj
L3hjX2NwdWlkX3g4Ni5jCj4gQEAgLTkwLDQzICs5MCwyMyBAQCB1aW50MzJfdCB4Y19nZXRfY3B1
X2ZlYXR1cmVzZXRfc2l6ZSh2b2lkKQo+ICBjb25zdCB1aW50MzJfdCAqeGNfZ2V0X3N0YXRpY19j
cHVfZmVhdHVyZW1hc2soCj4gICAgICBlbnVtIHhjX3N0YXRpY19jcHVfZmVhdHVyZW1hc2sgbWFz
aykKPiAgewo+IC0gICAgY29uc3Qgc3RhdGljIHVpbnQzMl90IGtub3duW0ZFQVRVUkVTRVRfTlJf
RU5UUklFU10gPSBJTklUX0tOT1dOX0ZFQVRVUkVTLAo+IC0gICAgICAgIHNwZWNpYWxbRkVBVFVS
RVNFVF9OUl9FTlRSSUVTXSA9IElOSVRfU1BFQ0lBTF9GRUFUVVJFUywKPiAtICAgICAgICBwdltG
RUFUVVJFU0VUX05SX0VOVFJJRVNdID0gSU5JVF9QVl9GRUFUVVJFUywKPiAtICAgICAgICBodm1f
c2hhZG93W0ZFQVRVUkVTRVRfTlJfRU5UUklFU10gPSBJTklUX0hWTV9TSEFET1dfRkVBVFVSRVMs
Cj4gLSAgICAgICAgaHZtX2hhcFtGRUFUVVJFU0VUX05SX0VOVFJJRVNdID0gSU5JVF9IVk1fSEFQ
X0ZFQVRVUkVTLAo+IC0gICAgICAgIGRlZXBfZmVhdHVyZXNbRkVBVFVSRVNFVF9OUl9FTlRSSUVT
XSA9IElOSVRfREVFUF9GRUFUVVJFUzsKPiAtCj4gLSAgICBCVUlMRF9CVUdfT04oQVJSQVlfU0la
RShrbm93bikgIT0gRkVBVFVSRVNFVF9OUl9FTlRSSUVTKTsKPiAtICAgIEJVSUxEX0JVR19PTihB
UlJBWV9TSVpFKHNwZWNpYWwpICE9IEZFQVRVUkVTRVRfTlJfRU5UUklFUyk7Cj4gLSAgICBCVUlM
RF9CVUdfT04oQVJSQVlfU0laRShwdikgIT0gRkVBVFVSRVNFVF9OUl9FTlRSSUVTKTsKPiAtICAg
IEJVSUxEX0JVR19PTihBUlJBWV9TSVpFKGh2bV9zaGFkb3cpICE9IEZFQVRVUkVTRVRfTlJfRU5U
UklFUyk7Cj4gLSAgICBCVUlMRF9CVUdfT04oQVJSQVlfU0laRShodm1faGFwKSAhPSBGRUFUVVJF
U0VUX05SX0VOVFJJRVMpOwo+IC0gICAgQlVJTERfQlVHX09OKEFSUkFZX1NJWkUoZGVlcF9mZWF0
dXJlcykgIT0gRkVBVFVSRVNFVF9OUl9FTlRSSUVTKTsKPiAtCj4gLSAgICBzd2l0Y2ggKCBtYXNr
ICkKPiAtICAgIHsKPiAtICAgIGNhc2UgWENfRkVBVFVSRU1BU0tfS05PV046Cj4gLSAgICAgICAg
cmV0dXJuIGtub3duOwo+IC0KPiAtICAgIGNhc2UgWENfRkVBVFVSRU1BU0tfU1BFQ0lBTDoKPiAt
ICAgICAgICByZXR1cm4gc3BlY2lhbDsKPiAtCj4gLSAgICBjYXNlIFhDX0ZFQVRVUkVNQVNLX1BW
Ogo+IC0gICAgICAgIHJldHVybiBwdjsKPiArICAgIGNvbnN0IHN0YXRpYyB1aW50MzJfdCBtYXNr
c1tdW0ZFQVRVUkVTRVRfTlJfRU5UUklFU10gPSB7CgpXb3VsZCB5b3UgbWluZCBzd2l0Y2hpbmcg
dG8gdGhlIG1vcmUgY29udmVudGlvbmFsICJzdGF0aWMgY29uc3QiPwoKPiArI2RlZmluZSBNQVNL
KHgpIFtYQ19GRUFUVVJFTUFTS18gIyMgeF0gPSBJTklUXyAjIyB4ICMjIF9GRUFUVVJFUwoKSSdt
IHN1cnByaXNlZCB0byBzZWUgeW91IGludHJvZHVjZSBzdWNoIGEgY29uc3RydWN0LCB3aGVuIG1v
cmUKdGhhbiBvbmNlIEkgaGVhcmQgeW91IHNheSB0aGF0IHlvdSBkaXNsaWtlIG1hY3JvcyB1c2lu
ZyAjIyBpbgp3YXlzIGxpa2UgaXQgaXMgZG9uZSBoZXJlLgoKPiArICAgIEJVSUxEX0JVR19PTihB
UlJBWV9TSVpFKG1hc2tzWzBdKSAhPSBGRUFUVVJFU0VUX05SX0VOVFJJRVMpOwoKSXNuJ3QgdGhp
cyBxdWl0ZSBwb2ludGxlc3Mgd2l0aCB0aGUgbm93IGNoYW5nZWQgZGVmaW5pdGlvbiBvZgp0aGUg
YXJyYXk/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
