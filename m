Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AB8C23DC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 17:03:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iExB6-0006Kh-6b; Mon, 30 Sep 2019 15:01:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m4o0=XZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iExB4-0006Jo-AF
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 15:01:30 +0000
X-Inumbo-ID: 1a8a1548-e393-11e9-8628-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by localhost (Halon) with ESMTPS
 id 1a8a1548-e393-11e9-8628-bc764e2007e4;
 Mon, 30 Sep 2019 15:00:56 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id m18so13137365wmc.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2019 08:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iyiOgqrZxFUGRGfUCjGuZn7FzXfpH61oMe3dzY2NCCg=;
 b=RnaBNo+g88s5ScTLq1f9UR5Pwr2m+NZAzF0m/CeCOp5JXdWutjRcUNGDSpcQoV3exO
 oC7JA8k8SrwAZKA82J4F/rNfg3Wc9wH4gqjEogFYo2rNaceLdmEoDPCGxkFxr67J0VMo
 uiNirK7/qH2MvLPciOw3gapnceYwuboXyI/370E219yjOv40rKt0ZajHbN343MWxdJPn
 JQIlvGnozFayU6EwL+B3vgBe9TJLkPfxpldx2/dOG7ufKfHb6DrxxvjJWcDOc28pFRRr
 /KsB/Nh9rBCB7LBf9L9W6UezZXUJopya1DKUbAimmFmgvNpme5m9W/RJRtJIBu2HCf13
 z0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iyiOgqrZxFUGRGfUCjGuZn7FzXfpH61oMe3dzY2NCCg=;
 b=CMAFEPfUif1+hbWBLEB62KGE5oOW/H3kJAWWt+KhygMqePYlRk38MC9n9Wabgbv3Gl
 FA0JzxSAcIToK+HzmCt4QlZ28YkujtJb+0VZhJYbQghL3plMRyYWatQtf7/Pwcg6P4Hc
 pLGZZLaYSalMjwdOaboFXkgubDTTncvdfpkRllnITMnQYySWXHBPQUI2oSY6Dc/gh2MP
 nIGr5kOz+mUTc9r+E/tkKa9Vfd62lQX+dbazxWXBJNAznJYHv7O0dukiVerQcJ4oZpzZ
 0uwUKk6WEYNm8FNSHScDwUMsEdmQiW7OVS4Yo7zPYA0F0hcawk2VjAJ4UJUJJ/ce9LD1
 Rp0g==
X-Gm-Message-State: APjAAAXJfbbFLPZ6gcgQWcI5lsp1WWBjNKfHBdHE+BNMxU790cf4oXev
 LDfDIh2feHlImzziYsXRPTwW3Y5GQUE=
X-Google-Smtp-Source: APXvYqwOBR+rM15fjyUePABCbF2i3PLVBkhYoBDStz+QB1AflVfmXILzGTjTV/v2KZF7/+s1yh4QSA==
X-Received: by 2002:a1c:c506:: with SMTP id v6mr16406444wmf.160.1569855655190; 
 Mon, 30 Sep 2019 08:00:55 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id f143sm32870852wme.40.2019.09.30.08.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 08:00:54 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 16:00:42 +0100
