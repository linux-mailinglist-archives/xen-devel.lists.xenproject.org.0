Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EB314F19D
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 18:52:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixaQW-0005v2-UC; Fri, 31 Jan 2020 17:49:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=euI0=3U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ixaQV-0005ua-Is
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 17:49:55 +0000
X-Inumbo-ID: 0e60f60e-4452-11ea-ad98-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e60f60e-4452-11ea-ad98-bc764e2007e4;
 Fri, 31 Jan 2020 17:49:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z7so9595729wrl.13
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2020 09:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cpuxdCZxCl63G/9gtJCixou5RUbbkJaTIj6MRYrokwk=;
 b=TxglAh6bFIrgJs/vD17L60YOOcjmIcgkebD8f8vhNKLEcjahLQzUElfVnOhPmLDTXK
 iTCrdFsu9ojznKuhIcFGb6aQyS+CW0cYDADdgx5oC7XfLfv+CmwPPcBufxWBzx1MmYOQ
 yAShKBdAMdX3Oag19nhxxtR2F7bJp66DxNa+2TvOxSqZswkpR88iilHyGTiKRWgarqv0
 U5iQ3yVsYerMSutKmH81Zz8szBs2bQCRrzLah7ra/RDhrspZ32HfCyAb68aMxLC1CxkA
 f3Z60V9i6rr5M09lxz20dA8Rx9fpfuVqdu6nhx2QXB6fkOpSYNKj5+4kBsCbixUuhsYw
 OCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cpuxdCZxCl63G/9gtJCixou5RUbbkJaTIj6MRYrokwk=;
 b=o+SZoMz+dX9f3Jj3EJZz8uu/hHheCBjMKYVFY5yumKMdxslinEXhCqkMMZ5ibULf1g
 vurr9PhV033WiDQ/+DVh/jU4prrbm9UUnOD2n4+CepAuzXBK20ZLbNvbLTnRA9d4NZw5
 KackGM75CnduB1+5+NCsOWgfKVUYmUxNN1OzBo0soZy0H9wHnf4+j7aFt14R4/PDbaGD
 71DGABuWUxz3lPnK8F8e8MpSjfcOn0PxPdxyqz4SOeb9FNZHGc/n1vm6NNBTVU5HzwZc
 /GOz5ZHYObFXG/CeLCg49LbnXkyT487A/am8LPy42TYh25djJ7bTMf8mwetZI3ts6yku
 m+kA==
X-Gm-Message-State: APjAAAWe9Vde4GqDWGtHv9j9NI6hM4VjDIZ1A0juORpoBMiXcNO5XGd+
 7WouVAxLGQfvTgZbQko4tt4uxOOclcQ=
X-Google-Smtp-Source: APXvYqzqLv/ITSSG8633ZAzMoen7M10g76yIC+L7oZ/pr4pSsebfKcMw43nrvYP26Vnxk2qVoA7crg==
X-Received: by 2002:a5d:61d1:: with SMTP id q17mr7373278wrv.156.1580492980199; 
 Fri, 31 Jan 2020 09:49:40 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 133sm4364352wmd.5.2020.01.31.09.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 09:49:39 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 31 Jan 2020 17:49:23 +0000
Message-Id: <20200131174930.31045-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131174930.31045-1-liuwe@microsoft.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 04/11] x86/hypervisor: provide
 hypervisor_fixup_e820
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

