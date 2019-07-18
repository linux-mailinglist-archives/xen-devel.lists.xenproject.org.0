Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE086CE0B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 14:26:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho5Re-0003cG-Ez; Thu, 18 Jul 2019 12:23:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hbxb=VP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ho5Rc-0003cB-R9
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 12:23:32 +0000
X-Inumbo-ID: d86e8de0-a956-11e9-9eef-8b734d264a95
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d86e8de0-a956-11e9-9eef-8b734d264a95;
 Thu, 18 Jul 2019 12:23:28 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5+SwPw8qfiu/T3V14+6+VOLRT0CCOughj2XpxUxuPO3KUrbRC4PHauceRCfRCRXWOXN3poGNdb
 DhZKEcqE3Z3cQ4EC+yw4cBolJWWBS7NvgafistB3wsbY0tiXc27/yiNl5oMvv7lSdU4rUMoSLd
 jRkXnjHLjeoguT5UVffbq7wvW9rKX83QX8/irZnfk+vXACRqhE81upzAgtE5calyb400z6B3U+
 Ds7R4JOJqSg43aELrwt9vcMWq3WKSN5oN4/G50fGNQdCAdAW77ZJ8A8PiqPNc/ifbMFHbb2UjZ
 xTc=
X-SBRS: 2.7
X-MesageID: 3120621
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3120621"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <31d4cb3f-6ff0-a13c-00ce-bced77c6dd78@suse.com>
 <05257008-13e3-0d49-cd1d-6a8c9eee2ce5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d643e3c0-fd02-3427-b241-a707eaaf5d52@citrix.com>
Date: Thu, 18 Jul 2019 13:23:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <05257008-13e3-0d49-cd1d-6a8c9eee2ce5@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/cpu/intel: Clear cache self-snoop
 capability in CPUs with known errata
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDcvMjAxOSAxMzowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L2NwdS9pbnRlbC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9pbnRlbC5jCj4gQEAgLTE1
LDYgKzE1LDMyIEBACj4gICAjaW5jbHVkZSAiY3B1LmgiCj4gICAKPiAgIC8qCj4gKyAqIFByb2Nl
c3NvcnMgd2hpY2ggaGF2ZSBzZWxmLXNub29waW5nIGNhcGFiaWxpdHkgY2FuIGhhbmRsZSBjb25m
bGljdGluZwo+ICsgKiBtZW1vcnkgdHlwZSBhY3Jvc3MgQ1BVcyBieSBzbm9vcGluZyBpdHMgb3du
IGNhY2hlLiBIb3dldmVyLCB0aGVyZSBleGlzdHMKPiArICogQ1BVIG1vZGVscyBpbiB3aGljaCBo
YXZpbmcgY29uZmxpY3RpbmcgbWVtb3J5IHR5cGVzIHN0aWxsIGxlYWRzIHRvCj4gKyAqIHVucHJl
ZGljdGFibGUgYmVoYXZpb3IsIG1hY2hpbmUgY2hlY2sgZXJyb3JzLCBvciBoYW5ncy4gQ2xlYXIg
dGhpcwo+ICsgKiBmZWF0dXJlIHRvIHByZXZlbnQgaXRzIHVzZSBvbiBtYWNoaW5lcyB3aXRoIGtu
b3duIGVycmF0YXMuCj4gKyAqLwo+ICtzdGF0aWMgdm9pZCBfX2luaXQgY2hlY2tfbWVtb3J5X3R5
cGVfc2VsZl9zbm9vcF9lcnJhdGEodm9pZCkKPiArewo+ICsJc3dpdGNoIChib290X2NwdV9kYXRh
Lng4Nl9tb2RlbCkgewo+ICsJY2FzZSAweDBmOiAvKiBNZXJvbSAqLwo+ICsJY2FzZSAweDE2OiAv
KiBNZXJvbSBMICovCj4gKwljYXNlIDB4MTc6IC8qIFBlbnJ5biAqLwo+ICsJY2FzZSAweDFkOiAv
KiBEdW5uaW5ndG9uICovCj4gKwljYXNlIDB4MWU6IC8qIE5laGFsZW0gKi8KPiArCWNhc2UgMHgx
ZjogLyogQXVidXJuZGFsZSAvIEhhdmVuZGFsZSAqLwo+ICsJY2FzZSAweDFhOiAvKiBOZWhhbGVt
IEVQICovCj4gKwljYXNlIDB4MmU6IC8qIE5laGFsZW0gRVggKi8KPiArCWNhc2UgMHgyNTogLyog
V2VzdG1lcmUgKi8KPiArCWNhc2UgMHgyYzogLyogV2VzdG1lcmUgRVAgKi8KPiArCWNhc2UgMHgy
YTogLyogU2FuZHlCcmlkZ2UgKi8KCkl0IHdvdWxkIGhhdmUgYmVlbiBuaWNlIGlmIHRoZSBlcnJh
dGEgaGFkIGFjdHVhbGx5IGJlZW4gaWRlbnRpZmllZC4uLgoKPiArCQlzZXR1cF9jbGVhcl9jcHVf
Y2FwKFg4Nl9GRUFUVVJFX1NTKTsKCkknbSByZWdyZXR0aW5nIGV4cG9zaW5nIFNTIHRvIGd1ZXN0
cyBhdCB0aGlzIHBvaW50LgoKQXMgdGhpcyBzdGFuZHMsIGl0IHdpbGwgcmVzdWx0IGluIGEgbWln
cmF0aW9uIGNvbXBhdGliaWxpdHkgaXNzdWUsCmJlY2F1c2UgdXBkYXRpbmcgWGVuIHdpbGwgY2F1
c2UgYSBmZWF0dXJlIHRvIGRpc2FwcGVhci7CoCBJZiB3ZSBoYWQgYQpkZWZhdWx0IHZzIGZ1bGwg
cG9saWN5IHNwbGl0LCB0aGlzIHdvdWxkIGJlIGVhc3kgZW5vdWdoIHRvIHdvcmsgYXJvdW5kCmlu
IGEgY29tcGF0aWJsZSB3YXkuwqAgSSB3b25kZXIgaWYgdGhlcmUgaXMgYW55dGhpbmcgY2xldmVy
IHdlIGNhbiBkbyBpbgp0aGUgbWVhbnRpbWUgYXMgYSBzdG9wZ2FwIHdvcmthcm91bmQuCgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
