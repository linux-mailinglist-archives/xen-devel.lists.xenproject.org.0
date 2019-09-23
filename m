Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0F0BC154
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 07:23:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCdFO-0008Bp-HJ; Tue, 24 Sep 2019 05:20:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XE+/=XS=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1iCTG9-0006FF-8h
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 18:40:29 +0000
X-Inumbo-ID: 9cead48a-de31-11e9-a337-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cead48a-de31-11e9-a337-bc764e2007e4;
 Mon, 23 Sep 2019 18:40:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5EFE63091753;
 Mon, 23 Sep 2019 18:40:27 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9324560C63;
 Mon, 23 Sep 2019 18:39:14 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <20190923161231.22028-3-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <113940a4-3ef1-c7d7-4110-9c55a73ec241@redhat.com>
Date: Mon, 23 Sep 2019 13:39:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923161231.22028-3-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 23 Sep 2019 18:40:27 +0000 (UTC)
X-Mailman-Approved-At: Tue, 24 Sep 2019 05:20:20 +0000
Subject: Re: [Xen-devel] [RFC v2 2/9] qapi/error: add (Error **errp)
 cleaning APIs
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
Cc: stefanha@redhat.com, codyprime@gmail.com, jan.kiszka@siemens.com,
 berto@igalia.com, zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, samuel.thibault@ens-lyon.org, philmd@redhat.com,
 green@moxielogic.com, lvivier@redhat.com, ehabkost@redhat.com,
 xiechanglong.d@gmail.com, pl@kamp.de, dgilbert@redhat.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, ronniesahlberg@gmail.com,
 jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com, andrew@aj.id.au,
 crwulff@gmail.com, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, sheepdog@lists.wpkg.org,
 david@redhat.com, palmer@sifive.com, thuth@redhat.com, jcmvbkbc@gmail.com,
 den@openvz.org, hare@suse.com, sstabellini@kernel.org, arei.gonglei@huawei.com,
 marcel.apfelbaum@gmail.com, namei.unix@gmail.com, atar4qemu@gmail.com,
 farman@linux.ibm.com, amit@kernel.org, sw@weilnetz.de, groug@kaod.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org, cohuck@redhat.com,
 amarkovic@wavecomp.com, aurelien@aurel32.net, pburton@wavecomp.com,
 sagark@eecs.berkeley.edu, jasowang@redhat.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, ari@tuxera.com,
 quintela@redhat.com, mdroth@linux.vnet.ibm.com, lersek@redhat.com,
 borntraeger@de.ibm.com, antonynpavlov@gmail.com, dillaman@redhat.com,
 joel@jms.id.au, xen-devel@lists.xenproject.org, integration@gluster.org,
 balrogg@gmail.com, rjones@redhat.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, mst@redhat.com,
 mark.cave-ayland@ilande.co.uk, v.maffione@gmail.com, marex@denx.de,
 armbru@redhat.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, pavel.dovgaluk@ispras.ru, g.lettieri@iet.unipi.it,
 rizzo@iet.unipi.it, david@gibson.dropbear.id.au, akrowiak@linux.ibm.com,
 berrange@redhat.com, xiaoguangrong.eric@gmail.com, pmorel@linux.ibm.com,
 wencongyang2@huawei.com, jcd@tribudubois.net, pbonzini@redhat.com,
 stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yMy8xOSAxMToxMiBBTSwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToK
PiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292
QHZpcnR1b3p6by5jb20+Cj4gLS0tCgpBICJ3aHkiIGFzIHRoZSBjb21taXQgbWVzc2FnZSBib2R5
IHdvdWxkbid0IGh1cnQuCgo+ICBpbmNsdWRlL3FhcGkvZXJyb3IuaCB8IDIyICsrKysrKysrKysr
KysrKysrKysrKysKPiAgdXRpbC9lcnJvci5jICAgICAgICAgfCAgNiArKystLS0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL3FhcGkvZXJyb3IuaCBiL2luY2x1ZGUvcWFwaS9lcnJvci5oCj4gaW5kZXgg
ZjZmNGZhMGZhYy4uNTUxMzg1YWE5MSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3FhcGkvZXJyb3Iu
aAo+ICsrKyBiL2luY2x1ZGUvcWFwaS9lcnJvci5oCj4gQEAgLTI5Nyw2ICsyOTcsMjggQEAgdm9p
ZCB3YXJuX3JlcG9ydF9lcnIoRXJyb3IgKmVycik7Cj4gICAqLwo+ICB2b2lkIGVycm9yX3JlcG9y
dF9lcnIoRXJyb3IgKmVycik7Cj4gIAo+ICsvKgo+ICsgKiBGdW5jdGlvbnMgdG8gY2xlYW4gRXJy
b3IgKiplcnJwOiBjYWxsIGNvcnJlc3BvbmRpbmcgRXJyb3IgKmVyciBjbGVhbmluZwo+ICsgKiBm
dW5jdGlvbiBhbiBzZXQgcG9pbnRlciB0byBOVUxMCgpzL2FuL2FuZC8KCj4gKyAqLwo+ICtzdGF0
aWMgaW5saW5lIHZvaWQgZXJyb3JfZnJlZV9lcnJwKEVycm9yICoqZXJycCkKPiArewo+ICsgICAg
ZXJyb3JfZnJlZSgqZXJycF9pbik7CgpGYWlscyB0byBjb21waWxlLiAgRGlkIHlvdSBtZWFuIGZv
ciB0aGlzIHRvIGNvbWUgYWZ0ZXIgMy85PwoKPiArICAgICplcnJwX2luID0gTlVMTDsKPiArfQo+
ICsKPiArc3RhdGljIGlubGluZSB2b2lkIGVycm9yX3JlcG9ydF9lcnJwKEVycm9yICoqZXJycCkK
PiArewo+ICsgICAgZXJyb3JfcmVwb3J0X2VycigqZXJycF9pbik7Cj4gKyAgICAqZXJycF9pbiA9
IE5VTEw7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB3YXJuX3JlcG9ydF9lcnJwKEVy
cm9yICoqZXJycCkKPiArewo+ICsgICAgd2Fybl9yZXBvcnRfZXJyKCplcnJwX2luKTsKPiArICAg
ICplcnJwX2luID0gTlVMTDsKPiArfQo+ICsKPiAgLyoKPiAgICogQ29udmVuaWVuY2UgZnVuY3Rp
b24gdG8gZXJyb3JfcHJlcGVuZCgpLCB3YXJuX3JlcG9ydCgpIGFuZCBmcmVlIEBlcnIuCj4gICAq
Lwo+IGRpZmYgLS1naXQgYS91dGlsL2Vycm9yLmMgYi91dGlsL2Vycm9yLmMKPiBpbmRleCBkNDUz
MmNlMzE4Li5kZmJhMDkxNzU3IDEwMDY0NAo+IC0tLSBhL3V0aWwvZXJyb3IuYwo+ICsrKyBiL3V0
aWwvZXJyb3IuYwo+IEBAIC0yNzMsOSArMjczLDkgQEAgdm9pZCBlcnJvcl9mcmVlKEVycm9yICpl
cnIpCj4gIAo+ICB2b2lkIGVycm9yX2ZyZWVfb3JfYWJvcnQoRXJyb3IgKiplcnJwKQo+ICB7Cj4g
LSAgICBhc3NlcnQoZXJycCAmJiAqZXJycCk7Cj4gLSAgICBlcnJvcl9mcmVlKCplcnJwKTsKPiAt
ICAgICplcnJwID0gTlVMTDsKPiArICAgIGFzc2VydChlcnJwX2luICYmICplcnJwX2luKTsKPiAr
ICAgIGVycm9yX2ZyZWUoKmVycnBfaW4pOwo+ICsgICAgKmVycnBfaW4gPSBOVUxMOwoKRGlkIHlv
dSBtZWFuIHRvIHVzZSBlcnJvcl9mcmVlX2VycnAoKSBpbnN0ZWFkIG9mIHRoZXNlIGxhc3QgdHdv
IGxpbmVzPwoKPiAgfQo+ICAKPiAgdm9pZCBlcnJvcl9wcm9wYWdhdGUoRXJyb3IgKipkc3RfZXJy
cCwgRXJyb3IgKmxvY2FsX2VycikKPiAKCi0tIApFcmljIEJsYWtlLCBQcmluY2lwYWwgU29mdHdh
cmUgRW5naW5lZXIKUmVkIEhhdCwgSW5jLiAgICAgICAgICAgKzEtOTE5LTMwMS0zMjI2ClZpcnR1
YWxpemF0aW9uOiAgcWVtdS5vcmcgfCBsaWJ2aXJ0Lm9yZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
