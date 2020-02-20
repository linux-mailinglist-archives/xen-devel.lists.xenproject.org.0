Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F78165E41
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:08:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lX1-000151-MW; Thu, 20 Feb 2020 13:06:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lWz-00014S-SF
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:17 +0000
X-Inumbo-ID: c4b40f1a-53e1-11ea-8526-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c4b40f1a-53e1-11ea-8526-12813bfff9fa;
 Thu, 20 Feb 2020 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582203972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3U8RUDrkQxMnVOOW0OCE6S37E2RIVx9bINi/XXS02Y4=;
 b=Fwo9Jh234B3yva3Ogz728Qp6nOd0PrJhS5mphIcNxw3I1jRz2yMlv5jtOyCgJpSRSl9TLc
 ZdIBfmilZWj/QJ/e+iduhSP/LGpgBctWilKzxyLYLwvBArqCgoe4QVb9rlRF02YcDHedgX
 AvY3VIaaTU8i6LOMPTioErGlLvCeiHA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-MCjdWqK5MGuZ7dScehYHXg-1; Thu, 20 Feb 2020 08:06:10 -0500
Received: by mail-wr1-f70.google.com with SMTP id p8so1713491wrw.5
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQu7r5A36ZEekF4m32GxNBlLjnOkqxofIVmsz5VZ5cY=;
 b=SGSQcpDpBxXOtT2mQZ5YbEXZEB8xDpvaj/wi5W1M2CfmRquEb8rkP4wl1yPQJ2G+yY
 RyrbUsvgx3Qj1O57KO6jcFRFx3b34kDlpGnsbhFWL9ef/wmd9HV4tBVux74WhDwXAp3m
 vg5ZjikcMEnq2hD1UjNTFWO0+rr6+zK4pPUpnXWX5vXj9eJ+1faroxEc/0nw2m618ouh
 tARpi5KYIp5QlX0Lyl0/tXng+al9iyUwLxQdPMLmMNGZqS/sEOqk3VtC6wpjZS1U25bF
 yP1F3WebYPg2MoWkWM+g1ib8rK90beiSVZAAjL2f9be2/GsbB4MEq7DNKXeCCGDiXnz6
 Xmtw==
X-Gm-Message-State: APjAAAXwyy/6xTcCXpFh+6MxyuPuxEL4JtkbSlMkfnYbfRHrjHjtqRe0
 D7PzbNucggXsp+0eTt5SDwVHGofvuV6kfVFgvBJyfqTLEHqIHNSGhSj95R18QTY0qIWWvDgThui
 nkZjLxeQDSEtHwhY2LVd4nIPQ+hY=
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr4784706wmi.152.1582203968766; 
 Thu, 20 Feb 2020 05:06:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqyE66uIDK1qcY0whocMHGuc5UiGXXzMSpfPUxCMQ6ki2ViRoHWEoIvgwkFHTsmW7YQNGkg7QA==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr4784676wmi.152.1582203968575; 
 Thu, 20 Feb 2020 05:06:08 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:32 +0100
Message-Id: <20200220130548.29974-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: MCjdWqK5MGuZ7dScehYHXg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 04/20] exec: Rename ram_ptr variable
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

