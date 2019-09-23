Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC2BB201
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:13:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLI7-0006sx-Pw; Mon, 23 Sep 2019 10:09:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCLI6-0006sY-9i
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:09:58 +0000
X-Inumbo-ID: 417988b8-ddea-11e9-b299-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 417988b8-ddea-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 10:09:40 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m18so8619608wmc.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 03:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UqfVM3xb9A0eu4hPr4BRnP3HYQakt7P75+x7Ufcd7qY=;
 b=Ep23HRbzXiZPbX58oxtkUbGl/KV0RWeBVEi+qndp39CTAXj1lvBfYSMNunVqxv0KEm
 PCz2by9LNNBZAv//itRcF6UZ/9k0vwOCMO7YyfCj88bQZie186pXZaju6TFx2guW4yak
 vdX3SXi3jS+w7PWOxVAEilBCMWGRiqYQH29oedGmRgzdgrJOaVscmo8L8I2G53AH5fPz
 U8OkzV0YmlDfgcAymkaomlA0MWzj3uatTrIqQJaG3TONHdu3N6iqcAZLX4EFCaewDkbA
 uTWB3Euto6x2oG3W67m/6d2sfYkWv3IjYiM78wxvDDB84t1/WermbPf9D8uGxTT7RI+l
 0bgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UqfVM3xb9A0eu4hPr4BRnP3HYQakt7P75+x7Ufcd7qY=;
 b=UUicReG+ysM4dhmCNNHNAwOPweDEqzV671mI7X7BJ45JJgNy115rQd4fbhgd5x1JBJ
 8rYNb1vKunYvAhbiDKT2FkEywATazlbUB2+b1q7qdVQJiwedt5a6pcJ6yiWAiPccae82
 VsRg5lK2yWibcQ/JADrAllkaWhnH24AReu6PetwPDjs7H6JYGo9s5wjg8X4B/iGpSbwk
 KET0E733D0bH9iSQXALmuTpOWcg1FHuC2+hWvifZNK69J1KTC5hNTclkqx3JXRv0j7Pc
 nkATKdrH8uzTyHBPg6gUWDpZrBzrvSQRWvEqse4V0sASZxvQeIUr7+hGB1iEu1gXa7k1
 RNEg==
X-Gm-Message-State: APjAAAWtcs5UJFaL9a8B0csCI34VPIOXy/snbIAchOfWzjPcTkiY7JsB
 nrMncRpkMywAh7GektfdpxE9CLZJ
X-Google-Smtp-Source: APXvYqwPDn7qWlE5iQ2Ta9VT5C8jG0MlQ/uyJZ0v21SIYsfPL6BHHneQyzJFPwI/nvgyOway1JNbgQ==
X-Received: by 2002:a05:600c:c2:: with SMTP id
 u2mr12218904wmm.37.1569233379730; 
 Mon, 23 Sep 2019 03:09:39 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id s10sm18241662wmf.48.2019.09.23.03.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 03:09:39 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 23 Sep 2019 11:09:27 +0100
Message-Id: <20190923100931.29670-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190923100931.29670-1-liuwe@microsoft.com>
References: <20190923100931.29670-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next RFC 4/8] x86: factor out xen variants
 for hypervisor setup code
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

V2Ugd2lsbCBhZGQgSHlwZXItViBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbnMgaW4gdGhlIGZ1dHVy
ZS4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VA
bWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jIHwgMzIgKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94
ZW4veGVuLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCmluZGV4IDc4ZmM2MDM5OTYu
LmY5M2M4ZmJkMWMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKKysr
IGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwpAQCAtNjcsNyArNjcsNyBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgZmluZF94ZW5fbGVhdmVzKHZvaWQpCiAgICAgfQogfQogCi12b2lkIF9faW5p
dCBwcm9iZV9oeXBlcnZpc29yKHZvaWQpCitzdGF0aWMgdm9pZCBfX2luaXQgcHJvYmVfeGVuKHZv
aWQpCiB7CiAgICAgaWYgKCB4ZW5fZ3Vlc3QgKQogICAgICAgICByZXR1cm47CkBAIC04Nyw2ICs4
NywxMSBAQCB2b2lkIF9faW5pdCBwcm9iZV9oeXBlcnZpc29yKHZvaWQpCiAgICAgeGVuX2d1ZXN0
ID0gdHJ1ZTsKIH0KIAordm9pZCBfX2luaXQgcHJvYmVfaHlwZXJ2aXNvcih2b2lkKQoreworICAg
IHByb2JlX3hlbigpOworfQorCiBzdGF0aWMgdm9pZCBtYXBfc2hhcmVkX2luZm8odm9pZCkKIHsK
ICAgICBtZm5fdCBtZm47CkBAIC0yNDksMTAgKzI1NCw4IEBAIHN0YXRpYyB2b2lkIGluaXRfZXZ0
Y2huKHZvaWQpCiAgICAgfQogfQogCi12b2lkIF9faW5pdCBoeXBlcnZpc29yX3NldHVwKHZvaWQp
CitzdGF0aWMgdm9pZCBfX2luaXQgeGVuX3NldHVwKHZvaWQpCiB7Ci0gICAgaW5pdF9tZW1tYXAo
KTsKLQogICAgIG1hcF9zaGFyZWRfaW5mbygpOwogCiAgICAgc2V0X3ZjcHVfaWQoKTsKQEAgLTI3
NywxMyArMjgwLDI1IEBAIHZvaWQgX19pbml0IGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKICAgICBp
bml0X2V2dGNobigpOwogfQogCi12b2lkIGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkKK3ZvaWQg
X19pbml0IGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKK3sKKyAgICBpbml0X21lbW1hcCgpOworCisg
ICAgeGVuX3NldHVwKCk7Cit9CisKK3N0YXRpYyB2b2lkIHhlbl9hcF9zZXR1cCh2b2lkKQogewog
ICAgIHNldF92Y3B1X2lkKCk7CiAgICAgbWFwX3ZjcHVpbmZvKCk7CiAgICAgaW5pdF9ldnRjaG4o
KTsKIH0KIAordm9pZCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpCit7CisgICAgeGVuX2FwX3Nl
dHVwKCk7Cit9CisKIGludCBoeXBlcnZpc29yX2FsbG9jX3VudXNlZF9wYWdlKG1mbl90ICptZm4p
CiB7CiAgICAgdW5zaWduZWQgbG9uZyBtOwpAQCAtMzA3LDcgKzMyMiw3IEBAIHN0YXRpYyB2b2lk
IGFwX3Jlc3VtZSh2b2lkICp1bnVzZWQpCiAgICAgaW5pdF9ldnRjaG4oKTsKIH0KIAotdm9pZCBo
eXBlcnZpc29yX3Jlc3VtZSh2b2lkKQorc3RhdGljIHZvaWQgeGVuX3Jlc3VtZSh2b2lkKQogewog
ICAgIC8qIFJlc2V0IHNoYXJlZCBpbmZvIHBhZ2UuICovCiAgICAgbWFwX3NoYXJlZF9pbmZvKCk7
CkBAIC0zMzAsNiArMzQ1LDExIEBAIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCkKICAgICAg
ICAgcHZfY29uc29sZV9pbml0KCk7CiB9CiAKK3ZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCkK
K3sKKyAgICB4ZW5fcmVzdW1lKCk7Cit9CisKIC8qCiAgKiBMb2NhbCB2YXJpYWJsZXM6CiAgKiBt
b2RlOiBDCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
