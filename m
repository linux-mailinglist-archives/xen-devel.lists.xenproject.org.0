Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051D1167770
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 09:42:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j53pv-0004J0-K2; Fri, 21 Feb 2020 08:39:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RKaF=4J=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1j53pt-0004Iv-So
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 08:39:02 +0000
X-Inumbo-ID: 9bf21fc8-5485-11ea-bc8e-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9bf21fc8-5485-11ea-bc8e-bc764e2007e4;
 Fri, 21 Feb 2020 08:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582274341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jKPj3gf+T3ocOqgvJULo7PhApveqgiAwsnEtaSBAEQ=;
 b=e+q+v9FYiHBMDN9wgzsZpOa3UtSZDBM7LtPy2K5kxuriFeAtmhR+4jVNDL2IiJKwlHHtQ0
 juP26Iv2eaV1qRklmE6iso7BC2xBdSH2AF/k+zKM6fu0mHrzx22ATRtpzsZamfHr+7WBx1
 IT7YpkSlrN015YEQfOhKWkNmvG4O2zY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-icepWPbFPbqSoFkIU1jjaA-1; Fri, 21 Feb 2020 03:38:59 -0500
X-MC-Unique: icepWPbFPbqSoFkIU1jjaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7A62800D50;
 Fri, 21 Feb 2020 08:38:55 +0000 (UTC)
