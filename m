Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC4614A796
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 16:55:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw6gR-0002sL-LH; Mon, 27 Jan 2020 15:52:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x5IB=3Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iw6gP-0002sF-VJ
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 15:52:13 +0000
X-Inumbo-ID: fbb3548a-411c-11ea-856a-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbb3548a-411c-11ea-856a-12813bfff9fa;
 Mon, 27 Jan 2020 15:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580140333;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=PT+BK5Yrpv9zjf+n8O2t+oURVJX0QDzWo0towfeR7d0=;
 b=Hxm0/y4DqVBJJ1vl9MUL8E66U7Xmk6V0WnxS/Hafm4UomNV8Oa030moP
 Vl9VJP8DgBsva/zs2HLiP42wM0OJ7sa9lFmAfNytT5XQ4Y0L28X9jq8TW
 TFlHbWkUdIwjBJ6wbElTFXlK5bIEux2H7lJm3OxQiNdJXAvk4ddV1tO8s 8=;
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
IronPort-SDR: YqHIZXvNtryYrtoYsJRKOLdVkkSe4mvAcZtKbc6ChRRgwisTams4vV4UEQ61uGhMHMt+npfiAY
 GBAXEbbHswU/9WLPfkVSBa+JdjYf3VTUQM/O7DFvl5Y/j8EFOmakbFXRXbMpeTfq9WMV39YuW5
 Cs0RksSW+DxtMhYDyQAdtGgaXfmchuWLMKkdx//NSJ5QUtWQuwtc8hPlJxr/xj77R/u/WlzrNE
 jBLDf1nPiyQMeuIHkYDP8Jn9jcEW/f3hnEDPz2dPTrik2dLSTltwvc+pvgTtW4vcfOSxGyOWXE
 rHg=
X-SBRS: 2.7
X-MesageID: 11670769
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11670769"
To: Jan Beulich <jbeulich@suse.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-17-andrew.cooper3@citrix.com>
 <0bb985c9-bb1d-097d-9927-95b0a3b0e216@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <4bb5b13a-1333-d735-c1e3-e1f2a63a4e56@citrix.com>
Date: Mon, 27 Jan 2020 15:52:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0bb985c9-bb1d-097d-9927-95b0a3b0e216@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 16/17] tools/libxc: Restore CPUID/MSR
 data found in the migration stream
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
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDEvMjAyMCAxNDo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMDEuMjAyMCAx
NTozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gV2l0aCBhbGwgb3RoZXIgcGllY2VzIGluIHBs
YWNlLCBpdCBpcyBub3cgc2FmZSB0byByZXN0b3JlIHRoZSBDUFVJRCBhbmQgTVNSCj4+IGRhdGEg
aW4gdGhlIG1pZ3JhdGlvbiBzdHJlYW0sIHJhdGhlciB0aGFuIGRpc2NhcmRpbmcgdGhlbSBhbmQg
dXNpbmcgdGhlIGhpZ2hlcgo+PiBsZXZlbCB0b29sc3RhY2tzIGNvbXBhdGliaWxpdHkgbG9naWMu
Cj4+Cj4+IFdoaWxlIHRoaXMgaXMgYSBzbWFsbCBwYXRjaCwgaXQgaGFzIGxhcmdlIGltcGxpY2F0
aW9ucyBmb3IgbWlncmF0ZWQvcmVzdW1lZAo+PiBkb21haW5zLiAgTW9zdCBvYnZpb3VzbHksIHRo
ZSBDUFUgZmFtaWx5L21vZGVsL3N0ZXBwaW5nIGRhdGEsCj4+IGNhY2hlL3RsYi9ldGMuIHdpbGwg
bm8gbG9uZ2VyIGNoYW5nZSBiZWhpbmQgdGhlIGd1ZXN0cyBiYWNrLgo+Pgo+PiBBbm90aGVyIGNo
YW5nZSBpcyB0aGUgaW50ZXJwcmV0YXRpb24gb2YgdGhlIFhlbmQgY3B1aWQgc3RyaW5ncy4gIFRo
ZSAnaycKPj4gb3B0aW9uIGlzIG5vdCBhIHNlbnNpYmxlIHRoaW5nIHRvIGhhdmUgZXZlciBzdXBw
b3J0ZWQsIGFuZCAncycgaXMgaG93IGhvdyB0aGUKPj4gc3RyZWFtIHdpbGwgZW5kIHVwIGJlaGF2
aW5nLgo+IEknbSBhIGxpdHRsZSBjb25mdXNlZCBJIGd1ZXNzIC0gSSdkIGhhdmUgZXhwZWN0ZWQg
c3VjaCBhIGRlc2NyaXB0aW9uCj4gdG8gbWVhbiB0aGF0IC4uLgo+Cj4+IC0tLSBhL3Rvb2xzL2xp
YnhjL3hjX2NwdWlkX3g4Ni5jCj4+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4+
IEBAIC0yOTEsMTAgKzI5MSw5IEBAIGludCB4Y19zZXRfZG9tYWluX2NwdV9wb2xpY3koeGNfaW50
ZXJmYWNlICp4Y2gsIHVpbnQzMl90IGRvbWlkLAo+PiAgICogICAnMCcgLT4gZm9yY2UgdG8gMAo+
PiAgICogICAneCcgLT4gd2UgZG9uJ3QgY2FyZSAodXNlIGRlZmF1bHQpCj4+ICAgKiAgICdrJyAt
PiBwYXNzIHRocm91Z2ggaG9zdCB2YWx1ZQo+PiAtICogICAncycgLT4gcGFzcyB0aHJvdWdoIHRo
ZSBmaXJzdCB0aW1lIGFuZCB0aGVuIGtlZXAgdGhlIHNhbWUgdmFsdWUKPj4gLSAqICAgICAgICAg
IGFjcm9zcyBzYXZlL3Jlc3RvcmUgYW5kIG1pZ3JhdGlvbi4KPj4gKyAqICAgJ3MnIC0+IGxlZ2Fj
eSBhbGlhcyBmb3IgJ2snCj4gLi4uICdzJyByZW1haW5zIGRvY3VtZW50ZWQgYXMgaXMsIGFuZCAn
aycgdG8gYmVjb21lIGEgbGVnYWN5IGFsaWFzLgoKR2l2ZW4gdGhhdCBzIGhhcyBuZXZlciB3b3Jr
ZWQgaW4gdGhlIHBhc3QsIGsgaXMgdGhlIG9ubHkgcGxhdXNpYmxlIG9uZQp1c2VkIGJ5IHBlb3Bs
ZS4KCkFzIHRoZXkgbWVhbiB0aGUgc2FtZSBub3csIHdlIGNvdWxkIHNwZWNpZnkgaXQgZWl0aGVy
IHdheSBhcm91bmQsIGJ1dAp0aGlzIHdheSByb3VuZCBnaXZlcyB1c2VycyBsZXNzIHdvcmsgdG8g
ZG8uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
