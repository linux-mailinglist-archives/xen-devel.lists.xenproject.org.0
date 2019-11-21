Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5592D1056EC
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 17:23:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXpC0-0002Dz-CL; Thu, 21 Nov 2019 16:20:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YOoV=ZN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iXpBz-0002Du-5O
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 16:20:27 +0000
X-Inumbo-ID: d2dbad18-0c7a-11ea-9631-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2dbad18-0c7a-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574353225;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=E+zYCQrmwdu0LCEUolcIT9kvqsNWLjgY/Ke108QawKw=;
 b=Wz5UT26hgjqXq1xdHP28MtMc0K59x820Wst47q7DHaAp8u84/rnN0K1k
 5L0DNsg/DS98Q74vNlh3iEDo/6w3zQ6mflvF7sM0XcbYgeAjiuni41gZy
 b5L5RSwcWRPbuESYZnUxgJvVXCS/QG3N8cbEpv/moKYxGjj60UyRhY6zx Q=;
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
IronPort-SDR: BHhMAhXREc7G3dwzEkz5FvOJsQ8tXX38Am9zCdGo3pBg00vnNs69L4A9woKuKX3GqCabPLm2Oh
 Dyv/mW+I/XUOf7TJyv+N1xtb16oAqtQ9ev+YO+oRec3orUr46E7kD3lnhnHnd62wCi9cWnaHqV
 JicsJyYtOZXZbsr7kKKlNh0YBxMAlsXLyI01HQ2YRH+Npw2KRHj2hMYmqYRCqtjvm2J/jgz81V
 hgnVn4MQ2+KiOmrq2zEhomYTEHWjpxRrMGlORgJeDj/Mu5CI7n2LYBDpM6TtFVzKO7LsnMEdH6
 RGM=
X-SBRS: 2.7
X-MesageID: 9209521
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,226,1571716800"; 
   d="scan'208";a="9209521"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8c734852-b260-06c1-2bb1-fd2f1bc6ce86@citrix.com>
Date: Thu, 21 Nov 2019 16:20:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Status of 4.13
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
 Julien Grall <julien.grall@arm.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEvMTEvMjAxOSAwNjowNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBXaGVyZSBkbyB3ZSBz
