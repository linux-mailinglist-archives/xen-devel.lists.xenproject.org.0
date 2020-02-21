Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20178167774
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 09:43:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j53sP-0005Ai-42; Fri, 21 Feb 2020 08:41:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RKaF=4J=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1j53sN-0005Ac-Mj
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 08:41:35 +0000
X-Inumbo-ID: f786d860-5485-11ea-85fe-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f786d860-5485-11ea-85fe-12813bfff9fa;
 Fri, 21 Feb 2020 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582274494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TX2bKGmaoFX1kB0Vs23BSK7K2oJcCGlc8FxuCCpPBNM=;
 b=XoB+RpOmVnovaFaXCSajDLv5PkzhrP9+UX4Lk3OzEqm6bWaKzrJK7tdHGCfpTcc0SMOSgN
 WGk4IGHdwTRLYl2CdsfEK0sNZReEEObJQ+mqeocJQoS2pY82xMx4sSiTtfXIRelnLXhOks
 rTwNFVusOEDwuZ5lTr2JLlnWBVD89yo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-7fL0ULPGP-G8hP98qjPlqQ-1; Fri, 21 Feb 2020 03:41:32 -0500
X-MC-Unique: 7fL0ULPGP-G8hP98qjPlqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCDF78010CA;
 Fri, 21 Feb 2020 08:41:28 +0000 (UTC)
