Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9A2105A00
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 19:54:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXrXv-0007Bi-7V; Thu, 21 Nov 2019 18:51:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4y/P=ZN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXrXu-0007BR-IG
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 18:51:14 +0000
X-Inumbo-ID: da4a6124-0c8f-11ea-9631-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da4a6124-0c8f-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 18:50:57 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y5so4925090wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 10:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xiGjljNkC4GMr6WhYgoC6GU6XAbJmyqyEGay//B9pSA=;
 b=l0gZX27w0zztTLh2ZsWezxGTJDQB5XfFLYod2uW+lAv8fVH+FTO75y+6D72Idmef+c
 dQXp60VdCmOU6tdbFwQCXl7X6NizqWwAsMmKVZn/M6oHvtDffmkd3CKy8YW0PLCL5kTH
 oX0+ZJ8T6mUasYFECiQ1Sw1bXdPAAhHFr9KgKxA2vI1bnGWBC8nGneyx7Wj1KrSkJBwj
 oZCy16556Ak1YTqBBuRxUPgwb5pfDrNH6VxXPcOpwYArgmdo1Vbq1AqFywZZPA3kqyLY
 9Y+ZtfhSh/r9xlxsccule35AAO/XzJMNOYP9I0lNEBb9VF47qq9sYQEk0RCkK1zqmmjZ
 hXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xiGjljNkC4GMr6WhYgoC6GU6XAbJmyqyEGay//B9pSA=;
 b=D8m3wDFgLqpLR8Iszuy5/+Rhggicju5snIoptLkAcFtmZH6NxF57UL5wRgJzFff+ZX
 GwwIp2fH54V5gtKchV/K66C7d/AJOqLtkiPRy1vysQmr1qkMxYb3Y+UWoxKRKNWUBa69
 kG7ZaN2eEvb6fsNiXyn5/ly36O6fHFr61WG03TowoTCm6QS5TNwyK0PZyIFYcDLudHVc
 b2ci+QMIvoFqbdE4zeW5JVjDpGWoac1KsKPmuQanZlJknW4BAxM+NisT9ld7wlBE/oFO
 jqJXMV91vfatc5vfzC53p8lZjUZUNCu7cpxv0z4MYisjy76A7vcqes0eZ6fUCuzBns2L
 y8pw==
X-Gm-Message-State: APjAAAUGLFDqw/PG915mqIfHk+UqqyepFkm2MME/J1n3yoQ7XrkUV/Bj
 Sty8rYOLSM8QF5U560GTNhEdc1IG6VbRsg==
X-Google-Smtp-Source: APXvYqyQyJUyVftDjzujhh2yZGPXnKho94yS+Q/NYalTUSPOE3Yl99WpzEZ+Q3nUjjhg1WviuRnMcQ==
X-Received: by 2002:a7b:c307:: with SMTP id k7mr11086092wmj.134.1574362256443; 
 Thu, 21 Nov 2019 10:50:56 -0800 (PST)
