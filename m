Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FD2BB205
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:14:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLHs-0006oO-L4; Mon, 23 Sep 2019 10:09:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCLHr-0006oG-9A
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:09:43 +0000
X-Inumbo-ID: 4006c716-ddea-11e9-b299-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4006c716-ddea-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 10:09:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 3so8597401wmi.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WfEwbooFHv5S4uohbQtKqFZG0alfSTL0zc81uOqCx5Q=;
 b=rfOY0YM/GS8B4DZaHL04QXqwE9/Z8EQHCCqC8SIXPOn6TzOvqts5fPPXBjFZeii78B
 YchAW+yyDMpTIv+oF5XnuIJ0Qn0VPYV37MXY/SyShIQTOJWQEBW3BY7Q81zPnsl2XHiZ
 kc+8C8sfwN5Ical+rvSFXKCo7+83YA9lHlJvC70Op3lnf2i3uEkcRx2nKM+Hb0C6vETj
 YCgyTvUCWiqNdXxSSIBKHfqg1DK7GzSHxzIIz+buO4a+4pImvvpsSzmc1yJr/3rTmBKd
 pA6WC6W1yxNYzjCSKdKvSma1XL8Ud/ygSVssgYxybWZBz0rhTvbbgf7rVWOjvTIxgNCw
 JDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WfEwbooFHv5S4uohbQtKqFZG0alfSTL0zc81uOqCx5Q=;
 b=Ha4TfcemyaFHqiQU/DLC2AWRcqDGpL/Wc5pMhuACtK83qS/QrAc7+oqYsYIhpVKFIO
 /GVYu90L/YznILrt1gil0hLA/3uWfdDv7fx8RMA2oQUG/gcff1ZUHfBaWmaYIIbS7Cmi
 X0YYhaV4bmivfNRXjg81to8FTFE8T/HBt38epF7gx/c5ZMA+3V2ulKOnmYonZUupI71m
 27eUzRzh466Zl9PUQcnGBdiqgkkLRL79+zxhyoj6vrcX9U9BgNN5W/IvvBSWLQ72qe0c
 zRT4G41zJH13paz3cWW2YyE22gMy+yJXN8uhYHhnKjt1pdSWP6xAZKVj5Em6Chd0oYfs
 L/sA==
X-Gm-Message-State: APjAAAXq/7nBFyXJkmIDb6WuV2EAxUAPMJJ3ZPg4umeL9v4TulBGH5oF
 k7kD6SyzWNRWAy0wxDgvsAc6X9Ii
X-Google-Smtp-Source: APXvYqymy6baXzi0Y9kq559ouYA+w9Oj465awni9IyfMroJ2t1VNktR9c4NPWiaqmCi7JJpFOX3i+w==
X-Received: by 2002:a05:600c:118a:: with SMTP id
 i10mr12986650wmf.80.1569233377350; 
 Mon, 23 Sep 2019 03:09:37 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id s10sm18241662wmf.48.2019.09.23.03.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 03:09:36 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 23 Sep 2019 11:09:24 +0100
