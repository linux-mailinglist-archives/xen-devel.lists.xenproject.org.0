Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D6165E4F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:09:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lXn-0001qI-HG; Thu, 20 Feb 2020 13:07:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lXl-0001op-Ox
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:07:05 +0000
X-Inumbo-ID: e4157ef2-53e1-11ea-aa99-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e4157ef2-53e1-11ea-aa99-bc764e2007e4;
 Thu, 20 Feb 2020 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582204024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PwVfta2T/yY9fXrs1bpbk8EWKAqkE2atADSJKtO6lc=;
 b=J1uCt1Akzwp74l4o8NEIyzYzx9kYTL9wfRaKMM9FJ4cB+MaZtXaR6Ob8N7fMUD2kUNA86n
 xWcLOi6vIv77dmGUsUUMe+GnWhUFppDTvqciU9R4NxRseYxz6+9euDf6aqcd/BoptP7iG2
 CeFq89n7vvmoobRJC0A/i2fsdO/QBzM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-CzhXxBdzMW2CAtq16TQ9Sw-1; Thu, 20 Feb 2020 08:07:01 -0500
X-MC-Unique: CzhXxBdzMW2CAtq16TQ9Sw-1
Received: by mail-wm1-f72.google.com with SMTP id f207so577667wme.6
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mOFaN72GDMCW5HO6VjgTUS8UF4EBg1PhikK6Z5qXel0=;
 b=GK5iqEOW1OTd6i/w12ZSQQAQKiSwRZVPuj6rX2K7D04j0XZCc1dwdZ+9Z41JQQZHlT
 aK1AwuuznDRe3J7ZntPWEN6paqB9OB8Hd1PNGZyi3QjgTj6BKVlR6KRidk8rnv3UCDqy
 /AyTYbMkpT4cCul1oyFsgfY/VptANhUQV8m/57Ib0oH+dG9lyLUMgyOhoQni0UpfblkS
 v7+AWe6wtaIiAgLv3koHzuk8Ew/pXWK6R05tZ8Rko8CvtvBlP4mQpgPFmanLympDy5a5
 AEKns8z1l403I8S9sRqH3VSrAvZigSA+EHpJ+8nWkEx1VvjZOTi7JvQ205418DoZvtxv
 dUTw==
X-Gm-Message-State: APjAAAVZUY1cxibRzSEpG784CbDG9EgXpbBLKSnffrlKo+/hI1913K/w
 lMM1KA4nUMvOA4k4+LDPE9LkBLR20/vEdWIfVEvywbIJ6XtbgiQCCJhtAXZHH+Xtx8UEHAKU9eF
 9O9JUGLt1q3ZXbW95ZkPb63gRlAA=
X-Received: by 2002:a1c:bdc5:: with SMTP id n188mr4525047wmf.124.1582204014481; 
 Thu, 20 Feb 2020 05:06:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqxVjczz55ql1rEb/MuCKbM4mbnGg2+QP76S0K4doZSf4ATrQ7PaxLlWrdmPAnroUu1OpiGw2w==
X-Received: by 2002:a1c:bdc5:: with SMTP id n188mr4524974wmf.124.1582204014007; 
 Thu, 20 Feb 2020 05:06:54 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:44 +0100
Message-Id: <20200220130548.29974-17-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 16/20] Let address_space_rw() calls pass a
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