QW5kIGltcGxlbWVudCB0aGUgaG9vayBmb3IgWGVuIGd1ZXN0LgoKU2lnbmVkLW9mZi1ieTogV2Vp
IExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZTgyMC5jICAgICAg
ICAgICAgICAgICAgICB8IDQgKystLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAg
ICAgICAgfCA2ICsrKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyAgICAgICAgICAg
fCA3ICsrKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oIHwgNiAr
KysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZTgyMC5jIGIveGVuL2FyY2gveDg2L2U4MjAuYwpp
bmRleCAzODkyYzljZmI3Li4yMjE5YzYzODYxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZTgy
MC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKQEAgLTY5MCw4ICs2OTAsOCBAQCB1bnNpZ25l
ZCBsb25nIF9faW5pdCBpbml0X2U4MjAoY29uc3QgY2hhciAqc3RyLCBzdHJ1Y3QgZTgyMG1hcCAq
cmF3KQogCiAgICAgbWFjaGluZV9zcGVjaWZpY19tZW1vcnlfc2V0dXAocmF3KTsKIAotICAgIGlm
ICggcHZfc2hpbSApCi0gICAgICAgIHB2X3NoaW1fZml4dXBfZTgyMCgmZTgyMCk7CisgICAgaWYg
KCBjcHVfaGFzX2h5cGVydmlzb3IgKQorICAgICAgICBoeXBlcnZpc29yX2U4MjBfZml4dXAoJmU4
MjApOwogCiAgICAgcHJpbnRrKCIlcyBSQU0gbWFwOlxuIiwgc3RyKTsKICAgICBwcmludF9lODIw
X21lbW9yeV9tYXAoZTgyMC5tYXAsIGU4MjAubnJfbWFwKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5j
CmluZGV4IGU3MmM5MmZmZGYuLjVmZDQzM2M4ZDQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnZpc29yLmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwpA
QCAtNjYsNiArNjYsMTIgQEAgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKQogICAgICAgICBv
cHMtPnJlc3VtZSgpOwogfQogCit2b2lkIF9faW5pdCBoeXBlcnZpc29yX2U4MjBfZml4dXAoc3Ry
dWN0IGU4MjBtYXAgKmU4MjApCit7CisgICAgaWYgKCBvcHMgJiYgb3BzLT5lODIwX2ZpeHVwICkK
KyAgICAgICAgb3BzLT5lODIwX2ZpeHVwKGU4MjApOworfQorCiAvKgogICogTG9jYWwgdmFyaWFi
bGVzOgogICogbW9kZTogQwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4u
YyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKaW5kZXggZDUwZjg2YmFlNy4uNDVlNTRk
ZmJiYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYworKysgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCkBAIC0zMTYsMTEgKzMxNiwxOCBAQCBzdGF0aWMgdm9p
ZCByZXN1bWUodm9pZCkKICAgICAgICAgcHZfY29uc29sZV9pbml0KCk7CiB9CiAKK3N0YXRpYyB2
b2lkIF9faW5pdCBlODIwX2ZpeHVwKHN0cnVjdCBlODIwbWFwICplODIwKQoreworICAgIGlmICgg
cHZfc2hpbSApCisgICAgICAgIHB2X3NoaW1fZml4dXBfZTgyMChlODIwKTsKK30KKwogc3RhdGlj
IGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7CiAgICAgLm5hbWUgPSAiWGVuIiwK
ICAgICAuc2V0dXAgPSBzZXR1cCwKICAgICAuYXBfc2V0dXAgPSBhcF9zZXR1cCwKICAgICAucmVz
dW1lID0gcmVzdW1lLAorICAgIC5lODIwX2ZpeHVwID0gZTgyMF9maXh1cCwKIH07CiAKIGNvbnN0
IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqX19pbml0IHhnX3Byb2JlKHZvaWQpCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCmluZGV4IGI1MDM4NTRjNWIuLmI2NmNiMjgzMzMgMTAw
NjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCisrKyBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCkBAIC0xOSw2ICsxOSw4IEBACiAj
aWZuZGVmIF9fWDg2X0hZUEVSVklTT1JfSF9fCiAjZGVmaW5lIF9fWDg2X0hZUEVSVklTT1JfSF9f
CiAKKyNpbmNsdWRlIDxhc20vZTgyMC5oPgorCiBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgewogICAg
IC8qIE5hbWUgb2YgdGhlIGh5cGVydmlzb3IgKi8KICAgICBjb25zdCBjaGFyICpuYW1lOwpAQCAt
MjgsNiArMzAsOCBAQCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgewogICAgIGludCAoKmFwX3NldHVw
KSh2b2lkKTsKICAgICAvKiBSZXN1bWUgZnJvbSBzdXNwZW5zaW9uICovCiAgICAgdm9pZCAoKnJl
c3VtZSkodm9pZCk7CisgICAgLyogRml4IHVwIGU4MjAgbWFwICovCisgICAgdm9pZCAoKmU4MjBf
Zml4dXApKHN0cnVjdCBlODIwbWFwICplODIwKTsKIH07CiAKICNpZmRlZiBDT05GSUdfR1VFU1QK
QEAgLTM2LDYgKzQwLDcgQEAgY29uc3QgY2hhciAqaHlwZXJ2aXNvcl9wcm9iZSh2b2lkKTsKIHZv
aWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKTsKIGludCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQp
Owogdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKTsKK3ZvaWQgaHlwZXJ2aXNvcl9lODIwX2Zp
eHVwKHN0cnVjdCBlODIwbWFwICplODIwKTsKIAogI2Vsc2UKIApAQCAtNDYsNiArNTEsNyBAQCBz
dGF0aWMgaW5saW5lIGNvbnN0IGNoYXIgKmh5cGVydmlzb3JfcHJvYmUodm9pZCkgeyByZXR1cm4g
TlVMTDsgfQogc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCkgeyBBU1NF
UlRfVU5SRUFDSEFCTEUoKTsgfQogc3RhdGljIGlubGluZSBpbnQgaHlwZXJ2aXNvcl9hcF9zZXR1
cCh2b2lkKSB7IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyByZXR1cm4gMDsgfQogc3RhdGljIGlubGlu
ZSB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpIHsgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IH0K
K3N0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX2U4MjBfZml4dXAoc3RydWN0IGU4MjBtYXAg
KmU4MjApIHsgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IH0KIAogI2VuZGlmICAvKiBDT05GSUdfR1VF
U1QgKi8KIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
