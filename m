Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBC1131698
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 18:18:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioVz5-0005cp-Qw; Mon, 06 Jan 2020 17:16:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nws7=23=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioVz3-0005ck-ST
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 17:16:05 +0000
X-Inumbo-ID: 38400ce8-30a8-11ea-ab3d-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38400ce8-30a8-11ea-ab3d-12813bfff9fa;
 Mon, 06 Jan 2020 17:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578330965;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=kLQxex1jDcwpKkOfLCpJhFD/Vku6oia/LS1bawJcfYc=;
 b=RjF7P/jwcPxbq0LoLtoUBGbXfB9rO3nY7H/Tq6uDhPlBUQwDIoPSngIh
 JV2JHjwZjxY311i3EP7R4/WR6oo1ADJDK+2oaz5rH0mlq25bdF7IL0YEb
 U9zrynV/vcwBY3DMuzVl+n2fEbna67vYLCVgiRoQnPDH20C9kFQwlQa7F A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7u54JDcgG+pm8tSieuH358CSjBW2Xn4qtughitGeLWP9enDZP0+Q4apiyfs/Lg+lna4kNQa8sK
 Buqpv1WaItaOSnuOz9I9/ignZtWm/Qdzq6eXFrbeB4TfRS9IrYes6IY7vH2aMS2feefANLYHXp
 VOPDkbjQK8r+b/Rb72olMVq6QyQGtxk7khkntLqyQd9Kn7nUpNR7bcHRlzyQ8Y9zfXzNob2sA+
 G+xCJxUFD3JhcBrIHJ9x+M3GE6kqedVfLagUiqru3DsFVOuGBqS/zjL3ekZLUYAxY1Id3CHbcA
 C0M=
X-SBRS: 2.7
X-MesageID: 10662492
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,403,1571716800"; d="scan'208";a="10662492"
To: Jan Beulich <jbeulich@suse.com>
References: <20200103200742.23917-1-andrew.cooper3@citrix.com>
 <a6781391-e3f0-7ff1-ccdf-bdb6f41e9408@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <787ed96f-c700-ba89-b91d-99e210847422@citrix.com>
