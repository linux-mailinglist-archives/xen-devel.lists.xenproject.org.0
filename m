Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6393111CFA8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 15:22:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifPKj-0001W4-QB; Thu, 12 Dec 2019 14:20:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Md0W=2C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifPKi-0001Vx-3z
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 14:20:48 +0000
X-Inumbo-ID: 96795ed0-1cea-11ea-8d69-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96795ed0-1cea-11ea-8d69-12813bfff9fa;
 Thu, 12 Dec 2019 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576160446;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ApSJ9SgU99pwLfZ1+bVfnIvX8s7gxr7QKNpFTIOAOaQ=;
 b=IRB5FPkX/ch3IXuD2TuzFkTL2s9YpQG+HarykypcFaYoFoTxGmSDaLLa
 A9Q4LHmx1Zx+TYYe30ybWzmAlGvNQ6MxtUcpI7Yea9vCOMIxeDfZuoOGA
 rflA+D6h8OCC9F7K1vAWAGX0GA2Vhljtr23Y76P5IZmtmWQum4oVF1x2T g=;
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
IronPort-SDR: RnewicYXJBUZXvV2RUice1zge7tS6XPrCSMOW0AyDUK/0TsWiuKH9GS89w4jm3T4KYzeFEan/Z
 uQv57x3tdpkuKqHGj8cvFocl09Uu46H0cxtttXg/ZTOC1eVMBSbekTek8FwmJF1jTgd1SzbP1I
 LU/axWzZIY2L1kKVtGu+fXARZnZGfjSi66xIrks8ZAOcn9fjhuZo9ly4Q7eaU+DOIyRqGtpN06
 tUzHogfX5R4E5Cv2JoDfdDIzRtG+7d+9AFmchMZYZeiShhcMajluvIMx6zKlbaEJNMgre5KKC3
 b9g=
X-SBRS: 2.7
X-MesageID: 9942558
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9942558"
To: Jan Beulich <jbeulich@suse.com>
References: <cd54bc0e-9e7b-42bb-ea60-8d4578a59cac@suse.com>
 <f150033a-ec07-7542-ab49-b5a8b746c2c1@citrix.com>
 <43160a9d-2738-0b1d-01ef-b3ad8f1c50dc@suse.com>
 <c49ca1fb-ce62-6668-966f-7a75150687fa@citrix.com>
 <dca85647-3e26-0d70-d381-e4baca33b156@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0cb57b2f-c127-4161-85c6-a99e933398f5@citrix.com>
