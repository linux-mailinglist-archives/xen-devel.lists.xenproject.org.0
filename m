Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67070165E49
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:08:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lXb-0001fC-Ox; Thu, 20 Feb 2020 13:06:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lXZ-0001dP-OD
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:53 +0000
X-Inumbo-ID: dd4431a4-53e1-11ea-bc8e-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id dd4431a4-53e1-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 13:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582204013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnDlGhkDMc438YGrbvBovs3YxQJGj712XxeOh8S513U=;
 b=bXzFcujiUy8WThLAzWiyrVojuXhqpd51Xvn+J2tRCvL8TH2DdyGhwQTqowbuj7edFVT/ZR
 /Bn/AkdrraGHTAklTb6bcWdmzsgNzFNf5l3ipQS+X1slezfWLZ3PwKNwCu3YQqjLETpVVL
 3KsXvf0D2XG1BQk6yW+fB9PaaxwQXrQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-Rxc6w5fSMvut1bNFgp6jUA-1; Thu, 20 Feb 2020 08:06:51 -0500
Received: by mail-wm1-f71.google.com with SMTP id k21so580983wmi.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6IlttQWg5GixafQJKz3fjDa/v6plglwkRJYH67W75E=;
 b=mK574cIiCtALZXrqxPehpZ5I8zbdiVaYgOn5StLDxF9cjEbr6g6ont6kzLFruggOl+
 so/Oskpr3SRGHYWjp1hTx8hRN7FROscGo08osvRcTQRjAE3ejns0uu8QXW9R1mmVdhNs
 EajMQhuaJPPTdGK/9Jpae7LJzIuVDstOI/5npYU8z7V95iQeKjKr8OiJRUbbYtJnpwDr
 qUOz2i83iQJsWFJJ15JuyJvyQza2cxKo/rXiYbwUs52apUDHINs6YXComOtgVxKf6EtJ
 9x6n/XF7tuR/PxVyvWTVoDulEo6fVJ0QoxsnM9+kfQBC2+Brfsos9BM3jmLdI0K6YUep
 rJ1w==
X-Gm-Message-State: APjAAAX38YWYm2h0DKUJ/rHVeuTaNOJenieOo4Gyf39w5pWbZ9o4Bxfb
 JgcQou2Of0TU1svUmrYevWaNnekScO4MwZ7mdUf9rX2OnZ0OLMV+h0Tgb6wHKowag472Oyj9l3/
 nBMr069EQnAINhKt9hBONulBOXI8=
X-Received: by 2002:adf:cd92:: with SMTP id q18mr41684785wrj.261.1582204010381; 
 Thu, 20 Feb 2020 05:06:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqyVav3x+evHlrydubRXhyXAQPy/0YGFnLq+pw2hyskD3NJLge6kmK8LKicTlkzB4cX/rXzZiw==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr41684732wrj.261.1582204010138; 
 Thu, 20 Feb 2020 05:06:50 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:43 +0100
Message-Id: <20200220130548.29974-16-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: Rxc6w5fSMvut1bNFgp6jUA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 15/20] exec: Let address_space_unmap() use a
 boolean 'is_write' argument
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
aGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2V4ZWMvbWVtb3J5LmggfCAyICstCiBleGVj
LmMgICAgICAgICAgICAgICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9tZW1vcnkuaCBi
L2luY2x1ZGUvZXhlYy9tZW1vcnkuaAppbmRleCBhZmVlMTg1ZWFlLi4xNjE0ZDlhMDJjIDEwMDY0
NAotLS0gYS9pbmNsdWRlL2V4ZWMvbWVtb3J5LmgKKysrIGIvaW5jbHVkZS9leGVjL21lbW9yeS5o
CkBAIC0yMzI5LDcgKzIzMjksNyBAQCB2b2lkICphZGRyZXNzX3NwYWNlX21hcChBZGRyZXNzU3Bh
Y2UgKmFzLCBod2FkZHIgYWRkciwKICAqIEBpc193cml0ZTogaW5kaWNhdGVzIHRoZSB0cmFuc2Zl
ciBkaXJlY3Rpb24KICAqLwogdm9pZCBhZGRyZXNzX3NwYWNlX3VubWFwKEFkZHJlc3NTcGFjZSAq
YXMsIHZvaWQgKmJ1ZmZlciwgaHdhZGRyIGxlbiwKLSAgICAgICAgICAgICAgICAgICAgICAgICBp
bnQgaXNfd3JpdGUsIGh3YWRkciBhY2Nlc3NfbGVuKTsKKyAgICAgICAgICAgICAgICAgICAgICAg
ICBib29sIGlzX3dyaXRlLCBod2FkZHIgYWNjZXNzX2xlbik7CiAKIAogLyogSW50ZXJuYWwgZnVu
Y3Rpb25zLCBwYXJ0IG9mIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBhZGRyZXNzX3NwYWNlX3JlYWQu
ICAqLwpkaWZmIC0tZ2l0IGEvZXhlYy5jIGIvZXhlYy5jCmluZGV4IDAxNDM3YmU2OTEuLjE2OTc0
ZDRmNGIgMTAwNjQ0Ci0tLSBhL2V4ZWMuYworKysgYi9leGVjLmMKQEAgLTM1OTgsMTEgKzM1OTgs
MTEgQEAgdm9pZCAqYWRkcmVzc19zcGFjZV9tYXAoQWRkcmVzc1NwYWNlICphcywKIH0KIAogLyog
VW5tYXBzIGEgbWVtb3J5IHJlZ2lvbiBwcmV2aW91c2x5IG1hcHBlZCBieSBhZGRyZXNzX3NwYWNl
X21hcCgpLgotICogV2lsbCBhbHNvIG1hcmsgdGhlIG1lbW9yeSBhcyBkaXJ0eSBpZiBpc193cml0
ZSA9PSAxLiAgYWNjZXNzX2xlbiBnaXZlcworICogV2lsbCBhbHNvIG1hcmsgdGhlIG1lbW9yeSBh
cyBkaXJ0eSBpZiBpc193cml0ZSBpcyB0cnVlLiAgYWNjZXNzX2xlbiBnaXZlcwogICogdGhlIGFt
b3VudCBvZiBtZW1vcnkgdGhhdCB3YXMgYWN0dWFsbHkgcmVhZCBvciB3cml0dGVuIGJ5IHRoZSBj
YWxsZXIuCiAgKi8KIHZvaWQgYWRkcmVzc19zcGFjZV91bm1hcChBZGRyZXNzU3BhY2UgKmFzLCB2
b2lkICpidWZmZXIsIGh3YWRkciBsZW4sCi0gICAgICAgICAgICAgICAgICAgICAgICAgaW50IGlz
X3dyaXRlLCBod2FkZHIgYWNjZXNzX2xlbikKKyAgICAgICAgICAgICAgICAgICAgICAgICBib29s
IGlzX3dyaXRlLCBod2FkZHIgYWNjZXNzX2xlbikKIHsKICAgICBpZiAoYnVmZmVyICE9IGJvdW5j
ZS5idWZmZXIpIHsKICAgICAgICAgTWVtb3J5UmVnaW9uICptcjsKLS0gCjIuMjEuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
