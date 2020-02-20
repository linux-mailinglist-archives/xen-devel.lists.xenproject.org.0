Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E97165E53
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:09:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lXX-0001aj-FU; Thu, 20 Feb 2020 13:06:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lXW-0001ZT-5d
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:50 +0000
X-Inumbo-ID: db1ac79e-53e1-11ea-b0fd-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id db1ac79e-53e1-11ea-b0fd-bc764e2007e4;
 Thu, 20 Feb 2020 13:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582204009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gva/oijUn2ukqqFeWUu5GYV/ONiMfg1SXT6HuIycNbc=;
 b=UFxz7BX+2umSakbE+V9Ui5ztFgkY+WJwhuHIITfNo1SyYv3rQHkHdFOZQuTmX/qEEypnW2
 UuNCmL34KoJn8cxIENChsEeJcb6Ke4zLrMIdsKt+PfjG63/6tVLYf2e813kbVo9whmBaOj
 TUGR0NNyxN4G+bYLi8tb0yigZZCgcEw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-ljcDfudVN3mTAOk7tZceeg-1; Thu, 20 Feb 2020 08:06:47 -0500
Received: by mail-wm1-f69.google.com with SMTP id p2so580217wma.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=epBBiJe/BiipnhOxinjfU345ql1651dsm1KJ2Eg1l+8=;
 b=EWZkARrjNDPSXjpIU1UCH/AV7VbuOnHUaRrQUgKI5/1sSNDlD6CiHrnjYyJrQ2OC60
 zkhz6/2wjbGdyfPS5OFN+o6wkJ8pUI/IQ2q5GLQNNzJlocSWgN5bMi3oVDYmCFXbuIRy
 njW9fHibWp9hcsnL7nADyi29q1cZwXTdUs7x7UmqsLOTrFZ/0/xdVXgzeQRZIxQ6tNHR
 Ox9UsCSiCmgyZkrZjU5nYMb7g08Nj/XyNA4wCzT8V2urKGPaVzIJBoyPS844dnQ9fzrV
 Wi89+gEL1snh9WR9Ab52nrHZv66fqL+1EsSZXoc5dYb6c733+aRKipFK+Hlq6QTeEoeG
 dLOw==
X-Gm-Message-State: APjAAAX3aOUZ1kvcgUkw4rIeqjHAn251vdXFZaYgfFIkBD+i+z+g5HFK
 KFwU/sMs+OUJysGNoFj8TED+oiGGG6V2DPYJQ0CkXNMk5kAf2IWlFeqArz96Z39H9M7+JVXxgAP
 U033W7QaAA572nPWhvvBn5chWcIM=
X-Received: by 2002:a05:600c:295d:: with SMTP id
 n29mr4504820wmd.101.1582204006820; 
 Thu, 20 Feb 2020 05:06:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzyX5Y7gdzaTOQjQ/rcWnepNEp6tk5YfOUODjdV1i7lhwV6s1r0NC2sbtsj+sn6/vQEc+xMg==
X-Received: by 2002:a05:600c:295d:: with SMTP id
 n29mr4504765wmd.101.1582204006470; 
 Thu, 20 Feb 2020 05:06:46 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:42 +0100
