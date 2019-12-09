Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281E8116FB2
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:54:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieKNJ-0002pd-GS; Mon, 09 Dec 2019 14:51:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieKNH-0002p6-Li
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:50:59 +0000
X-Inumbo-ID: 4f6e88d4-1a93-11ea-88e7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f6e88d4-1a93-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 14:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575903059;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2dO5BvIjpkYdQ+oSK/+HVqsN5b3cAdJLLP3v8sy3hOk=;
 b=Hn0KAZQ12raS19+s0CMoBNFCXtdyy/cEzRsAnH0gm5fncN92mHc2omOK
 YX50pxC495cUwKJteaG31EroBLIctuGqXLebkdTgVwP0FLD0WVGPNm5YS
 pm/xEbvUP1wHU52Y0ejK3NI6VvA3bN4gcSR8cmdoOBZpxld05AlI7XNrL E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Jg1LGvP61+/m+I6GVxCctSpa35m/cqJNN8pZOSTW8D+OMAWU6MsegW7uDCQyGhiNnUpwbuudHA
 OZz1ZAiSh5Q9oUTFTWc+y0CsTVvdoZTGaxEdziMV5Vlp1NRNTimSy1pYMrhyDpM/LCayBpiu5g
 WogvcWaPsccfjzh4yM/FVnbWeqb3q7p2ySAc7heG9aWb/DbVhIkw5sg2vHbUKKakPoeuoz84JE
 o5j3TeevSQu1W/RCWuGnYI2NUYpMmv/YWJWBhcWKvvYbx0+JzRUT0d/jf+0bZZ01PT4ecc400/
 fvg=
X-SBRS: 2.7
X-MesageID: 9524129
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,296,1571716800"; 
   d="scan'208";a="9524129"
