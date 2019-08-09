Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046AF87D79
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:02:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6Lz-0006Vd-I4; Fri, 09 Aug 2019 14:58:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hw6Lv-0006Rb-R9
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:58:47 +0000
X-Inumbo-ID: 2d706672-bab6-11e9-9561-732d7685f0f6
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d706672-bab6-11e9-9561-732d7685f0f6;
 Fri, 09 Aug 2019 14:58:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 08F21B04C;
 Fri,  9 Aug 2019 14:58:40 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 16:57:52 +0200
Message-Id: <20190809145833.1020-8-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809145833.1020-1-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 07/48] xen/sched: move per cpu scheduler
 private data into struct sched_resource
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwcmVwYXJlcyBzdXBwb3J0IG9mIGxhcmdlciBzY2hlZHVsaW5nIGdyYW51bGFyaXRpZXMs
IGUuZy4gY29yZQpzY2hlZHVsaW5nLgoKV2hpbGUgYXQgaXQgbW92ZSBzY2hlZF9oYXNfdXJnZW50
X3ZjcHUoKSBmcm9tIGluY2x1ZGUvYXNtLXg4Ni9jcHVpZGxlLmgKaW50byBzY2hlZHVsZS5jIHJl
bW92aW5nIHRoZSBuZWVkIGZvciBpbmNsdWRpbmcgc2NoZWQtaWYuaCBpbgpjcHVpZGxlLmggYW5k
IG11bHRpcGxlIG90aGVyIEMgc291cmNlcy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KUmV2aWV3ZWQtYnk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Ci0tLQpW
MToKLSBtb3ZlIHNjaGVkX2hhc191cmdlbnRfdmNwdSgpClYyOgotIG1ha2Ugc2NoZWRfaGFzX3Vy
Z2VudF92Y3B1KCkgcmV0dXJuIGJvb2wgKEphbiBCZXVsaWNoKQotLS0KIHhlbi9hcmNoL3g4Ni9h
Y3BpL2NwdV9pZGxlLmMgICAgICB8ICAxIC0KIHhlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5j
ICAgICB8ICAxIC0KIHhlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jdGVsZW0uYyB8ICAxIC0KIHhl
bi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAgICB8ICAxIC0KIHhlbi9hcmNoL3g4Ni9zbXBi
b290LmMgICAgICAgICAgICB8ICAxIC0KIHhlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYyAgICAg
ICB8ICA0ICstLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYyAgICAgICAgIHwgMTAgKysrLS0t
LQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgICAgICAgIHwgMjEgKysrKysrKy0tLS0tLS0K
IHhlbi9jb21tb24vc2NoZWRfbnVsbC5jICAgICAgICAgICB8ICA0ICstLQogeGVuL2NvbW1vbi9z
Y2hlZF9ydC5jICAgICAgICAgICAgIHwgIDkgKysrLS0tCiB4ZW4vY29tbW9uL3NjaGVkdWxlLmMg
ICAgICAgICAgICAgfCA2MCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0K
IHhlbi9pbmNsdWRlL2FzbS14ODYvY3B1aWRsZS5oICAgICB8IDExIC0tLS0tLS0KIHhlbi9pbmNs
dWRlL3hlbi9zY2hlZC1pZi5oICAgICAgICB8IDIwICsrKysrKy0tLS0tLS0KIHhlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oICAgICAgICAgICB8ICAxICsKIDE0IGZpbGVzIGNoYW5nZWQsIDY4IGluc2Vy
dGlvbnMoKyksIDc3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3Bp
L2NwdV9pZGxlLmMgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5jCmluZGV4IDhmN2I2ZTli
OGMuLjgzNmY1MjRlZjQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMK
KysrIGIveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYwpAQCAtMzgsNyArMzgsNiBAQAogI2lu
Y2x1ZGUgPHhlbi9ndWVzdF9hY2Nlc3MuaD4KICNpbmNsdWRlIDx4ZW4va2V5aGFuZGxlci5oPgog
I2luY2x1ZGUgPHhlbi90cmFjZS5oPgotI2luY2x1ZGUgPHhlbi9zY2hlZC1pZi5oPgogI2luY2x1
ZGUgPHhlbi9pcnEuaD4KICNpbmNsdWRlIDxhc20vY2FjaGUuaD4KICNpbmNsdWRlIDxhc20vaW8u
aD4KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jIGIveGVuL2FyY2gv
eDg2L2NwdS9tY2hlY2svbWNlLmMKaW5kZXggMjhhZDdkZDY1OS4uNGIyYjZkZTE5MSAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMKKysrIGIveGVuL2FyY2gveDg2L2Nw
dS9tY2hlY2svbWNlLmMKQEAgLTEwLDcgKzEwLDYgQEAKICNpbmNsdWRlIDx4ZW4vZXJybm8uaD4K
ICNpbmNsdWRlIDx4ZW4vY29uc29sZS5oPgogI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgotI2luY2x1
ZGUgPHhlbi9zY2hlZC1pZi5oPgogI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+CiAjaW5jbHVkZSA8
eGVuL2V2ZW50Lmg+CiAjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWN0ZWxlbS5jIGIveGVuL2FyY2gveDg2L2NwdS9tY2hl
Y2svbWN0ZWxlbS5jCmluZGV4IDNiYjEzZTUyNjUuLjAxMmE5Yjk1ZTUgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jdGVsZW0uYworKysgYi94ZW4vYXJjaC94ODYvY3B1L21j
aGVjay9tY3RlbGVtLmMKQEAgLTE4LDcgKzE4LDYgQEAKICNpbmNsdWRlIDx4ZW4vc21wLmg+CiAj
aW5jbHVkZSA8eGVuL2Vycm5vLmg+CiAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+Ci0jaW5jbHVkZSA8
eGVuL3NjaGVkLWlmLmg+CiAjaW5jbHVkZSA8eGVuL2NwdW1hc2suaD4KICNpbmNsdWRlIDx4ZW4v
ZXZlbnQuaD4KIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94
ODYvc2V0dXAuYwppbmRleCBkMjAxMTkxMGZhLi4yOGMzNWJiYWM5IDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpAQCAtMyw3ICszLDYg
QEAKICNpbmNsdWRlIDx4ZW4vZXJyLmg+CiAjaW5jbHVkZSA8eGVuL2dyYW50X3RhYmxlLmg+CiAj
aW5jbHVkZSA8eGVuL3NjaGVkLmg+Ci0jaW5jbHVkZSA8eGVuL3NjaGVkLWlmLmg+CiAjaW5jbHVk
ZSA8eGVuL2RvbWFpbi5oPgogI2luY2x1ZGUgPHhlbi9zZXJpYWwuaD4KICNpbmNsdWRlIDx4ZW4v
c29mdGlycS5oPgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBiL3hlbi9hcmNo
L3g4Ni9zbXBib290LmMKaW5kZXggOGQ1ZmVmMDAxMi4uMjdiNzhhMGI2MSAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBAIC0y
NSw3ICsyNSw2IEBACiAjaW5jbHVkZSA8eGVuL2RvbWFpbi5oPgogI2luY2x1ZGUgPHhlbi9kb21h
aW5fcGFnZS5oPgogI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgotI2luY2x1ZGUgPHhlbi9zY2hlZC1p
Zi5oPgogI2luY2x1ZGUgPHhlbi9pcnEuaD4KICNpbmNsdWRlIDx4ZW4vZGVsYXkuaD4KICNpbmNs
dWRlIDx4ZW4vc29mdGlycS5oPgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9hcmluYzY1
My5jIGIveGVuL2NvbW1vbi9zY2hlZF9hcmluYzY1My5jCmluZGV4IDM0YjFmMjM1YTIuLjI1ZmJj
NDJmNzQgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYworKysgYi94ZW4v
Y29tbW9uL3NjaGVkX2FyaW5jNjUzLmMKQEAgLTQ3NSw3ICs0NzUsNyBAQCBhNjUzc2NoZWRfdW5p
dF9zbGVlcChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1
bml0KQogICAgICAqIElmIHRoZSBWQ1BVIGJlaW5nIHB1dCB0byBzbGVlcCBpcyB0aGUgc2FtZSBv
bmUgdGhhdCBpcyBjdXJyZW50bHkKICAgICAgKiBydW5uaW5nLCByYWlzZSBhIHNvZnRpcnEgdG8g
aW52b2tlIHRoZSBzY2hlZHVsZXIgdG8gc3dpdGNoIGRvbWFpbnMuCiAgICAgICovCi0gICAgaWYg
KCBwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIHZjLT5wcm9jZXNzb3IpLmN1cnIgPT0gdW5pdCApCisg
ICAgaWYgKCBnZXRfc2NoZWRfcmVzKHZjLT5wcm9jZXNzb3IpLT5jdXJyID09IHVuaXQgKQogICAg
ICAgICBjcHVfcmFpc2Vfc29mdGlycSh2Yy0+cHJvY2Vzc29yLCBTQ0hFRFVMRV9TT0ZUSVJRKTsK
IH0KIApAQCAtNjQyLDcgKzY0Miw3IEBAIHN0YXRpYyBzcGlubG9ja190ICoKIGE2NTNfc3dpdGNo
X3NjaGVkKHN0cnVjdCBzY2hlZHVsZXIgKm5ld19vcHMsIHVuc2lnbmVkIGludCBjcHUsCiAgICAg
ICAgICAgICAgICAgICB2b2lkICpwZGF0YSwgdm9pZCAqdmRhdGEpCiB7Ci0gICAgc3RydWN0IHNj
aGVkdWxlX2RhdGEgKnNkID0gJnBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KTsKKyAgICBzdHJ1
Y3Qgc2NoZWRfcmVzb3VyY2UgKnNkID0gZ2V0X3NjaGVkX3JlcyhjcHUpOwogICAgIGFyaW5jNjUz
X3ZjcHVfdCAqc3ZjID0gdmRhdGE7CiAKICAgICBBU1NFUlQoIXBkYXRhICYmIHN2YyAmJiBpc19p
ZGxlX3ZjcHUoc3ZjLT52YykpOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQu
YyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKaW5kZXggN2MzZGJhZTg5Mi4uMjYxZDIwODNj
NyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYworKysgYi94ZW4vY29tbW9u
L3NjaGVkX2NyZWRpdC5jCkBAIC04Miw3ICs4Miw3IEBACiAjZGVmaW5lIENTQ0hFRF9QUklWKF9v
cHMpICAgXAogICAgICgoc3RydWN0IGNzY2hlZF9wcml2YXRlICopKChfb3BzKS0+c2NoZWRfZGF0
YSkpCiAjZGVmaW5lIENTQ0hFRF9QQ1BVKF9jKSAgICAgXAotICAgICgoc3RydWN0IGNzY2hlZF9w
Y3B1ICopcGVyX2NwdShzY2hlZHVsZV9kYXRhLCBfYykuc2NoZWRfcHJpdikKKyAgICAoKHN0cnVj
dCBjc2NoZWRfcGNwdSAqKWdldF9zY2hlZF9yZXMoX2MpLT5zY2hlZF9wcml2KQogI2RlZmluZSBD
U0NIRURfVU5JVCh1bml0KSAgICgoc3RydWN0IGNzY2hlZF91bml0ICopICh1bml0KS0+cHJpdikK
ICNkZWZpbmUgQ1NDSEVEX0RPTShfZG9tKSAgICAoKHN0cnVjdCBjc2NoZWRfZG9tICopIChfZG9t
KS0+c2NoZWRfcHJpdikKICNkZWZpbmUgUlVOUShfY3B1KSAgICAgICAgICAoJihDU0NIRURfUENQ
VShfY3B1KS0+cnVucSkpCkBAIC0yNTAsNyArMjUwLDcgQEAgc3RhdGljIGlubGluZSBib29sX3Qg
aXNfcnVucV9pZGxlKHVuc2lnbmVkIGludCBjcHUpCiAgICAgLyoKICAgICAgKiBXZSdyZSBwZWVr
aW5nIGF0IGNwdSdzIHJ1bnEsIHdlIG11c3QgaG9sZCB0aGUgcHJvcGVyIGxvY2suCiAgICAgICov
Ci0gICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKHBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KS5z
Y2hlZHVsZV9sb2NrKSk7CisgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKGdldF9zY2hlZF9yZXMo
Y3B1KS0+c2NoZWR1bGVfbG9jaykpOwogCiAgICAgcmV0dXJuIGxpc3RfZW1wdHkoUlVOUShjcHUp
KSB8fAogICAgICAgICAgICBpc19pZGxlX3ZjcHUoX19ydW5xX2VsZW0oUlVOUShjcHUpLT5uZXh0
KS0+dmNwdSk7CkBAIC0yNTksNyArMjU5LDcgQEAgc3RhdGljIGlubGluZSBib29sX3QgaXNfcnVu
cV9pZGxlKHVuc2lnbmVkIGludCBjcHUpCiBzdGF0aWMgaW5saW5lIHZvaWQKIGluY19ucl9ydW5u
YWJsZSh1bnNpZ25lZCBpbnQgY3B1KQogewotICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZChwZXJf
Y3B1KHNjaGVkdWxlX2RhdGEsIGNwdSkuc2NoZWR1bGVfbG9jaykpOworICAgIEFTU0VSVChzcGlu
X2lzX2xvY2tlZChnZXRfc2NoZWRfcmVzKGNwdSktPnNjaGVkdWxlX2xvY2spKTsKICAgICBDU0NI
RURfUENQVShjcHUpLT5ucl9ydW5uYWJsZSsrOwogCiB9CkBAIC0yNjcsNyArMjY3LDcgQEAgaW5j
X25yX3J1bm5hYmxlKHVuc2lnbmVkIGludCBjcHUpCiBzdGF0aWMgaW5saW5lIHZvaWQKIGRlY19u
cl9ydW5uYWJsZSh1bnNpZ25lZCBpbnQgY3B1KQogewotICAgIEFTU0VSVChzcGluX2lzX2xvY2tl
ZChwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSkuc2NoZWR1bGVfbG9jaykpOworICAgIEFTU0VS
VChzcGluX2lzX2xvY2tlZChnZXRfc2NoZWRfcmVzKGNwdSktPnNjaGVkdWxlX2xvY2spKTsKICAg
ICBBU1NFUlQoQ1NDSEVEX1BDUFUoY3B1KS0+bnJfcnVubmFibGUgPj0gMSk7CiAgICAgQ1NDSEVE
X1BDUFUoY3B1KS0+bnJfcnVubmFibGUtLTsKIH0KQEAgLTYyOCw3ICs2MjgsNyBAQCBzdGF0aWMg
c3BpbmxvY2tfdCAqCiBjc2NoZWRfc3dpdGNoX3NjaGVkKHN0cnVjdCBzY2hlZHVsZXIgKm5ld19v
cHMsIHVuc2lnbmVkIGludCBjcHUsCiAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnBkYXRhLCB2
b2lkICp2ZGF0YSkKIHsKLSAgICBzdHJ1Y3Qgc2NoZWR1bGVfZGF0YSAqc2QgPSAmcGVyX2NwdShz
Y2hlZHVsZV9kYXRhLCBjcHUpOworICAgIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc2QgPSBnZXRf
c2NoZWRfcmVzKGNwdSk7CiAgICAgc3RydWN0IGNzY2hlZF9wcml2YXRlICpwcnYgPSBDU0NIRURf
UFJJVihuZXdfb3BzKTsKICAgICBzdHJ1Y3QgY3NjaGVkX3VuaXQgKnN2YyA9IHZkYXRhOwogCmRp
ZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYyBiL3hlbi9jb21tb24vc2NoZWRf
Y3JlZGl0Mi5jCmluZGV4IGY4NTYyOTMzNzEuLjAyZTI4NTVkOGQgMTAwNjQ0Ci0tLSBhL3hlbi9j
b21tb24vc2NoZWRfY3JlZGl0Mi5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jCkBA
IC01NjgsNyArNTY4LDcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgY3NjaGVkMl9wcml2YXRlICpj
c2NoZWQyX3ByaXYoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzKQogCiBzdGF0aWMgaW5saW5l
IHN0cnVjdCBjc2NoZWQyX3BjcHUgKmNzY2hlZDJfcGNwdSh1bnNpZ25lZCBpbnQgY3B1KQogewot
ICAgIHJldHVybiBwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSkuc2NoZWRfcHJpdjsKKyAgICBy
ZXR1cm4gZ2V0X3NjaGVkX3JlcyhjcHUpLT5zY2hlZF9wcml2OwogfQogCiBzdGF0aWMgaW5saW5l
IHN0cnVjdCBjc2NoZWQyX3VuaXQgKmNzY2hlZDJfdW5pdChjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5p
dCAqdW5pdCkKQEAgLTEyNzcsNyArMTI3Nyw3IEBAIHJ1bnFfaW5zZXJ0KGNvbnN0IHN0cnVjdCBz
Y2hlZHVsZXIgKm9wcywgc3RydWN0IGNzY2hlZDJfdW5pdCAqc3ZjKQogICAgIHN0cnVjdCBsaXN0
X2hlYWQgKiBydW5xID0gJmMycnFkKG9wcywgY3B1KS0+cnVucTsKICAgICBpbnQgcG9zID0gMDsK
IAotICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZChwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSku
c2NoZWR1bGVfbG9jaykpOworICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZChnZXRfc2NoZWRfcmVz
KGNwdSktPnNjaGVkdWxlX2xvY2spKTsKIAogICAgIEFTU0VSVCghdmNwdV9vbl9ydW5xKHN2Yykp
OwogICAgIEFTU0VSVChjMnIoY3B1KSA9PSBjMnIoc3ZjLT52Y3B1LT5wcm9jZXNzb3IpKTsKQEAg
LTE3OTgsNyArMTc5OCw3IEBAIHN0YXRpYyBib29sIHZjcHVfZ3JhYl9idWRnZXQoc3RydWN0IGNz
Y2hlZDJfdW5pdCAqc3ZjKQogICAgIHN0cnVjdCBjc2NoZWQyX2RvbSAqc2RvbSA9IHN2Yy0+c2Rv
bTsKICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc3ZjLT52Y3B1LT5wcm9jZXNzb3I7CiAKLSAgICBB
U1NFUlQoc3Bpbl9pc19sb2NrZWQocGVyX2NwdShzY2hlZHVsZV9kYXRhLCBjcHUpLnNjaGVkdWxl
X2xvY2spKTsKKyAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoZ2V0X3NjaGVkX3JlcyhjcHUpLT5z
Y2hlZHVsZV9sb2NrKSk7CiAKICAgICBpZiAoIHN2Yy0+YnVkZ2V0ID4gMCApCiAgICAgICAgIHJl
dHVybiB0cnVlOwpAQCAtMTg0NSw3ICsxODQ1LDcgQEAgdmNwdV9yZXR1cm5fYnVkZ2V0KHN0cnVj
dCBjc2NoZWQyX3VuaXQgKnN2Yywgc3RydWN0IGxpc3RfaGVhZCAqcGFya2VkKQogICAgIHN0cnVj
dCBjc2NoZWQyX2RvbSAqc2RvbSA9IHN2Yy0+c2RvbTsKICAgICB1bnNpZ25lZCBpbnQgY3B1ID0g
c3ZjLT52Y3B1LT5wcm9jZXNzb3I7CiAKLSAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQocGVyX2Nw
dShzY2hlZHVsZV9kYXRhLCBjcHUpLnNjaGVkdWxlX2xvY2spKTsKKyAgICBBU1NFUlQoc3Bpbl9p
c19sb2NrZWQoZ2V0X3NjaGVkX3JlcyhjcHUpLT5zY2hlZHVsZV9sb2NrKSk7CiAgICAgQVNTRVJU
KGxpc3RfZW1wdHkocGFya2VkKSk7CiAKICAgICAvKiBidWRnZXRfbG9jayBuZXN0cyBpbnNpZGUg
cnVucXVldWUgbG9jay4gKi8KQEAgLTIxMDIsNyArMjEwMiw3IEBAIGNzY2hlZDJfdW5pdF93YWtl
KGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiAg
ICAgdW5zaWduZWQgaW50IGNwdSA9IHZjLT5wcm9jZXNzb3I7CiAgICAgc190aW1lX3Qgbm93Owog
Ci0gICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKHBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KS5z
Y2hlZHVsZV9sb2NrKSk7CisgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKGdldF9zY2hlZF9yZXMo
Y3B1KS0+c2NoZWR1bGVfbG9jaykpOwogCiAgICAgQVNTRVJUKCFpc19pZGxlX3ZjcHUodmMpKTsK
IApAQCAtMjIzMCw3ICsyMjMwLDcgQEAgY3NjaGVkMl9yZXNfcGljayhjb25zdCBzdHJ1Y3Qgc2No
ZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogICAgICAqIGp1c3QgZ3JhYiB0
aGUgcHJ2IGxvY2suICBJbnN0ZWFkLCB3ZSdsbCBoYXZlIHRvIHRyeWxvY2ssIGFuZAogICAgICAq
IGRvIHNvbWV0aGluZyBlbHNlIHJlYXNvbmFibGUgaWYgd2UgZmFpbC4KICAgICAgKi8KLSAgICBB
U1NFUlQoc3Bpbl9pc19sb2NrZWQocGVyX2NwdShzY2hlZHVsZV9kYXRhLCBjcHUpLnNjaGVkdWxl
X2xvY2spKTsKKyAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoZ2V0X3NjaGVkX3JlcyhjcHUpLT5z
Y2hlZHVsZV9sb2NrKSk7CiAKICAgICBpZiAoICFyZWFkX3RyeWxvY2soJnBydi0+bG9jaykgKQog
ICAgIHsKQEAgLTI1NzAsNyArMjU3MCw3IEBAIHN0YXRpYyB2b2lkIGJhbGFuY2VfbG9hZChjb25z
dCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIGludCBjcHUsIHNfdGltZV90IG5vdykKICAgICAgKiBv
biBlaXRoZXIgc2lkZSBtYXkgYmUgZW1wdHkpLgogICAgICAqLwogCi0gICAgQVNTRVJUKHNwaW5f
aXNfbG9ja2VkKHBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KS5zY2hlZHVsZV9sb2NrKSk7Cisg
ICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKGdldF9zY2hlZF9yZXMoY3B1KS0+c2NoZWR1bGVfbG9j
aykpOwogICAgIHN0LmxycWQgPSBjMnJxZChvcHMsIGNwdSk7CiAKICAgICB1cGRhdGVfcnVucV9s
b2FkKG9wcywgc3QubHJxZCwgMCwgbm93KTsKQEAgLTM0NzYsNyArMzQ3Niw3IEBAIGNzY2hlZDJf
c2NoZWR1bGUoCiAgICAgcnFkID0gYzJycWQob3BzLCBjcHUpOwogICAgIEJVR19PTighY3B1bWFz
a190ZXN0X2NwdShjcHUsICZycWQtPmFjdGl2ZSkpOwogCi0gICAgQVNTRVJUKHNwaW5faXNfbG9j
a2VkKHBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KS5zY2hlZHVsZV9sb2NrKSk7CisgICAgQVNT
RVJUKHNwaW5faXNfbG9ja2VkKGdldF9zY2hlZF9yZXMoY3B1KS0+c2NoZWR1bGVfbG9jaykpOwog
CiAgICAgQlVHX09OKCFpc19pZGxlX3ZjcHUoc2N1cnItPnZjcHUpICYmIHNjdXJyLT5ycWQgIT0g
cnFkKTsKIApAQCAtMzg2Nyw3ICszODY3LDcgQEAgY3NjaGVkMl9pbml0X3BkYXRhKGNvbnN0IHN0
cnVjdCBzY2hlZHVsZXIgKm9wcywgdm9pZCAqcGRhdGEsIGludCBjcHUpCiAKICAgICBycWkgPSBp
bml0X3BkYXRhKHBydiwgcGRhdGEsIGNwdSk7CiAgICAgLyogTW92ZSB0aGUgc2NoZWR1bGVyIGxv
Y2sgdG8gdGhlIG5ldyBydW5xIGxvY2suICovCi0gICAgcGVyX2NwdShzY2hlZHVsZV9kYXRhLCBj
cHUpLnNjaGVkdWxlX2xvY2sgPSAmcHJ2LT5ycWRbcnFpXS5sb2NrOworICAgIGdldF9zY2hlZF9y
ZXMoY3B1KS0+c2NoZWR1bGVfbG9jayA9ICZwcnYtPnJxZFtycWldLmxvY2s7CiAKICAgICAvKiBf
Tm90XyBwY3B1X3NjaGVkdWxlX3VubG9jaygpOiBzY2hlZHVsZV9sb2NrIG1heSBoYXZlIGNoYW5n
ZWQhICovCiAgICAgc3Bpbl91bmxvY2sob2xkX2xvY2spOwpAQCAtMzg4MSw2ICszODgxLDcgQEAg
Y3NjaGVkMl9zd2l0Y2hfc2NoZWQoc3RydWN0IHNjaGVkdWxlciAqbmV3X29wcywgdW5zaWduZWQg
aW50IGNwdSwKIHsKICAgICBzdHJ1Y3QgY3NjaGVkMl9wcml2YXRlICpwcnYgPSBjc2NoZWQyX3By
aXYobmV3X29wcyk7CiAgICAgc3RydWN0IGNzY2hlZDJfdW5pdCAqc3ZjID0gdmRhdGE7CisgICAg
c3RydWN0IHNjaGVkX3Jlc291cmNlICpzZCA9IGdldF9zY2hlZF9yZXMoY3B1KTsKICAgICB1bnNp
Z25lZCBycWk7CiAKICAgICBBU1NFUlQocGRhdGEgJiYgc3ZjICYmIGlzX2lkbGVfdmNwdShzdmMt
PnZjcHUpKTsKQEAgLTM5MDYsNyArMzkwNyw3IEBAIGNzY2hlZDJfc3dpdGNoX3NjaGVkKHN0cnVj
dCBzY2hlZHVsZXIgKm5ld19vcHMsIHVuc2lnbmVkIGludCBjcHUsCiAgICAgICogdGhpcyBzY2hl
ZHVsZXIsIGFuZCBzbyBpdCdzIHNhZmUgdG8gaGF2ZSB0YWtlbiBpdCAvYmVmb3JlLyBvdXIKICAg
ICAgKiBwcml2YXRlIGdsb2JhbCBsb2NrLgogICAgICAqLwotICAgIEFTU0VSVChwZXJfY3B1KHNj
aGVkdWxlX2RhdGEsIGNwdSkuc2NoZWR1bGVfbG9jayAhPSAmcHJ2LT5ycWRbcnFpXS5sb2NrKTsK
KyAgICBBU1NFUlQoc2QtPnNjaGVkdWxlX2xvY2sgIT0gJnBydi0+cnFkW3JxaV0ubG9jayk7CiAK
ICAgICB3cml0ZV91bmxvY2soJnBydi0+bG9jayk7CiAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
c2NoZWRfbnVsbC5jIGIveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMKaW5kZXggNGRjMDM1NmY4MC4u
NWYwMzU2YzdmOCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMKKysrIGIveGVu
L2NvbW1vbi9zY2hlZF9udWxsLmMKQEAgLTI2OSw3ICsyNjksNyBAQCBwaWNrX3JlcyhzdHJ1Y3Qg
bnVsbF9wcml2YXRlICpwcnYsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogICAgIHVuc2lnbmVk
IGludCBjcHUgPSB2LT5wcm9jZXNzb3IsIG5ld19jcHU7CiAgICAgY3B1bWFza190ICpjcHVzID0g
Y3B1cG9vbF9kb21haW5fY3B1bWFzayh2LT5kb21haW4pOwogCi0gICAgQVNTRVJUKHNwaW5faXNf
bG9ja2VkKHBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KS5zY2hlZHVsZV9sb2NrKSk7CisgICAg
QVNTRVJUKHNwaW5faXNfbG9ja2VkKGdldF9zY2hlZF9yZXMoY3B1KS0+c2NoZWR1bGVfbG9jaykp
OwogCiAgICAgZm9yX2VhY2hfYWZmaW5pdHlfYmFsYW5jZV9zdGVwKCBicyApCiAgICAgewpAQCAt
NDE5LDcgKzQxOSw3IEBAIHN0YXRpYyBzcGlubG9ja190ICpudWxsX3N3aXRjaF9zY2hlZChzdHJ1
Y3Qgc2NoZWR1bGVyICpuZXdfb3BzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBjcHUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdm9pZCAqcGRhdGEsIHZvaWQgKnZkYXRhKQogewotICAgIHN0cnVjdCBzY2hlZHVsZV9kYXRh
ICpzZCA9ICZwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSk7CisgICAgc3RydWN0IHNjaGVkX3Jl
c291cmNlICpzZCA9IGdldF9zY2hlZF9yZXMoY3B1KTsKICAgICBzdHJ1Y3QgbnVsbF9wcml2YXRl
ICpwcnYgPSBudWxsX3ByaXYobmV3X29wcyk7CiAgICAgc3RydWN0IG51bGxfdW5pdCAqbnZjID0g
dmRhdGE7CiAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfcnQuYyBiL3hlbi9jb21tb24v
c2NoZWRfcnQuYwppbmRleCAwNmY2MzE3NmVlLi4zY2U4NTEyMmNjIDEwMDY0NAotLS0gYS94ZW4v
Y29tbW9uL3NjaGVkX3J0LmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9ydC5jCkBAIC03NSw3ICs3
NSw3IEBACiAvKgogICogTG9ja2luZzoKICAqIEEgZ2xvYmFsIHN5c3RlbSBsb2NrIGlzIHVzZWQg
dG8gcHJvdGVjdCB0aGUgUnVuUSBhbmQgRGVwbGV0ZWRRLgotICogVGhlIGdsb2JhbCBsb2NrIGlz
IHJlZmVyZW5jZWQgYnkgc2NoZWR1bGVfZGF0YS5zY2hlZHVsZV9sb2NrCisgKiBUaGUgZ2xvYmFs
IGxvY2sgaXMgcmVmZXJlbmNlZCBieSBzY2hlZF9yZXMtPnNjaGVkdWxlX2xvY2sKICAqIGZyb20g
YWxsIHBoeXNpY2FsIGNwdXMuCiAgKgogICogVGhlIGxvY2sgaXMgYWxyZWFkeSBncmFiYmVkIHdo
ZW4gY2FsbGluZyB3YWtlL3NsZWVwL3NjaGVkdWxlLyBmdW5jdGlvbnMKQEAgLTE3Niw3ICsxNzYs
NyBAQCBzdGF0aWMgdm9pZCByZXBsX3RpbWVyX2hhbmRsZXIodm9pZCAqZGF0YSk7CiAKIC8qCiAg
KiBTeXN0ZW0td2lkZSBwcml2YXRlIGRhdGEsIGluY2x1ZGUgZ2xvYmFsIFJ1blF1ZXVlL0RlcGxl
dGVkUQotICogR2xvYmFsIGxvY2sgaXMgcmVmZXJlbmNlZCBieSBzY2hlZHVsZV9kYXRhLnNjaGVk
dWxlX2xvY2sgZnJvbSBhbGwKKyAqIEdsb2JhbCBsb2NrIGlzIHJlZmVyZW5jZWQgYnkgc2NoZWRf
cmVzLT5zY2hlZHVsZV9sb2NrIGZyb20gYWxsCiAgKiBwaHlzaWNhbCBjcHVzLiBJdCBjYW4gYmUg
Z3JhYmJlZCB2aWEgdmNwdV9zY2hlZHVsZV9sb2NrX2lycSgpCiAgKi8KIHN0cnVjdCBydF9wcml2
YXRlIHsKQEAgLTcyMiw3ICs3MjIsNyBAQCBydF9pbml0X3BkYXRhKGNvbnN0IHN0cnVjdCBzY2hl
ZHVsZXIgKm9wcywgdm9pZCAqcGRhdGEsIGludCBjcHUpCiAgICAgfQogCiAgICAgLyogTW92ZSB0
aGUgc2NoZWR1bGVyIGxvY2sgdG8gb3VyIGdsb2JhbCBydW5xdWV1ZSBsb2NrLiAgKi8KLSAgICBw
ZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSkuc2NoZWR1bGVfbG9jayA9ICZwcnYtPmxvY2s7Cisg
ICAgZ2V0X3NjaGVkX3JlcyhjcHUpLT5zY2hlZHVsZV9sb2NrID0gJnBydi0+bG9jazsKIAogICAg
IC8qIF9Ob3RfIHBjcHVfc2NoZWR1bGVfdW5sb2NrKCk6IHBlcl9jcHUoKS5zY2hlZHVsZV9sb2Nr
IGNoYW5nZWQhICovCiAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZShvbGRfbG9jaywgZmxhZ3Mp
OwpAQCAtNzM1LDYgKzczNSw3IEBAIHJ0X3N3aXRjaF9zY2hlZChzdHJ1Y3Qgc2NoZWR1bGVyICpu
ZXdfb3BzLCB1bnNpZ25lZCBpbnQgY3B1LAogewogICAgIHN0cnVjdCBydF9wcml2YXRlICpwcnYg
PSBydF9wcml2KG5ld19vcHMpOwogICAgIHN0cnVjdCBydF91bml0ICpzdmMgPSB2ZGF0YTsKKyAg
ICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNkID0gZ2V0X3NjaGVkX3JlcyhjcHUpOwogCiAgICAg
QVNTRVJUKCFwZGF0YSAmJiBzdmMgJiYgaXNfaWRsZV92Y3B1KHN2Yy0+dmNwdSkpOwogCkBAIC03
NDQsNyArNzQ1LDcgQEAgcnRfc3dpdGNoX3NjaGVkKHN0cnVjdCBzY2hlZHVsZXIgKm5ld19vcHMs
IHVuc2lnbmVkIGludCBjcHUsCiAgICAgICogYW5vdGhlciBzY2hlZHVsZXIsIGJ1dCB0aGF0IGlz
IGhvdyB0aGluZ3MgbmVlZCB0byBiZSwgZm9yCiAgICAgICogcHJldmVudGluZyByYWNlcy4KICAg
ICAgKi8KLSAgICBBU1NFUlQocGVyX2NwdShzY2hlZHVsZV9kYXRhLCBjcHUpLnNjaGVkdWxlX2xv
Y2sgIT0gJnBydi0+bG9jayk7CisgICAgQVNTRVJUKHNkLT5zY2hlZHVsZV9sb2NrICE9ICZwcnYt
PmxvY2spOwogCiAgICAgLyoKICAgICAgKiBJZiB3ZSBhcmUgdGhlIGFic29sdXRlIGZpcnN0IGNw
dSBiZWluZyBzd2l0Y2hlZCB0b3dhcmQgdGhpcwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDQ1Mzk0ZTZjMmUuLmMxNjdlYjIz
ZjIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMKQEAgLTY1LDcgKzY1LDYgQEAgc3RhdGljIHZvaWQgdmNwdV9zaW5nbGVzaG90X3Rp
bWVyX2ZuKHZvaWQgKmRhdGEpOwogc3RhdGljIHZvaWQgcG9sbF90aW1lcl9mbih2b2lkICpkYXRh
KTsKIAogLyogVGhpcyBpcyBnbG9iYWwgZm9yIG5vdyBzbyB0aGF0IHByaXZhdGUgaW1wbGVtZW50
YXRpb25zIGNhbiByZWFjaCBpdCAqLwotREVGSU5FX1BFUl9DUFUoc3RydWN0IHNjaGVkdWxlX2Rh
dGEsIHNjaGVkdWxlX2RhdGEpOwogREVGSU5FX1BFUl9DUFUoc3RydWN0IHNjaGVkdWxlciAqLCBz
Y2hlZHVsZXIpOwogREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkoc3RydWN0IHNjaGVkX3Jlc291
cmNlICosIHNjaGVkX3Jlcyk7CiAKQEAgLTIxMyw3ICsyMTIsNyBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgdmNwdV91cmdlbnRfY291bnRfdXBkYXRlKHN0cnVjdCB2Y3B1ICp2KQogICAgICAgICAgICAg
ICF0ZXN0X2JpdCh2LT52Y3B1X2lkLCB2LT5kb21haW4tPnBvbGxfbWFzaykgKQogICAgICAgICB7
CiAgICAgICAgICAgICB2LT5pc191cmdlbnQgPSAwOwotICAgICAgICAgICAgYXRvbWljX2RlYygm
cGVyX2NwdShzY2hlZHVsZV9kYXRhLHYtPnByb2Nlc3NvcikudXJnZW50X2NvdW50KTsKKyAgICAg
ICAgICAgIGF0b21pY19kZWMoJmdldF9zY2hlZF9yZXModi0+cHJvY2Vzc29yKS0+dXJnZW50X2Nv
dW50KTsKICAgICAgICAgfQogICAgIH0KICAgICBlbHNlCkBAIC0yMjIsNyArMjIxLDcgQEAgc3Rh
dGljIGlubGluZSB2b2lkIHZjcHVfdXJnZW50X2NvdW50X3VwZGF0ZShzdHJ1Y3QgdmNwdSAqdikK
ICAgICAgICAgICAgICB1bmxpa2VseSh0ZXN0X2JpdCh2LT52Y3B1X2lkLCB2LT5kb21haW4tPnBv
bGxfbWFzaykpICkKICAgICAgICAgewogICAgICAgICAgICAgdi0+aXNfdXJnZW50ID0gMTsKLSAg
ICAgICAgICAgIGF0b21pY19pbmMoJnBlcl9jcHUoc2NoZWR1bGVfZGF0YSx2LT5wcm9jZXNzb3Ip
LnVyZ2VudF9jb3VudCk7CisgICAgICAgICAgICBhdG9taWNfaW5jKCZnZXRfc2NoZWRfcmVzKHYt
PnByb2Nlc3NvciktPnVyZ2VudF9jb3VudCk7CiAgICAgICAgIH0KICAgICB9CiB9CkBAIC0yMzMs
NyArMjMyLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHZjcHVfcnVuc3RhdGVfY2hhbmdlKAogICAg
IHNfdGltZV90IGRlbHRhOwogCiAgICAgQVNTRVJUKHYtPnJ1bnN0YXRlLnN0YXRlICE9IG5ld19z
dGF0ZSk7Ci0gICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKHBlcl9jcHUoc2NoZWR1bGVfZGF0YSx2
LT5wcm9jZXNzb3IpLnNjaGVkdWxlX2xvY2spKTsKKyAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQo
Z2V0X3NjaGVkX3Jlcyh2LT5wcm9jZXNzb3IpLT5zY2hlZHVsZV9sb2NrKSk7CiAKICAgICB2Y3B1
X3VyZ2VudF9jb3VudF91cGRhdGUodik7CiAKQEAgLTM5Miw3ICszOTEsNyBAQCBpbnQgc2NoZWRf
aW5pdF92Y3B1KHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgcHJvY2Vzc29yKQogICAgIC8q
IElkbGUgVkNQVXMgYXJlIHNjaGVkdWxlZCBpbW1lZGlhdGVseSwgc28gZG9uJ3QgcHV0IHRoZW0g
aW4gcnVucXVldWUuICovCiAgICAgaWYgKCBpc19pZGxlX2RvbWFpbihkKSApCiAgICAgewotICAg
ICAgICBwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIHYtPnByb2Nlc3NvcikuY3VyciA9IHVuaXQ7Cisg
ICAgICAgIGdldF9zY2hlZF9yZXModi0+cHJvY2Vzc29yKS0+Y3VyciA9IHVuaXQ7CiAgICAgICAg
IHYtPmlzX3J1bm5pbmcgPSAxOwogICAgIH0KICAgICBlbHNlCkBAIC01MTcsNyArNTE2LDcgQEAg
dm9pZCBzY2hlZF9kZXN0cm95X3ZjcHUoc3RydWN0IHZjcHUgKnYpCiAgICAga2lsbF90aW1lcigm
di0+c2luZ2xlc2hvdF90aW1lcik7CiAgICAga2lsbF90aW1lcigmdi0+cG9sbF90aW1lcik7CiAg
ICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9ib29sKHYtPmlzX3VyZ2VudCkgKQotICAgICAgICBhdG9t
aWNfZGVjKCZwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIHYtPnByb2Nlc3NvcikudXJnZW50X2NvdW50
KTsKKyAgICAgICAgYXRvbWljX2RlYygmZ2V0X3NjaGVkX3Jlcyh2LT5wcm9jZXNzb3IpLT51cmdl
bnRfY291bnQpOwogICAgIHNjaGVkX3JlbW92ZV91bml0KHZjcHVfc2NoZWR1bGVyKHYpLCB1bml0
KTsKICAgICBzY2hlZF9mcmVlX3ZkYXRhKHZjcHVfc2NoZWR1bGVyKHYpLCB1bml0LT5wcml2KTsK
ICAgICBzY2hlZF9mcmVlX3VuaXQodW5pdCk7CkBAIC01NjQsNyArNTYzLDcgQEAgdm9pZCBzY2hl
ZF9kZXN0cm95X2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkKQogCiB2b2lkIHZjcHVfc2xlZXBfbm9z
eW5jX2xvY2tlZChzdHJ1Y3QgdmNwdSAqdikKIHsKLSAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQo
cGVyX2NwdShzY2hlZHVsZV9kYXRhLHYtPnByb2Nlc3Nvcikuc2NoZWR1bGVfbG9jaykpOworICAg
IEFTU0VSVChzcGluX2lzX2xvY2tlZChnZXRfc2NoZWRfcmVzKHYtPnByb2Nlc3NvciktPnNjaGVk
dWxlX2xvY2spKTsKIAogICAgIGlmICggbGlrZWx5KCF2Y3B1X3J1bm5hYmxlKHYpKSApCiAgICAg
ewpAQCAtNjU5LDggKzY1OCw4IEBAIHN0YXRpYyB2b2lkIHZjcHVfbW92ZV9sb2NrZWQoc3RydWN0
IHZjcHUgKnYsIHVuc2lnbmVkIGludCBuZXdfY3B1KQogICAgICAqLwogICAgIGlmICggdW5saWtl
bHkodi0+aXNfdXJnZW50KSAmJiAob2xkX2NwdSAhPSBuZXdfY3B1KSApCiAgICAgewotICAgICAg
ICBhdG9taWNfaW5jKCZwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIG5ld19jcHUpLnVyZ2VudF9jb3Vu
dCk7Ci0gICAgICAgIGF0b21pY19kZWMoJnBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgb2xkX2NwdSku
dXJnZW50X2NvdW50KTsKKyAgICAgICAgYXRvbWljX2luYygmZ2V0X3NjaGVkX3JlcyhuZXdfY3B1
KS0+dXJnZW50X2NvdW50KTsKKyAgICAgICAgYXRvbWljX2RlYygmZ2V0X3NjaGVkX3JlcyhvbGRf
Y3B1KS0+dXJnZW50X2NvdW50KTsKICAgICB9CiAKICAgICAvKgpAQCAtNzI2LDIwICs3MjUsMjAg
QEAgc3RhdGljIHZvaWQgdmNwdV9taWdyYXRlX2ZpbmlzaChzdHJ1Y3QgdmNwdSAqdikKICAgICAg
ICAgICogYXJlIG5vdCBjb3JyZWN0IGFueSBsb25nZXIgYWZ0ZXIgZXZhbHVhdGluZyBvbGQgYW5k
IG5ldyBjcHUgaG9sZGluZwogICAgICAgICAgKiB0aGUgbG9ja3MuCiAgICAgICAgICAqLwotICAg
ICAgICBvbGRfbG9jayA9IHBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgb2xkX2NwdSkuc2NoZWR1bGVf
bG9jazsKLSAgICAgICAgbmV3X2xvY2sgPSBwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIG5ld19jcHUp
LnNjaGVkdWxlX2xvY2s7CisgICAgICAgIG9sZF9sb2NrID0gZ2V0X3NjaGVkX3JlcyhvbGRfY3B1
KS0+c2NoZWR1bGVfbG9jazsKKyAgICAgICAgbmV3X2xvY2sgPSBnZXRfc2NoZWRfcmVzKG5ld19j
cHUpLT5zY2hlZHVsZV9sb2NrOwogCiAgICAgICAgIHNjaGVkX3NwaW5fbG9ja19kb3VibGUob2xk
X2xvY2ssIG5ld19sb2NrLCAmZmxhZ3MpOwogCiAgICAgICAgIG9sZF9jcHUgPSB2LT5wcm9jZXNz
b3I7Ci0gICAgICAgIGlmICggb2xkX2xvY2sgPT0gcGVyX2NwdShzY2hlZHVsZV9kYXRhLCBvbGRf
Y3B1KS5zY2hlZHVsZV9sb2NrICkKKyAgICAgICAgaWYgKCBvbGRfbG9jayA9PSBnZXRfc2NoZWRf
cmVzKG9sZF9jcHUpLT5zY2hlZHVsZV9sb2NrICkKICAgICAgICAgewogICAgICAgICAgICAgLyoK
ICAgICAgICAgICAgICAqIElmIHdlIHNlbGVjdGVkIGEgQ1BVIG9uIHRoZSBwcmV2aW9zdSBpdGVy
YXRpb24sIGNoZWNrIGlmIGl0CiAgICAgICAgICAgICAgKiByZW1haW5zIHN1aXRhYmxlIGZvciBy
dW5uaW5nIHRoaXMgdkNQVS4KICAgICAgICAgICAgICAqLwogICAgICAgICAgICAgaWYgKCBwaWNr
X2NhbGxlZCAmJgotICAgICAgICAgICAgICAgICAobmV3X2xvY2sgPT0gcGVyX2NwdShzY2hlZHVs
ZV9kYXRhLCBuZXdfY3B1KS5zY2hlZHVsZV9sb2NrKSAmJgorICAgICAgICAgICAgICAgICAobmV3
X2xvY2sgPT0gZ2V0X3NjaGVkX3JlcyhuZXdfY3B1KS0+c2NoZWR1bGVfbG9jaykgJiYKICAgICAg
ICAgICAgICAgICAgY3B1bWFza190ZXN0X2NwdShuZXdfY3B1LCB2LT5jcHVfaGFyZF9hZmZpbml0
eSkgJiYKICAgICAgICAgICAgICAgICAgY3B1bWFza190ZXN0X2NwdShuZXdfY3B1LCB2LT5kb21h
aW4tPmNwdXBvb2wtPmNwdV92YWxpZCkgKQogICAgICAgICAgICAgICAgIGJyZWFrOwpAQCAtNzQ3
LDcgKzc0Niw3IEBAIHN0YXRpYyB2b2lkIHZjcHVfbWlncmF0ZV9maW5pc2goc3RydWN0IHZjcHUg
KnYpCiAgICAgICAgICAgICAvKiBTZWxlY3QgYSBuZXcgQ1BVLiAqLwogICAgICAgICAgICAgbmV3
X2NwdSA9IHNjaGVkX3BpY2tfcmVzb3VyY2UodmNwdV9zY2hlZHVsZXIodiksCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2LT5zY2hlZF91bml0KS0+cHJvY2Vzc29y
OwotICAgICAgICAgICAgaWYgKCAobmV3X2xvY2sgPT0gcGVyX2NwdShzY2hlZHVsZV9kYXRhLCBu
ZXdfY3B1KS5zY2hlZHVsZV9sb2NrKSAmJgorICAgICAgICAgICAgaWYgKCAobmV3X2xvY2sgPT0g
Z2V0X3NjaGVkX3JlcyhuZXdfY3B1KS0+c2NoZWR1bGVfbG9jaykgJiYKICAgICAgICAgICAgICAg
ICAgY3B1bWFza190ZXN0X2NwdShuZXdfY3B1LCB2LT5kb21haW4tPmNwdXBvb2wtPmNwdV92YWxp
ZCkgKQogICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgcGlja19jYWxsZWQgPSAx
OwpAQCAtMTU1OCw3ICsxNTU3LDcgQEAgc3RhdGljIHZvaWQgc2NoZWR1bGUodm9pZCkKICAgICBz
dHJ1Y3Qgc2NoZWR1bGVyICAgICAqc2NoZWQ7CiAgICAgdW5zaWduZWQgbG9uZyAgICAgICAgKnRh
c2tsZXRfd29yayA9ICZ0aGlzX2NwdSh0YXNrbGV0X3dvcmtfdG9fZG8pOwogICAgIGJvb2xfdCAg
ICAgICAgICAgICAgICB0YXNrbGV0X3dvcmtfc2NoZWR1bGVkID0gMDsKLSAgICBzdHJ1Y3Qgc2No
ZWR1bGVfZGF0YSAqc2Q7CisgICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpzZDsKICAgICBzcGlu
bG9ja190ICAgICAgICAgICAqbG9jazsKICAgICBzdHJ1Y3QgdGFza19zbGljZSAgICAgbmV4dF9z
bGljZTsKICAgICBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwpAQCAtMTU2Nyw3ICsxNTY2
LDcgQEAgc3RhdGljIHZvaWQgc2NoZWR1bGUodm9pZCkKIAogICAgIFNDSEVEX1NUQVRfQ1JBTkso
c2NoZWRfcnVuKTsKIAotICAgIHNkID0gJnRoaXNfY3B1KHNjaGVkdWxlX2RhdGEpOworICAgIHNk
ID0gZ2V0X3NjaGVkX3JlcyhjcHUpOwogCiAgICAgLyogVXBkYXRlIHRhc2tsZXQgc2NoZWR1bGlu
ZyBzdGF0dXMuICovCiAgICAgc3dpdGNoICggKnRhc2tsZXRfd29yayApCkBAIC0xNzA4LDE0ICsx
NzA3LDEzIEBAIHN0YXRpYyB2b2lkIHBvbGxfdGltZXJfZm4odm9pZCAqZGF0YSkKIAogc3RhdGlj
IGludCBjcHVfc2NoZWR1bGVfdXAodW5zaWduZWQgaW50IGNwdSkKIHsKLSAgICBzdHJ1Y3Qgc2No
ZWR1bGVfZGF0YSAqc2QgPSAmcGVyX2NwdShzY2hlZHVsZV9kYXRhLCBjcHUpOwotICAgIHN0cnVj
dCBzY2hlZF9yZXNvdXJjZSAqcmVzOworICAgIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc2Q7CiAK
LSAgICByZXMgPSB4emFsbG9jKHN0cnVjdCBzY2hlZF9yZXNvdXJjZSk7Ci0gICAgaWYgKCByZXMg
PT0gTlVMTCApCisgICAgc2QgPSB4emFsbG9jKHN0cnVjdCBzY2hlZF9yZXNvdXJjZSk7CisgICAg
aWYgKCBzZCA9PSBOVUxMICkKICAgICAgICAgcmV0dXJuIC1FTk9NRU07Ci0gICAgcmVzLT5wcm9j
ZXNzb3IgPSBjcHU7Ci0gICAgc2V0X3NjaGVkX3JlcyhjcHUsIHJlcyk7CisgICAgc2QtPnByb2Nl
c3NvciA9IGNwdTsKKyAgICBzZXRfc2NoZWRfcmVzKGNwdSwgc2QpOwogCiAgICAgcGVyX2NwdShz
Y2hlZHVsZXIsIGNwdSkgPSAmc2NoZWRfaWRsZV9vcHM7CiAgICAgc3Bpbl9sb2NrX2luaXQoJnNk
LT5fbG9jayk7CkBAIC0xNzMwLDcgKzE3MjgsNyBAQCBzdGF0aWMgaW50IGNwdV9zY2hlZHVsZV91
cCh1bnNpZ25lZCBpbnQgY3B1KQogICAgIGlmICggaWRsZV92Y3B1W2NwdV0gPT0gTlVMTCApCiAg
ICAgICAgIHZjcHVfY3JlYXRlKGlkbGVfdmNwdVswXS0+ZG9tYWluLCBjcHUsIGNwdSk7CiAgICAg
ZWxzZQotICAgICAgICBpZGxlX3ZjcHVbY3B1XS0+c2NoZWRfdW5pdC0+cmVzID0gcmVzOworICAg
ICAgICBpZGxlX3ZjcHVbY3B1XS0+c2NoZWRfdW5pdC0+cmVzID0gc2Q7CiAKICAgICBpZiAoIGlk
bGVfdmNwdVtjcHVdID09IE5VTEwgKQogICAgICAgICByZXR1cm4gLUVOT01FTTsKQEAgLTE3NTAs
NyArMTc0OCw3IEBAIHN0YXRpYyBpbnQgY3B1X3NjaGVkdWxlX3VwKHVuc2lnbmVkIGludCBjcHUp
CiAKIHN0YXRpYyB2b2lkIGNwdV9zY2hlZHVsZV9kb3duKHVuc2lnbmVkIGludCBjcHUpCiB7Ci0g
ICAgc3RydWN0IHNjaGVkdWxlX2RhdGEgKnNkID0gJnBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1
KTsKKyAgICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNkID0gZ2V0X3NjaGVkX3JlcyhjcHUpOwog
CiAgICAga2lsbF90aW1lcigmc2QtPnNfdGltZXIpOwogCkBAIC0xOTA5LDcgKzE5MDcsNyBAQCB2
b2lkIF9faW5pdCBzY2hlZHVsZXJfaW5pdCh2b2lkKQogICAgIGlkbGVfZG9tYWluLT5tYXhfdmNw
dXMgPSBucl9jcHVfaWRzOwogICAgIGlmICggdmNwdV9jcmVhdGUoaWRsZV9kb21haW4sIDAsIDAp
ID09IE5VTEwgKQogICAgICAgICBCVUcoKTsKLSAgICB0aGlzX2NwdShzY2hlZHVsZV9kYXRhKS5j
dXJyID0gaWRsZV92Y3B1WzBdLT5zY2hlZF91bml0OworICAgIGdldF9zY2hlZF9yZXMoMCktPmN1
cnIgPSBpZGxlX3ZjcHVbMF0tPnNjaGVkX3VuaXQ7CiB9CiAKIC8qCkBAIC0xOTI2LDcgKzE5MjQs
NyBAQCBpbnQgc2NoZWR1bGVfY3B1X3N3aXRjaCh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1Y3QgY3B1
cG9vbCAqYykKICAgICBzdHJ1Y3Qgc2NoZWR1bGVyICpvbGRfb3BzID0gcGVyX2NwdShzY2hlZHVs
ZXIsIGNwdSk7CiAgICAgc3RydWN0IHNjaGVkdWxlciAqbmV3X29wcyA9IChjID09IE5VTEwpID8g
JnNjaGVkX2lkbGVfb3BzIDogYy0+c2NoZWQ7CiAgICAgc3RydWN0IGNwdXBvb2wgKm9sZF9wb29s
ID0gcGVyX2NwdShjcHVwb29sLCBjcHUpOwotICAgIHN0cnVjdCBzY2hlZHVsZV9kYXRhICpzZCA9
ICZwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSk7CisgICAgc3RydWN0IHNjaGVkX3Jlc291cmNl
ICpzZCA9IGdldF9zY2hlZF9yZXMoY3B1KTsKICAgICBzcGlubG9ja190ICpvbGRfbG9jaywgKm5l
d19sb2NrOwogICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKQEAgLTIxMDksNiArMjEwNywxNiBA
QCB2b2lkIHdhaXQodm9pZCkKICAgICBzY2hlZHVsZSgpOwogfQogCisvKgorICogdmNwdSBpcyB1
cmdlbnQgaWYgdmNwdSBpcyBwb2xsaW5nIGV2ZW50IGNoYW5uZWwKKyAqCisgKiBpZiB1cmdlbnQg
dmNwdSBleGlzdHMsIENQVSBzaG91bGQgbm90IGVudGVyIGRlZXAgQyBzdGF0ZQorICovCitib29s
IHNjaGVkX2hhc191cmdlbnRfdmNwdSh2b2lkKQoreworICAgIHJldHVybiBhdG9taWNfcmVhZCgm
Z2V0X3NjaGVkX3JlcyhzbXBfcHJvY2Vzc29yX2lkKCkpLT51cmdlbnRfY291bnQpOworfQorCiAj
aWZkZWYgQ09ORklHX0NPTVBBVAogI2luY2x1ZGUgImNvbXBhdC9zY2hlZHVsZS5jIgogI2VuZGlm
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2NwdWlkbGUuaCBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvY3B1aWRsZS5oCmluZGV4IDQ4OGY3MDgzMDUuLjVkN2RmZmQyMjggMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvY3B1aWRsZS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvY3B1aWRsZS5oCkBAIC00LDcgKzQsNiBAQAogI2luY2x1ZGUgPHhlbi9jcHVpZGxlLmg+CiAj
aW5jbHVkZSA8eGVuL25vdGlmaWVyLmg+CiAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+Ci0jaW5jbHVk
ZSA8eGVuL3NjaGVkLWlmLmg+CiAKIGV4dGVybiBzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfcG93ZXIg
KnByb2Nlc3Nvcl9wb3dlcnNbXTsKIApAQCAtMjcsMTQgKzI2LDQgQEAgdm9pZCB1cGRhdGVfaWRs
ZV9zdGF0cyhzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfcG93ZXIgKiwKIHZvaWQgdXBkYXRlX2xhc3Rf
Y3hfc3RhdChzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfcG93ZXIgKiwKICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfY3ggKiwgdWludDY0X3QpOwogCi0vKgotICog
dmNwdSBpcyB1cmdlbnQgaWYgdmNwdSBpcyBwb2xsaW5nIGV2ZW50IGNoYW5uZWwKLSAqCi0gKiBp
ZiB1cmdlbnQgdmNwdSBleGlzdHMsIENQVSBzaG91bGQgbm90IGVudGVyIGRlZXAgQyBzdGF0ZQot
ICovCi1zdGF0aWMgaW5saW5lIGludCBzY2hlZF9oYXNfdXJnZW50X3ZjcHUodm9pZCkKLXsKLSAg
ICByZXR1cm4gYXRvbWljX3JlYWQoJnRoaXNfY3B1KHNjaGVkdWxlX2RhdGEpLnVyZ2VudF9jb3Vu
dCk7Ci19Ci0KICNlbmRpZiAvKiBfX1g4Nl9BU01fQ1BVSURMRV9IX18gKi8KZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgK
aW5kZXggNjlhZWRkMjIxMC4uMjEyYzYxMjM3NCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKQEAgLTMzLDIyICsz
MywxOCBAQCBleHRlcm4gaW50IHNjaGVkX3JhdGVsaW1pdF91czsKICAqIEZvciBjYWNoZSBiZXR0
ZXJuZXNzLCBrZWVwIHRoZSBhY3R1YWwgbG9jayBpbiB0aGUgc2FtZSBjYWNoZSBhcmVhCiAgKiBh
cyB0aGUgcmVzdCBvZiB0aGUgc3RydWN0LiAgSnVzdCBoYXZlIHRoZSBzY2hlZHVsZXIgcG9pbnQg
dG8gdGhlCiAgKiBvbmUgaXQgd2FudHMgKFRoaXMgbWF5IGJlIHRoZSBvbmUgcmlnaHQgaW4gZnJv
bnQgb2YgaXQpLiovCi1zdHJ1Y3Qgc2NoZWR1bGVfZGF0YSB7CitzdHJ1Y3Qgc2NoZWRfcmVzb3Vy
Y2UgewogICAgIHNwaW5sb2NrX3QgICAgICAgICAqc2NoZWR1bGVfbG9jaywKICAgICAgICAgICAg
ICAgICAgICAgICAgX2xvY2s7CiAgICAgc3RydWN0IHNjaGVkX3VuaXQgICpjdXJyOyAgICAgICAg
ICAgLyogY3VycmVudCB0YXNrICAgICAgICAgICAgICAgICAgICAqLwogICAgIHZvaWQgICAgICAg
ICAgICAgICAqc2NoZWRfcHJpdjsKICAgICBzdHJ1Y3QgdGltZXIgICAgICAgIHNfdGltZXI7ICAg
ICAgICAvKiBzY2hlZHVsaW5nIHRpbWVyICAgICAgICAgICAgICAgICovCiAgICAgYXRvbWljX3Qg
ICAgICAgICAgICB1cmdlbnRfY291bnQ7ICAgLyogaG93IG1hbnkgdXJnZW50IHZjcHVzICAgICAg
ICAgICAqLworICAgIHVuc2lnbmVkIGludCAgICAgICAgcHJvY2Vzc29yOwogfTsKIAotI2RlZmlu
ZSBjdXJyX29uX2NwdShjKSAgICAocGVyX2NwdShzY2hlZHVsZV9kYXRhLCBjKS5jdXJyKQotCi1z
dHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgewotICAgIHVuc2lnbmVkIGludCBwcm9jZXNzb3I7Ci19Owor
I2RlZmluZSBjdXJyX29uX2NwdShjKSAgICAoZ2V0X3NjaGVkX3JlcyhjKS0+Y3VycikKIAotREVD
TEFSRV9QRVJfQ1BVKHN0cnVjdCBzY2hlZHVsZV9kYXRhLCBzY2hlZHVsZV9kYXRhKTsKIERFQ0xB
UkVfUEVSX0NQVShzdHJ1Y3Qgc2NoZWR1bGVyICosIHNjaGVkdWxlcik7CiBERUNMQVJFX1BFUl9D
UFUoc3RydWN0IGNwdXBvb2wgKiwgY3B1cG9vbCk7CiBERUNMQVJFX1BFUl9DUFUoc3RydWN0IHNj
aGVkX3Jlc291cmNlICosIHNjaGVkX3Jlcyk7CkBAIC03OSw3ICs3NSw3IEBAIHN0YXRpYyBpbmxp
bmUgc3BpbmxvY2tfdCAqa2luZCMjX3NjaGVkdWxlX2xvY2sjI2lycShwYXJhbSBFWFRSQV9UWVBF
KGFyZykpIFwKIHsgXAogICAgIGZvciAoIDsgOyApIFwKICAgICB7IFwKLSAgICAgICAgc3Bpbmxv
Y2tfdCAqbG9jayA9IHBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KS5zY2hlZHVsZV9sb2NrOyBc
CisgICAgICAgIHNwaW5sb2NrX3QgKmxvY2sgPSBnZXRfc2NoZWRfcmVzKGNwdSktPnNjaGVkdWxl
X2xvY2s7IFwKICAgICAgICAgLyogXAogICAgICAgICAgKiB2LT5wcm9jZXNzb3IgbWF5IGNoYW5n
ZSB3aGVuIGdyYWJiaW5nIHRoZSBsb2NrOyBidXQgXAogICAgICAgICAgKiBwZXJfY3B1KHYtPnBy
b2Nlc3NvcikgbWF5IGFsc28gY2hhbmdlLCBpZiBjaGFuZ2luZyBjcHUgcG9vbCBcCkBAIC04OSw3
ICs4NSw3IEBAIHN0YXRpYyBpbmxpbmUgc3BpbmxvY2tfdCAqa2luZCMjX3NjaGVkdWxlX2xvY2sj
I2lycShwYXJhbSBFWFRSQV9UWVBFKGFyZykpIFwKICAgICAgICAgICogbG9jayBtYXkgYmUgdGhl
IHNhbWU7IHRoaXMgd2lsbCBzdWNjZWVkIGluIHRoYXQgY2FzZS4gXAogICAgICAgICAgKi8gXAog
ICAgICAgICBzcGluX2xvY2sjI2lycShsb2NrLCAjIyBhcmcpOyBcCi0gICAgICAgIGlmICggbGlr
ZWx5KGxvY2sgPT0gcGVyX2NwdShzY2hlZHVsZV9kYXRhLCBjcHUpLnNjaGVkdWxlX2xvY2spICkg
XAorICAgICAgICBpZiAoIGxpa2VseShsb2NrID09IGdldF9zY2hlZF9yZXMoY3B1KS0+c2NoZWR1
bGVfbG9jaykgKSBcCiAgICAgICAgICAgICByZXR1cm4gbG9jazsgXAogICAgICAgICBzcGluX3Vu
bG9jayMjaXJxKGxvY2ssICMjIGFyZyk7IFwKICAgICB9IFwKQEAgLTk5LDcgKzk1LDcgQEAgc3Rh
dGljIGlubGluZSBzcGlubG9ja190ICpraW5kIyNfc2NoZWR1bGVfbG9jayMjaXJxKHBhcmFtIEVY
VFJBX1RZUEUoYXJnKSkgXAogc3RhdGljIGlubGluZSB2b2lkIGtpbmQjI19zY2hlZHVsZV91bmxv
Y2sjI2lycShzcGlubG9ja190ICpsb2NrIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgRVhUUkFfVFlQRShhcmcpLCBwYXJhbSkgXAogeyBcCi0gICAgQVNT
RVJUKGxvY2sgPT0gcGVyX2NwdShzY2hlZHVsZV9kYXRhLCBjcHUpLnNjaGVkdWxlX2xvY2spOyBc
CisgICAgQVNTRVJUKGxvY2sgPT0gZ2V0X3NjaGVkX3JlcyhjcHUpLT5zY2hlZHVsZV9sb2NrKTsg
XAogICAgIHNwaW5fdW5sb2NrIyNpcnEobG9jaywgIyMgYXJnKTsgXAogfQogCkBAIC0xMjgsMTEg
KzEyNCwxMSBAQCBzY2hlZF91bmxvY2sodmNwdSwgY29uc3Qgc3RydWN0IHZjcHUgKnYsIHYtPnBy
b2Nlc3NvciwgX2lycXJlc3RvcmUsIGZsYWdzKQogCiBzdGF0aWMgaW5saW5lIHNwaW5sb2NrX3Qg
KnBjcHVfc2NoZWR1bGVfdHJ5bG9jayh1bnNpZ25lZCBpbnQgY3B1KQogewotICAgIHNwaW5sb2Nr
X3QgKmxvY2sgPSBwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSkuc2NoZWR1bGVfbG9jazsKKyAg
ICBzcGlubG9ja190ICpsb2NrID0gZ2V0X3NjaGVkX3JlcyhjcHUpLT5zY2hlZHVsZV9sb2NrOwog
CiAgICAgaWYgKCAhc3Bpbl90cnlsb2NrKGxvY2spICkKICAgICAgICAgcmV0dXJuIE5VTEw7Ci0g
ICAgaWYgKCBsb2NrID09IHBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KS5zY2hlZHVsZV9sb2Nr
ICkKKyAgICBpZiAoIGxvY2sgPT0gZ2V0X3NjaGVkX3JlcyhjcHUpLT5zY2hlZHVsZV9sb2NrICkK
ICAgICAgICAgcmV0dXJuIGxvY2s7CiAgICAgc3Bpbl91bmxvY2sobG9jayk7CiAgICAgcmV0dXJu
IE5VTEw7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oCmluZGV4IDJhYjFiMTNjNjMuLjU3NWNlOWEyNDUgMTAwNjQ0Ci0tLSBhL3hl
bi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC05
MDMsNiArOTAzLDcgQEAgdm9pZCByZXN0b3JlX3ZjcHVfYWZmaW5pdHkoc3RydWN0IGRvbWFpbiAq
ZCk7CiAKIHZvaWQgdmNwdV9ydW5zdGF0ZV9nZXQoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCB2Y3B1
X3J1bnN0YXRlX2luZm8gKnJ1bnN0YXRlKTsKIHVpbnQ2NF90IGdldF9jcHVfaWRsZV90aW1lKHVu
c2lnbmVkIGludCBjcHUpOworYm9vbCBzY2hlZF9oYXNfdXJnZW50X3ZjcHUodm9pZCk7CiAKIC8q
CiAgKiBVc2VkIGJ5IGlkbGUgbG9vcCB0byBkZWNpZGUgd2hldGhlciB0aGVyZSBpcyB3b3JrIHRv
IGRvOgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
