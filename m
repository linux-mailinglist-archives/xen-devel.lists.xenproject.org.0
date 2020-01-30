Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E79914DA28
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 12:51:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix8Jk-0002Cm-M0; Thu, 30 Jan 2020 11:49:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tz6E=3T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ix8Jj-0002Cf-M1
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 11:49:03 +0000
X-Inumbo-ID: 826ec03c-4356-11ea-8396-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 826ec03c-4356-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580384943;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=AQFImYDgjk/E0i3SHZj4HSYp/9jOp4YRx7JljAhjaq8=;
 b=hvRbMytsu8hIDFIqqTfwYhzrH06TaLy4ipfkSoUL3kd1PdxHLOEH+zUi
 WelXuinOM99yx3951V1DRiKvoxxYryv7uCWwo/V/KcLF+ImTwoRTxcm1S
 /VUwH3uCrPMkSh/ePEfU+472lnivkV7cKECsJef/RvUBWop6ueiJeHX5b 4=;
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
IronPort-SDR: bdmEAyyXX6xP9iP7oHwmYhLF1nA8r0BKGPBygzUsMuAfgBShYygtqNfrTHf0/89NYhxRjiDY0M
 nT1aKjWREQrg+drtBcq6nIgs/oChiT0urWMIzK9kvNBI8JBWJZr00c1E6Z3L5V3/D+bTMuYBDc
 Vf4vYfrpU/+9nRUV3bkKoQY0oS+PdwNa25yV6hTWhQluM72xl6GOiMkUyaxiOGgwABqMws7qqc
 nxt4a7kZ0v4TjSfb1GM1E4QPh+FDKy7QCDUv2iwyE2SFKTScE8pd5jcqVnFkG/cFP+i1n9+RSi
 wGA=
X-SBRS: 2.7
X-MesageID: 11686805
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="11686805"
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20200129144702.1543-1-pdurrant@amazon.com>
 <20200129144702.1543-2-pdurrant@amazon.com>
 <1cb14800-ab91-f387-623d-2abafa9f826b@citrix.com>
 <9852bb7104aa4001be8160d7ca0cb060@EX13D32EUC003.ant.amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0372df5c-71b0-ff37-6436-0bcda7627813@citrix.com>
