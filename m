Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7024C157CED
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 14:59:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j19Xt-0001yx-Bv; Mon, 10 Feb 2020 13:56:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qaH/=36=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j19Xr-0001ys-Lf
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 13:56:15 +0000
X-Inumbo-ID: 19c79800-4c0d-11ea-852a-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19c79800-4c0d-11ea-852a-bc764e2007e4;
 Mon, 10 Feb 2020 13:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581342975;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sL1FmbqafFHrYlushRrvdHeGYa0W6f4aMxZEFSiwpsQ=;
 b=UXSofTQtphM9MmdGJ7EUaVgB680C7EbMudJeMvaqOvDiMDku10D8WHii
 U32SZKTpSjheFKbSq9D4FZTjdr7GpDSjBr8rewoDdE8hRwvg+GHtL0t5c
 3Z4ydbXUsyQn9doOzaluO95z8oF35o6567i8majuKuQjECW4KlFuNouXw o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DSzb3JiMxsRLZP5Uar5vuv5kqYFhgK5RDFQywafhWsZ7Rkn1C5t7xhOvfp7IU/SpqJIMzH0cwq
 dOf9H1Nn4g4D0vn76dcUg1aAn4j0zMsf80Aj16rtdfTWvL4DWUQc6wdcA6zZvaaNG0jbYaCTrE
 0BbnLKsxvyW7XQ5cT1zWdYlI3d8pGX9DuJ+oCUJdY0y55j37ig7cpWkB+YthKWDJ+mi1nVKD5v
 rAOhqersi7k2r5yNKdx7sQtEvQDKcue+LOy2GlbHsM8Dm6S/MJA+Uy9M7s0mHmsF79q8lcMFAh
 iUo=
X-SBRS: 2.7
X-MesageID: 12209221
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12209221"
To: Jan Beulich <jbeulich@suse.com>
References: <20200208151939.31691-1-andrew.cooper3@citrix.com>
 <43b54452-b4e8-eaca-466b-f79480f0b2c4@suse.com>
 <cd5a5f78-8cef-88b0-51e3-9367bb7df063@citrix.com>
 <6f4fc0f8-6d3a-58f6-5a13-e9b14ca3c3cc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b9e1cc74-0d5a-53dd-3a3c-485438bb6b24@citrix.com>
Date: Mon, 10 Feb 2020 13:56:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6f4fc0f8-6d3a-58f6-5a13-e9b14ca3c3cc@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/pvh: Fix segment selector ABI
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDIvMjAyMCAxMzo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTAuMDIuMjAyMCAx
NDoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTAvMDIvMjAyMCAxMzoyMiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwOC4wMi4yMDIwIDE2OjE5LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IC0tLSBhL2RvY3MvbWlzYy9wdmgucGFuZG9jCj4+Pj4gKysrIGIvZG9jcy9taXNjL3B2
aC5wYW5kb2MKPj4+PiBAQCAtMjMsNyArMjMsNyBAQCBmb2xsb3dpbmcgbWFjaGluZSBzdGF0ZToK
Pj4+PiAgICogYGNzYDogbXVzdCBiZSBhIDMyLWJpdCByZWFkL2V4ZWN1dGUgY29kZSBzZWdtZW50
IHdpdGggYSBiYXNlIG9mIOKAmDDigJkKPj4+PiAgICAgYW5kIGEgbGltaXQgb2Yg4oCYMHhGRkZG
RkZGRuKAmS4gVGhlIHNlbGVjdG9yIHZhbHVlIGlzIHVuc3BlY2lmaWVkLgo+Pj4+ICAKPj4+PiAt
ICogYGRzYCwgYGVzYDogbXVzdCBiZSBhIDMyLWJpdCByZWFkL3dyaXRlIGRhdGEgc2VnbWVudCB3
aXRoIGEgYmFzZSBvZgo+Pj4+ICsgKiBgZHNgLCBgZXNgLCBgc3NgOiBtdXN0IGJlIGEgMzItYml0
IHJlYWQvd3JpdGUgZGF0YSBzZWdtZW50IHdpdGggYSBiYXNlIG9mCj4+Pj4gICAgIOKAmDDigJkg
YW5kIGEgbGltaXQgb2Yg4oCYMHhGRkZGRkZGRuKAmS4gVGhlIHNlbGVjdG9yIHZhbHVlcyBhcmUg
YWxsIHVuc3BlY2lmaWVkLgo+Pj4gV291bGRuJ3QgdGhpcyB3YW50IGFjY29tcGFueWluZyB3aXRo
IGFuIGFkanVzdG1lbnQgdG8KPj4+IHhlbi9hcmNoL3g4Ni9odm0vZG9tYWluLmM6Y2hlY2tfc2Vn
bWVudCgpLCB3aGljaCByaWdodCBub3cKPj4+IGlzbid0IGluIGxpbmUgd2l0aCBlaXRoZXIgb2xk
IG9yIG5ldyB2ZXJzaW9uIG9mIHRoaXMgZG9jPwo+PiBXaGF0IGRvIHlvdSB0aGluZyBpcyBtaXNz
aW5nP8KgIEl0IHRvbyBpcyB3cml0dGVuIHdpdGggdGhlIGV4cGVjdGF0aW9uIG9mCj4+ICVlcyBi
ZWluZyBzZXQgdXAsIHdoaWNoIEkgY2hlY2tlZCBiZWZvcmUgc2VuZGluZyB0aGlzIHBhdGNoLgo+
IFRoZSBmdW5jdGlvbiBmb3IgZXhhbXBsZSBsb29rcyB0byBwZXJtaXQgemVybyBzZWdtZW50IGF0
dHJpYnV0ZXMKPiBmb3IgYm90aCBEUyBhbmQgRVMuIEl0IGFsc28gbG9va3MgdG8gcGVybWl0IG5v
bi13cml0YWJsZQo+IGF0dHJpYnV0ZXMgZm9yIGJvdGgsIGFuZCBhIG5vbi1yZWFkYWJsZSBDUy4K
Ckl0IGlzIG5vdCBhIFBWSC1hdWRpdGluZyBmdW5jdGlvbi4KCkl0IGlzIHJlYWNoYWJsZSBmcm9t
IHBsYWluIEhWTSBndWVzdHMsIGFuZCBpcyBvbmx5IHN1cHBvc2VkIHRvIGJlIGEKbWluaW11bSBz
ZXQgb2YgY2hlY2tzIHRvIHByZXZlbnQgYSB2bWVudHJ5IGZhaWx1cmUgb2YgdGhlCm5ld2x5LWlu
aXRpYWxpc2VkIHZjcHUgc3RhdGUuwqAgKFdoZXRoZXIgaXQgYWN0dWFsbHkgbWVldHMgdGhpcyBn
b2FsIGlzIGEKc2VwYXJhdGUgbWF0dGVyLikKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
