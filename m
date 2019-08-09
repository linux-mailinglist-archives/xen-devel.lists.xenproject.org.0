Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA22787D84
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6MQ-0007Q8-3O; Fri, 09 Aug 2019 14:59:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hw6M5-0006hN-Cv
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:58:57 +0000
X-Inumbo-ID: 34a66604-bab6-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 34a66604-bab6-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 14:58:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4B03B061;
 Fri,  9 Aug 2019 14:58:53 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 16:58:29 +0200
Message-Id: <20190809145833.1020-45-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809145833.1020-1-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 44/48] xen/sched: support multiple cpus per
 scheduling resource
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJlcGFyZSBzdXBwb3J0aW5nIG11bHRpcGxlIGNwdXMgcGVyIHNjaGVkdWxpbmcgcmVzb3VyY2Ug
YnkgYWxsb2NhdGluZwp0aGUgY3B1bWFzayBwZXIgcmVzb3VyY2UgZHluYW1pY2FsbHkuCgpNb2Rp
Znkgc2NoZWRfcmVzX21hc2sgdG8gaGF2ZSBvbmx5IG9uZSBiaXQgcGVyIHNjaGVkdWxpbmcgcmVz
b3VyY2Ugc2V0LgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgotLS0KVjE6IG5ldyBwYXRjaCAoY2FydmVkIG91dCBmcm9tIG90aGVyIHBhdGNoKQotLS0KIHhl
bi9jb21tb24vc2NoZWR1bGUuYyAgICAgIHwgMTYgKysrKysrKysrKysrKystLQogeGVuL2luY2x1
ZGUveGVuL3NjaGVkLWlmLmggfCAgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5j
IGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IGY5NWQzNDYzMzAuLjk0OGZlMWI4MzggMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxl
LmMKQEAgLTU5LDcgKzU5LDcgQEAgaW50ZWdlcl9wYXJhbSgic2NoZWRfcmF0ZWxpbWl0X3VzIiwg
c2NoZWRfcmF0ZWxpbWl0X3VzKTsKIGVudW0gc2NoZWRfZ3JhbiBfX3JlYWRfbW9zdGx5IG9wdF9z
Y2hlZF9ncmFudWxhcml0eSA9IFNDSEVEX0dSQU5fY3B1OwogdW5zaWduZWQgaW50IF9fcmVhZF9t
b3N0bHkgc2NoZWRfZ3JhbnVsYXJpdHkgPSAxOwogYm9vbCBfX3JlYWRfbW9zdGx5IHNjaGVkX2Rp
c2FibGVfc210X3N3aXRjaGluZzsKLWNvbnN0IGNwdW1hc2tfdCAqc2NoZWRfcmVzX21hc2sgPSAm
Y3B1bWFza19hbGw7CitjcHVtYXNrX3Zhcl90IHNjaGVkX3Jlc19tYXNrOwogCiAvKiBDb21tb24g
bG9jayBmb3IgZnJlZSBjcHVzLiAqLwogc3RhdGljIERFRklORV9TUElOTE9DSyhzY2hlZF9mcmVl
X2NwdV9sb2NrKTsKQEAgLTIzNzcsOCArMjM3NywxNCBAQCBzdGF0aWMgaW50IGNwdV9zY2hlZHVs
ZV91cCh1bnNpZ25lZCBpbnQgY3B1KQogICAgIHNkID0geHphbGxvYyhzdHJ1Y3Qgc2NoZWRfcmVz
b3VyY2UpOwogICAgIGlmICggc2QgPT0gTlVMTCApCiAgICAgICAgIHJldHVybiAtRU5PTUVNOwor
ICAgIGlmICggIXphbGxvY19jcHVtYXNrX3Zhcigmc2QtPmNwdXMpICkKKyAgICB7CisgICAgICAg
IHhmcmVlKHNkKTsKKyAgICAgICAgcmV0dXJuIC1FTk9NRU07CisgICAgfQorCiAgICAgc2QtPnBy
b2Nlc3NvciA9IGNwdTsKLSAgICBzZC0+Y3B1cyA9IGNwdW1hc2tfb2YoY3B1KTsKKyAgICBjcHVt
YXNrX2NvcHkoc2QtPmNwdXMsIGNwdW1hc2tfb2YoY3B1KSk7CiAgICAgc2V0X3NjaGVkX3Jlcyhj
cHUsIHNkKTsKIAogICAgIHNkLT5zY2hlZHVsZXIgPSAmc2NoZWRfaWRsZV9vcHM7CkBAIC0yMzkw
LDYgKzIzOTYsOCBAQCBzdGF0aWMgaW50IGNwdV9zY2hlZHVsZV91cCh1bnNpZ25lZCBpbnQgY3B1
KQogICAgIC8qIFdlIHN0YXJ0IHdpdGggY3B1IGdyYW51bGFyaXR5LiAqLwogICAgIHNkLT5ncmFu
dWxhcml0eSA9IDE7CiAKKyAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCBzY2hlZF9yZXNfbWFzayk7
CisKICAgICAvKiBCb290IENQVSBpcyBkZWFsdCB3aXRoIGxhdGVyIGluIHNjaGVkdWxlcl9pbml0
KCkuICovCiAgICAgaWYgKCBjcHUgPT0gMCApCiAgICAgICAgIHJldHVybiAwOwpAQCAtMjQyMiw2
ICsyNDMwLDcgQEAgc3RhdGljIHZvaWQgc2NoZWRfcmVzX2ZyZWUoc3RydWN0IHJjdV9oZWFkICpo
ZWFkKQogewogICAgIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc2QgPSBjb250YWluZXJfb2YoaGVh
ZCwgc3RydWN0IHNjaGVkX3Jlc291cmNlLCByY3UpOwogCisgICAgZnJlZV9jcHVtYXNrX3Zhcihz
ZC0+Y3B1cyk7CiAgICAgeGZyZWUoc2QpOwogfQogCkBAIC0yNTcwLDYgKzI1NzksOSBAQCB2b2lk
IF9faW5pdCBzY2hlZHVsZXJfaW5pdCh2b2lkKQogICAgICAgICBwcmludGsoIlVzaW5nICclcycg
KCVzKVxuIiwgb3BzLm5hbWUsIG9wcy5vcHRfbmFtZSk7CiAgICAgfQogCisgICAgaWYgKCAhemFs
bG9jX2NwdW1hc2tfdmFyKCZzY2hlZF9yZXNfbWFzaykgKQorICAgICAgICBCVUcoKTsKKwogICAg
IGlmICggY3B1X3NjaGVkdWxlX3VwKDApICkKICAgICAgICAgQlVHKCk7CiAgICAgcmVnaXN0ZXJf
Y3B1X25vdGlmaWVyKCZjcHVfc2NoZWR1bGVfbmZiKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC1pZi5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKaW5kZXggZGU1MGI0
ZWJjYS4uNWE5M2JhMzY4NiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgK
KysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKQEAgLTI0LDcgKzI0LDcgQEAgZXh0ZXJu
IGNwdW1hc2tfdCBjcHVwb29sX2ZyZWVfY3B1czsKIGV4dGVybiBpbnQgc2NoZWRfcmF0ZWxpbWl0
X3VzOwogCiAvKiBTY2hlZHVsaW5nIHJlc291cmNlIG1hc2suICovCi1leHRlcm4gY29uc3QgY3B1
bWFza190ICpzY2hlZF9yZXNfbWFzazsKK2V4dGVybiBjcHVtYXNrX3Zhcl90IHNjaGVkX3Jlc19t
YXNrOwogCiAvKiBOdW1iZXIgb2YgdmNwdXMgcGVyIHN0cnVjdCBzY2hlZF91bml0LiAqLwogZW51
bSBzY2hlZF9ncmFuIHsKQEAgLTU4LDcgKzU4LDcgQEAgc3RydWN0IHNjaGVkX3Jlc291cmNlIHsK
ICAgICBhdG9taWNfdCAgICAgICAgICAgIHVyZ2VudF9jb3VudDsgICAvKiBob3cgbWFueSB1cmdl
bnQgdmNwdXMgICAgICAgICAgICovCiAgICAgdW5zaWduZWQgaW50ICAgICAgICBwcm9jZXNzb3I7
CiAgICAgdW5zaWduZWQgaW50ICAgICAgICBncmFudWxhcml0eTsKLSAgICBjb25zdCBjcHVtYXNr
X3QgICAgKmNwdXM7ICAgICAgICAgICAvKiBjcHVzIGNvdmVyZWQgYnkgdGhpcyBzdHJ1Y3QgICAg
ICovCisgICAgY3B1bWFza192YXJfdCAgICAgICBjcHVzOyAgICAgICAgICAgLyogY3B1cyBjb3Zl
cmVkIGJ5IHRoaXMgc3RydWN0ICAgICAqLwogICAgIHN0cnVjdCByY3VfaGVhZCAgICAgcmN1Owog
fTsKIAotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