Message-Id: <20190930150044.5734-9-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190930150044.5734-1-liuwe@microsoft.com>
References: <20190930150044.5734-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v2 8/9] x86: be more verbose when
 running on a hypervisor
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jICAgICAgICB8IDUgKysrKysKIHhlbi9hcmNoL3g4Ni9z
ZXR1cC5jICAgICAgICAgICAgICAgICAgIHwgNiArKysrKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYv
Z3Vlc3QvaHlwZXJ2aXNvci5oIHwgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVy
dmlzb3IuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKaW5kZXggMzA0NTNiNmE3
YS4uODE2MWIyNmM1YSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3Iu
YworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCkBAIC00Myw2ICs0MywxMSBA
QCBib29sIGh5cGVydmlzb3JfcHJvYmUodm9pZCkKICAgICByZXR1cm4gISFob3BzOwogfQogCitj
b25zdCBjaGFyICpoeXBlcnZpc29yX25hbWUodm9pZCkKK3sKKyAgICByZXR1cm4gaG9wcy0+bmFt
ZTsKK30KKwogdm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpCiB7CiAgICAgaWYgKCBob3BzICYm
IGhvcHMtPnNldHVwICkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2Fy
Y2gveDg2L3NldHVwLmMKaW5kZXggMGVlMTFiMTVhNi4uY2Y1YTdiOGUxZSAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L3NldHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTY4OSw2
ICs2ODksNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25n
IG1iaV9wKQogICAgIGludCBpLCBqLCBlODIwX3dhcm4gPSAwLCBieXRlcyA9IDA7CiAgICAgYm9v
bCBhY3BpX2Jvb3RfdGFibGVfaW5pdF9kb25lID0gZmFsc2UsIHJlbG9jYXRlZCA9IGZhbHNlOwog
ICAgIGludCByZXQ7CisgICAgYm9vbCBydW5uaW5nX29uX2h5cGVydmlzb3I7CiAgICAgc3RydWN0
IG5zMTY1NTBfZGVmYXVsdHMgbnMxNjU1MCA9IHsKICAgICAgICAgLmRhdGFfYml0cyA9IDgsCiAg
ICAgICAgIC5wYXJpdHkgICAgPSAnbicsCkBAIC03NjMsNyArNzY0LDcgQEAgdm9pZCBfX2luaXQg
bm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKICAgICAgKiBhbGxvY2lu
ZyBhbnkgeGVuaGVhcCBzdHJ1Y3R1cmVzIHdhbnRlZCBpbiBsb3dlciBtZW1vcnkuICovCiAgICAg
a2V4ZWNfZWFybHlfY2FsY3VsYXRpb25zKCk7CiAKLSAgICBoeXBlcnZpc29yX3Byb2JlKCk7Cisg
ICAgcnVubmluZ19vbl9oeXBlcnZpc29yID0gaHlwZXJ2aXNvcl9wcm9iZSgpOwogCiAgICAgcGFy
c2VfdmlkZW9faW5mbygpOwogCkBAIC03ODksNiArNzkwLDkgQEAgdm9pZCBfX2luaXQgbm9yZXR1
cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKIAogICAgIHByaW50aygiWGVuIGlt
YWdlIGxvYWQgYmFzZSBhZGRyZXNzOiAlI2x4XG4iLCB4ZW5fcGh5c19zdGFydCk7CiAKKyAgICBp
ZiAoIHJ1bm5pbmdfb25faHlwZXJ2aXNvciApCisgICAgICAgIHByaW50aygiUnVubmluZyBvbiAl
c1xuIiwgaHlwZXJ2aXNvcl9uYW1lKCkpOworCiAjaWZkZWYgQ09ORklHX1ZJREVPCiAgICAgcHJp
bnRrKCJWaWRlbyBpbmZvcm1hdGlvbjpcbiIpOwogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlw
ZXJ2aXNvci5oCmluZGV4IDM4MzQ0ZTJlODkuLmE3ZDc1YmY5Y2YgMTAwNjQ0Ci0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCkBAIC0zNiw2ICszNiw3IEBAIGJvb2wgaHlwZXJ2aXNvcl9w
cm9iZSh2b2lkKTsKIHZvaWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKTsKIHZvaWQgaHlwZXJ2aXNv
cl9hcF9zZXR1cCh2b2lkKTsKIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCk7Citjb25zdCBj
aGFyICpoeXBlcnZpc29yX25hbWUodm9pZCk7CiAKICNlbHNlCiAKQEAgLTQ1LDYgKzQ2LDcgQEAg
c3RhdGljIGlubGluZSBib29sIGh5cGVydmlzb3JfcHJvYmUodm9pZCkgeyByZXR1cm4gZmFsc2U7
IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpIHt9CiBzdGF0aWMg
aW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKSB7fQogc3RhdGljIGlubGluZSB2
b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpIHt9CitzdGF0aWMgaW5saW5lIGNoYXIgKmh5cGVy
dmlzb3JfbmFtZSh2b2lkKSB7IHJldHVybiBOVUxMOyB9CiAKICNlbmRpZiAgLyogQ09ORklHX0dV
RVNUICovCiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
