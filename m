Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BCEC344C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 14:33:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFHIa-0007Gd-3K; Tue, 01 Oct 2019 12:30:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=78uS=X2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFHIY-0007GY-Mu
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 12:30:34 +0000
X-Inumbo-ID: 42dc2e14-e447-11e9-bf31-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 42dc2e14-e447-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 12:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569933033;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=R8Uvok4FZYJ/QnufSpB3cffKHza/a9AA1RIy7G/lF/k=;
 b=QYfH+7P/WyelYVBKM/3cTmijOKXE3F+J2AgwcmhpqeWin5hpYV8XyxQb
 aPpXcIj0/ZcjgpPxbRer+R6skO5xKP5EW1g+o5KOWhqB7QqEQTWuUEyVt
 N1hDw7SvdYCgyEgUN0QbWfEhbmz4Rw14FxgUCaqQVh9V6ZUHRkuqzzlG1 E=;
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
IronPort-SDR: Hb6I1xiu7NK6UKNDDfthA4LFnIkQyslSEARCiXBdd/y4cWIBic/C8+2kr+fJ/3PLzeI7ITGtta
 Oo8Jhx94EgWyb2kkI4NDevoPwk7jJ53MQpcHKH24WhwzAZR1BZoQjWQ079GKbLSYWt15InIESc
 HITPgsemOSknqTNHH/0t/nl3Qdhta5JwUXCR85OSik6BGIPJFlYeWZbg0oHo5SeKKuFdOBeqDs
 OTdfRSgftaLhhV0Vq4YlX24hlHWS6958wXlMy6GkbJdQPiT/iE9Qot8N96JmXyXW7ifE4Hxfzz
 JY8=
X-SBRS: 2.7
X-MesageID: 6374317
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6374317"
To: Jan Beulich <jbeulich@suse.com>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-2-andrew.cooper3@citrix.com>
 <48e28ff1-3598-52a5-2f79-0087596a0688@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0ceb4471-8e6b-7220-26c4-16aa9b2bb630@citrix.com>