Date: Thu, 30 Jan 2020 11:48:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9852bb7104aa4001be8160d7ca0cb060@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 1/2] docs/designs: Add a design document
 for non-cooperative live migration
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
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDEvMjAyMCAwOToxNSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4+IGRpZmYgLS1naXQg
YS9kb2NzL2Rlc2lnbnMvbm9uLWNvb3BlcmF0aXZlLW1pZ3JhdGlvbi5tZAo+PiBiL2RvY3MvZGVz
aWducy9ub24tY29vcGVyYXRpdmUtbWlncmF0aW9uLm1kCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+Pj4gaW5kZXggMDAwMDAwMDAwMC4uNWRiMzkzOWRiNQo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4g
KysrIGIvZG9jcy9kZXNpZ25zL25vbi1jb29wZXJhdGl2ZS1taWdyYXRpb24ubWQKPj4+IEBAIC0w
LDAgKzEsMjcyIEBACj4+PiArIyBOb24tQ29vcGVyYXRpdmUgTWlncmF0aW9uIG9mIEd1ZXN0cyBv
biBYZW4KPj4+ICsKPj4+ICsjIyBCYWNrZ3JvdW5kCj4+PiArCj4+PiArVGhlIG5vcm1hbCBtb2Rl
bCBvZiBtaWdyYXRpb24gaW4gWGVuIGlzIGRyaXZlbiBieSB0aGUgZ3Vlc3QgYmVjYXVzZSBpdAo+
PiB3YXMKPj4+ICtvcmlnaW5hbGx5IGltcGxlbWVudGVkIGZvciBQViBndWVzdHMsIHdoZXJlIHRo
ZSBndWVzdCBtdXN0IGJlIGF3YXJlIGl0Cj4+IGlzCj4+PiArcnVubmluZyB1bmRlciBYZW4gYW5k
IGlzIGhlbmNlIGV4cGVjdGVkIHRvIGNvLW9wZXJhdGUuCj4+IEZvciBQViBndWVzdHMsIGlzIG1v
cmUgdGhhbiAiZXhwZWN0ZWQgdG8gY28tb3BlcmF0ZSIuCj4+Cj4+IE1pZ3JhdGluZyBhIFBWIGd1
ZXN0IGludm9sdmVzIHJld3JpdGluZyBldmVyeSBwYWdldGFibGUgZW50cnkgd2l0aCBhCj4+IGRp
ZmZlcmVudCBNRk4sIHNvIGV2ZW4gYmVmb3JlIHlvdSBjb25zaWRlciB0aGluZ3MgbGlrZSB0aGUg
UFYgcHJvdG9jb2xzLAo+PiB0aGVyZSBpcyBubyB3YXkgdGhpcyBjb3VsZCBiZSBkb25lIHdpdGhv
dXQgdGhlIGNvb3BlcmF0aW9uIG9mIHRoZSBndWVzdC4KPiBZZXMsIHRoZSBQMk0gd2lsbCBjaGFu
Z2UgYW5kIHRoaXMgaXMgdmlzaWJsZSB0byB0aGUgZ3Vlc3QsIGJ1dCBkb2VzIGEgUFYgZ3Vlc3Qg
bmVlZCB0byB0YWtlIGFjdGlvbiB3aGVuIHRoaXMgb2NjdXJzPyBJJ20gbm90IHN1cmUuCgpDb25z
aWRlciBhIG5vbi1jb29wZXJhdGl2ZSBtaWdyYXRpb24gaGFwcGVuaW5nIHRvIG9jY3VyIGJldHdl
ZW4gZS5nLgpyZWFkaW5nIGEgUFRFIGFuZCBsb29raW5nIGl0IHVwIGluIHRoZSBNMlAuCgpJJ20g
c3VyZSB0aGVyZSBhcmUgb3RoZXIgY2FzZXMgd2hlcmUgY2hhb3Mgd291bGQgcmVpZ24uCgo+PiBU
aGUgc2ltcGxlIGZhY3QgaXMgdGhhdCBpbnZvbHZpbmcgdGhlIGd1ZXN0IGtlcm5lbCBhZGRzIHVu
bmVjZXNzYXJ5Cj4+IG1vdmluZyBwYXJ0cyB3aGljaCBjYW4gKGFuZCBkbyB3aXRoIGEgbm9uLXpl
cm8gcHJvYmFiaWxpdHkpIGdvIHdyb25nLgo+Pgo+IFllcywgaGF2aW5nIHdyaXR0ZW4gdGhlIGZy
b250ZW5kIHNpZGUgb2YgbWlncmF0aW9uIGluIHRoZSBXaW5kb3dzIGRyaXZlcnMgaXQgaXMgKnZl
cnkqIGhhcmQgdG8gZ2V0IHJpZ2h0LCBwYXJ0aWN1bGFybHkgaW4gV2luZG93cyB3aGVyZSBvbmUg
aGFzIHRvIGRlYWwgd2l0aCB0aGUgY29tcGxleCBhbmQgYXN5bmNocm9ub3VzIFBuUCBzdWJzeXN0
ZW0gY29sbGlkaW5nIHdpdGggYSBtaWdyYXRpb24uIFRoZSBuZXR3b3JrIGRyaXZlciBhbHNvIHJl
cXVpcmVzIGEgbXVsdGktcmVhZGVyL3NpbmdsZS13cml0ZXIgbG9jayB3aXRoIG9kZCBzZW1hbnRp
Y3MgKHcuci50LiB0byBJUlFMKSB3aGljaCBJIGhhZCB0byBjb2RlIG15c2VsZiAoaHR0cHM6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXB2ZHJpdmVycy93aW4veGVudmlmLmdpdDthPWJsb2I7
Zj1zcmMveGVudmlmL21yc3cuaCkuIEl0IHRvb2sgeWVhcnMgb2YgZml4aW5nIHN1YnRsZSByYWNl
cyAoaW4gdGhhdCBhbmQgZWxzZXdoZXJlKSB0byBnZXQgdG8gdGhlIChBRkFJSykgcmVsaWFibGUg
Y29kZSB3ZSBoYXZlIG5vdy4gCj4gQXZvaWRpbmcgZXhlY3V0aW9uIG9mIGNvZGUgbGlrZSB0aGlz
IChpbiBhbGwgT1MpIGNlcnRhaW5seSBhdm9pZHMgdGhlIG9wcG9ydHVuaXR5IGZvciBzdWJ0bGUg
YnVncyB0byBtYW5pZmVzdCB0aGVtc2VsdmVzLgoKVGhlcmUgYXJlIGEgbnVtYmVyIG9mIHRoaW5n
cyBpbiB0aGUgZ3Vlc3QgQVBJL0FCSSB3aGljaCBhcmUgcGFydGljdWxhcmx5CnBvb3IgaW4gcmV0
cm9zcGVjdC7CoCBUaGV5IGFsbCBuZWVkIHRvIGdvLgoKPgo+Pj4gK0JlY2F1c2UgdGhlIHNlcnZp
Y2UgZG9tYWlu4oCZcyBkb21pZCBpcyB1c2VkIGRpcmVjdGx5IGJ5IHRoZSBndWVzdCBpbgo+PiBz
ZXR0aW5nCj4+PiArdXAgZ3JhbnQgZW50cmllcyBhbmQgZXZlbnQgY2hhbm5lbHMsIHRoZSBiYWNr
ZW5kIGRyaXZlcnMgaW4gdGhlIG5ldwo+PiBob3N0Cj4+PiArZW52aXJvbm1lbnQgbXVzdCBiZSBw
cm92aWRlZCBieSBzZXJ2aWNlIGRvbWFpbiB3aXRoIHRoZSBzYW1lIGRvbWlkLgo+PiBBbHNvLAo+
Pj4gK2JlY2F1c2UgdGhlIGd1ZXN0IGNhbiBzYW1wbGUgaXRzIG93biBkb21pZCBmcm9tIHRoZSBm
cm9udGVuZCBhcmVhIGFuZAo+PiB1c2UgaXQgaW4KPj4+ICtoeXBlcmNhbGxzIChlLmcuIEhWTU9Q
X3NldF9wYXJhbSkgcmF0aGVyIHRoYW4gRE9NSURfU0VMRiwgdGhlIGd1ZXN0Cj4+IGRvbWlkIG11
c3QKPj4+ICthbHNvIGJlIHByZXNlcnZlZCB0byBtYWludGFpbiB0aGUgQUJJLgo+PiBIYXMgdGhp
cyBiZWVuIHRydWUgc2luY2UgZm9yZXZlcj/CoCBUaGUgZ3JhbnQgYW5kIGV2ZW50IEFQSXMgdG9v
ayBzb21lCj4+IGNhcmUgdG8gYXZvaWQgdGhlIGd1ZXN0IG5lZWRpbmcgdG8ga25vdyBpdHMgb3du
IGRvbWlkLgo+Pgo+IFRoZSBndWVzdCBkb2Vzbid0IG5lZWQgdG8ga25vdyBpdHMgZG9taWQ7IERP
TUlEX1NFTEYgd2lsbCB3b3JrLCBidXQgdGhlIGd1ZXN0ICpjYW4qIHVzZSBpdHMgb3duIGRvbWlk
IGluIHRoaXMgY2FzZSAod2hlcmVhcyBJIHRoaW5rIGdyYW50IGFuZCBldmVudCBvcHMgd2lsbCBp
bnNpc3Qgb24gRE9NSURfU0VMRiB1bmxlc3MgcmVmZXJyaW5nIHRvIGFub3RoZXIgZG9tYWluKS4g
QXMgZmFyIGFzIEkga25vdyB0aGlzIGhhcyBiZWVuIHRoZSBjYXNlIHNpbmNlIGZvcmV2ZXIgYW5k
IHNvIEkgZG9uJ3QgdGhpbmsgaXQgaXMgc29tZXRoaW5nIHdlIGNhbiBjaGFuZ2Ugbm93IHVubGVz
cyB3ZSBtb3ZlIHRvIGEgbmV3IEFCSS4KClRoYXQgc21lbGxzIHJhdGhlciBsaWtlIHN0dWItcWVt
dSByZWFzb25zLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
