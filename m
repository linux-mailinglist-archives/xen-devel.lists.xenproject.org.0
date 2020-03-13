Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC821848FB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 15:16:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCl53-0007KA-DO; Fri, 13 Mar 2020 14:14:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDBU=46=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jCl51-0007K5-LK
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 14:14:27 +0000
X-Inumbo-ID: f20c8654-6534-11ea-b313-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f20c8654-6534-11ea-b313-12813bfff9fa;
 Fri, 13 Mar 2020 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584108866;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Fv2IffDP4QGzOjz6NtHbY6TaS29SpN5DkC8B0sJ/oNQ=;
 b=Xy4y9gxYrJrKqjuZESvHaoguq/jaJ/scYO4pE/NVmQsgSyDymUOi5B2l
 kylD+HRL9pvfQi4y7RzpogIdAeDSb6uWkn8Xi3xYUS601LuKVd4EJZgjg
 JcTogpErzIXU96ysU58DpQbN6IboNpVtNNjRADMchV/aN6i5Zsl4mie0l E=;
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
IronPort-SDR: y7ZGnXyESEpFPbXK/9DYCuqw3bxM6Ghmm/7N/hVkWj37+Jw9nQ4IQZHI716IFbt0y6jVbrL2QL
 fBZcEZdxD4teRvDG8pWxbf3ykKPBGfLy8F/7X66o4TSaUcgkRobPvQqsekAzHGNUg0CNPVqfP9
 0HnlJ5o/WscR1xsZAPquiKBUCkVoLNXyNQESoQUBnKTBJFcKExDH59NpNPQiXCJ9ljvDfDPqBI
 m0S2Jr7H/2nZJbKNVCTKyp22j8B4DyqlALVeh9A3GO75dHBWB3UkYt4Yv3c+sEn47ILsvtVo0w
 f94=
X-SBRS: 2.7
X-MesageID: 14333513
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,548,1574139600"; d="scan'208";a="14333513"
To: Jan Beulich <jbeulich@suse.com>
References: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
 <7afde7ff-7a23-acd3-0322-87c0b862b7ee@suse.com>
 <a13318ad-0bc2-eb55-bba3-68e441098343@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7e5e1b2a-ca0c-f0b3-a1b6-72ca7edd93f9@citrix.com>
Date: Fri, 13 Mar 2020 14:14:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a13318ad-0bc2-eb55-bba3-68e441098343@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Ping: [PATCH v2] AMD/IOMMU: fix off-by-one in
 amd_iommu_get_paging_mode() callers
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDMvMjAyMCAxMToyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMDMuMjAyMCAx
MjowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IGFtZF9pb21tdV9nZXRfcGFnaW5nX21vZGUoKSBl
eHBlY3RzIGEgY291bnQsIG5vdCBhICJtYXhpbXVtIHBvc3NpYmxlIgo+PiB2YWx1ZS4gUHJpb3Ig
dG8gYjRmMDQyMjM2YWUwIGRyb3BwaW5nIHRoZSByZWZlcmVuY2UsIHRoZSB1c2Ugb2Ygb3VyIG1p
cy0KPj4gbmFtZWQgIm1heF9wYWdlIiBpbiBhbWRfaW9tbXVfZG9tYWluX2luaXQoKSBtYXkgaGF2
ZSBsZWFkIHRvIHN1Y2ggYQo+PiBtaXN1bmRlcnN0YW5kaW5nLiBJbiBhbiBhdHRlbXB0IHRvIGF2
b2lkIHN1Y2ggY29uZnVzaW9uIGluIHRoZSBmdXR1cmUsCj4+IHJlbmFtZSB0aGUgZnVuY3Rpb24n
cyBwYXJhbWV0ZXIgYW5kIC0gd2hpbGUgYXQgaXQgLSBjb252ZXJ0IGl0IHRvIGFuCj4+IGlubGlu
ZSBmdW5jdGlvbi4KPj4KPj4gQWxzbyByZXBsYWNlIGEgbGl0ZXJhbCA0IGJ5IGFuIGV4cHJlc3Np
b24gdHlpbmcgaXQgdG8gYSB3aWRlciB1c2UKPj4gY29uc3RhbnQsIGp1c3QgbGlrZSBhbWRfaW9t
bXVfcXVhcmFudGluZV9pbml0KCkgZG9lcy4KPj4KPj4gRml4ZXM6IGVhMzg4Njc4MzFkYSAoIng4
NiAvIGlvbW11OiBzZXQgdXAgYSBzY3JhdGNoIHBhZ2UgaW4gdGhlIHF1YXJhbnRpbmUgZG9tYWlu
IikKPj4gRml4ZXM6IGI0ZjA0MjIzNmFlMCAoIkFNRC9JT01NVTogQ2Vhc2UgdXNpbmcgYSBkeW5h
bWljIGhlaWdodCBmb3IgdGhlIElPTU1VIHBhZ2V0YWJsZXMiKQo+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiB2MjogQ29udmVydCBhbWRf
aW9tbXVfZ2V0X3BhZ2luZ19tb2RlKCkgaXRzZWxmIHRvIGlubGluZSBmdW5jdGlvbiwKPj4gICAg
IGNoYW5naW5nIGl0c3MgcGFyYW1ldGVyJ3MgbmFtZS4KPiBQaW5nPyBBbnl0aGluZyBlbHNlIG5l
ZWRlZCBoZXJlLCBiZXlvbmQgYWRkcmVzc2luZyB5b3VyIHYxIGNvbW1lbnRzPwoKU29ycnkgLSBm
ZWxsIHRocm91Z2ggdGhlIGNyYWNrcy4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
