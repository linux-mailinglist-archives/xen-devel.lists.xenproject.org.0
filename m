Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A354E86429
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:17:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvjC2-00051G-7Z; Thu, 08 Aug 2019 14:15:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AgOK=WE=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1hvjC0-000517-OU
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:15:00 +0000
X-Inumbo-ID: e75e7e3f-b9e6-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e75e7e3f-b9e6-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 14:14:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 850587BDD1;
 Thu,  8 Aug 2019 14:14:57 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F18B95D772;
 Thu,  8 Aug 2019 14:14:23 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:14:21 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <tony.nguyen@bt.com>
Message-ID: <20190808161421.0e4f85f5.cohuck@redhat.com>
In-Reply-To: <1565166381875.37725@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166381875.37725@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 08 Aug 2019 14:14:58 +0000 (UTC)
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 02/26] tcg: TCGMemOp is now
 accelerator independent MemOp
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 i.mitsyanko@gmail.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 pbonzini@redhat.com, andrew@aj.id.au, kbastian@mail.uni-paderborn.de,
 crwulff@gmail.com, laurent@vivier.eu, Andrew.Baumann@microsoft.com,
 sundeep.lkml@gmail.com, andrew.smirnov@gmail.com, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, imammedo@redhat.com, aurelien@aurel32.net,
 stefanb@linux.ibm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA3IEF1ZyAyMDE5IDA4OjI2OjIzICswMDAwCjx0b255Lm5ndXllbkBidC5jb20+IHdy
