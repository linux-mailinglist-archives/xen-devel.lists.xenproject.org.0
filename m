Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AE5165E4C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:08:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lX6-00018b-1b; Thu, 20 Feb 2020 13:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lX3-00016n-Qj
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:21 +0000
X-Inumbo-ID: ca1a1724-53e1-11ea-b0fd-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ca1a1724-53e1-11ea-b0fd-bc764e2007e4;
 Thu, 20 Feb 2020 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582203981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9T2fAo+6xtdSOASO+MDoJq7z4DL4xf6hcEaFpq9VX4A=;
 b=Iq+j47c/71o4ui3iyND8W4PWFq5fKyG5tcPNoZ5ML/QJTrFQZ9r2z7pVid5DzE0rgAWftc
 fOVYSsSqT6vNb8PzflBwqLaqTfRx1OI+1o0rYtd35UhllgX9M73uZHbZO/o43pnoeScs7e
 OPnJdmqnXJ8mYT/nMEPpvQfABMRnfFo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-Sr4y9MXaMCytIX_rIUtg6Q-1; Thu, 20 Feb 2020 08:06:19 -0500
Received: by mail-wr1-f72.google.com with SMTP id d8so1701512wrq.12
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f0ShsBpyUInIOkeskmM477n/0YX3Rn03mTxtkP3QCEQ=;
 b=OA6JD0bZL/nZuvgLST800VfqRxWlWm6Pq6iz19hxr8EVAeFNcxIHr/zKI1/1HaLq4j
 ZY4sP3bzjGyvVLIYVgN6Hbey1CQSvw81MKgmZaSNQhBGjyBz3m+wwtDLOKC7MMozfjYR
 LWT7mqF9+qX9MdDJI3AUfqlEQuQ78Wa4ibPa24PUHfJaosWsHVTZcy70aQ0tZpWbQm+k
 SpwNiTq8VehgMKvgE59z1ObUcHYiiDEh9h/czD6SZHD/LwuxkH8/VJToJKgx/OCS3tVk
 Fqj7SOfJ3lPQGZVSgJ5rsb5aETXMnxDO/iW4PhVbm7VX7z3JormkD+iFxQSZZd31b9sz
 RpZw==
X-Gm-Message-State: APjAAAUwpbsZAdqHsHZpNVYJssuDGnDN4NLc7gdkhggclNR508UiGaFl
 ZeWNQrkgGDM8IrGGxZZjwGnkwZBov8UjM0iTImAMuOs+9YRgPq8qxfZ+mx6A0HPvJnxEPT3arUr
 I9FHzmCG1LskoGowitrjQKlcGd3A=
X-Received: by 2002:adf:ec02:: with SMTP id x2mr9464207wrn.8.1582203976536;
 Thu, 20 Feb 2020 05:06:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqxxvhyunneK2qPGr0PvPMnzbnKoLc1KRvHi/EZUPnye+P/5CWZaGi4Yc+u50TlNAyrnI1YoAA==
X-Received: by 2002:adf:ec02:: with SMTP id x2mr9464128wrn.8.1582203975917;
 Thu, 20 Feb 2020 05:06:15 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:34 +0100
