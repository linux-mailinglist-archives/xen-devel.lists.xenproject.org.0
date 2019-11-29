Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B245D10D5D1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:47:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaff2-0007ly-T6; Fri, 29 Nov 2019 12:46:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wOh1=ZV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iaff1-0007lr-Ja
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:46:11 +0000
X-Inumbo-ID: 38111282-12a6-11ea-a3e5-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38111282-12a6-11ea-a3e5-12813bfff9fa;
 Fri, 29 Nov 2019 12:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575031571;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NxSAlR9iF4SdF0w5jrMYIsgCyN7nblC1oAe6PsXftHo=;
 b=FLNTw6N0Tjwv0bSCTpZWuMhYxdnqQfdc3Gy0e/1xEpKiwVw2hMLe6a5b
 IOHER0uRXl3TZwNGzPH6Q0Yc4ZFHZodrVlHZuWMhtvOSWNfzuBUy1UUNa
 Q/VL5sPfZljy4iGjllJSRBFhc01UHGEgoXN7QRnlg7MXjO1HqI1zJWES2 w=;
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
IronPort-SDR: 7USpErilK1MQ9NsWZCLKIarJ2tzY2VbKHxf6i4FXd8NB9W8MXJZNgFj9IZ9ng8RuB16KKvxywg
 5mEHqqFxmjTq89IIBZQYfbIrdWlseHL+wbM9KDPZuSlX4lwynY0FpR4qA2stGi6XewojfEsVFq
 1V93cgG/IeKmjlqIV7UjMS8D7ygF34Tc5yyM63Q0gN4MjouROeHemxlIzxaeWRG4qDs51vkXQc
 ztVf1sG/5KdpP7kk7hrH+/kNgPpAUfOvXwFjmDN4B8KsoebaygUpL8zsGM6tJBqA+lgeGhT7Qg
 x6k=
