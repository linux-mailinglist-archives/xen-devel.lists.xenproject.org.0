Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEDF1059FA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 19:53:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXrXh-00075X-A8; Thu, 21 Nov 2019 18:51:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4y/P=ZN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXrXf-00075H-HH
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 18:50:59 +0000
X-Inumbo-ID: d8aa9da2-0c8f-11ea-b678-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8aa9da2-0c8f-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 18:50:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x26so4632768wmk.4
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 10:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TWXlLe8IMt8Vs7gsl166Q3OWJ9VnuTA9ivSeF58Db7o=;
 b=Pvdmzp5f8fRFrvPbU0D9OD+MEjNkTmryCmBaKT+A1mWiEy6zYgiGbrgkfvu6+ib6do
 8h1yaSsRgTTCtHgpfmECB4FZJYeGOS7cwASHx2EMoAqvgglYewMbv2dlfmubiPykwT5i
 FDHirMkogVDsUvy81GZDhyYS9eAUEccq5apRDYvLWMCG/vYQWsVkDm5WOBGaU1anjGVQ
 vAPgTH4Rsz52BlkyPEzYH9YeXPK/fqfW95vNrtz7l4h/QLguNYnc4C3MyOy7c5gMOsOV
 /T3v/2ju6wOmv3nj4ViGSNp3EWuATKng6Hp44J0g5+3ha7RO0h0mz2MsEoY669ABaLxZ
 rfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TWXlLe8IMt8Vs7gsl166Q3OWJ9VnuTA9ivSeF58Db7o=;
 b=gluMyTKzzVb64OvVKlNDPKUUdmps1KhojGPfgo5FkneQo9JCx861BOwbdQ4a3sNMZv
 RknZgRvC2EOSoqNQGt9k/LhNzOWuLno7Ym1hBOjjCsCYE9j6htteCsxggk2WdpZoZrUz
 mnpx+bw2lj+NJB9KuIz8UJTvPvFFxdt14Ha7gtfNfew/uALyxBFxPVsKPAeSif72EebF
 ijjQDf+2rfQcKR5oWpsOxPQh5I8w4LESrZYStUxjOnQyRXc1AUPurez4yYSxsI1pxSCC
 JkNBR4j708k8eZXndhpu6r1DBfLSD4giyJPU8zhqlXBXlbqohSN905E8hgcsh5GqWt07
 G42Q==
X-Gm-Message-State: APjAAAXJgvd7EJcBsYkyyAi0mCbSjlwsTKSFeAG3DXnV6yAw9mT0nGoQ
 iti2dOHxAGcjNN6RjYLpcwIFJcyYJnI3KQ==
X-Google-Smtp-Source: APXvYqzcAwIjDfYAE9dxx/6OVltsNTt4lT61svhWwLga+wa9Q0feppnp4da7WQE245eMH0hXromtEA==
X-Received: by 2002:a05:600c:cf:: with SMTP id
 u15mr11982474wmm.60.1574362253803; 
 Thu, 21 Nov 2019 10:50:53 -0800 (PST)
