Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C7E8BB4
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:22:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPTHJ-0004P1-MK; Tue, 29 Oct 2019 15:19:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPTHI-0004Ot-DE
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:19:24 +0000
X-Inumbo-ID: 7c64db62-fa5f-11e9-9515-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c64db62-fa5f-11e9-9515-12813bfff9fa;
 Tue, 29 Oct 2019 15:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572362363;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=NsiEfX6kZTB5UXEv9m0qvbfORQ3VlBQotma/AHRQy3g=;
 b=WcggvzXgflfrD39xUyheyvjAvhmnCdCxRpvtdRIgyGP/kB0nkhQavw51
 1BFfLLIfNLiG4Wy3C7npPoAs58+hWcTVYvhn8l7JpgMSTAhc4mXvk+Xc6
 03uIUmTDV9vQk5FzkSD5zJbkptKtBR4nh1oj8TwRlXFtns7F8raLRfvSz s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I1ArWClqdUYXcabMy8nG4xXCICBqFi9vlfENeygBkzw6Dk4b1U/NFZBJk7ZybSokSpwQII53D4
 JYc4TNp7oZg7k/7a6qIzdQJvBZ5r82LZZZNjYXNGYXT6uA4DWWQ8xk6UOPSaSwCpYetk01LgGq
 uuhXWF1DmFTqNraKQCV3PWVMTrHpGp4mEOcGoe4gbzh5VorKusuehbbKCZ/n9M9XaERBeyYSg7
 uzpJlgSdgF7kgyGNu8/8VSEP81PMLWD7kjNsX+lDKQidEEn76oUm/BtSvMww8k4GkTb5jbdQTz
 tJk=
