Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5665A10D592
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:16:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaf8s-0003zv-J1; Fri, 29 Nov 2019 12:12:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UeaM=ZV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iaf8q-0003zq-Lm
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:12:56 +0000
X-Inumbo-ID: 92fe19f6-12a1-11ea-a3e3-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92fe19f6-12a1-11ea-a3e3-12813bfff9fa;
 Fri, 29 Nov 2019 12:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575029576;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6iRHjSkZjU0dRZ3ujsTVdpngVACuQexSqF8B7sx65aQ=;
 b=Ticr2mTna/ISjD3ESFDrs0OBdx9K71QIZG7uJ4FxgrGNR87HJsm+8frL
 jIADLzBbgsLMUDS8hs7UBYlVAhB7xlap/OMZob/t1hLIrRMwkL0Vktax1
 kT+YL55bGVuUWKjY87kfeWc/IKl9crVgGOMGfzBpsNG4fTwIbS4wMlaSl 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LO77mYKIstgzADf249m/moTd1+2l0izHvy8zFaMAIJuEsyX6fUW8ajhs4pz/bxjQCP4nrwa9VY
 3dSQqkUMNVA1IgxcKDOJkhlnK+okO8NzKDhsqtD4EHLoRaD7iY1k73189YAEK+GfBTfSOupqpc
 NvKAh8juvyf+XRgsNjqqUkITjXJPQqv0uMrL13AFWMZJxN7c4n507gG3k/3akwyrfDYjhDvpcC
 tCNUbl/BvYxl7YRWy314kjwyQM06mHqOSm1pvPFFNI87vzku8iWLfuU8C+XgIauE9IkxtWHrTW
 Tgc=
X-SBRS: 2.7
X-MesageID: 8977424
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8977424"
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <20191125172213.1904-1-roger.pau@citrix.com>
 <20191125172213.1904-3-roger.pau@citrix.com>
 <8f77f970-9b3b-2878-f1e7-6b87c9dfa25e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6954ab5e-3c40-e1ed-4610-1d336f50331a@citrix.com>
Date: Fri, 29 Nov 2019 12:12:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8f77f970-9b3b-2878-f1e7-6b87c9dfa25e@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/pvshim: do not enable global pages
 in shim mode
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMTEvMjAxOSAxMjowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjUuMTEuMjAxOSAx
ODoyMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiBXaGVuIHVzaW5nIGdsb2JhbCBwYWdlcyBh
IGZ1bGwgdGxiIGZsdXNoIGNhbiBvbmx5IGJlIHBlcmZvcm1lZCBieQo+PiB0b2dnbGluZyB0aGUg
UEdFIGJpdCBpbiBDUjQsIHdoaWNoIGlzIHVzdWFsbHkgcXVpdGUgZXhwZW5zaXZlIGluIHRlcm1z
Cj4+IG9mIHBlcmZvcm1hbmNlIHdoZW4gcnVubmluZyB2aXJ0dWFsaXplZC4gVGhpcyBpcyBzcGVj
aWFsbHkgcmVsZXZhbnQgb24KPj4gQU1EIGhhcmR3YXJlLCB3aGljaCBkb2Vzbid0IGhhdmUgdGhl
IGFiaWxpdHkgdG8gZG8gc2VsZWN0aXZlIENSNAo+PiB0cmFwcGluZywgYnV0IGNhbiBhbHNvIGJl
IHJlbGV2YW50IG9uIEludGVsIGlmIHRoZSB1bmRlcmx5aW5nCj4+IGh5cGVydmlzb3IgYWxzbyB0
cmFwcyBvbiBhY2Nlc3NlcyB0byB0aGUgUEdFIENSNCBiaXQuCj4+Cj4+IEluIG9yZGVyIHRvIGF2
b2lkIHRoaXMgcGVyZm9ybWFuY2UgcGVuYWx0eSwgZG8gbm90IHVzZSBnbG9iYWwgcGFnZXMKPj4g
d2hlbiBydW5uaW5nIGluIHNoaW0gbW9kZS4gTm90ZSB0aGlzIGlzIGRvbmUgd2hlbiBydW5uaW5n
IG9uIGJvdGgKPj4gSW50ZWwgb3IgQU1EIGhhcmR3YXJlLCBzaW5jZSBvbGRlciB2ZXJzaW9ucyBv
ZiBYZW4gY2FwYWJsZSBvZiBydW5uaW5nCj4+IHRoZSBzaGltIGRvbid0IG1ha2UgdXNlIG9mIElu
dGVsIHNlbGVjdGl2ZSBDUjQgdHJhcHBpbmcgZmVhdHVyZSBhbmQKPj4gd2lsbCB2bWV4aXQgb24g
ZXZlcnkgYWNjZXNzIHRvIENSNC4KPiBTbyBoZXJlIHlvdSBzYXkgeW91IGRvIHRoaXMgdW5pZm9y
bWx5IGJlY2F1c2Ugb2Ygb2xkZXIgWGVuLgo+IFdoYXQgYWJvdXQgbmV3ZXIgWGVuPyBJcyB0aGlz
IHN0aWxsIGEgd2luIChvciBhdCBsZWFzdCBub3QgYQo+IGxvc3MpIHRoZXJlPyBJbmRlcGVuZGVu
dCBvZiB1bmRlcmx5aW5nIGhhcmR3YXJlPyBJbiBjYXNlIG9mCj4gYW55IGtpbmQgb2YgZG91YnQg
SSB0aGluayB0aGlzIHdvdWxkIHdhbnQgdG8gYmUgY29tbWFuZCBsaW5lCj4gY29udHJvbGxhYmxl
LgoKT2xkZXIgWGVuIGhhcyBWTUV4aXRzIGZvciBhbGwgQ1I0LlBHRSBmbGlwcy4KCk5ld2VyIFhl
biAoc2luY2UgNC4xMD8gaWlyYykgb24gSW50ZWwgaGFyZHdhcmUgKHdpdGggSEFQKSBhcnJhbmdl
ZCBmb3IKQ1I0LlBHRSBmbGlwcyBub3QgdG8gdm1leGl0LgoKVGhlcmUgaXMgbm8gYWJpbGl0eSB0
byBjYXVzZSBDUjQuUEdFIGZsaXBzIHRvIG5vdCB2bWV4aXQgb24gQU1ELCBvdGhlcgp0aGFuIHRv
IGdpdmUgdGhlIGd1ZXN0IGZ1bGwgY29udHJvbCBvZiBDUjQgd2hpY2ggaXMgYSBCYWRUaGluZyh0
bSkuCgpJIGFncmVlIHRoYXQgdGhpcyB3YW50cyBhIGNvbW1hbmQgbGluZSBjb250cm9sLCBidXQg
aXQgd2FudHMgdG8gYmUKZW5hYmxlZCBieSBkZWZhdWx0IGFueSB0aW1lIHdlIGZpbmQgb3Vyc2Vs
dmVzIG5lc3RlZCBvbiBBTUQgaGFyZHdhcmUsCm5vdCBqdXN0IGluIHNoaW0uCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