Received: from debian.mshome.net (74.162.147.147.dyn.plus.net.
 [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id f24sm535776wmb.37.2019.11.21.10.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 10:50:53 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 18:50:42 +0000
Message-Id: <20191121185049.16666-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121185049.16666-1-liuwe@microsoft.com>
References: <20191121185049.16666-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 1/8] x86: introduce CONFIG_GUEST and move code
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
Z2VyLnBhdUBjaXRyaXguY29tPgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgotLS0KIHhlbi9hcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDQgKysrKwogeGVuL2FyY2gveDg2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MiArLQogeGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgNSAr
LS0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgNCAr
KysrCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L2h5cGVyY2FsbF9wYWdlLlMgfCAwCiB4
ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3B2aC1ib290LmMgICAgICAgfCAwCiB4ZW4vYXJj
aC94ODYvZ3Vlc3QveyA9PiB4ZW59L3hlbi5jICAgICAgICAgICAgfCAwCiA3IGZpbGVzIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
eGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZQogcmVuYW1lIHhlbi9hcmNoL3g4Ni9ndWVz
dC97ID0+IHhlbn0vaHlwZXJjYWxsX3BhZ2UuUyAoMTAwJSkKIHJlbmFtZSB4ZW4vYXJjaC94ODYv
Z3Vlc3QveyA9PiB4ZW59L3B2aC1ib290LmMgKDEwMCUpCiByZW5hbWUgeGVuL2FyY2gveDg2L2d1
ZXN0L3sgPT4geGVufS94ZW4uYyAoMTAwJSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvS2Nv
bmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IDI4YjNiNDY5MmEuLjg2N2RlODU3ZTgg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnCisrKyBiL3hlbi9hcmNoL3g4Ni9LY29u
ZmlnCkBAIC0xNjEsOCArMTYxLDEyIEBAIGNvbmZpZyBYRU5fQUxJR05fMk0KIAogZW5kY2hvaWNl
CiAKK2NvbmZpZyBHVUVTVAorCWJvb2wKKwogY29uZmlnIFhFTl9HVUVTVAogCWRlZl9ib29sIG4K
KwlzZWxlY3QgR1VFU1QKIAlwcm9tcHQgIlhlbiBHdWVzdCIKIAktLS1oZWxwLS0tCiAJICBTdXBw
b3J0IGZvciBYZW4gZGV0ZWN0aW5nIHdoZW4gaXQgaXMgcnVubmluZyB1bmRlciBYZW4uCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKaW5k
ZXggYTBiMmY0YWIxNS4uN2RhNWEyNjMxZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L01ha2Vm
aWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQpAQCAtMSw3ICsxLDcgQEAKIHN1YmRpci15
ICs9IGFjcGkKIHN1YmRpci15ICs9IGNwdQogc3ViZGlyLXkgKz0gZ2VuYXBpYwotc3ViZGlyLSQo
Q09ORklHX1hFTl9HVUVTVCkgKz0gZ3Vlc3QKK3N1YmRpci0kKENPTkZJR19HVUVTVCkgKz0gZ3Vl
c3QKIHN1YmRpci0kKENPTkZJR19IVk0pICs9IGh2bQogc3ViZGlyLXkgKz0gbW0KIHN1YmRpci0k
KENPTkZJR19YRU5PUFJPRikgKz0gb3Byb2ZpbGUKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZQppbmRleCAyNmZiNGIx
MDA3Li42ODA2ZjA0OTQ3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUK
KysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlCkBAIC0xLDQgKzEgQEAKLW9iai15ICs9
IGh5cGVyY2FsbF9wYWdlLm8KLW9iai15ICs9IHhlbi5vCi0KLW9iai1iaW4tJChDT05GSUdfUFZI
X0dVRVNUKSArPSBwdmgtYm9vdC5pbml0Lm8KK3N1YmRpci0kKENPTkZJR19YRU5fR1VFU1QpICs9
IHhlbgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZSBiL3hlbi9h
cmNoL3g4Ni9ndWVzdC94ZW4vTWFrZWZpbGUKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uMjZmYjRiMTAwNwotLS0gL2Rldi9udWxsCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVz
dC94ZW4vTWFrZWZpbGUKQEAgLTAsMCArMSw0IEBACitvYmoteSArPSBoeXBlcmNhbGxfcGFnZS5v
CitvYmoteSArPSB4ZW4ubworCitvYmotYmluLSQoQ09ORklHX1BWSF9HVUVTVCkgKz0gcHZoLWJv
b3QuaW5pdC5vCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJjYWxsX3BhZ2Uu
UyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vaHlwZXJjYWxsX3BhZ2UuUwpzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKcmVuYW1lIGZyb20geGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVyY2FsbF9wYWdlLlMK
cmVuYW1lIHRvIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vaHlwZXJjYWxsX3BhZ2UuUwpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3B2aC1ib290LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qv
eGVuL3B2aC1ib290LmMKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIHhlbi9hcmNo
L3g4Ni9ndWVzdC9wdmgtYm9vdC5jCnJlbmFtZSB0byB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3B2
aC1ib290LmMKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4uYyBiL3hlbi9hcmNo
L3g4Ni9ndWVzdC94ZW4veGVuLmMKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIHhl
bi9hcmNoL3g4Ni9ndWVzdC94ZW4uYwpyZW5hbWUgdG8geGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94
ZW4uYwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
