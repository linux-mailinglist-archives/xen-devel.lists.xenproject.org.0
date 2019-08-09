Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D638B87D6E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:01:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6MW-0007f7-TI; Fri, 09 Aug 2019 14:59:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hw6M6-0006j6-9G
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:58:58 +0000
X-Inumbo-ID: 3290b7ba-bab6-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3290b7ba-bab6-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 14:58:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 57F5AAFF3;
 Fri,  9 Aug 2019 14:58:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 16:58:20 +0200
Message-Id: <20190809145833.1020-36-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809145833.1020-1-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 35/48] xen/sched: add fall back to idle vcpu
 when scheduling unit
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBzY2hlZHVsaW5nIGFuIHVuaXQgd2l0aCBtdWx0aXBsZSB2Y3B1cyB0aGVyZSBpcyBubyBn
dWFyYW50ZWUgYWxsCnZjcHVzIGFyZSBhdmFpbGFibGUgKGUuZy4gYWJvdmUgbWF4dmNwdXMgb3Ig
dmNwdSBvZmZsaW5lKS4gRmFsbCBiYWNrIHRvCmlkbGUgdmNwdSBvZiB0aGUgY3VycmVudCBjcHUg
aW4gdGhhdCBjYXNlLiBUaGlzIHJlcXVpcmVzIHRvIHN0b3JlIHRoZQpjb3JyZWN0IHNjaGVkdWxl
X3VuaXQgcG9pbnRlciBpbiB0aGUgaWRsZSB2Y3B1IGFzIGxvbmcgYXMgaXQgdXNlZCBhcwpmYWxs
YmFjayB2Y3B1LgoKSW4gb3JkZXIgdG8gbW9kaWZ5IHRoZSBydW5zdGF0ZXMgb2YgdGhlIGNvcnJl
Y3QgdmNwdXMgd2hlbiBzd2l0Y2hpbmcKc2NoZWR1bGUgdW5pdHMgbWVyZ2Ugc2NoZWRfdW5pdF9y
dW5zdGF0ZV9jaGFuZ2UoKSBpbnRvCnNjaGVkX3N3aXRjaF91bml0cygpIGFuZCBsb29wIG92ZXIg
dGhlIGFmZmVjdGVkIHBoeXNpY2FsIGNwdXMgaW5zdGVhZApvZiB0aGUgdW5pdCdzIHZjcHVzLiBU
aGlzIGluIHR1cm4gcmVxdWlyZXMgYW4gYWNjZXNzIGZ1bmN0aW9uIHRvIHRoZQpjdXJyZW50IHZh
cmlhYmxlIG9mIG90aGVyIGNwdXMuCgpUb2RheSBjb250ZXh0X3NhdmVkKCkgaXMgY2FsbGVkIGlu
IGNhc2UgcHJldmlvdXMgYW5kIG5leHQgdmNwdXMgZGlmZmVyCndoZW4gZG9pbmcgYSBjb250ZXh0
IHN3aXRjaC4gV2l0aCBhbiBpZGxlIHZjcHUgYmVpbmcgY2FwYWJsZSB0byBiZSBhCnN1YnN0aXR1
dGUgZm9yIGFuIG9mZmxpbmUgdmNwdSB0aGlzIGlzIHByb2JsZW1hdGljIHdoZW4gc3dpdGNoaW5n
IHRvCmFuIGlkbGUgc2NoZWR1bGluZyB1bml0LiBBbiBpZGxlIHByZXZpb3VzIHZjcHUgbGVhdmVz
IHVzIGluIGRvdWJ0IHdoaWNoCnNjaGVkdWxlIHVuaXQgd2FzIGFjdGl2ZSBwcmV2aW91c2x5LCBz
byBzYXZlIHRoZSBwcmV2aW91cyB1bml0IHBvaW50ZXIKaW4gdGhlIHBlci1zY2hlZHVsZSByZXNv
dXJjZSBhcmVhIGFuZCB1c2UgaXRzIHZhbHVlIGJlaW5nIG5vbi1OVUxMIGFzCmEgaGludCB3aGV0
aGVyIGNvbnRleHRfc2F2ZWQoKSBzaG91bGQgYmUgY2FsbGVkLgoKV2hlbiBydW5uaW5nIGFuIGlk
bGUgdmNwdSBpbiBhIG5vbi1pZGxlIHNjaGVkdWxpbmcgdW5pdCB1c2UgYSBzcGVjaWZpYwpndWVz
dCBpZGxlIGxvb3Agbm90IHBlcmZvcm1pbmcgYW55IHRhc2tsZXRzIGFuZCBsaXZlcGF0Y2hpbmcg
aW4gb3JkZXIKdG8gYXZvaWQgcG9wdWxhdGluZyB0aGUgY3B1IGNhY2hlcyB3aXRoIG1lbW9yeSB1
c2VkIGJ5IG90aGVyIGRvbWFpbnMKKGFzIGZhciBhcyBwb3NzaWJsZSkuIFNvZnRpcnFzIGFyZSBj
b25zaWRlcmVkIHRvIGJlIHNhdmUuCgpJbiBvcmRlciB0byBhdm9pZCBsaXZlcGF0Y2hpbmcgd2hl
biBnb2luZyB0byBndWVzdCBpZGxlIGFub3RoZXIKdmFyaWFudCBvZiByZXNldF9zdGFja19hbmRf
anVtcCgpIG5vdCBjYWxsaW5nIGNoZWNrX2Zvcl9saXZlcGF0Y2hfd29yawppcyBuZWVkZWQuCgpT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpSRkMgVjI6
Ci0gbmV3IHBhdGNoIChBbmRyZXcgQ29vcGVyKQoKVjE6Ci0gdXNlIHVyZ2VudF9jb3VudCB0byBz
ZWxlY3QgY29ycmVjdCBpZGxlIHJvdXRpbmUgKEphbiBCZXVsaWNoKQoKVjI6Ci0gc2V0IHZjcHUt
PmlzX3J1bm5pbmcgaW4gY29udGV4dF9zYXZlZCgpCi0gaW50cm9kdWNlIHJlc2V0X3N0YWNrX2Fu
ZF9qdW1wX25vbHAoKSAoSmFuIEJldWxpY2gpCi0gcmVhZGQgc2NydWJiaW5nIChKYW4gQmV1bGlj
aCwgQW5kcmV3IENvb3BlcikKLSBnZXRfY3B1X2N1cnJlbnQoKSBfTk9UXyBtb3ZlZCB0byBpbmNs
dWRlL2FzbS14ODYvY3VycmVudC5oIGFzIHRoZQogIG5lZWRlZCByZWZlcmVuY2Ugb2Ygc3RhY2tf
YmFzZVtdIHJlc3VsdHMgaW4gYSAjaW5jbHVkZSBoZWxsCi0tLQogeGVuL2FyY2gveDg2L2RvbWFp
bi5jICAgICAgICAgfCAgMjMgKysrKysrCiB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgICAgICAgICB8
IDE2OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIHhlbi9pbmNs
dWRlL2FzbS1hcm0vY3VycmVudC5oIHwgICAxICsKIHhlbi9pbmNsdWRlL2FzbS14ODYvY3VycmVu
dC5oIHwgIDE5ICsrKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L3NtcC5oICAgICB8ICAgMyArCiB4
ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaCAgICB8ICAgNCArLQogeGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmggICAgICAgfCAgIDEgKwogNyBmaWxlcyBjaGFuZ2VkLCAxNjYgaW5zZXJ0aW9ucygrKSwg
NTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIveGVu
L2FyY2gveDg2L2RvbWFpbi5jCmluZGV4IGM0NWJlYzg4NjQuLjdiMjRkOGZhNDggMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKQEAg
LTE1OSw2ICsxNTksMjUgQEAgc3RhdGljIHZvaWQgaWRsZV9sb29wKHZvaWQpCiAgICAgfQogfQog
CisvKgorICogSWRsZSBsb29wIGZvciBzaWJsaW5ncyBpbiBhY3RpdmUgc2NoZWR1bGUgdW5pdHMu
CisgKiBXZSBkb24ndCBkbyBhbnkgc3RhbmRhcmQgaWRsZSB3b3JrIGxpa2UgdGFza2xldHMgb3Ig
bGl2ZXBhdGNoaW5nLgorICovCitzdGF0aWMgdm9pZCBndWVzdF9pZGxlX2xvb3Aodm9pZCkKK3sK
KyAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOworCisgICAgZm9yICgg
OyA7ICkKKyAgICB7CisgICAgICAgIEFTU0VSVCghY3B1X2lzX29mZmxpbmUoY3B1KSk7CisKKyAg
ICAgICAgaWYgKCAhc29mdGlycV9wZW5kaW5nKGNwdSkgJiYgIXNjcnViX2ZyZWVfcGFnZXMoKSAm
JgorICAgICAgICAgICAgICFzb2Z0aXJxX3BlbmRpbmcoY3B1KSkKKyAgICAgICAgICAgIHNjaGVk
X2d1ZXN0X2lkbGUocG1faWRsZSwgY3B1KTsKKyAgICAgICAgZG9fc29mdGlycSgpOworICAgIH0K
K30KKwogdm9pZCBzdGFydHVwX2NwdV9pZGxlX2xvb3Aodm9pZCkKIHsKICAgICBzdHJ1Y3QgdmNw
dSAqdiA9IGN1cnJlbnQ7CkBAIC0xNzIsNiArMTkxLDEwIEBAIHZvaWQgc3RhcnR1cF9jcHVfaWRs
ZV9sb29wKHZvaWQpCiAKIHN0YXRpYyB2b2lkIG5vcmV0dXJuIGNvbnRpbnVlX2lkbGVfZG9tYWlu
KHN0cnVjdCB2Y3B1ICp2KQogeworICAgIC8qIElkbGUgdmNwdXMgbWlnaHQgYmUgYXR0YWNoZWQg
dG8gbm9uLWlkbGUgdW5pdHMhICovCisgICAgaWYgKCAhaXNfaWRsZV9kb21haW4odi0+c2NoZWRf
dW5pdC0+ZG9tYWluKSApCisgICAgICAgIHJlc2V0X3N0YWNrX2FuZF9qdW1wX25vbHAoZ3Vlc3Rf
aWRsZV9sb29wKTsKKwogICAgIHJlc2V0X3N0YWNrX2FuZF9qdW1wKGlkbGVfbG9vcCk7CiB9CiAK
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUu
YwppbmRleCAxM2QzMzkyNjQwLi41Y2Q3ZDJkODU3IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC0xMzMsMTAgKzEzMywyMSBA
QCBzdGF0aWMgc3RydWN0IHNjaGVkdWxlciBzY2hlZF9pZGxlX29wcyA9IHsKICAgICAuc3dpdGNo
X3NjaGVkICAgPSBzY2hlZF9pZGxlX3N3aXRjaF9zY2hlZCwKIH07CiAKK3N0YXRpYyBpbmxpbmUg
c3RydWN0IHZjcHUgKnVuaXQydmNwdV9jcHUoc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjcHUpCit7
CisgICAgdW5zaWduZWQgaW50IGlkeCA9IHVuaXQtPnVuaXRfaWQgKyBwZXJfY3B1KHNjaGVkX3Jl
c19pZHgsIGNwdSk7CisgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCA9IHVuaXQtPmRvbWFpbjsK
KworICAgIHJldHVybiAoaWR4IDwgZC0+bWF4X3ZjcHVzKSA/IGQtPnZjcHVbaWR4XSA6IE5VTEw7
Cit9CisKIHN0YXRpYyBpbmxpbmUgc3RydWN0IHZjcHUgKnNjaGVkX3VuaXQydmNwdV9jcHUoc3Ry
dWN0IHNjaGVkX3VuaXQgKnVuaXQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjcHUpCiB7Ci0gICAgcmV0dXJuIHVuaXQtPmRvbWFp
bi0+dmNwdVt1bml0LT51bml0X2lkICsgcGVyX2NwdShzY2hlZF9yZXNfaWR4LCBjcHUpXTsKKyAg
ICBzdHJ1Y3QgdmNwdSAqdiA9IHVuaXQydmNwdV9jcHUodW5pdCwgY3B1KTsKKworICAgIHJldHVy
biAodiAmJiB2LT5uZXdfc3RhdGUgPT0gUlVOU1RBVEVfcnVubmluZykgPyB2IDogaWRsZV92Y3B1
W2NwdV07CiB9CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0IHNjaGVkdWxlciAqZG9tX3NjaGVkdWxl
cihjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQpAQCAtMjU2LDggKzI2NywxMSBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgdmNwdV9ydW5zdGF0ZV9jaGFuZ2UoCiAKICAgICB0cmFjZV9ydW5zdGF0ZV9jaGFu
Z2UodiwgbmV3X3N0YXRlKTsKIAotICAgIHVuaXQtPnJ1bnN0YXRlX2NudFt2LT5ydW5zdGF0ZS5z
dGF0ZV0tLTsKLSAgICB1bml0LT5ydW5zdGF0ZV9jbnRbbmV3X3N0YXRlXSsrOworICAgIGlmICgg
IWlzX2lkbGVfdmNwdSh2KSApCisgICAgeworICAgICAgICB1bml0LT5ydW5zdGF0ZV9jbnRbdi0+
cnVuc3RhdGUuc3RhdGVdLS07CisgICAgICAgIHVuaXQtPnJ1bnN0YXRlX2NudFtuZXdfc3RhdGVd
Kys7CisgICAgfQogCiAgICAgZGVsdGEgPSBuZXdfZW50cnlfdGltZSAtIHYtPnJ1bnN0YXRlLnN0
YXRlX2VudHJ5X3RpbWU7CiAgICAgaWYgKCBkZWx0YSA+IDAgKQpAQCAtMjY5LDE5ICsyODMsMTEg
QEAgc3RhdGljIGlubGluZSB2b2lkIHZjcHVfcnVuc3RhdGVfY2hhbmdlKAogICAgIHYtPnJ1bnN0
YXRlLnN0YXRlID0gbmV3X3N0YXRlOwogfQogCi1zdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfdW5p
dF9ydW5zdGF0ZV9jaGFuZ2Uoc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsCi0gICAgYm9vbCBydW5u
aW5nLCBzX3RpbWVfdCBuZXdfZW50cnlfdGltZSkKK3ZvaWQgc2NoZWRfZ3Vlc3RfaWRsZSh2b2lk
ICgqaWRsZSkgKHZvaWQpLCB1bnNpZ25lZCBpbnQgY3B1KQogewotICAgIHN0cnVjdCB2Y3B1ICp2
OwotCi0gICAgZm9yX2VhY2hfc2NoZWRfdW5pdF92Y3B1ICggdW5pdCwgdiApCi0gICAgICAgIGlm
ICggcnVubmluZyApCi0gICAgICAgICAgICB2Y3B1X3J1bnN0YXRlX2NoYW5nZSh2LCB2LT5uZXdf
c3RhdGUsIG5ld19lbnRyeV90aW1lKTsKLSAgICAgICAgZWxzZQotICAgICAgICAgICAgdmNwdV9y
dW5zdGF0ZV9jaGFuZ2UodiwKLSAgICAgICAgICAgICAgICAoKHYtPnBhdXNlX2ZsYWdzICYgVlBG
X2Jsb2NrZWQpID8gUlVOU1RBVEVfYmxvY2tlZCA6Ci0gICAgICAgICAgICAgICAgICh2Y3B1X3J1
bm5hYmxlKHYpID8gUlVOU1RBVEVfcnVubmFibGUgOiBSVU5TVEFURV9vZmZsaW5lKSksCi0gICAg
ICAgICAgICAgICAgbmV3X2VudHJ5X3RpbWUpOworICAgIGF0b21pY19pbmMoJmdldF9zY2hlZF9y
ZXMoY3B1KS0+dXJnZW50X2NvdW50KTsKKyAgICBpZGxlKCk7CisgICAgYXRvbWljX2RlYygmZ2V0
X3NjaGVkX3JlcyhjcHUpLT51cmdlbnRfY291bnQpOwogfQogCiB2b2lkIHZjcHVfcnVuc3RhdGVf
Z2V0KHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvICpydW5zdGF0ZSkK
QEAgLTUxOSw2ICs1MjUsNyBAQCBpbnQgc2NoZWRfaW5pdF92Y3B1KHN0cnVjdCB2Y3B1ICp2KQog
ICAgIGlmICggaXNfaWRsZV9kb21haW4oZCkgKQogICAgIHsKICAgICAgICAgZ2V0X3NjaGVkX3Jl
cyh2LT5wcm9jZXNzb3IpLT5jdXJyID0gdW5pdDsKKyAgICAgICAgZ2V0X3NjaGVkX3Jlcyh2LT5w
cm9jZXNzb3IpLT5zY2hlZF91bml0X2lkbGUgPSB1bml0OwogICAgICAgICB2LT5pc19ydW5uaW5n
ID0gMTsKICAgICAgICAgdW5pdC0+aXNfcnVubmluZyA9IDE7CiAgICAgICAgIHVuaXQtPnN0YXRl
X2VudHJ5X3RpbWUgPSBOT1coKTsKQEAgLTE3NDgsMzIgKzE3NTUsNjUgQEAgc3RhdGljIHZvaWQg
c2NoZWRfc3dpdGNoX3VuaXRzKHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc2QsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNjaGVkX3VuaXQgKm5leHQsIHN0cnVjdCBzY2hl
ZF91bml0ICpwcmV2LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNfdGltZV90IG5v
dykKIHsKLSAgICBzZC0+Y3VyciA9IG5leHQ7Ci0KLSAgICBUUkFDRV8zRChUUkNfU0NIRURfU1dJ
VENIX0lORlBSRVYsIHByZXYtPmRvbWFpbi0+ZG9tYWluX2lkLCBwcmV2LT51bml0X2lkLAotICAg
ICAgICAgICAgIG5vdyAtIHByZXYtPnN0YXRlX2VudHJ5X3RpbWUpOwotICAgIFRSQUNFXzREKFRS
Q19TQ0hFRF9TV0lUQ0hfSU5GTkVYVCwgbmV4dC0+ZG9tYWluLT5kb21haW5faWQsIG5leHQtPnVu
aXRfaWQsCi0gICAgICAgICAgICAgKG5leHQtPnZjcHVfbGlzdC0+cnVuc3RhdGUuc3RhdGUgPT0g
UlVOU1RBVEVfcnVubmFibGUpID8KLSAgICAgICAgICAgICAobm93IC0gbmV4dC0+c3RhdGVfZW50
cnlfdGltZSkgOiAwLCBwcmV2LT5uZXh0X3RpbWUpOworICAgIGludCBjcHU7CiAKICAgICBBU1NF
UlQodW5pdF9ydW5uaW5nKHByZXYpKTsKIAotICAgIFRSQUNFXzREKFRSQ19TQ0hFRF9TV0lUQ0gs
IHByZXYtPmRvbWFpbi0+ZG9tYWluX2lkLCBwcmV2LT51bml0X2lkLAotICAgICAgICAgICAgIG5l
eHQtPmRvbWFpbi0+ZG9tYWluX2lkLCBuZXh0LT51bml0X2lkKTsKKyAgICBpZiAoIHByZXYgIT0g
bmV4dCApCisgICAgeworICAgICAgICBzZC0+Y3VyciA9IG5leHQ7CisgICAgICAgIHNkLT5wcmV2
ID0gcHJldjsKIAotICAgIHNjaGVkX3VuaXRfcnVuc3RhdGVfY2hhbmdlKHByZXYsIGZhbHNlLCBu
b3cpOworICAgICAgICBUUkFDRV8zRChUUkNfU0NIRURfU1dJVENIX0lORlBSRVYsIHByZXYtPmRv
bWFpbi0+ZG9tYWluX2lkLAorICAgICAgICAgICAgICAgICBwcmV2LT51bml0X2lkLCBub3cgLSBw
cmV2LT5zdGF0ZV9lbnRyeV90aW1lKTsKKyAgICAgICAgVFJBQ0VfNEQoVFJDX1NDSEVEX1NXSVRD
SF9JTkZORVhULCBuZXh0LT5kb21haW4tPmRvbWFpbl9pZCwKKyAgICAgICAgICAgICAgICAgbmV4
dC0+dW5pdF9pZCwKKyAgICAgICAgICAgICAgICAgKG5leHQtPnZjcHVfbGlzdC0+cnVuc3RhdGUu
c3RhdGUgPT0gUlVOU1RBVEVfcnVubmFibGUpID8KKyAgICAgICAgICAgICAgICAgKG5vdyAtIG5l
eHQtPnN0YXRlX2VudHJ5X3RpbWUpIDogMCwgcHJldi0+bmV4dF90aW1lKTsKKyAgICAgICAgVFJB
Q0VfNEQoVFJDX1NDSEVEX1NXSVRDSCwgcHJldi0+ZG9tYWluLT5kb21haW5faWQsIHByZXYtPnVu
aXRfaWQsCisgICAgICAgICAgICAgICAgIG5leHQtPmRvbWFpbi0+ZG9tYWluX2lkLCBuZXh0LT51
bml0X2lkKTsKIAotICAgIEFTU0VSVCghdW5pdF9ydW5uaW5nKG5leHQpKTsKLSAgICBzY2hlZF91
bml0X3J1bnN0YXRlX2NoYW5nZShuZXh0LCB0cnVlLCBub3cpOworICAgICAgICBBU1NFUlQoIXVu
aXRfcnVubmluZyhuZXh0KSk7CiAKLSAgICAvKgotICAgICAqIE5CLiBEb24ndCBhZGQgYW55IHRy
YWNlIHJlY29yZHMgZnJvbSBoZXJlIHVudGlsIHRoZSBhY3R1YWwgY29udGV4dAotICAgICAqIHN3
aXRjaCwgZWxzZSBsb3N0X3JlY29yZHMgcmVzdW1lIHdpbGwgbm90IHdvcmsgcHJvcGVybHkuCi0g
ICAgICovCisgICAgICAgIC8qCisgICAgICAgICAqIE5CLiBEb24ndCBhZGQgYW55IHRyYWNlIHJl
Y29yZHMgZnJvbSBoZXJlIHVudGlsIHRoZSBhY3R1YWwgY29udGV4dAorICAgICAgICAgKiBzd2l0
Y2gsIGVsc2UgbG9zdF9yZWNvcmRzIHJlc3VtZSB3aWxsIG5vdCB3b3JrIHByb3Blcmx5LgorICAg
ICAgICAgKi8KIAotICAgIEFTU0VSVCghbmV4dC0+aXNfcnVubmluZyk7Ci0gICAgbmV4dC0+dmNw
dV9saXN0LT5pc19ydW5uaW5nID0gMTsKLSAgICBuZXh0LT5pc19ydW5uaW5nID0gMTsKKyAgICAg
ICAgQVNTRVJUKCFuZXh0LT5pc19ydW5uaW5nKTsKKyAgICAgICAgbmV4dC0+aXNfcnVubmluZyA9
IDE7CisKKyAgICAgICAgaWYgKCBpc19pZGxlX3VuaXQocHJldikgKQorICAgICAgICB7CisgICAg
ICAgICAgICBwcmV2LT5ydW5zdGF0ZV9jbnRbUlVOU1RBVEVfcnVubmluZ10gPSAwOworICAgICAg
ICAgICAgcHJldi0+cnVuc3RhdGVfY250W1JVTlNUQVRFX3J1bm5hYmxlXSA9IHNjaGVkX2dyYW51
bGFyaXR5OworICAgICAgICB9CisgICAgICAgIGlmICggaXNfaWRsZV91bml0KG5leHQpICkKKyAg
ICAgICAgeworICAgICAgICAgICAgbmV4dC0+cnVuc3RhdGVfY250W1JVTlNUQVRFX3J1bm5pbmdd
ID0gc2NoZWRfZ3JhbnVsYXJpdHk7CisgICAgICAgICAgICBuZXh0LT5ydW5zdGF0ZV9jbnRbUlVO
U1RBVEVfcnVubmFibGVdID0gMDsKKyAgICAgICAgfQorICAgIH0KKworICAgIGZvcl9lYWNoX2Nw
dSAoIGNwdSwgc2QtPmNwdXMgKQorICAgIHsKKyAgICAgICAgc3RydWN0IHZjcHUgKnZwcmV2ID0g
Z2V0X2NwdV9jdXJyZW50KGNwdSk7CisgICAgICAgIHN0cnVjdCB2Y3B1ICp2bmV4dCA9IHNjaGVk
X3VuaXQydmNwdV9jcHUobmV4dCwgY3B1KTsKKworICAgICAgICBpZiAoIHZwcmV2ICE9IHZuZXh0
IHx8IHZwcmV2LT5ydW5zdGF0ZS5zdGF0ZSAhPSB2bmV4dC0+bmV3X3N0YXRlICkKKyAgICAgICAg
eworICAgICAgICAgICAgdmNwdV9ydW5zdGF0ZV9jaGFuZ2UodnByZXYsCisgICAgICAgICAgICAg
ICAgKCh2cHJldi0+cGF1c2VfZmxhZ3MgJiBWUEZfYmxvY2tlZCkgPyBSVU5TVEFURV9ibG9ja2Vk
IDoKKyAgICAgICAgICAgICAgICAgKHZjcHVfcnVubmFibGUodnByZXYpID8gUlVOU1RBVEVfcnVu
bmFibGUgOiBSVU5TVEFURV9vZmZsaW5lKSksCisgICAgICAgICAgICAgICAgbm93KTsKKyAgICAg
ICAgICAgIHZjcHVfcnVuc3RhdGVfY2hhbmdlKHZuZXh0LCB2bmV4dC0+bmV3X3N0YXRlLCBub3cp
OworICAgICAgICB9CisKKyAgICAgICAgdm5leHQtPmlzX3J1bm5pbmcgPSAxOworCisgICAgICAg
IGlmICggaXNfaWRsZV92Y3B1KHZuZXh0KSApCisgICAgICAgICAgICB2bmV4dC0+c2NoZWRfdW5p
dCA9IG5leHQ7CisgICAgfQogfQogCiBzdGF0aWMgYm9vbCBzY2hlZF90YXNrbGV0X2NoZWNrX2Nw
dSh1bnNpZ25lZCBpbnQgY3B1KQpAQCAtMTgyOSwyOSArMTg2OSw0OCBAQCBzdGF0aWMgc3RydWN0
IHNjaGVkX3VuaXQgKmRvX3NjaGVkdWxlKHN0cnVjdCBzY2hlZF91bml0ICpwcmV2LCBzX3RpbWVf
dCBub3csCiAgICAgaWYgKCBwcmV2LT5uZXh0X3RpbWUgPj0gMCApIC8qIC12ZSBtZWFucyBubyBs
aW1pdCAqLwogICAgICAgICBzZXRfdGltZXIoJnNkLT5zX3RpbWVyLCBub3cgKyBwcmV2LT5uZXh0
X3RpbWUpOwogCi0gICAgaWYgKCBsaWtlbHkocHJldiAhPSBuZXh0KSApCi0gICAgICAgIHNjaGVk
X3N3aXRjaF91bml0cyhzZCwgbmV4dCwgcHJldiwgbm93KTsKKyAgICBzY2hlZF9zd2l0Y2hfdW5p
dHMoc2QsIG5leHQsIHByZXYsIG5vdyk7CiAKICAgICByZXR1cm4gbmV4dDsKIH0KIAotc3RhdGlj
IHZvaWQgY29udGV4dF9zYXZlZChzdHJ1Y3QgdmNwdSAqcHJldikKK3N0YXRpYyB2b2lkIGNvbnRl
eHRfc2F2ZWQoc3RydWN0IHNjaGVkX3Jlc291cmNlICpzZCwgc3RydWN0IHZjcHUgKnZwcmV2LAor
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdmNwdSAqdm5leHQpCiB7Ci0gICAgc3Ry
dWN0IHNjaGVkX3VuaXQgKnVuaXQgPSBwcmV2LT5zY2hlZF91bml0OworICAgIHN0cnVjdCBzY2hl
ZF91bml0ICp1bml0ID0gc2QtPnByZXY7CisgICAgaW50IGNwdTsKIAogICAgIC8qIENsZWFyIHJ1
bm5pbmcgZmxhZyAvYWZ0ZXIvIHdyaXRpbmcgY29udGV4dCB0byBtZW1vcnkuICovCiAgICAgc21w
X3dtYigpOwogCi0gICAgcHJldi0+aXNfcnVubmluZyA9IDA7CisgICAgaWYgKCAhc2QtPnByZXYg
KQorICAgIHsKKyAgICAgICAgaWYgKCB2cHJldiAhPSB2bmV4dCApCisgICAgICAgICAgICB2cHJl
di0+aXNfcnVubmluZyA9IDA7CisgICAgICAgIHJldHVybjsKKyAgICB9CisKKyAgICBmb3JfZWFj
aF9jcHUgKCBjcHUsIHNkLT5jcHVzICkKKyAgICB7CisgICAgICAgIHN0cnVjdCB2Y3B1ICp2ID0g
dW5pdDJ2Y3B1X2NwdSh1bml0LCBjcHUpOworCisgICAgICAgIGlmICggIXYgfHwgIXYtPmlzX3J1
bm5pbmcgKQorICAgICAgICAgICAgdiA9IGlkbGVfdmNwdVtjcHVdOworICAgICAgICBpZiAoIHYg
IT0gdm5leHQgKQorICAgICAgICAgICAgdi0+aXNfcnVubmluZyA9IDA7CisgICAgfQogICAgIHVu
aXQtPmlzX3J1bm5pbmcgPSAwOwogICAgIHVuaXQtPnN0YXRlX2VudHJ5X3RpbWUgPSBOT1coKTsK
KyAgICBzZC0+cHJldiA9IE5VTEw7CiAKICAgICAvKiBDaGVjayBmb3IgbWlncmF0aW9uIHJlcXVl
c3QgL2FmdGVyLyBjbGVhcmluZyBydW5uaW5nIGZsYWcuICovCiAgICAgc21wX21iKCk7CiAKLSAg
ICBzY2hlZF9jb250ZXh0X3NhdmVkKHZjcHVfc2NoZWR1bGVyKHByZXYpLCB1bml0KTsKKyAgICBz
Y2hlZF9jb250ZXh0X3NhdmVkKHVuaXRfc2NoZWR1bGVyKHVuaXQpLCB1bml0KTsKIAotICAgIHNj
aGVkX3VuaXRfbWlncmF0ZV9maW5pc2godW5pdCk7CisgICAgLyogSWRsZSBuZXZlciBtaWdyYXRl
cyBhbmQgaWRsZSB2Y3B1cyBtaWdodCBiZWxvbmcgdG8gb3RoZXIgdW5pdHMuICovCisgICAgaWYg
KCAhaXNfaWRsZV91bml0KHVuaXQpICkKKyAgICAgICAgc2NoZWRfdW5pdF9taWdyYXRlX2Zpbmlz
aCh1bml0KTsKIH0KIAogLyoKQEAgLTE4NjgsNiArMTkyNyw3IEBAIHN0YXRpYyB2b2lkIGNvbnRl
eHRfc2F2ZWQoc3RydWN0IHZjcHUgKnByZXYpCiB2b2lkIHNjaGVkX2NvbnRleHRfc3dpdGNoZWQo
c3RydWN0IHZjcHUgKnZwcmV2LCBzdHJ1Y3QgdmNwdSAqdm5leHQpCiB7CiAgICAgc3RydWN0IHNj
aGVkX3VuaXQgKm5leHQgPSB2bmV4dC0+c2NoZWRfdW5pdDsKKyAgICBzdHJ1Y3Qgc2NoZWRfcmVz
b3VyY2UgKnNkID0gZ2V0X3NjaGVkX3JlcyhzbXBfcHJvY2Vzc29yX2lkKCkpOwogCiAgICAgaWYg
KCBhdG9taWNfcmVhZCgmbmV4dC0+cmVuZGV6dm91c19vdXRfY250KSApCiAgICAgewpAQCAtMTg3
NiwyMCArMTkzNiwyMiBAQCB2b2lkIHNjaGVkX2NvbnRleHRfc3dpdGNoZWQoc3RydWN0IHZjcHUg
KnZwcmV2LCBzdHJ1Y3QgdmNwdSAqdm5leHQpCiAgICAgICAgIC8qIENhbGwgY29udGV4dF9zYXZl
ZCgpIGJlZm9yZSByZWxlYXNpbmcgb3RoZXIgd2FpdGVycy4gKi8KICAgICAgICAgaWYgKCBjbnQg
PT0gMSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGlmICggdnByZXYgIT0gdm5leHQgKQotICAg
ICAgICAgICAgICAgIGNvbnRleHRfc2F2ZWQodnByZXYpOworICAgICAgICAgICAgY29udGV4dF9z
YXZlZChzZCwgdnByZXYsIHZuZXh0KTsKICAgICAgICAgICAgIGF0b21pY19zZXQoJm5leHQtPnJl
bmRlenZvdXNfb3V0X2NudCwgMCk7CiAgICAgICAgIH0KICAgICAgICAgZWxzZQogICAgICAgICAg
ICAgd2hpbGUgKCBhdG9taWNfcmVhZCgmbmV4dC0+cmVuZGV6dm91c19vdXRfY250KSApCiAgICAg
ICAgICAgICAgICAgY3B1X3JlbGF4KCk7CiAgICAgfQotICAgIGVsc2UgaWYgKCB2cHJldiAhPSB2
bmV4dCAmJiBzY2hlZF9ncmFudWxhcml0eSA9PSAxICkKLSAgICAgICAgY29udGV4dF9zYXZlZCh2
cHJldik7CisgICAgZWxzZQorICAgICAgICBjb250ZXh0X3NhdmVkKHNkLCB2cHJldiwgdm5leHQp
OworCisgICAgaWYgKCBpc19pZGxlX3ZjcHUodnByZXYpICYmIHZwcmV2ICE9IHZuZXh0ICkKKyAg
ICAgICAgdnByZXYtPnNjaGVkX3VuaXQgPSBzZC0+c2NoZWRfdW5pdF9pZGxlOwogfQogCiBzdGF0
aWMgdm9pZCBzY2hlZF9jb250ZXh0X3N3aXRjaChzdHJ1Y3QgdmNwdSAqdnByZXYsIHN0cnVjdCB2
Y3B1ICp2bmV4dCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNfdGltZV90IG5v
dykKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcmVzZXRfaWRsZV91bml0
LCBzX3RpbWVfdCBub3cpCiB7CiAgICAgaWYgKCB1bmxpa2VseSh2cHJldiA9PSB2bmV4dCkgKQog
ICAgIHsKQEAgLTE4OTgsNiArMTk2MCwxMSBAQCBzdGF0aWMgdm9pZCBzY2hlZF9jb250ZXh0X3N3
aXRjaChzdHJ1Y3QgdmNwdSAqdnByZXYsIHN0cnVjdCB2Y3B1ICp2bmV4dCwKICAgICAgICAgICAg
ICAgICAgbm93IC0gdnByZXYtPnJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWUsCiAgICAgICAgICAg
ICAgICAgIHZwcmV2LT5zY2hlZF91bml0LT5uZXh0X3RpbWUpOwogICAgICAgICBzY2hlZF9jb250
ZXh0X3N3aXRjaGVkKHZwcmV2LCB2bmV4dCk7CisKKyAgICAgICAgaWYgKCByZXNldF9pZGxlX3Vu
aXQgKQorICAgICAgICAgICAgdm5leHQtPnNjaGVkX3VuaXQgPQorICAgICAgICAgICAgICAgIGdl
dF9zY2hlZF9yZXMoc21wX3Byb2Nlc3Nvcl9pZCgpKS0+c2NoZWRfdW5pdF9pZGxlOworCiAgICAg
ICAgIHRyYWNlX2NvbnRpbnVlX3J1bm5pbmcodm5leHQpOwogICAgICAgICByZXR1cm4gY29udGlu
dWVfcnVubmluZyh2cHJldik7CiAgICAgfQpAQCAtMTk1Niw3ICsyMDIzLDcgQEAgc3RhdGljIHN0
cnVjdCBzY2hlZF91bml0ICpzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4oc3RydWN0IHNjaGVkX3Vu
aXQgKnByZXYsCiAgICAgICAgICAgICBwY3B1X3NjaGVkdWxlX3VubG9ja19pcnEoKmxvY2ssIGNw
dSk7CiAKICAgICAgICAgICAgIHJhaXNlX3NvZnRpcnEoU0NIRURfU0xBVkVfU09GVElSUSk7Ci0g
ICAgICAgICAgICBzY2hlZF9jb250ZXh0X3N3aXRjaCh2cHJldiwgdnByZXYsIG5vdyk7CisgICAg
ICAgICAgICBzY2hlZF9jb250ZXh0X3N3aXRjaCh2cHJldiwgdnByZXYsIGZhbHNlLCBub3cpOwog
ICAgICAgICB9CiAKICAgICAgICAgcGNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKCpsb2NrLCBjcHUp
OwpAQCAtMTk5NSw3ICsyMDYyLDggQEAgc3RhdGljIHZvaWQgc2NoZWRfc2xhdmUodm9pZCkKIAog
ICAgIHBjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCBjcHUpOwogCi0gICAgc2NoZWRfY29u
dGV4dF9zd2l0Y2godnByZXYsIHNjaGVkX3VuaXQydmNwdV9jcHUobmV4dCwgY3B1KSwgbm93KTsK
KyAgICBzY2hlZF9jb250ZXh0X3N3aXRjaCh2cHJldiwgc2NoZWRfdW5pdDJ2Y3B1X2NwdShuZXh0
LCBjcHUpLAorICAgICAgICAgICAgICAgICAgICAgICAgIGlzX2lkbGVfdW5pdChuZXh0KSAmJiAh
aXNfaWRsZV91bml0KHByZXYpLCBub3cpOwogfQogCiAvKgpAQCAtMjA1NSw3ICsyMTIzLDggQEAg
c3RhdGljIHZvaWQgc2NoZWR1bGUodm9pZCkKICAgICBwY3B1X3NjaGVkdWxlX3VubG9ja19pcnEo
bG9jaywgY3B1KTsKIAogICAgIHZuZXh0ID0gc2NoZWRfdW5pdDJ2Y3B1X2NwdShuZXh0LCBjcHUp
OwotICAgIHNjaGVkX2NvbnRleHRfc3dpdGNoKHZwcmV2LCB2bmV4dCwgbm93KTsKKyAgICBzY2hl
ZF9jb250ZXh0X3N3aXRjaCh2cHJldiwgdm5leHQsCisgICAgICAgICAgICAgICAgICAgICAgICAg
IWlzX2lkbGVfdW5pdChwcmV2KSAmJiBpc19pZGxlX3VuaXQobmV4dCksIG5vdyk7CiB9CiAKIC8q
IFRoZSBzY2hlZHVsZXIgdGltZXI6IGZvcmNlIGEgcnVuIHRocm91Z2ggdGhlIHNjaGVkdWxlciAq
LwpAQCAtMjEyNiw2ICsyMTk1LDcgQEAgc3RhdGljIGludCBjcHVfc2NoZWR1bGVfdXAodW5zaWdu
ZWQgaW50IGNwdSkKICAgICAgKi8KIAogICAgIHNkLT5jdXJyID0gaWRsZV92Y3B1W2NwdV0tPnNj
aGVkX3VuaXQ7CisgICAgc2QtPnNjaGVkX3VuaXRfaWRsZSA9IGlkbGVfdmNwdVtjcHVdLT5zY2hl
ZF91bml0OwogCiAgICAgc2QtPnNjaGVkX3ByaXYgPSBOVUxMOwogCkBAIC0yMjk1LDYgKzIzNjUs
NyBAQCB2b2lkIF9faW5pdCBzY2hlZHVsZXJfaW5pdCh2b2lkKQogICAgIGlmICggdmNwdV9jcmVh
dGUoaWRsZV9kb21haW4sIDApID09IE5VTEwgKQogICAgICAgICBCVUcoKTsKICAgICBnZXRfc2No
ZWRfcmVzKDApLT5jdXJyID0gaWRsZV92Y3B1WzBdLT5zY2hlZF91bml0OworICAgIGdldF9zY2hl
ZF9yZXMoMCktPnNjaGVkX3VuaXRfaWRsZSA9IGlkbGVfdmNwdVswXS0+c2NoZWRfdW5pdDsKIH0K
IAogLyoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3VycmVudC5oIGIveGVuL2lu
Y2x1ZGUvYXNtLWFybS9jdXJyZW50LmgKaW5kZXggMTY1M2U4OWQzMC4uODhiZWI0NjQ1YSAxMDA2
NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9jdXJyZW50LmgKKysrIGIveGVuL2luY2x1ZGUv
YXNtLWFybS9jdXJyZW50LmgKQEAgLTE4LDYgKzE4LDcgQEAgREVDTEFSRV9QRVJfQ1BVKHN0cnVj
dCB2Y3B1ICosIGN1cnJfdmNwdSk7CiAKICNkZWZpbmUgY3VycmVudCAgICAgICAgICAgICh0aGlz
X2NwdShjdXJyX3ZjcHUpKQogI2RlZmluZSBzZXRfY3VycmVudCh2Y3B1KSAgZG8geyBjdXJyZW50
ID0gKHZjcHUpOyB9IHdoaWxlICgwKQorI2RlZmluZSBnZXRfY3B1X2N1cnJlbnQoY3B1KSAgKHBl
cl9jcHUoY3Vycl92Y3B1LCBjcHUpKQogCiAvKiBQZXItVkNQVSBzdGF0ZSB0aGF0IGxpdmVzIGF0
IHRoZSB0b3Agb2YgdGhlIHN0YWNrICovCiBzdHJ1Y3QgY3B1X2luZm8gewpkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9jdXJyZW50LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2N1cnJl
bnQuaAppbmRleCBmMzUwOGMzYzA4Li4wYjQ3NDg1MzM3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2N1cnJlbnQuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2N1cnJlbnQuaApA
QCAtNzcsNiArNzcsMTEgQEAgc3RydWN0IGNwdV9pbmZvIHsKICAgICAvKiBnZXRfc3RhY2tfYm90
dG9tKCkgbXVzdCBiZSAxNi1ieXRlIGFsaWduZWQgKi8KIH07CiAKK3N0YXRpYyBpbmxpbmUgc3Ry
dWN0IGNwdV9pbmZvICpnZXRfY3B1X2luZm9fZnJvbV9zdGFjayh1bnNpZ25lZCBsb25nIHNwKQor
eworICAgIHJldHVybiAoc3RydWN0IGNwdV9pbmZvICopKChzcCB8IChTVEFDS19TSVpFIC0gMSkp
ICsgMSkgLSAxOworfQorCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBjcHVfaW5mbyAqZ2V0X2NwdV9p
bmZvKHZvaWQpCiB7CiAjaWZkZWYgX19jbGFuZ19fCkBAIC04Nyw3ICs5Miw3IEBAIHN0YXRpYyBp
bmxpbmUgc3RydWN0IGNwdV9pbmZvICpnZXRfY3B1X2luZm8odm9pZCkKICAgICByZWdpc3RlciB1
bnNpZ25lZCBsb25nIHNwIGFzbSgicnNwIik7CiAjZW5kaWYKIAotICAgIHJldHVybiAoc3RydWN0
IGNwdV9pbmZvICopKChzcCB8IChTVEFDS19TSVpFIC0gMSkpICsgMSkgLSAxOworICAgIHJldHVy
biBnZXRfY3B1X2luZm9fZnJvbV9zdGFjayhzcCk7CiB9CiAKICNkZWZpbmUgZ2V0X2N1cnJlbnQo
KSAgICAgICAgIChnZXRfY3B1X2luZm8oKS0+Y3VycmVudF92Y3B1KQpAQCAtMTI0LDE2ICsxMjks
MjIgQEAgdW5zaWduZWQgbG9uZyBnZXRfc3RhY2tfZHVtcF9ib3R0b20gKHVuc2lnbmVkIGxvbmcg
c3ApOwogIyBkZWZpbmUgQ0hFQ0tfRk9SX0xJVkVQQVRDSF9XT1JLICIiCiAjZW5kaWYKIAotI2Rl
ZmluZSByZXNldF9zdGFja19hbmRfanVtcChfX2ZuKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAorI2RlZmluZSBzd2l0Y2hfc3RhY2tfYW5kX2p1bXAoZm4sIGluc3RyKSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICh7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAg
ICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAogICAgICAgICAgICAgIm1vdiAlMCwlJSJfX09QInNwOyIgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICAgICAgICAgQ0hFQ0tfRk9SX0xJVkVQ
QVRDSF9XT1JLICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAg
ICAgICBpbnN0ciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCiAgICAgICAgICAgICAgImptcCAlYzEiICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgICAgICAgICA6IDogInIiIChndWVzdF9j
cHVfdXNlcl9yZWdzKCkpLCAiaSIgKF9fZm4pIDogIm1lbW9yeSIgKTsgICBcCisgICAgICAgICAg
ICA6IDogInIiIChndWVzdF9jcHVfdXNlcl9yZWdzKCkpLCAiaSIgKGZuKSA6ICJtZW1vcnkiICk7
ICAgICBcCiAgICAgICAgIHVucmVhY2hhYmxlKCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgfSkKIAorI2RlZmluZSByZXNldF9zdGFja19h
bmRfanVtcChmbikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAg
IHN3aXRjaF9zdGFja19hbmRfanVtcChmbiwgQ0hFQ0tfRk9SX0xJVkVQQVRDSF9XT1JLKQorCisj
ZGVmaW5lIHJlc2V0X3N0YWNrX2FuZF9qdW1wX25vbHAoZm4pICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCisgICAgc3dpdGNoX3N0YWNrX2FuZF9qdW1wKGZuLCAiIikKKwogLyoK
ICAqIFdoaWNoIFZDUFUncyBzdGF0ZSBpcyBjdXJyZW50bHkgcnVubmluZyBvbiBlYWNoIENQVT8K
ICAqIFRoaXMgaXMgbm90IG5lY2VzYXNyaWx5IHRoZSBzYW1lIGFzICdjdXJyZW50JyBhcyBhIENQ
VSBtYXkgYmUKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmggYi94ZW4vaW5j
bHVkZS9hc20teDg2L3NtcC5oCmluZGV4IDlmNTMzZjkwNzIuLjUxYTMxYWIwMGEgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9z
bXAuaApAQCAtNzYsNiArNzYsOSBAQCB2b2lkIHNldF9ucl9zb2NrZXRzKHZvaWQpOwogLyogUmVw
cmVzZW50aW5nIEhUIGFuZCBjb3JlIHNpYmxpbmdzIGluIGVhY2ggc29ja2V0LiAqLwogZXh0ZXJu
IGNwdW1hc2tfdCAqKnNvY2tldF9jcHVtYXNrOwogCisjZGVmaW5lIGdldF9jcHVfY3VycmVudChj
cHUpIFwKKyAgICAoZ2V0X2NwdV9pbmZvX2Zyb21fc3RhY2soKHVuc2lnbmVkIGxvbmcpc3RhY2tf
YmFzZVtjcHVdKS0+Y3VycmVudF92Y3B1KQorCiAjZW5kaWYgLyogIV9fQVNTRU1CTFlfXyAqLwog
CiAjZW5kaWYKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIGIveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLWlmLmgKaW5kZXggYWU0NmI1Mzk1Zi4uM2FjNzc1N2MwZCAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLWlmLmgKQEAgLTM5LDYgKzM5LDggQEAgc3RydWN0IHNjaGVkX3Jlc291cmNlIHsKICAgICBz
cGlubG9ja190ICAgICAgICAgKnNjaGVkdWxlX2xvY2ssCiAgICAgICAgICAgICAgICAgICAgICAg
IF9sb2NrOwogICAgIHN0cnVjdCBzY2hlZF91bml0ICAqY3VycjsgICAgICAgICAgIC8qIGN1cnJl
bnQgdGFzayAgICAgICAgICAgICAgICAgICAgKi8KKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAgKnNj
aGVkX3VuaXRfaWRsZTsKKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAgKnByZXY7ICAgICAgICAgICAv
KiBwcmV2aW91cyB0YXNrICAgICAgICAgICAgICAgICAgICovCiAgICAgdm9pZCAgICAgICAgICAg
ICAgICpzY2hlZF9wcml2OwogICAgIHN0cnVjdCB0aW1lciAgICAgICAgc190aW1lcjsgICAgICAg
IC8qIHNjaGVkdWxpbmcgdGltZXIgICAgICAgICAgICAgICAgKi8KICAgICBhdG9taWNfdCAgICAg
ICAgICAgIHVyZ2VudF9jb3VudDsgICAvKiBob3cgbWFueSB1cmdlbnQgdmNwdXMgICAgICAgICAg
ICovCkBAIC0xNzksNyArMTgxLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHNjaGVkX2NsZWFyX3Bh
dXNlX2ZsYWdzX2F0b21pYyhzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwKIAogc3RhdGljIGlubGlu
ZSBzdHJ1Y3Qgc2NoZWRfdW5pdCAqc2NoZWRfaWRsZV91bml0KHVuc2lnbmVkIGludCBjcHUpCiB7
Ci0gICAgcmV0dXJuIGlkbGVfdmNwdVtjcHVdLT5zY2hlZF91bml0OworICAgIHJldHVybiBnZXRf
c2NoZWRfcmVzKGNwdSktPnNjaGVkX3VuaXRfaWRsZTsKIH0KIAogc3RhdGljIGlubGluZSB1bnNp
Z25lZCBpbnQgc2NoZWRfZ2V0X3Jlc291cmNlX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQpkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaApp
bmRleCA3NTg1YmQ4MWEyLi5lZDA1MzU5NDZmIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4v
c2NoZWQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaApAQCAtOTIyLDYgKzkyMiw3IEBA
IHZvaWQgcmVzdG9yZV92Y3B1X2FmZmluaXR5KHN0cnVjdCBkb21haW4gKmQpOwogdm9pZCB2Y3B1
X3J1bnN0YXRlX2dldChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAq
cnVuc3RhdGUpOwogdWludDY0X3QgZ2V0X2NwdV9pZGxlX3RpbWUodW5zaWduZWQgaW50IGNwdSk7
CiBib29sIHNjaGVkX2hhc191cmdlbnRfdmNwdSh2b2lkKTsKK3ZvaWQgc2NoZWRfZ3Vlc3RfaWRs
ZSh2b2lkICgqaWRsZSkgKHZvaWQpLCB1bnNpZ25lZCBpbnQgY3B1KTsKIAogLyoKICAqIFVzZWQg
YnkgaWRsZSBsb29wIHRvIGRlY2lkZSB3aGV0aGVyIHRoZXJlIGlzIHdvcmsgdG8gZG86Ci0tIAoy
LjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