X-SBRS: 2.7
X-MesageID: 8978300
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8978300"
Date: Fri, 29 Nov 2019 12:46:07 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191129124607.GD1155@perard.uk.xensource.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128165224.2959-1-pdurrant@amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDQ6NTI6MjRQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bC5oIGIvdG9vbHMvbGlieGwvbGli
eGwuaAo+IGluZGV4IDQ5YjU2ZmExYTMuLmEyYTVkMzIxYzUgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMv
bGlieGwvbGlieGwuaAo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsLmgKPiBAQCAtMzY0LDggKzM2
NCw4IEBACj4gICAqLwo+ICAjZGVmaW5lIExJQlhMX0hBVkVfQlVJTERJTkZPX0dSQU5UX0xJTUlU
UyAxCj4gIAo+IC0jZGVmaW5lIExJQlhMX01BWF9HUkFOVF9GUkFNRVNfREVGQVVMVCAzMgo+IC0j
ZGVmaW5lIExJQlhMX01BWF9NQVBUUkFDS19GUkFNRVNfREVGQVVMVCAxMDI0Cj4gKyNkZWZpbmUg
TElCWExfTUFYX0dSQU5UX0ZSQU1FU19ERUZBVUxUIC0xCj4gKyNkZWZpbmUgTElCWExfTUFYX01B
UFRSQUNLX0ZSQU1FU19ERUZBVUxUIC0xCj4gIAo+ICAvKgo+ICAgKiBMSUJYTF9IQVZFX0JVSUxE
SU5GT18qIGluZGljYXRlcyB0aGF0IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvIGhhcwo+IGRpZmYg
LS1naXQgYS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgYi90b29scy9saWJ4bC9saWJ4bF90
eXBlcy5pZGwKPiBpbmRleCAwNTQ2ZDc4NjVhLi42M2UyOWJiMmZiIDEwMDY0NAo+IC0tLSBhL3Rv
b2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVz
LmlkbAo+IEBAIC01MTEsOCArNTExLDggQEAgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gPSBTdHJ1
Y3QoImRvbWFpbl9idWlsZF9pbmZvIixbCj4gIAo+ICAgICAgKCJ2bnVtYV9ub2RlcyIsIEFycmF5
KGxpYnhsX3Zub2RlX2luZm8sICJudW1fdm51bWFfbm9kZXMiKSksCj4gIAo+IC0gICAgKCJtYXhf
Z3JhbnRfZnJhbWVzIiwgICAgdWludDMyLCB7J2luaXRfdmFsJzogJ0xJQlhMX01BWF9HUkFOVF9G
UkFNRVNfREVGQVVMVCd9KSwKPiAtICAgICgibWF4X21hcHRyYWNrX2ZyYW1lcyIsIHVpbnQzMiwg
eydpbml0X3ZhbCc6ICdMSUJYTF9NQVhfTUFQVFJBQ0tfRlJBTUVTX0RFRkFVTFQnfSksCj4gKyAg
ICAoIm1heF9ncmFudF9mcmFtZXMiLCAgICBpbnRlZ2VyLCB7J2luaXRfdmFsJzogJ0xJQlhMX01B
WF9HUkFOVF9GUkFNRVNfREVGQVVMVCd9KSwKPiArICAgICgibWF4X21hcHRyYWNrX2ZyYW1lcyIs
IGludGVnZXIsIHsnaW5pdF92YWwnOiAnTElCWExfTUFYX01BUFRSQUNLX0ZSQU1FU19ERUZBVUxU
J30pLAoKVGhhdCdzIGEgY2hhbmdlIGluIHRoZSBsaWJ4bCBBUEksIGNvdWxkIHlvdSBhZGQgYSBM
SUJYX0hBVkVfKiBtYWNybz8KCj4gICAgICAKPiAgICAgICgiZGV2aWNlX21vZGVsX3ZlcnNpb24i
LCBsaWJ4bF9kZXZpY2VfbW9kZWxfdmVyc2lvbiksCj4gICAgICAoImRldmljZV9tb2RlbF9zdHVi
ZG9tYWluIiwgbGlieGxfZGVmYm9vbCksCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhs
dV9jZmcuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsdV9jZmcuYwo+IGluZGV4IDcyODE1ZDI1ZGQuLmNh
ZmM2MzJmYzEgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGx1X2NmZy5jCj4gKysrIGIv
dG9vbHMvbGlieGwvbGlieGx1X2NmZy5jCj4gQEAgLTI2OCw4ICsyNjgsOSBAQCBpbnQgeGx1X2Nm
Z19yZXBsYWNlX3N0cmluZyhjb25zdCBYTFVfQ29uZmlnICpjZmcsIGNvbnN0IGNoYXIgKm4sCj4g
ICAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiAtaW50IHhsdV9jZmdfZ2V0X2xvbmcoY29uc3QgWExV
X0NvbmZpZyAqY2ZnLCBjb25zdCBjaGFyICpuLAo+IC0gICAgICAgICAgICAgICAgICAgICBsb25n
ICp2YWx1ZV9yLCBpbnQgZG9udF93YXJuKSB7Cj4gK2ludCB4bHVfY2ZnX2dldF9ib3VuZGVkX2xv
bmcoY29uc3QgWExVX0NvbmZpZyAqY2ZnLCBjb25zdCBjaGFyICpuLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGxvbmcgbWluLCBsb25nIG1heCwgbG9uZyAqdmFsdWVfciwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgZG9udF93YXJuKSB7Cj4gICAgICBsb25nIGw7
Cj4gICAgICBYTFVfQ29uZmlnU2V0dGluZyAqc2V0Owo+ICAgICAgaW50IGU7Cj4gQEAgLTMwMywx
MCArMzA0LDMxIEBAIGludCB4bHVfY2ZnX2dldF9sb25nKGNvbnN0IFhMVV9Db25maWcgKmNmZywg
Y29uc3QgY2hhciAqbiwKPiAgICAgICAgICAgICAgICAgICAgICBjZmctPmNvbmZpZ19zb3VyY2Us
IHNldC0+bGluZW5vLCBuKTsKPiAgICAgICAgICByZXR1cm4gRUlOVkFMOwo+ICAgICAgfQo+ICsg
ICAgaWYgKGwgPCBtaW4pIHsKPiArICAgICAgICBpZiAoIWRvbnRfd2FybikKPiArICAgICAgICAg
ICAgZnByaW50ZihjZmctPnJlcG9ydCwKPiArICAgICAgICAgICAgICAgICAgICAiJXM6JWQ6IHdh
cm5pbmc6IHZhbHVlIGAlbGQnIGlzIHNtYWxsZXIgdGhhbiBtaW5pbXVtIGJvdW5kICclbGQnXG4i
LAo+ICsgICAgICAgICAgICAgICAgICAgIGNmZy0+Y29uZmlnX3NvdXJjZSwgc2V0LT5saW5lbm8s
IGwsIG1pbik7Cj4gKyAgICAgICAgcmV0dXJuIEVJTlZBTDsKPiArICAgIH0KPiArICAgIGlmIChs
ID4gbWF4KSB7Cj4gKyAgICAgICAgaWYgKCFkb250X3dhcm4pCj4gKyAgICAgICAgICAgIGZwcmlu
dGYoY2ZnLT5yZXBvcnQsCj4gKyAgICAgICAgICAgICAgICAgICAgIiVzOiVkOiB3YXJuaW5nOiB2
YWx1ZSBgJWxkJyBpcyBncmVhdGVyIHRoYW4gbWF4aW11bSBib3VuZCAnJWxkJ1xuIiwKPiArICAg
ICAgICAgICAgICAgICAgICBjZmctPmNvbmZpZ19zb3VyY2UsIHNldC0+bGluZW5vLCBsLCBtYXgp
Owo+ICsgICAgICAgIHJldHVybiBFSU5WQUw7Cj4gKyAgICB9CgpJJ20gbm90IHN1cmUgd2hhdCB3
YXMgdGhlIGludGVudGlvbiB3aXRoIHRoZSBuZXcgZnVuY3Rpb24KeGx1X2NmZ19nZXRfYm91bmRl
ZF9sb25nKCksIGJ1dCBJIGRvbid0IHRoaW5rIGxpYnhsdSBpcyB0aGUgcmlnaHQgcGxhY2UKZm9y
IGl0LiBUaGF0IGZ1bmN0aW9uIGlzIG9ubHkgZ29pbmcgdG8gbWFrZSBpdCBoYXJkZXIgZm9yIHVz
ZXJzIHRvIGZpbmQKbWlzdGFrZXMgaW4gdGhlIGNvbmZpZyBmaWxlLiBJZiBgbicgdmFsdWUgaXMg
b3V0IG9mIGJvdW5kLCBpdCB3aWxsIG9ubHkKZ2V0IGlnbm9yZWQsIGFuZCB4bCB3aWxsIGtlZXAg
Z29pbmcuIEkgdGhpbmsgeGx1X2NmZyBzaG91bGQgb25seSBiZSBhCnBhcnNlciAoYW5kIGNhbiBj
aGVjayBmb3Igc3ludGF4IGVycm9yKS4KCkNhbiB5b3UgbW92ZSB0aGF0IGZ1bmN0aW9uIHRvIHhs
PwoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
