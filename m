Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D98885CFA
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 10:36:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvdrI-0000O2-JB; Thu, 08 Aug 2019 08:33:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6/vj=WE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvdrH-0000Nx-6k
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 08:33:15 +0000
X-Inumbo-ID: 28294814-b9b7-11e9-b059-43be7e453f94
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28294814-b9b7-11e9-b059-43be7e453f94;
 Thu, 08 Aug 2019 08:33:12 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: a9FzzkqzFtQQusRAIycj5tB77/YIy2YyxoE4qgyYcMmvxkQldOz0oaoO++8nFaJNVo2z9+byDX
 s/ouX/kyKSlsL8VugcIHAwZIOuDbRpWkfA0FY/t2tiCTBtVJdLLug2ONNjL0vvqP8V6DQV+mtC
 TO+j/Jl6Pr1m8fwjlOAOg/nO1Zv74GBW1eatv7A/iS96H49Jy/f2sgrnSAQwrSCWJF9/YWqTlz
 Vp0iQuneMx+VgH+9x0zvJSFFG9oisKCiZxzK68LgGqJgmbJvjqmCu6vVC/mFl/yZidQ336Y8a+
 SJI=
X-SBRS: 2.7
X-MesageID: 4027058
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4027058"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20190807143119.8360-1-jgross@suse.com>
 <bc9954e7-ef0a-aeaf-668b-eedcc78645d4@citrix.com>
 <3a8e76fd-ec10-9020-7f34-40c62dab0e6c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c1d979d8-eece-0065-c4a1-5f3d47a217ea@citrix.com>
