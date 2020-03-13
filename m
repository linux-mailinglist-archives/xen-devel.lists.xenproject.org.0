Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C9E184BFD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 17:07:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCmmc-0000xG-Gx; Fri, 13 Mar 2020 16:03:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDBU=46=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jCmma-0000x9-W7
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 16:03:33 +0000
X-Inumbo-ID: 2f3634b2-6544-11ea-a6c1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f3634b2-6544-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 16:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584115411;
 h=subject:to:references:cc:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ur7z3hy8UHxmJepmkDOffF5d3pKAWhAsed3WGW80Tx4=;
 b=eSZkJ3bKbxHStDbJg0oz3N4RmkbuFDKNrXNcJdoXa0tkdfBfVYvyJEUv
 jkVZ+ieeWyf/hSVncquatrUGzoD9fobn9wONSi+oh/XSQHLA9nh3+dkcg
 Nupf/owwUZ4ydE/3bdInH+hgGLb1LQsBskWAm1/GUFp2ApNk5XGfoxztZ 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8JhygFX0NY3ZgItRsUz2UXjHXRtf9C/pAgBmYa24LK5DBd5mXfIEvowVqWRq6k1mfU5tu8qJ44
 5y7fYKowIjFPB/rW4xE5yWyMLFdXvjEgsCvcBtH1OWd1n1rdmTsaABXwbWFv3z0IO2Xb1YMU1k
 HxEfYdjYYuduEHY12me7uJAG/0JosSTur61kxb8kTI+16nSamMjchh5La6T6NcqUHrafWT0EuM
 1So6SvnNPmSD8LFbfiKkQ+JADbHxJNVTmSil6sgaJf/I3Yk1jNvo46trvFHNdN6jmkBUO73KUr
 8fs=
X-SBRS: 2.7
X-MesageID: 14557747
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,549,1574139600"; d="scan'208";a="14557747"
To: osstest service owner <osstest-admin@xenproject.org>,
 <xen-devel@lists.xenproject.org>
