Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 001C3165E92
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:19:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lhC-00049v-3N; Thu, 20 Feb 2020 13:16:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nI7P=4I=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1j4lhA-00049p-B1
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:16:48 +0000
X-Inumbo-ID: 3f980db6-53e3-11ea-bc8e-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3f980db6-53e3-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 13:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582204607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ru3ADtcHYP8MfN/oIVe5nGPDlqA+ClJ+343y1IgOloY=;
 b=CSck3AKETPRi+rIlgust7ZVO+ImhQAT8qP4QFovK2zrcRgBT5xmmY19+ROetim4nhJzvpR
 eV697Mg5X/tWObbzDzaesNEh8/vi4ICqTCzPiS7OkfM9WrKvv4WMvL0AYbOD18C+2lBuuQ
 bjH6yL443mmL7UlvWE2/1sH3da2Wp6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-RcZlOOoRPWG_gnpP3lfEWQ-1; Thu, 20 Feb 2020 08:16:45 -0500
X-MC-Unique: RcZlOOoRPWG_gnpP3lfEWQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D202C1005510;
 Thu, 20 Feb 2020 13:16:41 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1755B8B570;
 Thu, 20 Feb 2020 13:16:28 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200220130548.29974-1-philmd@redhat.com>
 <20200220130548.29974-3-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <68120807-6f6b-1602-8208-fd76d64e74bc@redhat.com>
Date: Thu, 20 Feb 2020 07:16:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220130548.29974-3-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Subject: Re: [Xen-devel] [PATCH v3 02/20] hw: Remove unnecessary cast when
 calling dma_memory_read()
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
Cc: Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8yMC8yMCA3OjA1IEFNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPiBTaW5j
ZSBpdHMgaW50cm9kdWN0aW9uIGluIGNvbW1pdCBkODZhNzdmOGFiYiwgZG1hX21lbW9yeV9yZWFk
KCkKPiBhbHdheXMgYWNjZXB0ZWQgdm9pZCBwb2ludGVyIGFyZ3VtZW50LiBSZW1vdmUgdGhlIHVu
bmVjZXNzYXJ5Cj4gY2FzdHMuCj4gCj4gVGhpcyBjb21taXQgd2FzIHByb2R1Y2VkIHdpdGggdGhl
IGluY2x1ZGVkIENvY2NpbmVsbGUgc2NyaXB0Cj4gc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndf
Y29uc3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxt
ZEByZWRoYXQuY29tPgo+IC0tLQo+ICAgc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3Qu
Y29jY2kgfCAxNSArKysrKysrKysrKysrKysKPiAgIGh3L2FybS9zbW11LWNvbW1vbi5jICAgICAg
ICAgICAgICAgICAgIHwgIDMgKy0tCj4gICBody9hcm0vc21tdXYzLmMgICAgICAgICAgICAgICAg
ICAgICAgICB8IDEwICsrKystLS0tLS0KPiAgIGh3L3NkL3NkaGNpLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMTUgKysrKystLS0tLS0tLS0tCj4gICA0IGZpbGVzIGNoYW5nZWQsIDI1IGlu
c2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlw
dHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNvY2NpCj4gCj4gZGlmZiAtLWdpdCBhL3Njcmlw
dHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNvY2NpIGIvc2NyaXB0cy9jb2NjaW5lbGxlL2V4
ZWNfcndfY29uc3QuY29jY2kKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLmEwMDU0ZjAwOWQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc2NyaXB0cy9jb2NjaW5lbGxl
L2V4ZWNfcndfY29uc3QuY29jY2kKPiBAQCAtMCwwICsxLDE1IEBACj4gKy8vIFVzYWdlOgo+ICsv
LyAgc3BhdGNoIC0tc3AtZmlsZSBzY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2Nj
aSAtLWRpciAuIC0taW4tcGxhY2UKClRoaXMgY29tbWFuZCBsaW5lIHNob3VsZCBhbHNvIHVzZSAn
LS1tYWNyby1maWxlIApzY3JpcHRzL2NvY2NpLW1hY3JvLWZpbGUuaCcgdG8gY292ZXIgbW9yZSBv
ZiB0aGUgY29kZSBiYXNlIChDb2NjaW5lbGxlIApza2lwcyBwb3J0aW9ucyBvZiB0aGUgY29kZSB0
aGF0IHVzZXMgbWFjcm9zIGl0IGRvZXNuJ3QgcmVjb2duaXplKS4KCgo+IEBAIC03MjYsMTMgKzcy
NCwxMCBAQCBzdGF0aWMgdm9pZCBnZXRfYWRtYV9kZXNjcmlwdGlvbihTREhDSVN0YXRlICpzLCBB
RE1BRGVzY3IgKmRzY3IpCj4gICAgICAgICAgIH0KPiAgICAgICAgICAgYnJlYWs7Cj4gICAgICAg
Y2FzZSBTREhDX0NUUkxfQURNQTJfNjQ6Cj4gLSAgICAgICAgZG1hX21lbW9yeV9yZWFkKHMtPmRt
YV9hcywgZW50cnlfYWRkciwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgKHVpbnQ4X3QgKiko
JmRzY3ItPmF0dHIpLCAxKTsKPiAtICAgICAgICBkbWFfbWVtb3J5X3JlYWQocy0+ZG1hX2FzLCBl
bnRyeV9hZGRyICsgMiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgKHVpbnQ4X3QgKikoJmRz
Y3ItPmxlbmd0aCksIDIpOwo+ICsgICAgICAgIGRtYV9tZW1vcnlfcmVhZChzLT5kbWFfYXMsIGVu
dHJ5X2FkZHIsICgmZHNjci0+YXR0ciksIDEpOwo+ICsgICAgICAgIGRtYV9tZW1vcnlfcmVhZChz
LT5kbWFfYXMsIGVudHJ5X2FkZHIgKyAyLCAoJmRzY3ItPmxlbmd0aCksIDIpOwoKVGhlICgpIGFy
b3VuZCAmZHNjci0+bGVuZ3RoIGFyZSBub3cgcG9pbnRsZXNzLgoKLS0gCkVyaWMgQmxha2UsIFBy
aW5jaXBhbCBTb2Z0d2FyZSBFbmdpbmVlcgpSZWQgSGF0LCBJbmMuICAgICAgICAgICArMS05MTkt
MzAxLTMyMjYKVmlydHVhbGl6YXRpb246ICBxZW11Lm9yZyB8IGxpYnZpcnQub3JnCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
