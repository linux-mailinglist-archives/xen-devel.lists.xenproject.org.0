Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62142A8048
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 12:22:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5SOG-0008RD-Oc; Wed, 04 Sep 2019 10:19:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zWnQ=W7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5SOF-0008R4-Ou
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 10:19:51 +0000
X-Inumbo-ID: 874e6224-cefd-11e9-abae-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 874e6224-cefd-11e9-abae-12813bfff9fa;
 Wed, 04 Sep 2019 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567592392;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/ByPxj2DV9o2PGhySnkzT7slaadv7TRKh3A8V9yVrQI=;
 b=bAZ3br/z7Xkyg6P6cwetDaTFt4vVt6TX5Bi87NuDTSYPOGrH/tXncKOJ
 cbTsm1dOv50Hrl/Ti7oKC8/KEFU/dMnPf13XNugnt+1KJM9bxGtlhDFGT
 AEJ0iFKGfkk7Ua63bHb0jJeTHT3b/Z8gPiE8t3r5ksYEs/tkTNQ7O2Khe 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xK6S3yOR0uu2AVkF9e2cVpN32xjmO+PMIkr1uq6Le1pnhQJbfnOxrOOBBy/xNZnF0aaCSGu9Uy
 yWZTl07F/wIRJwfHN8Ot/wIfTBdL8a4dpSM9I2LRapssLyZ1YRLVz9dIcUb6AbuobkN9b8yqnZ
 GTnji7D5ToxR4qRg69QxBt+trIlj3jmny2GbRhXV0kc1H2IwgFmvFu5vmz7e4OsqTWTkeSaQRD
 5OvRVtSpZr/+6OWdGSthAT84kt5uEZf71s7wj0Z8RIj4CzuxJqVRb2i4DO2RUClS4AlBDAPz8x
 tgE=
X-SBRS: 2.7
X-MesageID: 5159752
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,465,1559534400"; 
   d="scan'208";a="5159752"
To: Jan Beulich <jbeulich@suse.com>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
 <fa007bb5-1644-6116-fe96-00b00f7241a4@suse.com>
 <59fc6a13-6008-e537-6bfd-51fd97df676c@citrix.com>
 <b0dff6e4-a5be-445d-76db-cbe923484a92@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <4132f20e-f106-ad77-e6b7-dd39db9d1946@citrix.com>
Date: Wed, 4 Sep 2019 11:19:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b0dff6e4-a5be-445d-76db-cbe923484a92@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 5/8] x86emul: support MOVDIR{I, 64B} insns
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDkvMjAxOSAxMzoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMDkuMjAxOSAx
MjoyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDMvMDkvMjAxOSAxMDozOSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBOb3RlIHRoYXQgU0RNIHJldmlzaW9uIDA3MCBkb2Vzbid0IHNwZWNp
ZnkgZXhjZXB0aW9uIGJlaGF2aW9yIGZvcgo+Pj4gTW9kUk0ubW9kICE9IDBiMTE7IGFzc3VtaW5n
ICNVRCBoZXJlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPj4gV2hhdCBhcmUgd2UgZ29pbmcgdG8gZG8gYWJvdXQgdGhlIC0+d3JpdGUoKSBo
b29rIGF0b21pY2l0eT/CoCBJJ20gaGFwcHkKPj4gdG8gcHV0IGl0IG9uIHRoZSBUT0RPIGxpc3Qs
IGJ1dCB3ZSBjYW4ndCBzaW1wbHkgaWdub3JlIHRoZSBwcm9ibGVtLgo+IFNvIGRvIHlvdSBub3Qg
YWdyZWUgd2l0aCBteSBhc3Nlc3NtZW50IHRoYXQgb3VyIG1lbWNweSgpCj4gaW1wbGVtZW50YXRp
b24gc2F0aXNmaWVzIHRoZSBuZWVkLCBhbmQgaXQncyBqdXN0IG5vdCB2ZXJ5Cj4gbmljZSB0aGF0
IHRoZSAtPndyaXRlKCkgaG9vayBpcyBkZXBlbmRlbnQgdXBvbiB0aGlzPwoKV2UgdXNlIF9fYnVp
bHRpbl9tZW1jcHkoKSwgbm90IG5lY2Vzc2FyaWx5IG91ciBvd24gbG9jYWwgaW1wbGVtZW50YXRp
b24uCgpPdXIgb3duIGNvcHkgdXNlcyByZXAgbW92c3EgZm9sbG93ZWQgYnkgcmVwIG1vdnNiIG9m
IHVwIHRvIDcgYnl0ZXMsCndoaWNoIGRvZXNuJ3QgaGFuZGxlIDIgYW5kIDQgYnl0ZSBjb3BpZXMg
YXRvbWljYWxseS7CoCBNb3JlIGdlbmVyYWxseSwKcmVwIG1vdnMgZG9lc24ndCBwcm92aWRlIGd1
YXJhbnRlZXMgYWJvdXQgdGhlIGV4dGVybmFsIHZpc2liaWxpdHkgb2YKY29tcG9uZW50IHdyaXRl
cywgb3dpbmcgdG8gdGhlIG1hbnkgZGlmZmVyZW50IHdheXMgdGhhdCBzdWNoIHdyaXRlcyBtYXkK
YmUgaW1wbGVtZW50ZWQsIGFuZCBvcHRpbWlzZWQuCgpFdmVuIGlmIHRoZSBhYm92ZSB3ZXJlIGZp
eGVkIChhbmQgSSdtIG5vdCBzdXJlIGNvdWxkIG1ha2UgaXQgY29ycmVjdApldmVuIGZvciBtaXNh
bGlnbmVkIHdyaXRlcyksIHdlIGNhbm5vdCBkZXBlbmQgb24gb3VyIG93biBtZW1jcHkgbmV2ZXIK
Y2hhbmdpbmcgaW4gdGhlIGZ1dHVyZS7CoCBGb3Igb25lLCBpdCBzaG91bGQgYmUgYSBzdHJhaWdo
dCByZXAgbW92c2Igb24KbW9zdCBJbnRlbCBoYXJkd2FyZSB0aGVzZSBkYXlzLCBmb3IgcGVyZm9y
bWFuY2UuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
