Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172BDF0223
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 17:03:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS1Gq-00032g-LE; Tue, 05 Nov 2019 16:01:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BAN7=Y5=alstadheim.priv.no=hakon@srs-us1.protection.inumbo.net>)
 id 1iS1Gp-00032X-Bb
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 16:01:27 +0000
X-Inumbo-ID: 843d4b40-ffe5-11e9-a19c-12813bfff9fa
Received: from asav21.altibox.net (unknown [109.247.116.8])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 843d4b40-ffe5-11e9-a19c-12813bfff9fa;
 Tue, 05 Nov 2019 16:01:24 +0000 (UTC)
Received: from postfix-relay.alstadheim.priv.no
 (148-252-118.41.3p.ntebredband.no [148.252.118.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: hakon.alstadheim@ntebb.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id C404480157;
 Tue,  5 Nov 2019 17:01:23 +0100 (CET)
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
Received: from smtps.alstadheim.priv.no (localhost [127.0.0.1])
 by postfix-relay.alstadheim.priv.no (Postfix) with ESMTP id 2C893624FE00;
 Tue,  5 Nov 2019 17:01:23 +0100 (CET)
Received: from [192.168.2.201] (unknown [192.168.2.201])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: hakon)
 by smtps.alstadheim.priv.no (Postfix) with ESMTPSA id DA36E2409837;
 Tue,  5 Nov 2019 17:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alstadheim.priv.no;
 s=smtp; t=1572969682;
 bh=6ueumUi8PwYakGTCvJIRWiuwH3w0zDsSzYmyJ2D9Ahs=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Xx7oelcTpVbdxEWQf+KeCPDuByQzto1+F7mDmVUCLW6w1jClijeQpB3JGfvRgac3P
 ut2gYwDWrQt3t8o8POcAKwHh/OAafbTjsU9xxbi7mgNzNmhADzMBXZuODWo2ii3rhn
 fsbHUHCHVeQo6/lyEhmWEhtPN2HhT36dmS/dXt2Y=
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
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
 <05a279e5-0dd8-0e20-80ad-29cf34a05039@citrix.com>
From: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>
Message-ID: <54a3ef41-0213-dacd-5d6d-87b6ee49d5c8@alstadheim.priv.no>
Date: Tue, 5 Nov 2019 17:01:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <05a279e5-0dd8-0e20-80ad-29cf34a05039@citrix.com>
Content-Language: en-US
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=d8DbNyrE c=1 sm=1 tr=0
 a=qndhj//pCErt3rr+x0O3mA==:117 a=qndhj//pCErt3rr+x0O3mA==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=MeAgGD-zjQ4A:10
 a=M51BFTxLslgA:10 a=mLnsDVdbAAAA:8 a=AbxlsJuUgNOCTSudvNAA:9
 a=QEXdDO2ut3YA:10 a=a7_Tv9pnjS0A:10 a=xnp1pY6zelCj5OLna2To:22
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkRlbiAwNS4xMS4yMDE5IDAyOjE1LCBza3JldiBBbmRyZXcgQ29vcGVyOgo+IE9uIDA1LzExLzIw
MTkgMDA6MjUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDA0LzExLzIwMTkgMjM6NDIsIEFu
ZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBPbiAwNC8xMS8yMDE5IDIzOjIwLCBIw6Vrb24gQWxzdGFk
aGVpbSB3cm90ZToKPj4+PiAoWEVOKSBSRkxBR1M9MHgwMDAwMDE5MyAoMHgwMDAwMDE5MynCoCBE
UjcgPSAweDAwMDAwMDAwMDAwMDA0MDAKPj4+PiA8c25pcD4KPj4+PiAoWEVOKSAqKiogSW5zbiBi
eXRlcyBmcm9tIGZmZmZiODg2OGY2MWQ2OWE6IDQ0IDAwIDAwIDhjIGQwIDljIDgxIDBjIDI0Cj4+
Pj4gMDAgMDEgMDAgMDAgOWQgOGUgZDAgPGZmZmZmZmYxPiA5YyA4MSAyNCAyNCBmZiBmZSBmZiBm
ZiA5ZCBjMyBjYyBjYyBjYwo+Pj4+IGNjIGNjCj4+PiBPay7CoCBPbmUgcXVlc3Rpb24gYW5zd2Vy
ZWQsIHNldmVyYWwgbW9yZSBXVEYuCj4+Pgo+Pj4gMDAwMDAwMDAwMDAwMDAwMCA8LmRhdGE+Ogo+
Pj4gIMKgwqAgMDrCoMKgwqAgNDQgMDAgMDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKg
IGFkZMKgwqDCoCAlcjhiLCglcmF4KQo+Pj4gIMKgwqAgMzrCoMKgwqAgOGMgZDDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIG1vdsKgwqDCoCAlc3MsJWVheAo+Pj4gIMKgwqAg
NTrCoMKgwqAgOWPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIHB1
c2hmcQo+Pj4gIMKgwqAgNjrCoMKgwqAgODEgMGMgMjQgMDAgMDEgMDAgMDAgwqDCoMKgIG9ybMKg
wqDCoCAkMHgxMDAsKCVyc3ApCj4+PiAgwqDCoCBkOsKgwqDCoCA5ZMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgcG9wZnEKPj4+ICDCoMKgIGU6wqDCoMKgIDhlIGQw
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqDCoCBtb3bCoMKgwqAgJWVheCwlc3MK
Pj4+ICDCoCAxMDrCoMKgwqAgZjHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
wqDCoMKgIGljZWJwCj4+PiAgwqAgMTE6wqDCoMKgIDljwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIMKgwqDCoCBwdXNoZnEKPj4+ICDCoCAxMjrCoMKgwqAgODEgMjQgMjQgZmYg
ZmUgZmYgZmYgwqDCoMKgIGFuZGzCoMKgICQweGZmZmZmZWZmLCglcnNwKQo+Pj4gIMKgIDE5OsKg
wqDCoCA5ZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgcG9wZnEK
Pj4+ICDCoCAxYTrCoMKgwqAgYzPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
wqDCoMKgIHJldHEKPj4+ICDCoCAxYjrCoMKgwqAgY2PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgwqDCoMKgIGludDMKPj4+ICDCoCAxYzrCoMKgwqAgY2PCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIGludDMKPj4+ICDCoCAxZDrCoMKgwqAgY2PC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIGludDMKPj4+ICDCoCAx
ZTrCoMKgwqAgY2PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIGlu
dDMKPj4+ICDCoCAxZjrCoMKgwqAgY2PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgwqDCoMKgIGludDMKPj4+Cj4+Pgo+Pj4gVGhpcyBpcyBhIHNlcmlvdXMgZXhlcmNpc2luZyBv
ZiBhcmNoaXRlY3R1cmFsIGNvcm5lciBjYXNlcywgYnkgbGF5ZXJpbmcKPj4+IGEgc2luZ2xlIHN0
ZXAgZXhjZXB0aW9uIG9uIHRvcCBvZiBhIE1vdlNTLWRlZmVycmVkIElDRUJQLgo+Pj4KPj4+IE5v
dyBJJ3ZlIGxvb2tlZCBjbG9zZXIsIHRoaXMgaXNuJ3QgYSBDVkUtMjAxOC04ODk3IGV4cGxvaXQg
YXMgbm8KPj4+IGJyZWFrcG9pbnRzIGFyZSBjb25maWd1cmVkIGluICVkcjcsIHNvIEknbSBnb2lu
ZyB0byByZXZpc2UgbXkgZ3Vlc3Mgc29tZQo+Pj4gbmV3IGRlYnVnZ2VyLWRldGVjdGlvbiBpbiBE
Uk0gc29mdHdhcmUuCj4+IEkndmUgcmVwcm9kdWNlZCB0aGUgVk1FbnRyeSBmYWlsdXJlIHlvdSB3
ZXJlIHNlZWluZy7CoCBOb3cgdG8gZmlndXJlIG91dAo+PiBpZiB0aGVyZSBpcyBzdWZmaWNpZW50
IGNvbnRyb2wgYXZhaWxhYmxlIHRvIHByb3ZpZGUgYXJjaGl0ZWN0dXJhbAo+PiBiZWhhdmlvdXIg
dG8gZ3Vlc3QsIGJlY2F1c2UgSSdtIG5vdCBlbnRpcmVseSBjZXJ0YWluIHRoZXJlIGlzLCBnaXZl
bgo+PiBzb21lIG9mIElDRUJQJ3MgZXh0cmEgbWFnaWMgcHJvcGVydGllcy4KPiBTbywgdGhpcyBp
cyBqdXN0IGFub3RoZXIgY2FzZSBvZiBhbiBpc3N1ZSBJJ3ZlIGFscmVhZHkgdHJpZWQgZml4aW5n
IG9uY2UKPiBhbmQgaGF2ZW4ndCBoYWQgdGltZSB0byBmaXggaW4gYSB3YXkgd2hpY2ggZG9lc24n
dCBicmVhayBvdGhlciBwaWVjZXMgb2YKPiBmdW5jdGlvbmFsaXR5Lgo+Cj4gSSBjbGVhcmx5IG5l
ZWQgdG8gZHVzdCBvZmYgdGhhdCBzZXJpZXMgYW5kIGdldCBpdCB3b3JraW5nIHByb3Blcmx5Lgo+
Cj4gSW4gdGhlIHNob3J0IHRlcm0sIHRoaXMgd2lsbCB3b3JrIGFyb3VuZCB5b3VyIHByb2JsZW0u
Cj4KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmggYi94ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS9odm0uaAo+IGluZGV4IGY4NmFmMDk4OTguLjEwZGFhYTZmMzMgMTAw
NjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKPiArKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS9odm0uaAo+IEBAIC01MjIsOCArNTIyLDcgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIGh2bV9pbnZscGcoc3RydWN0IHZjcHUgKnYsCj4gdW5zaWduZWQgbG9uZyBsaW5lYXIp
Cj4gIMKgwqDCoMKgIChYODZfQ1I0X1ZNWEUgfCBYODZfQ1I0X1BBRSB8IFg4Nl9DUjRfTUNFKSkK
PiAgIAo+ICDCoC8qIFRoZXNlIGV4Y2VwdGlvbnMgbXVzdCBhbHdheXMgYmUgaW50ZXJjZXB0ZWQu
ICovCj4gLSNkZWZpbmUgSFZNX1RSQVBfTUFTSyAoKDFVIDw8IFRSQVBfZGVidWcpwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCBcCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICgxVSA8PCBUUkFQX2FsaWdubWVudF9jaGVjaykgfCBcCj4gKyNkZWZpbmUgSFZNX1RS
QVBfTUFTSyAoKDFVIDw8IFRSQVBfYWxpZ25tZW50X2NoZWNrKSB8IFwKPiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoMVUgPDwgVFJBUF9tYWNoaW5lX2No
ZWNrKSkKPiAgIAo+ICDCoHN0YXRpYyBpbmxpbmUgaW50IGh2bV9jcHVfdXAodm9pZCkKPgo+IEhv
d2V2ZXIsIGJlIGF3YXJlIHRoYXQgaXQgd2lsbCByZWludHJvZHVjZQo+IGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcveHNhL2Fkdmlzb3J5LTE1Ni5odG1sIHNvIGlzbid0IHJlY29tbWVuZGVkIGZvcgo+
IGdlbmVyYWwgdXNlLgpUaGFuayB5b3Uga2luZGx5LiBFdmVyIHRoZSBvcHRpbWlzdCwgSSdsbCBh
cHBseSB0aGUgcGF0Y2guCj4gU2VlaW5nIGFzIHRoaXMgbG9va3MgdG8gYmUgc29tZSBEUk0gc29m
dHdhcmUsIGl0IGlzbid0Cj4gbGlrZWx5IHRvIG1vdW50IGFuIGF0dGFjayBsaWtlIHRoYXQsIGFz
IGl0IHdvdWxkIGxpdmVsb2NrIGEgbmF0aXZlCj4gc3lzdGVtIGp1c3QgYXMgYmFkbHkgYXMgaXQg
bGl2ZWxvY2tzIGEgdmlydHVhbGlzZWQgc3lzdGVtLgoKSSdtIHNsaWdodGx5IHJlbGlldmVkIHRo
ZSBtYWx3YXJlIHJ1bm5pbmcgb24gbXkgc3lzdGVtIGlzIGNvdXJ0ZXN5IG9mIApiaWcgbWVkaWEg
cmF0aGVyIHRoYW4gc29tZSBSb21hbmlhbiBjb25zdWx0YW50IGZvciB0aGUgUk5DLgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
