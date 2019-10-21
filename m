Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D235DDF249
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 18:00:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMa3m-00089G-1e; Mon, 21 Oct 2019 15:57:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMa3k-000897-RI
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:57:28 +0000
X-Inumbo-ID: 78843960-f41b-11e9-beca-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78843960-f41b-11e9-beca-bc764e2007e4;
 Mon, 21 Oct 2019 15:57:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p4so14608084wrm.8
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2IQZ0I9t3yp3C2z2Yat7e79RK0J/6Y0pVIEi33A2QSI=;
 b=VruVKoyoi46WAAHCyYpv0dGzGVF1ZckzzUzsj95IsyeRj1/XGMx307+lSI+hc/7CAU
 2CikH0B8lc4LImyaGBxZOdMX/fVfaQQ7VHhrEisWdl1M9AhiCISV1atFai6pVaekYFA2
 FGXSTKUVKfwMivjWeD+rbtSaDCm2uj4pSWppIH1ak5dbgORbwAKMFJH3yFSrbcFtDs60
 zaliS1LEq4d0BiYhu/txo+b3EeP3ewK6JiB4PJnfaUPO/Le+gsihMUFTozn5dBY67m79
 bAFgUWnM3uPZH3V42u4lV/0welJ3E5bwMrfl0Fq7aolaHbOstJGseorIEjT9fKiW21Fb
 Y5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2IQZ0I9t3yp3C2z2Yat7e79RK0J/6Y0pVIEi33A2QSI=;
 b=Bzqk7IFqqVIE5vDvgF6tdnzdMY8wer8wEh09crvqgkYF0u9C0zFhxX7ocEKSjnPACx
 3y1mMlYnVUDL7kQcELc9khnVfo86YuisXgaiKdMDeadekalKMqfvOxKC1bYjpgXfi2//
 QhCyK8QvF8/efWqAshxE3WKRzvmBTXqrvlCFW2fWHr8x0UCK2dSJQl+q2AcFYbbai4WL
 ZuZ8GugJPAkypp5Q4y7bH6zIY/GbsVbkz6WLveFmg31LZQcFXYqq3D3b3b68HrZOwR6g
 FndcIZvhXOIz0akqoV8oBXgpJMTXvpQt6a+Dl7TYVZRlA1u/8k20aUM5jmnXjm+lnuPy
 Gp2A==
X-Gm-Message-State: APjAAAWUu9G6Q94bI5YuBYz5HxYkAACtWLLaNr0P3UF2bFv0uvet8g7a
 1mDUix3YcTWQJa1NW52LVPmtx18K7p8=
X-Google-Smtp-Source: APXvYqz/QpnhkeeMScCEg9ZNdUkKmo902bBYBew0ECK1PuASsgxTU2ay2Q+X5j/q5P7jRm1MdJlThg==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr10351123wrp.56.1571673442946; 
 Mon, 21 Oct 2019 08:57:22 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id x12sm5667410wru.93.2019.10.21.08.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 08:57:22 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 21 Oct 2019 16:57:10 +0100
