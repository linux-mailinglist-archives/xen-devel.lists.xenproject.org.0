Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14368159448
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 17:05:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Xz7-0002Ez-NQ; Tue, 11 Feb 2020 16:02:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=46st=37=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1Xz6-0002Eu-7u
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 16:02:00 +0000
X-Inumbo-ID: d502a666-4ce7-11ea-8434-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d502a666-4ce7-11ea-8434-bc764e2007e4;
 Tue, 11 Feb 2020 16:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581436919;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pm+E/7OlFZQGAburZ7iWTaaXF52QJ5XL9Mpx0JlXnc0=;
 b=au8qMfSlPwIDL9Uo1VhQGIQP5t36JBBe3oKwKmiq5zoB6LdHY8MimoD1
 xOJ4oemaTxvccQLtXm6TVWPRc/E2EyJ9BqZXNkxBNlcLdpjKPFR4k/v2C
 gqtJnLwJa/Y/MKOtHwhFwH8SCjAXTRjlJVI7Ig6GH443iDdaILjAA8H5V I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fYvhgI+jS9ie3uyf3M7Q9/Vb51FcFfBguGjRUUeZ3NPJKb2tOQhDgAxTN3qdyf1pwsgFfg4Lq1
 eny8PTVGKy0ijVcjfge4shxzN9pABI5gZp7v/bhST3TnhgyubeTG2ggj5TGWJS00Ox/HF+Clpv
 A0CIj+UCPbkj5bOAIqWtzwHxBPo0+m6kS7EnXKUfGCgV2yA7Usna70NCxp59TNBDkcnyu6aewb
 G4k7sgIEWXDuLYrq6soYfjWkC5VB8DZdaor91H5fUrUHhEt/2nFGSGofIdVturJUhJNjGKx+3L
 S2k=