X-SBRS: 2.7
X-MesageID: 8032238
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="8032238"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23992.22647.863594.403607@mariner.uk.xensource.com>
Date: Tue, 29 Oct 2019 15:19:19 +0000
To: Oleksandr Grytsov <al1img@gmail.com>
In-Reply-To: <20191028182216.3882-2-al1img@gmail.com>
References: <20191028182216.3882-1-al1img@gmail.com>
 <20191028182216.3882-2-al1img@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 1/1] libxl/gentypes: add range init to
 array elements in json parsing
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "wl@xen.org" <wl@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYxIDEvMV0gbGlieGwvZ2VudHlwZXM6
IGFkZCByYW5nZSBpbml0IHRvIGFycmF5IGVsZW1lbnRzIGluIGpzb24gcGFyc2luZyIpOgo+IEZy
b206IE9sZWtzYW5kciBHcnl0c292IDxvbGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KPiAKPiBB
ZGQgaW5pdGlhbGl6YXRpb24gb2YgYXJyYXkgZWxlbWVudHMgaW4gcGFyc2UganNvbiBmdW5jdGlv
bi4KPiAKPiBDdXJyZW50bHksIGFycmF5IGVsZW1lbnRzIGFyZSBpbml0aWFsaXplZCB3aXRoIGNh
bGxvYy4gV2hpY2ggbWVhbnMKPiBpbml0aWFsaXplIGFsbCBlbGVtZW50IGZpZWxkcyB3aXRoIHpl
cm8gdmFsdWVzLiBJZiBlbnRyaWVzIGFyZSBtaXNzZWQgaW4KPiBqc29uIGZvciBzdWNoIGZpZWxk
cywgaXQgd2lsbCBiZSBlcXVhbCB0byB6ZXJvIGluc3RlYWQgb2YgZGVmYXVsdCB2YWx1ZXMuCj4g
VGhlIGZpeCBpcyB0byBhZGQgcmFuZ2UgaW5pdCBmdW5jdGlvbiBiZWZvcmUgcGFyc2luZyBhcnJh
eSBlbGVtZW50IGZvcgo+IHN0cnVjdHVyZXMgd2hpY2ggaGF2ZSBkZWZpbmVkIHJhbmdlIGluaXQg
ZnVuY3Rpb24uCgpJIHRoaW5rIHlvdSBoYXZlIGFjY3VyYXRlbHkgaWRlbnRpZmllZCBhIGJ1Zy4g
IFRoYW5rIHlvdS4KSSBoYXZlIGV5ZWJhbGxlZCB0aGUgZGlmZiB0byB0aGUgb3V0cHV0IGFuZCBp
dCBsb29rcyBwbGF1c2libGUgYXMgZmFyCmFzIGl0IGdvZXMuCgpIb3dldmVyLAoKPiAgICAgICAg
ICBzICs9ICIgICAgZm9yIChpPTA7ICh0PWxpYnhsX19qc29uX2FycmF5X2dldCh4LGkpKTsgaSsr
KSB7XG4iCj4gKyAgICAgICAgaWYgdHkuZWxlbV90eXBlLmluaXRfZm4gaXMgbm90IE5vbmUgYW5k
IHR5LmVsZW1fdHlwZS5hdXRvZ2VuZXJhdGVfaW5pdF9mbjoKPiArICAgICAgICAgICAgcyArPSBp
bmRlbnQgKyAiICAgICIrIiVzX2luaXQoJiVzW2ldKTtcbiIgJSAodHkuZWxlbV90eXBlLnR5cGVu
YW1lLCB2KQo+ICAgICAgICAgIHMgKz0gbGlieGxfQ190eXBlX3BhcnNlX2pzb24odHkuZWxlbV90
eXBlLCAidCIsIHYrIltpXSIsCgpJIHRoaW5rIG9wZW4tY29kaW5nIHRoZSB1c2Ugb2YgaW5pdF9m
biBpcyB3cm9uZyBoZXJlLiAgSSB3b3JyeSB0aGF0CnRoZSBlZmZlY3Qgd291bGQgYmUgdG8gZmFp
bCB0byBpbml0aWFsaXNlIHNvbWUgdGhpbmdzOiBpbiBwYXJ0aWN1bGFyLAp0aGluZ3Mgd2l0aCBh
biBpbml0X3ZhbCBidXQgbm8gaW5pdF9mbi4KCkxvb2tpbmcgYXQgb3RoZXIgcGxhY2VzIHdoZXJl
IGluaXRfZm4gaXMgdXNlZDoKCiAqIF9saWJ4bF9DX3R5cGVfaW5pdCBpcyB1c2VkIGZvciBnZW5l
cmF0aW5nIHRoZSBib2R5IG9mICVzX2luaXQuCiAgIFVzaW5nIHRoZSBvdXRwdXQgb2YgdGhhdCB3
b3VsZCBvYnZpb3VzbHkgYmUgbG9naWNhbGx5IGNvcnJlY3QgaGVyZSwKICAgYnV0IGl0J3MgcHJv
YmFibHkgdW5kZXNpcmFibGUgYmVjYXVzZSBpdCB3b3VsZCBlbWl0IGEgcmVwZXRpdGlvbiBvZgog
ICB0aGUgcGVyLWZpZWxkIGluaXRpYWxpc2VycyBmb3IgYWdncmVnYXRlcy4gIEl0IGNvbnRhaW5z
IGNvZGUgd2hpY2gKICAgdHJpZXMgdmFyaW91cyBzdHJhdGVnaWVzIGZvciBpbml0aWFsaXNhdGlv
bi4KCiAqIGxpYnhsX0NfdHlwZV9tZW1iZXJfaW5pdCBpcyBhIHNwZWNpYWwgY2FzZSBmb3IgdHlw
ZWQgdW5pb25zLCB3aGljaAogICBpZiB3ZSBnZXQgdGhpbmdzIHJpZ2h0IHdlIHNob3VsZG4ndCBu
ZWVkIHRvIGV4cGxpY2l0bHkgc3BlY2lhbC1jYXNlCiAgIGhlcmUuCgogKiBsaWJ4bF9DX3R5cGVf
Y29weV9kZXByZWNhdGVkIGFsc28gaGFzIGNvZGUgd2hpY2ggdHJpZXMgdmFyaW91cwogICBzdHJh
dGVnaWVzIGZvciBpbml0aWFsaXNhdGlvbi4KCiAqIFRoZSBvdGhlciBwbGFjZXMgYXJlIGp1c3Qg
LmggYW5kIG90aGVyIHNpbWlsYXIgYnVyZWF1Y3JhY3kuCgpJIHRoaW5rIHRoZXJlZm9yZSB0aGF0
IHRoZSBjb2RlIGluIF9saWJ4bF9DX3R5cGVfaW5pdCBvciBpbgpsaWJ4bF9DX3R5cGVfY29weV9k
ZXByZWNhdGVkLCBvciBzb21ldGhpbmcgbGlrZSB0aG9zZSwgbXVzdCBiZSB0aGUKbW9kZWwuCgpB
Z2dyZWdhdGVzLCBpbmNsdWRpbmcgU3RydWN0IGFuZCBLZXllZFVuaW9uLCBhbGwgaGF2ZSBpbml0
X2ZuLiAgKEkKdGhpbmsgdGhlICJvciB0eS5pbml0X2ZuIGlzIE5vbmUiIGF0IGdlbnR5cGVzLnB5
OjE5NyBpcyBuZXZlciB0cnVlLikKRm9yIGFsbCBhZ2dyZWdhdGVzLCB3ZSB3YW50IHRvIGNhbGwg
dGhlIGZ1bmN0aW9uLiAgU28gaW4gdGhhdCByZXNwZWN0LApsaWJ4bF9DX3R5cGVfY29weV9kZXBy
ZWNhdGVkIGlzIG1vcmUgY29ycmVjdC4KCkZvciBub24tYWdncmVnYXRlcyB3aGljaCBoYXZlIGEg
cGxhaW4gdmFsdWUgKGluaXRfdmFsKSwgd2Ugd291bGQKcHJlZmVyIHRvIHNldCB0aGUgdmFsdWUs
IGFzIHRoYXQgaXMgcHJvYmFibHkgc21hbGxlciBjb2RlIGFuZCBmYXN0ZXIKdG9vLiAgQnV0IEkg
dGhpbmsgdGhpcyBpcyB0cnVlIGZvciBsaWJ4bF9DX3R5cGVfY29weV9kZXByZWNhdGVkIHRvby4K
ClNvIEkgdGhpbmsgdGhlIHJpZ2h0IGNvZGUgaXMgc29tZXRoaW5nIGxpa2UgdGhhdCBpbgpsaWJ4
bF9DX3R5cGVfY29weV9kZXByZWNhdGVkLCBidXQgd2l0aCB0aGUgaW5pdF92YWwgY2hlY2sgZmly
c3QuCgpJZGVhbGx5IHdlIHdvdWxkIGNoYW5nZSBsaWJ4bF9DX3R5cGVfY29weV9kZXByZWNhdGVk
IHRvby4KCkkgdGhpbmsgSSB3aWxsIHRyeSBoYXZpbmcgYSBnbyBhdCB0aGlzIG15c2VsZi4gIFdh
dGNoIHRoaXMgc3BhY2UuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
