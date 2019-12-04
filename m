Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB0511303B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:49:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icXn3-0000jz-Si; Wed, 04 Dec 2019 16:46:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=870U=Z2=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1icW8a-000784-Ks
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 15:00:20 +0000
X-Inumbo-ID: c9bceffe-16a6-11ea-aea8-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c9bceffe-16a6-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 15:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575471618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajRfpg8Ys2mundddq1XB+ae7HTn9RvM1JIztRsA+x88=;
 b=BUl/FijRlL0IY0AAUwSn+JI9THkPCT3dm9GKbrm6idfNIkidM4Jy4q8AVWN7slVPudz+Uj
 jAzYQFD9tK9HsjrzkYh8MjALwJlVyV/ZEzxzAxm76aPM/+QyXOhqY6XU+pTAXtLvocpFJD
 cge4BXEll1iFEfID9Mf9DGB1j/SHMfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-Jhx4xBhqM-CjhS_GhlRHSQ-1; Wed, 04 Dec 2019 10:00:16 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73F1518543AE;
 Wed,  4 Dec 2019 15:00:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 570BB691A3;
 Wed,  4 Dec 2019 15:00:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C11E51138606; Wed,  4 Dec 2019 15:59:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-25-vsementsov@virtuozzo.com>
Date: Wed, 04 Dec 2019 15:59:59 +0100
In-Reply-To: <20191011160552.22907-25-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 11 Oct 2019 19:04:10 +0300")
Message-ID: <87muc8p24w.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Jhx4xBhqM-CjhS_GhlRHSQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Wed, 04 Dec 2019 16:46:13 +0000
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

VmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3
cml0ZXM6Cgo+IEhlcmUgaXMgaW50cm9kdWNlZCBFUlJQX0FVVE9fUFJPUEFHQVRFIG1hY3JvLCB0
byBiZSB1c2VkIGF0IHN0YXJ0IG9mCj4gZnVuY3Rpb25zIHdpdGggZXJycCBPVVQgcGFyYW1ldGVy
Lgo+Cj4gSXQgaGFzIHRocmVlIGdvYWxzOgo+Cj4gMS4gRml4IGlzc3VlIHdpdGggZXJyb3JfZmF0
YWwgJiBlcnJvcl9wcmVwZW5kL2Vycm9yX2FwcGVuZF9oaW50OiB1c2VyCj4gY2FuJ3Qgc2VlIHRo
aXMgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiwgYmVjYXVzZSBleGl0KCkgaGFwcGVucyBpbgo+IGVy
cm9yX3NldGcgZWFybGllciB0aGFuIGluZm9ybWF0aW9uIGlzIGFkZGVkLiBbUmVwb3J0ZWQgYnkg
R3JlZyBLdXJ6XQo+Cj4gMi4gRml4IGlzc3VlIHdpdGggZXJyb3JfYWJvcnQgJiBlcnJvcl9wcm9w
YWdhdGU6IHdoZW4gd2Ugd3JhcAo+IGVycm9yX2Fib3J0IGJ5IGxvY2FsX2VycitlcnJvcl9wcm9w
YWdhdGUsIHJlc3VsdGluZyBjb3JlZHVtcCB3aWxsCj4gcmVmZXIgdG8gZXJyb3JfcHJvcGFnYXRl
IGFuZCBub3QgdG8gdGhlIHBsYWNlIHdoZXJlIGVycm9yIGhhcHBlbmVkLgoKSSBnZXQgd2hhdCB5
b3UgbWVhbiwgYnV0IEkgaGF2ZSBwbGVudHkgb2YgY29udGV4dC4KCj4gKHRoZSBtYWNybyBpdHNl
bGYgZG9lc24ndCBmaXggdGhlIGlzc3VlLCBidXQgaXQgYWxsb3dzIHRvIFszLl0gZHJvcCBhbGwK
PiBsb2NhbF9lcnIrZXJyb3JfcHJvcGFnYXRlIHBhdHRlcm4sIHdoaWNoIHdpbGwgZGVmaW5pdGVs
eSBmaXggdGhlIGlzc3VlKQoKVGhlIHBhcmVudGhlc2lzIGlzIG5vdCBwYXJ0IG9mIHRoZSBnb2Fs
LgoKPiBbUmVwb3J0ZWQgYnkgS2V2aW4gV29sZl0KPgo+IDMuIERyb3AgbG9jYWxfZXJyK2Vycm9y
X3Byb3BhZ2F0ZSBwYXR0ZXJuLCB3aGljaCBpcyB1c2VkIHRvIHdvcmthcm91bmQKPiB2b2lkIGZ1
bmN0aW9ucyB3aXRoIGVycnAgcGFyYW1ldGVyLCB3aGVuIGNhbGxlciB3YW50cyB0byBrbm93IHJl
c3VsdGluZwo+IHN0YXR1cy4gKE5vdGU6IGFjdHVhbGx5IHRoZXNlIGZ1bmN0aW9ucyBjb3VsZCBi
ZSBtZXJlbHkgdXBkYXRlZCB0bwo+IHJldHVybiBpbnQgZXJyb3IgY29kZSkuCj4KPiBUbyBhY2hp
ZXZlIHRoZXNlIGdvYWxzLCB3ZSBuZWVkIHRvIGFkZCBpbnZvY2F0aW9uIG9mIHRoZSBtYWNybyBh
dCBzdGFydAo+IG9mIGZ1bmN0aW9ucywgd2hpY2ggbmVlZHMgZXJyb3JfcHJlcGVuZC9lcnJvcl9h
cHBlbmRfaGludCAoMS4pOyBhZGQKPiBpbnZvY2F0aW9uIG9mIHRoZSBtYWNybyBhdCBzdGFydCBv
ZiBmdW5jdGlvbnMgd2hpY2ggZG8KPiBsb2NhbF9lcnIrZXJyb3JfcHJvcGFnYXRlIHNjZW5hcmlv
IHRoZSBjaGVjayBlcnJvcnMsIGRyb3AgbG9jYWwgZXJyb3JzCj4gZnJvbSB0aGVtIGFuZCBqdXN0
IHVzZSAqZXJycCBpbnN0ZWFkICgyLiwgMy4pLgoKVGhlIHBhcmFncmFwaCB0YWxrcyBhYm91dCB0
d28gY2FzZXM6IDEuIGFuZCAyLiszLiAgTWFrZXMgbWUgdGhpbmsgd2UKd2FudCB0d28gcGFyYWdy
YXBocywgZWFjaCBpbGx1c3RyYXRlZCB3aXRoIGFuIGV4YW1wbGUuCgpXaGF0IGFib3V0IHlvdSBw
cm92aWRlIHRoZSBleGFtcGxlcywgYW5kIHRoZW4gSSB0cnkgdG8gcG9saXNoIHRoZSBwcm9zZT8K
Cj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNv
dkB2aXJ0dW96em8uY29tPgo+IFJldmlld2VkLWJ5OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0
LmNvbT4KPiAtLS0KPgo+IENDOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBD
QzogIkdvbmdsZWkgKEFyZWkpIiA8YXJlaS5nb25nbGVpQGh1YXdlaS5jb20+Cj4gQ0M6IEVkdWFy
ZG8gSGFia29zdCA8ZWhhYmtvc3RAcmVkaGF0LmNvbT4KPiBDQzogSWdvciBNYW1tZWRvdiA8aW1h
bW1lZG9AcmVkaGF0LmNvbT4KPiBDQzogTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJAcmVkaGF0LmNv
bT4KPiBDQzogQW1pdCBTaGFoIDxhbWl0QGtlcm5lbC5vcmc+Cj4gQ0M6IEtldmluIFdvbGYgPGt3
b2xmQHJlZGhhdC5jb20+Cj4gQ0M6IE1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+Cj4gQ0M6
IEpvaG4gU25vdyA8anNub3dAcmVkaGF0LmNvbT4KPiBDQzogQXJpIFN1bmRob2xtIDxhcmlAdHV4
ZXJhLmNvbT4KPiBDQzogUGF2ZWwgRG92Z2FseXVrIDxwYXZlbC5kb3ZnYWx1a0Bpc3ByYXMucnU+
Cj4gQ0M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+Cj4gQ0M6IFN0ZWZhbiBI
YWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KPiBDQzogRmFtIFpoZW5nIDxmYW1AZXVwaG9u
Lm5ldD4KPiBDQzogU3RlZmFuIFdlaWwgPHN3QHdlaWxuZXR6LmRlPgo+IENDOiBSb25uaWUgU2Fo
bGJlcmcgPHJvbm5pZXNhaGxiZXJnQGdtYWlsLmNvbT4KPiBDQzogUGV0ZXIgTGlldmVuIDxwbEBr
YW1wLmRlPgo+IENDOiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KPiBDQzogIkRlbmlz
IFYuIEx1bmV2IiA8ZGVuQG9wZW52ei5vcmc+Cj4gQ0M6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1i
cnVAcmVkaGF0LmNvbT4KPiBDQzogQWxiZXJ0byBHYXJjaWEgPGJlcnRvQGlnYWxpYS5jb20+Cj4g
Q0M6IEphc29uIERpbGxhbWFuIDxkaWxsYW1hbkByZWRoYXQuY29tPgo+IENDOiBXZW4gQ29uZ3lh
bmcgPHdlbmNvbmd5YW5nMkBodWF3ZWkuY29tPgo+IENDOiBYaWUgQ2hhbmdsb25nIDx4aWVjaGFu
Z2xvbmcuZEBnbWFpbC5jb20+Cj4gQ0M6IExpdSBZdWFuIDxuYW1laS51bml4QGdtYWlsLmNvbT4K
PiBDQzogIlJpY2hhcmQgVy5NLiBKb25lcyIgPHJqb25lc0ByZWRoYXQuY29tPgo+IENDOiBKZWZm
IENvZHkgPGNvZHlwcmltZUBnbWFpbC5jb20+Cj4gQ0M6ICJNYXJjLUFuZHLDqSBMdXJlYXUiIDxt
YXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+Cj4gQ0M6ICJEYW5pZWwgUC4gQmVycmFuZ8OpIiA8
YmVycmFuZ2VAcmVkaGF0LmNvbT4KPiBDQzogUmljaGFyZCBIZW5kZXJzb24gPHJ0aEB0d2lkZGxl
Lm5ldD4KPiBDQzogR3JlZyBLdXJ6IDxncm91Z0BrYW9kLm9yZz4KPiBDQzogIk1pY2hhZWwgUy4g
VHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPgo+IENDOiBNYXJjZWwgQXBmZWxiYXVtIDxtYXJjZWwu
YXBmZWxiYXVtQGdtYWlsLmNvbT4KPiBDQzogQmVuaWFtaW5vIEdhbHZhbmkgPGIuZ2FsdmFuaUBn
bWFpbC5jb20+Cj4gQ0M6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4K
PiBDQzogIkPDqWRyaWMgTGUgR29hdGVyIiA8Y2xnQGthb2Qub3JnPgo+IENDOiBBbmRyZXcgSmVm
ZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pgo+IENDOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1
Pgo+IENDOiBBbmRyZXcgQmF1bWFubiA8QW5kcmV3LkJhdW1hbm5AbWljcm9zb2Z0LmNvbT4KPiBD
QzogIlBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIiA8cGhpbG1kQHJlZGhhdC5jb20+Cj4gQ0M6IEFu
dG9ueSBQYXZsb3YgPGFudG9ueW5wYXZsb3ZAZ21haWwuY29tPgo+IENDOiBKZWFuLUNocmlzdG9w
aGUgRHVib2lzIDxqY2RAdHJpYnVkdWJvaXMubmV0Pgo+IENDOiBQZXRlciBDaHViYiA8cGV0ZXIu
Y2h1YmJAbmljdGEuY29tLmF1Pgo+IENDOiBTdWJiYXJheWEgU3VuZGVlcCA8c3VuZGVlcC5sa21s
QGdtYWlsLmNvbT4KPiBDQzogRXJpYyBBdWdlciA8ZXJpYy5hdWdlckByZWRoYXQuY29tPgo+IEND
OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpckBhbGlzdGFpcjIzLm1lPgo+IENDOiAiRWRnYXIg
RS4gSWdsZXNpYXMiIDxlZGdhci5pZ2xlc2lhc0BnbWFpbC5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDQzogQW50aG9ueSBQZXJhcmQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gQ0M6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3Jn
Pgo+IENDOiBQYXVsIEJ1cnRvbiA8cGJ1cnRvbkB3YXZlY29tcC5jb20+Cj4gQ0M6IEFsZWtzYW5k
YXIgUmlrYWxvIDxhcmlrYWxvQHdhdmVjb21wLmNvbT4KPiBDQzogQ2hyaXMgV3VsZmYgPGNyd3Vs
ZmZAZ21haWwuY29tPgo+IENDOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPiBDQzogRGF2
aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+Cj4gQ0M6IENvcm5lbGlhIEh1
Y2sgPGNvaHVja0ByZWRoYXQuY29tPgo+IENDOiBIYWxpbCBQYXNpYyA8cGFzaWNAbGludXguaWJt
LmNvbT4KPiBDQzogQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIDxib3JudHJhZWdlckBkZS5pYm0uY29t
Pgo+IENDOiAiSGVydsOpIFBvdXNzaW5lYXUiIDxocG91c3NpbkByZWFjdG9zLm9yZz4KPiBDQzog
WGlhbyBHdWFuZ3JvbmcgPHhpYW9ndWFuZ3JvbmcuZXJpY0BnbWFpbC5jb20+Cj4gQ0M6IEF1cmVs
aWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4KPiBDQzogQWxla3NhbmRhciBNYXJrb3Zp
YyA8YW1hcmtvdmljQHdhdmVjb21wLmNvbT4KPiBDQzogTWFyayBDYXZlLUF5bGFuZCA8bWFyay5j
YXZlLWF5bGFuZEBpbGFuZGUuY28udWs+Cj4gQ0M6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+Cj4gQ0M6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Cj4gQ0M6IFl1dmFs
IFNoYWlhIDx5dXZhbC5zaGFpYUBvcmFjbGUuY29tPgo+IENDOiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyQHNpZml2ZS5jb20+Cj4gQ0M6IFNhZ2FyIEthcmFuZGlrYXIgPHNhZ2Fya0BlZWNzLmJlcmtl
bGV5LmVkdT4KPiBDQzogQmFzdGlhbiBLb3BwZWxtYW5uIDxrYmFzdGlhbkBtYWlsLnVuaS1wYWRl
cmJvcm4uZGU+Cj4gQ0M6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+IEND
OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4KPiBDQzogRXJpYyBGYXJtYW4gPGZhcm1h
bkBsaW51eC5pYm0uY29tPgo+IENDOiBNYXR0aGV3IFJvc2F0byA8bWpyb3NhdG9AbGludXguaWJt
LmNvbT4KPiBDQzogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuY29tPgo+IENDOiBNaWNoYWVs
IFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgo+IENDOiBBcnR5b20gVGFyYXNlbmtvIDxhdGFyNHFl
bXVAZ21haWwuY29tPgo+IENDOiBTdGVmYW4gQmVyZ2VyIDxzdGVmYW5iQGxpbnV4LmlibS5jb20+
Cj4gQ0M6IFNhbXVlbCBUaGliYXVsdCA8c2FtdWVsLnRoaWJhdWx0QGVucy1seW9uLm9yZz4KPiBD
QzogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KPiBDQzogVG9u
eSBLcm93aWFrIDxha3Jvd2lha0BsaW51eC5pYm0uY29tPgo+IENDOiBQaWVycmUgTW9yZWwgPHBt
b3JlbEBsaW51eC5pYm0uY29tPgo+IENDOiBNaWNoYWVsIFJvdGggPG1kcm90aEBsaW51eC52bmV0
LmlibS5jb20+Cj4gQ0M6IEhhaWxpYW5nIFpoYW5nIDx6aGFuZy56aGFuZ2hhaWxpYW5nQGh1YXdl
aS5jb20+Cj4gQ0M6IEp1YW4gUXVpbnRlbGEgPHF1aW50ZWxhQHJlZGhhdC5jb20+Cj4gQ0M6ICJE
ci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4KPiBDQzogTHVpZ2kg
Uml6em8gPHJpenpvQGlldC51bmlwaS5pdD4KPiBDQzogR2l1c2VwcGUgTGV0dGllcmkgPGcubGV0
dGllcmlAaWV0LnVuaXBpLml0Pgo+IENDOiBWaW5jZW56byBNYWZmaW9uZSA8di5tYWZmaW9uZUBn
bWFpbC5jb20+Cj4gQ0M6IEphbiBLaXN6a2EgPGphbi5raXN6a2FAc2llbWVucy5jb20+Cj4gQ0M6
IEFudGhvbnkgR3JlZW4gPGdyZWVuQG1veGllbG9naWMuY29tPgo+IENDOiBTdGFmZm9yZCBIb3Ju
ZSA8c2hvcm5lQGdtYWlsLmNvbT4KPiBDQzogR3VhbiBYdWV0YW8gPGd4dEBtcHJjLnBrdS5lZHUu
Y24+Cj4gQ0M6IE1heCBGaWxpcHBvdiA8amNtdmJrYmNAZ21haWwuY29tPgo+IENDOiBxZW11LWJs
b2NrQG5vbmdudS5vcmcKPiBDQzogaW50ZWdyYXRpb25AZ2x1c3Rlci5vcmcKPiBDQzogc2hlZXBk
b2dAbGlzdHMud3BrZy5vcmcKPiBDQzogcWVtdS1hcm1Abm9uZ251Lm9yZwo+IENDOiB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBDQzogcWVtdS1wcGNAbm9uZ251Lm9yZwo+IENDOiBx
ZW11LXMzOTB4QG5vbmdudS5vcmcKPiBDQzogcWVtdS1yaXNjdkBub25nbnUub3JnCj4KPiAgaW5j
bHVkZS9xYXBpL2Vycm9yLmggfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvcWFwaS9lcnJvci5oIGIvaW5jbHVkZS9xYXBpL2Vycm9yLmgKPiBpbmRleCBkNjg5
OGQ4MzNiLi40NzIzOGQ5MDY1IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvcWFwaS9lcnJvci5oCj4g
KysrIGIvaW5jbHVkZS9xYXBpL2Vycm9yLmgKPiBAQCAtMzQ1LDYgKzM0NSw0NCBAQCB2b2lkIGVy
cm9yX3NldF9pbnRlcm5hbChFcnJvciAqKmVycnAsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
IEVycm9yQ2xhc3MgZXJyX2NsYXNzLCBjb25zdCBjaGFyICpmbXQsIC4uLikKPiAgICAgIEdDQ19G
TVRfQVRUUig2LCA3KTsKPiAgCj4gK3R5cGVkZWYgc3RydWN0IEVycm9yUHJvcGFnYXRvciB7Cj4g
KyAgICBFcnJvciAqbG9jYWxfZXJyOwo+ICsgICAgRXJyb3IgKiplcnJwOwo+ICt9IEVycm9yUHJv
cGFnYXRvcjsKPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBlcnJvcl9wcm9wYWdhdG9yX2NsZWFu
dXAoRXJyb3JQcm9wYWdhdG9yICpwcm9wKQo+ICt7Cj4gKyAgICBlcnJvcl9wcm9wYWdhdGUocHJv
cC0+ZXJycCwgcHJvcC0+bG9jYWxfZXJyKTsKPiArfQo+ICsKPiArR19ERUZJTkVfQVVUT19DTEVB
TlVQX0NMRUFSX0ZVTkMoRXJyb3JQcm9wYWdhdG9yLCBlcnJvcl9wcm9wYWdhdG9yX2NsZWFudXAp
Owo+ICsKPiArLyoKPiArICogRVJSUF9BVVRPX1BST1BBR0FURQo+ICsgKgo+ICsgKiBUaGlzIG1h
Y3JvIGlzIGNyZWF0ZWQgdG8gYmUgdGhlIGZpcnN0IGxpbmUgb2YgYSBmdW5jdGlvbiB3aXRoIEVy
cm9yICoqZXJycAo+ICsgKiBPVVQgcGFyYW1ldGVyLiBJdCdzIG5lZWRlZCBvbmx5IGluIGNhc2Vz
IHdoZXJlIHdlIHdhbnQgdG8gdXNlIGVycm9yX3ByZXBlbmQsCj4gKyAqIGVycm9yX2FwcGVuZF9o
aW50IG9yIGRlcmVmZXJlbmNlICplcnJwLiBJdCdzIHN0aWxsIHNhZmUgKGJ1dCB1c2VsZXNzKSBp
bgo+ICsgKiBvdGhlciBjYXNlcy4KPiArICoKPiArICogSWYgZXJycCBpcyBOVUxMIG9yIHBvaW50
cyB0byBlcnJvcl9mYXRhbCwgaXQgaXMgcmV3cml0dGVuIHRvIHBvaW50IHRvIGEKPiArICogbG9j
YWwgRXJyb3Igb2JqZWN0LCB3aGljaCB3aWxsIGJlIGF1dG9tYXRpY2FsbHkgcHJvcGFnYXRlZCB0
byB0aGUgb3JpZ2luYWwKPiArICogZXJycCBvbiBmdW5jdGlvbiBleGl0IChzZWUgZXJyb3JfcHJv
cGFnYXRvcl9jbGVhbnVwKS4KPiArICoKPiArICogQWZ0ZXIgaW52b2NhdGlvbiBvZiB0aGlzIG1h
Y3JvIGl0IGlzIGFsd2F5cyBzYWZlIHRvIGRlcmVmZXJlbmNlIGVycnAKPiArICogKGFzIGl0J3Mg
bm90IE5VTEwgYW55bW9yZSkgYW5kIHRvIGFkZCBpbmZvcm1hdGlvbiAoYnkgZXJyb3JfcHJlcGVu
ZCBvcgo+ICsgKiBlcnJvcl9hcHBlbmRfaGludCkKPiArICogKGFzLCBpZiBpdCB3YXMgZXJyb3Jf
ZmF0YWwsIHdlIHN3YXBwZWQgaXQgd2l0aCBhIGxvY2FsX2Vycm9yIHRvIGJlCj4gKyAqIHByb3Bh
Z2F0ZWQgb24gY2xlYW51cCkuCj4gKyAqCj4gKyAqIE5vdGU6IHdlIGRvbid0IHdyYXAgdGhlIGVy
cm9yX2Fib3J0IGNhc2UsIGFzIHdlIHdhbnQgcmVzdWx0aW5nIGNvcmVkdW1wCj4gKyAqIHRvIHBv
aW50IHRvIHRoZSBwbGFjZSB3aGVyZSB0aGUgZXJyb3IgaGFwcGVuZWQsIG5vdCB0byBlcnJvcl9w
cm9wYWdhdGUuCj4gKyAqLwo+ICsjZGVmaW5lIEVSUlBfQVVUT19QUk9QQUdBVEUoKSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICBnX2F1dG8oRXJyb3JQcm9wYWdhdG9y
KSBfYXV0b19lcnJwX3Byb3AgPSB7LmVycnAgPSBlcnJwfTsgIFwKPiArICAgIGVycnAgPSAoKGVy
cnAgPT0gTlVMTCB8fCAqZXJycCA9PSBlcnJvcl9mYXRhbCkgICAgICAgICAgICAgXAo+ICsgICAg
ICAgICAgICA/ICZfYXV0b19lcnJwX3Byb3AubG9jYWxfZXJyIDogZXJycCkKPiArCj4gIC8qCj4g
ICAqIFNwZWNpYWwgZXJyb3IgZGVzdGluYXRpb24gdG8gYWJvcnQgb24gZXJyb3IuCj4gICAqIFNl
ZSBlcnJvcl9zZXRnKCkgYW5kIGVycm9yX3Byb3BhZ2F0ZSgpIGZvciBkZXRhaWxzLgoKTWlzc2lu
ZzogdXBkYXRlIG9mIHRoZSBiaWcgY29tbWVudCBzdGFydGluZyB3aXRoICJFcnJvciByZXBvcnRp
bmcgc3lzdGVtCmxvb3NlbHkgcGF0dGVybmVkIGFmdGVyIEdsaWIncyBHRXJyb3IuIgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
