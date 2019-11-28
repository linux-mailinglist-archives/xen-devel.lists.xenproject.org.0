Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D0510C8AF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 13:29:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaIsd-0002bP-VH; Thu, 28 Nov 2019 12:26:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mOU1=ZU=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1iaIne-0002UP-P6
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 12:21:35 +0000
X-Inumbo-ID: 9d700a20-11d9-11ea-a3d2-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9d700a20-11d9-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 12:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574943693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=08Nyj49dE5IDJWQrTCQ66QZcgZEC4k4vNpQuBS0d/I0=;
 b=E+kaEFKQA57J0ieDDMyUUsUZ8DjafLxf17VCGzL4tQWhzdDqpvNyCaIvrDwghPRdH9gSfW
 i6Nh/FdnEkpD0XnWVRpwNqFiKx1dRNLW0jYeAyyoCFFmrEtHvtf2ve5P5bICs+5FbB8nkK
 uGkxi/bKgBo+dxBlnVv8nlYPMyZ2tYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-2X6Kw02DNGiyUEdOf5vkNQ-1; Thu, 28 Nov 2019 07:21:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 516301800D52;
 Thu, 28 Nov 2019 12:21:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B0B660BE2;
 Thu, 28 Nov 2019 12:21:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7B1B41138606; Thu, 28 Nov 2019 13:21:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <87tv6opehz.fsf@dusky.pond.sub.org>
 <b000e0b0-b75c-c74e-244b-0b1bf270b6a6@virtuozzo.com>
Date: Thu, 28 Nov 2019 13:21:20 +0100
In-Reply-To: <b000e0b0-b75c-c74e-244b-0b1bf270b6a6@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 28 Nov 2019 09:20:01 +0000")
Message-ID: <87mucgmbsv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 2X6Kw02DNGiyUEdOf5vkNQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Thu, 28 Nov 2019 12:26:42 +0000
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Alberto Garcia <berto@igalia.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
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
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Eric Farman <farman@linux.ibm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "integration@gluster.org" <integration@gluster.org>,
 Laszlo Ersek <lersek@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 Denis Lunev <den@virtuozzo.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
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

VmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3
cml0ZXM6Cgo+IDI4LjExLjIwMTkgMTE6NTQsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+PiBQ
bGVhc2UgYWNjZXB0IG15IHNpbmNlcmUgYXBvbG9naWVzIGZvciB0YWtpbmcgc28gbG9uZyB0byBy
ZXBseS4gIEEgZmV3Cj4+IHRob3VnaHRzIGJlZm9yZSBJIGRpZyBkZWVwZXIuCj4+IAo+PiBWbGFk
aW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdyaXRl
czoKPj4gCj4+PiBIaSBhbGwhCj4+Pgo+Pj4gQXQgdGhlIHJlcXVlc3Qgb2YgTWFya3VzOiBmdWxs
IHZlcnNpb24gb2YgZXJycCBwcm9wYWdhdGlvbi4gTGV0J3MgbG9vawo+Pj4gYXQgaXQuIENvdmVy
IGFzIG11Y2ggYXMgcG9zc2libGUsIGV4Y2VwdCBpbnNlcnRpbmcgbWFjcm8gaW52b2NhdGlvbgo+
Pj4gd2hlcmUgaXQncyBub3QgbmVjZXNzYXJ5Lgo+Pj4KPj4+IEl0J3MgaHVnZSwgYW5kIHNvIGl0
J3MgYW4gUkZDLgo+PiAKPj4gSXQncyBhIG1vbnN0ZXIuICBCZXN0IHRvIGdldCBpdCBpbnRvIGZ1
bGwgdmlldyBiZWZvcmUgd2UgY29tbWl0IHRvCj4+IGZpZ2h0aW5nIGl0Lgo+PiAKPj4+IEluIHY1
IEkndmUgYWRkZWQgYSBsb3QgbW9yZSBwcmVwYXJhdGlvbiBjbGVhbnVwczoKPj4+IDAxLTIzIGFy
ZSBwcmVwYXJhdGlvbiBjbGVhbnVwcwo+Pj4gICAgMDE6IG5vdCBjaGFuZ2VkLCBrZWVwIEVyaWMn
cyByLWIKPj4+ICAgIDAyOiBpbXByb3ZlIGNvbW1pdCBtc2cgW01hcmt1c10sIGtlZXAgRXJpYydz
IHItYgo+Pj4gICAgMDM6IGNoYW5nZWQsIG9ubHkgZXJyb3IgQVBJIGhlcmUsIGRyb3Agci1iCj4+
PiAyNCBpcyBjb3JlIG1hY3JvCj4+PiAgICAtIGltcHJvdmUgY292ZXIgbGV0dGVyLCB3b3JkaW5n
IGFuZCBtYWNybyBjb2RlIHN0eWxlCj4+PiAgICAtIGtlZXAgRXJpYydzIHItYgo+Pj4gMjUtMjY6
IGF1dG9tYXRpb24gc2NyaXB0cwo+Pj4gICAgIC0gY29tbWl0LXBlci1zdWJzeXN0ZW0gY2hhbmdl
ZCBhIGxvdC4gaXQncyBhIGRyYWZ0LCBkb24ndCBib3RoZXIgdG9vCj4+PiAgICAgICBtdWNoIHdp
dGggaXQKPj4+ICAgICAtIGNvY2NpbmVsbGU6IGFkZCBzdXBwb3J0IG9mIGVycm9yX3Byb3BhZ2F0
ZV9wcmVwZW5kCj4+Pgo+Pj4gMjctMTI2OiBnZW5lcmF0ZWQgcGF0Y2hlcwo+PiAKPj4gU3BsaXR0
aW5nIHVwIHRoZSBtb25zdGVyIGNhbiBtYWtlIGZpZ2h0aW5nIGl0IGVhc2llci4KPj4gCj4+IFlv
dXIgZGVzY3JpcHRpb24gc3VnZ2VzdHMgdGhyZWUgaGlnaC1sZXZlbCBwYXJ0czoKPj4gCj4+IFBh
cnQgMTogUHJlcGFyYXRpb24gKG1ha2VzIHNlbnNlIGJ5IGl0c2VsZikKPgo+IEkgYWxyZWFkeSBy
ZXNlbnQgcGFydCAxIGFsbCBwYXRjaGVzIChoYW5kbGluZyByZXZpZXcgY29tbWVudHMpIGluIHNl
cGFyYXRlIGFzIHY2Lgo+IElmIGl0IGlzIGNvbnZlbmllbnQsIEkgY2FuIHJlc2VuZCB0aGVtIGlu
IG9uZSBzZXJpZXMgYXMgdjcuCgpSZWNvbW1lbmQgdG8gYXdhaXQgcmV2aWV3LiAgVGhlIG1vcmUg
d2UgY2FuIG1lcmdlIHdpdGhvdXQgYW5vdGhlcgpyZXNwaW4sIHRoZSBiZXR0ZXIuCgo+PiBQYXJ0
IDI6IEVycm9yIGludGVyZmFjZSB1cGRhdGUgKHdpdGggcnVsZXMgd2hhdCBjb2RlIHNob3VsZCBk
byBub3cpCj4KPiBOb3RlLCB0aGF0IHBhdGNoIDIxIGlzIGFjdHVhbGx5IGZyb20gcGFydDIsIG5v
dCBwYXJ0MS4KPiBTbyBQYXJ0IDIgaXMgMjEsIDI0LCAyNS4KClRoYW5rcyBmb3IgdGhlIGhlYWRz
LXVwLgoKPiBTbyBJIHdhaXQgZm9yIHlvdXIgY29tbWVudHMgYW5kIHJlc2VuZCAoaWYgbmVlZGVk
KSBhcyBzZXBhcmF0ZSBzbWFsbCBzZXJpZXMuCj4KPiBBbmQgMjYgaXMgYXV0by1wYXRjaC1zcGxp
dHRlciwgYnV0IHdlIGRvbid0IG5lZWQgaXQgbm93LCBpZiB3ZSBhcmUgZ29pbmcKPiB0byBzdGFy
dCBmcm9tIHNldmVyYWwgYmlnIHN1YnN5c3RlbXMuCj4KPj4gUGFydCAzOiBNYWtlIHRoZSBjb2Rl
IG9iZXkgdGhlIG5ldyBydWxlcyBldmVyeXdoZXJlCj4+IAo+PiBJIGhvcGUgd2UgY2FuIGdldCBw
YXJ0IDEgb3V0IG9mIHRoZSB3YXkgcXVpY2tseS4gIERpZmZzdGF0Ogo+PiAKPj4gICBiYWNrZW5k
cy9jcnlwdG9kZXYuYyAgICAgICB8ICAxMSArLS0tCj4+ICAgYmxvY2svbmJkLmMgICAgICAgICAg
ICAgICAgfCAgMTAgKy0tCj4+ICAgYmxvY2svc25hcHNob3QuYyAgICAgICAgICAgfCAgIDQgKy0K
Pj4gICBkdW1wL2R1bXAtaG1wLWNtZHMuYyAgICAgICB8ICAgNCArLQo+PiAgIGh3LzlwZnMvOXAt
bG9jYWwuYyAgICAgICAgIHwgICA0ICstCj4+ICAgaHcvOXBmcy85cC1wcm94eS5jICAgICAgICAg
fCAgIDUgKy0KPj4gICBody9jb3JlL2xvYWRlci1maXQuYyAgICAgICB8ICAgNSArLQo+PiAgIGh3
L2NvcmUvbWFjaGluZS1obXAtY21kcy5jIHwgICA2ICstCj4+ICAgaHcvY29yZS9xZGV2LmMgICAg
ICAgICAgICAgfCAgMjggKysrKy0tLS0KPj4gICBody9pMzg2L2FtZF9pb21tdS5jICAgICAgICB8
ICAxNCArKy0tCj4+ICAgaHcvcHBjL3NwYXByLmMgICAgICAgICAgICAgfCAgIDIgKy0KPj4gICBo
dy9zMzkweC9ldmVudC1mYWNpbGl0eS5jICB8ICAgMiArLQo+PiAgIGh3L3MzOTB4L3MzOTAtc3Rh
dHRyaWIuYyAgIHwgICAzICstCj4+ICAgaHcvc2Qvc2RoY2kuYyAgICAgICAgICAgICAgfCAgIDIg
Ky0KPj4gICBody90cG0vdHBtX2VtdWxhdG9yLmMgICAgICB8ICAgOCArLS0KPj4gICBody91c2Iv
ZGV2LW5ldHdvcmsuYyAgICAgICB8ICAgMiArLQo+PiAgIGh3L3ZmaW8vYXAuYyAgICAgICAgICAg
ICAgIHwgIDE2ICstLS0tCj4+ICAgaW5jbHVkZS9ibG9jay9zbmFwc2hvdC5oICAgfCAgIDIgKy0K
Pj4gICBpbmNsdWRlL21vbml0b3IvaG1wLmggICAgICB8ICAgMiArLQo+PiAgIGluY2x1ZGUvcWFw
aS9lcnJvci5oICAgICAgIHwgIDY5ICsrKysrKysrKysrKysrKysrKy0tCj4+ICAgaW5jbHVkZS9x
b20vb2JqZWN0LmggICAgICAgfCAgIDQgKy0KPj4gICBtb25pdG9yL2htcC1jbWRzLmMgICAgICAg
ICB8IDE1NSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4g
ICBtb25pdG9yL3FtcC1jbWRzLmMgICAgICAgICB8ICAgMiArLQo+PiAgIG5ldC9uZXQuYyAgICAg
ICAgICAgICAgICAgIHwgIDE3ICsrLS0tCj4+ICAgcWRldi1tb25pdG9yLmMgICAgICAgICAgICAg
fCAgMjggKysrKy0tLS0KPj4gICBxZ2EvY29tbWFuZHMtcG9zaXguYyAgICAgICB8ICAgMiArLQo+
PiAgIHFnYS9jb21tYW5kcy13aW4zMi5jICAgICAgIHwgICAyICstCj4+ICAgcWdhL2NvbW1hbmRz
LmMgICAgICAgICAgICAgfCAgMTIgKystLQo+PiAgIHFvbS9xb20taG1wLWNtZHMuYyAgICAgICAg
IHwgICA0ICstCj4+ICAgdGFyZ2V0L3BwYy9rdm0uYyAgICAgICAgICAgfCAgIDYgKy0KPj4gICB0
YXJnZXQvcHBjL2t2bV9wcGMuaCAgICAgICB8ICAgNCArLQo+PiAgIHVpL3ZuYy5jICAgICAgICAg
ICAgICAgICAgIHwgIDIwICsrLS0tLQo+PiAgIHVpL3ZuYy5oICAgICAgICAgICAgICAgICAgIHwg
ICAyICstCj4+ICAgdXRpbC9lcnJvci5jICAgICAgICAgICAgICAgfCAgMzAgKysrKy0tLS0tCj4+
ICAgMzQgZmlsZXMgY2hhbmdlZCwgMjYxIGluc2VydGlvbnMoKyksIDIyNiBkZWxldGlvbnMoLSkK
Pj4gCj4+IEF0IGZpcnN0IGdsYW5jZSwgSSBjYW4gc2VlIGJ1ZyBmaXhlcywgbm9uLW1lY2hhbmlj
YWwgY2xlYW51cHMsIGFuZAo+PiBtZWNoYW5pY2FsIGNsZWFudXBzLgo+PiAKPj4gV2l0aGluIGVh
Y2ggb2YgdGhlc2UgdGhyZWUgZ3JvdXBzLCB3ZSBoYXZlIHJlbGF0ZWQgc3ViLWdyb3Vwcy4gIEZv
cgo+PiBpbnN0YW5jZSwgc2V2ZXJhbCBwYXRjaGVzIGNsZWFuIHVwIGZ1bm55IG5hbWVzIGZvciB0
aGUgY29tbW9uIEVycm9yICoqCj4+IHBhcmFtZXRlcnMuICBTZXZlcmFsIG1vcmUgcmVuYW1lICJ1
bmNvbW1vbiIgRXJyb3IgKiogcGFyYW1ldGVycywgdG8KPj4gc2lnbmFsIHRoZWlyIHVuY29tbW9u
IHJvbGUuICBJIGRvdWJ0IHNwbGl0dGluZyB1cCB0aGVzZSBzdWJncm91cHMgb2YKPj4gcmVsYXRl
ZCBtZWNoYW5pY2FsIGNoYW5nZXMgYWxvbmcgc3Vic3lzdGVtIGxpbmVzIGlzIHdvcnRod2hpbGUu
Cj4+IAo+PiBQYXJ0IDIgbmVlZHMgY2FyZWZ1bCBpbnRlcmZhY2UgcmV2aWV3LiAgSGF2aW5nIHBh
cnQgMyByZWFkeSBoZWxwcyB0aGVyZSwKPj4gYmVjYXVzZSB3ZSBjYW4gc2VlIHJhdGhlciB0aGFu
IGd1ZXNzIGhvdyB0aGUgaW50ZXJmYWNlIGNoYW5nZXMgcGxheSBvdXQuCj4+IFdlIHJlYWxseSB3
YW50IHRvIGdldCB0aGlzIHBhcnQgcmlnaHQgZnJvbSB0aGUgc3RhcnQsIGJlY2F1c2UgaWYgd2UK
Pj4gZG9uJ3QsIHdlIGdldCB0byBkbyBwYXJ0IDMgYWdhaW4uCj4+IAo+PiBQYXJ0IDMgaXMgd2hh
dCBtYWtlcyB0aGlzIGEgbW9uc3Rlci4gIEkgdW5kZXJzdGFuZCBpdCdzIG1lY2hhbmljYWwuICBX
ZQo+PiBjYW4gbWVyZ2UgaXQgaW5jcmVtZW50YWxseSwgYnV0IHdlIGRvIHdhbnQgdG8gbWVyZ2Ug
aXQgYWxsLCBhbmQgc29vbmVyCj4+IHJhdGhlciB0aGFuIGxhdGVyLCB0byBhdm9pZCBhIG1peCBv
ZiBvbGQgYW5kIG5ldyBlcnJvciBoYW5kbGluZyBjb2RlLgo+PiBTdWNoIG1peGVzIGluZXZpdGFi
bHkgY29uZnVzZSBkZXZlbG9wZXJzLCBhbmQgbGVhZCB0byBuZXcgaW5zdGFuY2VzIG9mCj4+IHRo
ZSBvbGQgcGF0dGVybnMgY3JlZXBpbmcgaW4uCj4+IAo+PiBJIGRvIGhhdmUgZG91YnRzIGFib3V0
IHlvdXIgYXV0b21hdGVkIHNwbGl0Lgo+PiAKPj4gSSBhY2tub3dsZWRnZSBtYWludGFpbmVycyBv
ZiBhY3RpdmUgc3Vic3lzdGVtcyBtYXkgd2FudCB0byBtZXJnZSB0aGlzIG9uCj4+IHRoZWlyIG93
biB0ZXJtcywgdG8gbWluaW1pemUgZGlzcnVwdGlvbi4gIFNwbGl0dGluZyBvZmYgc3ViLW1vbnN0
ZXJzIGZvcgo+PiB0aGVtIG1ha2VzIHNlbnNlLiAgU3BsaXR0aW5nIG9mZiB0aGUgbG9uZyB0YWls
IG9mIGxlc3MgYnVzeSBzdWJzeXN0ZW1zCj4+IG5vdCBzbyBtdWNoOyBpdCdsbCBvbmx5IGRyYWcg
b3V0IHRoZSBtZXJnaW5nLiAgWW91ciBsaXN0IGJlbG93IHNob3dzIDEwMAo+PiBwYXJ0cywgYW5k
IGNoYXNpbmcgdGhlaXIgbWFpbnRhaW5lcnMgaXMgbm90IGdvaW5nIHRvIGJlIGEgZnVuCj4+IGV4
cGVyaWVuY2UuCj4+IAo+PiBNb3Jlb3ZlciwgdXNpbmcgTUFJTlRBSU5FUlMgdG8gZ3VpZGUgYW4g
YXV0b21hdGljIHNwbGl0IGlzIGEgY3V0ZSBpZGVhLAo+PiBidXQgaXQgZmFsbHMgYXBhcnQgd2hl
biBNQUlOVEFJTkVSUyBhdHRyaWJ1dGVzIHRoZSBzYW1lIGZpbGUgdG8gc2V2ZXJhbAo+PiBzdWJz
eXN0ZW1zLCB3aGljaCBpcyBmYWlybHkgY29tbW9uLiAgQSBzYW5lIHNwbGl0IHJlcXVpcmVzIGh1
bWFuIHRvdWNoLgo+PiAKPj4gSW5zdGVhZCwgSSdkIHN0YXJ0IHdpdGggYmlnIHN1YnN5c3RlbXMg
d2l0aCBtYWludGFpbmVycyBrbm93biB0byBiZQo+PiBzeW1wYXRoZXRpYyB0byB0aGlzIGVmZm9y
dC4gIFNwbGl0IG9mZiB0aGVpciBzdWItbW9uc3RlcnMsIGdldCB0aGVtCj4+IG1lcmdlZC4gIEl0
ZXJhdGUgdW50aWwgdGhlIHJlbWFpbmRlciBjYW4gYmUgbWVyZ2VkIGluIG9uZSBmaW5hbCBwdXNo
Lgo+Cj4gRG8geW91IG1lYW4gdG8gc2VuZCB0aGVtIGFzIHNlcGFyYXRlIHBlci1zdWJzeXN0ZW0g
c2VyaWVzLCBvciBhbGwgaW4gb25lLAo+IGJ1dCBsaW1pdGVkIHRvIHNvbWUgc3Vic3lzdGVtcz8K
CkxldCdzIG1ha2UgaXQgYXMgZWFzeSBhcyB3ZSBjYW4gYm90aCBmb3IgdGhlIHN1YnN5c3RlbSBt
YWludGFpbmVycyBhbmQKZm9yIHRoZSBwZW9wbGUgdHJ5aW5nIHRvIHRyYWNrIGFsbCBvZiBpdC4K
CldoZW4gYSBzdWJzeXN0ZW0gdGFrZXMgbXVsdGlwbGUgcGF0Y2hlcywgSSdkIGNvbnNpZGVyIGFu
IGluZGVwZW5kZW50CnNlcmllcyB0byBzYXZlIHRoZSBtYWludGFpbmVyIHRoZSB0cm91YmxlIG9m
IGV4dHJhY3RpbmcgbXVsdGlwbGUgcGF0Y2hlcwpmcm9tIGEgbGFyZ2VyIHNlcmllcy4KCkZvciB0
aGUgb25lcyB0aGF0IHRha2UganVzdCBvbmUgcGF0Y2gsIEknZCBjb25zaWRlciBhbiBvbW5pYnVz
IHNlcmllcy4KRXh0cmFjdGluZyBhIHNpbmdsZSBwYXRjaCBpcyBubyBoYXJkZXIgdGhhbiBhcHBs
eWluZyBhIHNlcmllcywgYnV0CnRyYWNraW5nIG9uZSBvbW5pYnVzIGlzIGVhc2llciB0aGFuIGEg
ZG96ZW4gbG9uZSBwYXRjaGVzLgoKVGhlcmUncyBubyBjbGVhciBsaW5lIGJldHdlZW4gImJ1c3ki
IGFuZCAibGVzcyBidXN5IiBzdWJzeXN0ZW0uICBKdXN0CnN0YXJ0IHdpdGggc29tZSBvYnZpb3Vz
bHkgYnVzeSBvbmVzLCB0aGVuIGl0ZXJhdGUuICBFYWNoIGl0ZXJhdGlvbgpzaG91bGQgYmUgbGFy
Z2UgZW5vdWdoIHRvIGJlIHdvcnRoIHRoZSBvdmVyaGVhZCwgeWV0IHNtYWxsIGVub3VnaCBub3Qg
dG8Kc2NhcmUgb2ZmIHJldmlld2VycyA6KQoKVHJ1c3QgeW91ciBqdWRnZW1lbnQhCgpbLi4uXQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
