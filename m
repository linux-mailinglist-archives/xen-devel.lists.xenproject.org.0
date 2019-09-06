Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE700ABCCA
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 17:42:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6GL9-0007z7-SY; Fri, 06 Sep 2019 15:39:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lss7=XB=arndb.de=arnd@srs-us1.protection.inumbo.net>)
 id 1i6GL8-0007z1-P4
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 15:39:58 +0000
X-Inumbo-ID: 940bd6c0-d0bc-11e9-b299-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.126.187])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 940bd6c0-d0bc-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 15:39:57 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N49xZ-1iFMyW1Wgz-0103jZ; Fri, 06 Sep 2019 17:39:53 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Date: Fri,  6 Sep 2019 17:39:38 +0200
Message-Id: <20190906153948.2160342-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:zYODqMtzhmasPBLMaQkekqWiOvuaPVy3IwkWaKwHTMENneYYT8+
 N9fyWbckJqYWTjYWdmrm2DvtCp7XQn992baONZAioN40gMFhsqvd2U1uMxtDsTxl02EEgMD
 eI5U3yqi2uT9wI5P/PNjLDsH5KfiyfEyZ9ARZbjNSFbQWMW/PWzRcDJcdeASforR6P2aJOa
 oSAzLbOAoDT2OMDOiRvsQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Hl3snfylLyw=:F4PGuLMuAxxV6jSAERX2I7
 YLHkkVVGb5vPqpurr8Bbn+hyuwWdkNKkzFAUJBpSy+D7WHk7gVxbv9HpCnGGfm6NgtD1zTgjs
 WqyLndj1Q1NoIHOq97vFJK1E5NfCvEK9k2CLN88jTZugyWhrSRmIMpJlo9gYL5VzkBoM13xbe
 L97IBBuATNa8AplaIqCWcHo/WKK4s6PfwNn1IoigBfpbvRJ/4p4vKT4Ps4c9KEMraRxou/4YO
 HQpBTXRVmqZ5/Fu1ubNF1z7SS6+MsybqbmmBf4arM//R+Re4Of7p/AIGwGVb5eNPJfPLMov7o
 eD69Z7Ak+0C5ah/e9vI+a6EOEUGTFWqVmQtCLXjg4CJFXYDrncVnhngBn9tH54hvR3v9cznBt
 XaCRWMr+Wk1XfBylaOur9Ac/fM1lU/GLDeae1pxYrIt/e/YzUGrs6pBa01J2TFxiAfTs7ffR7
 d7k+afrQlghEUPhvATCoVBg0NVG4t25SciaXGLKavc4MvEqWswSslxWMcLPAd+fjqthc+Ujkd
 FpMV7SrwOZ1lhA8UHG+1o8WhALPIVVuIrtZIfRZJty6t9HVahWXkOORwCmjgbZwXrNUuQtjlm
 Z036DeAY4zkrSUKOAdBKSKDJN/Ehwo7WbC6Wzp2cwqUfwFmUF2Mwh+61GjOanrNAM8cOmXUl6
 nTMw3EB8A4ev83/WvVY1UVl6nLC4NaVPP1QI9W5cn3+lUEPOdH5r75jP32GLF7CO36I28uRJX
 j/fBOhn1RJrPYCDLykucNyQcukb/dW7s7RTPh9iJfiYj06Dh2j+AyDwJtTKyqFfirfzZpk8f+
 HvVavFxfxTs0ElAnhWxOzZFZi9GFQsIQ4oeH6iHEPsqKo7oTqE=
Subject: [Xen-devel] [PATCH] ARM: xen: unexport HYPERVISOR_platform_op
 function
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
Cc: Arnd Bergmann <arnd@arndb.de>, Emil Velikov <emil.l.velikov@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Denis Efremov <efremov@linux.com>,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SFlQRVJWSVNPUl9wbGF0Zm9ybV9vcCgpIGlzIGFuIGlubGluZSBmdW5jdGlvbiBhbmQgc2hvdWxk
IG5vdApiZSBleHBvcnRlZC4gU2luY2UgY29tbWl0IDE1YmZjMjM0OGQ1NCAoIm1vZHBvc3Q6IGNo
ZWNrIGZvcgpzdGF0aWMgRVhQT1JUX1NZTUJPTCogZnVuY3Rpb25zIiksIHRoaXMgY2F1c2VzIGEg
d2FybmluZzoKCldBUk5JTkc6ICJIWVBFUlZJU09SX3BsYXRmb3JtX29wIiBbdm1saW51eF0gaXMg
YSBzdGF0aWMgRVhQT1JUX1NZTUJPTF9HUEwKClJlbW92ZSB0aGUgZXh0cmFuZW91cyBleHBvcnQu
CgpGaXhlczogMTViZmMyMzQ4ZDU0ICgibW9kcG9zdDogY2hlY2sgZm9yIHN0YXRpYyBFWFBPUlRf
U1lNQk9MKiBmdW5jdGlvbnMiKQpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPgotLS0KIGFyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYyB8IDEgLQogMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS94ZW4vZW5saWdodGVuLmMg
Yi9hcmNoL2FybS94ZW4vZW5saWdodGVuLmMKaW5kZXggMWU1NzY5MjU1MmQ5Li44NDVjNTI4YWNm
MjQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4uYworKysgYi9hcmNoL2FybS94
ZW4vZW5saWdodGVuLmMKQEAgLTQzNyw3ICs0MzcsNiBAQCBFWFBPUlRfU1lNQk9MX0dQTChIWVBF
UlZJU09SX21lbW9yeV9vcCk7CiBFWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJU09SX3BoeXNkZXZf
b3ApOwogRVhQT1JUX1NZTUJPTF9HUEwoSFlQRVJWSVNPUl92Y3B1X29wKTsKIEVYUE9SVF9TWU1C
T0xfR1BMKEhZUEVSVklTT1JfdG1lbV9vcCk7Ci1FWFBPUlRfU1lNQk9MX0dQTChIWVBFUlZJU09S
X3BsYXRmb3JtX29wKTsKIEVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1JfbXVsdGljYWxsKTsK
IEVYUE9SVF9TWU1CT0xfR1BMKEhZUEVSVklTT1Jfdm1fYXNzaXN0KTsKIEVYUE9SVF9TWU1CT0xf
R1BMKEhZUEVSVklTT1JfZG1fb3ApOwotLSAKMi4yMC4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