Date: Thu, 12 Dec 2019 14:20:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dca85647-3e26-0d70-d381-e4baca33b156@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86emul: correct LFS et al handling for
 64-bit mode
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
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTIvMjAxOSAxMzowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTIuMTIuMjAxOSAx
MjozNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTIvMTIvMjAxOSAxMDoxMSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxMS4xMi4yMDE5IDIxOjU3LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDExLzEyLzIwMTkgMDk6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBBTUQg
YW5kIGZyaWVuZHMgZXhwbGljaXRseSBzcGVjaWZ5IHRoYXQgNjQtYml0IG9wZXJhbmRzIGFyZW4n
dCBwb3NzaWJsZQo+Pj4+PiBmb3IgdGhlc2UgaW5zbnMuIE5ldmVydGhlbGVzcyBSRVguVyBpc24n
dCBmdWxseSBpZ25vcmVkOiBJdCBzdGlsbAo+Pj4+PiBjYW5jZWxzIGEgcG9zc2libGUgb3BlcmFu
ZCBzaXplIG92ZXJyaWRlICgweDY2KS4gSW50ZWwgb3RvaCBleHBsaWNpdGx5Cj4+Pj4+IHByb3Zp
ZGVzIGZvciA2NC1iaXQgb3BlcmFuZHMgb24gdGhlIHJlc3BlY3RpdmUgaW5zbiBwYWdlIG9mIHRo
ZSBTRE0uCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPj4+PiBJdCBpcyBkZWZpbml0ZWx5IG1vcmUgdGhhbiBqdXN0IHRoZXNlLsKgIE5l
YXIganVtcHMgaGF2ZSBwZXItdmVuZG9yCj4+Pj4gYmVoYXZpb3VyIG9uIGhvdyBsb25nIHRoZSBp
bnN0cnVjdGlvbiBpcywgd2hlcmVhcyBmYXIganVtcC9jYWxscyBhcmUgaW4KPj4+PiB0aGUgc2Ft
ZSBjYXRlZ29yeSBhcyB0aGVzZSBieSB0aGUgbG9va3Mgb2YgdGhpbmdzLgo+Pj4gQnV0IHlvdSBk
b24ndCBleHBlY3QgbWUgdG8gZm9sZCBhbGwgb2YgdGhlc2UgaW50byBvbmUgcGF0Y2gsIGRvCj4+
PiB5b3U/Cj4+IHNob3J0IGptcCBjZXJ0YWlubHkgbm90LCBidXQgZmFyIGptcC9jYWxsIGlzIGp1
c3QgdHdvIGV4dHJhIGNhc2UKPj4gc3RhdGVtZW50cyBpbiB0aGlzIG5ldyBjb2RlIGJsb2NrLCBu
bz8KPiBOb3QgZXhhY3RseSAodGhlIG90aGVyIGNoYW5nZSB3b3VsZCBuZWVkIHRvIGJlIGluCj4g
eDg2X2RlY29kZV9vbmVieXRlKCkgYW5kIGRlcGVuZCBvbiBNb2RSTS5yZWcpLCBidXQgeWVzLCBJ
IGNhbgo+IGRvIHRoaXMuIFlldCB0aGVuIGl0IHdvdWxkIGZlZWwgb2RkIHRvIG5vdCBhbHNvIGRl
YWwgd2l0aCB0aGUKPiBuZWFyIGNvdW50ZXJwYXJ0cyBhdCB0aGUgc2FtZSB0aW1lLiBXaGljaCBp
biB0dXJuIHdvdWxkIG1ha2UKPiBpcyBkZXNpcmFibGUgdG8gYWxzbyBkZWFsIHdpdGggbmVhciBS
RVQgYXMgd2VsbC4gQXQgd2hpY2gKPiBwb2ludCB3ZSdyZSBhYm91dCB0byBhbHNvIGRpc2N1c3Mg
Q0FMTC9KTVAgd2l0aCBkaXNwbGFjZW1lbnQKPiBvcGVyYW5kcyBhbmQgSmNjLgo+Cj4+PiBXZSBo
YXZlIF9zb21lXyB2ZW5kb3IgZGVwZW5kZW50IGJlaGF2aW9yIGFscmVhZHksIGFuZCBJJ20KPj4+
IHNsb3dseSBhZGRpbmcgdG8gaXQuIE91ciBmYXIgY2FsbC9qbXAgc3VwcG9ydCBpcyByYXRoZXIK
Pj4+IGluY29tcGxldGUgaW4gb3RoZXIgd2F5cyBhbnl3YXkuCj4+IFRoZXJlIGlzIGRpZmZlcmVu
dCB0cnVuY2F0aW9uIGJlaGF2aW91ciBmb3IgJXJpcCB3aGljaCBuZWVkcyBhbHRlcmluZywKPj4g
YnV0IHRoYXQgaXMgYSBzZXBhcmF0ZSBhcmVhIG9mIGNvZGUuwqAgQW55dGhpbmcgZWxzZT8KPiBw
cm90bW9kZV9sb2FkX3NlZygpIGFuZCBNT1ZTWEQgYWxyZWFkeSBoYXZlIHZlbmRvciBkZXBlbmRl
bnQKPiBjb2RlLCBpZiB0aGF0IHdhcyB5b3VyIHF1ZXN0aW9uLgoKSSB3YXMgYWN0dWFsbHkganVz
dCBhc2tpbmcgYWJvdXQgZmFyIGptcC9jYWxsLgoKSWYgeW91J3JlIHN1cmUgdGhhdCBmYXIgam1w
L2NhbGwgaXMgbW9yZSBjb21wbGljYXRlZCB0aGFuIGp1c3QgdHdlYWtpbmcKdGhpcyBwYXRjaCwg
dGhlbiBmaW5lLsKgIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKPiBGb3IgdGhpbmdzIG5lZWRpbmcgZG9pbmcgc2VlCj4gYWJvdmUgcGx1cyBMT09Q
LCBKW0VSXUNYWiwgU1lTRU5URVIsIGFuZCBTWVNFWElUIGFzIGZhciBhcyBJJ20KPiBjdXJyZW50
bHkgYXdhcmUuCgpTWVNDQUxMIGFuZCBTWVNSRVQgYXMgd2VsbC7CoCBUaGUgd2F5IHRoZXkgaGFu
ZGxlIE1TUl9TVEFSIGlzIHZlbmRvcgpzcGVjaWZpYywgYXMgd2VsbCBhcyAjVUQgY29uZGl0aW9u
cy4KCkkndmUganVzdCBub3RpY2VkIHRoYXQgSSd2ZSBzdGlsbCBnb3QgYW4gWFNBLTIwNCBmb2xs
b3d1cCBwYXRjaCBzdGlsbApvdXRzdGFuZGluZyBmcm9tIDIwMTYuLi4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
