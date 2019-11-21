Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AB81059FD
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 19:53:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXrY0-0007Ef-Kq; Thu, 21 Nov 2019 18:51:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4y/P=ZN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXrXz-0007EH-HY
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 18:51:19 +0000
X-Inumbo-ID: dab75856-0c8f-11ea-9631-bc764e2007e4
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dab75856-0c8f-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 18:50:58 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id u18so4928858wmc.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 10:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LK3O/o3+V3DHJGhpDMqiDmW/Ssr7NmvU9isr2SCzc0w=;
 b=ptxXAqqy8ro3dJL4t/nSoN1+6hRmBkHjzvFQ6bnfQInHK85Zsebpy1US9d5CNxDJcJ
 yU2E61X+Ys4dW33ov3X7t5quLCXGY5WOlg4fP/8OnSzciX87gm9Q087EjyvUs1RVsQpL
 wUmHbuxDk+mEEO8Kj9s/mARhugYhygJMSKd6W1EzpRc2m92uRdXDD8P2GMB6Vwql9yvN
 QsIUNFuHJFvZeICz7juxFCQPi3RQq2+n1l6Ioiyo1FFgMpD7NxhllOzeoTJq+US/0NS1
 sqMgEb5xgvFXPOljXYJyTx8tKDhJhzbmssiLixprTIQcbeE8gUQ/4C0KvEHuLWfUT1gv
 1k3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LK3O/o3+V3DHJGhpDMqiDmW/Ssr7NmvU9isr2SCzc0w=;
 b=olLux41gkg1cj2Da1pLPPxr/MooM9ZVOBgfkpdqPoV+P3sAFesK+2J1f4QcR61I8lw
 jeaO+O5itg/+JInIVLQJAW2z5A54pxbzQOQu4lC0MF/u6+TC5EyZ1j4mTq1ICsAQnWSn
 zZ2e6u268/VFNCoZNlGTThjR2WW9x3WhkHFID0NTUWwgZDfamAwECtlZ7MhVrPOGJVzB
 p2JUNx1JdgWHN59508j70UpNEjnFPjbrmj7swFcDknwLGJ8DjLELWyhUMI74D907QVZV
 Xl+EdLTuWk8Q2HaqvGf0+EoZus/CGwFaZ1d439sUOwc4CypSj/MG58bJ3uSCMB81oTV9
 JVog==
X-Gm-Message-State: APjAAAXtoDPv4oEjyRiFEN8+IQuIi/CMYeb8LspeTttKm2O7wwNhl9r5
 8Vve56EqVz+IdNUQhJUqShIwU8cJCP/3yA==
X-Google-Smtp-Source: APXvYqxWVpXt/Qc0C0cAUMlzaVQmPeT7b7SzY5KpY5MsUpZ+UblLnhPUVoKTy2oNPFEsWfnK6ebi3g==
X-Received: by 2002:a1c:a512:: with SMTP id o18mr11419892wme.4.1574362257271; 
 Thu, 21 Nov 2019 10:50:57 -0800 (PST)