Message-Id: <20200220130548.29974-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: Sr4y9MXaMCytIX_rIUtg6Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 06/20] exec: Let the address_space API use
 void pointer arguments
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
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgd2UgYXJlIG9ubHkgZGVhbGluZyB3aXRoIGEgYmxvYiBidWZmZXIsIHVzZSBhIHZvaWQgcG9p
bnRlcgphcmd1bWVudC4gVGhpcyB3aWxsIGxldCB1cyBzaW1wbGlmeSBvdGhlciBBUElzLgoKU2ln
bmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgot
LS0KIGluY2x1ZGUvZXhlYy9tZW1vcnkuaCB8IDEyICsrKysrKy0tLS0tLQogZXhlYy5jICAgICAg
ICAgICAgICAgIHwgMTEgKysrKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVjL21lbW9yeS5o
IGIvaW5jbHVkZS9leGVjL21lbW9yeS5oCmluZGV4IDZmODA4NGY0NWUuLmFmZWUxODVlYWUgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvZXhlYy9tZW1vcnkuaAorKysgYi9pbmNsdWRlL2V4ZWMvbWVtb3J5
LmgKQEAgLTIwNTIsNyArMjA1Miw3IEBAIHZvaWQgYWRkcmVzc19zcGFjZV9yZW1vdmVfbGlzdGVu
ZXJzKEFkZHJlc3NTcGFjZSAqYXMpOwogICogQGlzX3dyaXRlOiBpbmRpY2F0ZXMgdGhlIHRyYW5z
ZmVyIGRpcmVjdGlvbgogICovCiBNZW1UeFJlc3VsdCBhZGRyZXNzX3NwYWNlX3J3KEFkZHJlc3NT
cGFjZSAqYXMsIGh3YWRkciBhZGRyLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNZW1U
eEF0dHJzIGF0dHJzLCB1aW50OF90ICpidWYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE1lbVR4QXR0cnMgYXR0cnMsIHZvaWQgKmJ1ZiwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaHdhZGRyIGxlbiwgYm9vbCBpc193cml0ZSk7CiAKIC8qKgpAQCAtMjA3MCw3ICsyMDcwLDcg
QEAgTWVtVHhSZXN1bHQgYWRkcmVzc19zcGFjZV9ydyhBZGRyZXNzU3BhY2UgKmFzLCBod2FkZHIg
YWRkciwKICAqLwogTWVtVHhSZXN1bHQgYWRkcmVzc19zcGFjZV93cml0ZShBZGRyZXNzU3BhY2Ug
KmFzLCBod2FkZHIgYWRkciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTWVtVHhB
dHRycyBhdHRycywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDhf
dCAqYnVmLCBod2FkZHIgbGVuKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgdm9pZCAqYnVmLCBod2FkZHIgbGVuKTsKIAogLyoqCiAgKiBhZGRyZXNzX3NwYWNlX3dyaXRl
X3JvbTogd3JpdGUgdG8gYWRkcmVzcyBzcGFjZSwgaW5jbHVkaW5nIFJPTS4KQEAgLTIwOTYsNyAr
MjA5Niw3IEBAIE1lbVR4UmVzdWx0IGFkZHJlc3Nfc3BhY2Vfd3JpdGUoQWRkcmVzc1NwYWNlICph
cywgaHdhZGRyIGFkZHIsCiAgKi8KIE1lbVR4UmVzdWx0IGFkZHJlc3Nfc3BhY2Vfd3JpdGVfcm9t
KEFkZHJlc3NTcGFjZSAqYXMsIGh3YWRkciBhZGRyLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTWVtVHhBdHRycyBhdHRycywKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwgaHdhZGRyIGxlbik7CisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB2b2lkICpidWYsIGh3YWRkciBsZW4pOwogCiAv
KiBhZGRyZXNzX3NwYWNlX2xkKjogbG9hZCBmcm9tIGFuIGFkZHJlc3Mgc3BhY2UKICAqIGFkZHJl
c3Nfc3BhY2Vfc3QqOiBzdG9yZSB0byBhbiBhZGRyZXNzIHNwYWNlCkBAIC0yMzM0LDcgKzIzMzQs
NyBAQCB2b2lkIGFkZHJlc3Nfc3BhY2VfdW5tYXAoQWRkcmVzc1NwYWNlICphcywgdm9pZCAqYnVm
ZmVyLCBod2FkZHIgbGVuLAogCiAvKiBJbnRlcm5hbCBmdW5jdGlvbnMsIHBhcnQgb2YgdGhlIGlt
cGxlbWVudGF0aW9uIG9mIGFkZHJlc3Nfc3BhY2VfcmVhZC4gICovCiBNZW1UeFJlc3VsdCBhZGRy
ZXNzX3NwYWNlX3JlYWRfZnVsbChBZGRyZXNzU3BhY2UgKmFzLCBod2FkZHIgYWRkciwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1lbVR4QXR0cnMgYXR0cnMsIHVpbnQ4X3Qg
KmJ1ZiwgaHdhZGRyIGxlbik7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBN
ZW1UeEF0dHJzIGF0dHJzLCB2b2lkICpidWYsIGh3YWRkciBsZW4pOwogTWVtVHhSZXN1bHQgZmxh
dHZpZXdfcmVhZF9jb250aW51ZShGbGF0VmlldyAqZnYsIGh3YWRkciBhZGRyLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBNZW1UeEF0dHJzIGF0dHJzLCB2b2lkICpidWYsCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh3YWRkciBsZW4sIGh3YWRkciBhZGRy
MSwgaHdhZGRyIGwsCkBAIC0yMzc0LDcgKzIzNzQsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgbWVt
b3J5X2FjY2Vzc19pc19kaXJlY3QoTWVtb3J5UmVnaW9uICptciwgYm9vbCBpc193cml0ZSkKICAq
Lwogc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChfX2Fsd2F5c19pbmxpbmVfXykpCiBNZW1U
eFJlc3VsdCBhZGRyZXNzX3NwYWNlX3JlYWQoQWRkcmVzc1NwYWNlICphcywgaHdhZGRyIGFkZHIs
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTWVtVHhBdHRycyBhdHRycywgdWludDhf
dCAqYnVmLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1lbVR4QXR0cnMgYXR0cnMs
IHZvaWQgKmJ1ZiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBod2FkZHIgbGVuKQog
ewogICAgIE1lbVR4UmVzdWx0IHJlc3VsdCA9IE1FTVRYX09LOwpAQCAtMjQzMyw3ICsyNDMzLDcg
QEAgYWRkcmVzc19zcGFjZV9yZWFkX2NhY2hlZChNZW1vcnlSZWdpb25DYWNoZSAqY2FjaGUsIGh3
YWRkciBhZGRyLAogICovCiBzdGF0aWMgaW5saW5lIHZvaWQKIGFkZHJlc3Nfc3BhY2Vfd3JpdGVf
Y2FjaGVkKE1lbW9yeVJlZ2lvbkNhY2hlICpjYWNoZSwgaHdhZGRyIGFkZHIsCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICB2b2lkICpidWYsIGh3YWRkciBsZW4pCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCB2b2lkICpidWYsIGh3YWRkciBsZW4pCiB7CiAgICAgYXNzZXJ0KGFk
ZHIgPCBjYWNoZS0+bGVuICYmIGxlbiA8PSBjYWNoZS0+bGVuIC0gYWRkcik7CiAgICAgaWYgKGxp
a2VseShjYWNoZS0+cHRyKSkgewpkaWZmIC0tZ2l0IGEvZXhlYy5jIGIvZXhlYy5jCmluZGV4IDk4
MGNjMGUyYjIuLjFhODAxNTk5OTYgMTAwNjQ0Ci0tLSBhL2V4ZWMuYworKysgYi9leGVjLmMKQEAg
LTMyNzEsNyArMzI3MSw3IEBAIHN0YXRpYyBNZW1UeFJlc3VsdCBmbGF0dmlld19yZWFkKEZsYXRW
aWV3ICpmdiwgaHdhZGRyIGFkZHIsCiB9CiAKIE1lbVR4UmVzdWx0IGFkZHJlc3Nfc3BhY2VfcmVh
ZF9mdWxsKEFkZHJlc3NTcGFjZSAqYXMsIGh3YWRkciBhZGRyLAotICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTWVtVHhBdHRycyBhdHRycywgdWludDhfdCAqYnVmLCBod2FkZHIg
bGVuKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTWVtVHhBdHRycyBhdHRy
cywgdm9pZCAqYnVmLCBod2FkZHIgbGVuKQogewogICAgIE1lbVR4UmVzdWx0IHJlc3VsdCA9IE1F
TVRYX09LOwogICAgIEZsYXRWaWV3ICpmdjsKQEAgLTMyODcsNyArMzI4Nyw3IEBAIE1lbVR4UmVz
dWx0IGFkZHJlc3Nfc3BhY2VfcmVhZF9mdWxsKEFkZHJlc3NTcGFjZSAqYXMsIGh3YWRkciBhZGRy
LAogCiBNZW1UeFJlc3VsdCBhZGRyZXNzX3NwYWNlX3dyaXRlKEFkZHJlc3NTcGFjZSAqYXMsIGh3
YWRkciBhZGRyLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNZW1UeEF0dHJzIGF0
dHJzLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1aW50OF90ICpidWYs
IGh3YWRkciBsZW4pCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHZvaWQg
KmJ1ZiwgaHdhZGRyIGxlbikKIHsKICAgICBNZW1UeFJlc3VsdCByZXN1bHQgPSBNRU1UWF9PSzsK
ICAgICBGbGF0VmlldyAqZnY7CkBAIC0zMzAyLDcgKzMzMDIsNyBAQCBNZW1UeFJlc3VsdCBhZGRy
ZXNzX3NwYWNlX3dyaXRlKEFkZHJlc3NTcGFjZSAqYXMsIGh3YWRkciBhZGRyLAogfQogCiBNZW1U
eFJlc3VsdCBhZGRyZXNzX3NwYWNlX3J3KEFkZHJlc3NTcGFjZSAqYXMsIGh3YWRkciBhZGRyLCBN
ZW1UeEF0dHJzIGF0dHJzLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90ICpi
dWYsIGh3YWRkciBsZW4sIGJvb2wgaXNfd3JpdGUpCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZvaWQgKmJ1ZiwgaHdhZGRyIGxlbiwgYm9vbCBpc193cml0ZSkKIHsKICAgICBpZiAoaXNf
d3JpdGUpIHsKICAgICAgICAgcmV0dXJuIGFkZHJlc3Nfc3BhY2Vfd3JpdGUoYXMsIGFkZHIsIGF0
dHJzLCBidWYsIGxlbik7CkBAIC0zMzI2LDcgKzMzMjYsNyBAQCBlbnVtIHdyaXRlX3JvbV90eXBl
IHsKIHN0YXRpYyBpbmxpbmUgTWVtVHhSZXN1bHQgYWRkcmVzc19zcGFjZV93cml0ZV9yb21faW50
ZXJuYWwoQWRkcmVzc1NwYWNlICphcywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaHdhZGRyIGFkZHIsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1lbVR4QXR0cnMgYXR0
cnMsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgdm9pZCAqcHRyLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBod2FkZHIg
bGVuLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBlbnVtIHdyaXRlX3JvbV90eXBlIHR5cGUpCiB7CkBAIC0zMzM0LDYgKzMzMzQsNyBA
QCBzdGF0aWMgaW5saW5lIE1lbVR4UmVzdWx0IGFkZHJlc3Nfc3BhY2Vfd3JpdGVfcm9tX2ludGVy
bmFsKEFkZHJlc3NTcGFjZSAqYXMsCiAgICAgdWludDhfdCAqcmFtX3B0cjsKICAgICBod2FkZHIg
YWRkcjE7CiAgICAgTWVtb3J5UmVnaW9uICptcjsKKyAgICBjb25zdCB1aW50OF90ICpidWYgPSBw
dHI7CiAKICAgICBSQ1VfUkVBRF9MT0NLX0dVQVJEKCk7CiAgICAgd2hpbGUgKGxlbiA+IDApIHsK
QEAgLTMzNjYsNyArMzM2Nyw3IEBAIHN0YXRpYyBpbmxpbmUgTWVtVHhSZXN1bHQgYWRkcmVzc19z
cGFjZV93cml0ZV9yb21faW50ZXJuYWwoQWRkcmVzc1NwYWNlICphcywKIC8qIHVzZWQgZm9yIFJP
TSBsb2FkaW5nIDogY2FuIHdyaXRlIGluIFJBTSBhbmQgUk9NICovCiBNZW1UeFJlc3VsdCBhZGRy
ZXNzX3NwYWNlX3dyaXRlX3JvbShBZGRyZXNzU3BhY2UgKmFzLCBod2FkZHIgYWRkciwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1lbVR4QXR0cnMgYXR0cnMsCi0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1aW50OF90ICpidWYsIGh3YWRkciBs
ZW4pCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB2b2lkICpidWYs
IGh3YWRkciBsZW4pCiB7CiAgICAgcmV0dXJuIGFkZHJlc3Nfc3BhY2Vfd3JpdGVfcm9tX2ludGVy
bmFsKGFzLCBhZGRyLCBhdHRycywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYnVmLCBsZW4sIFdSSVRFX0RBVEEpOwotLSAKMi4yMS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
