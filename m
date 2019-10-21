Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59866DF242
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:59:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMa4B-0008IS-Pz; Mon, 21 Oct 2019 15:57:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMa49-0008Hl-SJ
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:57:53 +0000
X-Inumbo-ID: 7b1566c2-f41b-11e9-beca-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b1566c2-f41b-11e9-beca-bc764e2007e4;
 Mon, 21 Oct 2019 15:57:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c22so4239809wmd.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ExfOi0N6VUGqchtp2Vv94a4Sc6kPF7iWTxBmQdbZTUY=;
 b=MDrHd9/w6r2SS5bNBvH4wPUa25y5FsK6mLR8DbHPxvWHD+2naAhHzESjYDv1pIsGo/
 geOo0flBHGontoIoY1lHkZRXiLdDAntbGI9XRkcb1Q8PQhIE/uAl4nTHzlGSAd0+Eb2Z
 YQ3RIqMeJvXiArZVWfSVmTYMrfCNfLw9y2gfwQoxuCUjOv/Ed62jnZip/r+SB1PxRwFC
 rg5bYShShrXt/NS/ds7wPnZmU47Sm84Jy0BdBf5NSD7wptgFzDfJ+kprnX9hokCJLbY6
 mOKvOqs389qxDGFg1jkkd4usU64HUgQqchEzNcLevI8G636jgoyn6FWb1U5XkqP/stTJ
 X0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ExfOi0N6VUGqchtp2Vv94a4Sc6kPF7iWTxBmQdbZTUY=;
 b=F5rN1vbyQ7+dd4rKnVFoKeuy6RiJs9d9JBNYwnnXGyCe1w2/ETykPqn8iIQVxkD8vH
 fOEZHTNBtsvYtVB+IPiQ9bkSQ74ETAUbv4X9XGTLWDmx9gadqwdWIh3Sp6unahNYFhNg
 k4YnRPH0j3mGS1ExdDKTl7FWcc/JLEwecLR+L8890NZcOPdPNcsRyRQ55Eh+bfqyr1vv
 570cNpVOHRscA+vHf7vfGOq2M1f9XUFHu1zvJFucVp2e70C5+qMxLscV7tg1TI1+FUdu
 Hgfg1vnfH6vlLifoVlqJroB5wna9F8734T/6nt+zouaa+GUcB5UkL3On4fxFDto9pQjE
 DnSw==
X-Gm-Message-State: APjAAAXBxR1l0ixi8u43T6QWrIUrB3CcF5Qhpa+OIpRQytPCneZzXEic
 qd4mq/A2I6sHAdkMFrekddXhNxj5HQU=
X-Google-Smtp-Source: APXvYqxwIHsOQ9QEmy2XrZYBQQSBlbkiyNYA8Sza8Uiz/Qc+g6OpkO99Vrybf2mgWPoMjr5yFxH0aQ==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr21037600wmk.28.1571673447173; 
 Mon, 21 Oct 2019 08:57:27 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id x12sm5667410wru.93.2019.10.21.08.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 08:57:26 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 21 Oct 2019 16:57:15 +0100
