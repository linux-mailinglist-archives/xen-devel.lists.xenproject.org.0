Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3484B10DD8E
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2019 13:00:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ib1O4-0004s3-S3; Sat, 30 Nov 2019 11:58:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rqrT=ZW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ib1O3-0004rU-L6
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2019 11:58:07 +0000
X-Inumbo-ID: 9f9f7372-1368-11ea-9db0-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f9f7372-1368-11ea-9db0-bc764e2007e4;
 Sat, 30 Nov 2019 11:57:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j42so12278316wrj.12
 for <xen-devel@lists.xenproject.org>; Sat, 30 Nov 2019 03:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aF2MOBbI22XVZVTeoITRt1VPD08a0otFAVUzMFsLzLw=;
 b=EhscjL2OLRAUEsuFjy4BwU6j3iZDmJU4YtLQCTDrquzlUMcun0QEPXMlNh2XCr3fbW
 0W64blpl/0ANBCAVOQSUTLAy5OvRzA470Dtkx4Ukm9piySJztNerm9g5vqUaFLLQFftn
 jANKun1A9JAb+gFg6wUNg7tG5Gzz4T6Ldh/x1tSuBZvfLV1F8D1cmUkinpQRZ8CSxAO/
 GMwHgtQJ1/fQERkzKB80EtuHGFY3CWzGLeS6dNjlFfSXQDK2eqhv1BL+uuDABMwV9orV
 qj+m3ItFXODJuJc8RHjGkGxkppKU2LVfKyDPpp2Ync3XTqDzo6ebFnwtKZsEUC0x5n9U
 u5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aF2MOBbI22XVZVTeoITRt1VPD08a0otFAVUzMFsLzLw=;
 b=a5w+/6LbcOTuwJbsfo+fH6tyKYsB73oGJ5VrfoHPzt+Fui8hhq26Ca8Uu4nvVVlol2
 sfGUKwHud4wxDozTvtcKqlasx4wSMbl1O0+FgPb2bKbHk0GaJKdMUfGXhCM/EoduYFA2
 hz1Geh8ylrmRBl9nMI57/YWupQtLlvP7cpr10WMrzOiGr0ScMB3JGarGJouSiYMTPWD/
 pc8ExSDfpwGVTF8bglEocQJY8RsxVdOb18kQ01ewaZsDH8snfmpurwc/J+528mYGrOcN
 IJu0mfEyyjDFPFmlpKWEynp7u0WlIiEtyaCHVmGN3DfGbeWw/dOOgxERnl7xLY7x3GH/
 GiXA==
X-Gm-Message-State: APjAAAXl5ty27agawNN6DTkFf00JMNl3hoGrQfHeCYn3Z49KBudETSC/
 dGakQqbex5xHgzKCA1ufu5oLh4+JM+g=
X-Google-Smtp-Source: APXvYqz8VMnDwshl771gOfNO0EHtBNEMv7fqxpNtF8QTMEb2oQ2b0lnVLXvLf+eGTZQcD2ZzfUAhJA==
X-Received: by 2002:a5d:6089:: with SMTP id w9mr13591842wrt.228.1575115065819; 
 Sat, 30 Nov 2019 03:57:45 -0800 (PST)
