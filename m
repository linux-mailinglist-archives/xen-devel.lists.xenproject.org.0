Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9613914F1A4
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 18:52:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixaQH-0005qy-Pv; Fri, 31 Jan 2020 17:49:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=euI0=3U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ixaQG-0005qs-J9
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 17:49:40 +0000
X-Inumbo-ID: 0ca14fc6-4452-11ea-8396-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ca14fc6-4452-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 17:49:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g1so8887480wmh.4
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2020 09:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Egz3txqQqthBIsSjMFQvj77WUNoiga8Y7f7moMDL01Y=;
 b=k7BWOimru4Z0jLixjjuChh/KfxXDiHXFwlyGTZCdeeMM/cY7aO3HuZKJDWxehvy/6f
 mT6JY2/f3/RHYrE26+lssizf58LUauU1CJwXjV7KhCLKsQCCfp62jwgiHAebM5buGeK7
 jdLsosIg0fuKO8vJrViGYT+7Y0OK5XnWuNlpSnD4LWZ7C+VNM3/+rpqeAIu/anfdYHwy
 /jE0tzIeCBzHz1baudJdnyqvaYtOMBjpfo/ijVwYJA6oR1YyLLqh5MzhJj2bcv4s3Vjs
 O5W5krRLBgue/SwwLAkOe/DVHOPRzXn7XdN6MfoRo1yiSSE2kP4V+r0tS+pr7Aexi4UU
 A5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Egz3txqQqthBIsSjMFQvj77WUNoiga8Y7f7moMDL01Y=;
 b=YU3Bg/ksqmISiZAm5Z5dC13Xca60lf4vNqoIOmWhSi+7ZBEt6evbrrCbYx0dGdwAdD
 tysid0eo8+jpGXqv4b6LaiWDvEJcF1RQa5BjNpek/twlla6lPwwK3AdE01tXdWridQNo
 dMMmuTp8NIUNuXmHVmt+zRDy5/RWhN7KK9kNu5YNImaGbb3qyBq6nxqqcVVFrUFXW3CX
 AprhKSkDmOG0Ze4TfqYeOe4PyNgnnQ/Yq/DrLl4xQWGcIew8LFjLxWNbb9T/umBrDXcb
 xSlnmlB8FaZKy1hiESHFpVu7Hdj3DoCPTZ8SY/VAyLYxVhi9PmLp2ovB4UBFUIxaUfu/
 R2AQ==
X-Gm-Message-State: APjAAAWMAUE1u30edrJ7WEsDyDE33Xx8nant7cSmKfl5+32esNwbYPEw
 /rmwPj3o/+zAtfG7vKgv98HeRtHyRmE=
X-Google-Smtp-Source: APXvYqxRfBxG1yOxDUs3O2IOTU1WaablLfIjYKWavDKt/1y04+C0B3L4gvoN/as1Yh6/4ZwutiJyWg==
X-Received: by 2002:a1c:1b42:: with SMTP id b63mr13481018wmb.16.1580492974801; 
 Fri, 31 Jan 2020 09:49:34 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 133sm4364352wmd.5.2020.01.31.09.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 09:49:34 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 31 Jan 2020 17:49:20 +0000
Message-Id: <20200131174930.31045-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131174930.31045-1-liuwe@microsoft.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 01/11] x86/hypervisor: make
 hypervisor_ap_setup return an error code
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

