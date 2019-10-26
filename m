Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51426E5E65
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:05:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQPO-0005Ox-Od; Sat, 26 Oct 2019 18:03:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQPN-0005Ob-2Z
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:03:25 +0000
X-Inumbo-ID: e7090f20-f81a-11e9-8aca-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e7090f20-f81a-11e9-8aca-bc764e2007e4;
 Sat, 26 Oct 2019 18:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572113003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLkjW/SiU6tuPjb04MJ+d1neT8bfs+OP0tP7YoGCDwk=;
 b=OeSAEtu9kyDw/wNvyBf2C3eVWHnrALUQV2mjWNbiV2ngZZ2tsnBIrMya0gF4LKrs5p1Ca8
 yrM2lfptyzaB3qajlr3oU9TE06Qll6bjpr21+O0ujQq6Mj5AFMpQe/y1sgTr5jfhNT0PPR
 LoyzUPYBJ+dqk1l79rk64vLQnbA8gjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-f_MbD3CDMIGYapwrrruiHw-1; Sat, 26 Oct 2019 14:03:18 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00758107AD25;
 Sat, 26 Oct 2019 18:03:16 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0902260C57;
 Sat, 26 Oct 2019 18:03:01 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:29 +0200
Message-Id: <20191026180143.7369-7-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: f_MbD3CDMIGYapwrrruiHw-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 06/20] piix4: Add an i8257 DMA Controller as
 specified in datasheet
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
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
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

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKVGhlIGk4MjU3
IGlzIG5vdCBhIGNoaXBzZXQgb24gdGhlIE1hbHRhIGJvYXJkLCBidXQgaXMgcGFydCBvZgp0aGUg
UElJWDQgY2hpcHNldC4KQ3JlYXRlIHRoZSBpODI1NyBpbiB0aGUgUElJWDQgY29kZSwgcmVtb3Zl
IHRoZSBvbmUgaW5zdGFudGlhdGVkCmluIG1hbHRhIGJvYXJkLCB0byBub3QgaGF2ZSBpdCB0d2lj
ZS4KCkFja2VkLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgpBY2tlZC1i
eTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogSGVy
dsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgpNZXNzYWdlLUlkOiA8MjAxNzEy
MTYwOTAyMjguMjg1MDUtOS1ocG91c3NpbkByZWFjdG9zLm9yZz4KUmV2aWV3ZWQtYnk6IEFsZWtz
YW5kYXIgTWFya292aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+ClJldmlld2VkLWJ5OiBFc3Rl
YmFuIEJvc3NlIDxlc3RlYmFuYm9zc2VAZ21haWwuY29tPgpbUE1EOiByZWJhc2VkLCByZXdvcmRl
ZCBkZXNjcmlwdGlvbl0KU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPgotLS0KdjM6IFJld29yZGVkIGNvbW1pdCBkZXNjcmlwdGlvbiAoTGkg
UWlhbmcpCi0tLQogaHcvaXNhL3BpaXg0LmMgICAgICAgfCA0ICsrKysKIGh3L21pcHMvbWlwc19t
YWx0YS5jIHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvaXNhL3BpaXg0LmMgYi9ody9pc2EvcGlpeDQuYwppbmRl
eCBmYTM4NzkxOWI1Li45ZWJlOThiZGMzIDEwMDY0NAotLS0gYS9ody9pc2EvcGlpeDQuYworKysg
Yi9ody9pc2EvcGlpeDQuYwpAQCAtMjksNiArMjksNyBAQAogI2luY2x1ZGUgImh3L3BjaS9wY2ku
aCIKICNpbmNsdWRlICJody9pc2EvaXNhLmgiCiAjaW5jbHVkZSAiaHcvc3lzYnVzLmgiCisjaW5j
bHVkZSAiaHcvZG1hL2k4MjU3LmgiCiAjaW5jbHVkZSAibWlncmF0aW9uL3Ztc3RhdGUuaCIKICNp
bmNsdWRlICJzeXNlbXUvcmVzZXQuaCIKICNpbmNsdWRlICJzeXNlbXUvcnVuc3RhdGUuaCIKQEAg
LTE2Nyw2ICsxNjgsOSBAQCBzdGF0aWMgdm9pZCBwaWl4NF9yZWFsaXplKFBDSURldmljZSAqZGV2
LCBFcnJvciAqKmVycnApCiAgICAgLyogaW5pdGlhbGl6ZSBJU0EgaXJxcyAqLwogICAgIGlzYV9i
dXNfaXJxcyhpc2FfYnVzLCBzLT5pc2EpOwogCisgICAgLyogRE1BICovCisgICAgaTgyNTdfZG1h
X2luaXQoaXNhX2J1cywgMCk7CisKICAgICBwaWl4NF9kZXYgPSBkZXY7CiB9CiAKZGlmZiAtLWdp
dCBhL2h3L21pcHMvbWlwc19tYWx0YS5jIGIvaHcvbWlwcy9taXBzX21hbHRhLmMKaW5kZXggNTA4
NjAyNDgyMS4uNDRlNWY4YjI2YiAxMDA2NDQKLS0tIGEvaHcvbWlwcy9taXBzX21hbHRhLmMKKysr
IGIvaHcvbWlwcy9taXBzX21hbHRhLmMKQEAgLTI4LDcgKzI4LDYgQEAKICNpbmNsdWRlICJjcHUu
aCIKICNpbmNsdWRlICJody9pMzg2L3BjLmgiCiAjaW5jbHVkZSAiaHcvaXNhL3N1cGVyaW8uaCIK
LSNpbmNsdWRlICJody9kbWEvaTgyNTcuaCIKICNpbmNsdWRlICJody9jaGFyL3NlcmlhbC5oIgog
I2luY2x1ZGUgIm5ldC9uZXQuaCIKICNpbmNsdWRlICJody9ib2FyZHMuaCIKQEAgLTE0MzAsNyAr
MTQyOSw2IEBAIHZvaWQgbWlwc19tYWx0YV9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkKICAg
ICBzbWJ1cyA9IHBpaXg0X3BtX2luaXQocGNpX2J1cywgcGlpeDRfZGV2Zm4gKyAzLCAweDExMDAs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgIGlzYV9nZXRfaXJxKE5VTEwsIDkpLCBOVUxMLCAw
LCBOVUxMKTsKICAgICBwaXQgPSBpODI1NF9waXRfaW5pdChpc2FfYnVzLCAweDQwLCAwLCBOVUxM
KTsKLSAgICBpODI1N19kbWFfaW5pdChpc2FfYnVzLCAwKTsKICAgICBtYzE0NjgxOF9ydGNfaW5p
dChpc2FfYnVzLCAyMDAwLCBOVUxMKTsKIAogICAgIC8qIGdlbmVyYXRlIFNQRCBFRVBST00gZGF0
YSAqLwotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
