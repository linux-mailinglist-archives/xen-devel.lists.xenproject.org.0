Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA9186487
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:39:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvjX3-00079H-JH; Thu, 08 Aug 2019 14:36:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AgOK=WE=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1hvjX2-00079C-MF
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:36:44 +0000
X-Inumbo-ID: f0c20e7b-b9e9-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f0c20e7b-b9e9-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 14:36:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7655E6128A;
 Thu,  8 Aug 2019 14:36:41 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF1451054FF1;
 Thu,  8 Aug 2019 14:35:29 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:34:46 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <tony.nguyen@bt.com>
Message-ID: <20190808163446.41e4398e.cohuck@redhat.com>
In-Reply-To: <1565166520130.61317@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166520130.61317@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 08 Aug 2019 14:36:42 +0000 (UTC)
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v6 08/26] hw/vfio: Access
 MemoryRegion with MemOp
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

T24gV2VkLCA3IEF1ZyAyMDE5IDA4OjI4OjQwICswMDAwCjx0b255Lm5ndXllbkBidC5jb20+IHdy
b3RlOgoKPiBUaGUgbWVtb3J5X3JlZ2lvbl9kaXNwYXRjaF97cmVhZHx3cml0ZX0gb3BlcmFuZCAi
dW5zaWduZWQgc2l6ZSIgaXMKPiBiZWluZyBjb252ZXJ0ZWQgaW50byBhICJNZW1PcCBvcCIuCj4g
Cj4gQ29udmVydCBpbnRlcmZhY2VzIGJ5IHVzaW5nIG5vLW9wIHNpemVfbWVtb3AuCj4gCj4gQWZ0
ZXIgYWxsIGludGVyZmFjZXMgYXJlIGNvbnZlcnRlZCwgc2l6ZV9tZW1vcCB3aWxsIGJlIGltcGxl
bWVudGVkCj4gYW5kIHRoZSBtZW1vcnlfcmVnaW9uX2Rpc3BhdGNoX3tyZWFkfHdyaXRlfSBvcGVy
YW5kICJ1bnNpZ25lZCBzaXplIgo+IHdpbGwgYmUgY29udmVydGVkIGludG8gYSAiTWVtT3Agb3Ai
Lgo+IAo+IEFzIHNpemVfbWVtb3AgaXMgYSBuby1vcCwgdGhpcyBwYXRjaCBkb2VzIG5vdCBjaGFu
Z2UgYW55IGJlaGF2aW91ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUb255IE5ndXllbiA8dG9ueS5u
Z3V5ZW5AYnQuY29tPgo+IFJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5o
ZW5kZXJzb25AbGluYXJvLm9yZz4KPiAtLS0KPiAgaHcvdmZpby9wY2ktcXVpcmtzLmMgfCA2ICsr
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
UmV2aWV3ZWQtYnk6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
