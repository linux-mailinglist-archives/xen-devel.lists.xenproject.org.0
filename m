Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D01513093C
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 17:51:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io94q-0003ms-2k; Sun, 05 Jan 2020 16:48:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FFS2=22=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1io94o-0003mZ-Fw
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 16:48:30 +0000
X-Inumbo-ID: 2bcd9796-2fdb-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bcd9796-2fdb-11ea-b6f1-bc764e2007e4;
 Sun, 05 Jan 2020 16:48:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q6so46992760wro.9
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jan 2020 08:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ARCb3PeIG/kpr3xyc38m7PUJesXNvhlAaIIhN3mhTE=;
 b=qoANYLeOghT30R0fPBO4/xMRrkYbamKNWwld+OQNb+kMPWoiars7LuIh/tyE4/dDp5
 GHv94/RDrmSuWE0kbbhELFEGCtI2vhXj0C4EkYzIflTb6tyhE1Dqd38v35TKLz1oH8gf
 jjMwJiqqwV+xXAo8z+ahiT4Zey72Gj4ozt7dO5NKE/Ccwd8R/FwYvm3NXdx0Le3FO+mC
 SLDVqSvgWDRycevPgar9CV4n/r5WBWW+zW0S2WGATbwrFs25qZCW0i97tOQosCP/F7mZ
 qna6tc1KnncSMyDTiGx8qe8SwuwkT6vfuTcDcSkRSjKxo1P27pGsIk+RCPB1rwJgoNX7
 KeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/ARCb3PeIG/kpr3xyc38m7PUJesXNvhlAaIIhN3mhTE=;
 b=EtT0B10KSVJTVLPoV/S5F6Dby8bZ7hMDwXztpupAW0HnWBq2I/3+HFlrmQh3rnjwXR
 JAz2QtCCV9m5Qtng0Xr0mvLbIgeAK1KRa3gvLjP2QcNG7K5JkK9wTcaB+g9RBt4SXtpz
 lcJfCNbzG0bwq7mTQPKg1cwhjG28aH8BLQs7EiMj2VKpLjrf4y2KPMJ4hEdEv+MRDqh5
 2JLCOkkmsZ1DNnhjLJZ48wJGnfjQm1HTjm/m4GkXTOPQHGet+wyo6nVM2HKLrajZ2vqX
 ouLrgjs+srC30C/2iWixskQwzV8NSqKL6TFVIF9hmBhfHOyKUJk7d3fBu1de5BfPjAjD
 TaRg==
X-Gm-Message-State: APjAAAUuR0Db0HpvYiYxfPtk31/PZqnD7ZzrcqK/Cqlw9bsmYCs4dFeP
 TPp2XfRTMi8jCwPh46V5JFShQyKUj80=
X-Google-Smtp-Source: APXvYqzJDVBX0cV6hin7+5B+KYwQ+CZTxir4dQ1XVQl5rrj28zwQ/o0VAboBKwDoenJeF4HpdE7yvQ==
X-Received: by 2002:adf:fc4b:: with SMTP id e11mr33096478wrs.326.1578242896305; 
 Sun, 05 Jan 2020 08:48:16 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id y139sm20834028wmd.24.2020.01.05.08.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 08:48:15 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun,  5 Jan 2020 16:47:59 +0000
