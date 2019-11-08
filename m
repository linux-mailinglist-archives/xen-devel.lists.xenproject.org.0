Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD63FF5B47
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 23:48:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iTD0t-0002Sj-5U; Fri, 08 Nov 2019 22:45:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uMmq=ZA=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1iTD0r-0002SX-RS
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 22:45:54 +0000
X-Inumbo-ID: 8491eae2-0279-11ea-a1dc-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8491eae2-0279-11ea-a1dc-12813bfff9fa;
 Fri, 08 Nov 2019 22:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573253152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tauBkVrjbdHxvo0j47ev+RStxPX1TKE0sdwLGZbCWTA=;
 b=S+N1ffBphhh/XDixUWT8eeQZutv9SjH65rSaxMj8xVdFkHqaahXZnHAMNHYPqM9mp+sAa1
 ELL0zy9dl1ZYrWtHewOx/NzV2X+McBKOTmP/ErcZUBDyC4qhuI2lT2JTvCHB8o++AZjYWn
 vwPhqBRWOqwWIYCyeQTbIPb7mtQfofw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-FzhR2uALPVeb5eorDZ-8Ew-1; Fri, 08 Nov 2019 17:45:49 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7846107ACC4;
 Fri,  8 Nov 2019 22:45:41 +0000 (UTC)
