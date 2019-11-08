Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65162F5DA7
	for <lists+xen-devel@lfdr.de>; Sat,  9 Nov 2019 07:05:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iTJp8-0002vh-Dd; Sat, 09 Nov 2019 06:02:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WSlc=ZA=gmail.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1iTBX2-0003t9-F1
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 21:11:00 +0000
X-Inumbo-ID: 429f37a0-026c-11ea-b678-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 429f37a0-026c-11ea-b678-bc764e2007e4;
 Fri, 08 Nov 2019 21:10:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a11so8566927wra.6
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2019 13:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=73/Er0/wletKjakTj5Sg+GBBinrJk/bbe18/Yg/uytw=;
 b=lybdmy8/zQVJLge+FoEDtDpOsRJmKkucC1LCi67ZXIkbsoRHad/QHyCVFyzsJ251Qb
 BPMTzqur0Budz6yc+eNU/QkVqjTH88o8GEoXUv/feyZPCauFCMhoWkjudlGP3pRCQ1L6
 ArMMsH2YDGbsgigi0FjVuSE9uuo/HsWrhGTuaYqqyOUp7uMlKUZp9PvxlJWV7xLJiCl3
 LjLJn8SUY0IbwLgHukMMBZJQ5GE3v+6gCPFAOH65TQ5UCELR6SR7bowPRBwg/hYo9Pvm
 MRoCYfbcIrWHrzzbS/pQRex3eVgZeuAk+gJ0OTfmxNRWaPgmkjC0zut83zxX/NAC/NZ8
 8ftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=73/Er0/wletKjakTj5Sg+GBBinrJk/bbe18/Yg/uytw=;
 b=uLyUudgHTFn/FxfNpGng63EHGyI3SPLVtcGlw7n96rEfvaVxt7QKLXXLs5a/tbraU5
 Ac4uHTR1902tyGF0XFXjEfPkRVFPkrusfdl58uGnzqAmT/ELt4krpOkx+Bt1R/lb1AlN
 XHQP+yyDFhPObPr3kQXZtOe4dtPlBXITDFr4e/WhIXRkybr43Dg5RMd8XQa1XjTvKKpx
 5I/ndlFogDYInpFumeA67mxMyPh2PcUJtntxKH2uFxNOc+b08xXfucbHsPYDN4UGL3Fl
 xi9v+pX8bkfJYcWVKr5WBZh/4j/VZS2hDx5TPBtEPUAVolZy1LMtbqsgab+b7L5kYjlD
 I0rQ==
X-Gm-Message-State: APjAAAVR6NpWxFby4VxERV8AUei4sBWF5jUd17FYTl6UBVZRodrJsfFG
 SVtKlJRiasxwN7g70pkSO8BODeflklqOTJmMpHA=
X-Google-Smtp-Source: APXvYqzfxA2pqb/9d8lAfGdOFYeuUgux9dlBzO8unAXzKUb+vJdwk4VpnHS7LZzOekXwA7ihbpmn7CNhspyQ0+cGIYQ=
X-Received: by 2002:adf:f20f:: with SMTP id p15mr9710837wro.370.1573247458125; 
 Fri, 08 Nov 2019 13:10:58 -0800 (PST)
MIME-Version: 1.0
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-25-vsementsov@virtuozzo.com>
In-Reply-To: <20191011160552.22907-25-vsementsov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 9 Nov 2019 01:10:45 +0400
Message-ID: <CAJ+F1CJWgQqE-FLVrOSeh8JMc_X5cKxk-iOpDftE1e_T7CsKNg@mail.gmail.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Mailman-Approved-At: Sat, 09 Nov 2019 06:02:12 +0000
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
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Laszlo Ersek <lersek@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
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
 Qemu-s390x list <qemu-s390x@nongnu.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTA6MTEgUE0gVmxhZGltaXIgU2VtZW50c292LU9naWV2
