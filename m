Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65475175A63
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 13:22:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8k2y-00028m-BK; Mon, 02 Mar 2020 12:19:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1vPy=4T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j8k2w-00028h-Up
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 12:19:42 +0000
X-Inumbo-ID: 170d0ea2-5c80-11ea-9f64-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 170d0ea2-5c80-11ea-9f64-12813bfff9fa;
 Mon, 02 Mar 2020 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583151581;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HEmBvDMao8kmQRenMJoocJTooQ+oE1SoZRF3rJ4xGI4=;
 b=gYjvaoiXvwLW1C+alE+2VzRI+Ltx3dYbpv55naXUqzt3HHnjO/L5oq0Z
 suyiy7GgElL/cKXRmlzWGv+4Sy3LLX+u6IY0xzqzvFOd4ivqi6s4vWzS0
 fRq8XwkQib1uX+XpRY+17KQn1oKbvC40JFKCqqEY+6QIts+xF4tw/1ACi Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bCiqxiyjCEfoYJt1clBf/scIt/YQi6ftNgvAnVPg7gP3mVLLZEKkDDHNr6p9zSX/mBw7yFO2Ax
 avQziv65WXA9OSjoJB3iCBPsXHtD089AH2zdpOp23WZcU+qnWyAgvulK209TQEyLyV1y5Cq8Ht
 BtN58m2Umf0cWTEqEq7UtoCHQT3cq2/g+vpZLQ3PNIT3pg0vDmraqrqa4wbZAKT+Z29BZwcju4
 UiqB2oHjb4QrW5RAPYPGKrILudlaUIfpsTqbTs0Mz6Yi9SYFZi831+gJ96dRQh0Hn7+T5IgfQ5
 XME=
X-SBRS: 2.7
X-MesageID: 13889682
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,507,1574139600"; d="scan'208";a="13889682"
Date: Mon, 2 Mar 2020 13:19:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200302121933.GL24458@Air-de-Roger.citrite.net>
References: <f189462f-702f-0726-9b3c-c6fd1fec8407@citrix.com>
 <4bd191eb-0c72-2a26-28a4-815ba32b5f7f@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4bd191eb-0c72-2a26-28a4-815ba32b5f7f@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] PVH dom0 construction timeout
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan
 Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMTE6NDU6MjZBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyOC8wMi8yMDIwIDIxOjA4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4gSXQg
