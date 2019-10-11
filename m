Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DBAD4D12
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2019 06:58:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJ9Pq-0003L2-DW; Sat, 12 Oct 2019 04:54:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LlWf=YE=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iIxSw-0001Tg-V9
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 16:08:30 +0000
X-Inumbo-ID: 5cc167fc-ec41-11e9-8aca-bc764e2007e4
Received: from relay.sw.ru (unknown [185.231.240.75])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cc167fc-ec41-11e9-8aca-bc764e2007e4;
 Fri, 11 Oct 2019 16:08:29 +0000 (UTC)
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQb-0003XG-IB; Fri, 11 Oct 2019 19:06:05 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Oct 2019 19:04:11 +0300
Message-Id: <20191011160552.22907-26-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011160552.22907-1-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 12 Oct 2019 04:54:04 +0000
Subject: [Xen-devel] [RFC v5 025/126] scripts: add coccinelle script to use
 auto propagated errp
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
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>, Jeff Cody <codyprime@gmail.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Eric Blake <eblake@redhat.com>,
 Alberto Garcia <berto@igalia.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, qemu-block@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Anthony Green <green@moxielogic.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 vsementsov@virtuozzo.com, Andrew Jeffery <andrew@aj.id.au>,
 Chris Wulff <crwulff@gmail.com>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, sheepdog@lists.wpkg.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Thomas Huth <thuth@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 Hannes Reinecke <hare@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Ari Sundholm <ari@tuxera.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Jason Dillaman <dillaman@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 xen-devel@lists.xenproject.org, integration@gluster.org,
 Laszlo Ersek <lersek@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2
