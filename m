Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE8A12408F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 08:51:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihU5F-0003jS-2k; Wed, 18 Dec 2019 07:49:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihU5E-0003iq-7N
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 07:49:24 +0000
X-Inumbo-ID: debd3188-216a-11ea-a914-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id debd3188-216a-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 07:49:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F21C8ADEB;
 Wed, 18 Dec 2019 07:49:03 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 08:48:56 +0100
Message-Id: <20191218074859.21665-7-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191218074859.21665-1-jgross@suse.com>
References: <20191218074859.21665-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 6/9] xen/sched: replace null scheduler
 percpu-variable with pdata hook
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

SW5zdGVhZCBvZiBoYXZpbmcgYW4gb3duIHBlcmNwdS12YXJpYWJsZSBmb3IgcHJpdmF0ZSBkYXRh
IHBlciBjcHUgdGhlCmdlbmVyaWMgc2NoZWR1bGVyIGludGVyZmFjZSBmb3IgdGhhdCBwdXJwb3Nl
IHNob3VsZCBiZSB1c2VkLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWQvc2NoZWRfbnVsbC5jIHwgODkgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYwIGlu
c2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2No
ZWQvc2NoZWRfbnVsbC5jIGIveGVuL2NvbW1vbi9zY2hlZC9zY2hlZF9udWxsLmMKaW5kZXggNWEy
M2E3ZTdkYy4uMTFhYWIyNTc0MyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9zY2hlZF9u
dWxsLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZC9zY2hlZF9udWxsLmMKQEAgLTg5LDcgKzg5LDYg
QEAgc3RydWN0IG51bGxfcHJpdmF0ZSB7CiBzdHJ1Y3QgbnVsbF9wY3B1IHsKICAgICBzdHJ1Y3Qg
c2NoZWRfdW5pdCAqdW5pdDsKIH07Ci1ERUZJTkVfUEVSX0NQVShzdHJ1Y3QgbnVsbF9wY3B1LCBu
cGMpOwogCiAvKgogICogU2NoZWR1bGUgdW5pdApAQCAtMTU5LDMyICsxNTgsNDggQEAgc3RhdGlj
IHZvaWQgbnVsbF9kZWluaXQoc3RydWN0IHNjaGVkdWxlciAqb3BzKQogICAgIG9wcy0+c2NoZWRf
ZGF0YSA9IE5VTEw7CiB9CiAKLXN0YXRpYyB2b2lkIGluaXRfcGRhdGEoc3RydWN0IG51bGxfcHJp
dmF0ZSAqcHJ2LCB1bnNpZ25lZCBpbnQgY3B1KQorc3RhdGljIHZvaWQgaW5pdF9wZGF0YShzdHJ1
Y3QgbnVsbF9wcml2YXRlICpwcnYsIHN0cnVjdCBudWxsX3BjcHUgKm5wYywKKyAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50IGNwdSkKIHsKICAgICAvKiBNYXJrIHRoZSBwQ1BVIGFz
IGZyZWUsIGFuZCB3aXRoIG5vIHVuaXQgYXNzaWduZWQgKi8KICAgICBjcHVtYXNrX3NldF9jcHUo
Y3B1LCAmcHJ2LT5jcHVzX2ZyZWUpOwotICAgIHBlcl9jcHUobnBjLCBjcHUpLnVuaXQgPSBOVUxM
OworICAgIG5wYy0+dW5pdCA9IE5VTEw7CiB9CiAKIHN0YXRpYyB2b2lkIG51bGxfaW5pdF9wZGF0
YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHZvaWQgKnBkYXRhLCBpbnQgY3B1KQogewog
ICAgIHN0cnVjdCBudWxsX3ByaXZhdGUgKnBydiA9IG51bGxfcHJpdihvcHMpOwogCi0gICAgLyog
YWxsb2NfcGRhdGEgaXMgbm90IGltcGxlbWVudGVkLCBzbyB3ZSB3YW50IHRoaXMgdG8gYmUgTlVM
TC4gKi8KLSAgICBBU1NFUlQoIXBkYXRhKTsKKyAgICBBU1NFUlQocGRhdGEpOwogCi0gICAgaW5p
dF9wZGF0YShwcnYsIGNwdSk7CisgICAgaW5pdF9wZGF0YShwcnYsIHBkYXRhLCBjcHUpOwogfQog
CiBzdGF0aWMgdm9pZCBudWxsX2RlaW5pdF9wZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpv
cHMsIHZvaWQgKnBjcHUsIGludCBjcHUpCiB7CiAgICAgc3RydWN0IG51bGxfcHJpdmF0ZSAqcHJ2
ID0gbnVsbF9wcml2KG9wcyk7CisgICAgc3RydWN0IG51bGxfcGNwdSAqbnBjID0gcGNwdTsKIAot
ICAgIC8qIGFsbG9jX3BkYXRhIG5vdCBpbXBsZW1lbnRlZCwgc28gdGhpcyBtdXN0IGhhdmUgc3Rh
eWVkIE5VTEwgKi8KLSAgICBBU1NFUlQoIXBjcHUpOworICAgIEFTU0VSVChucGMpOwogCiAgICAg
Y3B1bWFza19jbGVhcl9jcHUoY3B1LCAmcHJ2LT5jcHVzX2ZyZWUpOwotICAgIHBlcl9jcHUobnBj
LCBjcHUpLnVuaXQgPSBOVUxMOworICAgIG5wYy0+dW5pdCA9IE5VTEw7Cit9CisKK3N0YXRpYyB2
b2lkICpudWxsX2FsbG9jX3BkYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgaW50IGNw
dSkKK3sKKyAgICBzdHJ1Y3QgbnVsbF9wY3B1ICpucGM7CisKKyAgICBucGMgPSB4emFsbG9jKHN0
cnVjdCBudWxsX3BjcHUpOworICAgIGlmICggbnBjID09IE5VTEwgKQorICAgICAgICByZXR1cm4g
RVJSX1BUUigtRU5PTUVNKTsKKworICAgIHJldHVybiBucGM7Cit9CisKK3N0YXRpYyB2b2lkIG51
bGxfZnJlZV9wZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHZvaWQgKnBjcHUsIGlu
dCBjcHUpCit7CisgICAgeGZyZWUocGNwdSk7CiB9CiAKIHN0YXRpYyB2b2lkICpudWxsX2FsbG9j
X3VkYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywKQEAgLTI2OCw2ICsyODMsNyBAQCBw
aWNrX3JlcyhzdHJ1Y3QgbnVsbF9wcml2YXRlICpwcnYsIGNvbnN0IHN0cnVjdCBzY2hlZF91bml0
ICp1bml0KQogICAgIHVuc2lnbmVkIGludCBiczsKICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc2No
ZWRfdW5pdF9tYXN0ZXIodW5pdCksIG5ld19jcHU7CiAgICAgY3B1bWFza190ICpjcHVzID0gY3B1
cG9vbF9kb21haW5fbWFzdGVyX2NwdW1hc2sodW5pdC0+ZG9tYWluKTsKKyAgICBzdHJ1Y3QgbnVs
bF9wY3B1ICpucGMgPSBnZXRfc2NoZWRfcmVzKGNwdSktPnNjaGVkX3ByaXY7CiAKICAgICBBU1NF
UlQoc3Bpbl9pc19sb2NrZWQoZ2V0X3NjaGVkX3JlcyhjcHUpLT5zY2hlZHVsZV9sb2NrKSk7CiAK
QEAgLTI4Niw4ICszMDIsNyBAQCBwaWNrX3JlcyhzdHJ1Y3QgbnVsbF9wcml2YXRlICpwcnYsIGNv
bnN0IHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogICAgICAgICAgKiBkb24ndCwgc28gd2UgZ2V0
IHRvIGtlZXAgaW4gdGhlIHNjcmF0Y2ggY3B1bWFzayB3aGF0IHdlIGhhdmUganVzdAogICAgICAg
ICAgKiBwdXQgaW4gaXQuKQogICAgICAgICAgKi8KLSAgICAgICAgaWYgKCBsaWtlbHkoKHBlcl9j
cHUobnBjLCBjcHUpLnVuaXQgPT0gTlVMTCB8fAotICAgICAgICAgICAgICAgICAgICAgcGVyX2Nw
dShucGMsIGNwdSkudW5pdCA9PSB1bml0KQorICAgICAgICBpZiAoIGxpa2VseSgobnBjLT51bml0
ID09IE5VTEwgfHwgbnBjLT51bml0ID09IHVuaXQpCiAgICAgICAgICAgICAgICAgICAgICYmIGNw
dW1hc2tfdGVzdF9jcHUoY3B1LCBjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSkpKSApCiAgICAgICAg
IHsKICAgICAgICAgICAgIG5ld19jcHUgPSBjcHU7CkBAIC0zMzYsOSArMzUxLDExIEBAIHBpY2tf
cmVzKHN0cnVjdCBudWxsX3ByaXZhdGUgKnBydiwgY29uc3Qgc3RydWN0IHNjaGVkX3VuaXQgKnVu
aXQpCiBzdGF0aWMgdm9pZCB1bml0X2Fzc2lnbihzdHJ1Y3QgbnVsbF9wcml2YXRlICpwcnYsIHN0
cnVjdCBzY2hlZF91bml0ICp1bml0LAogICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50IGNwdSkKIHsKKyAgICBzdHJ1Y3QgbnVsbF9wY3B1ICpucGMgPSBnZXRfc2NoZWRfcmVzKGNw
dSktPnNjaGVkX3ByaXY7CisKICAgICBBU1NFUlQoaXNfdW5pdF9vbmxpbmUodW5pdCkpOwogCi0g
ICAgcGVyX2NwdShucGMsIGNwdSkudW5pdCA9IHVuaXQ7CisgICAgbnBjLT51bml0ID0gdW5pdDsK
ICAgICBzY2hlZF9zZXRfcmVzKHVuaXQsIGdldF9zY2hlZF9yZXMoY3B1KSk7CiAgICAgY3B1bWFz
a19jbGVhcl9jcHUoY3B1LCAmcHJ2LT5jcHVzX2ZyZWUpOwogCkBAIC0zNjMsMTIgKzM4MCwxMyBA
QCBzdGF0aWMgYm9vbCB1bml0X2RlYXNzaWduKHN0cnVjdCBudWxsX3ByaXZhdGUgKnBydiwgc3Ry
dWN0IHNjaGVkX3VuaXQgKnVuaXQpCiAgICAgdW5zaWduZWQgaW50IGJzOwogICAgIHVuc2lnbmVk
IGludCBjcHUgPSBzY2hlZF91bml0X21hc3Rlcih1bml0KTsKICAgICBzdHJ1Y3QgbnVsbF91bml0
ICp3dmM7CisgICAgc3RydWN0IG51bGxfcGNwdSAqbnBjID0gZ2V0X3NjaGVkX3JlcyhjcHUpLT5z
Y2hlZF9wcml2OwogCiAgICAgQVNTRVJUKGxpc3RfZW1wdHkoJm51bGxfdW5pdCh1bml0KS0+d2Fp
dHFfZWxlbSkpOwotICAgIEFTU0VSVChwZXJfY3B1KG5wYywgY3B1KS51bml0ID09IHVuaXQpOwor
ICAgIEFTU0VSVChucGMtPnVuaXQgPT0gdW5pdCk7CiAgICAgQVNTRVJUKCFjcHVtYXNrX3Rlc3Rf
Y3B1KGNwdSwgJnBydi0+Y3B1c19mcmVlKSk7CiAKLSAgICBwZXJfY3B1KG5wYywgY3B1KS51bml0
ID0gTlVMTDsKKyAgICBucGMtPnVuaXQgPSBOVUxMOwogICAgIGNwdW1hc2tfc2V0X2NwdShjcHUs
ICZwcnYtPmNwdXNfZnJlZSk7CiAKICAgICBkcHJpbnRrKFhFTkxPR19HX0lORk8sICIlZCA8LS0g
TlVMTCAoJXBkdiVkKVxuIiwgY3B1LCB1bml0LT5kb21haW4sCkBAIC00MzYsNyArNDU0LDcgQEAg
c3RhdGljIHNwaW5sb2NrX3QgKm51bGxfc3dpdGNoX3NjaGVkKHN0cnVjdCBzY2hlZHVsZXIgKm5l
d19vcHMsCiAgICAgICovCiAgICAgQVNTRVJUKCFsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKIAot
ICAgIGluaXRfcGRhdGEocHJ2LCBjcHUpOworICAgIGluaXRfcGRhdGEocHJ2LCBwZGF0YSwgY3B1
KTsKIAogICAgIHJldHVybiAmc3ItPl9sb2NrOwogfQpAQCAtNDQ2LDYgKzQ2NCw3IEBAIHN0YXRp
YyB2b2lkIG51bGxfdW5pdF9pbnNlcnQoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLAogewog
ICAgIHN0cnVjdCBudWxsX3ByaXZhdGUgKnBydiA9IG51bGxfcHJpdihvcHMpOwogICAgIHN0cnVj
dCBudWxsX3VuaXQgKm52YyA9IG51bGxfdW5pdCh1bml0KTsKKyAgICBzdHJ1Y3QgbnVsbF9wY3B1
ICpucGM7CiAgICAgdW5zaWduZWQgaW50IGNwdTsKICAgICBzcGlubG9ja190ICpsb2NrOwogCkBA
IC00NjIsNiArNDgxLDcgQEAgc3RhdGljIHZvaWQgbnVsbF91bml0X2luc2VydChjb25zdCBzdHJ1
Y3Qgc2NoZWR1bGVyICpvcHMsCiAgcmV0cnk6CiAgICAgc2NoZWRfc2V0X3Jlcyh1bml0LCBwaWNr
X3JlcyhwcnYsIHVuaXQpKTsKICAgICBjcHUgPSBzY2hlZF91bml0X21hc3Rlcih1bml0KTsKKyAg
ICBucGMgPSBnZXRfc2NoZWRfcmVzKGNwdSktPnNjaGVkX3ByaXY7CiAKICAgICBzcGluX3VubG9j
ayhsb2NrKTsKIApAQCAtNDcxLDcgKzQ5MSw3IEBAIHN0YXRpYyB2b2lkIG51bGxfdW5pdF9pbnNl
cnQoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLAogICAgICAgICAgICAgICAgIGNwdXBvb2xf
ZG9tYWluX21hc3Rlcl9jcHVtYXNrKHVuaXQtPmRvbWFpbikpOwogCiAgICAgLyogSWYgdGhlIHBD
UFUgaXMgZnJlZSwgd2UgYXNzaWduIHVuaXQgdG8gaXQgKi8KLSAgICBpZiAoIGxpa2VseShwZXJf
Y3B1KG5wYywgY3B1KS51bml0ID09IE5VTEwpICkKKyAgICBpZiAoIGxpa2VseShucGMtPnVuaXQg
PT0gTlVMTCkgKQogICAgIHsKICAgICAgICAgLyoKICAgICAgICAgICogSW5zZXJ0IGlzIGZvbGxv
d2VkIGJ5IHZjcHVfd2FrZSgpLCBzbyB0aGVyZSdzIG5vIG5lZWQgdG8gcG9rZQpAQCAtNTE5LDcg
KzUzOSwxMCBAQCBzdGF0aWMgdm9pZCBudWxsX3VuaXRfcmVtb3ZlKGNvbnN0IHN0cnVjdCBzY2hl
ZHVsZXIgKm9wcywKICAgICAvKiBJZiBvZmZsaW5lLCB0aGUgdW5pdCBzaG91bGRuJ3QgYmUgYXNz
aWduZWQsIG5vciBpbiB0aGUgd2FpdHF1ZXVlICovCiAgICAgaWYgKCB1bmxpa2VseSghaXNfdW5p
dF9vbmxpbmUodW5pdCkpICkKICAgICB7Ci0gICAgICAgIEFTU0VSVChwZXJfY3B1KG5wYywgc2No
ZWRfdW5pdF9tYXN0ZXIodW5pdCkpLnVuaXQgIT0gdW5pdCk7CisgICAgICAgIHN0cnVjdCBudWxs
X3BjcHUgKm5wYzsKKworICAgICAgICBucGMgPSB1bml0LT5yZXMtPnNjaGVkX3ByaXY7CisgICAg
ICAgIEFTU0VSVChucGMtPnVuaXQgIT0gdW5pdCk7CiAgICAgICAgIEFTU0VSVChsaXN0X2VtcHR5
KCZudmMtPndhaXRxX2VsZW0pKTsKICAgICAgICAgZ290byBvdXQ7CiAgICAgfQpAQCAtNTQ4LDYg
KzU3MSw3IEBAIHN0YXRpYyB2b2lkIG51bGxfdW5pdF93YWtlKGNvbnN0IHN0cnVjdCBzY2hlZHVs
ZXIgKm9wcywKICAgICBzdHJ1Y3QgbnVsbF9wcml2YXRlICpwcnYgPSBudWxsX3ByaXYob3BzKTsK
ICAgICBzdHJ1Y3QgbnVsbF91bml0ICpudmMgPSBudWxsX3VuaXQodW5pdCk7CiAgICAgdW5zaWdu
ZWQgaW50IGNwdSA9IHNjaGVkX3VuaXRfbWFzdGVyKHVuaXQpOworICAgIHN0cnVjdCBudWxsX3Bj
cHUgKm5wYyA9IGdldF9zY2hlZF9yZXMoY3B1KS0+c2NoZWRfcHJpdjsKIAogICAgIEFTU0VSVCgh
aXNfaWRsZV91bml0KHVuaXQpKTsKIApAQCAtNTY5LDcgKzU5Myw3IEBAIHN0YXRpYyB2b2lkIG51
bGxfdW5pdF93YWtlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywKICAgICBlbHNlCiAgICAg
ICAgIFNDSEVEX1NUQVRfQ1JBTksodW5pdF93YWtlX25vdF9ydW5uYWJsZSk7CiAKLSAgICBpZiAo
IGxpa2VseShwZXJfY3B1KG5wYywgY3B1KS51bml0ID09IHVuaXQpICkKKyAgICBpZiAoIGxpa2Vs
eShucGMtPnVuaXQgPT0gdW5pdCkgKQogICAgIHsKICAgICAgICAgY3B1X3JhaXNlX3NvZnRpcnEo
Y3B1LCBTQ0hFRFVMRV9TT0ZUSVJRKTsKICAgICAgICAgcmV0dXJuOwpAQCAtNTgxLDcgKzYwNSw3
IEBAIHN0YXRpYyB2b2lkIG51bGxfdW5pdF93YWtlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9w
cywKICAgICAgKiBhbmQgaXRzIHByZXZpb3VzIHJlc291cmNlIGlzIGZyZWUgKGFuZCBhZmZpbml0
aWVzIG1hdGNoKSwgd2UgY2FuIGp1c3QKICAgICAgKiBhc3NpZ24gdGhlIHVuaXQgdG8gaXQgKHdl
IG93biB0aGUgcHJvcGVyIGxvY2sgYWxyZWFkeSkgYW5kIGJlIGRvbmUuCiAgICAgICovCi0gICAg
aWYgKCBwZXJfY3B1KG5wYywgY3B1KS51bml0ID09IE5VTEwgJiYKKyAgICBpZiAoIG5wYy0+dW5p
dCA9PSBOVUxMICYmCiAgICAgICAgICB1bml0X2NoZWNrX2FmZmluaXR5KHVuaXQsIGNwdSwgQkFM
QU5DRV9IQVJEX0FGRklOSVRZKSApCiAgICAgewogICAgICAgICBpZiAoICFoYXNfc29mdF9hZmZp
bml0eSh1bml0KSB8fApAQCAtNjIyLDYgKzY0Niw3IEBAIHN0YXRpYyB2b2lkIG51bGxfdW5pdF9z
bGVlcChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsCiB7CiAgICAgc3RydWN0IG51bGxfcHJp
dmF0ZSAqcHJ2ID0gbnVsbF9wcml2KG9wcyk7CiAgICAgdW5zaWduZWQgaW50IGNwdSA9IHNjaGVk
X3VuaXRfbWFzdGVyKHVuaXQpOworICAgIHN0cnVjdCBudWxsX3BjcHUgKm5wYyA9IGdldF9zY2hl
ZF9yZXMoY3B1KS0+c2NoZWRfcHJpdjsKICAgICBib29sIHRpY2tsZWQgPSBmYWxzZTsKIAogICAg
IEFTU0VSVCghaXNfaWRsZV91bml0KHVuaXQpKTsKQEAgLTY0MCw3ICs2NjUsNyBAQCBzdGF0aWMg
dm9pZCBudWxsX3VuaXRfc2xlZXAoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLAogICAgICAg
ICAgICAgbGlzdF9kZWxfaW5pdCgmbnZjLT53YWl0cV9lbGVtKTsKICAgICAgICAgICAgIHNwaW5f
dW5sb2NrKCZwcnYtPndhaXRxX2xvY2spOwogICAgICAgICB9Ci0gICAgICAgIGVsc2UgaWYgKCBw
ZXJfY3B1KG5wYywgY3B1KS51bml0ID09IHVuaXQgKQorICAgICAgICBlbHNlIGlmICggbnBjLT51
bml0ID09IHVuaXQgKQogICAgICAgICAgICAgdGlja2xlZCA9IHVuaXRfZGVhc3NpZ24ocHJ2LCB1
bml0KTsKICAgICB9CiAKQEAgLTY2Myw2ICs2ODgsNyBAQCBzdGF0aWMgdm9pZCBudWxsX3VuaXRf
bWlncmF0ZShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsCiB7CiAgICAgc3RydWN0IG51bGxf
cHJpdmF0ZSAqcHJ2ID0gbnVsbF9wcml2KG9wcyk7CiAgICAgc3RydWN0IG51bGxfdW5pdCAqbnZj
ID0gbnVsbF91bml0KHVuaXQpOworICAgIHN0cnVjdCBudWxsX3BjcHUgKm5wYzsKIAogICAgIEFT
U0VSVCghaXNfaWRsZV91bml0KHVuaXQpKTsKIApAQCAtNjg2LDcgKzcxMiw4IEBAIHN0YXRpYyB2
b2lkIG51bGxfdW5pdF9taWdyYXRlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywKICAgICAg
KiBJZiB1bml0IGlzIGFzc2lnbmVkIHRvIGEgcENQVSwgdGhlbiBzdWNoIHBDUFUgYmVjb21lcyBm
cmVlLCBhbmQgd2UKICAgICAgKiBzaG91bGQgbG9vayBpbiB0aGUgd2FpdHF1ZXVlIGlmIGFueW9u
ZSBlbHNlIGNhbiBiZSBhc3NpZ25lZCB0byBpdC4KICAgICAgKi8KLSAgICBpZiAoIGxpa2VseShw
ZXJfY3B1KG5wYywgc2NoZWRfdW5pdF9tYXN0ZXIodW5pdCkpLnVuaXQgPT0gdW5pdCkgKQorICAg
IG5wYyA9IHVuaXQtPnJlcy0+c2NoZWRfcHJpdjsKKyAgICBpZiAoIGxpa2VseShucGMtPnVuaXQg
PT0gdW5pdCkgKQogICAgIHsKICAgICAgICAgdW5pdF9kZWFzc2lnbihwcnYsIHVuaXQpOwogICAg
ICAgICBTQ0hFRF9TVEFUX0NSQU5LKG1pZ3JhdGVfcnVubmluZyk7CkBAIC03MjAsNyArNzQ3LDgg
QEAgc3RhdGljIHZvaWQgbnVsbF91bml0X21pZ3JhdGUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAq
b3BzLAogICAgICAqCiAgICAgICogSW4gbGF0dGVyLCBhbGwgd2UgY2FuIGRvIGlzIHRvIHBhcmsg
dW5pdCBpbiB0aGUgd2FpdHF1ZXVlLgogICAgICAqLwotICAgIGlmICggcGVyX2NwdShucGMsIG5l
d19jcHUpLnVuaXQgPT0gTlVMTCAmJgorICAgIG5wYyA9IGdldF9zY2hlZF9yZXMobmV3X2NwdSkt
PnNjaGVkX3ByaXY7CisgICAgaWYgKCBucGMtPnVuaXQgPT0gTlVMTCAmJgogICAgICAgICAgdW5p
dF9jaGVja19hZmZpbml0eSh1bml0LCBuZXdfY3B1LCBCQUxBTkNFX0hBUkRfQUZGSU5JVFkpICkK
ICAgICB7CiAgICAgICAgIC8qIHVuaXQgbWlnaHQgaGF2ZSBiZWVuIGluIHRoZSB3YWl0cXVldWUs
IHNvIHJlbW92ZSBpdCAqLwpAQCAtNzg4LDYgKzgxNiw3IEBAIHN0YXRpYyB2b2lkIG51bGxfc2No
ZWR1bGUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqcHJl
diwKICAgICB1bnNpZ25lZCBpbnQgYnM7CiAgICAgY29uc3QgdW5zaWduZWQgaW50IGN1cl9jcHUg
PSBzbXBfcHJvY2Vzc29yX2lkKCk7CiAgICAgY29uc3QgdW5zaWduZWQgaW50IHNjaGVkX2NwdSA9
IHNjaGVkX2dldF9yZXNvdXJjZV9jcHUoY3VyX2NwdSk7CisgICAgc3RydWN0IG51bGxfcGNwdSAq
bnBjID0gZ2V0X3NjaGVkX3JlcyhzY2hlZF9jcHUpLT5zY2hlZF9wcml2OwogICAgIHN0cnVjdCBu
dWxsX3ByaXZhdGUgKnBydiA9IG51bGxfcHJpdihvcHMpOwogICAgIHN0cnVjdCBudWxsX3VuaXQg
Knd2YzsKIApAQCAtODAyLDE0ICs4MzEsMTQgQEAgc3RhdGljIHZvaWQgbnVsbF9zY2hlZHVsZShj
b25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICpwcmV2LAogICAg
ICAgICB9IGQ7CiAgICAgICAgIGQuY3B1ID0gY3VyX2NwdTsKICAgICAgICAgZC50YXNrbGV0ID0g
dGFza2xldF93b3JrX3NjaGVkdWxlZDsKLSAgICAgICAgaWYgKCBwZXJfY3B1KG5wYywgc2NoZWRf
Y3B1KS51bml0ID09IE5VTEwgKQorICAgICAgICBpZiAoIG5wYy0+dW5pdCA9PSBOVUxMICkKICAg
ICAgICAgewogICAgICAgICAgICAgZC51bml0ID0gZC5kb20gPSAtMTsKICAgICAgICAgfQogICAg
ICAgICBlbHNlCiAgICAgICAgIHsKLSAgICAgICAgICAgIGQudW5pdCA9IHBlcl9jcHUobnBjLCBz
Y2hlZF9jcHUpLnVuaXQtPnVuaXRfaWQ7Ci0gICAgICAgICAgICBkLmRvbSA9IHBlcl9jcHUobnBj
LCBzY2hlZF9jcHUpLnVuaXQtPmRvbWFpbi0+ZG9tYWluX2lkOworICAgICAgICAgICAgZC51bml0
ID0gbnBjLT51bml0LT51bml0X2lkOworICAgICAgICAgICAgZC5kb20gPSBucGMtPnVuaXQtPmRv
bWFpbi0+ZG9tYWluX2lkOwogICAgICAgICB9CiAgICAgICAgIF9fdHJhY2VfdmFyKFRSQ19TTlVM
TF9TQ0hFRFVMRSwgMSwgc2l6ZW9mKGQpLCAmZCk7CiAgICAgfQpAQCAtODIwLDcgKzg0OSw3IEBA
IHN0YXRpYyB2b2lkIG51bGxfc2NoZWR1bGUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBz
dHJ1Y3Qgc2NoZWRfdW5pdCAqcHJldiwKICAgICAgICAgcHJldi0+bmV4dF90YXNrID0gc2NoZWRf
aWRsZV91bml0KHNjaGVkX2NwdSk7CiAgICAgfQogICAgIGVsc2UKLSAgICAgICAgcHJldi0+bmV4
dF90YXNrID0gcGVyX2NwdShucGMsIHNjaGVkX2NwdSkudW5pdDsKKyAgICAgICAgcHJldi0+bmV4
dF90YXNrID0gbnBjLT51bml0OwogICAgIHByZXYtPm5leHRfdGltZSA9IC0xOwogCiAgICAgLyoK
QEAgLTkyMSw2ICs5NTAsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHVtcF91bml0KHN0cnVjdCBu
dWxsX3ByaXZhdGUgKnBydiwgc3RydWN0IG51bGxfdW5pdCAqbnZjKQogc3RhdGljIHZvaWQgbnVs
bF9kdW1wX3BjcHUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBpbnQgY3B1KQogewogICAg
IHN0cnVjdCBudWxsX3ByaXZhdGUgKnBydiA9IG51bGxfcHJpdihvcHMpOworICAgIHN0cnVjdCBu
dWxsX3BjcHUgKm5wYyA9IGdldF9zY2hlZF9yZXMoY3B1KS0+c2NoZWRfcHJpdjsKICAgICBzdHJ1
Y3QgbnVsbF91bml0ICpudmM7CiAgICAgc3BpbmxvY2tfdCAqbG9jazsKICAgICB1bnNpZ25lZCBs
b25nIGZsYWdzOwpAQCAtOTMwLDkgKzk2MCw4IEBAIHN0YXRpYyB2b2lkIG51bGxfZHVtcF9wY3B1
KGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgaW50IGNwdSkKICAgICBwcmludGsoIkNQVVsl
MDJkXSBzaWJsaW5nPXslKnBibH0sIGNvcmU9eyUqcGJsfSIsCiAgICAgICAgICAgIGNwdSwgQ1BV
TUFTS19QUihwZXJfY3B1KGNwdV9zaWJsaW5nX21hc2ssIGNwdSkpLAogICAgICAgICAgICBDUFVN
QVNLX1BSKHBlcl9jcHUoY3B1X2NvcmVfbWFzaywgY3B1KSkpOwotICAgIGlmICggcGVyX2NwdShu
cGMsIGNwdSkudW5pdCAhPSBOVUxMICkKLSAgICAgICAgcHJpbnRrKCIsIHVuaXQ9JXBkdiVkIiwg
cGVyX2NwdShucGMsIGNwdSkudW5pdC0+ZG9tYWluLAotICAgICAgICAgICAgICAgcGVyX2NwdShu
cGMsIGNwdSkudW5pdC0+dW5pdF9pZCk7CisgICAgaWYgKCBucGMtPnVuaXQgIT0gTlVMTCApCisg
ICAgICAgIHByaW50aygiLCB1bml0PSVwZHYlZCIsIG5wYy0+dW5pdC0+ZG9tYWluLCBucGMtPnVu
aXQtPnVuaXRfaWQpOwogICAgIHByaW50aygiXG4iKTsKIAogICAgIC8qIGN1cnJlbnQgdW5pdCAo
bm90aGluZyB0byBzYXkgaWYgdGhhdCdzIHRoZSBpZGxlIHVuaXQpICovCkBAIC0xMDEwLDYgKzEw
MzksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNjaGVkdWxlciBzY2hlZF9udWxsX2RlZiA9IHsK
IAogICAgIC5pbml0ICAgICAgICAgICA9IG51bGxfaW5pdCwKICAgICAuZGVpbml0ICAgICAgICAg
PSBudWxsX2RlaW5pdCwKKyAgICAuYWxsb2NfcGRhdGEgICAgPSBudWxsX2FsbG9jX3BkYXRhLAor
ICAgIC5mcmVlX3BkYXRhICAgICA9IG51bGxfZnJlZV9wZGF0YSwKICAgICAuaW5pdF9wZGF0YSAg
ICAgPSBudWxsX2luaXRfcGRhdGEsCiAgICAgLnN3aXRjaF9zY2hlZCAgID0gbnVsbF9zd2l0Y2hf
c2NoZWQsCiAgICAgLmRlaW5pdF9wZGF0YSAgID0gbnVsbF9kZWluaXRfcGRhdGEsCi0tIAoyLjE2
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
