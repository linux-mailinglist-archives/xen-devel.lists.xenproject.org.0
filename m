Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0452116F7A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:49:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieKJP-00024f-Tu; Mon, 09 Dec 2019 14:46:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieKJN-000245-R0
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:46:57 +0000
X-Inumbo-ID: bf1238e4-1a92-11ea-87e9-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf1238e4-1a92-11ea-87e9-12813bfff9fa;
 Mon, 09 Dec 2019 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575902816;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=F0AFqUBiLvTbGjShBY1+6ycJxrg/EiG5fpWtgR1AQTg=;
 b=N9N0VuEI1mtIHXz4murS8zcwutkgRMJgg5QiZRGnDphJELqv28bkF5qU
 FTU6YQjEDmcvb5a6US0b++l5mba/2TkKpu0hJfoVB/vTpWoN16MSA0v72
 Kzkn2MNRzKb1TVJwIUmIdpj9Jb+LihbUEqxrtFGzoRDxFoaPye3MMvs/c o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: m796JJFNYXa2dQe9FZ+2rY7N3jyblEomT4byokuI3DJ903Zge4d36iwowrM98oHT2L+LGDeq1j
 13Owr7XRB9QtMBiW9XjDBCRuYQP3hA7dPzUXs8ycPUrbMVxtgXIlC8Dm6C8Kg/37B/hk34+07M
 Tn91efyk7LwGzEw8b9Hv1NY7KffdFT0K2uuQeCx1bQ5cnblfBAyI5TEDGILxARTNmR9bP7TiBX
 b/KWFb0T29n/1Dixu6Ayn2gN1/ASheOJuJaJ40HJ4wA0I6TZ4/YKJCuEzmC6N/3laDJnuUZgNG
 67w=
X-SBRS: 2.7
X-MesageID: 9810634
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,296,1571716800"; 
   d="scan'208";a="9810634"
Date: Mon, 9 Dec 2019 15:46:48 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191209144648.GX980@Air-de-Roger>
References: <20191204151208.37076-1-roger.pau@citrix.com>
 <77e8cd84-07ec-3219-a588-211c376d99bc@suse.com>
 <20191204161834.GM980@Air-de-Roger>
 <9b099b26-4a91-5db5-8d02-6cfe0a91a997@suse.com>
 <20191209102042.GN980@Air-de-Roger>
 <09acabd4-951b-faad-9e10-fa9c85b4ee1a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09acabd4-951b-faad-9e10-fa9c85b4ee1a@suse.com>
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

