Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B71C188293
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 12:52:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEAiw-0007xa-Nl; Tue, 17 Mar 2020 11:49:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5K2b=5C=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jEAiu-0007xU-Lm
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 11:49:28 +0000
X-Inumbo-ID: 5a8d1033-6845-11ea-b921-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a8d1033-6845-11ea-b921-12813bfff9fa;
 Tue, 17 Mar 2020 11:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584445767;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sDwV0UUirVebxnyU7AEEgFQMjmr9gbhvQZ5r179ctOA=;
 b=PXddY0zYg40gwqYEXfPVM2pXtST8CfMDCek9GR7pzZ04pRCVY8aeZwDl
 OtwUhZZew/BZTg8g89p5VWO94tWCZlZXNpdZFAswg+BBJKykCotopvNDS
 uDLnnpOD5V8ccSI1GJT47WUvIg2CYd1Ir/GwWzLBhc1Qg1D4sTYETGI0k A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YeTuTzQBc6bcRt0izLM/7JW3U6J9QO1uuh0qOOhtFgxsyLStsyzJD3cz6SWJyX4TbSLhpqFhaX
 5lDOD0l9v2YBYvQnabff0Zpy14gfxp+m9Nb2EfLjp3hUhq2Lr/Fgc+TWFZ0KZ2a043yDuLxX+I
 P4Sdx03AeGRxywTxPOGJ//k3CbvUBiTV+IlkFmvSwXF7HrQTrAepujaAfXHTwXhS9hMfLevDLj
 3HTQWi8S5e8YFeZevs/7J+9dOKy6GSsUek3g1DPF7bnbx5kgUVB7V3/M9jx8odKeZiunNi6gjH
 I0c=
X-SBRS: 2.7
X-MesageID: 14527597
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,564,1574139600"; d="scan'208";a="14527597"
To: Jan Beulich <jbeulich@suse.com>
References: <1584395264-22913-1-git-send-email-igor.druzhinin@citrix.com>
 <0de88ada-8baa-586e-cc60-8dd9f9adf327@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <cdc836b2-fbce-7d72-b08e-3284b227d809@citrix.com>
Date: Tue, 17 Mar 2020 11:47:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0de88ada-8baa-586e-cc60-8dd9f9adf327@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/shim: fix ballooning up the guest
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDMvMjAyMCAxMDoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTYuMDMuMjAyMCAy
Mjo0NywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IGFyZ3MucHJlZW1wdGVkIGFzIG1lYW5pbmds
ZXNzIGhlcmUgYW5kIGRvZXNuJ3Qgc2hvdyBpZiB0aGUgaHlwZXJjYWxsCj4+IHdhcyBwcmVlbXB0
ZWQgYmVmb3JlLiBVc2Ugc3RhcnRfZXh0ZW50IGluc3RlYWQgd2hpY2ggaXMgY29ycmVjdC4KPiAK
PiAuLi4gYXMgbG9uZyBhcyB0aGUgaHlwZXJjYWxsIHdhcyBpbnZva2VkIGluIGEgIm5vcm1hbCIg
d2F5Lgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5A
Y2l0cml4LmNvbT4KPj4gLS0tCj4+IFRoaXMgZml4ZXMgYmFsbG9vbmluZyBmb3IgNjQtYml0IFBW
IGd1ZXN0cyBpbnNpZGUgc2hpbS4gMzItYml0IFBWIGd1ZXN0cwo+PiByZXF1aXJlIGEgbGl0dGxl
IGJpdCBtb3JlIHdvcmsgZHVlIHRvIGNvbXBhdCBsYXllciBiZWluZyBpbnZvbHZlZC4KPj4gLS0t
Cj4+ICB4ZW4vY29tbW9uL21lbW9yeS5jIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL21l
bW9yeS5jIGIveGVuL2NvbW1vbi9tZW1vcnkuYwo+PiBpbmRleCA0NDRjMDgxLi41ZmRkMmEyIDEw
MDY0NAo+PiAtLS0gYS94ZW4vY29tbW9uL21lbW9yeS5jCj4+ICsrKyBiL3hlbi9jb21tb24vbWVt
b3J5LmMKPj4gQEAgLTExOTEsNyArMTE5MSw3IEBAIGxvbmcgZG9fbWVtb3J5X29wKHVuc2lnbmVk
IGxvbmcgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykKPj4gICAgICAgICAg
fQo+PiAgCj4+ICAjaWZkZWYgQ09ORklHX1g4Ngo+PiAtICAgICAgICBpZiAoIHB2X3NoaW0gJiYg
b3AgIT0gWEVOTUVNX2RlY3JlYXNlX3Jlc2VydmF0aW9uICYmICFhcmdzLnByZWVtcHRlZCApCj4+
ICsgICAgICAgIGlmICggcHZfc2hpbSAmJiBvcCAhPSBYRU5NRU1fZGVjcmVhc2VfcmVzZXJ2YXRp
b24gJiYgIXN0YXJ0X2V4dGVudCApCj4+ICAgICAgICAgICAgICAvKiBBdm9pZCBjYWxsaW5nIHB2
X3NoaW1fb25saW5lX21lbW9yeSB3aGVuIHByZWVtcHRlZC4gKi8KPj4gICAgICAgICAgICAgIHB2
X3NoaW1fb25saW5lX21lbW9yeShhcmdzLm5yX2V4dGVudHMsIGFyZ3MuZXh0ZW50X29yZGVyKTsK
PiAKPiBUaGUgY29kZSBjaGFuZ2UgY2FuIGhhdmUgbXkgUi1iLCBidXQgSSdkIGxpa2UgdGhlIGNv
bW1lbnQgdG8gYWxzbwo+IGJlIGNoYW5nZWQgdGhlbiAtIGl0IHNob3VsZG4ndCB0YWxrIGFib3V0
IHByZWVtcHRpb24gaW4gdGhlIHdheQo+IGl0IGRvZXMuIFBlcmhhcHMgIi4uLiB3aGVuIHRoaXMg
aXMgYSBjb250aW51YXRpb24iPyBJJ2QgYmUgb2theQo+IG1ha2luZyB0aGlzIGNoYW5nZSB3aGls
ZSBjb21taXR0aW5nLgoKU3VyZSwgaWYgeW91IGxpa2UuCgo+IEFzIGFuIGFzaWRlLCBpdCB3b3Vs
ZCBwcm9iYWJseSBoYXZlIGJlZW4gYSBnb29kIGlkZWEgdG8gYWxzbyBDYwo+IFJvZ2VyIGFzIHRo
ZSBvcmlnaW5hbCBhdXRob3Igb2YgdGhpcyBjb2RlLgoKSSBkaWRuJ3QgY2hlY2sgImdpdCBibGFt
ZSIgYW5kIGhlIHdhc24ndCBvbiBhIG1haW50YWluZXJzIGxpc3QuCgpJZ29yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