dHVybnMgb3V0IHRoYXQgUFZIIGRvbTAgY29uc3RydWN0aW9uIGRvZXNuJ3Qgd29yayBzbyB3ZWxs
IG9uIGEKPiA+IDItc29ja2V0IFJvbWUgc3lzdGVtLi4uCj4gCj4gV2l0aCB0aGUgc29mdGlycSBm
aXggaW4gcGxhY2UsIGhlcmUgYXJlIHRoZSBkaWZmZXJlbmNlcyBpbiBjb25zdHJ1Y3Rpb24KPiBi
ZXR3ZWVuIFBWIGFuZCBQVkggYWxvbmcgd2l0aCB0aW1lc3RhbXBzLgo+IAo+IChYRU4pIFvCoMKg
IDMwLjg1NjE3OF0gTlggKEV4ZWN1dGUgRGlzYWJsZSkgcHJvdGVjdGlvbiBhY3RpdmUKPiAoWEVO
KSBbwqDCoCAzMC45MDYxNTVdICoqKiBCdWlsZGluZyBhIFBWIERvbTAgKioqCj4gKFhFTikgW8Kg
wqAgMzEuMTUzODUzXSBFTEY6IHBoZHI6IHBhZGRyPTB4MTAwMDAwMCBtZW1zej0weGVlZjAwMAo+
IAo+IChYRU4pIFvCoMKgIDI3LjU4ODA4MV0gTlggKEV4ZWN1dGUgRGlzYWJsZSkgcHJvdGVjdGlv
biBhY3RpdmUKPiAoWEVOKSBbwqDCoCAyNy42MzMwODFdICoqKiBCdWlsZGluZyBhIFBWSCBEb20w
ICoqKgo+IChYRU4pIFvCoMKgIDMzLjUyNDM0NV0gRG9tMCBtZW1vcnkgYWxsb2NhdGlvbiBzdGF0
czoKPiAoWEVOKSBbwqDCoCAzMy41Njg2OTddIG9yZGVywqAgMCBhbGxvY2F0aW9uczogMgo+IChY
RU4pIFvCoMKgIDMzLjYxMjM0MV0gb3JkZXLCoCAxIGFsbG9jYXRpb25zOiAxCj4gKFhFTikgW8Kg
wqAgMzMuNjU1NTQ0XSBvcmRlcsKgIDIgYWxsb2NhdGlvbnM6IDUKPiAoWEVOKSBbwqDCoCAzMy42
OTgzNDRdIG9yZGVywqAgMyBhbGxvY2F0aW9uczogNQo+IChYRU4pIFvCoMKgIDMzLjc0MDY1MF0g
b3JkZXLCoCA0IGFsbG9jYXRpb25zOiAyCj4gKFhFTikgW8KgwqAgMzMuNzgyNzM2XSBvcmRlcsKg
IDUgYWxsb2NhdGlvbnM6IDUKPiAoWEVOKSBbwqDCoCAzMy44MjQyOTVdIG9yZGVywqAgNiBhbGxv
Y2F0aW9uczogNAo+IChYRU4pIFvCoMKgIDMzLjg2NTQyM10gb3JkZXLCoCA3IGFsbG9jYXRpb25z
OiA0Cj4gKFhFTikgW8KgwqAgMzMuOTA2MjM3XSBvcmRlcsKgIDggYWxsb2NhdGlvbnM6IDQKPiAo
WEVOKSBbwqDCoCAzMy45NDY1NjBdIG9yZGVywqAgOSBhbGxvY2F0aW9uczogNAo+IChYRU4pIFvC
oMKgIDMzLjk4NjQ2NV0gb3JkZXIgMTAgYWxsb2NhdGlvbnM6IDQKPiAoWEVOKSBbwqDCoCAzNC4w
MjU5MjVdIG9yZGVyIDExIGFsbG9jYXRpb25zOiA2Cj4gKFhFTikgW8KgwqAgMzQuMDY1MDg5XSBv
cmRlciAxMiBhbGxvY2F0aW9uczogNQo+IChYRU4pIFvCoMKgIDM0LjEwMzc1MF0gb3JkZXIgMTMg
YWxsb2NhdGlvbnM6IDUKPiAoWEVOKSBbwqDCoCAzNC4xNDIyMjFdIG9yZGVyIDE0IGFsbG9jYXRp
b25zOiAzCj4gKFhFTikgW8KgwqAgMzQuMTgwMDY0XSBvcmRlciAxNSBhbGxvY2F0aW9uczogMgo+
IChYRU4pIFvCoMKgIDM0LjIxNzU1N10gb3JkZXIgMTYgYWxsb2NhdGlvbnM6IDMKPiAoWEVOKSBb
wqDCoCAzNC4yNTUxMDVdIG9yZGVyIDE3IGFsbG9jYXRpb25zOiAzCj4gKFhFTikgW8KgwqAgMzQu
MjkyNjEwXSBvcmRlciAxOCBhbGxvY2F0aW9uczogNQo+IChYRU4pIFvCoMKgIDM0LjUzOTAwMl0g
VW5hYmxlIHRvIGNvcHkgaW5pdHJkIHRvIGd1ZXN0Cj4gKFhFTikgW8KgwqAgMzQuNTc2NzMyXSBG
YWlsZWQgdG8gbG9hZCBEb20wIGtlcm5lbAo+IChYRU4pIFvCoMKgIDM0LjYxODU1NF0KPiAoWEVO
KSBbwqDCoCAzNC42NTY5MDVdICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioKPiAoWEVOKSBbwqDCoCAzNC42OTg4NTFdIFBhbmljIG9uIENQVSAwOgo+IChYRU4pIFvCoMKg
IDM0LjczNzY0MF0gQ291bGQgbm90IHNldCB1cCBET00wIGd1ZXN0IE9TCj4gKFhFTikgW8KgwqAg
MzQuNzc3OTM5XSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gCj4g
aS5lLiBQVkggZG9lc24ndCBldmVuIGNvbXBsZXRlIGNvcnJlY3RseSwgYW5kIHRha2VzIDYgc2Vj
b25kcyBhcyBvcHBvc2VkCj4gdG8gUFYncyAwLjJzCgpIbSwgSSBndWVzcyBQVkggZG9tMCBjb25z
dHJ1Y3Rpb24gbmVlZHMgdG8gYmUgbW9yZSBjbGV2ZXIgYWJvdXQgaW5pdHJkCnBsYWNlbWVudCwg
cmlnaHQgbm93IGl0J3MganVzdCBjb3BpZWQgYWZ0ZXIgdGhlIGtlcm5lbCwgd2l0aG91dCBhbnkK
Y2hlY2sgb24gd2hldGhlciB0aGVyZSdzIGVub3VnaCBzcGFjZS4gQ2FuIHlvdSBwYXN0ZSB0aGUg
b3V0cHV0IG9mIHRoZQpmb2xsb3dpbmcgcGF0Y2g/CgpUaGFua3MsIFJvZ2VyLgotLS04PC0tLQpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2U4MjAuYyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKaW5k
ZXggYWE2MDI3NzNiYi4uODJlOWFjNDZhMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2U4MjAu
YworKysgYi94ZW4vYXJjaC94ODYvZTgyMC5jCkBAIC04OCw3ICs4OCw3IEBAIHN0YXRpYyB2b2lk
IF9faW5pdCBhZGRfbWVtb3J5X3JlZ2lvbih1bnNpZ25lZCBsb25nIGxvbmcgc3RhcnQsCiAgICAg
ZTgyMC5ucl9tYXArKzsKIH0KIAotc3RhdGljIHZvaWQgX19pbml0IHByaW50X2U4MjBfbWVtb3J5
X21hcChzdHJ1Y3QgZTgyMGVudHJ5ICptYXAsIHVuc2lnbmVkIGludCBlbnRyaWVzKQordm9pZCBf
X2luaXQgcHJpbnRfZTgyMF9tZW1vcnlfbWFwKHN0cnVjdCBlODIwZW50cnkgKm1hcCwgdW5zaWdu
ZWQgaW50IGVudHJpZXMpCiB7CiAgICAgdW5zaWduZWQgaW50IGk7CiAKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jIGIveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxk
LmMKaW5kZXggZWRlZDg3ZWFmNS4uM2VjMDM2Njc4YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2h2bS9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKQEAg
LTQ5MCw2ICs0OTAsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBwdmhfcG9wdWxhdGVfcDJtKHN0cnVj
dCBkb21haW4gKmQpCiAjdW5kZWYgTUIxX1BBR0VTCiB9CiAKK3ZvaWQgcHJpbnRfZTgyMF9tZW1v
cnlfbWFwKHN0cnVjdCBlODIwZW50cnkgKm1hcCwgdW5zaWduZWQgaW50IGVudHJpZXMpOworCiBz
dGF0aWMgaW50IF9faW5pdCBwdmhfbG9hZF9rZXJuZWwoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qg
bW9kdWxlX3QgKmltYWdlLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgaW1hZ2VfaGVhZHJvb20sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbW9kdWxlX3QgKmluaXRyZCwgdm9pZCAqaW1hZ2VfYmFzZSwKQEAgLTU1NSw2ICs1NTcsOSBA
QCBzdGF0aWMgaW50IF9faW5pdCBwdmhfbG9hZF9rZXJuZWwoc3RydWN0IGRvbWFpbiAqZCwgY29u
c3QgbW9kdWxlX3QgKmltYWdlLAogICAgICAgICBpZiAoIHJjICkKICAgICAgICAgewogICAgICAg
ICAgICAgcHJpbnRrKCJVbmFibGUgdG8gY29weSBpbml0cmQgdG8gZ3Vlc3RcbiIpOworcHJpbnRr
KCJsb2FkIGFkZHJlc3M6ICVseCBpbml0cmQgc2l6ZTogJXggcmMgJWRcbiIsCisgICAgICAgbGFz
dF9hZGRyLCBpbml0cmQtPm1vZF9lbmQsIHJjKTsKK3ByaW50X2U4MjBfbWVtb3J5X21hcChkLT5h
cmNoLmU4MjAsIGQtPmFyY2gubnJfZTgyMCk7CiAgICAgICAgICAgICByZXR1cm4gcmM7CiAgICAg
ICAgIH0KIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
