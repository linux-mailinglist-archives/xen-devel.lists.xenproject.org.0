Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D860E1170E7
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 16:55:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieLKj-0008J1-QB; Mon, 09 Dec 2019 15:52:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieLKi-0008Iw-SD
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 15:52:24 +0000
X-Inumbo-ID: e2dd1f9d-1a9b-11ea-8808-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2dd1f9d-1a9b-11ea-8808-12813bfff9fa;
 Mon, 09 Dec 2019 15:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575906743;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ec/o/a4NYvSG4cDJo6szdrcaFu06QT98pi4hWVGjpLA=;
 b=Zbv43OhTyh+4lG4L8ZO0KAC9bT9mofPxLsFlqoum5LIxaEEl4voSM8+h
 jjoze0UtG56uLIc1EVHJzPDwzt6GuIJYqbqhlM2p9hKxHT/AGnHsW5XzH
 3OBhlSWdHBx7b80rlr2AcKxqA5yJ/kV0vqiG9FfVYvOEKYTCKe6M7uJfo A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ehg284IDO2CJ5xeXfsnf+pcZ7VDrwlNndDaM06e87raTXsLjVzlIQOheQ7phSC6slY+jzKLGEh
 UUuZ49b2xbwv3TZm9sClki0lFwJ0xkqqJDmY49yzpHJso70k1ADNG6PosI+n7pJ5+AP2sWgvfv
 t8eGIvQ1xW2MIF/zBuMb1IJ+YueN+86MCwbizxYF/ddB0eSPNWOJV/KF+R1M1sfTww/8W1pwWw
 U4q2cOjQ0nAP1gWOHvYH7wV5aHf+RzBmKOK6HJvZPTPV7BlJWT20yEJIEXn6YCCp8ID09lJzyo
 qxg=
X-SBRS: 2.7
X-MesageID: 9760117
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,296,1571716800"; 
   d="scan'208";a="9760117"
Date: Mon, 9 Dec 2019 16:52:15 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191209155215.GB980@Air-de-Roger>
References: <20191204151208.37076-1-roger.pau@citrix.com>
 <77e8cd84-07ec-3219-a588-211c376d99bc@suse.com>
 <20191204161834.GM980@Air-de-Roger>
 <9b099b26-4a91-5db5-8d02-6cfe0a91a997@suse.com>
 <20191209102042.GN980@Air-de-Roger>
 <09acabd4-951b-faad-9e10-fa9c85b4ee1a@suse.com>
 <20191209144648.GX980@Air-de-Roger>
 <55e21ad8-2f15-f3ba-05a7-58166c9f2383@suse.com>
 <20191209153647.GA980@Air-de-Roger>
 <e09ea2e7-c409-4b8e-4e90-47f6fbbc3be5@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e09ea2e7-c409-4b8e-4e90-47f6fbbc3be5@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v3] x86: do not enable global pages when
 virtualized on AMD hardware
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