Date: Tue, 1 Oct 2019 13:30:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <48e28ff1-3598-52a5-2f79-0087596a0688@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 1/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_ARRAY_HARDEN
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMTAvMjAxOSAxMTo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMDkuMjAxOSAy
MDoyNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnCj4+
ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZwo+PiBAQCAtNzcsNiArNzcsMjcgQEAgY29uZmlnIEhB
U19DSEVDS1BPTElDWQo+PiAgCXN0cmluZwo+PiAgCW9wdGlvbiBlbnY9IlhFTl9IQVNfQ0hFQ0tQ
T0xJQ1kiCj4+ICAKPj4gK21lbnUgIlNwZWN1bGF0aXZlIGhhcmRlbmluZyIKPj4gKwo+PiArY29u
ZmlnIFNQRUNVTEFUSVZFX0FSUkFZX0hBUkRFTgo+IFNlZWluZyBhbHNvIHRoZSBuZXcgaXRlbSBp
biBwYXRjaCAyIC0gd291bGRuJ3QgaXQgYmUgYmV0dGVyIGZvciB0aGVtIGFsbAo+IHRvIGhhdmUg
KGp1c3QpIGEgY29tbW9uIHByZWZpeCwgcmF0aGVyIHRoYW4gY29tbW9uIHByZWZpeCBhbmQgYSBj
b21tb24KPiBzdWZmaXguIEUuZy4gU1BFQ1VMQVRJVkVfSEFSREVOX0FSUkFZUyBoZXJlIGFuZCBT
UEVDVUxBVElWRV9IQVJERU5fQlJBTkNIRVMKPiB0aGVyZT8KCkNhbiBkby4KCj4KPj4gLS0tIGEv
eGVuL2luY2x1ZGUveGVuL25vc3BlYy5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9ub3NwZWMu
aAo+PiBAQCAtMzMsNiArMzMsNyBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYXJyYXlf
aW5kZXhfbWFza19ub3NwZWModW5zaWduZWQgbG9uZyBpbmRleCwKPj4gIH0KPj4gICNlbmRpZgo+
PiAgCj4+ICsjaWZkZWYgQ09ORklHX1NQRUNVTEFUSVZFX0FSUkFZX0hBUkRFTgo+PiAgLyoKPj4g
ICAqIGFycmF5X2luZGV4X25vc3BlYyAtIHNhbml0aXplIGFuIGFycmF5IGluZGV4IGFmdGVyIGEg
Ym91bmRzIGNoZWNrCj4+ICAgKgo+PiBAQCAtNTgsNiArNTksMTcgQEAgc3RhdGljIGlubGluZSB1
bnNpZ25lZCBsb25nIGFycmF5X2luZGV4X21hc2tfbm9zcGVjKHVuc2lnbmVkIGxvbmcgaW5kZXgs
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4+ICAgICAgKHR5cGVvZihfaSkpIChfaSAmIF9tYXNrKTsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICB9KQo+PiArI2Vs
c2UKPj4gKy8qIE5vIGluZGV4IGhhcmRlbmluZy4gKi8KPj4gKyNkZWZpbmUgYXJyYXlfaW5kZXhf
bm9zcGVjKGluZGV4LCBzaXplKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4g
Kyh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPj4gKyAgICB0eXBlb2YoaW5kZXgpIF9pID0gKGluZGV4KTsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICB0eXBlb2Yoc2l6
ZSkgX3MgPSAoc2l6ZSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAodm9pZClfczsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICBfaTsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPj4gK30pCj4gV2h5IG5vdCB0aGUgc2ltcGxlcgo+Cj4gI2RlZmluZSBhcnJheV9p
bmRleF9ub3NwZWMoaW5kZXgsIHNpemUpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiAgICAgKHZvaWQpKHNpemUpOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgIChpbmRleCk7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+IH0pCj4KPiBhdCB3aGljaCBwb2ludCBpdCB3b3VsZCBzZWVtIGZlYXNpYmxlIHRvIGF2b2lk
IHRoZSB1c2Ugb2YgY29tcGlsZXIKPiBleHRlbnNpb25zIGFsdG9nZXRoZXIgYnkgbWFraW5nIGl0
Cj4KPiAjZGVmaW5lIGFycmF5X2luZGV4X25vc3BlYyhpbmRleCwgc2l6ZSkgKCh2b2lkKShzaXpl
KSwgKGluZGV4KSkKCkh1aCAtIEkgdHJpZWQgdGhhdCBmaXJzdCwgYW5kIEdDQyB3YXMgZGlzdGlu
Y3RseSB1bmhhcHB5LsKgIEl0IHR1cm5zIG91dAp0byBiZSB0aGUgYnJhY2tldGluZyBvZiBzaXpl
LCB3aGljaCB3aGVuIG9taXR0ZWQsIGNhdXNlczoKCi9sb2NhbC94ZW4uZ2l0L3hlbi9pbmNsdWRl
L3hlbi9ub3NwZWMuaDo2Njo0MjogZXJyb3I6IHZvaWQgdmFsdWUgbm90Cmlnbm9yZWQgYXMgaXQg
b3VnaHQgdG8gYmUKwqAjZGVmaW5lIGFycmF5X2luZGV4X25vc3BlYyhpbmRleCwgc2l6ZSkgKCh2
b2lkKXNpemUsIChpbmRleCkpCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAphcmdvLmM6MjE3
NDoxNjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGFycmF5X2luZGV4X25vc3BlY+KA
mQrCoMKgwqDCoMKgwqDCoMKgIG5pb3YgPSBhcnJheV9pbmRleF9ub3NwZWMoYXJnMywgWEVOX0FS
R09fTUFYSU9WICsgMSk7CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+
fn5+fn5+fn4KCkknbGwgc3dpdGNoIHRvIHRoaXMgdmVyc2lvbi4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
