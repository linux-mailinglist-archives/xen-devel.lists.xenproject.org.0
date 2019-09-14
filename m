Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D71B2AC1
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 10:58:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i93pd-00027b-BE; Sat, 14 Sep 2019 08:55:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i93pa-00024P-OZ
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 08:54:58 +0000
X-Inumbo-ID: 12e1c2d2-d6cd-11e9-95c1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12e1c2d2-d6cd-11e9-95c1-12813bfff9fa;
 Sat, 14 Sep 2019 08:53:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 21B99B67D;
 Sat, 14 Sep 2019 08:53:08 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 14 Sep 2019 10:52:46 +0200
Message-Id: <20190914085251.18816-43-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190914085251.18816-1-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v3 42/47] xen/sched: protect scheduling resource
 via rcu
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgdG8gYmUgYWJsZSB0byBtb3ZlIGNwdXMgdG8gY3B1cG9vbHMgd2l0aCBjb3JlIHNj
aGVkdWxpbmcKYWN0aXZlIGl0IGlzIG1hbmRhdG9yeSB0byBtZXJnZSBtdWx0aXBsZSBjcHVzIGlu
dG8gb25lIHNjaGVkdWxpbmcKcmVzb3VyY2Ugb3IgdG8gc3BsaXQgYSBzY2hlZHVsaW5nIHJlc291
cmNlIHdpdGggbXVsdGlwbGUgY3B1cyBpbiBpdAppbnRvIG11bHRpcGxlIHNjaGVkdWxpbmcgcmVz
b3VyY2VzLiBUaGlzIGluIHR1cm4gcmVxdWlyZXMgdG8gbW9kaWZ5CnRoZSBjcHUgPC0+IHNjaGVk
dWxpbmcgcmVzb3VyY2UgcmVsYXRpb24uIEluIG9yZGVyIHRvIGJlIGFibGUgdG8gZnJlZQp1bnVz
ZWQgcmVzb3VyY2VzIHByb3RlY3Qgc3RydWN0IHNjaGVkX3Jlc291cmNlIHZpYSBSQ1UuIFRoaXMg
ZW5zdXJlcwp0aGVyZSBhcmUgbm8gdXNlcnMgbGVmdCB3aGVuIGZyZWVpbmcgc3VjaCBhIHJlc291
cmNlLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0K
VjE6IG5ldyBwYXRjaAotLS0KIHhlbi9jb21tb24vY3B1cG9vbC5jICAgICAgIHwgICA0ICsKIHhl
bi9jb21tb24vc2NoZWR1bGUuYyAgICAgIHwgMTg3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmggfCAgIDcgKy0K
IDMgZmlsZXMgY2hhbmdlZCwgMTc4IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vY3B1cG9vbC5jIGIveGVuL2NvbW1vbi9jcHVwb29sLmMKaW5k
ZXggYzNjMTEwOWJlOS4uZjUzY2VlYzNhYiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9jcHVwb29s
LmMKKysrIGIveGVuL2NvbW1vbi9jcHVwb29sLmMKQEAgLTUwNiw4ICs1MDYsMTAgQEAgc3RhdGlj
IGludCBjcHVwb29sX2NwdV9hZGQodW5zaWduZWQgaW50IGNwdSkKICAgICAgKiAob3IgdW5wbHVn
Z2luZyB3b3VsZCBoYXZlIGZhaWxlZCkgYW5kIHRoYXQgaXMgdGhlIGRlZmF1bHQgYmVoYXZpb3IK
ICAgICAgKiBhbnl3YXkuCiAgICAgICovCisgICAgcmN1X3JlYWRfbG9jaygmc2NoZWRfcmVzX3Jj
dWxvY2spOwogICAgIGdldF9zY2hlZF9yZXMoY3B1KS0+Y3B1cG9vbCA9IE5VTEw7CiAgICAgcmV0
ID0gY3B1cG9vbF9hc3NpZ25fY3B1X2xvY2tlZChjcHVwb29sMCwgY3B1KTsKKyAgICByY3VfcmVh
ZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKIAogICAgIHNwaW5fdW5sb2NrKCZjcHVwb29s
X2xvY2spOwogCkBAIC01OTIsNyArNTk0LDkgQEAgc3RhdGljIHZvaWQgY3B1cG9vbF9jcHVfcmVt
b3ZlX2ZvcmNlZCh1bnNpZ25lZCBpbnQgY3B1KQogICAgICAgICB9CiAgICAgfQogCisgICAgcmN1
X3JlYWRfbG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwogICAgIHNjaGVkX3JtX2NwdShjcHUpOwor
ICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwogfQogCiAvKgpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4
IDg2ZGRjYTgzZTkuLmMyZTVhOTIyMGQgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUu
YworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAgLTczLDYgKzczLDcgQEAgc3RhdGljIHZv
aWQgcG9sbF90aW1lcl9mbih2b2lkICpkYXRhKTsKIC8qIFRoaXMgaXMgZ2xvYmFsIGZvciBub3cg
c28gdGhhdCBwcml2YXRlIGltcGxlbWVudGF0aW9ucyBjYW4gcmVhY2ggaXQgKi8KIERFRklORV9Q
RVJfQ1BVX1JFQURfTU9TVExZKHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqLCBzY2hlZF9yZXMpOwog
c3RhdGljIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVuc2lnbmVkIGludCwgc2NoZWRfcmVz
X2lkeCk7CitERUZJTkVfUkNVX1JFQURfTE9DSyhzY2hlZF9yZXNfcmN1bG9jayk7CiAKIC8qIFNj
cmF0Y2ggc3BhY2UgZm9yIGNwdW1hc2tzLiAqLwogREVGSU5FX1BFUl9DUFUoY3B1bWFza190LCBj
cHVtYXNrX3NjcmF0Y2gpOwpAQCAtMjg2LDEwICsyODcsMTIgQEAgdm9pZCBzY2hlZF9ndWVzdF9p
ZGxlKHZvaWQgKCppZGxlKSAodm9pZCksIHVuc2lnbmVkIGludCBjcHUpCiAKIHZvaWQgdmNwdV9y
dW5zdGF0ZV9nZXQoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gKnJ1
bnN0YXRlKQogewotICAgIHNwaW5sb2NrX3QgKmxvY2sgPSBsaWtlbHkodiA9PSBjdXJyZW50KQot
ICAgICAgICAgICAgICAgICAgICAgICA/IE5VTEwgOiB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHYt
PnNjaGVkX3VuaXQpOworICAgIHNwaW5sb2NrX3QgKmxvY2s7CiAgICAgc190aW1lX3QgZGVsdGE7
CiAKKyAgICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisKKyAgICBsb2NrID0g
bGlrZWx5KHYgPT0gY3VycmVudCkgPyBOVUxMIDogdW5pdF9zY2hlZHVsZV9sb2NrX2lycSh2LT5z
Y2hlZF91bml0KTsKICAgICBtZW1jcHkocnVuc3RhdGUsICZ2LT5ydW5zdGF0ZSwgc2l6ZW9mKCpy
dW5zdGF0ZSkpOwogICAgIGRlbHRhID0gTk9XKCkgLSBydW5zdGF0ZS0+c3RhdGVfZW50cnlfdGlt
ZTsKICAgICBpZiAoIGRlbHRhID4gMCApCkBAIC0yOTcsNiArMzAwLDggQEAgdm9pZCB2Y3B1X3J1
bnN0YXRlX2dldChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqcnVu
c3RhdGUpCiAKICAgICBpZiAoIHVubGlrZWx5KGxvY2sgIT0gTlVMTCkgKQogICAgICAgICB1bml0
X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdi0+c2NoZWRfdW5pdCk7CisKKyAgICByY3VfcmVh
ZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKIH0KIAogdWludDY0X3QgZ2V0X2NwdV9pZGxl
X3RpbWUodW5zaWduZWQgaW50IGNwdSkKQEAgLTUwMSw2ICs1MDYsOCBAQCBpbnQgc2NoZWRfaW5p
dF92Y3B1KHN0cnVjdCB2Y3B1ICp2KQogICAgICAgICByZXR1cm4gMDsKICAgICB9CiAKKyAgICBy
Y3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisKICAgICAvKiBUaGUgZmlyc3QgdmNw
dSBvZiBhbiB1bml0IGNhbiBiZSBzZXQgdmlhIHNjaGVkX3NldF9yZXMoKS4gKi8KICAgICBzY2hl
ZF9zZXRfcmVzKHVuaXQsIGdldF9zY2hlZF9yZXMocHJvY2Vzc29yKSk7CiAKQEAgLTUwOCw2ICs1
MTUsNyBAQCBpbnQgc2NoZWRfaW5pdF92Y3B1KHN0cnVjdCB2Y3B1ICp2KQogICAgIGlmICggdW5p
dC0+cHJpdiA9PSBOVUxMICkKICAgICB7CiAgICAgICAgIHNjaGVkX2ZyZWVfdW5pdCh1bml0LCB2
KTsKKyAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CiAgICAgICAg
IHJldHVybiAxOwogICAgIH0KIApAQCAtNTM0LDYgKzU0Miw4IEBAIGludCBzY2hlZF9pbml0X3Zj
cHUoc3RydWN0IHZjcHUgKnYpCiAgICAgICAgIHNjaGVkX2luc2VydF91bml0KGRvbV9zY2hlZHVs
ZXIoZCksIHVuaXQpOwogICAgIH0KIAorICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3Jj
dWxvY2spOworCiAgICAgcmV0dXJuIDA7CiB9CiAKQEAgLTU2MSw2ICs1NzEsNyBAQCBpbnQgc2No
ZWRfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpCiAgICAg
dm9pZCAqdW5pdGRhdGE7CiAgICAgc3RydWN0IHNjaGVkdWxlciAqb2xkX29wczsKICAgICB2b2lk
ICpvbGRfZG9tZGF0YTsKKyAgICBpbnQgcmV0ID0gMDsKIAogICAgIGZvcl9lYWNoX3ZjcHUgKCBk
LCB2ICkKICAgICB7CkBAIC01NjgsMTYgKzU3OSwyMiBAQCBpbnQgc2NoZWRfbW92ZV9kb21haW4o
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpCiAgICAgICAgICAgICByZXR1cm4g
LUVCVVNZOwogICAgIH0KIAorICAgIHJjdV9yZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsK
KwogICAgIGRvbWRhdGEgPSBzY2hlZF9hbGxvY19kb21kYXRhKGMtPnNjaGVkLCBkKTsKICAgICBp
ZiAoIElTX0VSUihkb21kYXRhKSApCi0gICAgICAgIHJldHVybiBQVFJfRVJSKGRvbWRhdGEpOwor
ICAgIHsKKyAgICAgICAgcmV0ID0gUFRSX0VSUihkb21kYXRhKTsKKyAgICAgICAgZ290byBvdXQ7
CisgICAgfQogCiAgICAgdW5pdF9wcml2ID0geHphbGxvY19hcnJheSh2b2lkICosCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBESVZfUk9VTkRfVVAoZC0+bWF4X3ZjcHVzLCBjLT5ncmFu
dWxhcml0eSkpOwogICAgIGlmICggdW5pdF9wcml2ID09IE5VTEwgKQogICAgIHsKICAgICAgICAg
c2NoZWRfZnJlZV9kb21kYXRhKGMtPnNjaGVkLCBkb21kYXRhKTsKLSAgICAgICAgcmV0dXJuIC1F
Tk9NRU07CisgICAgICAgIHJldCA9IC1FTk9NRU07CisgICAgICAgIGdvdG8gb3V0OwogICAgIH0K
IAogICAgIHVuaXRfaWR4ID0gMDsKQEAgLTU5MCw3ICs2MDcsOCBAQCBpbnQgc2NoZWRfbW92ZV9k
b21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpCiAgICAgICAgICAgICAg
ICAgc2NoZWRfZnJlZV92ZGF0YShjLT5zY2hlZCwgdW5pdF9wcml2W3VuaXRfaWR4XSk7CiAgICAg
ICAgICAgICB4ZnJlZSh1bml0X3ByaXYpOwogICAgICAgICAgICAgc2NoZWRfZnJlZV9kb21kYXRh
KGMtPnNjaGVkLCBkb21kYXRhKTsKLSAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOworICAgICAg
ICAgICAgcmV0ID0gLUVOT01FTTsKKyAgICAgICAgICAgIGdvdG8gb3V0OwogICAgICAgICB9CiAg
ICAgICAgIHVuaXRfaWR4Kys7CiAgICAgfQpAQCAtNjU2LDcgKzY3NCwxMCBAQCBpbnQgc2NoZWRf
bW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpCiAKICAgICB4
ZnJlZSh1bml0X3ByaXYpOwogCi0gICAgcmV0dXJuIDA7CitvdXQ6CisgICAgcmN1X3JlYWRfdW5s
b2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisKKyAgICByZXR1cm4gcmV0OwogfQogCiB2b2lkIHNj
aGVkX2Rlc3Ryb3lfdmNwdShzdHJ1Y3QgdmNwdSAqdikKQEAgLTY3NCw5ICs2OTUsMTMgQEAgdm9p
ZCBzY2hlZF9kZXN0cm95X3ZjcHUoc3RydWN0IHZjcHUgKnYpCiAgICAgICovCiAgICAgaWYgKCB1
bml0LT52Y3B1X2xpc3QgPT0gdiApCiAgICAgeworICAgICAgICByY3VfcmVhZF9sb2NrKCZzY2hl
ZF9yZXNfcmN1bG9jayk7CisKICAgICAgICAgc2NoZWRfcmVtb3ZlX3VuaXQodmNwdV9zY2hlZHVs
ZXIodiksIHVuaXQpOwogICAgICAgICBzY2hlZF9mcmVlX3ZkYXRhKHZjcHVfc2NoZWR1bGVyKHYp
LCB1bml0LT5wcml2KTsKICAgICAgICAgc2NoZWRfZnJlZV91bml0KHVuaXQsIHYpOworCisgICAg
ICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwogICAgIH0KIH0KIApAQCAt
Njk0LDcgKzcxOSwxMiBAQCBpbnQgc2NoZWRfaW5pdF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwg
aW50IHBvb2xpZCkKICAgICBTQ0hFRF9TVEFUX0NSQU5LKGRvbV9pbml0KTsKICAgICBUUkFDRV8x
RChUUkNfU0NIRURfRE9NX0FERCwgZC0+ZG9tYWluX2lkKTsKIAorICAgIHJjdV9yZWFkX2xvY2so
JnNjaGVkX3Jlc19yY3Vsb2NrKTsKKwogICAgIHNkb20gPSBzY2hlZF9hbGxvY19kb21kYXRhKGRv
bV9zY2hlZHVsZXIoZCksIGQpOworCisgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1
bG9jayk7CisKICAgICBpZiAoIElTX0VSUihzZG9tKSApCiAgICAgICAgIHJldHVybiBQVFJfRVJS
KHNkb20pOwogCkBAIC03MTIsOSArNzQyLDEzIEBAIHZvaWQgc2NoZWRfZGVzdHJveV9kb21haW4o
c3RydWN0IGRvbWFpbiAqZCkKICAgICAgICAgU0NIRURfU1RBVF9DUkFOSyhkb21fZGVzdHJveSk7
CiAgICAgICAgIFRSQUNFXzFEKFRSQ19TQ0hFRF9ET01fUkVNLCBkLT5kb21haW5faWQpOwogCisg
ICAgICAgIHJjdV9yZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKwogICAgICAgICBzY2hl
ZF9mcmVlX2RvbWRhdGEoZG9tX3NjaGVkdWxlcihkKSwgZC0+c2NoZWRfcHJpdik7CiAgICAgICAg
IGQtPnNjaGVkX3ByaXYgPSBOVUxMOwogCisgICAgICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRf
cmVzX3JjdWxvY2spOworCiAgICAgICAgIGNwdXBvb2xfcm1fZG9tYWluKGQpOwogICAgIH0KIH0K
QEAgLTc0OCwxMSArNzgyLDE1IEBAIHZvaWQgdmNwdV9zbGVlcF9ub3N5bmMoc3RydWN0IHZjcHUg
KnYpCiAKICAgICBUUkFDRV8yRChUUkNfU0NIRURfU0xFRVAsIHYtPmRvbWFpbi0+ZG9tYWluX2lk
LCB2LT52Y3B1X2lkKTsKIAorICAgIHJjdV9yZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsK
KwogICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJxc2F2ZSh2LT5zY2hlZF91bml0LCAm
ZmxhZ3MpOwogCiAgICAgdmNwdV9zbGVlcF9ub3N5bmNfbG9ja2VkKHYpOwogCiAgICAgdW5pdF9z
Y2hlZHVsZV91bmxvY2tfaXJxcmVzdG9yZShsb2NrLCBmbGFncywgdi0+c2NoZWRfdW5pdCk7CisK
KyAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKIH0KIAogdm9pZCB2Y3B1
X3NsZWVwX3N5bmMoc3RydWN0IHZjcHUgKnYpCkBAIC03NzMsNiArODExLDggQEAgdm9pZCB2Y3B1
X3dha2Uoc3RydWN0IHZjcHUgKnYpCiAKICAgICBUUkFDRV8yRChUUkNfU0NIRURfV0FLRSwgdi0+
ZG9tYWluLT5kb21haW5faWQsIHYtPnZjcHVfaWQpOwogCisgICAgcmN1X3JlYWRfbG9jaygmc2No
ZWRfcmVzX3JjdWxvY2spOworCiAgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnFzYXZl
KHVuaXQsICZmbGFncyk7CiAKICAgICBpZiAoIGxpa2VseSh2Y3B1X3J1bm5hYmxlKHYpKSApCkBA
IC03OTMsNiArODMzLDggQEAgdm9pZCB2Y3B1X3dha2Uoc3RydWN0IHZjcHUgKnYpCiAgICAgfQog
CiAgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxcmVzdG9yZShsb2NrLCBmbGFncywgdW5pdCk7
CisKKyAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKIH0KIAogdm9pZCB2
Y3B1X3VuYmxvY2soc3RydWN0IHZjcHUgKnYpCkBAIC04MjYsNiArODY4LDggQEAgc3RhdGljIHZv
aWQgc2NoZWRfdW5pdF9tb3ZlX2xvY2tlZChzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwKICAgICB1
bnNpZ25lZCBpbnQgb2xkX2NwdSA9IHVuaXQtPnJlcy0+bWFzdGVyX2NwdTsKICAgICBzdHJ1Y3Qg
dmNwdSAqdjsKIAorICAgIHJjdV9yZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKwogICAg
IC8qCiAgICAgICogVHJhbnNmZXIgdXJnZW5jeSBzdGF0dXMgdG8gbmV3IENQVSBiZWZvcmUgc3dp
dGNoaW5nIENQVXMsIGFzCiAgICAgICogb25jZSB0aGUgc3dpdGNoIG9jY3Vycywgdi0+aXNfdXJn
ZW50IGlzIG5vIGxvbmdlciBwcm90ZWN0ZWQgYnkKQEAgLTg0NSw2ICs4ODksOCBAQCBzdGF0aWMg
dm9pZCBzY2hlZF91bml0X21vdmVfbG9ja2VkKHN0cnVjdCBzY2hlZF91bml0ICp1bml0LAogICAg
ICAqIHBvaW50ZXIgY2FuJ3QgY2hhbmdlIHdoaWxlIHRoZSBjdXJyZW50IGxvY2sgaXMgaGVsZC4K
ICAgICAgKi8KICAgICBzY2hlZF9taWdyYXRlKHVuaXRfc2NoZWR1bGVyKHVuaXQpLCB1bml0LCBu
ZXdfY3B1KTsKKworICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwogfQog
CiAvKgpAQCAtMTAxMiw2ICsxMDU4LDggQEAgdm9pZCByZXN0b3JlX3ZjcHVfYWZmaW5pdHkoc3Ry
dWN0IGRvbWFpbiAqZCkKIAogICAgIEFTU0VSVChzeXN0ZW1fc3RhdGUgPT0gU1lTX1NUQVRFX3Jl
c3VtZSk7CiAKKyAgICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisKICAgICBm
b3JfZWFjaF9zY2hlZF91bml0ICggZCwgdW5pdCApCiAgICAgewogICAgICAgICBzcGlubG9ja190
ICpsb2NrOwpAQCAtMTA3MCw2ICsxMTE4LDggQEAgdm9pZCByZXN0b3JlX3ZjcHVfYWZmaW5pdHko
c3RydWN0IGRvbWFpbiAqZCkKICAgICAgICAgICAgIHNjaGVkX21vdmVfaXJxcyh1bml0KTsKICAg
ICB9CiAKKyAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKwogICAgIGRv
bWFpbl91cGRhdGVfbm9kZV9hZmZpbml0eShkKTsKIH0KIApAQCAtMTA4NSw5ICsxMTM1LDExIEBA
IGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXIodW5zaWduZWQgaW50IGNwdSkKICAgICBjcHVtYXNr
X3Qgb25saW5lX2FmZmluaXR5OwogICAgIGludCByZXQgPSAwOwogCisgICAgcmN1X3JlYWRfbG9j
aygmc2NoZWRfcmVzX3JjdWxvY2spOworCiAgICAgYyA9IGdldF9zY2hlZF9yZXMoY3B1KS0+Y3B1
cG9vbDsKICAgICBpZiAoIGMgPT0gTlVMTCApCi0gICAgICAgIHJldHVybiByZXQ7CisgICAgICAg
IGdvdG8gb3V0OwogCiAgICAgZm9yX2VhY2hfZG9tYWluX2luX2NwdXBvb2wgKCBkLCBjICkKICAg
ICB7CkBAIC0xMTQ1LDYgKzExOTcsOSBAQCBpbnQgY3B1X2Rpc2FibGVfc2NoZWR1bGVyKHVuc2ln
bmVkIGludCBjcHUpCiAgICAgICAgIH0KICAgICB9CiAKK291dDoKKyAgICByY3VfcmVhZF91bmxv
Y2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKwogICAgIHJldHVybiByZXQ7CiB9CiAKQEAgLTExNzgs
NyArMTIzMyw5IEBAIHZvaWQgc2NoZWRfc2V0X2FmZmluaXR5KAogewogICAgIHN0cnVjdCBzY2hl
ZF91bml0ICp1bml0ID0gdi0+c2NoZWRfdW5pdDsKIAorICAgIHJjdV9yZWFkX2xvY2soJnNjaGVk
X3Jlc19yY3Vsb2NrKTsKICAgICBzY2hlZF9hZGp1c3RfYWZmaW5pdHkoZG9tX3NjaGVkdWxlcih2
LT5kb21haW4pLCB1bml0LCBoYXJkLCBzb2Z0KTsKKyAgICByY3VfcmVhZF91bmxvY2soJnNjaGVk
X3Jlc19yY3Vsb2NrKTsKIAogICAgIGlmICggaGFyZCApCiAgICAgICAgIGNwdW1hc2tfY29weSh1
bml0LT5jcHVfaGFyZF9hZmZpbml0eSwgaGFyZCk7CkBAIC0xMTk4LDYgKzEyNTUsOCBAQCBzdGF0
aWMgaW50IHZjcHVfc2V0X2FmZmluaXR5KAogICAgIHNwaW5sb2NrX3QgKmxvY2s7CiAgICAgaW50
IHJldCA9IDA7CiAKKyAgICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisKICAg
ICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrX2lycSh1bml0KTsKIAogICAgIGlmICggdi0+YWZm
aW5pdHlfYnJva2VuICkKQEAgLTEyMjYsNiArMTI4NSw4IEBAIHN0YXRpYyBpbnQgdmNwdV9zZXRf
YWZmaW5pdHkoCiAKICAgICBzY2hlZF91bml0X21pZ3JhdGVfZmluaXNoKHVuaXQpOwogCisgICAg
cmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisKICAgICByZXR1cm4gcmV0Owog
fQogCkBAIC0xMzUyLDExICsxNDEzLDE2IEBAIHN0YXRpYyBsb25nIGRvX3BvbGwoc3RydWN0IHNj
aGVkX3BvbGwgKnNjaGVkX3BvbGwpCiBsb25nIHZjcHVfeWllbGQodm9pZCkKIHsKICAgICBzdHJ1
Y3QgdmNwdSAqIHY9Y3VycmVudDsKLSAgICBzcGlubG9ja190ICpsb2NrID0gdW5pdF9zY2hlZHVs
ZV9sb2NrX2lycSh2LT5zY2hlZF91bml0KTsKKyAgICBzcGlubG9ja190ICpsb2NrOworCisgICAg
cmN1X3JlYWRfbG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwogCisgICAgbG9jayA9IHVuaXRfc2No
ZWR1bGVfbG9ja19pcnEodi0+c2NoZWRfdW5pdCk7CiAgICAgc2NoZWRfeWllbGQodmNwdV9zY2hl
ZHVsZXIodiksIHYtPnNjaGVkX3VuaXQpOwogICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycShs
b2NrLCB2LT5zY2hlZF91bml0KTsKIAorICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3Jj
dWxvY2spOworCiAgICAgU0NIRURfU1RBVF9DUkFOSyh2Y3B1X3lpZWxkKTsKIAogICAgIFRSQUNF
XzJEKFRSQ19TQ0hFRF9ZSUVMRCwgY3VycmVudC0+ZG9tYWluLT5kb21haW5faWQsIGN1cnJlbnQt
PnZjcHVfaWQpOwpAQCAtMTQ1Myw2ICsxNTE5LDggQEAgaW50IHZjcHVfdGVtcG9yYXJ5X2FmZmlu
aXR5KHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgY3B1LCB1aW50OF90IHJlYXNvbikKICAg
ICBpbnQgcmV0ID0gLUVJTlZBTDsKICAgICBib29sIG1pZ3JhdGU7CiAKKyAgICByY3VfcmVhZF9s
b2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisKICAgICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2Nr
X2lycSh1bml0KTsKIAogICAgIGlmICggY3B1ID09IE5SX0NQVVMgKQpAQCAtMTQ5Miw2ICsxNTYw
LDggQEAgaW50IHZjcHVfdGVtcG9yYXJ5X2FmZmluaXR5KHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25l
ZCBpbnQgY3B1LCB1aW50OF90IHJlYXNvbikKICAgICBpZiAoIG1pZ3JhdGUgKQogICAgICAgICBz
Y2hlZF91bml0X21pZ3JhdGVfZmluaXNoKHVuaXQpOwogCisgICAgcmN1X3JlYWRfdW5sb2NrKCZz
Y2hlZF9yZXNfcmN1bG9jayk7CisKICAgICByZXR1cm4gcmV0OwogfQogCkBAIC0xNzAzLDkgKzE3
NzMsMTMgQEAgbG9uZyBzY2hlZF9hZGp1c3Qoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHhlbl9k
b21jdGxfc2NoZWR1bGVyX29wICpvcCkKIAogICAgIC8qIE5COiB0aGUgcGx1Z2dhYmxlIHNjaGVk
dWxlciBjb2RlIG5lZWRzIHRvIHRha2UgY2FyZQogICAgICAqIG9mIGxvY2tpbmcgYnkgaXRzZWxm
LiAqLworICAgIHJjdV9yZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKwogICAgIGlmICgg
KHJldCA9IHNjaGVkX2FkanVzdF9kb20oZG9tX3NjaGVkdWxlcihkKSwgZCwgb3ApKSA9PSAwICkK
ICAgICAgICAgVFJBQ0VfMUQoVFJDX1NDSEVEX0FESkRPTSwgZC0+ZG9tYWluX2lkKTsKIAorICAg
IHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOworCiAgICAgcmV0dXJuIHJldDsK
IH0KIApAQCAtMTcyNiw5ICsxODAwLDEzIEBAIGxvbmcgc2NoZWRfYWRqdXN0X2dsb2JhbChzdHJ1
Y3QgeGVuX3N5c2N0bF9zY2hlZHVsZXJfb3AgKm9wKQogICAgIGlmICggcG9vbCA9PSBOVUxMICkK
ICAgICAgICAgcmV0dXJuIC1FU1JDSDsKIAorICAgIHJjdV9yZWFkX2xvY2soJnNjaGVkX3Jlc19y
Y3Vsb2NrKTsKKwogICAgIHJjID0gKChvcC0+c2NoZWRfaWQgPT0gcG9vbC0+c2NoZWQtPnNjaGVk
X2lkKQogICAgICAgICAgID8gc2NoZWRfYWRqdXN0X2NwdXBvb2wocG9vbC0+c2NoZWQsIG9wKSA6
IC1FSU5WQUwpOwogCisgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisK
ICAgICBjcHVwb29sX3B1dChwb29sKTsKIAogICAgIHJldHVybiByYzsKQEAgLTE5NDgsNyArMjAy
NiwxMSBAQCBzdGF0aWMgdm9pZCB1bml0X2NvbnRleHRfc2F2ZWQoc3RydWN0IHNjaGVkX3Jlc291
cmNlICpzZCkKIHZvaWQgc2NoZWRfY29udGV4dF9zd2l0Y2hlZChzdHJ1Y3QgdmNwdSAqdnByZXYs
IHN0cnVjdCB2Y3B1ICp2bmV4dCkKIHsKICAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqbmV4dCA9IHZu
ZXh0LT5zY2hlZF91bml0OwotICAgIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc2QgPSBnZXRfc2No
ZWRfcmVzKHNtcF9wcm9jZXNzb3JfaWQoKSk7CisgICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpz
ZDsKKworICAgIHJjdV9yZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKworICAgIHNkID0g
Z2V0X3NjaGVkX3JlcyhzbXBfcHJvY2Vzc29yX2lkKCkpOwogCiAgICAgaWYgKCBhdG9taWNfcmVh
ZCgmbmV4dC0+cmVuZGV6dm91c19vdXRfY250KSApCiAgICAgewpAQCAtMTk3NSw2ICsyMDU3LDgg
QEAgdm9pZCBzY2hlZF9jb250ZXh0X3N3aXRjaGVkKHN0cnVjdCB2Y3B1ICp2cHJldiwgc3RydWN0
IHZjcHUgKnZuZXh0KQogCiAgICAgaWYgKCBpc19pZGxlX3ZjcHUodnByZXYpICYmIHZwcmV2ICE9
IHZuZXh0ICkKICAgICAgICAgdnByZXYtPnNjaGVkX3VuaXQgPSBzZC0+c2NoZWRfdW5pdF9pZGxl
OworCisgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CiB9CiAKIHN0YXRp
YyB2b2lkIHNjaGVkX2NvbnRleHRfc3dpdGNoKHN0cnVjdCB2Y3B1ICp2cHJldiwgc3RydWN0IHZj
cHUgKnZuZXh0LApAQCAtMTk5Miw2ICsyMDc2LDggQEAgc3RhdGljIHZvaWQgc2NoZWRfY29udGV4
dF9zd2l0Y2goc3RydWN0IHZjcHUgKnZwcmV2LCBzdHJ1Y3QgdmNwdSAqdm5leHQsCiAgICAgICAg
ICAgICB2bmV4dC0+c2NoZWRfdW5pdCA9CiAgICAgICAgICAgICAgICAgZ2V0X3NjaGVkX3Jlcyhz
bXBfcHJvY2Vzc29yX2lkKCkpLT5zY2hlZF91bml0X2lkbGU7CiAKKyAgICAgICAgcmN1X3JlYWRf
dW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisKICAgICAgICAgdHJhY2VfY29udGludWVfcnVu
bmluZyh2bmV4dCk7CiAgICAgICAgIHJldHVybiBjb250aW51ZV9ydW5uaW5nKHZwcmV2KTsKICAg
ICB9CkBAIC0yMDA1LDYgKzIwOTEsOCBAQCBzdGF0aWMgdm9pZCBzY2hlZF9jb250ZXh0X3N3aXRj
aChzdHJ1Y3QgdmNwdSAqdnByZXYsIHN0cnVjdCB2Y3B1ICp2bmV4dCwKIAogICAgIHZjcHVfcGVy
aW9kaWNfdGltZXJfd29yayh2bmV4dCk7CiAKKyAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jl
c19yY3Vsb2NrKTsKKwogICAgIGNvbnRleHRfc3dpdGNoKHZwcmV2LCB2bmV4dCk7CiB9CiAKQEAg
LTIxNTIsNiArMjI0MCw4IEBAIHN0YXRpYyB2b2lkIHNjaGVkX3NsYXZlKHZvaWQpCiAKICAgICBB
U1NFUlRfTk9UX0lOX0FUT01JQygpOwogCisgICAgcmN1X3JlYWRfbG9jaygmc2NoZWRfcmVzX3Jj
dWxvY2spOworCiAgICAgbG9jayA9IHBjcHVfc2NoZWR1bGVfbG9ja19pcnEoY3B1KTsKIAogICAg
IG5vdyA9IE5PVygpOwpAQCAtMjE3NSw2ICsyMjY1LDggQEAgc3RhdGljIHZvaWQgc2NoZWRfc2xh
dmUodm9pZCkKICAgICB7CiAgICAgICAgIHBjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCBj
cHUpOwogCisgICAgICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOworCiAg
ICAgICAgIC8qIENoZWNrIGZvciBmYWlsZWQgZm9yY2VkIGNvbnRleHQgc3dpdGNoLiAqLwogICAg
ICAgICBpZiAoIGRvX3NvZnRpcnEgKQogICAgICAgICAgICAgcmFpc2Vfc29mdGlycShTQ0hFRFVM
RV9TT0ZUSVJRKTsKQEAgLTIyMDUsMTMgKzIyOTcsMTYgQEAgc3RhdGljIHZvaWQgc2NoZWR1bGUo
dm9pZCkKICAgICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNkOwogICAgIHNwaW5sb2NrX3QgICAg
ICAgICAgICpsb2NrOwogICAgIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Ci0gICAgdW5z
aWduZWQgaW50ICAgICAgICAgIGdyYW4gPSBnZXRfc2NoZWRfcmVzKGNwdSktPmdyYW51bGFyaXR5
OworICAgIHVuc2lnbmVkIGludCAgICAgICAgICBncmFuOwogCiAgICAgQVNTRVJUX05PVF9JTl9B
VE9NSUMoKTsKIAogICAgIFNDSEVEX1NUQVRfQ1JBTksoc2NoZWRfcnVuKTsKIAorICAgIHJjdV9y
ZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKwogICAgIHNkID0gZ2V0X3NjaGVkX3Jlcyhj
cHUpOworICAgIGdyYW4gPSBzZC0+Z3JhbnVsYXJpdHk7CiAKICAgICBsb2NrID0gcGNwdV9zY2hl
ZHVsZV9sb2NrX2lycShjcHUpOwogCkBAIC0yMjIzLDYgKzIzMTgsOCBAQCBzdGF0aWMgdm9pZCBz
Y2hlZHVsZSh2b2lkKQogICAgICAgICAgKi8KICAgICAgICAgcGNwdV9zY2hlZHVsZV91bmxvY2tf
aXJxKGxvY2ssIGNwdSk7CiAKKyAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1
bG9jayk7CisKICAgICAgICAgcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKTsKICAgICAg
ICAgcmV0dXJuIHNjaGVkX3NsYXZlKCk7CiAgICAgfQpAQCAtMjMzMiwxNCArMjQyOSwyNyBAQCBz
dGF0aWMgaW50IGNwdV9zY2hlZHVsZV91cCh1bnNpZ25lZCBpbnQgY3B1KQogICAgIHJldHVybiAw
OwogfQogCitzdGF0aWMgdm9pZCBzY2hlZF9yZXNfZnJlZShzdHJ1Y3QgcmN1X2hlYWQgKmhlYWQp
Cit7CisgICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpzZCA9IGNvbnRhaW5lcl9vZihoZWFkLCBz
dHJ1Y3Qgc2NoZWRfcmVzb3VyY2UsIHJjdSk7CisKKyAgICB4ZnJlZShzZCk7Cit9CisKIHN0YXRp
YyB2b2lkIGNwdV9zY2hlZHVsZV9kb3duKHVuc2lnbmVkIGludCBjcHUpCiB7Ci0gICAgc3RydWN0
IHNjaGVkX3Jlc291cmNlICpzZCA9IGdldF9zY2hlZF9yZXMoY3B1KTsKKyAgICBzdHJ1Y3Qgc2No
ZWRfcmVzb3VyY2UgKnNkOworCisgICAgcmN1X3JlYWRfbG9jaygmc2NoZWRfcmVzX3JjdWxvY2sp
OworCisgICAgc2QgPSBnZXRfc2NoZWRfcmVzKGNwdSk7CiAKICAgICBraWxsX3RpbWVyKCZzZC0+
c190aW1lcik7CiAKICAgICBzZXRfc2NoZWRfcmVzKGNwdSwgTlVMTCk7Ci0gICAgeGZyZWUoc2Qp
OworICAgIGNhbGxfcmN1KCZzZC0+cmN1LCBzY2hlZF9yZXNfZnJlZSk7CisKKyAgICByY3VfcmVh
ZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKIH0KIAogdm9pZCBzY2hlZF9ybV9jcHUodW5z
aWduZWQgaW50IGNwdSkKQEAgLTIzNTksNiArMjQ2OSw4IEBAIHN0YXRpYyBpbnQgY3B1X3NjaGVk
dWxlX2NhbGxiYWNrKAogICAgIHVuc2lnbmVkIGludCBjcHUgPSAodW5zaWduZWQgbG9uZyloY3B1
OwogICAgIGludCByYyA9IDA7CiAKKyAgICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9j
ayk7CisKICAgICAvKgogICAgICAqIEZyb20gdGhlIHNjaGVkdWxlciBwZXJzcGVjdGl2ZSwgYnJp
bmdpbmcgdXAgYSBwQ1BVIHJlcXVpcmVzCiAgICAgICogYWxsb2NhdGluZyBhbmQgaW5pdGlhbGl6
aW5nIHRoZSBwZXItcENQVSBzY2hlZHVsZXIgc3BlY2lmaWMgZGF0YSwKQEAgLTI0MDUsNiArMjUx
Nyw4IEBAIHN0YXRpYyBpbnQgY3B1X3NjaGVkdWxlX2NhbGxiYWNrKAogICAgICAgICBicmVhazsK
ICAgICB9CiAKKyAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKwogICAg
IHJldHVybiAhcmMgPyBOT1RJRllfRE9ORSA6IG5vdGlmaWVyX2Zyb21fZXJybm8ocmMpOwogfQog
CkBAIC0yNDk0LDggKzI2MDgsMTMgQEAgdm9pZCBfX2luaXQgc2NoZWR1bGVyX2luaXQodm9pZCkK
ICAgICBpZGxlX2RvbWFpbi0+bWF4X3ZjcHVzID0gbnJfY3B1X2lkczsKICAgICBpZiAoIHZjcHVf
Y3JlYXRlKGlkbGVfZG9tYWluLCAwKSA9PSBOVUxMICkKICAgICAgICAgQlVHKCk7CisKKyAgICBy
Y3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisKICAgICBnZXRfc2NoZWRfcmVzKDAp
LT5jdXJyID0gaWRsZV92Y3B1WzBdLT5zY2hlZF91bml0OwogICAgIGdldF9zY2hlZF9yZXMoMCkt
PnNjaGVkX3VuaXRfaWRsZSA9IGlkbGVfdmNwdVswXS0+c2NoZWRfdW5pdDsKKworICAgIHJjdV9y
ZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwogfQogCiAvKgpAQCAtMjUwOCw5ICsyNjI3
LDE0IEBAIGludCBzY2hlZHVsZV9jcHVfYWRkKHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBjcHVw
b29sICpjKQogICAgIHN0cnVjdCB2Y3B1ICppZGxlOwogICAgIHZvaWQgKnBwcml2LCAqdnByaXY7
CiAgICAgc3RydWN0IHNjaGVkdWxlciAqbmV3X29wcyA9IGMtPnNjaGVkOwotICAgIHN0cnVjdCBz
Y2hlZF9yZXNvdXJjZSAqc2QgPSBnZXRfc2NoZWRfcmVzKGNwdSk7CisgICAgc3RydWN0IHNjaGVk
X3Jlc291cmNlICpzZDsKICAgICBzcGlubG9ja190ICpvbGRfbG9jaywgKm5ld19sb2NrOwogICAg
IHVuc2lnbmVkIGxvbmcgZmxhZ3M7CisgICAgaW50IHJldCA9IDA7CisKKyAgICByY3VfcmVhZF9s
b2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisKKyAgICBzZCA9IGdldF9zY2hlZF9yZXMoY3B1KTsK
IAogICAgIEFTU0VSVChjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgJmNwdXBvb2xfZnJlZV9jcHVzKSk7
CiAgICAgQVNTRVJUKCFjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgYy0+Y3B1X3ZhbGlkKSk7CkBAIC0y
NTMwLDEzICsyNjU0LDE4IEBAIGludCBzY2hlZHVsZV9jcHVfYWRkKHVuc2lnbmVkIGludCBjcHUs
IHN0cnVjdCBjcHVwb29sICpjKQogICAgIGlkbGUgPSBpZGxlX3ZjcHVbY3B1XTsKICAgICBwcHJp
diA9IHNjaGVkX2FsbG9jX3BkYXRhKG5ld19vcHMsIGNwdSk7CiAgICAgaWYgKCBJU19FUlIocHBy
aXYpICkKLSAgICAgICAgcmV0dXJuIFBUUl9FUlIocHByaXYpOworICAgIHsKKyAgICAgICAgcmV0
ID0gUFRSX0VSUihwcHJpdik7CisgICAgICAgIGdvdG8gb3V0OworICAgIH0KKwogICAgIHZwcml2
ID0gc2NoZWRfYWxsb2NfdmRhdGEobmV3X29wcywgaWRsZS0+c2NoZWRfdW5pdCwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGlkbGUtPmRvbWFpbi0+c2NoZWRfcHJpdik7CiAgICAgaWYg
KCB2cHJpdiA9PSBOVUxMICkKICAgICB7CiAgICAgICAgIHNjaGVkX2ZyZWVfcGRhdGEobmV3X29w
cywgcHByaXYsIGNwdSk7Ci0gICAgICAgIHJldHVybiAtRU5PTUVNOworICAgICAgICByZXQgPSAt
RU5PTUVNOworICAgICAgICBnb3RvIG91dDsKICAgICB9CiAKICAgICAvKgpAQCAtMjU3NSw3ICsy
NzA0LDEwIEBAIGludCBzY2hlZHVsZV9jcHVfYWRkKHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBj
cHVwb29sICpjKQogICAgIC8qIFRoZSAgY3B1IGlzIGFkZGVkIHRvIGEgcG9vbCwgdHJpZ2dlciBp
dCB0byBnbyBwaWNrIHVwIHNvbWUgd29yayAqLwogICAgIGNwdV9yYWlzZV9zb2Z0aXJxKGNwdSwg
U0NIRURVTEVfU09GVElSUSk7CiAKLSAgICByZXR1cm4gMDsKK291dDoKKyAgICByY3VfcmVhZF91
bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKworICAgIHJldHVybiByZXQ7CiB9CiAKIC8qCkBA
IC0yNTg4LDExICsyNzIwLDE2IEBAIGludCBzY2hlZHVsZV9jcHVfcm0odW5zaWduZWQgaW50IGNw
dSkKIHsKICAgICBzdHJ1Y3QgdmNwdSAqaWRsZTsKICAgICB2b2lkICpwcHJpdl9vbGQsICp2cHJp
dl9vbGQ7Ci0gICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpzZCA9IGdldF9zY2hlZF9yZXMoY3B1
KTsKLSAgICBzdHJ1Y3Qgc2NoZWR1bGVyICpvbGRfb3BzID0gc2QtPnNjaGVkdWxlcjsKKyAgICBz
dHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNkOworICAgIHN0cnVjdCBzY2hlZHVsZXIgKm9sZF9vcHM7
CiAgICAgc3BpbmxvY2tfdCAqb2xkX2xvY2s7CiAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKIAor
ICAgIHJjdV9yZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKworICAgIHNkID0gZ2V0X3Nj
aGVkX3JlcyhjcHUpOworICAgIG9sZF9vcHMgPSBzZC0+c2NoZWR1bGVyOworCiAgICAgQVNTRVJU
KHNkLT5jcHVwb29sICE9IE5VTEwpOwogICAgIEFTU0VSVChjcHVtYXNrX3Rlc3RfY3B1KGNwdSwg
JmNwdXBvb2xfZnJlZV9jcHVzKSk7CiAgICAgQVNTRVJUKCFjcHVtYXNrX3Rlc3RfY3B1KGNwdSwg
c2QtPmNwdXBvb2wtPmNwdV92YWxpZCkpOwpAQCAtMjYyNSw2ICsyNzYyLDggQEAgaW50IHNjaGVk
dWxlX2NwdV9ybSh1bnNpZ25lZCBpbnQgY3B1KQogICAgIHNkLT5ncmFudWxhcml0eSA9IDE7CiAg
ICAgc2QtPmNwdXBvb2wgPSBOVUxMOwogCisgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNf
cmN1bG9jayk7CisKICAgICByZXR1cm4gMDsKIH0KIApAQCAtMjY3Myw2ICsyODEyLDggQEAgdm9p
ZCBzY2hlZHVsZV9kdW1wKHN0cnVjdCBjcHVwb29sICpjKQogCiAgICAgLyogTG9ja2luZywgaWYg
bmVjZXNzYXJ5LCBtdXN0IGJlIGhhbmRsZWQgd2l0aGluZyBlYWNoIHNjaGVkdWxlciAqLwogCisg
ICAgcmN1X3JlYWRfbG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOworCiAgICAgaWYgKCBjICE9IE5V
TEwgKQogICAgIHsKICAgICAgICAgc2NoZWQgPSBjLT5zY2hlZDsKQEAgLTI2OTIsNiArMjgzMyw4
IEBAIHZvaWQgc2NoZWR1bGVfZHVtcChzdHJ1Y3QgY3B1cG9vbCAqYykKICAgICAgICAgZm9yX2Vh
Y2hfY3B1IChpLCBjcHVzKQogICAgICAgICAgICAgc2NoZWRfZHVtcF9jcHVfc3RhdGUoc2NoZWQs
IGkpOwogICAgIH0KKworICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwog
fQogCiB2b2lkIHNjaGVkX3RpY2tfc3VzcGVuZCh2b2lkKQpAQCAtMjY5OSwxMCArMjg0MiwxNCBA
QCB2b2lkIHNjaGVkX3RpY2tfc3VzcGVuZCh2b2lkKQogICAgIHN0cnVjdCBzY2hlZHVsZXIgKnNj
aGVkOwogICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7CiAKKyAgICBy
Y3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisKICAgICBzY2hlZCA9IGdldF9zY2hl
ZF9yZXMoY3B1KS0+c2NoZWR1bGVyOwogICAgIHNjaGVkX2RvX3RpY2tfc3VzcGVuZChzY2hlZCwg
Y3B1KTsKICAgICByY3VfaWRsZV9lbnRlcihjcHUpOwogICAgIHJjdV9pZGxlX3RpbWVyX3N0YXJ0
KCk7CisKKyAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKIH0KIAogdm9p
ZCBzY2hlZF90aWNrX3Jlc3VtZSh2b2lkKQpAQCAtMjcxMCwxMCArMjg1NywxNCBAQCB2b2lkIHNj
aGVkX3RpY2tfcmVzdW1lKHZvaWQpCiAgICAgc3RydWN0IHNjaGVkdWxlciAqc2NoZWQ7CiAgICAg
dW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKIAorICAgIHJjdV9yZWFkX2xv
Y2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKwogICAgIHJjdV9pZGxlX3RpbWVyX3N0b3AoKTsKICAg
ICByY3VfaWRsZV9leGl0KGNwdSk7CiAgICAgc2NoZWQgPSBnZXRfc2NoZWRfcmVzKGNwdSktPnNj
aGVkdWxlcjsKICAgICBzY2hlZF9kb190aWNrX3Jlc3VtZShzY2hlZCwgY3B1KTsKKworICAgIHJj
dV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwogfQogCiB2b2lkIHdhaXQodm9pZCkK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmgKaW5kZXggY2I1OGJhZDBmZi4uZjEwZWQ3NjhiMCAxMDA2NDQKLS0tIGEveGVu
L2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgK
QEAgLTEwLDYgKzEwLDcgQEAKIAogI2luY2x1ZGUgPHhlbi9wZXJjcHUuaD4KICNpbmNsdWRlIDx4
ZW4vZXJyLmg+CisjaW5jbHVkZSA8eGVuL3JjdXBkYXRlLmg+CiAKIC8qIEEgZ2xvYmFsIHBvaW50
ZXIgdG8gdGhlIGluaXRpYWwgY3B1cG9vbCAoUE9PTDApLiAqLwogZXh0ZXJuIHN0cnVjdCBjcHVw
b29sICpjcHVwb29sMDsKQEAgLTU5LDIwICs2MCwyMiBAQCBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2Ug
ewogICAgIHVuc2lnbmVkIGludCAgICAgICAgbWFzdGVyX2NwdTsKICAgICB1bnNpZ25lZCBpbnQg
ICAgICAgIGdyYW51bGFyaXR5OwogICAgIGNvbnN0IGNwdW1hc2tfdCAgICAqY3B1czsgICAgICAg
ICAgIC8qIGNwdXMgY292ZXJlZCBieSB0aGlzIHN0cnVjdCAgICAgKi8KKyAgICBzdHJ1Y3QgcmN1
X2hlYWQgICAgIHJjdTsKIH07CiAKICNkZWZpbmUgY3Vycl9vbl9jcHUoYykgICAgKGdldF9zY2hl
ZF9yZXMoYyktPmN1cnIpCiAKIERFQ0xBUkVfUEVSX0NQVShzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2Ug
Kiwgc2NoZWRfcmVzKTsKK2V4dGVybiByY3VfcmVhZF9sb2NrX3Qgc2NoZWRfcmVzX3JjdWxvY2s7
CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0IHNjaGVkX3Jlc291cmNlICpnZXRfc2NoZWRfcmVzKHVu
c2lnbmVkIGludCBjcHUpCiB7Ci0gICAgcmV0dXJuIHBlcl9jcHUoc2NoZWRfcmVzLCBjcHUpOwor
ICAgIHJldHVybiByY3VfZGVyZWZlcmVuY2UocGVyX2NwdShzY2hlZF9yZXMsIGNwdSkpOwogfQog
CiBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3NjaGVkX3Jlcyh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1
Y3Qgc2NoZWRfcmVzb3VyY2UgKnJlcykKIHsKLSAgICBwZXJfY3B1KHNjaGVkX3JlcywgY3B1KSA9
IHJlczsKKyAgICByY3VfYXNzaWduX3BvaW50ZXIocGVyX2NwdShzY2hlZF9yZXMsIGNwdSksIHJl
cyk7CiB9CiAKIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19pZGxlX3VuaXQoY29uc3Qgc3RydWN0IHNj
aGVkX3VuaXQgKnVuaXQpCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
