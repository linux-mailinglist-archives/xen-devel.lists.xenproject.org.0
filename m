Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB378184BBC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 16:53:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCma0-0007wT-7B; Fri, 13 Mar 2020 15:50:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDBU=46=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jCmZz-0007wO-FN
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 15:50:31 +0000
X-Inumbo-ID: 5dac8b04-6542-11ea-bec1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5dac8b04-6542-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 15:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584114630;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1CsJiAF4EEO+p3vD1ynOCsffQG/i0XGf4+C6GM2JhH0=;
 b=Z3o4Yx1coh7O4Rm5mh+n2h8urQvi0iVsrnc2x/3gmEyze0CTCVEiHr1R
 5QIl+VSX5FJfd1SZi9rna2jqX/n9r1qleH5YN8Kow7ZYFuklJkDpjHllK
 hZIRk4aw8ZgyG1ZfMgTmsBqfoHcg/EdIEsaVGvPdew+GCyd51zvPxnHzk M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BXjSOyjtd/eOg/LEMlfdrOphTB5EhWu0szyc/+x2YxLWIUpjFfidW3Iy0BJvm4ID39bsb3SlrQ
 mTBSp2nl+yliZ8WyTG3R45aDvXk+XFFEA0IOKtv1B4VbDMuHSz5tzJzyLyYXacXbAQp08NvNr3
 GIvdGJ4M1Mw2EYbF6LuoS2pH+2HeJUNH38vHstNqC3vmMIHrZLysMe0Sc9fFIof/JKbvWOFhf+
 zOMWixHgfCOIaML9oWCHC3m1d9lcaaUCCPWuWyHC2Fk8h5YrQQRsI+4KUsA5H4DxJ1p5lT6nfI
 73g=
X-SBRS: 2.7
X-MesageID: 14259878
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,549,1574139600"; d="scan'208";a="14259878"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <8221cc7f-ad33-03da-5780-8a76fbdc404a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f10b1b9f-eeb1-11e9-0f64-b0557f6ac2f8@citrix.com>
Date: Fri, 13 Mar 2020 15:50:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8221cc7f-ad33-03da-5780-8a76fbdc404a@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 3/4] x86/APIC: reduce rounding errors in
 calculations
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

T24gMTMvMDMvMjAyMCAwOToyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L2FwaWMuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hcGljLmMKPiBAQCAtMTI0OSwxNyArMTI0
OSwxNiBAQCBzdGF0aWMgaW50IF9faW5pdCBjYWxpYnJhdGVfQVBJQ19jbG9jayh2Cj4gICAgICB0
dDIgPSBhcGljX3JlYWQoQVBJQ19UTUNDVCk7Cj4gICAgICB0MiA9IHJkdHNjX29yZGVyZWQoKTsK
PiAgCj4gLSAgICByZXN1bHQgPSAodHQxLXR0MikqQVBJQ19ESVZJU09SL0xPT1BTOwo+ICsgICAg
YnVzX2ZyZXEgPSAodHQxIC0gdHQyKSAqIEFQSUNfRElWSVNPUiAqIExPT1BTX0ZSQUM7Cj4gIAo+
IC0gICAgYXBpY19wcmludGsoQVBJQ19WRVJCT1NFLCAiLi4uLi4gQ1BVIGNsb2NrIHNwZWVkIGlz
ICVsZC4lMDRsZCBNSHouXG4iLAo+IC0gICAgICAgICAgICAgICAgKChsb25nKSh0MiAtIHQxKSAv
IExPT1BTKSAvICgxMDAwMDAwIC8gSFopLAo+IC0gICAgICAgICAgICAgICAgKChsb25nKSh0MiAt
IHQxKSAvIExPT1BTKSAlICgxMDAwMDAwIC8gSFopKTsKPiArICAgIGFwaWNfcHJpbnRrKEFQSUNf
VkVSQk9TRSwgIi4uLi4uIENQVSBjbG9jayBzcGVlZCBpcyAlbHUuJTA0bHUgTUh6LlxuIiwKPiAr
ICAgICAgICAgICAgICAgICgodW5zaWduZWQgbG9uZykodDIgLSB0MSkgKiBMT09QU19GUkFDKSAv
IDEwMDAwMDAsCj4gKyAgICAgICAgICAgICAgICAoKHVuc2lnbmVkIGxvbmcpKHQyIC0gdDEpICog
TE9PUFNfRlJBQyAvIDEwMCkgJSAxMDAwMCk7CgpJZiBJJ20gbm90IG1pc3Rha2VuLCB0aGlzIGV4
cHJlc3Npb24gb25seSB3b3JrcyBiZWNhdXNlIG9mIHRoZSBMLT5SCmFzc29jaWF0aXZpdHkgKGdp
dmVuIHRoZSBzYW1lIHByZWNlZGVuY2Ugb2YgKiBhbmQgLykgZ3JvdXBpbmcgaXQgYXMKKCh0Mi10
MSkgKiAxMCnCoCAvIDEwMCBhcyBvcHBvc2VkIHRvICh0Mi10MSkgKiAoMTAgLyAxMDApLCB3aGVy
ZSB0aGUKbGF0dGVyIHdvdWxkIHRydW5jYXRlIHRvIDAuwqAgSSB0aGluayBzb21lIGV4dHJhIGJy
YWNrZXRzIHdvdWxkIGhlbHAgZm9yCmNsYXJpdHkuCgpUaGF0IHNhaWQsIHdoYXQgaXMgd3Jvbmcg
d2l0aCBrZWVwaW5nIHRoZSBvcmlnaW5hbCBmb3JtP8KgIEkgcmVhbGlzZSB0aGlzCmlzIG9ubHkg
Zm9yIGEgcHJpbnRrKCksIGJ1dCB0aGUgZGl2IGluc3RydWN0aW9uIGNhbid0IGJlIHNoYXJlZCBi
ZXR3ZWVuCnRoZSB0d28gaGFsdmVzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
