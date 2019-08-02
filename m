Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DA47FDBF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:41:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZdo-0003zU-4t; Fri, 02 Aug 2019 15:38:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FvgH=V6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1htZdm-0003zJ-R1
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:38:46 +0000
X-Inumbo-ID: 9cd6f762-b53b-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9cd6f762-b53b-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:38:45 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PYyZhUg/o8Qt/vZAAQjQE9FEKfcKM01v63h6+1RTJY7F3j2NkIqNQg9QLXwqDT9bOYyudMWsnn
 cS5WTOeO/jD2Lio8pgeXuZPAOHJd+7fi0Z1H4B5lOVjD22cSqDImtgco5NlPr7KEOpPtZakRHt
 37kyKfAMc+NLpJhuUEz8jOZ9zNnAyGR6oiWT6bO/6vm1jo8QNYfg203zU5Enwzf/eYpR1EG7lB
 qELJ+aHB9lTridnMMenOBXk4s/0er5qARL+oeEuBP7WFz4bjsgSr9VYW5SyaT+NdX7Ba63Susf
 jAg=
X-SBRS: 2.7
X-MesageID: 3796752
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3796752"
To: Nicholas Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
 <c1c1663b-81ea-4704-e21e-c27a6d5999ba@citrix.com>
 <3da1f8bd6ee94d03b76d9f54e16de8a5@ainfosec.com>
 <da37ddde-0148-7e91-5dba-276df823d895@citrix.com>
 <bb81297d6d7441399425fd6079ac8bb7@ainfosec.com>
 <24acd142b70345038dc0dfdd61bb9520@ainfosec.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <76c02038-fcce-2774-c4f5-73ab9e0fdeef@citrix.com>
