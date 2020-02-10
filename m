Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8A4157D6D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 15:32:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1A3E-0005EC-Na; Mon, 10 Feb 2020 14:28:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qaH/=36=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j1A3D-0005E7-As
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 14:28:39 +0000
X-Inumbo-ID: a08886ac-4c11-11ea-b4d2-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a08886ac-4c11-11ea-b4d2-12813bfff9fa;
 Mon, 10 Feb 2020 14:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581344918;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=wwipBhfqx0TmB/Xl5x/XOTSFVdjnYKX8cxm4FhRXYNA=;
 b=YwQQA8Y2CQ914Cvb9zrq6l/h+1zgnIblcwASgh36KkLM3hmocpHLR+zH
 O70QNfT/EI2mLF+s1T5kqkcvvzc8I9b0T2o7AYEuMUuuPWiQM28gr+3/y
 EVgXiAwEI3zMX91TUunbWfilAAYz6a/3nR6wmYcrtEH/Gqo04bw4k7Suf U=;
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
IronPort-SDR: e9TAtR6u4sJ3DdaBUkZv1d5VHO9mAj/r0ZJxgWL9a5iAlE87Kt4XvUhlb3NCzSdCy9ykUf89Xo
 XiMJ1EGhKO6qSQ+oXUWts3+Id6ARme5OkZkiMRwjG51sH5mnye8uZbetKNTCq40dvISvqvbYfa
 I9ih0YNLmZC4b9+9RHLCxWGDykZfRsNIR3EGUdaEotuaaAf54kUW0LFV+OEa+CcF6qUn3WOJTI
 Z+MLZuw2kiUD8nLIa28MHNx+Cu8vslHYjZOjge+Xxqy5oDh4t5H65wcXXA8OqFqFEjMFzGdV4q
 1ng=
X-SBRS: 2.7
X-MesageID: 12639511
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12639511"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
 <056a856a-147e-612b-d476-50be80406581@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2d25edcb-908a-5318-830b-8811abb125ef@citrix.com>
Date: Mon, 10 Feb 2020 14:28:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <056a856a-147e-612b-d476-50be80406581@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 3/3] AMD/IOMMU: replace a few literal numbers
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDIvMjAyMCAwOTo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW50cm9kdWNlIElPTU1V
X1BERV9ORVhUX0xFVkVMX3tNSU4sTUFYfSB0byByZXBsYWNlIGxpdGVyYWwgMSwgNiwgYW5kIDcK
PiBpbnN0YW5jZXMuIFdoaWxlIGRvaW5nIHNvIHJlcGxhY2UgdHdvIHVzZXMgb2YgbWVtc2V0KCkg
YnkgaW5pdGlhbGl6ZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKVGhpcyBkb2VzIG5vdCBsb29rIHRvIGJlIGFuIGltcHJvdmVtZW50LsKgIElP
TU1VX1BERV9ORVhUX0xFVkVMX01JTiBpcwpkZWZpbml0ZWx5IGJvZ3VzLCBhbmQgaW4gYWxsIGNh
c2VzLCBhIGxpdGVyYWwgMSBpcyBiZXR0ZXIsIGJlY2F1c2UgdGhhdAppcyBob3cgd2UgZGVzY3Jp
YmUgcGFnZXRhYmxlIGxldmVscy4KClNvbWV0aGluZyB0byByZXBsYWNlIGxpdGVyYWwgNi83IHBy
b2JhYmx5IGlzIG9rLCBidXQgZG9lc24ndCB3YW50IHRvIGJlCmRvbmUgbGlrZSB0aGlzLgoKVGhl
IG1ham9yaXR5IG9mIHRoZSBwcm9ibGVtcyBoZXJlIGFzIGNhdXNlZCBieSBpb21tdV9wZGVfZnJv
bV9kZm4oKSdzCnNpbGx5IEFCSS7CoCBUaGUgcHRfbWZuW10gYXJyYXkgaXMgcHJvYmxlbWF0aWMg
KGJlY2F1c2UgaXQgaXMgdXNlZCBhcyBhCjEtYmFzZWQgYXJyYXksIG5vdCAwLWJhc2VkKSBhbmQg
dXNlbGVzcyBiZWNhdXNlIGJvdGggY2FsbGVycyBvbmx5IHdhbnQKdGhlIDRrLWVxdWl2ZWxlbnQg
bWZuLsKgIEZpeGluZyB0aGUgQUJJIGdldHMgcmlkIG9mIHF1aXRlIGEgbG90IG9mIHdhc3RlZApz
dGFjayBzcGFjZSwgZXZlcnkgdXNlIG9mICcxJywgYW5kIGV2ZXJ5IHVwcGVyIGJvdW5kIG90aGVy
IHRoYW4gdGhlIGJ1ZwpvbiBhbmQgYW1kX2lvbW11X2dldF9wYWdpbmdfbW9kZSgpLgoKPiAtLS0K
PiBUQkQ6IFdlIHNob3VsZCByZWFsbHkgaG9ub3IgdGhlIGhhdHMgZmllbGQgb2YgdW5pb24KPiAg
ICAgIGFtZF9pb21tdV9leHRfZmVhdHVyZXMsIGJ1dCB0aGUgc3BlY2lmaWNhdGlvbiAob3IgYXQg
bGVhc3QgdGhlCj4gICAgICBwYXJ0cyBJIGRpZCBsb29rIGF0IGluIHRoZSBjb3Vyc2Ugb2YgcHV0
dGluZyB0b2dldGhlciB0aGlzIHBhdGNoKQo+ICAgICAgaXMgdW5jbGVhciBhYm91dCB0aGUgbWF4
aW11bSB2YWxpZCB2YWx1ZSBpbiBjYXNlIEVGUlN1cCBpcyBjbGVhci4KCkl0IGlzIGF2YWlsYWJs
ZSBmcm9tIFBDSSBjb25maWcgc3BhY2UgKE1pc2MwIHJlZ2lzdGVyLCBjYXArMHgxMCkgZXZlbiBv
bgpmaXJzdCBnZW4gSU9NTVVzLCBhbmQgdGhlIElWUlMgdGFibGUgaW4gVHlwZSAxMC4KCkknbSBo
b25lc3RseSBub3Qgc3VyZSB3aHkgdGhlIGluZm9ybWF0aW9uIHdhcyBkdXBsaWNhdGVkIGludG8g
RUZSLCBvdGhlcgp0aGFuIHBlcmhhcHMgZm9yIHByb3ZpZGluZyB0aGUgaW5mb3JtYXRpb24gaW4g
YSBtb3JlIHVzZWZ1bCBmb3JtYXQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
