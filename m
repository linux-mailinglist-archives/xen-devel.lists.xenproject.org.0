Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C61151D68
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:40:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0GZ-0001QH-UX; Tue, 04 Feb 2020 15:37:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VjgO=3Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iz0GY-0001PP-9y
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:37:30 +0000
X-Inumbo-ID: 370f315a-4764-11ea-8396-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 370f315a-4764-11ea-8396-bc764e2007e4;
 Tue, 04 Feb 2020 15:37:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z9so11401217wrs.10
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RamMyxA7eCEhhsUkaM1ZIdMTbkYKaRV5qn3nRLFrXI8=;
 b=FxUCKDN1EFpDKVMer6ECw/dYqN3wYNYg9Jr9xTXc0mSUuBYp4h8XsTC8sZHF7XYRlI
 YuFmakjbWU/E8qpYtBDlIOrw0Ms91yGFvFaRIgVt5nV/8lSiKKGP8KNqlAN/lmbmw2h4
 fyN+LOIzaVbjb4r9EsSbisl9d0CGkwFtZ21aHdY9YKcwiVqFSRZ6j+qUDgtkULWxc//K
 WsKXt5eDRZaWbsJZadHYJOt44FJj79KYVSaugWQA+aOAeGPT3WrufCnyhtmRY49uGvIT
 UNnOCvE+Z3AfRMPxjs78dvIyIOBsUH9hside4tXwoA6bXozlrdpxZqyYIB7Q1X9nvf2W
 i8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RamMyxA7eCEhhsUkaM1ZIdMTbkYKaRV5qn3nRLFrXI8=;
 b=I8zVNCZtof5n51dWuy+rWOqe2xnjKzoy22JohfBMXqy/X86S8TKOQXHwWL3DSYZYiu
 DZuLcMvJHTsXuc1Wfa/CRUupuZz0dY97NGhVKlRO69a0RLdkXZffDjfrQDRTUqbP65Nt
 pnoTw6hldyDO2+5+Jpejcmu8ZTh01uP9zmFd0KOllVc5YS8YaWflUEHR4LmqqRFmsExv
 iZ4dfBJ3is8yu+bicDghFpXVZwY/+9TjcbjKOOSxX7BVAoAozsHVZgg1xiQvreCZdQ/T
 MhCW6HjHPfKtgmj7k1oLdlA48hiGVC59aE0mNx18yK6s7323zQGn8N89WmlsE7rqpD42
 p7zg==
X-Gm-Message-State: APjAAAUiVDiOFTAGFLKk2L6o+xod8q9wub9HdWtpcDvQkZ8nrro/SPVW
 tdE4J6HWLxAH1wXp4YZT0jTZkIzHe8o=
X-Google-Smtp-Source: APXvYqyXIv8AhYrQsvNztjZlBUrSpG0bafdrwper0ZIxiI8BNjj6TmSQJXehGFA9nc+/XbLpWRo98A==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr22563522wrm.293.1580830632917; 
 Tue, 04 Feb 2020 07:37:12 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 p26sm4067143wmc.24.2020.02.04.07.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 07:37:12 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue,  4 Feb 2020 15:36:58 +0000
