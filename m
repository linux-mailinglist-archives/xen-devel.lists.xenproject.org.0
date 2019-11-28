Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F005D10C593
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 10:03:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaFex-0007hf-Dj; Thu, 28 Nov 2019 09:00:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mOU1=ZU=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1iaFZq-0006yN-FM
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 08:55:06 +0000
X-Inumbo-ID: c59daeb6-11bc-11ea-83b8-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c59daeb6-11bc-11ea-83b8-bc764e2007e4;
 Thu, 28 Nov 2019 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574931305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSPxVWVaufVBzbSp9R9OBKc7D3f68hj0r8Lx6mZvlhY=;
 b=D5s71ZJw5L4FY2lHqDG37xhCzme8ajx1q/8CEVEagML1PYOdfP29xZVAQtbhsuhUrOx06S
 eO6x9m8n1/3915l8eQ00kPArjSjpcoflD3KlSUn2b7Z7BXEHYBE6OIOwn6iE0rFbWIrv4+
 kmoRGeA5pnA3NQ6zSLMXKJghZiUKTg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-NnAESlcmP_eMKjmll6TYQw-1; Thu, 28 Nov 2019 03:55:02 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27B5B18B9F80;
 Thu, 28 Nov 2019 08:54:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22F875C1B0;
 Thu, 28 Nov 2019 08:54:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 96EEF1138606; Thu, 28 Nov 2019 09:54:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
Date: Thu, 28 Nov 2019 09:54:48 +0100
In-Reply-To: <20191011160552.22907-1-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 11 Oct 2019 19:03:46 +0300")
Message-ID: <87tv6opehz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: NnAESlcmP_eMKjmll6TYQw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Thu, 28 Nov 2019 09:00:22 +0000
Subject: Re: [Xen-devel] [RFC v5 000/126] error: auto propagated local_err
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
 Jan Kiszka <jan.kiszka@siemens.com>, Alberto Garcia <berto@igalia.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, qemu-block@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Laszlo Ersek <lersek@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, sheepdog@lists.wpkg.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Eric Farman <farman@linux.ibm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 Hannes Reinecke <hare@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Anthony Green <green@moxielogic.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Ari Sundholm <ari@tuxera.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Jason Dillaman <dillaman@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 xen-devel@lists.xenproject.org, integration@gluster.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 armbru@redhat.com,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGxlYXNlIGFjY2VwdCBteSBzaW5jZXJlIGFwb2xvZ2llcyBmb3IgdGFraW5nIHNvIGxvbmcgdG8g
