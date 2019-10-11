Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55AFD4D18
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2019 07:01:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJ9Pr-0003LK-8s; Sat, 12 Oct 2019 04:54:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OAML=YE=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1iIyTn-0000Yj-CA
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 17:13:27 +0000
X-Inumbo-ID: 6fed5468-ec4a-11e9-a531-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fed5468-ec4a-11e9-a531-bc764e2007e4;
 Fri, 11 Oct 2019 17:13:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AA36E5946B;
 Fri, 11 Oct 2019 17:13:24 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F02B560923;
 Fri, 11 Oct 2019 17:12:49 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-26-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5dd4d642-7ea6-42a2-66fc-6d6710b77b8d@redhat.com>
Date: Fri, 11 Oct 2019 12:12:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191011160552.22907-26-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 11 Oct 2019 17:13:25 +0000 (UTC)
X-Mailman-Approved-At: Sat, 12 Oct 2019 04:54:04 +0000
Subject: Re: [Xen-devel] [RFC v5 025/126] scripts: add coccinelle script to
 use auto propagated errp
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Alberto Garcia <berto@igalia.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, qemu-block@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Anthony Green <green@moxielogic.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
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
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
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
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTEvMTkgMTE6MDQgQU0sIFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgd3JvdGU6
Cj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNv
dkB2aXJ0dW96em8uY29tPgo+IC0tLQo+IAoKPiAgIHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXBy
b3BhZ2F0ZWQtZXJycC5jb2NjaSB8IDExOCArKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxMTggaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlwdHMv
Y29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaQo+IAo+IGRpZmYgLS1naXQgYS9z
Y3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgYi9zY3JpcHRzL2Nv
Y2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAuLmQ5NzMxNjIwYWEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
c2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNvY2NpCgo+ICtAcnVsZTFA
Cj4gKy8vIERyb3AgbG9jYWxfZXJyCj4gK2lkZW50aWZpZXIgZm4sIGxvY2FsX2VycjsKPiArc3lt
Ym9sIGVycnA7Cj4gK0BACj4gKwo+ICsgZm4oLi4uLCBFcnJvciAqKmVycnAsIC4uLikKPiArIHsK
PiArICAgICA8Li4uCj4gKy0gICAgRXJyb3IgKmxvY2FsX2VyciA9IE5VTEw7Cj4gKyAgICAgLi4u
Pgo+ICsgfQo+ICsKClNvIG91ciBnb2FsIGlzIHRvIGF1dG9tYXRlIHJlbW92YWwgb2YgYWxsIGxv
Y2FsX2VyciAoaW5jbHVkaW5nIHdoZW4gaXQgCmlzIHNwZWxsZWQgZXJyKS4uLgoKPiArQEAKPiAr
Ly8gSGFuZGxlIHBhdHRlcm4gd2l0aCBnb3RvLCBvdGhlcndpc2Ugd2UnbGwgZmluaXNoIHVwCj4g
Ky8vIHdpdGggbGFiZWxzIGF0IGZ1bmN0aW9uIGVuZCB3aGljaCB3aWxsIG5vdCBjb21waWxlLgo+
ICtpZGVudGlmaWVyIHJ1bGUxLmZuOwo+ICtpZGVudGlmaWVyIHJ1bGUxLmxvY2FsX2VycjsKPiAr
aWRlbnRpZmllciBPVVQ7Cj4gK0BACj4gKwo+ICsgZm4oLi4uKQo+ICsgewo+ICsgICAgIDwuLi4K
PiArLSAgICBnb3RvIE9VVDsKPiArKyAgICByZXR1cm47Cj4gKyAgICAgLi4uPgo+ICstIE9VVDoK
PiArLSAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKTsKPiArIH0KPiArCgp0aGlz
IGRhbmdsaW5nIGxhYmVsIGNsZWFudXAgbWFrZXMgc2Vuc2UKCj4gK0BACj4gK2lkZW50aWZpZXIg
cnVsZTEuZm47Cj4gK2lkZW50aWZpZXIgcnVsZTEubG9jYWxfZXJyOwo+ICtAQAo+ICsKPiArIGZu
KC4uLikKPiArIHsKPiArICAgICA8Li4uCj4gKygKPiArLSAgICBlcnJvcl9mcmVlKGxvY2FsX2Vy
cik7Cj4gKy0gICAgbG9jYWxfZXJyID0gTlVMTDsKPiArKyAgICBlcnJvcl9mcmVlX2VycnAoZXJy
cCk7CgpUaGlzIGRvZXMgbm90IG1ha2Ugc2Vuc2UgLSBlcnJvcl9mcmVlX2VycnAoKSBpcyBub3Qg
ZGVmaW5lZCBwcmlvciB0byAKdGhpcyBzZXJpZXMgb3IgYW55d2hlcmUgaW4gcGF0Y2hlcyAxLTI0
LCBpZiBJJ20gcmVhZGluZyBpdCBjb3JyZWN0bHkuCgo+ICt8Cj4gKy0gICAgZXJyb3JfZnJlZShs
b2NhbF9lcnIpOwo+ICsrICAgIGVycm9yX2ZyZWVfZXJycChlcnJwKTsKCmFuZCBhZ2FpbgoKPiAr
fAo+ICstICAgIGVycm9yX3JlcG9ydF9lcnIobG9jYWxfZXJyKTsKPiArKyAgICBlcnJvcl9yZXBv
cnRfZXJycChlcnJwKTsKPiArfAo+ICstICAgIHdhcm5fcmVwb3J0X2Vycihsb2NhbF9lcnIpOwo+
ICsrICAgIHdhcm5fcmVwb3J0X2VycnAoZXJycCk7Cj4gK3wKPiArLSAgICBlcnJvcl9wcm9wYWdh
dGVfcHJlcGVuZChlcnJwLCBsb2NhbF9lcnIsCj4gKysgICAgZXJyb3JfcHJlcGVuZChlcnJwLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuLi4pOwo+ICt8Cj4gKy0gICAgZXJyb3Jf
cHJvcGFnYXRlKGVycnAsIGxvY2FsX2Vycik7Cj4gKykKPiArICAgICAuLi4+Cj4gKyB9Cj4gKwoK
SXQgbG9va3MgbGlrZSBvbmNlIHRoaXMgc2NyaXB0IGlzIHJ1biwgZXJyb3JfcHJvcGFnYXRlX3By
ZXBlbmQoKSB3aWxsIApoYXZlIG5vIGNsaWVudHMuICBJcyB0aGVyZSBhIG5vbi1nZW5lcmF0ZWQg
Y2xlYW51cCBwYXRjaCB0aGF0IHJlbW92ZXMgaXQgCihhbmQgb25jZSBpdCBpcyByZW1vdmVkLCBp
dCBjYW4gYWxzbyBiZSByZW1vdmVkIGZyb20gdGhlIC5jb2NjaSBzY3JpcHQgCmFzIG5vIGZ1cnRo
ZXIgY2xpZW50cyB3aWxsIHJlYXBwZWFyIGxhdGVyKT8KCgo+ICtAQAo+ICtpZGVudGlmaWVyIHJ1
bGUxLmZuOwo+ICtpZGVudGlmaWVyIHJ1bGUxLmxvY2FsX2VycjsKPiArQEAKPiArCj4gKyBmbigu
Li4pCj4gKyB7Cj4gKyAgICAgPC4uLgo+ICsoCj4gKy0gICAgJmxvY2FsX2Vycgo+ICsrICAgIGVy
cnAKPiArfAo+ICstICAgIGxvY2FsX2Vycgo+ICsrICAgICplcnJwCj4gKykKPiArICAgICAuLi4+
Cj4gKyB9Cj4gKwo+ICtAQAo+ICtzeW1ib2wgZXJycDsKPiArQEAKPiArCj4gKy0gKmVycnAgIT0g
TlVMTAo+ICsrICplcnJwCj4gCgpTZWVtcyB0byBtYWtlIHNlbnNlLgoKLS0gCkVyaWMgQmxha2Us
IFByaW5jaXBhbCBTb2Z0d2FyZSBFbmdpbmVlcgpSZWQgSGF0LCBJbmMuICAgICAgICAgICArMS05
MTktMzAxLTMyMjYKVmlydHVhbGl6YXRpb246ICBxZW11Lm9yZyB8IGxpYnZpcnQub3JnCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
