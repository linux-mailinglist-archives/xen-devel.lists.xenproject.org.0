Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6002AF916E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 15:05:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUWlR-0006Cg-KJ; Tue, 12 Nov 2019 14:03:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Q6HY=ZE=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1iUWW9-00047f-A4
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 13:47:37 +0000
X-Inumbo-ID: fbb98d88-0552-11ea-a21c-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fbb98d88-0552-11ea-a21c-12813bfff9fa;
 Tue, 12 Nov 2019 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573566455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYLIFYQlGm9Ki6YHiQ6cr/ujzB2VBpC1BfYM0Iim6bA=;
 b=XTK/u7fjGC/AM8ROozpKYkKWzZx7xXRwf/NXKbV4gyCokoKkbftIIDDANnZz2BYGctkqkU
 c1XXs0HQmcLwWLXrKq0bxRTcK8IVlBZiZWFvMLINebU21MSC7DeZ9WA9c1Eu/1NNFyDiN8
 CELhN2jVhWSzopH5NiaofTLrlH5iM1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-vK1B7lsMPcmofnjzrI6apw-1; Tue, 12 Nov 2019 08:47:33 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E70C18B6409;
 Tue, 12 Nov 2019 13:47:27 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CE076106A;
 Tue, 12 Nov 2019 13:46:40 +0000 (UTC)
Date: Tue, 12 Nov 2019 14:46:38 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20191112144638.4baf555a.cohuck@redhat.com>
In-Reply-To: <CAMxuvawy_TStTDXYoNF0zFjh6eOF1EUKe6BYAxUo_S9-cxMPSg@mail.gmail.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <d1756cd0-8ad7-1e6c-b127-59ed24c5e512@virtuozzo.com>
 <CAMxuvawy_TStTDXYoNF0zFjh6eOF1EUKe6BYAxUo_S9-cxMPSg@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: vK1B7lsMPcmofnjzrI6apw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Tue, 12 Nov 2019 14:03:24 +0000
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
 Jan Kiszka <jan.kiszka@siemens.com>, Eric Blake <eblake@redhat.com>,
 Alberto Garcia <berto@igalia.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Anthony Green <green@moxielogic.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
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
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
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
 Alistair Francis <alistair@alistair23.me>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA4IE5vdiAyMDE5IDIyOjU3OjI1ICswNDAwCk1hcmMtQW5kcsOpIEx1cmVhdSA8bWFy
