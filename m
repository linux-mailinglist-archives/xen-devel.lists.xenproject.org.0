Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5591A165E4E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:09:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lX8-0001Ax-0D; Thu, 20 Feb 2020 13:06:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lX6-00019C-AH
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:24 +0000
X-Inumbo-ID: cba945ba-53e1-11ea-ade5-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cba945ba-53e1-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582203983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvIA11c99fe9jZjyk6Bhj+dUz8AZyW6zBDm4tJjkdl0=;
 b=M6pP8130TCNN20jOqy/yn8zC+zWl35M2q5d8128XA/WZCZNUGa7y2tEeiPi3qwlcK6sc5I
 MZbuAGtONIxUUxJUumaXJU1cFw+0BwNRS6WwRFl2Uhb10z4h8V8D3kK6d++/Y4/OWRgq8L
 mu6uFapgRXE0op2MDiyuI5a8b6mCxhk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-wGoi-NvVOyaTGx9Og7Am4w-1; Thu, 20 Feb 2020 08:06:21 -0500
Received: by mail-wr1-f71.google.com with SMTP id z15so1725308wrw.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:06:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pVKWVWwp9TVJU5qM7Beut+kG2DV5MFLYTF1Kx3cmH3A=;
 b=qw9yk/gU0WhQ8MwxyqFLupkFD2e3HbXbr8IBKdUrn4YXmc6jH8QGoIDm0RfcJXWrSh
 173hHkqgpTd3zUs5mjNbtZDLCKKtrREzspM4AiDD9ExH1ud4aTTybT4ndcetVXk1zXFq
 Kakrs92UjlNnaf3moR5Yth4CjspfP0YFScfBIIucbCW1Q67+jndu6RehKGV6eJ8xUyzP
 4fOo0SYNyfeppU2wbEBbCoemWhMhgM4AaUSNapHRDvC6eqqWlQWHgjwMfbh1kGtfYGUq
 ybPRqF92n4MiCauqP6uuj3fHSswhW07nL1gg7LH9oG0Xcx4eFcc4YSE6Fc3/zlOgWpGR
 6HSQ==
X-Gm-Message-State: APjAAAUIGoDqVcEZxZyvRQvx/XhIrqhqo5tUK3bxsVQXacntnNOIxltE
 ev0+gOn+pqybQLbezWOUq8Rw4aZfumNWDTitcxae395AT3SV+4B7I/rdUu7W9Pk91tUBHz0q/2M
 VRH/QNGNlS+c5M2xMJPiVw8n4alw=
X-Received: by 2002:a5d:4687:: with SMTP id u7mr40881706wrq.176.1582203980202; 
 Thu, 20 Feb 2020 05:06:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfQdFudKu/IvbI9dQMK95qUdVs2MjCpL2sBTVu5yezv4G1pdvxpKJvTb+aMe+m36JC5h7NRg==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr40881691wrq.176.1582203979939; 
 Thu, 20 Feb 2020 05:06:19 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:35 +0100
Message-Id: <20200220130548.29974-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: wGoi-NvVOyaTGx9Og7Am4w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 07/20] hw/net: Avoid casting non-const
 pointer, use address_space_write()
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

