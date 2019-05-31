Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CBA31704
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2019 00:14:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWpjy-0004fR-8M; Fri, 31 May 2019 22:11:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWpjw-0004fG-ES
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 22:11:08 +0000
X-Inumbo-ID: fce07a1b-83f0-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fce07a1b-83f0-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 22:11:07 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: TNBlHZXMoMjI2zTMQoga3xS3WZJrmJKJNIWcWYLmv9+vj8xpRIPKcjiEgZJooH3D5l5o0/6JIV
 /FRmBIDWtKypSOouqLvC9uxXzr+J+egqo9B8DlYibloTASaM56v7vs08JRLFItjr9zo79Qd6Ky
 2RWo1Q/UQuswBlYTIwYecz5Y+/iNM1Kc5U2dstcmOhrR3G5kURpDeetapFsYQmLSiMxM+wr6x1
 1kpcBOWmwjWKsVLf+h57QBo1K6rSzcpn1P7m/W1OCByz4fg6zg/veG0g+uS0zXPd2nHaE3FqqB
 Ljk=
X-SBRS: 2.7
X-MesageID: 1184871
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,536,1549947600"; 
   d="scan'208";a="1184871"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9360200007800233E01@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6c267398-fd65-1351-e100-8fdebd9986e4@citrix.com>
Date: Fri, 31 May 2019 12:40:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CF0F9360200007800233E01@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/4] bitops: speed up hweight<N>()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDUvMjAxOSAwMjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQWxnb3JpdGhtaWNhbGx5
IHRoaXMgZ2V0cyB1cyBpbiBsaW5lIHdpdGggY3VycmVudCBMaW51eCwgd2hlcmUgdGhlIHNhbWUK
PiBjaGFuZ2UgZGlkIGhhcHBlbiBhYm91dCAxMyB5ZWFycyBhZ28uIFNlZSBpbiBwYXJ0aWN1bGFy
IExpbnV4IGNvbW1pdHMKPiBmOWI0MTkyOTIzICgiYml0b3BzOiBod2VpZ2h0KCkgc3BlZWR1cCIp
IGFuZCAwMTM2NjExYzYyICgib3B0aW1pemUKPiBod2VpZ2h0NjQgZm9yIHg4Nl82NCIpLgo+Cj4g
S2NvbmZpZyBjaGFuZ2VzIGZvciBhY3R1YWxseSBzZXR0aW5nIEhBVkVfRkFTVF9NVUxUSVBMWSB3
aWxsIGZvbGxvdy4KPgo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBjaGFuZ2UgZ2VuZXJpY19o
d2VpZ2h0NjQoKSdzIHJldHVybiB0eXBlIHRvCj4gdW5zaWduZWQgaW50Lgo+Cj4gU3VnZ2VzdGVk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhlIGNvZGUgaW4gTGludXgg
Y291bGQgZG8gd2l0aCBhIGJpdCBvZiBjbGVhbnVwLsKgIERvIHlvdSBoYXZlIHBhdGNoZXMKcHJl
cGFyZWQ/wqAgSSBkbyBoYXZlIG9uZSBmdXJ0aGVyIHN1Z2dlc3Rpb24KCj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL2JpdG9wcy5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oCj4gQEAg
LTE1Myw0MSArMTUzLDU0IEBAIHN0YXRpYyBfX2lubGluZV9fIGludCBnZXRfY291bnRfb3JkZXIo
dW4KPiAgCj4gIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGdlbmVyaWNfaHdlaWdodDMyKHVu
c2lnbmVkIGludCB3KQo+ICB7Cj4gLSAgICB1bnNpZ25lZCBpbnQgcmVzID0gKHcgJiAweDU1NTU1
NTU1KSArICgodyA+PiAxKSAmIDB4NTU1NTU1NTUpOwo+IC0gICAgcmVzID0gKHJlcyAmIDB4MzMz
MzMzMzMpICsgKChyZXMgPj4gMikgJiAweDMzMzMzMzMzKTsKPiAtICAgIHJlcyA9IChyZXMgJiAw
eDBGMEYwRjBGKSArICgocmVzID4+IDQpICYgMHgwRjBGMEYwRik7Cj4gLSAgICByZXMgPSAocmVz
ICYgMHgwMEZGMDBGRikgKyAoKHJlcyA+PiA4KSAmIDB4MDBGRjAwRkYpOwo+IC0gICAgcmV0dXJu
IChyZXMgJiAweDAwMDBGRkZGKSArICgocmVzID4+IDE2KSAmIDB4MDAwMEZGRkYpOwo+ICsgICAg
dyAtPSAodyA+PiAxKSAmIDB4NTU1NTU1NTU7Cj4gKyAgICB3ID0gICh3ICYgMHgzMzMzMzMzMykg
KyAoKHcgPj4gMikgJiAweDMzMzMzMzMzKTsKPiArICAgIHcgPSAgKHcgKyAodyA+PiA0KSkgJiAw
eDBmMGYwZjBmOwo+ICsKPiArI2lmZGVmIENPTkZJR19IQVNfRkFTVF9NVUxUSVBMWQo+ICsgICAg
cmV0dXJuICh3ICogMHgwMTAxMDEwMSkgPj4gMjQ7Cj4gKyNlbHNlCj4gKyAgICB3ICs9IHcgPj4g
ODsKPiArCj4gKyAgICByZXR1cm4gKHcgKyAodyA+PiAxNikpICYgMHhmZjsKPiArI2VuZGlmCgpU
aGlzIHdvdWxkIGJlIHNsaWdodGx5IHNob3J0ZXIsIGxlc3MgbGlhYmxlIHRvIGJpdHJvdCwgYW5k
IElNTyBjbGVhbmVyLAp0byBkbwoKaWYgKCBJU19FTkFCTEVEKENPTkZJR19IQVNfRkFTVF9NVUxU
SVBMWSkgKQrCoMKgwqAgdyA9IHcgKiAweDAxMDEwMTAxKSA+PiAyNDsKZWxzZQrCoMKgwqAgdyAr
PSB3ID4+IDg7CgpyZXR1cm4gdzsKCndoaWNoIHJlbW92ZXMgdGhlICNpZmRlZi1hcnkgZnVsbHks
IGFuZCBpbiBwYXJ0aWN1bGFyLCBhdm9pZHMgaGF2aW5nCmRpZmZlcmVudCByZXR1cm4gbG9naWMu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