Date: Thu, 8 Aug 2019 09:33:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3a8e76fd-ec10-9020-7f34-40c62dab0e6c@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 0/4] enhance lock debugging
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDgvMjAxOSAwNTo1MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNy4wOC4xOSAy
MDoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4KPj4gPHNuaXA+Cj4+IEl0cyBub3QgZXhhY3Rs
eSB0aGUgZWFzaWVzdCB0byBkdW1wIHRvIGZvbGxvdy4KPj4KPj4gRmlyc3Qgb2YgYWxsIC0gSSBk
b24ndCBzZWUgd2h5IHRoZSBob2xkL2Jsb2NrIHRpbWUgYXJlIHByaW50ZWQgbGlrZQo+PiB0aGF0
LsKgIEl0Cj4+IG1pZ2h0IGJlIGEgaG9sZG92ZXIgZnJvbSB0aGUgMzJiaXQgYnVpbGQsIHByZSBQ
UklkNjQgc3VwcG9ydC7CoCBUaGV5Cj4+IHNob3VsZAo+PiBwcm9iYWJseSB1c2UgUFJJX3N0aW1l
IGFueXdheS4KPgo+IEZpbmUgd2l0aCBtZS4KPgo+PiBUaGUgZG9taWQgcmVuZGVyaW5nIGlzIHVu
Zm9ydHVuYXRlLsKgIElkZWFsbHkgd2UnZCB1c2UgJXBkIGJ1dCB0aGF0IHdvdWxkCj4+IGludm9s
dmUgcmVhcnJhbmdpbmcgdGhlIGxvZ2ljIHRvIGdldCBhIHN0cnVjdCBkb21haW4qIGluIGhhbmQu
wqAKPj4gU2VlaW5nIGFzCj4+IHlvdSdyZSB0aGUgbGFzdCBwZXJzb24gdG8gbW9kaWZ5IHRoaXMg
Y29kZSwgaG93IGhhcmQgd291bGQgdGhhdCBiZSB0bwo+PiBkbz8KPgo+IEl0IHdvdWxkIGNvbXBs
ZXRlbHkgYnJlYWsgdGhlIHN0cnVjdCB0eXBlIGFnbm9zdGljIGRlc2lnbi4KCk9rLsKgIEFzIGFu
IGFsdGVybmF0aXZlbHksIGhvdyBhYm91dCAlcGRyIHdoaWNoIHRha2VzIGEgcmF3IGRvbWlkP8Kg
IEl0CndvdWxkIGJlIGEgdHJpdmlhbCBhZGp1c3RtZW50IGluIHRoZSB2c25wcmludGYgY29kZSwg
YW5kIGNvdWxkIHBsYXVzaWJseQpiZSB1c2VmdWwgZWxzZXdoZXJlIHdoZXJlIHdlIGhhdmUgYSBk
b21pZCBhbmQgbm90IGEgZG9tYWluIHBvaW50ZXIuCgo+Cj4gSSBoYXZlIGEgZGVidWcgcGF0Y2gg
YWRkaW5nIGNyZWRpdDIgcnVuLXF1ZXVlIGxvY2suIEl0IHJlcXVpcmVzIHRvIGp1c3QKPiBhZGQg
NSBsaW5lcyBvZiBjb2RlIChhbmQgdGhpcyBpbmNsdWRlcyBtb3ZpbmcgdGhlIHNwaW5sb2NrX2lu
aXQoKSBvdXQgb2YKPiBhbiBpcnEtb2ZmIHNlY3Rpb24pLiBJdCB3aWxsIHByb2R1Y2U6Cj4KPiAo
WEVOKSBjcmVkaXQyLXJ1bnEgMCBsb2NrOiBhZGRyPWZmZmY4MzA0MTMzNTEwMTAsIGxvY2t2YWw9
ZGUwMGRkZiwgY3B1PTYKPiAoWEVOKcKgwqAgbG9jazogODk2Mjg3KDAwMDAwMDAwOjAwRkFBNkIy
KSwgYmxvY2s6wqAgODE5KDAwMDAwMDAwOjAwMDA5QzgwKQoKV2hhdCBpcyB0aGUgMCBoZXJlPwoK
Pgo+PiBXZSBoYXZlIHNldmVyYWwgZ2xvYmFsIGxvY2tzIGNhbGxlZCBsb2NrOgo+Pgo+PiDCoMKg
IChYRU4pIEdsb2JhbCBsb2NrOiBhZGRyPWZmZmY4MmQwODA4MTgxZTAsIGxvY2t2YWw9MTAwMDEs
IGNwdT00MDk1Cj4+IMKgwqAgKFhFTinCoMKgIGxvY2s6wqDCoMKgwqDCoMKgwqDCoMKgwqAgMSgw
MDAwMDAwMDowMTMyMjE2NSksIGJsb2NrOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPj4gMCgwMDAw
MDAwMDowMDAwMDAwMCkKPj4gwqDCoCAoWEVOKSBHbG9iYWwgbG9jazogYWRkcj1mZmZmODJkMDgw
ODE3Y2MwLCBsb2NrdmFsPTEwMDAxMCwgY3B1PTQwOTUKPj4gwqDCoCAoWEVOKcKgwqAgbG9jazrC
oMKgwqDCoMKgwqDCoMKgwqDCoCAwKDAwMDAwMDAwOjAwMDAwMDAwKSwgYmxvY2s6wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoAo+PiAwKDAwMDAwMDAwOjAwMDAwMDAwKQo+PiDCoMKgIChYRU4pIEdsb2Jh
bCBsb2NrOiBhZGRyPWZmZmY4MmQwODA4MTc4MDAsIGxvY2t2YWw9MDAwMCwgY3B1PTQwOTUKPj4g
wqDCoCAoWEVOKcKgwqAgbG9jazrCoMKgwqDCoMKgwqDCoMKgwqDCoCAwKDAwMDAwMDAwOjAwMDAw
MDAwKSwgYmxvY2s6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+PiAwKDAwMDAwMDAwOjAwMDAwMDAw
KQo+PiDCoMKgIChYRU4pIEdsb2JhbCBsb2NrOiBhZGRyPWZmZmY4MmQwODA4MTc3ODAsIGxvY2t2
YWw9MDAwMCwgY3B1PTQwOTUKPj4gwqDCoCAoWEVOKcKgwqAgbG9jazrCoMKgwqDCoMKgwqDCoMKg
wqDCoCAwKDAwMDAwMDAwOjAwMDAwMDAwKSwgYmxvY2s6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+
PiAwKDAwMDAwMDAwOjAwMDAwMDAwKQo+PiDCoMKgIChYRU4pIEdsb2JhbCBsb2NrOiBhZGRyPWZm
ZmY4MmQwODA4MTc1MTAsIGxvY2t2YWw9MDAwMCwgY3B1PTQwOTUKPj4gwqDCoCAoWEVOKcKgwqAg
bG9jazrCoMKgwqDCoMKgwqDCoMKgwqDCoCAwKDAwMDAwMDAwOjAwMDAwMDAwKSwgYmxvY2s6wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoAo+PiAwKDAwMDAwMDAwOjAwMDAwMDAwKQo+Pgo+PiBUaGUgc2Vj
b25kIG9uZSBpbiBwYXJ0aWN1bGFyIGhhcyBjb3JydXB0IGRhdGEsIHNlZWluZyBoYXMgaXQgaGFz
IGJlZW4KPj4gdGFrZW4KPj4gYW5kIHJlbGVhc2VkIHNldmVyYWwgdGltZXMgd2l0aG91dCBsb2Nr
X2NudCBpbmNyZWFzaW5nLgo+Cj4gVGhlIGxvY2sgbWlnaHQgaGF2ZSBiZWVuIHRha2VuL3JlbGVh
c2VkIGJlZm9yZSBsb2NrIHByb2ZpbGluZyBoYXMgYmVlbgo+IGluaXRpYWxpemVkLgoKV2hhdCBp
cyB0aGVyZSB0byBpbml0aWFsaXNlP8KgIEl0IGFsbCBsb29rcyBzdGF0aWNhbGx5IHNldCB1cC4K
Cj4KPj4gRm9yIHNhbml0eSBzYWtlLCB3ZSBzaG91bGQgZW5mb3JjZSB1bmlxdWUgbmFtaW5nIG9m
IGFueSBsb2NrCj4+IHJlZ2lzdGVyZWQgZm9yCj4+IHByb2ZpbGluZy4KPgo+IFRoaXMgd291bGQg
YmUgZXZlcnkgbG9jayBpbml0ZWQgdmlhIERFRklORV9TUElOTE9DSygpLiBJIGNhbiBkbyBhCj4g
Zm9sbG93dXAgcGF0Y2ggZm9yIHRoYXQgcHVycG9zZS4KCkkgd2FzIHdvbmRlcmluZyBob3cgdG8g
ZG8gdGhpcy7CoCBPbmUgb3B0aW9uIHdoaWNoIGNvbWVzIHRvIG1pbmQgaXMgdG8KcHV0IGFuIG5v
bi1zdGF0aWMgb2JqZWN0IGludG8gLmRpc2NhcmQubG9ja19wcm9maWxlIG9yIHNvbWV0aGluZywg
c28gdGhlCmxpbmtlciB3aWxsIG9iamVjdCB0byByZXBlYXRlZCBzeW1ib2wgbmFtZXMgYW5kIHRo
ZW4gdGhyb3cgYWxsIG9mIHRoZW0gYXdheS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