Received: from debian.mshome.net (74.162.147.147.dyn.plus.net.
 [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id f24sm535776wmb.37.2019.11.21.10.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 10:50:56 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 18:50:46 +0000
Message-Id: <20191121185049.16666-6-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121185049.16666-1-liuwe@microsoft.com>
References: <20191121185049.16666-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 5/8] x86: rename hypervisor_{alloc,
 free}_unused_page
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

VGhleSBhcmUgdXNlZCBpbiBYZW4gY29kZSBvbmx5LgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KQ2hhbmdlcyBp
biB2NDoKMS4gVXNlIHhnXyBwcmVmaXggaW5zdGVhZC4KMi4gRHJvcCBSb2dlcidzIHJldmlldyB0
YWcuCi0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyAgICB8IDYgKysrLS0tCiB4ZW4v
YXJjaC94ODYvcHYvc2hpbS5jICAgICAgICAgIHwgNCArKy0tCiB4ZW4vaW5jbHVkZS9hc20teDg2
L2d1ZXN0L3hlbi5oIHwgNCArKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5j
IGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwppbmRleCAxZTM3MDg2NTE4Li4wZjViNTI2
N2M1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKQEAgLTkzLDcgKzkzLDcgQEAgc3RhdGljIHZvaWQgbWFw
X3NoYXJlZF9pbmZvKHZvaWQpCiAgICAgdW5zaWduZWQgaW50IGk7CiAgICAgdW5zaWduZWQgbG9u
ZyByYzsKIAotICAgIGlmICggaHlwZXJ2aXNvcl9hbGxvY191bnVzZWRfcGFnZSgmbWZuKSApCisg
ICAgaWYgKCB4Z19hbGxvY191bnVzZWRfcGFnZSgmbWZuKSApCiAgICAgICAgIHBhbmljKCJ1bmFi
bGUgdG8gcmVzZXJ2ZSBzaGFyZWQgaW5mbyBtZW1vcnkgcGFnZVxuIik7CiAKICAgICB4YXRwLmdw
Zm4gPSBtZm5feChtZm4pOwpAQCAtMjgwLDcgKzI4MCw3IEBAIHZvaWQgaHlwZXJ2aXNvcl9hcF9z
ZXR1cCh2b2lkKQogICAgIGluaXRfZXZ0Y2huKCk7CiB9CiAKLWludCBoeXBlcnZpc29yX2FsbG9j
X3VudXNlZF9wYWdlKG1mbl90ICptZm4pCitpbnQgeGdfYWxsb2NfdW51c2VkX3BhZ2UobWZuX3Qg
Km1mbikKIHsKICAgICB1bnNpZ25lZCBsb25nIG07CiAgICAgaW50IHJjOwpAQCAtMjkyLDcgKzI5
Miw3IEBAIGludCBoeXBlcnZpc29yX2FsbG9jX3VudXNlZF9wYWdlKG1mbl90ICptZm4pCiAgICAg
cmV0dXJuIHJjOwogfQogCi1pbnQgaHlwZXJ2aXNvcl9mcmVlX3VudXNlZF9wYWdlKG1mbl90IG1m
bikKK2ludCB4Z19mcmVlX3VudXNlZF9wYWdlKG1mbl90IG1mbikKIHsKICAgICByZXR1cm4gcmFu
Z2VzZXRfcmVtb3ZlX3JhbmdlKG1lbSwgbWZuX3gobWZuKSwgbWZuX3gobWZuKSk7CiB9CmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jIGIveGVuL2FyY2gveDg2L3B2L3NoaW0uYwpp
bmRleCAzNTFkYTk3MGVmLi43YTg5OGZkYmU1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcHYv
c2hpbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKQEAgLTc0Miw3ICs3NDIsNyBAQCBz
dGF0aWMgbG9uZyBwdl9zaGltX2dyYW50X3RhYmxlX29wKHVuc2lnbmVkIGludCBjbWQsCiAgICAg
ICAgICAgICAgICAgfTsKICAgICAgICAgICAgICAgICBtZm5fdCBtZm47CiAKLSAgICAgICAgICAg
ICAgICByYyA9IGh5cGVydmlzb3JfYWxsb2NfdW51c2VkX3BhZ2UoJm1mbik7CisgICAgICAgICAg
ICAgICAgcmMgPSB4Z19hbGxvY191bnVzZWRfcGFnZSgmbWZuKTsKICAgICAgICAgICAgICAgICBp
ZiAoIHJjICkKICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIGdwcmludGso
WEVOTE9HX0VSUiwKQEAgLTc1NCw3ICs3NTQsNyBAQCBzdGF0aWMgbG9uZyBwdl9zaGltX2dyYW50
X3RhYmxlX29wKHVuc2lnbmVkIGludCBjbWQsCiAgICAgICAgICAgICAgICAgcmMgPSB4ZW5faHlw
ZXJjYWxsX21lbW9yeV9vcChYRU5NRU1fYWRkX3RvX3BoeXNtYXAsICZ4YXRwKTsKICAgICAgICAg
ICAgICAgICBpZiAoIHJjICkKICAgICAgICAgICAgICAgICB7Ci0gICAgICAgICAgICAgICAgICAg
IGh5cGVydmlzb3JfZnJlZV91bnVzZWRfcGFnZShtZm4pOworICAgICAgICAgICAgICAgICAgICB4
Z19mcmVlX3VudXNlZF9wYWdlKG1mbik7CiAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwogICAg
ICAgICAgICAgICAgIH0KIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94
ZW4uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmgKaW5kZXggMzE0NWY3NTM2MS4u
MDFkYzNlZTZmNiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaAor
KysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCkBAIC0zMyw4ICszMyw4IEBAIGV4
dGVybiBib29sIHB2X2NvbnNvbGU7CiBleHRlcm4gdWludDMyX3QgeGVuX2NwdWlkX2Jhc2U7CiAK
IHZvaWQgcHJvYmVfaHlwZXJ2aXNvcih2b2lkKTsKLWludCBoeXBlcnZpc29yX2FsbG9jX3VudXNl
ZF9wYWdlKG1mbl90ICptZm4pOwotaW50IGh5cGVydmlzb3JfZnJlZV91bnVzZWRfcGFnZShtZm5f
dCBtZm4pOworaW50IHhnX2FsbG9jX3VudXNlZF9wYWdlKG1mbl90ICptZm4pOworaW50IHhnX2Zy
ZWVfdW51c2VkX3BhZ2UobWZuX3QgbWZuKTsKIAogREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGlu
dCwgdmNwdV9pZCk7CiBERUNMQVJFX1BFUl9DUFUoc3RydWN0IHZjcHVfaW5mbyAqLCB2Y3B1X2lu
Zm8pOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