Message-Id: <20200220130548.29974-15-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: ljcDfudVN3mTAOk7tZceeg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 14/20] hw/virtio: Let vhost_memory_map() use
 a boolean 'is_write' argument
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
aGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody92aXJ0aW8vdmhvc3QuYyB8IDggKysrKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvaHcvdmlydGlvL3Zob3N0LmMgYi9ody92aXJ0aW8vdmhvc3QuYwppbmRleCA5ZWRmYWRjODFk
Li4wZDIyNmRhZTEwIDEwMDY0NAotLS0gYS9ody92aXJ0aW8vdmhvc3QuYworKysgYi9ody92aXJ0
aW8vdmhvc3QuYwpAQCAtMjk0LDcgKzI5NCw3IEBAIHN0YXRpYyBpbnQgdmhvc3RfZGV2X2hhc19p
b21tdShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYpCiB9CiAKIHN0YXRpYyB2b2lkICp2aG9zdF9tZW1v
cnlfbWFwKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwgaHdhZGRyIGFkZHIsCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBod2FkZHIgKnBsZW4sIGludCBpc193cml0ZSkKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGh3YWRkciAqcGxlbiwgYm9vbCBpc193cml0ZSkKIHsKICAgICBp
ZiAoIXZob3N0X2Rldl9oYXNfaW9tbXUoZGV2KSkgewogICAgICAgICByZXR1cm4gY3B1X3BoeXNp
Y2FsX21lbW9yeV9tYXAoYWRkciwgcGxlbiwgaXNfd3JpdGUpOwpAQCAtMTAxMiwyMSArMTAxMiwy
MSBAQCBzdGF0aWMgaW50IHZob3N0X3ZpcnRxdWV1ZV9zdGFydChzdHJ1Y3Qgdmhvc3RfZGV2ICpk
ZXYsCiAKICAgICB2cS0+ZGVzY19zaXplID0gcyA9IGwgPSB2aXJ0aW9fcXVldWVfZ2V0X2Rlc2Nf
c2l6ZSh2ZGV2LCBpZHgpOwogICAgIHZxLT5kZXNjX3BoeXMgPSBhOwotICAgIHZxLT5kZXNjID0g
dmhvc3RfbWVtb3J5X21hcChkZXYsIGEsICZsLCAwKTsKKyAgICB2cS0+ZGVzYyA9IHZob3N0X21l
bW9yeV9tYXAoZGV2LCBhLCAmbCwgZmFsc2UpOwogICAgIGlmICghdnEtPmRlc2MgfHwgbCAhPSBz
KSB7CiAgICAgICAgIHIgPSAtRU5PTUVNOwogICAgICAgICBnb3RvIGZhaWxfYWxsb2NfZGVzYzsK
ICAgICB9CiAgICAgdnEtPmF2YWlsX3NpemUgPSBzID0gbCA9IHZpcnRpb19xdWV1ZV9nZXRfYXZh
aWxfc2l6ZSh2ZGV2LCBpZHgpOwogICAgIHZxLT5hdmFpbF9waHlzID0gYSA9IHZpcnRpb19xdWV1
ZV9nZXRfYXZhaWxfYWRkcih2ZGV2LCBpZHgpOwotICAgIHZxLT5hdmFpbCA9IHZob3N0X21lbW9y
eV9tYXAoZGV2LCBhLCAmbCwgMCk7CisgICAgdnEtPmF2YWlsID0gdmhvc3RfbWVtb3J5X21hcChk
ZXYsIGEsICZsLCBmYWxzZSk7CiAgICAgaWYgKCF2cS0+YXZhaWwgfHwgbCAhPSBzKSB7CiAgICAg
ICAgIHIgPSAtRU5PTUVNOwogICAgICAgICBnb3RvIGZhaWxfYWxsb2NfYXZhaWw7CiAgICAgfQog
ICAgIHZxLT51c2VkX3NpemUgPSBzID0gbCA9IHZpcnRpb19xdWV1ZV9nZXRfdXNlZF9zaXplKHZk
ZXYsIGlkeCk7CiAgICAgdnEtPnVzZWRfcGh5cyA9IGEgPSB2aXJ0aW9fcXVldWVfZ2V0X3VzZWRf
YWRkcih2ZGV2LCBpZHgpOwotICAgIHZxLT51c2VkID0gdmhvc3RfbWVtb3J5X21hcChkZXYsIGEs
ICZsLCAxKTsKKyAgICB2cS0+dXNlZCA9IHZob3N0X21lbW9yeV9tYXAoZGV2LCBhLCAmbCwgdHJ1
ZSk7CiAgICAgaWYgKCF2cS0+dXNlZCB8fCBsICE9IHMpIHsKICAgICAgICAgciA9IC1FTk9NRU07
CiAgICAgICAgIGdvdG8gZmFpbF9hbGxvY191c2VkOwotLSAKMi4yMS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