Received: from debian.mshome.net (122.163.200.146.dyn.plus.net.
 [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id z11sm2227769wrt.82.2019.11.30.03.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 03:57:45 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sat, 30 Nov 2019 11:57:34 +0000
Message-Id: <20191130115737.15752-6-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191130115737.15752-1-liuwe@microsoft.com>
References: <20191130115737.15752-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 5/8] x86: rename hypervisor_{alloc,
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhleSBhcmUgdXNlZCBpbiBYZW4gY29kZSBvbmx5LgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgpSZXZpZXdlZC1ieTog
UGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgpBY2tlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgICAg
fCA2ICsrKy0tLQogeGVuL2FyY2gveDg2L3B2L3NoaW0uYyAgICAgICAgICB8IDQgKystLQogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaCB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2d1ZXN0L3hlbi94ZW4uYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKaW5kZXggMWUz
NzA4NjUxOC4uMGY1YjUyNjdjNSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94
ZW4uYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCkBAIC05Myw3ICs5Myw3IEBA
IHN0YXRpYyB2b2lkIG1hcF9zaGFyZWRfaW5mbyh2b2lkKQogICAgIHVuc2lnbmVkIGludCBpOwog
ICAgIHVuc2lnbmVkIGxvbmcgcmM7CiAKLSAgICBpZiAoIGh5cGVydmlzb3JfYWxsb2NfdW51c2Vk
X3BhZ2UoJm1mbikgKQorICAgIGlmICggeGdfYWxsb2NfdW51c2VkX3BhZ2UoJm1mbikgKQogICAg
ICAgICBwYW5pYygidW5hYmxlIHRvIHJlc2VydmUgc2hhcmVkIGluZm8gbWVtb3J5IHBhZ2VcbiIp
OwogCiAgICAgeGF0cC5ncGZuID0gbWZuX3gobWZuKTsKQEAgLTI4MCw3ICsyODAsNyBAQCB2b2lk
IGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkKICAgICBpbml0X2V2dGNobigpOwogfQogCi1pbnQg
aHlwZXJ2aXNvcl9hbGxvY191bnVzZWRfcGFnZShtZm5fdCAqbWZuKQoraW50IHhnX2FsbG9jX3Vu
dXNlZF9wYWdlKG1mbl90ICptZm4pCiB7CiAgICAgdW5zaWduZWQgbG9uZyBtOwogICAgIGludCBy
YzsKQEAgLTI5Miw3ICsyOTIsNyBAQCBpbnQgaHlwZXJ2aXNvcl9hbGxvY191bnVzZWRfcGFnZSht
Zm5fdCAqbWZuKQogICAgIHJldHVybiByYzsKIH0KIAotaW50IGh5cGVydmlzb3JfZnJlZV91bnVz
ZWRfcGFnZShtZm5fdCBtZm4pCitpbnQgeGdfZnJlZV91bnVzZWRfcGFnZShtZm5fdCBtZm4pCiB7
CiAgICAgcmV0dXJuIHJhbmdlc2V0X3JlbW92ZV9yYW5nZShtZW0sIG1mbl94KG1mbiksIG1mbl94
KG1mbikpOwogfQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L3NoaW0uYyBiL3hlbi9hcmNo
L3g4Ni9wdi9zaGltLmMKaW5kZXggMzUxZGE5NzBlZi4uN2E4OThmZGJlNSAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L3B2L3NoaW0uYworKysgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCkBAIC03
NDIsNyArNzQyLDcgQEAgc3RhdGljIGxvbmcgcHZfc2hpbV9ncmFudF90YWJsZV9vcCh1bnNpZ25l
ZCBpbnQgY21kLAogICAgICAgICAgICAgICAgIH07CiAgICAgICAgICAgICAgICAgbWZuX3QgbWZu
OwogCi0gICAgICAgICAgICAgICAgcmMgPSBoeXBlcnZpc29yX2FsbG9jX3VudXNlZF9wYWdlKCZt
Zm4pOworICAgICAgICAgICAgICAgIHJjID0geGdfYWxsb2NfdW51c2VkX3BhZ2UoJm1mbik7CiAg
ICAgICAgICAgICAgICAgaWYgKCByYyApCiAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAg
ICAgICAgICBncHJpbnRrKFhFTkxPR19FUlIsCkBAIC03NTQsNyArNzU0LDcgQEAgc3RhdGljIGxv
bmcgcHZfc2hpbV9ncmFudF90YWJsZV9vcCh1bnNpZ25lZCBpbnQgY21kLAogICAgICAgICAgICAg
ICAgIHJjID0geGVuX2h5cGVyY2FsbF9tZW1vcnlfb3AoWEVOTUVNX2FkZF90b19waHlzbWFwLCAm
eGF0cCk7CiAgICAgICAgICAgICAgICAgaWYgKCByYyApCiAgICAgICAgICAgICAgICAgewotICAg
ICAgICAgICAgICAgICAgICBoeXBlcnZpc29yX2ZyZWVfdW51c2VkX3BhZ2UobWZuKTsKKyAgICAg
ICAgICAgICAgICAgICAgeGdfZnJlZV91bnVzZWRfcGFnZShtZm4pOwogICAgICAgICAgICAgICAg
ICAgICBicmVhazsKICAgICAgICAgICAgICAgICB9CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QveGVuLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCmlu
ZGV4IDMxNDVmNzUzNjEuLjAxZGMzZWU2ZjYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QveGVuLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaApAQCAt
MzMsOCArMzMsOCBAQCBleHRlcm4gYm9vbCBwdl9jb25zb2xlOwogZXh0ZXJuIHVpbnQzMl90IHhl
bl9jcHVpZF9iYXNlOwogCiB2b2lkIHByb2JlX2h5cGVydmlzb3Iodm9pZCk7Ci1pbnQgaHlwZXJ2
aXNvcl9hbGxvY191bnVzZWRfcGFnZShtZm5fdCAqbWZuKTsKLWludCBoeXBlcnZpc29yX2ZyZWVf
dW51c2VkX3BhZ2UobWZuX3QgbWZuKTsKK2ludCB4Z19hbGxvY191bnVzZWRfcGFnZShtZm5fdCAq
bWZuKTsKK2ludCB4Z19mcmVlX3VudXNlZF9wYWdlKG1mbl90IG1mbik7CiAKIERFQ0xBUkVfUEVS
X0NQVSh1bnNpZ25lZCBpbnQsIHZjcHVfaWQpOwogREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCB2Y3B1
X2luZm8gKiwgdmNwdV9pbmZvKTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
