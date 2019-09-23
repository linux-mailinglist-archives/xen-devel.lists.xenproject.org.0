Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C48BBA52
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 19:20:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCRwc-0006JB-I4; Mon, 23 Sep 2019 17:16:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kgmz=XS=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iCQyp-0000so-7R
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 16:14:27 +0000
X-Inumbo-ID: 362eadf2-de1d-11e9-9604-12813bfff9fa
Received: from relay.sw.ru (unknown [185.231.240.75])
 by localhost (Halon) with ESMTPS
 id 362eadf2-de1d-11e9-9604-12813bfff9fa;
 Mon, 23 Sep 2019 16:14:26 +0000 (UTC)
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQx0-0001Fp-Dl; Mon, 23 Sep 2019 19:12:34 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Mon, 23 Sep 2019 19:12:28 +0300
Message-Id: <20190923161231.22028-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Sep 2019 17:16:12 +0000
Subject: [Xen-devel] [RFC v2 6/9] scripts: add coccinelle script to use auto
 propagated errp
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
aXJ0dW96em8uY29tPgotLS0KIHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJy
cC5jb2NjaSB8IDgyICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4MiBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJv
cGFnYXRlZC1lcnJwLmNvY2NpCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8t
cHJvcGFnYXRlZC1lcnJwLmNvY2NpIGIvc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRl
ZC1lcnJwLmNvY2NpCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjFhM2Yw
MDZmMGIKLS0tIC9kZXYvbnVsbAorKysgYi9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdh
dGVkLWVycnAuY29jY2kKQEAgLTAsMCArMSw4MiBAQAorQEAKK2lkZW50aWZpZXIgZm47CitpZGVu
dGlmaWVyIGxvY2FsX2VycjsKK0BACisKKyBmbiguLi4sIEVycm9yICoqZXJycCkKKyB7CisrICAg
IEVSUlBfRlVOQ1RJT05fQkVHSU4oKTsKKyB9CisKK0BydWxlMUAKK2lkZW50aWZpZXIgZm47Citp
ZGVudGlmaWVyIGxvY2FsX2VycjsKK0BACisKKyBmbiguLi4sIEVycm9yICoqZXJycCkKKyB7Cisg
ICAgIDwuLi4KKy0gICAgRXJyb3IgKmxvY2FsX2VyciA9IE5VTEw7CisgICAgIC4uLj4KKyB9CisK
K0BACitpZGVudGlmaWVyIHJ1bGUxLmZuOworaWRlbnRpZmllciBydWxlMS5sb2NhbF9lcnI7Citp
ZGVudGlmaWVyIG91dDsKK0BACisKKyBmbiguLi4pCisgeworICAgICA8Li4uCistICAgIGdvdG8g
b3V0OworKyAgICByZXR1cm47CisgICAgIC4uLj4KKy0gb3V0OgorLSAgICBlcnJvcl9wcm9wYWdh
dGUoZXJycCwgbG9jYWxfZXJyKTsKKyB9CisKK0BACitpZGVudGlmaWVyIHJ1bGUxLmZuOworaWRl
bnRpZmllciBydWxlMS5sb2NhbF9lcnI7CitAQAorCisgZm4oLi4uKQorIHsKKyAgICAgPC4uLgor
KAorLSAgICBlcnJvcl9mcmVlKGxvY2FsX2Vycik7CistICAgIGxvY2FsX2VyciA9IE5VTEw7Cisr
ICAgIGVycm9yX2ZyZWVfZXJycChlcnJwKTsKK3wKKy0gICAgZXJyb3JfZnJlZShsb2NhbF9lcnIp
OworKyAgICBlcnJvcl9mcmVlX2VycnAoZXJycCk7Cit8CistICAgIGVycm9yX3JlcG9ydF9lcnIo
bG9jYWxfZXJyKTsKKysgICAgZXJyb3JfcmVwb3J0X2VycnAoZXJycCk7Cit8CistICAgIHdhcm5f
cmVwb3J0X2Vycihsb2NhbF9lcnIpOworKyAgICB3YXJuX3JlcG9ydF9lcnJwKGVycnApOworfAor
LSAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKTsKKykKKyAgICAgLi4uPgorIH0K
KworQEAKK2lkZW50aWZpZXIgcnVsZTEuZm47CitpZGVudGlmaWVyIHJ1bGUxLmxvY2FsX2VycjsK
K0BACisKKyBmbiguLi4pCisgeworICAgICA8Li4uCisoCistICAgICZsb2NhbF9lcnIKKysgICAg
ZXJycAorfAorLSAgICBsb2NhbF9lcnIKKysgICAgKmVycnAKKykKKyAgICAgLi4uPgorIH0KLS0g
CjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
