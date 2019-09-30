Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03DEC1AEF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 07:24:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEo81-0001up-Qk; Mon, 30 Sep 2019 05:21:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEo80-0001uZ-AK
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 05:21:44 +0000
X-Inumbo-ID: 2ed02a5c-e342-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 2ed02a5c-e342-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 05:21:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E1C8B027;
 Mon, 30 Sep 2019 05:21:40 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2019 07:21:20 +0200
Message-Id: <20190930052135.11257-5-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190930052135.11257-1-jgross@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v5 04/19] xen/sched: modify
 cpupool_domain_cpumask() to be an unit mask
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y3B1cG9vbF9kb21haW5fY3B1bWFzaygpIGlzIHVzZWQgYnkgc2NoZWR1bGluZyB0byBzZWxlY3Qg
Y3B1cyBvciB0bwppdGVyYXRlIG92ZXIgY3B1cy4gSW4gb3JkZXIgdG8gc3VwcG9ydCBzY2hlZHVs
aW5nIHVuaXRzIHNwYW5uaW5nCm11bHRpcGxlIGNwdXMgcmVuYW1lIGNwdXBvb2xfZG9tYWluX2Nw
dW1hc2soKSB0bwpjcHVwb29sX2RvbWFpbl9tYXN0ZXJfY3B1bWFzaygpIGFuZCBsZXQgaXQgcmV0
dXJuIGEgY3B1bWFzayB3aXRoIG9ubHkKb25lIGJpdCBzZXQgcGVyIHNjaGVkdWxpbmcgcmVzb3Vy
Y2UuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClJldmll
d2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgotLS0KVjQ6Ci0gcmVu
YW1lIHRvIGNwdXBvb2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKCkgKEphbiBCZXVsaWNoKQotIGNo
ZWNrIHJldHVybiB2YWx1ZSBvZiB6YWxsb2NfY3B1bWFza192YXIoKSAoSmFuIEJldWxpY2gpCi0t
LQogeGVuL2NvbW1vbi9jcHVwb29sLmMgICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgfCAgMiArLQogeGVuL2NvbW1vbi9k
b21jdGwuYyAgICAgICAgIHwgIDIgKy0KIHhlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYyB8ICAy
ICstCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jICAgfCAgNCArKy0tCiB4ZW4vY29tbW9uL3Nj
aGVkX2NyZWRpdDIuYyAgfCAyMiArKysrKysrKysrKy0tLS0tLS0tLS0tCiB4ZW4vY29tbW9uL3Nj
aGVkX251bGwuYyAgICAgfCAgOCArKysrLS0tLQogeGVuL2NvbW1vbi9zY2hlZF9ydC5jICAgICAg
IHwgIDggKysrKy0tLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyAgICAgICB8IDEzICsrKysrKyst
LS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oICB8ICA5ICsrKysrKy0tLQogMTAgZmls
ZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9jcHVwb29sLmMgYi94ZW4vY29tbW9uL2NwdXBvb2wuYwppbmRleCBmZDMw
MDQwOTIyLi40NDFhMjZmMTZjIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2NwdXBvb2wuYworKysg
Yi94ZW4vY29tbW9uL2NwdXBvb2wuYwpAQCAtMzYsMjYgKzM2LDMzIEBAIHN0YXRpYyBERUZJTkVf
U1BJTkxPQ0soY3B1cG9vbF9sb2NrKTsKIAogREVGSU5FX1BFUl9DUFUoc3RydWN0IGNwdXBvb2wg
KiwgY3B1cG9vbCk7CiAKK3N0YXRpYyB2b2lkIGZyZWVfY3B1cG9vbF9zdHJ1Y3Qoc3RydWN0IGNw
dXBvb2wgKmMpCit7CisgICAgaWYgKCBjICkKKyAgICB7CisgICAgICAgIGZyZWVfY3B1bWFza192
YXIoYy0+cmVzX3ZhbGlkKTsKKyAgICAgICAgZnJlZV9jcHVtYXNrX3ZhcihjLT5jcHVfdmFsaWQp
OworICAgIH0KKyAgICB4ZnJlZShjKTsKK30KKwogc3RhdGljIHN0cnVjdCBjcHVwb29sICphbGxv
Y19jcHVwb29sX3N0cnVjdCh2b2lkKQogewogICAgIHN0cnVjdCBjcHVwb29sICpjID0geHphbGxv
YyhzdHJ1Y3QgY3B1cG9vbCk7CiAKLSAgICBpZiAoICFjIHx8ICF6YWxsb2NfY3B1bWFza192YXIo
JmMtPmNwdV92YWxpZCkgKQorICAgIGlmICggIWMgKQorICAgICAgICByZXR1cm4gTlVMTDsKKwor
ICAgIGlmICggIXphbGxvY19jcHVtYXNrX3ZhcigmYy0+Y3B1X3ZhbGlkKSB8fAorICAgICAgICAg
IXphbGxvY19jcHVtYXNrX3ZhcigmYy0+cmVzX3ZhbGlkKSApCiAgICAgewotICAgICAgICB4ZnJl
ZShjKTsKKyAgICAgICAgZnJlZV9jcHVwb29sX3N0cnVjdChjKTsKICAgICAgICAgYyA9IE5VTEw7
CiAgICAgfQogCiAgICAgcmV0dXJuIGM7CiB9CiAKLXN0YXRpYyB2b2lkIGZyZWVfY3B1cG9vbF9z
dHJ1Y3Qoc3RydWN0IGNwdXBvb2wgKmMpCi17Ci0gICAgaWYgKCBjICkKLSAgICAgICAgZnJlZV9j
cHVtYXNrX3ZhcihjLT5jcHVfdmFsaWQpOwotICAgIHhmcmVlKGMpOwotfQotCiAvKgogICogZmlu
ZCBhIGNwdXBvb2wgYnkgaXQncyBpZC4gdG8gYmUgY2FsbGVkIHdpdGggY3B1cG9vbCBsb2NrIGhl
bGQKICAqIGlmIGV4YWN0IGlzIG5vdCBzcGVjaWZpZWQsIHRoZSBmaXJzdCBjcHVwb29sIHdpdGgg
YW4gaWQgbGFyZ2VyIG9yIGVxdWFsIHRvCkBAIC0yNjksNiArMjc2LDcgQEAgc3RhdGljIGludCBj
cHVwb29sX2Fzc2lnbl9jcHVfbG9ja2VkKHN0cnVjdCBjcHVwb29sICpjLCB1bnNpZ25lZCBpbnQg
Y3B1KQogICAgICAgICBjcHVwb29sX2NwdV9tb3ZpbmcgPSBOVUxMOwogICAgIH0KICAgICBjcHVt
YXNrX3NldF9jcHUoY3B1LCBjLT5jcHVfdmFsaWQpOworICAgIGNwdW1hc2tfYW5kKGMtPnJlc192
YWxpZCwgYy0+Y3B1X3ZhbGlkLCBzY2hlZF9yZXNfbWFzayk7CiAKICAgICByY3VfcmVhZF9sb2Nr
KCZkb21saXN0X3JlYWRfbG9jayk7CiAgICAgZm9yX2VhY2hfZG9tYWluX2luX2NwdXBvb2woZCwg
YykKQEAgLTM2MSw2ICszNjksNyBAQCBzdGF0aWMgaW50IGNwdXBvb2xfdW5hc3NpZ25fY3B1X3N0
YXJ0KHN0cnVjdCBjcHVwb29sICpjLCB1bnNpZ25lZCBpbnQgY3B1KQogICAgIGF0b21pY19pbmMo
JmMtPnJlZmNudCk7CiAgICAgY3B1cG9vbF9jcHVfbW92aW5nID0gYzsKICAgICBjcHVtYXNrX2Ns
ZWFyX2NwdShjcHUsIGMtPmNwdV92YWxpZCk7CisgICAgY3B1bWFza19hbmQoYy0+cmVzX3ZhbGlk
LCBjLT5jcHVfdmFsaWQsIHNjaGVkX3Jlc19tYXNrKTsKIAogb3V0OgogICAgIHNwaW5fdW5sb2Nr
KCZjcHVwb29sX2xvY2spOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9j
b21tb24vZG9tYWluLmMKaW5kZXggOTNhYTg1NmJjYi4uOWM3MzYwZWQyYSAxMDA2NDQKLS0tIGEv
eGVuL2NvbW1vbi9kb21haW4uYworKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCkBAIC01ODQsNyAr
NTg0LDcgQEAgdm9pZCBkb21haW5fdXBkYXRlX25vZGVfYWZmaW5pdHkoc3RydWN0IGRvbWFpbiAq
ZCkKICAgICAgICAgcmV0dXJuOwogICAgIH0KIAotICAgIG9ubGluZSA9IGNwdXBvb2xfZG9tYWlu
X2NwdW1hc2soZCk7CisgICAgb25saW5lID0gY3B1cG9vbF9kb21haW5fbWFzdGVyX2NwdW1hc2so
ZCk7CiAKICAgICBzcGluX2xvY2soJmQtPm5vZGVfYWZmaW5pdHlfbG9jayk7CiAKZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vZG9tY3RsLmMgYi94ZW4vY29tbW9uL2RvbWN0bC5jCmluZGV4IDhhNjk0
ZTBkMzcuLmQ1OTdhMDlmOTggMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZG9tY3RsLmMKKysrIGIv
eGVuL2NvbW1vbi9kb21jdGwuYwpAQCAtNjE5LDcgKzYxOSw3IEBAIGxvbmcgZG9fZG9tY3RsKFhF
Tl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkKICAgICAgICAgaWYg
KCBvcC0+Y21kID09IFhFTl9ET01DVExfc2V0dmNwdWFmZmluaXR5ICkKICAgICAgICAgewogICAg
ICAgICAgICAgY3B1bWFza192YXJfdCBuZXdfYWZmaW5pdHksIG9sZF9hZmZpbml0eTsKLSAgICAg
ICAgICAgIGNwdW1hc2tfdCAqb25saW5lID0gY3B1cG9vbF9kb21haW5fY3B1bWFzayh2LT5kb21h
aW4pOworICAgICAgICAgICAgY3B1bWFza190ICpvbmxpbmUgPSBjcHVwb29sX2RvbWFpbl9tYXN0
ZXJfY3B1bWFzayh2LT5kb21haW4pOwogCiAgICAgICAgICAgICAvKgogICAgICAgICAgICAgICog
V2Ugd2FudCB0byBiZSBhYmxlIHRvIHJlc3RvcmUgaGFyZCBhZmZpbml0eSBpZiB3ZSBhcmUgdHJ5
aW5nCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMgYi94ZW4vY29tbW9u
L3NjaGVkX2FyaW5jNjUzLmMKaW5kZXggZGQ1ODc2ZWFjZC4uNDVjMDVjNmNkOSAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9zY2hlZF9hcmluYzY1My5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfYXJp
bmM2NTMuYwpAQCAtNjE0LDcgKzYxNCw3IEBAIGE2NTNzY2hlZF9waWNrX3Jlc291cmNlKGNvbnN0
IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywKICAgICAgKiBJZiBwcmVzZW50LCBwcmVmZXIgdW5pdCdz
IGN1cnJlbnQgcHJvY2Vzc29yLCBlbHNlCiAgICAgICoganVzdCBmaW5kIHRoZSBmaXJzdCB2YWxp
ZCB1bml0LgogICAgICAqLwotICAgIG9ubGluZSA9IGNwdXBvb2xfZG9tYWluX2NwdW1hc2sodW5p
dC0+ZG9tYWluKTsKKyAgICBvbmxpbmUgPSBjcHVwb29sX2RvbWFpbl9tYXN0ZXJfY3B1bWFzayh1
bml0LT5kb21haW4pOwogCiAgICAgY3B1ID0gY3B1bWFza19maXJzdChvbmxpbmUpOwogCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVk
aXQuYwppbmRleCAwMGJlYWMzZWE0Li5hNmRmZjhlYzYyIDEwMDY0NAotLS0gYS94ZW4vY29tbW9u
L3NjaGVkX2NyZWRpdC5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKQEAgLTM2MSw3
ICszNjEsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19ydW5xX3RpY2tsZShzdHJ1Y3QgY3NjaGVk
X3VuaXQgKm5ldykKICAgICBBU1NFUlQoY3VyKTsKICAgICBjcHVtYXNrX2NsZWFyKCZtYXNrKTsK
IAotICAgIG9ubGluZSA9IGNwdXBvb2xfZG9tYWluX2NwdW1hc2sobmV3LT5zZG9tLT5kb20pOwor
ICAgIG9ubGluZSA9IGNwdXBvb2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKG5ldy0+c2RvbS0+ZG9t
KTsKICAgICBjcHVtYXNrX2FuZCgmaWRsZV9tYXNrLCBwcnYtPmlkbGVycywgb25saW5lKTsKICAg
ICBpZGxlcnNfZW1wdHkgPSBjcHVtYXNrX2VtcHR5KCZpZGxlX21hc2spOwogCkBAIC03MjQsNyAr
NzI0LDcgQEAgX2NzY2hlZF9jcHVfcGljayhjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIGNv
bnN0IHN0cnVjdCBzY2hlZF91bml0ICp1bml0LAogICAgIC8qIFdlIG11c3QgYWx3YXlzIHVzZSBj
cHUncyBzY3JhdGNoIHNwYWNlICovCiAgICAgY3B1bWFza190ICpjcHVzID0gY3B1bWFza19zY3Jh
dGNoX2NwdShjcHUpOwogICAgIGNwdW1hc2tfdCBpZGxlcnM7Ci0gICAgY3B1bWFza190ICpvbmxp
bmUgPSBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKHVuaXQtPmRvbWFpbik7CisgICAgY3B1bWFza190
ICpvbmxpbmUgPSBjcHVwb29sX2RvbWFpbl9tYXN0ZXJfY3B1bWFzayh1bml0LT5kb21haW4pOwog
ICAgIHN0cnVjdCBjc2NoZWRfcGNwdSAqc3BjID0gTlVMTDsKICAgICBpbnQgYmFsYW5jZV9zdGVw
OwogCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYyBiL3hlbi9jb21tb24v
c2NoZWRfY3JlZGl0Mi5jCmluZGV4IDBlMjllNTZkNWEuLmQ1MWRmMDU4ODcgMTAwNjQ0Ci0tLSBh
L3hlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0
Mi5jCkBAIC03MDUsNyArNzA1LDcgQEAgc3RhdGljIGludCBnZXRfZmFsbGJhY2tfY3B1KHN0cnVj
dCBjc2NoZWQyX3VuaXQgKnN2YykKIAogICAgICAgICBhZmZpbml0eV9iYWxhbmNlX2NwdW1hc2so
dW5pdCwgYnMsIGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KSk7CiAgICAgICAgIGNwdW1hc2tfYW5k
KGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KSwgY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLAotICAg
ICAgICAgICAgICAgICAgICBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKHVuaXQtPmRvbWFpbikpOwor
ICAgICAgICAgICAgICAgICAgICBjcHVwb29sX2RvbWFpbl9tYXN0ZXJfY3B1bWFzayh1bml0LT5k
b21haW4pKTsKIAogICAgICAgICAvKgogICAgICAgICAgKiBUaGlzIGlzIGNhc2VzIDEgb3IgMyAo
ZGVwZW5kaW5nIG9uIGJzKTogaWYgcHJvY2Vzc29yIGlzIChzdGlsbCkKQEAgLTE0NDAsNyArMTQ0
MCw3IEBAIHJ1bnFfdGlja2xlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IGNz
Y2hlZDJfdW5pdCAqbmV3LCBzX3RpbWVfdCBub3cpCiAgICAgc3RydWN0IHNjaGVkX3VuaXQgKnVu
aXQgPSBuZXctPnVuaXQ7CiAgICAgdW5zaWduZWQgaW50IGJzLCBjcHUgPSBzY2hlZF91bml0X21h
c3Rlcih1bml0KTsKICAgICBzdHJ1Y3QgY3NjaGVkMl9ydW5xdWV1ZV9kYXRhICpycWQgPSBjMnJx
ZChvcHMsIGNwdSk7Ci0gICAgY3B1bWFza190ICpvbmxpbmUgPSBjcHVwb29sX2RvbWFpbl9jcHVt
YXNrKHVuaXQtPmRvbWFpbik7CisgICAgY3B1bWFza190ICpvbmxpbmUgPSBjcHVwb29sX2RvbWFp
bl9tYXN0ZXJfY3B1bWFzayh1bml0LT5kb21haW4pOwogICAgIGNwdW1hc2tfdCBtYXNrOwogCiAg
ICAgQVNTRVJUKG5ldy0+cnFkID09IHJxZCk7CkBAIC0yMjQzLDcgKzIyNDMsNyBAQCBjc2NoZWQy
X3Jlc19waWNrKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgY29uc3Qgc3RydWN0IHNjaGVk
X3VuaXQgKnVuaXQpCiAgICAgfQogCiAgICAgY3B1bWFza19hbmQoY3B1bWFza19zY3JhdGNoX2Nw
dShjcHUpLCB1bml0LT5jcHVfaGFyZF9hZmZpbml0eSwKLSAgICAgICAgICAgICAgICBjcHVwb29s
X2RvbWFpbl9jcHVtYXNrKHVuaXQtPmRvbWFpbikpOworICAgICAgICAgICAgICAgIGNwdXBvb2xf
ZG9tYWluX21hc3Rlcl9jcHVtYXNrKHVuaXQtPmRvbWFpbikpOwogCiAgICAgLyoKICAgICAgKiBG
aXJzdCBjaGVjayB0byBzZWUgaWYgd2UncmUgaGVyZSBiZWNhdXNlIHNvbWVvbmUgZWxzZSBzdWdn
ZXN0ZWQgYSBwbGFjZQpAQCAtMjM1OCw4ICsyMzU4LDggQEAgY3NjaGVkMl9yZXNfcGljayhjb25z
dCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIGNvbnN0IHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQog
ICAgICAgICAgKiBvayBiZWNhdXNlOgogICAgICAgICAgKiAtIHdlIGtub3cgdGhhdCB1bml0LT5j
cHVfaGFyZF9hZmZpbml0eSBhbmQgLT5jcHVfc29mdF9hZmZpbml0eSBoYXZlCiAgICAgICAgICAq
ICAgYSBub24tZW1wdHkgaW50ZXJzZWN0aW9uIChiZWNhdXNlIGhhc19zb2Z0IGlzIHRydWUpOwot
ICAgICAgICAgKiAtIHdlIGhhdmUgdW5pdC0+Y3B1X2hhcmRfYWZmaW5pdHkgJiBjcHVwb29sX2Rv
bWFpbl9jcHVtYXNrKCkgYWxyZWFkeQotICAgICAgICAgKiAgIGluIGNwdW1hc2tfc2NyYXRjaCwg
d2UgZG8gc2F2ZSBhIGxvdCBkb2luZyBsaWtlIHRoaXMuCisgICAgICAgICAqIC0gd2UgaGF2ZSB1
bml0LT5jcHVfaGFyZF9hZmZpbml0eSAmIGNwdXBvb2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKCkK
KyAgICAgICAgICogICBhbHJlYWR5IGluIGNwdW1hc2tfc2NyYXRjaCwgd2UgZG8gc2F2ZSBhIGxv
dCBkb2luZyBsaWtlIHRoaXMuCiAgICAgICAgICAqCiAgICAgICAgICAqIEl0J3Mga2luZCBvZiBs
aWtlIG9wZW4gY29kaW5nIGFmZmluaXR5X2JhbGFuY2VfY3B1bWFzaygpIGJ1dCwgaW4KICAgICAg
ICAgICogdGhpcyBzcGVjaWZpYyBjYXNlLCBjYWxsaW5nIHRoYXQgd291bGQgbWVhbiBhIGxvdCBv
ZiAodW5uZWNlc3NhcnkpCkBAIC0yMzc4LDcgKzIzNzgsNyBAQCBjc2NoZWQyX3Jlc19waWNrKGNv
bnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgY29uc3Qgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQp
CiAgICAgICAgICAqIGFmZmluaXR5LCBzbyBnbyBmb3IgaXQuCiAgICAgICAgICAqCiAgICAgICAg
ICAqIGNwdW1hc2tfc2NyYXRjaCBhbHJlYWR5IGhhcyB1bml0LT5jcHVfaGFyZF9hZmZpbml0eSAm
Ci0gICAgICAgICAqIGNwdXBvb2xfZG9tYWluX2NwdW1hc2soKSBpbiBpdCwgc28gaXQncyBlbm91
Z2ggdGhhdCB3ZSBmaWx0ZXIKKyAgICAgICAgICogY3B1cG9vbF9kb21haW5fbWFzdGVyX2NwdW1h
c2soKSBpbiBpdCwgc28gaXQncyBlbm91Z2ggdGhhdCB3ZSBmaWx0ZXIKICAgICAgICAgICogd2l0
aCB0aGUgY3B1cyBvZiB0aGUgcnVucS4KICAgICAgICAgICovCiAgICAgICAgIGNwdW1hc2tfYW5k
KGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KSwgY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLApAQCAt
MjUxMyw3ICsyNTEzLDcgQEAgc3RhdGljIHZvaWQgbWlncmF0ZShjb25zdCBzdHJ1Y3Qgc2NoZWR1
bGVyICpvcHMsCiAgICAgICAgIF9ydW5xX2RlYXNzaWduKHN2Yyk7CiAKICAgICAgICAgY3B1bWFz
a19hbmQoY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLCB1bml0LT5jcHVfaGFyZF9hZmZpbml0eSwK
LSAgICAgICAgICAgICAgICAgICAgY3B1cG9vbF9kb21haW5fY3B1bWFzayh1bml0LT5kb21haW4p
KTsKKyAgICAgICAgICAgICAgICAgICAgY3B1cG9vbF9kb21haW5fbWFzdGVyX2NwdW1hc2sodW5p
dC0+ZG9tYWluKSk7CiAgICAgICAgIGNwdW1hc2tfYW5kKGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1
KSwgY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLAogICAgICAgICAgICAgICAgICAgICAmdHJxZC0+
YWN0aXZlKTsKICAgICAgICAgc2NoZWRfc2V0X3Jlcyh1bml0LApAQCAtMjU0Nyw3ICsyNTQ3LDcg
QEAgc3RhdGljIGJvb2wgdW5pdF9pc19taWdyYXRlYWJsZShzdHJ1Y3QgY3NjaGVkMl91bml0ICpz
dmMsCiAgICAgaW50IGNwdSA9IHNjaGVkX3VuaXRfbWFzdGVyKHVuaXQpOwogCiAgICAgY3B1bWFz
a19hbmQoY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLCB1bml0LT5jcHVfaGFyZF9hZmZpbml0eSwK
LSAgICAgICAgICAgICAgICBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKHVuaXQtPmRvbWFpbikpOwor
ICAgICAgICAgICAgICAgIGNwdXBvb2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKHVuaXQtPmRvbWFp
bikpOwogCiAgICAgcmV0dXJuICEoc3ZjLT5mbGFncyAmIENTRkxBR19ydW5xX21pZ3JhdGVfcmVx
dWVzdCkgJiYKICAgICAgICAgICAgY3B1bWFza19pbnRlcnNlY3RzKGNwdW1hc2tfc2NyYXRjaF9j
cHUoY3B1KSwgJnJxZC0+YWN0aXZlKTsKQEAgLTI3NjMsNyArMjc2Myw3IEBAIGNzY2hlZDJfdW5p
dF9taWdyYXRlKAogICAgICAqIHYtPnByb2Nlc3NvciB3aWxsIGJlIGNob3NlbiwgYW5kIGR1cmlu
ZyBhY3R1YWwgZG9tYWluIHVucGF1c2UgdGhhdAogICAgICAqIHRoZSB1bml0IHdpbGwgYmUgYXNz
aWduZWQgdG8gYW5kIGFkZGVkIHRvIHRoZSBwcm9wZXIgcnVucXVldWUuCiAgICAgICovCi0gICAg
aWYgKCB1bmxpa2VseSghY3B1bWFza190ZXN0X2NwdShuZXdfY3B1LCBjcHVwb29sX2RvbWFpbl9j
cHVtYXNrKGQpKSkgKQorICAgIGlmICggdW5saWtlbHkoIWNwdW1hc2tfdGVzdF9jcHUobmV3X2Nw
dSwgY3B1cG9vbF9kb21haW5fbWFzdGVyX2NwdW1hc2soZCkpKSApCiAgICAgewogICAgICAgICBB
U1NFUlQoc3lzdGVtX3N0YXRlID09IFNZU19TVEFURV9zdXNwZW5kKTsKICAgICAgICAgaWYgKCB1
bml0X29uX3J1bnEoc3ZjKSApCkBAIC0zMDY5LDcgKzMwNjksNyBAQCBjc2NoZWQyX2FsbG9jX2Rv
bWRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3QgZG9tYWluICpkb20pCiAg
ICAgc2RvbS0+bnJfdW5pdHMgPSAwOwogCiAgICAgaW5pdF90aW1lcigmc2RvbS0+cmVwbF90aW1l
ciwgcmVwbGVuaXNoX2RvbWFpbl9idWRnZXQsIHNkb20sCi0gICAgICAgICAgICAgICBjcHVtYXNr
X2FueShjcHVwb29sX2RvbWFpbl9jcHVtYXNrKGRvbSkpKTsKKyAgICAgICAgICAgICAgIGNwdW1h
c2tfYW55KGNwdXBvb2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKGRvbSkpKTsKICAgICBzcGluX2xv
Y2tfaW5pdCgmc2RvbS0+YnVkZ2V0X2xvY2spOwogICAgIElOSVRfTElTVF9IRUFEKCZzZG9tLT5w
YXJrZWRfdW5pdHMpOwogCkBAIC0zMzE3LDcgKzMzMTcsNyBAQCBydW5xX2NhbmRpZGF0ZShzdHJ1
Y3QgY3NjaGVkMl9ydW5xdWV1ZV9kYXRhICpycWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjcHVtYXNrX3NjcmF0Y2gpOwogICAgICAgICBpZiAoIHVubGlrZWx5KCFjcHVtYXNr
X3Rlc3RfY3B1KGNwdSwgY3B1bWFza19zY3JhdGNoKSkgKQogICAgICAgICB7Ci0gICAgICAgICAg
ICBjcHVtYXNrX3QgKm9ubGluZSA9IGNwdXBvb2xfZG9tYWluX2NwdW1hc2soc2N1cnItPnVuaXQt
PmRvbWFpbik7CisgICAgICAgICAgICBjcHVtYXNrX3QgKm9ubGluZSA9IGNwdXBvb2xfZG9tYWlu
X21hc3Rlcl9jcHVtYXNrKHNjdXJyLT51bml0LT5kb21haW4pOwogCiAgICAgICAgICAgICAvKiBP
aywgaXMgYW55IG9mIHRoZSBwY3B1cyBpbiBzY3VyciBzb2Z0LWFmZmluaXR5IGlkbGU/ICovCiAg
ICAgICAgICAgICBjcHVtYXNrX2FuZChjcHVtYXNrX3NjcmF0Y2gsIGNwdW1hc2tfc2NyYXRjaCwg
JnJxZC0+aWRsZSk7CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX251bGwuYyBiL3hlbi9j
b21tb24vc2NoZWRfbnVsbC5jCmluZGV4IDNkZGUxZGNkMDAuLjI1MjU0NjRhN2MgMTAwNjQ0Ci0t
LSBhL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5j
CkBAIC0xMjUsNyArMTI1LDcgQEAgc3RhdGljIGlubGluZSBib29sIHVuaXRfY2hlY2tfYWZmaW5p
dHkoc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsCiB7CiAgICAgYWZmaW5pdHlfYmFsYW5jZV9jcHVt
YXNrKHVuaXQsIGJhbGFuY2Vfc3RlcCwgY3B1bWFza19zY3JhdGNoX2NwdShjcHUpKTsKICAgICBj
cHVtYXNrX2FuZChjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSksIGNwdW1hc2tfc2NyYXRjaF9jcHUo
Y3B1KSwKLSAgICAgICAgICAgICAgICBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKHVuaXQtPmRvbWFp
bikpOworICAgICAgICAgICAgICAgIGNwdXBvb2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKHVuaXQt
PmRvbWFpbikpOwogCiAgICAgcmV0dXJuIGNwdW1hc2tfdGVzdF9jcHUoY3B1LCBjcHVtYXNrX3Nj
cmF0Y2hfY3B1KGNwdSkpOwogfQpAQCAtMjY2LDcgKzI2Niw3IEBAIHBpY2tfcmVzKHN0cnVjdCBu
dWxsX3ByaXZhdGUgKnBydiwgY29uc3Qgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiB7CiAgICAg
dW5zaWduZWQgaW50IGJzOwogICAgIHVuc2lnbmVkIGludCBjcHUgPSBzY2hlZF91bml0X21hc3Rl
cih1bml0KSwgbmV3X2NwdTsKLSAgICBjcHVtYXNrX3QgKmNwdXMgPSBjcHVwb29sX2RvbWFpbl9j
cHVtYXNrKHVuaXQtPmRvbWFpbik7CisgICAgY3B1bWFza190ICpjcHVzID0gY3B1cG9vbF9kb21h
aW5fbWFzdGVyX2NwdW1hc2sodW5pdC0+ZG9tYWluKTsKIAogICAgIEFTU0VSVChzcGluX2lzX2xv
Y2tlZChnZXRfc2NoZWRfcmVzKGNwdSktPnNjaGVkdWxlX2xvY2spKTsKIApAQCAtNDY3LDcgKzQ2
Nyw3IEBAIHN0YXRpYyB2b2lkIG51bGxfdW5pdF9pbnNlcnQoY29uc3Qgc3RydWN0IHNjaGVkdWxl
ciAqb3BzLAogICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2sodW5pdCk7CiAKICAgICBjcHVt
YXNrX2FuZChjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSksIHVuaXQtPmNwdV9oYXJkX2FmZmluaXR5
LAotICAgICAgICAgICAgICAgIGNwdXBvb2xfZG9tYWluX2NwdW1hc2sodW5pdC0+ZG9tYWluKSk7
CisgICAgICAgICAgICAgICAgY3B1cG9vbF9kb21haW5fbWFzdGVyX2NwdW1hc2sodW5pdC0+ZG9t
YWluKSk7CiAKICAgICAvKiBJZiB0aGUgcENQVSBpcyBmcmVlLCB3ZSBhc3NpZ24gdW5pdCB0byBp
dCAqLwogICAgIGlmICggbGlrZWx5KHBlcl9jcHUobnBjLCBjcHUpLnVuaXQgPT0gTlVMTCkgKQpA
QCAtNTc5LDcgKzU3OSw3IEBAIHN0YXRpYyB2b2lkIG51bGxfdW5pdF93YWtlKGNvbnN0IHN0cnVj
dCBzY2hlZHVsZXIgKm9wcywKICAgICAgICAgc3Bpbl91bmxvY2soJnBydi0+d2FpdHFfbG9jayk7
CiAKICAgICAgICAgY3B1bWFza19hbmQoY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLCB1bml0LT5j
cHVfaGFyZF9hZmZpbml0eSwKLSAgICAgICAgICAgICAgICAgICAgY3B1cG9vbF9kb21haW5fY3B1
bWFzayh1bml0LT5kb21haW4pKTsKKyAgICAgICAgICAgICAgICAgICAgY3B1cG9vbF9kb21haW5f
bWFzdGVyX2NwdW1hc2sodW5pdC0+ZG9tYWluKSk7CiAKICAgICAgICAgaWYgKCAhY3B1bWFza19p
bnRlcnNlY3RzKCZwcnYtPmNwdXNfZnJlZSwgY3B1bWFza19zY3JhdGNoX2NwdShjcHUpKSApCiAg
ICAgICAgIHsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfcnQuYyBiL3hlbi9jb21tb24v
c2NoZWRfcnQuYwppbmRleCBmZDg4MmYyY2E0Li5kMjFjNDE2Y2FlIDEwMDY0NAotLS0gYS94ZW4v
Y29tbW9uL3NjaGVkX3J0LmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9ydC5jCkBAIC0zMjYsNyAr
MzI2LDcgQEAgcnRfZHVtcF91bml0KGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgY29uc3Qg
c3RydWN0IHJ0X3VuaXQgKnN2YykKICAgICAgKi8KICAgICBtYXNrID0gY3B1bWFza19zY3JhdGNo
X2NwdShzY2hlZF91bml0X21hc3RlcihzdmMtPnVuaXQpKTsKIAotICAgIGNwdXBvb2xfbWFzayA9
IGNwdXBvb2xfZG9tYWluX2NwdW1hc2soc3ZjLT51bml0LT5kb21haW4pOworICAgIGNwdXBvb2xf
bWFzayA9IGNwdXBvb2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKHN2Yy0+dW5pdC0+ZG9tYWluKTsK
ICAgICBjcHVtYXNrX2FuZChtYXNrLCBjcHVwb29sX21hc2ssIHN2Yy0+dW5pdC0+Y3B1X2hhcmRf
YWZmaW5pdHkpOwogICAgIHByaW50aygiWyU1ZC4lLTJ1XSBjcHUgJXUsICglIlBSSV9zdGltZSIs
ICUiUFJJX3N0aW1lIiksIgogICAgICAgICAgICAiIGN1cl9iPSUiUFJJX3N0aW1lIiBjdXJfZD0l
IlBSSV9zdGltZSIgbGFzdF9zdGFydD0lIlBSSV9zdGltZSJcbiIKQEAgLTY0Miw3ICs2NDIsNyBA
QCBydF9yZXNfcGljayhjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIGNvbnN0IHN0cnVjdCBz
Y2hlZF91bml0ICp1bml0KQogICAgIGNwdW1hc2tfdCAqb25saW5lOwogICAgIGludCBjcHU7CiAK
LSAgICBvbmxpbmUgPSBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKHVuaXQtPmRvbWFpbik7CisgICAg
b25saW5lID0gY3B1cG9vbF9kb21haW5fbWFzdGVyX2NwdW1hc2sodW5pdC0+ZG9tYWluKTsKICAg
ICBjcHVtYXNrX2FuZCgmY3B1cywgb25saW5lLCB1bml0LT5jcHVfaGFyZF9hZmZpbml0eSk7CiAK
ICAgICBjcHUgPSBjcHVtYXNrX3Rlc3RfY3B1KHNjaGVkX3VuaXRfbWFzdGVyKHVuaXQpLCAmY3B1
cykKQEAgLTEwMTYsNyArMTAxNiw3IEBAIHJ1bnFfcGljayhjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVy
ICpvcHMsIGNvbnN0IGNwdW1hc2tfdCAqbWFzaykKICAgICAgICAgaXRlcl9zdmMgPSBxX2VsZW0o
aXRlcik7CiAKICAgICAgICAgLyogbWFzayBjcHVfaGFyZF9hZmZpbml0eSAmIGNwdXBvb2wgJiBt
YXNrICovCi0gICAgICAgIG9ubGluZSA9IGNwdXBvb2xfZG9tYWluX2NwdW1hc2soaXRlcl9zdmMt
PnVuaXQtPmRvbWFpbik7CisgICAgICAgIG9ubGluZSA9IGNwdXBvb2xfZG9tYWluX21hc3Rlcl9j
cHVtYXNrKGl0ZXJfc3ZjLT51bml0LT5kb21haW4pOwogICAgICAgICBjcHVtYXNrX2FuZCgmY3B1
X2NvbW1vbiwgb25saW5lLCBpdGVyX3N2Yy0+dW5pdC0+Y3B1X2hhcmRfYWZmaW5pdHkpOwogICAg
ICAgICBjcHVtYXNrX2FuZCgmY3B1X2NvbW1vbiwgbWFzaywgJmNwdV9jb21tb24pOwogICAgICAg
ICBpZiAoIGNwdW1hc2tfZW1wdHkoJmNwdV9jb21tb24pICkKQEAgLTExOTEsNyArMTE5MSw3IEBA
IHJ1bnFfdGlja2xlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHJ0X3VuaXQg
Km5ldykKICAgICBpZiAoIG5ldyA9PSBOVUxMIHx8IGlzX2lkbGVfdW5pdChuZXctPnVuaXQpICkK
ICAgICAgICAgcmV0dXJuOwogCi0gICAgb25saW5lID0gY3B1cG9vbF9kb21haW5fY3B1bWFzayhu
ZXctPnVuaXQtPmRvbWFpbik7CisgICAgb25saW5lID0gY3B1cG9vbF9kb21haW5fbWFzdGVyX2Nw
dW1hc2sobmV3LT51bml0LT5kb21haW4pOwogICAgIGNwdW1hc2tfYW5kKCZub3RfdGlja2xlZCwg
b25saW5lLCBuZXctPnVuaXQtPmNwdV9oYXJkX2FmZmluaXR5KTsKICAgICBjcHVtYXNrX2FuZG5v
dCgmbm90X3RpY2tsZWQsICZub3RfdGlja2xlZCwgJnBydi0+dGlja2xlZCk7CiAKZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwppbmRleCAz
MDk0ZmY2ODM4Li4zNmIxZDNkZjZlIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMK
KysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC02Myw2ICs2Myw3IEBAIGludGVnZXJfcGFy
YW0oInNjaGVkX3JhdGVsaW1pdF91cyIsIHNjaGVkX3JhdGVsaW1pdF91cyk7CiAKIC8qIE51bWJl
ciBvZiB2Y3B1cyBwZXIgc3RydWN0IHNjaGVkX3VuaXQuICovCiBzdGF0aWMgdW5zaWduZWQgaW50
IF9fcmVhZF9tb3N0bHkgc2NoZWRfZ3JhbnVsYXJpdHkgPSAxOworY29uc3QgY3B1bWFza190ICpz
Y2hlZF9yZXNfbWFzayA9ICZjcHVtYXNrX2FsbDsKIAogLyogQ29tbW9uIGxvY2sgZm9yIGZyZWUg
Y3B1cy4gKi8KIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0soc2NoZWRfZnJlZV9jcHVfbG9jayk7CkBA
IC0xODgsNyArMTg5LDcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3Qgc2NoZWR1bGVyICp2Y3B1X3Nj
aGVkdWxlcihjb25zdCBzdHJ1Y3QgdmNwdSAqdikKIHsKICAgICByZXR1cm4gdW5pdF9zY2hlZHVs
ZXIodi0+c2NoZWRfdW5pdCk7CiB9Ci0jZGVmaW5lIFZDUFUyT05MSU5FKF92KSBjcHVwb29sX2Rv
bWFpbl9jcHVtYXNrKChfdiktPmRvbWFpbikKKyNkZWZpbmUgVkNQVTJPTkxJTkUoX3YpIGNwdXBv
b2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKChfdiktPmRvbWFpbikKIAogc3RhdGljIGlubGluZSB2
b2lkIHRyYWNlX3J1bnN0YXRlX2NoYW5nZShzdHJ1Y3QgdmNwdSAqdiwgaW50IG5ld19zdGF0ZSkK
IHsKQEAgLTQyNSw5ICs0MjYsOSBAQCBzdGF0aWMgdW5zaWduZWQgaW50IHNjaGVkX3NlbGVjdF9p
bml0aWFsX2NwdShjb25zdCBzdHJ1Y3QgdmNwdSAqdikKICAgICBjcHVtYXNrX2NsZWFyKGNwdXMp
OwogICAgIGZvcl9lYWNoX25vZGVfbWFzayAoIG5vZGUsIGQtPm5vZGVfYWZmaW5pdHkgKQogICAg
ICAgICBjcHVtYXNrX29yKGNwdXMsIGNwdXMsICZub2RlX3RvX2NwdW1hc2sobm9kZSkpOwotICAg
IGNwdW1hc2tfYW5kKGNwdXMsIGNwdXMsIGNwdXBvb2xfZG9tYWluX2NwdW1hc2soZCkpOworICAg
IGNwdW1hc2tfYW5kKGNwdXMsIGNwdXMsIGQtPmNwdXBvb2wtPmNwdV92YWxpZCk7CiAgICAgaWYg
KCBjcHVtYXNrX2VtcHR5KGNwdXMpICkKLSAgICAgICAgY3B1bWFza19jb3B5KGNwdXMsIGNwdXBv
b2xfZG9tYWluX2NwdW1hc2soZCkpOworICAgICAgICBjcHVtYXNrX2NvcHkoY3B1cywgZC0+Y3B1
cG9vbC0+Y3B1X3ZhbGlkKTsKIAogICAgIGlmICggdi0+dmNwdV9pZCA9PSAwICkKICAgICAgICAg
Y3B1X3JldCA9IGNwdW1hc2tfZmlyc3QoY3B1cyk7CkBAIC05NzMsNyArOTc0LDcgQEAgdm9pZCBy
ZXN0b3JlX3ZjcHVfYWZmaW5pdHkoc3RydWN0IGRvbWFpbiAqZCkKICAgICAgICAgbG9jayA9IHVu
aXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAKICAgICAgICAgY3B1bWFza19hbmQoY3B1bWFz
a19zY3JhdGNoX2NwdShjcHUpLCB1bml0LT5jcHVfaGFyZF9hZmZpbml0eSwKLSAgICAgICAgICAg
ICAgICAgICAgY3B1cG9vbF9kb21haW5fY3B1bWFzayhkKSk7CisgICAgICAgICAgICAgICAgICAg
IGNwdXBvb2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKGQpKTsKICAgICAgICAgaWYgKCBjcHVtYXNr
X2VtcHR5KGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KSkgKQogICAgICAgICB7CiAgICAgICAgICAg
ICBpZiAoIHNjaGVkX2NoZWNrX2FmZmluaXR5X2Jyb2tlbih1bml0KSApCkBAIC05ODEsNyArOTgy
LDcgQEAgdm9pZCByZXN0b3JlX3ZjcHVfYWZmaW5pdHkoc3RydWN0IGRvbWFpbiAqZCkKICAgICAg
ICAgICAgICAgICBzY2hlZF9zZXRfYWZmaW5pdHkodW5pdCwgdW5pdC0+Y3B1X2hhcmRfYWZmaW5p
dHlfc2F2ZWQsIE5VTEwpOwogICAgICAgICAgICAgICAgIHNjaGVkX3Jlc2V0X2FmZmluaXR5X2Jy
b2tlbih1bml0KTsKICAgICAgICAgICAgICAgICBjcHVtYXNrX2FuZChjcHVtYXNrX3NjcmF0Y2hf
Y3B1KGNwdSksIHVuaXQtPmNwdV9oYXJkX2FmZmluaXR5LAotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNwdXBvb2xfZG9tYWluX2NwdW1hc2soZCkpOworICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNwdXBvb2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKGQpKTsKICAgICAgICAgICAgIH0K
IAogICAgICAgICAgICAgaWYgKCBjcHVtYXNrX2VtcHR5KGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1
KSkgKQpAQCAtOTkxLDcgKzk5Miw3IEBAIHZvaWQgcmVzdG9yZV92Y3B1X2FmZmluaXR5KHN0cnVj
dCBkb21haW4gKmQpCiAgICAgICAgICAgICAgICAgICAgICAgIHVuaXQtPnZjcHVfbGlzdCk7CiAg
ICAgICAgICAgICAgICAgc2NoZWRfc2V0X2FmZmluaXR5KHVuaXQsICZjcHVtYXNrX2FsbCwgTlVM
TCk7CiAgICAgICAgICAgICAgICAgY3B1bWFza19hbmQoY3B1bWFza19zY3JhdGNoX2NwdShjcHUp
LCB1bml0LT5jcHVfaGFyZF9hZmZpbml0eSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
cHVwb29sX2RvbWFpbl9jcHVtYXNrKGQpKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
cHVwb29sX2RvbWFpbl9tYXN0ZXJfY3B1bWFzayhkKSk7CiAgICAgICAgICAgICB9CiAgICAgICAg
IH0KIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmggYi94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQtaWYuaAppbmRleCA5ODNmMmVjZTgzLi4xYjI5NmIxNTBmIDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQt
aWYuaApAQCAtMjIsNiArMjIsOCBAQCBleHRlcm4gY3B1bWFza190IGNwdXBvb2xfZnJlZV9jcHVz
OwogI2RlZmluZSBTQ0hFRF9ERUZBVUxUX1JBVEVMSU1JVF9VUyAxMDAwCiBleHRlcm4gaW50IHNj
aGVkX3JhdGVsaW1pdF91czsKIAorLyogU2NoZWR1bGluZyByZXNvdXJjZSBtYXNrLiAqLworZXh0
ZXJuIGNvbnN0IGNwdW1hc2tfdCAqc2NoZWRfcmVzX21hc2s7CiAKIC8qCiAgKiBJbiBvcmRlciB0
byBhbGxvdyBhIHNjaGVkdWxlciB0byByZW1hcCB0aGUgbG9jay0+Y3B1IG1hcHBpbmcsCkBAIC01
MzUsNiArNTM3LDcgQEAgc3RydWN0IGNwdXBvb2wKICAgICBpbnQgICAgICAgICAgICAgIGNwdXBv
b2xfaWQ7CiAgICAgdW5zaWduZWQgaW50ICAgICBuX2RvbTsKICAgICBjcHVtYXNrX3Zhcl90ICAg
IGNwdV92YWxpZDsgICAgICAvKiBhbGwgY3B1cyBhc3NpZ25lZCB0byBwb29sICovCisgICAgY3B1
bWFza192YXJfdCAgICByZXNfdmFsaWQ7ICAgICAgLyogYWxsIHNjaGVkdWxpbmcgcmVzb3VyY2Vz
IG9mIHBvb2wgKi8KICAgICBzdHJ1Y3QgY3B1cG9vbCAgICpuZXh0OwogICAgIHN0cnVjdCBzY2hl
ZHVsZXIgKnNjaGVkOwogICAgIGF0b21pY190ICAgICAgICAgcmVmY250OwpAQCAtNTQzLDE0ICs1
NDYsMTQgQEAgc3RydWN0IGNwdXBvb2wKICNkZWZpbmUgY3B1cG9vbF9vbmxpbmVfY3B1bWFzayhf
cG9vbCkgXAogICAgICgoKF9wb29sKSA9PSBOVUxMKSA/ICZjcHVfb25saW5lX21hcCA6IChfcG9v
bCktPmNwdV92YWxpZCkKIAotc3RhdGljIGlubGluZSBjcHVtYXNrX3QgKmNwdXBvb2xfZG9tYWlu
X2NwdW1hc2soY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKK3N0YXRpYyBpbmxpbmUgY3B1bWFza190
ICpjcHVwb29sX2RvbWFpbl9tYXN0ZXJfY3B1bWFzayhjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQog
ewogICAgIC8qCiAgICAgICogZC0+Y3B1cG9vbCBpcyBOVUxMIG9ubHkgZm9yIHRoZSBpZGxlIGRv
bWFpbiwgYW5kIG5vIG9uZSBzaG91bGQKICAgICAgKiBiZSBpbnRlcmVzdGVkIGluIGNhbGxpbmcg
dGhpcyBmb3IgdGhlIGlkbGUgZG9tYWluLgogICAgICAqLwogICAgIEFTU0VSVChkLT5jcHVwb29s
ICE9IE5VTEwpOwotICAgIHJldHVybiBkLT5jcHVwb29sLT5jcHVfdmFsaWQ7CisgICAgcmV0dXJu
IGQtPmNwdXBvb2wtPnJlc192YWxpZDsKIH0KIAogLyoKQEAgLTU5MCw3ICs1OTMsNyBAQCBzdGF0
aWMgaW5saW5lIGNwdW1hc2tfdCAqY3B1cG9vbF9kb21haW5fY3B1bWFzayhjb25zdCBzdHJ1Y3Qg
ZG9tYWluICpkKQogc3RhdGljIGlubGluZSBpbnQgaGFzX3NvZnRfYWZmaW5pdHkoY29uc3Qgc3Ry
dWN0IHNjaGVkX3VuaXQgKnVuaXQpCiB7CiAgICAgcmV0dXJuIHVuaXQtPnNvZnRfYWZmX2VmZmVj
dGl2ZSAmJgotICAgICAgICAgICAhY3B1bWFza19zdWJzZXQoY3B1cG9vbF9kb21haW5fY3B1bWFz
ayh1bml0LT5kb21haW4pLAorICAgICAgICAgICAhY3B1bWFza19zdWJzZXQoY3B1cG9vbF9kb21h
aW5fbWFzdGVyX2NwdW1hc2sodW5pdC0+ZG9tYWluKSwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuaXQtPmNwdV9zb2Z0X2FmZmluaXR5KTsKIH0KIAotLSAKMi4xNi40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
