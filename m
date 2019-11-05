Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B00CEF283
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 02:18:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRnR7-0003R4-BP; Tue, 05 Nov 2019 01:15:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rgKV=Y5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iRnR5-0003Qz-Ps
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 01:15:07 +0000
X-Inumbo-ID: b3b38424-ff69-11e9-9631-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3b38424-ff69-11e9-9631-bc764e2007e4;
 Tue, 05 Nov 2019 01:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572916506;
 h=subject:from:to:references:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=q2eZCUuoDqvRqN5hignLHKeg9BX45UkCI7vR/uMNguU=;
 b=bAhPTj41icqMBfe4qPEU6JBwBLxe55zyJDKyyTJkoiDBWRUAtu8sFxVn
 3vnt4FZelnkZMEFvKx+I+nhUtkM/2KmRIOSHbOttiX1gumc0PTw/IPO+j
 0OY2Dsq9VuLPt6X4nopAo/7M/6sLjka2Yjcv7WQCkdsdrr+SuSxg0GTqf o=;
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
IronPort-SDR: ApoF9k5unAHMQdJOI+rhg4mXWQ870LjmZXfVLY8bJSCb51jQ7nGsYl2iqItOJrF+X0TaUe5qhW
 p94JeNxQZC8MqNB19fx61Puwzm2ChMlZqMEHY/DS6zSCkeSsFpQGA0uDT/fNQyx1QjWx0/2AAL
 dKkD1+tzLZ8sfo1+Ob1xDBc2K4IVV3hFF9pW/lNo5i+kdFLLZlDWZ0uoS6QdrR1gVn0mZkOHHq
 RlcHApCQXkCrIpNc8bNXNPFiTptiUHNZGR926xjSNGi+dRk77OeycuMjWWuUcTR290QjgKor+u
 cDE=
X-SBRS: 2.7
X-MesageID: 8183998
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,268,1569297600"; 
   d="scan'208";a="8183998"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>,
 <xen-devel@lists.xenproject.org>
References: <19c16a0b-514d-8e2b-a2ea-ce35ab3c3952@alstadheim.priv.no>
 <bc0b45b1-be20-e1f2-81dc-cbfec71a6599@citrix.com>
 <b9aad1ea-fae3-047a-3c01-3d00a756aa2f@alstadheim.priv.no>
 <2e25eb60-7f59-d7bf-8f8c-4dc2790c0840@citrix.com>
 <25043c4e-c2ec-c47b-513f-2c0d93c23f26@alstadheim.priv.no>
 <099cb111-cc9b-59da-809a-17ddf896f16d@citrix.com>
 <62c8abc6-5971-7978-b337-44392927a985@citrix.com>
 <550d8bb6-7953-0749-8d32-c0d4820e0e55@alstadheim.priv.no>
 <92d3a465-1ee5-c4b5-4376-dea176713836@citrix.com>
 <7d72d720-eb02-33e2-0f6e-f78666cee9f5@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <05a279e5-0dd8-0e20-80ad-29cf34a05039@citrix.com>
