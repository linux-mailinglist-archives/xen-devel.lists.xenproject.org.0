Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51DD14F1A2
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 18:52:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixaR1-0006tQ-Pj; Fri, 31 Jan 2020 17:50:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=euI0=3U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ixaQz-0006sG-Je
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 17:50:25 +0000
X-Inumbo-ID: 11d4d2ba-4452-11ea-a933-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11d4d2ba-4452-11ea-a933-bc764e2007e4;
 Fri, 31 Jan 2020 17:49:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g17so9713435wro.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2020 09:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CFk7NSQ22jtMnIw9gaYPgixmKD9SoghgRz4Gqj0PfqY=;
 b=AioNmFb/mEZABfVfLcSrj2dD4IlWxIoeRsEc5QuK9jtUDTtafpL6ZW67sYSmIvveYF
 gwFjmkN9A3pHzAIJF7DmfzlwHDC1nNdSSbB++IoUJxgM0ObM0k+NmUmj4dK7h9V/cvoi
 Ai8tJMnskKmeWlzaHchJDNdF1pfFFGi5YRRIVNzDh00Y6+vfastVjsSJ7Ix7mochAvcK
 4bAecsntVsZYsHKghCypujkx6tkZPcqL5mqzptbs19ePipiBV80OuC8q2F4ZixNbA9Ck
 CEwXUA1KLL5xG1+xMmzMlo+xiqp3m/OmurIh2L7FifAQ+UHetyrvckZ+gmofXC9Dw1XS
 CImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CFk7NSQ22jtMnIw9gaYPgixmKD9SoghgRz4Gqj0PfqY=;
 b=cPvUJpar3nA0Rbu13DXDr4rab9JpUIi599+xd9SXE4CkTBQ9cZexJpR1gDgCJ2n0jS
 6EHepe0q0ks6TPR7+Wu0714qkFBxTIZTy95BQakouH1l4gqGAGp207k6+XJ6UrXQkgJz
 Cnb1X4DlUa3PesVW+CVLWWu47T6F8F1Tr+I/QVTSAKptzSGZhlnpPayBykih/Bmsgr5c
 X8D4gjRWzmHWbjroRW+swwZOAuuc5LOtw5LPdtKzQ0JTPCFmWnciT39/u/gU+z/ijaXT
 HM/wSfqTSeHhOkziVYCG8PK9gKyznwEuzzlr9oOHCHg4c0zVjhc8Xwq6G0vLKm0eEfxZ
 OlWw==
X-Gm-Message-State: APjAAAXuWNfAfFgd922izrDpuZ7v2YL6CQYOfZXVVFEw4/1lN+Utm0fb
 Rwm04ToVvrnkoOeNF0fdhKBJ9HT6k94=
X-Google-Smtp-Source: APXvYqwZpue5LqrdUbSfQBsytzq/1Lrz/k+iDVEGACdZOM8Dmc+NexpT60MLOw4Y8v0OREsaxTPDOQ==
X-Received: by 2002:adf:b352:: with SMTP id k18mr13025612wrd.242.1580492986036; 
 Fri, 31 Jan 2020 09:49:46 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 133sm4364352wmd.5.2020.01.31.09.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 09:49:45 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 31 Jan 2020 17:49:29 +0000
