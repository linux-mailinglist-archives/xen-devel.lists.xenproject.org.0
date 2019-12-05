Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAAA114C32
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 06:56:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1id6Yc-0005a0-R0; Fri, 06 Dec 2019 05:53:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f14m=Z3=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1icqNM-0000A8-Nf
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 12:36:56 +0000
X-Inumbo-ID: ec19896c-175b-11ea-8223-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ec19896c-175b-11ea-8223-12813bfff9fa;
 Thu, 05 Dec 2019 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575549415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hnhb/x6YaZwfbYwlyRlda7171y0HPcU5qK2g5bnRUHs=;
 b=BfcJ4V0Zke2Y0ZEM/QGzIpYar1QH9KLYmWtD2GuMC4z6pKKC2NzKJt2gmmBVzDqQnx3noA
 9m+lLyYYtko8W+d2C6YlgruzELHuWx0PiYmiMUiNE2QIZzbo7OZ6drSejZb97xE/fVUHW7
 GKQgZTTT65Gsktbpg4KRGr2ojzpu9XI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-YHjN-YtaNgqYAg5tVDJ8nA-1; Thu, 05 Dec 2019 07:36:53 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0980B184CAD3;
 Thu,  5 Dec 2019 12:36:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 626435E24A;
 Thu,  5 Dec 2019 12:36:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BB0531138606; Thu,  5 Dec 2019 13:36:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-25-vsementsov@virtuozzo.com>
 <87muc8p24w.fsf@dusky.pond.sub.org>
 <55393c08-5bda-8042-1a95-f350b3781d99@virtuozzo.com>
