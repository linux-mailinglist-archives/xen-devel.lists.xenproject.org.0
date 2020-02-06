Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A838C154335
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 12:35:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izfP6-0000v8-Gb; Thu, 06 Feb 2020 11:33:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3kaZ=32=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1izfP4-0000v3-O9
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 11:33:02 +0000
X-Inumbo-ID: 6e697162-48d4-11ea-8897-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e697162-48d4-11ea-8897-bc764e2007e4;
 Thu, 06 Feb 2020 11:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580988781;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Q+QA94UNgB9Tm61qv4+5rBUFL5XHExfr+hEe7aUcK3E=;
 b=DELL2o6DWwRRCiLJvO7AqQh6U6/ECBKT+eYubr08xMmk9Ma1O9MSGSFy
 P9vABLd5wbv76H1fRnm76SgUPYR5QCDutaEcK8EdGom58r1ahxn+fr83w
 xeCLvgsMWvmw/cYqDJKTcjKAPE0wuM2rNqd9H26b8NsSgMpi7wGINXa2E o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uYLeaSeShutFcciu0GOT366be1HaxywjK+qt8pi/tz3DqPvHRUqvVLsbjylk0/Ky1ZOMr1zirG
 Kh05NbwKz/08m54juOg64N41DuQk9346v2JVA+O+oDpEAE9KlykTHE6NE8ufY60+v76lTZ9KmM
 htXx1cvhnrYZYbprVeN0qyZdU8TuMIkHYzFOj3Hh8JwUtk7Lug2NbNqkFQ9amX/3DicubQp9oM
 /9aE++195mJMrYd+lmBwv/4aBc6HSWdHbslKJqHP1ItiyxvAQJr8V7lNmqjcldR+X0DPMvo7Gu
 FB4=
X-SBRS: 2.7
X-MesageID: 12476460
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,409,1574139600"; d="scan'208";a="12476460"
To: Jan Beulich <jbeulich@suse.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-7-andrew.cooper3@citrix.com>
 <9c7f9930-02d7-13d3-88ab-bad236993e31@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5227980e-5938-f23b-7b1d-eac67bba792e@citrix.com>
Date: Thu, 6 Feb 2020 11:32:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9c7f9930-02d7-13d3-88ab-bad236993e31@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 6/6] xen/public: Obsolete
 HVM_PARAM_PAE_ENABLED
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
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>, Anthony
 PERARD <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDIvMjAyMCAwOToyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUuMDIuMjAyMCAx
