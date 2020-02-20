Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B353A165E45
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:08:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lXU-0001XH-51; Thu, 20 Feb 2020 13:06:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lXS-0001VU-5D
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:46 +0000
X-Inumbo-ID: d8afad8b-53e1-11ea-8526-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d8afad8b-53e1-11ea-8526-12813bfff9fa;
 Thu, 20 Feb 2020 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582204005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uVwVVeCugJs7pFiHvYs+kcICDXTPSCqBYYCEtvte3CI=;
 b=ev0u4fSYVUKmNRoJ8NvKdcw3O0r671WtNM6ZzRv8/729K0rp+x5Zc8/mXn9rE1GYA5eXnx
 JmKk1yS83SKVg5wi8QXsSc40PkpeNs66FQI0oPbhLhC714omVqAeI1kAQra/wYqrEroZHo
 S1frQDdgXnoZyidDSMJtsxwzKV5dgbQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-f9u88GVKPEG3ckJu6nIfjQ-1; Thu, 20 Feb 2020 08:06:43 -0500
Received: by mail-wr1-f72.google.com with SMTP id s13so1704228wru.7
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UKC5US0FVl1pIv+lPWy76t1kr1KKdCp1Se8AoBMs7qQ=;
 b=IkEF6wSpIGUaCN66kSP/2lb1KoU+vXmGjhmu0C2QX65fJoiWX6AhU7UsHCS2Y84VE+
 u8V1oStI2vgXkIKvwanJJvO1Db88PG03U3INo9dpKVMFiSClowxSrhkgNdAXgzZ5G6jM
 YWHUUCZ6RkQCMc63ynT4Dyzj1/ZD31bEAp6TQQDL1WfVOQqziCIfz7QPacjhXC0rAEUX
 bjJ9sbynQ348YAzCO4Z0Ky34qBO3nnBNtlCY6ibY8dCVHztiQcOOLcTgTTVwMl68ENVH
 vHlZGUIhc9ILhvFH6fyjYOp9XA91HHe9PdBGfa3Jh02JsVfGSOLP3RdfT/OVD4LGCVNX
 aPwQ==
X-Gm-Message-State: APjAAAWZFB8XtXaDaGFcR48pZtqUI6KUxMdeonUBUnep3/WmPOn8AZi3
 uJI+K5sZP/g3izG07MgltWKLyA0VRApZxP1aXm2yxXgKlLaGYxLa9knclFxYWfL5dTwxTvOktg5
 UKv6ama++W6HFAqWgbW4nS7oVNUw=
X-Received: by 2002:a5d:4c84:: with SMTP id z4mr43731139wrs.423.1582204002778; 
 Thu, 20 Feb 2020 05:06:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqHc8xSBLutdUhIzf/cdvh5+i6wOt8LjaLS6C9c63Yasey84Mhi4F8A6DvfBLGaafXEkCiSQ==
X-Received: by 2002:a5d:4c84:: with SMTP id z4mr43731080wrs.423.1582204002528; 
 Thu, 20 Feb 2020 05:06:42 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:41 +0100
Message-Id: <20200220130548.29974-14-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: f9u88GVKPEG3ckJu6nIfjQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 13/20] hw/virtio: Let virtqueue_map_iovec()
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
aGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody92aXJ0aW8vdmlydGlvLmMgfCA3ICsrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvaHcvdmlydGlvL3ZpcnRpby5jIGIvaHcvdmlydGlvL3ZpcnRpby5jCmluZGV4IDJjNTQxMGU5
ODEuLjlkMDZkYmUzZWYgMTAwNjQ0Ci0tLSBhL2h3L3ZpcnRpby92aXJ0aW8uYworKysgYi9ody92
aXJ0aW8vdmlydGlvLmMKQEAgLTEyOTMsNyArMTI5Myw3IEBAIHN0YXRpYyB2b2lkIHZpcnRxdWV1
ZV91bmRvX21hcF9kZXNjKHVuc2lnbmVkIGludCBvdXRfbnVtLCB1bnNpZ25lZCBpbnQgaW5fbnVt
LAogCiBzdGF0aWMgdm9pZCB2aXJ0cXVldWVfbWFwX2lvdmVjKFZpcnRJT0RldmljZSAqdmRldiwg
c3RydWN0IGlvdmVjICpzZywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHdhZGRy
ICphZGRyLCB1bnNpZ25lZCBpbnQgbnVtX3NnLAotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnQgaXNfd3JpdGUpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wg
aXNfd3JpdGUpCiB7CiAgICAgdW5zaWduZWQgaW50IGk7CiAgICAgaHdhZGRyIGxlbjsKQEAgLTEz
MTcsOCArMTMxNyw5IEBAIHN0YXRpYyB2b2lkIHZpcnRxdWV1ZV9tYXBfaW92ZWMoVmlydElPRGV2
aWNlICp2ZGV2LCBzdHJ1Y3QgaW92ZWMgKnNnLAogCiB2b2lkIHZpcnRxdWV1ZV9tYXAoVmlydElP
RGV2aWNlICp2ZGV2LCBWaXJ0UXVldWVFbGVtZW50ICplbGVtKQogewotICAgIHZpcnRxdWV1ZV9t
YXBfaW92ZWModmRldiwgZWxlbS0+aW5fc2csIGVsZW0tPmluX2FkZHIsIGVsZW0tPmluX251bSwg
MSk7Ci0gICAgdmlydHF1ZXVlX21hcF9pb3ZlYyh2ZGV2LCBlbGVtLT5vdXRfc2csIGVsZW0tPm91
dF9hZGRyLCBlbGVtLT5vdXRfbnVtLCAwKTsKKyAgICB2aXJ0cXVldWVfbWFwX2lvdmVjKHZkZXYs
IGVsZW0tPmluX3NnLCBlbGVtLT5pbl9hZGRyLCBlbGVtLT5pbl9udW0sIHRydWUpOworICAgIHZp
cnRxdWV1ZV9tYXBfaW92ZWModmRldiwgZWxlbS0+b3V0X3NnLCBlbGVtLT5vdXRfYWRkciwgZWxl
bS0+b3V0X251bSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhbHNlKTsKIH0KIAogc3RhdGljIHZvaWQgKnZp
cnRxdWV1ZV9hbGxvY19lbGVtZW50KHNpemVfdCBzeiwgdW5zaWduZWQgb3V0X251bSwgdW5zaWdu
ZWQgaW5fbnVtKQotLSAKMi4yMS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