Received: from gondolin (ovpn-117-64.ams2.redhat.com [10.36.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF76E26FAA;
 Fri, 21 Feb 2020 08:41:09 +0000 (UTC)
Date: Fri, 21 Feb 2020 09:41:07 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Message-ID: <20200221094107.7e855499.cohuck@redhat.com>
In-Reply-To: <20200220130548.29974-20-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
 <20200220130548.29974-20-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: Re: [Xen-devel] [PATCH v3 19/20] Let cpu_[physical]_memory() calls
 pass a boolean 'is_write' argument
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMCBGZWIgMjAyMCAxNDowNTo0NyArMDEwMApQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQHJlZGhhdC5jb20+IHdyb3RlOgoKPiBVc2UgYW4gZXhwbGljaXQgYm9vbGVhbiB0
eXBlLgo+IAo+IFRoaXMgY29tbWl0IHdhcyBwcm9kdWNlZCB3aXRoIHRoZSBpbmNsdWRlZCBDb2Nj
aW5lbGxlIHNjcmlwdAo+IHNjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4K
PiAtLS0KPiAgc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3QuY29jY2kgfCAxNCArKysr
KysrKysrKysrKwo+ICBpbmNsdWRlL2V4ZWMvY3B1LWNvbW1vbi5oICAgICAgICAgICAgICB8ICA0
ICsrLS0KPiAgaHcvZGlzcGxheS9leHlub3M0MjEwX2ZpbWQuYyAgICAgICAgICAgfCAgMyArKy0K
PiAgaHcvZGlzcGxheS9taWxreW1pc3QtdG11Mi5jICAgICAgICAgICAgfCAgOCArKysrLS0tLQo+
ICBody9kaXNwbGF5L29tYXBfZHNzLmMgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGh3L2Rp
c3BsYXkvcmFtZmIuYyAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgaHcvbWlzYy9wYy10
ZXN0ZGV2LmMgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBody9udnJhbS9zcGFwcl9udnJh
bS5jICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KPiAgaHcvcHBjL3BwYzQ0MF91Yy5jICAgICAg
ICAgICAgICAgICAgICAgfCAgNiArKysrLS0KPiAgaHcvcHBjL3NwYXByX2hjYWxsLmMgICAgICAg
ICAgICAgICAgICAgfCAgNCArKy0tCj4gIGh3L3MzOTB4L2lwbC5jICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KPiAgaHcvczM5MHgvczM5MC1wY2ktYnVzLmMgICAgICAgICAgICAgICAg
fCAgMiArLQo+ICBody9zMzkweC92aXJ0aW8tY2N3LmMgICAgICAgICAgICAgICAgICB8ICAyICst
Cj4gIGh3L3hlbi94ZW5fcHRfZ3JhcGhpY3MuYyAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgdGFy
Z2V0L2kzODYvaGF4LWFsbC5jICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCj4gIHRhcmdldC9z
MzkweC9leGNwX2hlbHBlci5jICAgICAgICAgICAgIHwgIDIgKy0KPiAgdGFyZ2V0L3MzOTB4L2hl
bHBlci5jICAgICAgICAgICAgICAgICAgfCAgNiArKystLS0KPiAgMTcgZmlsZXMgY2hhbmdlZCwg
NDMgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4gCgo+IGRpZmYgLS1naXQgYS9ody9z
MzkweC9pcGwuYyBiL2h3L3MzOTB4L2lwbC5jCj4gaW5kZXggNzc3MzQ5OWQ3Zi4uMDgxNzg3NGI0
OCAxMDA2NDQKPiAtLS0gYS9ody9zMzkweC9pcGwuYwo+ICsrKyBiL2h3L3MzOTB4L2lwbC5jCj4g
QEAgLTYyNiw3ICs2MjYsNyBAQCBzdGF0aWMgdm9pZCBzMzkwX2lwbF9wcmVwYXJlX3FpcGwoUzM5
MENQVSAqY3B1KQo+ICAgICAgdWludDhfdCAqYWRkcjsKPiAgICAgIHVpbnQ2NF90IGxlbiA9IDQw
OTY7Cj4gIAo+IC0gICAgYWRkciA9IGNwdV9waHlzaWNhbF9tZW1vcnlfbWFwKGNwdS0+ZW52LnBz
YSwgJmxlbiwgMSk7Cj4gKyAgICBhZGRyID0gY3B1X3BoeXNpY2FsX21lbW9yeV9tYXAoY3B1LT5l
bnYucHNhLCAmbGVuLCB0cnVlKTsKPiAgICAgIGlmICghYWRkciB8fCBsZW4gPCBRSVBMX0FERFJF
U1MgKyBzaXplb2YoUWVtdUlwbFBhcmFtZXRlcnMpKSB7Cj4gICAgICAgICAgZXJyb3JfcmVwb3J0
KCJDYW5ub3Qgc2V0IFFFTVUgSVBMIHBhcmFtZXRlcnMiKTsKPiAgICAgICAgICByZXR1cm47Cj4g
ZGlmZiAtLWdpdCBhL2h3L3MzOTB4L3MzOTAtcGNpLWJ1cy5jIGIvaHcvczM5MHgvczM5MC1wY2kt
YnVzLmMKPiBpbmRleCA3YzZhMmIzYzYzLi5lZDhiZTEyNGRhIDEwMDY0NAo+IC0tLSBhL2h3L3Mz
OTB4L3MzOTAtcGNpLWJ1cy5jCj4gKysrIGIvaHcvczM5MHgvczM5MC1wY2ktYnVzLmMKPiBAQCAt
NjQxLDcgKzY0MSw3IEBAIHN0YXRpYyB1aW50OF90IHNldF9pbmRfYXRvbWljKHVpbnQ2NF90IGlu
ZF9sb2MsIHVpbnQ4X3QgdG9fYmVfc2V0KQo+ICAgICAgaHdhZGRyIGxlbiA9IDE7Cj4gICAgICB1
aW50OF90ICppbmRfYWRkcjsKPiAgCj4gLSAgICBpbmRfYWRkciA9IGNwdV9waHlzaWNhbF9tZW1v
cnlfbWFwKGluZF9sb2MsICZsZW4sIDEpOwo+ICsgICAgaW5kX2FkZHIgPSBjcHVfcGh5c2ljYWxf
bWVtb3J5X21hcChpbmRfbG9jLCAmbGVuLCB0cnVlKTsKPiAgICAgIGlmICghaW5kX2FkZHIpIHsK
PiAgICAgICAgICBzMzkwX3BjaV9nZW5lcmF0ZV9lcnJvcl9ldmVudChFUlJfRVZFTlRfQUlSRVJS
LCAwLCAwLCAwLCAwKTsKPiAgICAgICAgICByZXR1cm4gLTE7Cj4gZGlmZiAtLWdpdCBhL2h3L3Mz
OTB4L3ZpcnRpby1jY3cuYyBiL2h3L3MzOTB4L3ZpcnRpby1jY3cuYwo+IGluZGV4IDEzZjU3ZTdi
NjcuLjUwY2Y5NWI3ODEgMTAwNjQ0Cj4gLS0tIGEvaHcvczM5MHgvdmlydGlvLWNjdy5jCj4gKysr
IGIvaHcvczM5MHgvdmlydGlvLWNjdy5jCj4gQEAgLTc5MCw3ICs3OTAsNyBAQCBzdGF0aWMgdWlu
dDhfdCB2aXJ0aW9fc2V0X2luZF9hdG9taWMoU3ViY2hEZXYgKnNjaCwgdWludDY0X3QgaW5kX2xv
YywKPiAgICAgIGh3YWRkciBsZW4gPSAxOwo+ICAgICAgdWludDhfdCAqaW5kX2FkZHI7Cj4gIAo+
IC0gICAgaW5kX2FkZHIgPSBjcHVfcGh5c2ljYWxfbWVtb3J5X21hcChpbmRfbG9jLCAmbGVuLCAx
KTsKPiArICAgIGluZF9hZGRyID0gY3B1X3BoeXNpY2FsX21lbW9yeV9tYXAoaW5kX2xvYywgJmxl
biwgdHJ1ZSk7Cj4gICAgICBpZiAoIWluZF9hZGRyKSB7Cj4gICAgICAgICAgZXJyb3JfcmVwb3J0
KCIlcygleC4leC4lMDR4KTogdW5hYmxlIHRvIGFjY2VzcyBpbmRpY2F0b3IiLAo+ICAgICAgICAg
ICAgICAgICAgICAgICBfX2Z1bmNfXywgc2NoLT5jc3NpZCwgc2NoLT5zc2lkLCBzY2gtPnNjaGlk
KTsKCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9zMzkweC9leGNwX2hlbHBlci5jIGIvdGFyZ2V0L3Mz
OTB4L2V4Y3BfaGVscGVyLmMKPiBpbmRleCAxZTlkNmYyMGMxLi4zYjU4ZDEwZGYzIDEwMDY0NAo+
IC0tLSBhL3RhcmdldC9zMzkweC9leGNwX2hlbHBlci5jCj4gKysrIGIvdGFyZ2V0L3MzOTB4L2V4
Y3BfaGVscGVyLmMKPiBAQCAtMzkzLDcgKzM5Myw3IEBAIHN0YXRpYyBpbnQgbWNoa19zdG9yZV92
cmVncyhDUFVTMzkwWFN0YXRlICplbnYsIHVpbnQ2NF90IG1jZXNhbykKPiAgICAgIE1jaGtFeHRT
YXZlQXJlYSAqc2E7Cj4gICAgICBpbnQgaTsKPiAgCj4gLSAgICBzYSA9IGNwdV9waHlzaWNhbF9t
ZW1vcnlfbWFwKG1jZXNhbywgJmxlbiwgMSk7Cj4gKyAgICBzYSA9IGNwdV9waHlzaWNhbF9tZW1v
cnlfbWFwKG1jZXNhbywgJmxlbiwgdHJ1ZSk7Cj4gICAgICBpZiAoIXNhKSB7Cj4gICAgICAgICAg
cmV0dXJuIC1FRkFVTFQ7Cj4gICAgICB9Cj4gZGlmZiAtLWdpdCBhL3RhcmdldC9zMzkweC9oZWxw
ZXIuYyBiL3RhcmdldC9zMzkweC9oZWxwZXIuYwo+IGluZGV4IGEzYTQ5MTY0ZTQuLmI4MTBhZDQz
MWUgMTAwNjQ0Cj4gLS0tIGEvdGFyZ2V0L3MzOTB4L2hlbHBlci5jCj4gKysrIGIvdGFyZ2V0L3Mz
OTB4L2hlbHBlci5jCj4gQEAgLTE1MSw3ICsxNTEsNyBAQCBMb3dDb3JlICpjcHVfbWFwX2xvd2Nv
cmUoQ1BVUzM5MFhTdGF0ZSAqZW52KQo+ICAgICAgTG93Q29yZSAqbG93Y29yZTsKPiAgICAgIGh3
YWRkciBsZW4gPSBzaXplb2YoTG93Q29yZSk7Cj4gIAo+IC0gICAgbG93Y29yZSA9IGNwdV9waHlz
aWNhbF9tZW1vcnlfbWFwKGVudi0+cHNhLCAmbGVuLCAxKTsKPiArICAgIGxvd2NvcmUgPSBjcHVf
cGh5c2ljYWxfbWVtb3J5X21hcChlbnYtPnBzYSwgJmxlbiwgdHJ1ZSk7Cj4gIAo+ICAgICAgaWYg
KGxlbiA8IHNpemVvZihMb3dDb3JlKSkgewo+ICAgICAgICAgIGNwdV9hYm9ydChlbnZfY3B1KGVu
diksICJDb3VsZCBub3QgbWFwIGxvd2NvcmVcbiIpOwo+IEBAIC0yNDYsNyArMjQ2LDcgQEAgaW50
IHMzOTBfc3RvcmVfc3RhdHVzKFMzOTBDUFUgKmNwdSwgaHdhZGRyIGFkZHIsIGJvb2wgc3RvcmVf
YXJjaCkKPiAgICAgIGh3YWRkciBsZW4gPSBzaXplb2YoKnNhKTsKPiAgICAgIGludCBpOwo+ICAK
PiAtICAgIHNhID0gY3B1X3BoeXNpY2FsX21lbW9yeV9tYXAoYWRkciwgJmxlbiwgMSk7Cj4gKyAg
ICBzYSA9IGNwdV9waHlzaWNhbF9tZW1vcnlfbWFwKGFkZHIsICZsZW4sIHRydWUpOwo+ICAgICAg
aWYgKCFzYSkgewo+ICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ICAgICAgfQo+IEBAIC0yOTgs
NyArMjk4LDcgQEAgaW50IHMzOTBfc3RvcmVfYWR0bF9zdGF0dXMoUzM5MENQVSAqY3B1LCBod2Fk
ZHIgYWRkciwgaHdhZGRyIGxlbikKPiAgICAgIGh3YWRkciBzYXZlID0gbGVuOwo+ICAgICAgaW50
IGk7Cj4gIAo+IC0gICAgc2EgPSBjcHVfcGh5c2ljYWxfbWVtb3J5X21hcChhZGRyLCAmc2F2ZSwg
MSk7Cj4gKyAgICBzYSA9IGNwdV9waHlzaWNhbF9tZW1vcnlfbWFwKGFkZHIsICZzYXZlLCB0cnVl
KTsKPiAgICAgIGlmICghc2EpIHsKPiAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiAgICAgIH0K
CnMzOTAgcGFydHMKQWNrZWQtYnk6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
