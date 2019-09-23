Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F82BBA4A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 19:18:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCRwe-0006Jf-3E; Mon, 23 Sep 2019 17:16:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kgmz=XS=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iCQz7-0000v9-2b
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 16:14:45 +0000
X-Inumbo-ID: 3b4c1298-de1d-11e9-978d-bc764e2007e4
Received: from relay.sw.ru (unknown [185.231.240.75])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b4c1298-de1d-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 16:14:34 +0000 (UTC)
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQwz-0001Fp-8w; Mon, 23 Sep 2019 19:12:33 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Mon, 23 Sep 2019 19:12:25 +0300
Message-Id: <20190923161231.22028-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Sep 2019 17:16:12 +0000
Subject: [Xen-devel] [RFC v2 3/9] errp: rename errp to errp_in where it is
 IN-argument
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
Cc: stefanha@redhat.com, codyprime@gmail.com, jan.kiszka@siemens.com,
 eblake@redhat.com, berto@igalia.com, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, pasic@linux.ibm.com,
 hpoussin@reactos.org, anthony.perard@citrix.com, samuel.thibault@ens-lyon.org,
 philmd@redhat.com, green@moxielogic.com, lvivier@redhat.com,
 ehabkost@redhat.com, xiechanglong.d@gmail.com, pl@kamp.de, dgilbert@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 ronniesahlberg@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 vsementsov@virtuozzo.com, andrew@aj.id.au, crwulff@gmail.com,
 sundeep.lkml@gmail.com, michael@walle.cc, qemu-ppc@nongnu.org,
 kbastian@mail.uni-paderborn.de, imammedo@redhat.com, fam@euphon.net,
 peter.maydell@linaro.org, sheepdog@lists.wpkg.org, david@redhat.com,
 palmer@sifive.com, thuth@redhat.com, jcmvbkbc@gmail.com, den@openvz.org,
 hare@suse.com, sstabellini@kernel.org, arei.gonglei@huawei.com,
 marcel.apfelbaum@gmail.com, namei.unix@gmail.com, atar4qemu@gmail.com,
 farman@linux.ibm.com, amit@kernel.org, sw@weilnetz.de, groug@kaod.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org, cohuck@redhat.com,
 amarkovic@wavecomp.com, aurelien@aurel32.net, pburton@wavecomp.com,
 sagark@eecs.berkeley.edu, jasowang@redhat.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, ari@tuxera.com,
 quintela@redhat.com, mdroth@linux.vnet.ibm.com, lersek@redhat.com,
 borntraeger@de.ibm.com, antonynpavlov@gmail.com, dillaman@redhat.com,
 joel@jms.id.au, xen-devel@lists.xenproject.org, integration@gluster.org,
 balrogg@gmail.com, rjones@redhat.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, mst@redhat.com,
 mark.cave-ayland@ilande.co.uk, v.maffione@gmail.com, marex@denx.de,
 armbru@redhat.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, pavel.dovgaluk@ispras.ru, g.lettieri@iet.unipi.it,
 rizzo@iet.unipi.it, david@gibson.dropbear.id.au, akrowiak@linux.ibm.com,
 berrange@redhat.com, xiaoguangrong.eric@gmail.com, pmorel@linux.ibm.com,
 wencongyang2@huawei.com, jcd@tribudubois.net, pbonzini@redhat.com,
 stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RXJyb3IgKiplcnJwIGlzIGFsbW9zdCBhbHdheXMgT1VULWFyZ3VtZW50OiBpdCdzIGFzc3VtZWQg