Nzo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEvdG9vbHMvbGlieGMveGNfc3JfcmVz
dG9yZV94ODZfaHZtLmMKPj4gKysrIGIvdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZfaHZt
LmMKPj4gQEAgLTcyLDYgKzcyLDE2IEBAIHN0YXRpYyBpbnQgaGFuZGxlX2h2bV9wYXJhbXMoc3Ry
dWN0IHhjX3NyX2NvbnRleHQgKmN0eCwKPj4gICAgICAgICAgY2FzZSBIVk1fUEFSQU1fQlVGSU9S
RVFfUEZOOgo+PiAgICAgICAgICAgICAgeGNfY2xlYXJfZG9tYWluX3BhZ2UoeGNoLCBjdHgtPmRv
bWlkLCBlbnRyeS0+dmFsdWUpOwo+PiAgICAgICAgICAgICAgYnJlYWs7Cj4+ICsKPj4gKyAgICAg
ICAgY2FzZSBIVk1fUEFSQU1fUEFFX0VOQUJMRUQ6Cj4+ICsgICAgICAgICAgICAvKgo+PiArICAg
ICAgICAgICAgICogVGhpcyBIVk1fUEFSQU0gb25seSBldmVyIGV4aXN0ZWQgYSBub24tc3RhbmRh
cmQgY2FsbGluZyBBQkkgZm9yCj4+ICsgICAgICAgICAgICAgKiB4Y19jcHVpZF9hcHBseV9wb2xp
Y3koKS4gIEl0IGhhcyBub3cgYmVlbiB1cGRhdGVkIHRvIHVzZSBhCj4+ICsgICAgICAgICAgICAg
KiByZWd1bGFyIGNhbGxpbmcgY29udmVudGlvbiwgbWFraW5nIHRoZSBwYXJhbSBvYnNvbGV0ZS4K
Pj4gKyAgICAgICAgICAgICAqCj4+ICsgICAgICAgICAgICAgKiBEaXNjYXJkIGlmIHdlIGZpbmQg
aXQgaW4gYW4gb2xkIG1pZ3JhdGlvbiBzdHJlYW0uCj4+ICsgICAgICAgICAgICAgKi8KPj4gKyAg
ICAgICAgICAgIGNvbnRpbnVlOwo+IEhhdmluZyBhbHNvIGxvb2tlZCBhdCB0aGUgcHJldmlvdXMg
cGF0Y2ggKHRoZSBvbmx5IG9uZSBpbiB0aGlzIHNlcmllcwo+IHJlbGV2YW50IHRvIHRoZSBhZGp1
c3RtZW50cyBkb25lIGhlcmUgYWZhaWN0KQoKQ29ycmVjdC4KCj4gSSB3b25kZXIgd2hldGhlciBz
aW1wbHkKPiBpZ25vcmluZyBpdCAoaS5lLiBub3QgZXZlbiB3YXJuaW5nIGFueXdoZXJlIHdoZW4g
b3V0IG9mIHN5bmMgd2l0aAo+IHdoYXRldmVyIGluZm8tPnUuaHZtLnBhZSBnZXRzIHBvcHVsYXRl
ZCBmcm9tKSBpcyBhIGdvb2QgYXBwcm9hY2guCgpXZSBjYW4ndCAoZWFzaWx5KSBjcm9zcyBjaGVj
ayBhdCBhbGwsIGJlY2F1c2UgaW5mby0+dS5odm0ucGFlIGlzIGluIGEKc2VwYXJhdGUgcHJvY2Vz
cyAoYXMgZmFyIGFzIHRoZSB4bC9saWJ4bCB0b29sc3RhY2sgZ29lcykuCgpPbiBjcm9zcyBjaGVj
a2luZywgeW91J2xsIGZpbmQgdGhhdCBtaWdyYXRpb24gaW4gZnJvbSBwcmUgWGVuIDQuNgpkb2Vz
bid0IGFjdHVhbGx5IGhhdmUgdGhlIGRhdGEuwqAgSWYgeW91IGxvb2sgYmFjayBhdCB0aGUgNC41
IGxlZ2FjeQptaWdyYXRpb24gY29kZSwgeW91J2xsIG9ic2VydmUgdGhhdCB0aGlzIHBhcmFtIGlz
IHJlc3RvcmVkIGJ1dCBuZXZlcgpzYXZlZC7CoCBJbiBoaW5kc2lnaHQsIHdlIHByb2JhYmx5IHNo
b3VsZG4ndCBoYXZlIGZpeGVkIHRoYXQgaW4gbWlncmF0aW9uCnYyLCBidXQgd2UgZGlkLgoKVXBz
dHJlYW0gd2FzIGFjdHVhbGx5IGZpbmUsIGJlY2F1c2UgbGlieGwgc2V0cyBIVk1fUEFSQU1fUEFF
X0VOQUJMRUQKYWZ0ZXIgdGhlIG1pZ3JhdGlvbiBzdHJlYW0gY29tcGxldGVzLCBhbmQgb3Zlcndy
aXRlcyB3aGF0ZXZlciB3YXMKd2hlcmUuwqAgWGVuU2VydmVyIGRpZCBub3QsIGFuZCB3ZSBub3Rp
Y2VkIGFzIGEgY29uc2VxdWVuY2Ugb2YgWGVuIDQuNQphY3R1YWxseSBjcm9zcy1jaGVja2VkIENQ
VUlEIHNldHRpbmdzIG9uIGEgbW92IHRvICVjcjQgZW11bGF0aW9uLgoKPiBCdXQgb2YgY291cnNl
IEkgbWF5IGJlIGVhc2lseSBtaXNzaW5nIGFzcGVjdHMgaGVyZSB0aGF0IG1ha2UgdGhpcyBxdWl0
ZQo+IGZpbmUuCgpJdCByZWFsbHkgaXMgb2Jzb2xldGUgYW5kIG5lZWRzIGZvcmdldHRpbmcsIG5v
dCBjaGVja2luZy4KCj4KPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9wYXJhbXMuaAo+
PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL3BhcmFtcy5oCj4+IEBAIC04Niw3ICs4Niw3
IEBACj4+ICAjZGVmaW5lIEhWTV9QQVJBTV9TVE9SRV9QRk4gICAgMQo+PiAgI2RlZmluZSBIVk1f
UEFSQU1fU1RPUkVfRVZUQ0hOIDIKPj4gIAo+PiAtI2RlZmluZSBIVk1fUEFSQU1fUEFFX0VOQUJM
RUQgIDQKPj4gKyNkZWZpbmUgSFZNX1BBUkFNX1BBRV9FTkFCTEVEICA0IC8qIE9ic29sZXRlLiAg
RG8gbm90IHVzZS4gKi8KPiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIG1vdmVkIHVwIGluIHRoZSBk
ZXByZWNhdGVkIHNlY3Rpb24uCgpUaGVyZSBpc24ndCBhIGRlcHJlY2F0ZWQgc2VjdGlvbi4KClRo
ZSBwYXJhbXMgYXJlIGN1cnJlbnRseSBzb3J0ZWQgbnVtZXJpY2FsbHkuwqAgUGxheWluZyAid2hp
Y2ggcGFyYW0gaXMKdGhpcyBpbnRlZ2VyPyIgd2l0aCBhbiB1bnNvcnRlZCBwYXJhbXMuaCBpcyBh
biBleHBlcmllbmNlIEkgd2lzaCBuZXZlcgp0byByZXBlYXQgYWdhaW4uCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
