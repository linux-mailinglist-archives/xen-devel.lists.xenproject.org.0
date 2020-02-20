Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34608165E52
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:09:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lXQ-0001T1-JG; Thu, 20 Feb 2020 13:06:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lXO-0001RZ-Ta
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:42 +0000
X-Inumbo-ID: d6be2ca4-53e1-11ea-bc8e-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d6be2ca4-53e1-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582204002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QWKOueI8xj2IyxqHiN0HDA2FYFFiq+hf4rVm2QXvB4=;
 b=VvTkBGI9MFwt+yQNtKJ+kXhLb06Wmk5A+xl98vSTZkqz88z39Df9I+fIPXpJpxkxrv/Uqt
 dOY58/uHbJH3sLLcZ6htSd2zUwoKu3YlDdzMlaHFBNQDOZBwQ1keHQE8orTh/XSmqdDyKM
 mpSaUytEm+gmsO0JXd7bbyL4xLVBhW8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-x-FizCD8PyqLhXnHx2PpIA-1; Thu, 20 Feb 2020 08:06:40 -0500
X-MC-Unique: x-FizCD8PyqLhXnHx2PpIA-1
Received: by mail-wr1-f70.google.com with SMTP id p8so1714031wrw.5
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=afmBLGH/B/Ms0UWZ94UmoIT7hbpf9let5QJOgK6MO7U=;
 b=SMGsdSrrFXXvpy7QVdfCUpk4RGowSdVsajFzaFNeRGVH9m7/TtFbfnHoljhcO2Huao
 dtrblDC/HTbJ8n/zuZmGCutdDNPk/az94BK11JW4p56Yj77AGOuMu8caha9vdWzrWg3O
 vZ2WHwhDDhhnWr6qo6jM5/YJxYV1fKbS56fpcz9n4CKAELQZ2iCJxx3glRGGl2yM1ifN
 0h0DgFkldQbsNfQVLLJM859eeUNRJxO1kuo5eSb1QKovD+owYX5uybuuAf/mbUo4Hcfb
 tEMyqLkOiMxR7NuxbnF7sUvd8lkjQwDZNqk3GGSjx87HCPuypa2PSUZImE9eULgJIPD0
 JmOg==
X-Gm-Message-State: APjAAAXCs9gZpNha/4pB8lEncSei96a7cswJJnTD9Wxr2Abri/gUdPu3
 WT3I791mJ7ObFSzKYIaEEgdRVSQ2pVbIuQQ9QgC8DpON7xYEyZJf4qFEsva9J5qKGL6U8wNDOfR
 9yUemosA1QDY0e4f4UJKNXs6L304=
X-Received: by 2002:adf:82ce:: with SMTP id 72mr42311844wrc.14.1582203999001; 
 Thu, 20 Feb 2020 05:06:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/3uQMphtI1ikMZVT/CqYmBN8hXBmJPGI/dMUcHwpK44vfqMtR6BuBqN22Zj6SP9un5Qj48Q==
X-Received: by 2002:adf:82ce:: with SMTP id 72mr42311818wrc.14.1582203998804; 
 Thu, 20 Feb 2020 05:06:38 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:40 +0100
Message-Id: <20200220130548.29974-13-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 12/20] hw/ide: Let the DMAIntFunc prototype
 use a boolean 'is_write' argument
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

