Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA66D4D16
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2019 07:00:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJ9Pq-0003L8-Mf; Sat, 12 Oct 2019 04:54:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LlWf=YE=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iIxT6-0001Vw-BR
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 16:08:40 +0000
X-Inumbo-ID: 62b4505c-ec41-11e9-933c-12813bfff9fa
Received: from relay.sw.ru (unknown [185.231.240.75])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62b4505c-ec41-11e9-933c-12813bfff9fa;
 Fri, 11 Oct 2019 16:08:39 +0000 (UTC)
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQb-0003XG-BC; Fri, 11 Oct 2019 19:06:05 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Oct 2019 19:04:10 +0300
Message-Id: <20191011160552.22907-25-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011160552.22907-1-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 12 Oct 2019 04:54:04 +0000
Subject: [Xen-devel] [RFC v5 024/126] error: auto propagated local_err
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

SGVyZSBpcyBpbnRyb2R1Y2VkIEVSUlBfQVVUT19QUk9QQUdBVEUgbWFjcm8sIHRvIGJlIHVzZWQg
YXQgc3RhcnQgb2YKZnVuY3Rpb25zIHdpdGggZXJycCBPVVQgcGFyYW1ldGVyLgoKSXQgaGFzIHRo
cmVlIGdvYWxzOgoKMS4gRml4IGlzc3VlIHdpdGggZXJyb3JfZmF0YWwgJiBlcnJvcl9wcmVwZW5k
L2Vycm9yX2FwcGVuZF9oaW50OiB1c2VyCmNhbid0IHNlZSB0aGlzIGFkZGl0aW9uYWwgaW5mb3Jt
YXRpb24sIGJlY2F1c2UgZXhpdCgpIGhhcHBlbnMgaW4KZXJyb3Jfc2V0ZyBlYXJsaWVyIHRoYW4g
aW5mb3JtYXRpb24gaXMgYWRkZWQuIFtSZXBvcnRlZCBieSBHcmVnIEt1cnpdCgoyLiBGaXggaXNz
dWUgd2l0aCBlcnJvcl9hYm9ydCAmIGVycm9yX3Byb3BhZ2F0ZTogd2hlbiB3ZSB3cmFwCmVycm9y
X2Fib3J0IGJ5IGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUsIHJlc3VsdGluZyBjb3JlZHVtcCB3
aWxsCnJlZmVyIHRvIGVycm9yX3Byb3BhZ2F0ZSBhbmQgbm90IHRvIHRoZSBwbGFjZSB3aGVyZSBl
cnJvciBoYXBwZW5lZC4KKHRoZSBtYWNybyBpdHNlbGYgZG9lc24ndCBmaXggdGhlIGlzc3VlLCBi
dXQgaXQgYWxsb3dzIHRvIFszLl0gZHJvcCBhbGwKbG9jYWxfZXJyK2Vycm9yX3Byb3BhZ2F0ZSBw
YXR0ZXJuLCB3aGljaCB3aWxsIGRlZmluaXRlbHkgZml4IHRoZSBpc3N1ZSkKW1JlcG9ydGVkIGJ5
IEtldmluIFdvbGZdCgozLiBEcm9wIGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUgcGF0dGVybiwg
d2hpY2ggaXMgdXNlZCB0byB3b3JrYXJvdW5kCnZvaWQgZnVuY3Rpb25zIHdpdGggZXJycCBwYXJh
bWV0ZXIsIHdoZW4gY2FsbGVyIHdhbnRzIHRvIGtub3cgcmVzdWx0aW5nCnN0YXR1cy4gKE5vdGU6
IGFjdHVhbGx5IHRoZXNlIGZ1bmN0aW9ucyBjb3VsZCBiZSBtZXJlbHkgdXBkYXRlZCB0bwpyZXR1
cm4gaW50IGVycm9yIGNvZGUpLgoKVG8gYWNoaWV2ZSB0aGVzZSBnb2Fscywgd2UgbmVlZCB0byBh
ZGQgaW52b2NhdGlvbiBvZiB0aGUgbWFjcm8gYXQgc3RhcnQKb2YgZnVuY3Rpb25zLCB3aGljaCBu
ZWVkcyBlcnJvcl9wcmVwZW5kL2Vycm9yX2FwcGVuZF9oaW50ICgxLik7IGFkZAppbnZvY2F0aW9u
IG9mIHRoZSBtYWNybyBhdCBzdGFydCBvZiBmdW5jdGlvbnMgd2hpY2ggZG8KbG9jYWxfZXJyK2Vy
cm9yX3Byb3BhZ2F0ZSBzY2VuYXJpbyB0aGUgY2hlY2sgZXJyb3JzLCBkcm9wIGxvY2FsIGVycm9y
cwpmcm9tIHRoZW0gYW5kIGp1c3QgdXNlICplcnJwIGluc3RlYWQgKDIuLCAzLikuCgpTaWduZWQt
b2ZmLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6
by5jb20+ClJldmlld2VkLWJ5OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KLS0tCgpD
QzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNDOiAiR29uZ2xlaSAoQXJlaSki
IDxhcmVpLmdvbmdsZWlAaHVhd2VpLmNvbT4KQ0M6IEVkdWFyZG8gSGFia29zdCA8ZWhhYmtvc3RA
cmVkaGF0LmNvbT4KQ0M6IElnb3IgTWFtbWVkb3YgPGltYW1tZWRvQHJlZGhhdC5jb20+CkNDOiBM
YXVyZW50IFZpdmllciA8bHZpdmllckByZWRoYXQuY29tPgpDQzogQW1pdCBTaGFoIDxhbWl0QGtl
cm5lbC5vcmc+CkNDOiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPgpDQzogTWF4IFJlaXR6
IDxtcmVpdHpAcmVkaGF0LmNvbT4KQ0M6IEpvaG4gU25vdyA8anNub3dAcmVkaGF0LmNvbT4KQ0M6
IEFyaSBTdW5kaG9sbSA8YXJpQHR1eGVyYS5jb20+CkNDOiBQYXZlbCBEb3ZnYWx5dWsgPHBhdmVs
LmRvdmdhbHVrQGlzcHJhcy5ydT4KQ0M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5j
b20+CkNDOiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+CkNDOiBGYW0gWmhl
bmcgPGZhbUBldXBob24ubmV0PgpDQzogU3RlZmFuIFdlaWwgPHN3QHdlaWxuZXR6LmRlPgpDQzog
Um9ubmllIFNhaGxiZXJnIDxyb25uaWVzYWhsYmVyZ0BnbWFpbC5jb20+CkNDOiBQZXRlciBMaWV2
ZW4gPHBsQGthbXAuZGU+CkNDOiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KQ0M6ICJE
ZW5pcyBWLiBMdW5ldiIgPGRlbkBvcGVudnoub3JnPgpDQzogTWFya3VzIEFybWJydXN0ZXIgPGFy
bWJydUByZWRoYXQuY29tPgpDQzogQWxiZXJ0byBHYXJjaWEgPGJlcnRvQGlnYWxpYS5jb20+CkND
OiBKYXNvbiBEaWxsYW1hbiA8ZGlsbGFtYW5AcmVkaGF0LmNvbT4KQ0M6IFdlbiBDb25neWFuZyA8
d2VuY29uZ3lhbmcyQGh1YXdlaS5jb20+CkNDOiBYaWUgQ2hhbmdsb25nIDx4aWVjaGFuZ2xvbmcu
ZEBnbWFpbC5jb20+CkNDOiBMaXUgWXVhbiA8bmFtZWkudW5peEBnbWFpbC5jb20+CkNDOiAiUmlj
aGFyZCBXLk0uIEpvbmVzIiA8cmpvbmVzQHJlZGhhdC5jb20+CkNDOiBKZWZmIENvZHkgPGNvZHlw
cmltZUBnbWFpbC5jb20+CkNDOiAiTWFyYy1BbmRyw6kgTHVyZWF1IiA8bWFyY2FuZHJlLmx1cmVh
dUByZWRoYXQuY29tPgpDQzogIkRhbmllbCBQLiBCZXJyYW5nw6kiIDxiZXJyYW5nZUByZWRoYXQu
Y29tPgpDQzogUmljaGFyZCBIZW5kZXJzb24gPHJ0aEB0d2lkZGxlLm5ldD4KQ0M6IEdyZWcgS3Vy
eiA8Z3JvdWdAa2FvZC5vcmc+CkNDOiAiTWljaGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhhdC5j
b20+CkNDOiBNYXJjZWwgQXBmZWxiYXVtIDxtYXJjZWwuYXBmZWxiYXVtQGdtYWlsLmNvbT4KQ0M6
IEJlbmlhbWlubyBHYWx2YW5pIDxiLmdhbHZhbmlAZ21haWwuY29tPgpDQzogUGV0ZXIgTWF5ZGVs
bCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgpDQzogIkPDqWRyaWMgTGUgR29hdGVyIiA8Y2xn
QGthb2Qub3JnPgpDQzogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4KQ0M6IEpvZWwg
U3RhbmxleSA8am9lbEBqbXMuaWQuYXU+CkNDOiBBbmRyZXcgQmF1bWFubiA8QW5kcmV3LkJhdW1h
bm5AbWljcm9zb2Z0LmNvbT4KQ0M6ICJQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSIgPHBoaWxtZEBy
ZWRoYXQuY29tPgpDQzogQW50b255IFBhdmxvdiA8YW50b255bnBhdmxvdkBnbWFpbC5jb20+CkND
OiBKZWFuLUNocmlzdG9waGUgRHVib2lzIDxqY2RAdHJpYnVkdWJvaXMubmV0PgpDQzogUGV0ZXIg
Q2h1YmIgPHBldGVyLmNodWJiQG5pY3RhLmNvbS5hdT4KQ0M6IFN1YmJhcmF5YSBTdW5kZWVwIDxz
dW5kZWVwLmxrbWxAZ21haWwuY29tPgpDQzogRXJpYyBBdWdlciA8ZXJpYy5hdWdlckByZWRoYXQu
Y29tPgpDQzogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJAYWxpc3RhaXIyMy5tZT4KQ0M6ICJF
ZGdhciBFLiBJZ2xlc2lhcyIgPGVkZ2FyLmlnbGVzaWFzQGdtYWlsLmNvbT4KQ0M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IEFudGhvbnkgUGVyYXJkIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgpDQzogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+
CkNDOiBQYXVsIEJ1cnRvbiA8cGJ1cnRvbkB3YXZlY29tcC5jb20+CkNDOiBBbGVrc2FuZGFyIFJp
a2FsbyA8YXJpa2Fsb0B3YXZlY29tcC5jb20+CkNDOiBDaHJpcyBXdWxmZiA8Y3J3dWxmZkBnbWFp
bC5jb20+CkNDOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KQ0M6IERhdmlkIEdpYnNvbiA8
ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1PgpDQzogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJl
ZGhhdC5jb20+CkNDOiBIYWxpbCBQYXNpYyA8cGFzaWNAbGludXguaWJtLmNvbT4KQ0M6IENocmlz
dGlhbiBCb3JudHJhZWdlciA8Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT4KQ0M6ICJIZXJ2w6kgUG91
c3NpbmVhdSIgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgpDQzogWGlhbyBHdWFuZ3JvbmcgPHhpYW9n
dWFuZ3JvbmcuZXJpY0BnbWFpbC5jb20+CkNDOiBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5AYXVy
ZWwzMi5uZXQ+CkNDOiBBbGVrc2FuZGFyIE1hcmtvdmljIDxhbWFya292aWNAd2F2ZWNvbXAuY29t
PgpDQzogTWFyayBDYXZlLUF5bGFuZCA8bWFyay5jYXZlLWF5bGFuZEBpbGFuZGUuY28udWs+CkND
OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgpDQzogTGFzemxvIEVyc2VrIDxsZXJz
ZWtAcmVkaGF0LmNvbT4KQ0M6IFl1dmFsIFNoYWlhIDx5dXZhbC5zaGFpYUBvcmFjbGUuY29tPgpD
QzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBzaWZpdmUuY29tPgpDQzogU2FnYXIgS2FyYW5kaWth
ciA8c2FnYXJrQGVlY3MuYmVya2VsZXkuZWR1PgpDQzogQmFzdGlhbiBLb3BwZWxtYW5uIDxrYmFz
dGlhbkBtYWlsLnVuaS1wYWRlcmJvcm4uZGU+CkNDOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4KQ0M6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPgpDQzogRXJpYyBG
YXJtYW4gPGZhcm1hbkBsaW51eC5pYm0uY29tPgpDQzogTWF0dGhldyBSb3NhdG8gPG1qcm9zYXRv
QGxpbnV4LmlibS5jb20+CkNDOiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5jb20+CkNDOiBN
aWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgpDQzogQXJ0eW9tIFRhcmFzZW5rbyA8YXRh
cjRxZW11QGdtYWlsLmNvbT4KQ0M6IFN0ZWZhbiBCZXJnZXIgPHN0ZWZhbmJAbGludXguaWJtLmNv
bT4KQ0M6IFNhbXVlbCBUaGliYXVsdCA8c2FtdWVsLnRoaWJhdWx0QGVucy1seW9uLm9yZz4KQ0M6
IEFsZXggV2lsbGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+CkNDOiBUb255IEty
b3dpYWsgPGFrcm93aWFrQGxpbnV4LmlibS5jb20+CkNDOiBQaWVycmUgTW9yZWwgPHBtb3JlbEBs
aW51eC5pYm0uY29tPgpDQzogTWljaGFlbCBSb3RoIDxtZHJvdGhAbGludXgudm5ldC5pYm0uY29t
PgpDQzogSGFpbGlhbmcgWmhhbmcgPHpoYW5nLnpoYW5naGFpbGlhbmdAaHVhd2VpLmNvbT4KQ0M6
IEp1YW4gUXVpbnRlbGEgPHF1aW50ZWxhQHJlZGhhdC5jb20+CkNDOiAiRHIuIERhdmlkIEFsYW4g
R2lsYmVydCIgPGRnaWxiZXJ0QHJlZGhhdC5jb20+CkNDOiBMdWlnaSBSaXp6byA8cml6em9AaWV0
LnVuaXBpLml0PgpDQzogR2l1c2VwcGUgTGV0dGllcmkgPGcubGV0dGllcmlAaWV0LnVuaXBpLml0
PgpDQzogVmluY2Vuem8gTWFmZmlvbmUgPHYubWFmZmlvbmVAZ21haWwuY29tPgpDQzogSmFuIEtp
c3prYSA8amFuLmtpc3prYUBzaWVtZW5zLmNvbT4KQ0M6IEFudGhvbnkgR3JlZW4gPGdyZWVuQG1v
eGllbG9naWMuY29tPgpDQzogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+CkNDOiBH
dWFuIFh1ZXRhbyA8Z3h0QG1wcmMucGt1LmVkdS5jbj4KQ0M6IE1heCBGaWxpcHBvdiA8amNtdmJr
YmNAZ21haWwuY29tPgpDQzogcWVtdS1ibG9ja0Bub25nbnUub3JnCkNDOiBpbnRlZ3JhdGlvbkBn
bHVzdGVyLm9yZwpDQzogc2hlZXBkb2dAbGlzdHMud3BrZy5vcmcKQ0M6IHFlbXUtYXJtQG5vbmdu
dS5vcmcKQ0M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpDQzogcWVtdS1wcGNAbm9u
Z251Lm9yZwpDQzogcWVtdS1zMzkweEBub25nbnUub3JnCkNDOiBxZW11LXJpc2N2QG5vbmdudS5v
cmcKCiBpbmNsdWRlL3FhcGkvZXJyb3IuaCB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvcWFwaS9lcnJvci5oIGIvaW5jbHVkZS9xYXBpL2Vycm9yLmgKaW5kZXggZDY4
OThkODMzYi4uNDcyMzhkOTA2NSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9xYXBpL2Vycm9yLmgKKysr
IGIvaW5jbHVkZS9xYXBpL2Vycm9yLmgKQEAgLTM0NSw2ICszNDUsNDQgQEAgdm9pZCBlcnJvcl9z
ZXRfaW50ZXJuYWwoRXJyb3IgKiplcnJwLAogICAgICAgICAgICAgICAgICAgICAgICAgRXJyb3JD
bGFzcyBlcnJfY2xhc3MsIGNvbnN0IGNoYXIgKmZtdCwgLi4uKQogICAgIEdDQ19GTVRfQVRUUig2
LCA3KTsKIAordHlwZWRlZiBzdHJ1Y3QgRXJyb3JQcm9wYWdhdG9yIHsKKyAgICBFcnJvciAqbG9j
YWxfZXJyOworICAgIEVycm9yICoqZXJycDsKK30gRXJyb3JQcm9wYWdhdG9yOworCitzdGF0aWMg
aW5saW5lIHZvaWQgZXJyb3JfcHJvcGFnYXRvcl9jbGVhbnVwKEVycm9yUHJvcGFnYXRvciAqcHJv
cCkKK3sKKyAgICBlcnJvcl9wcm9wYWdhdGUocHJvcC0+ZXJycCwgcHJvcC0+bG9jYWxfZXJyKTsK
K30KKworR19ERUZJTkVfQVVUT19DTEVBTlVQX0NMRUFSX0ZVTkMoRXJyb3JQcm9wYWdhdG9yLCBl
cnJvcl9wcm9wYWdhdG9yX2NsZWFudXApOworCisvKgorICogRVJSUF9BVVRPX1BST1BBR0FURQor
ICoKKyAqIFRoaXMgbWFjcm8gaXMgY3JlYXRlZCB0byBiZSB0aGUgZmlyc3QgbGluZSBvZiBhIGZ1
bmN0aW9uIHdpdGggRXJyb3IgKiplcnJwCisgKiBPVVQgcGFyYW1ldGVyLiBJdCdzIG5lZWRlZCBv
bmx5IGluIGNhc2VzIHdoZXJlIHdlIHdhbnQgdG8gdXNlIGVycm9yX3ByZXBlbmQsCisgKiBlcnJv
cl9hcHBlbmRfaGludCBvciBkZXJlZmVyZW5jZSAqZXJycC4gSXQncyBzdGlsbCBzYWZlIChidXQg
dXNlbGVzcykgaW4KKyAqIG90aGVyIGNhc2VzLgorICoKKyAqIElmIGVycnAgaXMgTlVMTCBvciBw
b2ludHMgdG8gZXJyb3JfZmF0YWwsIGl0IGlzIHJld3JpdHRlbiB0byBwb2ludCB0byBhCisgKiBs
b2NhbCBFcnJvciBvYmplY3QsIHdoaWNoIHdpbGwgYmUgYXV0b21hdGljYWxseSBwcm9wYWdhdGVk
IHRvIHRoZSBvcmlnaW5hbAorICogZXJycCBvbiBmdW5jdGlvbiBleGl0IChzZWUgZXJyb3JfcHJv
cGFnYXRvcl9jbGVhbnVwKS4KKyAqCisgKiBBZnRlciBpbnZvY2F0aW9uIG9mIHRoaXMgbWFjcm8g
aXQgaXMgYWx3YXlzIHNhZmUgdG8gZGVyZWZlcmVuY2UgZXJycAorICogKGFzIGl0J3Mgbm90IE5V
TEwgYW55bW9yZSkgYW5kIHRvIGFkZCBpbmZvcm1hdGlvbiAoYnkgZXJyb3JfcHJlcGVuZCBvcgor
ICogZXJyb3JfYXBwZW5kX2hpbnQpCisgKiAoYXMsIGlmIGl0IHdhcyBlcnJvcl9mYXRhbCwgd2Ug
c3dhcHBlZCBpdCB3aXRoIGEgbG9jYWxfZXJyb3IgdG8gYmUKKyAqIHByb3BhZ2F0ZWQgb24gY2xl
YW51cCkuCisgKgorICogTm90ZTogd2UgZG9uJ3Qgd3JhcCB0aGUgZXJyb3JfYWJvcnQgY2FzZSwg
YXMgd2Ugd2FudCByZXN1bHRpbmcgY29yZWR1bXAKKyAqIHRvIHBvaW50IHRvIHRoZSBwbGFjZSB3
aGVyZSB0aGUgZXJyb3IgaGFwcGVuZWQsIG5vdCB0byBlcnJvcl9wcm9wYWdhdGUuCisgKi8KKyNk
ZWZpbmUgRVJSUF9BVVRPX1BST1BBR0FURSgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKKyAgICBnX2F1dG8oRXJyb3JQcm9wYWdhdG9yKSBfYXV0b19lcnJwX3Byb3AgPSB7LmVy
cnAgPSBlcnJwfTsgIFwKKyAgICBlcnJwID0gKChlcnJwID09IE5VTEwgfHwgKmVycnAgPT0gZXJy
b3JfZmF0YWwpICAgICAgICAgICAgIFwKKyAgICAgICAgICAgID8gJl9hdXRvX2VycnBfcHJvcC5s
b2NhbF9lcnIgOiBlcnJwKQorCiAvKgogICogU3BlY2lhbCBlcnJvciBkZXN0aW5hdGlvbiB0byBh
Ym9ydCBvbiBlcnJvci4KICAqIFNlZSBlcnJvcl9zZXRnKCkgYW5kIGVycm9yX3Byb3BhZ2F0ZSgp
IGZvciBkZXRhaWxzLgotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
