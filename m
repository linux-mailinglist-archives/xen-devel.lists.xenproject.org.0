Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8088103B44
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 14:24:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXPtx-0002fn-5z; Wed, 20 Nov 2019 13:20:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Sg=ZM=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1iXPof-00020I-NA
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 13:14:41 +0000
X-Inumbo-ID: b506e49e-0b97-11ea-9631-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b506e49e-0b97-11ea-9631-bc764e2007e4;
 Wed, 20 Nov 2019 13:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574255678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPXFGLzziNWXlHtDlx+id3E16uwnVocjU9q+wnQ7Ym4=;
 b=CZ+YVa2+R0nFjKwo5riX6LstrPXOzFI126p6j8La+s/nEx0lfqTPAd70uQYjjKyKRVYDfx
 j0T6OOhRfzQp+Cckp/2CPLSR2yHhDEzWLKA2gmmXNtY/YJZCn38ZyfVVeZw636uQ8KK5SE
 T3vWDbhIkrH19LFl+6xuRxECK2lFft4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-jUJm-5ZPMnqUBdXvoJ3LDA-1; Wed, 20 Nov 2019 08:14:20 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EF04800A02;
 Wed, 20 Nov 2019 13:14:13 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E45636106E;
 Wed, 20 Nov 2019 13:13:23 +0000 (UTC)
Date: Wed, 20 Nov 2019 14:13:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20191120131322.GB5779@linux.fritz.box>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <d1756cd0-8ad7-1e6c-b127-59ed24c5e512@virtuozzo.com>
 <538354c8-7ba9-8b1c-476e-5733c418207b@virtuozzo.com>
 <606dbe22-0d1e-66bb-aba9-681ca7961623@redhat.com>
MIME-Version: 1.0
In-Reply-To: <606dbe22-0d1e-66bb-aba9-681ca7961623@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: jUJm-5ZPMnqUBdXvoJ3LDA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 20 Nov 2019 13:20:08 +0000
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
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Anthony Green <green@moxielogic.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
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
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
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
 Denis Lunev <den@virtuozzo.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 "armbru@redhat.com" <armbru@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW0gMjAuMTEuMjAxOSB1bSAxMzo1OSBoYXQgRXJpYyBCbGFrZSBnZXNjaHJpZWJlbjoKPiBPbiAx