Message-Id: <20191021155718.28653-7-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021155718.28653-1-liuwe@microsoft.com>
References: <20191021155718.28653-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v3 6/9] x86: rename hypervisor_{alloc,
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
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgpSZXZpZXdlZC1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2
L2d1ZXN0L3hlbi94ZW4uYyAgICB8IDYgKysrLS0tCiB4ZW4vYXJjaC94ODYvcHYvc2hpbS5jICAg
ICAgICAgIHwgNCArKy0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oIHwgNCArKy0t
CiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jIGIveGVuL2FyY2gveDg2L2d1ZXN0
L3hlbi94ZW4uYwppbmRleCA3OGZjNjAzOTk2Li45ODk1MDI1ZDAyIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVu
LmMKQEAgLTk3LDcgKzk3LDcgQEAgc3RhdGljIHZvaWQgbWFwX3NoYXJlZF9pbmZvKHZvaWQpCiAg
ICAgdW5zaWduZWQgaW50IGk7CiAgICAgdW5zaWduZWQgbG9uZyByYzsKIAotICAgIGlmICggaHlw
ZXJ2aXNvcl9hbGxvY191bnVzZWRfcGFnZSgmbWZuKSApCisgICAgaWYgKCB4ZW5fYWxsb2NfdW51
c2VkX3BhZ2UoJm1mbikgKQogICAgICAgICBwYW5pYygidW5hYmxlIHRvIHJlc2VydmUgc2hhcmVk
IGluZm8gbWVtb3J5IHBhZ2VcbiIpOwogCiAgICAgeGF0cC5ncGZuID0gbWZuX3gobWZuKTsKQEAg
LTI4NCw3ICsyODQsNyBAQCB2b2lkIGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkKICAgICBpbml0
X2V2dGNobigpOwogfQogCi1pbnQgaHlwZXJ2aXNvcl9hbGxvY191bnVzZWRfcGFnZShtZm5fdCAq
bWZuKQoraW50IHhlbl9hbGxvY191bnVzZWRfcGFnZShtZm5fdCAqbWZuKQogewogICAgIHVuc2ln
bmVkIGxvbmcgbTsKICAgICBpbnQgcmM7CkBAIC0yOTYsNyArMjk2LDcgQEAgaW50IGh5cGVydmlz
b3JfYWxsb2NfdW51c2VkX3BhZ2UobWZuX3QgKm1mbikKICAgICByZXR1cm4gcmM7CiB9CiAKLWlu
dCBoeXBlcnZpc29yX2ZyZWVfdW51c2VkX3BhZ2UobWZuX3QgbWZuKQoraW50IHhlbl9mcmVlX3Vu
dXNlZF9wYWdlKG1mbl90IG1mbikKIHsKICAgICByZXR1cm4gcmFuZ2VzZXRfcmVtb3ZlX3Jhbmdl
KG1lbSwgbWZuX3gobWZuKSwgbWZuX3gobWZuKSk7CiB9CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvcHYvc2hpbS5jIGIveGVuL2FyY2gveDg2L3B2L3NoaW0uYwppbmRleCA1NDQxZTg5ZGUyLi40
MWI0NjY1NjQ5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9wdi9zaGltLmMKQEAgLTczOSw3ICs3MzksNyBAQCBzdGF0aWMgbG9uZyBwdl9zaGlt
X2dyYW50X3RhYmxlX29wKHVuc2lnbmVkIGludCBjbWQsCiAgICAgICAgICAgICAgICAgfTsKICAg
ICAgICAgICAgICAgICBtZm5fdCBtZm47CiAKLSAgICAgICAgICAgICAgICByYyA9IGh5cGVydmlz
b3JfYWxsb2NfdW51c2VkX3BhZ2UoJm1mbik7CisgICAgICAgICAgICAgICAgcmMgPSB4ZW5fYWxs
b2NfdW51c2VkX3BhZ2UoJm1mbik7CiAgICAgICAgICAgICAgICAgaWYgKCByYyApCiAgICAgICAg
ICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICBncHJpbnRrKFhFTkxPR19FUlIsCkBAIC03
NTEsNyArNzUxLDcgQEAgc3RhdGljIGxvbmcgcHZfc2hpbV9ncmFudF90YWJsZV9vcCh1bnNpZ25l
ZCBpbnQgY21kLAogICAgICAgICAgICAgICAgIHJjID0geGVuX2h5cGVyY2FsbF9tZW1vcnlfb3Ao
WEVOTUVNX2FkZF90b19waHlzbWFwLCAmeGF0cCk7CiAgICAgICAgICAgICAgICAgaWYgKCByYyAp
CiAgICAgICAgICAgICAgICAgewotICAgICAgICAgICAgICAgICAgICBoeXBlcnZpc29yX2ZyZWVf
dW51c2VkX3BhZ2UobWZuKTsKKyAgICAgICAgICAgICAgICAgICAgeGVuX2ZyZWVfdW51c2VkX3Bh
Z2UobWZuKTsKICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgICAgICAgICAgfQog
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaAppbmRleCAzMTQ1Zjc1MzYxLi44MjIxZmMxMzI1IDEwMDY0
NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QveGVuLmgKQEAgLTMzLDggKzMzLDggQEAgZXh0ZXJuIGJvb2wgcHZfY29u
c29sZTsKIGV4dGVybiB1aW50MzJfdCB4ZW5fY3B1aWRfYmFzZTsKIAogdm9pZCBwcm9iZV9oeXBl
cnZpc29yKHZvaWQpOwotaW50IGh5cGVydmlzb3JfYWxsb2NfdW51c2VkX3BhZ2UobWZuX3QgKm1m
bik7Ci1pbnQgaHlwZXJ2aXNvcl9mcmVlX3VudXNlZF9wYWdlKG1mbl90IG1mbik7CitpbnQgeGVu
X2FsbG9jX3VudXNlZF9wYWdlKG1mbl90ICptZm4pOworaW50IHhlbl9mcmVlX3VudXNlZF9wYWdl
KG1mbl90IG1mbik7CiAKIERFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIHZjcHVfaWQpOwog
REVDTEFSRV9QRVJfQ1BVKHN0cnVjdCB2Y3B1X2luZm8gKiwgdmNwdV9pbmZvKTsKLS0gCjIuMjAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
