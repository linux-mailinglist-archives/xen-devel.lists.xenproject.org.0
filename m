Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618BF787F3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 11:03:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs1X7-0008LW-LV; Mon, 29 Jul 2019 09:01:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs1X6-0008LR-EZ
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 09:01:28 +0000
X-Inumbo-ID: 720a791e-b1df-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 720a791e-b1df-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 09:01:26 +0000 (UTC)
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
IronPort-SDR: yx6Xn/HNBp8G/C+UqYtMX/b+NTaJ1ehdGWAgPO6A6+Gj4VRHDngE9U3UGieA5klupB1mmFwUuO
 8dDa/ZG4q1lN4YmbRYyPCc7iLLbWqxz0HzGsRm3JORcSICrgHyRMUTvGkxgPNH7y/fai0bClDS
 Xz62lvWq219IkwAMR5o4rP9yGHZBgZELLUj5NS8yC4DhsoEvSbbCsyYPrsg9GwuYR7XPcwLARy
 5nSD0TTKhVzJ9hHVqmkDQDXmmd0oJR/ebDma0d86KwQMteNBPij/gVwMQbsTZZtjfXlLcQ7gYc
 oi0=
X-SBRS: 2.7
X-MesageID: 3557650
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3557650"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190726203222.4833-1-andrew.cooper3@citrix.com>
 <20190726203222.4833-2-andrew.cooper3@citrix.com>
 <20190729085233.x3lees5rcycj7xko@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <bbf67dc5-598d-c816-523f-d848e62840f3@citrix.com>
