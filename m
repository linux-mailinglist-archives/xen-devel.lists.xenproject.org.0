Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741EE13478F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 17:19:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipE0C-000351-EX; Wed, 08 Jan 2020 16:16:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/AM3=25=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipE0B-00034w-5e
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 16:16:11 +0000
X-Inumbo-ID: 29b6fa5c-3232-11ea-a38f-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29b6fa5c-3232-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 16:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578500163;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8hoJFFr4mKkLpPk8C/cXGms0hK21thgbVmldRI5SWFw=;
 b=IrUXKiPK4XuVaDZfBtMdvCa0dCXwn3O/eobZmzD0/UZPUeevL3P2lcm9
 uK7HGnSUt0SMQ1xhhZHZop7JNwt+3TGSvcXgGdlNvDudJAaXnIDCEYvuL
 gzLRnOBla/ncWLqld9RIkA7DwTJt48OrMQXZRvcJR/SN0M1IoP0z1MTkn Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2iNGdIB7kn4WzBJO1xkYgXFkqaJGhL5BKwDH9E3Iq/88YOcOhNvt4ITgkR0YYqz+gwgxs4luLA
 s82GRAHxalVzQKlrJoYULFSlhhKPYfAFxcwN6nuXJUAHrS//PdGouZ+VMFJSxWrErVDkJvFYdt
 5HsdJ/ke+d6ou0ACr4C1yu5m3OthhGMG4raAorCC+OoLwT0AUzPiOZajS2nFfz4vti8o0xTuwt
 6+R2SHPs7Urc1pWxjTeYIxeJOEKBJd0mzOUzGibVkZmjO9PNVEtUFBh3h2fu3UCGSvvhcwwQ9V
 0Q4=
X-SBRS: 2.7
X-MesageID: 10793608
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="10793608"
To: Jan Beulich <jbeulich@suse.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-5-andrew.cooper3@citrix.com>
 <3601fa20-ba6a-78d6-62a2-a204ee49021e@suse.com>
 <cfee6317-36dc-05d6-1887-da0a5ce9428f@citrix.com>
 <38cdc276-d41a-9e79-3f0a-8836ebe9a125@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6d9ebd8d-3b71-c88a-9786-b4fb66905982@citrix.com>
Date: Wed, 8 Jan 2020 16:15:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <38cdc276-d41a-9e79-3f0a-8836ebe9a125@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/6] x86/boot: Clean up l?_bootmap[]
 construction
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