X-SBRS: 2.7
X-MesageID: 12283307
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12283307"
Date: Tue, 11 Feb 2020 17:01:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200211160149.GL4679@Air-de-Roger>
References: <2b7826d9-8822-97c8-0637-03bcb98d6418@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b7826d9-8822-97c8-0637-03bcb98d6418@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] PV Shim ballooning
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
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMDE6Mzk6NDJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBCYWxsb29uaW5nIGluc2lkZSBQViBzaGltIGlzIGN1cnJlbnRseSB2ZXJ5IGJyb2tl
bi4KPiAKPiBGcm9tIGFuIGluc3RydW1lbnRlZCBYZW4gYW5kIDMyYml0IFBWIFhURiB0ZXN0Ogo+
IAo+IChkMykgKGQzKSAtLS0gWGVuIFRlc3QgRnJhbWV3b3JrIC0tLQo+IChkMykgKGQzKSBCYWxs
b29uaW5nOiBQViAzMmJpdCAoUEFFIDMgbGV2ZWxzKQo+IChkMykgKGQzKSBtciB7IDAwMTBhOTQw
LCAxMDI0LCAweDdmZjAgfQo+IChkMykgKGQzKSBBYm91dCB0byBkZWNyZWFzZQo+IChkMykgKFhF
TikgKioqIEQgeyBmZmZmODIwMDgwMDAwMDIwLCBuciAxMDIwLCBkb25lIDAgfQo+IChkMykgKFhF
TikgZDN2MCBmYWlsZWQgdG8gcmVzZXJ2ZSAyNjcgZXh0ZW50cyBvZiBvcmRlciAwIGZvciBvZmZs
aW5pbmcKPiAoZDMpIChYRU4pICoqKiBEIHsgZmZmZjgyMDA3ZmZmZTA0MCwgbnIgMTAyNCwgZG9u
ZSAxMDIwIH0KPiAoZDMpIChYRU4pIGQzdjAgZmFpbGVkIHRvIHJlc2VydmUgMTAyNCBleHRlbnRz
IG9mIG9yZGVyIDAgZm9yIG9mZmxpbmluZwo+IChkMykgKGQzKSA9PiBnb3QgMTAyNAo+IAo+IFRo
aXMgdGVzdCB0YWtlcyAxMDI0IGZyYW1lcyBhbmQgY2FsbHMgZGVjcmVhc2UgcmVzZXJ2YXRpb24g
b24gdGhlbSwKPiBiZWZvcmUgdW5tYXBwaW5nLsKgIGkuZS4gdGhlIGRlY3JlYXNlIHJlc2VydmF0
aW9uIHNob3VsZCBmYWlsLsKgIFNoaW0KPiBzdWNjZXNzZnVsbHkgb2ZmbGluZXMgNzUzIHBhZ2Vz
IChub3RoaW5nIHRvIGRvIHdpdGggdGhlIGZyYW1lcyB0aGUgZ3Vlc3QKPiBzZWxlY3RlZCksIGFu
ZCBmYWlscyB0byBvZmZsaW5lIDEyOTEsIGFuZCBkZXNwaXRlIHRoaXMsIHJldHVybnMgc3VjY2Vz
cy4KPiAKPiBGaXJzdCBvZiBhbGwsIHRoZSAiZmFpbGVkIHRvIHJlc2VydmUiIGlzIGluIHB2X3No
aW1fb2ZmbGluZV9tZW1vcnkoKQo+IHdoaWNoIGlzIGEgdm9pZCBmdW5jdGlvbiB0aGF0IGhhcyBh
IHNlbWFudGljYWxseSByZWxldmFudCBmYWlsdXJlIGNhc2UuwqAKPiBUaGlzIG9idmlvdXNseSBp
c24ndCBvay4KClNvIG9uIGZhaWx1cmUgdG8gcmVzZXJ2ZSB0aGUgcGFnZXMgZm9yIG9mZmxpbmlu
ZyB3ZSBzaG91bGQgbGlrZWx5IGFkZAp0aGVtIGFnYWluIHRvIHRoZSBkb21VIGFuZCByZXR1cm4g
dGhlIG51bWJlciBvZiBwYWdlcyB0aGF0IGhhdmUgYmVlbgpmdWxseSBvZmZsaW5lZD8KCk5vdCBz
dXJlIGlmIHRoYXQncyBkb2FibGUsIGJ1dCBJIHRoaW5rIGJ5IHBva2luZyBhdCB0aGUgZXh0ZW5k
cyBsaXN0ClhlbiBzaG91bGQgYmUgYWJsZSB0byByZXBvcHVsYXRlIHRoZSBlbnRyaWVzLgoKPiAK
PiBTZWNvbmQsIHRoZSB3YXkgdGhlIGNvbXBhdCBjb2RlIGxvb3BzIG92ZXIgdGhlIHRyYW5zbGF0
ZWQgZGF0YSBpcwo+IGluY29tcGF0aWJsZSB3aXRoIGhvdyBhcmdzLm5yX2RvbmUgaXMgdXNlZCBm
b3IgdGhlIGNhbGwgaW50bwo+IHB2X3NoaW1fb2ZmbGluZV9tZW1vcnkoKS4KCk9oLCBJIHdvdWxk
IGhhdmUgdG8gY2hlY2sgdGhhdCwgSSB0ZW5kIHRvIGdldCBsb3N0IGluIGNvbXBhdCBjb2RlLiBU
aGUKY29kZSBpbiBwdl9zaGltX29mZmxpbmVfbWVtb3J5IGFzc3VtZXMgdGhhdCBhcmdzLm5yX2Rv
bmUgd2lsbCBjb250YWluCnRoZSB0b3RhbCBhbW91bnQgb2Ygc3VjY2Vzc2Z1bGx5IGJhbGxvb25l
ZCBvdXQgcGFnZXMuCgo+IFdoeSBpcyBwdl9zaGltX29mZmxpbmVfbWVtb3J5KCkgbm90IGluIGRl
Y3JlYXNlX3Jlc2VydmF0aW9uKCkgdG8gYmVnaW4gd2l0aD8KCkkgZ3Vlc3MgdG8gdHJ5IHRvIGJh
dGNoIHRoZSBkZWNyZWFzZSBpbnRvIGEgc2luZ2xlIGNhbGwgdG8KYmF0Y2hfbWVtb3J5X29wLCBh
bmQgdG8ga2VlcCB0aGUgc3ltbWV0cnkgd2l0aCB0aGUgY2FsbCB0bwpwdl9zaGltX29ubGluZV9t
ZW1vcnkuCgpCdXQgbW9zdCBvZiB0aGlzIHdhcyBkb25lIGluIGEgaHVycnksIHNvIGl0J3MgbGlr
ZWx5IGl0J3MganVzdCB0aGVyZQpiZWNhdXNlIHRoYXQncyB0aGUgZmlyc3QgcGxhY2UgdGhhdCBz
ZWVtZWQgc2Vuc2libGUgZW5vdWdoLgoKPiBGdXJ0aGVybW9yZSwgdGhlcmUgaXMgYSBmdW5kYW1l
bnRhbCBkaWZmZXJlbmNlIGluIGJhbGxvb25pbmcgYmVoYXZpb3VyCj4gYmV0d2VlbiBQViBhbmQg
SFZNIGd1ZXN0cywgd2hpY2ggSSBkb24ndCB0aGluayB3ZSBjYW4gY29tcGVuc2F0ZSBmb3IuwqAK
PiBQViBndWVzdHMgbmVlZCB0byBjYWxsIGRlY3JlYXNlIHJlc2VydmF0aW9uIG9uY2UgdG8gcmVs
ZWFzZSB0aGUgZnJhbWVzLAo+IGFuZCB1bm1hcCB0aGUgZnJhbWVzIChpbiBhbnkgb3JkZXIpLsKg
IEhWTSBndWVzdHMgY2FsbGluZyBkZWNyZWFzZQo+IHJlc2VydmF0aW9uIGF1dG9tYXRpY2FsbHkg
bWFrZSB0aGUgZnJhbWUgdW51c2FibGUgbm8gbWF0dGVyIGhvdyBtYW55Cj4gb3V0c3RhbmRpbmcg
cmVmZXJlbmNlcyBleGlzdC4KCk91Y2gsIHNvIHlvdSBjYW4gY2FsbCBYRU5NRU1fZGVjcmVhc2Vf
cmVzZXJ2YXRpb24gYW5kIHRoZW4gdW5tYXAgdGhlCnBhZ2VzIGZyb20gdGhlIGd1ZXN0IHBhZ2Ut
dGFibGVzIGFuZCB0aGV5IHdpbGwgYmUgYmFsbG9vbmVkIG91dD8KClRCSCBJIGhhZCBubyBpZGVh
IHRoaXMgd2FzIHBvc3NpYmxlLCBJJ3ZlIG1vc3RseSBhc3N1bWVkIGEgbW9kZWwKc2ltaWxhciB3
aXRoIEhWTSwgd2hlcmUgeW91IGNhbGwgZGVjcmVhc2VfcmVzZXJ2YXRpb24gYW5kIHRoZSBwYWdl
cwphcmUganVzdCByZW1vdmVkIGZyb20gdGhlIHBoeXNtYXAuCgo+IFNoaW0gY2FuJ3QgZGVjcmVh
c2UgcmVzZXJ2YXRpb24gKEhWTSB3aXRoIEwwIFhlbikgb24gYW55IGZyYW1lIHdobydzCj4gcmVm
ZXJlbmNlIGNvdW50IGRpZG4ndCBkcm9wIHRvIDAgZnJvbSB0aGUgUFYgZ3Vlc3RzJyBjYWxsLCBh
bmQgdGhlcmUgaXMKPiBub3RoaW5nIHByZXNlbnRseSB0byBjaGVjayB0aGlzIGNvbmRpdGlvbi4K
CkJ1dCBzaGltIHdpbGwgb25seSBiYWxsb29uIG91dCBmcmVlIGRvbWhlYXAgcGFnZXMgKGFzIGl0
IGdldHMgdGhlbQpmcm9tIGFsbG9jX2RvbWhlYXBfcGFnZXMpLCBhbmQgdGhvc2Ugc2hvdWxkbid0
IGhhdmUgYW55IHJlZmVyZW5jZSBieQp0aGUgZ3Vlc3Q/Cgo+IFNob3J0IG9mIGEgUEdDIGJpdCBh
bmQgZXh0cmEgc2hpbSBsb2dpYyBpbiBmcmVlX2RvbWhlYXBfcGFnZSgpLCBJIGNhbid0Cj4gc2Vl
IGFueSB3YXkgdG8gcmVjb25jaWxlIHRoZSBiZWhhdmlvdXIsIGV4Y2VwdCB0byBjaGFuZ2UgdGhl
IHNlbWFudGljcwo+IG9mIGRlY3JlYXNlIHJlc2VydmF0aW9uIGZvciBQViBndWVzdHMuwqAgSW4g
cHJhY3RpY2UsIHRoaXMgd291bGQgYmUgZmFyCj4gbW9yZSBzZW5zaWJsZSBiZWhhdmlvdXIsIGJ1
dCB3ZSBoYXZlIG5vIGlkZWEgaWYgZXhpc3RpbmcgUFYgZ3Vlc3RzIHdvdWxkCj4gbWFuYWdlLgoK
SG0sIEkgZ3Vlc3Mgd2UgY291bGQgYWRkIHNvbWUgaG9vayB0byBmcmVlX2RvbWhlYXBfcGFnZSBp
biBvcmRlciB0bwpyZW1vdmUgdGhlbSBmcm9tIHRoZSBwaHlzbWFwIG9uY2UgdGhlIGd1ZXN0IGZy
ZWVzIHRoZW0/CgpIb3cgZG9lcyBYZW4ga25vdyB3aGljaCBwYWdlcyBmcmVlZCBieSBhIFBWIGd1
ZXN0IHNob3VsZCBiZSBiYWxsb29uZWQKb3V0PwoKSXMgdGhhdCBkb25lIHNvbGVseSBiYXNlZCBv
biB0aGUgZmFjdCB0aGF0IHRob3NlIHBhZ2VzIGRvbid0IGhhdmUgYW55CnJlZmVyZW5jZT8KClRo
YXQgZG9lc24ndCBzZWVtIGxpa2UgYSB2aWFibGUgb3B0aW9uIHVubGVzcyB3ZSBhZGQgYSBuZXcg
Yml0IHRvIHRoZQpwYWdlIHN0cnVjdCBpbiBvcmRlciB0byBzaWduYWwgdGhhdCB0aG9zZSBwYWdl
cyBzaG91bGQgYmUgYmFsbG9vbmVkCm91dCBvbmNlIGZyZWVkLCBhcyB5b3Ugc3VnZ2VzdC4KClJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
