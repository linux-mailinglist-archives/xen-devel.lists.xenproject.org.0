Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96277162607
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 13:24:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j41sU-0006e6-Ld; Tue, 18 Feb 2020 12:21:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LnEJ=4G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j41sS-0006dz-PK
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 12:21:24 +0000
X-Inumbo-ID: 29edd338-5249-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29edd338-5249-11ea-b0fd-bc764e2007e4;
 Tue, 18 Feb 2020 12:21:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7829DB367;
 Tue, 18 Feb 2020 12:21:17 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 18 Feb 2020 13:21:12 +0100
Message-Id: <20200218122114.17596-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200218122114.17596-1-jgross@suse.com>
References: <20200218122114.17596-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 2/4] xen/rcu: don't use stop_machine_run()
 for rcu_barrier()
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG9kYXkgcmN1X2JhcnJpZXIoKSBpcyBjYWxsaW5nIHN0b3BfbWFjaGluZV9ydW4oKSB0byBzeW5j
aHJvbml6ZSBhbGwKcGh5c2ljYWwgY3B1cyBpbiBvcmRlciB0byBlbnN1cmUgYWxsIHBlbmRpbmcg
cmN1IGNhbGxzIGhhdmUgZmluaXNoZWQKd2hlbiByZXR1cm5pbmcuCgpBcyBzdG9wX21hY2hpbmVf
cnVuKCkgaXMgdXNpbmcgdGFza2xldHMgdGhpcyByZXF1aXJlcyBzY2hlZHVsaW5nIG9mCmlkbGUg
dmNwdXMgb24gYWxsIGNwdXMgaW1wb3NpbmcgdGhlIG5lZWQgdG8gY2FsbCByY3VfYmFycmllcigp
IG9uIGlkbGUKY3B1cyBvbmx5IGluIGNhc2Ugb2YgY29yZSBzY2hlZHVsaW5nIGJlaW5nIGFjdGl2
ZSwgYXMgb3RoZXJ3aXNlIGEKc2NoZWR1bGluZyBkZWFkbG9jayB3b3VsZCBvY2N1ci4KClRoZXJl
IGlzIG5vIG5lZWQgYXQgYWxsIHRvIGRvIHRoZSBzeW5jaW5nIG9mIHRoZSBjcHVzIGluIHRhc2ts
ZXRzLCBhcwpyY3UgYWN0aXZpdHkgaXMgc3RhcnRlZCBpbiBfX2RvX3NvZnRpcnEoKSBjYWxsZWQg
d2hlbmV2ZXIgc29mdGlycQphY3Rpdml0eSBpcyBhbGxvd2VkLiBTbyByY3VfYmFycmllcigpIGNh
biBlYXNpbHkgYmUgbW9kaWZpZWQgdG8gdXNlCnNvZnRpcnEgZm9yIHN5bmNocm9uaXphdGlvbiBv
ZiB0aGUgY3B1cyBubyBsb25nZXIgcmVxdWlyaW5nIGFueQpzY2hlZHVsaW5nIGFjdGl2aXR5LgoK
QXMgdGhlcmUgYWxyZWFkeSBpcyBhIHJjdSBzb2Z0aXJxIHJldXNlIHRoYXQgZm9yIHRoZSBzeW5j
aHJvbml6YXRpb24uCgpSZW1vdmUgdGhlIGJhcnJpZXIgZWxlbWVudCBmcm9tIHN0cnVjdCByY3Vf
ZGF0YSBhcyBpdCBpc24ndCB1c2VkLgoKRmluYWxseSBzd2l0Y2ggcmN1X2JhcnJpZXIoKSB0byBy
ZXR1cm4gdm9pZCBhcyBpdCBub3cgY2FuIG5ldmVyIGZhaWwuCgpTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpWMjoKLSB1c2UgZ2V0X2NwdV9tYXBzKCkK
LSBhZGQgcmVjdXJzaW9uIGRldGVjdGlvbgotLS0KIHhlbi9jb21tb24vcmN1cGRhdGUuYyAgICAg
IHwgNzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogeGVu
L2luY2x1ZGUveGVuL3JjdXBkYXRlLmggfCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNl
cnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3JjdXBk
YXRlLmMgYi94ZW4vY29tbW9uL3JjdXBkYXRlLmMKaW5kZXggMDc5ZWE5ZDhhMS4uZTZhZGQwYjEy
MCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9yY3VwZGF0ZS5jCisrKyBiL3hlbi9jb21tb24vcmN1
cGRhdGUuYwpAQCAtODMsNyArODMsNiBAQCBzdHJ1Y3QgcmN1X2RhdGEgewogICAgIHN0cnVjdCBy
Y3VfaGVhZCAqKmRvbmV0YWlsOwogICAgIGxvbmcgICAgICAgICAgICBibGltaXQ7ICAgICAgICAg
ICAvKiBVcHBlciBsaW1pdCBvbiBhIHByb2Nlc3NlZCBiYXRjaCAqLwogICAgIGludCBjcHU7Ci0g
ICAgc3RydWN0IHJjdV9oZWFkIGJhcnJpZXI7CiAgICAgbG9uZyAgICAgICAgICAgIGxhc3RfcnNf
cWxlbjsgICAgIC8qIHFsZW4gZHVyaW5nIHRoZSBsYXN0IHJlc2NoZWQgKi8KIAogICAgIC8qIDMp
IGlkbGUgQ1BVcyBoYW5kbGluZyAqLwpAQCAtOTEsNiArOTAsNyBAQCBzdHJ1Y3QgcmN1X2RhdGEg
ewogICAgIGJvb2wgaWRsZV90aW1lcl9hY3RpdmU7CiAKICAgICBib29sICAgICAgICAgICAgcHJv
Y2Vzc19jYWxsYmFja3M7CisgICAgYm9vbCAgICAgICAgICAgIGJhcnJpZXJfYWN0aXZlOwogfTsK
IAogLyoKQEAgLTE0Myw0NyArMTQzLDY4IEBAIHN0YXRpYyBpbnQgcWhpbWFyayA9IDEwMDAwOwog
c3RhdGljIGludCBxbG93bWFyayA9IDEwMDsKIHN0YXRpYyBpbnQgcnNpbnRlcnZhbCA9IDEwMDA7
CiAKLXN0cnVjdCByY3VfYmFycmllcl9kYXRhIHsKLSAgICBzdHJ1Y3QgcmN1X2hlYWQgaGVhZDsK
LSAgICBhdG9taWNfdCAqY3B1X2NvdW50OwotfTsKKy8qCisgKiByY3VfYmFycmllcigpIGhhbmRs
aW5nOgorICogY3B1X2NvdW50IGhvbGRzIHRoZSBudW1iZXIgb2YgY3B1IHJlcXVpcmVkIHRvIGZp
bmlzaCBiYXJyaWVyIGhhbmRsaW5nLgorICogQ3B1cyBhcmUgc3luY2hyb25pemVkIHZpYSBzb2Z0
aXJxIG1lY2hhbmlzbS4gcmN1X2JhcnJpZXIoKSBpcyByZWdhcmRlZCB0bworICogYmUgYWN0aXZl
IGlmIGNwdV9jb3VudCBpcyBub3QgemVyby4gSW4gY2FzZSByY3VfYmFycmllcigpIGlzIGNhbGxl
ZCBvbgorICogbXVsdGlwbGUgY3B1cyBpdCBpcyBlbm91Z2ggdG8gY2hlY2sgZm9yIGNwdV9jb3Vu
dCBiZWluZyBub3QgemVybyBvbiBlbnRyeQorICogYW5kIHRvIGNhbGwgcHJvY2Vzc19wZW5kaW5n
X3NvZnRpcnFzKCkgaW4gYSBsb29wIHVudGlsIGNwdV9jb3VudCBkcm9wcyB0bworICogemVybywg
YXMgc3luY2luZyBoYXMgYmVlbiByZXF1ZXN0ZWQgYWxyZWFkeSBhbmQgd2UgZG9uJ3QgbmVlZCB0
byBzeW5jCisgKiBtdWx0aXBsZSB0aW1lcy4KKyAqLworc3RhdGljIGF0b21pY190IGNwdV9jb3Vu
dCA9IEFUT01JQ19JTklUKDApOwogCiBzdGF0aWMgdm9pZCByY3VfYmFycmllcl9jYWxsYmFjayhz
dHJ1Y3QgcmN1X2hlYWQgKmhlYWQpCiB7Ci0gICAgc3RydWN0IHJjdV9iYXJyaWVyX2RhdGEgKmRh
dGEgPSBjb250YWluZXJfb2YoCi0gICAgICAgIGhlYWQsIHN0cnVjdCByY3VfYmFycmllcl9kYXRh
LCBoZWFkKTsKLSAgICBhdG9taWNfaW5jKGRhdGEtPmNwdV9jb3VudCk7CisgICAgYXRvbWljX2Rl
YygmY3B1X2NvdW50KTsKIH0KIAotc3RhdGljIGludCByY3VfYmFycmllcl9hY3Rpb24odm9pZCAq
X2NwdV9jb3VudCkKK3N0YXRpYyB2b2lkIHJjdV9iYXJyaWVyX2FjdGlvbih2b2lkKQogewotICAg
IHN0cnVjdCByY3VfYmFycmllcl9kYXRhIGRhdGEgPSB7IC5jcHVfY291bnQgPSBfY3B1X2NvdW50
IH07Ci0KLSAgICBBU1NFUlQoIWxvY2FsX2lycV9pc19lbmFibGVkKCkpOwotICAgIGxvY2FsX2ly
cV9lbmFibGUoKTsKKyAgICBzdHJ1Y3QgcmN1X2hlYWQgaGVhZDsKIAogICAgIC8qCiAgICAgICog
V2hlbiBjYWxsYmFjayBpcyBleGVjdXRlZCwgYWxsIHByZXZpb3VzbHktcXVldWVkIFJDVSB3b3Jr
IG9uIHRoaXMgQ1BVCiAgICAgICogaXMgY29tcGxldGVkLiBXaGVuIGFsbCBDUFVzIGhhdmUgZXhl
Y3V0ZWQgdGhlaXIgY2FsbGJhY2ssIGRhdGEuY3B1X2NvdW50CiAgICAgICogd2lsbCBoYXZlIGJl
ZW4gaW5jcmVtZW50ZWQgdG8gaW5jbHVkZSBldmVyeSBvbmxpbmUgQ1BVLgogICAgICAqLwotICAg
IGNhbGxfcmN1KCZkYXRhLmhlYWQsIHJjdV9iYXJyaWVyX2NhbGxiYWNrKTsKKyAgICBjYWxsX3Jj
dSgmaGVhZCwgcmN1X2JhcnJpZXJfY2FsbGJhY2spOwogCi0gICAgd2hpbGUgKCBhdG9taWNfcmVh
ZChkYXRhLmNwdV9jb3VudCkgIT0gbnVtX29ubGluZV9jcHVzKCkgKQorICAgIHdoaWxlICggYXRv
bWljX3JlYWQoJmNwdV9jb3VudCkgKQogICAgIHsKICAgICAgICAgcHJvY2Vzc19wZW5kaW5nX3Nv
ZnRpcnFzKCk7CiAgICAgICAgIGNwdV9yZWxheCgpOwogICAgIH0KLQotICAgIGxvY2FsX2lycV9k
aXNhYmxlKCk7Ci0KLSAgICByZXR1cm4gMDsKIH0KIAotaW50IHJjdV9iYXJyaWVyKHZvaWQpCit2
b2lkIHJjdV9iYXJyaWVyKHZvaWQpCiB7Ci0gICAgYXRvbWljX3QgY3B1X2NvdW50ID0gQVRPTUlD
X0lOSVQoMCk7Ci0gICAgcmV0dXJuIHN0b3BfbWFjaGluZV9ydW4ocmN1X2JhcnJpZXJfYWN0aW9u
LCAmY3B1X2NvdW50LCBOUl9DUFVTKTsKKyAgICBpbnQgaW5pdGlhbCA9IGF0b21pY19yZWFkKCZj
cHVfY291bnQpOworCisgICAgd2hpbGUgKCAhZ2V0X2NwdV9tYXBzKCkgKQorICAgIHsKKyAgICAg
ICAgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7CisgICAgICAgIGlmICggaW5pdGlhbCAmJiAh
YXRvbWljX3JlYWQoJmNwdV9jb3VudCkgKQorICAgICAgICAgICAgcmV0dXJuOworCisgICAgICAg
IGNwdV9yZWxheCgpOworICAgICAgICBpbml0aWFsID0gYXRvbWljX3JlYWQoJmNwdV9jb3VudCk7
CisgICAgfQorCisgICAgaWYgKCAhaW5pdGlhbCApCisgICAgeworICAgICAgICBhdG9taWNfc2V0
KCZjcHVfY291bnQsIG51bV9vbmxpbmVfY3B1cygpKTsKKyAgICAgICAgY3B1bWFza19yYWlzZV9z
b2Z0aXJxKCZjcHVfb25saW5lX21hcCwgUkNVX1NPRlRJUlEpOworICAgIH0KKworICAgIHdoaWxl
ICggYXRvbWljX3JlYWQoJmNwdV9jb3VudCkgKQorICAgIHsKKyAgICAgICAgcHJvY2Vzc19wZW5k
aW5nX3NvZnRpcnFzKCk7CisgICAgICAgIGNwdV9yZWxheCgpOworICAgIH0KKworICAgIHB1dF9j
cHVfbWFwcygpOwogfQogCiAvKiBJcyBiYXRjaCBhIGJlZm9yZSBiYXRjaCBiID8gKi8KQEAgLTQy
Miw2ICs0NDMsMTMgQEAgc3RhdGljIHZvaWQgcmN1X3Byb2Nlc3NfY2FsbGJhY2tzKHZvaWQpCiAg
ICAgICAgIHJkcC0+cHJvY2Vzc19jYWxsYmFja3MgPSBmYWxzZTsKICAgICAgICAgX19yY3VfcHJv
Y2Vzc19jYWxsYmFja3MoJnJjdV9jdHJsYmxrLCByZHApOwogICAgIH0KKworICAgIGlmICggYXRv
bWljX3JlYWQoJmNwdV9jb3VudCkgJiYgIXJkcC0+YmFycmllcl9hY3RpdmUgKQorICAgIHsKKyAg
ICAgICAgcmRwLT5iYXJyaWVyX2FjdGl2ZSA9IHRydWU7CisgICAgICAgIHJjdV9iYXJyaWVyX2Fj
dGlvbigpOworICAgICAgICByZHAtPmJhcnJpZXJfYWN0aXZlID0gZmFsc2U7CisgICAgfQogfQog
CiBzdGF0aWMgaW50IF9fcmN1X3BlbmRpbmcoc3RydWN0IHJjdV9jdHJsYmxrICpyY3AsIHN0cnVj
dCByY3VfZGF0YSAqcmRwKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmgg
Yi94ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaAppbmRleCAxNzRkMDU4MTEzLi44N2YzNWI3NzA0
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaAorKysgYi94ZW4vaW5jbHVk
ZS94ZW4vcmN1cGRhdGUuaApAQCAtMTQzLDcgKzE0Myw3IEBAIHZvaWQgcmN1X2NoZWNrX2NhbGxi
YWNrcyhpbnQgY3B1KTsKIHZvaWQgY2FsbF9yY3Uoc3RydWN0IHJjdV9oZWFkICpoZWFkLCAKICAg
ICAgICAgICAgICAgdm9pZCAoKmZ1bmMpKHN0cnVjdCByY3VfaGVhZCAqaGVhZCkpOwogCi1pbnQg
cmN1X2JhcnJpZXIodm9pZCk7Cit2b2lkIHJjdV9iYXJyaWVyKHZvaWQpOwogCiB2b2lkIHJjdV9p
ZGxlX2VudGVyKHVuc2lnbmVkIGludCBjcHUpOwogdm9pZCByY3VfaWRsZV9leGl0KHVuc2lnbmVk
IGludCBjcHUpOwotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
