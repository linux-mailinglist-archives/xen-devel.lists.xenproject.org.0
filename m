Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782AFB78B0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:50:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuus-0004l4-UH; Thu, 19 Sep 2019 11:48:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAuuq-0004kr-UF
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:48:04 +0000
X-Inumbo-ID: 55a2ffc8-dad3-11e9-9656-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55a2ffc8-dad3-11e9-9656-12813bfff9fa;
 Thu, 19 Sep 2019 11:48:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70618AF7B;
 Thu, 19 Sep 2019 11:48:01 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b080fa0f-08d2-34d0-3f54-549e1303eeb4@suse.com>
Date: Thu, 19 Sep 2019 13:48:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] libxc/x86: avoid overflow in CPUID APIC ID
 adjustments
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVjZW50IEFNRCBwcm9jZXNzb3JzIG1heSByZXBvcnQgdXAgdG8gMTI4IGxvZ2ljYWwgcHJvY2Vz
c29ycyBpbiBDUFVJRApsZWFmIDEuIERvdWJsaW5nIHRoaXMgdmFsdWUgcHJvZHVjZXMgMCAod2hp
Y2ggT1NlcyBzaW5jZXJlbHkgZGlzbGlrZSksCmFzIHRoZSByZXNwZWN0aXZlIGZpZWxkIGlzIG9u
bHkgOCBiaXRzIHdpZGUuIFN1cHByZXNzIGRvdWJsaW5nIHRoZSB2YWx1ZQooYW5kIGl0cyBsZWFm
IDB4ODAwMDAwMDggY291bnRlcnBhcnQpIGluIHN1Y2ggYSBjYXNlLgoKQWRkaXRpb25hbGx5IGRv
bid0IGV2ZW4gZG8gYW55IGFkanVzdG1lbnQgd2hlbiB0aGUgaG9zdCB0b3BvbG9neSBhbHJlYWR5
CmluY2x1ZGVzIHJvb20gZm9yIG11bHRpcGxlIHRocmVhZHMgcGVyIGNvcmUuCgpGdXJ0aGVybW9y
ZSBkb24ndCBkb3VibGUgdGhlIE1heGltdW0gQ29yZXMgUGVyIFBhY2thZ2UgYXQgYWxsIC0gYnkg
dXMKaW50cm9kdWNpbmcgYSBmYWtlIEhUVCBlZmZlY3QsIHRoZSBjb3JlIGNvdW50IGRvZXNuJ3Qg
bmVlZCB0byBjaGFuZ2UuCkluc3RlYWQgYWRqdXN0IHRoZSBNYXhpbXVtIExvZ2ljYWwgUHJvY2Vz
c29ycyBTaGFyaW5nIENhY2hlIGZpZWxkLCB3aGljaApzbyBmYXIgd2FzIHphcHBlZCBhbHRvZ2V0
aGVyLgoKQWxzbyB6YXAgbGVhZiA0IChhbmQgYXQgdGhlIHNhbWUgdGltZSBsZWFmIDIpIEVEWCBv
dXRwdXQgZm9yIEFNRC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KLS0tClRCRDogVXNpbmcgeGNfcGh5c2luZm8oKSBvdXRwdXQgaGVyZSBuZWVkcyBhIGJl
dHRlciBzb2x1dGlvbi4gVGhlCiAgICAgdGhyZWFkc19wZXJfY29yZSB2YWx1ZSByZXR1cm5lZCBp
cyB0aGUgY291bnQgb2YgYWN0aXZlIHNpYmxpbmdzIG9mCiAgICAgQ1BVIDAsIHJhdGhlciB0aGFu
IGEgc3lzdGVtIHdpZGUgYXBwbGljYWJsZSB2YWx1ZSAoYW5kIGNvbnN0YW50CiAgICAgb3ZlciB0
aGUgZW50aXJlIHNlc3Npb24pLiBVc2luZyBDUFVJRCBvdXRwdXQgKGxlYXZlcyA0IGFuZAogICAg
IDgwMDAwMDFlKSBkb2Vzbid0IGxvb2sgdmlhYmxlIGVpdGhlciwgZHVlIHRvIHRoaXMgbm90IHJl
YWxseSBiZWluZwogICAgIHRoZSBob3N0IHZhbHVlcyBvbiBQVkguIEp1ZGdpbmcgZnJvbSB0aGUg
aG9zdCBmZWF0dXJlIHNldCdzIEhUVAogICAgIGZsYWcgYWxzbyB3b3VsZG4ndCB0ZWxsIHVzIHdo
ZXRoZXIgdGhlcmUgYWN0dWFsbHkgYXJlIG11bHRpcGxlCiAgICAgdGhyZWFkcyBwZXIgY29yZS4K
VEJEOiBUaGUgYWRqdXN0bWVudCBvZiBNYXhpbXVtIExvZ2ljYWwgUHJvY2Vzc29ycyBTaGFyaW5n
IENhY2hlIHNob3VsZAogICAgIHBlcmhhcHMgb2NjdXIgb25seSBpZiBhbiBhZGp1c3RtZW50IHRv
IGxlYWYgMSBoYXMgb2NjdXJyZWQuCgotLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwor
KysgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwpAQCAtMjUxLDYgKzI1MSw4IEBAIHN0cnVj
dCBjcHVpZF9kb21haW5faW5mbwogICAgIHVpbnQzMl90ICpmZWF0dXJlc2V0OwogICAgIHVuc2ln
bmVkIGludCBucl9mZWF0dXJlczsKIAorICAgIGJvb2wgaG9zdF9odHQ7CisKICAgICAvKiBQVi1v
bmx5IGluZm9ybWF0aW9uLiAqLwogICAgIGJvb2wgcHY2NDsKIApAQCAtMjkwLDYgKzI5Miw3IEBA
IHN0YXRpYyBpbnQgZ2V0X2NwdWlkX2RvbWFpbl9pbmZvKHhjX2ludGUKICAgICB4Y19kb21pbmZv
X3QgZGk7CiAgICAgdW5zaWduZWQgaW50IGluWzJdID0geyAwLCB+MFUgfSwgcmVnc1s0XTsKICAg
ICB1bnNpZ25lZCBpbnQgaSwgaG9zdF9ucl9mZWF0dXJlcyA9IHhjX2dldF9jcHVfZmVhdHVyZXNl
dF9zaXplKCk7CisgICAgeGNfcGh5c2luZm9fdCBwaHlzaW5mbzsKICAgICBpbnQgcmM7CiAKICAg
ICBjcHVpZChpbiwgcmVncyk7CkBAIC0zNDMsNiArMzQ2LDEwIEBAIHN0YXRpYyBpbnQgZ2V0X2Nw
dWlkX2RvbWFpbl9pbmZvKHhjX2ludGUKIAogICAgIGluZm8tPnhmZWF0dXJlX21hc2sgPSBkb21j
dGwudS52Y3B1ZXh0c3RhdGUueGZlYXR1cmVfbWFzazsKIAorICAgIHJjID0geGNfcGh5c2luZm8o
eGNoLCAmcGh5c2luZm8pOworICAgIGlmICggIXJjICYmIHBoeXNpbmZvLnRocmVhZHNfcGVyX2Nv
cmUgPiAxICkKKyAgICAgICAgaW5mby0+aG9zdF9odHQgPSB0cnVlOworCiAgICAgaWYgKCBkaS5o
dm0gKQogICAgIHsKICAgICAgICAgdWludDY0X3QgdmFsOwpAQCAtMzg1LDcgKzM5Miw3IEBAIHN0
YXRpYyB2b2lkIGFtZF94Y19jcHVpZF9wb2xpY3koY29uc3Qgc3QKICAgICB7CiAgICAgY2FzZSAw
eDAwMDAwMDAyOgogICAgIGNhc2UgMHgwMDAwMDAwNDoKLSAgICAgICAgcmVnc1swXSA9IHJlZ3Nb
MV0gPSByZWdzWzJdID0gMDsKKyAgICAgICAgcmVnc1swXSA9IHJlZ3NbMV0gPSByZWdzWzJdID0g
cmVnc1szXSA9IDA7CiAgICAgICAgIGJyZWFrOwogCiAgICAgY2FzZSAweDgwMDAwMDAwOgpAQCAt
Mzk1LDExICs0MDIsMjUgQEAgc3RhdGljIHZvaWQgYW1kX3hjX2NwdWlkX3BvbGljeShjb25zdCBz
dAogCiAgICAgY2FzZSAweDgwMDAwMDA4OgogICAgICAgICAvKgotICAgICAgICAgKiBFQ1hbMTU6
MTJdIGlzIEFwaWNJZENvcmVTaXplOiBFQ1hbNzowXSBpcyBOdW1iZXJPZkNvcmVzIChtaW51cyBv
bmUpLgotICAgICAgICAgKiBVcGRhdGUgdG8gcmVmbGVjdCB2TEFQSUNfSUQgPSB2Q1BVX0lEICog
Mi4KKyAgICAgICAgICogRUNYWzE1OjEyXSBpcyBBcGljSWRDb3JlU2l6ZS4KKyAgICAgICAgICog
RUNYWzc6MF0gaXMgTnVtYmVyT2ZDb3JlcyAobWludXMgb25lKS4KKyAgICAgICAgICovCisgICAg
ICAgIGlmICggaW5mby0+aG9zdF9odHQgKQorICAgICAgICB7CisgICAgICAgICAgICByZWdzWzJd
ICY9IDB4ZjBmZnU7CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQorICAgICAgICAvKgor
ICAgICAgICAgKiBVcGRhdGUgdG8gcmVmbGVjdCB2TEFQSUNfSUQgPSB2Q1BVX0lEICogMi4gIEJ1
dCBtYWtlIHN1cmUgdG8gYXZvaWQKKyAgICAgICAgICogLSBvdmVyZmxvdywKKyAgICAgICAgICog
LSBnb2luZyBvdXQgb2Ygc3luYyB3aXRoIGxlYWYgMSBFQlhbMjM6MTZdLAorICAgICAgICAgKiAt
IGluY3JlbWVudGluZyBBcGljSWRDb3JlU2l6ZSB3aGVuIGl0J3MgemVybyAod2hpY2ggY2hhbmdl
cyB0aGUKKyAgICAgICAgICogICBtZWFuaW5nIG9mIGJpdHMgNzowKS4KICAgICAgICAgICovCi0g
ICAgICAgIHJlZ3NbMl0gPSAoKHJlZ3NbMl0gKyAoMXUgPDwgMTIpKSAmIDB4ZjAwMHUpIHwKLSAg
ICAgICAgICAgICAgICAgICgocmVnc1syXSAmIDB4ZmZ1KSA8PCAxKSB8IDF1OworICAgICAgICBp
ZiAoIChyZWdzWzJdICYgMHhmMDAwdSkgJiYgKHJlZ3NbMl0gJiAweGYwMDB1KSAhPSAweGYwMDB1
ICkKKyAgICAgICAgICAgIHJlZ3NbMl0gPSAoKHJlZ3NbMl0gKyAoMXUgPDwgMTIpKSAmIDB4ZjAw
MHUpIHwgKHJlZ3NbMl0gJiAweGZmdSk7CisgICAgICAgIGlmICggKHJlZ3NbMl0gJiAweDdmdSkg
PCAweDdmdSApCisgICAgICAgICAgICByZWdzWzJdID0gKHJlZ3NbMl0gJiAweGYwMDB1KSB8ICgo
cmVnc1syXSAmIDB4N2Z1KSA8PCAxKSB8IDF1OwogICAgICAgICBicmVhazsKIAogICAgIGNhc2Ug
MHg4MDAwMDAwYTogewpAQCAtNDQyLDEwICs0NjMsMTkgQEAgc3RhdGljIHZvaWQgaW50ZWxfeGNf
Y3B1aWRfcG9saWN5KGNvbnN0CiAgICAgY2FzZSAweDAwMDAwMDA0OgogICAgICAgICAvKgogICAg
ICAgICAgKiBFQVhbMzE6MjZdIGlzIE1heGltdW0gQ29yZXMgUGVyIFBhY2thZ2UgKG1pbnVzIG9u
ZSkuCi0gICAgICAgICAqIFVwZGF0ZSB0byByZWZsZWN0IHZMQVBJQ19JRCA9IHZDUFVfSUQgKiAy
LgorICAgICAgICAgKiBFQVhbMjU6MTRdIGlzIE1heGltdW0gTG9naWNhbCBQcm9jZXNzb3JzIFNo
YXJpbmcgQ2FjaGUgKG1pbnVzIG9uZSkuCiAgICAgICAgICAqLwotICAgICAgICByZWdzWzBdID0g
KCgocmVnc1swXSAmIDB4N2MwMDAwMDB1KSA8PCAxKSB8IDB4MDQwMDAwMDB1IHwKLSAgICAgICAg
ICAgICAgICAgICAocmVnc1swXSAmIDB4M2ZmdSkpOworICAgICAgICBpZiAoIGluZm8tPmhvc3Rf
aHR0ICkKKyAgICAgICAgICAgIHJlZ3NbMF0gJj0gMHhmZmZmYzNmZnU7CisgICAgICAgIGVsc2UK
KyAgICAgICAgeworICAgICAgICAgICAgLyoKKyAgICAgICAgICAgICAqIFVwZGF0ZSB0byByZWZs
ZWN0IHZMQVBJQ19JRCA9IHZDUFVfSUQgKiAyLiAgTm90ZSB0aGF0IG92ZXJmbG93CisgICAgICAg
ICAgICAgKiBpcyBzdWZmaWNpZW50bHkgYmVuaWduIGhlcmUuCisgICAgICAgICAgICAgKi8KKyAg
ICAgICAgICAgIHJlZ3NbMF0gPSAoKChyZWdzWzBdIHwgMHgwMDAwMjAwMHUpIDw8IDEpICYgMHgw
M2ZmYzAwMHUpIHwKKyAgICAgICAgICAgICAgICAgICAgICAocmVnc1swXSAmIDB4ZmMwMDAzZmZ1
KTsKKyAgICAgICAgfQogICAgICAgICByZWdzWzNdICY9IDB4M2ZmdTsKICAgICAgICAgYnJlYWs7
CiAKQEAgLTQ3OCw5ICs1MDgsMTMgQEAgc3RhdGljIHZvaWQgeGNfY3B1aWRfaHZtX3BvbGljeShj
b25zdCBzdAogICAgIGNhc2UgMHgwMDAwMDAwMToKICAgICAgICAgLyoKICAgICAgICAgICogRUJY
WzIzOjE2XSBpcyBNYXhpbXVtIExvZ2ljYWwgUHJvY2Vzc29ycyBQZXIgUGFja2FnZS4KLSAgICAg
ICAgICogVXBkYXRlIHRvIHJlZmxlY3QgdkxBUElDX0lEID0gdkNQVV9JRCAqIDIuCisgICAgICAg
ICAqIFVwZGF0ZSB0byByZWZsZWN0IHZMQVBJQ19JRCA9IHZDUFVfSUQgKiAyLCBidXQgbWFrZSBz
dXJlIHRvIGF2b2lkCisgICAgICAgICAqIG92ZXJmbG93LgogICAgICAgICAgKi8KLSAgICAgICAg
cmVnc1sxXSA9IChyZWdzWzFdICYgMHgwMDAwZmZmZnUpIHwgKChyZWdzWzFdICYgMHgwMDdmMDAw
MHUpIDw8IDEpOworICAgICAgICBpZiAoICFpbmZvLT5ob3N0X2h0dCAmJiAhKHJlZ3NbMV0gJiAw
eDAwODAwMDAwdSkgKQorICAgICAgICAgICAgcmVnc1sxXSA9IChyZWdzWzFdICYgMHgwMDAwZmZm
ZnUpIHwgKChyZWdzWzFdICYgMHgwMDdmMDAwMHUpIDw8IDEpOworICAgICAgICBlbHNlCisgICAg
ICAgICAgICByZWdzWzFdICY9IDB4MDBmZmZmZmZ1OwogCiAgICAgICAgIHJlZ3NbMl0gPSBpbmZv
LT5mZWF0dXJlc2V0W2ZlYXR1cmV3b3JkX29mKFg4Nl9GRUFUVVJFX1NTRTMpXTsKICAgICAgICAg
cmVnc1szXSA9IChpbmZvLT5mZWF0dXJlc2V0W2ZlYXR1cmV3b3JkX29mKFg4Nl9GRUFUVVJFX0ZQ
VSldIHwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