T24gMDgvMDEvMjAyMCAxMTozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoZSBwdXJwb3NlIG9m
IHRoaXMgd2FzIHRvIG1ha2UgdGhlIGhhbmRsaW5nIG9mIGw/X2Jvb3RtYXBbXSBhcwo+PiBjb25z
aXN0ZW50IGFzIHBvc3NpYmxlIGJldHdlZW4gdGhlIHZhcmlvdXMgZW52aXJvbm1lbnRzLsKgIFRo
ZSBwYWdldGFibGVzCj4+IHRoZW1zZWx2ZXMgYXJlIGNvbW1vbiwgYW5kIHNob3VsZCBiZSB1c2Vk
IGNvbnNpc3RlbnRseS4KPiBJIGRvbid0IHRoaW5rIEkgY2FuIHdob2xlaGVhcnRlZGx5IGFncmVl
IGhlcmU6IGw/X2Jvb3RtYXBbXSBhcmUKPiB0aHJvdy1hd2F5IHBhZ2UgdGFibGVzIChsaXZpbmcg
aW4gLmluaXQpLCBhbmQgd2l0aCB0aGUgbm9uLUVGSSBhbmQKPiBFRkkgYm9vdCBwYXRocyBiZWlu
ZyBzbyBkaWZmZXJlbnQgYW55d2F5LCB0aGVtIHVzaW5nIHRoZSBhdmFpbGFibGUKPiB0YWJsZXMg
ZGlmZmVyZW50bHkgaXMgbm90IGEgYmlnIGlzc3VlIGltby4gVGhpcyBoZWF2eSBkaWZmZXJlbmNl
IG9mCj4gb3RoZXIgYXNwZWN0cyB3YXMgYWxzbyB3aHkgYmFjayB0aGVuIEkgZGVjaWRlZCB0byBi
ZSBhcyBkZWZlbnNpdmUKPiB0b3dhcmRzIGwyX2Jvb3RtYXBbXSBzaXplIGNoYW5nZXMgYXMgcG9z
c2libGUgaW4gY29kZSB3aGljaCBkb2Vzbid0Cj4gcmVhbGx5IG5lZWQgaXQgdG8gYmUgbXVsdGlw
bGUgcGFnZXMuCgpGcm9tIHRoaXMgZGVzY3JpcHRpb24sIGl0IHN1Z2dlc3RzIHRoYXQgeW91IGhh
dmVuJ3Qgc3BvdHRlZCB0aGUgcmF0aGVyCm1vcmUgc3VidGxlIGJ1ZyB3aGljaCB3aWxsIHRyaXAg
dXAgYW55b25lIHRyeWluZyB0byBkZXZlbG9wIGluIHRoZSBmdXR1cmUuCgpUaGlzIHNjaGVtZSBp
cyBpbmNvbXBhdGlibGUgd2l0aCB0cnlpbmcgdG8gbWFwIGEgc2Vjb25kIG9iamVjdCAoZS5nLiB0
aGUKdHJhbXBvbGluZSkgaW50byB0aGUgYm9vdG1hcCwgYmVjYXVzZSBkZXBlbmRpbmcgb24gYWxp
Z25tZW50LCBpdCBtYXkKb3ZlcmxhcCB3aXRoIHRoZSBQVEVzIHdoaWNoIG1hcHBlZCBYZW4uwqAg
VGhlcmUgYWxzbyB0eXBpY2FsbHkgaXNuJ3QgYW4KbDNfYm9vdG1hcFswXSA9PiBsMl9ib290bWFw
WzBdIGJlY2F1c2Ugb2Ygd2hlcmUgeGVuLmVmaSBpcyBsb2FkZWQgaW4gbWVtb3J5LgoKPgo+IEFz
IHNhaWQgLSBJJ20gZ29pbmcgdG8gdHJ5IHRvIG5vdCBzdGFuZCBpbiB0aGUgd2F5IG9mIHlvdSBy
ZS0KPiBhcnJhbmdpbmcgdGhpcywgYnV0Cj4gLSB0aGUgbmV3IGNvZGUgc2hvdWxkIG5vdCBicmVh
ayBzaWxlbnRseSB3aGVuIChpbiBwYXJ0aWN1bGFyKQo+ICAgbDJfYm9vdG1hcFtdIGNoYW5nZXMK
CldoYXQgcHJhY3RpY2FsIGNoYW5nZXMgZG8geW91IHRoaW5rIGNvdWxkIGJlIGRvbmUgaGVyZT/C
oCBJIGNhbid0IHNwb3QKYW55IHdoaWNoIHdvdWxkIGJlIGhlbHBmdWwuCgpBIEJVSUxEX0JVR19P
TigpIGRvZXNuJ3Qgd29yay7CoCBUaGUgbW9zdCBsaWtlbHkgY2FzZSBmb3Igc29tZXRoaW5nIGdv
aW5nCndyb25nIGhlcmUgaXMgYW4gZWRpdCB0byB4ODZfNjQuUyBhbmQgbm8gZXF1aXZhbGVudCBl
ZGl0IHRvIHBhZ2UuaCwKd2hpY2ggYSBCVUlMRF9CVUdfT04oKSB3b3VsZG4ndCBzcG90LsKgIGhl
YWQuUyBzaW1pbGFybHkgaGFzIG5vIHVzZWZ1bApwcm90ZWN0aW9ucyB3aGljaCBjb3VsZCBiZSBh
ZGRlZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
