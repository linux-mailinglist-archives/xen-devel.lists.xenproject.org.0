Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF52A116A88
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:07:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieFv9-0006AZ-Jv; Mon, 09 Dec 2019 10:05:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0zrz=Z7=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1ieFv8-0006AM-BV
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:05:38 +0000
X-Inumbo-ID: 72c88e10-1a6b-11ea-88e7-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 72c88e10-1a6b-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 10:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575885937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=gcXxnFZqmipUTp4SLY/i9ILSaABJyhP3QgU/n54mC1A=;
 b=fwVGq7RrJS1p7B7k8FE7OMX71ZBf5WwwwQ98wgrLnC/u0I8bGQDvw27e7eH++NtH6fZaWG
 CmXzmLZdAd5FPJRItS+W+O51pRC5XrniuygxgzUPZ5FPDfvsplKHnPZJ+5uKgkx1+qnzbG
 CwN8y8H/eLMiFp2W6e71g5VryUg7NB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-h0eJ5ZtWNDC-3obL730LkA-1; Mon, 09 Dec 2019 05:05:34 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AEDE107AFFB;
 Mon,  9 Dec 2019 10:05:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-121.ams2.redhat.com [10.36.116.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF7B95D6C5;
 Mon,  9 Dec 2019 10:05:22 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a4745134-47dc-ab8a-6009-69fcc9dfbb02@redhat.com>
Date: Mon, 9 Dec 2019 11:05:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191209095002.32194-4-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: h0eJ5ZtWNDC-3obL730LkA-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 3/6] hw/pci-host/i440fx: Use
 size_t to iterate over ARRAY_SIZE()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTIvMjAxOSAxMC40OSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4gV2Ug
ZG9uJ3QgZW5mb3JjZSB0aGUgLVdzaWduLWNvbnZlcnNpb24gQ1BQRkxBRywgYnV0IGl0IGRvZXNu
J3QgaHVydAo+IHRvIGF2b2lkIHRoaXMgd2FybmluZzoKPiAKPiAgIHdhcm5pbmc6IGltcGxpY2l0
IGNvbnZlcnNpb24gY2hhbmdlcyBzaWduZWRuZXNzOiAnaW50JyB0byAnc2l6ZV90JyAoYWthICd1
bnNpZ25lZCBsb25nJykgWy1Xc2lnbi1jb252ZXJzaW9uXQo+IAo+IFNpZ25lZC1vZmYtYnk6IFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaHcvcGNp
LWhvc3QvaTQ0MGZ4LmMgfCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2h3L3BjaS1ob3N0L2k0NDBmeC5j
IGIvaHcvcGNpLWhvc3QvaTQ0MGZ4LmMKPiBpbmRleCBmYmRjNTYzNTk5Li4wY2M4MGIyNzZkIDEw
MDY0NAo+IC0tLSBhL2h3L3BjaS1ob3N0L2k0NDBmeC5jCj4gKysrIGIvaHcvcGNpLWhvc3QvaTQ0
MGZ4LmMKPiBAQCAtNDE5LDEyICs0MTksMTEgQEAgb3V0Ogo+ICBzdGF0aWMgdm9pZCBpZ2RfcHRf
aTQ0MGZ4X3JlYWxpemUoUENJRGV2aWNlICpwY2lfZGV2LCBFcnJvciAqKmVycnApCj4gIHsKPiAg
ICAgIHVpbnQzMl90IHZhbCA9IDA7Cj4gLSAgICBpbnQgaSwgbnVtOwo+ICsgICAgc2l6ZV90IGk7
Cj4gICAgICBpbnQgcG9zLCBsZW47Cj4gICAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsKPiAg
Cj4gLSAgICBudW0gPSBBUlJBWV9TSVpFKGlnZF9ob3N0X2JyaWRnZV9pbmZvcyk7Cj4gLSAgICBm
b3IgKGkgPSAwOyBpIDwgbnVtOyBpKyspIHsKPiArICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9T
SVpFKGlnZF9ob3N0X2JyaWRnZV9pbmZvcyk7IGkrKykgewo+ICAgICAgICAgIHBvcyA9IGlnZF9o
b3N0X2JyaWRnZV9pbmZvc1tpXS5vZmZzZXQ7Cj4gICAgICAgICAgbGVuID0gaWdkX2hvc3RfYnJp
ZGdlX2luZm9zW2ldLmxlbjsKPiAgICAgICAgICBob3N0X3BjaV9jb25maWdfcmVhZChwb3MsIGxl
biwgJnZhbCwgJmxvY2FsX2Vycik7Cj4gCgpSZXZpZXdlZC1ieTogVGhvbWFzIEh1dGggPHRodXRo
QHJlZGhhdC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
