Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9151A11460A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 18:35:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icv0K-0002TJ-GZ; Thu, 05 Dec 2019 17:33:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5caA=Z3=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1icv0J-0002TD-39
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 17:33:27 +0000
X-Inumbo-ID: 574a5456-1785-11ea-8232-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 574a5456-1785-11ea-8232-12813bfff9fa;
 Thu, 05 Dec 2019 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575567205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXeZyo48H3SZ9vKNo89jpscEKcAmkJ65SmGcOay8P6g=;
 b=PIRCW8d9wFUwTRlSEOV7hEuoS9/pz+YMQQrpumV5S2uqOatf3QTDW/FGyDgZi7lTwHAjAE
 AbfcoSr4efpomiy6tenq12cNxjdhImlgri92jiVbg29GRlJ+2rnQ5Wqm8szq7KBMAWk6es
 yvHe9YAMKks74aHMoRNSqEK8p9glPqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-QGdBPcspOPmsNLzPv5KtHg-1; Thu, 05 Dec 2019 12:33:22 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 729C0DB60;
 Thu,  5 Dec 2019 17:33:16 +0000 (UTC)
Received: from [10.3.116.171] (ovpn-116-171.phx2.redhat.com [10.3.116.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 885356012D;
 Thu,  5 Dec 2019 17:32:42 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-25-vsementsov@virtuozzo.com>
 <87muc8p24w.fsf@dusky.pond.sub.org>
 <55393c08-5bda-8042-1a95-f350b3781d99@virtuozzo.com>
 <87d0d3c5k7.fsf@dusky.pond.sub.org>
 <eef60af5-ff92-3df7-bad5-c981690d66ad@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <54c19813-8a10-1607-6fdc-cd7d930ecac7@redhat.com>
Date: Thu, 5 Dec 2019 11:32:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <eef60af5-ff92-3df7-bad5-c981690d66ad@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: QGdBPcspOPmsNLzPv5KtHg-1
X-Mimecast-Spam-Score: 0
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
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
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Hannes Reinecke <hare@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Anthony Green <green@moxielogic.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Juan Quintela <quintela@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "integration@gluster.org" <integration@gluster.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 Denis Lunev <den@virtuozzo.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
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

T24gMTIvNS8xOSA4OjU4IEFNLCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IHdyb3RlOgoK
Pj4+PiBXaGF0IGFib3V0IHlvdSBwcm92aWRlIHRoZSBleGFtcGxlcywgYW5kIHRoZW4gSSB0cnkg
dG8gcG9saXNoIHRoZSBwcm9zZT8KPj4+Cj4+PiAxOiBlcnJvcl9mYXRhbCBwcm9ibGVtCj4+Pgo+
Pj4gQXNzdW1lIHRoZSBmb2xsb3dpbmcgY29kZSBmbG93Ogo+Pj4KPj4+IGludCBmMShlcnJwKSB7
Cj4+PiAgICAgICAuLi4KPj4+ICAgICAgIHJldCA9IGYyKGVycnApOwo+Pj4gICAgICAgaWYgKHJl
dCA8IDApIHsKPj4+ICAgICAgICAgIGVycm9yX2FwcGVuZF9oaW50KGVycnAsICJ2ZXJ5IHVzZWZ1
bCBoaW50Iik7Cj4+PiAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4gICAgICAgfQo+Pj4gICAgICAg
Li4uCj4+PiB9Cj4+Pgo+Pj4gTm93LCBpZiB3ZSBjYWxsIGYxIHdpdGggJmVycm9yX2ZhdGFsIGFy
Z3VtZW50IGFuZCBmMiBmYWlscywgdGhlIHByb2dyYW0KPj4+IHdpbGwgZXhpdCBpbW1lZGlhdGVs
eSBpbnNpZGUgZjIsIHdoZW4gc2V0dGluZyB0aGUgZXJycC4gVXNlciB3aWxsIG5vdAo+Pj4gc2Vl
IHRoZSBoaW50Lgo+Pj4KPj4+IFNvLCBpbiB0aGlzIGNhc2Ugd2Ugc2hvdWxkIHVzZSBsb2NhbF9l
cnIuCj4+Cj4+IEhvdyBkb2VzIHRoaXMgZXhhbXBsZSBsb29rIGFmdGVyIHRoZSB0cmFuc2Zvcm1h
dGlvbj8KCldpdGhvdXQgRVJSUF9BVVRPX1BST1BBR0FURSgpLCB0aGUgdHJhbnNmb3JtYXRpb24g
aXMgYSBsb3Qgb2YgYm9pbGVycGxhdGU6CgppbnQgZjEoZXJycCkgewogICAgIEVycm9yICplcnIg
PSBOVUxMOwogICAgIHJldCA9IGYyKCZlcnIpOwogICAgIGlmIChyZXQgPCAwKSB7CiAgICAgICAg
IGVycm9yX2FwcGVuZF9oaW50KCZlcnIsICJ2ZXJ5IHVzZWZ1bCBoaW50Iik7CiAgICAgICAgIGVy
cm9yX3Byb3BhZ2F0ZShlcnJwLCBlcnIpOwogICAgICAgICByZXR1cm4gcmV0OwogICAgIH0KfQoK
d2hhdCdzIHdvcnNlLCB0aGF0IGJvaWxlcnBsYXRlIHRvIHNvbHZlIHByb2JsZW0gMSB0dXJucyBv
dXQgdG8gYmUuLi4KCj4gCj4gR29vZCBwb2ludC4KPiAKPiBpbnQgZjEoZXJycCkgewo+ICAgICAg
RVJSUF9BVVRPX1BST1BBR0FURSgpOwo+ICAgICAgLi4uCj4gICAgICByZXQgPSBmMihlcnJwKTsK
PiAgICAgIGlmIChyZXQgPCAwKSB7Cj4gICAgICAgICBlcnJvcl9hcHBlbmRfaGludChlcnJwLCAi
dmVyeSB1c2VmdWwgaGludCIpOwo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgICAgIH0KPiAgICAg
IC4uLgo+IH0KPiAKPiAtIG5vdGhpbmcgY2hhbmdlZCwgb25seSBhZGQgbWFjcm8gYXQgc3RhcnQu
IEJ1dCBub3cgZXJycCBpcyBzYWZlLCBpZiBpdCB3YXMKPiBlcnJvcl9mYXRhbCBpdCBpcyB3cmFw
cGVkIGJ5IGxvY2FsIGVycm9yLCBhbmQgd2lsbCBvbmx5IGNhbGwgZXhpdCBvbiBhdXRvbWF0aWMK
PiBwcm9wYWdhdGlvbiBvbiBmMSBmaW5pc2guCj4gCj4+Cj4+PiAyOiBlcnJvcl9hYm9ydCBwcm9i
bGVtCj4+Pgo+Pj4gTm93LCBjb25zaWRlciBmdW5jdGlvbnMgd2l0aG91dCByZXR1cm4gdmFsdWUu
IFdlIG5vcm1hbGx5IHVzZSBsb2NhbF9lcnIKPj4+IHZhcmlhYmxlIHRvIGNhdGNoIGZhaWx1cmVz
Ogo+Pj4KPj4+IHZvaWQgZjEoZXJycCkgewo+Pj4gICAgICAgRXJyb3IgKmxvY2FsX2VyciA9IE5V
TEw7Cj4+PiAgICAgICAuLi4KPj4+ICAgICAgIGYyKCZsb2NhbF9lcnIpOwo+Pj4gICAgICAgaWYg
KGxvY2FsX2Vycikgewo+Pj4gICAgICAgICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9l
cnIpOwo+Pj4gICAgICAgICAgIHJldHVybjsKPj4+ICAgICAgIH0KPj4+ICAgICAgIC4uLgo+Pj4g
fQoKdGhlIHZlcnkgc2FtZSBjb2RlIGFzIHRoZSBjYXVzZSBvZiBwcm9ibGVtIDIuCgo+Pj4KPj4+
IE5vdywgaWYgd2UgY2FsbCBmMiB3aXRoICZlcnJvcl9hYm9ydCBhbmQgZjIgZmFpbHMsIHRoZSBz
dGFjayBpbiByZXN1bHRpbmcKPj4+IGNyYXNoIGR1bXAgd2lsbCBwb2ludCB0byBlcnJvcl9wcm9w
YWdhdGUsIG5vdCB0byB0aGUgZmFpbHVyZSBwb2ludCBpbiBmMiwKPj4+IHdoaWNoIGNvbXBsaWNh
dGVzIGRlYnVnZ2luZy4KPj4+Cj4+PiBTbywgd2Ugc2hvdWxkIG5ldmVyIHdyYXAgZXJyb3JfYWJv
cnQgYnkgbG9jYWxfZXJyLgo+Pgo+PiBMaWtld2lzZS4KPiAKPiBBbmQgaGVyZToKPiAKPiB2b2lk
IGYxKGVycnApIHsKPiAgICAgICBFUlJQX0FVVE9fUFJPUEFHQVRFKCk7Cj4gICAgICAgLi4uCj4g
ICAgICAgZjIoZXJycCk7Cj4gICAgICAgaWYgKCplcnJwKSB7Cj4gICAgICAgICAgIHJldHVybjsK
PiAgICAgICB9Cj4gICAgICAgLi4uCj4gCj4gLSBpZiBlcnJwIHdhcyBOVUxMLCBpdCBpcyB3cmFw
cGVkLCBzbyBkZXJlZmVyZW5jaW5nIGVycnAgaXMgc2FmZS4gT24gcmV0dXJuLAo+ICAgICBsb2Nh
bCBlcnJvciBpcyBhdXRvbWF0aWNhbGx5IHByb3BhZ2F0ZWQgdG8gb3JpZ2luYWwgb25lLgoKU28s
IHRoZSB1c2Ugb2YgRVJSUF9BVVRPX1BST1BBR0FURSgpIHNvbHZlcyBCT1RIIHByb2JsZW1zIDEg
YW5kIDIgLSB3ZSAKYXZvaWQgdGhlIGJvaWxlcnBsYXRlIHRoYXQgdHJhZGVzIG9uZSBwcm9ibGVt
IGZvciBhbm90aGVyLCBieSAKY29uc29saWRhdGluZyBBTEwgb2YgdGhlIGJvaWxlcnBsYXRlIGlu
dG8gYSBzaW5nbGUtbGluZSBtYWNybywgc3VjaCB0aGF0IAplcnJvcl9wcm9wYWdhdGUoKSBubyBs
b25nZXIgbmVlZHMgdG8gYmUgY2FsbGVkIGFueXdoZXJlIGV4Y2VwdCBpbnNpZGUgCnRoZSBFUlJQ
X0FVVE9fUFJPUEFHQVRFIG1hY3JvLgoKPiAKPj4KPj4+Cj4+PiA9PT0KPj4+Cj4+PiBPdXIgc29s
dXRpb246Cj4+Pgo+Pj4gLSBGaXhlcyBbMS5dLCBhZGRpbmcgaW52b2NhdGlvbiBvZiBuZXcgbWFj
cm8gaW50byBmdW5jdGlvbnMgd2l0aCBlcnJvcl9hcHBlbl9oaW50L2Vycm9yX3ByZXBlbmQsCj4+
PiAgICAgIE5ldyBtYWNybyB3aWxsIHdyYXAgZXJyb3JfZmF0YWwuCj4+PiAtIEZpeGVzIFsyLl0s
IGJ5IHN3aXRjaGluZyBmcm9tIGhhbmQtd3JpdHRlbiBsb2NhbF9lcnIgdG8gc21hcnQgbWFjcm8s
IHdoaWNoIG5ldmVyCj4+PiAgICAgIHdyYXBzIGVycm9yX2Fib3J0Lgo+Pj4gLSBIYW5kbGVzIFsz
Ll0sIGJ5IHN3aXRjaGluZyB0byBtYWNybywgd2hpY2ggaXMgbGVzcyBjb2RlCj4+PiAtIEFkZGl0
aW9uYWxseSwgbWFjcm8gZG9lc24ndCB3cmFwIG5vcm1hbCBub24temVybyBlcnJwLCB0byBhdm9p
ZCBleHRyYSBwcm9wYWdhdGlvbnMKPj4+ICAgICAgKGluIGZhY3QsIGVycm9yX3Byb3BhZ2F0ZSBp
cyBjYWxsZWQsIGJ1dCByZXR1cm5zIGltbWVkaWF0ZWx5IG9uIGZpcnN0IGlmICghbG9jYWxfZXJy
KSkKPj4KPiAKPiAKCi0tIApFcmljIEJsYWtlLCBQcmluY2lwYWwgU29mdHdhcmUgRW5naW5lZXIK
UmVkIEhhdCwgSW5jLiAgICAgICAgICAgKzEtOTE5LTMwMS0zMjI2ClZpcnR1YWxpemF0aW9uOiAg
cWVtdS5vcmcgfCBsaWJ2aXJ0Lm9yZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
