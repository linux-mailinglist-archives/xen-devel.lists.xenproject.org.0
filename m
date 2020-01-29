Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6453114D1DD
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 21:23:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwtqG-00071c-5s; Wed, 29 Jan 2020 20:21:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bu37=3S=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iwtqF-00070e-13
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 20:21:39 +0000
X-Inumbo-ID: d73435f2-42d4-11ea-a933-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d73435f2-42d4-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 20:20:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z7so980299wrl.13
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 12:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rh3eILGi6Pt9jrhFdjXvi2DHTn3SFwkuAe2IR7Kx73I=;
 b=cqrZ/HK5s+9C95BpQsykUZBvq8Jcim3QbrSzcndE9FH3xdhaBPs4L6BJmoYJC3d7/Z
 Dbt4ztw6r5vPp4gvUbTqUBGIJoXQe46JUs5QtwE57SNpd0vjaPG3ezrmD6N+1KFqGkFE
 QiAjcCnseqzi4eWf4VXCaJPTfBXBnAtdox4S534yJOPCp7f/fKZcIzqgV3jbbw8Xap4L
 6Cz7OFPifeLBMuDlG9q7jhMyLnD3pphXpONedrCx+/7vzXg0LAjJd2xIuwxF6eEVMEAc
 MjZto6Qrr6FCq7cFGPproX+qabF/vC8gpbal49qxWjSTIkGJWidrqFBq92dPNjQHzQg4
 F45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Rh3eILGi6Pt9jrhFdjXvi2DHTn3SFwkuAe2IR7Kx73I=;
 b=EGhzElnZaiV2zHBpbPz+7YMISLfR/KNTr7N5nQtVt3+rPUhS4l3ntCy+h1kKdKYSfZ
 gh6Gpx0jkfV2inkQlZEpZ58LhikjYALsRfLhy4eHPGPe6Iaf9Pv6kSkRpbIvbyw7N7OT
 TN0QDnE6Ydkk8XtiGSaRrwIcc3DEi2gfZyJ7hYGpTaH/i7QqOrsP3mU32yKyraPXhjgv
 tuzF9ZeUUHi8fXmRCZ68+PyffoF3AR92hgO0rrSPX7unR/8SJRH2+SWDOTnc7/ibz7w7
 hI6AXVsC1UVPJ+Fh5/eX2oYSHd63/wtprxztMD4rla3ibeiVLUUwiFpA84TJHPOzoDzZ
 WFCg==
X-Gm-Message-State: APjAAAWe34p14xD+fTju20EaTM2IKN7jV+NyI38zQQE6dx1qW1AUOxfb
 vst+NkCbrTUNnFjDdywIBSMDpnUvnBk=
X-Google-Smtp-Source: APXvYqwijMIDoAbcJTodCytjbe3qLDZnoi+0PHbIxiYk2xgC9j6ATtj966TGNyNQzCsXnfAc91IACg==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr552432wrt.367.1580329249422;
 Wed, 29 Jan 2020 12:20:49 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 a22sm3564115wmd.20.2020.01.29.12.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 12:20:49 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 20:20:34 +0000
