Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F446165E51
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:09:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lWw-00012l-BG; Thu, 20 Feb 2020 13:06:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lWu-00012J-Rz
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:12 +0000
X-Inumbo-ID: c0595f39-53e1-11ea-8526-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c0595f39-53e1-11ea-8526-12813bfff9fa;
 Thu, 20 Feb 2020 13:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582203964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2dyL776lIMWtwu3QHoE9WDBeqqqUYswvxKzWPwHYPB4=;
 b=fxc8Ix2yXMGPFKj5KjtSgDAdUCw/3m+VZUng5610eXwCeRzNvov/pin0edM6+0tVHpiTfH
 p/a3KJfsD0c/chEfkJ08y23kD41y8/LleNW2lbfGtbQwFjNQ94rbpIq64ZjW5XcYYC6TXz
 akfgPla3Lh1VRhB+SxpCKiXZbUL3FOg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-vYZgtVnnOtyIUzdwFdrP5w-1; Thu, 20 Feb 2020 08:06:02 -0500
X-MC-Unique: vYZgtVnnOtyIUzdwFdrP5w-1
Received: by mail-wr1-f70.google.com with SMTP id a12so1702573wrn.19
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JJNOlxhz3YaDnBzT0LwFaaq/SOy/0tsQ/KrZZBdtHoE=;
 b=UEST+I5eptFkQcdqxO9QDZSEqmszz+Eemye416m1NPmoAzQfegr3CD/m8VuYvQuV2I
 ZRCysh3MUUzoPcq4pN5buvmGkDKLIAHj3uuf7rQ+jmmRlg1sjZPef9TgNOhWZDcX5RLR
 Z5y4f5wvQDklyy10U7pF3iZF0NXR9kN/LaBsFWNuRMPO12gtqA8hma2j+Tz8JeGB+x7i
 kGfOlM+m3xaYzYkQp6TpjGM95C+PNg4+F1/qoPCMZ+f/JSnCsx65B+levRh7CxqHZT5a
 yFTmqygQvxPQIN4LrooKL7Mu1kTx7rKjIHEmW8EbLI6I/B3TTWMjspJketBr1bA3oiCx
 c5+A==
X-Gm-Message-State: APjAAAXvFKsCPGEMfHHzRVRXfAtBV2tt/BUVFIIg0U9aHuurYmFWxgLN
 8yH34vSFUtEeR7vdIDHlNZsK49SHMj/knC+iFjTBiGOqG4PBG6LCmoo0hkhnGD4aaX5VSeWr3j3
 OW6zysEgFUViIka55O1PmjfcCYOM=
X-Received: by 2002:a7b:c1d0:: with SMTP id a16mr4485859wmj.175.1582203961579; 
 Thu, 20 Feb 2020 05:06:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqz8KNQ719hweoepCwU/16r5sB1wpPqBKHDZc0xAJklXBupLNm7eWc89eDGk1e864X9IS4bitQ==
X-Received: by 2002:a7b:c1d0:: with SMTP id a16mr4485824wmj.175.1582203961311; 
 Thu, 20 Feb 2020 05:06:01 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:30 +0100
Message-Id: <20200220130548.29974-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 02/20] hw: Remove unnecessary cast when
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