U2luY2UgaXRzIGludHJvZHVjdGlvbiBpbiBjb21taXQgYWMxOTcwZmJlOCwgYWRkcmVzc19zcGFj
ZV9ydygpCnRha2VzIGEgYm9vbGVhbiAnaXNfd3JpdGUnIGFyZ3VtZW50LiBGaXggdGhlIGNvZGVi
YXNlIGJ5IHVzaW5nCmFuIGV4cGxpY2l0IGJvb2xlYW4gdHlwZS4KClRoaXMgY29tbWl0IHdhcyBw
cm9kdWNlZCB3aXRoIHRoZSBpbmNsdWRlZCBDb2NjaW5lbGxlIHNjcmlwdApzY3JpcHRzL2NvY2Np
bmVsbGUvZXhlY19yd19jb25zdC4KCkluc3BpcmVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5t
YXlkZWxsQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBzY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25z
dC5jb2NjaSB8IDEyICsrKysrKysrKysrKwogdGFyZ2V0L2kzODYvaHZmL3ZteC5oICAgICAgICAg
ICAgICAgICAgfCAgMiArLQogZXhlYy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNCArKy0tCiBody9uZXQvZHA4MzkzeC5jICAgICAgICAgICAgICAgICAgICAgICB8IDI3ICsr
KysrKysrKysrKystLS0tLS0tLS0tLS0tCiBody9uZXQvaTgyNTk2LmMgICAgICAgICAgICAgICAg
ICAgICAgICB8IDExICsrKysrKy0tLS0tCiBody9uZXQvbGFzaV9pODI1OTYuYyAgICAgICAgICAg
ICAgICAgICB8ICA0ICsrLS0KIHRhcmdldC9pMzg2L2h2Zi94ODZfbW11LmMgICAgICAgICAgICAg
IHwgIDggKysrKy0tLS0KIDcgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMjcgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNfcndfY29uc3Qu
Y29jY2kgYi9zY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2NjaQppbmRleCA3MGNm
NTJkNThlLi45OGNiMDZmMDlmIDEwMDY0NAotLS0gYS9zY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19y
d19jb25zdC5jb2NjaQorKysgYi9zY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2Nj
aQpAQCAtMSw2ICsxLDE4IEBACiAvLyBVc2FnZToKIC8vICBzcGF0Y2ggLS1zcC1maWxlIHNjcmlw
dHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNvY2NpIC0tZGlyIC4gLS1pbi1wbGFjZQogCisv
LyBDb252ZXJ0IHRvIGJvb2xlYW4KK0BACitleHByZXNzaW9uIEUxLCBFMiwgRTMsIEU0LCBFNTsK
K0BACisoCistIGFkZHJlc3Nfc3BhY2VfcncoRTEsIEUyLCBFMywgRTQsIEU1LCAwKQorKyBhZGRy
ZXNzX3NwYWNlX3J3KEUxLCBFMiwgRTMsIEU0LCBFNSwgZmFsc2UpCit8CistIGFkZHJlc3Nfc3Bh
Y2VfcncoRTEsIEUyLCBFMywgRTQsIEU1LCAxKQorKyBhZGRyZXNzX3NwYWNlX3J3KEUxLCBFMiwg
RTMsIEU0LCBFNSwgdHJ1ZSkKKykKKwogLy8gVXNlIGFkZHJlc3Nfc3BhY2Vfd3JpdGUgaW5zdGVh
ZCBvZiBjYXN0aW5nIHRvIG5vbi1jb25zdAogQEAKIHR5cGUgVDsKZGlmZiAtLWdpdCBhL3Rhcmdl
dC9pMzg2L2h2Zi92bXguaCBiL3RhcmdldC9pMzg2L2h2Zi92bXguaAppbmRleCBhMTE1Y2ExNzgy
Li4xOWFmMDI5MTMzIDEwMDY0NAotLS0gYS90YXJnZXQvaTM4Ni9odmYvdm14LmgKKysrIGIvdGFy
Z2V0L2kzODYvaHZmL3ZteC5oCkBAIC0xMjgsNyArMTI4LDcgQEAgc3RhdGljIGlubGluZSB2b2lk
IG1hY3ZtX3NldF9jcjAoaHZfdmNwdWlkX3QgdmNwdSwgdWludDY0X3QgY3IwKQogICAgICAgICBh
ZGRyZXNzX3NwYWNlX3J3KCZhZGRyZXNzX3NwYWNlX21lbW9yeSwKICAgICAgICAgICAgICAgICAg
ICAgICAgICBydm1jcyh2Y3B1LCBWTUNTX0dVRVNUX0NSMykgJiB+MHgxZiwKICAgICAgICAgICAg
ICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELAotICAgICAgICAgICAgICAgICAg
ICAgICAgIHBkcHRlLCAzMiwgMCk7CisgICAgICAgICAgICAgICAgICAgICAgICAgcGRwdGUsIDMy
LCBmYWxzZSk7CiAgICAgICAgIC8qIE9ubHkgc2V0IFBEUFRFIHdoZW4gYXBwcm9wcmlhdGUuICov
CiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCA0OyBpKyspIHsKICAgICAgICAgICAgIHd2bWNzKHZj
cHUsIFZNQ1NfR1VFU1RfUERQVEUwICsgaSAqIDIsIHBkcHRlW2ldKTsKZGlmZiAtLWdpdCBhL2V4
ZWMuYyBiL2V4ZWMuYwppbmRleCAxNjk3NGQ0ZjRiLi43M2MzYmNmYTQwIDEwMDY0NAotLS0gYS9l
eGVjLmMKKysrIGIvZXhlYy5jCkBAIC0zODE1LDggKzM4MTUsOCBAQCBpbnQgY3B1X21lbW9yeV9y
d19kZWJ1ZyhDUFVTdGF0ZSAqY3B1LCB0YXJnZXRfdWxvbmcgYWRkciwKICAgICAgICAgICAgIGFk
ZHJlc3Nfc3BhY2Vfd3JpdGVfcm9tKGNwdS0+Y3B1X2FzZXNbYXNpZHhdLmFzLCBwaHlzX2FkZHIs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhdHRycywgYnVmLCBsKTsKICAg
ICAgICAgfSBlbHNlIHsKLSAgICAgICAgICAgIGFkZHJlc3Nfc3BhY2VfcncoY3B1LT5jcHVfYXNl
c1thc2lkeF0uYXMsIHBoeXNfYWRkciwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXR0
cnMsIGJ1ZiwgbCwgMCk7CisgICAgICAgICAgICBhZGRyZXNzX3NwYWNlX3J3KGNwdS0+Y3B1X2Fz
ZXNbYXNpZHhdLmFzLCBwaHlzX2FkZHIsIGF0dHJzLCBidWYsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGwsIGZhbHNlKTsKICAgICAgICAgfQogICAgICAgICBsZW4gLT0gbDsKICAgICAg
ICAgYnVmICs9IGw7CmRpZmYgLS1naXQgYS9ody9uZXQvZHA4MzkzeC5jIGIvaHcvbmV0L2RwODM5
M3guYwppbmRleCBiNDYxMTAxY2ViLi5iNDM2M2UzMTg2IDEwMDY0NAotLS0gYS9ody9uZXQvZHA4
MzkzeC5jCisrKyBiL2h3L25ldC9kcDgzOTN4LmMKQEAgLTI3Niw3ICsyNzYsNyBAQCBzdGF0aWMg
dm9pZCBkcDgzOTN4X2RvX2xvYWRfY2FtKGRwODM5M3hTdGF0ZSAqcykKICAgICB3aGlsZSAocy0+
cmVnc1tTT05JQ19DRENdICYgMHgxZikgewogICAgICAgICAvKiBGaWxsIGN1cnJlbnQgZW50cnkg
Ki8KICAgICAgICAgYWRkcmVzc19zcGFjZV9ydygmcy0+YXMsIGRwODM5M3hfY2RwKHMpLAotICAg
ICAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsIHMtPmRhdGEsIHNp
emUsIDApOworICAgICAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQs
IHMtPmRhdGEsIHNpemUsIGZhbHNlKTsKICAgICAgICAgcy0+Y2FtW2luZGV4XVswXSA9IGRwODM5
M3hfZ2V0KHMsIHdpZHRoLCAxKSAmIDB4ZmY7CiAgICAgICAgIHMtPmNhbVtpbmRleF1bMV0gPSBk
cDgzOTN4X2dldChzLCB3aWR0aCwgMSkgPj4gODsKICAgICAgICAgcy0+Y2FtW2luZGV4XVsyXSA9
IGRwODM5M3hfZ2V0KHMsIHdpZHRoLCAyKSAmIDB4ZmY7CkBAIC0yOTQsNyArMjk0LDcgQEAgc3Rh
dGljIHZvaWQgZHA4MzkzeF9kb19sb2FkX2NhbShkcDgzOTN4U3RhdGUgKnMpCiAKICAgICAvKiBS
ZWFkIENBTSBlbmFibGUgKi8KICAgICBhZGRyZXNzX3NwYWNlX3J3KCZzLT5hcywgZHA4MzkzeF9j
ZHAocyksCi0gICAgICAgICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBzLT5k
YXRhLCBzaXplLCAwKTsKKyAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJ
RUQsIHMtPmRhdGEsIHNpemUsIGZhbHNlKTsKICAgICBzLT5yZWdzW1NPTklDX0NFXSA9IGRwODM5
M3hfZ2V0KHMsIHdpZHRoLCAwKTsKICAgICBEUFJJTlRGKCJsb2FkIGNhbSBkb25lLiBjYW0gZW5h
YmxlIG1hc2sgMHglMDR4XG4iLCBzLT5yZWdzW1NPTklDX0NFXSk7CiAKQEAgLTMxMiw3ICszMTIs
NyBAQCBzdGF0aWMgdm9pZCBkcDgzOTN4X2RvX3JlYWRfcnJhKGRwODM5M3hTdGF0ZSAqcykKICAg
ICB3aWR0aCA9IChzLT5yZWdzW1NPTklDX0RDUl0gJiBTT05JQ19EQ1JfRFcpID8gMiA6IDE7CiAg
ICAgc2l6ZSA9IHNpemVvZih1aW50MTZfdCkgKiA0ICogd2lkdGg7CiAgICAgYWRkcmVzc19zcGFj
ZV9ydygmcy0+YXMsIGRwODM5M3hfcnJwKHMpLAotICAgICAgICAgICAgICAgICAgICAgTUVNVFhB
VFRSU19VTlNQRUNJRklFRCwgcy0+ZGF0YSwgc2l6ZSwgMCk7CisgICAgICAgICAgICAgICAgICAg
ICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBzLT5kYXRhLCBzaXplLCBmYWxzZSk7CiAKICAgICAv
KiBVcGRhdGUgU09OSUMgcmVnaXN0ZXJzICovCiAgICAgcy0+cmVnc1tTT05JQ19DUkJBMF0gPSBk
cDgzOTN4X2dldChzLCB3aWR0aCwgMCk7CkBAIC00MjcsNyArNDI3LDcgQEAgc3RhdGljIHZvaWQg
ZHA4MzkzeF9kb190cmFuc21pdF9wYWNrZXRzKGRwODM5M3hTdGF0ZSAqcykKICAgICAgICAgcy0+
cmVnc1tTT05JQ19UVERBXSA9IHMtPnJlZ3NbU09OSUNfQ1REQV07CiAgICAgICAgIERQUklOVEYo
IlRyYW5zbWl0IHBhY2tldCBhdCAlMDh4XG4iLCBkcDgzOTN4X3R0ZGEocykpOwogICAgICAgICBh
ZGRyZXNzX3NwYWNlX3J3KCZzLT5hcywgZHA4MzkzeF90dGRhKHMpICsgc2l6ZW9mKHVpbnQxNl90
KSAqIHdpZHRoLAotICAgICAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJ
RUQsIHMtPmRhdGEsIHNpemUsIDApOworICAgICAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRU
UlNfVU5TUEVDSUZJRUQsIHMtPmRhdGEsIHNpemUsIGZhbHNlKTsKICAgICAgICAgdHhfbGVuID0g
MDsKIAogICAgICAgICAvKiBVcGRhdGUgcmVnaXN0ZXJzICovCkBAIC00NTIsNyArNDUyLDggQEAg
c3RhdGljIHZvaWQgZHA4MzkzeF9kb190cmFuc21pdF9wYWNrZXRzKGRwODM5M3hTdGF0ZSAqcykK
ICAgICAgICAgICAgICAgICBsZW4gPSBzaXplb2Yocy0+dHhfYnVmZmVyKSAtIHR4X2xlbjsKICAg
ICAgICAgICAgIH0KICAgICAgICAgICAgIGFkZHJlc3Nfc3BhY2VfcncoJnMtPmFzLCBkcDgzOTN4
X3RzYShzKSwKLSAgICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCAmcy0+dHhf
YnVmZmVyW3R4X2xlbl0sIGxlbiwgMCk7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1F
TVRYQVRUUlNfVU5TUEVDSUZJRUQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzLT50
eF9idWZmZXJbdHhfbGVuXSwgbGVuLCBmYWxzZSk7CiAgICAgICAgICAgICB0eF9sZW4gKz0gbGVu
OwogCiAgICAgICAgICAgICBpKys7CkBAIC00NjEsNyArNDYyLDcgQEAgc3RhdGljIHZvaWQgZHA4
MzkzeF9kb190cmFuc21pdF9wYWNrZXRzKGRwODM5M3hTdGF0ZSAqcykKICAgICAgICAgICAgICAg
ICBzaXplID0gc2l6ZW9mKHVpbnQxNl90KSAqIDMgKiB3aWR0aDsKICAgICAgICAgICAgICAgICBh
ZGRyZXNzX3NwYWNlX3J3KCZzLT5hcywKICAgICAgICAgICAgICAgICAgICAgZHA4MzkzeF90dGRh
KHMpICsgc2l6ZW9mKHVpbnQxNl90KSAqICg0ICsgMyAqIGkpICogd2lkdGgsCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBzLT5kYXRhLCBz
aXplLCAwKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5T
UEVDSUZJRUQsIHMtPmRhdGEsIHNpemUsIGZhbHNlKTsKICAgICAgICAgICAgICAgICBzLT5yZWdz
W1NPTklDX1RTQTBdID0gZHA4MzkzeF9nZXQocywgd2lkdGgsIDApOwogICAgICAgICAgICAgICAg
IHMtPnJlZ3NbU09OSUNfVFNBMV0gPSBkcDgzOTN4X2dldChzLCB3aWR0aCwgMSk7CiAgICAgICAg
ICAgICAgICAgcy0+cmVnc1tTT05JQ19URlNdID0gZHA4MzkzeF9nZXQocywgd2lkdGgsIDIpOwpA
QCAtNDk2LDcgKzQ5Nyw3IEBAIHN0YXRpYyB2b2lkIGRwODM5M3hfZG9fdHJhbnNtaXRfcGFja2V0
cyhkcDgzOTN4U3RhdGUgKnMpCiAgICAgICAgIHNpemUgPSBzaXplb2YodWludDE2X3QpICogd2lk
dGg7CiAgICAgICAgIGFkZHJlc3Nfc3BhY2VfcncoJnMtPmFzLAogICAgICAgICAgICAgICAgICAg
ICAgICAgIGRwODM5M3hfdHRkYShzKSwKLSAgICAgICAgICAgICAgICAgICAgICAgICBNRU1UWEFU
VFJTX1VOU1BFQ0lGSUVELCBzLT5kYXRhLCBzaXplLCAxKTsKKyAgICAgICAgICAgICAgICAgICAg
ICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBzLT5kYXRhLCBzaXplLCB0cnVlKTsKIAogICAg
ICAgICBpZiAoIShzLT5yZWdzW1NPTklDX0NSXSAmIFNPTklDX0NSX0hUWCkpIHsKICAgICAgICAg
ICAgIC8qIFJlYWQgZm9vdGVyIG9mIHBhY2tldCAqLwpAQCAtNTA1LDcgKzUwNiw3IEBAIHN0YXRp
YyB2b2lkIGRwODM5M3hfZG9fdHJhbnNtaXRfcGFja2V0cyhkcDgzOTN4U3RhdGUgKnMpCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGRwODM5M3hfdHRkYShzKSArCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNpemVvZih1aW50MTZfdCkgKgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoNCArIDMgKiBzLT5yZWdzW1NPTklDX1RGQ10pICogd2lkdGgsCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsIHMtPmRhdGEsIHNpemUs
IDApOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVE
LCBzLT5kYXRhLCBzaXplLCBmYWxzZSk7CiAgICAgICAgICAgICBzLT5yZWdzW1NPTklDX0NUREFd
ID0gZHA4MzkzeF9nZXQocywgd2lkdGgsIDApICYgfjB4MTsKICAgICAgICAgICAgIGlmIChkcDgz
OTN4X2dldChzLCB3aWR0aCwgMCkgJiAweDEpIHsKICAgICAgICAgICAgICAgICAvKiBFT0wgZGV0
ZWN0ZWQgKi8KQEAgLTc2OCw3ICs3NjksNyBAQCBzdGF0aWMgc3NpemVfdCBkcDgzOTN4X3JlY2Vp
dmUoTmV0Q2xpZW50U3RhdGUgKm5jLCBjb25zdCB1aW50OF90ICogYnVmLAogICAgICAgICBzaXpl
ID0gc2l6ZW9mKHVpbnQxNl90KSAqIDEgKiB3aWR0aDsKICAgICAgICAgYWRkcmVzcyA9IGRwODM5
M3hfY3JkYShzKSArIHNpemVvZih1aW50MTZfdCkgKiA1ICogd2lkdGg7CiAgICAgICAgIGFkZHJl
c3Nfc3BhY2VfcncoJnMtPmFzLCBhZGRyZXNzLCBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELAotICAg
ICAgICAgICAgICAgICAgICAgICAgIHMtPmRhdGEsIHNpemUsIDApOworICAgICAgICAgICAgICAg
ICAgICAgICAgIHMtPmRhdGEsIHNpemUsIGZhbHNlKTsKICAgICAgICAgaWYgKGRwODM5M3hfZ2V0
KHMsIHdpZHRoLCAwKSAmIDB4MSkgewogICAgICAgICAgICAgLyogU3RpbGwgRU9MIDsgc3RvcCBy
ZWNlcHRpb24gKi8KICAgICAgICAgICAgIHJldHVybiAtMTsKQEAgLTc5MCw3ICs3OTEsNyBAQCBz
dGF0aWMgc3NpemVfdCBkcDgzOTN4X3JlY2VpdmUoTmV0Q2xpZW50U3RhdGUgKm5jLCBjb25zdCB1
aW50OF90ICogYnVmLAogICAgIGFkZHJlc3Nfc3BhY2Vfd3JpdGUoJnMtPmFzLCBhZGRyZXNzLCBN
RU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBidWYsIHJ4X2xlbik7CiAgICAgYWRkcmVzcyArPSByeF9s
ZW47CiAgICAgYWRkcmVzc19zcGFjZV9ydygmcy0+YXMsIGFkZHJlc3MsCi0gICAgICAgICAgICAg
ICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCAmY2hlY2tzdW0sIDQsIDEpOworICAgICAg
ICAgICAgICAgICAgICAgTUVNVFhBVFRSU19VTlNQRUNJRklFRCwgJmNoZWNrc3VtLCA0LCB0cnVl
KTsKICAgICByeF9sZW4gKz0gNDsKICAgICBzLT5yZWdzW1NPTklDX0NSQkExXSA9IGFkZHJlc3Mg
Pj4gMTY7CiAgICAgcy0+cmVnc1tTT05JQ19DUkJBMF0gPSBhZGRyZXNzICYgMHhmZmZmOwpAQCAt
ODE5LDEyICs4MjAsMTIgQEAgc3RhdGljIHNzaXplX3QgZHA4MzkzeF9yZWNlaXZlKE5ldENsaWVu
dFN0YXRlICpuYywgY29uc3QgdWludDhfdCAqIGJ1ZiwKICAgICBkcDgzOTN4X3B1dChzLCB3aWR0
aCwgNCwgcy0+cmVnc1tTT05JQ19SU0NdKTsgLyogc2VxX25vICovCiAgICAgc2l6ZSA9IHNpemVv
Zih1aW50MTZfdCkgKiA1ICogd2lkdGg7CiAgICAgYWRkcmVzc19zcGFjZV9ydygmcy0+YXMsIGRw
ODM5M3hfY3JkYShzKSwKLSAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJ
RUQsIHMtPmRhdGEsIHNpemUsIDEpOworICAgICAgICAgICAgICAgICAgICAgTUVNVFhBVFRSU19V
TlNQRUNJRklFRCwgcy0+ZGF0YSwgc2l6ZSwgdHJ1ZSk7CiAKICAgICAvKiBNb3ZlIHRvIG5leHQg
ZGVzY3JpcHRvciAqLwogICAgIHNpemUgPSBzaXplb2YodWludDE2X3QpICogd2lkdGg7CiAgICAg
YWRkcmVzc19zcGFjZV9ydygmcy0+YXMsIGRwODM5M3hfY3JkYShzKSArIHNpemVvZih1aW50MTZf
dCkgKiA1ICogd2lkdGgsCi0gICAgICAgICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lG
SUVELCBzLT5kYXRhLCBzaXplLCAwKTsKKyAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNf
VU5TUEVDSUZJRUQsIHMtPmRhdGEsIHNpemUsIGZhbHNlKTsKICAgICBzLT5yZWdzW1NPTklDX0xM
RkFdID0gZHA4MzkzeF9nZXQocywgd2lkdGgsIDApOwogICAgIGlmIChzLT5yZWdzW1NPTklDX0xM
RkFdICYgMHgxKSB7CiAgICAgICAgIC8qIEVPTCBkZXRlY3RlZCAqLwpAQCAtODM4LDcgKzgzOSw3
IEBAIHN0YXRpYyBzc2l6ZV90IGRwODM5M3hfcmVjZWl2ZShOZXRDbGllbnRTdGF0ZSAqbmMsIGNv
bnN0IHVpbnQ4X3QgKiBidWYsCiAgICAgICAgIH0KICAgICAgICAgcy0+ZGF0YVswXSA9IDA7CiAg
ICAgICAgIGFkZHJlc3Nfc3BhY2VfcncoJnMtPmFzLCBvZmZzZXQsIE1FTVRYQVRUUlNfVU5TUEVD
SUZJRUQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgcy0+ZGF0YSwgc2l6ZW9mKHVpbnQxNl90
KSwgMSk7CisgICAgICAgICAgICAgICAgICAgICAgICAgcy0+ZGF0YSwgc2l6ZW9mKHVpbnQxNl90
KSwgdHJ1ZSk7CiAgICAgICAgIHMtPnJlZ3NbU09OSUNfQ1JEQV0gPSBzLT5yZWdzW1NPTklDX0xM
RkFdOwogICAgICAgICBzLT5yZWdzW1NPTklDX0lTUl0gfD0gU09OSUNfSVNSX1BLVFJYOwogICAg
ICAgICBzLT5yZWdzW1NPTklDX1JTQ10gPSAocy0+cmVnc1tTT05JQ19SU0NdICYgMHhmZjAwKSB8
ICgoKHMtPnJlZ3NbU09OSUNfUlNDXSAmIDB4MDBmZikgKyAxKSAmIDB4MDBmZik7CmRpZmYgLS1n
aXQgYS9ody9uZXQvaTgyNTk2LmMgYi9ody9uZXQvaTgyNTk2LmMKaW5kZXggYTI5Mjk4NGUwNi4u
MTE1MzdmNzJkMSAxMDA2NDQKLS0tIGEvaHcvbmV0L2k4MjU5Ni5jCisrKyBiL2h3L25ldC9pODI1
OTYuYwpAQCAtMTQ5LDcgKzE0OSw3IEBAIHN0YXRpYyB2b2lkIGk4MjU5Nl90cmFuc21pdChJODI1
OTZTdGF0ZSAqcywgdWludDMyX3QgYWRkcikKICAgICAgICAgaWYgKHMtPm5pYyAmJiBsZW4pIHsK
ICAgICAgICAgICAgIGFzc2VydChsZW4gPD0gc2l6ZW9mKHMtPnR4X2J1ZmZlcikpOwogICAgICAg
ICAgICAgYWRkcmVzc19zcGFjZV9ydygmYWRkcmVzc19zcGFjZV9tZW1vcnksIHRiYSwKLSAgICAg
ICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBzLT50eF9idWZmZXIsIGxlbiwgMCk7
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsIHMt
PnR4X2J1ZmZlciwgbGVuLCBmYWxzZSk7CiAgICAgICAgICAgICBEQkcoUFJJTlRfUEtUSERSKCJT
ZW5kIiwgJnMtPnR4X2J1ZmZlcikpOwogICAgICAgICAgICAgREJHKHByaW50ZigiU2VuZGluZyAl
ZCBieXRlc1xuIiwgbGVuKSk7CiAgICAgICAgICAgICBxZW11X3NlbmRfcGFja2V0KHFlbXVfZ2V0
X3F1ZXVlKHMtPm5pYyksIHMtPnR4X2J1ZmZlciwgbGVuKTsKQEAgLTE3Myw3ICsxNzMsNyBAQCBz
dGF0aWMgdm9pZCBzZXRfaW5kaXZpZHVhbF9hZGRyZXNzKEk4MjU5NlN0YXRlICpzLCB1aW50MzJf
dCBhZGRyKQogICAgIG5jID0gcWVtdV9nZXRfcXVldWUocy0+bmljKTsKICAgICBtID0gcy0+Y29u
Zi5tYWNhZGRyLmE7CiAgICAgYWRkcmVzc19zcGFjZV9ydygmYWRkcmVzc19zcGFjZV9tZW1vcnks
IGFkZHIgKyA4LAotICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBtLCBFVEhfQUxFTiwg
MCk7CisgICAgICAgICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBtLCBFVEhf
QUxFTiwgZmFsc2UpOwogICAgIHFlbXVfZm9ybWF0X25pY19pbmZvX3N0cihuYywgbSk7CiAgICAg
dHJhY2VfaTgyNTk2X25ld19tYWMobmMtPmluZm9fc3RyKTsKIH0KQEAgLTE5Miw3ICsxOTIsNyBA
QCBzdGF0aWMgdm9pZCBzZXRfbXVsdGljYXN0X2xpc3QoSTgyNTk2U3RhdGUgKnMsIHVpbnQzMl90
IGFkZHIpCiAgICAgICAgIHVpbnQ4X3QgbXVsdGljYXN0X2FkZHJbRVRIX0FMRU5dOwogICAgICAg
ICBhZGRyZXNzX3NwYWNlX3J3KCZhZGRyZXNzX3NwYWNlX21lbW9yeSwKICAgICAgICAgICAgIGFk
ZHIgKyBpICogRVRIX0FMRU4sIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsCi0gICAgICAgICAgICBt
dWx0aWNhc3RfYWRkciwgRVRIX0FMRU4sIDApOworICAgICAgICAgICAgICAgICAgICAgICAgIG11
bHRpY2FzdF9hZGRyLCBFVEhfQUxFTiwgZmFsc2UpOwogICAgICAgICBEQkcocHJpbnRmKCJBZGQg
bXVsdGljYXN0IGVudHJ5ICIgTUFDX0ZNVCAiXG4iLAogICAgICAgICAgICAgICAgICAgICBNQUNf
QVJHKG11bHRpY2FzdF9hZGRyKSkpOwogICAgICAgICB1bnNpZ25lZCBtY2FzdF9pZHggPSAobmV0
X2NyYzMyKG11bHRpY2FzdF9hZGRyLCBFVEhfQUxFTikgJgpAQCAtMjYxLDcgKzI2MSw4IEBAIHN0
YXRpYyB2b2lkIGNvbW1hbmRfbG9vcChJODI1OTZTdGF0ZSAqcykKICAgICAgICAgICAgIGJ5dGVf
Y250ID0gTUlOKGJ5dGVfY250LCBzaXplb2Yocy0+Y29uZmlnKSk7CiAgICAgICAgICAgICAvKiBj
b3B5IGJ5dGVfY250IG1heC4gKi8KICAgICAgICAgICAgIGFkZHJlc3Nfc3BhY2VfcncoJmFkZHJl
c3Nfc3BhY2VfbWVtb3J5LCBzLT5jbWRfcCArIDgsCi0gICAgICAgICAgICAgICAgTUVNVFhBVFRS
U19VTlNQRUNJRklFRCwgcy0+Y29uZmlnLCBieXRlX2NudCwgMCk7CisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsIHMtPmNvbmZpZywgYnl0ZV9jbnQs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhbHNlKTsKICAgICAgICAgICAgIC8qIGNv
bmZpZyBieXRlIGFjY29yZGluZyB0byBwYWdlIDM1ZmYgKi8KICAgICAgICAgICAgIHMtPmNvbmZp
Z1syXSAmPSAweDgyOyAvKiBtYXNrIHZhbGlkIGJpdHMgKi8KICAgICAgICAgICAgIHMtPmNvbmZp
Z1syXSB8PSAweDQwOwpAQCAtNjQ3LDcgKzY0OCw3IEBAIHNzaXplX3QgaTgyNTk2X3JlY2VpdmUo
TmV0Q2xpZW50U3RhdGUgKm5jLCBjb25zdCB1aW50OF90ICpidWYsIHNpemVfdCBzeikKICAgICAg
ICAgICAgIGxlbiAtPSBudW07CiAgICAgICAgICAgICBpZiAobGVuID09IDApIHsgLyogY29weSBj
cmMgKi8KICAgICAgICAgICAgICAgICBhZGRyZXNzX3NwYWNlX3J3KCZhZGRyZXNzX3NwYWNlX21l
bW9yeSwgcmJhIC0gNCwKLSAgICAgICAgICAgICAgICAgICAgTUVNVFhBVFRSU19VTlNQRUNJRklF
RCwgY3JjX3B0ciwgNCwgMSk7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNRU1U
WEFUVFJTX1VOU1BFQ0lGSUVELCBjcmNfcHRyLCA0LCB0cnVlKTsKICAgICAgICAgICAgIH0KIAog
ICAgICAgICAgICAgbnVtIHw9IDB4NDAwMDsgLyogc2V0IEYgQklUICovCmRpZmYgLS1naXQgYS9o
dy9uZXQvbGFzaV9pODI1OTYuYyBiL2h3L25ldC9sYXNpX2k4MjU5Ni5jCmluZGV4IDQyN2IzZmJm
NzAuLjhiZmY0MTkzNzggMTAwNjQ0Ci0tLSBhL2h3L25ldC9sYXNpX2k4MjU5Ni5jCisrKyBiL2h3
L25ldC9sYXNpX2k4MjU5Ni5jCkBAIC01NSw4ICs1NSw4IEBAIHN0YXRpYyB2b2lkIGxhc2lfODI1
OTZfbWVtX3dyaXRlKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIGFkZHIsCiAgICAgICAgICAqIFByb3Zp
ZGVkIGZvciBTZWFCSU9TIG9ubHkuIFdyaXRlIE1BQyBvZiBOZXR3b3JrIGNhcmQgdG8gYWRkciBA
dmFsLgogICAgICAgICAgKiBOZWVkZWQgZm9yIHRoZSBQRENfTEFOX1NUQVRJT05fSURfUkVBRCBQ
REMgY2FsbC4KICAgICAgICAgICovCi0gICAgICAgIGFkZHJlc3Nfc3BhY2VfcncoJmFkZHJlc3Nf
c3BhY2VfbWVtb3J5LCB2YWwsCi0gICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBk
LT5zdGF0ZS5jb25mLm1hY2FkZHIuYSwgRVRIX0FMRU4sIDEpOworICAgICAgICBhZGRyZXNzX3Nw
YWNlX3J3KCZhZGRyZXNzX3NwYWNlX21lbW9yeSwgdmFsLCBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVE
LAorICAgICAgICAgICAgICAgICAgICAgICAgIGQtPnN0YXRlLmNvbmYubWFjYWRkci5hLCBFVEhf
QUxFTiwgdHJ1ZSk7CiAgICAgICAgIGJyZWFrOwogICAgIH0KIH0KZGlmZiAtLWdpdCBhL3Rhcmdl
dC9pMzg2L2h2Zi94ODZfbW11LmMgYi90YXJnZXQvaTM4Ni9odmYveDg2X21tdS5jCmluZGV4IDZh
NjIwNjQzYzEuLjQ1MWRjYzk4M2EgMTAwNjQ0Ci0tLSBhL3RhcmdldC9pMzg2L2h2Zi94ODZfbW11
LmMKKysrIGIvdGFyZ2V0L2kzODYvaHZmL3g4Nl9tbXUuYwpAQCAtODksNyArODksNyBAQCBzdGF0
aWMgYm9vbCBnZXRfcHRfZW50cnkoc3RydWN0IENQVVN0YXRlICpjcHUsIHN0cnVjdCBncHRfdHJh
bnNsYXRpb24gKnB0LAogCiAgICAgaW5kZXggPSBncHRfZW50cnkocHQtPmd2YSwgbGV2ZWwsIHBh
ZSk7CiAgICAgYWRkcmVzc19zcGFjZV9ydygmYWRkcmVzc19zcGFjZV9tZW1vcnksIGdwYSArIGlu
ZGV4ICogcHRlX3NpemUocGFlKSwKLSAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5T
UEVDSUZJRUQsICZwdGUsIHB0ZV9zaXplKHBhZSksIDApOworICAgICAgICAgICAgICAgICAgICAg
TUVNVFhBVFRSU19VTlNQRUNJRklFRCwgJnB0ZSwgcHRlX3NpemUocGFlKSwgZmFsc2UpOwogCiAg
ICAgcHQtPnB0ZVtsZXZlbCAtIDFdID0gcHRlOwogCkBAIC0yMzgsOCArMjM4LDggQEAgdm9pZCB2
bXhfd3JpdGVfbWVtKHN0cnVjdCBDUFVTdGF0ZSAqY3B1LCB0YXJnZXRfdWxvbmcgZ3ZhLCB2b2lk
ICpkYXRhLCBpbnQgYnl0ZXMKICAgICAgICAgaWYgKCFtbXVfZ3ZhX3RvX2dwYShjcHUsIGd2YSwg
JmdwYSkpIHsKICAgICAgICAgICAgIFZNX1BBTklDX0VYKCIlczogbW11X2d2YV90b19ncGEgJWxs
eCBmYWlsZWRcbiIsIF9fZnVuY19fLCBndmEpOwogICAgICAgICB9IGVsc2UgewotICAgICAgICAg
ICAgYWRkcmVzc19zcGFjZV9ydygmYWRkcmVzc19zcGFjZV9tZW1vcnksIGdwYSwgTUVNVFhBVFRS
U19VTlNQRUNJRklFRCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGF0YSwgY29weSwg
MSk7CisgICAgICAgICAgICBhZGRyZXNzX3NwYWNlX3J3KCZhZGRyZXNzX3NwYWNlX21lbW9yeSwg
Z3BhLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVE
LCBkYXRhLCBjb3B5LCB0cnVlKTsKICAgICAgICAgfQogCiAgICAgICAgIGJ5dGVzIC09IGNvcHk7
CkBAIC0yNjAsNyArMjYwLDcgQEAgdm9pZCB2bXhfcmVhZF9tZW0oc3RydWN0IENQVVN0YXRlICpj
cHUsIHZvaWQgKmRhdGEsIHRhcmdldF91bG9uZyBndmEsIGludCBieXRlcykKICAgICAgICAgICAg
IFZNX1BBTklDX0VYKCIlczogbW11X2d2YV90b19ncGEgJWxseCBmYWlsZWRcbiIsIF9fZnVuY19f
LCBndmEpOwogICAgICAgICB9CiAgICAgICAgIGFkZHJlc3Nfc3BhY2VfcncoJmFkZHJlc3Nfc3Bh
Y2VfbWVtb3J5LCBncGEsIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgZGF0YSwgY29weSwgMCk7CisgICAgICAgICAgICAgICAgICAgICAgICAgZGF0YSwg
Y29weSwgZmFsc2UpOwogCiAgICAgICAgIGJ5dGVzIC09IGNvcHk7CiAgICAgICAgIGd2YSArPSBj
b3B5OwotLSAKMi4yMS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
