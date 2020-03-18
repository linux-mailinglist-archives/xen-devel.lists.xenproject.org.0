Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD34189A06
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 11:55:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEWJG-0003rR-Q8; Wed, 18 Mar 2020 10:52:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lnqk=5D=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jEWJF-0003rM-W2
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 10:52:26 +0000
X-Inumbo-ID: 8c762ae0-6906-11ea-bac1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c762ae0-6906-11ea-bac1-12813bfff9fa;
 Wed, 18 Mar 2020 10:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584528744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tG3nUkT9+Hw7EqtUahoaLm15ZYKv4Se/9TjGyOj9sI8=;
 b=eKQk362mspx2A6PESB6u/3ZsD26O1sUTNraRhO+Rv7iEn7m0SEU5DQ3U
 1P31FhrKyTWcxtyJvtS7SfeVZkRKSe8iksuaj892x485o3oaEYCZfgc11
 axcuOPbDGUIM03LH8WaGjTuOKg+idLzEzbneDHHNPxWyqnFFQV5e3jYP+ E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6pXLkNG7pVxTN7rXlyfAf5V19fri5OST4YiPyd6jaUquD0PSfPG+F/qRr09BORTAMeyzKLRcWg
 9lp1yZe1uMZvntKLkc3Ag0WQGqe0MX7RnWd8j1Rhh6qe+KKeYrvRjIK1Wrobr2rc6NGFEz+LNd
 GZQa+TtmPfosufpwgplPPkvCj3165Hk7PgFrFKXkFOAUwNBcdDiLdoNYAd2SIZdGGVqxktuXSl
 bq1x7eP1pZoQoCOncnZVOEt/wIvYthGGJaptYAnguIP4bDqtGJWNikjbmmvlRJxCPBsr95P6yq
 Ywc=
X-SBRS: 2.7
X-MesageID: 14170693
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,566,1574139600"; d="scan'208";a="14170693"
Date: Wed, 18 Mar 2020 10:52:18 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200318105218.GD4088@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-18-anthony.perard@citrix.com>
 <20200227130925.GO24458@Air-de-Roger.citrite.net>
 <71853852-f44d-268f-e926-5c9f19d666a6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71853852-f44d-268f-e926-5c9f19d666a6@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v3 17/23] xen/build: Start using
 if_changed
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMDU6MDA6MjhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjcuMDIuMjAyMCAxNDowOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgRmViIDI2LCAyMDIwIGF0IDExOjMzOjQ5QU0gKzAwMDAsIEFudGhvbnkgUEVSQVJEIHdy
b3RlOgo+ID4+IEBAIC0xNjEsMjkgKzE3Myw0NyBAQCBlbHNlCj4gPj4gIAkkKENDKSAkKGNfZmxh
Z3MpIC1jICQ8IC1vICRACj4gPj4gIGVuZGlmCj4gPj4gIAo+ID4+IC0lLm86ICUuUyBNYWtlZmls
ZQo+ID4+IC0JJChDQykgJChhX2ZsYWdzKSAtYyAkPCAtbyAkQAo+ID4+ICtxdWlldF9jbWRfY2Nf
b19TID0gQ0MgICAgICAkQAo+ID4+ICtjbWRfY2Nfb19TID0gJChDQykgJChhX2ZsYWdzKSAtYyAk
PCAtbyAkQAo+ID4+ICsKPiA+PiArJS5vOiAlLlMgRk9SQ0UKPiA+PiArCSQoY2FsbCBpZl9jaGFu
Z2VkLGNjX29fUykKPiA+PiArCj4gPj4gKwo+ID4+ICtxdWlldF9jbWRfb2JqX2luaXRfbyA9IElO
SVRfTyAgJEAKPiA+IAo+ID4gSU5JVF9PIHNlZW1zIGtpbmQgb2Ygd2VpcmQsIG1heWJlIGp1c3Qg
dXNpbmcgQ0hFQ0sgd291bGQgYmUgT0s/Cj4gCj4gQ0hFQ0sgaXMgbm90IGV4cHJlc3Npbmcgd2hh
dCdzIGdvaW5nIG9uIC0gb25lIGNvdWxkL3dvdWxkIGltcGx5Cj4gdGhhdCB0aGUgb2JqZWN0IGZp
bGUgZG9lc24ndCBnZXQgY2hhbmdlZCBhdCBhbGwsIGJ1dCBpdHMgc2VjdGlvbnMKPiBnZXQgcmVu
YW1lZC4gSSB0aGluayBJTklUX08gaXMgc3VmZmljaWVudGx5IGV4cHJlc3NpdmUgYXQgbGVhc3QK
PiB0byBwZW9wbGUga25vd2luZyB0aGUgYnVpbGQgc3lzdGVtLgoKT0JKQ09QWSBpbnN0ZWFkIG9m
IElOSVRfTyBjb3VsZCB3b3JrLCBzaW5jZSBpdCdzIGdvaW5nIHRvIHJlYWQKIk9CSkNPUFkgYm9v
dC5pbml0Lm8iIHdoaWNoIHNob3VsZCBiZSBvYnZpb3VzIGVub3VnaCB0aGF0IHRoZSBvYmplY3QK
ZmlsZSBpcyBnZW5lcmF0ZWQuIEJ1dCBJJ2xsIGxlYXZlIElOSVRfTyBmb3Igbm93LgoKPiA+IFRo
ZSByZXN0IExHVE06Cj4gPiAKPiA+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPiAKPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