dGFuZCB3aXRoIFhlbiA0LjEzIHJlZ2FyZGluZyBibG9ja2VycyBhbmQgcmVsYXRlZCBwYXRjaGVz
Pwo+Cj4gMS4gT1NTdGVzdCBmYWlsdXJlIHJlZ2FyZGluZyBuZXN0ZWQgdGVzdDoKPiDCoMKgIEkn
bSBub3QgcXVpdGUgc3VyZSB3aGV0aGVyIHRoZSBjdXJyZW50bHkgZGViYXRlZCBwYXRjaCBvZiBB
bmRyZXcgaXMKPiDCoMKgIGZpeGluZyB0aGUgcHJvYmxlbS4gSWYgbm90LCBkbyB3ZSBrbm93IHdo
YXQgaXMgbWlzc2luZyBvciBob3cgdG8KPiDCoMKgIGFkZHJlc3MgdGhlIGlzc3VlPyBJZiB5ZXMs
IGNvdWxkIHdlIHBsZWFzZSBjb21lIHRvIGFuIGFncmVlbWVudD8KPiDCoMKgIEFzIGFuIGFsdGVy
bmF0aXZlOiBhbnkgdGhvdWdodHMgYWJvdXQgaWdub3JpbmcgdGhpcyB0ZXN0IGZhaWx1cmUgZm9y
Cj4gwqDCoCA0LjEzLVJDMyAoSU9XOiBkb2luZyBhIGZvcmNlIHB1c2gpPwoKQmFyZSBpbiBtaW5k
IHRoYXQgdGhlIGFuc3dlciB0byB0aGlzIHF1ZXN0aW9uIGlzbid0IGZvciA0LjEzLsKgIEl0IGlz
IGZvcgpYU0EtMzA0IGluIGdlbmVyYWwsIGFjcm9zcyBhbGwgdGhlIHNlY3VyaXR5IHN1cHBvcnRl
ZCB0cmVlcy4KCk5lc3RlZCB2aXJ0IGlzIGV4cGVyaW1lbnRhbCwgd2l0aCBubyBzdXBwb3J0IG9y
IHNlY3VyaXR5IHN1cHBvcnQsIGhhcwprbm93bi9zdXNwZWN0ZWQgcHJpdmlsZWdlIGVzY2FsYXRp
b24gaG9sZXMgdG8gTDAgaW4sIGFuZCBpcyB1bnVzYWJsZQpicm9rZW4gb3V0c2lkZSBvZiB0aGUg
Y29ybmVyIGNhc2UgdGhhdCBPU1MgdGVzdHMgKHdoZXJlIFhlbiBhbmQgaXRzCm5lc3RlZCBzZWxm
IG1ha2UgaWRlbnRpY2FsIGRlY2lzaW9ucyBnaXZlbiBzaW1pbGFyIGlucHV0cykuCgpUaGUgb25s
eSBsZWcgT1NTVGVzdCBoYXMgdG8gc3RhbmQgb24gaGVyZSBpcyAid2Ugc2hvdWxkbid0IHJlZ3Jl
c3MKZnVuY3Rpb25hbGl0eSIgd2hpY2ggaXMgZmFpciBlbm91Z2ggaW4gcHJpbmNpcGxlLCBidXQg
bm90IGluIGxpbmUgd2l0aAp0aGUgbGV2ZWwgb2Ygc3VwcG9ydCB3ZSBvZmZlciBvbiBleHBlcmlt
ZW50YWwgZmVhdHVyZXMuCgpUaGF0IHNhaWQsIEkgYXMgd2VsbCBhcyBwbGVudHkgb2Ygb3RoZXJz
IGRvIHVzZSBuZXN0ZWQgdmlydCBldmVuIGlmIG9ubHkKZm9yIGRldmVsb3BtZW50IHB1cnBvc2Vz
LCBhbmQgSSdkIHByZWZlciBub3QgdG8gc2VlIGl0IHJlZ3Jlc3NlZC7CoCBBZnRlcgpzZXZlcmFs
IGRheXMgb2Ygd29ya2luZyBvbiB0aGUgaXNzdWUsIHRoZSBwYXRjaCBJIHBvc2VkIGlzIGZvciBv
bmUKZGVmaW5pdGUgYnVnIGluIG5lc3RlZCBwYWdld2Fsa2luZywgYW5kIGFzIGZhciBhcyBJJ20g
Y29uY2VybmVkLCBpdApzdGFuZHMgb24gaXRzIG93biBtZXJpdC4KCkl0IGRvZXNuJ3QgZml4IHRo
ZSByZWdyZXNzaW9uLCBhbmQgSSBjYW4ndCBmaW5kIGEgZmVhc2libGUgd2F5IG9mIGRvaW5nCnNv
IGluIGEgbWFubmVyIHdoaWNoIHdvdWxkIGJlIGFwcHJvcHJpYXRlIHRvIHJlLWlzc3VlIGluIFhT
QS0zMDQuwqAKbmVzdGVkaGFwX3dhbGtfTDBfcDJtKCkgaW4gaXRzIGN1cnJlbnQgZm9ybSBpcyBz
aW1wbHkgbm90IGZpdCBmb3IgcHVycG9zZS4KClVwb24gd3JpdGluZyB0aGlzLCBvbmUgb3RoZXIg
YWx0ZXJuYXRpdmUgaGFzIHByZXNlbnRlZCBpdHNlbGYuwqAgRG9uJ3QKdXNlIE5YIHN1cGVycGFn
ZXMgZm9yIGd1ZXN0cyB3aXRoIG5lc3RlZCB2aXJ0IGVuYWJsZWQuwqAgVGhlIEwxCmh5cGVydmlz
b3IgaXMgYWxyZWFkeSBjYXBhYmxlIG9mIGRvaW5nIHdvcnNlIHRoYW4gRG9TJ2luZyB0aGUgaG9z
dCwgc28KdGhlIG92ZXJhbGwgc2VjdXJpdHkgaXMgbm90IHJlZHVjZWQgYnkgdGhpcyBhcHByb2Fj
aC4KCj4gMy4gUGVuZGluZyBwYXRjaGVzIGZvciA0LjEzOgo+IMKgwqAgQ291bGQgSSBwbGVhc2Ug
aGF2ZSBmZWVkYmFjayB3aGljaCBwYXRjaGVzIHRhZ2dlZCBhcyAiZm9yLTQuMTMiIGFyZQo+IMKg
wqAgZml4aW5nIHJlYWwgcmVncmVzc2lvbnMgb3IgaXNzdWVzPyBJIGRvbid0IHdhbnQgdG8gdGFr
ZSBhbnkgcGF0Y2hlcwo+IMKgwqAgbm90IGZpeGluZyByZWFsIHByb2JsZW1zIGFmdGVyIFJDMywg
YW5kIEkgaG9wZSB0byBiZSBhYmxlIHRvIGdldCBhCj4gwqDCoCBwdXNoIHJhdGhlciBzb29uZXIg
dGhhbiBsYXRlciB0byBiZSBhYmxlIHRvIGxldCBJYW4gY3V0IFJDMy4KCk9mIG9uZXMgbm90IGFs
cmVhZHkgaWRlbnRpZmllZCBpbiB2YXJpb3VzIHRocmVhZHMsCgoieDg2L2xpdmVwYXRjaDogUHJl
dmVudCBwYXRjaGluZyB3aXRoIGFjdGl2ZSB3YWl0cXVldWVzIi7CoCBUaGlzIGlzIGEKZnVsbHkg
cmV2aWV3ZWQgYnVnZml4IHdhaXRpbmcgZm9yIGEgcmVsZWFzZSBhY2suwqAgUGF0Y2hlcyAxIGFu
ZCAyIGluIHRoZQpzZXJpZXMgYXJlIGluZGVwZW5kZW50LCBhbmQgMiBpcyB0aGUgaW1wb3J0YW50
IG9uZS4KCiJ4ZW46IERyb3AgYm9ndXMgQk9PTEVBTiBkZWZpbml0aW9ucywgVFJVRSBhbmQgRkFM
U0UiLsKgIEkgbmVlZCB0byBjaGVjawp3aGVyZSB0aGUgbmV4dCBhY3Rpb25zIGxpZSBoZXJlLgoK
Inhlbi92Y3B1OiBTYW5pdGlzZSBWQ1BVT1BfaW5pdGlhbGlzZSBjYWxsIGhpZXJhY2h5Ii7CoCBU
aGlzIGlzIFhTQS0yOTYKZm9sbG93dXAgYW5kIFJGQyBmb3ItNC4xMyB3aXRoIG5vIGNvbW1lbnRz
IGZvci9hZ2FpbnN0LsKgIFRoaXMgaGFzIGFsc28Kc3RhbGxlZCB3aXRoIG5vIGFja3MsIG5vIGNv
bmNyZXRlIHN1Z2dlc3Rpb24gZm9yIGNoYW5nZXMgb3Igd2F5cyBmb3J3YXJkLgoKPgo+IDQuIEFy
ZSB0aGVyZSBhbnkgYmxvY2tlcnMgZm9yIDQuMTMgb3RoZXIgdGhhbiAxLiBhbmQgMi4gKGFwYXJ0
IG9mIGFueQo+IMKgwqAgcGVuZGluZyBYU0FzKT8KCkkgc3RpbGwgbmVlZCB0byByZWZyZXNoIHRo
ZSBzaGltIGNvbmZpZywgdG8gYXQgbGVhc3QgZGlzYWJsZSB0cmFjZWJ1ZmZlcgpmdW5jdGlvbmFs
aXR5IGFzIGl0IGlzIG5vdyBzZWxlY3RhYmxlIGFuZCBub3QgdXNhYmxlLsKgIEkgdGhpbmsgdGhl
cmUgaXMKYSBsdXJraW5nIG1ha2VmaWxlIHJhY2UgY29uZGl0aW9uLgoKQWxzbyBzb21lIGRvY3Mg
cGF0Y2hlcyAobGljZW5zaW5nIGluIHBhcnRpY3VsYXIpIGJ1dCB0aGF0IGNhbiB3YWl0IHVudGls
Cm90aGVyIGZpeGVzIGFyZSBzb3J0ZWQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
