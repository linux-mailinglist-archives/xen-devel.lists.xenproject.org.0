Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8D22C461
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:35:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZQf-0005mF-CQ; Tue, 28 May 2019 10:34:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQD-0004qM-2v
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:33 +0000
X-Inumbo-ID: 09f57bc9-8134-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 09f57bc9-8134-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 10:33:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5C800B039;
 Tue, 28 May 2019 10:33:31 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:33:10 +0200
Message-Id: <20190528103313.1343-58-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 57/60] xen/sched: support multiple cpus per
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
IGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDc4ZWIwNTVkMDcuLjZmNjg4NmQ1YzMgMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxl
LmMKQEAgLTU5LDcgKzU5LDcgQEAgaW50ZWdlcl9wYXJhbSgic2NoZWRfcmF0ZWxpbWl0X3VzIiwg
c2NoZWRfcmF0ZWxpbWl0X3VzKTsKIGVudW0gc2NoZWRfZ3JhbiBvcHRfc2NoZWRfZ3JhbnVsYXJp
dHkgPSBTQ0hFRF9HUkFOX2NwdTsKIHVuc2lnbmVkIGludCBzY2hlZF9ncmFudWxhcml0eSA9IDE7
CiBib29sIHNjaGVkX2Rpc2FibGVfc210X3N3aXRjaGluZzsKLWNvbnN0IGNwdW1hc2tfdCAqc2No
ZWRfcmVzX21hc2sgPSAmY3B1bWFza19hbGw7CitjcHVtYXNrX3Zhcl90IHNjaGVkX3Jlc19tYXNr
OwogCiAvKiBDb21tb24gbG9jayBmb3IgZnJlZSBjcHVzLiAqLwogc3RhdGljIERFRklORV9TUElO
TE9DSyhzY2hlZF9mcmVlX2NwdV9sb2NrKTsKQEAgLTIyODgsOCArMjI4OCwxNCBAQCBzdGF0aWMg
aW50IGNwdV9zY2hlZHVsZV91cCh1bnNpZ25lZCBpbnQgY3B1KQogICAgIHNkID0geHphbGxvYyhz
dHJ1Y3Qgc2NoZWRfcmVzb3VyY2UpOwogICAgIGlmICggc2QgPT0gTlVMTCApCiAgICAgICAgIHJl
dHVybiAtRU5PTUVNOworICAgIGlmICggIXphbGxvY19jcHVtYXNrX3Zhcigmc2QtPmNwdXMpICkK
KyAgICB7CisgICAgICAgIHhmcmVlKHNkKTsKKyAgICAgICAgcmV0dXJuIC1FTk9NRU07CisgICAg
fQorCiAgICAgc2QtPnByb2Nlc3NvciA9IGNwdTsKLSAgICBzZC0+Y3B1cyA9IGNwdW1hc2tfb2Yo
Y3B1KTsKKyAgICBjcHVtYXNrX2NvcHkoc2QtPmNwdXMsIGNwdW1hc2tfb2YoY3B1KSk7CiAgICAg
c2V0X3NjaGVkX3JlcyhjcHUsIHNkKTsKIAogICAgIHNkLT5zY2hlZHVsZXIgPSAmc2NoZWRfaWRs
ZV9vcHM7CkBAIC0yMzAxLDYgKzIzMDcsOCBAQCBzdGF0aWMgaW50IGNwdV9zY2hlZHVsZV91cCh1
bnNpZ25lZCBpbnQgY3B1KQogICAgIC8qIFdlIHN0YXJ0IHdpdGggY3B1IGdyYW51bGFyaXR5LiAq
LwogICAgIHNkLT5ncmFudWxhcml0eSA9IDE7CiAKKyAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCBz
Y2hlZF9yZXNfbWFzayk7CisKICAgICAvKiBCb290IENQVSBpcyBkZWFsdCB3aXRoIGxhdGVyIGlu
IHNjaGVkdWxlX2luaXQoKS4gKi8KICAgICBpZiAoIGNwdSA9PSAwICkKICAgICAgICAgcmV0dXJu
IDA7CkBAIC0yMzM2LDYgKzIzNDQsNyBAQCBzdGF0aWMgdm9pZCBzY2hlZF9yZXNfZnJlZShzdHJ1
Y3QgcmN1X2hlYWQgKmhlYWQpCiB7CiAgICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpzZCA9IGNv
bnRhaW5lcl9vZihoZWFkLCBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UsIHJjdSk7CiAKKyAgICBmcmVl
X2NwdW1hc2tfdmFyKHNkLT5jcHVzKTsKICAgICB4ZnJlZShzZCk7CiB9CiAKQEAgLTI0ODQsNiAr
MjQ5Myw5IEBAIHZvaWQgX19pbml0IHNjaGVkdWxlcl9pbml0KHZvaWQpCiAgICAgICAgIHByaW50
aygiVXNpbmcgJyVzJyAoJXMpXG4iLCBvcHMubmFtZSwgb3BzLm9wdF9uYW1lKTsKICAgICB9CiAK
KyAgICBpZiAoICF6YWxsb2NfY3B1bWFza192YXIoJnNjaGVkX3Jlc19tYXNrKSApCisgICAgICAg
IEJVRygpOworCiAgICAgaWYgKCBjcHVfc2NoZWR1bGVfdXAoMCkgKQogICAgICAgICBCVUcoKTsK
ICAgICByZWdpc3Rlcl9jcHVfbm90aWZpZXIoJmNwdV9zY2hlZHVsZV9uZmIpOwpkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYu
aAppbmRleCBhYmY2ZDA1MjJkLi43MTRkNzkzODE1IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQtaWYuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaApAQCAtMjQsNyAr
MjQsNyBAQCBleHRlcm4gY3B1bWFza190IGNwdXBvb2xfZnJlZV9jcHVzOwogZXh0ZXJuIGludCBz
Y2hlZF9yYXRlbGltaXRfdXM7CiAKIC8qIFNjaGVkdWxpbmcgcmVzb3VyY2UgbWFzay4gKi8KLWV4
dGVybiBjb25zdCBjcHVtYXNrX3QgKnNjaGVkX3Jlc19tYXNrOworZXh0ZXJuIGNwdW1hc2tfdmFy
X3Qgc2NoZWRfcmVzX21hc2s7CiAKIC8qIE51bWJlciBvZiB2Y3B1cyBwZXIgc3RydWN0IHNjaGVk
X3VuaXQuICovCiBlbnVtIHNjaGVkX2dyYW4gewpAQCAtNTgsNyArNTgsNyBAQCBzdHJ1Y3Qgc2No
ZWRfcmVzb3VyY2UgewogICAgIGF0b21pY190ICAgICAgICAgICAgdXJnZW50X2NvdW50OyAgIC8q
IGhvdyBtYW55IHVyZ2VudCB2Y3B1cyAgICAgICAgICAgKi8KICAgICB1bnNpZ25lZCBpbnQgICAg
ICAgIHByb2Nlc3NvcjsKICAgICB1bnNpZ25lZCBpbnQgICAgICAgIGdyYW51bGFyaXR5OwotICAg
IGNvbnN0IGNwdW1hc2tfdCAgICAqY3B1czsgICAgICAgICAgIC8qIGNwdXMgY292ZXJlZCBieSB0
aGlzIHN0cnVjdCAgICAgKi8KKyAgICBjcHVtYXNrX3Zhcl90ICAgICAgIGNwdXM7ICAgICAgICAg
ICAvKiBjcHVzIGNvdmVyZWQgYnkgdGhpcyBzdHJ1Y3QgICAgICovCiAgICAgc3RydWN0IHJjdV9o
ZWFkICAgICByY3U7CiB9OwogCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
