Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F00165E46
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:08:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lWt-00011L-1q; Thu, 20 Feb 2020 13:06:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lWs-00010q-6y
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:10 +0000
X-Inumbo-ID: c29d4552-53e1-11ea-b0fd-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c29d4552-53e1-11ea-b0fd-bc764e2007e4;
 Thu, 20 Feb 2020 13:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582203968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FX3FXQX3OgJ73Ij27vj7Z7zPMOBdko14sr77VldpMU0=;
 b=dB3aYcX+HHVZYTfEAkajM9JqlWq0mr4IQgD5jiLZWBtr+2u3jdd/ipu/ozaBLsHqzvOrns
 EXdraVh1Nomg52ebsCs5eKlFpWRoUcwx2w2ZhF2aAq3E16t2HL5WLuvdjLzzdX9ZwD6ww+
 o9piFQsqYj9mGMkVGXI02QE5hwSzZyM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-7yXeH7kMOjKik46Yn4-LgA-1; Thu, 20 Feb 2020 08:06:06 -0500
Received: by mail-wm1-f69.google.com with SMTP id t17so797552wmi.7
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8odk76d2z3izhK+yPuh+zYi/Cj4FHaZPMzDDqjJ0XeE=;
 b=gK2MOeHNX88KsVmgdp0bJwYNVMQs2yzHwdM8vKPgkHvzHkw3lOQS9iXtpNc+po7T8Q
 881uNDTJrxKI90MNbu7DlQidvyH7uLZjmeVVhJHdPOoUUqxesryXsXyhhx90XUmpfBy4
 cqUFWTAofkLTeLFdibCOhL9kl56UyIYQTo6rLgY4b6GEq69Lq42DTCpUwWBSqinwe7XN
 qfvme/cUY0RRee9sKQGzDqSMMdpgTaaNZkau7v/P2edZoeTc7A5Fzb82WYnh6RUOT5U8
 zmK3bC3Kd/xqlso2c/mdeDXg83dlDgWL2laUVyrg/91NwiSvZM/qgv4Yc/yxIL6DaL6G
 52QQ==
X-Gm-Message-State: APjAAAVCMg2Kmp8OknzyQCgkrHN+mz2cq2nUguNRY3TzfVsZb7QEOhs8
 sQavblx72jNGB6yjhaSXEzpRZjMu4hqBZZDC1vHj2lv8cDGsDYyrJHyoNrI1RXVPRaLN+OhiZ4Q
 1ZRh1rxM0OnOKvAZ8Pu3MhDdHFJk=
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr40459245wru.233.1582203965279; 
 Thu, 20 Feb 2020 05:06:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYyC0rm9Zmq8Udvt5K4WfGoUA6AsKImvpwZLE6azxpWra0StVD53WtA0C45GVywJSMzTwuwQ==
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr40459189wru.233.1582203964946; 
 Thu, 20 Feb 2020 05:06:04 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:31 +0100
Message-Id: <20200220130548.29974-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: 7yXeH7kMOjKik46Yn4-LgA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 03/20] exec: Let qemu_ram_*() functions take
 a const pointer argument
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

