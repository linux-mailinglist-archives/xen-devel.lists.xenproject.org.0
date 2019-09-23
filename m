Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C055BBA47
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 19:18:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCRwc-0006JH-Rr; Mon, 23 Sep 2019 17:16:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kgmz=XS=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iCQys-0000tB-2u
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 16:14:30 +0000
X-Inumbo-ID: 3710ed48-de1d-11e9-978d-bc764e2007e4
Received: from relay.sw.ru (unknown [185.231.240.75])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3710ed48-de1d-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 16:14:27 +0000 (UTC)
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQwy-0001Fp-8L; Mon, 23 Sep 2019 19:12:32 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Mon, 23 Sep 2019 19:12:23 +0300
Message-Id: <20190923161231.22028-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Sep 2019 17:16:12 +0000
Subject: [Xen-devel] [RFC v2 1/9] error: auto propagated local_err
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

SGVyZSBpcyBpbnRyb2R1Y2VkIEVSUlBfRlVOQ1RJT05fQkVHSU4gbWFjcm8sIHRvIGJlIHVzZWQg
YXQgc3RhcnQgb2YKYW55IGZ1bmN0aW9uIHdpdGggZXJycCBwYXJhbWV0ZXIuCgpJdCBoYXMgdGhy
ZWUgZ29hbHM6CgoxLiBGaXggaXNzdWUgd2l0aCBlcnJvcl9mYXRhbCAmIGVycm9yX2FwcGVuZF9o
aW50OiB1c2VyIGNhbid0IHNlZSB0aGVzZQpoaW50cywgYmVjYXVzZSBleGl0KCkgaGFwcGVucyBp
biBlcnJvcl9zZXRnIGVhcmxpZXIgdGhhbiBoaW50IGlzCmFwcGVuZGVkLiBbUmVwb3J0ZWQgYnkg
R3JlZyBLdXJ6XQoKMi4gRml4IGlzc3VlIHdpdGggZXJyb3JfYWJvcnQgJiBlcnJvcl9wcm9wYWdh
dGU6IHdoZW4gd2Ugd3JhcAplcnJvcl9hYm9ydCBieSBsb2NhbF9lcnIrZXJyb3JfcHJvcGFnYXRl
LCByZXN1bHRpbmcgY29yZWR1bXAgd2lsbApyZWZlciB0byBlcnJvcl9wcm9wYWdhdGUgYW5kIG5v
dCB0byB0aGUgcGxhY2Ugd2hlcmUgZXJyb3IgaGFwcGVuZWQuCih0aGUgbWFjcm8gaXRzZWxmIGRv
bid0IGZpeCB0aGUgaXNzdWUsIGJ1dCBpdCBhbGxvd3MgdG8gWzMuXSBkcm9wIGFsbApsb2NhbF9l
cnIrZXJyb3JfcHJvcGFnYXRlIHBhdHRlcm4sIHdoaWNoIHdpbGwgZGVmaW5pdGVseSBmaXggdGhl
IGlzc3VlKQpbUmVwb3J0ZWQgYnkgS2V2aW4gV29sZl0KCjMuIERyb3AgbG9jYWxfZXJyK2Vycm9y
X3Byb3BhZ2F0ZSBwYXR0ZXJuLCB3aGljaCBpcyB1c2VkIHRvIHdvcmthcm91bmQKdm9pZCBmdW5j
dGlvbnMgd2l0aCBlcnJwIHBhcmFtZXRlciwgd2hlbiBjYWxsZXIgd2FudHMgdG8ga25vdyByZXN1
bHRpbmcKc3RhdHVzLiAoTm90ZTogYWN0dWFsbHkgdGhlc2UgZnVuY3Rpb25zIHNob3VsZCBiZSBt
ZXJlbHkgdXBkYXRlZCB0bwpyZXR1cm4gaW50IGVycm9yIGNvZGUpLgoKU2lnbmVkLW9mZi1ieTog
VmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPgot
LS0KIGluY2x1ZGUvcWFwaS9lcnJvci5oIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL3FhcGkvZXJyb3IuaCBiL2luY2x1ZGUvcWFwaS9lcnJvci5oCmluZGV4IDNmOTUx
NDFhMDEuLmY2ZjRmYTBmYWMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvcWFwaS9lcnJvci5oCisrKyBi
L2luY2x1ZGUvcWFwaS9lcnJvci5oCkBAIC0zMjIsNiArMzIyLDQzIEBAIHZvaWQgZXJyb3Jfc2V0
X2ludGVybmFsKEVycm9yICoqZXJycCwKICAgICAgICAgICAgICAgICAgICAgICAgIEVycm9yQ2xh
c3MgZXJyX2NsYXNzLCBjb25zdCBjaGFyICpmbXQsIC4uLikKICAgICBHQ0NfRk1UX0FUVFIoNiwg
Nyk7CiAKK3R5cGVkZWYgc3RydWN0IEVycm9yUHJvcGFnYXRvciB7CisgICAgRXJyb3IgKmxvY2Fs
X2VycjsKKyAgICBFcnJvciAqKmVycnA7Cit9IEVycm9yUHJvcGFnYXRvcjsKKworc3RhdGljIGlu
bGluZSB2b2lkIGVycm9yX3Byb3BhZ2F0b3JfY2xlYW51cChFcnJvclByb3BhZ2F0b3IgKnByb3Ap
Cit7CisgICAgZXJyb3JfcHJvcGFnYXRlKHByb3AtPmVycnAsIHByb3AtPmxvY2FsX2Vycik7Cit9
CisKK0dfREVGSU5FX0FVVE9fQ0xFQU5VUF9DTEVBUl9GVU5DKEVycm9yUHJvcGFnYXRvciwgZXJy
b3JfcHJvcGFnYXRvcl9jbGVhbnVwKTsKKworLyoKKyAqIEVSUlBfRlVOQ1RJT05fQkVHSU4KKyAq
CisgKiBUaGlzIG1hY3JvIE1VU1QgYmUgdGhlIGZpcnN0IGxpbmUgb2YgRUFDSCBmdW5jdGlvbiB3
aXRoIEVycm9yICoqZXJycAorICogcGFyYW1ldGVyLgorICoKKyAqIElmIGVycnAgaXMgTlVMTCBv
ciBwb2ludHMgdG8gZXJyb3JfZmF0YWwsIGl0IGlzIHJld3JpdHRlbiB0byBwb2ludCB0bworICog
bG9jYWwgRXJyb3Igb2JqZWN0LCB3aGljaCB3aWxsIGJlIGF1dG9tYXRpY2FsbHkgcHJvcGFnYXRl
ZCB0byBvcmlnaW5hbAorICogZXJycCBvbiBmdW5jdGlvbiBleGl0IChzZWUgZXJyb3JfcHJvcGFn
YXRvcl9jbGVhbnVwKS4KKyAqCisgKiBBZnRlciBpbnZvY2F0aW9uIG9mIHRoaXMgbWFjcm8gaXQg
aXMgYWx3YXlzIHNhZmUgdG8gZGVyZWZlcmVuY2UgZXJycAorICogKGFzIGl0J3Mgbm90IE5VTEwg
YW55bW9yZSkgYW5kIHRvIGFwcGVuZCBoaW50IChieSBlcnJvcl9hcHBlbmRfaGludCkKKyAqIChh
cywgaWYgaXQgd2FzIGVycm9yX2ZhdGFsLCB3ZSBzd2FwcGVkIGl0IGJ5IGxvY2FsX2Vycm9yIHRv
IGJlCisgKiBwcm9wYWdhdGVkIG9uIGNsZWFudXApLgorICoKKyAqIE5vdGU6IHdlIGRvbid0IHdy
YXAgZXJyb3JfYWJvcnQgY2FzZSwgYXMgd2Ugd2FudCByZXN1bHRpbmcgY29yZWR1bXAKKyAqIHRv
IHBvaW50IHRvIHRoZSBwbGFjZSB3aGVyZSB0aGUgZXJyb3IgaGFwcGVuZWQsIG5vdCB0byBlcnJv
cl9wcm9wYWdhdGUuCisgKi8KKyNkZWZpbmUgRVJSUF9GVU5DVElPTl9CRUdJTigpIFwKK2dfYXV0
byhFcnJvclByb3BhZ2F0b3IpIF9fYXV0b19lcnJwX3Byb3AgPSB7LmVycnAgPSBlcnJwfTsgXAor
RXJyb3IgKipfX2xvY2FsX2VycnBfdW51c2VkIF9fYXR0cmlidXRlX18gKCh1bnVzZWQpKSA9IFwK
KyAgICAoZXJycCA9IChlcnJwID09IE5VTEwgfHwgKmVycnAgPT0gZXJyb3JfZmF0YWwgPyBcCisg
ICAgICAgICAgICAgJl9fYXV0b19lcnJwX3Byb3AubG9jYWxfZXJyIDogZXJycCkpCisKKwogLyoK
ICAqIFNwZWNpYWwgZXJyb3IgZGVzdGluYXRpb24gdG8gYWJvcnQgb24gZXJyb3IuCiAgKiBTZWUg
ZXJyb3Jfc2V0ZygpIGFuZCBlcnJvcl9wcm9wYWdhdGUoKSBmb3IgZGV0YWlscy4KLS0gCjIuMjEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