Date: Tue, 5 Nov 2019 01:15:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7d72d720-eb02-33e2-0f6e-f78666cee9f5@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] Invalid guest state in Xen master,
 dom0 linux-5.3.6, domU windows 10
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMTEvMjAxOSAwMDoyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNC8xMS8yMDE5
IDIzOjQyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAwNC8xMS8yMDE5IDIzOjIwLCBIw6Vr
b24gQWxzdGFkaGVpbSB3cm90ZToKPj4+IChYRU4pIFJGTEFHUz0weDAwMDAwMTkzICgweDAwMDAw
MTkzKcKgIERSNyA9IDB4MDAwMDAwMDAwMDAwMDQwMAo+Pj4gPHNuaXA+Cj4+PiAoWEVOKSAqKiog
SW5zbiBieXRlcyBmcm9tIGZmZmZiODg2OGY2MWQ2OWE6IDQ0IDAwIDAwIDhjIGQwIDljIDgxIDBj
IDI0Cj4+PiAwMCAwMSAwMCAwMCA5ZCA4ZSBkMCA8ZmZmZmZmZjE+IDljIDgxIDI0IDI0IGZmIGZl
IGZmIGZmIDlkIGMzIGNjIGNjIGNjCj4+PiBjYyBjYwo+PiBPay7CoCBPbmUgcXVlc3Rpb24gYW5z
d2VyZWQsIHNldmVyYWwgbW9yZSBXVEYuCj4+Cj4+IDAwMDAwMDAwMDAwMDAwMDAgPC5kYXRhPjoK
Pj4gwqDCoCAwOsKgwqDCoCA0NCAwMCAwMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAg
YWRkwqDCoMKgICVyOGIsKCVyYXgpCj4+IMKgwqAgMzrCoMKgwqAgOGMgZDDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIG1vdsKgwqDCoCAlc3MsJWVheAo+PiDCoMKgIDU6wqDC
oMKgIDljwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqDCoCBwdXNoZnEK
Pj4gwqDCoCA2OsKgwqDCoCA4MSAwYyAyNCAwMCAwMSAwMCAwMCDCoMKgwqAgb3JswqDCoMKgICQw
eDEwMCwoJXJzcCkKPj4gwqDCoCBkOsKgwqDCoCA5ZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCDCoMKgwqAgcG9wZnHCoAo+PiDCoMKgIGU6wqDCoMKgIDhlIGQwwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqDCoCBtb3bCoMKgwqAgJWVheCwlc3MKPj4gwqAgMTA6
wqDCoMKgIGYxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqDCoCBpY2Vi
cMKgCj4+IMKgIDExOsKgwqDCoCA5Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCDCoMKgwqAgcHVzaGZxCj4+IMKgIDEyOsKgwqDCoCA4MSAyNCAyNCBmZiBmZSBmZiBmZiDCoMKg
wqAgYW5kbMKgwqAgJDB4ZmZmZmZlZmYsKCVyc3ApCj4+IMKgIDE5OsKgwqDCoCA5ZMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgcG9wZnHCoAo+PiDCoCAxYTrCoMKg
wqAgYzPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIHJldHHCoMKg
Cj4+IMKgIDFiOsKgwqDCoCBjY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDC
oMKgwqAgaW50M8KgwqAKPj4gwqAgMWM6wqDCoMKgIGNjwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIMKgwqDCoCBpbnQzwqDCoAo+PiDCoCAxZDrCoMKgwqAgY2PCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIGludDPCoMKgCj4+IMKgIDFlOsKgwqDC
oCBjY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgaW50M8KgwqAK
Pj4gwqAgMWY6wqDCoMKgIGNjwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKg
wqDCoCBpbnQzwqDCoAo+Pgo+Pgo+PiBUaGlzIGlzIGEgc2VyaW91cyBleGVyY2lzaW5nIG9mIGFy
Y2hpdGVjdHVyYWwgY29ybmVyIGNhc2VzLCBieSBsYXllcmluZwo+PiBhIHNpbmdsZSBzdGVwIGV4
Y2VwdGlvbiBvbiB0b3Agb2YgYSBNb3ZTUy1kZWZlcnJlZCBJQ0VCUC4KPj4KPj4gTm93IEkndmUg
bG9va2VkIGNsb3NlciwgdGhpcyBpc24ndCBhIENWRS0yMDE4LTg4OTcgZXhwbG9pdCBhcyBubwo+
PiBicmVha3BvaW50cyBhcmUgY29uZmlndXJlZCBpbiAlZHI3LCBzbyBJJ20gZ29pbmcgdG8gcmV2
aXNlIG15IGd1ZXNzIHNvbWUKPj4gbmV3IGRlYnVnZ2VyLWRldGVjdGlvbiBpbiBEUk0gc29mdHdh
cmUuCj4gSSd2ZSByZXByb2R1Y2VkIHRoZSBWTUVudHJ5IGZhaWx1cmUgeW91IHdlcmUgc2VlaW5n
LsKgIE5vdyB0byBmaWd1cmUgb3V0Cj4gaWYgdGhlcmUgaXMgc3VmZmljaWVudCBjb250cm9sIGF2
YWlsYWJsZSB0byBwcm92aWRlIGFyY2hpdGVjdHVyYWwKPiBiZWhhdmlvdXIgdG8gZ3Vlc3QsIGJl
Y2F1c2UgSSdtIG5vdCBlbnRpcmVseSBjZXJ0YWluIHRoZXJlIGlzLCBnaXZlbgo+IHNvbWUgb2Yg
SUNFQlAncyBleHRyYSBtYWdpYyBwcm9wZXJ0aWVzLgoKU28sIHRoaXMgaXMganVzdCBhbm90aGVy
IGNhc2Ugb2YgYW4gaXNzdWUgSSd2ZSBhbHJlYWR5IHRyaWVkIGZpeGluZyBvbmNlCmFuZCBoYXZl
bid0IGhhZCB0aW1lIHRvIGZpeCBpbiBhIHdheSB3aGljaCBkb2Vzbid0IGJyZWFrIG90aGVyIHBp
ZWNlcyBvZgpmdW5jdGlvbmFsaXR5LgoKSSBjbGVhcmx5IG5lZWQgdG8gZHVzdCBvZmYgdGhhdCBz
ZXJpZXMgYW5kIGdldCBpdCB3b3JraW5nIHByb3Blcmx5LgoKSW4gdGhlIHNob3J0IHRlcm0sIHRo
aXMgd2lsbCB3b3JrIGFyb3VuZCB5b3VyIHByb2JsZW0uCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vaHZtLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaAppbmRl
eCBmODZhZjA5ODk4Li4xMGRhYWE2ZjMzIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2
L2h2bS9odm0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaApAQCAtNTIyLDgg
KzUyMiw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBodm1faW52bHBnKHN0cnVjdCB2Y3B1ICp2LAp1
bnNpZ25lZCBsb25nIGxpbmVhcikKwqDCoMKgwqAgKFg4Nl9DUjRfVk1YRSB8IFg4Nl9DUjRfUEFF
IHwgWDg2X0NSNF9NQ0UpKQrCoArCoC8qIFRoZXNlIGV4Y2VwdGlvbnMgbXVzdCBhbHdheXMgYmUg
aW50ZXJjZXB0ZWQuICovCi0jZGVmaW5lIEhWTV9UUkFQX01BU0sgKCgxVSA8PCBUUkFQX2RlYnVn
KcKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgXAotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKDFVIDw8IFRSQVBfYWxpZ25tZW50X2NoZWNrKSB8IFwKKyNkZWZpbmUg
SFZNX1RSQVBfTUFTSyAoKDFVIDw8IFRSQVBfYWxpZ25tZW50X2NoZWNrKSB8IFwKwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoMVUgPDwgVFJBUF9tYWNoaW5l
X2NoZWNrKSkKwqAKwqBzdGF0aWMgaW5saW5lIGludCBodm1fY3B1X3VwKHZvaWQpCgpIb3dldmVy
LCBiZSBhd2FyZSB0aGF0IGl0IHdpbGwgcmVpbnRyb2R1Y2UKaHR0cDovL3hlbmJpdHMueGVuLm9y
Zy94c2EvYWR2aXNvcnktMTU2Lmh0bWwgc28gaXNuJ3QgcmVjb21tZW5kZWQgZm9yCmdlbmVyYWwg
dXNlLsKgIFNlZWluZyBhcyB0aGlzIGxvb2tzIHRvIGJlIHNvbWUgRFJNIHNvZnR3YXJlLCBpdCBp
c24ndApsaWtlbHkgdG8gbW91bnQgYW4gYXR0YWNrIGxpa2UgdGhhdCwgYXMgaXQgd291bGQgbGl2
ZWxvY2sgYSBuYXRpdmUKc3lzdGVtIGp1c3QgYXMgYmFkbHkgYXMgaXQgbGl2ZWxvY2tzIGEgdmly
dHVhbGlzZWQgc3lzdGVtLgoKKFNhZGx5LCBpdCBsb29rcyBsaWtlIENWRS0yMDE1LTgxMDQgaXMg
dGhlIGdpZnQgd2hpY2gga2VlcHMgb24gZ2l2aW5nIHVzCm5ldyBjb3JuZXIgY2FzZXMgaW4gVlQt
eCB3aGVuIGl0IGNvbWVzIHRvIHRoZSBoYW5kbGluZyBvZiBkZWJ1ZwpleGNlcHRpb25zLsKgIEkn
dmUgYWxyZWFkeSBmb3VuZCBzZXZlcmFsIGFja25vd2xlZGdlZCBieSBJbnRlbCwgYW5kIG9uZQp3
aGljaCB0aGV5IGFyZSBzdGlsbCB0cnlpbmcgdG8gZmlndXJlIG91dCBob3cgdG8gZml4LikKCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
