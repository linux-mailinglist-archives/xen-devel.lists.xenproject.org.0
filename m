Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ACBD4D17
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2019 07:01:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJ9Pr-0003LQ-Hw; Sat, 12 Oct 2019 04:54:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OAML=YE=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1iIzSH-0006nu-KA
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 18:15:57 +0000
X-Inumbo-ID: 2b673f08-ec53-11e9-933e-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b673f08-ec53-11e9-933e-12813bfff9fa;
 Fri, 11 Oct 2019 18:15:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8FB3D30BB370;
 Fri, 11 Oct 2019 18:15:54 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42A2C60BF4;
 Fri, 11 Oct 2019 18:15:16 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-26-vsementsov@virtuozzo.com>
 <5dd4d642-7ea6-42a2-66fc-6d6710b77b8d@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f846f0dc-854f-90f7-5f25-eb4f2b461520@redhat.com>
Date: Fri, 11 Oct 2019 13:15:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <5dd4d642-7ea6-42a2-66fc-6d6710b77b8d@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 11 Oct 2019 18:15:56 +0000 (UTC)
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
 Laszlo Ersek <lersek@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
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
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Liu Yuan <namei.unix@gmail.com>,
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
 Anthony Green <green@moxielogic.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Ari Sundholm <ari@tuxera.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Jason Dillaman <dillaman@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 xen-devel@lists.xenproject.org, integration@gluster.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
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

T24gMTAvMTEvMTkgMTI6MTIgUE0sIEVyaWMgQmxha2Ugd3JvdGU6Cj4gT24gMTAvMTEvMTkgMTE6
MDQgQU0sIFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgd3JvdGU6Cj4+IFNpZ25lZC1vZmYt
Ynk6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNv
bT4KPj4gLS0tCj4+Cgo+PiArQEAKPj4gK2lkZW50aWZpZXIgcnVsZTEuZm47Cj4+ICtpZGVudGlm
aWVyIHJ1bGUxLmxvY2FsX2VycjsKPj4gK0BACj4+ICsKPj4gKyBmbiguLi4pCj4+ICsgewo+PiAr
wqDCoMKgwqAgPC4uLgo+PiArKAo+PiArLcKgwqDCoCBlcnJvcl9mcmVlKGxvY2FsX2Vycik7Cj4+
ICstwqDCoMKgIGxvY2FsX2VyciA9IE5VTEw7Cj4+ICsrwqDCoMKgIGVycm9yX2ZyZWVfZXJycChl
cnJwKTsKPiAKPiBUaGlzIGRvZXMgbm90IG1ha2Ugc2Vuc2UgLSBlcnJvcl9mcmVlX2VycnAoKSBp
cyBub3QgZGVmaW5lZCBwcmlvciB0byAKPiB0aGlzIHNlcmllcyBvciBhbnl3aGVyZSBpbiBwYXRj
aGVzIDEtMjQsIGlmIEknbSByZWFkaW5nIGl0IGNvcnJlY3RseS4KCkFwb2xvZ2llcyAtIEkgc2Vu
dCBteSByZXBseSB0byB0aGlzIG1lc3NhZ2UgYmVmb3JlIDIxLzEyNiBzaG93ZWQgdXAgaW4gCm15
IGluYm94LCBhbmQgZGlkbid0IHJlYWxpemUgdGhhdCBJIGhhZCBza2lwcGVkIG92ZXIgc2VxdWVu
Y2luZy4gIFRoaXMgCnBhcnQgaXMgZmluZSBhZnRlciBhbGwsIGJ1dCBpdCBwb2ludHMgdG8gdGhl
IHBlcmlscyBvZiByZXZpZXdpbmcgYSAKdGhyZWFkIGFzIGl0IGNvbWVzIGluIHBpZWNlbWVhbCwg
dnMuIHJldmlld2luZyBhbiBhY3R1YWwgYnJhbmNoIHdpdGggYWxsIApwYXRjaGVzIGluc3RhbnRs
eSBhdmFpbGFibGUuCgotLSAKRXJpYyBCbGFrZSwgUHJpbmNpcGFsIFNvZnR3YXJlIEVuZ2luZWVy
ClJlZCBIYXQsIEluYy4gICAgICAgICAgICsxLTkxOS0zMDEtMzIyNgpWaXJ0dWFsaXphdGlvbjog
IHFlbXUub3JnIHwgbGlidmlydC5vcmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
