Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38343CBFDD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:56:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGPu1-0005p0-1w; Fri, 04 Oct 2019 15:53:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UhcM=X5=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iGPtz-0005ou-7H
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:53:55 +0000
X-Inumbo-ID: 29c87282-e6bf-11e9-975c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29c87282-e6bf-11e9-975c-12813bfff9fa;
 Fri, 04 Oct 2019 15:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570204433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FsUXeqf9HUL+R8G245Z/Z9KB7Jb4t7DcBkwrJSxDlnU=;
 b=NM2fQTzkI5SCXVzLsE9nHG3b+4LsLXFmF6/nYH+UjuN2JLaYqEUm8V0c
 9ZDRUTsmr6DO214/H5swOIJDRJrbPa5+hA/uargr1JjHGEaJCwjW8CB0m
 gqj6cu7PsJGYbIptV6w+duSIfQPJlgs4ABxOnMwDoQQeRWL9/rMHUHpg5 M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ad15OP1jI54wlNguOWmmK+q0eGst3YjkbDyVEzCmIlzjOKdo0X2nwe/NojSyb2POW/QXyZTEhQ
 4AhHxWrD3zYRYPvvTlNEkXJkDpbq5RFNwOAknbHT1NGy1vbvKifT70/HImENtMGS/om/JqCjoT
 GGLsS0OtE1iuxNhroACsvyICODVDNA0UGCx9w5ogHZjy5bX0OtW6pTDueUBVGjRgpAwl1agaL2
 TjAkdq5GlryZTT1+RiWPJ99NVKMqpbaKDnwZ1bEy5Gik1aorMnVo+cSDodaMllx6GtdngrRIBK
 yFI=
