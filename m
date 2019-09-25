Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AD1BDE26
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 14:35:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD6T4-0004cG-5i; Wed, 25 Sep 2019 12:32:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZcR2=XU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iD6T2-0004c7-PK
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 12:32:24 +0000
X-Inumbo-ID: 86776924-df90-11e9-97fb-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 86776924-df90-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569414743;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=yVkGB81GBf3hX7YaZW4QiNDdyOqCiZ760G7dDn7mVRg=;
 b=MZIAcHt4IG2yU2tRTiC11wn3gZdJKvpMnZsFTNrfPGAJlLplGppJf6M9
 wXc9o7/gV0YdkGIOVlGg2q9DYgSW+lv6RGhFH32CXZxr9HG1GoSnhqo+8
 2a9i9AFi8s+W1x9DUBHA4/7aEYGHlRjcu6nT8mhPuYjaZLM+YnL15qxXd U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wvtLW8yVTCIgdoqgSCiKVv7mboTPPd4z0LO/mDWU+wyMEvZ+d0bJ937fAKGAVj4riT38DcNSIp
 WYQhxBcch3/SaiHJrYZD3e7GYLEjMeodE3VBRefBK7e0n8Qnq1MqB3XOjMsA2cxnG43LjNjLAS
 aHKLEmVl7E3WkSM6xfJPo1ijDCQ5DTqySsf1f4MAA70zWU6Msp26spaEVugqq0qRJxc+tu3JR3
 r6KUWIZ/lydC5xt3pphKKz+5qpOVMkOQsckgzaV+Z11mKDpyBHTCLq/DK340CP/IffdWeFZiaB
 Whk=
X-SBRS: 2.7
X-MesageID: 6265059
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,548,1559534400"; 
   d="scan'208";a="6265059"
To: Jan Beulich <jbeulich@suse.com>
References: <20190905194909.6811-1-andrew.cooper3@citrix.com>
 <0d059668-7e2d-e5ca-4946-7024ec680bb8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8b7e7d18-cdec-dbd1-e11f-7058b2646b5a@citrix.com>
Date: Wed, 25 Sep 2019 13:32:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0d059668-7e2d-e5ca-4946-7024ec680bb8@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] x86/cpuid: Extend the cpuid= option to
 support all named features
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMDkvMjAxOSAxMzozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUuMDkuMjAxOSAy
MTo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gRm9yIGdlbi1jcHVpZC5weSwgZml4IGEgY29t
bWVudCBkZXNjcmliaW5nIHNlbGYubmFtZXMsIGFuZCBnZW5lcmF0ZSB0aGUKPj4gcmV2ZXJzZSBt
YXBwaW5nIGluIHNlbGYudmFsdWVzLiAgV3JpdGUgb3V0IElOSVRfRkVBVFVSRV9OQU1FUyB3aGlj
aCBtYXBzIGEKPj4gc3RyaW5nIG5hbWUgdG8gYSBiaXQgcG9zaXRpb24uCj4+Cj4+IEZvciBwYXJz
ZV9jcHVpZCgpLCB1c2UgY21kbGluZV9zdHJjbXAoKSBhbmQgcGVyZm9ybSBhIGJpbmFyeSBzZWFy
Y2ggb3Zlcgo+PiBJTklUX0ZFQVRVUkVfTkFNRVMuICBBIHR3ZWFrIHRvIGNtZGxpbmVfc3RyY21w
KCkgaXMgbmVlZGVkIHRvIGJyZWFrIGF0IGVxdWFscwo+PiBzaWducyBhcyB3ZWxsLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
PiAtLS0KPj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPj4gQ0M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+Cj4+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPj4KPj4gdjI6Cj4+ICAqIFJlYmFzZSBvdmVyIGNtZGxpbmVfc3RyY21wKCkKPj4gLS0t
Cj4+ICB4ZW4vYXJjaC94ODYvY3B1aWQuYyAgIHwgNzUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gIHhlbi9jb21tb24va2VybmVsLmMgICAgfCAg
NiArKy0tCj4+ICB4ZW4vaW5jbHVkZS94ZW4vbGliLmggIHwgIDQgKy0tCj4+ICB4ZW4vdG9vbHMv
Z2VuLWNwdWlkLnB5IHwgMjIgKysrKysrKysrKysrKy0tCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDcx
IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQo+IEkndmUgbm90aWNlZCB0aGlzIG9ubHkg
bm93OiBUaGlzIGNoYW5nZSB3b3VsZCBoYXZlIHdhbnRlZCB0byBiZQo+IGFjY29tcGFuaWVkIGJ5
IGFuIGFkanVzdG1lbnQgdG8gdGhlIGNvbW1hbmQgbGluZSBkb2MuCgpJIGRlYmF0ZWQgdGhhdCwg
YnV0IEkgZG9uJ3Qgd2FudCB0byBnaXZlIHBlb3BsZSB0aGUgaWRlYSB0aGF0IHVzaW5nCmNwdWlk
PW5vLWxtIG1pZ2h0IGJlIGEgc2Vuc2libGUgdGhpbmcgdG8gZG8uCgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