dG8gYmUgTlVMTCwgb3IKcG9pbnRlciB0byBOVUxMLWluaXRpYWxpemVkIHBvaW50ZXIsIG9yIHBv
aW50ZXIgdG8gZXJyb3JfYWJvcnQgb3IKZXJyb3JfZmF0YWwsIGZvciBjYWxsZWUgdG8gcmVwb3J0
IGVycm9yLgoKQnV0IHZlcnkgZmV3IGZ1bmN0aW9ucyAobW9zdCBvZiB0aGUgYXJlIGVycm9yIEFQ
SSkgaW5zdGVhZCBnZXQgRXJyb3IKKiplcnJwIGFzIElOLWFyZ3VtZW50OiBpdCdzIGFzc3VtZWQg
dG8gYmUgc2V0LCBhbmQgY2FsbGVlIHNob3VsZCBjbGVhbgppdC4gSW4gc3VjaCBjYXNlcywgcmVu
YW1lIGVycnAgdG8gZXJycF9pbi4KClNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIFNlbWVudHNvdi1P
Z2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4KLS0tCiBpbmNsdWRlL21vbml0b3Iv
aG1wLmggfCAgMiArLQogaW5jbHVkZS9xYXBpL2Vycm9yLmggIHwgIDggKysrKy0tLS0KIHVpL3Zu
Yy5oICAgICAgICAgICAgICB8ICAyICstCiBtb25pdG9yL2htcC1jbWRzLmMgICAgfCAgOCArKysr
LS0tLQogdWkvdm5jLmMgICAgICAgICAgICAgIHwgMTAgKysrKystLS0tLQogdXRpbC9lcnJvci5j
ICAgICAgICAgIHwgIDIgKy0KIDYgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTYg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9tb25pdG9yL2htcC5oIGIvaW5jbHVk
ZS9tb25pdG9yL2htcC5oCmluZGV4IGEwZTk1MTE0NDAuLmY5Mjk4MTRmMWEgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvbW9uaXRvci9obXAuaAorKysgYi9pbmNsdWRlL21vbml0b3IvaG1wLmgKQEAgLTE2
LDcgKzE2LDcgQEAKIAogI2luY2x1ZGUgInFlbXUvcmVhZGxpbmUuaCIKIAotdm9pZCBobXBfaGFu
ZGxlX2Vycm9yKE1vbml0b3IgKm1vbiwgRXJyb3IgKiplcnJwKTsKK3ZvaWQgaG1wX2hhbmRsZV9l
cnJvcihNb25pdG9yICptb24sIEVycm9yICoqZXJycF9pbik7CiAKIHZvaWQgaG1wX2luZm9fbmFt
ZShNb25pdG9yICptb24sIGNvbnN0IFFEaWN0ICpxZGljdCk7CiB2b2lkIGhtcF9pbmZvX3ZlcnNp
b24oTW9uaXRvciAqbW9uLCBjb25zdCBRRGljdCAqcWRpY3QpOwpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9xYXBpL2Vycm9yLmggYi9pbmNsdWRlL3FhcGkvZXJyb3IuaAppbmRleCA1NTEzODVhYTkxLi40
MjY0ZDIyMjIzIDEwMDY0NAotLS0gYS9pbmNsdWRlL3FhcGkvZXJyb3IuaAorKysgYi9pbmNsdWRl
L3FhcGkvZXJyb3IuaApAQCAtMjgzLDcgKzI4Myw3IEBAIHZvaWQgZXJyb3JfZnJlZShFcnJvciAq
ZXJyKTsKIC8qCiAgKiBDb252ZW5pZW5jZSBmdW5jdGlvbiB0byBhc3NlcnQgdGhhdCAqQGVycnAg
aXMgc2V0LCB0aGVuIHNpbGVudGx5IGZyZWUgaXQuCiAgKi8KLXZvaWQgZXJyb3JfZnJlZV9vcl9h
Ym9ydChFcnJvciAqKmVycnApOwordm9pZCBlcnJvcl9mcmVlX29yX2Fib3J0KEVycm9yICoqZXJy
cF9pbik7CiAKIC8qCiAgKiBDb252ZW5pZW5jZSBmdW5jdGlvbiB0byB3YXJuX3JlcG9ydCgpIGFu
ZCBmcmVlIEBlcnIuCkBAIC0zMDEsMTkgKzMwMSwxOSBAQCB2b2lkIGVycm9yX3JlcG9ydF9lcnIo
RXJyb3IgKmVycik7CiAgKiBGdW5jdGlvbnMgdG8gY2xlYW4gRXJyb3IgKiplcnJwOiBjYWxsIGNv
cnJlc3BvbmRpbmcgRXJyb3IgKmVyciBjbGVhbmluZwogICogZnVuY3Rpb24gYW4gc2V0IHBvaW50
ZXIgdG8gTlVMTAogICovCi1zdGF0aWMgaW5saW5lIHZvaWQgZXJyb3JfZnJlZV9lcnJwKEVycm9y
ICoqZXJycCkKK3N0YXRpYyBpbmxpbmUgdm9pZCBlcnJvcl9mcmVlX2VycnAoRXJyb3IgKiplcnJw
X2luKQogewogICAgIGVycm9yX2ZyZWUoKmVycnBfaW4pOwogICAgICplcnJwX2luID0gTlVMTDsK
IH0KIAotc3RhdGljIGlubGluZSB2b2lkIGVycm9yX3JlcG9ydF9lcnJwKEVycm9yICoqZXJycCkK
K3N0YXRpYyBpbmxpbmUgdm9pZCBlcnJvcl9yZXBvcnRfZXJycChFcnJvciAqKmVycnBfaW4pCiB7
CiAgICAgZXJyb3JfcmVwb3J0X2VycigqZXJycF9pbik7CiAgICAgKmVycnBfaW4gPSBOVUxMOwog
fQogCi1zdGF0aWMgaW5saW5lIHZvaWQgd2Fybl9yZXBvcnRfZXJycChFcnJvciAqKmVycnApCitz
dGF0aWMgaW5saW5lIHZvaWQgd2Fybl9yZXBvcnRfZXJycChFcnJvciAqKmVycnBfaW4pCiB7CiAg
ICAgd2Fybl9yZXBvcnRfZXJyKCplcnJwX2luKTsKICAgICAqZXJycF9pbiA9IE5VTEw7CmRpZmYg
LS1naXQgYS91aS92bmMuaCBiL3VpL3ZuYy5oCmluZGV4IGZlYTc5YzJmYzkuLjAwZTBiNDhmMmYg
MTAwNjQ0Ci0tLSBhL3VpL3ZuYy5oCisrKyBiL3VpL3ZuYy5oCkBAIC01NDcsNyArNTQ3LDcgQEAg
dWludDMyX3QgcmVhZF91MzIodWludDhfdCAqZGF0YSwgc2l6ZV90IG9mZnNldCk7CiAKIC8qIFBy
b3RvY29sIHN0YWdlIGZ1bmN0aW9ucyAqLwogdm9pZCB2bmNfY2xpZW50X2Vycm9yKFZuY1N0YXRl
ICp2cyk7Ci1zaXplX3Qgdm5jX2NsaWVudF9pb19lcnJvcihWbmNTdGF0ZSAqdnMsIHNzaXplX3Qg
cmV0LCBFcnJvciAqKmVycnApOworc2l6ZV90IHZuY19jbGllbnRfaW9fZXJyb3IoVm5jU3RhdGUg
KnZzLCBzc2l6ZV90IHJldCwgRXJyb3IgKiplcnJwX2luKTsKIAogdm9pZCBzdGFydF9jbGllbnRf
aW5pdChWbmNTdGF0ZSAqdnMpOwogdm9pZCBzdGFydF9hdXRoX3ZuYyhWbmNTdGF0ZSAqdnMpOwpk
aWZmIC0tZ2l0IGEvbW9uaXRvci9obXAtY21kcy5jIGIvbW9uaXRvci9obXAtY21kcy5jCmluZGV4
IGIyNTUxYzE2ZDEuLjk0MWQ1ZDBhNDUgMTAwNjQ0Ci0tLSBhL21vbml0b3IvaG1wLWNtZHMuYwor
KysgYi9tb25pdG9yL2htcC1jbWRzLmMKQEAgLTYwLDExICs2MCwxMSBAQAogI2luY2x1ZGUgPHNw
aWNlL2VudW1zLmg+CiAjZW5kaWYKIAotdm9pZCBobXBfaGFuZGxlX2Vycm9yKE1vbml0b3IgKm1v
biwgRXJyb3IgKiplcnJwKQordm9pZCBobXBfaGFuZGxlX2Vycm9yKE1vbml0b3IgKm1vbiwgRXJy
b3IgKiplcnJwX2luKQogewotICAgIGFzc2VydChlcnJwKTsKLSAgICBpZiAoKmVycnApIHsKLSAg
ICAgICAgZXJyb3JfcmVwb3J0Zl9lcnIoKmVycnAsICJFcnJvcjogIik7CisgICAgYXNzZXJ0KGVy
cnBfaW4pOworICAgIGlmICgqZXJycF9pbikgeworICAgICAgICBlcnJvcl9yZXBvcnRmX2Vycigq
ZXJycF9pbiwgIkVycm9yOiAiKTsKICAgICB9CiB9CiAKZGlmZiAtLWdpdCBhL3VpL3ZuYy5jIGIv
dWkvdm5jLmMKaW5kZXggODdiODA0NWFmZS4uOWQ2Mzg0ZDliMSAxMDA2NDQKLS0tIGEvdWkvdm5j
LmMKKysrIGIvdWkvdm5jLmMKQEAgLTEzMTIsNyArMTMxMiw3IEBAIHZvaWQgdm5jX2Rpc2Nvbm5l
Y3RfZmluaXNoKFZuY1N0YXRlICp2cykKICAgICBnX2ZyZWUodnMpOwogfQogCi1zaXplX3Qgdm5j
X2NsaWVudF9pb19lcnJvcihWbmNTdGF0ZSAqdnMsIHNzaXplX3QgcmV0LCBFcnJvciAqKmVycnAp
CitzaXplX3Qgdm5jX2NsaWVudF9pb19lcnJvcihWbmNTdGF0ZSAqdnMsIHNzaXplX3QgcmV0LCBF
cnJvciAqKmVycnBfaW4pCiB7CiAgICAgaWYgKHJldCA8PSAwKSB7CiAgICAgICAgIGlmIChyZXQg
PT0gMCkgewpAQCAtMTMyMCwxNCArMTMyMCwxNCBAQCBzaXplX3Qgdm5jX2NsaWVudF9pb19lcnJv
cihWbmNTdGF0ZSAqdnMsIHNzaXplX3QgcmV0LCBFcnJvciAqKmVycnApCiAgICAgICAgICAgICB2
bmNfZGlzY29ubmVjdF9zdGFydCh2cyk7CiAgICAgICAgIH0gZWxzZSBpZiAocmV0ICE9IFFJT19D
SEFOTkVMX0VSUl9CTE9DSykgewogICAgICAgICAgICAgdHJhY2Vfdm5jX2NsaWVudF9pb19lcnJv
cih2cywgdnMtPmlvYywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXJy
cCA/IGVycm9yX2dldF9wcmV0dHkoKmVycnApIDoKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZXJycF9pbiA/IGVycm9yX2dldF9wcmV0dHkoKmVycnBfaW4pIDoKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlVua25vd24iKTsKICAgICAgICAgICAg
IHZuY19kaXNjb25uZWN0X3N0YXJ0KHZzKTsKICAgICAgICAgfQogCi0gICAgICAgIGlmIChlcnJw
KSB7Ci0gICAgICAgICAgICBlcnJvcl9mcmVlKCplcnJwKTsKLSAgICAgICAgICAgICplcnJwID0g
TlVMTDsKKyAgICAgICAgaWYgKGVycnBfaW4pIHsKKyAgICAgICAgICAgIGVycm9yX2ZyZWUoKmVy
cnBfaW4pOworICAgICAgICAgICAgKmVycnBfaW4gPSBOVUxMOwogICAgICAgICB9CiAgICAgICAg
IHJldHVybiAwOwogICAgIH0KZGlmZiAtLWdpdCBhL3V0aWwvZXJyb3IuYyBiL3V0aWwvZXJyb3Iu
YwppbmRleCBkZmJhMDkxNzU3Li5iM2ZmMzgzMmQ2IDEwMDY0NAotLS0gYS91dGlsL2Vycm9yLmMK
KysrIGIvdXRpbC9lcnJvci5jCkBAIC0yNzEsNyArMjcxLDcgQEAgdm9pZCBlcnJvcl9mcmVlKEVy
cm9yICplcnIpCiAgICAgfQogfQogCi12b2lkIGVycm9yX2ZyZWVfb3JfYWJvcnQoRXJyb3IgKipl
cnJwKQordm9pZCBlcnJvcl9mcmVlX29yX2Fib3J0KEVycm9yICoqZXJycF9pbikKIHsKICAgICBh
c3NlcnQoZXJycF9pbiAmJiAqZXJycF9pbik7CiAgICAgZXJyb3JfZnJlZSgqZXJycF9pbik7Ci0t
IAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
