Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF1E2C457
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:35:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZQ3-0004Yx-Rb; Tue, 28 May 2019 10:33:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQ1-0004XN-Mm
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:21 +0000
X-Inumbo-ID: 0103ae7a-8134-11e9-a0ce-5328f10a7cb7
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0103ae7a-8134-11e9-a0ce-5328f10a7cb7;
 Tue, 28 May 2019 10:33:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 624E0AE8D;
 Tue, 28 May 2019 10:33:16 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:32:15 +0200
Message-Id: <20190528103313.1343-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 02/60] xen/sched: add inline wrappers for
 calling per-scheduler functions
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

SW5zdGVhZCBvZiB1c2luZyB0aGUgU0NIRURfT1AoKSBtYWNybyB0byBjYWxsIHRoZSBkaWZmZXJl
bnQgc2NoZWR1bGVyCnNwZWNpZmljIGZ1bmN0aW9ucyBhZGQgaW5saW5lIHdyYXBwZXJzIGZvciB0
aGF0IHB1cnBvc2UuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Ci0tLQpSRkMgVjI6IG5ldyBwYXRjaCAoQW5kcmV3IENvb3BlcikKVjE6IHVzZSBjb25kaXRp
b25hbCBvcGVyYXRvciAoSmFuIEJldWxpY2gsIERhcmlvIEZhZ2dpb2xpKQogICAgZHJvcCBubyBs
b25nZXIgbmVlZGVkIEFTU0VSVCgpcwotLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyAgICAgIHwg
MTA0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQt
aWYuaCB8IDE2MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMTk5IGluc2VydGlvbnMoKyksIDY1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpp
bmRleCA3MmQ4YmUzOTA2Li40ZGE5NzBjNTQzIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVk
dWxlLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC03MywxMCArNzMsNiBAQCBleHRl
cm4gY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqX19zdGFydF9zY2hlZHVsZXJzX2FycmF5W10sICpf
X2VuZF9zY2hlZHVsZXJzX2FycgogCiBzdGF0aWMgc3RydWN0IHNjaGVkdWxlciBfX3JlYWRfbW9z
dGx5IG9wczsKIAotI2RlZmluZSBTQ0hFRF9PUChvcHNwdHIsIGZuLCAuLi4pICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICAgICAgKCggKG9wc3B0ciktPmZu
ICE9IE5VTEwgKSA/IChvcHNwdHIpLT5mbihvcHNwdHIsICMjX19WQV9BUkdTX18gKSAgXAotICAg
ICAgICAgIDogKHR5cGVvZigob3BzcHRyKS0+Zm4ob3BzcHRyLCAjI19fVkFfQVJHU19fKSkpMCAp
Ci0KIHN0YXRpYyBpbmxpbmUgc3RydWN0IHNjaGVkdWxlciAqZG9tX3NjaGVkdWxlcihjb25zdCBz
dHJ1Y3QgZG9tYWluICpkKQogewogICAgIGlmICggbGlrZWx5KGQtPmNwdXBvb2wgIT0gTlVMTCkg
KQpAQCAtMjY3LDggKzI2Myw3IEBAIGludCBzY2hlZF9pbml0X3ZjcHUoc3RydWN0IHZjcHUgKnYs
IHVuc2lnbmVkIGludCBwcm9jZXNzb3IpCiAgICAgaW5pdF90aW1lcigmdi0+cG9sbF90aW1lciwg
cG9sbF90aW1lcl9mbiwKICAgICAgICAgICAgICAgIHYsIHYtPnByb2Nlc3Nvcik7CiAKLSAgICB2
LT5zY2hlZF9wcml2ID0gU0NIRURfT1AoZG9tX3NjaGVkdWxlcihkKSwgYWxsb2NfdmRhdGEsIHYs
Ci0gICAgICAgICAgICAgICAgICAgICBkLT5zY2hlZF9wcml2KTsKKyAgICB2LT5zY2hlZF9wcml2
ID0gc2NoZWRfYWxsb2NfdmRhdGEoZG9tX3NjaGVkdWxlcihkKSwgdiwgZC0+c2NoZWRfcHJpdik7
CiAgICAgaWYgKCB2LT5zY2hlZF9wcml2ID09IE5VTEwgKQogICAgICAgICByZXR1cm4gMTsKIApA
QCAtMjg5LDcgKzI4NCw3IEBAIGludCBzY2hlZF9pbml0X3ZjcHUoc3RydWN0IHZjcHUgKnYsIHVu
c2lnbmVkIGludCBwcm9jZXNzb3IpCiAgICAgfQogICAgIGVsc2UKICAgICB7Ci0gICAgICAgIFND
SEVEX09QKGRvbV9zY2hlZHVsZXIoZCksIGluc2VydF92Y3B1LCB2KTsKKyAgICAgICAgc2NoZWRf
aW5zZXJ0X3ZjcHUoZG9tX3NjaGVkdWxlcihkKSwgdik7CiAgICAgfQogCiAgICAgcmV0dXJuIDA7
CkBAIC0zMzAsNyArMzI1LDcgQEAgaW50IHNjaGVkX21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4g
KmQsIHN0cnVjdCBjcHVwb29sICpjKQogCiAgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQogICAg
IHsKLSAgICAgICAgdmNwdV9wcml2W3YtPnZjcHVfaWRdID0gU0NIRURfT1AoYy0+c2NoZWQsIGFs
bG9jX3ZkYXRhLCB2LCBkb21kYXRhKTsKKyAgICAgICAgdmNwdV9wcml2W3YtPnZjcHVfaWRdID0g
c2NoZWRfYWxsb2NfdmRhdGEoYy0+c2NoZWQsIHYsIGRvbWRhdGEpOwogICAgICAgICBpZiAoIHZj
cHVfcHJpdlt2LT52Y3B1X2lkXSA9PSBOVUxMICkKICAgICAgICAgewogICAgICAgICAgICAgZm9y
X2VhY2hfdmNwdSAoIGQsIHYgKQpAQCAtMzQ4LDcgKzM0Myw3IEBAIGludCBzY2hlZF9tb3ZlX2Rv
bWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9vbCAqYykKIAogICAgIGZvcl9lYWNo
X3ZjcHUgKCBkLCB2ICkKICAgICB7Ci0gICAgICAgIFNDSEVEX09QKG9sZF9vcHMsIHJlbW92ZV92
Y3B1LCB2KTsKKyAgICAgICAgc2NoZWRfcmVtb3ZlX3ZjcHUob2xkX29wcywgdik7CiAgICAgfQog
CiAgICAgZC0+Y3B1cG9vbCA9IGM7CkBAIC0zODMsOSArMzc4LDkgQEAgaW50IHNjaGVkX21vdmVf
ZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBjcHVwb29sICpjKQogCiAgICAgICAgIG5l
d19wID0gY3B1bWFza19jeWNsZShuZXdfcCwgYy0+Y3B1X3ZhbGlkKTsKIAotICAgICAgICBTQ0hF
RF9PUChjLT5zY2hlZCwgaW5zZXJ0X3ZjcHUsIHYpOworICAgICAgICBzY2hlZF9pbnNlcnRfdmNw
dShjLT5zY2hlZCwgdik7CiAKLSAgICAgICAgU0NIRURfT1Aob2xkX29wcywgZnJlZV92ZGF0YSwg
dmNwdWRhdGEpOworICAgICAgICBzY2hlZF9mcmVlX3ZkYXRhKG9sZF9vcHMsIHZjcHVkYXRhKTsK
ICAgICB9CiAKICAgICBkb21haW5fdXBkYXRlX25vZGVfYWZmaW5pdHkoZCk7CkBAIC00MDYsOCAr
NDAxLDggQEAgdm9pZCBzY2hlZF9kZXN0cm95X3ZjcHUoc3RydWN0IHZjcHUgKnYpCiAgICAga2ls
bF90aW1lcigmdi0+cG9sbF90aW1lcik7CiAgICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9ib29sKHYt
PmlzX3VyZ2VudCkgKQogICAgICAgICBhdG9taWNfZGVjKCZwZXJfY3B1KHNjaGVkdWxlX2RhdGEs
IHYtPnByb2Nlc3NvcikudXJnZW50X2NvdW50KTsKLSAgICBTQ0hFRF9PUCh2Y3B1X3NjaGVkdWxl
cih2KSwgcmVtb3ZlX3ZjcHUsIHYpOwotICAgIFNDSEVEX09QKHZjcHVfc2NoZWR1bGVyKHYpLCBm
cmVlX3ZkYXRhLCB2LT5zY2hlZF9wcml2KTsKKyAgICBzY2hlZF9yZW1vdmVfdmNwdSh2Y3B1X3Nj
aGVkdWxlcih2KSwgdik7CisgICAgc2NoZWRfZnJlZV92ZGF0YSh2Y3B1X3NjaGVkdWxlcih2KSwg
di0+c2NoZWRfcHJpdik7CiB9CiAKIGludCBzY2hlZF9pbml0X2RvbWFpbihzdHJ1Y3QgZG9tYWlu
ICpkLCBpbnQgcG9vbGlkKQpAQCAtNDU4LDcgKzQ1Myw3IEBAIHZvaWQgdmNwdV9zbGVlcF9ub3N5
bmNfbG9ja2VkKHN0cnVjdCB2Y3B1ICp2KQogICAgICAgICBpZiAoIHYtPnJ1bnN0YXRlLnN0YXRl
ID09IFJVTlNUQVRFX3J1bm5hYmxlICkKICAgICAgICAgICAgIHZjcHVfcnVuc3RhdGVfY2hhbmdl
KHYsIFJVTlNUQVRFX29mZmxpbmUsIE5PVygpKTsKIAotICAgICAgICBTQ0hFRF9PUCh2Y3B1X3Nj
aGVkdWxlcih2KSwgc2xlZXAsIHYpOworICAgICAgICBzY2hlZF9zbGVlcCh2Y3B1X3NjaGVkdWxl
cih2KSwgdik7CiAgICAgfQogfQogCkBAIC00OTksNyArNDk0LDcgQEAgdm9pZCB2Y3B1X3dha2Uo
c3RydWN0IHZjcHUgKnYpCiAgICAgewogICAgICAgICBpZiAoIHYtPnJ1bnN0YXRlLnN0YXRlID49
IFJVTlNUQVRFX2Jsb2NrZWQgKQogICAgICAgICAgICAgdmNwdV9ydW5zdGF0ZV9jaGFuZ2Uodiwg
UlVOU1RBVEVfcnVubmFibGUsIE5PVygpKTsKLSAgICAgICAgU0NIRURfT1AodmNwdV9zY2hlZHVs
ZXIodiksIHdha2UsIHYpOworICAgICAgICBzY2hlZF93YWtlKHZjcHVfc2NoZWR1bGVyKHYpLCB2
KTsKICAgICB9CiAgICAgZWxzZSBpZiAoICEodi0+cGF1c2VfZmxhZ3MgJiBWUEZfYmxvY2tlZCkg
KQogICAgIHsKQEAgLTU1MiwxOSArNTQ3LDE2IEBAIHN0YXRpYyB2b2lkIHZjcHVfbW92ZV9sb2Nr
ZWQoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCBuZXdfY3B1KQogCiAgICAgLyoKICAgICAg
KiBBY3R1YWwgQ1BVIHN3aXRjaCB0byBuZXcgQ1BVLiAgVGhpcyBpcyBzYWZlIGJlY2F1c2UgdGhl
IGxvY2sKLSAgICAgKiBwb2ludGVyIGNhbnQnIGNoYW5nZSB3aGlsZSB0aGUgY3VycmVudCBsb2Nr
IGlzIGhlbGQuCisgICAgICogcG9pbnRlciBjYW4ndCBjaGFuZ2Ugd2hpbGUgdGhlIGN1cnJlbnQg
bG9jayBpcyBoZWxkLgogICAgICAqLwotICAgIGlmICggdmNwdV9zY2hlZHVsZXIodiktPm1pZ3Jh
dGUgKQotICAgICAgICBTQ0hFRF9PUCh2Y3B1X3NjaGVkdWxlcih2KSwgbWlncmF0ZSwgdiwgbmV3
X2NwdSk7Ci0gICAgZWxzZQotICAgICAgICB2LT5wcm9jZXNzb3IgPSBuZXdfY3B1OworICAgIHNj
aGVkX21pZ3JhdGUodmNwdV9zY2hlZHVsZXIodiksIHYsIG5ld19jcHUpOwogfQogCiAvKgogICog
SW5pdGlhdGluZyBtaWdyYXRpb24KICAqCiAgKiBJbiBvcmRlciB0byBtaWdyYXRlLCB3ZSBuZWVk
IHRoZSB2Y3B1IGluIHF1ZXN0aW9uIHRvIGhhdmUgc3RvcHBlZAotICogcnVubmluZyBhbmQgaGFk
IFNDSEVEX09QKHNsZWVwKSBjYWxsZWQgKHRvIHRha2UgaXQgb2ZmIGFueQorICogcnVubmluZyBh
bmQgaGFkIHNjaGVkX3NsZWVwKCkgY2FsbGVkICh0byB0YWtlIGl0IG9mZiBhbnkKICAqIHJ1bnF1
ZXVlcywgZm9yIGluc3RhbmNlKTsgYW5kIGlmIGl0IGlzIGN1cnJlbnRseSBydW5uaW5nLCBpdCBu
ZWVkcwogICogdG8gYmUgc2NoZWR1bGVkIG91dC4gIEZpbmFsbHksIHdlIG5lZWQgdG8gaG9sZCB0
aGUgc2NoZWR1bGluZyBsb2NrcwogICogZm9yIGJvdGggdGhlIHByb2Nlc3NvciB3ZSdyZSBtaWdy
YXRpbmcgZnJvbSwgYW5kIHRoZSBwcm9jZXNzb3IKQEAgLTYzNSw3ICs2MjcsNyBAQCBzdGF0aWMg
dm9pZCB2Y3B1X21pZ3JhdGVfZmluaXNoKHN0cnVjdCB2Y3B1ICp2KQogICAgICAgICAgICAgICAg
IGJyZWFrOwogCiAgICAgICAgICAgICAvKiBTZWxlY3QgYSBuZXcgQ1BVLiAqLwotICAgICAgICAg
ICAgbmV3X2NwdSA9IFNDSEVEX09QKHZjcHVfc2NoZWR1bGVyKHYpLCBwaWNrX2NwdSwgdik7Cisg
ICAgICAgICAgICBuZXdfY3B1ID0gc2NoZWRfcGlja19jcHUodmNwdV9zY2hlZHVsZXIodiksIHYp
OwogICAgICAgICAgICAgaWYgKCAobmV3X2xvY2sgPT0gcGVyX2NwdShzY2hlZHVsZV9kYXRhLCBu
ZXdfY3B1KS5zY2hlZHVsZV9sb2NrKSAmJgogICAgICAgICAgICAgICAgICBjcHVtYXNrX3Rlc3Rf
Y3B1KG5ld19jcHUsIHYtPmRvbWFpbi0+Y3B1cG9vbC0+Y3B1X3ZhbGlkKSApCiAgICAgICAgICAg
ICAgICAgYnJlYWs7CkBAIC03NDAsNyArNzMyLDcgQEAgdm9pZCByZXN0b3JlX3ZjcHVfYWZmaW5p
dHkoc3RydWN0IGRvbWFpbiAqZCkKICAgICAgICAgdi0+cHJvY2Vzc29yID0gY3B1bWFza19hbnko
Y3B1bWFza19zY3JhdGNoX2NwdShjcHUpKTsKIAogICAgICAgICBsb2NrID0gdmNwdV9zY2hlZHVs
ZV9sb2NrX2lycSh2KTsKLSAgICAgICAgdi0+cHJvY2Vzc29yID0gU0NIRURfT1AodmNwdV9zY2hl
ZHVsZXIodiksIHBpY2tfY3B1LCB2KTsKKyAgICAgICAgdi0+cHJvY2Vzc29yID0gc2NoZWRfcGlj
a19jcHUodmNwdV9zY2hlZHVsZXIodiksIHYpOwogICAgICAgICBzcGluX3VubG9ja19pcnEobG9j
ayk7CiAKICAgICAgICAgaWYgKCBvbGRfY3B1ICE9IHYtPnByb2Nlc3NvciApCkBAIC04NTIsNyAr
ODQ0LDcgQEAgc3RhdGljIGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXJfY2hlY2sodW5zaWduZWQg
aW50IGNwdSkKIHZvaWQgc2NoZWRfc2V0X2FmZmluaXR5KAogICAgIHN0cnVjdCB2Y3B1ICp2LCBj
b25zdCBjcHVtYXNrX3QgKmhhcmQsIGNvbnN0IGNwdW1hc2tfdCAqc29mdCkKIHsKLSAgICBTQ0hF
RF9PUChkb21fc2NoZWR1bGVyKHYtPmRvbWFpbiksIGFkanVzdF9hZmZpbml0eSwgdiwgaGFyZCwg
c29mdCk7CisgICAgc2NoZWRfYWRqdXN0X2FmZmluaXR5KGRvbV9zY2hlZHVsZXIodi0+ZG9tYWlu
KSwgdiwgaGFyZCwgc29mdCk7CiAKICAgICBpZiAoIGhhcmQgKQogICAgICAgICBjcHVtYXNrX2Nv
cHkodi0+Y3B1X2hhcmRfYWZmaW5pdHksIGhhcmQpOwpAQCAtMTAyNyw3ICsxMDE5LDcgQEAgbG9u
ZyB2Y3B1X3lpZWxkKHZvaWQpCiAgICAgc3RydWN0IHZjcHUgKiB2PWN1cnJlbnQ7CiAgICAgc3Bp
bmxvY2tfdCAqbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEodik7CiAKLSAgICBTQ0hFRF9P
UCh2Y3B1X3NjaGVkdWxlcih2KSwgeWllbGQsIHYpOworICAgIHNjaGVkX3lpZWxkKHZjcHVfc2No
ZWR1bGVyKHYpLCB2KTsKICAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdik7CiAK
ICAgICBTQ0hFRF9TVEFUX0NSQU5LKHZjcHVfeWllbGQpOwpAQCAtMTM1Miw3ICsxMzQ0LDcgQEAg
bG9uZyBzY2hlZF9hZGp1c3Qoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHhlbl9kb21jdGxfc2No
ZWR1bGVyX29wICpvcCkKIAogICAgIC8qIE5COiB0aGUgcGx1Z2dhYmxlIHNjaGVkdWxlciBjb2Rl
IG5lZWRzIHRvIHRha2UgY2FyZQogICAgICAqIG9mIGxvY2tpbmcgYnkgaXRzZWxmLiAqLwotICAg
IGlmICggKHJldCA9IFNDSEVEX09QKGRvbV9zY2hlZHVsZXIoZCksIGFkanVzdCwgZCwgb3ApKSA9
PSAwICkKKyAgICBpZiAoIChyZXQgPSBzY2hlZF9hZGp1c3RfZG9tKGRvbV9zY2hlZHVsZXIoZCks
IGQsIG9wKSkgPT0gMCApCiAgICAgICAgIFRSQUNFXzFEKFRSQ19TQ0hFRF9BREpET00sIGQtPmRv
bWFpbl9pZCk7CiAKICAgICByZXR1cm4gcmV0OwpAQCAtMTM3Niw3ICsxMzY4LDcgQEAgbG9uZyBz
Y2hlZF9hZGp1c3RfZ2xvYmFsKHN0cnVjdCB4ZW5fc3lzY3RsX3NjaGVkdWxlcl9vcCAqb3ApCiAg
ICAgICAgIHJldHVybiAtRVNSQ0g7CiAKICAgICByYyA9ICgob3AtPnNjaGVkX2lkID09IHBvb2wt
PnNjaGVkLT5zY2hlZF9pZCkKLSAgICAgICAgICA/IFNDSEVEX09QKHBvb2wtPnNjaGVkLCBhZGp1
c3RfZ2xvYmFsLCBvcCkgOiAtRUlOVkFMKTsKKyAgICAgICAgICA/IHNjaGVkX2FkanVzdF9jcHVw
b29sKHBvb2wtPnNjaGVkLCBvcCkgOiAtRUlOVkFMKTsKIAogICAgIGNwdXBvb2xfcHV0KHBvb2wp
OwogCkBAIC0xNTMwLDcgKzE1MjIsNyBAQCB2b2lkIGNvbnRleHRfc2F2ZWQoc3RydWN0IHZjcHUg
KnByZXYpCiAgICAgLyogQ2hlY2sgZm9yIG1pZ3JhdGlvbiByZXF1ZXN0IC9hZnRlci8gY2xlYXJp
bmcgcnVubmluZyBmbGFnLiAqLwogICAgIHNtcF9tYigpOwogCi0gICAgU0NIRURfT1AodmNwdV9z
Y2hlZHVsZXIocHJldiksIGNvbnRleHRfc2F2ZWQsIHByZXYpOworICAgIHNjaGVkX2NvbnRleHRf
c2F2ZWQodmNwdV9zY2hlZHVsZXIocHJldiksIHByZXYpOwogCiAgICAgdmNwdV9taWdyYXRlX2Zp
bmlzaChwcmV2KTsKIH0KQEAgLTE1OTksOCArMTU5MSw4IEBAIHN0YXRpYyBpbnQgY3B1X3NjaGVk
dWxlX3VwKHVuc2lnbmVkIGludCBjcHUpCiAgICAgICAgICAqLwogICAgICAgICBBU1NFUlQoaWRs
ZS0+c2NoZWRfcHJpdiA9PSBOVUxMKTsKIAotICAgICAgICBpZGxlLT5zY2hlZF9wcml2ID0gU0NI
RURfT1AoJm9wcywgYWxsb2NfdmRhdGEsIGlkbGUsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpZGxlLT5kb21haW4tPnNjaGVkX3ByaXYpOworICAgICAgICBpZGxlLT5zY2hl
ZF9wcml2ID0gc2NoZWRfYWxsb2NfdmRhdGEoJm9wcywgaWRsZSwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlkbGUtPmRvbWFpbi0+c2NoZWRfcHJpdik7CiAg
ICAgICAgIGlmICggaWRsZS0+c2NoZWRfcHJpdiA9PSBOVUxMICkKICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOwogICAgIH0KQEAgLTE2MTIsNyArMTYwNCw3IEBAIHN0YXRpYyBpbnQgY3B1X3Nj
aGVkdWxlX3VwKHVuc2lnbmVkIGludCBjcHUpCiAgICAgICogKGUuZy4sIGluc2lkZSBmcmVlX3Bk
YXRhLCBmcm9tIGNwdV9zY2hlZHVsZV9kb3duKCkgY2FsbGVkCiAgICAgICogZHVyaW5nIENQVV9V
UF9DQU5DRUxMRUQpIHRoYXQgY29udGFpbnMgYW4gSVNfRVJSIHZhbHVlLgogICAgICAqLwotICAg
IHNjaGVkX3ByaXYgPSBTQ0hFRF9PUCgmb3BzLCBhbGxvY19wZGF0YSwgY3B1KTsKKyAgICBzY2hl
ZF9wcml2ID0gc2NoZWRfYWxsb2NfcGRhdGEoJm9wcywgY3B1KTsKICAgICBpZiAoIElTX0VSUihz
Y2hlZF9wcml2KSApCiAgICAgICAgIHJldHVybiBQVFJfRVJSKHNjaGVkX3ByaXYpOwogCkBAIC0x
NjI2LDggKzE2MTgsOCBAQCBzdGF0aWMgdm9pZCBjcHVfc2NoZWR1bGVfZG93bih1bnNpZ25lZCBp
bnQgY3B1KQogICAgIHN0cnVjdCBzY2hlZHVsZV9kYXRhICpzZCA9ICZwZXJfY3B1KHNjaGVkdWxl
X2RhdGEsIGNwdSk7CiAgICAgc3RydWN0IHNjaGVkdWxlciAqc2NoZWQgPSBwZXJfY3B1KHNjaGVk
dWxlciwgY3B1KTsKIAotICAgIFNDSEVEX09QKHNjaGVkLCBmcmVlX3BkYXRhLCBzZC0+c2NoZWRf
cHJpdiwgY3B1KTsKLSAgICBTQ0hFRF9PUChzY2hlZCwgZnJlZV92ZGF0YSwgaWRsZV92Y3B1W2Nw
dV0tPnNjaGVkX3ByaXYpOworICAgIHNjaGVkX2ZyZWVfcGRhdGEoc2NoZWQsIHNkLT5zY2hlZF9w
cml2LCBjcHUpOworICAgIHNjaGVkX2ZyZWVfdmRhdGEoc2NoZWQsIGlkbGVfdmNwdVtjcHVdLT5z
Y2hlZF9wcml2KTsKIAogICAgIGlkbGVfdmNwdVtjcHVdLT5zY2hlZF9wcml2ID0gTlVMTDsKICAg
ICBzZC0+c2NoZWRfcHJpdiA9IE5VTEw7CkBAIC0xNjc5LDcgKzE2NzEsNyBAQCBzdGF0aWMgaW50
IGNwdV9zY2hlZHVsZV9jYWxsYmFjaygKICAgICB7CiAgICAgY2FzZSBDUFVfU1RBUlRJTkc6CiAg
ICAgICAgIGlmICggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9yZXN1bWUgKQotICAgICAgICAg
ICAgU0NIRURfT1Aoc2NoZWQsIGluaXRfcGRhdGEsIHNkLT5zY2hlZF9wcml2LCBjcHUpOworICAg
ICAgICAgICAgc2NoZWRfaW5pdF9wZGF0YShzY2hlZCwgc2QtPnNjaGVkX3ByaXYsIGNwdSk7CiAg
ICAgICAgIGJyZWFrOwogICAgIGNhc2UgQ1BVX1VQX1BSRVBBUkU6CiAgICAgICAgIGlmICggc3lz
dGVtX3N0YXRlICE9IFNZU19TVEFURV9yZXN1bWUgKQpAQCAtMTY5OCw3ICsxNjkwLDcgQEAgc3Rh
dGljIGludCBjcHVfc2NoZWR1bGVfY2FsbGJhY2soCiAgICAgICAgIHJjID0gY3B1X2Rpc2FibGVf
c2NoZWR1bGVyKGNwdSk7CiAgICAgICAgIEJVR19PTihyYyk7CiAgICAgICAgIHJjdV9yZWFkX3Vu
bG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOwotICAgICAgICBTQ0hFRF9PUChzY2hlZCwgZGVpbml0
X3BkYXRhLCBzZC0+c2NoZWRfcHJpdiwgY3B1KTsKKyAgICAgICAgc2NoZWRfZGVpbml0X3BkYXRh
KHNjaGVkLCBzZC0+c2NoZWRfcHJpdiwgY3B1KTsKICAgICAgICAgY3B1X3NjaGVkdWxlX2Rvd24o
Y3B1KTsKICAgICAgICAgYnJlYWs7CiAgICAgY2FzZSBDUFVfVVBfQ0FOQ0VMRUQ6CkBAIC0xNzc1
LDcgKzE3NjcsNyBAQCB2b2lkIF9faW5pdCBzY2hlZHVsZXJfaW5pdCh2b2lkKQogICAgIHJlZ2lz
dGVyX2NwdV9ub3RpZmllcigmY3B1X3NjaGVkdWxlX25mYik7CiAKICAgICBwcmludGsoIlVzaW5n
IHNjaGVkdWxlcjogJXMgKCVzKVxuIiwgb3BzLm5hbWUsIG9wcy5vcHRfbmFtZSk7Ci0gICAgaWYg
KCBTQ0hFRF9PUCgmb3BzLCBpbml0KSApCisgICAgaWYgKCBzY2hlZF9pbml0KCZvcHMpICkKICAg
ICAgICAgcGFuaWMoInNjaGVkdWxlciByZXR1cm5lZCBlcnJvciBvbiBpbml0XG4iKTsKIAogICAg
IGlmICggc2NoZWRfcmF0ZWxpbWl0X3VzICYmCkBAIC0xNzk3LDkgKzE3ODksOSBAQCB2b2lkIF9f
aW5pdCBzY2hlZHVsZXJfaW5pdCh2b2lkKQogICAgIGlkbGVfZG9tYWluLT5tYXhfdmNwdXMgPSBu
cl9jcHVfaWRzOwogICAgIGlmICggdmNwdV9jcmVhdGUoaWRsZV9kb21haW4sIDAsIDApID09IE5V
TEwgKQogICAgICAgICBCVUcoKTsKLSAgICB0aGlzX2NwdShzY2hlZHVsZV9kYXRhKS5zY2hlZF9w
cml2ID0gU0NIRURfT1AoJm9wcywgYWxsb2NfcGRhdGEsIDApOworICAgIHRoaXNfY3B1KHNjaGVk
dWxlX2RhdGEpLnNjaGVkX3ByaXYgPSBzY2hlZF9hbGxvY19wZGF0YSgmb3BzLCAwKTsKICAgICBC
VUdfT04oSVNfRVJSKHRoaXNfY3B1KHNjaGVkdWxlX2RhdGEpLnNjaGVkX3ByaXYpKTsKLSAgICBT
Q0hFRF9PUCgmb3BzLCBpbml0X3BkYXRhLCB0aGlzX2NwdShzY2hlZHVsZV9kYXRhKS5zY2hlZF9w
cml2LCAwKTsKKyAgICBzY2hlZF9pbml0X3BkYXRhKCZvcHMsIHRoaXNfY3B1KHNjaGVkdWxlX2Rh
dGEpLnNjaGVkX3ByaXYsIDApOwogfQogCiAvKgpAQCAtMTg0MiwyNiArMTgzNCwyNiBAQCBpbnQg
c2NoZWR1bGVfY3B1X3N3aXRjaCh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1Y3QgY3B1cG9vbCAqYykK
ICAgICAvKgogICAgICAqIFRvIHNldHVwIHRoZSBjcHUgZm9yIHRoZSBuZXcgc2NoZWR1bGVyIHdl
IG5lZWQ6CiAgICAgICogIC0gYSB2YWxpZCBpbnN0YW5jZSBvZiBwZXItQ1BVIHNjaGVkdWxlciBz
cGVjaWZpYyBkYXRhLCBhcyBpdCBpcwotICAgICAqICAgIGFsbG9jYXRlZCBieSBTQ0hFRF9PUChh
bGxvY19wZGF0YSkuIE5vdGUgdGhhdCB3ZSBkbyBub3Qgd2FudCB0bwotICAgICAqICAgIGluaXRp
YWxpemUgaXQgeWV0IChpLmUuLCB3ZSBhcmUgbm90IGNhbGxpbmcgU0NIRURfT1AoaW5pdF9wZGF0
YSkpLgotICAgICAqICAgIFRoYXQgd2lsbCBiZSBkb25lIGJ5IHRoZSB0YXJnZXQgc2NoZWR1bGVy
LCBpbiBTQ0hFRF9PUChzd2l0Y2hfc2NoZWQpLAorICAgICAqICAgIGFsbG9jYXRlZCBieSBzY2hl
ZF9hbGxvY19wZGF0YSgpLiBOb3RlIHRoYXQgd2UgZG8gbm90IHdhbnQgdG8KKyAgICAgKiAgICBp
bml0aWFsaXplIGl0IHlldCAoaS5lLiwgd2UgYXJlIG5vdCBjYWxsaW5nIHNjaGVkX2luaXRfcGRh
dGEoKSkuCisgICAgICogICAgVGhhdCB3aWxsIGJlIGRvbmUgYnkgdGhlIHRhcmdldCBzY2hlZHVs
ZXIsIGluIHNjaGVkX3N3aXRjaF9zY2hlZCgpLAogICAgICAqICAgIGluIHByb3BlciBvcmRlcmlu
ZyBhbmQgd2l0aCBsb2NraW5nLgogICAgICAqICAtIGEgdmFsaWQgaW5zdGFuY2Ugb2YgcGVyLXZD
UFUgc2NoZWR1bGVyIHNwZWNpZmljIGRhdGEsIGZvciB0aGUgaWRsZQogICAgICAqICAgIHZDUFUg
b2YgY3B1LiBUaGF0IGlzIHdoYXQgdGhlIHRhcmdldCBzY2hlZHVsZXIgd2lsbCB1c2UgZm9yIHRo
ZQogICAgICAqICAgIHNjaGVkX3ByaXYgZmllbGQgb2YgdGhlIHBlci12Q1BVIGluZm8gb2YgdGhl
IGlkbGUgZG9tYWluLgogICAgICAqLwogICAgIGlkbGUgPSBpZGxlX3ZjcHVbY3B1XTsKLSAgICBw
cHJpdiA9IFNDSEVEX09QKG5ld19vcHMsIGFsbG9jX3BkYXRhLCBjcHUpOworICAgIHBwcml2ID0g
c2NoZWRfYWxsb2NfcGRhdGEobmV3X29wcywgY3B1KTsKICAgICBpZiAoIElTX0VSUihwcHJpdikg
KQogICAgICAgICByZXR1cm4gUFRSX0VSUihwcHJpdik7Ci0gICAgdnByaXYgPSBTQ0hFRF9PUChu
ZXdfb3BzLCBhbGxvY192ZGF0YSwgaWRsZSwgaWRsZS0+ZG9tYWluLT5zY2hlZF9wcml2KTsKKyAg
ICB2cHJpdiA9IHNjaGVkX2FsbG9jX3ZkYXRhKG5ld19vcHMsIGlkbGUsIGlkbGUtPmRvbWFpbi0+
c2NoZWRfcHJpdik7CiAgICAgaWYgKCB2cHJpdiA9PSBOVUxMICkKICAgICB7Ci0gICAgICAgIFND
SEVEX09QKG5ld19vcHMsIGZyZWVfcGRhdGEsIHBwcml2LCBjcHUpOworICAgICAgICBzY2hlZF9m
cmVlX3BkYXRhKG5ld19vcHMsIHBwcml2LCBjcHUpOwogICAgICAgICByZXR1cm4gLUVOT01FTTsK
ICAgICB9CiAKLSAgICBTQ0hFRF9PUChvbGRfb3BzLCB0aWNrX3N1c3BlbmQsIGNwdSk7CisgICAg
c2NoZWRfZG9fdGlja19zdXNwZW5kKG9sZF9vcHMsIGNwdSk7CiAKICAgICAvKgogICAgICAqIFRo
ZSBhY3R1YWwgc3dpdGNoLCBpbmNsdWRpbmcgKGlmIG5lY2Vzc2FyeSkgdGhlIHJlcm91dGluZyBv
ZiB0aGUKQEAgLTE4NzksMTcgKzE4NzEsMTcgQEAgaW50IHNjaGVkdWxlX2NwdV9zd2l0Y2godW5z
aWduZWQgaW50IGNwdSwgc3RydWN0IGNwdXBvb2wgKmMpCiAKICAgICB2cHJpdl9vbGQgPSBpZGxl
LT5zY2hlZF9wcml2OwogICAgIHBwcml2X29sZCA9IHBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1
KS5zY2hlZF9wcml2OwotICAgIFNDSEVEX09QKG5ld19vcHMsIHN3aXRjaF9zY2hlZCwgY3B1LCBw
cHJpdiwgdnByaXYpOworICAgIHNjaGVkX3N3aXRjaF9zY2hlZChuZXdfb3BzLCBjcHUsIHBwcml2
LCB2cHJpdik7CiAKICAgICAvKiBfTm90XyBwY3B1X3NjaGVkdWxlX3VubG9jaygpOiBzY2hlZHVs
ZV9sb2NrIG1heSBoYXZlIGNoYW5nZWQhICovCiAgICAgc3Bpbl91bmxvY2tfaXJxKG9sZF9sb2Nr
KTsKIAotICAgIFNDSEVEX09QKG5ld19vcHMsIHRpY2tfcmVzdW1lLCBjcHUpOworICAgIHNjaGVk
X2RvX3RpY2tfcmVzdW1lKG5ld19vcHMsIGNwdSk7CiAKLSAgICBTQ0hFRF9PUChvbGRfb3BzLCBk
ZWluaXRfcGRhdGEsIHBwcml2X29sZCwgY3B1KTsKKyAgICBzY2hlZF9kZWluaXRfcGRhdGEob2xk
X29wcywgcHByaXZfb2xkLCBjcHUpOwogCi0gICAgU0NIRURfT1Aob2xkX29wcywgZnJlZV92ZGF0
YSwgdnByaXZfb2xkKTsKLSAgICBTQ0hFRF9PUChvbGRfb3BzLCBmcmVlX3BkYXRhLCBwcHJpdl9v
bGQsIGNwdSk7CisgICAgc2NoZWRfZnJlZV92ZGF0YShvbGRfb3BzLCB2cHJpdl9vbGQpOworICAg
IHNjaGVkX2ZyZWVfcGRhdGEob2xkX29wcywgcHByaXZfb2xkLCBjcHUpOwogCiAgb3V0OgogICAg
IHBlcl9jcHUoY3B1cG9vbCwgY3B1KSA9IGM7CkBAIC0xOTIxLDcgKzE5MTMsNyBAQCBzdHJ1Y3Qg
c2NoZWR1bGVyICpzY2hlZHVsZXJfYWxsb2ModW5zaWduZWQgaW50IHNjaGVkX2lkLCBpbnQgKnBl
cnIpCiAgICAgaWYgKCAoc2NoZWQgPSB4bWFsbG9jKHN0cnVjdCBzY2hlZHVsZXIpKSA9PSBOVUxM
ICkKICAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgbWVtY3B5KHNjaGVkLCBzY2hlZHVsZXJzW2ld
LCBzaXplb2YoKnNjaGVkKSk7Ci0gICAgaWYgKCAoKnBlcnIgPSBTQ0hFRF9PUChzY2hlZCwgaW5p
dCkpICE9IDAgKQorICAgIGlmICggKCpwZXJyID0gc2NoZWRfaW5pdChzY2hlZCkpICE9IDAgKQog
ICAgIHsKICAgICAgICAgeGZyZWUoc2NoZWQpOwogICAgICAgICBzY2hlZCA9IE5VTEw7CkBAIC0x
OTMzLDcgKzE5MjUsNyBAQCBzdHJ1Y3Qgc2NoZWR1bGVyICpzY2hlZHVsZXJfYWxsb2ModW5zaWdu
ZWQgaW50IHNjaGVkX2lkLCBpbnQgKnBlcnIpCiB2b2lkIHNjaGVkdWxlcl9mcmVlKHN0cnVjdCBz
Y2hlZHVsZXIgKnNjaGVkKQogewogICAgIEJVR19PTihzY2hlZCA9PSAmb3BzKTsKLSAgICBTQ0hF
RF9PUChzY2hlZCwgZGVpbml0KTsKKyAgICBzY2hlZF9kZWluaXQoc2NoZWQpOwogICAgIHhmcmVl
KHNjaGVkKTsKIH0KIApAQCAtMTk1MCw3ICsxOTQyLDcgQEAgdm9pZCBzY2hlZHVsZV9kdW1wKHN0
cnVjdCBjcHVwb29sICpjKQogICAgICAgICBzY2hlZCA9IGMtPnNjaGVkOwogICAgICAgICBjcHVz
ID0gYy0+Y3B1X3ZhbGlkOwogICAgICAgICBwcmludGsoIlNjaGVkdWxlcjogJXMgKCVzKVxuIiwg
c2NoZWQtPm5hbWUsIHNjaGVkLT5vcHRfbmFtZSk7Ci0gICAgICAgIFNDSEVEX09QKHNjaGVkLCBk
dW1wX3NldHRpbmdzKTsKKyAgICAgICAgc2NoZWRfZHVtcF9zZXR0aW5ncyhzY2hlZCk7CiAgICAg
fQogICAgIGVsc2UKICAgICB7CkBAIC0xOTYyLDcgKzE5NTQsNyBAQCB2b2lkIHNjaGVkdWxlX2R1
bXAoc3RydWN0IGNwdXBvb2wgKmMpCiAgICAgewogICAgICAgICBwcmludGsoIkNQVXMgaW5mbzpc
biIpOwogICAgICAgICBmb3JfZWFjaF9jcHUgKGksIGNwdXMpCi0gICAgICAgICAgICBTQ0hFRF9P
UChzY2hlZCwgZHVtcF9jcHVfc3RhdGUsIGkpOworICAgICAgICAgICAgc2NoZWRfZHVtcF9jcHVf
c3RhdGUoc2NoZWQsIGkpOwogICAgIH0KIH0KIApAQCAtMTk3Miw3ICsxOTY0LDcgQEAgdm9pZCBz
Y2hlZF90aWNrX3N1c3BlbmQodm9pZCkKICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nl
c3Nvcl9pZCgpOwogCiAgICAgc2NoZWQgPSBwZXJfY3B1KHNjaGVkdWxlciwgY3B1KTsKLSAgICBT
Q0hFRF9PUChzY2hlZCwgdGlja19zdXNwZW5kLCBjcHUpOworICAgIHNjaGVkX2RvX3RpY2tfc3Vz
cGVuZChzY2hlZCwgY3B1KTsKICAgICByY3VfaWRsZV9lbnRlcihjcHUpOwogICAgIHJjdV9pZGxl
X3RpbWVyX3N0YXJ0KCk7CiB9CkBAIC0xOTg1LDcgKzE5NzcsNyBAQCB2b2lkIHNjaGVkX3RpY2tf
cmVzdW1lKHZvaWQpCiAgICAgcmN1X2lkbGVfdGltZXJfc3RvcCgpOwogICAgIHJjdV9pZGxlX2V4
aXQoY3B1KTsKICAgICBzY2hlZCA9IHBlcl9jcHUoc2NoZWR1bGVyLCBjcHUpOwotICAgIFNDSEVE
X09QKHNjaGVkLCB0aWNrX3Jlc3VtZSwgY3B1KTsKKyAgICBzY2hlZF9kb190aWNrX3Jlc3VtZShz
Y2hlZCwgY3B1KTsKIH0KIAogdm9pZCB3YWl0KHZvaWQpCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQtaWYuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCmluZGV4IDkyYmM3
YTAzNjUuLmIzYzNlMTg5ZDkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5o
CisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCkBAIC0xODUsMjYgKzE4NSwxNjggQEAg
c3RydWN0IHNjaGVkdWxlciB7CiAgICAgdm9pZCAgICAgICAgICgqdGlja19yZXN1bWUpICAgICAo
Y29uc3Qgc3RydWN0IHNjaGVkdWxlciAqLCB1bnNpZ25lZCBpbnQpOwogfTsKIAorc3RhdGljIGlu
bGluZSBpbnQgc2NoZWRfaW5pdChzdHJ1Y3Qgc2NoZWR1bGVyICpzKQoreworICAgIHJldHVybiBz
LT5pbml0KHMpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZGVpbml0KHN0cnVjdCBz
Y2hlZHVsZXIgKnMpCit7CisgICAgcy0+ZGVpbml0KHMpOworfQorCitzdGF0aWMgaW5saW5lIHZv
aWQgc2NoZWRfc3dpdGNoX3NjaGVkKHN0cnVjdCBzY2hlZHVsZXIgKnMsIHVuc2lnbmVkIGludCBj
cHUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnBkYXRhLCB2
b2lkICp2ZGF0YSkKK3sKKyAgICBzLT5zd2l0Y2hfc2NoZWQocywgY3B1LCBwZGF0YSwgdmRhdGEp
OworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZHVtcF9zZXR0aW5ncyhjb25zdCBzdHJ1
Y3Qgc2NoZWR1bGVyICpzKQoreworICAgIGlmICggcy0+ZHVtcF9zZXR0aW5ncyApCisgICAgICAg
IHMtPmR1bXBfc2V0dGluZ3Mocyk7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF9kdW1w
X2NwdV9zdGF0ZShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpzLCBpbnQgY3B1KQoreworICAgIGlm
ICggcy0+ZHVtcF9jcHVfc3RhdGUgKQorICAgICAgICBzLT5kdW1wX2NwdV9zdGF0ZShzLCBjcHUp
OworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZG9fdGlja19zdXNwZW5kKGNvbnN0IHN0
cnVjdCBzY2hlZHVsZXIgKnMsIGludCBjcHUpCit7CisgICAgaWYgKCBzLT50aWNrX3N1c3BlbmQg
KQorICAgICAgICBzLT50aWNrX3N1c3BlbmQocywgY3B1KTsKK30KKworc3RhdGljIGlubGluZSB2
b2lkIHNjaGVkX2RvX3RpY2tfcmVzdW1lKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKnMsIGludCBj
cHUpCit7CisgICAgaWYgKCBzLT50aWNrX3Jlc3VtZSApCisgICAgICAgIHMtPnRpY2tfcmVzdW1l
KHMsIGNwdSk7Cit9CisKIHN0YXRpYyBpbmxpbmUgdm9pZCAqc2NoZWRfYWxsb2NfZG9tZGF0YShj
b25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBkb21haW4gKmQpCiB7Ci0gICAgaWYgKCBzLT5hbGxvY19kb21kYXRh
ICkKLSAgICAgICAgcmV0dXJuIHMtPmFsbG9jX2RvbWRhdGEocywgZCk7Ci0gICAgZWxzZQotICAg
ICAgICByZXR1cm4gTlVMTDsKKyAgICByZXR1cm4gcy0+YWxsb2NfZG9tZGF0YSA/IHMtPmFsbG9j
X2RvbWRhdGEocywgZCkgOiBOVUxMOwogfQogCiBzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZnJl
ZV9kb21kYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKnMsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpCiB7CisgICAgQVNTRVJUKHMtPmZyZWVfZG9t
ZGF0YSB8fCAhZGF0YSk7CiAgICAgaWYgKCBzLT5mcmVlX2RvbWRhdGEgKQogICAgICAgICBzLT5m
cmVlX2RvbWRhdGEocywgZGF0YSk7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCAqc2NoZWRfYWxs
b2NfcGRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqcywgaW50IGNwdSkKK3sKKyAgICByZXR1
cm4gcy0+YWxsb2NfcGRhdGEgPyBzLT5hbGxvY19wZGF0YShzLCBjcHUpIDogTlVMTDsKK30KKwor
c3RhdGljIGlubGluZSB2b2lkIHNjaGVkX2ZyZWVfcGRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxl
ciAqcywgdm9pZCAqZGF0YSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCBjcHUpCit7CisgICAgQVNTRVJUKHMtPmZyZWVfcGRhdGEgfHwgIWRhdGEpOworICAgIGlmICgg
cy0+ZnJlZV9wZGF0YSApCisgICAgICAgIHMtPmZyZWVfcGRhdGEocywgZGF0YSwgY3B1KTsKK30K
Kworc3RhdGljIGlubGluZSB2b2lkIHNjaGVkX2luaXRfcGRhdGEoY29uc3Qgc3RydWN0IHNjaGVk
dWxlciAqcywgdm9pZCAqZGF0YSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGludCBjcHUpCit7CisgICAgaWYgKCBzLT5pbml0X3BkYXRhICkKKyAgICAgICAgcy0+aW5pdF9w
ZGF0YShzLCBkYXRhLCBjcHUpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZGVpbml0
X3BkYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKnMsIHZvaWQgKmRhdGEsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBjcHUpCit7CisgICAgaWYgKCBzLT5kZWlu
aXRfcGRhdGEgKQorICAgICAgICBzLT5kZWluaXRfcGRhdGEocywgZGF0YSwgY3B1KTsKK30KKwor
c3RhdGljIGlubGluZSB2b2lkICpzY2hlZF9hbGxvY192ZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1
bGVyICpzLCBzdHJ1Y3QgdmNwdSAqdiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdm9pZCAqZG9tX2RhdGEpCit7CisgICAgcmV0dXJuIHMtPmFsbG9jX3ZkYXRhKHMsIHYs
IGRvbV9kYXRhKTsKK30KKworc3RhdGljIGlubGluZSB2b2lkIHNjaGVkX2ZyZWVfdmRhdGEoY29u
c3Qgc3RydWN0IHNjaGVkdWxlciAqcywgdm9pZCAqZGF0YSkKK3sKKyAgICBzLT5mcmVlX3ZkYXRh
KHMsIGRhdGEpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfaW5zZXJ0X3ZjcHUoY29u
c3Qgc3RydWN0IHNjaGVkdWxlciAqcywgc3RydWN0IHZjcHUgKnYpCit7CisgICAgaWYgKCBzLT5p
bnNlcnRfdmNwdSApCisgICAgICAgIHMtPmluc2VydF92Y3B1KHMsIHYpOworfQorCitzdGF0aWMg
aW5saW5lIHZvaWQgc2NoZWRfcmVtb3ZlX3ZjcHUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqcywg
c3RydWN0IHZjcHUgKnYpCit7CisgICAgaWYgKCBzLT5yZW1vdmVfdmNwdSApCisgICAgICAgIHMt
PnJlbW92ZV92Y3B1KHMsIHYpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfc2xlZXAo
Y29uc3Qgc3RydWN0IHNjaGVkdWxlciAqcywgc3RydWN0IHZjcHUgKnYpCit7CisgICAgaWYgKCBz
LT5zbGVlcCApCisgICAgICAgIHMtPnNsZWVwKHMsIHYpOworfQorCitzdGF0aWMgaW5saW5lIHZv
aWQgc2NoZWRfd2FrZShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpzLCBzdHJ1Y3QgdmNwdSAqdikK
K3sKKyAgICBpZiAoIHMtPndha2UgKQorICAgICAgICBzLT53YWtlKHMsIHYpOworfQorCitzdGF0
aWMgaW5saW5lIHZvaWQgc2NoZWRfeWllbGQoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqcywgc3Ry
dWN0IHZjcHUgKnYpCit7CisgICAgaWYgKCBzLT55aWVsZCApCisgICAgICAgIHMtPnlpZWxkKHMs
IHYpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfY29udGV4dF9zYXZlZChjb25zdCBz
dHJ1Y3Qgc2NoZWR1bGVyICpzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IHZjcHUgKnYpCit7CisgICAgaWYgKCBzLT5jb250ZXh0X3NhdmVkICkKKyAgICAg
ICAgcy0+Y29udGV4dF9zYXZlZChzLCB2KTsKK30KKworc3RhdGljIGlubGluZSB2b2lkIHNjaGVk
X21pZ3JhdGUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqcywgc3RydWN0IHZjcHUgKnYsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgY3B1KQoreworICAgIGlm
ICggcy0+bWlncmF0ZSApCisgICAgICAgIHMtPm1pZ3JhdGUocywgdiwgY3B1KTsKICAgICBlbHNl
Ci0gICAgICAgIC8qCi0gICAgICAgICAqIENoZWNrIHRoYXQgaWYgdGhlcmUgaXNuJ3QgYSBmcmVl
X2RvbWRhdGEgaG9vaywgd2UgaGF2ZW4ndCBnb3QgYW55Ci0gICAgICAgICAqIGRhdGEgd2UncmUg
ZXhwZWN0ZWQgdG8gZGVhbCB3aXRoLgotICAgICAgICAgKi8KLSAgICAgICAgQVNTRVJUKCFkYXRh
KTsKKyAgICAgICAgdi0+cHJvY2Vzc29yID0gY3B1OworfQorCitzdGF0aWMgaW5saW5lIGludCBz
Y2hlZF9waWNrX2NwdShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpzLCBzdHJ1Y3QgdmNwdSAqdikK
K3sKKyAgICByZXR1cm4gcy0+cGlja19jcHUocywgdik7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9p
ZCBzY2hlZF9hZGp1c3RfYWZmaW5pdHkoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqcywKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZjcHUgKnYsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNwdW1hc2tfdCAqaGFy
ZCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY3B1bWFz
a190ICpzb2Z0KQoreworICAgIGlmICggcy0+YWRqdXN0X2FmZmluaXR5ICkKKyAgICAgICAgcy0+
YWRqdXN0X2FmZmluaXR5KHMsIHYsIGhhcmQsIHNvZnQpOworfQorCitzdGF0aWMgaW5saW5lIGlu
dCBzY2hlZF9hZGp1c3RfZG9tKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKnMsIHN0cnVjdCBkb21h
aW4gKmQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fZG9t
Y3RsX3NjaGVkdWxlcl9vcCAqb3ApCit7CisgICAgcmV0dXJuIHMtPmFkanVzdCA/IHMtPmFkanVz
dChzLCBkLCBvcCkgOiAwOworfQorCitzdGF0aWMgaW5saW5lIGludCBzY2hlZF9hZGp1c3RfY3B1
cG9vbChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpzLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHhlbl9zeXNjdGxfc2NoZWR1bGVyX29wICpvcCkKK3sKKyAg
ICByZXR1cm4gcy0+YWRqdXN0X2dsb2JhbCA/IHMtPmFkanVzdF9nbG9iYWwocywgb3ApIDogMDsK
IH0KIAogI2RlZmluZSBSRUdJU1RFUl9TQ0hFRFVMRVIoeCkgc3RhdGljIGNvbnN0IHN0cnVjdCBz
Y2hlZHVsZXIgKngjI19lbnRyeSBcCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