c2tpeQo8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cm90ZToKPgo+IEhlcmUgaXMgaW50cm9k
dWNlZCBFUlJQX0FVVE9fUFJPUEFHQVRFIG1hY3JvLCB0byBiZSB1c2VkIGF0IHN0YXJ0IG9mCj4g
ZnVuY3Rpb25zIHdpdGggZXJycCBPVVQgcGFyYW1ldGVyLgo+Cj4gSXQgaGFzIHRocmVlIGdvYWxz
Ogo+Cj4gMS4gRml4IGlzc3VlIHdpdGggZXJyb3JfZmF0YWwgJiBlcnJvcl9wcmVwZW5kL2Vycm9y
X2FwcGVuZF9oaW50OiB1c2VyCj4gY2FuJ3Qgc2VlIHRoaXMgYWRkaXRpb25hbCBpbmZvcm1hdGlv
biwgYmVjYXVzZSBleGl0KCkgaGFwcGVucyBpbgo+IGVycm9yX3NldGcgZWFybGllciB0aGFuIGlu
Zm9ybWF0aW9uIGlzIGFkZGVkLiBbUmVwb3J0ZWQgYnkgR3JlZyBLdXJ6XQo+Cj4gMi4gRml4IGlz
c3VlIHdpdGggZXJyb3JfYWJvcnQgJiBlcnJvcl9wcm9wYWdhdGU6IHdoZW4gd2Ugd3JhcAo+IGVy
cm9yX2Fib3J0IGJ5IGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUsIHJlc3VsdGluZyBjb3JlZHVt
cCB3aWxsCj4gcmVmZXIgdG8gZXJyb3JfcHJvcGFnYXRlIGFuZCBub3QgdG8gdGhlIHBsYWNlIHdo
ZXJlIGVycm9yIGhhcHBlbmVkLgo+ICh0aGUgbWFjcm8gaXRzZWxmIGRvZXNuJ3QgZml4IHRoZSBp
c3N1ZSwgYnV0IGl0IGFsbG93cyB0byBbMy5dIGRyb3AgYWxsCj4gbG9jYWxfZXJyK2Vycm9yX3By
b3BhZ2F0ZSBwYXR0ZXJuLCB3aGljaCB3aWxsIGRlZmluaXRlbHkgZml4IHRoZSBpc3N1ZSkKPiBb
UmVwb3J0ZWQgYnkgS2V2aW4gV29sZl0KPgo+IDMuIERyb3AgbG9jYWxfZXJyK2Vycm9yX3Byb3Bh
Z2F0ZSBwYXR0ZXJuLCB3aGljaCBpcyB1c2VkIHRvIHdvcmthcm91bmQKPiB2b2lkIGZ1bmN0aW9u
cyB3aXRoIGVycnAgcGFyYW1ldGVyLCB3aGVuIGNhbGxlciB3YW50cyB0byBrbm93IHJlc3VsdGlu
Zwo+IHN0YXR1cy4gKE5vdGU6IGFjdHVhbGx5IHRoZXNlIGZ1bmN0aW9ucyBjb3VsZCBiZSBtZXJl
bHkgdXBkYXRlZCB0bwo+IHJldHVybiBpbnQgZXJyb3IgY29kZSkuCj4KPiBUbyBhY2hpZXZlIHRo
ZXNlIGdvYWxzLCB3ZSBuZWVkIHRvIGFkZCBpbnZvY2F0aW9uIG9mIHRoZSBtYWNybyBhdCBzdGFy
dAo+IG9mIGZ1bmN0aW9ucywgd2hpY2ggbmVlZHMgZXJyb3JfcHJlcGVuZC9lcnJvcl9hcHBlbmRf
aGludCAoMS4pOyBhZGQKPiBpbnZvY2F0aW9uIG9mIHRoZSBtYWNybyBhdCBzdGFydCBvZiBmdW5j
dGlvbnMgd2hpY2ggZG8KPiBsb2NhbF9lcnIrZXJyb3JfcHJvcGFnYXRlIHNjZW5hcmlvIHRoZSBj
aGVjayBlcnJvcnMsIGRyb3AgbG9jYWwgZXJyb3JzCj4gZnJvbSB0aGVtIGFuZCBqdXN0IHVzZSAq
ZXJycCBpbnN0ZWFkICgyLiwgMy4pLgo+Cj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2VtZW50
c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPgo+IFJldmlld2VkLWJ5OiBF
cmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KPiAtLS0KPgo+IENDOiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBDQzogIkdvbmdsZWkgKEFyZWkpIiA8YXJlaS5nb25nbGVp
QGh1YXdlaS5jb20+Cj4gQ0M6IEVkdWFyZG8gSGFia29zdCA8ZWhhYmtvc3RAcmVkaGF0LmNvbT4K
PiBDQzogSWdvciBNYW1tZWRvdiA8aW1hbW1lZG9AcmVkaGF0LmNvbT4KPiBDQzogTGF1cmVudCBW
aXZpZXIgPGx2aXZpZXJAcmVkaGF0LmNvbT4KPiBDQzogQW1pdCBTaGFoIDxhbWl0QGtlcm5lbC5v
cmc+Cj4gQ0M6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+Cj4gQ0M6IE1heCBSZWl0eiA8
bXJlaXR6QHJlZGhhdC5jb20+Cj4gQ0M6IEpvaG4gU25vdyA8anNub3dAcmVkaGF0LmNvbT4KPiBD
QzogQXJpIFN1bmRob2xtIDxhcmlAdHV4ZXJhLmNvbT4KPiBDQzogUGF2ZWwgRG92Z2FseXVrIDxw
YXZlbC5kb3ZnYWx1a0Bpc3ByYXMucnU+Cj4gQ0M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJl
ZGhhdC5jb20+Cj4gQ0M6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KPiBD
QzogRmFtIFpoZW5nIDxmYW1AZXVwaG9uLm5ldD4KPiBDQzogU3RlZmFuIFdlaWwgPHN3QHdlaWxu
ZXR6LmRlPgo+IENDOiBSb25uaWUgU2FobGJlcmcgPHJvbm5pZXNhaGxiZXJnQGdtYWlsLmNvbT4K
PiBDQzogUGV0ZXIgTGlldmVuIDxwbEBrYW1wLmRlPgo+IENDOiBFcmljIEJsYWtlIDxlYmxha2VA
cmVkaGF0LmNvbT4KPiBDQzogIkRlbmlzIFYuIEx1bmV2IiA8ZGVuQG9wZW52ei5vcmc+Cj4gQ0M6
IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4KPiBDQzogQWxiZXJ0byBHYXJj
aWEgPGJlcnRvQGlnYWxpYS5jb20+Cj4gQ0M6IEphc29uIERpbGxhbWFuIDxkaWxsYW1hbkByZWRo
YXQuY29tPgo+IENDOiBXZW4gQ29uZ3lhbmcgPHdlbmNvbmd5YW5nMkBodWF3ZWkuY29tPgo+IEND
OiBYaWUgQ2hhbmdsb25nIDx4aWVjaGFuZ2xvbmcuZEBnbWFpbC5jb20+Cj4gQ0M6IExpdSBZdWFu
IDxuYW1laS51bml4QGdtYWlsLmNvbT4KPiBDQzogIlJpY2hhcmQgVy5NLiBKb25lcyIgPHJqb25l
c0ByZWRoYXQuY29tPgo+IENDOiBKZWZmIENvZHkgPGNvZHlwcmltZUBnbWFpbC5jb20+Cj4gQ0M6
ICJNYXJjLUFuZHLDqSBMdXJlYXUiIDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+Cj4gQ0M6
ICJEYW5pZWwgUC4gQmVycmFuZ8OpIiA8YmVycmFuZ2VAcmVkaGF0LmNvbT4KPiBDQzogUmljaGFy
ZCBIZW5kZXJzb24gPHJ0aEB0d2lkZGxlLm5ldD4KPiBDQzogR3JlZyBLdXJ6IDxncm91Z0BrYW9k
Lm9yZz4KPiBDQzogIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPgo+IENDOiBN
YXJjZWwgQXBmZWxiYXVtIDxtYXJjZWwuYXBmZWxiYXVtQGdtYWlsLmNvbT4KPiBDQzogQmVuaWFt
aW5vIEdhbHZhbmkgPGIuZ2FsdmFuaUBnbWFpbC5jb20+Cj4gQ0M6IFBldGVyIE1heWRlbGwgPHBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZz4KPiBDQzogIkPDqWRyaWMgTGUgR29hdGVyIiA8Y2xnQGth
b2Qub3JnPgo+IENDOiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pgo+IENDOiBKb2Vs
IFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pgo+IENDOiBBbmRyZXcgQmF1bWFubiA8QW5kcmV3LkJh
dW1hbm5AbWljcm9zb2Z0LmNvbT4KPiBDQzogIlBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIiA8cGhp
bG1kQHJlZGhhdC5jb20+Cj4gQ0M6IEFudG9ueSBQYXZsb3YgPGFudG9ueW5wYXZsb3ZAZ21haWwu
Y29tPgo+IENDOiBKZWFuLUNocmlzdG9waGUgRHVib2lzIDxqY2RAdHJpYnVkdWJvaXMubmV0Pgo+
IENDOiBQZXRlciBDaHViYiA8cGV0ZXIuY2h1YmJAbmljdGEuY29tLmF1Pgo+IENDOiBTdWJiYXJh
eWEgU3VuZGVlcCA8c3VuZGVlcC5sa21sQGdtYWlsLmNvbT4KPiBDQzogRXJpYyBBdWdlciA8ZXJp
Yy5hdWdlckByZWRoYXQuY29tPgo+IENDOiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpckBhbGlz
dGFpcjIzLm1lPgo+IENDOiAiRWRnYXIgRS4gSWdsZXNpYXMiIDxlZGdhci5pZ2xlc2lhc0BnbWFp
bC5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
PiBDQzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gQ0M6IFBh
dWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgo+IENDOiBQYXVsIEJ1cnRvbiA8cGJ1cnRvbkB3YXZl
Y29tcC5jb20+Cj4gQ0M6IEFsZWtzYW5kYXIgUmlrYWxvIDxhcmlrYWxvQHdhdmVjb21wLmNvbT4K
PiBDQzogQ2hyaXMgV3VsZmYgPGNyd3VsZmZAZ21haWwuY29tPgo+IENDOiBNYXJlayBWYXN1dCA8
bWFyZXhAZGVueC5kZT4KPiBDQzogRGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIu
aWQuYXU+Cj4gQ0M6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgo+IENDOiBIYWxp
bCBQYXNpYyA8cGFzaWNAbGludXguaWJtLmNvbT4KPiBDQzogQ2hyaXN0aWFuIEJvcm50cmFlZ2Vy
IDxib3JudHJhZWdlckBkZS5pYm0uY29tPgo+IENDOiAiSGVydsOpIFBvdXNzaW5lYXUiIDxocG91
c3NpbkByZWFjdG9zLm9yZz4KPiBDQzogWGlhbyBHdWFuZ3JvbmcgPHhpYW9ndWFuZ3JvbmcuZXJp
Y0BnbWFpbC5jb20+Cj4gQ0M6IEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4K
PiBDQzogQWxla3NhbmRhciBNYXJrb3ZpYyA8YW1hcmtvdmljQHdhdmVjb21wLmNvbT4KPiBDQzog
TWFyayBDYXZlLUF5bGFuZCA8bWFyay5jYXZlLWF5bGFuZEBpbGFuZGUuY28udWs+Cj4gQ0M6IEph
c29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gQ0M6IExhc3psbyBFcnNlayA8bGVyc2Vr
QHJlZGhhdC5jb20+Cj4gQ0M6IFl1dmFsIFNoYWlhIDx5dXZhbC5zaGFpYUBvcmFjbGUuY29tPgo+
IENDOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHNpZml2ZS5jb20+Cj4gQ0M6IFNhZ2FyIEthcmFu
ZGlrYXIgPHNhZ2Fya0BlZWNzLmJlcmtlbGV5LmVkdT4KPiBDQzogQmFzdGlhbiBLb3BwZWxtYW5u
IDxrYmFzdGlhbkBtYWlsLnVuaS1wYWRlcmJvcm4uZGU+Cj4gQ0M6IERhdmlkIEhpbGRlbmJyYW5k
IDxkYXZpZEByZWRoYXQuY29tPgo+IENDOiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4K
PiBDQzogRXJpYyBGYXJtYW4gPGZhcm1hbkBsaW51eC5pYm0uY29tPgo+IENDOiBNYXR0aGV3IFJv
c2F0byA8bWpyb3NhdG9AbGludXguaWJtLmNvbT4KPiBDQzogSGFubmVzIFJlaW5lY2tlIDxoYXJl
QHN1c2UuY29tPgo+IENDOiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgo+IENDOiBB
cnR5b20gVGFyYXNlbmtvIDxhdGFyNHFlbXVAZ21haWwuY29tPgo+IENDOiBTdGVmYW4gQmVyZ2Vy
IDxzdGVmYW5iQGxpbnV4LmlibS5jb20+Cj4gQ0M6IFNhbXVlbCBUaGliYXVsdCA8c2FtdWVsLnRo
aWJhdWx0QGVucy1seW9uLm9yZz4KPiBDQzogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1z
b25AcmVkaGF0LmNvbT4KPiBDQzogVG9ueSBLcm93aWFrIDxha3Jvd2lha0BsaW51eC5pYm0uY29t
Pgo+IENDOiBQaWVycmUgTW9yZWwgPHBtb3JlbEBsaW51eC5pYm0uY29tPgo+IENDOiBNaWNoYWVs
IFJvdGggPG1kcm90aEBsaW51eC52bmV0LmlibS5jb20+Cj4gQ0M6IEhhaWxpYW5nIFpoYW5nIDx6
aGFuZy56aGFuZ2hhaWxpYW5nQGh1YXdlaS5jb20+Cj4gQ0M6IEp1YW4gUXVpbnRlbGEgPHF1aW50
ZWxhQHJlZGhhdC5jb20+Cj4gQ0M6ICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8ZGdpbGJlcnRA
cmVkaGF0LmNvbT4KPiBDQzogTHVpZ2kgUml6em8gPHJpenpvQGlldC51bmlwaS5pdD4KPiBDQzog
R2l1c2VwcGUgTGV0dGllcmkgPGcubGV0dGllcmlAaWV0LnVuaXBpLml0Pgo+IENDOiBWaW5jZW56
byBNYWZmaW9uZSA8di5tYWZmaW9uZUBnbWFpbC5jb20+Cj4gQ0M6IEphbiBLaXN6a2EgPGphbi5r
aXN6a2FAc2llbWVucy5jb20+Cj4gQ0M6IEFudGhvbnkgR3JlZW4gPGdyZWVuQG1veGllbG9naWMu
Y29tPgo+IENDOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KPiBDQzogR3VhbiBY
dWV0YW8gPGd4dEBtcHJjLnBrdS5lZHUuY24+Cj4gQ0M6IE1heCBGaWxpcHBvdiA8amNtdmJrYmNA
Z21haWwuY29tPgo+IENDOiBxZW11LWJsb2NrQG5vbmdudS5vcmcKPiBDQzogaW50ZWdyYXRpb25A
Z2x1c3Rlci5vcmcKPiBDQzogc2hlZXBkb2dAbGlzdHMud3BrZy5vcmcKPiBDQzogcWVtdS1hcm1A
bm9uZ251Lm9yZwo+IENDOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBDQzogcWVt
dS1wcGNAbm9uZ251Lm9yZwo+IENDOiBxZW11LXMzOTB4QG5vbmdudS5vcmcKPiBDQzogcWVtdS1y
aXNjdkBub25nbnUub3JnCj4KPiAgaW5jbHVkZS9xYXBpL2Vycm9yLmggfCAzOCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvcWFwaS9lcnJvci5oIGIvaW5jbHVkZS9x
YXBpL2Vycm9yLmgKPiBpbmRleCBkNjg5OGQ4MzNiLi40NzIzOGQ5MDY1IDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvcWFwaS9lcnJvci5oCj4gKysrIGIvaW5jbHVkZS9xYXBpL2Vycm9yLmgKPiBAQCAt
MzQ1LDYgKzM0NSw0NCBAQCB2b2lkIGVycm9yX3NldF9pbnRlcm5hbChFcnJvciAqKmVycnAsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIEVycm9yQ2xhc3MgZXJyX2NsYXNzLCBjb25zdCBjaGFy
ICpmbXQsIC4uLikKPiAgICAgIEdDQ19GTVRfQVRUUig2LCA3KTsKPgo+ICt0eXBlZGVmIHN0cnVj
dCBFcnJvclByb3BhZ2F0b3Igewo+ICsgICAgRXJyb3IgKmxvY2FsX2VycjsKPiArICAgIEVycm9y
ICoqZXJycDsKPiArfSBFcnJvclByb3BhZ2F0b3I7Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQg
ZXJyb3JfcHJvcGFnYXRvcl9jbGVhbnVwKEVycm9yUHJvcGFnYXRvciAqcHJvcCkKPiArewo+ICsg
ICAgZXJyb3JfcHJvcGFnYXRlKHByb3AtPmVycnAsIHByb3AtPmxvY2FsX2Vycik7Cj4gK30KPiAr
Cj4gK0dfREVGSU5FX0FVVE9fQ0xFQU5VUF9DTEVBUl9GVU5DKEVycm9yUHJvcGFnYXRvciwgZXJy
b3JfcHJvcGFnYXRvcl9jbGVhbnVwKTsKPiArCj4gKy8qCj4gKyAqIEVSUlBfQVVUT19QUk9QQUdB
VEUKPiArICoKPiArICogVGhpcyBtYWNybyBpcyBjcmVhdGVkIHRvIGJlIHRoZSBmaXJzdCBsaW5l
IG9mIGEgZnVuY3Rpb24gd2l0aCBFcnJvciAqKmVycnAKPiArICogT1VUIHBhcmFtZXRlci4gSXQn
cyBuZWVkZWQgb25seSBpbiBjYXNlcyB3aGVyZSB3ZSB3YW50IHRvIHVzZSBlcnJvcl9wcmVwZW5k
LAo+ICsgKiBlcnJvcl9hcHBlbmRfaGludCBvciBkZXJlZmVyZW5jZSAqZXJycC4gSXQncyBzdGls
bCBzYWZlIChidXQgdXNlbGVzcykgaW4KPiArICogb3RoZXIgY2FzZXMuCj4gKyAqCj4gKyAqIElm
IGVycnAgaXMgTlVMTCBvciBwb2ludHMgdG8gZXJyb3JfZmF0YWwsIGl0IGlzIHJld3JpdHRlbiB0
byBwb2ludCB0byBhCj4gKyAqIGxvY2FsIEVycm9yIG9iamVjdCwgd2hpY2ggd2lsbCBiZSBhdXRv
bWF0aWNhbGx5IHByb3BhZ2F0ZWQgdG8gdGhlIG9yaWdpbmFsCj4gKyAqIGVycnAgb24gZnVuY3Rp
b24gZXhpdCAoc2VlIGVycm9yX3Byb3BhZ2F0b3JfY2xlYW51cCkuCj4gKyAqCj4gKyAqIEFmdGVy
IGludm9jYXRpb24gb2YgdGhpcyBtYWNybyBpdCBpcyBhbHdheXMgc2FmZSB0byBkZXJlZmVyZW5j
ZSBlcnJwCj4gKyAqIChhcyBpdCdzIG5vdCBOVUxMIGFueW1vcmUpIGFuZCB0byBhZGQgaW5mb3Jt
YXRpb24gKGJ5IGVycm9yX3ByZXBlbmQgb3IKPiArICogZXJyb3JfYXBwZW5kX2hpbnQpCj4gKyAq
IChhcywgaWYgaXQgd2FzIGVycm9yX2ZhdGFsLCB3ZSBzd2FwcGVkIGl0IHdpdGggYSBsb2NhbF9l
cnJvciB0byBiZQo+ICsgKiBwcm9wYWdhdGVkIG9uIGNsZWFudXApLgoKTmljZSBpbXByb3ZlbWVu
dHMuIE1pbm9yIGRyYXdiYWNrLCB0aGUgYWJvcnQoKS9leGl0KCkgd2lsbCBub3cgdGFrZQpwbGFj
ZSB3aGVuIGdvaW5nIG91dCBvZiBzY29wZSBhbmQgcnVubmluZyB0aGUgY2xlYW51cCBpbnN0ZWFk
IG9mIGVycm9yCmxvY2F0aW9uLiBOb3QgYSBiaWcgcHJvYmxlbSBJIGd1ZXNzLgoKPiArICoKPiAr
ICogTm90ZTogd2UgZG9uJ3Qgd3JhcCB0aGUgZXJyb3JfYWJvcnQgY2FzZSwgYXMgd2Ugd2FudCBy
ZXN1bHRpbmcgY29yZWR1bXAKPiArICogdG8gcG9pbnQgdG8gdGhlIHBsYWNlIHdoZXJlIHRoZSBl
cnJvciBoYXBwZW5lZCwgbm90IHRvIGVycm9yX3Byb3BhZ2F0ZS4KPiArICovCj4gKyNkZWZpbmUg
RVJSUF9BVVRPX1BST1BBR0FURSgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiArICAgIGdfYXV0byhFcnJvclByb3BhZ2F0b3IpIF9hdXRvX2VycnBfcHJvcCA9IHsuZXJycCA9
IGVycnB9OyAgXAo+ICsgICAgZXJycCA9ICgoZXJycCA9PSBOVUxMIHx8ICplcnJwID09IGVycm9y
X2ZhdGFsKSAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgID8gJl9hdXRvX2VycnBfcHJvcC5s
b2NhbF9lcnIgOiBlcnJwKQo+ICsKPiAgLyoKPiAgICogU3BlY2lhbCBlcnJvciBkZXN0aW5hdGlv
biB0byBhYm9ydCBvbiBlcnJvci4KPiAgICogU2VlIGVycm9yX3NldGcoKSBhbmQgZXJyb3JfcHJv
cGFnYXRlKCkgZm9yIGRldGFpbHMuCj4gLS0KPiAyLjIxLjAKPgo+CgpSZXZpZXdlZC1ieTogTWFy
Yy1BbmRyw6kgTHVyZWF1IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+CgoKLS0gCk1hcmMt
QW5kcsOpIEx1cmVhdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