Date: Mon, 6 Jan 2020 17:16:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a6781391-e3f0-7ff1-ccdf-bdb6f41e9408@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/shim: Short circuit control/hardware
 checks in PV_SHIM_EXCLUSIVE builds
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDEvMjAyMCAxMDoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMDEuMjAyMCAy
MTowNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVk
LmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4gQEAgLTk2MywxMCArOTYzLDIy
IEBAIHZvaWQgd2F0Y2hkb2dfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCk7Cj4+ICAg
KiAgICAodGhhdCBpcywgdGhpcyB3b3VsZCBub3QgYmUgc3VpdGFibGUgZm9yIGEgZHJpdmVyIGRv
bWFpbikKPj4gICAqICAtIFRoZXJlIGlzIG5ldmVyIGEgcmVhc29uIHRvIGRlbnkgdGhlIGhhcmR3
YXJlIGRvbWFpbiBhY2Nlc3MgdG8gdGhpcwo+PiAgICovCj4+IC0jZGVmaW5lIGlzX2hhcmR3YXJl
X2RvbWFpbihfZCkgZXZhbHVhdGVfbm9zcGVjKChfZCkgPT0gaGFyZHdhcmVfZG9tYWluKQo+PiAr
c3RhdGljIGFsd2F5c19pbmxpbmUgYm9vbCBpc19oYXJkd2FyZV9kb21haW4oY29uc3Qgc3RydWN0
IGRvbWFpbiAqZCkKPj4gK3sKPj4gKyAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX1BWX1NISU1f
RVhDTFVTSVZFKSApCj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsKPj4gKwo+PiArICAgIHJldHVy
biBldmFsdWF0ZV9ub3NwZWMoZCA9PSBoYXJkd2FyZV9kb21haW4pOwo+PiArfQo+PiAgCj4+ICAv
KiBUaGlzIGNoZWNrIGlzIGZvciBmdW5jdGlvbmFsaXR5IHNwZWNpZmljIHRvIGEgY29udHJvbCBk
b21haW4gKi8KPj4gLSNkZWZpbmUgaXNfY29udHJvbF9kb21haW4oX2QpIGV2YWx1YXRlX25vc3Bl
YygoX2QpLT5pc19wcml2aWxlZ2VkKQo+PiArc3RhdGljIGFsd2F5c19pbmxpbmUgYm9vbCBpc19j
b250cm9sX2RvbWFpbihjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+PiArewo+PiArICAgIGlmICgg
SVNfRU5BQkxFRChDT05GSUdfUFZfU0hJTV9FWENMVVNJVkUpICkKPj4gKyAgICAgICAgcmV0dXJu
IGZhbHNlOwo+PiArCj4+ICsgICAgcmV0dXJuIGV2YWx1YXRlX25vc3BlYyhkLT5pc19wcml2aWxl
Z2VkKTsKPj4gK30KPiBCZXNpZGVzIGl0cyBpbnRlbmRlZCBwdXJwb3NlIHRoaXMgYWxzbyBmaXhl
cyAoYnV0IG9ubHkgZm9yIHRoZQo+IHNoaW0tZXhjbHVzaXZlIGNhc2UpIGFuIGludGVyYWN0aW9u
IGlzc3VlIHdpdGggTEFURV9IV0RPTTogSWYgaW4KPiBzaGltIG1vZGUgdGhlICJoYXJkd2FyZV9k
b209MSIgY29tbWFuZCBsaW5lIG9wdGlvbiB3YXMgdXNlZCwKPiBtaXNiZWhhdmlvciB3b3VsZCBy
ZXN1bHQgYWZhaWN0LgoKUGVyaGFwcywgYnV0IHRoZXJlIGFyZSBwbGVudHkgb2Ygb3RoZXIgd2F5
cyB0byBicmVhayB0aGluZ3MgdXNpbmcgdGhlCnNoaW1zIGNvbW1hbmQgbGluZS4KClJlbWVtYmVy
IHRoYXQgdGhlIHNoaW0gY29tbWFuZCBsaW5lIGlzIG5vdCB1bmRlciB1c2VyIGNvbnRyb2wgYXQg
YWxsLgoKPiBUaGVyZWZvcmUgSSB0aGluayB0aGlzIHdhbnRzCj4gYW1lbmRpbmcgd2l0aCBhZGp1
c3RtZW50cyB0byBhbHNvIG1ha2UgdGhlICFQVl9TSElNX0VYQ0xVU0lWRQo+IGNhc2Ugd29yayBj
b3JyZWN0bHkgKHJlYWQ6IGlnbm9yZSB0aGF0IGNvbW1hbmQgbGluZSBvcHRpb24pLiBJCj4gZ3Vl
c3MgYWRkaXRpb25hbGx5IExBVEVfSFdET00gc2hvdWxkIGFsc28gZGVwZW5kIG9uCj4gIVBWX1NI
SU1fRVhDTFVTSVZFIChhbmQvb3IgdmljZSB2ZXJzYSkuCgpObyAtIHN1Y2ggYSBidWdmaXggc2hv
dWxkIGJlIGEgc2VwYXJhdGUgY2hhbmdlLCBiZWNhdXNlIGl0IGlzIG5vdApyZWxhdGVkIHRvIHRo
aXMgcGF0Y2guCgpGaXhpbmcgaXQgd291bGQgcmVxdWlyZSBleHRyYSB4ODYgI2lmZGVmLWFyeSBp
biBjb21tb24gY29kZS7CoCBXaGlsZSB0aGlzCmlzIGRvYWJsZSwgdGhlcmUgaXMgYWxzbyB3b3Jr
IGluIHByb2dyZXNzIGZyb20gdGhlIE9wZW5YVCBmb2xrIHRvCmNvbXBsZXRlbHkgb3ZlcmhhdWwg
aG93IHRoYXQgbWVjaGFuaXNtIHdvcmtzICh3aGljaCB3aWxsIGluIHByYWN0aWNlCnJlbW92ZSB0
aGUgY29tbWFuZCBsaW5lIHBhcmFtZXRlcikuCgpHaXZlbiBib3RoIG9mIHRoZXNlIGFzcGVjdHMs
IEknbSB0ZW1wdGVkIHRvIGxlYXZlIGl0IGFzLWlzIGZvciBub3cuCgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
