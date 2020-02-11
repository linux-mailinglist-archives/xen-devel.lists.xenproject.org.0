Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9DB158B9D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 10:10:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1RW5-0005MJ-O6; Tue, 11 Feb 2020 09:07:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pFJM=37=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1j1RW4-0005ME-Fd
 for xen-devel@lists.xen.org; Tue, 11 Feb 2020 09:07:36 +0000
X-Inumbo-ID: f0c5b648-4cad-11ea-b533-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0c5b648-4cad-11ea-b533-12813bfff9fa;
 Tue, 11 Feb 2020 09:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581412054;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3nOu+l1T13qrC5vyUhoqeu1bKt/xZ4rQ5vuSL9rY1k8=;
 b=ObWf5MLv6R8OjAzFSq3HtVbsfgQTo2qbvjK7p++wWF9UoZpe+EY+niZq
 nojNLFEn1j6mI/gNUZiBDZmbASEgazow5FSfboFO1eWK54Ebbt0pffkkD
 LjbeE/ozU/PjoKd4Yu4Z6dkogWliIQSemUEMGw5cI5joLx9wClmae6iRy o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 59vo/OksJ0be3htkSftePUwtI6YI59elDjkGyS877ikvWeyd/XnUWLojGzSECHrae0Zls4hA17
 g2EgQSzh1ADrLGKpc2FZ6b7IzboKHvadSTe/pQMSvCM6ox3bVurv7Wjaw+799WFk6oZGxhhcQ9
 Hcpt5GRMtcf0AM1ycIOFUSH2AwwN7zL6YLCqOzEG0vb1M5u3IDt1+VhSOMdHE+sQg0VF1gn3jJ
 s33NCO0pc6rPDY3CtduN/RXnQmvy6uLxwyGt4r4wAz49cPH5E7s800vW1ZlSf7Jl/rTyOxoKQG
 G7Y=
X-SBRS: 2.7
X-MesageID: 12262572
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12262572"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Xen-devel
 <xen-devel@lists.xen.org>
References: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
 <6a3aa771-927b-b3bd-dd05-1eea90b0a97f@suse.com>
 <6f3a1061-fd05-91e8-54ad-666ec3984ffb@citrix.com>
 <c5831cef-ff27-93e5-7536-2d6092ca1ad8@citrix.com>
 <38a28a9d-cc99-0776-1f8b-4103df3d3e9c@suse.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <9bff11d5-3b14-d57e-adc9-5d923297c3a0@citrix.com>