Message-Id: <20190923100931.29670-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190923100931.29670-1-liuwe@microsoft.com>
References: <20190923100931.29670-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next RFC 1/8] x86: introduce CONFIG_GUEST
 and move code
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
dSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCA0ICsrKysKIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICB8IDUgKy0tLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vTWFrZWZpbGUg
ICAgICAgICAgICAgICB8IDQgKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS9oeXBl
cmNhbGxfcGFnZS5TIHwgMAogeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS9wdmgtYm9vdC5j
ICAgICAgIHwgMAogeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS94ZW4uYyAgICAgICAgICAg
IHwgMAogNyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vTWFrZWZpbGUKIHJlbmFt
ZSB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L2h5cGVyY2FsbF9wYWdlLlMgKDEwMCUpCiBy
ZW5hbWUgeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS9wdmgtYm9vdC5jICgxMDAlKQogcmVu
YW1lIHhlbi9hcmNoL3g4Ni9ndWVzdC97ID0+IHhlbn0veGVuLmMgKDEwMCUpCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L0tjb25maWcgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwppbmRleCAyODhk
YzZjMDQyLi41ODRiZGMxYmI4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZworKysg
Yi94ZW4vYXJjaC94ODYvS2NvbmZpZwpAQCAtMTYwLDggKzE2MCwxMiBAQCBjb25maWcgWEVOX0FM
SUdOXzJNCiAKIGVuZGNob2ljZQogCitjb25maWcgR1VFU1QKKwlib29sCisKIGNvbmZpZyBYRU5f
R1VFU1QKIAlkZWZfYm9vbCBuCisJc2VsZWN0IEdVRVNUCiAJcHJvbXB0ICJYZW4gR3Vlc3QiCiAJ
LS0taGVscC0tLQogCSAgU3VwcG9ydCBmb3IgWGVuIGRldGVjdGluZyB3aGVuIGl0IGlzIHJ1bm5p
bmcgdW5kZXIgWGVuLgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L01ha2VmaWxlIGIveGVuL2Fy
Y2gveDg2L01ha2VmaWxlCmluZGV4IDI0NDNmZDJjYzUuLjk5YTEyZDAwOTAgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQorKysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKQEAgLTEs
NyArMSw3IEBACiBzdWJkaXIteSArPSBhY3BpCiBzdWJkaXIteSArPSBjcHUKIHN1YmRpci15ICs9
IGdlbmFwaWMKLXN1YmRpci0kKENPTkZJR19YRU5fR1VFU1QpICs9IGd1ZXN0CitzdWJkaXItJChD
T05GSUdfR1VFU1QpICs9IGd1ZXN0CiBzdWJkaXItJChDT05GSUdfSFZNKSArPSBodm0KIHN1YmRp
ci15ICs9IG1tCiBzdWJkaXItJChDT05GSUdfWEVOT1BST0YpICs9IG9wcm9maWxlCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvTWFr
ZWZpbGUKaW5kZXggMjZmYjRiMTAwNy4uNjgwNmYwNDk0NyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2d1ZXN0L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZQpAQCAt
MSw0ICsxIEBACi1vYmoteSArPSBoeXBlcmNhbGxfcGFnZS5vCi1vYmoteSArPSB4ZW4ubwotCi1v
YmotYmluLSQoQ09ORklHX1BWSF9HVUVTVCkgKz0gcHZoLWJvb3QuaW5pdC5vCitzdWJkaXItJChD
T05GSUdfWEVOX0dVRVNUKSArPSB4ZW4KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94
ZW4vTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL01ha2VmaWxlCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjI2ZmI0YjEwMDcKLS0tIC9kZXYvbnVsbAorKysg
Yi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL01ha2VmaWxlCkBAIC0wLDAgKzEsNCBAQAorb2JqLXkg
Kz0gaHlwZXJjYWxsX3BhZ2Uubworb2JqLXkgKz0geGVuLm8KKworb2JqLWJpbi0kKENPTkZJR19Q
VkhfR1VFU1QpICs9IHB2aC1ib290LmluaXQubwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVyY2FsbF9wYWdlLlMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL2h5cGVyY2FsbF9w
YWdlLlMKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIHhlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcmNhbGxfcGFnZS5TCnJlbmFtZSB0byB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL2h5cGVy
Y2FsbF9wYWdlLlMKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9wdmgtYm9vdC5jIGIv
eGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9wdmgtYm9vdC5jCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpy
ZW5hbWUgZnJvbSB4ZW4vYXJjaC94ODYvZ3Vlc3QvcHZoLWJvb3QuYwpyZW5hbWUgdG8geGVuL2Fy
Y2gveDg2L2d1ZXN0L3hlbi9wdmgtYm9vdC5jCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vl
c3QveGVuLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCnNpbWlsYXJpdHkgaW5kZXgg
MTAwJQpyZW5hbWUgZnJvbSB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMKcmVuYW1lIHRvIHhlbi9h
cmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