Received: from gondolin (ovpn-117-64.ams2.redhat.com [10.36.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE7D75D9E2;
 Fri, 21 Feb 2020 08:38:33 +0000 (UTC)
Date: Fri, 21 Feb 2020 09:38:30 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Message-ID: <20200221093830.63bc308e.cohuck@redhat.com>
In-Reply-To: <20200220130548.29974-9-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
 <20200220130548.29974-9-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: Re: [Xen-devel] [PATCH v3 08/20] Remove unnecessary cast when using
 the address_space API
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

T24gVGh1LCAyMCBGZWIgMjAyMCAxNDowNTozNiArMDEwMApQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQHJlZGhhdC5jb20+IHdyb3RlOgoKPiBUaGlzIGNvbW1pdCB3YXMgcHJvZHVjZWQg
d2l0aCB0aGUgaW5jbHVkZWQgQ29jY2luZWxsZSBzY3JpcHQKPiBzY3JpcHRzL2NvY2NpbmVsbGUv
ZXhlY19yd19jb25zdC4KPiAKPiBUd28gbGluZXMgaW4gaHcvbmV0L2RwODM5M3guYyB0aGF0IENv
Y2NpbmVsbGUgcHJvZHVjZWQgdGhhdAo+IHdlcmUgb3ZlciA4MCBjaGFyYWN0ZXJzIHdlcmUgcmUt
d3JhcHBlZCBieSBoYW5kLgo+IAo+IFN1Z2dlc3RlZC1ieTogU3RlZmFuIFdlaWwgPHN3QHdlaWxu
ZXR6LmRlPgo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRA
cmVkaGF0LmNvbT4KPiAtLS0KPiAgc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3QuY29j
Y2kgfCAxNSArKysrKysrKysrKysrLQo+ICB0YXJnZXQvaTM4Ni9odmYvdm14LmggICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gIGh3L2FybS9ib290LmMgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDYgKystLS0tCj4gIGh3L2RtYS9yYzQwMzAuYyAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDQgKystLQo+ICBody9kbWEveGxueC16ZG1hLmMgICAgICAgICAgICAgICAgICAgICB8ICAyICst
Cj4gIGh3L25ldC9jYWRlbmNlX2dlbS5jICAgICAgICAgICAgICAgICAgIHwgMjEgKysrKysrKysr
LS0tLS0tLS0tLQo+ICBody9uZXQvZHA4MzkzeC5jICAgICAgICAgICAgICAgICAgICAgICB8IDI4
ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gIGh3L3MzOTB4L2Nzcy5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDQgKystLQo+ICBxdGVzdC5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDEyICsrKysrLS0tLS0tCj4gIHRhcmdldC9pMzg2L2h2Zi94ODZfbW11LmMgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgdGFyZ2V0L2kzODYvd2hweC1hbGwuYyAgICAgICAgICAgICAg
ICAgfCAgMiArLQo+ICB0YXJnZXQvczM5MHgvbW11X2hlbHBlci5jICAgICAgICAgICAgICB8ICAy
ICstCj4gIDEyIGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygt
KQo+IAoKPiBkaWZmIC0tZ2l0IGEvaHcvczM5MHgvY3NzLmMgYi9ody9zMzkweC9jc3MuYwo+IGlu
ZGV4IDg0NGNhYWI0MDguLmYyN2Y4YzQ1YTUgMTAwNjQ0Cj4gLS0tIGEvaHcvczM5MHgvY3NzLmMK
PiArKysgYi9ody9zMzkweC9jc3MuYwo+IEBAIC04NzUsNyArODc1LDcgQEAgc3RhdGljIGlubGlu
ZSBpbnQgaWRhX3JlYWRfbmV4dF9pZGF3KENjd0RhdGFTdHJlYW0gKmNkcykKPiAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7IC8qIGNoYW5uZWwgcHJvZ3JhbSBjaGVjayAqLwo+ICAgICAgICAg
IH0KPiAgICAgICAgICByZXQgPSBhZGRyZXNzX3NwYWNlX3J3KCZhZGRyZXNzX3NwYWNlX21lbW9y
eSwgaWRhd19hZGRyLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUVNVFhBVFRS
U19VTlNQRUNJRklFRCwgKHZvaWQgKikgJmlkYXcuZm10MiwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsICZpZGF3LmZtdDIsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoaWRhdy5mbXQyKSwgZmFsc2UpOwo+ICAg
ICAgICAgIGNkcy0+Y2RhID0gYmU2NF90b19jcHUoaWRhdy5mbXQyKTsKPiAgICAgIH0gZWxzZSB7
Cj4gQEAgLTg4NCw3ICs4ODQsNyBAQCBzdGF0aWMgaW5saW5lIGludCBpZGFfcmVhZF9uZXh0X2lk
YXcoQ2N3RGF0YVN0cmVhbSAqY2RzKQo+ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsgLyog
Y2hhbm5lbCBwcm9ncmFtIGNoZWNrICovCj4gICAgICAgICAgfQo+ICAgICAgICAgIHJldCA9IGFk
ZHJlc3Nfc3BhY2VfcncoJmFkZHJlc3Nfc3BhY2VfbWVtb3J5LCBpZGF3X2FkZHIsCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCAodm9pZCAq
KSAmaWRhdy5mbXQxLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUVNVFhBVFRS
U19VTlNQRUNJRklFRCwgJmlkYXcuZm10MSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNpemVvZihpZGF3LmZtdDEpLCBmYWxzZSk7Cj4gICAgICAgICAgY2RzLT5jZGEgPSBiZTY0
X3RvX2NwdShpZGF3LmZtdDEpOwo+ICAgICAgICAgIGlmIChjZHMtPmNkYSAmIDB4ODAwMDAwMDAp
IHsKCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9zMzkweC9tbXVfaGVscGVyLmMgYi90YXJnZXQvczM5
MHgvbW11X2hlbHBlci5jCj4gaW5kZXggYzlmM2YzNDc1MC4uMGJlMmYzMDBiYiAxMDA2NDQKPiAt
LS0gYS90YXJnZXQvczM5MHgvbW11X2hlbHBlci5jCj4gKysrIGIvdGFyZ2V0L3MzOTB4L21tdV9o
ZWxwZXIuYwo+IEBAIC0xMDYsNyArMTA2LDcgQEAgc3RhdGljIGlubGluZSBib29sIHJlYWRfdGFi
bGVfZW50cnkoQ1BVUzM5MFhTdGF0ZSAqZW52LCBod2FkZHIgZ2FkZHIsCj4gICAgICAgKiBXZSB0
cmVhdCB0aGVtIGFzIGFic29sdXRlIGFkZHJlc3NlcyBhbmQgZG9uJ3Qgd3JhcCB0aGVtLgo+ICAg
ICAgICovCj4gICAgICBpZiAodW5saWtlbHkoYWRkcmVzc19zcGFjZV9yZWFkKGNzLT5hcywgZ2Fk
ZHIsIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICh1aW50OF90ICopZW50cnksIHNpemVvZigqZW50cnkpKSAhPQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnRyeSwgc2l6ZW9mKCplbnRyeSkpICE9Cj4g
ICAgICAgICAgICAgICAgICAgTUVNVFhfT0spKSB7Cj4gICAgICAgICAgcmV0dXJuIGZhbHNlOwo+
ICAgICAgfQoKczM5MCBwYXJ0cwpBY2tlZC1ieTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhh
dC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
