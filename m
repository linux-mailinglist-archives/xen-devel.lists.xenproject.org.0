Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070AB10DD8D
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2019 13:00:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ib1Nk-0004j5-JS; Sat, 30 Nov 2019 11:57:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rqrT=ZW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ib1Nj-0004j0-J8
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2019 11:57:47 +0000
X-Inumbo-ID: 9d6a9eec-1368-11ea-9db0-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d6a9eec-1368-11ea-9db0-bc764e2007e4;
 Sat, 30 Nov 2019 11:57:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b18so38143851wrj.8
 for <xen-devel@lists.xenproject.org>; Sat, 30 Nov 2019 03:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1f/6ovzsUnbptzU+DDt1DpPbxK4REdzWx0FX+36JZiI=;
 b=tM84jszeXAgJmuS9cI4RAHa5XBSm7iwI4IQHzGxWwdobKzRy92wohrHXZFSOdT3UQ4
 /XMfQVgC5AGnaTfwqQ8EEQEriah4KA/Z7VQTs1Ef8wxPNDqLNCLCnovqoGtCkobTALr3
 fAuC02pLIvPHSzdfvZ7aQEmIRicLO3whK6h/0VMjCevQF935Ve2FoJDEm2jSOILO4pFh
 YfpZTWGgn6XvHjgz+0ECh7wa7dzpMh1inkSEQdHH3PCNJmSbGnCGLeXBg9xRGG5i3XW5
 3KK4tetmsEwYj0nQBvw5oQjbf1pkX2aQxjN3Aiu5z5f+SDv7mbfi5g4xiVQfaQsLu0fb
 bs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1f/6ovzsUnbptzU+DDt1DpPbxK4REdzWx0FX+36JZiI=;
 b=f1QYHdnnV3NjIGLuWHNBS+qA2sy/CDQKhyJdR5wXllGS83DYDTWsoEVSg6agZJae9G
 bmYHIaWRgSm/BSE5u++Kn2U12vStFCZrY4UIk2uclGmaXe0PTaRubML58fNVbj6/fhI5
 zI3fEIuWdvcQ0l27TPbP1wayBBSPqBJ9mFDxn1cd6SUUh16mnovjTzqrFaoGMSmtJ8dM
 rOPgTbYszKxdIaH5A+CSbdIpY3UV/lZWO3enC9Q0uKJQkXbh3WDM7JV7Vhn15FZS8mWm
 nCDyVDlZoUaWyqjGrmg5vw3GwJaw71IMVonm52H6xbTwkSW5GVzQl0GyNjxT1Pkdzdz3
 GFdQ==
X-Gm-Message-State: APjAAAW5utVLxhMjyRTX3X7quP6QK/Rk0CFSfXC7k4/xA9GYhdPmtp7c
 mXk5o3ztdP5gnpCgUY4xW/uQljIuEb0=
X-Google-Smtp-Source: APXvYqyyIeSFipY2L5zCrvjVyGV22e0fJLzKmD2ox0/iof9L1BYxpz68ozcPJ+7h0tr26Y1G/ABuhw==
X-Received: by 2002:a05:6000:1286:: with SMTP id
 f6mr5211146wrx.44.1575115062180; 
 Sat, 30 Nov 2019 03:57:42 -0800 (PST)
