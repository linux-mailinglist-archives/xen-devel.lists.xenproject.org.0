Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137F0CC06B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 18:23:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGQJI-0000lo-Qf; Fri, 04 Oct 2019 16:20:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UhcM=X5=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iGQJH-0000fZ-7Q
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 16:20:03 +0000
X-Inumbo-ID: d132c6c8-e6c2-11e9-8c93-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d132c6c8-e6c2-11e9-8c93-bc764e2007e4;
 Fri, 04 Oct 2019 16:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570206003;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9EHbAK/WNQynOYOO2MhMFLwoITb/vR6Ss0mGkn0WG1s=;
 b=gchoq8rMu4mRjsHBbMt/tEltofkH8+7NrGWSNLvNuqGr5pekjr7ZYW5X
 8zpqLktiz8iDo97cluSkKy4cH2zqhufksf6yO44KhhG1c07J79G/Ct4i9
 BEsIVJNeyH7+WFXywYtKZ2eEnIdk3oqAu321w10VG7g7Y+pCRAmB+bICe s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: f92g7uHiTUzfiQw+bipyzppuFGpUZ5jUHcrtvXCfm24hLHktqb5KyvrT4fPPJ8oq5UXDQfeFd8
 ly/jc/O3Y/PKpDSzNMEjft6728OfxSi8zjPjiez9cdv6ZsGX8QOuoOGnnKRmFUBIHxNOtKZg8g
 AqP44Imq4h+9pBATQZh26Xixbo24XbntLJcq1SaQ67AXRZ3AcK2RRCH+S4TcNx9ta6wfHe+W8v
 RActw5JaHQKc4G5lcR7phMixWvDQXUDzUpUfz+Ufn6VefqgX0FX4ONh4LBmUQhQNjtO4O6i/ks
 H20=
X-SBRS: 2.7
X-MesageID: 6556232
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6556232"
Date: Fri, 4 Oct 2019 17:19:34 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191004161934.GN1163@perard.uk.xensource.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
 <20191004151707.24844-5-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004151707.24844-5-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 4/6] libxl:
 libxl_domain_need_memory: Make it take a domain_config
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
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDQ6MTc6MDVQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5jIGIvdG9vbHMvbGlieGwv
bGlieGxfbWVtLmMKPiBpbmRleCBmZDZmMzMzMTJlLi4yNmNmMTM2YWMyIDEwMDY0NAo+IC0tLSBh
L3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfbWVtLmMK
PiBAQCAtNDQ2LDIwICs0NDYsMTIgQEAgaW50IGxpYnhsX2dldF9tZW1vcnlfdGFyZ2V0XzB4MDQw
NzAwKAo+ICAgICAgcmV0dXJuIGxpYnhsX19tZW1rYl82NHRvMzIoY3R4LCByYywgbXlfb3V0X3Rh
cmdldCwgb3V0X3RhcmdldCk7Cj4gIH0KPiAgCj4gLWludCBsaWJ4bF9kb21haW5fbmVlZF9tZW1v
cnkobGlieGxfY3R4ICpjdHgsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
bGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmJfaW5mb19pbiwKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50NjRfdCAqbmVlZF9tZW1rYikKPiAraW50IGxpYnhsX19kb21haW5fbmVl
ZF9tZW1vcnlfY2FsY3VsYXRlKGxpYnhsX19nYyAqZ2MsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvICpiX2luZm8sCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90ICpuZWVkX21lbWtiKQo+ICB7Cj4gLSAgICBHQ19J
TklUKGN0eCk7Cj4gLSAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyBiX2luZm9bMV07Cj4gICAg
ICBpbnQgcmM7Cj4gIAo+IC0gICAgbGlieGxfZG9tYWluX2J1aWxkX2luZm9faW5pdChiX2luZm8p
Owo+IC0gICAgbGlieGxfZG9tYWluX2J1aWxkX2luZm9fY29weShjdHgsIGJfaW5mbywgYl9pbmZv
X2luKTsKPiAtCj4gLSAgICByYyA9IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0
KGdjLCBiX2luZm8pOwo+IC0gICAgaWYgKHJjKSBnb3RvIG91dDsKPiAtCj4gICAgICAqbmVlZF9t
ZW1rYiA9IGJfaW5mby0+dGFyZ2V0X21lbWtiOwo+ICAgICAgKm5lZWRfbWVta2IgKz0gYl9pbmZv
LT5zaGFkb3dfbWVta2IgKyBiX2luZm8tPmlvbW11X21lbWtiOwo+ICAKPiBAQCAtNDgyLDkgKzQ3
NCw1NyBAQCBpbnQgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5KGxpYnhsX2N0eCAqY3R4LAo+ICAg
ICAgcmMgPSAwOwo+ICBvdXQ6Cj4gICAgICBHQ19GUkVFOwoKVGhpcyBHQ19GUkVFIHNob3VsZCBi
ZSByZW1vdmVkLgoKPiAtICAgIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX2Rpc3Bvc2UoYl9pbmZv
KTsKPiAgICAgIHJldHVybiByYzsKPiArfQo+ICAKClRoZSByZXN0IGxvb2tzIGZpbmUuIFNvIHdp
dGggdGhlIGV4dHJhIEdDX0ZSRUUgcmVtb3ZlZDoKUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJE
IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJE
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
