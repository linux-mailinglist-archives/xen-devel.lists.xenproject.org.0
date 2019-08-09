Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E9687D87
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:02:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6Mg-00081b-RN; Fri, 09 Aug 2019 14:59:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hw6M7-0006lz-Lx
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:58:59 +0000
X-Inumbo-ID: 34b81f4c-bab6-11e9-8314-cfb7583ac403
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34b81f4c-bab6-11e9-8314-cfb7583ac403;
 Fri, 09 Aug 2019 14:58:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0D1B4B0B3;
 Fri,  9 Aug 2019 14:58:54 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 16:58:30 +0200
Message-Id: <20190809145833.1020-46-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809145833.1020-1-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 45/48] xen/sched: support differing
 granularity in schedule_cpu_[add/rm]()
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBjb3JlIHNjaGVkdWxpbmcgYWN0aXZlIHNjaGVkdWxlX2NwdV9bYWRkL3JtXSgpIGhhcyB0
byBjb3BlIHdpdGgKZGlmZmVyZW50IHNjaGVkdWxpbmcgZ3JhbnVsYXJpdHk6IGEgY3B1IG5vdCBp
biBhbnkgY3B1cG9vbCBpcyBzdWJqZWN0CnRvIGdyYW51bGFyaXR5IDEgKGNwdSBzY2hlZHVsaW5n
KSwgd2hpbGUgYSBjcHUgaW4gYSBjcHVwb29sIG1pZ2h0IGJlCmluIGEgc2NoZWR1bGluZyByZXNv
dXJjZSB3aXRoIG1vcmUgdGhhbiBvbmUgY3B1LgoKSGFuZGxlIHRoYXQgYnkgaGF2aW5nIGFycmF5
cyBvZiBvbGQvbmV3IHBkYXRhIGFuZCB2ZGF0YSBhbmQgbG9vcCBvdmVyCnRob3NlIHdoZXJlIGFw
cHJvcHJpYXRlLgoKQWRkaXRpb25hbGx5IHRoZSBzY2hlZHVsaW5nIHJlc291cmNlKHMpIG11c3Qg
ZWl0aGVyIGJlIG1lcmdlZCBvcgpzcGxpdC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2NwdXBvb2wuYyAgfCAgMTggKystLQog
eGVuL2NvbW1vbi9zY2hlZHVsZS5jIHwgMjI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIwNCBpbnNlcnRpb25zKCsp
LCA0MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NwdXBvb2wuYyBiL3hl
bi9jb21tb24vY3B1cG9vbC5jCmluZGV4IDVkNWM4ZDU0MzAuLjQxZDU5NGRhY2UgMTAwNjQ0Ci0t
LSBhL3hlbi9jb21tb24vY3B1cG9vbC5jCisrKyBiL3hlbi9jb21tb24vY3B1cG9vbC5jCkBAIC01
MzUsNiArNTM1LDcgQEAgc3RhdGljIHZvaWQgY3B1cG9vbF9jcHVfcmVtb3ZlKHVuc2lnbmVkIGlu
dCBjcHUpCiAgICAgICAgIHJldCA9IGNwdXBvb2xfdW5hc3NpZ25fY3B1X2VwaWxvZ3VlKGNwdXBv
b2wwKTsKICAgICAgICAgQlVHX09OKHJldCk7CiAgICAgfQorICAgIGNwdW1hc2tfY2xlYXJfY3B1
KGNwdSwgJmNwdXBvb2xfZnJlZV9jcHVzKTsKIH0KIAogLyoKQEAgLTU4NCwyMCArNTg1LDE5IEBA
IHN0YXRpYyB2b2lkIGNwdXBvb2xfY3B1X3JlbW92ZV9mb3JjZWQodW5zaWduZWQgaW50IGNwdSkK
ICAgICBzdHJ1Y3QgY3B1cG9vbCAqKmM7CiAgICAgaW50IHJldDsKIAotICAgIGlmICggY3B1bWFz
a190ZXN0X2NwdShjcHUsICZjcHVwb29sX2ZyZWVfY3B1cykgKQotICAgICAgICBjcHVtYXNrX2Ns
ZWFyX2NwdShjcHUsICZjcHVwb29sX2ZyZWVfY3B1cyk7Ci0gICAgZWxzZQorICAgIGZvcl9lYWNo
X2NwdXBvb2wgKCBjICkKICAgICB7Ci0gICAgICAgIGZvcl9lYWNoX2NwdXBvb2woYykKKyAgICAg
ICAgaWYgKCBjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgKCpjKS0+Y3B1X3ZhbGlkKSApCiAgICAgICAg
IHsKLSAgICAgICAgICAgIGlmICggY3B1bWFza190ZXN0X2NwdShjcHUsICgqYyktPmNwdV92YWxp
ZCkgKQotICAgICAgICAgICAgewotICAgICAgICAgICAgICAgIHJldCA9IGNwdXBvb2xfdW5hc3Np
Z25fY3B1KCpjLCBjcHUpOwotICAgICAgICAgICAgICAgIEJVR19PTihyZXQpOwotICAgICAgICAg
ICAgfQorICAgICAgICAgICAgcmV0ID0gY3B1cG9vbF91bmFzc2lnbl9jcHVfcHJvbG9ndWUoKmMs
IGNwdSk7CisgICAgICAgICAgICBCVUdfT04ocmV0KTsKKyAgICAgICAgICAgIHJldCA9IGNwdXBv
b2xfdW5hc3NpZ25fY3B1X2VwaWxvZ3VlKCpjKTsKKyAgICAgICAgICAgIEJVR19PTihyZXQpOwog
ICAgICAgICB9CiAgICAgfQogCisgICAgY3B1bWFza19jbGVhcl9jcHUoY3B1LCAmY3B1cG9vbF9m
cmVlX2NwdXMpOworCiAgICAgcmN1X3JlYWRfbG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwogICAg
IHNjaGVkX3JtX2NwdShjcHUpOwogICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxv
Y2spOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jCmluZGV4IDk0OGZlMWI4MzguLmE0NTU1ZmQwZmEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21t
b24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAgLTQwNywyNiArNDA3
LDI5IEBAIHN0YXRpYyB2b2lkIHNjaGVkX3VuaXRfYWRkX3ZjcHUoc3RydWN0IHNjaGVkX3VuaXQg
KnVuaXQsIHN0cnVjdCB2Y3B1ICp2KQogICAgIHVuaXQtPnJ1bnN0YXRlX2NudFt2LT5ydW5zdGF0
ZS5zdGF0ZV0rKzsKIH0KIAotc3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hlZF9hbGxvY191
bml0KHN0cnVjdCB2Y3B1ICp2KQorc3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hlZF9hbGxv
Y191bml0X21lbSh2b2lkKQogewotICAgIHN0cnVjdCBzY2hlZF91bml0ICp1bml0LCAqKnByZXZf
dW5pdDsKLSAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwotICAgIHVuc2lnbmVkIGlu
dCBncmFuID0gZC0+Y3B1cG9vbCA/IGQtPmNwdXBvb2wtPmdyYW51bGFyaXR5IDogMTsKKyAgICBz
dHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdDsKIAotICAgIGZvcl9lYWNoX3NjaGVkX3VuaXQgKCBkLCB1
bml0ICkKLSAgICAgICAgaWYgKCB1bml0LT52Y3B1X2xpc3QtPnZjcHVfaWQgLyBncmFuID09IHYt
PnZjcHVfaWQgLyBncmFuICkKLSAgICAgICAgICAgIGJyZWFrOworICAgIHVuaXQgPSB4emFsbG9j
KHN0cnVjdCBzY2hlZF91bml0KTsKKyAgICBpZiAoICF1bml0ICkKKyAgICAgICAgcmV0dXJuIE5V
TEw7CiAKLSAgICBpZiAoIHVuaXQgKQorICAgIGlmICggIXphbGxvY19jcHVtYXNrX3ZhcigmdW5p
dC0+Y3B1X2hhcmRfYWZmaW5pdHkpIHx8CisgICAgICAgICAhemFsbG9jX2NwdW1hc2tfdmFyKCZ1
bml0LT5jcHVfaGFyZF9hZmZpbml0eV9zYXZlZCkgfHwKKyAgICAgICAgICF6YWxsb2NfY3B1bWFz
a192YXIoJnVuaXQtPmNwdV9zb2Z0X2FmZmluaXR5KSApCiAgICAgewotICAgICAgICBzY2hlZF91
bml0X2FkZF92Y3B1KHVuaXQsIHYpOwotICAgICAgICByZXR1cm4gdW5pdDsKKyAgICAgICAgc2No
ZWRfZnJlZV91bml0X21lbSh1bml0KTsKKyAgICAgICAgdW5pdCA9IE5VTEw7CiAgICAgfQogCi0g
ICAgaWYgKCAodW5pdCA9IHh6YWxsb2Moc3RydWN0IHNjaGVkX3VuaXQpKSA9PSBOVUxMICkKLSAg
ICAgICAgcmV0dXJuIE5VTEw7CisgICAgcmV0dXJuIHVuaXQ7Cit9CisKK3N0YXRpYyB2b2lkIHNj
aGVkX2RvbWFpbl9pbnNlcnRfdW5pdChzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwgc3RydWN0IGRv
bWFpbiAqZCkKK3sKKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqKnByZXZfdW5pdDsKIAotICAgIHNj
aGVkX3VuaXRfYWRkX3ZjcHUodW5pdCwgdik7CiAgICAgdW5pdC0+ZG9tYWluID0gZDsKIAogICAg
IGZvciAoIHByZXZfdW5pdCA9ICZkLT5zY2hlZF91bml0X2xpc3Q7ICpwcmV2X3VuaXQ7CkBAIC00
MzcsMTcgKzQ0MCwzMSBAQCBzdGF0aWMgc3RydWN0IHNjaGVkX3VuaXQgKnNjaGVkX2FsbG9jX3Vu
aXQoc3RydWN0IHZjcHUgKnYpCiAKICAgICB1bml0LT5uZXh0X2luX2xpc3QgPSAqcHJldl91bml0
OwogICAgICpwcmV2X3VuaXQgPSB1bml0OworfQogCi0gICAgaWYgKCAhemFsbG9jX2NwdW1hc2tf
dmFyKCZ1bml0LT5jcHVfaGFyZF9hZmZpbml0eSkgfHwKLSAgICAgICAgICF6YWxsb2NfY3B1bWFz
a192YXIoJnVuaXQtPmNwdV9oYXJkX2FmZmluaXR5X3NhdmVkKSB8fAotICAgICAgICAgIXphbGxv
Y19jcHVtYXNrX3ZhcigmdW5pdC0+Y3B1X3NvZnRfYWZmaW5pdHkpICkKLSAgICAgICAgZ290byBm
YWlsOworc3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hlZF9hbGxvY191bml0KHN0cnVjdCB2
Y3B1ICp2KQoreworICAgIHN0cnVjdCBzY2hlZF91bml0ICp1bml0OworICAgIHN0cnVjdCBkb21h
aW4gKmQgPSB2LT5kb21haW47CisgICAgdW5zaWduZWQgaW50IGdyYW4gPSBkLT5jcHVwb29sID8g
ZC0+Y3B1cG9vbC0+Z3JhbnVsYXJpdHkgOiAxOwogCi0gICAgcmV0dXJuIHVuaXQ7CisgICAgZm9y
X2VhY2hfc2NoZWRfdW5pdCAoIGQsIHVuaXQgKQorICAgICAgICBpZiAoIHVuaXQtPnZjcHVfbGlz
dC0+dmNwdV9pZCAvIGdyYW4gPT0gdi0+dmNwdV9pZCAvIGdyYW4gKQorICAgICAgICAgICAgYnJl
YWs7CiAKLSBmYWlsOgotICAgIHNjaGVkX2ZyZWVfdW5pdCh1bml0LCB2KTsKLSAgICByZXR1cm4g
TlVMTDsKKyAgICBpZiAoIHVuaXQgKQorICAgIHsKKyAgICAgICAgc2NoZWRfdW5pdF9hZGRfdmNw
dSh1bml0LCB2KTsKKyAgICAgICAgcmV0dXJuIHVuaXQ7CisgICAgfQorCisgICAgaWYgKCAodW5p
dCA9IHNjaGVkX2FsbG9jX3VuaXRfbWVtKCkpID09IE5VTEwgKQorICAgICAgICByZXR1cm4gTlVM
TDsKKworICAgIHNjaGVkX3VuaXRfYWRkX3ZjcHUodW5pdCwgdik7CisgICAgc2NoZWRfZG9tYWlu
X2luc2VydF91bml0KHVuaXQsIGQpOworCisgICAgcmV0dXJuIHVuaXQ7CiB9CiAKIHN0YXRpYyB1
bnNpZ25lZCBpbnQgc2NoZWRfc2VsZWN0X2luaXRpYWxfY3B1KGNvbnN0IHN0cnVjdCB2Y3B1ICp2
KQpAQCAtMjM3MCwxOCArMjM4NywyOCBAQCBzdGF0aWMgdm9pZCBwb2xsX3RpbWVyX2ZuKHZvaWQg
KmRhdGEpCiAgICAgICAgIHZjcHVfdW5ibG9jayh2KTsKIH0KIAotc3RhdGljIGludCBjcHVfc2No
ZWR1bGVfdXAodW5zaWduZWQgaW50IGNwdSkKK3N0YXRpYyBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2Ug
KnNjaGVkX2FsbG9jX3Jlcyh2b2lkKQogewogICAgIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc2Q7
CiAKICAgICBzZCA9IHh6YWxsb2Moc3RydWN0IHNjaGVkX3Jlc291cmNlKTsKICAgICBpZiAoIHNk
ID09IE5VTEwgKQotICAgICAgICByZXR1cm4gLUVOT01FTTsKKyAgICAgICAgcmV0dXJuIE5VTEw7
CiAgICAgaWYgKCAhemFsbG9jX2NwdW1hc2tfdmFyKCZzZC0+Y3B1cykgKQogICAgIHsKICAgICAg
ICAgeGZyZWUoc2QpOwotICAgICAgICByZXR1cm4gLUVOT01FTTsKKyAgICAgICAgcmV0dXJuIE5V
TEw7CiAgICAgfQorICAgIHJldHVybiBzZDsKK30KKworc3RhdGljIGludCBjcHVfc2NoZWR1bGVf
dXAodW5zaWduZWQgaW50IGNwdSkKK3sKKyAgICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNkOwor
CisgICAgc2QgPSBzY2hlZF9hbGxvY19yZXMoKTsKKyAgICBpZiAoIHNkID09IE5VTEwgKQorICAg
ICAgICByZXR1cm4gLUVOT01FTTsKIAogICAgIHNkLT5wcm9jZXNzb3IgPSBjcHU7CiAgICAgY3B1
bWFza19jb3B5KHNkLT5jcHVzLCBjcHVtYXNrX29mKGNwdSkpOwpAQCAtMjQzMSw2ICsyNDU4LDgg
QEAgc3RhdGljIHZvaWQgc2NoZWRfcmVzX2ZyZWUoc3RydWN0IHJjdV9oZWFkICpoZWFkKQogICAg
IHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc2QgPSBjb250YWluZXJfb2YoaGVhZCwgc3RydWN0IHNj
aGVkX3Jlc291cmNlLCByY3UpOwogCiAgICAgZnJlZV9jcHVtYXNrX3ZhcihzZC0+Y3B1cyk7Cisg
ICAgaWYgKCBzZC0+c2NoZWRfdW5pdF9pZGxlICkKKyAgICAgICAgc2NoZWRfZnJlZV91bml0X21l
bShzZC0+c2NoZWRfdW5pdF9pZGxlKTsKICAgICB4ZnJlZShzZCk7CiB9CiAKQEAgLTI0NDUsNiAr
MjQ3NCw4IEBAIHN0YXRpYyB2b2lkIGNwdV9zY2hlZHVsZV9kb3duKHVuc2lnbmVkIGludCBjcHUp
CiAgICAga2lsbF90aW1lcigmc2QtPnNfdGltZXIpOwogCiAgICAgc2V0X3NjaGVkX3JlcyhjcHUs
IE5VTEwpOworICAgIC8qIEtlZXAgaWRsZSB1bml0LiAqLworICAgIHNkLT5zY2hlZF91bml0X2lk
bGUgPSBOVUxMOwogICAgIGNhbGxfcmN1KCZzZC0+cmN1LCBzY2hlZF9yZXNfZnJlZSk7CiAKICAg
ICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKQEAgLTI1MjQsNiArMjU1NSwz
MCBAQCBzdGF0aWMgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIGNwdV9zY2hlZHVsZV9uZmIgPSB7CiAg
ICAgLm5vdGlmaWVyX2NhbGwgPSBjcHVfc2NoZWR1bGVfY2FsbGJhY2sKIH07CiAKK3N0YXRpYyBj
b25zdCBjcHVtYXNrX3QgKnNjaGVkX2dldF9vcHRfY3B1bWFzayhlbnVtIHNjaGVkX2dyYW4gb3B0
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBjcHUpCit7CisgICAgY29uc3QgY3B1bWFza190ICptYXNrOworCisgICAgc3dpdGNoICgg
b3B0ICkKKyAgICB7CisgICAgY2FzZSBTQ0hFRF9HUkFOX2NwdToKKyAgICAgICAgbWFzayA9IGNw
dW1hc2tfb2YoY3B1KTsKKyAgICAgICAgYnJlYWs7CisgICAgY2FzZSBTQ0hFRF9HUkFOX2NvcmU6
CisgICAgICAgIG1hc2sgPSBwZXJfY3B1KGNwdV9zaWJsaW5nX21hc2ssIGNwdSk7CisgICAgICAg
IGJyZWFrOworICAgIGNhc2UgU0NIRURfR1JBTl9zb2NrZXQ6CisgICAgICAgIG1hc2sgPSBwZXJf
Y3B1KGNwdV9jb3JlX21hc2ssIGNwdSk7CisgICAgICAgIGJyZWFrOworICAgIGRlZmF1bHQ6Cisg
ICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOworICAgICAgICByZXR1cm4gTlVMTDsKKyAgICB9
CisKKyAgICByZXR1cm4gbWFzazsKK30KKwogLyogSW5pdGlhbGlzZSB0aGUgZGF0YSBzdHJ1Y3R1
cmVzLiAqLwogdm9pZCBfX2luaXQgc2NoZWR1bGVyX2luaXQodm9pZCkKIHsKQEAgLTI2ODIsNiAr
MjczNyw0NiBAQCBpbnQgc2NoZWR1bGVfY3B1X2FkZCh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1Y3Qg
Y3B1cG9vbCAqYykKICAgICAgKi8KICAgICBvbGRfbG9jayA9IHBjcHVfc2NoZWR1bGVfbG9ja19p
cnFzYXZlKGNwdSwgJmZsYWdzKTsKIAorICAgIGlmICggYy0+Z3JhbnVsYXJpdHkgPiAxICkKKyAg
ICB7CisgICAgICAgIGNvbnN0IGNwdW1hc2tfdCAqbWFzazsKKyAgICAgICAgdW5zaWduZWQgaW50
IGNwdV9pdGVyLCBpZHggPSAwOworICAgICAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqb2xkX3VuaXQs
ICptYXN0ZXJfdW5pdDsKKyAgICAgICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpzZF9vbGQ7CisK
KyAgICAgICAgLyoKKyAgICAgICAgICogV2UgbmVlZCB0byBtZXJnZSBtdWx0aXBsZSBpZGxlX3Zj
cHUgdW5pdHMgYW5kIHNjaGVkX3Jlc291cmNlIHN0cnVjdHMKKyAgICAgICAgICogaW50byBvbmUu
IEFzIHRoZSBmcmVlIGNwdXMgYWxsIHNoYXJlIHRoZSBzYW1lIGxvY2sgd2UgYXJlIGZpbmUgZG9p
bmcKKyAgICAgICAgICogdGhhdCBub3cuIFRoZSB3b3JzdCB3aGljaCBjb3VsZCBoYXBwZW4gd291
bGQgYmUgc29tZW9uZSB3YWl0aW5nIGZvcgorICAgICAgICAgKiB0aGUgbG9jaywgdGh1cyBkZXJl
ZmVyZW5jaW5nIHNjaGVkX3Jlcy0+c2NoZWR1bGVfbG9jay4gVGhpcyBpcyB0aGUKKyAgICAgICAg
ICogcmVhc29uIHdlIGFyZSBmcmVlaW5nIHN0cnVjdCBzY2hlZF9yZXMgdmlhIGNhbGxfcmN1KCkg
dG8gYXZvaWQgdGhlCisgICAgICAgICAqIGxvY2sgcG9pbnRlciBzdWRkZW5seSBkaXNhcHBlYXJp
bmcuCisgICAgICAgICAqLworICAgICAgICBtYXNrID0gc2NoZWRfZ2V0X29wdF9jcHVtYXNrKGMt
Pm9wdF9ncmFudWxhcml0eSwgY3B1KTsKKyAgICAgICAgbWFzdGVyX3VuaXQgPSBpZGxlX3ZjcHVb
Y3B1XS0+c2NoZWRfdW5pdDsKKworICAgICAgICBmb3JfZWFjaF9jcHUgKCBjcHVfaXRlciwgbWFz
ayApCisgICAgICAgIHsKKyAgICAgICAgICAgIGlmICggaWR4ICkKKyAgICAgICAgICAgICAgICBj
cHVtYXNrX2NsZWFyX2NwdShjcHVfaXRlciwgc2NoZWRfcmVzX21hc2spOworCisgICAgICAgICAg
ICBwZXJfY3B1KHNjaGVkX3Jlc19pZHgsIGNwdV9pdGVyKSA9IGlkeCsrOworCisgICAgICAgICAg
ICBpZiAoIGNwdSA9PSBjcHVfaXRlciApCisgICAgICAgICAgICAgICAgY29udGludWU7CisKKyAg
ICAgICAgICAgIG9sZF91bml0ID0gaWRsZV92Y3B1W2NwdV9pdGVyXS0+c2NoZWRfdW5pdDsKKyAg
ICAgICAgICAgIHNkX29sZCA9IGdldF9zY2hlZF9yZXMoY3B1X2l0ZXIpOworICAgICAgICAgICAg
a2lsbF90aW1lcigmc2Rfb2xkLT5zX3RpbWVyKTsKKyAgICAgICAgICAgIGlkbGVfdmNwdVtjcHVf
aXRlcl0tPnNjaGVkX3VuaXQgPSBtYXN0ZXJfdW5pdDsKKyAgICAgICAgICAgIG1hc3Rlcl91bml0
LT5ydW5zdGF0ZV9jbnRbUlVOU1RBVEVfcnVubmluZ10rKzsKKyAgICAgICAgICAgIHNldF9zY2hl
ZF9yZXMoY3B1X2l0ZXIsIHNkKTsKKyAgICAgICAgICAgIGNwdW1hc2tfc2V0X2NwdShjcHVfaXRl
ciwgc2QtPmNwdXMpOworCisgICAgICAgICAgICBjYWxsX3JjdSgmc2Rfb2xkLT5yY3UsIHNjaGVk
X3Jlc19mcmVlKTsKKyAgICAgICAgfQorICAgIH0KKwogICAgIG5ld19sb2NrID0gc2NoZWRfc3dp
dGNoX3NjaGVkKG5ld19vcHMsIGNwdSwgcHByaXYsIHZwcml2KTsKIAogICAgIHNkLT5zY2hlZHVs
ZXIgPSBuZXdfb3BzOwpAQCAtMjcxOSwzMyArMjgxNCwxMDAgQEAgb3V0OgogICovCiBpbnQgc2No
ZWR1bGVfY3B1X3JtKHVuc2lnbmVkIGludCBjcHUpCiB7Ci0gICAgc3RydWN0IHZjcHUgKmlkbGU7
CiAgICAgdm9pZCAqcHByaXZfb2xkLCAqdnByaXZfb2xkOwotICAgIHN0cnVjdCBzY2hlZF9yZXNv
dXJjZSAqc2Q7CisgICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpzZCwgKipzZF9uZXcgPSBOVUxM
OworICAgIHN0cnVjdCBzY2hlZF91bml0ICp1bml0OwogICAgIHN0cnVjdCBzY2hlZHVsZXIgKm9s
ZF9vcHM7CiAgICAgc3BpbmxvY2tfdCAqb2xkX2xvY2s7CiAgICAgdW5zaWduZWQgbG9uZyBmbGFn
czsKKyAgICBpbnQgaWR4LCByZXQgPSAtRU5PTUVNOworICAgIHVuc2lnbmVkIGludCBjcHVfaXRl
cjsKIAogICAgIHJjdV9yZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKIAogICAgIHNkID0g
Z2V0X3NjaGVkX3JlcyhjcHUpOwogICAgIG9sZF9vcHMgPSBzZC0+c2NoZWR1bGVyOwogCisgICAg
aWYgKCBzZC0+Z3JhbnVsYXJpdHkgPiAxICkKKyAgICB7CisgICAgICAgIHNkX25ldyA9IHhtYWxs
b2NfYXJyYXkoc3RydWN0IHNjaGVkX3Jlc291cmNlICosIHNkLT5ncmFudWxhcml0eSAtIDEpOwor
ICAgICAgICBpZiAoICFzZF9uZXcgKQorICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAgIGZv
ciAoIGlkeCA9IDA7IGlkeCA8IHNkLT5ncmFudWxhcml0eSAtIDE7IGlkeCsrICkKKyAgICAgICAg
eworICAgICAgICAgICAgc2RfbmV3W2lkeF0gPSBzY2hlZF9hbGxvY19yZXMoKTsKKyAgICAgICAg
ICAgIGlmICggc2RfbmV3W2lkeF0gKQorICAgICAgICAgICAgeworICAgICAgICAgICAgICAgIHNk
X25ld1tpZHhdLT5zY2hlZF91bml0X2lkbGUgPSBzY2hlZF9hbGxvY191bml0X21lbSgpOworICAg
ICAgICAgICAgICAgIGlmICggIXNkX25ld1tpZHhdLT5zY2hlZF91bml0X2lkbGUgKQorICAgICAg
ICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICAgICAgc2NoZWRfcmVzX2ZyZWUoJnNkX25ld1tp
ZHhdLT5yY3UpOworICAgICAgICAgICAgICAgICAgICBzZF9uZXdbaWR4XSA9IE5VTEw7CisgICAg
ICAgICAgICAgICAgfQorICAgICAgICAgICAgfQorICAgICAgICAgICAgaWYgKCAhc2RfbmV3W2lk
eF0gKQorICAgICAgICAgICAgeworICAgICAgICAgICAgICAgIGZvciAoIGlkeC0tOyBpZHggPj0g
MDsgaWR4LS0gKQorICAgICAgICAgICAgICAgICAgICBzY2hlZF9yZXNfZnJlZSgmc2RfbmV3W2lk
eF0tPnJjdSk7CisgICAgICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAgICAgICB9CisgICAg
ICAgICAgICBzZF9uZXdbaWR4XS0+Y3VyciA9IHNkX25ld1tpZHhdLT5zY2hlZF91bml0X2lkbGU7
CisgICAgICAgICAgICBzZF9uZXdbaWR4XS0+c2NoZWR1bGVyID0gJnNjaGVkX2lkbGVfb3BzOwor
ICAgICAgICAgICAgc2RfbmV3W2lkeF0tPmdyYW51bGFyaXR5ID0gMTsKKworICAgICAgICAgICAg
LyogV2Ugd2FudCB0aGUgbG9jayBub3QgdG8gY2hhbmdlIHdoZW4gcmVwbGFjaW5nIHRoZSByZXNv
dXJjZS4gKi8KKyAgICAgICAgICAgIHNkX25ld1tpZHhdLT5zY2hlZHVsZV9sb2NrID0gc2QtPnNj
aGVkdWxlX2xvY2s7CisgICAgICAgIH0KKyAgICB9CisKKyAgICByZXQgPSAwOwogICAgIEFTU0VS
VChzZC0+Y3B1cG9vbCAhPSBOVUxMKTsKICAgICBBU1NFUlQoY3B1bWFza190ZXN0X2NwdShjcHUs
ICZjcHVwb29sX2ZyZWVfY3B1cykpOwogICAgIEFTU0VSVCghY3B1bWFza190ZXN0X2NwdShjcHUs
IHNkLT5jcHVwb29sLT5jcHVfdmFsaWQpKTsKIAotICAgIGlkbGUgPSBpZGxlX3ZjcHVbY3B1XTsK
LQogICAgIHNjaGVkX2RvX3RpY2tfc3VzcGVuZChvbGRfb3BzLCBjcHUpOwogCiAgICAgLyogU2Vl
IGNvbW1lbnQgaW4gc2NoZWR1bGVfY3B1X2FkZCgpIHJlZ2FyZGluZyBsb2NrIHN3aXRjaGluZy4g
Ki8KICAgICBvbGRfbG9jayA9IHBjcHVfc2NoZWR1bGVfbG9ja19pcnFzYXZlKGNwdSwgJmZsYWdz
KTsKIAotICAgIHZwcml2X29sZCA9IGlkbGUtPnNjaGVkX3VuaXQtPnByaXY7CisgICAgdnByaXZf
b2xkID0gaWRsZV92Y3B1W2NwdV0tPnNjaGVkX3VuaXQtPnByaXY7CiAgICAgcHByaXZfb2xkID0g
c2QtPnNjaGVkX3ByaXY7CiAKLSAgICBpZGxlLT5zY2hlZF91bml0LT5wcml2ID0gTlVMTDsKKyAg
ICBpZHggPSAwOworICAgIGZvcl9lYWNoX2NwdSAoIGNwdV9pdGVyLCBzZC0+Y3B1cyApCisgICAg
eworICAgICAgICBwZXJfY3B1KHNjaGVkX3Jlc19pZHgsIGNwdV9pdGVyKSA9IDA7CisgICAgICAg
IGlmICggY3B1X2l0ZXIgPT0gY3B1ICkKKyAgICAgICAgeworICAgICAgICAgICAgaWRsZV92Y3B1
W2NwdV9pdGVyXS0+c2NoZWRfdW5pdC0+cHJpdiA9IE5VTEw7CisgICAgICAgIH0KKyAgICAgICAg
ZWxzZQorICAgICAgICB7CisgICAgICAgICAgICAvKiBJbml0aWFsaXplIHVuaXQuICovCisgICAg
ICAgICAgICB1bml0ID0gc2RfbmV3W2lkeF0tPnNjaGVkX3VuaXRfaWRsZTsKKyAgICAgICAgICAg
IHVuaXQtPnJlcyA9IHNkX25ld1tpZHhdOworICAgICAgICAgICAgdW5pdC0+aXNfcnVubmluZyA9
IHRydWU7CisgICAgICAgICAgICBzY2hlZF91bml0X2FkZF92Y3B1KHVuaXQsIGlkbGVfdmNwdVtj
cHVfaXRlcl0pOworICAgICAgICAgICAgc2NoZWRfZG9tYWluX2luc2VydF91bml0KHVuaXQsIGlk
bGVfdmNwdVtjcHVfaXRlcl0tPmRvbWFpbik7CisKKyAgICAgICAgICAgIC8qIEFkanVzdCBjcHUg
bWFza3Mgb2YgcmVzb3VyY2VzIChvbGQgYW5kIG5ldykuICovCisgICAgICAgICAgICBjcHVtYXNr
X2NsZWFyX2NwdShjcHVfaXRlciwgc2QtPmNwdXMpOworICAgICAgICAgICAgY3B1bWFza19zZXRf
Y3B1KGNwdV9pdGVyLCBzZF9uZXdbaWR4XS0+Y3B1cyk7CisKKyAgICAgICAgICAgIC8qIEluaXQg
dGltZXIuICovCisgICAgICAgICAgICBpbml0X3RpbWVyKCZzZF9uZXdbaWR4XS0+c190aW1lciwg
c190aW1lcl9mbiwgTlVMTCwgY3B1X2l0ZXIpOworCisgICAgICAgICAgICAvKiBMYXN0IHJlc291
cmNlIGluaXRpYWxpemF0aW9ucyBhbmQgaW5zZXJ0IHJlc291cmNlIHBvaW50ZXIuICovCisgICAg
ICAgICAgICBzZF9uZXdbaWR4XS0+cHJvY2Vzc29yID0gY3B1X2l0ZXI7CisgICAgICAgICAgICBz
ZXRfc2NoZWRfcmVzKGNwdV9pdGVyLCBzZF9uZXdbaWR4XSk7CisKKyAgICAgICAgICAgIC8qIExh
c3QgYWN0aW9uOiBzZXQgdGhlIG5ldyBsb2NrIHBvaW50ZXIuICovCisgICAgICAgICAgICBzbXBf
bWIoKTsKKyAgICAgICAgICAgIHNkX25ld1tpZHhdLT5zY2hlZHVsZV9sb2NrID0gJnNjaGVkX2Zy
ZWVfY3B1X2xvY2s7CisKKyAgICAgICAgICAgIGlkeCsrOworICAgICAgICB9CisgICAgfQogICAg
IHNkLT5zY2hlZHVsZXIgPSAmc2NoZWRfaWRsZV9vcHM7CiAgICAgc2QtPnNjaGVkX3ByaXYgPSBO
VUxMOwogCkBAIC0yNzYzLDkgKzI5MjUsMTEgQEAgaW50IHNjaGVkdWxlX2NwdV9ybSh1bnNpZ25l
ZCBpbnQgY3B1KQogICAgIHNkLT5ncmFudWxhcml0eSA9IDE7CiAgICAgc2QtPmNwdXBvb2wgPSBO
VUxMOwogCitvdXQ6CiAgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7Cisg
ICAgeGZyZWUoc2RfbmV3KTsKIAotICAgIHJldHVybiAwOworICAgIHJldHVybiByZXQ7CiB9CiAK
IHN0cnVjdCBzY2hlZHVsZXIgKnNjaGVkdWxlcl9nZXRfZGVmYXVsdCh2b2lkKQotLSAKMi4xNi40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
