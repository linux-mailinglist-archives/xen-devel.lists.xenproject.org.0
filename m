Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61909165E43
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:08:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lX6-00019K-KY; Thu, 20 Feb 2020 13:06:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lX4-000183-SM
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:22 +0000
X-Inumbo-ID: c830801b-53e1-11ea-8526-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c830801b-53e1-11ea-8526-12813bfff9fa;
 Thu, 20 Feb 2020 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582203977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kamW98p66sN+eur3Q7AqsRMR1uwJ8MHCAydSaAKz21s=;
 b=bk/Y81T4AQBPqTsAQHKoLWAPqz4JFVkPG4X2DY0vOVHlXZV8y0NfdrVktKGAhT5QGDahAB
 9Nhjz4otfWDoTY6nFdieSM/ZSwMeP/88y4LZqpjOP6RLKpCrd5JAbFZhKAjULhbqZa1CdP
 lg2qhjTWrSmTmi7rP3NxxoCkaZuHeJI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-zALtjJ_kPp-gdXBim9n0Pw-1; Thu, 20 Feb 2020 08:06:13 -0500
X-MC-Unique: zALtjJ_kPp-gdXBim9n0Pw-1
Received: by mail-wm1-f71.google.com with SMTP id z7so583497wmi.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HHWlfXnpQqqcljyzd6YNAX2WRGDbItCch3DvOI+vpOQ=;
 b=KddFX+5NhXq0aWStL55TG2BvE3Hiuifk4mFwVOQoiKEdP3eCm3g6jGVvMV+6crKdiM
 2/mIMgbq/trihlxEGlUpZy9ZycqNtgPvx1ZhKjaPNw9ZgEVtuUb39CZ8o/bakSLXAUrG
 K+L4V6tKomqSbLR+eVdPeL62wKWKjhpDIYI6JeKpPHvKV8KakIs5yYORghSnkLOvY7p4
 Vm7zQNNR1QkyWP+nYmAJyyO0Rbtl2xr5uDMvYMxQ+xY3UrhFr9HVZjvts+skJls6/I0x
 zNRdBYY0xO9wUXCmuh/YHuQrKOGRHzY42pWJhKxT8zUfUR0Q83cS2b9OeTqV9HEdMU9c
 Wtxg==
X-Gm-Message-State: APjAAAXVIPWdjamlRlgZcKP5rYz+f9iDTpgbliRzmqbUtCwl2uEoOk9T
 dpViUrUzGcAlbgokySz0uNYP/5SyD+Rdd9GA6k3vqZAu+49qRWk54eYGB6ftmFISAu2fRuup9kP
 69pj9haJV+oklBBrL/qTyrtONifI=
X-Received: by 2002:adf:e781:: with SMTP id n1mr45107528wrm.56.1582203972574; 
 Thu, 20 Feb 2020 05:06:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqxKBcX8rH6rx55ITZPEmcOIUOejSB/5dplr56Z6ALR3ecPn0w2hMCkhVWEBs3126xsvrTMCAw==
X-Received: by 2002:adf:e781:: with SMTP id n1mr45107502wrm.56.1582203972354; 
 Thu, 20 Feb 2020 05:06:12 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:33 +0100
Message-Id: <20200220130548.29974-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 05/20] exec: Let flatview API take void
 pointer arguments
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

