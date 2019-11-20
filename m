Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9C7103AA3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 14:05:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXPcr-00018s-MF; Wed, 20 Nov 2019 13:02:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1IT=ZM=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1iXPad-000143-4S
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 13:00:11 +0000
X-Inumbo-ID: aedf558b-0b95-11ea-a311-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id aedf558b-0b95-11ea-a311-12813bfff9fa;
 Wed, 20 Nov 2019 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574254809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzXyhKN6JI07guKLYgMixvCs/MyYGuc0l5Klz8/DR+E=;
 b=PkDbiE5m5gdAA9bs68o3nr6spiUm26r1A3BvLxF1cMVy5tuCSA5nSS4pi2pz1etyy53qho
 PRCLnUrG94l90auThK7WScsbNocWXGYPxv3XIJII3cdmiqwo54WNTusGYSvPJrarP6cxJb
 16Qg750AbZStWm6UCiI+/K5yXsso2Gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-6IF44WuBONiHdfQD-xq-Wg-1; Wed, 20 Nov 2019 08:00:06 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 139CC91221;
 Wed, 20 Nov 2019 12:59:59 +0000 (UTC)
Received: from [10.3.116.221] (ovpn-116-221.phx2.redhat.com [10.3.116.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DEAB69300;
 Wed, 20 Nov 2019 12:59:16 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <d1756cd0-8ad7-1e6c-b127-59ed24c5e512@virtuozzo.com>
 <538354c8-7ba9-8b1c-476e-5733c418207b@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <606dbe22-0d1e-66bb-aba9-681ca7961623@redhat.com>
Date: Wed, 20 Nov 2019 06:59:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <538354c8-7ba9-8b1c-476e-5733c418207b@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 6IF44WuBONiHdfQD-xq-Wg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Wed, 20 Nov 2019 13:02:28 +0000
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
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Thomas Huth <thuth@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
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
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 "armbru@redhat.com" <armbru@redhat.com>,
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

T24gMTEvMjAvMTkgMzo1MCBBTSwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToK
PiBPa2F5Li4uCj4gCj4gSSB0aGluayB0aGF0Ogo+IAo+IDEuIEEgbG90IG9mIGVmZm9ydHMgKG5v
dCBvbmx5IG15LCBJIHRoaW5rIHJldmlld2luZyBpcyBhbHJlYWR5IGV4Y2VlZGVkIGdlbmVyYXRp
b24gZWZmb3J0cykKPiAgICAgYXJlIG1hZGUsIGl0IHdvdWxkIGJlIHNhZCB0byBsb3NlIHRoZW0u
Cj4gCj4gMi4gSXQncyBzYWZlIGVub3VnaCB0byBhcHBseSBvbmx5IHBhcnQgb2YgZ2VuZXJhdGVk
IHBhdGNoZXM6IHdlIGp1c3QgZml4IGVycm9yX2Fib3J0L2Vycm9yX2ZhdGFsCj4gICAgIGluIG1v
cmUgcG9wdWxhciBzdWJzeXN0ZW1zLCB3aGF0J3Mgd3Jvbmcgd2l0aCB0aGF0PyBXaHkgbm90IHRv
IGNvdmVyIDgwJSBjYXNlcyBieSAyMCUgZWZmb3J0cz8KPiAKPiAzLiBJdCdzIG9idmlvdXNseSBp
bXBvc3NpYmxlIHRvIG1lcmdlIHRoZSB3aG9sZSBzZXJpZXMuIEEgbG90IG9mIHRpbWUgcGFzc2Vk
LCBzZXJpZXMgZGl2ZXJnZXMuCj4gCj4gCj4gU28gSSBwcm9wb3NlIHRoZSBmb2xsb3dpbmcgcGxh
bjoKPiAKPiAxLiBJIHJlc2VuZCBzbWFsbCBzZXBhcmF0ZSBzZXJpZXMgb2YgcHJlcGFyYXRpb24g
cGF0Y2hlcyBwZXIgbWFpbnRhaW5lci4gVGhleSBhcmUgZ29vZCBhbnl3YXkuCj4gCj4gMi4gV2Ug
Y29tbWl0IHBhdGNoIHdpdGggbWFjcm8gKGNoYW5naW5nIE1VU1QgdG8gU0hPVUxEIGluIGRvY3Vt
ZW50YXRpb24pIGFuZCBjb2NjaW5lbGxlIHNjcmlwdC4KPiAgICAgIChvciB0aGF0IG1heSBiZSBj
b21iaW5lZCB3aXRoIHRoZSBmaXJzdCBzZXJpZXMgZnJvbSBbMy5dKQo+IAo+IDMuIFdoZW4gb25l
IG9mIHByZXBhcmF0aW9ucyB0YWtlbiB0byBtYWludGFpbmVyJ3MgdHJlZSwgSSBzZW5kIGdlbmVy
YXRlZCBwYXRjaGVzIGZvcgo+ICAgICAgaXRzIG1haW50YWluZXIuCgpJJ2Qgc3RpbGwgcHJlZmVy
IHdhaXRpbmcgZm9yIGRpcmVjdGlvbiBmcm9tIE1hcmt1cy4gIFdlJ3ZlIGJlZW4gdGllZCB1cCAK
Ynkgb3RoZXIgdGhpbmdzIChLVk0gRm9ydW0sIDQuMiByZWxlYXNlKSwgYnV0IG5vdyB0aGF0IHdl
IGFyZSBpbiBmcmVlemUsIAp0aGlzIGlzIGFjdHVhbGx5IGEgR09PRCB0aW1lIGZvciBNYXJrdXMg
dG8gZmluYWxseSBnZXQgYmFjayB0byB0aGlzIApzZXJpZXMsIGFuZCB0aGVyZSBpcyBnb2luZyB0
byBiZSBsZXNzIHJlYmFzaW5nIG5lZWRlZCBpZiB3ZSBjYW4gYXBwbHkgCnRoZSBlbnRpcmUgY2xl
YW51cCByaWdodCBhcyA1LjAgZGV2ZWxvcG1lbnQgb3BlbnMgaW4gYSBjb3VwbGUgb2Ygd2Vla3Mu
CgoKPiAKPiAKPiBJZiBubyBvYmplY3Rpb25zIGR1cmluZyBhIHdlZWssIEknbGwgc3RhcnQgdGhh
dCBwbGFuLCBob3BlIHNvbWVvbmUgd2lsbCBzdXBwb3J0IGl0Lgo+IAo+IAoKCi0tIApFcmljIEJs
YWtlLCBQcmluY2lwYWwgU29mdHdhcmUgRW5naW5lZXIKUmVkIEhhdCwgSW5jLiAgICAgICAgICAg
KzEtOTE5LTMwMS0zMjI2ClZpcnR1YWxpemF0aW9uOiAgcWVtdS5vcmcgfCBsaWJ2aXJ0Lm9yZwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