cmVwbHkuICBBIGZldwp0aG91Z2h0cyBiZWZvcmUgSSBkaWcgZGVlcGVyLgoKVmxhZGltaXIgU2Vt
ZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cgo+IEhp
IGFsbCEKPgo+IEF0IHRoZSByZXF1ZXN0IG9mIE1hcmt1czogZnVsbCB2ZXJzaW9uIG9mIGVycnAg
cHJvcGFnYXRpb24uIExldCdzIGxvb2sKPiBhdCBpdC4gQ292ZXIgYXMgbXVjaCBhcyBwb3NzaWJs
ZSwgZXhjZXB0IGluc2VydGluZyBtYWNybyBpbnZvY2F0aW9uCj4gd2hlcmUgaXQncyBub3QgbmVj
ZXNzYXJ5Lgo+Cj4gSXQncyBodWdlLCBhbmQgc28gaXQncyBhbiBSRkMuCgpJdCdzIGEgbW9uc3Rl
ci4gIEJlc3QgdG8gZ2V0IGl0IGludG8gZnVsbCB2aWV3IGJlZm9yZSB3ZSBjb21taXQgdG8KZmln
aHRpbmcgaXQuCgo+IEluIHY1IEkndmUgYWRkZWQgYSBsb3QgbW9yZSBwcmVwYXJhdGlvbiBjbGVh
bnVwczoKPiAwMS0yMyBhcmUgcHJlcGFyYXRpb24gY2xlYW51cHMKPiAgIDAxOiBub3QgY2hhbmdl
ZCwga2VlcCBFcmljJ3Mgci1iCj4gICAwMjogaW1wcm92ZSBjb21taXQgbXNnIFtNYXJrdXNdLCBr
ZWVwIEVyaWMncyByLWIKPiAgIDAzOiBjaGFuZ2VkLCBvbmx5IGVycm9yIEFQSSBoZXJlLCBkcm9w
IHItYgo+IDI0IGlzIGNvcmUgbWFjcm8KPiAgIC0gaW1wcm92ZSBjb3ZlciBsZXR0ZXIsIHdvcmRp
bmcgYW5kIG1hY3JvIGNvZGUgc3R5bGUKPiAgIC0ga2VlcCBFcmljJ3Mgci1iCj4gMjUtMjY6IGF1
dG9tYXRpb24gc2NyaXB0cwo+ICAgIC0gY29tbWl0LXBlci1zdWJzeXN0ZW0gY2hhbmdlZCBhIGxv
dC4gaXQncyBhIGRyYWZ0LCBkb24ndCBib3RoZXIgdG9vCj4gICAgICBtdWNoIHdpdGggaXQKPiAg
ICAtIGNvY2NpbmVsbGU6IGFkZCBzdXBwb3J0IG9mIGVycm9yX3Byb3BhZ2F0ZV9wcmVwZW5kCj4K
PiAyNy0xMjY6IGdlbmVyYXRlZCBwYXRjaGVzCgpTcGxpdHRpbmcgdXAgdGhlIG1vbnN0ZXIgY2Fu
IG1ha2UgZmlnaHRpbmcgaXQgZWFzaWVyLgoKWW91ciBkZXNjcmlwdGlvbiBzdWdnZXN0cyB0aHJl
ZSBoaWdoLWxldmVsIHBhcnRzOgoKUGFydCAxOiBQcmVwYXJhdGlvbiAobWFrZXMgc2Vuc2UgYnkg
aXRzZWxmKQpQYXJ0IDI6IEVycm9yIGludGVyZmFjZSB1cGRhdGUgKHdpdGggcnVsZXMgd2hhdCBj
b2RlIHNob3VsZCBkbyBub3cpClBhcnQgMzogTWFrZSB0aGUgY29kZSBvYmV5IHRoZSBuZXcgcnVs
ZXMgZXZlcnl3aGVyZQoKSSBob3BlIHdlIGNhbiBnZXQgcGFydCAxIG91dCBvZiB0aGUgd2F5IHF1
aWNrbHkuICBEaWZmc3RhdDoKCiBiYWNrZW5kcy9jcnlwdG9kZXYuYyAgICAgICB8ICAxMSArLS0t
CiBibG9jay9uYmQuYyAgICAgICAgICAgICAgICB8ICAxMCArLS0KIGJsb2NrL3NuYXBzaG90LmMg
ICAgICAgICAgIHwgICA0ICstCiBkdW1wL2R1bXAtaG1wLWNtZHMuYyAgICAgICB8ICAgNCArLQog
aHcvOXBmcy85cC1sb2NhbC5jICAgICAgICAgfCAgIDQgKy0KIGh3LzlwZnMvOXAtcHJveHkuYyAg
ICAgICAgIHwgICA1ICstCiBody9jb3JlL2xvYWRlci1maXQuYyAgICAgICB8ICAgNSArLQogaHcv
Y29yZS9tYWNoaW5lLWhtcC1jbWRzLmMgfCAgIDYgKy0KIGh3L2NvcmUvcWRldi5jICAgICAgICAg
ICAgIHwgIDI4ICsrKystLS0tCiBody9pMzg2L2FtZF9pb21tdS5jICAgICAgICB8ICAxNCArKy0t
CiBody9wcGMvc3BhcHIuYyAgICAgICAgICAgICB8ICAgMiArLQogaHcvczM5MHgvZXZlbnQtZmFj
aWxpdHkuYyAgfCAgIDIgKy0KIGh3L3MzOTB4L3MzOTAtc3RhdHRyaWIuYyAgIHwgICAzICstCiBo
dy9zZC9zZGhjaS5jICAgICAgICAgICAgICB8ICAgMiArLQogaHcvdHBtL3RwbV9lbXVsYXRvci5j
ICAgICAgfCAgIDggKy0tCiBody91c2IvZGV2LW5ldHdvcmsuYyAgICAgICB8ICAgMiArLQogaHcv
dmZpby9hcC5jICAgICAgICAgICAgICAgfCAgMTYgKy0tLS0KIGluY2x1ZGUvYmxvY2svc25hcHNo
b3QuaCAgIHwgICAyICstCiBpbmNsdWRlL21vbml0b3IvaG1wLmggICAgICB8ICAgMiArLQogaW5j
bHVkZS9xYXBpL2Vycm9yLmggICAgICAgfCAgNjkgKysrKysrKysrKysrKysrKysrLS0KIGluY2x1
ZGUvcW9tL29iamVjdC5oICAgICAgIHwgICA0ICstCiBtb25pdG9yL2htcC1jbWRzLmMgICAgICAg
ICB8IDE1NSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIG1v
bml0b3IvcW1wLWNtZHMuYyAgICAgICAgIHwgICAyICstCiBuZXQvbmV0LmMgICAgICAgICAgICAg
ICAgICB8ICAxNyArKy0tLQogcWRldi1tb25pdG9yLmMgICAgICAgICAgICAgfCAgMjggKysrKy0t
LS0KIHFnYS9jb21tYW5kcy1wb3NpeC5jICAgICAgIHwgICAyICstCiBxZ2EvY29tbWFuZHMtd2lu
MzIuYyAgICAgICB8ICAgMiArLQogcWdhL2NvbW1hbmRzLmMgICAgICAgICAgICAgfCAgMTIgKyst
LQogcW9tL3FvbS1obXAtY21kcy5jICAgICAgICAgfCAgIDQgKy0KIHRhcmdldC9wcGMva3ZtLmMg
ICAgICAgICAgIHwgICA2ICstCiB0YXJnZXQvcHBjL2t2bV9wcGMuaCAgICAgICB8ICAgNCArLQog
dWkvdm5jLmMgICAgICAgICAgICAgICAgICAgfCAgMjAgKystLS0tCiB1aS92bmMuaCAgICAgICAg
ICAgICAgICAgICB8ICAgMiArLQogdXRpbC9lcnJvci5jICAgICAgICAgICAgICAgfCAgMzAgKysr
Ky0tLS0tCiAzNCBmaWxlcyBjaGFuZ2VkLCAyNjEgaW5zZXJ0aW9ucygrKSwgMjI2IGRlbGV0aW9u
cygtKQoKQXQgZmlyc3QgZ2xhbmNlLCBJIGNhbiBzZWUgYnVnIGZpeGVzLCBub24tbWVjaGFuaWNh
bCBjbGVhbnVwcywgYW5kCm1lY2hhbmljYWwgY2xlYW51cHMuCgpXaXRoaW4gZWFjaCBvZiB0aGVz
ZSB0aHJlZSBncm91cHMsIHdlIGhhdmUgcmVsYXRlZCBzdWItZ3JvdXBzLiAgRm9yCmluc3RhbmNl
LCBzZXZlcmFsIHBhdGNoZXMgY2xlYW4gdXAgZnVubnkgbmFtZXMgZm9yIHRoZSBjb21tb24gRXJy
b3IgKioKcGFyYW1ldGVycy4gIFNldmVyYWwgbW9yZSByZW5hbWUgInVuY29tbW9uIiBFcnJvciAq
KiBwYXJhbWV0ZXJzLCB0bwpzaWduYWwgdGhlaXIgdW5jb21tb24gcm9sZS4gIEkgZG91YnQgc3Bs
aXR0aW5nIHVwIHRoZXNlIHN1Ymdyb3VwcyBvZgpyZWxhdGVkIG1lY2hhbmljYWwgY2hhbmdlcyBh
bG9uZyBzdWJzeXN0ZW0gbGluZXMgaXMgd29ydGh3aGlsZS4KClBhcnQgMiBuZWVkcyBjYXJlZnVs
IGludGVyZmFjZSByZXZpZXcuICBIYXZpbmcgcGFydCAzIHJlYWR5IGhlbHBzIHRoZXJlLApiZWNh
dXNlIHdlIGNhbiBzZWUgcmF0aGVyIHRoYW4gZ3Vlc3MgaG93IHRoZSBpbnRlcmZhY2UgY2hhbmdl
cyBwbGF5IG91dC4KV2UgcmVhbGx5IHdhbnQgdG8gZ2V0IHRoaXMgcGFydCByaWdodCBmcm9tIHRo
ZSBzdGFydCwgYmVjYXVzZSBpZiB3ZQpkb24ndCwgd2UgZ2V0IHRvIGRvIHBhcnQgMyBhZ2Fpbi4K
ClBhcnQgMyBpcyB3aGF0IG1ha2VzIHRoaXMgYSBtb25zdGVyLiAgSSB1bmRlcnN0YW5kIGl0J3Mg
bWVjaGFuaWNhbC4gIFdlCmNhbiBtZXJnZSBpdCBpbmNyZW1lbnRhbGx5LCBidXQgd2UgZG8gd2Fu
dCB0byBtZXJnZSBpdCBhbGwsIGFuZCBzb29uZXIKcmF0aGVyIHRoYW4gbGF0ZXIsIHRvIGF2b2lk
IGEgbWl4IG9mIG9sZCBhbmQgbmV3IGVycm9yIGhhbmRsaW5nIGNvZGUuClN1Y2ggbWl4ZXMgaW5l
dml0YWJseSBjb25mdXNlIGRldmVsb3BlcnMsIGFuZCBsZWFkIHRvIG5ldyBpbnN0YW5jZXMgb2YK
dGhlIG9sZCBwYXR0ZXJucyBjcmVlcGluZyBpbi4KCkkgZG8gaGF2ZSBkb3VidHMgYWJvdXQgeW91
ciBhdXRvbWF0ZWQgc3BsaXQuCgpJIGFja25vd2xlZGdlIG1haW50YWluZXJzIG9mIGFjdGl2ZSBz
dWJzeXN0ZW1zIG1heSB3YW50IHRvIG1lcmdlIHRoaXMgb24KdGhlaXIgb3duIHRlcm1zLCB0byBt
aW5pbWl6ZSBkaXNydXB0aW9uLiAgU3BsaXR0aW5nIG9mZiBzdWItbW9uc3RlcnMgZm9yCnRoZW0g
bWFrZXMgc2Vuc2UuICBTcGxpdHRpbmcgb2ZmIHRoZSBsb25nIHRhaWwgb2YgbGVzcyBidXN5IHN1
YnN5c3RlbXMKbm90IHNvIG11Y2g7IGl0J2xsIG9ubHkgZHJhZyBvdXQgdGhlIG1lcmdpbmcuICBZ
b3VyIGxpc3QgYmVsb3cgc2hvd3MgMTAwCnBhcnRzLCBhbmQgY2hhc2luZyB0aGVpciBtYWludGFp
bmVycyBpcyBub3QgZ29pbmcgdG8gYmUgYSBmdW4KZXhwZXJpZW5jZS4KCk1vcmVvdmVyLCB1c2lu
ZyBNQUlOVEFJTkVSUyB0byBndWlkZSBhbiBhdXRvbWF0aWMgc3BsaXQgaXMgYSBjdXRlIGlkZWEs
CmJ1dCBpdCBmYWxscyBhcGFydCB3aGVuIE1BSU5UQUlORVJTIGF0dHJpYnV0ZXMgdGhlIHNhbWUg
ZmlsZSB0byBzZXZlcmFsCnN1YnN5c3RlbXMsIHdoaWNoIGlzIGZhaXJseSBjb21tb24uICBBIHNh
bmUgc3BsaXQgcmVxdWlyZXMgaHVtYW4gdG91Y2guCgpJbnN0ZWFkLCBJJ2Qgc3RhcnQgd2l0aCBi
aWcgc3Vic3lzdGVtcyB3aXRoIG1haW50YWluZXJzIGtub3duIHRvIGJlCnN5bXBhdGhldGljIHRv
IHRoaXMgZWZmb3J0LiAgU3BsaXQgb2ZmIHRoZWlyIHN1Yi1tb25zdGVycywgZ2V0IHRoZW0KbWVy
Z2VkLiAgSXRlcmF0ZSB1bnRpbCB0aGUgcmVtYWluZGVyIGNhbiBiZSBtZXJnZWQgaW4gb25lIGZp
bmFsIHB1c2guCgo+ID09PT0KPgo+IEhlcmUgaXMgYSBwcm9wb3NhbCBvZiBhdXRvIHByb3BhZ2F0
aW9uIGZvciBsb2NhbF9lcnIsIHRvIG5vdCBjYWxsCj4gZXJyb3JfcHJvcGFnYXRlIG9uIGV2ZXJ5
IGV4aXQgcG9pbnQsIHdoZW4gd2UgZGVhbCB3aXRoIGxvY2FsX2Vyci4KCk1vcmUgY2xldmVybmVz
cywgbGVzcyBjb2RlLCBhdm9pZHMgb25lIGtpbmQgb2YgZXJyb3IgKGZvcmdldHRpbmcgbWFudWFs
CnByb3BhZ2F0ZSB3aGVuIHdlIHNob3VsZCksIHJpc2tzIGFub3RoZXIga2luZCBvZiBlcnJvciAo
YXV0b21hdGljCnByb3BhZ2F0ZSB3aGVuIHdlIHNob3VsZG4ndCkuICBUcmFkZW9mZnMsIGJ1dCB0
aGUgZ2VuZXJhbCBmZWVsaW5nIGFtb25nCnJldmlld2VycyBhcHBlYXJzIHRvIGJlIHBvc2l0aXZl
LgoKPiBUaGVyZSBhcmUgYWxzbyB0d28gaXNzdWVzIHdpdGggZXJycDoKPgo+IDEuIGVycm9yX2Zh
dGFsICYgZXJyb3JfYXBwZW5kX2hpbnQvZXJyb3JfcHJlcGVuZDogdXNlciBjYW4ndCBzZWUgdGhp
cwo+IGFkZGl0aW9uYWwgaW5mbywgYmVjYXVzZSBleGl0KCkgaGFwcGVucyBpbiBlcnJvcl9zZXRn
IGVhcmxpZXIgdGhhbiBpbmZvCj4gaXMgYWRkZWQuIFtSZXBvcnRlZCBieSBHcmVnIEt1cnpdCgpZ
ZXMsIGJyb2tlbiBieSBkZXNpZ24sIGh1cnRzIHVzZXJzLgoKPiAyLiBlcnJvcl9hYm9ydCAmIGVy
cm9yX3Byb3BhZ2F0ZTogd2hlbiB3ZSB3cmFwCj4gZXJyb3JfYWJvcnQgYnkgbG9jYWxfZXJyK2Vy
cm9yX3Byb3BhZ2F0ZSwgcmVzdWx0aW5nIGNvcmVkdW1wIHdpbGwKPiByZWZlciB0byBlcnJvcl9w
cm9wYWdhdGUgYW5kIG5vdCB0byB0aGUgcGxhY2Ugd2hlcmUgZXJyb3IgaGFwcGVuZWQuCj4gKHRo
ZSBtYWNybyBpdHNlbGYgZG9uJ3QgZml4IHRoZSBpc3N1ZSwgYnV0IGl0IGFsbG93cyB0byBbMy5d
IGRyb3AgYWxsCj4gbG9jYWxfZXJyK2Vycm9yX3Byb3BhZ2F0ZSBwYXR0ZXJuLCB3aGljaCB3aWxs
IGRlZmluaXRlbHkgZml4IHRoZSBpc3N1ZSkKPiBbUmVwb3J0ZWQgYnkgS2V2aW4gV29sZl0KClll
cywgYnJva2VuIGJ5IGRlc2lnbiwgaW5jb252ZW5pZW5jZXMgZGV2ZWxvcGVycy4KCj4gPT09PQo+
Cj4gR2VuZXJhdGVkIHBhdGNoZXMgc3BsaXQ6Cj4KPiBtaXNjCj4gICAgaHcvbWlzYy9pdnNobWVt
LmMKPiAgICBody9taXNjL3RtcDEwNS5jCj4gICAgaHcvbWlzYy90bXA0MjEuYwpbOTkgbW9yZS4u
Ll0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