VGhlIE5ldFJlY2VpdmUgcHJvdG90eXBlIGdldHMgYSBjb25zdCBidWZmZXI6CgogIHR5cGVkZWYg
c3NpemVfdCAoTmV0UmVjZWl2ZSkoTmV0Q2xpZW50U3RhdGUgKiwgY29uc3QgdWludDhfdCAqLCBz
aXplX3QpOwoKV2UgYWxyZWFkeSBoYXZlIHRoZSBhZGRyZXNzX3NwYWNlX3dyaXRlKCkgbWV0aG9k
IHRvIHdyaXRlIGEgY29uc3QKYnVmZmVyIHRvIGFuIGFkZHJlc3Mgc3BhY2UuIFVzZSBpdCB0byBh
dm9pZDoKCiAgaHcvbmV0L2k4MjU5Ni5jOiBJbiBmdW5jdGlvbiDigJhpODI1OTZfcmVjZWl2ZeKA
mToKICBody9uZXQvaTgyNTk2LmM6NjQ0OjU0OiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCA0IG9m
IOKAmGFkZHJlc3Nfc3BhY2VfcnfigJkgZGlzY2FyZHMg4oCYY29uc3TigJkgcXVhbGlmaWVyIGZy
b20gcG9pbnRlciB0YXJnZXQgdHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlmaWVyc10KClRo
aXMgY29tbWl0IHdhcyBwcm9kdWNlZCB3aXRoIHRoZSBpbmNsdWRlZCBDb2NjaW5lbGxlIHNjcmlw
dApzY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC4KClNpZ25lZC1vZmYtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBzY3JpcHRzL2NvY2Np
bmVsbGUvZXhlY19yd19jb25zdC5jb2NjaSB8IDE0ICsrKysrKysrKysrKysrCiBody9uZXQvZHA4
MzkzeC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAzICstLQogaHcvbmV0L2k4MjU5Ni5jICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jb2NjaW5lbGxl
L2V4ZWNfcndfY29uc3QuY29jY2kgYi9zY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5j
b2NjaQppbmRleCBhMDA1NGYwMDlkLi40ZTQ1OWQ5MTViIDEwMDY0NAotLS0gYS9zY3JpcHRzL2Nv
Y2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2NjaQorKysgYi9zY3JpcHRzL2NvY2NpbmVsbGUvZXhl
Y19yd19jb25zdC5jb2NjaQpAQCAtMSw2ICsxLDIwIEBACiAvLyBVc2FnZToKIC8vICBzcGF0Y2gg
LS1zcC1maWxlIHNjcmlwdHMvY29jY2luZWxsZS9leGVjX3J3X2NvbnN0LmNvY2NpIC0tZGlyIC4g
LS1pbi1wbGFjZQogCisvLyBVc2UgYWRkcmVzc19zcGFjZV93cml0ZSBpbnN0ZWFkIG9mIGNhc3Rp
bmcgdG8gbm9uLWNvbnN0CitAQAordHlwZSBUOworY29uc3QgVCAqVjsKK2V4cHJlc3Npb24gRTEs
IEUyLCBFMywgRTQ7CitAQAorKAorLSBhZGRyZXNzX3NwYWNlX3J3KEUxLCBFMiwgRTMsIChUICop
ViwgRTQsIDEpCisrIGFkZHJlc3Nfc3BhY2Vfd3JpdGUoRTEsIEUyLCBFMywgViwgRTQpCit8Cist
IGFkZHJlc3Nfc3BhY2VfcncoRTEsIEUyLCBFMywgKHZvaWQgKilWLCBFNCwgMSkKKysgYWRkcmVz
c19zcGFjZV93cml0ZShFMSwgRTIsIEUzLCBWLCBFNCkKKykKKwogLy8gUmVtb3ZlIHVzZWxlc3Mg
Y2FzdAogQEAKIGV4cHJlc3Npb24gRTEsIEUyLCBFMywgRTQ7CmRpZmYgLS1naXQgYS9ody9uZXQv
ZHA4MzkzeC5jIGIvaHcvbmV0L2RwODM5M3guYwppbmRleCBhMTM0ZDQzMWFlLi41ODBhZTQ0Mzdl
IDEwMDY0NAotLS0gYS9ody9uZXQvZHA4MzkzeC5jCisrKyBiL2h3L25ldC9kcDgzOTN4LmMKQEAg
LTc4Nyw4ICs3ODcsNyBAQCBzdGF0aWMgc3NpemVfdCBkcDgzOTN4X3JlY2VpdmUoTmV0Q2xpZW50
U3RhdGUgKm5jLCBjb25zdCB1aW50OF90ICogYnVmLAogICAgIC8qIFB1dCBwYWNrZXQgaW50byBS
QkEgKi8KICAgICBEUFJJTlRGKCJSZWNlaXZlIHBhY2tldCBhdCAlMDh4XG4iLCBkcDgzOTN4X2Ny
YmEocykpOwogICAgIGFkZHJlc3MgPSBkcDgzOTN4X2NyYmEocyk7Ci0gICAgYWRkcmVzc19zcGFj
ZV9ydygmcy0+YXMsIGFkZHJlc3MsCi0gICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsICh1
aW50OF90ICopYnVmLCByeF9sZW4sIDEpOworICAgIGFkZHJlc3Nfc3BhY2Vfd3JpdGUoJnMtPmFz
LCBhZGRyZXNzLCBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBidWYsIHJ4X2xlbik7CiAgICAgYWRk
cmVzcyArPSByeF9sZW47CiAgICAgYWRkcmVzc19zcGFjZV9ydygmcy0+YXMsIGFkZHJlc3MsCiAg
ICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsICh1aW50OF90ICopJmNoZWNrc3VtLCA0LCAx
KTsKZGlmZiAtLWdpdCBhL2h3L25ldC9pODI1OTYuYyBiL2h3L25ldC9pODI1OTYuYwppbmRleCAz
YTBlMWVjNGMwLi5hMjkyOTg0ZTA2IDEwMDY0NAotLS0gYS9ody9uZXQvaTgyNTk2LmMKKysrIGIv
aHcvbmV0L2k4MjU5Ni5jCkBAIC02NDAsOCArNjQwLDggQEAgc3NpemVfdCBpODI1OTZfcmVjZWl2
ZShOZXRDbGllbnRTdGF0ZSAqbmMsIGNvbnN0IHVpbnQ4X3QgKmJ1Ziwgc2l6ZV90IHN6KQogICAg
ICAgICAgICAgfQogICAgICAgICAgICAgcmJhID0gZ2V0X3VpbnQzMihyYmQgKyA4KTsKICAgICAg
ICAgICAgIC8qIHByaW50ZigicmJhIGlzIDB4JXhcbiIsIHJiYSk7ICovCi0gICAgICAgICAgICBh
ZGRyZXNzX3NwYWNlX3J3KCZhZGRyZXNzX3NwYWNlX21lbW9yeSwgcmJhLAotICAgICAgICAgICAg
ICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsICh2b2lkICopYnVmLCBudW0sIDEpOworICAgICAg
ICAgICAgYWRkcmVzc19zcGFjZV93cml0ZSgmYWRkcmVzc19zcGFjZV9tZW1vcnksIHJiYSwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUVNVFhBVFRSU19VTlNQRUNJRklFRCwgYnVm
LCBudW0pOwogICAgICAgICAgICAgcmJhICs9IG51bTsKICAgICAgICAgICAgIGJ1ZiArPSBudW07
CiAgICAgICAgICAgICBsZW4gLT0gbnVtOwotLSAKMi4yMS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