Message-Id: <20200204153704.15934-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200204153704.15934-1-liuwe@microsoft.com>
References: <20200204153704.15934-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 04/10] x86/hypervisor: provide
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
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIGltcGxlbWVudCB0aGUgaG9vayBmb3IgWGVuIGd1ZXN0LgoKU2lnbmVkLW9mZi1ieTogV2Vp
IExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KLS0tCnY3OgoxLiBEcm9wIGJvZ3VzIEFTU0VSVF9VTlJFQUNIQUJMRSBm
cm9tIHN0dWIKMi4gQWRkIEphbidzIFJiLCBjb25zaWRlcmluZyAjMSBkb2Vzbid0IGNoYW5nZSB0
aGUgbWVhdCBvZiB0aGUgcGF0Y2gKLS0tCiB4ZW4vYXJjaC94ODYvZTgyMC5jICAgICAgICAgICAg
ICAgICAgICB8IDQgKystLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAg
fCA2ICsrKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyAgICAgICAgICAgfCA3ICsr
KysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oIHwgNiArKysrKysK
IDQgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvZTgyMC5jIGIveGVuL2FyY2gveDg2L2U4MjAuYwppbmRleCBi
OWY1ODljYWMzLi4xNjBmMDI5ZWRkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZTgyMC5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKQEAgLTY5MSw4ICs2OTEsOCBAQCB1bnNpZ25lZCBsb25n
IF9faW5pdCBpbml0X2U4MjAoY29uc3QgY2hhciAqc3RyLCBzdHJ1Y3QgZTgyMG1hcCAqcmF3KQog
CiAgICAgbWFjaGluZV9zcGVjaWZpY19tZW1vcnlfc2V0dXAocmF3KTsKIAotICAgIGlmICggcHZf
c2hpbSApCi0gICAgICAgIHB2X3NoaW1fZml4dXBfZTgyMCgmZTgyMCk7CisgICAgaWYgKCBjcHVf
aGFzX2h5cGVydmlzb3IgKQorICAgICAgICBoeXBlcnZpc29yX2U4MjBfZml4dXAoJmU4MjApOwog
CiAgICAgcHJpbnRrKCIlcyBSQU0gbWFwOlxuIiwgc3RyKTsKICAgICBwcmludF9lODIwX21lbW9y
eV9tYXAoZTgyMC5tYXAsIGU4MjAubnJfbWFwKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnZpc29yLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCmluZGV4
IGU3MmM5MmZmZGYuLjVmZDQzM2M4ZDQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnZpc29yLmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwpAQCAtNjYs
NiArNjYsMTIgQEAgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKQogICAgICAgICBvcHMtPnJl
c3VtZSgpOwogfQogCit2b2lkIF9faW5pdCBoeXBlcnZpc29yX2U4MjBfZml4dXAoc3RydWN0IGU4
MjBtYXAgKmU4MjApCit7CisgICAgaWYgKCBvcHMgJiYgb3BzLT5lODIwX2ZpeHVwICkKKyAgICAg
ICAgb3BzLT5lODIwX2ZpeHVwKGU4MjApOworfQorCiAvKgogICogTG9jYWwgdmFyaWFibGVzOgog
ICogbW9kZTogQwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKaW5kZXggMWNmMDk4ODZkYS4uNWE3ZjNjY2U0MiAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYworKysgYi94ZW4vYXJjaC94
ODYvZ3Vlc3QveGVuL3hlbi5jCkBAIC0zMjIsMTEgKzMyMiwxOCBAQCBzdGF0aWMgdm9pZCByZXN1
bWUodm9pZCkKICAgICAgICAgcHZfY29uc29sZV9pbml0KCk7CiB9CiAKK3N0YXRpYyB2b2lkIF9f
aW5pdCBlODIwX2ZpeHVwKHN0cnVjdCBlODIwbWFwICplODIwKQoreworICAgIGlmICggcHZfc2hp
bSApCisgICAgICAgIHB2X3NoaW1fZml4dXBfZTgyMChlODIwKTsKK30KKwogc3RhdGljIGNvbnN0
IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7CiAgICAgLm5hbWUgPSAiWGVuIiwKICAgICAu
c2V0dXAgPSBzZXR1cCwKICAgICAuYXBfc2V0dXAgPSBhcF9zZXR1cCwKICAgICAucmVzdW1lID0g
cmVzdW1lLAorICAgIC5lODIwX2ZpeHVwID0gZTgyMF9maXh1cCwKIH07CiAKIGNvbnN0IHN0cnVj
dCBoeXBlcnZpc29yX29wcyAqX19pbml0IHhnX3Byb2JlKHZvaWQpCmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
Z3Vlc3QvaHlwZXJ2aXNvci5oCmluZGV4IDY0MzgzZjBjM2QuLmFkZTEwZTc0ZWEgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCkBAIC0xOSw2ICsxOSw4IEBACiAjaWZuZGVm
IF9fWDg2X0hZUEVSVklTT1JfSF9fCiAjZGVmaW5lIF9fWDg2X0hZUEVSVklTT1JfSF9fCiAKKyNp
bmNsdWRlIDxhc20vZTgyMC5oPgorCiBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgewogICAgIC8qIE5h
bWUgb2YgdGhlIGh5cGVydmlzb3IgKi8KICAgICBjb25zdCBjaGFyICpuYW1lOwpAQCAtMjgsNiAr
MzAsOCBAQCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgewogICAgIGludCAoKmFwX3NldHVwKSh2b2lk
KTsKICAgICAvKiBSZXN1bWUgZnJvbSBzdXNwZW5zaW9uICovCiAgICAgdm9pZCAoKnJlc3VtZSko
dm9pZCk7CisgICAgLyogRml4IHVwIGU4MjAgbWFwICovCisgICAgdm9pZCAoKmU4MjBfZml4dXAp
KHN0cnVjdCBlODIwbWFwICplODIwKTsKIH07CiAKICNpZmRlZiBDT05GSUdfR1VFU1QKQEAgLTM2
LDYgKzQwLDcgQEAgY29uc3QgY2hhciAqaHlwZXJ2aXNvcl9wcm9iZSh2b2lkKTsKIHZvaWQgaHlw
ZXJ2aXNvcl9zZXR1cCh2b2lkKTsKIGludCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpOwogdm9p
ZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKTsKK3ZvaWQgaHlwZXJ2aXNvcl9lODIwX2ZpeHVwKHN0
cnVjdCBlODIwbWFwICplODIwKTsKIAogI2Vsc2UKIApAQCAtNDYsNiArNTEsNyBAQCBzdGF0aWMg
aW5saW5lIGNvbnN0IGNoYXIgKmh5cGVydmlzb3JfcHJvYmUodm9pZCkgeyByZXR1cm4gTlVMTDsg
fQogc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCkgeyBBU1NFUlRfVU5S
RUFDSEFCTEUoKTsgfQogc3RhdGljIGlubGluZSBpbnQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lk
KSB7IHJldHVybiAwOyB9CiBzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9p
ZCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgfQorc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlz
b3JfZTgyMF9maXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCkge30KIAogI2VuZGlmICAvKiBDT05G
SUdfR1VFU1QgKi8KIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
