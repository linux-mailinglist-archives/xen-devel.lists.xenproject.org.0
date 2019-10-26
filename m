Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18D8E5E6B
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:05:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQP8-0005Ju-F8; Sat, 26 Oct 2019 18:03:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQP7-0005Je-KX
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:03:09 +0000
X-Inumbo-ID: ddd145a8-f81a-11e9-bbab-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ddd145a8-f81a-11e9-bbab-bc764e2007e4;
 Sat, 26 Oct 2019 18:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572112988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V+bPrM8zE9f2ZPzvcaB3nRFmrtGkwHQwxvCglyVobxE=;
 b=Whx/9GXXT+55XQIIXDRpcTbHNWnueqOktr7BtZ+ckKIbBeTlXj32XHvGC+WtloDAoRamdM
 Sc8R5RmCZa/DMrMUjgQTaBojHq1xWULfhetCkAjkXUWrxn1vx57XbBf76cHG/IfXQpW8kA
 uhAZs9RXgS6imKm4A8wCqBF/xkclmr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-6OBl9SKQPDCw2CHjDSEwdQ-1; Sat, 26 Oct 2019 14:03:03 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 712441800DFD;
 Sat, 26 Oct 2019 18:03:01 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9920C60F82;
 Sat, 26 Oct 2019 18:02:44 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:28 +0200
Message-Id: <20191026180143.7369-6-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 6OBl9SKQPDCw2CHjDSEwdQ-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 05/20] piix4: Rename PIIX4 object to piix4-isa
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKT3RoZXIgcGlp
eDQgcGFydHMgYXJlIGFscmVhZHkgbmFtZWQgcGlpeDQtaWRlIGFuZCBwaWl4NC11c2ItdWhjaS4K
ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgpB
Y2tlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFBh
b2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEhlcnbDqSBQ
b3Vzc2luZWF1IDxocG91c3NpbkByZWFjdG9zLm9yZz4KTWVzc2FnZS1JZDogPDIwMTcxMjE2MDkw
MjI4LjI4NTA1LTE1LWhwb3Vzc2luQHJlYWN0b3Mub3JnPgpSZXZpZXdlZC1ieTogQWxla3NhbmRh
ciBNYXJrb3ZpYyA8YW1hcmtvdmljQHdhdmVjb21wLmNvbT4KUmV2aWV3ZWQtYnk6IExpIFFpYW5n
IDxsaXEzZWFAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogRXN0ZWJhbiBCb3NzZSA8ZXN0ZWJhbmJv
c3NlQGdtYWlsLmNvbT4KW1BNRDogcmViYXNlZF0KU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0
aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGh3L2lzYS9waWl4NC5jICAgICAg
IHwgMSAtCiBody9taXBzL21pcHNfbWFsdGEuYyB8IDIgKy0KIGluY2x1ZGUvaHcvaXNhL2lzYS5o
IHwgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvaHcvaXNhL3BpaXg0LmMgYi9ody9pc2EvcGlpeDQuYwppbmRleCA3Y2Y3
MmUzMTE4Li5mYTM4NzkxOWI1IDEwMDY0NAotLS0gYS9ody9pc2EvcGlpeDQuYworKysgYi9ody9p
c2EvcGlpeDQuYwpAQCAtNDUsNyArNDUsNiBAQCB0eXBlZGVmIHN0cnVjdCBQSUlYNFN0YXRlIHsK
ICAgICB1aW50OF90IHJjcjsKIH0gUElJWDRTdGF0ZTsKIAotI2RlZmluZSBUWVBFX1BJSVg0X1BD
SV9ERVZJQ0UgIlBJSVg0IgogI2RlZmluZSBQSUlYNF9QQ0lfREVWSUNFKG9iaikgXAogICAgIE9C
SkVDVF9DSEVDSyhQSUlYNFN0YXRlLCAob2JqKSwgVFlQRV9QSUlYNF9QQ0lfREVWSUNFKQogCmRp
ZmYgLS1naXQgYS9ody9taXBzL21pcHNfbWFsdGEuYyBiL2h3L21pcHMvbWlwc19tYWx0YS5jCmlu
ZGV4IDZkOWIyMzAzMjIuLjUwODYwMjQ4MjEgMTAwNjQ0Ci0tLSBhL2h3L21pcHMvbWlwc19tYWx0
YS5jCisrKyBiL2h3L21pcHMvbWlwc19tYWx0YS5jCkBAIC0xNDE0LDcgKzE0MTQsNyBAQCB2b2lk
IG1pcHNfbWFsdGFfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpCiAgICAgaWRlX2RyaXZlX2dl
dChoZCwgQVJSQVlfU0laRShoZCkpOwogCiAgICAgcGNpID0gcGNpX2NyZWF0ZV9zaW1wbGVfbXVs
dGlmdW5jdGlvbihwY2lfYnVzLCBQQ0lfREVWRk4oMTAsIDApLAotICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSwgIlBJSVg0Iik7CisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0cnVlLCBUWVBFX1BJSVg0X1BDSV9ERVZJQ0UpOwog
ICAgIGRldiA9IERFVklDRShwY2kpOwogICAgIGlzYV9idXMgPSBJU0FfQlVTKHFkZXZfZ2V0X2No
aWxkX2J1cyhkZXYsICJpc2EuMCIpKTsKICAgICBwaWl4NF9kZXZmbiA9IHBjaS0+ZGV2Zm47CmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2h3L2lzYS9pc2EuaCBiL2luY2x1ZGUvaHcvaXNhL2lzYS5oCmlu
ZGV4IDAxOGFkYTRmNmYuLjc5ZjcwM2ZkNmMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvaXNhL2lz
YS5oCisrKyBiL2luY2x1ZGUvaHcvaXNhL2lzYS5oCkBAIC0xNDcsNCArMTQ3LDYgQEAgc3RhdGlj
IGlubGluZSBJU0FCdXMgKmlzYV9idXNfZnJvbV9kZXZpY2UoSVNBRGV2aWNlICpkKQogICAgIHJl
dHVybiBJU0FfQlVTKHFkZXZfZ2V0X3BhcmVudF9idXMoREVWSUNFKGQpKSk7CiB9CiAKKyNkZWZp
bmUgVFlQRV9QSUlYNF9QQ0lfREVWSUNFICJwaWl4NC1pc2EiCisKICNlbmRpZgotLSAKMi4yMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