VGhlICdpc193cml0ZScgYXJndW1lbnQgaXMgZWl0aGVyIDAgb3IgMS4KQ29udmVydCBpdCB0byBh
IGJvb2xlYW4gdHlwZS4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxw
aGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2h3L2lkZS9pbnRlcm5hbC5oIHwgMiArLQog
aHcvZG1hL3JjNDAzMC5jICAgICAgICAgICB8IDYgKysrLS0tCiBody9pZGUvYWhjaS5jICAgICAg
ICAgICAgIHwgMiArLQogaHcvaWRlL2NvcmUuYyAgICAgICAgICAgICB8IDIgKy0KIGh3L2lkZS9t
YWNpby5jICAgICAgICAgICAgfCAyICstCiBody9pZGUvcGNpLmMgICAgICAgICAgICAgIHwgMiAr
LQogNiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9ody9pZGUvaW50ZXJuYWwuaCBiL2luY2x1ZGUvaHcvaWRlL2ludGVy
bmFsLmgKaW5kZXggY2U3NjZhYzQ4NS4uMWJjMWZjNzNlNSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9o
dy9pZGUvaW50ZXJuYWwuaAorKysgYi9pbmNsdWRlL2h3L2lkZS9pbnRlcm5hbC5oCkBAIC0zMjIs
NyArMzIyLDcgQEAgdHlwZWRlZiB2b2lkIEVuZFRyYW5zZmVyRnVuYyhJREVTdGF0ZSAqKTsKIAog
dHlwZWRlZiB2b2lkIERNQVN0YXJ0RnVuYyhJREVETUEgKiwgSURFU3RhdGUgKiwgQmxvY2tDb21w
bGV0aW9uRnVuYyAqKTsKIHR5cGVkZWYgdm9pZCBETUFWb2lkRnVuYyhJREVETUEgKik7Ci10eXBl
ZGVmIGludCBETUFJbnRGdW5jKElERURNQSAqLCBpbnQpOwordHlwZWRlZiBpbnQgRE1BSW50RnVu
YyhJREVETUEgKiwgYm9vbCk7CiB0eXBlZGVmIGludDMyX3QgRE1BSW50MzJGdW5jKElERURNQSAq
LCBpbnQzMl90IGxlbik7CiB0eXBlZGVmIHZvaWQgRE1BdTMyRnVuYyhJREVETUEgKiwgdWludDMy
X3QpOwogdHlwZWRlZiB2b2lkIERNQVN0b3BGdW5jKElERURNQSAqLCBib29sKTsKZGlmZiAtLWdp
dCBhL2h3L2RtYS9yYzQwMzAuYyBiL2h3L2RtYS9yYzQwMzAuYwppbmRleCBjYTBiZWNkNzU2Li4y
MWUyYzM2MGFjIDEwMDY0NAotLS0gYS9ody9kbWEvcmM0MDMwLmMKKysrIGIvaHcvZG1hL3JjNDAz
MC5jCkBAIC01OTAsNyArNTkwLDcgQEAgc3RhdGljIGNvbnN0IFZNU3RhdGVEZXNjcmlwdGlvbiB2
bXN0YXRlX3JjNDAzMCA9IHsKIH07CiAKIHN0YXRpYyB2b2lkIHJjNDAzMF9kb19kbWEodm9pZCAq
b3BhcXVlLCBpbnQgbiwgdWludDhfdCAqYnVmLAotICAgICAgICAgICAgICAgICAgICAgICAgICBp
bnQgbGVuLCBpbnQgaXNfd3JpdGUpCisgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBsZW4s
IGJvb2wgaXNfd3JpdGUpCiB7CiAgICAgcmM0MDMwU3RhdGUgKnMgPSBvcGFxdWU7CiAgICAgaHdh
ZGRyIGRtYV9hZGRyOwpAQCAtNjMwLDEzICs2MzAsMTMgQEAgc3RydWN0IHJjNDAzMERNQVN0YXRl
IHsKIHZvaWQgcmM0MDMwX2RtYV9yZWFkKHZvaWQgKmRtYSwgdWludDhfdCAqYnVmLCBpbnQgbGVu
KQogewogICAgIHJjNDAzMF9kbWEgcyA9IGRtYTsKLSAgICByYzQwMzBfZG9fZG1hKHMtPm9wYXF1
ZSwgcy0+biwgYnVmLCBsZW4sIDApOworICAgIHJjNDAzMF9kb19kbWEocy0+b3BhcXVlLCBzLT5u
LCBidWYsIGxlbiwgZmFsc2UpOwogfQogCiB2b2lkIHJjNDAzMF9kbWFfd3JpdGUodm9pZCAqZG1h
LCB1aW50OF90ICpidWYsIGludCBsZW4pCiB7CiAgICAgcmM0MDMwX2RtYSBzID0gZG1hOwotICAg
IHJjNDAzMF9kb19kbWEocy0+b3BhcXVlLCBzLT5uLCBidWYsIGxlbiwgMSk7CisgICAgcmM0MDMw
X2RvX2RtYShzLT5vcGFxdWUsIHMtPm4sIGJ1ZiwgbGVuLCB0cnVlKTsKIH0KIAogc3RhdGljIHJj
NDAzMF9kbWEgKnJjNDAzMF9hbGxvY2F0ZV9kbWFzKHZvaWQgKm9wYXF1ZSwgaW50IG4pCmRpZmYg
LS1naXQgYS9ody9pZGUvYWhjaS5jIGIvaHcvaWRlL2FoY2kuYwppbmRleCA2ODI2NGEyMmU4Li4x
M2Q5MWUxMDlhIDEwMDY0NAotLS0gYS9ody9pZGUvYWhjaS5jCisrKyBiL2h3L2lkZS9haGNpLmMK
QEAgLTE0NjEsNyArMTQ2MSw3IEBAIHN0YXRpYyB2b2lkIGFoY2lfY29tbWl0X2J1ZihJREVETUEg
KmRtYSwgdWludDMyX3QgdHhfYnl0ZXMpCiAgICAgYWQtPmN1cl9jbWQtPnN0YXR1cyA9IGNwdV90
b19sZTMyKHR4X2J5dGVzKTsKIH0KIAotc3RhdGljIGludCBhaGNpX2RtYV9yd19idWYoSURFRE1B
ICpkbWEsIGludCBpc193cml0ZSkKK3N0YXRpYyBpbnQgYWhjaV9kbWFfcndfYnVmKElERURNQSAq
ZG1hLCBib29sIGlzX3dyaXRlKQogewogICAgIEFIQ0lEZXZpY2UgKmFkID0gRE9fVVBDQVNUKEFI
Q0lEZXZpY2UsIGRtYSwgZG1hKTsKICAgICBJREVTdGF0ZSAqcyA9ICZhZC0+cG9ydC5pZnNbMF07
CmRpZmYgLS1naXQgYS9ody9pZGUvY29yZS5jIGIvaHcvaWRlL2NvcmUuYwppbmRleCA4MDAwMGVi
NzY2Li42ODliYjM2NDA5IDEwMDY0NAotLS0gYS9ody9pZGUvY29yZS5jCisrKyBiL2h3L2lkZS9j
b3JlLmMKQEAgLTI1NzAsNyArMjU3MCw3IEBAIHN0YXRpYyB2b2lkIGlkZV9pbml0MShJREVCdXMg
KmJ1cywgaW50IHVuaXQpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaWRlX3NlY3Rvcl93cml0ZV90aW1lcl9jYiwgcyk7CiB9CiAKLXN0YXRpYyBpbnQgaWRlX25v
cF9pbnQoSURFRE1BICpkbWEsIGludCB4KQorc3RhdGljIGludCBpZGVfbm9wX2ludChJREVETUEg
KmRtYSwgYm9vbCBpc193cml0ZSkKIHsKICAgICByZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL2h3
L2lkZS9tYWNpby5jIGIvaHcvaWRlL21hY2lvLmMKaW5kZXggN2E4NDcwZTkyMS4uYTlmMjVlNWQw
MiAxMDA2NDQKLS0tIGEvaHcvaWRlL21hY2lvLmMKKysrIGIvaHcvaWRlL21hY2lvLmMKQEAgLTM3
Niw3ICszNzYsNyBAQCBzdGF0aWMgdm9pZCBtYWNpb19pZGVfcmVzZXQoRGV2aWNlU3RhdGUgKmRl
dikKICAgICBpZGVfYnVzX3Jlc2V0KCZkLT5idXMpOwogfQogCi1zdGF0aWMgaW50IGlkZV9ub3Bf
aW50KElERURNQSAqZG1hLCBpbnQgeCkKK3N0YXRpYyBpbnQgaWRlX25vcF9pbnQoSURFRE1BICpk
bWEsIGJvb2wgaXNfd3JpdGUpCiB7CiAgICAgcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQgYS9ody9p
ZGUvcGNpLmMgYi9ody9pZGUvcGNpLmMKaW5kZXggY2NlMWRhODA0ZC4uMWE2YTI4N2U3NiAxMDA2
NDQKLS0tIGEvaHcvaWRlL3BjaS5jCisrKyBiL2h3L2lkZS9wY2kuYwpAQCAtMTgxLDcgKzE4MSw3
IEBAIHN0YXRpYyBpbnQzMl90IGJtZG1hX3ByZXBhcmVfYnVmKElERURNQSAqZG1hLCBpbnQzMl90
IGxpbWl0KQogfQogCiAvKiByZXR1cm4gMCBpZiBidWZmZXIgY29tcGxldGVkICovCi1zdGF0aWMg
aW50IGJtZG1hX3J3X2J1ZihJREVETUEgKmRtYSwgaW50IGlzX3dyaXRlKQorc3RhdGljIGludCBi
bWRtYV9yd19idWYoSURFRE1BICpkbWEsIGJvb2wgaXNfd3JpdGUpCiB7CiAgICAgQk1ETUFTdGF0
ZSAqYm0gPSBET19VUENBU1QoQk1ETUFTdGF0ZSwgZG1hLCBkbWEpOwogICAgIElERVN0YXRlICpz
ID0gYm1kbWFfYWN0aXZlX2lmKGJtKTsKLS0gCjIuMjEuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