Received: from debian.mshome.net (122.163.200.146.dyn.plus.net.
 [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id z11sm2227769wrt.82.2019.11.30.03.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 03:57:41 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sat, 30 Nov 2019 11:57:30 +0000
Message-Id: <20191130115737.15752-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191130115737.15752-1-liuwe@microsoft.com>
References: <20191130115737.15752-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 1/8] x86: introduce CONFIG_GUEST and move code
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
IDcgKysrKystLQogeGVuL2FyY2gveDg2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMiArLQogeGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwg
NSArLS0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZSAgICAgICAgICAgICAgIHwg
NCArKysrCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L2h5cGVyY2FsbF9wYWdlLlMgfCAw
CiB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3B2aC1ib290LmMgICAgICAgfCAwCiB4ZW4v
YXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3hlbi5jICAgICAgICAgICAgfCAwCiA3IGZpbGVzIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZQogcmVuYW1lIHhlbi9hcmNoL3g4Ni9n
dWVzdC97ID0+IHhlbn0vaHlwZXJjYWxsX3BhZ2UuUyAoMTAwJSkKIHJlbmFtZSB4ZW4vYXJjaC94
ODYvZ3Vlc3QveyA9PiB4ZW59L3B2aC1ib290LmMgKDEwMCUpCiByZW5hbWUgeGVuL2FyY2gveDg2
L2d1ZXN0L3sgPT4geGVufS94ZW4uYyAoMTAwJSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
S2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IDI4YjNiNDY5MmEuLjE4YzhmNmZk
MjYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnCisrKyBiL3hlbi9hcmNoL3g4Ni9L
Y29uZmlnCkBAIC0xNjEsOSArMTYxLDEyIEBAIGNvbmZpZyBYRU5fQUxJR05fMk0KIAogZW5kY2hv
aWNlCiAKK2NvbmZpZyBHVUVTVAorCWJvb2wKKwogY29uZmlnIFhFTl9HVUVTVAotCWRlZl9ib29s
IG4KLQlwcm9tcHQgIlhlbiBHdWVzdCIKKwlib29sICJYZW4gR3Vlc3QiCisJc2VsZWN0IEdVRVNU
CiAJLS0taGVscC0tLQogCSAgU3VwcG9ydCBmb3IgWGVuIGRldGVjdGluZyB3aGVuIGl0IGlzIHJ1
bm5pbmcgdW5kZXIgWGVuLgogCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUgYi94
ZW4vYXJjaC94ODYvTWFrZWZpbGUKaW5kZXggYTBiMmY0YWIxNS4uN2RhNWEyNjMxZSAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQpA
QCAtMSw3ICsxLDcgQEAKIHN1YmRpci15ICs9IGFjcGkKIHN1YmRpci15ICs9IGNwdQogc3ViZGly
LXkgKz0gZ2VuYXBpYwotc3ViZGlyLSQoQ09ORklHX1hFTl9HVUVTVCkgKz0gZ3Vlc3QKK3N1YmRp
ci0kKENPTkZJR19HVUVTVCkgKz0gZ3Vlc3QKIHN1YmRpci0kKENPTkZJR19IVk0pICs9IGh2bQog
c3ViZGlyLXkgKz0gbW0KIHN1YmRpci0kKENPTkZJR19YRU5PUFJPRikgKz0gb3Byb2ZpbGUKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9ndWVz
dC9NYWtlZmlsZQppbmRleCAyNmZiNGIxMDA3Li42ODA2ZjA0OTQ3IDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxl
CkBAIC0xLDQgKzEgQEAKLW9iai15ICs9IGh5cGVyY2FsbF9wYWdlLm8KLW9iai15ICs9IHhlbi5v
Ci0KLW9iai1iaW4tJChDT05GSUdfUFZIX0dVRVNUKSArPSBwdmgtYm9vdC5pbml0Lm8KK3N1YmRp
ci0kKENPTkZJR19YRU5fR1VFU1QpICs9IHhlbgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1
ZXN0L3hlbi9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vTWFrZWZpbGUKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMjZmYjRiMTAwNwotLS0gL2Rldi9udWxs
CisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vTWFrZWZpbGUKQEAgLTAsMCArMSw0IEBACitv
YmoteSArPSBoeXBlcmNhbGxfcGFnZS5vCitvYmoteSArPSB4ZW4ubworCitvYmotYmluLSQoQ09O
RklHX1BWSF9HVUVTVCkgKz0gcHZoLWJvb3QuaW5pdC5vCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJjYWxsX3BhZ2UuUyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vaHlwZXJj
YWxsX3BhZ2UuUwpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20geGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVyY2FsbF9wYWdlLlMKcmVuYW1lIHRvIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4v
aHlwZXJjYWxsX3BhZ2UuUwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3B2aC1ib290
LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3B2aC1ib290LmMKc2ltaWxhcml0eSBpbmRleCAx
MDAlCnJlbmFtZSBmcm9tIHhlbi9hcmNoL3g4Ni9ndWVzdC9wdmgtYm9vdC5jCnJlbmFtZSB0byB4
ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3B2aC1ib290LmMKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9ndWVzdC94ZW4uYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKc2ltaWxhcml0eSBp
bmRleCAxMDAlCnJlbmFtZSBmcm9tIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4uYwpyZW5hbWUgdG8g
eGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
