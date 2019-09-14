Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CD3B2A9F
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 10:56:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i93os-0000gq-CK; Sat, 14 Sep 2019 08:54:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i93oq-0000fY-Vc
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 08:54:13 +0000
X-Inumbo-ID: 130ac5b0-d6cd-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 130ac5b0-d6cd-11e9-b76c-bc764e2007e4;
 Sat, 14 Sep 2019 08:53:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7A19EB664;
 Sat, 14 Sep 2019 08:53:08 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 14 Sep 2019 10:52:47 +0200
Message-Id: <20190914085251.18816-44-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190914085251.18816-1-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v3 43/47] xen/sched: support multiple cpus per
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
IGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IGMyZTVhOTIyMGQuLjg4MmIzYmFmNDIgMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxl
LmMKQEAgLTU5LDcgKzU5LDcgQEAgaW50ZWdlcl9wYXJhbSgic2NoZWRfcmF0ZWxpbWl0X3VzIiwg
c2NoZWRfcmF0ZWxpbWl0X3VzKTsKIGVudW0gc2NoZWRfZ3JhbiBfX3JlYWRfbW9zdGx5IG9wdF9z
Y2hlZF9ncmFudWxhcml0eSA9IFNDSEVEX0dSQU5fY3B1OwogdW5zaWduZWQgaW50IF9fcmVhZF9t
b3N0bHkgc2NoZWRfZ3JhbnVsYXJpdHkgPSAxOwogYm9vbCBfX3JlYWRfbW9zdGx5IHNjaGVkX2Rp
c2FibGVfc210X3N3aXRjaGluZzsKLWNvbnN0IGNwdW1hc2tfdCAqc2NoZWRfcmVzX21hc2sgPSAm
Y3B1bWFza19hbGw7CitjcHVtYXNrX3Zhcl90IHNjaGVkX3Jlc19tYXNrOwogCiAvKiBDb21tb24g
bG9jayBmb3IgZnJlZSBjcHVzLiAqLwogc3RhdGljIERFRklORV9TUElOTE9DSyhzY2hlZF9mcmVl
X2NwdV9sb2NrKTsKQEAgLTIzODgsOCArMjM4OCwxNCBAQCBzdGF0aWMgaW50IGNwdV9zY2hlZHVs
ZV91cCh1bnNpZ25lZCBpbnQgY3B1KQogICAgIHNkID0geHphbGxvYyhzdHJ1Y3Qgc2NoZWRfcmVz
b3VyY2UpOwogICAgIGlmICggc2QgPT0gTlVMTCApCiAgICAgICAgIHJldHVybiAtRU5PTUVNOwor
ICAgIGlmICggIXphbGxvY19jcHVtYXNrX3Zhcigmc2QtPmNwdXMpICkKKyAgICB7CisgICAgICAg
IHhmcmVlKHNkKTsKKyAgICAgICAgcmV0dXJuIC1FTk9NRU07CisgICAgfQorCiAgICAgc2QtPm1h
c3Rlcl9jcHUgPSBjcHU7Ci0gICAgc2QtPmNwdXMgPSBjcHVtYXNrX29mKGNwdSk7CisgICAgY3B1
bWFza19jb3B5KHNkLT5jcHVzLCBjcHVtYXNrX29mKGNwdSkpOwogICAgIHNldF9zY2hlZF9yZXMo
Y3B1LCBzZCk7CiAKICAgICBzZC0+c2NoZWR1bGVyID0gJnNjaGVkX2lkbGVfb3BzOwpAQCAtMjQw
MSw2ICsyNDA3LDggQEAgc3RhdGljIGludCBjcHVfc2NoZWR1bGVfdXAodW5zaWduZWQgaW50IGNw
dSkKICAgICAvKiBXZSBzdGFydCB3aXRoIGNwdSBncmFudWxhcml0eS4gKi8KICAgICBzZC0+Z3Jh
bnVsYXJpdHkgPSAxOwogCisgICAgY3B1bWFza19zZXRfY3B1KGNwdSwgc2NoZWRfcmVzX21hc2sp
OworCiAgICAgLyogQm9vdCBDUFUgaXMgZGVhbHQgd2l0aCBsYXRlciBpbiBzY2hlZHVsZXJfaW5p
dCgpLiAqLwogICAgIGlmICggY3B1ID09IDAgKQogICAgICAgICByZXR1cm4gMDsKQEAgLTI0MzMs
NiArMjQ0MSw3IEBAIHN0YXRpYyB2b2lkIHNjaGVkX3Jlc19mcmVlKHN0cnVjdCByY3VfaGVhZCAq
aGVhZCkKIHsKICAgICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNkID0gY29udGFpbmVyX29mKGhl
YWQsIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSwgcmN1KTsKIAorICAgIGZyZWVfY3B1bWFza192YXIo
c2QtPmNwdXMpOwogICAgIHhmcmVlKHNkKTsKIH0KIApAQCAtMjU4MSw2ICsyNTkwLDkgQEAgdm9p
ZCBfX2luaXQgc2NoZWR1bGVyX2luaXQodm9pZCkKICAgICAgICAgcHJpbnRrKCJVc2luZyAnJXMn
ICglcylcbiIsIG9wcy5uYW1lLCBvcHMub3B0X25hbWUpOwogICAgIH0KIAorICAgIGlmICggIXph
bGxvY19jcHVtYXNrX3Zhcigmc2NoZWRfcmVzX21hc2spICkKKyAgICAgICAgQlVHKCk7CisKICAg
ICBpZiAoIGNwdV9zY2hlZHVsZV91cCgwKSApCiAgICAgICAgIEJVRygpOwogICAgIHJlZ2lzdGVy
X2NwdV9ub3RpZmllcigmY3B1X3NjaGVkdWxlX25mYik7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQtaWYuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCmluZGV4IGYxMGVk
NzY4YjAuLjE3NzBiOWJjYTEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5o
CisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCkBAIC0yNCw3ICsyNCw3IEBAIGV4dGVy
biBjcHVtYXNrX3QgY3B1cG9vbF9mcmVlX2NwdXM7CiBleHRlcm4gaW50IHNjaGVkX3JhdGVsaW1p
dF91czsKIAogLyogU2NoZWR1bGluZyByZXNvdXJjZSBtYXNrLiAqLwotZXh0ZXJuIGNvbnN0IGNw
dW1hc2tfdCAqc2NoZWRfcmVzX21hc2s7CitleHRlcm4gY3B1bWFza192YXJfdCBzY2hlZF9yZXNf
bWFzazsKIAogLyogTnVtYmVyIG9mIHZjcHVzIHBlciBzdHJ1Y3Qgc2NoZWRfdW5pdC4gKi8KIGVu
dW0gc2NoZWRfZ3JhbiB7CkBAIC01OSw3ICs1OSw3IEBAIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSB7
CiAgICAgLyogQ3B1IHdpdGggbG93ZXN0IGlkIGluIHNjaGVkdWxpbmcgcmVzb3VyY2UuICovCiAg
ICAgdW5zaWduZWQgaW50ICAgICAgICBtYXN0ZXJfY3B1OwogICAgIHVuc2lnbmVkIGludCAgICAg
ICAgZ3JhbnVsYXJpdHk7Ci0gICAgY29uc3QgY3B1bWFza190ICAgICpjcHVzOyAgICAgICAgICAg
LyogY3B1cyBjb3ZlcmVkIGJ5IHRoaXMgc3RydWN0ICAgICAqLworICAgIGNwdW1hc2tfdmFyX3Qg
ICAgICAgY3B1czsgICAgICAgICAgIC8qIGNwdXMgY292ZXJlZCBieSB0aGlzIHN0cnVjdCAgICAg
Ki8KICAgICBzdHJ1Y3QgcmN1X2hlYWQgICAgIHJjdTsKIH07CiAKLS0gCjIuMTYuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