aXJ0dW96em8uY29tPgotLS0KCkNDOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4K
Q0M6ICJHb25nbGVpIChBcmVpKSIgPGFyZWkuZ29uZ2xlaUBodWF3ZWkuY29tPgpDQzogRWR1YXJk
byBIYWJrb3N0IDxlaGFia29zdEByZWRoYXQuY29tPgpDQzogSWdvciBNYW1tZWRvdiA8aW1hbW1l
ZG9AcmVkaGF0LmNvbT4KQ0M6IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJlZGhhdC5jb20+CkND
OiBBbWl0IFNoYWggPGFtaXRAa2VybmVsLm9yZz4KQ0M6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhh
dC5jb20+CkNDOiBNYXggUmVpdHogPG1yZWl0ekByZWRoYXQuY29tPgpDQzogSm9obiBTbm93IDxq
c25vd0ByZWRoYXQuY29tPgpDQzogQXJpIFN1bmRob2xtIDxhcmlAdHV4ZXJhLmNvbT4KQ0M6IFBh
dmVsIERvdmdhbHl1ayA8cGF2ZWwuZG92Z2FsdWtAaXNwcmFzLnJ1PgpDQzogUGFvbG8gQm9uemlu
aSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KQ0M6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVk
aGF0LmNvbT4KQ0M6IEZhbSBaaGVuZyA8ZmFtQGV1cGhvbi5uZXQ+CkNDOiBTdGVmYW4gV2VpbCA8
c3dAd2VpbG5ldHouZGU+CkNDOiBSb25uaWUgU2FobGJlcmcgPHJvbm5pZXNhaGxiZXJnQGdtYWls
LmNvbT4KQ0M6IFBldGVyIExpZXZlbiA8cGxAa2FtcC5kZT4KQ0M6IEVyaWMgQmxha2UgPGVibGFr
ZUByZWRoYXQuY29tPgpDQzogIkRlbmlzIFYuIEx1bmV2IiA8ZGVuQG9wZW52ei5vcmc+CkNDOiBN
YXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+CkNDOiBBbGJlcnRvIEdhcmNpYSA8
YmVydG9AaWdhbGlhLmNvbT4KQ0M6IEphc29uIERpbGxhbWFuIDxkaWxsYW1hbkByZWRoYXQuY29t
PgpDQzogV2VuIENvbmd5YW5nIDx3ZW5jb25neWFuZzJAaHVhd2VpLmNvbT4KQ0M6IFhpZSBDaGFu
Z2xvbmcgPHhpZWNoYW5nbG9uZy5kQGdtYWlsLmNvbT4KQ0M6IExpdSBZdWFuIDxuYW1laS51bml4
QGdtYWlsLmNvbT4KQ0M6ICJSaWNoYXJkIFcuTS4gSm9uZXMiIDxyam9uZXNAcmVkaGF0LmNvbT4K
Q0M6IEplZmYgQ29keSA8Y29keXByaW1lQGdtYWlsLmNvbT4KQ0M6ICJNYXJjLUFuZHLDqSBMdXJl
YXUiIDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+CkNDOiAiRGFuaWVsIFAuIEJlcnJhbmfD
qSIgPGJlcnJhbmdlQHJlZGhhdC5jb20+CkNDOiBSaWNoYXJkIEhlbmRlcnNvbiA8cnRoQHR3aWRk
bGUubmV0PgpDQzogR3JlZyBLdXJ6IDxncm91Z0BrYW9kLm9yZz4KQ0M6ICJNaWNoYWVsIFMuIFRz
aXJraW4iIDxtc3RAcmVkaGF0LmNvbT4KQ0M6IE1hcmNlbCBBcGZlbGJhdW0gPG1hcmNlbC5hcGZl
bGJhdW1AZ21haWwuY29tPgpDQzogQmVuaWFtaW5vIEdhbHZhbmkgPGIuZ2FsdmFuaUBnbWFpbC5j
b20+CkNDOiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+CkNDOiAiQ8Op
ZHJpYyBMZSBHb2F0ZXIiIDxjbGdAa2FvZC5vcmc+CkNDOiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3
QGFqLmlkLmF1PgpDQzogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KQ0M6IEFuZHJldyBC
YXVtYW5uIDxBbmRyZXcuQmF1bWFubkBtaWNyb3NvZnQuY29tPgpDQzogIlBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIiA8cGhpbG1kQHJlZGhhdC5jb20+CkNDOiBBbnRvbnkgUGF2bG92IDxhbnRvbnlu
cGF2bG92QGdtYWlsLmNvbT4KQ0M6IEplYW4tQ2hyaXN0b3BoZSBEdWJvaXMgPGpjZEB0cmlidWR1
Ym9pcy5uZXQ+CkNDOiBQZXRlciBDaHViYiA8cGV0ZXIuY2h1YmJAbmljdGEuY29tLmF1PgpDQzog
U3ViYmFyYXlhIFN1bmRlZXAgPHN1bmRlZXAubGttbEBnbWFpbC5jb20+CkNDOiBFcmljIEF1Z2Vy
IDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+CkNDOiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpckBh
bGlzdGFpcjIzLm1lPgpDQzogIkVkZ2FyIEUuIElnbGVzaWFzIiA8ZWRnYXIuaWdsZXNpYXNAZ21h
aWwuY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpD
QzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNDOiBQYXVsIER1
cnJhbnQgPHBhdWxAeGVuLm9yZz4KQ0M6IFBhdWwgQnVydG9uIDxwYnVydG9uQHdhdmVjb21wLmNv
bT4KQ0M6IEFsZWtzYW5kYXIgUmlrYWxvIDxhcmlrYWxvQHdhdmVjb21wLmNvbT4KQ0M6IENocmlz
IFd1bGZmIDxjcnd1bGZmQGdtYWlsLmNvbT4KQ0M6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRl
PgpDQzogRGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+CkNDOiBDb3Ju
ZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4KQ0M6IEhhbGlsIFBhc2ljIDxwYXNpY0BsaW51
eC5pYm0uY29tPgpDQzogQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIDxib3JudHJhZWdlckBkZS5pYm0u
Y29tPgpDQzogIkhlcnbDqSBQb3Vzc2luZWF1IiA8aHBvdXNzaW5AcmVhY3Rvcy5vcmc+CkNDOiBY
aWFvIEd1YW5ncm9uZyA8eGlhb2d1YW5ncm9uZy5lcmljQGdtYWlsLmNvbT4KQ0M6IEF1cmVsaWVu
IEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4KQ0M6IEFsZWtzYW5kYXIgTWFya292aWMgPGFt
YXJrb3ZpY0B3YXZlY29tcC5jb20+CkNDOiBNYXJrIENhdmUtQXlsYW5kIDxtYXJrLmNhdmUtYXls
YW5kQGlsYW5kZS5jby51az4KQ0M6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+CkND
OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgpDQzogWXV2YWwgU2hhaWEgPHl1dmFs
LnNoYWlhQG9yYWNsZS5jb20+CkNDOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHNpZml2ZS5jb20+
CkNDOiBTYWdhciBLYXJhbmRpa2FyIDxzYWdhcmtAZWVjcy5iZXJrZWxleS5lZHU+CkNDOiBCYXN0
aWFuIEtvcHBlbG1hbm4gPGtiYXN0aWFuQG1haWwudW5pLXBhZGVyYm9ybi5kZT4KQ0M6IERhdmlk
IEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgpDQzogVGhvbWFzIEh1dGggPHRodXRoQHJl
ZGhhdC5jb20+CkNDOiBFcmljIEZhcm1hbiA8ZmFybWFuQGxpbnV4LmlibS5jb20+CkNDOiBNYXR0
aGV3IFJvc2F0byA8bWpyb3NhdG9AbGludXguaWJtLmNvbT4KQ0M6IEhhbm5lcyBSZWluZWNrZSA8
aGFyZUBzdXNlLmNvbT4KQ0M6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+CkNDOiBB
cnR5b20gVGFyYXNlbmtvIDxhdGFyNHFlbXVAZ21haWwuY29tPgpDQzogU3RlZmFuIEJlcmdlciA8
c3RlZmFuYkBsaW51eC5pYm0uY29tPgpDQzogU2FtdWVsIFRoaWJhdWx0IDxzYW11ZWwudGhpYmF1
bHRAZW5zLWx5b24ub3JnPgpDQzogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVk
aGF0LmNvbT4KQ0M6IFRvbnkgS3Jvd2lhayA8YWtyb3dpYWtAbGludXguaWJtLmNvbT4KQ0M6IFBp
ZXJyZSBNb3JlbCA8cG1vcmVsQGxpbnV4LmlibS5jb20+CkNDOiBNaWNoYWVsIFJvdGggPG1kcm90
aEBsaW51eC52bmV0LmlibS5jb20+CkNDOiBIYWlsaWFuZyBaaGFuZyA8emhhbmcuemhhbmdoYWls
aWFuZ0BodWF3ZWkuY29tPgpDQzogSnVhbiBRdWludGVsYSA8cXVpbnRlbGFAcmVkaGF0LmNvbT4K
Q0M6ICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4KQ0M6IEx1
aWdpIFJpenpvIDxyaXp6b0BpZXQudW5pcGkuaXQ+CkNDOiBHaXVzZXBwZSBMZXR0aWVyaSA8Zy5s
ZXR0aWVyaUBpZXQudW5pcGkuaXQ+CkNDOiBWaW5jZW56byBNYWZmaW9uZSA8di5tYWZmaW9uZUBn
bWFpbC5jb20+CkNDOiBKYW4gS2lzemthIDxqYW4ua2lzemthQHNpZW1lbnMuY29tPgpDQzogQW50
aG9ueSBHcmVlbiA8Z3JlZW5AbW94aWVsb2dpYy5jb20+CkNDOiBTdGFmZm9yZCBIb3JuZSA8c2hv
cm5lQGdtYWlsLmNvbT4KQ0M6IEd1YW4gWHVldGFvIDxneHRAbXByYy5wa3UuZWR1LmNuPgpDQzog
TWF4IEZpbGlwcG92IDxqY212YmtiY0BnbWFpbC5jb20+CkNDOiBxZW11LWJsb2NrQG5vbmdudS5v
cmcKQ0M6IGludGVncmF0aW9uQGdsdXN0ZXIub3JnCkNDOiBzaGVlcGRvZ0BsaXN0cy53cGtnLm9y
ZwpDQzogcWVtdS1hcm1Abm9uZ251Lm9yZwpDQzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCkNDOiBxZW11LXBwY0Bub25nbnUub3JnCkNDOiBxZW11LXMzOTB4QG5vbmdudS5vcmcKQ0M6
IHFlbXUtcmlzY3ZAbm9uZ251Lm9yZwoKIHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0
ZWQtZXJycC5jb2NjaSB8IDExOCArKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
MTggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlwdHMvY29jY2luZWxsZS9h
dXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvY29jY2luZWxs
ZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaSBiL3NjcmlwdHMvY29jY2luZWxsZS9hdXRvLXBy
b3BhZ2F0ZWQtZXJycC5jb2NjaQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li5kOTczMTYyMGFhCi0tLSAvZGV2L251bGwKKysrIGIvc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8t
cHJvcGFnYXRlZC1lcnJwLmNvY2NpCkBAIC0wLDAgKzEsMTE4IEBACitAcnVsZTBACisvLyBBZGQg
aW52b2NhdGlvbiB0byBlcnJwLWZ1bmN0aW9ucyB3aGVyZSBuZWNlc3NhcnkKK2lkZW50aWZpZXIg
Zm4sIGxvY2FsX2VycjsKK3N5bWJvbCBlcnJwOworQEAKKworIGZuKC4uLiwgRXJyb3IgKiplcnJw
LCAuLi4pCisgeworKyAgIEVSUlBfQVVUT19QUk9QQUdBVEUoKTsKKyAgICA8Ky4uLgorKAorICAg
IGVycm9yX2FwcGVuZF9oaW50KGVycnAsIC4uLik7Cit8CisgICAgZXJyb3JfcHJlcGVuZChlcnJw
LCAuLi4pOworfAorICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOworKQorICAgIC4uLis+Cisg
fQorCitAQAorLy8gRHJvcCBkb3VibGVkIGludm9jYXRpb24KK2lkZW50aWZpZXIgcnVsZTAuZm47
CitAQAorCisgZm4oLi4uKQoreworLSAgIEVSUlBfQVVUT19QUk9QQUdBVEUoKTsKKyAgICBFUlJQ
X0FVVE9fUFJPUEFHQVRFKCk7CisgICAgLi4uCit9CisKK0BydWxlMUAKKy8vIERyb3AgbG9jYWxf
ZXJyCitpZGVudGlmaWVyIGZuLCBsb2NhbF9lcnI7CitzeW1ib2wgZXJycDsKK0BACisKKyBmbigu
Li4sIEVycm9yICoqZXJycCwgLi4uKQorIHsKKyAgICAgPC4uLgorLSAgICBFcnJvciAqbG9jYWxf
ZXJyID0gTlVMTDsKKyAgICAgLi4uPgorIH0KKworQEAKKy8vIEhhbmRsZSBwYXR0ZXJuIHdpdGgg
Z290bywgb3RoZXJ3aXNlIHdlJ2xsIGZpbmlzaCB1cAorLy8gd2l0aCBsYWJlbHMgYXQgZnVuY3Rp
b24gZW5kIHdoaWNoIHdpbGwgbm90IGNvbXBpbGUuCitpZGVudGlmaWVyIHJ1bGUxLmZuOworaWRl
bnRpZmllciBydWxlMS5sb2NhbF9lcnI7CitpZGVudGlmaWVyIE9VVDsKK0BACisKKyBmbiguLi4p
CisgeworICAgICA8Li4uCistICAgIGdvdG8gT1VUOworKyAgICByZXR1cm47CisgICAgIC4uLj4K
Ky0gT1VUOgorLSAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKTsKKyB9CisKK0BA
CitpZGVudGlmaWVyIHJ1bGUxLmZuOworaWRlbnRpZmllciBydWxlMS5sb2NhbF9lcnI7CitAQAor
CisgZm4oLi4uKQorIHsKKyAgICAgPC4uLgorKAorLSAgICBlcnJvcl9mcmVlKGxvY2FsX2Vycik7
CistICAgIGxvY2FsX2VyciA9IE5VTEw7CisrICAgIGVycm9yX2ZyZWVfZXJycChlcnJwKTsKK3wK
Ky0gICAgZXJyb3JfZnJlZShsb2NhbF9lcnIpOworKyAgICBlcnJvcl9mcmVlX2VycnAoZXJycCk7
Cit8CistICAgIGVycm9yX3JlcG9ydF9lcnIobG9jYWxfZXJyKTsKKysgICAgZXJyb3JfcmVwb3J0
X2VycnAoZXJycCk7Cit8CistICAgIHdhcm5fcmVwb3J0X2Vycihsb2NhbF9lcnIpOworKyAgICB3
YXJuX3JlcG9ydF9lcnJwKGVycnApOworfAorLSAgICBlcnJvcl9wcm9wYWdhdGVfcHJlcGVuZChl
cnJwLCBsb2NhbF9lcnIsCisrICAgIGVycm9yX3ByZXBlbmQoZXJycCwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC4uLik7Cit8CistICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2Nh
bF9lcnIpOworKQorICAgICAuLi4+CisgfQorCitAQAoraWRlbnRpZmllciBydWxlMS5mbjsKK2lk
ZW50aWZpZXIgcnVsZTEubG9jYWxfZXJyOworQEAKKworIGZuKC4uLikKKyB7CisgICAgIDwuLi4K
KygKKy0gICAgJmxvY2FsX2VycgorKyAgICBlcnJwCit8CistICAgIGxvY2FsX2VycgorKyAgICAq
ZXJycAorKQorICAgICAuLi4+CisgfQorCitAQAorc3ltYm9sIGVycnA7CitAQAorCistICplcnJw
ICE9IE5VTEwKKysgKmVycnAKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