Date: Thu, 05 Dec 2019 13:36:40 +0100
In-Reply-To: <55393c08-5bda-8042-1a95-f350b3781d99@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 5 Dec 2019 09:38:49 +0000")
Message-ID: <87d0d3c5k7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: YHjN-YtaNgqYAg5tVDJ8nA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Fri, 06 Dec 2019 05:53:37 +0000
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
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
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
 Markus Armbruster <armbru@redhat.com>,
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
cml0ZXM6Cgo+IDA0LjEyLjIwMTkgMTc6NTksIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+PiBW
bGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdy
aXRlczoKPj4gCj4+PiBIZXJlIGlzIGludHJvZHVjZWQgRVJSUF9BVVRPX1BST1BBR0FURSBtYWNy
bywgdG8gYmUgdXNlZCBhdCBzdGFydCBvZgo+Pj4gZnVuY3Rpb25zIHdpdGggZXJycCBPVVQgcGFy
YW1ldGVyLgo+Pj4KPj4+IEl0IGhhcyB0aHJlZSBnb2FsczoKPj4+Cj4+PiAxLiBGaXggaXNzdWUg
d2l0aCBlcnJvcl9mYXRhbCAmIGVycm9yX3ByZXBlbmQvZXJyb3JfYXBwZW5kX2hpbnQ6IHVzZXIK
Pj4+IGNhbid0IHNlZSB0aGlzIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24sIGJlY2F1c2UgZXhpdCgp
IGhhcHBlbnMgaW4KPj4+IGVycm9yX3NldGcgZWFybGllciB0aGFuIGluZm9ybWF0aW9uIGlzIGFk
ZGVkLiBbUmVwb3J0ZWQgYnkgR3JlZyBLdXJ6XQo+Pj4KPj4+IDIuIEZpeCBpc3N1ZSB3aXRoIGVy
cm9yX2Fib3J0ICYgZXJyb3JfcHJvcGFnYXRlOiB3aGVuIHdlIHdyYXAKPj4+IGVycm9yX2Fib3J0
IGJ5IGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUsIHJlc3VsdGluZyBjb3JlZHVtcCB3aWxsCj4+
PiByZWZlciB0byBlcnJvcl9wcm9wYWdhdGUgYW5kIG5vdCB0byB0aGUgcGxhY2Ugd2hlcmUgZXJy
b3IgaGFwcGVuZWQuCj4+IAo+PiBJIGdldCB3aGF0IHlvdSBtZWFuLCBidXQgSSBoYXZlIHBsZW50
eSBvZiBjb250ZXh0Lgo+PiAKPj4+ICh0aGUgbWFjcm8gaXRzZWxmIGRvZXNuJ3QgZml4IHRoZSBp
c3N1ZSwgYnV0IGl0IGFsbG93cyB0byBbMy5dIGRyb3AgYWxsCj4+PiBsb2NhbF9lcnIrZXJyb3Jf
cHJvcGFnYXRlIHBhdHRlcm4sIHdoaWNoIHdpbGwgZGVmaW5pdGVseSBmaXggdGhlIGlzc3VlKQo+
PiAKPj4gVGhlIHBhcmVudGhlc2lzIGlzIG5vdCBwYXJ0IG9mIHRoZSBnb2FsLgo+PiAKPj4+IFtS
ZXBvcnRlZCBieSBLZXZpbiBXb2xmXQo+Pj4KPj4+IDMuIERyb3AgbG9jYWxfZXJyK2Vycm9yX3By
b3BhZ2F0ZSBwYXR0ZXJuLCB3aGljaCBpcyB1c2VkIHRvIHdvcmthcm91bmQKPj4+IHZvaWQgZnVu
Y3Rpb25zIHdpdGggZXJycCBwYXJhbWV0ZXIsIHdoZW4gY2FsbGVyIHdhbnRzIHRvIGtub3cgcmVz
dWx0aW5nCj4+PiBzdGF0dXMuIChOb3RlOiBhY3R1YWxseSB0aGVzZSBmdW5jdGlvbnMgY291bGQg
YmUgbWVyZWx5IHVwZGF0ZWQgdG8KPj4+IHJldHVybiBpbnQgZXJyb3IgY29kZSkuCj4+Pgo+Pj4g
VG8gYWNoaWV2ZSB0aGVzZSBnb2Fscywgd2UgbmVlZCB0byBhZGQgaW52b2NhdGlvbiBvZiB0aGUg
bWFjcm8gYXQgc3RhcnQKPj4+IG9mIGZ1bmN0aW9ucywgd2hpY2ggbmVlZHMgZXJyb3JfcHJlcGVu
ZC9lcnJvcl9hcHBlbmRfaGludCAoMS4pOyBhZGQKPj4+IGludm9jYXRpb24gb2YgdGhlIG1hY3Jv
IGF0IHN0YXJ0IG9mIGZ1bmN0aW9ucyB3aGljaCBkbwo+Pj4gbG9jYWxfZXJyK2Vycm9yX3Byb3Bh
Z2F0ZSBzY2VuYXJpbyB0aGUgY2hlY2sgZXJyb3JzLCBkcm9wIGxvY2FsIGVycm9ycwo+Pj4gZnJv
bSB0aGVtIGFuZCBqdXN0IHVzZSAqZXJycCBpbnN0ZWFkICgyLiwgMy4pLgo+PiAKPj4gVGhlIHBh
cmFncmFwaCB0YWxrcyBhYm91dCB0d28gY2FzZXM6IDEuIGFuZCAyLiszLiAKPgo+IEhtbSwgSSBk
b24ndCB0aGluayBzby4uIDEuIGFuZCAyLiBhcmUgaXNzdWVzLiAzLiBpcyBhIHJlZmFjdG9yaW5n
Li4gV2UganVzdAo+IGZpeCBhY2hpZXZlIDIgYW5kIDMgYnkgb25lIGFjdGlvbi4KPgo+PiBNYWtl
cyBtZSB0aGluayB3ZQo+PiB3YW50IHR3byBwYXJhZ3JhcGhzLCBlYWNoIGlsbHVzdHJhdGVkIHdp
dGggYW4gZXhhbXBsZS4KPj4gCj4+IFdoYXQgYWJvdXQgeW91IHByb3ZpZGUgdGhlIGV4YW1wbGVz
LCBhbmQgdGhlbiBJIHRyeSB0byBwb2xpc2ggdGhlIHByb3NlPwo+Cj4gMTogZXJyb3JfZmF0YWwg
cHJvYmxlbQo+Cj4gQXNzdW1lIHRoZSBmb2xsb3dpbmcgY29kZSBmbG93Ogo+Cj4gaW50IGYxKGVy
cnApIHsKPiAgICAgLi4uCj4gICAgIHJldCA9IGYyKGVycnApOwo+ICAgICBpZiAocmV0IDwgMCkg
ewo+ICAgICAgICBlcnJvcl9hcHBlbmRfaGludChlcnJwLCAidmVyeSB1c2VmdWwgaGludCIpOwo+
ICAgICAgICByZXR1cm4gcmV0Owo+ICAgICB9Cj4gICAgIC4uLgo+IH0KPgo+IE5vdywgaWYgd2Ug
Y2FsbCBmMSB3aXRoICZlcnJvcl9mYXRhbCBhcmd1bWVudCBhbmQgZjIgZmFpbHMsIHRoZSBwcm9n
cmFtCj4gd2lsbCBleGl0IGltbWVkaWF0ZWx5IGluc2lkZSBmMiwgd2hlbiBzZXR0aW5nIHRoZSBl
cnJwLiBVc2VyIHdpbGwgbm90Cj4gc2VlIHRoZSBoaW50Lgo+Cj4gU28sIGluIHRoaXMgY2FzZSB3
ZSBzaG91bGQgdXNlIGxvY2FsX2Vyci4KCkhvdyBkb2VzIHRoaXMgZXhhbXBsZSBsb29rIGFmdGVy
IHRoZSB0cmFuc2Zvcm1hdGlvbj8KCj4gMjogZXJyb3JfYWJvcnQgcHJvYmxlbQo+Cj4gTm93LCBj
b25zaWRlciBmdW5jdGlvbnMgd2l0aG91dCByZXR1cm4gdmFsdWUuIFdlIG5vcm1hbGx5IHVzZSBs
b2NhbF9lcnIKPiB2YXJpYWJsZSB0byBjYXRjaCBmYWlsdXJlczoKPgo+IHZvaWQgZjEoZXJycCkg
ewo+ICAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsKPiAgICAgLi4uCj4gICAgIGYyKCZsb2Nh
bF9lcnIpOwo+ICAgICBpZiAobG9jYWxfZXJyKSB7Cj4gICAgICAgICBlcnJvcl9wcm9wYWdhdGUo
ZXJycCwgbG9jYWxfZXJyKTsKPiAgICAgICAgIHJldHVybjsKPiAgICAgfQo+ICAgICAuLi4KPiB9
Cj4KPiBOb3csIGlmIHdlIGNhbGwgZjIgd2l0aCAmZXJyb3JfYWJvcnQgYW5kIGYyIGZhaWxzLCB0
aGUgc3RhY2sgaW4gcmVzdWx0aW5nCj4gY3Jhc2ggZHVtcCB3aWxsIHBvaW50IHRvIGVycm9yX3By
b3BhZ2F0ZSwgbm90IHRvIHRoZSBmYWlsdXJlIHBvaW50IGluIGYyLAo+IHdoaWNoIGNvbXBsaWNh
dGVzIGRlYnVnZ2luZy4KPgo+IFNvLCB3ZSBzaG91bGQgbmV2ZXIgd3JhcCBlcnJvcl9hYm9ydCBi
eSBsb2NhbF9lcnIuCgpMaWtld2lzZS4KCj4KPiA9PT0KPgo+IE91ciBzb2x1dGlvbjoKPgo+IC0g
Rml4ZXMgWzEuXSwgYWRkaW5nIGludm9jYXRpb24gb2YgbmV3IG1hY3JvIGludG8gZnVuY3Rpb25z
IHdpdGggZXJyb3JfYXBwZW5faGludC9lcnJvcl9wcmVwZW5kLAo+ICAgIE5ldyBtYWNybyB3aWxs
IHdyYXAgZXJyb3JfZmF0YWwuCj4gLSBGaXhlcyBbMi5dLCBieSBzd2l0Y2hpbmcgZnJvbSBoYW5k
LXdyaXR0ZW4gbG9jYWxfZXJyIHRvIHNtYXJ0IG1hY3JvLCB3aGljaCBuZXZlcgo+ICAgIHdyYXBz
IGVycm9yX2Fib3J0Lgo+IC0gSGFuZGxlcyBbMy5dLCBieSBzd2l0Y2hpbmcgdG8gbWFjcm8sIHdo
aWNoIGlzIGxlc3MgY29kZQo+IC0gQWRkaXRpb25hbGx5LCBtYWNybyBkb2Vzbid0IHdyYXAgbm9y
bWFsIG5vbi16ZXJvIGVycnAsIHRvIGF2b2lkIGV4dHJhIHByb3BhZ2F0aW9ucwo+ICAgIChpbiBm
YWN0LCBlcnJvcl9wcm9wYWdhdGUgaXMgY2FsbGVkLCBidXQgcmV0dXJucyBpbW1lZGlhdGVseSBv
biBmaXJzdCBpZiAoIWxvY2FsX2VycikpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
