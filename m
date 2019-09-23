Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 528F9BBA50
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 19:20:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCRwd-0006JZ-Q7; Mon, 23 Sep 2019 17:16:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kgmz=XS=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iCQz2-0000uf-29
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 16:14:40 +0000
X-Inumbo-ID: 39915c10-de1d-11e9-b299-bc764e2007e4
Received: from relay.sw.ru (unknown [185.231.240.75])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39915c10-de1d-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 16:14:32 +0000 (UTC)
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQwy-0001Fp-Od; Mon, 23 Sep 2019 19:12:32 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Mon, 23 Sep 2019 19:12:24 +0300
Message-Id: <20190923161231.22028-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Sep 2019 17:16:12 +0000
Subject: [Xen-devel] [RFC v2 2/9] qapi/error: add (Error **errp) cleaning
 APIs
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

U2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2
aXJ0dW96em8uY29tPgotLS0KIGluY2x1ZGUvcWFwaS9lcnJvci5oIHwgMjIgKysrKysrKysrKysr
KysrKysrKysrKwogdXRpbC9lcnJvci5jICAgICAgICAgfCAgNiArKystLS0KIDIgZmlsZXMgY2hh
bmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL3FhcGkvZXJyb3IuaCBiL2luY2x1ZGUvcWFwaS9lcnJvci5oCmluZGV4IGY2ZjRmYTBmYWMu
LjU1MTM4NWFhOTEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvcWFwaS9lcnJvci5oCisrKyBiL2luY2x1
ZGUvcWFwaS9lcnJvci5oCkBAIC0yOTcsNiArMjk3LDI4IEBAIHZvaWQgd2Fybl9yZXBvcnRfZXJy
KEVycm9yICplcnIpOwogICovCiB2b2lkIGVycm9yX3JlcG9ydF9lcnIoRXJyb3IgKmVycik7CiAK
Ky8qCisgKiBGdW5jdGlvbnMgdG8gY2xlYW4gRXJyb3IgKiplcnJwOiBjYWxsIGNvcnJlc3BvbmRp
bmcgRXJyb3IgKmVyciBjbGVhbmluZworICogZnVuY3Rpb24gYW4gc2V0IHBvaW50ZXIgdG8gTlVM
TAorICovCitzdGF0aWMgaW5saW5lIHZvaWQgZXJyb3JfZnJlZV9lcnJwKEVycm9yICoqZXJycCkK
K3sKKyAgICBlcnJvcl9mcmVlKCplcnJwX2luKTsKKyAgICAqZXJycF9pbiA9IE5VTEw7Cit9CisK
K3N0YXRpYyBpbmxpbmUgdm9pZCBlcnJvcl9yZXBvcnRfZXJycChFcnJvciAqKmVycnApCit7Cisg
ICAgZXJyb3JfcmVwb3J0X2VycigqZXJycF9pbik7CisgICAgKmVycnBfaW4gPSBOVUxMOworfQor
CitzdGF0aWMgaW5saW5lIHZvaWQgd2Fybl9yZXBvcnRfZXJycChFcnJvciAqKmVycnApCit7Cisg
ICAgd2Fybl9yZXBvcnRfZXJyKCplcnJwX2luKTsKKyAgICAqZXJycF9pbiA9IE5VTEw7Cit9CisK
IC8qCiAgKiBDb252ZW5pZW5jZSBmdW5jdGlvbiB0byBlcnJvcl9wcmVwZW5kKCksIHdhcm5fcmVw
b3J0KCkgYW5kIGZyZWUgQGVyci4KICAqLwpkaWZmIC0tZ2l0IGEvdXRpbC9lcnJvci5jIGIvdXRp
bC9lcnJvci5jCmluZGV4IGQ0NTMyY2UzMTguLmRmYmEwOTE3NTcgMTAwNjQ0Ci0tLSBhL3V0aWwv
ZXJyb3IuYworKysgYi91dGlsL2Vycm9yLmMKQEAgLTI3Myw5ICsyNzMsOSBAQCB2b2lkIGVycm9y
X2ZyZWUoRXJyb3IgKmVycikKIAogdm9pZCBlcnJvcl9mcmVlX29yX2Fib3J0KEVycm9yICoqZXJy
cCkKIHsKLSAgICBhc3NlcnQoZXJycCAmJiAqZXJycCk7Ci0gICAgZXJyb3JfZnJlZSgqZXJycCk7
Ci0gICAgKmVycnAgPSBOVUxMOworICAgIGFzc2VydChlcnJwX2luICYmICplcnJwX2luKTsKKyAg
ICBlcnJvcl9mcmVlKCplcnJwX2luKTsKKyAgICAqZXJycF9pbiA9IE5VTEw7CiB9CiAKIHZvaWQg
ZXJyb3JfcHJvcGFnYXRlKEVycm9yICoqZHN0X2VycnAsIEVycm9yICpsb2NhbF9lcnIpCi0tIAoy
LjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