Message-Id: <20191021155718.28653-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021155718.28653-1-liuwe@microsoft.com>
References: <20191021155718.28653-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v3 1/9] x86: introduce CONFIG_GUEST and
 move code
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WGVuIGlzIGFibGUgdG8gcnVuIGFzIGEgZ3Vlc3Qgb24gWGVuLiBXZSBwbGFuIHRvIG1ha2UgaXQg
YWJsZSB0byBydW4Kb24gSHlwZXItViBhcyB3ZWxsLgoKSW50cm9kdWNlIENPTkZJR19HVUVTVCB3
aGljaCBpcyBzZXQgdG8gdHJ1ZSBpZiBlaXRoZXIgcnVubmluZyBvbiBYZW4Kb3IgSHlwZXItViBp
cyBkZXNpcmVkLiBSZXN0cnVjdHVyZSBjb2RlIGhpZXJhcmNoeSBmb3IgbmV3IGNvZGUgdG8KY29t
ZS4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoKU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDQgKysrKwogeGVuL2FyY2gveDg2L01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMiArLQogeGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgIHwgNSArLS0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZSAgICAg
ICAgICAgICAgIHwgNCArKysrCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L2h5cGVyY2Fs
bF9wYWdlLlMgfCAwCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3B2aC1ib290LmMgICAg
ICAgfCAwCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3hlbi5jICAgICAgICAgICAgfCAw
CiA3IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZQogcmVuYW1lIHhl
bi9hcmNoL3g4Ni9ndWVzdC97ID0+IHhlbn0vaHlwZXJjYWxsX3BhZ2UuUyAoMTAwJSkKIHJlbmFt
ZSB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3B2aC1ib290LmMgKDEwMCUpCiByZW5hbWUg
eGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS94ZW4uYyAoMTAwJSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IDI4YjNiNDY5
MmEuLjg2N2RlODU3ZTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnCisrKyBiL3hl
bi9hcmNoL3g4Ni9LY29uZmlnCkBAIC0xNjEsOCArMTYxLDEyIEBAIGNvbmZpZyBYRU5fQUxJR05f
Mk0KIAogZW5kY2hvaWNlCiAKK2NvbmZpZyBHVUVTVAorCWJvb2wKKwogY29uZmlnIFhFTl9HVUVT
VAogCWRlZl9ib29sIG4KKwlzZWxlY3QgR1VFU1QKIAlwcm9tcHQgIlhlbiBHdWVzdCIKIAktLS1o
ZWxwLS0tCiAJICBTdXBwb3J0IGZvciBYZW4gZGV0ZWN0aW5nIHdoZW4gaXQgaXMgcnVubmluZyB1
bmRlciBYZW4uCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUgYi94ZW4vYXJjaC94
ODYvTWFrZWZpbGUKaW5kZXggMjQ0M2ZkMmNjNS4uOTlhMTJkMDA5MCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQpAQCAtMSw3ICsx
LDcgQEAKIHN1YmRpci15ICs9IGFjcGkKIHN1YmRpci15ICs9IGNwdQogc3ViZGlyLXkgKz0gZ2Vu
YXBpYwotc3ViZGlyLSQoQ09ORklHX1hFTl9HVUVTVCkgKz0gZ3Vlc3QKK3N1YmRpci0kKENPTkZJ
R19HVUVTVCkgKz0gZ3Vlc3QKIHN1YmRpci0kKENPTkZJR19IVk0pICs9IGh2bQogc3ViZGlyLXkg
Kz0gbW0KIHN1YmRpci0kKENPTkZJR19YRU5PUFJPRikgKz0gb3Byb2ZpbGUKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmls
ZQppbmRleCAyNmZiNGIxMDA3Li42ODA2ZjA0OTQ3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
Z3Vlc3QvTWFrZWZpbGUKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlCkBAIC0xLDQg
KzEgQEAKLW9iai15ICs9IGh5cGVyY2FsbF9wYWdlLm8KLW9iai15ICs9IHhlbi5vCi0KLW9iai1i
aW4tJChDT05GSUdfUFZIX0dVRVNUKSArPSBwdmgtYm9vdC5pbml0Lm8KK3N1YmRpci0kKENPTkZJ
R19YRU5fR1VFU1QpICs9IHhlbgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9N
YWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vTWFrZWZpbGUKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMjZmYjRiMTAwNwotLS0gL2Rldi9udWxsCisrKyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC94ZW4vTWFrZWZpbGUKQEAgLTAsMCArMSw0IEBACitvYmoteSArPSBo
eXBlcmNhbGxfcGFnZS5vCitvYmoteSArPSB4ZW4ubworCitvYmotYmluLSQoQ09ORklHX1BWSF9H
VUVTVCkgKz0gcHZoLWJvb3QuaW5pdC5vCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJjYWxsX3BhZ2UuUyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vaHlwZXJjYWxsX3BhZ2Uu
UwpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20geGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVyY2FsbF9wYWdlLlMKcmVuYW1lIHRvIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vaHlwZXJjYWxs
X3BhZ2UuUwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3B2aC1ib290LmMgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QveGVuL3B2aC1ib290LmMKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFt
ZSBmcm9tIHhlbi9hcmNoL3g4Ni9ndWVzdC9wdmgtYm9vdC5jCnJlbmFtZSB0byB4ZW4vYXJjaC94
ODYvZ3Vlc3QveGVuL3B2aC1ib290LmMKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94
ZW4uYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKc2ltaWxhcml0eSBpbmRleCAxMDAl
CnJlbmFtZSBmcm9tIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4uYwpyZW5hbWUgdG8geGVuL2FyY2gv
eDg2L2d1ZXN0L3hlbi94ZW4uYwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
