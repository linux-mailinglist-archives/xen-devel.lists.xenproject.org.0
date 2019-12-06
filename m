Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E56114EF6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 11:22:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idAiE-0003E0-AO; Fri, 06 Dec 2019 10:19:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=akry=Z4=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1id8ki-00016S-HD
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 08:14:16 +0000
X-Inumbo-ID: 6438cc07-1800-11ea-824b-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6438cc07-1800-11ea-824b-12813bfff9fa;
 Fri, 06 Dec 2019 08:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575620054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QydCtaGu0VxNLL1vkJgck5UBv6FIuo7+xYoT62obZJU=;
 b=dMrCNcrNIVOi3/5hxgXyr76R6JlPf5O90wpL7h5vjYKKJva8i1GQbPem2xnPebOsyzM45g
 qhzAAJQuiOnQ10YEaQuqbw9q+S8Sa2oaG5bX/ndjVMbDpFy9f5VS4V8UBCcjbNvHnERxxS
 UjaGnfZTF4T7Suy00DYJiheoarS9Zqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-W0n4kzfiMeKW3rQCHhbFpA-1; Fri, 06 Dec 2019 03:14:11 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18DE2107ACC7;
 Fri,  6 Dec 2019 08:14:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A48DE60143;
 Fri,  6 Dec 2019 08:13:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 22B421138606; Fri,  6 Dec 2019 09:13:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-25-vsementsov@virtuozzo.com>
 <87muc8p24w.fsf@dusky.pond.sub.org>
 <55393c08-5bda-8042-1a95-f350b3781d99@virtuozzo.com>
 <87d0d3c5k7.fsf@dusky.pond.sub.org>
 <eef60af5-ff92-3df7-bad5-c981690d66ad@virtuozzo.com>
 <a6df5b5b-7b76-fe38-cbd4-f2473a109d3d@virtuozzo.com>
