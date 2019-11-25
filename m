Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD91108B43
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 10:59:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZB7s-00014P-0T; Mon, 25 Nov 2019 09:57:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZB7q-00014K-LK
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 09:57:46 +0000
X-Inumbo-ID: 072d9daa-0f6a-11ea-b4d1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 072d9daa-0f6a-11ea-b4d1-bc764e2007e4;
 Mon, 25 Nov 2019 09:57:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 92C25AC2C;
 Mon, 25 Nov 2019 09:57:44 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <62a3d98f-8173-1b13-f20e-9bd000f0923f@suse.com>
Message-ID: <db8a9729-8408-c4a2-e28b-042c72bae186@suse.com>
Date: Mon, 25 Nov 2019 10:57:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <62a3d98f-8173-1b13-f20e-9bd000f0923f@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 1/3] introduce GFN notification for
 translated domains
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgZm9yIGluZGl2aWR1YWwgSU9NTVUgZHJpdmVycyAoYW5kIGZyb20gYW4gYWJzdHJh
Y3QgcG92IGFsc28KYXJjaGl0ZWN0dXJlcykgdG8gYmUgYWJsZSB0byBhZGp1c3QsIGFoZWFkIG9m
IGFjdHVhbCBtYXBwaW5nIHJlcXVlc3RzLAp0aGVpciBkYXRhIHN0cnVjdHVyZXMgd2hlbiB0aGV5
IG1pZ2h0IGNvdmVyIG9ubHkgYSBzdWItcmFuZ2Ugb2YgYWxsCnBvc3NpYmxlIEdGTnMsIGludHJv
ZHVjZSBhIG5vdGlmaWNhdGlvbiBjYWxsIHVzZWQgYnkgdmFyaW91cyBjb2RlIHBhdGhzCnBvdGVu
dGlhbGx5IGluc3RhbGxpbmcgYSBmcmVzaCBtYXBwaW5nIG9mIGEgbmV2ZXIgdXNlZCBHRk4gKGZv
ciBhCnBhcnRpY3VsYXIgZG9tYWluKS4KCk5vdGUgdGhhdCBiZWZvcmUgdGhpcyBwYXRjaCwgaW4g
Z250dGFiX3RyYW5zZmVyKCksIG9uY2UgcGFzdAphc3NpZ25fcGFnZXMoKSwgZnVydGhlciBlcnJv
cnMgbW9kaWZ5aW5nIHRoZSBwaHlzbWFwIGFyZSBpZ25vcmVkCihwcmVzdW1hYmx5IGJlY2F1c2Ug
aXQgd291bGQgYmUgdG9vIGNvbXBsaWNhdGVkIHRvIHRyeSB0byByb2xsIGJhY2sgYXQKdGhhdCBw
b2ludCkuIFRoaXMgcGF0Y2ggZm9sbG93cyBzdWl0IGJ5IGlnbm9yaW5nIGZhaWxlZCBub3RpZnlf
Z2ZuKClzIG9yCnJhY2VzIGR1ZSB0byB0aGUgbmVlZCB0byBpbnRlcm1lZGlhdGVseSBkcm9wIGxv
Y2tzLCBzaW1wbHkgcHJpbnRpbmcgb3V0CmEgd2FybmluZyB0aGF0IHRoZSBnZm4gbWF5IG5vdCBi
ZSBhY2Nlc3NpYmxlIGR1ZSB0byB0aGUgZmFpbHVyZS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYzOiBDb25kaXRpb25hbGl6ZSB1cG9uIENPTkZJ
R19JT01NVV9GT1JDRV9QVF9TSEFSRSwgYWxzbyBjb3ZlcmluZyB0aGUKICAgIHNoYXJlX3AybV90
YWJsZSgpIGZ1bmN0aW9uYWxpdHkgYXMgYXBwcm9wcmlhdGUuIFVuLWNvbW1lbnQgdGhlCiAgICBH
TlRNQVBfaG9zdF9tYXAgY2hlY2suCnYyOiBJbnRyb2R1Y2UgYXJjaF9ub3RpZnlfZ2ZuKCksIHRv
IGludm9rZSBnZm5fdmFsaWQoKSBvbiB4ODYgKHRoaXMKICAgIHVuZm9ydHVuYXRlbHkgbWVhbnMg
aXQgYW5kIG5vdGlmeV9nZm4oKSBub3cgbmVlZCB0byBiZSBtYWNyb3MsIG9yCiAgICBlbHNlIGlu
Y2x1ZGUgZmlsZSBkZXBlbmRlbmNpZXMgZ2V0IGluIHRoZSB3YXksIGFzIGdmbl92YWxpZCgpIGxp
dmVzCiAgICBpbiBwYWdpbmcuaCwgd2hpY2ggd2Ugc2hvdWxkbid0IGluY2x1ZGUgZnJvbSB4ZW4v
c2NoZWQuaCkuIEltcHJvdmUKICAgIGRlc2NyaXB0aW9uLgoKVEJEOiBEb2VzIEFybSBhY3R1YWxs
eSBoYXZlIGFueXRoaW5nIHRvIGNoZWNrIGFnYWluc3QgaW4gaXRzCiAgICAgYXJjaF9ub3RpZnlf
Z2ZuKCk/CgotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJj
aC94ODYvaHZtL2RvbTBfYnVpbGQuYwpAQCAtMTczLDcgKzE3Myw4IEBAIHN0YXRpYyBpbnQgX19p
bml0IHB2aF9wb3B1bGF0ZV9tZW1vcnlfcmEKICAgICAgICAgICAgIGNvbnRpbnVlOwogICAgICAg
ICB9CiAKLSAgICAgICAgcmMgPSBndWVzdF9waHlzbWFwX2FkZF9wYWdlKGQsIF9nZm4oc3RhcnQp
LCBwYWdlX3RvX21mbihwYWdlKSwKKyAgICAgICAgcmMgPSBub3RpZnlfZ2ZuKGQsIF9nZm4oc3Rh
cnQgKyAoMVVMIDw8IG9yZGVyKSAtIDEpKSA/OgorICAgICAgICAgICAgIGd1ZXN0X3BoeXNtYXBf
YWRkX3BhZ2UoZCwgX2dmbihzdGFydCksIHBhZ2VfdG9fbWZuKHBhZ2UpLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgb3JkZXIpOwogICAgICAgICBpZiAoIHJjICE9IDAgKQog
ICAgICAgICB7Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2
L2h2bS9odm0uYwpAQCAtNDMwNCw5ICs0MzA0LDE3IEBAIHN0YXRpYyBpbnQgaHZtb3Bfc2V0X3Bh
cmFtKAogICAgICAgICBpZiAoIGEudmFsdWUgPiBTSFVURE9XTl9NQVggKQogICAgICAgICAgICAg
cmMgPSAtRUlOVkFMOwogICAgICAgICBicmVhazsKKwogICAgIGNhc2UgSFZNX1BBUkFNX0lPUkVR
X1NFUlZFUl9QRk46Ci0gICAgICAgIGQtPmFyY2guaHZtLmlvcmVxX2dmbi5iYXNlID0gYS52YWx1
ZTsKKyAgICAgICAgaWYgKCBkLT5hcmNoLmh2bS5wYXJhbXNbSFZNX1BBUkFNX05SX0lPUkVRX1NF
UlZFUl9QQUdFU10gKQorICAgICAgICAgICAgcmMgPSBub3RpZnlfZ2ZuKAorICAgICAgICAgICAg
ICAgICAgICAgZCwKKyAgICAgICAgICAgICAgICAgICAgIF9nZm4oYS52YWx1ZSArIGQtPmFyY2gu
aHZtLnBhcmFtcworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW0hWTV9QQVJB
TV9OUl9JT1JFUV9TRVJWRVJfUEFHRVNdIC0gMSkpOworICAgICAgICBpZiAoICFyYyApCisgICAg
ICAgICAgICAgZC0+YXJjaC5odm0uaW9yZXFfZ2ZuLmJhc2UgPSBhLnZhbHVlOwogICAgICAgICBi
cmVhazsKKwogICAgIGNhc2UgSFZNX1BBUkFNX05SX0lPUkVRX1NFUlZFUl9QQUdFUzoKICAgICB7
CiAgICAgICAgIHVuc2lnbmVkIGludCBpOwpAQCAtNDMxNyw2ICs0MzI1LDkgQEAgc3RhdGljIGlu
dCBodm1vcF9zZXRfcGFyYW0oCiAgICAgICAgICAgICByYyA9IC1FSU5WQUw7CiAgICAgICAgICAg
ICBicmVhazsKICAgICAgICAgfQorICAgICAgICByYyA9IG5vdGlmeV9nZm4oZCwgX2dmbihkLT5h
cmNoLmh2bS5pb3JlcV9nZm4uYmFzZSArIGEudmFsdWUgLSAxKSk7CisgICAgICAgIGlmICggcmMg
KQorICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgYS52YWx1ZTsg
aSsrICkKICAgICAgICAgICAgIHNldF9iaXQoaSwgJmQtPmFyY2guaHZtLmlvcmVxX2dmbi5tYXNr
KTsKIApAQCAtNDMzMCw3ICs0MzQxLDExIEBAIHN0YXRpYyBpbnQgaHZtb3Bfc2V0X3BhcmFtKAog
ICAgICAgICBCVUlMRF9CVUdfT04oSFZNX1BBUkFNX0JVRklPUkVRX1BGTiA+CiAgICAgICAgICAg
ICAgICAgICAgICBzaXplb2YoZC0+YXJjaC5odm0uaW9yZXFfZ2ZuLmxlZ2FjeV9tYXNrKSAqIDgp
OwogICAgICAgICBpZiAoIGEudmFsdWUgKQotICAgICAgICAgICAgc2V0X2JpdChhLmluZGV4LCAm
ZC0+YXJjaC5odm0uaW9yZXFfZ2ZuLmxlZ2FjeV9tYXNrKTsKKyAgICAgICAgeworICAgICAgICAg
ICAgcmMgPSBub3RpZnlfZ2ZuKGQsIF9nZm4oYS52YWx1ZSkpOworICAgICAgICAgICAgaWYgKCAh
cmMgKQorICAgICAgICAgICAgICAgIHNldF9iaXQoYS5pbmRleCwgJmQtPmFyY2guaHZtLmlvcmVx
X2dmbi5sZWdhY3lfbWFzayk7CisgICAgICAgIH0KICAgICAgICAgYnJlYWs7CiAKICAgICBjYXNl
IEhWTV9QQVJBTV9YODdfRklQX1dJRFRIOgotLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMK
KysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCkBAIC05NDYsNiArOTQ2LDE2IEBAIG1hcF9n
cmFudF9yZWYoCiAgICAgICAgIHJldHVybjsKICAgICB9CiAKKyAgICBpZiAoIHBhZ2luZ19tb2Rl
X3RyYW5zbGF0ZShsZCkgJiYgKG9wLT5mbGFncyAmIEdOVE1BUF9ob3N0X21hcCkgJiYKKyAgICAg
ICAgIChyYyA9IG5vdGlmeV9nZm4obGQsIGdhZGRyX3RvX2dmbihvcC0+aG9zdF9hZGRyKSkpICkK
KyAgICB7CisgICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLCAibm90aWZ5KCUiUFJJX2dmbiIp
IC0+ICVkXG4iLAorICAgICAgICAgICAgICAgICBnZm5feChnYWRkcl90b19nZm4ob3AtPmhvc3Rf
YWRkcikpLCByYyk7CisgICAgICAgIG9wLT5zdGF0dXMgPSBHTlRTVF9nZW5lcmFsX2Vycm9yOwor
ICAgICAgICByZXR1cm47CisgICAgICAgIEJVSUxEX0JVR19PTihHTlRTVF9va2F5KTsKKyAgICB9
CisKICAgICBpZiAoIHVubGlrZWx5KChyZCA9IHJjdV9sb2NrX2RvbWFpbl9ieV9pZChvcC0+ZG9t
KSkgPT0gTlVMTCkgKQogICAgIHsKICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0lORk8sICJDb3Vs
ZCBub3QgZmluZCBkb21haW4gJWRcbiIsIG9wLT5kb20pOwpAQCAtMjEyMyw2ICsyMTMzLDcgQEAg
Z250dGFiX3RyYW5zZmVyKAogICAgIHsKICAgICAgICAgYm9vbF90IG9rYXk7CiAgICAgICAgIGlu
dCByYzsKKyAgICAgICAgZ2ZuX3QgZ2ZuOwogCiAgICAgICAgIGlmICggaSAmJiBoeXBlcmNhbGxf
cHJlZW1wdF9jaGVjaygpICkKICAgICAgICAgICAgIHJldHVybiBpOwpAQCAtMjMwMCwyMSArMjMx
MSw1MiBAQCBnbnR0YWJfdHJhbnNmZXIoCiAgICAgICAgIGFjdCA9IGFjdGl2ZV9lbnRyeV9hY3F1
aXJlKGUtPmdyYW50X3RhYmxlLCBnb3AucmVmKTsKIAogICAgICAgICBpZiAoIGV2YWx1YXRlX25v
c3BlYyhlLT5ncmFudF90YWJsZS0+Z3RfdmVyc2lvbiA9PSAxKSApCisgICAgICAgICAgICBnZm4g
PSBfZ2ZuKHNoYXJlZF9lbnRyeV92MShlLT5ncmFudF90YWJsZSwgZ29wLnJlZikuZnJhbWUpOwor
ICAgICAgICBlbHNlCisgICAgICAgICAgICBnZm4gPSBfZ2ZuKHNoYXJlZF9lbnRyeV92MihlLT5n
cmFudF90YWJsZSwgZ29wLnJlZikuZnVsbF9wYWdlLmZyYW1lKTsKKworICAgICAgICBpZiAoIHBh
Z2luZ19tb2RlX3RyYW5zbGF0ZShlKSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGdyYW50X2Vu
dHJ5X3YxX3QgKnNoYSA9ICZzaGFyZWRfZW50cnlfdjEoZS0+Z3JhbnRfdGFibGUsIGdvcC5yZWYp
OworICAgICAgICAgICAgZ2ZuX3QgZ2ZuMjsKKworICAgICAgICAgICAgYWN0aXZlX2VudHJ5X3Jl
bGVhc2UoYWN0KTsKKyAgICAgICAgICAgIGdyYW50X3JlYWRfdW5sb2NrKGUtPmdyYW50X3RhYmxl
KTsKKworICAgICAgICAgICAgcmMgPSBub3RpZnlfZ2ZuKGUsIGdmbik7CisgICAgICAgICAgICBp
ZiAoIHJjICkKKyAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfV0FSTklORworICAgICAg
ICAgICAgICAgICAgICAgICAiJXBkOiBncmVmICV1OiB4ZmVyIEdGTiAlIlBSSV9nZm4iIG1heSBi
ZSBpbmFjY2Vzc2libGUgKCVkKVxuIiwKKyAgICAgICAgICAgICAgICAgICAgICAgZSwgZ29wLnJl
ZiwgZ2ZuX3goZ2ZuKSwgcmMpOworCisgICAgICAgICAgICBncmFudF9yZWFkX2xvY2soZS0+Z3Jh
bnRfdGFibGUpOworICAgICAgICAgICAgYWN0ID0gYWN0aXZlX2VudHJ5X2FjcXVpcmUoZS0+Z3Jh
bnRfdGFibGUsIGdvcC5yZWYpOwogCi0gICAgICAgICAgICBndWVzdF9waHlzbWFwX2FkZF9wYWdl
KGUsIF9nZm4oc2hhLT5mcmFtZSksIG1mbiwgMCk7Ci0gICAgICAgICAgICBpZiAoICFwYWdpbmdf
bW9kZV90cmFuc2xhdGUoZSkgKQotICAgICAgICAgICAgICAgIHNoYS0+ZnJhbWUgPSBtZm5feCht
Zm4pOworICAgICAgICAgICAgaWYgKCBldmFsdWF0ZV9ub3NwZWMoZS0+Z3JhbnRfdGFibGUtPmd0
X3ZlcnNpb24gPT0gMSkgKQorICAgICAgICAgICAgICAgIGdmbjIgPSBfZ2ZuKHNoYXJlZF9lbnRy
eV92MShlLT5ncmFudF90YWJsZSwgZ29wLnJlZikuZnJhbWUpOworICAgICAgICAgICAgZWxzZQor
ICAgICAgICAgICAgICAgIGdmbjIgPSBfZ2ZuKHNoYXJlZF9lbnRyeV92MihlLT5ncmFudF90YWJs
ZSwgZ29wLnJlZikuCisgICAgICAgICAgICAgICAgICAgIGZ1bGxfcGFnZS5mcmFtZSk7CisKKyAg
ICAgICAgICAgIGlmICggIWdmbl9lcShnZm4sIGdmbjIpICkKKyAgICAgICAgICAgIHsKKyAgICAg
ICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfV0FSTklORworICAgICAgICAgICAgICAgICAgICAg
ICAiJXBkOiBncmVmICV1OiB4ZmVyIEdGTiB3ZW50ICUiUFJJX2dmbiIgLT4gJSJQUklfZ2ZuIlxu
IiwKKyAgICAgICAgICAgICAgICAgICAgICAgZSwgZ29wLnJlZiwgZ2ZuX3goZ2ZuKSwgZ2ZuX3go
Z2ZuMikpOworICAgICAgICAgICAgICAgIGdmbiA9IGdmbjI7CisgICAgICAgICAgICB9CiAgICAg
ICAgIH0KLSAgICAgICAgZWxzZQotICAgICAgICB7Ci0gICAgICAgICAgICBncmFudF9lbnRyeV92
Ml90ICpzaGEgPSAmc2hhcmVkX2VudHJ5X3YyKGUtPmdyYW50X3RhYmxlLCBnb3AucmVmKTsKIAot
ICAgICAgICAgICAgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZShlLCBfZ2ZuKHNoYS0+ZnVsbF9wYWdl
LmZyYW1lKSwgbWZuLCAwKTsKLSAgICAgICAgICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0
ZShlKSApCi0gICAgICAgICAgICAgICAgc2hhLT5mdWxsX3BhZ2UuZnJhbWUgPSBtZm5feChtZm4p
OworICAgICAgICBndWVzdF9waHlzbWFwX2FkZF9wYWdlKGUsIGdmbiwgbWZuLCAwKTsKKworICAg
ICAgICBpZiAoICFwYWdpbmdfbW9kZV90cmFuc2xhdGUoZSkgKQorICAgICAgICB7CisgICAgICAg
ICAgICBpZiAoIGV2YWx1YXRlX25vc3BlYyhlLT5ncmFudF90YWJsZS0+Z3RfdmVyc2lvbiA9PSAx
KSApCisgICAgICAgICAgICAgICAgc2hhcmVkX2VudHJ5X3YxKGUtPmdyYW50X3RhYmxlLCBnb3Au
cmVmKS5mcmFtZSA9IG1mbl94KG1mbik7CisgICAgICAgICAgICBlbHNlCisgICAgICAgICAgICAg
ICAgc2hhcmVkX2VudHJ5X3YyKGUtPmdyYW50X3RhYmxlLCBnb3AucmVmKS5mdWxsX3BhZ2UuZnJh
bWUgPQorICAgICAgICAgICAgICAgICAgICBtZm5feChtZm4pOwogICAgICAgICB9CisKICAgICAg
ICAgc21wX3dtYigpOwogICAgICAgICBzaGFyZWRfZW50cnlfaGVhZGVyKGUtPmdyYW50X3RhYmxl
LCBnb3AucmVmKS0+ZmxhZ3MgfD0KICAgICAgICAgICAgIEdURl90cmFuc2Zlcl9jb21wbGV0ZWQ7
Ci0tLSBhL3hlbi9jb21tb24vbWVtb3J5LmMKKysrIGIveGVuL2NvbW1vbi9tZW1vcnkuYwpAQCAt
MjAzLDYgKzIwMywxMCBAQCBzdGF0aWMgdm9pZCBwb3B1bGF0ZV9waHlzbWFwKHN0cnVjdCBtZW1v
CiAgICAgICAgIGlmICggdW5saWtlbHkoX19jb3B5X2Zyb21fZ3Vlc3Rfb2Zmc2V0KCZncGZuLCBh
LT5leHRlbnRfbGlzdCwgaSwgMSkpICkKICAgICAgICAgICAgIGdvdG8gb3V0OwogCisgICAgICAg
IGlmICggcGFnaW5nX21vZGVfdHJhbnNsYXRlKGQpICYmCisgICAgICAgICAgICAgbm90aWZ5X2dm
bihkLCBfZ2ZuKGdwZm4gKyAoMVUgPDwgYS0+ZXh0ZW50X29yZGVyKSAtIDEpKSApCisgICAgICAg
ICAgICBnb3RvIG91dDsKKwogICAgICAgICBpZiAoIGEtPm1lbWZsYWdzICYgTUVNRl9wb3B1bGF0
ZV9vbl9kZW1hbmQgKQogICAgICAgICB7CiAgICAgICAgICAgICAvKiBEaXNhbGxvdyBwb3B1bGF0
aW5nIFBvRCBwYWdlcyBvbiBvbmVzZWxmLiAqLwpAQCAtNzQ1LDYgKzc0OSwxMCBAQCBzdGF0aWMg
bG9uZyBtZW1vcnlfZXhjaGFuZ2UoWEVOX0dVRVNUX0hBCiAgICAgICAgICAgICAgICAgY29udGlu
dWU7CiAgICAgICAgICAgICB9CiAKKyAgICAgICAgICAgIGlmICggcGFnaW5nX21vZGVfdHJhbnNs
YXRlKGQpICkKKyAgICAgICAgICAgICAgICByYyA9IG5vdGlmeV9nZm4oZCwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgX2dmbihncGZuICsgKDFVIDw8IGV4Y2gub3V0LmV4dGVudF9v
cmRlcikgLSAxKSk7CisKICAgICAgICAgICAgIG1mbiA9IHBhZ2VfdG9fbWZuKHBhZ2UpOwogICAg
ICAgICAgICAgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZShkLCBfZ2ZuKGdwZm4pLCBtZm4sCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4Y2gub3V0LmV4dGVudF9vcmRlcik7CkBA
IC04MTMsMTIgKzgyMSwyMCBAQCBpbnQgeGVubWVtX2FkZF90b19waHlzbWFwKHN0cnVjdCBkb21h
aW4KICAgICAgICAgZXh0cmEuZm9yZWlnbl9kb21pZCA9IERPTUlEX0lOVkFMSUQ7CiAKICAgICBp
ZiAoIHhhdHAtPnNwYWNlICE9IFhFTk1BUFNQQUNFX2dtZm5fcmFuZ2UgKQotICAgICAgICByZXR1
cm4geGVubWVtX2FkZF90b19waHlzbWFwX29uZShkLCB4YXRwLT5zcGFjZSwgZXh0cmEsCisgICAg
ICAgIHJldHVybiBub3RpZnlfZ2ZuKGQsIF9nZm4oeGF0cC0+Z3BmbikpID86CisgICAgICAgICAg
ICAgICB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBfb25lKGQsIHhhdHAtPnNwYWNlLCBleHRyYSwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGF0cC0+aWR4LCBfZ2ZuKHhh
dHAtPmdwZm4pKTsKIAogICAgIGlmICggeGF0cC0+c2l6ZSA8IHN0YXJ0ICkKICAgICAgICAgcmV0
dXJuIC1FSUxTRVE7CiAKKyAgICBpZiAoICFzdGFydCAmJiB4YXRwLT5zaXplICkKKyAgICB7Cisg
ICAgICAgIHJjID0gbm90aWZ5X2dmbihkLCBfZ2ZuKHhhdHAtPmdwZm4gKyB4YXRwLT5zaXplIC0g
MSkpOworICAgICAgICBpZiAoIHJjICkKKyAgICAgICAgICAgIHJldHVybiByYzsKKyAgICB9CisK
ICAgICB4YXRwLT5pZHggKz0gc3RhcnQ7CiAgICAgeGF0cC0+Z3BmbiArPSBzdGFydDsKICAgICB4
YXRwLT5zaXplIC09IHN0YXJ0OwpAQCAtODkxLDcgKzkwNyw4IEBAIHN0YXRpYyBpbnQgeGVubWVt
X2FkZF90b19waHlzbWFwX2JhdGNoKHMKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZXh0ZW50LCAxKSkgKQogICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7
CiAKLSAgICAgICAgcmMgPSB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBfb25lKGQsIHhhdHBiLT5zcGFj
ZSwKKyAgICAgICAgcmMgPSBub3RpZnlfZ2ZuKGQsIF9nZm4oZ3BmbikpID86CisgICAgICAgICAg
ICAgeGVubWVtX2FkZF90b19waHlzbWFwX29uZShkLCB4YXRwYi0+c3BhY2UsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4YXRwYi0+dSwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGlkeCwgX2dmbihncGZuKSk7CiAKLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvaW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21t
dS5jCkBAIC01MjIsNiArNTIyLDcgQEAgaW50IGlvbW11X2RvX2RvbWN0bCgKICAgICByZXR1cm4g
cmV0OwogfQogCisjaWZuZGVmIENPTkZJR19JT01NVV9GT1JDRV9QVF9TSEFSRQogdm9pZCBpb21t
dV9zaGFyZV9wMm1fdGFibGUoc3RydWN0IGRvbWFpbiogZCkKIHsKICAgICBBU1NFUlQoaGFwX2Vu
YWJsZWQoZCkpOwpAQCAtNTMwLDYgKzUzMSwxNSBAQCB2b2lkIGlvbW11X3NoYXJlX3AybV90YWJs
ZShzdHJ1Y3QgZG9tYWluCiAgICAgICAgIGlvbW11X2dldF9vcHMoKS0+c2hhcmVfcDJtKGQpOwog
fQogCitpbnQgaW9tbXVfbm90aWZ5X2dmbihzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4pCit7
CisgICAgY29uc3Qgc3RydWN0IGlvbW11X29wcyAqb3BzID0gZG9tX2lvbW11KGQpLT5wbGF0Zm9y
bV9vcHM7CisKKyAgICByZXR1cm4gbmVlZF9pb21tdV9wdF9zeW5jKGQpICYmIG9wcy0+bm90aWZ5
X2RmbgorICAgICAgICAgICA/IGlvbW11X2NhbGwob3BzLCBub3RpZnlfZGZuLCBkLCBfZGZuKGdm
bl94KGdmbikpKSA6IDA7Cit9CisjZW5kaWYKKwogdm9pZCBpb21tdV9jcmFzaF9zaHV0ZG93bih2
b2lkKQogewogICAgIGlmICggIWlvbW11X2NyYXNoX2Rpc2FibGUgKQotLS0gYS94ZW4vaW5jbHVk
ZS9hc20tYXJtL2RvbWFpbi5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZG9tYWluLmgKQEAg
LTI3Miw2ICsyNzIsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZnJlZV92Y3B1X2d1ZXN0X2NvbnRl
CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX3ZjcHVfYmxvY2soc3RydWN0IHZjcHUgKnYpIHt9
CiAKKyNkZWZpbmUgYXJjaF9ub3RpZnlfZ2ZuKGQsIGdmbikgKCh2b2lkKShkKSwgKHZvaWQpKGdm
biksIDApCisKICNlbmRpZiAvKiBfX0FTTV9ET01BSU5fSF9fICovCiAKIC8qCi0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvZG9tYWluLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4u
aApAQCAtNjQ3LDYgKzY0Nyw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmcmVlX3ZjcHVfZ3Vlc3Rf
Y29udGUKIAogdm9pZCBhcmNoX3ZjcHVfcmVnc19pbml0KHN0cnVjdCB2Y3B1ICp2KTsKIAorI2Rl
ZmluZSBhcmNoX25vdGlmeV9nZm4oZCwgZ2ZuKSAoZ2ZuX3ZhbGlkKGQsIGdmbikgPyAwIDogLUVB
RERSTk9UQVZBSUwpCisKIHN0cnVjdCB2Y3B1X2h2bV9jb250ZXh0OwogaW50IGFyY2hfc2V0X2lu
Zm9faHZtX2d1ZXN0KHN0cnVjdCB2Y3B1ICp2LCBjb25zdCBzdHJ1Y3QgdmNwdV9odm1fY29udGV4
dCAqY3R4KTsKIAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAorKysgYi94ZW4vaW5jbHVk
ZS94ZW4vaW9tbXUuaApAQCAtMjM3LDYgKzIzNywxMSBAQCBzdHJ1Y3QgaW9tbXVfb3BzIHsKICAg
ICBpbnQgX19tdXN0X2NoZWNrICgqbG9va3VwX3BhZ2UpKHN0cnVjdCBkb21haW4gKmQsIGRmbl90
IGRmbiwgbWZuX3QgKm1mbiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCAqZmxhZ3MpOwogCisjaWZuZGVmIENPTkZJR19JT01NVV9GT1JDRV9QVF9TSEFS
RQorICAgIHZvaWQgKCpzaGFyZV9wMm0pKHN0cnVjdCBkb21haW4gKmQpOworICAgIGludCBfX211
c3RfY2hlY2sgKCpub3RpZnlfZGZuKShzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBkZm4pOworI2Vu
ZGlmCisKICAgICB2b2lkICgqZnJlZV9wYWdlX3RhYmxlKShzdHJ1Y3QgcGFnZV9pbmZvICopOwog
CiAjaWZkZWYgQ09ORklHX1g4NgpAQCAtMjUzLDcgKzI1OCw2IEBAIHN0cnVjdCBpb21tdV9vcHMg
ewogCiAgICAgaW50IF9fbXVzdF9jaGVjayAoKnN1c3BlbmQpKHZvaWQpOwogICAgIHZvaWQgKCpy
ZXN1bWUpKHZvaWQpOwotICAgIHZvaWQgKCpzaGFyZV9wMm0pKHN0cnVjdCBkb21haW4gKmQpOwog
ICAgIHZvaWQgKCpjcmFzaF9zaHV0ZG93bikodm9pZCk7CiAgICAgaW50IF9fbXVzdF9jaGVjayAo
KmlvdGxiX2ZsdXNoKShzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBkZm4sCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcGFnZV9jb3VudCwKQEAgLTMzMCw3
ICszMzQsMTUgQEAgdm9pZCBpb21tdV9yZXN1bWUodm9pZCk7CiB2b2lkIGlvbW11X2NyYXNoX3No
dXRkb3duKHZvaWQpOwogaW50IGlvbW11X2dldF9yZXNlcnZlZF9kZXZpY2VfbWVtb3J5KGlvbW11
X2dyZG1fdCAqLCB2b2lkICopOwogCisjaWZuZGVmIENPTkZJR19JT01NVV9GT1JDRV9QVF9TSEFS
RQogdm9pZCBpb21tdV9zaGFyZV9wMm1fdGFibGUoc3RydWN0IGRvbWFpbiAqZCk7CitpbnQgX19t
dXN0X2NoZWNrIGlvbW11X25vdGlmeV9nZm4oc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuKTsK
KyNlbHNlCitzdGF0aWMgaW5saW5lIGludCBfX211c3RfY2hlY2sgaW9tbXVfbm90aWZ5X2dmbihz
dHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4pCit7CisgICAgcmV0dXJuIDA7Cit9CisjZW5kaWYK
IAogI2lmZGVmIENPTkZJR19IQVNfUENJCiBpbnQgaW9tbXVfZG9fcGNpX2RvbWN0bChzdHJ1Y3Qg
eGVuX2RvbWN0bCAqLCBzdHJ1Y3QgZG9tYWluICpkLAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2No
ZWQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaApAQCAtMTAzOSw2ICsxMDM5LDggQEAg
c3RhdGljIGFsd2F5c19pbmxpbmUgYm9vbCBpc19pb21tdV9lbmFibAogICAgIHJldHVybiBldmFs
dWF0ZV9ub3NwZWMoZC0+b3B0aW9ucyAmIFhFTl9ET01DVExfQ0RGX2lvbW11KTsKIH0KIAorI2Rl
ZmluZSBub3RpZnlfZ2ZuKGQsIGdmbikgKGFyY2hfbm90aWZ5X2dmbihkLCBnZm4pID86IGlvbW11
X25vdGlmeV9nZm4oZCwgZ2ZuKSkKKwogZXh0ZXJuIGJvb2wgc2NoZWRfc210X3Bvd2VyX3Nhdmlu
Z3M7CiBleHRlcm4gYm9vbCBzY2hlZF9kaXNhYmxlX3NtdF9zd2l0Y2hpbmc7CiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