b3RlOgoKPiBQcmVwYXJhdGlvbiBmb3IgY29sbGFwc2luZyB0aGUgdHdvIGJ5dGUgc3dhcHMsIGFk
anVzdF9lbmRpYW5uZXNzIGFuZAo+IGhhbmRsZV9ic3dhcCwgYWxvbmcgdGhlIEkvTyBwYXRoLgo+
IAo+IFRhcmdldCBkZXBlbmRhbnQgYXR0cmlidXRlcyBhcmUgY29uZGl0aW9uYWxpemUgdXBvbiBO
RUVEX0NQVV9ILgoKcy9jb25kaXRpb25hbGl6ZS9jb25kaXRpb25hbGl6ZWQvID8KCj4gCj4gU2ln
bmVkLW9mZi1ieTogVG9ueSBOZ3V5ZW4gPHRvbnkubmd1eWVuQGJ0LmNvbT4KPiBBY2tlZC1ieTog
RGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJvcGJlYXIuaWQuYXU+Cj4gUmV2aWV3ZWQtYnk6
IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgo+IC0tLQo+
ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBhY2Nl
bC90Y2cvY3B1dGxiLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgaW5jbHVkZS9l
eGVjL21lbW9wLmggICAgICAgICAgICAgICAgICAgIHwgMTEwICsrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIHRhcmdldC9hbHBoYS90cmFuc2xhdGUuYyAgICAgICAgICAgICAgICB8ICAgMiAr
LQo+ICB0YXJnZXQvYXJtL3RyYW5zbGF0ZS1hNjQuYyAgICAgICAgICAgICAgfCAgNDggKysrKysr
LS0tLS0tCj4gIHRhcmdldC9hcm0vdHJhbnNsYXRlLWE2NC5oICAgICAgICAgICAgICB8ICAgMiAr
LQo+ICB0YXJnZXQvYXJtL3RyYW5zbGF0ZS1zdmUuYyAgICAgICAgICAgICAgfCAgIDIgKy0KPiAg
dGFyZ2V0L2FybS90cmFuc2xhdGUuYyAgICAgICAgICAgICAgICAgIHwgIDMyICsrKystLS0tCj4g
IHRhcmdldC9hcm0vdHJhbnNsYXRlLmggICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICB0YXJn
ZXQvaHBwYS90cmFuc2xhdGUuYyAgICAgICAgICAgICAgICAgfCAgMTQgKystLQo+ICB0YXJnZXQv
aTM4Ni90cmFuc2xhdGUuYyAgICAgICAgICAgICAgICAgfCAxMzIgKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0KPiAgdGFyZ2V0L202OGsvdHJhbnNsYXRlLmMgICAgICAgICAgICAgICAg
IHwgICAyICstCj4gIHRhcmdldC9taWNyb2JsYXplL3RyYW5zbGF0ZS5jICAgICAgICAgICB8ICAg
NCArLQo+ICB0YXJnZXQvbWlwcy90cmFuc2xhdGUuYyAgICAgICAgICAgICAgICAgfCAgIDggKy0K
PiAgdGFyZ2V0L29wZW5yaXNjL3RyYW5zbGF0ZS5jICAgICAgICAgICAgIHwgICA0ICstCj4gIHRh
cmdldC9wcGMvdHJhbnNsYXRlLmMgICAgICAgICAgICAgICAgICB8ICAxMiArLS0KPiAgdGFyZ2V0
L3Jpc2N2L2luc25fdHJhbnMvdHJhbnNfcnZhLmluYy5jIHwgICA4ICstCj4gIHRhcmdldC9yaXNj
di9pbnNuX3RyYW5zL3RyYW5zX3J2aS5pbmMuYyB8ICAgNCArLQo+ICB0YXJnZXQvczM5MHgvdHJh
bnNsYXRlLmMgICAgICAgICAgICAgICAgfCAgIDYgKy0KPiAgdGFyZ2V0L3MzOTB4L3RyYW5zbGF0
ZV92eC5pbmMuYyAgICAgICAgIHwgIDEwICstLQo+ICB0YXJnZXQvc3BhcmMvdHJhbnNsYXRlLmMg
ICAgICAgICAgICAgICAgfCAgMTQgKystLQo+ICB0YXJnZXQvdGlsZWd4L3RyYW5zbGF0ZS5jICAg
ICAgICAgICAgICAgfCAgMTAgKy0tCj4gIHRhcmdldC90cmljb3JlL3RyYW5zbGF0ZS5jICAgICAg
ICAgICAgICB8ICAgOCArLQo+ICB0Y2cvUkVBRE1FICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDIgKy0KPiAgdGNnL2FhcmNoNjQvdGNnLXRhcmdldC5pbmMuYyAgICAgICAgICAgIHwg
IDI2ICsrKy0tLS0KPiAgdGNnL2FybS90Y2ctdGFyZ2V0LmluYy5jICAgICAgICAgICAgICAgIHwg
IDI2ICsrKy0tLS0KPiAgdGNnL2kzODYvdGNnLXRhcmdldC5pbmMuYyAgICAgICAgICAgICAgIHwg
IDI0ICsrKy0tLQo+ICB0Y2cvbWlwcy90Y2ctdGFyZ2V0LmluYy5jICAgICAgICAgICAgICAgfCAg
MTYgKystLQo+ICB0Y2cvb3B0aW1pemUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIg
Ky0KPiAgdGNnL3BwYy90Y2ctdGFyZ2V0LmluYy5jICAgICAgICAgICAgICAgIHwgIDEyICstLQo+
ICB0Y2cvcmlzY3YvdGNnLXRhcmdldC5pbmMuYyAgICAgICAgICAgICAgfCAgMjAgKystLS0KPiAg
dGNnL3MzOTAvdGNnLXRhcmdldC5pbmMuYyAgICAgICAgICAgICAgIHwgIDE0ICsrLS0KPiAgdGNn
L3NwYXJjL3RjZy10YXJnZXQuaW5jLmMgICAgICAgICAgICAgIHwgICA2ICstCj4gIHRjZy90Y2ct
b3AuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzOCArKysrLS0tLS0KPiAgdGNnL3Rj
Zy1vcC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDg2ICsrKysrKysrKystLS0tLS0t
LS0tLQo+ICB0Y2cvdGNnLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0K
PiAgdGNnL3RjZy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTAxICsrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICB0cmFjZS9tZW0taW50ZXJuYWwuaCAgICAgICAgICAgICAgICAg
ICAgfCAgIDQgKy0KPiAgdHJhY2UvbWVtLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICA0ICstCj4gIDM5IGZpbGVzIGNoYW5nZWQsIDQyMSBpbnNlcnRpb25zKCspLCAzOTkgZGVsZXRp
b25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2V4ZWMvbWVtb3AuaAoKQWNrZWQt
Ynk6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