Message-Id: <20200105164801.26278-4-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200105164801.26278-1-liuwe@microsoft.com>
References: <20200105164801.26278-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/5] x86/hyperv: provide percpu hypercall
 input page
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SHlwZXItVidzIGlucHV0IC8gb3V0cHV0IGFyZ3VtZW50IG11c3QgYmUgOCBieXRlcyBhbGlnbmVk
IGFuIG5vdCBjcm9zcwpwYWdlIGJvdW5kYXJ5LiBUaGUgZWFzaWVzdCB3YXkgdG8gc2F0aXNmeSB0
aG9zZSByZXF1aXJlbWVudHMgaXMgdG8gdXNlCnBlcmNwdSBwYWdlLgoKRm9yIHRoZSBmb3Jlc2Vl
YWJsZSBmdXR1cmUgd2Ugb25seSBuZWVkIHRvIHByb3ZpZGUgaW5wdXQgZm9yIFRMQgphbmQgQVBJ
QyBoeXBlcmNhbGxzLCBzbyBza2lwIHNldHRpbmcgdXAgYW4gb3V0cHV0IHBhZ2UuCgpXZSB3aWxs
IGFsc28gbmVlZCB0byBwcm92aWRlIGFuIGFwX3NldHVwIGhvb2sgZm9yIHNlY29uZGFyeSBjcHVz
IHRvCnNldHVwIGl0cyBvd24gaW5wdXQgcGFnZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxp
dXdlQG1pY3Jvc29mdC5jb20+Ci0tLQp2MzoKMS4gVXNlIHhlbmhlYXAgcGFnZSBpbnN0ZWFkCjIu
IERyb3AgcGFnZSB0cmFja2luZyBzdHJ1Y3R1cmUKMy4gRHJvcCBQYXVsJ3MgcmV2aWV3IHRhZwot
LS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgfCAyMCArKysrKysrKysrKysr
KysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaCB8ICA0ICsrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVy
di5jCmluZGV4IDM4MWJlMmE2OGMuLjdlMDQ2ZGZjMDQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9o
eXBlcnYuYwpAQCAtMjcsNiArMjcsNyBAQAogc3RydWN0IG1zX2h5cGVydl9pbmZvIF9fcmVhZF9t
b3N0bHkgbXNfaHlwZXJ2OwogCiBleHRlcm4gY2hhciBodl9oeXBlcmNhbGxfcGFnZVtdOworREVG
SU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl9wY3B1X2lucHV0X2FyZyk7CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzOwogY29uc3Qgc3RydWN0IGh5cGVy
dmlzb3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCkBAIC04MywxNCArODQsMzMgQEAg
c3RhdGljIHZvaWQgX19pbml0IHNldHVwX2h5cGVyY2FsbF9wYWdlKHZvaWQpCiAgICAgd3Jtc3Js
KEhWX1g2NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxfbXNyLmFzX3VpbnQ2NCk7CiB9CiAKK3N0
YXRpYyB2b2lkIHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZyh2b2lkKQoreworICAgIHZvaWQgKm1h
cHBpbmc7CisKKyAgICBtYXBwaW5nID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7CisgICAgaWYgKCAh
bWFwcGluZyApCisgICAgICAgIHBhbmljKCJGYWlsZWQgdG8gYWxsb2NhdGUgaHlwZXJjYWxsIGlu
cHV0IHBhZ2UgZm9yICV1XG4iLAorICAgICAgICAgICAgICBzbXBfcHJvY2Vzc29yX2lkKCkpOwor
CisgICAgdGhpc19jcHUoaHZfcGNwdV9pbnB1dF9hcmcpID0gbWFwcGluZzsKK30KKwogc3RhdGlj
IHZvaWQgX19pbml0IHNldHVwKHZvaWQpCiB7CiAgICAgc2V0dXBfaHlwZXJjYWxsX3BhZ2UoKTsK
KyAgICBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKK30KKworc3RhdGljIHZvaWQgYXBfc2V0
dXAodm9pZCkKK3sKKyAgICBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKIH0KIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7CiAgICAgLm5hbWUgPSAiSHlwZXIt
ViIsCiAgICAgLnNldHVwID0gc2V0dXAsCisgICAgLmFwX3NldHVwID0gYXBfc2V0dXAsCiB9Owog
CiAvKgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaCBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKaW5kZXggYzdhN2YzMmJkNS4uNmNmMmVh
YjYyZiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAorKysg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCkBAIC01MSw2ICs1MSw4IEBAIHN0
YXRpYyBpbmxpbmUgdWludDY0X3QgaHZfc2NhbGVfdHNjKHVpbnQ2NF90IHRzYywgdWludDY0X3Qg
c2NhbGUsCiAKICNpZmRlZiBDT05GSUdfSFlQRVJWX0dVRVNUCiAKKyNpbmNsdWRlIDx4ZW4vcGVy
Y3B1Lmg+CisKICNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2aXNvci5oPgogCiBzdHJ1Y3QgbXNf
aHlwZXJ2X2luZm8gewpAQCAtNjMsNiArNjUsOCBAQCBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gewog
fTsKIGV4dGVybiBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gbXNfaHlwZXJ2OwogCitERUNMQVJFX1BF
Ul9DUFUodm9pZCAqLCBodl9wY3B1X2lucHV0X2FyZyk7CisKIGNvbnN0IHN0cnVjdCBoeXBlcnZp
c29yX29wcyAqaHlwZXJ2X3Byb2JlKHZvaWQpOwogCiAjZWxzZQotLSAKMi4yMC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
