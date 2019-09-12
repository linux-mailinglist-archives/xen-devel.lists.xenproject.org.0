Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA14EB12DE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 18:37:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8S33-00089P-4Z; Thu, 12 Sep 2019 16:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UPIc=XH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8S31-00089K-23
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 16:34:19 +0000
X-Inumbo-ID: 2a2b592e-d57b-11e9-b76c-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a2b592e-d57b-11e9-b76c-bc764e2007e4;
 Thu, 12 Sep 2019 16:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568306058;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FCxphyXp4MY2zpN5cyEPnaua9+aWaDgfxEFk+JOMd2g=;
 b=GIM6/FWMCVW0B+u8PjS4JRk6ann3MMdRTfbYW2A/BnyJQGhBOxGznmfv
 SwLCTuFQAng3SW8cB9TulAV20qomgkaccLMHtgutqAlmvEr8XdSFP4sxx
 XDRXSKs+UQxj8zrtZzN6mL2rQVrGDkZKd9bVzWDdC7oVjmF4ElfkyKmsm E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3zxxzcaSRwqmDxbPmmLu7/H47H4k7vM2zC6h2W9zpFR6HVS7kz2iqo/R8E3Ke8oiIvMFBOwju3
 WSv/WTi22tEhDTWW/pImnu8FmtoMZiib7Rpm6GlflPmiyVu9/f/A65JdUPLJZ+Ns9Z8gXnjjn0
 SdTkavy3rkmzHZJ8aOzv3t45ls1HWk7MGCy73d8hhNhOGa3fu1UTOlZd9Uh1ptG+7GspOlcggE
 Ud4Db3hF1aER5vyyaeAECHw/6EAjH9qxtfNqzNNCJr5QJrh+n77BjJ0AhDEVy9PS5Q2hXpC5vm
 bRM=
X-SBRS: 2.7
X-MesageID: 5789924
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5789924"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-4-andrew.cooper3@citrix.com>
 <8c6a368c-4409-dc6b-9b73-6e93b8fbd6e7@suse.com>
 <b727674f-c7da-40ee-1b7d-1da946f65552@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <daac0ee2-0474-0e75-371b-905a5ab03065@citrix.com>
Date: Thu, 12 Sep 2019 17:34:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b727674f-c7da-40ee-1b7d-1da946f65552@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 3/8] x86/domctl: Implement
 XEN_DOMCTL_set_cpumsr_policy
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>, Ian
 Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDkvMjAxOSAxNDoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8wOS8yMDE5
IDA5OjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTEuMDkuMjAxOSAyMjowNCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4+PiAr
KysgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+Pj4gQEAgLTIyOSw2ICsyMjksNTUgQEAg
aW50IHhjX2dldF9kb21haW5fY3B1X3BvbGljeSh4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMyX3Qg
ZG9taWQsCj4+PiAgICAgIHJldHVybiByZXQ7Cj4+PiAgfQo+Pj4gIAo+Pj4gK2ludCB4Y19zZXRf
ZG9tYWluX2NwdV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90IGRvbWlkLAo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgbnJfbGVhdmVzLCB4ZW5fY3B1
aWRfbGVhZl90ICpsZWF2ZXMsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50
MzJfdCBucl9tc3JzLCB4ZW5fbXNyX2VudHJ5X3QgKm1zcnMsCj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50MzJfdCAqZXJyX2xlYWZfcCwgdWludDMyX3QgKmVycl9zdWJsZWFm
X3AsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqZXJyX21zcl9p
ZHhfcCkKPj4+ICt7Cj4+PiArICAgIERFQ0xBUkVfRE9NQ1RMOwo+Pj4gKyAgICBERUNMQVJFX0hZ
UEVSQ0FMTF9CT1VOQ0UobGVhdmVzLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bnJfbGVhdmVzICogc2l6ZW9mKCpsZWF2ZXMpLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgWENfSFlQRVJDQUxMX0JVRkZFUl9CT1VOQ0VfSU4pOwo+Pj4gKyAgICBERUNMQVJFX0hZ
UEVSQ0FMTF9CT1VOQ0UobXNycywKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5y
X21zcnMgKiBzaXplb2YoKm1zcnMpLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
WENfSFlQRVJDQUxMX0JVRkZFUl9CT1VOQ0VfSU4pOwo+PiBXaXRoIGJvdGggYmVpbmcgSU4sIHRo
ZSByZXNwZWN0aXZlIGZ1bmN0aW9uIHBhcmFtZXRlcnMgc2hvdWxkIGltbwo+PiBiZSBwb2ludGVy
cyB0byBjb25zdC4KPiBPay4KClNhZGx5IG5vdC7CoCBJdCB0dXJucyBvdXQgdGhhdCB0aGlzIGlz
IGluY29tcGF0aWJsZSB3aXRoIHRoZSBpbnRlcm5hbHMgb2YKREVDTEFSRV9IWVBFUkNBTExfQk9V
TkNFKCkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
