Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667E1BE7EF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 23:53:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDFAp-0004dp-5c; Wed, 25 Sep 2019 21:50:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f3VU=XU=gmail.com=robherring2@srs-us1.protection.inumbo.net>)
 id 1iDFAn-0004dk-F8
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 21:50:09 +0000
X-Inumbo-ID: 70c37ea8-dfde-11e9-963a-12813bfff9fa
Received: from mail-ot1-f66.google.com (unknown [209.85.210.66])
 by localhost (Halon) with ESMTPS
 id 70c37ea8-dfde-11e9-963a-12813bfff9fa;
 Wed, 25 Sep 2019 21:50:08 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id f21so124914otl.13
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 14:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6cXLFB02TykvVAB5VHeIiQg5E1YhhmuVezg1VTNWACM=;
 b=ZbFv5Rn8e0VL0ADJr8YuTx7oGjrZEl1s0j11FAHKyby9RAV9iAFCK3i2rMnIB1AaWc
 8eGLz4yThyDws5UD/NgQ3r79MwafRW8O5zsNJP5EVNP8Mf+K+DZdl+c0b8wCXpnWc1Ig
 i65wsX7s6mCpd9r7LnBNJiMfBjdLcch4E+rQ7LG2pFk45PCAU/9s/ukslWFGsDIQP5q+
 nWt5r4iXCg3hLagzI983iazlsKadDrGRaaAbktGJHr2ttQySJsgumgpw9kLqePi5EhZF
 vnivyMAhDhHq2vSasgKD6vD1hdI9Ku9mU5fCz31vvsARYrAYCiN5HVrHDR9l4JWhY3HQ
 TXWw==
X-Gm-Message-State: APjAAAVpzahMAjzPsvx5HjcU0HyZ6eyJcrgb8ZBDkSXr2E2/U+G1AQAj
 BmjXkd0ym6sWG3G/+CvkOw==
X-Google-Smtp-Source: APXvYqyz7lSYS26abdEhCGr1U2uy0uBmZ56y9Lbe3N7QnPUQ3gDyYFxELSUCIBwmOSdt/05qrxpCYg==
X-Received: by 2002:a05:6830:1d8:: with SMTP id
 r24mr215060ota.217.1569448207485; 
 Wed, 25 Sep 2019 14:50:07 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id q199sm78792oic.16.2019.09.25.14.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 14:50:06 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Wed, 25 Sep 2019 16:50:06 -0500
Message-Id: <20190925215006.12056-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [RFC PATCH] xen/gntdev: Stop abusing DT
 of_dma_configure API
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgdGhlIGNvbW1lbnQgc2F5cywgdGhpcyBpc24ndCBhIERUIGJhc2VkIGRldmljZS4gb2ZfZG1h
X2NvbmZpZ3VyZSgpCmlzIGdvaW5nIHRvIHN0b3AgYWxsb3dpbmcgYSBOVUxMIERUIG5vZGUsIHNv
IHRoaXMgbmVlZHMgdG8gYmUgZml4ZWQuCgpOb3Qgc3VyZSBleGFjdGx5IHdoYXQgc2V0dXAgYmVz
aWRlcyBhcmNoX3NldHVwX2RtYV9vcHMgaXMgbmVlZGVkLi4uCgpDYzogUm9iaW4gTXVycGh5IDxy
b2Jpbi5tdXJwaHlAYXJtLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+CkNjOiBOaWNvbGFzIFNhZW56IEp1bGllbm5lIDxuc2FlbnpqdWxpZW5uZUBzdXNlLmRlPgpD
YzogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0u
Y29tPgpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIGRyaXZl
cnMveGVuL2dudGRldi5jIHwgMTEgLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9nbnRkZXYuYyBiL2RyaXZlcnMveGVu
L2dudGRldi5jCmluZGV4IGE0NDZhNzIyMWUxMy4uNTk5MDZmOWE0MGU0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL3hlbi9nbnRkZXYuYworKysgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYwpAQCAtMzQsOSAr
MzQsNiBAQAogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9oaWdobWVt
Lmg+CiAjaW5jbHVkZSA8bGludXgvcmVmY291bnQuaD4KLSNpZmRlZiBDT05GSUdfWEVOX0dSQU5U
X0RNQV9BTExPQwotI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgotI2VuZGlmCiAKICNpbmNs
dWRlIDx4ZW4veGVuLmg+CiAjaW5jbHVkZSA8eGVuL2dyYW50X3RhYmxlLmg+CkBAIC02MjUsMTQg
KzYyMiw2IEBAIHN0YXRpYyBpbnQgZ250ZGV2X29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3Ry
dWN0IGZpbGUgKmZsaXApCiAJZmxpcC0+cHJpdmF0ZV9kYXRhID0gcHJpdjsKICNpZmRlZiBDT05G
SUdfWEVOX0dSQU5UX0RNQV9BTExPQwogCXByaXYtPmRtYV9kZXYgPSBnbnRkZXZfbWlzY2Rldi50
aGlzX2RldmljZTsKLQotCS8qCi0JICogVGhlIGRldmljZSBpcyBub3Qgc3Bhd24gZnJvbSBhIGRl
dmljZSB0cmVlLCBzbyBhcmNoX3NldHVwX2RtYV9vcHMKLQkgKiBpcyBub3QgY2FsbGVkLCB0aHVz
IGxlYXZpbmcgdGhlIGRldmljZSB3aXRoIGR1bW15IERNQSBvcHMuCi0JICogRml4IHRoaXMgYnkg
Y2FsbGluZyBvZl9kbWFfY29uZmlndXJlKCkgd2l0aCBhIE5VTEwgbm9kZSB0byBzZXQKLQkgKiBk
ZWZhdWx0IERNQSBvcHMuCi0JICovCi0Jb2ZfZG1hX2NvbmZpZ3VyZShwcml2LT5kbWFfZGV2LCBO
VUxMLCB0cnVlKTsKICNlbmRpZgogCXByX2RlYnVnKCJwcml2ICVwXG4iLCBwcml2KTsKIAotLSAK
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