Date: Fri, 06 Dec 2019 09:13:57 +0100
In-Reply-To: <a6df5b5b-7b76-fe38-cbd4-f2473a109d3d@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 5 Dec 2019 16:36:42 +0000")
Message-ID: <87h82dna62.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: W0n4kzfiMeKW3rQCHhbFpA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Fri, 06 Dec 2019 10:19:49 +0000
Subject: Re: [Xen-devel] [RFC v5 024/126] error: auto propagated local_err
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
cml0ZXM6Cgo+IDA1LjEyLjIwMTkgMTc6NTgsIFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkg
d3JvdGU6Cj4+IDA1LjEyLjIwMTkgMTU6MzYsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4g
VmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3
cml0ZXM6Cj4+Pgo+Pj4+IDA0LjEyLjIwMTkgMTc6NTksIE1hcmt1cyBBcm1icnVzdGVyIHdyb3Rl
Ogo+Pj4+PiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6
by5jb20+IHdyaXRlczoKPj4+Pj4KPj4+Pj4+IEhlcmUgaXMgaW50cm9kdWNlZCBFUlJQX0FVVE9f
UFJPUEFHQVRFIG1hY3JvLCB0byBiZSB1c2VkIGF0IHN0YXJ0IG9mCj4+Pj4+PiBmdW5jdGlvbnMg
d2l0aCBlcnJwIE9VVCBwYXJhbWV0ZXIuCj4+Pj4+Pgo+Pj4+Pj4gSXQgaGFzIHRocmVlIGdvYWxz
Ogo+Pj4+Pj4KPj4+Pj4+IDEuIEZpeCBpc3N1ZSB3aXRoIGVycm9yX2ZhdGFsICYgZXJyb3JfcHJl
cGVuZC9lcnJvcl9hcHBlbmRfaGludDogdXNlcgo+Pj4+Pj4gY2FuJ3Qgc2VlIHRoaXMgYWRkaXRp
b25hbCBpbmZvcm1hdGlvbiwgYmVjYXVzZSBleGl0KCkgaGFwcGVucyBpbgo+Pj4+Pj4gZXJyb3Jf
c2V0ZyBlYXJsaWVyIHRoYW4gaW5mb3JtYXRpb24gaXMgYWRkZWQuIFtSZXBvcnRlZCBieSBHcmVn
IEt1cnpdCj4+Pj4+Pgo+Pj4+Pj4gMi4gRml4IGlzc3VlIHdpdGggZXJyb3JfYWJvcnQgJiBlcnJv
cl9wcm9wYWdhdGU6IHdoZW4gd2Ugd3JhcAo+Pj4+Pj4gZXJyb3JfYWJvcnQgYnkgbG9jYWxfZXJy
K2Vycm9yX3Byb3BhZ2F0ZSwgcmVzdWx0aW5nIGNvcmVkdW1wIHdpbGwKPj4+Pj4+IHJlZmVyIHRv
IGVycm9yX3Byb3BhZ2F0ZSBhbmQgbm90IHRvIHRoZSBwbGFjZSB3aGVyZSBlcnJvciBoYXBwZW5l
ZC4KPj4+Pj4KPj4+Pj4gSSBnZXQgd2hhdCB5b3UgbWVhbiwgYnV0IEkgaGF2ZSBwbGVudHkgb2Yg
Y29udGV4dC4KPj4+Pj4KPj4+Pj4+ICh0aGUgbWFjcm8gaXRzZWxmIGRvZXNuJ3QgZml4IHRoZSBp
c3N1ZSwgYnV0IGl0IGFsbG93cyB0byBbMy5dIGRyb3AgYWxsCj4+Pj4+PiBsb2NhbF9lcnIrZXJy
b3JfcHJvcGFnYXRlIHBhdHRlcm4sIHdoaWNoIHdpbGwgZGVmaW5pdGVseSBmaXggdGhlIGlzc3Vl
KQo+Pj4+Pgo+Pj4+PiBUaGUgcGFyZW50aGVzaXMgaXMgbm90IHBhcnQgb2YgdGhlIGdvYWwuCj4+
Pj4+Cj4+Pj4+PiBbUmVwb3J0ZWQgYnkgS2V2aW4gV29sZl0KPj4+Pj4+Cj4+Pj4+PiAzLiBEcm9w
IGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUgcGF0dGVybiwgd2hpY2ggaXMgdXNlZCB0byB3b3Jr
YXJvdW5kCj4+Pj4+PiB2b2lkIGZ1bmN0aW9ucyB3aXRoIGVycnAgcGFyYW1ldGVyLCB3aGVuIGNh
bGxlciB3YW50cyB0byBrbm93IHJlc3VsdGluZwo+Pj4+Pj4gc3RhdHVzLiAoTm90ZTogYWN0dWFs
bHkgdGhlc2UgZnVuY3Rpb25zIGNvdWxkIGJlIG1lcmVseSB1cGRhdGVkIHRvCj4+Pj4+PiByZXR1
cm4gaW50IGVycm9yIGNvZGUpLgo+Pj4+Pj4KPj4+Pj4+IFRvIGFjaGlldmUgdGhlc2UgZ29hbHMs
IHdlIG5lZWQgdG8gYWRkIGludm9jYXRpb24gb2YgdGhlIG1hY3JvIGF0IHN0YXJ0Cj4+Pj4+PiBv
ZiBmdW5jdGlvbnMsIHdoaWNoIG5lZWRzIGVycm9yX3ByZXBlbmQvZXJyb3JfYXBwZW5kX2hpbnQg
KDEuKTsgYWRkCj4+Pj4+PiBpbnZvY2F0aW9uIG9mIHRoZSBtYWNybyBhdCBzdGFydCBvZiBmdW5j
dGlvbnMgd2hpY2ggZG8KPj4+Pj4+IGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUgc2NlbmFyaW8g
dGhlIGNoZWNrIGVycm9ycywgZHJvcCBsb2NhbCBlcnJvcnMKPj4+Pj4+IGZyb20gdGhlbSBhbmQg
anVzdCB1c2UgKmVycnAgaW5zdGVhZCAoMi4sIDMuKS4KPj4+Pj4KPj4+Pj4gVGhlIHBhcmFncmFw
aCB0YWxrcyBhYm91dCB0d28gY2FzZXM6IDEuIGFuZCAyLiszLgo+Pj4+Cj4+Pj4gSG1tLCBJIGRv
bid0IHRoaW5rIHNvLi4gMS4gYW5kIDIuIGFyZSBpc3N1ZXMuIDMuIGlzIGEgcmVmYWN0b3Jpbmcu
LiBXZSBqdXN0Cj4+Pj4gZml4IGFjaGlldmUgMiBhbmQgMyBieSBvbmUgYWN0aW9uLgo+Pj4+Cj4+
Pj4+IE1ha2VzIG1lIHRoaW5rIHdlCj4+Pj4+IHdhbnQgdHdvIHBhcmFncmFwaHMsIGVhY2ggaWxs
dXN0cmF0ZWQgd2l0aCBhbiBleGFtcGxlLgo+Pj4+Pgo+Pj4+PiBXaGF0IGFib3V0IHlvdSBwcm92
aWRlIHRoZSBleGFtcGxlcywgYW5kIHRoZW4gSSB0cnkgdG8gcG9saXNoIHRoZSBwcm9zZT8KPj4+
Pgo+Pj4+IDE6IGVycm9yX2ZhdGFsIHByb2JsZW0KPj4+Pgo+Pj4+IEFzc3VtZSB0aGUgZm9sbG93
aW5nIGNvZGUgZmxvdzoKPj4+Pgo+Pj4+IGludCBmMShlcnJwKSB7Cj4+Pj4gICAgICAgLi4uCj4+
Pj4gICAgICAgcmV0ID0gZjIoZXJycCk7Cj4+Pj4gICAgICAgaWYgKHJldCA8IDApIHsKPj4+PiAg
ICAgICAgICBlcnJvcl9hcHBlbmRfaGludChlcnJwLCAidmVyeSB1c2VmdWwgaGludCIpOwo+Pj4+
ICAgICAgICAgIHJldHVybiByZXQ7Cj4+Pj4gICAgICAgfQo+Pj4+ICAgICAgIC4uLgo+Pj4+IH0K
Pj4+Pgo+Pj4+IE5vdywgaWYgd2UgY2FsbCBmMSB3aXRoICZlcnJvcl9mYXRhbCBhcmd1bWVudCBh
bmQgZjIgZmFpbHMsIHRoZSBwcm9ncmFtCj4+Pj4gd2lsbCBleGl0IGltbWVkaWF0ZWx5IGluc2lk
ZSBmMiwgd2hlbiBzZXR0aW5nIHRoZSBlcnJwLiBVc2VyIHdpbGwgbm90Cj4+Pj4gc2VlIHRoZSBo
aW50Lgo+Pj4+Cj4+Pj4gU28sIGluIHRoaXMgY2FzZSB3ZSBzaG91bGQgdXNlIGxvY2FsX2Vyci4K
Pj4+Cj4+PiBIb3cgZG9lcyB0aGlzIGV4YW1wbGUgbG9vayBhZnRlciB0aGUgdHJhbnNmb3JtYXRp
b24/Cj4+IAo+PiBHb29kIHBvaW50Lgo+PiAKPj4gaW50IGYxKGVycnApIHsKPj4gICAgICBFUlJQ
X0FVVE9fUFJPUEFHQVRFKCk7Cj4+ICAgICAgLi4uCj4+ICAgICAgcmV0ID0gZjIoZXJycCk7Cj4+
ICAgICAgaWYgKHJldCA8IDApIHsKPj4gICAgICAgICBlcnJvcl9hcHBlbmRfaGludChlcnJwLCAi
dmVyeSB1c2VmdWwgaGludCIpOwo+PiAgICAgICAgIHJldHVybiByZXQ7Cj4+ICAgICAgfQo+PiAg
ICAgIC4uLgo+PiB9Cj4+IAo+PiAtIG5vdGhpbmcgY2hhbmdlZCwgb25seSBhZGQgbWFjcm8gYXQg
c3RhcnQuIEJ1dCBub3cgZXJycCBpcyBzYWZlLCBpZiBpdCB3YXMKPj4gZXJyb3JfZmF0YWwgaXQg
aXMgd3JhcHBlZCBieSBsb2NhbCBlcnJvciwgYW5kIHdpbGwgb25seSBjYWxsIGV4aXQgb24gYXV0
b21hdGljCj4+IHByb3BhZ2F0aW9uIG9uIGYxIGZpbmlzaC4KPj4gCj4+Pgo+Pj4+IDI6IGVycm9y
X2Fib3J0IHByb2JsZW0KPj4+Pgo+Pj4+IE5vdywgY29uc2lkZXIgZnVuY3Rpb25zIHdpdGhvdXQg
cmV0dXJuIHZhbHVlLiBXZSBub3JtYWxseSB1c2UgbG9jYWxfZXJyCj4+Pj4gdmFyaWFibGUgdG8g
Y2F0Y2ggZmFpbHVyZXM6Cj4+Pj4KPj4+PiB2b2lkIGYxKGVycnApIHsKPj4+PiAgICAgICBFcnJv
ciAqbG9jYWxfZXJyID0gTlVMTDsKPj4+PiAgICAgICAuLi4KPj4+PiAgICAgICBmMigmbG9jYWxf
ZXJyKTsKPj4+PiAgICAgICBpZiAobG9jYWxfZXJyKSB7Cj4+Pj4gICAgICAgICAgIGVycm9yX3By
b3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpOwo+Pj4+ICAgICAgICAgICByZXR1cm47Cj4+Pj4gICAg
ICAgfQo+Pj4+ICAgICAgIC4uLgo+Pj4+IH0KPj4+Pgo+Pj4+IE5vdywgaWYgd2UgY2FsbCBmMiB3
aXRoICZlcnJvcl9hYm9ydCBhbmQgZjIgZmFpbHMsIHRoZSBzdGFjayBpbiByZXN1bHRpbmcKPj4+
PiBjcmFzaCBkdW1wIHdpbGwgcG9pbnQgdG8gZXJyb3JfcHJvcGFnYXRlLCBub3QgdG8gdGhlIGZh
aWx1cmUgcG9pbnQgaW4gZjIsCj4+Pj4gd2hpY2ggY29tcGxpY2F0ZXMgZGVidWdnaW5nLgo+Pj4+
Cj4+Pj4gU28sIHdlIHNob3VsZCBuZXZlciB3cmFwIGVycm9yX2Fib3J0IGJ5IGxvY2FsX2Vyci4K
Pj4+Cj4+PiBMaWtld2lzZS4KPj4gCj4+IEFuZCBoZXJlOgo+PiAKPj4gdm9pZCBmMShlcnJwKSB7
Cj4+ICAgICAgIEVSUlBfQVVUT19QUk9QQUdBVEUoKTsKPj4gICAgICAgLi4uCj4+ICAgICAgIGYy
KGVycnApOwo+PiAgICAgICBpZiAoKmVycnApIHsKPj4gICAgICAgICAgIHJldHVybjsKPj4gICAg
ICAgfQo+PiAgICAgICAuLi4KPj4gCj4+IC0gaWYgZXJycCB3YXMgTlVMTCwgaXQgaXMgd3JhcHBl
ZCwgc28gZGVyZWZlcmVuY2luZyBlcnJwIGlzIHNhZmUuIE9uIHJldHVybiwKPj4gICAgIGxvY2Fs
IGVycm9yIGlzIGF1dG9tYXRpY2FsbHkgcHJvcGFnYXRlZCB0byBvcmlnaW5hbCBvbmUuCj4KPiBh
bmQgaWYgaXQgd2FzIGVycm9yX2Fib3J0LCBpdCBpcyBub3Qgd3JhcHBlZCwgc28gd2lsbCBjcmFz
aCB3aGVyZSBmYWlsZWQuCgpXZSBzdGlsbCBuZWVkIHRvIGF2b2lkIHBhc3Npbmcgb24gdW53cmFw
cGVkIEBlcnJwIHdoZW4gd2Ugd2FudCB0byBpZ25vcmUKc29tZSBlcnJvcnMsIGFzIGluIGZpdF9s
b2FkX2ZkdCgpLCBidXQgdGhhdCBzaG91bGQgYmUgcXVpdGUgcmFyZS4KRG9lc24ndCBpbnZhbGlk
YXRlIHlvdXIgYXBwcm9hY2guCgpbLi4uXQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