Date: Tue, 11 Feb 2020 09:07:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <38a28a9d-cc99-0776-1f8b-4103df3d3e9c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Live-Patch application failure in core-scheduling
 mode
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
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDIvMjAyMCAwODowNCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNi4wMi4yMCAx
NTowMiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gT24gMDYvMDIvMjAyMCAxMTowNSwgU2VyZ2V5
IER5YXNsaSB3cm90ZToKPj4+IE9uIDA2LzAyLzIwMjAgMDk6NTcsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6Cj4+Pj4gT24gMDUuMDIuMjAgMTc6MDMsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4+IEhl
bGxvLAo+Pj4+Pgo+Pj4+PiBJJ20gY3VycmVudGx5IGludmVzdGlnYXRpbmcgYSBMaXZlLVBhdGNo
IGFwcGxpY2F0aW9uIGZhaWx1cmUgaW4gY29yZS0KPj4+Pj4gc2NoZWR1bGluZyBtb2RlIGFuZCB0
aGlzIGlzIGFuIGV4YW1wbGUgb2Ygd2hhdCBJIHVzdWFsbHkgZ2V0Ogo+Pj4+PiAoaXQncyBlYXNp
bHkgcmVwcm9kdWNpYmxlKQo+Pj4+Pgo+Pj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTI4MzA1XSBs
aXZlcGF0Y2g6IGxwOiBDUFU4IC0gSVBJaW5nIHRoZSBvdGhlciAxNSBDUFVzCj4+Pj4+ICAgICAg
IChYRU4pIFsgIDM0Mi41NTgzNDBdIGxpdmVwYXRjaDogbHA6IFRpbWVkIG91dCBvbiBzZW1hcGhv
cmUgaW4gQ1BVIHF1aWVzY2UgcGhhc2UgMTMvMTUKPj4+Pj4gICAgICAgKFhFTikgWyAgMzQyLjU1
ODM0M10gYmFkIGNwdXM6IDYgOQo+Pj4+Pgo+Pj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTU5Mjkz
XSBDUFU6ICAgIDYKPj4+Pj4gICAgICAgKFhFTikgWyAgMzQyLjU1OTU2Ml0gWGVuIGNhbGwgdHJh
Y2U6Cj4+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41NTk1NjVdICAgIFs8ZmZmZjgyZDA4MDIzZjMw
ND5dIFIgY29tbW9uL3NjaGVkdWxlLmMjc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKzB4YTQvMHgy
NzAKPj4+Pj4gICAgICAgKFhFTikgWyAgMzQyLjU1OTU2OF0gICAgWzxmZmZmODJkMDgwMjNmOGFh
Pl0gRiBjb21tb24vc2NoZWR1bGUuYyNzY2hlZHVsZSsweDE3YS8weDI2MAo+Pj4+PiAgICAgICAo
WEVOKSBbICAzNDIuNTU5NTcxXSAgICBbPGZmZmY4MmQwODAyNDBkNWE+XSBGIGNvbW1vbi9zb2Z0
aXJxLmMjX19kb19zb2Z0aXJxKzB4NWEvMHg5MAo+Pj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTU5
NTc0XSAgICBbPGZmZmY4MmQwODAyNzhlYzU+XSBGIGFyY2gveDg2L2RvbWFpbi5jI2d1ZXN0X2lk
bGVfbG9vcCsweDM1LzB4NjAKPj4+Pj4KPj4+Pj4gICAgICAgKFhFTikgWyAgMzQyLjU1OTc2MV0g
Q1BVOiAgICA5Cj4+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41NjAwMjZdIFhlbiBjYWxsIHRyYWNl
Ogo+Pj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTYwMDI5XSAgICBbPGZmZmY4MmQwODAyNDE2NjE+
XSBSIF9zcGluX2xvY2tfaXJxKzB4MTEvMHg0MAo+Pj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTYw
MDMyXSAgICBbPGZmZmY4MmQwODAyM2YzMjM+XSBGIGNvbW1vbi9zY2hlZHVsZS5jI3NjaGVkX3dh
aXRfcmVuZGV6dm91c19pbisweGMzLzB4MjcwCj4+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41NjAw
MzZdICAgIFs8ZmZmZjgyZDA4MDIzZjhhYT5dIEYgY29tbW9uL3NjaGVkdWxlLmMjc2NoZWR1bGUr
MHgxN2EvMHgyNjAKPj4+Pj4gICAgICAgKFhFTikgWyAgMzQyLjU2MDAzOV0gICAgWzxmZmZmODJk
MDgwMjQwZDVhPl0gRiBjb21tb24vc29mdGlycS5jI19fZG9fc29mdGlycSsweDVhLzB4OTAKPj4+
Pj4gICAgICAgKFhFTikgWyAgMzQyLjU2MDA0Ml0gICAgWzxmZmZmODJkMDgwMjc5ZGI1Pl0gRiBh
cmNoL3g4Ni9kb21haW4uYyNpZGxlX2xvb3ArMHg1NS8weGIwCj4+Pj4+Cj4+Pj4+IFRoZSBmaXJz
dCBIVCBzaWJsaW5nIGlzIHdhaXRpbmcgZm9yIHRoZSBzZWNvbmQgaW4gdGhlIExQLWFwcGxpY2F0
aW9uCj4+Pj4+IGNvbnRleHQgd2hpbGUgdGhlIHNlY29uZCB3YWl0cyBmb3IgdGhlIGZpcnN0IGlu
IHRoZSBzY2hlZHVsZXIgY29udGV4dC4KPj4+Pj4KPj4+Pj4gQW55IHN1Z2dlc3Rpb25zIG9uIGhv
dyB0byBpbXByb3ZlIHRoaXMgc2l0dWF0aW9uIGFyZSB3ZWxjb21lLgo+Pj4+Cj4+Pj4gQ2FuIHlv
dSB0ZXN0IHRoZSBhdHRhY2hlZCBwYXRjaCwgcGxlYXNlPyBJdCBpcyBvbmx5IHRlc3RlZCB0byBi
b290LCBzbwo+Pj4+IEkgZGlkIG5vIGxpdmVwYXRjaCB0ZXN0cyB3aXRoIGl0Lgo+Pj4KPj4+IFRo
YW5rIHlvdSBmb3IgdGhlIHBhdGNoISBJdCBzZWVtcyB0byBmaXggdGhlIGlzc3VlIGluIG15IG1h
bnVhbCB0ZXN0aW5nLgo+Pj4gSSdtIGdvaW5nIHRvIHN1Ym1pdCBhdXRvbWF0aWMgTFAgdGVzdGlu
ZyBmb3IgYm90aCB0aHJlYWQvY29yZSBtb2Rlcy4KPj4KPj4gQW5kcmV3IHN1Z2dlc3RlZCB0byB0
ZXN0IGxhdGUgdWNvZGUgbG9hZGluZyBhcyB3ZWxsIGFuZCBzbyBJIGRpZC4KPj4gSXQgdXNlcyBz
dG9wX21hY2hpbmUoKSB0byByZW5kZXp2b3VzIGNwdXMgYW5kIGl0IGZhaWxlZCB3aXRoIGEgc2lt
aWxhcgo+PiBiYWNrdHJhY2UgZm9yIGEgcHJvYmxlbWF0aWMgQ1BVLiBCdXQgaW4gdGhpcyBjYXNl
IHRoZSBzeXN0ZW0gY3Jhc2hlZAo+PiBzaW5jZSB0aGVyZSBpcyBubyB0aW1lb3V0IGludm9sdmVk
Ogo+Pgo+PiAgICAgIChYRU4pIFsgIDE1NS4wMjUxNjhdIFhlbiBjYWxsIHRyYWNlOgo+PiAgICAg
IChYRU4pIFsgIDE1NS4wNDAwOTVdICAgIFs8ZmZmZjgyZDA4MDI0MTdmMj5dIFIgX3NwaW5fdW5s
b2NrX2lycSsweDIyLzB4MzAKPj4gICAgICAoWEVOKSBbICAxNTUuMDY5NTQ5XSAgICBbPGZmZmY4
MmQwODAyM2YzYzI+XSBTIGNvbW1vbi9zY2hlZHVsZS5jI3NjaGVkX3dhaXRfcmVuZGV6dm91c19p
bisweGEyLzB4MjcwCj4+ICAgICAgKFhFTikgWyAgMTU1LjEwOTY5Nl0gICAgWzxmZmZmODJkMDgw
MjNmNzI4Pl0gRiBjb21tb24vc2NoZWR1bGUuYyNzY2hlZF9zbGF2ZSsweDE5OC8weDI2MAo+PiAg
ICAgIChYRU4pIFsgIDE1NS4xNDU1MjFdICAgIFs8ZmZmZjgyZDA4MDI0MGUxYT5dIEYgY29tbW9u
L3NvZnRpcnEuYyNfX2RvX3NvZnRpcnErMHg1YS8weDkwCj4+ICAgICAgKFhFTikgWyAgMTU1LjE4
MDIyM10gICAgWzxmZmZmODJkMDgwMzcxNmY2Pl0gRiB4ODZfNjQvZW50cnkuUyNwcm9jZXNzX3Nv
ZnRpcnFzKzB4Ni8weDIwCj4+Cj4+IEl0IGxvb2tzIGxpa2UgeW91ciBwYXRjaCBwcm92aWRlcyBh
IHdvcmthcm91bmQgZm9yIExQIGNhc2UsIGJ1dCBvdGhlcgo+PiBjYXNlcyBsaWtlIHN0b3BfbWFj
aGluZSgpIHJlbWFpbiBicm9rZW4gc2luY2UgdGhlIHVuZGVybHlpbmcgaXNzdWUgd2l0aAo+PiB0
aGUgc2NoZWR1bGVyIGlzIHN0aWxsIHRoZXJlLgo+Cj4gQW5kIGhlcmUgaXMgdGhlIGZpeCBmb3Ig
dWNvZGUgbG9hZGluZyAodGhhdCB3YXMgaW4gZmFjdCB0aGUgb25seSBjYXNlCj4gd2hlcmUgc3Rv
cF9tYWNoaW5lX3J1bigpIHdhc24ndCBhbHJlYWR5IGNhbGxlZCBpbiBhIHRhc2tsZXQpLgo+Cj4g
SSBoYXZlIGRvbmUgYSBtYW51YWwgdGVzdCBsb2FkaW5nIG5ldyB1Y29kZSB3aXRoIGNvcmUgc2No
ZWR1bGluZwo+IGFjdGl2ZS4KClRoZSBwYXRjaCBzZWVtcyB0byBmaXggdGhlIGlzc3VlLCB0aGFu
a3MhCkRvIHlvdSBwbGFuIHRvIHBvc3QgdGhlIDIgcGF0Y2hlcyB0byB0aGUgTUwgbm93IGZvciBw
cm9wZXIgcmV2aWV3PwoKLS0KU2VyZ2V5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