QXMgd2UgYXJlIGdvaW5nIHRvIHVzZSBhIGRpZmZlcmVudCAncHRyJyB2YXJpYWJsZSwgcmVuYW1l
IHRoZSAncmFtCnBvaW50ZXInIHZhcmlhYmxlLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0
aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGV4ZWMuYyB8IDIwICsrKysrKysr
KystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZXhlYy5jIGIvZXhlYy5jCmluZGV4IDAyYjRlNmVhNDEuLjA2
ZTM4NmRjNzIgMTAwNjQ0Ci0tLSBhL2V4ZWMuYworKysgYi9leGVjLmMKQEAgLTMxNTEsNyArMzE1
MSw3IEBAIHN0YXRpYyBNZW1UeFJlc3VsdCBmbGF0dmlld193cml0ZV9jb250aW51ZShGbGF0Vmll
dyAqZnYsIGh3YWRkciBhZGRyLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGh3YWRkciBsZW4sIGh3YWRkciBhZGRyMSwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBod2FkZHIgbCwgTWVtb3J5UmVnaW9uICptcikKIHsKLSAgICB1
aW50OF90ICpwdHI7CisgICAgdWludDhfdCAqcmFtX3B0cjsKICAgICB1aW50NjRfdCB2YWw7CiAg
ICAgTWVtVHhSZXN1bHQgcmVzdWx0ID0gTUVNVFhfT0s7CiAgICAgYm9vbCByZWxlYXNlX2xvY2sg
PSBmYWxzZTsKQEAgLTMxNjcsOCArMzE2Nyw4IEBAIHN0YXRpYyBNZW1UeFJlc3VsdCBmbGF0dmll
d193cml0ZV9jb250aW51ZShGbGF0VmlldyAqZnYsIGh3YWRkciBhZGRyLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV9tZW1vcChsKSwgYXR0
cnMpOwogICAgICAgICB9IGVsc2UgewogICAgICAgICAgICAgLyogUkFNIGNhc2UgKi8KLSAgICAg
ICAgICAgIHB0ciA9IHFlbXVfcmFtX3B0cl9sZW5ndGgobXItPnJhbV9ibG9jaywgYWRkcjEsICZs
LCBmYWxzZSk7Ci0gICAgICAgICAgICBtZW1jcHkocHRyLCBidWYsIGwpOworICAgICAgICAgICAg
cmFtX3B0ciA9IHFlbXVfcmFtX3B0cl9sZW5ndGgobXItPnJhbV9ibG9jaywgYWRkcjEsICZsLCBm
YWxzZSk7CisgICAgICAgICAgICBtZW1jcHkocmFtX3B0ciwgYnVmLCBsKTsKICAgICAgICAgICAg
IGludmFsaWRhdGVfYW5kX3NldF9kaXJ0eShtciwgYWRkcjEsIGwpOwogICAgICAgICB9CiAKQEAg
LTMyMTUsNyArMzIxNSw3IEBAIE1lbVR4UmVzdWx0IGZsYXR2aWV3X3JlYWRfY29udGludWUoRmxh
dFZpZXcgKmZ2LCBod2FkZHIgYWRkciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaHdhZGRyIGxlbiwgaHdhZGRyIGFkZHIxLCBod2FkZHIgbCwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTWVtb3J5UmVnaW9uICptcikKIHsKLSAgICB1aW50OF90ICpwdHI7
CisgICAgdWludDhfdCAqcmFtX3B0cjsKICAgICB1aW50NjRfdCB2YWw7CiAgICAgTWVtVHhSZXN1
bHQgcmVzdWx0ID0gTUVNVFhfT0s7CiAgICAgYm9vbCByZWxlYXNlX2xvY2sgPSBmYWxzZTsKQEAg
LTMyMzAsOCArMzIzMCw4IEBAIE1lbVR4UmVzdWx0IGZsYXR2aWV3X3JlYWRfY29udGludWUoRmxh
dFZpZXcgKmZ2LCBod2FkZHIgYWRkciwKICAgICAgICAgICAgIHN0bl9oZV9wKGJ1ZiwgbCwgdmFs
KTsKICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgIC8qIFJBTSBjYXNlICovCi0gICAgICAg
ICAgICBwdHIgPSBxZW11X3JhbV9wdHJfbGVuZ3RoKG1yLT5yYW1fYmxvY2ssIGFkZHIxLCAmbCwg
ZmFsc2UpOwotICAgICAgICAgICAgbWVtY3B5KGJ1ZiwgcHRyLCBsKTsKKyAgICAgICAgICAgIHJh
bV9wdHIgPSBxZW11X3JhbV9wdHJfbGVuZ3RoKG1yLT5yYW1fYmxvY2ssIGFkZHIxLCAmbCwgZmFs
c2UpOworICAgICAgICAgICAgbWVtY3B5KGJ1ZiwgcmFtX3B0ciwgbCk7CiAgICAgICAgIH0KIAog
ICAgICAgICBpZiAocmVsZWFzZV9sb2NrKSB7CkBAIC0zMzI5LDcgKzMzMjksNyBAQCBzdGF0aWMg
aW5saW5lIE1lbVR4UmVzdWx0IGFkZHJlc3Nfc3BhY2Vfd3JpdGVfcm9tX2ludGVybmFsKEFkZHJl
c3NTcGFjZSAqYXMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVudW0gd3JpdGVfcm9tX3R5cGUgdHlwZSkKIHsKICAgICBod2FkZHIg
bDsKLSAgICB1aW50OF90ICpwdHI7CisgICAgdWludDhfdCAqcmFtX3B0cjsKICAgICBod2FkZHIg
YWRkcjE7CiAgICAgTWVtb3J5UmVnaW9uICptcjsKIApAQCAtMzM0MywxNCArMzM0MywxNCBAQCBz
dGF0aWMgaW5saW5lIE1lbVR4UmVzdWx0IGFkZHJlc3Nfc3BhY2Vfd3JpdGVfcm9tX2ludGVybmFs
KEFkZHJlc3NTcGFjZSAqYXMsCiAgICAgICAgICAgICBsID0gbWVtb3J5X2FjY2Vzc19zaXplKG1y
LCBsLCBhZGRyMSk7CiAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgICAvKiBST00vUkFNIGNh
c2UgKi8KLSAgICAgICAgICAgIHB0ciA9IHFlbXVfbWFwX3JhbV9wdHIobXItPnJhbV9ibG9jaywg
YWRkcjEpOworICAgICAgICAgICAgcmFtX3B0ciA9IHFlbXVfbWFwX3JhbV9wdHIobXItPnJhbV9i
bG9jaywgYWRkcjEpOwogICAgICAgICAgICAgc3dpdGNoICh0eXBlKSB7CiAgICAgICAgICAgICBj
YXNlIFdSSVRFX0RBVEE6Ci0gICAgICAgICAgICAgICAgbWVtY3B5KHB0ciwgYnVmLCBsKTsKKyAg
ICAgICAgICAgICAgICBtZW1jcHkocmFtX3B0ciwgYnVmLCBsKTsKICAgICAgICAgICAgICAgICBp
bnZhbGlkYXRlX2FuZF9zZXRfZGlydHkobXIsIGFkZHIxLCBsKTsKICAgICAgICAgICAgICAgICBi
cmVhazsKICAgICAgICAgICAgIGNhc2UgRkxVU0hfQ0FDSEU6Ci0gICAgICAgICAgICAgICAgZmx1
c2hfaWNhY2hlX3JhbmdlKCh1aW50cHRyX3QpcHRyLCAodWludHB0cl90KXB0ciArIGwpOworICAg
ICAgICAgICAgICAgIGZsdXNoX2ljYWNoZV9yYW5nZSgodWludHB0cl90KXJhbV9wdHIsICh1aW50
cHRyX3QpcmFtX3B0ciArIGwpOwogICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAg
fQogICAgICAgICB9Ci0tIAoyLjIxLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