Received: from debian.mshome.net (74.162.147.147.dyn.plus.net.
 [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id f24sm535776wmb.37.2019.11.21.10.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 10:50:55 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 18:50:45 +0000
Message-Id: <20191121185049.16666-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121185049.16666-1-liuwe@microsoft.com>
References: <20191121185049.16666-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 4/8] x86: introduce hypervisor framework
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

V2Ugd2lsbCBzb29uIGltcGxlbWVudCBIeXBlci1WIHN1cHBvcnQgZm9yIFhlbi4gQWRkIGEgZnJh
bWV3b3JrIGZvcgp0aGF0LgoKVGhpcyByZXF1aXJlcyBtb3Zpbmcgc29tZSBvZiB0aGUgaHlwZXJ2
aXNvcl8qIGZ1bmN0aW9ucyBmcm9tIHhlbi5oIHRvCmh5cGVydmlzb3IuaC4KClNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Ci0tLQpDaGFuZ2VzIGluIHY0OgoxLiBB
ZGQgQVNTRVJUX1VOUkVBQ0hBQkxFIHRvIHN0dWJzLgoyLiBNb3ZlIF9fcmVhZF9tb3N0bHkuCjMu
IFJldHVybiBob3BzIGRpcmVjdGx5Lgo0LiBEcm9wIFBhdWwncyByZXZpZXcgdGFnLgotLS0KIHhl
bi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZSAgICAgICAgICAgIHwgIDIgKwogeGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAgfCA0MiArKysrKysrKysrKysrKysrKwogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9ndWVzdC5oICAgICAgICAgICAgfCAgMSArCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L2h5cGVydmlzb3IuaCB8IDYyICsrKysrKysrKysrKysrKysrKysrKysrKysrCiB4
ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oICAgICAgICB8IDEyIC0tLS0tCiA1IGZpbGVz
IGNoYW5nZWQsIDEwNyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCiBjcmVhdGUgbW9kZSAxMDA2
NDQgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmgKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUK
aW5kZXggNjgwNmYwNDk0Ny4uZjYzZDY0YmJlZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1
ZXN0L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZQpAQCAtMSArMSwz
IEBACitvYmoteSArPSBoeXBlcnZpc29yLm8KKwogc3ViZGlyLSQoQ09ORklHX1hFTl9HVUVTVCkg
Kz0geGVuCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jIGIveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi4xMDNmZWJhNWQ4Ci0tLSAvZGV2L251bGwKKysrIGIveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydmlzb3IuYwpAQCAtMCwwICsxLDQyIEBACisvKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
CisgKiBhcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKKyAqCisgKiBTdXBwb3J0IGZvciBkZXRl
Y3RpbmcgYW5kIHJ1bm5pbmcgdW5kZXIgYSBoeXBlcnZpc29yLgorICoKKyAqIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5
CisgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzIHB1Ymxpc2hlZCBieQorICogdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVy
IHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKKyAqIChhdCB5b3VyIG9wdGlvbikgYW55IGxh
dGVyIHZlcnNpb24uCisgKgorICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBo
b3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7
IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICogTUVSQ0hBTlRBQklMSVRZ
IG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorICogR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyAqCisgKiBZb3Ugc2hvdWxk
IGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQor
ICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5v
cmcvbGljZW5zZXMvPi4KKyAqCisgKiBDb3B5cmlnaHQgKGMpIDIwMTkgTWljcm9zb2Z0LgorICov
CisKKyNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KKworI2luY2x1ZGUgPGFzbS9jYWNoZS5oPgorI2lu
Y2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnZpc29yLmg+CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaHlw
ZXJ2aXNvcl9vcHMgX19yZWFkX21vc3RseSAqaG9wczsKKworY29uc3Qgc3RydWN0IGh5cGVydmlz
b3Jfb3BzICpoeXBlcnZpc29yX3Byb2JlKHZvaWQpCit7CisgICAgcmV0dXJuIGhvcHM7Cit9CisK
Ky8qCisgKiBMb2NhbCB2YXJpYWJsZXM6CisgKiBtb2RlOiBDCisgKiBjLWZpbGUtc3R5bGU6ICJC
U0QiCisgKiBjLWJhc2ljLW9mZnNldDogNAorICogdGFiLXdpZHRoOiA0CisgKiBpbmRlbnQtdGFi
cy1tb2RlOiBuaWwKKyAqIEVuZDoKKyAqLwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC5oCmluZGV4IGEzOGM2YjViM2Yu
LjhlMTY3MTY1YWUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QuaAorKysg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0LmgKQEAgLTIwLDYgKzIwLDcgQEAKICNkZWZpbmUg
X19YODZfR1VFU1RfSF9fCiAKICNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJjYWxsLmg+CisjaW5j
bHVkZSA8YXNtL2d1ZXN0L2h5cGVydmlzb3IuaD4KICNpbmNsdWRlIDxhc20vZ3Vlc3QvcHZoLWJv
b3QuaD4KICNpbmNsdWRlIDxhc20vZ3Vlc3QveGVuLmg+CiAjaW5jbHVkZSA8YXNtL3B2L3NoaW0u
aD4KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmgKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMC4uMmFiMTVhNzEwOAotLS0gL2Rldi9udWxsCisrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCkBAIC0wLDAgKzEsNjIgQEAKKy8qKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioKKyAqIGFzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCisgKgorICog
VGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFu
ZC9vcgorICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0aGUg
R05VIEdlbmVyYWwgUHVibGljCisgKiBMaWNlbnNlLCB2ZXJzaW9uIDIsIGFzIHB1Ymxpc2hlZCBi
eSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgorICoKKyAqIFRoaXMgcHJvZ3JhbSBpcyBk
aXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICogYnV0IFdJ
VEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YK
KyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4g
IFNlZSB0aGUgR05VCisgKiBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMu
CisgKgorICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVy
YWwgUHVibGljCisgKiBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNl
ZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKgorICogQ29weXJpZ2h0IChjKSAy
MDE5IE1pY3Jvc29mdC4KKyAqLworCisjaWZuZGVmIF9fWDg2X0hZUEVSVklTT1JfSF9fCisjZGVm
aW5lIF9fWDg2X0hZUEVSVklTT1JfSF9fCisKK3N0cnVjdCBoeXBlcnZpc29yX29wcyB7CisgICAg
LyogTmFtZSBvZiB0aGUgaHlwZXJ2aXNvciAqLworICAgIGNvbnN0IGNoYXIgKm5hbWU7CisgICAg
LyogTWFpbiBzZXR1cCByb3V0aW5lICovCisgICAgdm9pZCAoKnNldHVwKSh2b2lkKTsKKyAgICAv
KiBBUCBzZXR1cCAqLworICAgIHZvaWQgKCphcF9zZXR1cCkodm9pZCk7CisgICAgLyogUmVzdW1l
IGZyb20gc3VzcGVuc2lvbiAqLworICAgIHZvaWQgKCpyZXN1bWUpKHZvaWQpOworfTsKKworI2lm
ZGVmIENPTkZJR19HVUVTVAorCitjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKmh5cGVydmlz
b3JfcHJvYmUodm9pZCk7Cit2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCk7Cit2b2lkIGh5cGVy
dmlzb3JfYXBfc2V0dXAodm9pZCk7Cit2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpOworCisj
ZWxzZQorCisjaW5jbHVkZSA8eGVuL2xpYi5oPgorI2luY2x1ZGUgPHhlbi90eXBlcy5oPgorCitz
dGF0aWMgaW5saW5lIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqaHlwZXJ2aXNvcl9wcm9i
ZSh2b2lkKSB7IHJldHVybiBOVUxMOyB9CitzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9z
ZXR1cCh2b2lkKSB7IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyB9CitzdGF0aWMgaW5saW5lIHZvaWQg
aHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKSB7IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyB9CitzdGF0
aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCkgeyBBU1NFUlRfVU5SRUFDSEFC
TEUoKTsgfQorCisjZW5kaWYgIC8qIENPTkZJR19HVUVTVCAqLworCisjZW5kaWYgLyogX19YODZf
SFlQRVJWSVNPUl9IX18gKi8KKworLyoKKyAqIExvY2FsIHZhcmlhYmxlczoKKyAqIG1vZGU6IEMK
KyAqIGMtZmlsZS1zdHlsZTogIkJTRCIKKyAqIGMtYmFzaWMtb2Zmc2V0OiA0CisgKiB0YWItd2lk
dGg6IDQKKyAqIGluZGVudC10YWJzLW1vZGU6IG5pbAorICogRW5kOgorICovCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9n
dWVzdC94ZW4uaAppbmRleCBiMDE1ZWQxODgzLi4zMTQ1Zjc1MzYxIDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vl
c3QveGVuLmgKQEAgLTMzLDExICszMyw4IEBAIGV4dGVybiBib29sIHB2X2NvbnNvbGU7CiBleHRl
cm4gdWludDMyX3QgeGVuX2NwdWlkX2Jhc2U7CiAKIHZvaWQgcHJvYmVfaHlwZXJ2aXNvcih2b2lk
KTsKLXZvaWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKTsKLXZvaWQgaHlwZXJ2aXNvcl9hcF9zZXR1
cCh2b2lkKTsKIGludCBoeXBlcnZpc29yX2FsbG9jX3VudXNlZF9wYWdlKG1mbl90ICptZm4pOwog
aW50IGh5cGVydmlzb3JfZnJlZV91bnVzZWRfcGFnZShtZm5fdCBtZm4pOwotdm9pZCBoeXBlcnZp
c29yX3Jlc3VtZSh2b2lkKTsKIAogREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgdmNwdV9p
ZCk7CiBERUNMQVJFX1BFUl9DUFUoc3RydWN0IHZjcHVfaW5mbyAqLCB2Y3B1X2luZm8pOwpAQCAt
NDksMTUgKzQ2LDYgQEAgREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCB2Y3B1X2luZm8gKiwgdmNwdV9p
bmZvKTsKIAogc3RhdGljIGlubGluZSB2b2lkIHByb2JlX2h5cGVydmlzb3Iodm9pZCkge30KIAot
c3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKLXsKLSAgICBBU1NFUlRf
VU5SRUFDSEFCTEUoKTsKLX0KLXN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX2FwX3NldHVw
KHZvaWQpCi17Ci0gICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Ci19Ci0KICNlbmRpZiAvKiBDT05G
SUdfWEVOX0dVRVNUICovCiAjZW5kaWYgLyogX19YODZfR1VFU1RfWEVOX0hfXyAqLwogCi0tIAoy
LjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