Date: Mon, 29 Jul 2019 10:01:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729085233.x3lees5rcycj7xko@Air-de-Roger>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDcvMjAxOSAwOTo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEp1
bCAyNiwgMjAxOSBhdCAwOTozMjoyMVBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBG
dXR1cmUgY2hhbmdlcyBhcmUgZ29pbmcgdG8gbmVlZCB0byBwYWdlIGFsaWduIHNvbWUgcGVyY3B1
IGRhdGEuCj4+Cj4+IFRoaXMgbWVhbnMgdGhhdCB0aGUgcGVyY3B1IGFyZWEgbmVlZHMgc3VpdGFi
bHkgYWxpZ25pbmcgaW4gdGhlIEJTUyBzbyBDUFUwIGhhcwo+PiBjb3JyZWN0bHkgYWxpZ25lZCBk
YXRhLiAgU2h1ZmZsZSB0aGUgZXhhY3QgbGluayBvcmRlciBvZiBpdGVtcyB3aXRoaW4gdGhlIEJT
Uwo+PiB0byBnaXZlIC5ic3MucGVyY3B1LnBhZ2VfYWxpZ25lZCBhcHByb3ByaWF0ZSBhbGlnbm1l
bnQuCj4+Cj4+IEluIGFkZGl0aW9uLCB3ZSBuZWVkIHRvIGJlIGFibGUgdG8gc3BlY2lmeSBhbiBh
bGlnbm1lbnQgYXR0cmlidXRlIHRvCj4+IF9fREVGSU5FX1BFUl9DUFUoKS4gIFJld29yayBpdCBz
byB0aGUgY2FsbGVyIHBhc3NlcyBpbiBhbGwgYXR0cmlidXRlcywgYW5kCj4+IGFkanVzdCBERUZJ
TkVfUEVSX0NQVXssX1JFQURfTU9TVExZfSgpIHRvIG1hdGNoLiAgVGhpcyBoYXMgdGhlIGFkZGVk
IGJvbnVzCj4+IHRoYXQgaXQgaXMgbm93IHBvc3NpYmxlIHRvIGdyZXAgZm9yIC5ic3MucGVyY3B1
IGFuZCBmaW5kIGFsbCB0aGUgdXNlcnMuCj4+Cj4+IEZpbmFsbHksIGludHJvZHVjZSBERUZJTkVf
UEVSX0NQVV9QQUdFX0FMSUdORUQoKSB3aGljaCB1c2VzIGJvdGggc2VjdGlvbiBhbmQKPj4gYWxp
Z25tZW50IGF0dHJpYnV0ZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Cj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
eDg2L3BlcmNwdS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wZXJjcHUuaAo+PiBpbmRleCBmZjM0
ZGM3ODk3Li41YjZjZWYwNGM0IDEwMDY0NAo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Bl
cmNwdS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcGVyY3B1LmgKPj4gQEAgLTcsMTAg
KzcsOCBAQCBleHRlcm4gdW5zaWduZWQgbG9uZyBfX3Blcl9jcHVfb2Zmc2V0W05SX0NQVVNdOwo+
PiAgdm9pZCBwZXJjcHVfaW5pdF9hcmVhcyh2b2lkKTsKPj4gICNlbmRpZgo+PiAgCj4+IC0vKiBT
ZXBhcmF0ZSBvdXQgdGhlIHR5cGUsIHNvIChpbnRbM10sIGZvbykgd29ya3MuICovCj4+IC0jZGVm
aW5lIF9fREVGSU5FX1BFUl9DUFUodHlwZSwgbmFtZSwgc3VmZml4KSAgICAgICAgICAgICAgICAg
ICAgXAo+PiAtICAgIF9fc2VjdGlvbigiLmJzcy5wZXJjcHUiICNzdWZmaXgpICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPj4gLSAgICBfX3R5cGVvZl9fKHR5cGUpIHBlcl9jcHVfIyNuYW1l
Cj4+ICsjZGVmaW5lIF9fREVGSU5FX1BFUl9DUFUoYXR0ciwgdHlwZSwgbmFtZSkgXAo+PiArICAg
IGF0dHIgX190eXBlb2ZfXyh0eXBlKSBwZXJfY3B1XyAjIyBuYW1lCj4+ICAKPj4gIC8qIHZhciBp
cyBpbiBkaXNjYXJkZWQgcmVnaW9uOiBvZmZzZXQgdG8gcGFydGljdWxhciBjb3B5IHdlIHdhbnQg
Ki8KPj4gICNkZWZpbmUgcGVyX2NwdSh2YXIsIGNwdSkgIFwKPj4gZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3hlbi9wZXJjcHUuaCBiL3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaAo+PiBpbmRleCBh
ZWVjNWMxOWQ2Li43MWEzMWNjMzYxIDEwMDY0NAo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGVy
Y3B1LmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BlcmNwdS5oCj4+IEBAIC05LDkgKzksMTUg
QEAKPj4gICAqIFRoZSBfIyNuYW1lIGNvbmNhdGVuYXRpb24gaXMgYmVpbmcgdXNlZCBoZXJlIHRv
IHByZXZlbnQgJ25hbWUnIGZyb20gZ2V0dGluZwo+PiAgICogbWFjcm8gZXhwYW5kZWQsIHdoaWxl
IHN0aWxsIGFsbG93aW5nIGEgcGVyLWFyY2hpdGVjdHVyZSBzeW1ib2wgbmFtZSBwcmVmaXguCj4+
ICAgKi8KPj4gLSNkZWZpbmUgREVGSU5FX1BFUl9DUFUodHlwZSwgbmFtZSkgX19ERUZJTkVfUEVS
X0NQVSh0eXBlLCBfIyNuYW1lLCApCj4+ICsjZGVmaW5lIERFRklORV9QRVJfQ1BVKHR5cGUsIG5h
bWUpIFwKPj4gKyAgICBfX0RFRklORV9QRVJfQ1BVKF9fc2VjdGlvbigiLmJzcy5wZXJjcHUiKSwg
dHlwZSwgXyAjIyBuYW1lKQo+PiArCj4+ICsjZGVmaW5lIERFRklORV9QRVJfQ1BVX1BBR0VfQUxJ
R05FRCh0eXBlLCBuYW1lKSBcCj4+ICsgICAgX19ERUZJTkVfUEVSX0NQVShfX3NlY3Rpb24oIi5i
c3MucGVyY3B1LnBhZ2VfYWxpZ25lZCIpIFwKPj4gKyAgICAgICAgICAgICAgICAgICAgIF9fYWxp
Z25lZChQQUdFX1NJWkUpLCB0eXBlLCBfICMjIG5hbWUpCj4+ICsKPj4gICNkZWZpbmUgREVGSU5F
X1BFUl9DUFVfUkVBRF9NT1NUTFkodHlwZSwgbmFtZSkgXAo+PiAtCV9fREVGSU5FX1BFUl9DUFUo
dHlwZSwgXyMjbmFtZSwgLnJlYWRfbW9zdGx5KQo+PiArICAgIF9fREVGSU5FX1BFUl9DUFUoX19z
ZWN0aW9uKCIuYnNzLnBlcmNwdS5yZWFkX21vc3RseSIpLCB0eXBlLCBfICMjIG5hbWUpCj4gQUZB
SUNUIGFsc28gYWRkaW5nIGEgJ18nIGhlcmUgd2lsbCByZXN1bHQgaW4gdmFyaWFibGUgbmFtZXMg
d2l0aAo+IHBlcl9jcHVfX2Zvbywgd2hpY2ggaXMgaW5saW5lIHdpdGggdGhlIHByZXZpb3VzIGJl
aGF2aW91ciwgYnV0IEknbSBub3QKPiBzdXJlIG9mIHRoZSBwb2ludCBvZiB0aGUgZG91YmxlIHVu
ZGVyc2NvcmUuCgpJdHMgZG91YmxlLCB0byBhdm9pZCB0b2tlbiBleHBhbnNpb24uwqAgU2VlIHRo
ZSBjb21tZW50IGluIGNvbnRleHQgYXQgdGhlCnRvcCBvZiB0aGlzIGh1bmsuCgpXaXRob3V0IGl0
LCB0aGUgc2NoZWR1bGVycyBkb24ndCBjb21waWxlIGJlY2F1c2UgY3B1bWFza19zY3JhdGNoIGlz
IGJvdGgKdGhlIG5hbWUgb2YgYSBwZXJjcHUgdmFyaWFibGUsIGFuZCBhbiBhbGlhcyB0bwomdGhp
c19jcHUoY3B1bWFza19zY3JhdGNoKS7CoCBPbWl0dGluZyB0aGUgdG9rZW4gY29uY2F0ZW5hdGlv
biBoZXJlCmNhdXNlcyAmdGhpc19jcHUoKSB0byBiZSBleHBhbmRlZCBpbnRvIF9fREVGSU5FX1BF
Ul9DUFUoKS4KCn5BbmRyZXcKClAuUy4gR3Vlc3Mgd2hvIHRyaWVkIHRvIHJlbW92ZSB0aGlzIHBp
ZWNlIG9mICJmdW4iIHRvIGJlZ2luIHdpdGguLi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
