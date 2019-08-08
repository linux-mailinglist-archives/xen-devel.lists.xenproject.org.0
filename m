Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69678864BC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:48:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvjfP-0007sQ-Ez; Thu, 08 Aug 2019 14:45:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AgOK=WE=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1hvjfO-0007sG-HU
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:45:22 +0000
X-Inumbo-ID: 25ffa090-b9eb-11e9-a8b4-2781b8db2347
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25ffa090-b9eb-11e9-a8b4-2781b8db2347;
 Thu, 08 Aug 2019 14:45:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C614DC04D293;
 Thu,  8 Aug 2019 14:45:18 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F11FF6EA;
 Thu,  8 Aug 2019 14:44:40 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:44:38 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <tony.nguyen@bt.com>
Message-ID: <20190808164438.7045c4cc.cohuck@redhat.com>
In-Reply-To: <1565166604452.72353@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166604452.72353@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 08 Aug 2019 14:45:21 +0000 (UTC)
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 12/26] hw/s390x: Hard code
 size with MO_{8|16|32|64}
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

T24gV2VkLCA3IEF1ZyAyMDE5IDA4OjMwOjA0ICswMDAwCjx0b255Lm5ndXllbkBidC5jb20+IHdy
b3RlOgoKPiBUZW1wb3JhcmlseSBuby1vcCBzaXplX21lbW9wIHdhcyBpbnRyb2R1Y2VkIHRvIGFp
ZCB0aGUgY29udmVyc2lvbiBvZgo+IG1lbW9yeV9yZWdpb25fZGlzcGF0Y2hfe3JlYWR8d3JpdGV9
IG9wZXJhbmQgInVuc2lnbmVkIHNpemUiIGludG8KPiAiTWVtT3Agb3AiLgo+IAo+IE5vdyBzaXpl
X21lbW9wIGlzIGltcGxlbWVudGVkLCBhZ2FpbiBoYXJkIGNvZGVkIHNpemUgYnV0IHdpdGgKCiJO
b3cgdGhhdCBzaXplX21lbW9wIGhhcyBiZWVuIGltcGxlbWVudGVkIHByb3Blcmx5LCBhZ2FpbiBo
YXJkIGNvZGUgdGhlCnNpemUgYnV0IHdpdGguLi4iCgo+IE1PX3s4fDE2fDMyfDY0fS4gVGhpcyBp
cyBtb3JlIGV4cHJlc3NpdmUgYW5kIGF2b2lkIHNpemVfbWVtb3AgY2FsbHMuCgpzL2F2b2lkL2F2
b2lkcy8KCj4gCj4gU2lnbmVkLW9mZi1ieTogVG9ueSBOZ3V5ZW4gPHRvbnkubmd1eWVuQGJ0LmNv
bT4KPiAtLS0KPiAgaHcvczM5MHgvczM5MC1wY2ktaW5zdC5jIHwgMyArLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IENvcm5l
bGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
