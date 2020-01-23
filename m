Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF624146D28
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:45:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuecF-0001ca-5L; Thu, 23 Jan 2020 15:41:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LOIr=3M=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iuecD-0001cV-Ct
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:41:53 +0000
X-Inumbo-ID: dfe48798-3df6-11ea-be6a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfe48798-3df6-11ea-be6a-12813bfff9fa;
 Thu, 23 Jan 2020 15:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579794111;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=yO1RctMIBui8DbPx9HeGhcYpJhtr/AWBRvD2MqmCbN0=;
 b=T0q7eBqvIiGlinnZiLM0GbFBQyRIIrIEfuwYkER29NTG5KjukIBkeACr
 zzSzBCRFohetE/Qq1DGLivGOCk1gqTlkych4j38sqn0t+K7q8OnDPpT9x
 brbAXkmhdN5/dMpD5BrHCZ+Jgz0lBDfchRuQNERq1TFsvseo0L01br2de U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 78Tv8fCBZYw3RcC8o3QBprZ9yFsZB39n2A0d79acW7dACg8F5jYtG+YSVa9pqVlcCfnYf3uduV
 WEYHmLGebNZfFyowvWpuPf+tFKwC8uwX6ydJ8AVbISGy8di139yt/uj/DSpIXB2uN1nSAZlQVO
 4oBo5xHSUQ7FhETiLrcC1ZQKuQDh/CB2Vuir6vC3wQPSgBJa6LqE5VPy9TG5OIqfMCIRpQ0hcC
 lR2fdNnp+ahnC7AijoPHUvrHKeFkxqzdoe4Jz9nYtfASaiHYFTNFhs/CXBdX8UtMCQvpI9oDrK
 qUQ=
X-SBRS: 2.7
X-MesageID: 11771318
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11771318"
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.com>
References: <20200123140305.21050-1-pdurrant@amazon.com>
 <20200123140305.21050-4-pdurrant@amazon.com>
 <4dde36de-ae8e-9fae-a84e-c5882ad396d0@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <3fff6557-780c-99c8-9674-2d980966e2f2@citrix.com>