Message-Id: <20200129202034.15052-13-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129202034.15052-1-liuwe@microsoft.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 12/12] x86/hyperv: setup VP assist page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VlAgYXNzaXN0IHBhZ2UgaXMgcmF0aGVyIGltcG9ydGFudCBhcyB3ZSBuZWVkIHRvIHRvZ2dsZSBz
b21lIGJpdHMgaW4gaXQKZm9yIGVmZmljaWVudCBuZXN0ZWQgdmlydHVhbGlzYXRpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KdjU6CjEuIERlYWwg
d2l0aCBlcnJvciBwcm9wZXJseSBpbnN0ZWFkIG9mIGFsd2F5cyBwYW5pY2tpbmcKMi4gU3dhcCBw
ZXJjcHUgdmFyaWFibGVzIGRlY2xhcmF0aW9ucycgbG9jYXRpb24KCnY0OgoxLiBVc2UgcHJpdmF0
ZS5oCjIuIFByZXZlbnQgbGVhawoKdjM6CjEuIFVzZSB4ZW5oZWFwIHBhZ2UKMi4gRHJvcCBzZXRf
dnBfYXNzaXN0Cgp2MjoKMS4gVXNlIEhWX0hZUF9QQUdFX1NISUZUIGluc3RlYWQKLS0tCiB4ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICB8IDQ0ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKystCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaCB8ICAxICsKIDIg
ZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L2h5cGVydi5jCmluZGV4IGFmMGQ2ZWQ2OTIuLmJjNDBhM2QzMzggMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKKysrIGIveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwpAQCAtMzEsNiArMzEsNyBAQAogCiBzdHJ1Y3QgbXNfaHlw
ZXJ2X2luZm8gX19yZWFkX21vc3RseSBtc19oeXBlcnY7CiBERUZJTkVfUEVSX0NQVV9SRUFEX01P
U1RMWSh2b2lkICosIGh2X3BjcHVfaW5wdXRfcGFnZSk7CitERUZJTkVfUEVSX0NQVV9SRUFEX01P
U1RMWSh2b2lkICosIGh2X3ZwX2Fzc2lzdCk7CiBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh1
bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKIAogc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1
ZXN0X2lkKHZvaWQpCkBAIC0xNTUsMTYgKzE1Niw1NyBAQCBzdGF0aWMgaW50IHNldHVwX2h5cGVy
Y2FsbF9wY3B1X2FyZyh2b2lkKQogICAgIHJldHVybiAwOwogfQogCitzdGF0aWMgaW50IHNldHVw
X3ZwX2Fzc2lzdCh2b2lkKQoreworICAgIHZvaWQgKm1hcHBpbmc7CisgICAgdWludDY0X3QgdmFs
OworCisgICAgbWFwcGluZyA9IHRoaXNfY3B1KGh2X3ZwX2Fzc2lzdCk7CisKKyAgICBpZiAoICFt
YXBwaW5nICkKKyAgICB7CisgICAgICAgIG1hcHBpbmcgPSBhbGxvY194ZW5oZWFwX3BhZ2UoKTsK
KyAgICAgICAgaWYgKCAhbWFwcGluZyApCisgICAgICAgIHsKKyAgICAgICAgICAgIHByaW50aygi
RmFpbGVkIHRvIGFsbG9jYXRlIHZwX2Fzc2lzdCBwYWdlIGZvciBDUFUldVxuIiwKKyAgICAgICAg
ICAgICAgICAgICBzbXBfcHJvY2Vzc29yX2lkKCkpOworICAgICAgICAgICAgcmV0dXJuIC1FTk9N
RU07CisgICAgICAgIH0KKworICAgICAgICBjbGVhcl9wYWdlKG1hcHBpbmcpOworICAgICAgICB0
aGlzX2NwdShodl92cF9hc3Npc3QpID0gbWFwcGluZzsKKyAgICB9CisKKyAgICB2YWwgPSAodmly
dF90b19tZm4obWFwcGluZykgPDwgSFZfSFlQX1BBR0VfU0hJRlQpCisgICAgICAgIHwgSFZfWDY0
X01TUl9WUF9BU1NJU1RfUEFHRV9FTkFCTEU7CisgICAgd3Jtc3JsKEhWX1g2NF9NU1JfVlBfQVNT
SVNUX1BBR0UsIHZhbCk7CisKKyAgICByZXR1cm4gMDsKK30KKwogc3RhdGljIHZvaWQgX19pbml0
IHNldHVwKHZvaWQpCiB7CiAgICAgc2V0dXBfaHlwZXJjYWxsX3BhZ2UoKTsKKwogICAgIGlmICgg
c2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKCkgKQogICAgICAgICBwYW5pYygiSHlwZXJjYWxsIHBl
cmNwdSBhcmcgc2V0dXAgZmFpbGVkXG4iKTsKKworICAgIGlmICggc2V0dXBfdnBfYXNzaXN0KCkg
KQorICAgICAgICBwYW5pYygiVlAgYXNzaXN0IHBhZ2Ugc2V0dXAgZmFpbGVkXG4iKTsKIH0KIAog
c3RhdGljIGludCBhcF9zZXR1cCh2b2lkKQogewotICAgIHJldHVybiBzZXR1cF9oeXBlcmNhbGxf
cGNwdV9hcmcoKTsKKyAgICBpbnQgcmM7CisKKyAgICByYyA9IHNldHVwX2h5cGVyY2FsbF9wY3B1
X2FyZygpOworICAgIGlmICggcmMgKQorICAgICAgICBnb3RvIG91dDsKKworICAgIHJjID0gc2V0
dXBfdnBfYXNzaXN0KCk7CisKKyBvdXQ6CisgICAgcmV0dXJuIHJjOwogfQogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wcyA9IHsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2
YXRlLmgKaW5kZXggYzFjMjQzMWVmZi4uZmNkZGM0NzU0NCAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVy
di9wcml2YXRlLmgKQEAgLTI1LDYgKzI1LDcgQEAKICNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+CiAK
IERFQ0xBUkVfUEVSX0NQVSh2b2lkICosIGh2X3BjcHVfaW5wdXRfcGFnZSk7CitERUNMQVJFX1BF
Ul9DUFUodm9pZCAqLCBodl92cF9hc3Npc3QpOwogREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGlu
dCwgaHZfdnBfaW5kZXgpOwogCiAjZW5kaWYgLyogX19YRU5fSFlQRVJWX1BSSVZJQVRFX0hfXyAg
Ki8KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
