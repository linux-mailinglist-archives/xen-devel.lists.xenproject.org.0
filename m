Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C219912446
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 23:45:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMJTB-0003Zw-9f; Thu, 02 May 2019 21:42:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o+so=TC=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hMJT9-0003Zq-Dg
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 21:42:19 +0000
X-Inumbo-ID: 223e3364-6d23-11e9-9a75-4ba27bc8b96e
Received: from mail-io1-f66.google.com (unknown [209.85.166.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 223e3364-6d23-11e9-9a75-4ba27bc8b96e;
 Thu, 02 May 2019 21:42:08 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u12so3598848iop.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 14:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X6EvVJ/w2bXkMpc64qDCumNgNlaHKshVM6UsuE6fF2c=;
 b=EzLfpBunH6zGEN2iXF/1DqOL/rvTMCAgLHzqAoxzCuNMCRVi+xnOh6hWRqUU+9kjWr
 w/4vs9CASZxjvBw4JFqA9VMzLz2An0YtuSM5/TNO/qgfZavmX3wibgRBMZN5E+T7dJeM
 2uGuGGtAS6ZaDbLHAydBhld3HDpZ4SpnH0J5Kjc8Km5MleQLxWs8Qws4J/sgLaoJfkrV
 c247UjwV1Uwh+sxZq3DJuRukKylxqcZ/RnBoVkDzfSAWnsqbxHb6uokO/jLjqBV/W6HS
 8XmjjkMPZ2QZPsHH1z6TB2HSQ/89klDKN02dDiF0Dc9Kwwi0XfSUbipceqgT/Idcmk4O
 sZOw==
X-Gm-Message-State: APjAAAXCoiryHxIW1POQpx8zJfIxqvtx+EpR+x+vfdluRCasPNm+xkf7
 5GN6Ljir5XvQ51RJKF5bgUr33EV7
X-Google-Smtp-Source: APXvYqwXJaE8RWC7P1OhieYaOu5NaSZTrx+iH3mORzWnONZP5Lq5zFuK3gNY7UTol8F15S2HkCX7Ng==
X-Received: by 2002:a05:6602:21d3:: with SMTP id
 c19mr4125521ioc.233.1556833327132; 
 Thu, 02 May 2019 14:42:07 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id v134sm180986ita.16.2019.05.02.14.42.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 14:42:05 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  2 May 2019 15:42:03 -0600
Message-Id: <20190502214203.17279-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/vm_event: add gdtr_base to the vm_event
 structure
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVjZWl2aW5nIHRoaXMgcmVnaXN0ZXIgaXMgdXNlZnVsIGZvciBpbnRyb3NwZWN0aW5nIDMyLWJp
dCBXaW5kb3dzIHdoZW4gdGhlCmV2ZW50IGJlaW5nIHRyYXBwZWQgaGFwcGVuZWQgd2hpbGUgaW4g
cmluZzMuCgpTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5j
b20+CkNjOiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CkNjOiBU
YW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ2M6IFJvZ2VyIFBhdSBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQp2MjogYWRkIGdkdHIgbGltaXQKLS0tCiB4ZW4v
YXJjaC94ODYvdm1fZXZlbnQuYyAgICAgICB8IDYgKysrKysrCiB4ZW4vaW5jbHVkZS9wdWJsaWMv
dm1fZXZlbnQuaCB8IDYgKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMgYi94
ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwppbmRleCA1MWMzNDkzYjFkLi41MmMyYTcxZmEwIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYworKysgYi94ZW4vYXJjaC94ODYvdm1fZXZl
bnQuYwpAQCAtMTc5LDYgKzE3OSwxMSBAQCBzdGF0aWMgdm9pZCB2bV9ldmVudF9wYWNrX3NlZ21l
bnRfcmVnaXN0ZXIoZW51bSB4ODZfc2VnbWVudCBzZWdtZW50LAogICAgICAgICByZWctPmVzX3Nl
bCA9IHNlZy5zZWw7CiAgICAgICAgIGJyZWFrOwogCisgICAgY2FzZSB4ODZfc2VnX2dkdHI6Cisg
ICAgICAgIHJlZy0+Z2R0cl9iYXNlID0gc2VnLmJhc2U7CisgICAgICAgIHJlZy0+Z2R0cl9saW1p
dCA9IHNlZy5saW1pdDsKKyAgICAgICAgYnJlYWs7CisKICAgICBkZWZhdWx0OgogICAgICAgICBB
U1NFUlRfVU5SRUFDSEFCTEUoKTsKICAgICB9CkBAIC0yMzgsNiArMjQzLDcgQEAgdm9pZCB2bV9l
dmVudF9maWxsX3JlZ3Modm1fZXZlbnRfcmVxdWVzdF90ICpyZXEpCiAgICAgdm1fZXZlbnRfcGFj
a19zZWdtZW50X3JlZ2lzdGVyKHg4Nl9zZWdfc3MsICZyZXEtPmRhdGEucmVncy54ODYpOwogICAg
IHZtX2V2ZW50X3BhY2tfc2VnbWVudF9yZWdpc3Rlcih4ODZfc2VnX2RzLCAmcmVxLT5kYXRhLnJl
Z3MueDg2KTsKICAgICB2bV9ldmVudF9wYWNrX3NlZ21lbnRfcmVnaXN0ZXIoeDg2X3NlZ19lcywg
JnJlcS0+ZGF0YS5yZWdzLng4Nik7CisgICAgdm1fZXZlbnRfcGFja19zZWdtZW50X3JlZ2lzdGVy
KHg4Nl9zZWdfZ2R0ciwgJnJlcS0+ZGF0YS5yZWdzLng4Nik7CiAKICAgICByZXEtPmRhdGEucmVn
cy54ODYuc2hhZG93X2dzID0gY3R4dC5zaGFkb3dfZ3M7CiAgICAgcmVxLT5kYXRhLnJlZ3MueDg2
LmRyNiA9IGN0eHQuZHI2OwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50
LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaAppbmRleCBiMmJhZmMwZDc3Li45NTkw
ODNkOGM0IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaAorKysgYi94
ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaApAQCAtMjksNyArMjksNyBAQAogCiAjaW5jbHVk
ZSAieGVuLmgiCiAKLSNkZWZpbmUgVk1fRVZFTlRfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAw
NAorI2RlZmluZSBWTV9FVkVOVF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDA1CiAKICNpZiBk
ZWZpbmVkKF9fWEVOX18pIHx8IGRlZmluZWQoX19YRU5fVE9PTFNfXykKIApAQCAtMTk4LDYgKzE5
OCw3IEBAIHN0cnVjdCB2bV9ldmVudF9yZWdzX3g4NiB7CiAgICAgdWludDY0X3QgbXNyX2VmZXI7
CiAgICAgdWludDY0X3QgbXNyX3N0YXI7CiAgICAgdWludDY0X3QgbXNyX2xzdGFyOworICAgIHVp
bnQ2NF90IGdkdHJfYmFzZTsKICAgICB1aW50MzJfdCBjc19iYXNlOwogICAgIHVpbnQzMl90IHNz
X2Jhc2U7CiAgICAgdWludDMyX3QgZHNfYmFzZTsKQEAgLTIxMSwxMyArMjEyLDE0IEBAIHN0cnVj
dCB2bV9ldmVudF9yZWdzX3g4NiB7CiAgICAgc3RydWN0IHZtX2V2ZW50X3g4Nl9zZWxlY3Rvcl9y
ZWcgZnM7CiAgICAgc3RydWN0IHZtX2V2ZW50X3g4Nl9zZWxlY3Rvcl9yZWcgZ3M7CiAgICAgdWlu
dDY0X3Qgc2hhZG93X2dzOworICAgIHVpbnQxNl90IGdkdHJfbGltaXQ7CiAgICAgdWludDE2X3Qg
Y3Nfc2VsOwogICAgIHVpbnQxNl90IHNzX3NlbDsKICAgICB1aW50MTZfdCBkc19zZWw7CiAgICAg
dWludDE2X3QgZXNfc2VsOwogICAgIHVpbnQxNl90IGZzX3NlbDsKICAgICB1aW50MTZfdCBnc19z
ZWw7Ci0gICAgdWludDMyX3QgX3BhZDsKKyAgICB1aW50MTZfdCBfcGFkOwogfTsKIAogLyoKLS0g
CjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