Message-Id: <20200131174930.31045-11-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131174930.31045-1-liuwe@microsoft.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 10/11] x86: move viridian_page_msr to
 hyperv-tlfs.h
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
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIHJlbmFtZSBpdCB0byBodl92cF9hc3Npc3RfcGFnZV9tc3IuCgpObyBmdW5jdGlvbmFsIGNo
YW5nZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Ci0tLQog
eGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5jICAgIHwgIDIgKy0KIHhlbi9pbmNs
dWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCB8IDExICsrKysrKysrKysrCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS92aXJpZGlhbi5oICAgICAgfCAxNSArKy0tLS0tLS0tLS0tLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5jIGIveGVuL2FyY2gveDg2
L2h2bS92aXJpZGlhbi92aXJpZGlhbi5jCmluZGV4IDQ0YzhlNmNhYzYuLjlhNmNhZmNiNjIgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdmlyaWRpYW4uYworKysgYi94ZW4v
YXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMKQEAgLTIzMCw3ICsyMzAsNyBAQCBzdGF0
aWMgdm9pZCBkdW1wX2d1ZXN0X29zX2lkKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCiAKIHN0YXRp
YyB2b2lkIGR1bXBfaHlwZXJjYWxsKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCiB7Ci0gICAgY29u
c3QgdW5pb24gdmlyaWRpYW5fcGFnZV9tc3IgKmhnOworICAgIGNvbnN0IHVuaW9uIGh2X3ZwX2Fz
c2lzdF9wYWdlX21zciAqaGc7CiAKICAgICBoZyA9ICZkLT5hcmNoLmh2bS52aXJpZGlhbi0+aHlw
ZXJjYWxsX2dwYTsKIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBl
cnYtdGxmcy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtdGxmcy5oCmluZGV4
IDA3ZGI1N2I1NWYuLjBhMGYzMzk4YzEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
Z3Vlc3QvaHlwZXJ2LXRsZnMuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di10bGZzLmgKQEAgLTU1OCw2ICs1NTgsMTcgQEAgc3RydWN0IGh2X25lc3RlZF9lbmxpZ2h0ZW5t
ZW50c19jb250cm9sIHsKIAl9IGh5cGVyY2FsbENvbnRyb2xzOwogfTsKIAordW5pb24gaHZfdnBf
YXNzaXN0X3BhZ2VfbXNyCit7CisgICAgdWludDY0X3QgcmF3OworICAgIHN0cnVjdAorICAgIHsK
KyAgICAgICAgdWludDY0X3QgZW5hYmxlZDoxOworICAgICAgICB1aW50NjRfdCByZXNlcnZlZF9w
cmVzZXJ2ZWQ6MTE7CisgICAgICAgIHVpbnQ2NF90IHBmbjo0ODsKKyAgICB9OworfTsKKwogLyog
RGVmaW5lIHZpcnR1YWwgcHJvY2Vzc29yIGFzc2lzdCBwYWdlIHN0cnVjdHVyZS4gKi8KIHN0cnVj
dCBodl92cF9hc3Npc3RfcGFnZSB7CiAJX191MzIgYXBpY19hc3Npc3Q7CmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92aXJpZGlhbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vdmlyaWRpYW4uaAppbmRleCBkOTEzODU2MmU2Li44NDRlNTZiMzhmIDEwMDY0NAotLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92aXJpZGlhbi5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvaHZtL3ZpcmlkaWFuLmgKQEAgLTExLDIwICsxMSw5IEBACiAKICNpbmNsdWRlIDxhc20vZ3Vl
c3QvaHlwZXJ2LXRsZnMuaD4KIAotdW5pb24gdmlyaWRpYW5fcGFnZV9tc3IKLXsKLSAgICB1aW50
NjRfdCByYXc7Ci0gICAgc3RydWN0Ci0gICAgewotICAgICAgICB1aW50NjRfdCBlbmFibGVkOjE7
Ci0gICAgICAgIHVpbnQ2NF90IHJlc2VydmVkX3ByZXNlcnZlZDoxMTsKLSAgICAgICAgdWludDY0
X3QgcGZuOjQ4OwotICAgIH07Ci19OwotCiBzdHJ1Y3QgdmlyaWRpYW5fcGFnZQogewotICAgIHVu
aW9uIHZpcmlkaWFuX3BhZ2VfbXNyIG1zcjsKKyAgICB1bmlvbiBodl92cF9hc3Npc3RfcGFnZV9t
c3IgbXNyOwogICAgIHZvaWQgKnB0cjsKIH07CiAKQEAgLTcwLDcgKzU5LDcgQEAgc3RydWN0IHZp
cmlkaWFuX3RpbWVfcmVmX2NvdW50CiBzdHJ1Y3QgdmlyaWRpYW5fZG9tYWluCiB7CiAgICAgdW5p
b24gaHZfZ3Vlc3Rfb3NfaWQgZ3Vlc3Rfb3NfaWQ7Ci0gICAgdW5pb24gdmlyaWRpYW5fcGFnZV9t
c3IgaHlwZXJjYWxsX2dwYTsKKyAgICB1bmlvbiBodl92cF9hc3Npc3RfcGFnZV9tc3IgaHlwZXJj
YWxsX2dwYTsKICAgICBzdHJ1Y3QgdmlyaWRpYW5fdGltZV9yZWZfY291bnQgdGltZV9yZWZfY291
bnQ7CiAgICAgc3RydWN0IHZpcmlkaWFuX3BhZ2UgcmVmZXJlbmNlX3RzYzsKIH07Ci0tIAoyLjIw
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