U2luY2UgaXRzIGludHJvZHVjdGlvbiBpbiBjb21taXQgZDg2YTc3ZjhhYmIsIGRtYV9tZW1vcnlf
cmVhZCgpCmFsd2F5cyBhY2NlcHRlZCB2b2lkIHBvaW50ZXIgYXJndW1lbnQuIFJlbW92ZSB0aGUg
dW5uZWNlc3NhcnkKY2FzdHMuCgpUaGlzIGNvbW1pdCB3YXMgcHJvZHVjZWQgd2l0aCB0aGUgaW5j
bHVkZWQgQ29jY2luZWxsZSBzY3JpcHQKc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3Qu
CgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5j
b20+Ci0tLQogc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3QuY29jY2kgfCAxNSArKysr
KysrKysrKysrKysKIGh3L2FybS9zbW11LWNvbW1vbi5jICAgICAgICAgICAgICAgICAgIHwgIDMg
Ky0tCiBody9hcm0vc21tdXYzLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKystLS0t
LS0KIGh3L3NkL3NkaGNpLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTUgKysrKystLS0t
LS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNv
Y2NpCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3QuY29jY2kg
Yi9zY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2NjaQpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi5hMDA1NGYwMDlkCi0tLSAvZGV2L251bGwKKysrIGIvc2Ny
aXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3QuY29jY2kKQEAgLTAsMCArMSwxNSBAQAorLy8g
VXNhZ2U6CisvLyAgc3BhdGNoIC0tc3AtZmlsZSBzY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19j
b25zdC5jb2NjaSAtLWRpciAuIC0taW4tcGxhY2UKKworLy8gUmVtb3ZlIHVzZWxlc3MgY2FzdAor
QEAKK2V4cHJlc3Npb24gRTEsIEUyLCBFMywgRTQ7Cit0eXBlIFQ7CitAQAorKAorLSBkbWFfbWVt
b3J5X3JlYWQoRTEsIEUyLCAoVCAqKUUzLCBFNCkKKysgZG1hX21lbW9yeV9yZWFkKEUxLCBFMiwg
RTMsIEU0KQorfAorLSBkbWFfbWVtb3J5X3dyaXRlKEUxLCBFMiwgKFQgKilFMywgRTQpCisrIGRt
YV9tZW1vcnlfd3JpdGUoRTEsIEUyLCBFMywgRTQpCispCmRpZmYgLS1naXQgYS9ody9hcm0vc21t
dS1jb21tb24uYyBiL2h3L2FybS9zbW11LWNvbW1vbi5jCmluZGV4IDIzZWIxMTcwNDEuLjBmMjU3
M2YwMDQgMTAwNjQ0Ci0tLSBhL2h3L2FybS9zbW11LWNvbW1vbi5jCisrKyBiL2h3L2FybS9zbW11
LWNvbW1vbi5jCkBAIC03NCw4ICs3NCw3IEBAIHN0YXRpYyBpbnQgZ2V0X3B0ZShkbWFfYWRkcl90
IGJhc2VhZGRyLCB1aW50MzJfdCBpbmRleCwgdWludDY0X3QgKnB0ZSwKICAgICBkbWFfYWRkcl90
IGFkZHIgPSBiYXNlYWRkciArIGluZGV4ICogc2l6ZW9mKCpwdGUpOwogCiAgICAgLyogVE9ETzog
Z3VhcmFudGVlIDY0LWJpdCBzaW5nbGUtY29weSBhdG9taWNpdHkgKi8KLSAgICByZXQgPSBkbWFf
bWVtb3J5X3JlYWQoJmFkZHJlc3Nfc3BhY2VfbWVtb3J5LCBhZGRyLAotICAgICAgICAgICAgICAg
ICAgICAgICAgICAodWludDhfdCAqKXB0ZSwgc2l6ZW9mKCpwdGUpKTsKKyAgICByZXQgPSBkbWFf
bWVtb3J5X3JlYWQoJmFkZHJlc3Nfc3BhY2VfbWVtb3J5LCBhZGRyLCBwdGUsIHNpemVvZigqcHRl
KSk7CiAKICAgICBpZiAocmV0ICE9IE1FTVRYX09LKSB7CiAgICAgICAgIGluZm8tPnR5cGUgPSBT
TU1VX1BUV19FUlJfV0FMS19FQUJUOwpkaWZmIC0tZ2l0IGEvaHcvYXJtL3NtbXV2My5jIGIvaHcv
YXJtL3NtbXV2My5jCmluZGV4IDhiNWYxNTdkYzcuLjU3YTc5ZGY1NWIgMTAwNjQ0Ci0tLSBhL2h3
L2FybS9zbW11djMuYworKysgYi9ody9hcm0vc21tdXYzLmMKQEAgLTI3OSw4ICsyNzksNyBAQCBz
dGF0aWMgaW50IHNtbXVfZ2V0X3N0ZShTTU1VdjNTdGF0ZSAqcywgZG1hX2FkZHJfdCBhZGRyLCBT
VEUgKmJ1ZiwKIAogICAgIHRyYWNlX3NtbXV2M19nZXRfc3RlKGFkZHIpOwogICAgIC8qIFRPRE86
IGd1YXJhbnRlZSA2NC1iaXQgc2luZ2xlLWNvcHkgYXRvbWljaXR5ICovCi0gICAgcmV0ID0gZG1h
X21lbW9yeV9yZWFkKCZhZGRyZXNzX3NwYWNlX21lbW9yeSwgYWRkciwKLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgKHZvaWQgKilidWYsIHNpemVvZigqYnVmKSk7CisgICAgcmV0ID0gZG1hX21l
bW9yeV9yZWFkKCZhZGRyZXNzX3NwYWNlX21lbW9yeSwgYWRkciwgYnVmLCBzaXplb2YoKmJ1Zikp
OwogICAgIGlmIChyZXQgIT0gTUVNVFhfT0spIHsKICAgICAgICAgcWVtdV9sb2dfbWFzayhMT0df
R1VFU1RfRVJST1IsCiAgICAgICAgICAgICAgICAgICAgICAgIkNhbm5vdCBmZXRjaCBwdGUgYXQg
YWRkcmVzcz0weCUiUFJJeDY0IlxuIiwgYWRkcik7CkBAIC0zMDEsOCArMzAwLDcgQEAgc3RhdGlj
IGludCBzbW11X2dldF9jZChTTU1VdjNTdGF0ZSAqcywgU1RFICpzdGUsIHVpbnQzMl90IHNzaWQs
CiAKICAgICB0cmFjZV9zbW11djNfZ2V0X2NkKGFkZHIpOwogICAgIC8qIFRPRE86IGd1YXJhbnRl
ZSA2NC1iaXQgc2luZ2xlLWNvcHkgYXRvbWljaXR5ICovCi0gICAgcmV0ID0gZG1hX21lbW9yeV9y
ZWFkKCZhZGRyZXNzX3NwYWNlX21lbW9yeSwgYWRkciwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICh2b2lkICopYnVmLCBzaXplb2YoKmJ1ZikpOworICAgIHJldCA9IGRtYV9tZW1vcnlfcmVh
ZCgmYWRkcmVzc19zcGFjZV9tZW1vcnksIGFkZHIsIGJ1Ziwgc2l6ZW9mKCpidWYpKTsKICAgICBp
ZiAocmV0ICE9IE1FTVRYX09LKSB7CiAgICAgICAgIHFlbXVfbG9nX21hc2soTE9HX0dVRVNUX0VS
Uk9SLAogICAgICAgICAgICAgICAgICAgICAgICJDYW5ub3QgZmV0Y2ggcHRlIGF0IGFkZHJlc3M9
MHglIlBSSXg2NCJcbiIsIGFkZHIpOwpAQCAtNDA2LDggKzQwNCw4IEBAIHN0YXRpYyBpbnQgc21t
dV9maW5kX3N0ZShTTU1VdjNTdGF0ZSAqcywgdWludDMyX3Qgc2lkLCBTVEUgKnN0ZSwKICAgICAg
ICAgbDJfc3RlX29mZnNldCA9IHNpZCAmICgoMSA8PCBzLT5zaWRfc3BsaXQpIC0gMSk7CiAgICAg
ICAgIGwxcHRyID0gKGRtYV9hZGRyX3QpKHN0cnRhYl9iYXNlICsgbDFfc3RlX29mZnNldCAqIHNp
emVvZihsMXN0ZCkpOwogICAgICAgICAvKiBUT0RPOiBndWFyYW50ZWUgNjQtYml0IHNpbmdsZS1j
b3B5IGF0b21pY2l0eSAqLwotICAgICAgICByZXQgPSBkbWFfbWVtb3J5X3JlYWQoJmFkZHJlc3Nf
c3BhY2VfbWVtb3J5LCBsMXB0ciwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1aW50
OF90ICopJmwxc3RkLCBzaXplb2YobDFzdGQpKTsKKyAgICAgICAgcmV0ID0gZG1hX21lbW9yeV9y
ZWFkKCZhZGRyZXNzX3NwYWNlX21lbW9yeSwgbDFwdHIsICZsMXN0ZCwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNpemVvZihsMXN0ZCkpOwogICAgICAgICBpZiAocmV0ICE9IE1FTVRY
X09LKSB7CiAgICAgICAgICAgICBxZW11X2xvZ19tYXNrKExPR19HVUVTVF9FUlJPUiwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIkNvdWxkIG5vdCByZWFkIEwxUFRSIGF0IDBYJSJQUkl4NjQi
XG4iLCBsMXB0cik7CmRpZmYgLS1naXQgYS9ody9zZC9zZGhjaS5jIGIvaHcvc2Qvc2RoY2kuYwpp
bmRleCA2OWRjM2U2YjkwLi5kNWFiZGFhZDQxIDEwMDY0NAotLS0gYS9ody9zZC9zZGhjaS5jCisr
KyBiL2h3L3NkL3NkaGNpLmMKQEAgLTcwMSw4ICs3MDEsNyBAQCBzdGF0aWMgdm9pZCBnZXRfYWRt
YV9kZXNjcmlwdGlvbihTREhDSVN0YXRlICpzLCBBRE1BRGVzY3IgKmRzY3IpCiAgICAgaHdhZGRy
IGVudHJ5X2FkZHIgPSAoaHdhZGRyKXMtPmFkbWFzeXNhZGRyOwogICAgIHN3aXRjaCAoU0RIQ19E
TUFfVFlQRShzLT5ob3N0Y3RsMSkpIHsKICAgICBjYXNlIFNESENfQ1RSTF9BRE1BMl8zMjoKLSAg
ICAgICAgZG1hX21lbW9yeV9yZWFkKHMtPmRtYV9hcywgZW50cnlfYWRkciwgKHVpbnQ4X3QgKikm
YWRtYTIsCi0gICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoYWRtYTIpKTsKKyAgICAgICAg
ZG1hX21lbW9yeV9yZWFkKHMtPmRtYV9hcywgZW50cnlfYWRkciwgJmFkbWEyLCBzaXplb2YoYWRt
YTIpKTsKICAgICAgICAgYWRtYTIgPSBsZTY0X3RvX2NwdShhZG1hMik7CiAgICAgICAgIC8qIFRo
ZSBzcGVjIGRvZXMgbm90IHNwZWNpZnkgZW5kaWFubmVzcyBvZiBkZXNjcmlwdG9yIHRhYmxlLgog
ICAgICAgICAgKiBXZSBjdXJyZW50bHkgYXNzdW1lIHRoYXQgaXQgaXMgTEUuCkBAIC03MTMsOCAr
NzEyLDcgQEAgc3RhdGljIHZvaWQgZ2V0X2FkbWFfZGVzY3JpcHRpb24oU0RIQ0lTdGF0ZSAqcywg
QURNQURlc2NyICpkc2NyKQogICAgICAgICBkc2NyLT5pbmNyID0gODsKICAgICAgICAgYnJlYWs7
CiAgICAgY2FzZSBTREhDX0NUUkxfQURNQTFfMzI6Ci0gICAgICAgIGRtYV9tZW1vcnlfcmVhZChz
LT5kbWFfYXMsIGVudHJ5X2FkZHIsICh1aW50OF90ICopJmFkbWExLAotICAgICAgICAgICAgICAg
ICAgICAgICAgc2l6ZW9mKGFkbWExKSk7CisgICAgICAgIGRtYV9tZW1vcnlfcmVhZChzLT5kbWFf
YXMsIGVudHJ5X2FkZHIsICZhZG1hMSwgc2l6ZW9mKGFkbWExKSk7CiAgICAgICAgIGFkbWExID0g
bGUzMl90b19jcHUoYWRtYTEpOwogICAgICAgICBkc2NyLT5hZGRyID0gKGh3YWRkcikoYWRtYTEg
JiAweEZGRkZGMDAwKTsKICAgICAgICAgZHNjci0+YXR0ciA9ICh1aW50OF90KWV4dHJhY3QzMihh
ZG1hMSwgMCwgNyk7CkBAIC03MjYsMTMgKzcyNCwxMCBAQCBzdGF0aWMgdm9pZCBnZXRfYWRtYV9k
ZXNjcmlwdGlvbihTREhDSVN0YXRlICpzLCBBRE1BRGVzY3IgKmRzY3IpCiAgICAgICAgIH0KICAg
ICAgICAgYnJlYWs7CiAgICAgY2FzZSBTREhDX0NUUkxfQURNQTJfNjQ6Ci0gICAgICAgIGRtYV9t
ZW1vcnlfcmVhZChzLT5kbWFfYXMsIGVudHJ5X2FkZHIsCi0gICAgICAgICAgICAgICAgICAgICAg
ICAodWludDhfdCAqKSgmZHNjci0+YXR0ciksIDEpOwotICAgICAgICBkbWFfbWVtb3J5X3JlYWQo
cy0+ZG1hX2FzLCBlbnRyeV9hZGRyICsgMiwKLSAgICAgICAgICAgICAgICAgICAgICAgICh1aW50
OF90ICopKCZkc2NyLT5sZW5ndGgpLCAyKTsKKyAgICAgICAgZG1hX21lbW9yeV9yZWFkKHMtPmRt
YV9hcywgZW50cnlfYWRkciwgKCZkc2NyLT5hdHRyKSwgMSk7CisgICAgICAgIGRtYV9tZW1vcnlf
cmVhZChzLT5kbWFfYXMsIGVudHJ5X2FkZHIgKyAyLCAoJmRzY3ItPmxlbmd0aCksIDIpOwogICAg
ICAgICBkc2NyLT5sZW5ndGggPSBsZTE2X3RvX2NwdShkc2NyLT5sZW5ndGgpOwotICAgICAgICBk
bWFfbWVtb3J5X3JlYWQocy0+ZG1hX2FzLCBlbnRyeV9hZGRyICsgNCwKLSAgICAgICAgICAgICAg
ICAgICAgICAgICh1aW50OF90ICopKCZkc2NyLT5hZGRyKSwgOCk7CisgICAgICAgIGRtYV9tZW1v
cnlfcmVhZChzLT5kbWFfYXMsIGVudHJ5X2FkZHIgKyA0LCAoJmRzY3ItPmFkZHIpLCA4KTsKICAg
ICAgICAgZHNjci0+YWRkciA9IGxlNjRfdG9fY3B1KGRzY3ItPmFkZHIpOwogICAgICAgICBkc2Ny
LT5hdHRyICY9ICh1aW50OF90KSB+MHhDMDsKICAgICAgICAgZHNjci0+aW5jciA9IDEyOwotLSAK
Mi4yMS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