MS8yMC8xOSAzOjUwIEFNLCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IHdyb3RlOgo+ID4g
T2theS4uLgo+ID4gCj4gPiBJIHRoaW5rIHRoYXQ6Cj4gPiAKPiA+IDEuIEEgbG90IG9mIGVmZm9y
dHMgKG5vdCBvbmx5IG15LCBJIHRoaW5rIHJldmlld2luZyBpcyBhbHJlYWR5IGV4Y2VlZGVkIGdl
bmVyYXRpb24gZWZmb3J0cykKPiA+ICAgICBhcmUgbWFkZSwgaXQgd291bGQgYmUgc2FkIHRvIGxv
c2UgdGhlbS4KPiA+IAo+ID4gMi4gSXQncyBzYWZlIGVub3VnaCB0byBhcHBseSBvbmx5IHBhcnQg
b2YgZ2VuZXJhdGVkIHBhdGNoZXM6IHdlIGp1c3QgZml4IGVycm9yX2Fib3J0L2Vycm9yX2ZhdGFs
Cj4gPiAgICAgaW4gbW9yZSBwb3B1bGFyIHN1YnN5c3RlbXMsIHdoYXQncyB3cm9uZyB3aXRoIHRo
YXQ/IFdoeSBub3QgdG8gY292ZXIgODAlIGNhc2VzIGJ5IDIwJSBlZmZvcnRzPwo+ID4gCj4gPiAz
LiBJdCdzIG9idmlvdXNseSBpbXBvc3NpYmxlIHRvIG1lcmdlIHRoZSB3aG9sZSBzZXJpZXMuIEEg
bG90IG9mIHRpbWUgcGFzc2VkLCBzZXJpZXMgZGl2ZXJnZXMuCj4gPiAKPiA+IAo+ID4gU28gSSBw
cm9wb3NlIHRoZSBmb2xsb3dpbmcgcGxhbjoKPiA+IAo+ID4gMS4gSSByZXNlbmQgc21hbGwgc2Vw
YXJhdGUgc2VyaWVzIG9mIHByZXBhcmF0aW9uIHBhdGNoZXMgcGVyIG1haW50YWluZXIuIFRoZXkg
YXJlIGdvb2QgYW55d2F5Lgo+ID4gCj4gPiAyLiBXZSBjb21taXQgcGF0Y2ggd2l0aCBtYWNybyAo
Y2hhbmdpbmcgTVVTVCB0byBTSE9VTEQgaW4gZG9jdW1lbnRhdGlvbikgYW5kIGNvY2NpbmVsbGUg
c2NyaXB0Lgo+ID4gICAgICAob3IgdGhhdCBtYXkgYmUgY29tYmluZWQgd2l0aCB0aGUgZmlyc3Qg
c2VyaWVzIGZyb20gWzMuXSkKPiA+IAo+ID4gMy4gV2hlbiBvbmUgb2YgcHJlcGFyYXRpb25zIHRh
a2VuIHRvIG1haW50YWluZXIncyB0cmVlLCBJIHNlbmQgZ2VuZXJhdGVkIHBhdGNoZXMgZm9yCj4g
PiAgICAgIGl0cyBtYWludGFpbmVyLgo+IAo+IEknZCBzdGlsbCBwcmVmZXIgd2FpdGluZyBmb3Ig
ZGlyZWN0aW9uIGZyb20gTWFya3VzLiAgV2UndmUgYmVlbiB0aWVkIHVwIGJ5Cj4gb3RoZXIgdGhp
bmdzIChLVk0gRm9ydW0sIDQuMiByZWxlYXNlKSwgYnV0IG5vdyB0aGF0IHdlIGFyZSBpbiBmcmVl
emUsIHRoaXMKPiBpcyBhY3R1YWxseSBhIEdPT0QgdGltZSBmb3IgTWFya3VzIHRvIGZpbmFsbHkg
Z2V0IGJhY2sgdG8gdGhpcyBzZXJpZXMsIGFuZAo+IHRoZXJlIGlzIGdvaW5nIHRvIGJlIGxlc3Mg
cmViYXNpbmcgbmVlZGVkIGlmIHdlIGNhbiBhcHBseSB0aGUgZW50aXJlIGNsZWFudXAKPiByaWdo
dCBhcyA1LjAgZGV2ZWxvcG1lbnQgb3BlbnMgaW4gYSBjb3VwbGUgb2Ygd2Vla3MuCgpBY3R1YWxs
eSwgdGhhdCdzIHBvc3NpYmx5IHRoZSB3b3JzdCBwb3NzaWJsZSB0aW1lIGZvciBhdm9pZGluZyBj
b25mbGljdHMKYmVjYXVzZSBkdXJpbmcgZnJlZXplLCBtYWludGFpbmVycyBhcmUgY29sbGVjdGlu
ZyBzdHVmZiBpbiBwcml2YXRlCmJyYW5jaGVzIGZvciB3ZWVrcyB3aXRob3V0IGdldHRpbmcgaXQg
aW50byBtYXN0ZXIuCgpJZiB5b3UgYXJlIHRoZSBvbmUgd2hvIGdldHMgbWVyZ2VkIGZpcnN0ICh3
aGF0IGFyZSB0aGUgb2Rkcz8pLCB0aGF0CnNvbHZlcyB0aGUgcHJvYmxlbSBmb3IgeW91LCBidXQg
dGhlbiBldmVyeW9uZSBlbHNlIHdpbGwgZ2V0IGNvbmZsaWN0cy4KCkkgbGlrZSBWbGFkaW1pcidz
IG5ldyBwbGFuLgoKS2V2aW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
