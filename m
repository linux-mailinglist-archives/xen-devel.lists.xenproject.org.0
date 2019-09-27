Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5026BFF91
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 09:03:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDkFb-0003An-So; Fri, 27 Sep 2019 07:01:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDkFa-00039L-2t
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 07:01:10 +0000
X-Inumbo-ID: 8ff6690e-e0f4-11e9-966c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 8ff6690e-e0f4-11e9-966c-12813bfff9fa;
 Fri, 27 Sep 2019 07:01:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09C2CB14F;
 Fri, 27 Sep 2019 07:00:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 09:00:16 +0200
Message-Id: <20190927070050.12405-13-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190927070050.12405-1-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 12/46] xen/sched: switch struct task_slice
 from vcpu to sched_unit
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

TGV0IHRoZSBzY2hlZHVsZXJzIHB1dCBhIHNjaGVkX3VuaXQgcG9pbnRlciBpbnRvIHN0cnVjdCB0
YXNrX3NsaWNlCmluc3RlYWQgb2YgYSB2Y3B1IHBvaW50ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8
ZGZhZ2dpb2xpQHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYyB8ICA4
ICsrKystLS0tCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jICAgfCAgNCArKy0tCiB4ZW4vY29t
bW9uL3NjaGVkX2NyZWRpdDIuYyAgfCAgNCArKy0tCiB4ZW4vY29tbW9uL3NjaGVkX251bGwuYyAg
ICAgfCAxMiArKysrKystLS0tLS0KIHhlbi9jb21tb24vc2NoZWRfcnQuYyAgICAgICB8ICAyICst
CiB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgICAgICAgfCAgNCArKy0tCiB4ZW4vaW5jbHVkZS94ZW4v
c2NoZWQtaWYuaCAgfCAgNiArKystLS0KIDcgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygr
KSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9hcmluYzY1
My5jIGIveGVuL2NvbW1vbi9zY2hlZF9hcmluYzY1My5jCmluZGV4IDVjZjQ3ZjU2MjIuLjlmZjFk
N2YyNDUgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYworKysgYi94ZW4v
Y29tbW9uL3NjaGVkX2FyaW5jNjUzLmMKQEAgLTU2MCw5ICs1NjAsOSBAQCBhNjUzc2NoZWRfZG9f
c2NoZWR1bGUoCiAKICAgICAvKgogICAgICAqIElmIHRoZXJlIGFyZSBtb3JlIGRvbWFpbnMgdG8g
cnVuIGluIHRoZSBjdXJyZW50IG1ham9yIGZyYW1lLCBzZXQKLSAgICAgKiBuZXdfdGFzayBlcXVh
bCB0byB0aGUgYWRkcmVzcyBvZiBuZXh0IGRvbWFpbidzIFZDUFUgc3RydWN0dXJlLgotICAgICAq
IE90aGVyd2lzZSwgc2V0IG5ld190YXNrIGVxdWFsIHRvIHRoZSBhZGRyZXNzIG9mIHRoZSBpZGxl
IHRhc2sncyBWQ1BVCi0gICAgICogc3RydWN0dXJlLgorICAgICAqIG5ld190YXNrIGVxdWFsIHRv
IHRoZSBhZGRyZXNzIG9mIG5leHQgZG9tYWluJ3Mgc2NoZWRfdW5pdCBzdHJ1Y3R1cmUuCisgICAg
ICogT3RoZXJ3aXNlLCBzZXQgbmV3X3Rhc2sgZXF1YWwgdG8gdGhlIGFkZHJlc3Mgb2YgdGhlIGlk
bGUgdGFzaydzCisgICAgICogc2NoZWRfdW5pdCBzdHJ1Y3R1cmUuCiAgICAgICovCiAgICAgbmV3
X3Rhc2sgPSAoc2NoZWRfaW5kZXggPCBzY2hlZF9wcml2LT5udW1fc2NoZWR1bGVfZW50cmllcykK
ICAgICAgICAgPyBzY2hlZF9wcml2LT5zY2hlZHVsZVtzY2hlZF9pbmRleF0udmMKQEAgLTU5OCw3
ICs1OTgsNyBAQCBhNjUzc2NoZWRfZG9fc2NoZWR1bGUoCiAgICAgICogb2YgdGhlIHNlbGVjdGVk
IHRhc2sncyBWQ1BVIHN0cnVjdHVyZS4KICAgICAgKi8KICAgICByZXQudGltZSA9IG5leHRfc3dp
dGNoX3RpbWUgLSBub3c7Ci0gICAgcmV0LnRhc2sgPSBuZXdfdGFzazsKKyAgICByZXQudGFzayA9
IG5ld190YXNrLT5zY2hlZF91bml0OwogICAgIHJldC5taWdyYXRlZCA9IDA7CiAKICAgICBCVUdf
T04ocmV0LnRpbWUgPD0gMCk7CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5j
IGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYwppbmRleCAzNTBmOTYzNmZhLi43MzJmZDQ2MWI1
IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jCisrKyBiL3hlbi9jb21tb24v
c2NoZWRfY3JlZGl0LmMKQEAgLTE5OTMsOSArMTk5Myw5IEBAIG91dDoKICAgICAgKi8KICAgICBy
ZXQudGltZSA9IChpc19pZGxlX3ZjcHUoc25leHQtPnZjcHUpID8KICAgICAgICAgICAgICAgICAt
MSA6IHRzbGljZSk7Ci0gICAgcmV0LnRhc2sgPSBzbmV4dC0+dmNwdTsKKyAgICByZXQudGFzayA9
IHNuZXh0LT52Y3B1LT5zY2hlZF91bml0OwogCi0gICAgQ1NDSEVEX1ZDUFVfQ0hFQ0socmV0LnRh
c2spOworICAgIENTQ0hFRF9WQ1BVX0NIRUNLKHJldC50YXNrLT52Y3B1X2xpc3QpOwogICAgIHJl
dHVybiByZXQ7CiB9CiAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jIGIv
eGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMKaW5kZXggN2IwODcyZWJhNS4uODg1N2M5OGRkOCAx
MDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMKKysrIGIveGVuL2NvbW1vbi9z
Y2hlZF9jcmVkaXQyLmMKQEAgLTM2MzcsOSArMzYzNyw5IEBAIGNzY2hlZDJfc2NoZWR1bGUoCiAg
ICAgICogUmV0dXJuIHRhc2sgdG8gcnVuIG5leHQuLi4KICAgICAgKi8KICAgICByZXQudGltZSA9
IGNzY2hlZDJfcnVudGltZShvcHMsIGNwdSwgc25leHQsIG5vdyk7Ci0gICAgcmV0LnRhc2sgPSBz
bmV4dC0+dmNwdTsKKyAgICByZXQudGFzayA9IHNuZXh0LT52Y3B1LT5zY2hlZF91bml0OwogCi0g
ICAgQ1NDSEVEMl9WQ1BVX0NIRUNLKHJldC50YXNrKTsKKyAgICBDU0NIRUQyX1ZDUFVfQ0hFQ0so
cmV0LnRhc2stPnZjcHVfbGlzdCk7CiAgICAgcmV0dXJuIHJldDsKIH0KIApkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9zY2hlZF9udWxsLmMgYi94ZW4vY29tbW9uL3NjaGVkX251bGwuYwppbmRleCAw
NmFjYWY5ZjkwLi4zZTZmOWY3MmUyIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX251bGwu
YworKysgYi94ZW4vY29tbW9uL3NjaGVkX251bGwuYwpAQCAtODE5LDEwICs4MTksMTAgQEAgc3Rh
dGljIHN0cnVjdCB0YXNrX3NsaWNlIG51bGxfc2NoZWR1bGUoY29uc3Qgc3RydWN0IHNjaGVkdWxl
ciAqb3BzLAogICAgIGlmICggdGFza2xldF93b3JrX3NjaGVkdWxlZCApCiAgICAgewogICAgICAg
ICB0cmFjZV92YXIoVFJDX1NOVUxMX1RBU0tMRVQsIDEsIDAsIE5VTEwpOwotICAgICAgICByZXQu
dGFzayA9IGlkbGVfdmNwdVtjcHVdOworICAgICAgICByZXQudGFzayA9IGlkbGVfdmNwdVtjcHVd
LT5zY2hlZF91bml0OwogICAgIH0KICAgICBlbHNlCi0gICAgICAgIHJldC50YXNrID0gcGVyX2Nw
dShucGMsIGNwdSkudmNwdTsKKyAgICAgICAgcmV0LnRhc2sgPSBwZXJfY3B1KG5wYywgY3B1KS52
Y3B1LT5zY2hlZF91bml0OwogICAgIHJldC5taWdyYXRlZCA9IDA7CiAgICAgcmV0LnRpbWUgPSAt
MTsKIApAQCAtODU3LDcgKzg1Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgdGFza19zbGljZSBudWxsX3Nj
aGVkdWxlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywKICAgICAgICAgICAgICAgICB7CiAg
ICAgICAgICAgICAgICAgICAgIHZjcHVfYXNzaWduKHBydiwgd3ZjLT52Y3B1LCBjcHUpOwogICAg
ICAgICAgICAgICAgICAgICBsaXN0X2RlbF9pbml0KCZ3dmMtPndhaXRxX2VsZW0pOwotICAgICAg
ICAgICAgICAgICAgICByZXQudGFzayA9IHd2Yy0+dmNwdTsKKyAgICAgICAgICAgICAgICAgICAg
cmV0LnRhc2sgPSB3dmMtPnZjcHUtPnNjaGVkX3VuaXQ7CiAgICAgICAgICAgICAgICAgICAgIGdv
dG8gdW5sb2NrOwogICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgIH0KQEAgLTg2OSwxMCAr
ODY5LDEwIEBAIHN0YXRpYyBzdHJ1Y3QgdGFza19zbGljZSBudWxsX3NjaGVkdWxlKGNvbnN0IHN0
cnVjdCBzY2hlZHVsZXIgKm9wcywKICAgICAgICAgICAgIGNwdW1hc2tfc2V0X2NwdShjcHUsICZw
cnYtPmNwdXNfZnJlZSk7CiAgICAgfQogCi0gICAgaWYgKCB1bmxpa2VseShyZXQudGFzayA9PSBO
VUxMIHx8ICF2Y3B1X3J1bm5hYmxlKHJldC50YXNrKSkgKQotICAgICAgICByZXQudGFzayA9IGlk
bGVfdmNwdVtjcHVdOworICAgIGlmICggdW5saWtlbHkocmV0LnRhc2sgPT0gTlVMTCB8fCAhdW5p
dF9ydW5uYWJsZShyZXQudGFzaykpICkKKyAgICAgICAgcmV0LnRhc2sgPSBpZGxlX3ZjcHVbY3B1
XS0+c2NoZWRfdW5pdDsKIAotICAgIE5VTExfVkNQVV9DSEVDSyhyZXQudGFzayk7CisgICAgTlVM
TF9WQ1BVX0NIRUNLKHJldC50YXNrLT52Y3B1X2xpc3QpOwogICAgIHJldHVybiByZXQ7CiB9CiAK
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfcnQuYyBiL3hlbi9jb21tb24vc2NoZWRfcnQu
YwppbmRleCAzZmJlOGRhZDhkLi44NTZlYWUxZmFhIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3Nj
aGVkX3J0LmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9ydC5jCkBAIC0xMTI5LDcgKzExMjksNyBA
QCBydF9zY2hlZHVsZShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHNfdGltZV90IG5vdywg
Ym9vbF90IHRhc2tsZXRfd29ya19zY2hlZAogICAgICAgICB9CiAgICAgICAgIHJldC50aW1lID0g
c25leHQtPmN1cl9idWRnZXQ7IC8qIGludm9rZSB0aGUgc2NoZWR1bGVyIG5leHQgdGltZSAqLwog
ICAgIH0KLSAgICByZXQudGFzayA9IHNuZXh0LT52Y3B1OworICAgIHJldC50YXNrID0gc25leHQt
PnZjcHUtPnNjaGVkX3VuaXQ7CiAKICAgICByZXR1cm4gcmV0OwogfQpkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDZkMjdjMmY0
YTUuLjE1N2I5MWM0MzkgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94
ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAgLTExNSw3ICsxMTUsNyBAQCBzdGF0aWMgc3RydWN0IHRh
c2tfc2xpY2Ugc2NoZWRfaWRsZV9zY2hlZHVsZSgKICAgICBjb25zdCB1bnNpZ25lZCBpbnQgY3B1
ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwogICAgIHN0cnVjdCB0YXNrX3NsaWNlIHJldCA9IHsgLnRp
bWUgPSAtMSB9OwogCi0gICAgcmV0LnRhc2sgPSBpZGxlX3ZjcHVbY3B1XTsKKyAgICByZXQudGFz
ayA9IHNjaGVkX2lkbGVfdW5pdChjcHUpOwogICAgIHJldHVybiByZXQ7CiB9CiAKQEAgLTE2Mjcs
NyArMTYyNyw3IEBAIHN0YXRpYyB2b2lkIHNjaGVkdWxlKHZvaWQpCiAgICAgc2NoZWQgPSB0aGlz
X2NwdShzY2hlZHVsZXIpOwogICAgIG5leHRfc2xpY2UgPSBzY2hlZC0+ZG9fc2NoZWR1bGUoc2No
ZWQsIG5vdywgdGFza2xldF93b3JrX3NjaGVkdWxlZCk7CiAKLSAgICBuZXh0ID0gbmV4dF9zbGlj
ZS50YXNrOworICAgIG5leHQgPSBuZXh0X3NsaWNlLnRhc2stPnZjcHVfbGlzdDsKIAogICAgIHNk
LT5jdXJyID0gbmV4dC0+c2NoZWRfdW5pdDsKIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAppbmRleCAwNTg3YThkM2Qy
Li4yYjlkNTBiOWZlIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAorKysg
Yi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaApAQCAtMjI2LDkgKzIyNiw5IEBAIHN0YXRpYyBp
bmxpbmUgc3BpbmxvY2tfdCAqcGNwdV9zY2hlZHVsZV90cnlsb2NrKHVuc2lnbmVkIGludCBjcHUp
CiB9CiAKIHN0cnVjdCB0YXNrX3NsaWNlIHsKLSAgICBzdHJ1Y3QgdmNwdSAqdGFzazsKLSAgICBz
X3RpbWVfdCAgICAgdGltZTsKLSAgICBib29sX3QgICAgICAgbWlncmF0ZWQ7CisgICAgc3RydWN0
IHNjaGVkX3VuaXQgKnRhc2s7CisgICAgc190aW1lX3QgICAgICAgICAgIHRpbWU7CisgICAgYm9v
bF90ICAgICAgICAgICAgIG1pZ3JhdGVkOwogfTsKIAogc3RydWN0IHNjaGVkdWxlciB7Ci0tIAoy
LjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
