Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB10F7ACE4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 17:53:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsUNm-0006wa-3K; Tue, 30 Jul 2019 15:49:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gbCZ=V3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hsUNj-0006wV-Ug
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 15:49:43 +0000
X-Inumbo-ID: a3d829bc-b2e1-11e9-a63f-e3192853f66c
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3d829bc-b2e1-11e9-a63f-e3192853f66c;
 Tue, 30 Jul 2019 15:49:40 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tiBH4aP3U07Le2zaYHciUVaA2IHZ87WFDT8ab3wgIXxoyZ2gpqmDWgVDnDoxhcZPuJoz56qe/Y
 Kf6Phi77MFQHOq1rxhaLGKpp93HNoJEIn+UR4cteXwFd2QmYDXPHwnQf1EgVL3WfYTh+K0HRQg
 2rQOsWYGbQ5c/em1iT7KABft5jRcLVuLFd4dO1NjlymDeNZTUbA6TO++rK4VCfFZinawnjiLeI
 qoStiV+T6kIXgLEkDcwRiEUu/QdXd2xDi5t1HR5b0vrbaqWU5vug8JvUK7xDGdcLFI/FKDq5h4
 Ij4=
X-SBRS: 2.7
X-MesageID: 3750978
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,327,1559534400"; 
   d="scan'208";a="3750978"
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Nicholas Rosbrook
 <rosbrookn@ainfosec.com>
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
 <CABfawhmhPy-BWwRfZ-+pB1Zr98ony9jeXoOEOx+HZBm_z+Ez=g@mail.gmail.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <93971fac-b839-802f-a508-39fa79478db5@citrix.com>