U2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29t
PgotLS0KIGluY2x1ZGUvZXhlYy9jcHUtY29tbW9uLmggICAgIHwgNiArKystLS0KIGluY2x1ZGUv
c3lzZW11L3hlbi1tYXBjYWNoZS5oIHwgNCArKy0tCiBleGVjLmMgICAgICAgICAgICAgICAgICAg
ICAgICB8IDggKysrKy0tLS0KIGh3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jICAgIHwgMiArLQog
NCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9pbmNsdWRlL2V4ZWMvY3B1LWNvbW1vbi5oIGIvaW5jbHVkZS9leGVjL2NwdS1jb21t
b24uaAppbmRleCA4MTc1M2JiYjM0Li4wNWFjMWE1ZDY5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2V4
ZWMvY3B1LWNvbW1vbi5oCisrKyBiL2luY2x1ZGUvZXhlYy9jcHUtY29tbW9uLmgKQEAgLTQ4LDEx
ICs0OCwxMSBAQCB0eXBlZGVmIHVpbnQzMl90IENQVVJlYWRNZW1vcnlGdW5jKHZvaWQgKm9wYXF1
ZSwgaHdhZGRyIGFkZHIpOwogCiB2b2lkIHFlbXVfcmFtX3JlbWFwKHJhbV9hZGRyX3QgYWRkciwg
cmFtX2FkZHJfdCBsZW5ndGgpOwogLyogVGhpcyBzaG91bGQgbm90IGJlIHVzZWQgYnkgZGV2aWNl
cy4gICovCi1yYW1fYWRkcl90IHFlbXVfcmFtX2FkZHJfZnJvbV9ob3N0KHZvaWQgKnB0cik7City
YW1fYWRkcl90IHFlbXVfcmFtX2FkZHJfZnJvbV9ob3N0KGNvbnN0IHZvaWQgKnB0cik7CiBSQU1C
bG9jayAqcWVtdV9yYW1fYmxvY2tfYnlfbmFtZShjb25zdCBjaGFyICpuYW1lKTsKLVJBTUJsb2Nr
ICpxZW11X3JhbV9ibG9ja19mcm9tX2hvc3Qodm9pZCAqcHRyLCBib29sIHJvdW5kX29mZnNldCwK
K1JBTUJsb2NrICpxZW11X3JhbV9ibG9ja19mcm9tX2hvc3QoY29uc3Qgdm9pZCAqcHRyLCBib29s
IHJvdW5kX29mZnNldCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmFtX2Fk
ZHJfdCAqb2Zmc2V0KTsKLXJhbV9hZGRyX3QgcWVtdV9yYW1fYmxvY2tfaG9zdF9vZmZzZXQoUkFN
QmxvY2sgKnJiLCB2b2lkICpob3N0KTsKK3JhbV9hZGRyX3QgcWVtdV9yYW1fYmxvY2tfaG9zdF9v
ZmZzZXQoUkFNQmxvY2sgKnJiLCBjb25zdCB2b2lkICpob3N0KTsKIHZvaWQgcWVtdV9yYW1fc2V0
X2lkc3RyKFJBTUJsb2NrICpibG9jaywgY29uc3QgY2hhciAqbmFtZSwgRGV2aWNlU3RhdGUgKmRl
dik7CiB2b2lkIHFlbXVfcmFtX3Vuc2V0X2lkc3RyKFJBTUJsb2NrICpibG9jayk7CiBjb25zdCBj
aGFyICpxZW11X3JhbV9nZXRfaWRzdHIoUkFNQmxvY2sgKnJiKTsKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvc3lzZW11L3hlbi1tYXBjYWNoZS5oIGIvaW5jbHVkZS9zeXNlbXUveGVuLW1hcGNhY2hlLmgK
aW5kZXggYzhlN2MyZjZjZi4uODFlOWFhMmZhNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9zeXNlbXUv
eGVuLW1hcGNhY2hlLmgKKysrIGIvaW5jbHVkZS9zeXNlbXUveGVuLW1hcGNhY2hlLmgKQEAgLTE5
LDcgKzE5LDcgQEAgdm9pZCB4ZW5fbWFwX2NhY2hlX2luaXQocGh5c19vZmZzZXRfdG9fZ2FkZHJf
dCBmLAogICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqb3BhcXVlKTsKIHVpbnQ4X3QgKnhl
bl9tYXBfY2FjaGUoaHdhZGRyIHBoeXNfYWRkciwgaHdhZGRyIHNpemUsCiAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQ4X3QgbG9jaywgYm9vbCBkbWEpOwotcmFtX2FkZHJfdCB4ZW5fcmFtX2Fk
ZHJfZnJvbV9tYXBjYWNoZSh2b2lkICpwdHIpOworcmFtX2FkZHJfdCB4ZW5fcmFtX2FkZHJfZnJv
bV9tYXBjYWNoZShjb25zdCB2b2lkICpwdHIpOwogdm9pZCB4ZW5faW52YWxpZGF0ZV9tYXBfY2Fj
aGVfZW50cnkodWludDhfdCAqYnVmZmVyKTsKIHZvaWQgeGVuX2ludmFsaWRhdGVfbWFwX2NhY2hl
KHZvaWQpOwogdWludDhfdCAqeGVuX3JlcGxhY2VfY2FjaGVfZW50cnkoaHdhZGRyIG9sZF9waHlz
X2FkZHIsCkBAIC00MCw3ICs0MCw3IEBAIHN0YXRpYyBpbmxpbmUgdWludDhfdCAqeGVuX21hcF9j
YWNoZShod2FkZHIgcGh5c19hZGRyLAogICAgIGFib3J0KCk7CiB9CiAKLXN0YXRpYyBpbmxpbmUg
cmFtX2FkZHJfdCB4ZW5fcmFtX2FkZHJfZnJvbV9tYXBjYWNoZSh2b2lkICpwdHIpCitzdGF0aWMg
aW5saW5lIHJhbV9hZGRyX3QgeGVuX3JhbV9hZGRyX2Zyb21fbWFwY2FjaGUoY29uc3Qgdm9pZCAq
cHRyKQogewogICAgIGFib3J0KCk7CiB9CmRpZmYgLS1naXQgYS9leGVjLmMgYi9leGVjLmMKaW5k
ZXggOGU5Y2MzYjQ3Yy4uMDJiNGU2ZWE0MSAxMDA2NDQKLS0tIGEvZXhlYy5jCisrKyBiL2V4ZWMu
YwpAQCAtMjYxNCw3ICsyNjE0LDcgQEAgc3RhdGljIHZvaWQgKnFlbXVfcmFtX3B0cl9sZW5ndGgo
UkFNQmxvY2sgKnJhbV9ibG9jaywgcmFtX2FkZHJfdCBhZGRyLAogfQogCiAvKiBSZXR1cm4gdGhl
IG9mZnNldCBvZiBhIGhvc3Rwb2ludGVyIHdpdGhpbiBhIHJhbWJsb2NrICovCi1yYW1fYWRkcl90
IHFlbXVfcmFtX2Jsb2NrX2hvc3Rfb2Zmc2V0KFJBTUJsb2NrICpyYiwgdm9pZCAqaG9zdCkKK3Jh
bV9hZGRyX3QgcWVtdV9yYW1fYmxvY2tfaG9zdF9vZmZzZXQoUkFNQmxvY2sgKnJiLCBjb25zdCB2
b2lkICpob3N0KQogewogICAgIHJhbV9hZGRyX3QgcmVzID0gKHVpbnQ4X3QgKilob3N0IC0gKHVp
bnQ4X3QgKilyYi0+aG9zdDsKICAgICBhc3NlcnQoKHVpbnRwdHJfdClob3N0ID49ICh1aW50cHRy
X3QpcmItPmhvc3QpOwpAQCAtMjY0MCwxMSArMjY0MCwxMSBAQCByYW1fYWRkcl90IHFlbXVfcmFt
X2Jsb2NrX2hvc3Rfb2Zmc2V0KFJBTUJsb2NrICpyYiwgdm9pZCAqaG9zdCkKICAqIHBvaW50ZXIs
IHN1Y2ggYXMgYSByZWZlcmVuY2UgdG8gdGhlIHJlZ2lvbiB0aGF0IGluY2x1ZGVzIHRoZSBpbmNv
bWluZwogICogcmFtX2FkZHJfdC4KICAqLwotUkFNQmxvY2sgKnFlbXVfcmFtX2Jsb2NrX2Zyb21f
aG9zdCh2b2lkICpwdHIsIGJvb2wgcm91bmRfb2Zmc2V0LAorUkFNQmxvY2sgKnFlbXVfcmFtX2Js
b2NrX2Zyb21faG9zdChjb25zdCB2b2lkICpwdHIsIGJvb2wgcm91bmRfb2Zmc2V0LAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByYW1fYWRkcl90ICpvZmZzZXQpCiB7CiAgICAg
UkFNQmxvY2sgKmJsb2NrOwotICAgIHVpbnQ4X3QgKmhvc3QgPSBwdHI7CisgICAgY29uc3QgdWlu
dDhfdCAqaG9zdCA9IHB0cjsKIAogICAgIGlmICh4ZW5fZW5hYmxlZCgpKSB7CiAgICAgICAgIHJh
bV9hZGRyX3QgcmFtX2FkZHI7CkBAIC0yNzA1LDcgKzI3MDUsNyBAQCBSQU1CbG9jayAqcWVtdV9y
YW1fYmxvY2tfYnlfbmFtZShjb25zdCBjaGFyICpuYW1lKQogCiAvKiBTb21lIG9mIHRoZSBzb2Z0
bW11IHJvdXRpbmVzIG5lZWQgdG8gdHJhbnNsYXRlIGZyb20gYSBob3N0IHBvaW50ZXIKICAgICh0
eXBpY2FsbHkgYSBUTEIgZW50cnkpIGJhY2sgdG8gYSByYW0gb2Zmc2V0LiAgKi8KLXJhbV9hZGRy
X3QgcWVtdV9yYW1fYWRkcl9mcm9tX2hvc3Qodm9pZCAqcHRyKQorcmFtX2FkZHJfdCBxZW11X3Jh
bV9hZGRyX2Zyb21faG9zdChjb25zdCB2b2lkICpwdHIpCiB7CiAgICAgUkFNQmxvY2sgKmJsb2Nr
OwogICAgIHJhbV9hZGRyX3Qgb2Zmc2V0OwpkaWZmIC0tZ2l0IGEvaHcvaTM4Ni94ZW4veGVuLW1h
cGNhY2hlLmMgYi9ody9pMzg2L3hlbi94ZW4tbWFwY2FjaGUuYwppbmRleCA1YjEyMGVkNDRiLi40
MzJhZDMzNTRkIDEwMDY0NAotLS0gYS9ody9pMzg2L3hlbi94ZW4tbWFwY2FjaGUuYworKysgYi9o
dy9pMzg2L3hlbi94ZW4tbWFwY2FjaGUuYwpAQCAtMzYzLDcgKzM2Myw3IEBAIHVpbnQ4X3QgKnhl
bl9tYXBfY2FjaGUoaHdhZGRyIHBoeXNfYWRkciwgaHdhZGRyIHNpemUsCiAgICAgcmV0dXJuIHA7
CiB9CiAKLXJhbV9hZGRyX3QgeGVuX3JhbV9hZGRyX2Zyb21fbWFwY2FjaGUodm9pZCAqcHRyKQor
cmFtX2FkZHJfdCB4ZW5fcmFtX2FkZHJfZnJvbV9tYXBjYWNoZShjb25zdCB2b2lkICpwdHIpCiB7
CiAgICAgTWFwQ2FjaGVFbnRyeSAqZW50cnkgPSBOVUxMOwogICAgIE1hcENhY2hlUmV2ICpyZXZl
bnRyeTsKLS0gCjIuMjEuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