T24gTW9uLCBEZWMgMDksIDIwMTkgYXQgMDM6MjE6MjhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDkuMTIuMjAxOSAxMToyMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgRGVjIDA0LCAyMDE5IGF0IDA2OjA1OjExUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDA0LjEyLjIwMTkgMTc6MTgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIFdlZCwgRGVjIDA0LCAyMDE5IGF0IDA1OjExOjQyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4+Pj4gT24gMDQuMTIuMjAxOSAxNjoxMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+
ID4+Pj4+IEBAIC0xMzAsNyArMTQzLDcgQEAgdW5zaWduZWQgbG9uZyBwdl9tYWtlX2NyNChjb25z
dCBzdHJ1Y3QgdmNwdSAqdikKPiA+Pj4+PiAgICAgICAqLwo+ID4+Pj4+ICAgICAgaWYgKCBkLT5h
cmNoLnB2LnBjaWQgKQo+ID4+Pj4+ICAgICAgICAgIGNyNCB8PSBYODZfQ1I0X1BDSURFOwo+ID4+
Pj4+IC0gICAgZWxzZSBpZiAoICFkLT5hcmNoLnB2LnhwdGkgKQo+ID4+Pj4+ICsgICAgZWxzZSBp
ZiAoICFkLT5hcmNoLnB2LnhwdGkgJiYgb3B0X2dsb2JhbF9wYWdlcyApCj4gPj4+Pj4gICAgICAg
ICAgY3I0IHw9IFg4Nl9DUjRfUEdFOwo+ID4+Pj4KPiA+Pj4+IEknbSBzb3JyeSBmb3Igbm90aWNp
bmcgdGhpcyBvbmx5IG5vdywgYnV0IHdoYXQgYWJvdXQgWEVOX01JTklNQUxfQ1I0LAo+ID4+Pj4g
d2hpY2ggaW5jbHVkZXMgWDg2X0NSNF9QR0U/Cj4gPj4+Cj4gPj4+IEkndmUgdHJpZWQgcmVtb3Zp
bmcgUEdFIGZyb20gWEVOX01JTklNQUxfQ1I0IGJ1dCBpdCBtYWRlIG5vIG5vdGljZWFibGUKPiA+
Pj4gcGVyZm9ybWFuY2UgZGlmZmVyZW5jZSwgc28gSSBsZWZ0IGl0IGFzLWlzLgo+ID4+Cj4gPj4g
TXkgY29uY2VybiBpc24ndCBhYm91dCBwZXJmb3JtYW5jZSwgYnV0IGNvcnJlY3RuZXNzLiBJIGFk
bWl0IEkKPiA+PiBmb3Jnb3QgZm9yIGEgbW9tZW50IHRoYXQgd2Ugbm93IGFsd2F5cyB3cml0ZSBD
UjQgKHVubGVzcyB0aGUKPiA+PiBjYWNoZWQgdmFsdWUgbWF0Y2hlcyB0aGUgaW50ZW5kZWQgbmV3
IG9uZSkuIFlldAo+ID4+IG1tdV9jcjRfZmVhdHVyZXMgKHN0YXJ0aW5nIG91dCBhcyBYRU5fTUlO
SU1BTF9DUjQpIGlzIHN0aWxsIG9mCj4gPj4gY29uY2Vybi4KPiA+Pgo+ID4+IEkgdGhpbmsgdGhp
cyBhdCBsZWFzdCByZXF1aXJlcyBleHRlbmRpbmcgdGhlIGRlc2NyaXB0aW9uIHRvCj4gPj4gZGlz
Y3VzcyB0aGUgY29ycmVjdG5lc3MuCj4gPiAKPiA+IFdvdWxkIHlvdSBiZSBmaW5lIHdpdGggYWRk
aW5nIHRoZSBmb2xsb3dpbmcgYXQgdGhlIGVuZCBvZiB0aGUgY29tbWl0Cj4gPiBtZXNzYWdlLgo+
ID4gCj4gPiAiTm90ZSB0aGF0IFhFTl9NSU5JTUFMX0NSNCBpcyBub3QgbW9kaWZpZWQsIGFuZCB0
aHVzIGdsb2JhbCBwYWdlcyBhcmUKPiA+IGxlZnQgZW5hYmxlZCBmb3IgdGhlIGh5cGVydmlzb3Iu
IFRoaXMgaXMgbm90IGFuIGlzc3VlIGJlY2F1c2UgdGhlIGNvZGUKPiA+IHRvIHN3aXRjaCB0aGUg
Y29udHJvbCByZWdpc3RlcnMgKGNyMyBhbmQgY3I0KSBhbHJlYWR5IHRha2VzIGludG8KPiA+IGFj
Y291bnQgc3VjaCBzaXR1YXRpb24gYW5kIHBlcmZvcm1zIHRoZSBuZWNlc3NhcnkgZmx1c2hlcy4g
VGhlIHNhbWUKPiA+IGFscmVhZHkgaGFwcGVucyB3aGVuIHVzaW5nIFhQVEkgb3IgUENJREUsIGFz
IHRoZSBndWVzdCBjcjQgZG9lc24ndAo+ID4gaGF2ZSBnbG9iYWwgcGFnZXMgZW5hYmxlZCBpbiB0
aGF0IGNhc2UgZWl0aGVyLiIKPiAKPiBZZXMsIHRoaXMgaXMgZ29vZCBmb3IgWEVOX01JTklNQUxf
Q1I0LiBCdXQgSSB0aGluayBtbXVfY3I0X2ZlYXR1cmVzCj4gbmVlZHMgZGlzY3Vzc2luZyAob3Ig
YXQgbGVhc3QgbWVudGlvbmluZywgaWYgdGhlIHNhbWUgYXJndW1lbnRzCj4gYXBwbHkpIGFzIHdl
bGwuCgpUaGUgc2FtZSBhcHBsaWVzIHRvIG1tdV9jcjRfZmVhdHVyZXMsIGl0J3MgZmluZSBmb3Ig
dGhlIGh5cGVydmlzb3IgdG8KdXNlIGEgZGlmZmVyZW50IHNldCBvZiBjcjQgZmVhdHVyZXMgKGVz
cGVjaWFsbHkgUEdFKSB0aGFuIFBWIGd1ZXN0czoKdGhpcyBpcyBhbHJlYWR5IHRoZSBjYXNlIHdo
ZW4gdXNpbmcgWFBUSSBvciBQQ0lERSB3aGVuIFhlbiBjcjQgd2lsbApoYXZlIFBHRSBhbmQgZ3Vl
c3RzIGNyNCB3b24ndCwgYW5kIHN3aXRjaF9jcjNfY3I0IERUUlQuCgpTbyBJIHdvdWxkIHMvWEVO
X01JTklNQUxfQ1I0L1hFTl9NSU5JTUFMX0NSNCBhbmQgbW11X2NyNF9mZWF0dXJlcy8gaW4KdGhl
IGFib3ZlIHByb3Bvc2VkIHBhcmFncmFwaC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