T25seSBmbGF0dmlld19bcmVhZC93cml0ZV1fY29udGludWUgdXNlIGEgYnl0ZSBwb2ludGVyIHRv
IGluY3JlbWVudAphbiBvZmZzZXQuIEZvciB0aGUgdXNlcnMsIHdlIGFyZSBvbmx5IGRlYWxpbmcg
d2l0aCBhIGJsb2IgYnVmZmVyLgpVc2UgYSB2b2lkIHBvaW50ZXIgYXJndW1lbnQuIFRoaXMgd2ls
bCBsZXQgdXMgc2ltcGxpZnkgdGhlCmFkZHJlc3Nfc3BhY2UgQVBJIGluIHRoZSBuZXh0IGNvbW1p
dC4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0
LmNvbT4KLS0tCiBpbmNsdWRlL2V4ZWMvbWVtb3J5LmggfCAgMiArLQogZXhlYy5jICAgICAgICAg
ICAgICAgIHwgMTQgKysrKysrKystLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9tZW1vcnkuaCBi
L2luY2x1ZGUvZXhlYy9tZW1vcnkuaAppbmRleCBlODViN2RlOTlhLi42ZjgwODRmNDVlIDEwMDY0
NAotLS0gYS9pbmNsdWRlL2V4ZWMvbWVtb3J5LmgKKysrIGIvaW5jbHVkZS9leGVjL21lbW9yeS5o
CkBAIC0yMzM2LDcgKzIzMzYsNyBAQCB2b2lkIGFkZHJlc3Nfc3BhY2VfdW5tYXAoQWRkcmVzc1Nw
YWNlICphcywgdm9pZCAqYnVmZmVyLCBod2FkZHIgbGVuLAogTWVtVHhSZXN1bHQgYWRkcmVzc19z
cGFjZV9yZWFkX2Z1bGwoQWRkcmVzc1NwYWNlICphcywgaHdhZGRyIGFkZHIsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBNZW1UeEF0dHJzIGF0dHJzLCB1aW50OF90ICpidWYs
IGh3YWRkciBsZW4pOwogTWVtVHhSZXN1bHQgZmxhdHZpZXdfcmVhZF9jb250aW51ZShGbGF0Vmll
dyAqZnYsIGh3YWRkciBhZGRyLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBN
ZW1UeEF0dHJzIGF0dHJzLCB1aW50OF90ICpidWYsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE1lbVR4QXR0cnMgYXR0cnMsIHZvaWQgKmJ1ZiwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaHdhZGRyIGxlbiwgaHdhZGRyIGFkZHIxLCBod2FkZHIgbCwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTWVtb3J5UmVnaW9uICptcik7CiB2b2lk
ICpxZW11X21hcF9yYW1fcHRyKFJBTUJsb2NrICpyYW1fYmxvY2ssIHJhbV9hZGRyX3QgYWRkcik7
CmRpZmYgLS1naXQgYS9leGVjLmMgYi9leGVjLmMKaW5kZXggMDZlMzg2ZGM3Mi4uOTgwY2MwZTJi
MiAxMDA2NDQKLS0tIGEvZXhlYy5jCisrKyBiL2V4ZWMuYwpAQCAtMjc4MCw5ICsyNzgwLDkgQEAg
dm9pZCBjcHVfY2hlY2tfd2F0Y2hwb2ludChDUFVTdGF0ZSAqY3B1LCB2YWRkciBhZGRyLCB2YWRk
ciBsZW4sCiB9CiAKIHN0YXRpYyBNZW1UeFJlc3VsdCBmbGF0dmlld19yZWFkKEZsYXRWaWV3ICpm
diwgaHdhZGRyIGFkZHIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNZW1UeEF0
dHJzIGF0dHJzLCB1aW50OF90ICpidWYsIGh3YWRkciBsZW4pOworICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTWVtVHhBdHRycyBhdHRycywgdm9pZCAqYnVmLCBod2FkZHIgbGVuKTsK
IHN0YXRpYyBNZW1UeFJlc3VsdCBmbGF0dmlld193cml0ZShGbGF0VmlldyAqZnYsIGh3YWRkciBh
ZGRyLCBNZW1UeEF0dHJzIGF0dHJzLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IHVpbnQ4X3QgKmJ1ZiwgaHdhZGRyIGxlbik7CisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3Qgdm9pZCAqYnVmLCBod2FkZHIgbGVuKTsKIHN0YXRpYyBib29sIGZs
YXR2aWV3X2FjY2Vzc192YWxpZChGbGF0VmlldyAqZnYsIGh3YWRkciBhZGRyLCBod2FkZHIgbGVu
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaXNfd3JpdGUsIE1lbVR4
QXR0cnMgYXR0cnMpOwogCkBAIC0zMTQ3LDcgKzMxNDcsNyBAQCBzdGF0aWMgYm9vbCBwcmVwYXJl
X21taW9fYWNjZXNzKE1lbW9yeVJlZ2lvbiAqbXIpCiAvKiBDYWxsZWQgd2l0aGluIFJDVSBjcml0
aWNhbCBzZWN0aW9uLiAgKi8KIHN0YXRpYyBNZW1UeFJlc3VsdCBmbGF0dmlld193cml0ZV9jb250
aW51ZShGbGF0VmlldyAqZnYsIGh3YWRkciBhZGRyLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE1lbVR4QXR0cnMgYXR0cnMsCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDhfdCAqYnVmLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHZvaWQgKnB0ciwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBod2FkZHIgbGVuLCBod2FkZHIgYWRk
cjEsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHdhZGRyIGws
IE1lbW9yeVJlZ2lvbiAqbXIpCiB7CkBAIC0zMTU1LDYgKzMxNTUsNyBAQCBzdGF0aWMgTWVtVHhS
ZXN1bHQgZmxhdHZpZXdfd3JpdGVfY29udGludWUoRmxhdFZpZXcgKmZ2LCBod2FkZHIgYWRkciwK
ICAgICB1aW50NjRfdCB2YWw7CiAgICAgTWVtVHhSZXN1bHQgcmVzdWx0ID0gTUVNVFhfT0s7CiAg
ICAgYm9vbCByZWxlYXNlX2xvY2sgPSBmYWxzZTsKKyAgICBjb25zdCB1aW50OF90ICpidWYgPSBw
dHI7CiAKICAgICBmb3IgKDs7KSB7CiAgICAgICAgIGlmICghbWVtb3J5X2FjY2Vzc19pc19kaXJl
Y3QobXIsIHRydWUpKSB7CkBAIC0zMTk0LDcgKzMxOTUsNyBAQCBzdGF0aWMgTWVtVHhSZXN1bHQg
ZmxhdHZpZXdfd3JpdGVfY29udGludWUoRmxhdFZpZXcgKmZ2LCBod2FkZHIgYWRkciwKIAogLyog
Q2FsbGVkIGZyb20gUkNVIGNyaXRpY2FsIHNlY3Rpb24uICAqLwogc3RhdGljIE1lbVR4UmVzdWx0
IGZsYXR2aWV3X3dyaXRlKEZsYXRWaWV3ICpmdiwgaHdhZGRyIGFkZHIsIE1lbVR4QXR0cnMgYXR0
cnMsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDhfdCAqYnVm
LCBod2FkZHIgbGVuKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHZv
aWQgKmJ1ZiwgaHdhZGRyIGxlbikKIHsKICAgICBod2FkZHIgbDsKICAgICBod2FkZHIgYWRkcjE7
CkBAIC0zMjExLDcgKzMyMTIsNyBAQCBzdGF0aWMgTWVtVHhSZXN1bHQgZmxhdHZpZXdfd3JpdGUo
RmxhdFZpZXcgKmZ2LCBod2FkZHIgYWRkciwgTWVtVHhBdHRycyBhdHRycywKIAogLyogQ2FsbGVk
IHdpdGhpbiBSQ1UgY3JpdGljYWwgc2VjdGlvbi4gICovCiBNZW1UeFJlc3VsdCBmbGF0dmlld19y
ZWFkX2NvbnRpbnVlKEZsYXRWaWV3ICpmdiwgaHdhZGRyIGFkZHIsCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE1lbVR4QXR0cnMgYXR0cnMsIHVpbnQ4X3QgKmJ1ZiwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTWVtVHhBdHRycyBhdHRycywgdm9pZCAqcHRy
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBod2FkZHIgbGVuLCBod2FkZHIg
YWRkcjEsIGh3YWRkciBsLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNZW1v
cnlSZWdpb24gKm1yKQogewpAQCAtMzIxOSw2ICszMjIwLDcgQEAgTWVtVHhSZXN1bHQgZmxhdHZp
ZXdfcmVhZF9jb250aW51ZShGbGF0VmlldyAqZnYsIGh3YWRkciBhZGRyLAogICAgIHVpbnQ2NF90
IHZhbDsKICAgICBNZW1UeFJlc3VsdCByZXN1bHQgPSBNRU1UWF9PSzsKICAgICBib29sIHJlbGVh
c2VfbG9jayA9IGZhbHNlOworICAgIHVpbnQ4X3QgKmJ1ZiA9IHB0cjsKIAogICAgIGZvciAoOzsp
IHsKICAgICAgICAgaWYgKCFtZW1vcnlfYWNjZXNzX2lzX2RpcmVjdChtciwgZmFsc2UpKSB7CkBA
IC0zMjU2LDcgKzMyNTgsNyBAQCBNZW1UeFJlc3VsdCBmbGF0dmlld19yZWFkX2NvbnRpbnVlKEZs
YXRWaWV3ICpmdiwgaHdhZGRyIGFkZHIsCiAKIC8qIENhbGxlZCBmcm9tIFJDVSBjcml0aWNhbCBz
ZWN0aW9uLiAgKi8KIHN0YXRpYyBNZW1UeFJlc3VsdCBmbGF0dmlld19yZWFkKEZsYXRWaWV3ICpm
diwgaHdhZGRyIGFkZHIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNZW1UeEF0
dHJzIGF0dHJzLCB1aW50OF90ICpidWYsIGh3YWRkciBsZW4pCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBNZW1UeEF0dHJzIGF0dHJzLCB2b2lkICpidWYsIGh3YWRkciBsZW4pCiB7
CiAgICAgaHdhZGRyIGw7CiAgICAgaHdhZGRyIGFkZHIxOwotLSAKMi4yMS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
