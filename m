Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EB8CB94C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 13:37:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGLqK-000656-Bi; Fri, 04 Oct 2019 11:33:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=obQ/=X5=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iGLqI-000651-IZ
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 11:33:50 +0000
X-Inumbo-ID: d56ed97a-e69a-11e9-80e3-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d56ed97a-e69a-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 11:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570188830;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZlyVpau3J9uxetiU3vI1Mtwf3e1lGoxWkrIqDoRAUVY=;
 b=UBqtJCfbJF2IXyXbvHWXXit35R00rNAx7Z36x40fj6rNrtq7Zh9Tm7u4
 foDNbxTelMscf/Ao3gDY5cxIZw+RNhD52t4lrl9CVPEA05XsTI2saSMS3
 McqF8hjtyeu+PPMY0iPIX6YmHchHkBCRYy4nmWzTPCEOWrnztGFY+YAFU c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SOlLeKTL6iIOYNlZMBOqnFwvBBqLN7sVRFPqkaSB384H39WSCUdX62gUNo0Z3ZOWDEr6gdRtAa
 /uZAYd2O4PL7zR5UqEGwyIosGeNbuo7yrBRiWDTX1kcGX5johzfxkw9uz117lnVxIBhDoaa//2
 vIMxTgtcbd1g1IawH+z36Hmp5LZb7zDZbHUk4Edtc4DoGpXN0D1zmx8064Dolb64F0M1NCensn
 XdkzYvnSovJxBA1jdcAPH+7vjNMCzy6S/RM15fccfBFrAJGbeH7duqE5/9aSpYiiy39a1f/roK
 RQk=
X-SBRS: 2.7
X-MesageID: 6470456
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6470456"
To: Jan Beulich <jbeulich@suse.com>
References: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
 <1570110555-24287-3-git-send-email-igor.druzhinin@citrix.com>
 <4d82e6f6-e362-7fc0-efa9-d024088d9f9f@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <7bb04327-f442-5455-fda5-3d457b06fd68@citrix.com>
Date: Fri, 4 Oct 2019 12:33:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4d82e6f6-e362-7fc0-efa9-d024088d9f9f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] efi/boot: make sure chosen mode is set
 even if firmware tell it is
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTAvMjAxOSAxMTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMTAuMjAxOSAx
NTo0OSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IElmIGEgYm9vdGxvYWRlciBpcyB1c2luZyBu
YXRpdmUgZHJpdmVyIGluc3RlYWQgb2YgRUZJIEdPUCBpdCBtaWdodAo+PiByZXNldCBncmFwaGlj
cyBtb2RlIHRvIGJlIGRpZmZlcmVudCBmcm9tIHdoYXQgZmlybXdhcmUgdGhpbmtzIGl0Cj4+IGN1
cnJlbnRseSBpcy4gU2V0IGNob3NlbiBtb2RlIHVuY29uZGl0aW9uYWxseSB0byBmaXggdGhpcyBw
b3NzaWJsZQo+PiBtaXNhbGlnbm1lbnQuCj4+Cj4+IE9ic2VydmVkIHdpdGggRUZJIEdSVUIyIGNv
bXBpbGVkIHdpdGggYWxsIHBvc3NpYmxlIHZpZGVvIGRyaXZlcnMgd2hlcmUKPj4gbmF0aXZlIGRy
aXZlcnMgdGFrZSBwcmlvcml0eSBvdmVyIGZpcm13YXJlLgo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhp
cyBjYXNlIGNhbiBoYXBwZW4gd2l0aCBqdXN0IHBsYWluIEVGSS4gVGhlcmVmb3JlIC4uLgo+IAoK
Q291bGQgeW91IGNsYXJpZnkgd2hhdCB5b3UgbWVhbiBieSAicGxhaW4gRUZJIiBoZXJlPyBEbyB5
b3UgbWVhbiBiZWluZwpib290ZWQgYXMgRUZJIGJpbmFyeSB1bmxpa2UgdGhyb3VnaCBtdWx0aWJv
b3QgcHJvdG9jb2w/IEkgdGhpbmsgaW4gYm90aApjYXNlcyBpdCdzIHBvc3NpYmxlIHRvIGNvbWUg
dGhlcmUgdGhyb3VnaCBhIGJvb3Rsb2FkZXIuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
