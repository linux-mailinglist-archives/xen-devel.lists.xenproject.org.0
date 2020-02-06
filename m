Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763C11547E3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 16:22:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iziwf-0004nC-Dg; Thu, 06 Feb 2020 15:19:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iziwd-0004n5-Vz
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 15:19:56 +0000
X-Inumbo-ID: 20695eb2-48f4-11ea-afdb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20695eb2-48f4-11ea-afdb-12813bfff9fa;
 Thu, 06 Feb 2020 15:19:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A5F49AD6C;
 Thu,  6 Feb 2020 15:19:53 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da353fee-b7f7-73ab-9ebe-632b4ea4152d@suse.com>
Date: Thu, 6 Feb 2020 16:20:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/p2m: drop p2m_access_t parameter from
 set_mmio_p2m_entry()
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qm90aCBjYWxsZXJzIHJlcXVlc3QgdGhlIGhvc3QgUDJNJ3MgZGVmYXVsdCBhY2Nlc3MsIHdoaWNo
IGNhbiBhcyB3ZWxsIGJlCmRvbmUgaW5zaWRlIHRoZSBmdW5jdGlvbi4gV2hpbGUgdG91Y2hpbmcg
dGhpcyBhbnl3YXksIG1ha2UgdGhlICJnZm4iCnBhcmFtZXRlciB0eXBlLXNhZmUgYXMgd2VsbC4K
ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5j
CkBAIC0zMDM3LDkgKzMwMzcsOCBAQCBzdGF0aWMgaW50IHZteF9hbGxvY192bGFwaWNfbWFwcGlu
ZyhzdHJ1CiAgICAgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdChwZywgZCwgU0hBUkVfcncpOwog
ICAgIGQtPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm4gPSBtZm47CiAKLSAgICByZXR1cm4g
c2V0X21taW9fcDJtX2VudHJ5KGQsIHBhZGRyX3RvX3BmbihBUElDX0RFRkFVTFRfUEhZU19CQVNF
KSwgbWZuLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9PUkRFUl80SywKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9nZXRfaG9zdHAybShkKS0+ZGVmYXVsdF9h
Y2Nlc3MpOworICAgIHJldHVybiBzZXRfbW1pb19wMm1fZW50cnkoZCwgZ2FkZHJfdG9fZ2ZuKEFQ
SUNfREVGQVVMVF9QSFlTX0JBU0UpLCBtZm4sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQQUdFX09SREVSXzRLKTsKIH0KIAogc3RhdGljIHZvaWQgdm14X2ZyZWVfdmxhcGljX21hcHBp
bmcoc3RydWN0IGRvbWFpbiAqZCkKLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtMTMyNywxNSArMTMyNywxNiBAQCBpbnQgc2V0X2ZvcmVp
Z25fcDJtX2VudHJ5KHN0cnVjdCBkb21haW4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwMm1fZ2V0X2hvc3RwMm0oZCktPmRlZmF1bHRfYWNjZXNzKTsKIH0KIAotaW50IHNldF9tbWlv
X3AybV9lbnRyeShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbiwgbWZuX3QgbWZu
LAotICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIsIHAybV9hY2Nlc3Nf
dCBhY2Nlc3MpCitpbnQgc2V0X21taW9fcDJtX2VudHJ5KHN0cnVjdCBkb21haW4gKmQsIGdmbl90
IGdmbiwgbWZuX3QgbWZuLAorICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb3Jk
ZXIpCiB7CiAgICAgaWYgKCBvcmRlciA+IFBBR0VfT1JERVJfNEsgJiYKICAgICAgICAgIHJhbmdl
c2V0X292ZXJsYXBzX3JhbmdlKG1taW9fcm9fcmFuZ2VzLCBtZm5feChtZm4pLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3gobWZuKSArICgxVUwgPDwgb3JkZXIpIC0gMSkg
KQogICAgICAgICByZXR1cm4gUEFHRV9PUkRFUl80SyArIDE7CiAKLSAgICByZXR1cm4gc2V0X3R5
cGVkX3AybV9lbnRyeShkLCBnZm4sIG1mbiwgb3JkZXIsIHAybV9tbWlvX2RpcmVjdCwgYWNjZXNz
KTsKKyAgICByZXR1cm4gc2V0X3R5cGVkX3AybV9lbnRyeShkLCBnZm5feChnZm4pLCBtZm4sIG9y
ZGVyLCBwMm1fbW1pb19kaXJlY3QsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJt
X2dldF9ob3N0cDJtKGQpLT5kZWZhdWx0X2FjY2Vzcyk7CiB9CiAKIGludCBzZXRfaWRlbnRpdHlf
cDJtX2VudHJ5KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuX2wsCkBAIC0yMzA1
LDkgKzIzMDYsOCBAQCBpbnQgbWFwX21taW9fcmVnaW9ucyhzdHJ1Y3QgZG9tYWluICpkLAogICAg
ICAgICBmb3IgKCBvcmRlciA9IG1taW9fb3JkZXIoZCwgKGdmbl94KHN0YXJ0X2dmbikgKyBpKSB8
IChtZm5feChtZm4pICsgaSksIG5yIC0gaSk7IDsKICAgICAgICAgICAgICAgb3JkZXIgPSByZXQg
LSAxICkKICAgICAgICAgewotICAgICAgICAgICAgcmV0ID0gc2V0X21taW9fcDJtX2VudHJ5KGQs
IGdmbl94KHN0YXJ0X2dmbikgKyBpLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG1mbl9hZGQobWZuLCBpKSwgb3JkZXIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcDJtX2dldF9ob3N0cDJtKGQpLT5kZWZhdWx0X2FjY2Vzcyk7CisgICAgICAgICAg
ICByZXQgPSBzZXRfbW1pb19wMm1fZW50cnkoZCwgZ2ZuX2FkZChzdGFydF9nZm4sIGkpLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mbl9hZGQobWZuLCBpKSwgb3JkZXIp
OwogICAgICAgICAgICAgaWYgKCByZXQgPD0gMCApCiAgICAgICAgICAgICAgICAgYnJlYWs7CiAg
ICAgICAgICAgICBBU1NFUlQocmV0IDw9IG9yZGVyKTsKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9wMm0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCkBAIC02MzgsOCArNjM4LDgg
QEAgaW50IHAybV9pc19sb2dkaXJ0eV9yYW5nZShzdHJ1Y3QgcDJtX2RvbQogaW50IHNldF9mb3Jl
aWduX3AybV9lbnRyeShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbiwgbWZuX3Qg
bWZuKTsKIAogLyogU2V0IG1taW8gYWRkcmVzc2VzIGluIHRoZSBwMm0gdGFibGUgKGZvciBwYXNz
LXRocm91Z2gpICovCi1pbnQgc2V0X21taW9fcDJtX2VudHJ5KHN0cnVjdCBkb21haW4gKmQsIHVu
c2lnbmVkIGxvbmcgZ2ZuLCBtZm5fdCBtZm4sCi0gICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBvcmRlciwgcDJtX2FjY2Vzc190IGFjY2Vzcyk7CitpbnQgc2V0X21taW9fcDJtX2Vu
dHJ5KHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwgbWZuX3QgbWZuLAorICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIpOwogaW50IGNsZWFyX21taW9fcDJtX2VudHJ5
KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuLCBtZm5fdCBtZm4sCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9yZGVyKTsKIAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
