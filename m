Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3655BBA4E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 19:19:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCRwd-0006JN-5T; Mon, 23 Sep 2019 17:16:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kgmz=XS=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iCQyu-0000tU-5q
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 16:14:32 +0000
X-Inumbo-ID: 35d6c2e0-de1d-11e9-9604-12813bfff9fa
Received: from relay.sw.ru (unknown [185.231.240.75])
 by localhost (Halon) with ESMTPS
 id 35d6c2e0-de1d-11e9-9604-12813bfff9fa;
 Mon, 23 Sep 2019 16:14:25 +0000 (UTC)
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQwz-0001Fp-Os; Mon, 23 Sep 2019 19:12:33 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Mon, 23 Sep 2019 19:12:26 +0300
Message-Id: <20190923161231.22028-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Sep 2019 17:16:12 +0000
Subject: [Xen-devel] [RFC v2 4/9] hw/core/loader-fit: fix freeing errp in
 fit_load_fdt
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

Zml0X2xvYWRfZmR0IGZvcmdldCB0byB6ZXJvIGVycnAuIEZpeCBpdC4KClNpZ25lZC1vZmYtYnk6
IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4K
LS0tCiBody9jb3JlL2xvYWRlci1maXQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2h3L2NvcmUvbG9hZGVyLWZpdC5j
IGIvaHcvY29yZS9sb2FkZXItZml0LmMKaW5kZXggOTUzYjE2YmM4Mi4uZmU1YmNjNjcwMCAxMDA2
NDQKLS0tIGEvaHcvY29yZS9sb2FkZXItZml0LmMKKysrIGIvaHcvY29yZS9sb2FkZXItZml0LmMK
QEAgLTIwMCw3ICsyMDAsNyBAQCBzdGF0aWMgaW50IGZpdF9sb2FkX2ZkdChjb25zdCBzdHJ1Y3Qg
Zml0X2xvYWRlciAqbGRyLCBjb25zdCB2b2lkICppdGIsCiAgICAgZXJyID0gZml0X2ltYWdlX2Fk
ZHIoaXRiLCBpbWdfb2ZmLCAibG9hZCIsICZsb2FkX2FkZHIsIGVycnApOwogICAgIGlmIChlcnIg
PT0gLUVOT0VOVCkgewogICAgICAgICBsb2FkX2FkZHIgPSBST1VORF9VUChrZXJuZWxfZW5kLCA2
NCAqIEtpQikgKyAoMTAgKiBNaUIpOwotICAgICAgICBlcnJvcl9mcmVlKCplcnJwKTsKKyAgICAg
ICAgZXJyb3JfZnJlZV9lcnJwKGVycnApOwogICAgIH0gZWxzZSBpZiAoZXJyKSB7CiAgICAgICAg
IGVycm9yX3ByZXBlbmQoZXJycCwgInVuYWJsZSB0byByZWFkIEZEVCBsb2FkIGFkZHJlc3MgZnJv
bSBGSVQ6ICIpOwogICAgICAgICByZXQgPSBlcnI7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