Date: Mon, 9 Dec 2019 15:50:51 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191209145051.GY980@Air-de-Roger>
References: <20191204162025.37510-1-roger.pau@citrix.com>
 <20191204162025.37510-3-roger.pau@citrix.com>
 <b4f32391-894b-a781-ad54-39d53d3bf728@suse.com>
 <20191209102502.GO980@Air-de-Roger>
 <0d37b893-436a-ac5e-2977-5996f29c8205@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d37b893-436a-ac5e-2977-5996f29c8205@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v3 2/4] x86/apic: force phys mode if
 interrupt remapping is disabled
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMDksIDIwMTkgYXQgMDM6MzA6MjdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDkuMTIuMjAxOSAxMToyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgRGVjIDA1LCAyMDE5IGF0IDEwOjMyOjM0QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDA0LjEyLjIwMTkgMTc6MjAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
Q2x1c3RlciBtb2RlIGNhbiBvbmx5IGJlIHVzZWQgd2l0aCBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1
cHBvcnQsIHNpbmNlCj4gPj4+IHRoZSB0b3AgMTZiaXRzIG9mIHRoZSBBUElDIElEIGFyZSBmaWxs
ZWQgd2l0aCB0aGUgY2x1c3RlciBJRCwgYW5kCj4gPj4+IGhlbmNlIG9uIHN5c3RlbXMgd2hlcmUg
dGhlIHBoeXNpY2FsIElEIGlzIHN0aWxsIHNtYWxsZXIgdGhhbiAyNTUgdGhlCj4gPj4+IGNsdXN0
ZXIgSUQgaXMgbm90LiBGb3JjZSB4MkFQSUMgdG8gdXNlIHBoeXNpY2FsIG1vZGUgaWYgdGhlcmUn
cyBubwo+ID4+PiBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBvcnQuCj4gPj4+Cj4gPj4+IE5vdGUg
dGhhdCB0aGlzIHJlcXVpcmVzIGEgZnVydGhlciBwYXRjaCBpbiBvcmRlciB0byBlbmFibGUgeDJB
UElDCj4gPj4+IHdpdGhvdXQgaW50ZXJydXB0IHJlbWFwcGluZyBzdXBwb3J0Lgo+ID4+Pgo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
PiA+Pgo+ID4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Pj4gYWxiZWl0IC4uLgo+ID4+Cj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9nZW5hcGljL3gyYXBp
Yy5jCj4gPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9nZW5hcGljL3gyYXBpYy5jCj4gPj4+IEBAIC0y
MjYsNyArMjI2LDIzIEBAIGJvb2xlYW5fcGFyYW0oIngyYXBpY19waHlzIiwgeDJhcGljX3BoeXMp
Owo+ID4+PiAgY29uc3Qgc3RydWN0IGdlbmFwaWMgKl9faW5pdCBhcGljX3gyYXBpY19wcm9iZSh2
b2lkKQo+ID4+PiAgewo+ID4+PiAgICAgIGlmICggeDJhcGljX3BoeXMgPCAwICkKPiA+Pj4gLSAg
ICAgICAgeDJhcGljX3BoeXMgPSAhIShhY3BpX2dibF9GQURULmZsYWdzICYgQUNQSV9GQURUX0FQ
SUNfUEhZU0lDQUwpOwo+ID4+PiArICAgIHsKPiA+Pj4gKyAgICAgICAgaWYgKCAhaW9tbXVfaW50
cmVtYXAgKQo+ID4+PiArICAgICAgICAgICAgLyoKPiA+Pj4gKyAgICAgICAgICAgICAqIEZvcmNl
IHBoeXNpY2FsIG1vZGUgaWYgdGhlcmUncyBubyBpbnRlcnJ1cHQgcmVtYXBwaW5nIHN1cHBvcnQ6
Cj4gPj4+ICsgICAgICAgICAgICAgKiB0aGUgSUQgaW4gY2x1c3RlcmVkIG1vZGUgcmVxdWlyZXMg
YSAzMiBiaXQgZGVzdGluYXRpb24gZmllbGQgZHVlCj4gPj4+ICsgICAgICAgICAgICAgKiB0byB0
aGUgdXNhZ2Ugb2YgdGhlIGhpZ2ggMTYgYml0cyB0byBzdG9yZSB0aGUgY2x1c3RlciBJRC4KPiA+
Pj4gKyAgICAgICAgICAgICAqLwo+ID4+PiArICAgICAgICAgICAgeDJhcGljX3BoeXMgPSB0cnVl
Owo+ID4+PiArICAgICAgICBlbHNlCj4gPj4+ICsgICAgICAgICAgICB4MmFwaWNfcGh5cyA9ICEh
KGFjcGlfZ2JsX0ZBRFQuZmxhZ3MgJiBBQ1BJX0ZBRFRfQVBJQ19QSFlTSUNBTCk7Cj4gPj4KPiA+
PiAuLi4gSSB3b25kZXIgd2h5IHlvdSBkaWRuJ3QgbWFrZSB0aGlzCj4gPj4KPiA+PiAgICAgICAg
IHgyYXBpY19waHlzID0gIWlvbW11X2ludHJlbWFwIHx8IChhY3BpX2dibF9GQURULmZsYWdzICYg
QUNQSV9GQURUX0FQSUNfUEhZU0lDQUwpOwo+ID4+Cj4gPj4gKG5vdCB0aGUgbGVhc3QgYmVjYXVz
ZSBvZiBhbGxvd2luZyB0byBkcm9wIHRoZSBzb21ld2hhdCB1Z2x5ICEhKS4KPiA+IAo+ID4gRmVl
bCBmcmVlIHRvIGRvIGl0IGF0IGNvbW1pdCAoYW5kIHJlaW5kZW50IHRoZSBjb21tZW50KSwgb3Ig
ZWxzZSBJIGNhbgo+ID4gcmVzZW5kIGEgbmV3IHZlcnNpb24gaWYgdGhhdCdzIHRvbyBpbnRydXNp
dmUuCj4gCj4gRG9pbmcgdGhlc2UgYWRqdXN0bWVudHMgYXQgY29tbWl0IHRpbWUgb3VnaHQgdG8g
YmUgZmluZS4gSXQncwo+IGp1c3QgdGhhdCBJJ2QgcHJlZmVyIHRvIHdhaXQgd2l0aCBjb21taXR0
aW5nIHRoaXMgc2VyaWVzIHVudGlsCj4gNC4xMyBpcyBmdWxseSBmaW5pc2hlZC4KClRoYXQncyBm
aW5lLCBJIGRvbid0IGhhdmUgYW55IGh1cnJ5LiBBbGwgcGF0Y2hlcyBhcmUgQWNrZWQgb3IgUkIg
bm93LApzbyBJIHdpbGwgaG9sZCBvZmYgc2VuZGluZyBhIG5ldyB2ZXJzaW9uLiBMZXQgbWUga25v
dyBpZiB0aGUgcGF0Y2hlcwpkb24ndCBhcHBseSBjbGVhbmx5IHdoZW4gY29tbWl0dGluZyBhbmQg
SSBjYW4gc2VuZCBhbiB1cGRhdGVkIHZlcnNpb24Kd2l0aCB0aGUgbWlub3IgY29tbWVudHMgZnJv
bSB0aGlzIGxhc3Qgcm91bmQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
