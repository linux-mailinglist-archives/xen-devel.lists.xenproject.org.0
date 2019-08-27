Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAE29E65C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 13:02:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2ZCY-00089e-Cf; Tue, 27 Aug 2019 10:59:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7YVi=WX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i2ZCW-00089B-UM
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 10:59:49 +0000
X-Inumbo-ID: bf9b89c7-c8b9-11e9-ae32-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf9b89c7-c8b9-11e9-ae32-12813bfff9fa;
 Tue, 27 Aug 2019 10:59:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5D9BAFBF;
 Tue, 27 Aug 2019 10:59:31 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 27 Aug 2019 12:59:28 +0200
Message-Id: <20190827105928.1769-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190827105928.1769-1-jgross@suse.com>
References: <20190827105928.1769-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 3/3] xen/sched: add minimalistic idle
 scheduler for free cpus
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

SW5zdGVhZCBvZiBoYXZpbmcgYSBmdWxsIGJsb3duIHNjaGVkdWxlciBydW5uaW5nIGZvciB0aGUg
ZnJlZSBjcHVzCmFkZCBhIHZlcnkgbWluaW1hbGlzdGljIHNjaGVkdWxlciBmb3IgdGhhdCBwdXJw
b3NlIG9ubHkgZXZlciBzY2hlZHVsaW5nCnRoZSByZWxhdGVkIGlkbGUgdmNwdS4gVGhpcyBoYXMg
dGhlIGJpZyBhZHZhbnRhZ2Ugb2Ygbm90IG5lZWRpbmcgYW55CnBlci1jcHUsIHBlci1kb21haW4g
b3IgcGVyLXNjaGVkdWxpbmcgdW5pdCBkYXRhIGZvciBmcmVlIGNwdXMgYW5kIGluCnR1cm4gc2lt
cGxpZnlpbmcgbW92aW5nIGNwdXMgdG8gYW5kIGZyb20gY3B1cG9vbHMgYSBsb3QuCgpSaWdodCBu
b3csIENQVXMgdGhhdCBhcmUgbm90IGluIGFueSBwb29sLCBzdGlsbCBiZWxvbmcgdG8gUG9vbC0w
J3MKc2NoZWR1bGVyLiBUaGlzIGZvcmNlcyB1cyB0byBtYWtlLCB3aXRoaW4gdGhlIHNjaGVkdWxl
ciwgZXh0cmEgZWZmb3J0CnRvIGF2b2lkIGFjdHVhbGx5IHJ1bm5pbmcgdkNQVXMgb24gdGhvc2Uu
CgpJbiB0aGUgY2FzZSBvZiBDcmVkaXQxLCB0aGlzIGFsc28gY2F1c2UgaXNzdWUgdG8gd2VpZ2h0
cwoocmUpZGlzdHJpYnV0aW9uLCBhcyB0aGUgbnVtYmVyIG9mIENQVXMgYXZhaWxhYmxlIHRvIHRo
ZSBzY2hlZHVsZXIgaXMKd3JvbmcuCgpUaGlzIGlzIGRlc2NyaWJlZCBpbiB0aGUgY2hhbmdlbG9n
IG9mIGNvbW1pdCBlNzE5MTkyMDI2MWQgKCJ4ZW46CmNyZWRpdDI6IG5ldmVyIGNvbnNpZGVyIENQ
VXMgb3V0c2lkZSBvZiBvdXIgY3B1cG9vbCIpLgoKVGhpcyBuZXcgc2NoZWR1bGVyIHdpbGwganVz
dCB1c2UgYSBjb21tb24gbG9jayBmb3IgYWxsIGZyZWUgY3B1cy4KCkFzIHRoaXMgbmV3IHNjaGVk
dWxlciBpcyBub3QgdXNlciBzZWxlY3RhYmxlIGRvbid0IHJlZ2lzdGVyIGl0IGFzIGFuCm9mZmlj
aWFsIHNjaGVkdWxlciwgYnV0IGp1c3QgaW5jbHVkZSBpdCBpbiBzY2hlZHVsZS5jLgoKU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpBY2tlZC1ieTogRGFyaW8g
RmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRp
dC5jIHwgICA5IC0tLQogeGVuL2NvbW1vbi9zY2hlZF9udWxsLmMgICB8ICAgNyAtLS0KIHhlbi9j
b21tb24vc2NoZWR1bGUuYyAgICAgfCAxNTMgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspLCA5NCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jIGIveGVu
L2NvbW1vbi9zY2hlZF9jcmVkaXQuYwppbmRleCA4MWRlZTVlNDcyLi43MGZlNzE4MTI3IDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRf
Y3JlZGl0LmMKQEAgLTYxNywxNSArNjE3LDYgQEAgY3NjaGVkX2luaXRfcGRhdGEoY29uc3Qgc3Ry
dWN0IHNjaGVkdWxlciAqb3BzLCB2b2lkICpwZGF0YSwgaW50IGNwdSkKIHsKICAgICB1bnNpZ25l
ZCBsb25nIGZsYWdzOwogICAgIHN0cnVjdCBjc2NoZWRfcHJpdmF0ZSAqcHJ2ID0gQ1NDSEVEX1BS
SVYob3BzKTsKLSAgICBzdHJ1Y3Qgc2NoZWR1bGVfZGF0YSAqc2QgPSAmcGVyX2NwdShzY2hlZHVs
ZV9kYXRhLCBjcHUpOwotCi0gICAgLyoKLSAgICAgKiBUaGlzIGlzIGNhbGxlZCBlaXRoZXIgZHVy
aW5nIGR1cmluZyBib290LCByZXN1bWUgb3IgaG90cGx1ZywgaW4KLSAgICAgKiBjYXNlIENyZWRp
dDEgaXMgdGhlIHNjaGVkdWxlciBjaG9zZW4gYXQgYm9vdC4gSW4gc3VjaCBjYXNlcywgdGhlCi0g
ICAgICogc2NoZWR1bGVyIGxvY2sgZm9yIGNwdSBpcyBhbHJlYWR5IHBvaW50aW5nIHRvIHRoZSBk
ZWZhdWx0IHBlci1jcHUKLSAgICAgKiBzcGlubG9jaywgYXMgQ3JlZGl0MSBuZWVkcyBpdCwgc28g
dGhlcmUgaXMgbm8gcmVtYXBwaW5nIHRvIGJlIGRvbmUuCi0gICAgICovCi0gICAgQVNTRVJUKHNk
LT5zY2hlZHVsZV9sb2NrID09ICZzZC0+X2xvY2sgJiYgIXNwaW5faXNfbG9ja2VkKCZzZC0+X2xv
Y2spKTsKIAogICAgIHNwaW5fbG9ja19pcnFzYXZlKCZwcnYtPmxvY2ssIGZsYWdzKTsKICAgICBp
bml0X3BkYXRhKHBydiwgcGRhdGEsIGNwdSk7CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVk
X251bGwuYyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCmluZGV4IDI2YzZmMGYxMjkuLjY3ODJl
Y2RhNWMgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCisrKyBiL3hlbi9jb21t
b24vc2NoZWRfbnVsbC5jCkBAIC0xNjcsMTcgKzE2NywxMCBAQCBzdGF0aWMgdm9pZCBpbml0X3Bk
YXRhKHN0cnVjdCBudWxsX3ByaXZhdGUgKnBydiwgdW5zaWduZWQgaW50IGNwdSkKIHN0YXRpYyB2
b2lkIG51bGxfaW5pdF9wZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHZvaWQgKnBk
YXRhLCBpbnQgY3B1KQogewogICAgIHN0cnVjdCBudWxsX3ByaXZhdGUgKnBydiA9IG51bGxfcHJp
dihvcHMpOwotICAgIHN0cnVjdCBzY2hlZHVsZV9kYXRhICpzZCA9ICZwZXJfY3B1KHNjaGVkdWxl
X2RhdGEsIGNwdSk7CiAKICAgICAvKiBhbGxvY19wZGF0YSBpcyBub3QgaW1wbGVtZW50ZWQsIHNv
IHdlIHdhbnQgdGhpcyB0byBiZSBOVUxMLiAqLwogICAgIEFTU0VSVCghcGRhdGEpOwogCi0gICAg
LyoKLSAgICAgKiBUaGUgc2NoZWR1bGVyIGxvY2sgcG9pbnRzIGFscmVhZHkgdG8gdGhlIGRlZmF1
bHQgcGVyLWNwdSBzcGlubG9jaywKLSAgICAgKiBzbyB0aGVyZSBpcyBubyByZW1hcHBpbmcgdG8g
YmUgZG9uZS4KLSAgICAgKi8KLSAgICBBU1NFUlQoc2QtPnNjaGVkdWxlX2xvY2sgPT0gJnNkLT5f
bG9jayAmJiAhc3Bpbl9pc19sb2NrZWQoJnNkLT5fbG9jaykpOwotCiAgICAgaW5pdF9wZGF0YShw
cnYsIGNwdSk7CiB9CiAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9j
b21tb24vc2NoZWR1bGUuYwppbmRleCA5MzE2NGM2NGY2Li4xMTA2Njk4ZmI0IDEwMDY0NAotLS0g
YS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC01
NCw2ICs1NCwxMCBAQCBib29sZWFuX3BhcmFtKCJzY2hlZF9zbXRfcG93ZXJfc2F2aW5ncyIsIHNj
aGVkX3NtdF9wb3dlcl9zYXZpbmdzKTsKICAqICovCiBpbnQgc2NoZWRfcmF0ZWxpbWl0X3VzID0g
U0NIRURfREVGQVVMVF9SQVRFTElNSVRfVVM7CiBpbnRlZ2VyX3BhcmFtKCJzY2hlZF9yYXRlbGlt
aXRfdXMiLCBzY2hlZF9yYXRlbGltaXRfdXMpOworCisvKiBDb21tb24gbG9jayBmb3IgZnJlZSBj
cHVzLiAqLworc3RhdGljIERFRklORV9TUElOTE9DSyhzY2hlZF9mcmVlX2NwdV9sb2NrKTsKKwog
LyogVmFyaW91cyB0aW1lciBoYW5kbGVycy4gKi8KIHN0YXRpYyB2b2lkIHNfdGltZXJfZm4odm9p
ZCAqdW51c2VkKTsKIHN0YXRpYyB2b2lkIHZjcHVfcGVyaW9kaWNfdGltZXJfZm4odm9pZCAqZGF0
YSk7CkBAIC03Myw2ICs3Nyw1OCBAQCBleHRlcm4gY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqX19z
dGFydF9zY2hlZHVsZXJzX2FycmF5W10sICpfX2VuZF9zY2hlZHVsZXJzX2FycgogCiBzdGF0aWMg
c3RydWN0IHNjaGVkdWxlciBfX3JlYWRfbW9zdGx5IG9wczsKIAorc3RhdGljIHNwaW5sb2NrX3Qg
Kgorc2NoZWRfaWRsZV9zd2l0Y2hfc2NoZWQoc3RydWN0IHNjaGVkdWxlciAqbmV3X29wcywgdW5z
aWduZWQgaW50IGNwdSwKKyAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnBkYXRhLCB2b2lk
ICp2ZGF0YSkKK3sKKyAgICBpZGxlX3ZjcHVbY3B1XS0+c2NoZWRfcHJpdiA9IE5VTEw7CisKKyAg
ICByZXR1cm4gJnNjaGVkX2ZyZWVfY3B1X2xvY2s7Cit9CisKK3N0YXRpYyBpbnQKK3NjaGVkX2lk
bGVfY3B1X3BpY2soY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3QgdmNwdSAqdikK
K3sKKyAgICByZXR1cm4gdi0+cHJvY2Vzc29yOworfQorCitzdGF0aWMgdm9pZCAqCitzY2hlZF9p
ZGxlX2FsbG9jX3ZkYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHZjcHUg
KnYsCisgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRkKQoreworICAgIC8qIEFueSBub24t
TlVMTCBwb2ludGVyIGlzIGZpbmUgaGVyZS4gKi8KKyAgICByZXR1cm4gKHZvaWQgKikxVUw7Cit9
CisKK3N0YXRpYyB2b2lkCitzY2hlZF9pZGxlX2ZyZWVfdmRhdGEoY29uc3Qgc3RydWN0IHNjaGVk
dWxlciAqb3BzLCB2b2lkICpwcml2KQoreworfQorCitzdGF0aWMgc3RydWN0IHRhc2tfc2xpY2Ug
c2NoZWRfaWRsZV9zY2hlZHVsZSgKKyAgICBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHNf
dGltZV90IG5vdywKKyAgICBib29sIHRhc2tsZXRfd29ya19zY2hlZHVsZWQpCit7CisgICAgY29u
c3QgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKKyAgICBzdHJ1Y3QgdGFz
a19zbGljZSByZXQgPSB7IC50aW1lID0gLTEgfTsKKworICAgIHJldC50YXNrID0gaWRsZV92Y3B1
W2NwdV07CisgICAgcmV0dXJuIHJldDsKK30KKworc3RhdGljIHN0cnVjdCBzY2hlZHVsZXIgc2No
ZWRfaWRsZV9vcHMgPSB7CisgICAgLm5hbWUgICAgICAgICAgID0gIklkbGUgU2NoZWR1bGVyIiwK
KyAgICAub3B0X25hbWUgICAgICAgPSAiaWRsZSIsCisgICAgLnNjaGVkX2RhdGEgICAgID0gTlVM
TCwKKworICAgIC5waWNrX2NwdSAgICAgICA9IHNjaGVkX2lkbGVfY3B1X3BpY2ssCisgICAgLmRv
X3NjaGVkdWxlICAgID0gc2NoZWRfaWRsZV9zY2hlZHVsZSwKKworICAgIC5hbGxvY192ZGF0YSAg
ICA9IHNjaGVkX2lkbGVfYWxsb2NfdmRhdGEsCisgICAgLmZyZWVfdmRhdGEgICAgID0gc2NoZWRf
aWRsZV9mcmVlX3ZkYXRhLAorICAgIC5zd2l0Y2hfc2NoZWQgICA9IHNjaGVkX2lkbGVfc3dpdGNo
X3NjaGVkLAorfTsKKwogc3RhdGljIGlubGluZSBzdHJ1Y3Qgc2NoZWR1bGVyICpkb21fc2NoZWR1
bGVyKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCiB7CiAgICAgaWYgKCBsaWtlbHkoZC0+Y3B1cG9v
bCAhPSBOVUxMKSApCkBAIC0xNTg3LDEyICsxNjQzLDEwIEBAIHN0YXRpYyB2b2lkIHBvbGxfdGlt
ZXJfZm4odm9pZCAqZGF0YSkKIHN0YXRpYyBpbnQgY3B1X3NjaGVkdWxlX3VwKHVuc2lnbmVkIGlu
dCBjcHUpCiB7CiAgICAgc3RydWN0IHNjaGVkdWxlX2RhdGEgKnNkID0gJnBlcl9jcHUoc2NoZWR1
bGVfZGF0YSwgY3B1KTsKLSAgICB2b2lkICpzY2hlZF9wcml2OwogCi0gICAgcGVyX2NwdShzY2hl
ZHVsZXIsIGNwdSkgPSAmb3BzOworICAgIHBlcl9jcHUoc2NoZWR1bGVyLCBjcHUpID0gJnNjaGVk
X2lkbGVfb3BzOwogICAgIHNwaW5fbG9ja19pbml0KCZzZC0+X2xvY2spOwotICAgIHNkLT5zY2hl
ZHVsZV9sb2NrID0gJnNkLT5fbG9jazsKLSAgICBzZC0+Y3VyciA9IGlkbGVfdmNwdVtjcHVdOwor
ICAgIHNkLT5zY2hlZHVsZV9sb2NrID0gJnNjaGVkX2ZyZWVfY3B1X2xvY2s7CiAgICAgaW5pdF90
aW1lcigmc2QtPnNfdGltZXIsIHNfdGltZXJfZm4sIE5VTEwsIGNwdSk7CiAgICAgYXRvbWljX3Nl
dCgmc2QtPnVyZ2VudF9jb3VudCwgMCk7CiAKQEAgLTE2MDIsNDAgKzE2NTYsMTkgQEAgc3RhdGlj
IGludCBjcHVfc2NoZWR1bGVfdXAodW5zaWduZWQgaW50IGNwdSkKIAogICAgIGlmICggaWRsZV92
Y3B1W2NwdV0gPT0gTlVMTCApCiAgICAgICAgIHZjcHVfY3JlYXRlKGlkbGVfdmNwdVswXS0+ZG9t
YWluLCBjcHUsIGNwdSk7Ci0gICAgZWxzZQotICAgIHsKLSAgICAgICAgc3RydWN0IHZjcHUgKmlk
bGUgPSBpZGxlX3ZjcHVbY3B1XTsKLQotICAgICAgICAvKgotICAgICAgICAgKiBEdXJpbmcgKEFD
UEk/KSBzdXNwZW5kIHRoZSBpZGxlIHZDUFUgZm9yIHRoaXMgcENQVSBpcyBub3QgZnJlZWQsCi0g
ICAgICAgICAqIHdoaWxlIGl0cyBzY2hlZHVsZXIgc3BlY2lmaWMgZGF0YSAod2hhdCBpcyBwb2lu
dGVkIGJ5IHNjaGVkX3ByaXYpCi0gICAgICAgICAqIGlzLiBBbHNvLCBhdCB0aGlzIHN0YWdlIG9m
IHRoZSByZXN1bWUgcGF0aCwgd2UgYXR0YWNoIHRoZSBwQ1BVCi0gICAgICAgICAqIHRvIHRoZSBk
ZWZhdWx0IHNjaGVkdWxlciwgbm8gbWF0dGVyIGluIHdoYXQgY3B1cG9vbCBpdCB3YXMgYmVmb3Jl
Ci0gICAgICAgICAqIHN1c3BlbmQuIFRvIGF2b2lkIGluY29uc2lzdGVuY3ksIGxldCdzIGFsbG9j
YXRlIGRlZmF1bHQgc2NoZWR1bGVyCi0gICAgICAgICAqIGRhdGEgZm9yIHRoZSBpZGxlIHZDUFUg
aGVyZS4gSWYgdGhlIHBDUFUgd2FzIGluIGEgZGlmZmVyZW50IHBvb2wKLSAgICAgICAgICogd2l0
aCBhIGRpZmZlcmVudCBzY2hlZHVsZXIsIGl0IGlzIHNjaGVkdWxlX2NwdV9zd2l0Y2goKSwgaW52
b2tlZAotICAgICAgICAgKiBsYXRlciwgdGhhdCB3aWxsIHNldCB0aGluZ3MgdXAgYXMgYXBwcm9w
cmlhdGUuCi0gICAgICAgICAqLwotICAgICAgICBBU1NFUlQoaWRsZS0+c2NoZWRfcHJpdiA9PSBO
VUxMKTsKIAotICAgICAgICBpZGxlLT5zY2hlZF9wcml2ID0gc2NoZWRfYWxsb2NfdmRhdGEoJm9w
cywgaWRsZSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlk
bGUtPmRvbWFpbi0+c2NoZWRfcHJpdik7Ci0gICAgICAgIGlmICggaWRsZS0+c2NoZWRfcHJpdiA9
PSBOVUxMICkKLSAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwotICAgIH0KICAgICBpZiAoIGlk
bGVfdmNwdVtjcHVdID09IE5VTEwgKQogICAgICAgICByZXR1cm4gLUVOT01FTTsKIAogICAgIC8q
Ci0gICAgICogV2UgZG9uJ3Qgd2FudCB0byByaXNrIGNhbGxpbmcgeGZyZWUoKSBvbiBhbiBzZC0+
c2NoZWRfcHJpdgotICAgICAqIChlLmcuLCBpbnNpZGUgZnJlZV9wZGF0YSwgZnJvbSBjcHVfc2No
ZWR1bGVfZG93bigpIGNhbGxlZAotICAgICAqIGR1cmluZyBDUFVfVVBfQ0FOQ0VMTEVEKSB0aGF0
IGNvbnRhaW5zIGFuIElTX0VSUiB2YWx1ZS4KKyAgICAgKiBObyBuZWVkIHRvIGFsbG9jYXRlIGFu
eSBzY2hlZHVsZXIgZGF0YSwgYXMgY3B1cyBjb21pbmcgb25saW5lIGFyZQorICAgICAqIGZyZWUg
aW5pdGlhbGx5IGFuZCB0aGUgaWRsZSBzY2hlZHVsZXIgZG9lc24ndCBuZWVkIGFueSBkYXRhIGFy
ZWFzCisgICAgICogYWxsb2NhdGVkLgogICAgICAqLwotICAgIHNjaGVkX3ByaXYgPSBzY2hlZF9h
bGxvY19wZGF0YSgmb3BzLCBjcHUpOwotICAgIGlmICggSVNfRVJSKHNjaGVkX3ByaXYpICkKLSAg
ICAgICAgcmV0dXJuIFBUUl9FUlIoc2NoZWRfcHJpdik7CiAKLSAgICBzZC0+c2NoZWRfcHJpdiA9
IHNjaGVkX3ByaXY7CisgICAgc2QtPmN1cnIgPSBpZGxlX3ZjcHVbY3B1XTsKKworICAgIHNkLT5z
Y2hlZF9wcml2ID0gTlVMTDsKIAogICAgIHJldHVybiAwOwogfQpAQCAtMTY0MywxMyArMTY3Niw2
IEBAIHN0YXRpYyBpbnQgY3B1X3NjaGVkdWxlX3VwKHVuc2lnbmVkIGludCBjcHUpCiBzdGF0aWMg
dm9pZCBjcHVfc2NoZWR1bGVfZG93bih1bnNpZ25lZCBpbnQgY3B1KQogewogICAgIHN0cnVjdCBz
Y2hlZHVsZV9kYXRhICpzZCA9ICZwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSk7Ci0gICAgc3Ry
dWN0IHNjaGVkdWxlciAqc2NoZWQgPSBwZXJfY3B1KHNjaGVkdWxlciwgY3B1KTsKLQotICAgIHNj
aGVkX2ZyZWVfcGRhdGEoc2NoZWQsIHNkLT5zY2hlZF9wcml2LCBjcHUpOwotICAgIHNjaGVkX2Zy
ZWVfdmRhdGEoc2NoZWQsIGlkbGVfdmNwdVtjcHVdLT5zY2hlZF9wcml2KTsKLQotICAgIGlkbGVf
dmNwdVtjcHVdLT5zY2hlZF9wcml2ID0gTlVMTDsKLSAgICBzZC0+c2NoZWRfcHJpdiA9IE5VTEw7
CiAKICAgICBraWxsX3RpbWVyKCZzZC0+c190aW1lcik7CiB9CkBAIC0xNjU3LDE0ICsxNjgzLDEx
IEBAIHN0YXRpYyB2b2lkIGNwdV9zY2hlZHVsZV9kb3duKHVuc2lnbmVkIGludCBjcHUpCiB2b2lk
IHNjaGVkX3JtX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQogewogICAgIGludCByYzsKLSAgICBzdHJ1
Y3Qgc2NoZWR1bGVfZGF0YSAqc2QgPSAmcGVyX2NwdShzY2hlZHVsZV9kYXRhLCBjcHUpOwotICAg
IHN0cnVjdCBzY2hlZHVsZXIgKnNjaGVkID0gcGVyX2NwdShzY2hlZHVsZXIsIGNwdSk7CiAKICAg
ICByY3VfcmVhZF9sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7CiAgICAgcmMgPSBjcHVfZGlzYWJs
ZV9zY2hlZHVsZXIoY3B1KTsKICAgICBCVUdfT04ocmMpOwogICAgIHJjdV9yZWFkX3VubG9jaygm
ZG9tbGlzdF9yZWFkX2xvY2spOwotICAgIHNjaGVkX2RlaW5pdF9wZGF0YShzY2hlZCwgc2QtPnNj
aGVkX3ByaXYsIGNwdSk7CiAgICAgY3B1X3NjaGVkdWxlX2Rvd24oY3B1KTsKIH0KIApAQCAtMTY3
Miw4ICsxNjk1LDYgQEAgc3RhdGljIGludCBjcHVfc2NoZWR1bGVfY2FsbGJhY2soCiAgICAgc3Ry
dWN0IG5vdGlmaWVyX2Jsb2NrICpuZmIsIHVuc2lnbmVkIGxvbmcgYWN0aW9uLCB2b2lkICpoY3B1
KQogewogICAgIHVuc2lnbmVkIGludCBjcHUgPSAodW5zaWduZWQgbG9uZyloY3B1OwotICAgIHN0
cnVjdCBzY2hlZHVsZXIgKnNjaGVkID0gcGVyX2NwdShzY2hlZHVsZXIsIGNwdSk7Ci0gICAgc3Ry
dWN0IHNjaGVkdWxlX2RhdGEgKnNkID0gJnBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KTsKICAg
ICBpbnQgcmMgPSAwOwogCiAgICAgLyoKQEAgLTE2ODEsMzkgKzE3MDIsMjUgQEAgc3RhdGljIGlu
dCBjcHVfc2NoZWR1bGVfY2FsbGJhY2soCiAgICAgICogYWxsb2NhdGluZyBhbmQgaW5pdGlhbGl6
aW5nIHRoZSBwZXItcENQVSBzY2hlZHVsZXIgc3BlY2lmaWMgZGF0YSwKICAgICAgKiBhcyB3ZWxs
IGFzICJyZWdpc3RlcmluZyIgdGhpcyBwQ1BVIHRvIHRoZSBzY2hlZHVsZXIgKHdoaWNoIG1heQog
ICAgICAqIGludm9sdmUgbW9kaWZ5aW5nIHNvbWUgc2NoZWR1bGVyIHdpZGUgZGF0YSBzdHJ1Y3R1
cmVzKS4KLSAgICAgKiBUaGlzIGhhcHBlbnMgYnkgY2FsbGluZyB0aGUgYWxsb2NfcGRhdGEgYW5k
IGluaXRfcGRhdGEgaG9va3MsIGluCi0gICAgICogdGhpcyBvcmRlci4gQSBzY2hlZHVsZXIgdGhh
dCBkb2VzIG5vdCBuZWVkIHRvIGFsbG9jYXRlIGFueSBwZXItcENQVQotICAgICAqIGRhdGEgY2Fu
IGF2b2lkIGltcGxlbWVudGluZyBhbGxvY19wZGF0YS4gaW5pdF9wZGF0YSBtYXksIGhvd2V2ZXIs
IGJlCi0gICAgICogbmVjZXNzYXJ5L3VzZWZ1bCBpbiB0aGlzIGNhc2UgdG9vIChlLmcuLCBpdCBj
YW4gY29udGFpbiB0aGUgInJlZ2lzdGVyCi0gICAgICogdGhlIHBDUFUgdG8gdGhlIHNjaGVkdWxl
ciIgcGFydCkuIGFsbG9jX3BkYXRhIChpZiBwcmVzZW50KSBpcyBjYWxsZWQKLSAgICAgKiBkdXJp
bmcgQ1BVX1VQX1BSRVBBUkUuIGluaXRfcGRhdGEgKGlmIHByZXNlbnQpIGlzIGNhbGxlZCBkdXJp
bmcKLSAgICAgKiBDUFVfU1RBUlRJTkcuCisgICAgICogQXMgbmV3IHBDUFVzIGFsd2F5cyBzdGFy
dCBhcyAiZnJlZSIgY3B1cyB3aXRoIHRoZSBtaW5pbWFsIGlkbGUKKyAgICAgKiBzY2hlZHVsZXIg
YmVpbmcgaW4gY2hhcmdlLCB3ZSBkb24ndCBuZWVkIGFueSBvZiB0aGF0LgogICAgICAqCiAgICAg
ICogT24gdGhlIG90aGVyIGhhbmQsIGF0IHRlYXJkb3duLCB3ZSBuZWVkIHRvIHJldmVyc2Ugd2hh
dCBoYXMgYmVlbiBkb25lCi0gICAgICogZHVyaW5nIGluaXRpYWxpemF0aW9uLCBhbmQgdGhlbiBm
cmVlIHRoZSBwZXItcENQVSBzcGVjaWZpYyBkYXRhLiBUaGlzCi0gICAgICogaGFwcGVucyBieSBj
YWxsaW5nIHRoZSBkZWluaXRfcGRhdGEgYW5kIGZyZWVfcGRhdGEgaG9va3MsIGluIHRoaXMKKyAg
ICAgKiBkdXJpbmcgaW5pdGlhbGl6YXRpb24sIGFuZCB0aGVuIGZyZWUgdGhlIHBlci1wQ1BVIHNw
ZWNpZmljIGRhdGEuIEEKKyAgICAgKiBwQ1BVIGJyb3VnaHQgZG93biBpcyBub3QgZm9yY2VkIHRo
cm91Z2ggImZyZWUiIGNwdXMsIHNvIGhlcmUgd2UgbmVlZCB0bworICAgICAqIHVzZSB0aGUgYXBw
cm9wcmlhdGUgaG9va3MuCisgICAgICoKKyAgICAgKiBUaGlzIGhhcHBlbnMgYnkgY2FsbGluZyB0
aGUgZGVpbml0X3BkYXRhIGFuZCBmcmVlX3BkYXRhIGhvb2tzLCBpbiB0aGlzCiAgICAgICogb3Jk
ZXIuIElmIG5vIHBlci1wQ1BVIG1lbW9yeSB3YXMgYWxsb2NhdGVkLCB0aGVyZSBpcyBubyBuZWVk
IHRvCiAgICAgICogcHJvdmlkZSBhbiBpbXBsZW1lbnRhdGlvbiBvZiBmcmVlX3BkYXRhLiBkZWlu
aXRfcGRhdGEgbWF5LCBob3dldmVyLAogICAgICAqIGJlIG5lY2Vzc2FyeS91c2VmdWwgaW4gdGhp
cyBjYXNlIHRvbyAoZS5nLiwgaXQgY2FuIHVuZG8gc29tZXRoaW5nIGRvbmUKICAgICAgKiBvbiBz
Y2hlZHVsZXIgd2lkZSBkYXRhIHN0cnVjdHVyZSBkdXJpbmcgaW5pdF9wZGF0YSkuIEJvdGggZGVp
bml0X3BkYXRhCiAgICAgICogYW5kIGZyZWVfcGRhdGEgYXJlIGNhbGxlZCBkdXJpbmcgQ1BVX0RF
QUQuCiAgICAgICoKLSAgICAgKiBJZiBzb21ldGluZyBnb2VzIHdyb25nIGR1cmluZyBicmluZ3Vw
LCB3ZSBnbyB0byBDUFVfVVBfQ0FOQ0VMTEVECi0gICAgICogKmJlZm9yZSogaGF2aW5nIGNhbGxl
ZCBpbml0X3BkYXRhLiBJbiB0aGlzIGNhc2UsIGFzIHRoZXJlIGlzIG5vCi0gICAgICogaW5pdGlh
bGl6YXRpb24gbmVlZGluZyB1bmRvaW5nLCBvbmx5IGZyZWVfcGRhdGEgc2hvdWxkIGJlIGNhbGxl
ZC4KLSAgICAgKiBUaGlzIG1lYW5zIGl0IGlzIHBvc3NpYmxlIHRvIGNhbGwgZnJlZV9wZGF0YSBq
dXN0IGFmdGVyIGFsbG9jX3BkYXRhLAotICAgICAqIHdpdGhvdXQgYSBpbml0X3BkYXRhL2RlaW5p
dF9wZGF0YSAiY3ljbGUiIGluIGJldHdlZW4gdGhlIHR3by4KLSAgICAgKgotICAgICAqIFNvLCBp
biBzdW1tYXJ5LCB0aGUgdXNhZ2UgcGF0dGVybiBzaG91bGQgbG9vayBlaXRoZXIKLSAgICAgKiAg
LSBhbGxvY19wZGF0YS0tPmluaXRfcGRhdGEtLT5kZWluaXRfcGRhdGEtLT5mcmVlX3BkYXRhLCBv
cgotICAgICAqICAtIGFsbG9jX3BkYXRhLS0+ZnJlZV9wZGF0YS4KKyAgICAgKiBJZiBzb21ldGlu
ZyBnb2VzIHdyb25nIGR1cmluZyBicmluZ3VwLCB3ZSBnbyB0byBDUFVfVVBfQ0FOQ0VMTEVELgog
ICAgICAqLwogICAgIHN3aXRjaCAoIGFjdGlvbiApCiAgICAgewotICAgIGNhc2UgQ1BVX1NUQVJU
SU5HOgotICAgICAgICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfcmVzdW1lICkKLSAg
ICAgICAgICAgIHNjaGVkX2luaXRfcGRhdGEoc2NoZWQsIHNkLT5zY2hlZF9wcml2LCBjcHUpOwot
ICAgICAgICBicmVhazsKICAgICBjYXNlIENQVV9VUF9QUkVQQVJFOgogICAgICAgICBpZiAoIHN5
c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfcmVzdW1lICkKICAgICAgICAgICAgIHJjID0gY3B1X3Nj
aGVkdWxlX3VwKGNwdSk7CkBAIC0xODI0LDkgKzE4MzEsNyBAQCB2b2lkIF9faW5pdCBzY2hlZHVs
ZXJfaW5pdCh2b2lkKQogICAgIGlkbGVfZG9tYWluLT5tYXhfdmNwdXMgPSBucl9jcHVfaWRzOwog
ICAgIGlmICggdmNwdV9jcmVhdGUoaWRsZV9kb21haW4sIDAsIDApID09IE5VTEwgKQogICAgICAg
ICBCVUcoKTsKLSAgICB0aGlzX2NwdShzY2hlZHVsZV9kYXRhKS5zY2hlZF9wcml2ID0gc2NoZWRf
YWxsb2NfcGRhdGEoJm9wcywgMCk7Ci0gICAgQlVHX09OKElTX0VSUih0aGlzX2NwdShzY2hlZHVs
ZV9kYXRhKS5zY2hlZF9wcml2KSk7Ci0gICAgc2NoZWRfaW5pdF9wZGF0YSgmb3BzLCB0aGlzX2Nw
dShzY2hlZHVsZV9kYXRhKS5zY2hlZF9wcml2LCAwKTsKKyAgICB0aGlzX2NwdShzY2hlZHVsZV9k
YXRhKS5jdXJyID0gaWRsZV92Y3B1WzBdOwogfQogCiAvKgpAQCAtMTgzNCwxOCArMTgzOSwxNCBA
QCB2b2lkIF9faW5pdCBzY2hlZHVsZXJfaW5pdCh2b2lkKQogICogY3B1cG9vbCwgb3Igc3ViamVj
dCBpdCB0byB0aGUgc2NoZWR1bGVyIG9mIGEgbmV3IGNwdXBvb2wuCiAgKgogICogRm9yIHRoZSBw
Q1BVcyB0aGF0IGFyZSByZW1vdmVkIGZyb20gdGhlaXIgY3B1cG9vbCwgdGhlaXIgc2NoZWR1bGVy
IGJlY29tZXMKLSAqICZvcHMgKHRoZSBkZWZhdWx0IHNjaGVkdWxlciwgc2VsZWN0ZWQgYXQgYm9v
dCwgd2hpY2ggYWxzbyBzZXJ2aWNlcyB0aGUKLSAqIGRlZmF1bHQgY3B1cG9vbCkuIEhvd2V2ZXIs
IGFzIHRoZXNlIHBDUFVzIGFyZSBub3QgcmVhbGx5IHBhcnQgb2YgYW55IHBvb2wsCi0gKiB0aGVy
ZSB3b24ndCBiZSBhbnkgc2NoZWR1bGluZyBldmVudCBvbiB0aGVtLCBub3QgZXZlbiBmcm9tIHRo
ZSBkZWZhdWx0Ci0gKiBzY2hlZHVsZXIuIEJhc2ljYWxseSwgdGhleSB3aWxsIGp1c3Qgc2l0IGlk
bGUgdW50aWwgdGhleSBhcmUgZXhwbGljaXRseQotICogYWRkZWQgYmFjayB0byBhIGNwdXBvb2wu
CisgKiAmc2NoZWRfaWRsZV9vcHMgKHRoZSBpZGxlIHNjaGVkdWxlcikuCiAgKi8KIGludCBzY2hl
ZHVsZV9jcHVfc3dpdGNoKHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBjcHVwb29sICpjKQogewog
ICAgIHN0cnVjdCB2Y3B1ICppZGxlOwogICAgIHZvaWQgKnBwcml2LCAqcHByaXZfb2xkLCAqdnBy
aXYsICp2cHJpdl9vbGQ7CiAgICAgc3RydWN0IHNjaGVkdWxlciAqb2xkX29wcyA9IHBlcl9jcHUo
c2NoZWR1bGVyLCBjcHUpOwotICAgIHN0cnVjdCBzY2hlZHVsZXIgKm5ld19vcHMgPSAoYyA9PSBO
VUxMKSA/ICZvcHMgOiBjLT5zY2hlZDsKKyAgICBzdHJ1Y3Qgc2NoZWR1bGVyICpuZXdfb3BzID0g
KGMgPT0gTlVMTCkgPyAmc2NoZWRfaWRsZV9vcHMgOiBjLT5zY2hlZDsKICAgICBzdHJ1Y3QgY3B1
cG9vbCAqb2xkX3Bvb2wgPSBwZXJfY3B1KGNwdXBvb2wsIGNwdSk7CiAgICAgc3RydWN0IHNjaGVk
dWxlX2RhdGEgKnNkID0gJnBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KTsKICAgICBzcGlubG9j
a190ICpvbGRfbG9jaywgKm5ld19sb2NrOwpAQCAtMTg2NSw5ICsxODY2LDYgQEAgaW50IHNjaGVk
dWxlX2NwdV9zd2l0Y2godW5zaWduZWQgaW50IGNwdSwgc3RydWN0IGNwdXBvb2wgKmMpCiAgICAg
QVNTRVJUKChjID09IE5VTEwgJiYgIWNwdW1hc2tfdGVzdF9jcHUoY3B1LCBvbGRfcG9vbC0+Y3B1
X3ZhbGlkKSkgfHwKICAgICAgICAgICAgKGMgIT0gTlVMTCAmJiAhY3B1bWFza190ZXN0X2NwdShj
cHUsIGMtPmNwdV92YWxpZCkpKTsKIAotICAgIGlmICggb2xkX29wcyA9PSBuZXdfb3BzICkKLSAg
ICAgICAgZ290byBvdXQ7Ci0KICAgICAvKgogICAgICAqIFRvIHNldHVwIHRoZSBjcHUgZm9yIHRo
ZSBuZXcgc2NoZWR1bGVyIHdlIG5lZWQ6CiAgICAgICogIC0gYSB2YWxpZCBpbnN0YW5jZSBvZiBw
ZXItQ1BVIHNjaGVkdWxlciBzcGVjaWZpYyBkYXRhLCBhcyBpdCBpcwpAQCAtMTkzMSw3ICsxOTI5
LDYgQEAgaW50IHNjaGVkdWxlX2NwdV9zd2l0Y2godW5zaWduZWQgaW50IGNwdSwgc3RydWN0IGNw
dXBvb2wgKmMpCiAgICAgc2NoZWRfZnJlZV92ZGF0YShvbGRfb3BzLCB2cHJpdl9vbGQpOwogICAg
IHNjaGVkX2ZyZWVfcGRhdGEob2xkX29wcywgcHByaXZfb2xkLCBjcHUpOwogCi0gb3V0OgogICAg
IHBlcl9jcHUoY3B1cG9vbCwgY3B1KSA9IGM7CiAgICAgLyogV2hlbiBhIGNwdSBpcyBhZGRlZCB0
byBhIHBvb2wsIHRyaWdnZXIgaXQgdG8gZ28gcGljayB1cCBzb21lIHdvcmsgKi8KICAgICBpZiAo
IGMgIT0gTlVMTCApCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