Y2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPiB3cm90ZToKCj4gSGkKPiAKPiBPbiBGcmksIE5vdiA4
LCAyMDE5IGF0IDc6MzEgUE0gVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeQo+IDx2c2VtZW50
c292QHZpcnR1b3p6by5jb20+IHdyb3RlOgo+ID4KPiA+IEZpbmFsbHksIHdoYXQgaXMgdGhlIHBs
YW4/Cj4gPgo+ID4gTWFya3VzIHdoYXQgZG8geW91IHRoaW5rPwo+ID4KPiA+IE5vdyBhIGxvdCBv
ZiBwYXRjaGVzIGFyZSByZXZpZXdlZCwgYnV0IGEgbG90IG9mIGFyZSBub3QuCj4gPgo+ID4gSXMg
dGhlcmUgYW55IGhvcGUgdGhhdCBhbGwgcGF0Y2hlcyB3aWxsIGJlIHJldmlld2VkPyBTaG91bGQg
SSByZXNlbmQgdGhlCj4gPiB3aG9sZSBzZXJpZXMsIG9yIG1heSBiZSByZWR1Y2UgaXQgdG8gcmV2
aWV3ZWQgc3Vic3lzdGVtcyBvbmx5PyAgCj4gCj4gSSBkb24ndCB0aGluayB3ZSBoYXZlIHdlbGwg
ZXN0YWJsaXNoZWQgcnVsZXMgZm9yIHdob2xlLXRyZWUgY2xlYW51cHMKPiBsaWtlIHRoaXMuIElu
IHRoZSBwYXN0LCBzZXZlcmFsIGNsZWFudXAgc2VyaWVzIGdvdCBsb3N0LgoKWWVzLCBpdCBpcyBh
bHdheXMgcHJvYmxlbWF0aWMgaWYgYSBzZXJpZXMgdG91Y2hlcyBhIGxvdCBvZiBkaWZmZXJlbnQK
c3Vic3lzdGVtcy4KCj4gCj4gSXQgd2lsbCB0YWtlIGFnZXMgdG8gZ2V0IGV2ZXJ5IHN1YnN5c3Rl
bSBtYWludGFpbmVyIHRvIHJldmlldyB0aGUKPiBwYXRjaGVzLiBNb3N0IGxpa2VseSwgc2luY2Ug
dGhleSBhcmUgcXVpdGUgc3lzdGVtYXRpYywgdGhlcmUgaXNuJ3QKPiBtdWNoIHRvIHNheSBhbmQg
aXQgaXMgZWFzeSB0byBtaXNzIHNvbWV0aGluZyB0aGF0IGhhcyBzb21lIGhpZGRlbgo+IHJhbWlm
aWNhdGlvbnMuIFBlcmhhcHMgd2hvbGUtdHJlZSBjbGVhbnVwcyBzaG91bGQgcmVxdWlyZSBhdCBs
ZWFzdCAyCj4gcmV2aWV3ZXJzIHRvIGJ5cGFzcyB0aGUgc3Vic3l0ZW0gbWFpbnRhaW5lciByZXZp
ZXc/IEJ1dCBteSBwYXN0Cj4gZXhwZXJpZW5jZSB3aXRoIHRoaXMga2luZCBvZiBleGVyY2ljZSBk
b2Vzbid0IGVuY291cmFnZSBtZSwgYW5kCj4gcHJvYmFibHkgSSBhbSBub3QgdGhlIG9ubHkgb25l
LgoKSXQncyBub3QganVzdCB0aGUgcmV2aWV3czsgaXQncyBlYXN5IHRvIG1pc3MgY29tcGlsZSBw
cm9ibGVtcyBvbiBsZXNzCm1haW5zdHJlYW0gYXJjaGl0ZWN0dXJlcyAoYW5kIGV2ZW4gZWFzaWVy
IHRvIG1pc3MgZnVuY3Rpb25hbCBwcm9ibGVtcwp0aGVyZSwgYWx0aG91Z2ggdGhleSBhcmUgcHJv
YmFibHkgbGVzcyBsaWtlbHkgd2l0aCBhdXRvbWF0ZWQgcmV3b3JrLikKQ0kgY2FuIHByb2JhYmx5
IGhlbHAsIGJ1dCB0aGF0J3Mgc29tZXRoaW5nIGZvciB0aGUgZnV0dXJlLgoKQW55d2F5LCBJJ3Zl
IG5vdyBnb3R0ZW4gYXJvdW5kIHRvIHRoYXQgc2VyaWVzOyBzcG90dGVkIG9uZSBwcm9ibGVtIGlu
CnMzOTB4IGNvZGUsIEkgdGhpbmsuCgpPbmUgdGhpbmcgdGhhdCdzIGhlbHBmdWwgZm9yIHN1Y2gg
YSBsYXJnZSBzZXJpZXMgaXMgYSBnaXQgYnJhbmNoIHRoYXQKbWFrZXMgaXQgZWFzeSB0byBnaXZl
IHRoZSBzZXJpZXMgYSBxdWljayBnby4gKFlvdSBjYW4gdXNlIHBhdGNoZXcsIGJ1dAppdCB0YWtl
cyB0aW1lIGJlZm9yZSBpdCBnZXRzIGFsbCBtYWlscywgc28ganVzdCBwdXNoaW5nIGl0IHNvbWV3
aGVyZQphbmQgbGV0dGluZyBwZW9wbGUga25vdyBpcyBhIGdvb2QgaWRlYSBhbnl3YXkuKQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