Date: Thu, 23 Jan 2020 15:41:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4dde36de-ae8e-9fae-a84e-c5882ad396d0@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86 / vmx: use a 'normal' domheap
 page for APIC_DEFAULT_PHYS_BASE
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yMy8yMCAzOjMyIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMy4wMS4yMDIwIDE1
OjAzLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IHZteF9hbGxvY192bGFwaWNfbWFwcGluZygpIGN1
cnJlbnRseSBjb250YWlucyBzb21lIHZlcnkgb2RkIGxvb2tpbmcgY29kZQo+PiB0aGF0IGFsbG9j
YXRlcyBhIE1FTUZfbm9fb3duZXIgZG9taGVhcCBwYWdlIGFuZCB0aGVuIHNoYXJlcyB3aXRoIHRo
ZSBndWVzdAo+PiBhcyBpZiBpdCB3ZXJlIGEgeGVuaGVhcCBwYWdlLiBUaGlzIHRoZW4gcmVxdWly
ZXMgdm14X2ZyZWVfdmxhcGljX21hcHBpbmcoKQo+PiB0byBjYWxsIGEgc3BlY2lhbCBmdW5jdGlv
biBpbiB0aGUgbW0gY29kZTogZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKCkuCj4+Cj4+IEJ5IHVz
aW5nIGEgJ25vcm1hbCcgZG9taGVhcCBwYWdlIChpLmUuIGJ5IG5vdCBwYXNzaW5nIE1FTUZfbm9f
b3duZXIgdG8KPj4gYWxsb2NfZG9taGVhcF9wYWdlKCkpLCB0aGUgb2RkIGxvb2tpbmcgY29kZSBp
biB2bXhfYWxsb2NfdmxhcGljX21hcHBpbmcoKQo+PiBjYW4gc2ltcGx5IHVzZSBnZXRfcGFnZV9h
bmRfdHlwZSgpIHRvIHNldCB1cCBhIHdyaXRhYmxlIG1hcHBpbmcgYmVmb3JlCj4+IGluc2VydGlv
biBpbiB0aGUgUDJNIGFuZCB2bXhfZnJlZV92bGFwaWNfbWFwcGluZygpIGNhbiBzaW1wbHkgcmVs
ZWFzZSB0aGUKPj4gcGFnZSB1c2luZyBwdXRfcGFnZV9hbGxvY19yZWYoKSBmb2xsb3dlZCBieSBw
dXRfcGFnZV9hbmRfdHlwZSgpLiBUaGlzCj4+IHRoZW4gYWxsb3dzIGZyZWVfc2hhcmVkX2RvbWhl
YXBfcGFnZSgpIHRvIGJlIHB1cmdlZC4KPj4KPj4gVGhlcmUgaXMsIGhvd2V2ZXIsIHNvbWUgZmFs
bC1vdXQgZnJvbSB0aGlzIHNpbXBsaWZpY2F0aW9uOgo+Pgo+PiAtIGFsbG9jX2RvbWhlYXBfcGFn
ZSgpIHdpbGwgbm93IGNhbGwgYXNzaWduX3BhZ2VzKCkgYW5kIHJ1biBpbnRvIHRoZSBmYWN0Cj4+
ICAgdGhhdCAnbWF4X3BhZ2VzJyBpcyBub3Qgc2V0IHVudGlsIHNvbWUgdGltZSBhZnRlciBkb21h
aW5fY3JlYXRlKCkuIFRvCj4+ICAgYXZvaWQgYW4gYWxsb2NhdGlvbiBmYWlsdXJlLCBkb21haW5f
Y3JlYXRlKCkgaXMgbW9kaWZpZWQgdG8gc2V0Cj4+ICAgbWF4X3BhZ2VzIHRvIGFuIGluaXRpYWwg
dmFsdWUsIHN1ZmZpY2llbnQgdG8gY292ZXIgYW55IGRvbWhlYXAKPj4gICBhbGxvY2F0aW9ucyBy
ZXF1aXJlZCB0byBjb21wbGV0ZSBkb21haW4gY3JlYXRpb24uIFRoZSB2YWx1ZSB3aWxsIGJlCj4+
ICAgc2V0IHRvIHRoZSAncmVhbCcgbWF4X3BhZ2VzIHdoZW4gdGhlIHRvb2wtc3RhY2sgbGF0ZXIg
cGVyZm9ybXMgdGhlCj4+ICAgWEVOX0RPTUNUTF9tYXhfbWVtIG9wZXJhdGlvbiwgdGh1cyBhbGxv
d2luZyB0aGUgcmVzdCBvZiB0aGUgZG9tYWluJ3MKPj4gICBtZW1vcnkgdG8gYmUgYWxsb2NhdGVk
Lgo+IAo+IEkgY29udGludWUgdG8gZGlzYWdyZWUgd2l0aCB0aGlzIGFwcHJvYWNoLCBhbmQgSSBk
b24ndCB0aGluayBJJ3ZlCj4gaGVhcmQgYmFjayBvbiB0aGUgYWx0ZXJuYXRpdmUgc3VnZ2VzdGlv
biBvZiB1c2luZyBNRU1GX25vX3JlZmNvdW50Cj4gaW5zdGVhZCBvZiBNRU1GX25vX293bmVyLiBB
cyBzYWlkIGJlZm9yZSwgdGhlIHBhZ2UgKGFuZCBhbnkgb3RoZXIKPiBvbmVzIHVwIHRvIERPTUFJ
Tl9JTklUX1BBR0VTLCB3aGljaCBJIGZpbmQgcmF0aGVyIGZyYWdpbGUgdG8gYmUKPiBzZXQgdG8g
MSkgd2lsbCBub3cgZ2V0IGFjY291bnRlZCBhZ2FpbnN0IHRoZSBhbW91bnQgYWxsb3dlZCBmb3IK
PiB0aGUgZG9tYWluIHRvIGFsbG9jYXRlLgo+IAo+IEl0IGFsc28gbG9va3MgdG8gbWUgYXMgaWYg
dGhpcyB3aWxsIGJyZWFrIGUuZy4KPiBwMm1fcG9kX3NldF9tZW1fdGFyZ2V0KCksIHdoaWNoIGF0
IHRoZSB2ZXJ5IHRvcCBoYXMKPiAKPiAgICAgLyogUCA9PSBCOiBOb3RoaW5nIHRvIGRvICh1bmxl
c3MgdGhlIGd1ZXN0IGlzIGJlaW5nIGNyZWF0ZWQpLiAqLwo+ICAgICBwb3B1bGF0ZWQgPSBkLT50
b3RfcGFnZXMgLSBwMm0tPnBvZC5jb3VudDsKPiAgICAgaWYgKCBwb3B1bGF0ZWQgPiAwICYmIHAy
bS0+cG9kLmVudHJ5X2NvdW50ID09IDAgKQo+ICAgICAgICAgZ290byBvdXQ7Cj4gCj4gVGhpcyBj
b2RlIGFzc3VtZXMgdGhhdCBkdXJpbmcgZG9tYWluIGNyZWF0aW9uIGFsbCBwYWdlcyByZWNvcmRl
ZAo+IGluIC0+dG90X3BhZ2VzIGhhdmUgYWxzbyBiZWVuIHJlY29yZGVkIGluIC0+cG9kLmNvdW50
Lgo+IAo+IFRoZXJlIG1heSBiZSBvdGhlciB1c2VzIG9mIC0+dG90X3BhZ2VzIHdoaWNoIHRoaXMg
Y2hhbmdlIGNvbmZsaWN0cwo+IHdpdGguCgpUaGlzIGJhc2ljYWxseSBib2lscyBkb3duIHRvIHRo
ZSAibWVtb3J5IGFjY291bnRpbmcgc3dhbXAiLCB3aGVyZQp2YXJpb3VzIHJhbmRvbSBmZWF0dXJl
cyBuZWVkIHRvIGFsbG9jYXRlIGRvbWFpbiBwYWdlcyB0byBmdW5jdGlvbi4KCj4+IC0gQmVjYXVz
ZSB0aGUgZG9taGVhcCBwYWdlIGlzIG5vIGxvbmdlciBhIHBzZXVkby14ZW5oZWFwIHBhZ2UsIHRo
ZQo+PiAgIHJlZmVyZW5jZSBjb3VudGluZyB3aWxsIHByZXZlbnQgdGhlIGRvbWFpbiBmcm9tIGJl
aW5nIGRlc3Ryb3llZC4gVGh1cwo+PiAgIHRoZSBjYWxsIHRvIHZteF9mcmVlX3ZsYXBpY19tYXBw
aW5nKCkgaXMgbW92ZWQgZnJvbSB0aGUKPj4gICBkb21haW5fZGVzdHJveSgpIG1ldGhvZCBpbnRv
IHRoZSBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBtZXRob2QuCj4+ICAgV2hpbHN0IGlu
IHRoZSBhcmVhLCBtYWtlIHRoZSBkb21haW5fZGVzdHJveSgpIG1ldGhvZCBhbiBvcHRpb25hbAo+
PiAgIGFsdGVybmF0aXZlX3ZjYWxsKCkgKHNpbmNlIGl0IHdpbGwgbm8gbG9uZ2VyIHBlZm9ybSBh
bnkgZnVuY3Rpb24gaW4gVk1YCj4+ICAgYW5kIGlzIHN0dWJiZWQgaW4gU1ZNIGFueXdheSkuCj4g
Cj4gQWxsIG9mIHRoaXMgd291bGQsIGFmYWljdCwgYmVjb21lIGlycmVsZXZhbnQgd2hlbiB1c2lu
ZyBNRU1GX25vX3JlZmNvdW50Lgo+IAo+IFRoZXJlIGxvb2tzIHRvIGJlIG9uZSBpc3N1ZSAod2hp
Y2ggSSB0aGluayB3ZSBoYXZlIGJlZW4gZGlzY3Vzc2luZwo+IGJlZm9yZSk6IEJ5IG5vdCBidW1w
aW5nIC0+dG90X3BhZ2VzLCBpdHMgZGVjcmVtZW50aW5nIHVwb24gZnJlZWluZwo+IHRoZSBwYWdl
IHdpbGwgYmUgYSBwcm9ibGVtLiBJIGNhbiBzZWUgdHdvIHBvc3NpYmxlIHNvbHV0aW9ucyB0byB0
aGlzOgo+IC0gSW50cm9kdWNlIGEgZmxhZyBpbmRpY2F0aW5nIHRoZXJlIHNob3VsZCBhbHNvIGJl
IG5vIGFjY291bnRpbmcKPiAgIHVwb24gZnJlZWluZyBvZiB0aGUgcGFnZS4KClRoaXMgc2VlbXMg
bGlrZSBhIHJlYXNvbmFibGUgYXBwcm9hY2ggdG8gbG9vayBpbnRvLgoKIC1HZW9yZ2UKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