Received: from [10.3.117.38] (ovpn-117-38.phx2.redhat.com [10.3.117.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B61FE6084E;
 Fri,  8 Nov 2019 22:45:12 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-25-vsementsov@virtuozzo.com>
 <CAJ+F1CJWgQqE-FLVrOSeh8JMc_X5cKxk-iOpDftE1e_T7CsKNg@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9a4efbbb-4dbf-011b-4a0b-4f5cd276379b@redhat.com>
Date: Fri, 8 Nov 2019 16:45:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJWgQqE-FLVrOSeh8JMc_X5cKxk-iOpDftE1e_T7CsKNg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: FzhR2uALPVeb5eorDZ-8Ew-1
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
 "open list:Block layer core" <qemu-block@nongnu.org>,
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
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, sheepdog@lists.wpkg.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "Denis V. Lunev" <den@openvz.org>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 Qemu-s390x list <qemu-s390x@nongnu.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Juan Quintela <quintela@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Antony Pavlov <antonynpavlov@gmail.com>, xen-devel@lists.xenproject.org,
 integration@gluster.org, Laszlo Ersek <lersek@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 Markus Armbruster <armbru@redhat.com>,
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

T24gMTEvOC8xOSAzOjEwIFBNLCBNYXJjLUFuZHLDqSBMdXJlYXUgd3JvdGU6Cgo+PiArLyoKPj4g
KyAqIEVSUlBfQVVUT19QUk9QQUdBVEUKPj4gKyAqCj4+ICsgKiBUaGlzIG1hY3JvIGlzIGNyZWF0
ZWQgdG8gYmUgdGhlIGZpcnN0IGxpbmUgb2YgYSBmdW5jdGlvbiB3aXRoIEVycm9yICoqZXJycAo+
PiArICogT1VUIHBhcmFtZXRlci4gSXQncyBuZWVkZWQgb25seSBpbiBjYXNlcyB3aGVyZSB3ZSB3
YW50IHRvIHVzZSBlcnJvcl9wcmVwZW5kLAo+PiArICogZXJyb3JfYXBwZW5kX2hpbnQgb3IgZGVy
ZWZlcmVuY2UgKmVycnAuIEl0J3Mgc3RpbGwgc2FmZSAoYnV0IHVzZWxlc3MpIGluCj4+ICsgKiBv
dGhlciBjYXNlcy4KPj4gKyAqCj4+ICsgKiBJZiBlcnJwIGlzIE5VTEwgb3IgcG9pbnRzIHRvIGVy
cm9yX2ZhdGFsLCBpdCBpcyByZXdyaXR0ZW4gdG8gcG9pbnQgdG8gYQo+PiArICogbG9jYWwgRXJy
b3Igb2JqZWN0LCB3aGljaCB3aWxsIGJlIGF1dG9tYXRpY2FsbHkgcHJvcGFnYXRlZCB0byB0aGUg
b3JpZ2luYWwKPj4gKyAqIGVycnAgb24gZnVuY3Rpb24gZXhpdCAoc2VlIGVycm9yX3Byb3BhZ2F0
b3JfY2xlYW51cCkuCj4+ICsgKgo+PiArICogQWZ0ZXIgaW52b2NhdGlvbiBvZiB0aGlzIG1hY3Jv
IGl0IGlzIGFsd2F5cyBzYWZlIHRvIGRlcmVmZXJlbmNlIGVycnAKPj4gKyAqIChhcyBpdCdzIG5v
dCBOVUxMIGFueW1vcmUpIGFuZCB0byBhZGQgaW5mb3JtYXRpb24gKGJ5IGVycm9yX3ByZXBlbmQg
b3IKPj4gKyAqIGVycm9yX2FwcGVuZF9oaW50KQo+PiArICogKGFzLCBpZiBpdCB3YXMgZXJyb3Jf
ZmF0YWwsIHdlIHN3YXBwZWQgaXQgd2l0aCBhIGxvY2FsX2Vycm9yIHRvIGJlCj4+ICsgKiBwcm9w
YWdhdGVkIG9uIGNsZWFudXApLgo+IAo+IE5pY2UgaW1wcm92ZW1lbnRzLiBNaW5vciBkcmF3YmFj
aywgdGhlIGFib3J0KCkvZXhpdCgpIHdpbGwgbm93IHRha2UKPiBwbGFjZSB3aGVuIGdvaW5nIG91
dCBvZiBzY29wZSBhbmQgcnVubmluZyB0aGUgY2xlYW51cCBpbnN0ZWFkIG9mIGVycm9yCj4gbG9j
YXRpb24uIE5vdCBhIGJpZyBwcm9ibGVtIEkgZ3Vlc3MuCgpZb3VyIGFzc2Vzc21lbnQgaXMgbm90
IHF1aXRlIHJpZ2h0OgoKQW55IGFib3J0KCkgd2lsbCBoYXBwZW4gYXQgdGhlIGxlYWYgbm9kZSAo
YmVjYXVzZSB3ZSBhcmUgbm8gbG9uZ2VyIAp3cmFwcGluZyB0aGluZyBpbnRvIGEgbG9jYWwgZXJy
IGFuZCBza2lwcGluZyBlcnJvcl9wcm9wYWdhdGUgYWx0b2dldGhlciAKZm9yICZlcnJvcl9hYm9y
dCkuCgpZb3UgYXJlIGNvcnJlY3QgdGhhdCBhbnkgZXhpdCgpIHdpbGwgbm93IGhhcHBlbiBkdXJp
bmcgY2xlYW51cCwgYnV0IHRoYXQgCmlzIGFuIHVuZGV0ZWN0YWJsZSBjaGFuZ2UgKHRoZXJlIGlz
IG5vIHN0YWNrIHRyYWNlIHByZXNlbnQgZm9yIAomZXJyb3JfZmF0YWwsIHNvIGNhbGxpbmcgZXJy
b3JfcHJvcGFnYXRlIGF0IGEgbGF0ZXIgcG9pbnQgaW4gdGltZSBkb2VzIApub3QgYWZmZWN0IHRo
ZSBvYnNlcnZhYmxlIGVuZCBiZWhhdmlvcikuCgotLSAKRXJpYyBCbGFrZSwgUHJpbmNpcGFsIFNv
ZnR3YXJlIEVuZ2luZWVyClJlZCBIYXQsIEluYy4gICAgICAgICAgICsxLTkxOS0zMDEtMzIyNgpW
aXJ0dWFsaXphdGlvbjogIHFlbXUub3JnIHwgbGlidmlydC5vcmcKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