References: <E1jCXgo-0003eI-LY@osstest.test-lab.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7598567f-9aff-2f5f-71c8-6a4352d9eea1@citrix.com>
Date: Fri, 13 Mar 2020 16:03:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <E1jCXgo-0003eI-LY@osstest.test-lab.xenproject.org>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [linux-linus bisection] complete
 test-amd64-amd64-qemuu-nested-intel
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDMvMjAyMCAyMzo1Niwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+IGJyYW5j
aCB4ZW4tdW5zdGFibGUKPiB4ZW5icmFuY2ggeGVuLXVuc3RhYmxlCj4gam9iIHRlc3QtYW1kNjQt
YW1kNjQtcWVtdXUtbmVzdGVkLWludGVsCj4gdGVzdGlkIGRlYmlhbi1odm0taW5zdGFsbC9sMS9s
Mgo+Cj4gVHJlZTogbGludXggZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LTIuNi5naXQKPiBUcmVlOiBsaW51eGZpcm13YXJlIGdpdDov
L3hlbmJpdHMueGVuLm9yZy9vc3N0ZXN0L2xpbnV4LWZpcm13YXJlLmdpdAo+IFRyZWU6IG92bWYg
Z2l0Oi8veGVuYml0cy54ZW4ub3JnL29zc3Rlc3Qvb3ZtZi5naXQKPiBUcmVlOiBxZW11IGdpdDov
L3hlbmJpdHMueGVuLm9yZy9xZW11LXhlbi10cmFkaXRpb25hbC5naXQKPiBUcmVlOiBxZW11dSBn
aXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcWVtdS14ZW4uZ2l0Cj4gVHJlZTogc2VhYmlvcyBnaXQ6Ly94
ZW5iaXRzLnhlbi5vcmcvb3NzdGVzdC9zZWFiaW9zLmdpdAo+IFRyZWU6IHhlbiBnaXQ6Ly94ZW5i
aXRzLnhlbi5vcmcveGVuLmdpdAo+Cj4gKioqIEZvdW5kIGFuZCByZXByb2R1Y2VkIHByb2JsZW0g
Y2hhbmdlc2V0ICoqKgo+Cj4gICBCdWcgaXMgaW4gdHJlZTogIHhlbiBnaXQ6Ly94ZW5iaXRzLnhl
bi5vcmcveGVuLmdpdAo+ICAgQnVnIGludHJvZHVjZWQ6ICBmOTZlMTQ2OWFkMDZiNjE3OTZjNjAx
OTNkYWFlYjlmOGE5NmQ3NDU4Cj4gICBCdWcgbm90IHByZXNlbnQ6IDA3Mjk4MzBjYzQyNWE4ZmYy
N2EzMTM3ZTg3YjkzNzY4YWUzYzg1M2MKPiAgIExhc3QgZmFpbCByZXBybzogaHR0cDovL2xvZ3Mu
dGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0ODQ5Ni8KPgo+Cj4gICBjb21t
aXQgZjk2ZTE0NjlhZDA2YjYxNzk2YzYwMTkzZGFhZWI5ZjhhOTZkNzQ1OAo+ICAgQXV0aG9yOiBS
b2dlciBQYXUgTW9ubsODwqkgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ICAgRGF0ZTogICBXZWQg
RmViIDUgMTM6NDk6MDkgMjAyMCArMDEwMAo+ICAgCj4gICAgICAgeDg2L3Z2bXg6IGZpeCB2aXJ0
dWFsIGludGVycnVwdCBpbmplY3Rpb24gd2hlbiBBY2sgb24gZXhpdCBjb250cm9sIGlzIHVzZWQK
PiAgICAgICAKPiAgICAgICBXaGVuIGRvaW5nIGEgdmlydHVhbCB2bWV4aXQgKGllOiBhIHZtZXhp
dCBoYW5kbGVkIGJ5IHRoZSBMMSBWTU0pCj4gICAgICAgaW50ZXJydXB0cyBzaG91bGRuJ3QgYmUg
aW5qZWN0ZWQgdXNpbmcgdGhlIHZpcnR1YWwgaW50ZXJydXB0IGRlbGl2ZXJ5Cj4gICAgICAgbWVj
aGFuaXNtIHVubGVzcyB0aGUgQWNrIG9uIGV4aXQgdm1leGl0IGNvbnRyb2wgYml0IGlzbid0IHNl
dCBpbiB0aGUKPiAgICAgICBuZXN0ZWQgdm1jcy4KPiAgICAgICAKPiAgICAgICBHYXRlIHRoZSBj
YWxsIHRvIG52bXhfdXBkYXRlX2FwaWN2IGhlbHBlciBvbiB3aGV0aGVyIHRoZSBuZXN0ZWQgdm1j
cwo+ICAgICAgIGhhcyB0aGUgQWNrIG9uIGV4aXQgYml0IHNldCBpbiB0aGUgdm1leGl0IGNvbnRy
b2wgZmllbGQuCj4gICAgICAgCj4gICAgICAgTm90ZSB0aGF0IHRoaXMgZml4ZXMgdGhlIHVzYWdl
IG9mIHgyQVBJQyBieSB0aGUgTDEgVk1NLCBhdCBsZWFzdCB3aGVuCj4gICAgICAgdGhlIEwxIFZN
TSBpcyBYZW4uCj4gICAgICAgCj4gICAgICAgU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
g8KpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAgICAgICBSZXZpZXdlZC1ieTogS2V2aW4gVGlh
biA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpMb29rcyBsaWtlIHRoZXJlIGFyZSBmdXJ0aGVyIHBy
b2JsZW1zIGhlcmUuwqAgSSdtIGFmcmFpZCBJIGhhdmVuJ3QKaW52ZXN0aWdhdGVkIGZ1cnRoZXIs
IGJ1dCB0aGlzIGFsc28gbWlnaHQgYmUgdGhlIHNvdXJjZSBvZiB0aGUKaW50ZXJtaXR0ZW50IHBy
b2JsZW1zIGluIHN0YWdpbmcuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