Date: Fri, 2 Aug 2019 16:38:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <24acd142b70345038dc0dfdd61bb9520@ainfosec.com>
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
Cc: "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 Brendan Kerrigan <kerriganb@ainfosec.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xLzE5IDc6NTkgUE0sIE5pY2hvbGFzIFJvc2Jyb29rIHdyb3RlOgo+PiBXaXRoIHRoYXQg
c2FpZCwgd2hhdCBhcmUgeW91ciBleHBlY3RhdGlvbnMgZm9yIHRoZSBnZW5lcmF0ZWQgR28gY29k
ZSBhdCB0aGlzIHBvaW50Pwo+PiBEbyB5b3UgdGhpbmsgd2Ugc2hvdWxkIHRyeSB0byBnZW5lcmF0
ZSB0aGUgcGllY2VzIHRoYXQgY2FsbCBpbnRvIGxpYnhsPyBPciwgZG8geW91IHRoaW5rCj4+IHRo
ZSBjb2RlIGdlbmVyYXRpb24gc2hvdWxkIGJlIGxpbWl0ZWQgdG8gdGhlIHN0cnVjdHMgYW5kIGJv
aWxlci1wbGF0ZSBDIDwtPiBHbyAidHlwZQo+PiBtYXJzaGFsaW5nPyIKPiAKPiBbLi4uXQo+IAo+
PiBJIHRoaW5rIHdlIGhhdmUgYSBkZWNlbnQgZW5vdWdoIGlkZWEgZm9yIHdoYXQgYSBjLWZvci1n
byB2ZXJzaW9uIG9mIHRoaXMgbWlnaHQgbG9vayBsaWtlLiBTbywKPj4gd2hhdCBhcmUgdGhlIG5l
eHQgc3RlcHMgaW4gZXhwbG9yaW5nIHRoZSBjdXN0b20gZ2VuZXJhdG9yIHJvdXRlPwo+IAo+IFNv
cnJ5IHRvIGFuc3dlciBteSBvd24gcXVlc3Rpb24sIGJ1dCBJIHdhbnRlZCB0byBmb2xsb3cgdXAg
d2l0aCBzb21lIHRob3VnaHRzIEkgY2FtZSB1cAo+IHdpdGggYWZ0ZXIgSSBzZW50IG15IGxhc3Qg
ZW1haWwuCj4gCj4gSSB0aGluayBtYXliZSB3ZSBzaG91bGQgdGFrZSB0aGUgc2ltcGxlciBhcHBy
b2FjaC4gTWVhbmluZywgdGhlIEdvIHBhY2thZ2Ugd291bGQgYmUKPiBjb25zdHJ1Y3RlZCBhcyBm
b2xsb3dzOgo+IAo+IDEuIEdlbmVyYXRlZCBjb2RlIGZvciBHbyB0eXBlcyB0aGF0IGFyZSBhbmFs
b2dvdXMgdG8gdGhlIEMgbGlieGwgdHlwZXMuIFRoZSBJREwgc2hvdWxkCj4gYWxyZWFkeSBiZSBh
YmxlIHRvIHByb3ZpZGUgZW5vdWdoIGluZm9ybWF0aW9uIGZvciBhIHNpbXBsZSBHbyBjb2RlIGdl
bmVyYXRvciAobGlrZSBnZW50eXBlcy5weSkuCj4gCj4gMi4gR2VuZXJhdGVkIGNvZGUgdG8gaGFu
ZGxlIHRoZSBtYXJzaGFsaW5nIGJldHdlZW4gdGhlIHB1cmUtR28gdHlwZXMgYW5kIHRoZSBDIHR5
cGVzLiBXZQo+IGNvdWxkIHRhaWxvciB0aGlzIHBpZWNlIHRvIGFkZHJlc3MgdGhlIHNob3J0LWNv
bWluZ3Mgb2YgYy1mb3ItZ28sIGUuZy4gdGhlIG51bV9kaXNrcyBpc3N1ZSwgcHJldmVudGluZwo+
IHVzZS1hZnRlci1mcmVlLCBldGMuCj4gCj4gMy4gSGFuZC13cml0dGVuIHdyYXBwZXJzLiBBcyB5
b3Ugc3RhdGVkIGJlZm9yZSwgdGhlcmUgaXMgbm90IG11Y2ggZGlmZmVyZW5jZSBiZXR3ZWVuIHRo
ZSBpbi10cmVlCj4gYmluZGluZ3MgY2FsbGluZyBDLmxpYnhsX2RvbWFpbl9pbmZvLCBhbmQgbXkg
d3JhcHBlcnMgY2FsbGluZyBkb21haW5JbmZvKCkgKGJlc2lkZXMgdGhlIGFkZGl0aW9uYWwKPiBs
YXllciBpbiBtaW5lKS4gQW5kLCB3ZSBhZ3JlZSB0aGF0IHdyaXRpbmcgdGhvc2Ugc2ltcGxlIHdy
YXBwZXJzIGlzIHByZXR0eSBwYWlubGVzcy4KPiAKPiBJIHRoaW5rIHRoaXMgaXMgbW9yZSBvciBs
ZXNzIHdoYXQgeW91IGhhdmUgYmVlbiBzdWdnZXN0aW5nLCBidXQgSSB3YW50ZWQgdG8gYXJ0aWN1
bGF0ZSB0aGUgcG9pbnQgdGhhdAo+IEkgdGhpbmsgaWYgd2UgZ28gd2l0aCBhIGN1c3RvbSBnZW5l
cmF0b3IsIHdlIHNob3VsZCBub3QgdHJ5IGRvIGFzIG11Y2ggYXMgYy1mb3ItZ28gaXMgdHJ5aW5n
IGRvLgoKSSB3YXMgZ29pbmcgdG8gc2F5LCB0aGUgaWRlYSBvZiBhZGRpbmcgZnVuY3Rpb24gc2ln
bmF0dXJlcyB0byB0aGUgSURMCndhcyBqdXN0ICJleHBsb3JpbmcgdGhlIHN0YXRlIHNwYWNlIiBv
ZiBhcHByb2FjaGVzLiAgUGFyc2luZyB0aGUKZXhpc3RpbmcgSURMIHRvIHNwaXQgb3V0IEdvIHN0
cnVjdHVyZXMgYW5kIG1hcnNoYWxsaW5nIHNob3VsZCBiZQpyZWFzb25hYmx5IHN0cmFpZ2h0Zm9y
d2FyZC4gIERlc2lnbmluZyBhbiBJREwgZm9yIHRoZSBmdW5jdGlvbnMgaXMgYQpmYWlybHkgbGFy
Z2UgZGVzaWduIHByb2plY3QsIHdpdGggYWxsIHNvcnRzIG9mIGV4Y2l0aW5nCjxzdHJpa2V0aHJv
dWdoPmJpa2Ugc2hlZHMgdG8gcGFpbnQ8L3N0cmlrZXRocm91Z2g+IGltcG9ydGFudCBkZXNpZ24K
ZGVjaXNpb25zIHRvIG1ha2UgYWxvbmcgdGhlIHdheTogcHJvYmFibHkgc29tZXRoaW5nIHRvIGF0
dGVtcHQgaWYgLyB3aGVuCndlIGRldGVybWluZSB0aGF0IGl0J3Mgd29ydGggdGhlIGNvc3QuCgpJ
T1csIGluIHJlc3BvbnNlIHRvIEdQLCBJIHdhcyBnb2luZyB0byBjb3VudGVyLXN1Z2dlc3Qgd2hh
dCB5b3Ugc3VnZ2VzdAppbiB0aGlzIGVtYWlsLiA6LSkKCkFyZSB5b3UgdXAgZm9yIHRha2luZyBh
IHN0YWIgYXQgc29tZXRoaW5nIGxpa2UgYGdlbmdvdHlwZXMucHlgPwoKIC1HZW9yZ2UKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