T24gTW9uLCBEZWMgMDksIDIwMTkgYXQgMDQ6Mzk6NThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDkuMTIuMjAxOSAxNjozNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IE1vbiwgRGVjIDA5LCAyMDE5IGF0IDA0OjA0OjUxUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDA5LjEyLjIwMTkgMTU6NDYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIE1vbiwgRGVjIDA5LCAyMDE5IGF0IDAzOjIxOjI4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4+Pj4gT24gMDkuMTIuMjAxOSAxMToyMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
PiA+Pj4+PiBPbiBXZWQsIERlYyAwNCwgMjAxOSBhdCAwNjowNToxMVBNICswMTAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+Pj4+Pj4gT24gMDQuMTIuMjAxOSAxNzoxOCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+Pj4+Pj4+IE9uIFdlZCwgRGVjIDA0LCAyMDE5IGF0IDA1OjExOjQyUE0gKzAx
MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4+Pj4+IE9uIDA0LjEyLjIwMTkgMTY6MTIsIFJv
Z2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4+Pj4+Pj4gQEAgLTEzMCw3ICsxNDMsNyBAQCB1bnNp
Z25lZCBsb25nIHB2X21ha2VfY3I0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+ID4+Pj4+Pj4+PiAg
ICAgICAqLwo+ID4+Pj4+Pj4+PiAgICAgIGlmICggZC0+YXJjaC5wdi5wY2lkICkKPiA+Pj4+Pj4+
Pj4gICAgICAgICAgY3I0IHw9IFg4Nl9DUjRfUENJREU7Cj4gPj4+Pj4+Pj4+IC0gICAgZWxzZSBp
ZiAoICFkLT5hcmNoLnB2LnhwdGkgKQo+ID4+Pj4+Pj4+PiArICAgIGVsc2UgaWYgKCAhZC0+YXJj
aC5wdi54cHRpICYmIG9wdF9nbG9iYWxfcGFnZXMgKQo+ID4+Pj4+Pj4+PiAgICAgICAgICBjcjQg
fD0gWDg2X0NSNF9QR0U7Cj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBJJ20gc29ycnkgZm9yIG5vdGlj
aW5nIHRoaXMgb25seSBub3csIGJ1dCB3aGF0IGFib3V0IFhFTl9NSU5JTUFMX0NSNCwKPiA+Pj4+
Pj4+PiB3aGljaCBpbmNsdWRlcyBYODZfQ1I0X1BHRT8KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBJJ3Zl
IHRyaWVkIHJlbW92aW5nIFBHRSBmcm9tIFhFTl9NSU5JTUFMX0NSNCBidXQgaXQgbWFkZSBubyBu
b3RpY2VhYmxlCj4gPj4+Pj4+PiBwZXJmb3JtYW5jZSBkaWZmZXJlbmNlLCBzbyBJIGxlZnQgaXQg
YXMtaXMuCj4gPj4+Pj4+Cj4gPj4+Pj4+IE15IGNvbmNlcm4gaXNuJ3QgYWJvdXQgcGVyZm9ybWFu
Y2UsIGJ1dCBjb3JyZWN0bmVzcy4gSSBhZG1pdCBJCj4gPj4+Pj4+IGZvcmdvdCBmb3IgYSBtb21l
bnQgdGhhdCB3ZSBub3cgYWx3YXlzIHdyaXRlIENSNCAodW5sZXNzIHRoZQo+ID4+Pj4+PiBjYWNo
ZWQgdmFsdWUgbWF0Y2hlcyB0aGUgaW50ZW5kZWQgbmV3IG9uZSkuIFlldAo+ID4+Pj4+PiBtbXVf
Y3I0X2ZlYXR1cmVzIChzdGFydGluZyBvdXQgYXMgWEVOX01JTklNQUxfQ1I0KSBpcyBzdGlsbCBv
Zgo+ID4+Pj4+PiBjb25jZXJuLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBJIHRoaW5rIHRoaXMgYXQgbGVh
c3QgcmVxdWlyZXMgZXh0ZW5kaW5nIHRoZSBkZXNjcmlwdGlvbiB0bwo+ID4+Pj4+PiBkaXNjdXNz
IHRoZSBjb3JyZWN0bmVzcy4KPiA+Pj4+Pgo+ID4+Pj4+IFdvdWxkIHlvdSBiZSBmaW5lIHdpdGgg
YWRkaW5nIHRoZSBmb2xsb3dpbmcgYXQgdGhlIGVuZCBvZiB0aGUgY29tbWl0Cj4gPj4+Pj4gbWVz
c2FnZS4KPiA+Pj4+Pgo+ID4+Pj4+ICJOb3RlIHRoYXQgWEVOX01JTklNQUxfQ1I0IGlzIG5vdCBt
b2RpZmllZCwgYW5kIHRodXMgZ2xvYmFsIHBhZ2VzIGFyZQo+ID4+Pj4+IGxlZnQgZW5hYmxlZCBm
b3IgdGhlIGh5cGVydmlzb3IuIFRoaXMgaXMgbm90IGFuIGlzc3VlIGJlY2F1c2UgdGhlIGNvZGUK
PiA+Pj4+PiB0byBzd2l0Y2ggdGhlIGNvbnRyb2wgcmVnaXN0ZXJzIChjcjMgYW5kIGNyNCkgYWxy
ZWFkeSB0YWtlcyBpbnRvCj4gPj4+Pj4gYWNjb3VudCBzdWNoIHNpdHVhdGlvbiBhbmQgcGVyZm9y
bXMgdGhlIG5lY2Vzc2FyeSBmbHVzaGVzLiBUaGUgc2FtZQo+ID4+Pj4+IGFscmVhZHkgaGFwcGVu
cyB3aGVuIHVzaW5nIFhQVEkgb3IgUENJREUsIGFzIHRoZSBndWVzdCBjcjQgZG9lc24ndAo+ID4+
Pj4+IGhhdmUgZ2xvYmFsIHBhZ2VzIGVuYWJsZWQgaW4gdGhhdCBjYXNlIGVpdGhlci4iCj4gPj4+
Pgo+ID4+Pj4gWWVzLCB0aGlzIGlzIGdvb2QgZm9yIFhFTl9NSU5JTUFMX0NSNC4gQnV0IEkgdGhp
bmsgbW11X2NyNF9mZWF0dXJlcwo+ID4+Pj4gbmVlZHMgZGlzY3Vzc2luZyAob3IgYXQgbGVhc3Qg
bWVudGlvbmluZywgaWYgdGhlIHNhbWUgYXJndW1lbnRzCj4gPj4+PiBhcHBseSkgYXMgd2VsbC4K
PiA+Pj4KPiA+Pj4gVGhlIHNhbWUgYXBwbGllcyB0byBtbXVfY3I0X2ZlYXR1cmVzLCBpdCdzIGZp
bmUgZm9yIHRoZSBoeXBlcnZpc29yIHRvCj4gPj4+IHVzZSBhIGRpZmZlcmVudCBzZXQgb2YgY3I0
IGZlYXR1cmVzIChlc3BlY2lhbGx5IFBHRSkgdGhhbiBQViBndWVzdHM6Cj4gPj4+IHRoaXMgaXMg
YWxyZWFkeSB0aGUgY2FzZSB3aGVuIHVzaW5nIFhQVEkgb3IgUENJREUgd2hlbiBYZW4gY3I0IHdp
bGwKPiA+Pj4gaGF2ZSBQR0UgYW5kIGd1ZXN0cyBjcjQgd29uJ3QsIGFuZCBzd2l0Y2hfY3IzX2Ny
NCBEVFJULgo+ID4+Pgo+ID4+PiBTbyBJIHdvdWxkIHMvWEVOX01JTklNQUxfQ1I0L1hFTl9NSU5J
TUFMX0NSNCBhbmQgbW11X2NyNF9mZWF0dXJlcy8gaW4KPiA+Pj4gdGhlIGFib3ZlIHByb3Bvc2Vk
IHBhcmFncmFwaC4KPiA+Pgo+ID4+IEknbSBhZnJhaWQgaXQncyBtb3JlIGNvbXBsaWNhdGVkLCB1
cCB0byBhbmQgaW5jbHVkaW5nIHlvdSBtYWtpbmcgYQo+ID4+IHBvc3NpYmxlIHByZS1leGlzdGlu
ZyBidWcgd29yc2U6IFRoZSBTMyByZXN1bWUgcGF0aCBsb2FkcyBDUjQgZnJvbQo+ID4+IG1tdV9j
cjRfZmVhdHVyZXMsIGJ1dCBkb2Vzbid0IHVwZGF0ZSB0aGUgaW4tbWVtb3J5IGNhY2hlIG9mIHRo
ZQo+ID4+IHJlZ2lzdGVyLgo+ID4gCj4gPiBBbGwgZG9tYWlucyBhcmUgcGF1c2VkIGFuZCB0aGUg
c2NoZWR1bGVyIGlzIGRpc2FibGVkIHdoZW4gZG9pbmcgUzMKPiA+IHN1c3BlbmQvcmVzdW1lLCBh
bmQgdGhlIGFjdHVhbCBzdXNwZW5kIGFuZCByZXN1bWUgY29kZSBpcyBydW4gYnkgYQo+ID4gdGFz
a2xldCB3aGljaCBpcyBleGVjdXRlZCBpbiB0aGUgaWRsZSB2Q1BVIGNvbnRleHQgKHNpbmNlIGFs
bCBkb21haW5zCj4gPiBhcmUgcGF1c2VkKSwgYW5kIGhlbmNlIHRoZSB3cml0ZSBvZiBDUjQgd2l0
aCBtbXVfY3I0X2ZlYXR1cmVzIGlzIGZpbmUKPiA+IGFzIGVudGVyaW5nIGd1ZXN0IGNvbnRleHQg
YWZ0ZXIgcmVzdW1lIGlzIGdvaW5nIHRvIGludm9sdmUgYSBjYWxsIHRvCj4gPiBzd2l0Y2hfY3Iz
X2NyNCBpbiBvcmRlciB0byBzd2l0Y2ggb3V0IG9mIHRoZSBpZGxlIHZDUFUuCj4gCj4gQW5kIHN3
aXRjaF9jcjNfY3I0KCkgaGFzCj4gCj4gICAgIGlmICggb2xkX2NyNCAhPSBjcjQgKQo+ICAgICAg
ICAgd3JpdGVfY3I0KGNyNCk7Cj4gCj4gd2l0aCBvbGRfY3I0IHJlYWQgZnJvbSB0aGUgY2FjaGUu
CgpUaGF0IHJlYWQgZnJvbSB0aGUgY2FjaGUgaXMgZmluZS4gVGhlIGlkbGUgdkNQVSBjcjQgaXMK
bW11X2NyNF9mZWF0dXJlcyAoc2VlIHdyaXRlX3B0YmFzZSksIGFuZCBoZW5jZSB0aGUgd3JpdGUg
ZG9uZSBpbgpfX3JldF9wb2ludCBzaG91bGQgbWF0Y2ggd2hhdCdzIGluIHRoZSBjYWNoZS4KCj4g
PiBJdCBtaWdodCBiZSBjbGVhcmVyIHRvIGp1c3Qgc2F2ZSBjcjQgaW4gZG9fc3VzcGVuZF9sb3ds
ZXZlbCBsaWtlIGl0J3MKPiA+IGRvbmUgd2l0aCB0aGUgcmVzdCBvZiB0aGUgY29udHJvbCByZWdp
c3RlcnMuCj4gCj4gTm90IGp1c3QgbW9yZSBjbGVhciwgYnV0IGFsc28gbW9yZSByZWxpYWJsZS4K
CkxldCBtZSBwcmVwYXJlIGEgcGF0Y2ggdG8gaW1wcm92ZSB0aGlzLCBidXQgSSB0aGluayB0aGUg
Y3VycmVudCBwYXRjaAphdCBoYW5kIGlzIGNvcnJlY3QgYW5kIHNob3VsZG4ndCBiZSBibG9ja2Vk
IGJ5IHRoaXMgc3VzcGVuZC9yZXN1bWUKaW1wcm92ZW1lbnQuCgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