X-SBRS: 2.7
X-MesageID: 6479731
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6479731"
Date: Fri, 4 Oct 2019 16:53:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191004155349.GM1163@perard.uk.xensource.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
 <20191004151707.24844-4-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004151707.24844-4-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 3/6] libxl:
 libxl__domain_config_setdefault: New function
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

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDQ6MTc6MDRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQnJlYWsgb3V0IHRoaXMgaW50byBhIG5ldyBmdW5jdGlvbi4gIFdlIGFyZSBnb2luZyB0
byB3YW50IHRvIGNhbGwgaXQKPiBmcm9tIGEgbmV3IGNhbGwgc2l0ZS4KPiAKPiBVbmZvcnR1bmF0
ZWx5IG5vdCBhbGwgb2YgdGhlIGRlZmF1bHRzIGNhbiBiZSBtb3ZlZCBpbnRvIHRoZSBuZXcKPiBm
dW5jdGlvbiB3aXRob3V0IGNoYW5naW5nIHRoZSBvcmRlciBpbiB3aGljaCB0aGluZ3MgYXJlIGRv
bmUuICBUaGF0Cj4gZG9lcyBub3Qgc2VlbSB3aXNlIGF0IHRoaXMgc3RhZ2Ugb2YgdGhlIHJlbGVh
c2UuICBUaGUgZWZmZWN0IGlzIHRoYXQKPiBhZGRpdGlvbmFsIGNhbGxzIHRvIGxpYnhsX19kb21h
aW5fY29uZmlnX3NldGRlZmF1bHQgKHdoaWNoIGFyZSBnb2luZwo+IHRvIGJlIGludHJvZHVjZWQp
IGRvIG5vdCBxdWl0ZSBzZXQgZXZlcnl0aGluZy4gIEJ1dCB0aGV5IHdpbGwgZG8gd2hhdAo+IGlz
IG5lZWRlZC4gIEFmdGVyIFhlbiA0LjEzIGlzIGRvbmUsIHdlIHNob3VsZCBtb3ZlIHRob3NlIHNl
dHRpbmdzIGludG8KPiB0aGUgcmlnaHQgb3JkZXIuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2Uu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Cj4gLS0tCj4gIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jICAgfCA0MCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVy
bmFsLmggfCAgMyArKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMg
Yi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+IGluZGV4IDA5OTc2MWEyZDcuLjQ1N2JlYjY0
NjIgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiArKysgYi90b29s
cy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+IEBAIC04NjIsMjIgKzg2MiwxNCBAQCBzdGF0aWMgdm9p
ZCBkb21jcmVhdGVfZGVzdHJ1Y3Rpb25fY2IobGlieGxfX2VnYyAqZWdjLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2RvbWFpbl9kZXN0cm95X3N0YXRlICpk
ZHMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpOwo+ICAK
PiAtc3RhdGljIHZvaWQgaW5pdGlhdGVfZG9tYWluX2NyZWF0ZShsaWJ4bF9fZWdjICplZ2MsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2RvbWFpbl9jcmVhdGVf
c3RhdGUgKmRjcykKPiAraW50IGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1bHQobGlieGxf
X2djICpnYywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9t
YWluX2NvbmZpZyAqZF9jb25maWcsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IGRvbWlkKQo+ICB7Cj4gLSAgICBTVEFURV9BT19HQyhkY3MtPmFvKTsKPiAg
ICAgIGxpYnhsX2N0eCAqY3R4ID0gbGlieGxfX2djX293bmVyKGdjKTsKPiAtICAgIHVpbnQzMl90
IGRvbWlkOwo+IC0gICAgaW50IGksIHJldDsKPiArICAgIGludCByZXQ7Cj4gICAgICBib29sIHBv
ZF9lbmFibGVkID0gZmFsc2U7Cj4gIAo+IC0gICAgLyogY29udmVuaWVuY2UgYWxpYXNlcyAqLwo+
IC0gICAgbGlieGxfZG9tYWluX2NvbmZpZyAqY29uc3QgZF9jb25maWcgPSBkY3MtPmd1ZXN0X2Nv
bmZpZzsKPiAtICAgIGNvbnN0IGludCByZXN0b3JlX2ZkID0gZGNzLT5yZXN0b3JlX2ZkOwo+IC0K
PiAtICAgIGRvbWlkID0gZGNzLT5kb21pZF9zb2Z0X3Jlc2V0Owo+IC0gICAgbGlieGxfX2RvbWFp
bl9idWlsZF9zdGF0ZV9pbml0KCZkY3MtPmJ1aWxkX3N0YXRlKTsKPiAtCj4gICAgICBpZiAoZF9j
b25maWctPmNfaW5mby5zc2lkX2xhYmVsKSB7Cj4gICAgICAgICAgY2hhciAqcyA9IGRfY29uZmln
LT5jX2luZm8uc3NpZF9sYWJlbDsKPiAgICAgICAgICByZXQgPSBsaWJ4bF9mbGFza19jb250ZXh0
X3RvX3NpZChjdHgsIHMsIHN0cmxlbihzKSwKPiBAQCAtMTAwOCw2ICsxMDAwLDI3IEBAIHN0YXRp
YyB2b2lkIGluaXRpYXRlX2RvbWFpbl9jcmVhdGUobGlieGxfX2VnYyAqZWdjLAo+ICAgICAgICAg
IGdvdG8gZXJyb3Jfb3V0Owo+ICAgICAgfQo+ICAKPiArICAgIHJldCA9IDA7Cj4gKyBlcnJvcl9v
dXQ6Cj4gKyAgICByZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBpbml0aWF0ZV9k
b21haW5fY3JlYXRlKGxpYnhsX19lZ2MgKmVnYywKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9zdGF0ZSAqZGNzKQo+ICt7Cj4gKyAgICBT
VEFURV9BT19HQyhkY3MtPmFvKTsKPiArICAgIHVpbnQzMl90IGRvbWlkOwo+ICsgICAgaW50IGks
IHJldDsKPiArCj4gKyAgICAvKiBjb252ZW5pZW5jZSBhbGlhc2VzICovCj4gKyAgICBsaWJ4bF9k
b21haW5fY29uZmlnICpjb25zdCBkX2NvbmZpZyA9IGRjcy0+Z3Vlc3RfY29uZmlnOwo+ICsgICAg
Y29uc3QgaW50IHJlc3RvcmVfZmQgPSBkY3MtPnJlc3RvcmVfZmQ7Cj4gKwo+ICsgICAgZG9taWQg
PSBkY3MtPmRvbWlkX3NvZnRfcmVzZXQ7Cj4gKyAgICBsaWJ4bF9fZG9tYWluX2J1aWxkX3N0YXRl
X2luaXQoJmRjcy0+YnVpbGRfc3RhdGUpOwo+ICsKPiArICAgIGxpYnhsX19kb21haW5fY29uZmln
X3NldGRlZmF1bHQoZ2MsZF9jb25maWcsZG9taWQpOwoKU2hvdWxkbid0IHlvdSBjaGVjayBmb3Ig
ZXJyb3IgPwoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