Date: Tue, 30 Jul 2019 16:49:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CABfawhmhPy-BWwRfZ-+pB1Zr98ony9jeXoOEOx+HZBm_z+Ez=g@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] Generating Go bindings for libxl
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
Cc: Brendan Kerrigan <kerriganb@ainfosec.com>, "wl@xen.org" <wl@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8zMC8xOSAyOjQ4IFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gVHVlLCBKdWwg
MzAsIDIwMTkgYXQgNzozMiBBTSBOaWNob2xhcyBSb3Nicm9vawo+IDxyb3Nicm9va25AYWluZm9z
ZWMuY29tPiB3cm90ZToKPj4KPj4gSGVsbG8sCj4+Cj4+IEFzIGEgZm9sbG93IHVwIHRvIHRoZSBw
cmVzZW50YXRpb24gdGhhdCBCcmVuZGFuIEtlcnJpZ2FuIGFuZCBJIGdhdmUgYXQgWGVuCj4+IHN1
bW1pdCBlYXJsaWVyIHRoaXMgbW9udGgsICJDbGllbnQgVmlydHVhbGl6YXRpb24gVG9vbHN0YWNr
IGluIEdvIiwgSSB3b3VsZCBsaWtlIHRvIG9wZW4KPj4gYSBkaXNjdXNzaW9uIGFyb3VuZCB0aGUg
ZGV2ZWxvcG1lbnQgb2YgR28gYmluZGluZ3MgZm9yIGxpYnhsLiBHZW9yZ2UgRHVubGFwLAo+PiBO
aWNvbGFzIEJlbG91aW4gYW5kIEkgaGF2ZSBoYWQgc29tZSBkaXNjdXNzaW9uIG9mZi1saW5lIGFs
cmVhZHkuCj4+Cj4+IFNvIGZhciwgdGhlc2UgYXJlIHRoZSB0b3BpY3Mgb2YgZGlzY3Vzc2lvbjoK
PiAKPiBIaSBOaWNob2xhcywKPiB0byBhZGQgdG8gdGhlIGxpc3Qgb2YgdG9waWNzIEkganVzdCB3
YW50IHRvIG1lbnRpb24gdGhhdCBwZXJoYXBzIGl0Cj4gbWF5IGJlIGJlbmVmaWNpYWwgdG8gY29u
c2lkZXIgcGFydHMgb2YgdGhlIGdvIGJpbmRpbmdzIG5vdCBnbyB0byBsaWJ4bAo+IGF0IGFsbC4g
SSBoYXZlIGJlZW4gZGlnZ2luZyB0aHJvdWdoIGxpYnhsIGZvciB0aGUgcGFzdCBjb3VwbGUgbW9u
dGhzCj4gYW5kIGl0J3MgYXN5bmNocm9ub3VzIGNhbGxiYWNrIHN5c3RlbSBpcyBkYW1uIG5lYXIg
aW1wb3NzaWJsZSB0bwo+IGZvbGxvdyBhbmQgSSBqdXN0IGNhbid0IHNoYWtlIHRoZSBmZWVsaW5n
IHRoYXQgaXQgd291bGQgYmUgYSBsb3QKPiBlYXNpZXIgdG8gZm9sbG93IGlmIGl0IHdhcyBpbiBn
by4KClNvIEkgZG9uJ3QgdGhpbmsgd2UncmUgZXZlciBnb2luZyB0byBzd2l0Y2ggdG8gZ29sYW5n
IGJlaW5nIG91ciBwcmltYXJ5CnRvb2xzdGFjayBsYW5ndWFnZSwgYmVjYXVzZSBjYWxsaW5nIGl0
IGZyb20gb3RoZXIgbGFuZ3VhZ2VzIGlzbid0IHJlYWxseQphbiBvcHRpb24uICBUaGF0IG1lYW5z
IHRoYXQgaW1wbGVtZW50aW5nIHRoaW5ncyBsaWtlIGRvbWFpbiBjcmVhdGlvbiBpbgpHbyBtZWFu
IGR1cGxpY2F0aW5nIGZ1bmN0aW9uYWxpdHkgaW4gdHdvIHBsYWNlcywgd2hpY2ggaXMKZXh0cmFv
cmRpbmFyaWx5IGV4cGVuc2l2ZSBmcm9tIGEgc29mdHdhcmUtZW5naW5lZXJpbmcgcGVyc3BlY3Rp
dmUuCgpGV0lXIEkgdGhpbmsgdGhlIGFzeW5jaHJvbm91cyBjYWxsYmFjayBzeXN0ZW0ganVzdCBu
ZWVkcyBiZXR0ZXIKZG9jdW1lbnRhdGlvbi4gIEl0IGFsd2F5cyB0YWtlcyBtZSBhIGxpdHRsZSBi
aXQgdG8gZ2V0IG15IGJlYXJpbmdzIGFnYWluCm9uY2UgSSBoYXZlIHRvIGNoYW5nZSB0aGF0IGNv
ZGUsIGJ1dCBvbmNlIEkgZG8sIGV2ZXJ5dGhpbmcgaXMKY29uc2lzdGVudC4gIEFuZCBhcyBJIHVu
ZGVyc3RhbmQgaXQsIHRoZSBleHRlcm5hbCBpbnRlcmZhY2Ugd2FzIHdyaXR0ZW4KcHJpbWFyaWx5
IHdpdGggbGlidmlydCBpbiBtaW5kLCBzbyBpdCB3b3VsZCBwcm9iYWJseSBiZSBkaWZmaWN1bHQg
dG8KY2hhbmdlIGl0IHdoaWxlIHJlbWFpbmluZyBjb21wYXRpYmxlLgoKPiBOb3QgdG8gbWVudGlv
biB0aGUgcGVyZm9ybWFuY2UKPiBpc3N1ZXMgd2l0aCB0aGUgYnVpbHQtaW4gZ2FyYmFnZSBjb2xs
ZWN0b3IKCldoYXQgcGVyZm9ybWFuY2UgaXNzdWVzIHdlcmUgeW91IHNlZWluZyB3aXRoIGxpYnhs
J3MgZ2FyYmFnZSBjb2xsZWN0b3I/CkkgdGhvdWdodCBpdCBqdXN0IGtlcHQgYSBsaXN0IG9mIHBv
aW50ZXJzIGFuZCBmcmVlZCB0aGVtIGF0IHRoZSB2ZXJ5IGVuZC4KCj4gYW5kIGZvcmsvZXhlYyBw
YXJ0cy4KClNpbmNlIHdlIG9ubHkgZm9yay9leGVjIHdoZW4gd2UgbmVlZCB0byBkbyBzbywgdGhp
cyBwYXJ0IHdvdWxkIHByb2JhYmx5CmJlIHRoZSBzYW1lIG5vIG1hdHRlciB3aGF0IGxhbmd1YWdl
IGl0IHdhcyBkb25lIGluLgoKVGhhdCBzYWlkLCB2ZXJ5IGxpdHRsZSBvZiB0aGlzIGhhcyBoYWQg
bXVjaCBwZXJmb3JtYW5jZSBhbmFseXNpcyAtLSBpZgp0aGlzIGlzIGltcG9ydGFudCB0byB5b3Us
IEknbSBzdXJlIHRoZXJlJ3MgbG90cyBvZiBsb3ctaGFuZ2luZyBmcnVpdCBpbgp0ZXJtcyBvZiBp
bXByb3ZlbWVudHMgd2UgY291bGQgbWFrZS4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
