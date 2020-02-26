Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D64616FBB6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 11:11:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6tdX-0001Qt-Kp; Wed, 26 Feb 2020 10:09:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6tdV-0001Qk-JZ
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 10:09:49 +0000
X-Inumbo-ID: 1d72efe8-5880-11ea-93e8-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d72efe8-5880-11ea-93e8-12813bfff9fa;
 Wed, 26 Feb 2020 10:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582711787;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jIB0ZDol3g7AH9IS8RlG8ocuVR+gRLDVgPrCPFG20ps=;
 b=FgYnxh30KtJdQbvti7cJUjUxLUSVjJ3UeGlUP6x0zJzmsXJN4XtDs4Im
 SGXat5B73zODSLPlOmacxsYDSxNLwarKc1/iuMrVhK+Or38EtOMo7jHDC
 16eEhVlFsY/MSTHD76IvbAWyxye1JKpGsEcYBuK3pUO8l+8E7m14cvN6B U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yQaXanYQGqvvg/yYOg8zA6KMvwR0qG32H5sw6TJMLyrWhZWDJ0RrsQvaI1X50VFT7YxLyunfhX
 1/bmibDHCL1G+olfBcAlZyGW9A0wHFWhNjINV5aTp/P1HWnGvkpEn65MPZmXyTeWHZK+Zymjjc
 LH1cskEeSe6jvnPO/dY2LpeSlu+89rS6JHwZiIRrRwZMDifLsFQicTxr9tRBNoGYpUv2dpCFrn
 5bHw2krdsX/Xus3Y7XSeV3NlCRLaKd2CxezreM/We2My15klKG9XCREieY+YPCyy6Zse9JgjBx
 Gg4=
X-SBRS: 2.7
X-MesageID: 13207576
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13207576"
Date: Wed, 26 Feb 2020 11:09:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200226100937.GA24458@Air-de-Roger.citrite.net>
References: <1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54@SHSMSX104.ccr.corp.intel.com>
 <b33cc365-6537-d816-8a89-eadd514a2427@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b33cc365-6537-d816-8a89-eadd514a2427@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/vPMU: don't blindly assume
 IA32_PERF_CAPABILITIES MSR exists
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Chen, Farrah" <farrah.chen@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Gao, 
 Chao" <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTA6MTk6MTlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSnVzdCBsaWtlIFZNWCdlcyBsYnJfdHN4X2ZpeHVwX2NoZWNrKCkgdGhlIHJlc3BlY3Rp
dmUgQ1BVSUQgYml0IHNob3VsZAo+IGJlIGNvbnN1bHRlZCBmaXJzdC4KPiAKPiBSZXBvcnRlZC1i
eTogRmFycmFoIENoZW4gPGZhcnJhaC5jaGVuQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gLS0tIGEveGVuL2FyY2gveDg2L2Nw
dS92cG11X2ludGVsLmMKPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfaW50ZWwuYwo+IEBA
IC05MDAsNyArOTAwLDYgQEAgaW50IHZteF92cG11X2luaXRpYWxpc2Uoc3RydWN0IHZjcHUgKnYp
Cj4gIAo+ICBpbnQgX19pbml0IGNvcmUyX3ZwbXVfaW5pdCh2b2lkKQo+ICB7Cj4gLSAgICB1NjQg
Y2FwczsKPiAgICAgIHVuc2lnbmVkIGludCB2ZXJzaW9uID0gMDsKPiAgICAgIHVuc2lnbmVkIGlu
dCBpOwo+ICAKPiBAQCAtOTMyLDggKzkzMSwxNCBAQCBpbnQgX19pbml0IGNvcmUyX3ZwbXVfaW5p
dCh2b2lkKQo+ICAKPiAgICAgIGFyY2hfcG1jX2NudCA9IGNvcmUyX2dldF9hcmNoX3BtY19jb3Vu
dCgpOwo+ICAgICAgZml4ZWRfcG1jX2NudCA9IGNvcmUyX2dldF9maXhlZF9wbWNfY291bnQoKTsK
PiAtICAgIHJkbXNybChNU1JfSUEzMl9QRVJGX0NBUEFCSUxJVElFUywgY2Fwcyk7Cj4gLSAgICBm
dWxsX3dpZHRoX3dyaXRlID0gKGNhcHMgPj4gMTMpICYgMTsKPiArCj4gKyAgICBpZiAoIGNwdV9o
YXNfcGRjbSApCj4gKyAgICB7Cj4gKyAgICAgICAgdWludDY0X3QgY2FwczsKPiArCj4gKyAgICAg
ICAgcmRtc3JsKE1TUl9JQTMyX1BFUkZfQ0FQQUJJTElUSUVTLCBjYXBzKTsKPiArICAgICAgICBm
dWxsX3dpZHRoX3dyaXRlID0gKGNhcHMgPj4gMTMpICYgMTsKCldpbGwgUE1VIHdvcmsgd2l0aG91
dCBQRENNPwoKSSd2ZSBiZWVuIGdyZXBwaW5nIHRoZSBJbnRlbCBTRE1zLCBidXQgdGhlIG9ubHkg
bWVudGlvbiBpcyB0aGF0IFBEQ00Kc2lnbmFsIHRoZSBhdmFpbGFiaWxpdHkgb2YgTVNSX0lBMzJf
UEVSRl9DQVBBQklMSVRJRVMuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