V2Ugd2FudCB0byBiZSBhYmxlIHRvIGhhbmRsZSBBUCBzZXR1cCBlcnJvciBpbiB0aGUgdXBwZXIg
bGF5ZXIuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0K
djY6CjEuIENoYW5nZSBtYXBfdmNwdWluZm8gYXMgd2VsbAoyLiBNYWtlIGNvZGUgc2hvcnRlcgot
LS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgICAgIHwgIDYgKysrKy0tCiB4
ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysr
Ky0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmggfCAgNiAr
KystLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyBiL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKaW5kZXggNGYyN2I5ODc0MC4uZTcyYzkyZmZkZiAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYworKysgYi94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCkBAIC01MiwxMCArNTIsMTIgQEAgdm9pZCBfX2luaXQgaHlw
ZXJ2aXNvcl9zZXR1cCh2b2lkKQogICAgICAgICBvcHMtPnNldHVwKCk7CiB9CiAKLXZvaWQgaHlw
ZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKQoraW50IGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkKIHsK
ICAgICBpZiAoIG9wcyAmJiBvcHMtPmFwX3NldHVwICkKLSAgICAgICAgb3BzLT5hcF9zZXR1cCgp
OworICAgICAgICByZXR1cm4gb3BzLT5hcF9zZXR1cCgpOworCisgICAgcmV0dXJuIDA7CiB9CiAK
IHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC94ZW4veGVuLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCmluZGV4IDZkYmM1
Zjk1M2YuLmQ1MGY4NmJhZTcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVu
LmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwpAQCAtMTEzLDE2ICsxMTMsMTYg
QEAgc3RhdGljIGludCBtYXBfdmNwdWluZm8odm9pZCkKICAgICBpbmZvLm1mbiA9IHZpcnRfdG9f
bWZuKCZ2Y3B1X2luZm9bdmNwdV0pOwogICAgIGluZm8ub2Zmc2V0ID0gKHVuc2lnbmVkIGxvbmcp
JnZjcHVfaW5mb1t2Y3B1XSAmIH5QQUdFX01BU0s7CiAgICAgcmMgPSB4ZW5faHlwZXJjYWxsX3Zj
cHVfb3AoVkNQVU9QX3JlZ2lzdGVyX3ZjcHVfaW5mbywgdmNwdSwgJmluZm8pOwotICAgIGlmICgg
cmMgKQotICAgIHsKLSAgICAgICAgQlVHX09OKHZjcHUgPj0gWEVOX0xFR0FDWV9NQVhfVkNQVVMp
OwotICAgICAgICB0aGlzX2NwdSh2Y3B1X2luZm8pID0gJlhFTl9zaGFyZWRfaW5mby0+dmNwdV9p
bmZvW3ZjcHVdOwotICAgIH0KLSAgICBlbHNlCisgICAgaWYgKCAhcmMgKQogICAgIHsKICAgICAg
ICAgdGhpc19jcHUodmNwdV9pbmZvKSA9ICZ2Y3B1X2luZm9bdmNwdV07CiAgICAgICAgIHNldF9i
aXQodmNwdSwgdmNwdV9pbmZvX21hcHBlZCk7CiAgICAgfQorICAgIGVsc2UgaWYgKCB2Y3B1IDwg
WEVOX0xFR0FDWV9NQVhfVkNQVVMgKQorICAgIHsKKyAgICAgICAgcmMgPSAwOworICAgICAgICB0
aGlzX2NwdSh2Y3B1X2luZm8pID0gJlhFTl9zaGFyZWRfaW5mby0+dmNwdV9pbmZvW3ZjcHVdOwor
ICAgIH0KIAogICAgIHJldHVybiByYzsKIH0KQEAgLTI1NywxMSArMjU3LDE3IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBzZXR1cCh2b2lkKQogICAgIGluaXRfZXZ0Y2huKCk7CiB9CiAKLXN0YXRpYyB2
b2lkIGFwX3NldHVwKHZvaWQpCitzdGF0aWMgaW50IGFwX3NldHVwKHZvaWQpCiB7CisgICAgaW50
IHJjOworCiAgICAgc2V0X3ZjcHVfaWQoKTsKLSAgICBtYXBfdmNwdWluZm8oKTsKLSAgICBpbml0
X2V2dGNobigpOworICAgIHJjID0gbWFwX3ZjcHVpbmZvKCk7CisKKyAgICBpZiAoICFyYyApCisg
ICAgICAgIGluaXRfZXZ0Y2huKCk7CisKKyAgICByZXR1cm4gcmM7CiB9CiAKIGludCB4Z19hbGxv
Y191bnVzZWRfcGFnZShtZm5fdCAqbWZuKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC9oeXBlcnZpc29yLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlz
b3IuaAppbmRleCAzOTJmNGI5MGFlLi5iNTAzODU0YzViIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1
ZXN0L2h5cGVydmlzb3IuaApAQCAtMjUsNyArMjUsNyBAQCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMg
ewogICAgIC8qIE1haW4gc2V0dXAgcm91dGluZSAqLwogICAgIHZvaWQgKCpzZXR1cCkodm9pZCk7
CiAgICAgLyogQVAgc2V0dXAgKi8KLSAgICB2b2lkICgqYXBfc2V0dXApKHZvaWQpOworICAgIGlu
dCAoKmFwX3NldHVwKSh2b2lkKTsKICAgICAvKiBSZXN1bWUgZnJvbSBzdXNwZW5zaW9uICovCiAg
ICAgdm9pZCAoKnJlc3VtZSkodm9pZCk7CiB9OwpAQCAtMzQsNyArMzQsNyBAQCBzdHJ1Y3QgaHlw
ZXJ2aXNvcl9vcHMgewogCiBjb25zdCBjaGFyICpoeXBlcnZpc29yX3Byb2JlKHZvaWQpOwogdm9p
ZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpOwotdm9pZCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQp
OworaW50IGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCk7CiB2b2lkIGh5cGVydmlzb3JfcmVzdW1l
KHZvaWQpOwogCiAjZWxzZQpAQCAtNDQsNyArNDQsNyBAQCB2b2lkIGh5cGVydmlzb3JfcmVzdW1l
KHZvaWQpOwogCiBzdGF0aWMgaW5saW5lIGNvbnN0IGNoYXIgKmh5cGVydmlzb3JfcHJvYmUodm9p
ZCkgeyByZXR1cm4gTlVMTDsgfQogc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3Jfc2V0dXAo
dm9pZCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgfQotc3RhdGljIGlubGluZSB2b2lkIGh5cGVy
dmlzb3JfYXBfc2V0dXAodm9pZCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgfQorc3RhdGljIGlu
bGluZSBpbnQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKSB7IEFTU0VSVF9VTlJFQUNIQUJMRSgp
OyByZXR1cm4gMDsgfQogc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQp
IHsgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IH0KIAogI2VuZGlmICAvKiBDT05GSUdfR1VFU1QgKi8K
LS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
