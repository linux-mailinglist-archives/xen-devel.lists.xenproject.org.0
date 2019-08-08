Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00BB86C0F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 23:07:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvpbP-0002Gt-WA; Thu, 08 Aug 2019 21:05:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6/vj=WE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvpbO-0002Go-Jx
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 21:05:38 +0000
X-Inumbo-ID: 4421a14c-ba20-11e9-9511-a39e6f918f4f
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4421a14c-ba20-11e9-9511-a39e6f918f4f;
 Thu, 08 Aug 2019 21:05:36 +0000 (UTC)
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
IronPort-SDR: gDNbpapJTKUuDytrE0Vpb3Su7Zkc6MIa3mf/5dOTwsdTCDNgJ7abzdmydCUc/URFNKdlBZ4Yt6
 pjiz/jXLX1BR9AkILa1pPRwxyL286x1bj1D7Bqz3ey3IIyCLc3OFbDTDlxXsP1YFZmhf2IJKlt
 PAjgoyXw/mWtYwJ5itaPrdZzZ/X0qKTVaWP+nPkGvG3EYd7JQpZSWWJuGMzhBfZ0oHg5Lw1q00
 RCcFB7rJC7UArpRbrzi0omZtz0JRnnFtjM8T6vX8FGYTttD1UyGnI2Fv/93LPJ3h+CxQKLYo2s
 YKw=
X-SBRS: 2.7
X-MesageID: 4241015
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,362,1559534400"; 
   d="scan'208";a="4241015"
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <dbb536d7-7bfb-27fb-902e-0851434bda96@citrix.com>
Date: Thu, 8 Aug 2019 22:05:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [SUSPECTED SPAM]Xen-unstable staging build broken
 by pvshim patches.
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDgvMjAxOSAyMTo1OSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IEhpIEFuZHJl
dywKPgo+IEl0IHNlZW1zIHRoZSBwdnNoaW0gcGF0Y2hlcyBpbiB4ZW4tdW5zdGFibGUgc3RhZ2lu
ZyBicmVhayB0aGUgYnVpbGQgb24gbXkgbWFjaGluZS4KPiBJIGNsb25lZCBhIGZyZXNoIHRyZWUg
dG8gYmUgc3VyZSwgaGF2ZW4ndCBjaGVja2VkIHdoaWNoIG9mIHRoZSB0d28gY29tbWl0cyBjYXVz
ZXMgaXQ6Cj4gMDYwZjRlZWUwZmI0MDhiMzE2NTQ4Nzc1YWI5MjFlMTZiN2FjZDBlMCBvciAzMmIx
ZDYyODg3ZDAxZjg1ZjBjMWQyZTAxMDNmNjlmNzRlMWY2ZmEzCj4KPiAtLQo+IFNhbmRlcgo+Cj4K
Pgo+IFsgLWQgLy91c3IvbG9jYWwvbGliL3hlbi9ib290IF0gfHwgL3Vzci9zcmMvbmV3L3hlbi11
bnN0YWJsZS90b29scy9maXJtd2FyZS8uLi8uLi90b29scy9jcm9zcy1pbnN0YWxsIC1kIC1tMDc1
NSAtcCAvL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QKPiBbIC1kIC8vdXNyL2xvY2FsL2xpYi9kZWJ1
Zy91c3IvbG9jYWwvbGliL3hlbi9ib290IF0gfHwgL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90
b29scy9maXJtd2FyZS8uLi8uLi90b29scy9jcm9zcy1pbnN0YWxsIC1kIC1tMDc1NSAtcCAvL3Vz
ci9sb2NhbC9saWIvZGVidWcvdXNyL2xvY2FsL2xpYi94ZW4vYm9vdAo+IFsgISAtZSBodm1sb2Fk
ZXIvaHZtbG9hZGVyIF0gfHwgL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scy9maXJtd2Fy
ZS8uLi8uLi90b29scy9jcm9zcy1pbnN0YWxsIC1tMDY0NCAtcCBodm1sb2FkZXIvaHZtbG9hZGVy
IC8vdXNyL2xvY2FsL2xpYi94ZW4vYm9vdAo+IC91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9v
bHMvZmlybXdhcmUvLi4vLi4vdG9vbHMvY3Jvc3MtaW5zdGFsbCAtbTA2NDQgLXAgc2VhYmlvcy1k
aXIvb3V0L2Jpb3MuYmluIC8vdXNyL2xvY2FsL2xpYi94ZW4vYm9vdC9zZWFiaW9zLmJpbgo+IC91
c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4vLi4vdG9vbHMvY3Jvc3Mt
aW5zdGFsbCAtbTA2NDQgLXAgeGVuLWRpci94ZW4tc2hpbSAvL3Vzci9sb2NhbC9saWIveGVuL2Jv
b3QveGVuLXNoaW0KPiBpbnN0YWxsOiBjYW5ub3Qgc3RhdCAneGVuLWRpci94ZW4tc2hpbSc6IE5v
IHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiBtYWtlWzRdOiAqKiogW01ha2VmaWxlOjUyOiBpbnN0
YWxsXSBFcnJvciAxCj4gbWFrZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL25ldy94
ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUnCj4gbWFrZVszXTogKioqIFsvdXNyL3NyYy9uZXcv
eGVuLXVuc3RhYmxlL3Rvb2xzLy4uL3Rvb2xzL1J1bGVzLm1rOjIzNzogc3ViZGlyLWluc3RhbGwt
ZmlybXdhcmVdIEVycm9yIDIKPiBtYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMv
bmV3L3hlbi11bnN0YWJsZS90b29scycKPiBtYWtlWzJdOiAqKiogWy91c3Ivc3JjL25ldy94ZW4t
dW5zdGFibGUvdG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6MjMyOiBzdWJkaXJzLWluc3RhbGxdIEVy
cm9yIDIKPiBtYWtlWzJdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMvbmV3L3hlbi11bnN0
YWJsZS90b29scycKPiBtYWtlWzFdOiAqKiogW01ha2VmaWxlOjczOiBpbnN0YWxsXSBFcnJvciAy
Cj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUv
dG9vbHMnCj4gbWFrZTogKioqIFtNYWtlZmlsZToxMzE6IGluc3RhbGwtdG9vbHNdIEVycm9yIDIK
ClRoYXQncyB3ZWlyZC4KCkRvIHlvdSBoYXZlIHRoZSBmdWxsIGxvZz/CoCBUaGUgcmVhbCBmYWls
dXJlIHdhcyBzb21ld2hlcmUgZWFybGllciB3aGVyZQp4ZW4tc2hpbSBkaWRuJ3QgZ2V0IHN0YXJ0
ZWQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
