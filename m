Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C39151D64
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:40:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0GK-0001Hh-HM; Tue, 04 Feb 2020 15:37:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VjgO=3Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iz0GJ-0001HS-9t
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:37:15 +0000
X-Inumbo-ID: 353637f2-4764-11ea-8396-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 353637f2-4764-11ea-8396-bc764e2007e4;
 Tue, 04 Feb 2020 15:37:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p9so3805562wmc.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 07:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aG90iG13/0eYUDF/3LrYyCyn+fxbAfySSbQ2wlI3Qww=;
 b=M/0GpiCDJiLyUaV+iYwQOHlrlkeNvWy3oUJKwGRM3/z7rToX/WpYji61av7hAebDFw
 i+rQIaCk6ly8GXpov0PbJUeclfq9gyCQeEwMJJhsbh/rNsIQx/l9FFvEQzZFMb6+iCrS
 jtjqvgx6TJsvE8Sycu62SjuhzS+JrF+pGrPhN0FcJsoEgIYcP+P7yVS3u1VnuUbGgvEp
 PWR3DiGc5BA+1CfLVsUX51i0whuj37FuOeQqzVr7Z47Lho27z7VsB4u1U6+LuR7nT2rr
 AxSYj0yH1c/5Lo6T/I8mUeyDZsa0MpCdEFv90DanaswN9jZ8dm4i/9C/MNDeNAFZWTDo
 LWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aG90iG13/0eYUDF/3LrYyCyn+fxbAfySSbQ2wlI3Qww=;
 b=rjhUbY9hDxDFaBOhL6dEJnZ803hBjr/Hi+Jab+swqroVwYezeaU06kKJjYUqs+3S8L
 +NDwO1Z2vjLmHZ34lCRNSooLUDCnY2SYEKchZleclS6mRy1add7Yt2/aRVk8RIoDxcL1
 8vhTcSJxym0mDjSzrTRWja8DM6IyBrwJXHxaGpqJpiv1ByqBJMshlVrystTCKtSMHuO0
 p3aLj5xOj0jgcw/bBnpp8Y1l6sH4QKx/ETG0cJH9qNQGCMtUGFCLhqpULgGVCRfwfV+h
 gw6aTZ+2Mj6T20AlI6OUSattT/QBAuuc0nW80GjoCR2vGnDOFvplmxCbyXADDBDWEBac
 c2LQ==
X-Gm-Message-State: APjAAAXUN0dafB6hFU8i4kmybIzAdLv/F8Mb94GSYOvz+s7ZumKxf081
 ulWZBLi1u5KhY394G46vB6H6IG4woxw=
X-Google-Smtp-Source: APXvYqxdp+yJBoBr7Qph0C3n4m9hTqut/78cGrZ/3UpN169IwftMv0hTjrOTj1I5CMCWwKhrbUCInA==
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr6831535wmj.155.1580830629750; 
 Tue, 04 Feb 2020 07:37:09 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 p26sm4067143wmc.24.2020.02.04.07.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 07:37:09 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue,  4 Feb 2020 15:36:55 +0000
Message-Id: <20200204153704.15934-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200204153704.15934-1-liuwe@microsoft.com>
References: <20200204153704.15934-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 01/10] x86/hypervisor: make
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
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2Ugd2FudCB0byBiZSBhYmxlIHRvIGhhbmRsZSBBUCBzZXR1cCBlcnJvciBpbiB0aGUgdXBwZXIg
bGF5ZXIuCgpGb3IgWGVuLCByZW1vdmUgYWxsIHBhbmljKCkgYW5kIEJVR19PTigpIGluIGluaXRf
ZXZ0Y2huIGFuZAptYXBfdmNwdWluZm8uIE9ubHkgcGFuaWMvQlVHX09OIHdoZW4gWGVuIGNhbid0
IGZhaWwgZ3JhY2VmdWxseS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29m
dC5jb20+Ci0tLQp2NzoKMS4gQ2hhbmdlIGluaXRfZXZ0Y2huCgp2NjoKMS4gQ2hhbmdlIG1hcF92
Y3B1aW5mbyBhcyB3ZWxsCjIuIE1ha2UgY29kZSBzaG9ydGVyCi0tLQogeGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydmlzb3IuYyAgICAgICAgfCAgNiArKy0KIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4v
eGVuLmMgICAgICAgICAgIHwgNTggKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIHhlbi9pbmNs
dWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oIHwgIDYgKy0tCiAzIGZpbGVzIGNoYW5nZWQs
IDQyIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5j
CmluZGV4IDRmMjdiOTg3NDAuLmU3MmM5MmZmZGYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnZpc29yLmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwpA
QCAtNTIsMTAgKzUyLDEyIEBAIHZvaWQgX19pbml0IGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKICAg
ICAgICAgb3BzLT5zZXR1cCgpOwogfQogCi12b2lkIGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkK
K2ludCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpCiB7CiAgICAgaWYgKCBvcHMgJiYgb3BzLT5h
cF9zZXR1cCApCi0gICAgICAgIG9wcy0+YXBfc2V0dXAoKTsKKyAgICAgICAgcmV0dXJuIG9wcy0+
YXBfc2V0dXAoKTsKKworICAgIHJldHVybiAwOwogfQogCiB2b2lkIGh5cGVydmlzb3JfcmVzdW1l
KHZvaWQpCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jIGIveGVuL2Fy
Y2gveDg2L2d1ZXN0L3hlbi94ZW4uYwppbmRleCA2ZGJjNWY5NTNmLi4xY2YwOTg4NmRhIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9n
dWVzdC94ZW4veGVuLmMKQEAgLTExMywxNiArMTEzLDE2IEBAIHN0YXRpYyBpbnQgbWFwX3ZjcHVp
bmZvKHZvaWQpCiAgICAgaW5mby5tZm4gPSB2aXJ0X3RvX21mbigmdmNwdV9pbmZvW3ZjcHVdKTsK
ICAgICBpbmZvLm9mZnNldCA9ICh1bnNpZ25lZCBsb25nKSZ2Y3B1X2luZm9bdmNwdV0gJiB+UEFH
RV9NQVNLOwogICAgIHJjID0geGVuX2h5cGVyY2FsbF92Y3B1X29wKFZDUFVPUF9yZWdpc3Rlcl92
Y3B1X2luZm8sIHZjcHUsICZpbmZvKTsKLSAgICBpZiAoIHJjICkKLSAgICB7Ci0gICAgICAgIEJV
R19PTih2Y3B1ID49IFhFTl9MRUdBQ1lfTUFYX1ZDUFVTKTsKLSAgICAgICAgdGhpc19jcHUodmNw
dV9pbmZvKSA9ICZYRU5fc2hhcmVkX2luZm8tPnZjcHVfaW5mb1t2Y3B1XTsKLSAgICB9Ci0gICAg
ZWxzZQorICAgIGlmICggIXJjICkKICAgICB7CiAgICAgICAgIHRoaXNfY3B1KHZjcHVfaW5mbykg
PSAmdmNwdV9pbmZvW3ZjcHVdOwogICAgICAgICBzZXRfYml0KHZjcHUsIHZjcHVfaW5mb19tYXBw
ZWQpOwogICAgIH0KKyAgICBlbHNlIGlmICggdmNwdSA8IFhFTl9MRUdBQ1lfTUFYX1ZDUFVTICkK
KyAgICB7CisgICAgICAgIHJjID0gMDsKKyAgICAgICAgdGhpc19jcHUodmNwdV9pbmZvKSA9ICZY
RU5fc2hhcmVkX2luZm8tPnZjcHVfaW5mb1t2Y3B1XTsKKyAgICB9CiAKICAgICByZXR1cm4gcmM7
CiB9CkBAIC0yMDIsMTAgKzIwMiwxNSBAQCBzdGF0aWMgdm9pZCB4ZW5fZXZ0Y2huX3VwY2FsbChz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKICAgICBhY2tfQVBJQ19pcnEoKTsKIH0KIAotc3Rh
dGljIHZvaWQgaW5pdF9ldnRjaG4odm9pZCkKK3N0YXRpYyBpbnQgaW5pdF9ldnRjaG4odm9pZCkK
IHsKICAgICBzdGF0aWMgdWludDhfdCBldnRjaG5fdXBjYWxsX3ZlY3RvcjsKICAgICBpbnQgcmM7
CisgICAgc3RydWN0IHhlbl9odm1fcGFyYW0gYSA9IHsKKyAgICAgICAgLmRvbWlkID0gRE9NSURf
U0VMRiwKKyAgICAgICAgLmluZGV4ID0gSFZNX1BBUkFNX0NBTExCQUNLX0lSUSwKKyAgICAgICAg
LnZhbHVlID0gMSwKKyAgICB9OwogCiAgICAgaWYgKCAhZXZ0Y2huX3VwY2FsbF92ZWN0b3IgKQog
ICAgICAgICBhbGxvY19kaXJlY3RfYXBpY192ZWN0b3IoJmV2dGNobl91cGNhbGxfdmVjdG9yLCB4
ZW5fZXZ0Y2huX3VwY2FsbCk7CkBAIC0yMTUsMTggKzIyMCwxOSBAQCBzdGF0aWMgdm9pZCBpbml0
X2V2dGNobih2b2lkKQogICAgIHJjID0geGVuX2h5cGVyY2FsbF9zZXRfZXZ0Y2huX3VwY2FsbF92
ZWN0b3IodGhpc19jcHUodmNwdV9pZCksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBldnRjaG5fdXBjYWxsX3ZlY3Rvcik7CiAgICAgaWYgKCByYyApCi0g
ICAgICAgIHBhbmljKCJVbmFibGUgdG8gc2V0IGV2dGNobiB1cGNhbGwgdmVjdG9yOiAlZFxuIiwg
cmMpOworICAgIHsKKyAgICAgICAgcHJpbnRrKCJVbmFibGUgdG8gc2V0IGV2dGNobiB1cGNhbGwg
dmVjdG9yOiAlZFxuIiwgcmMpOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CiAKICAgICAvKiBU
cmljayB0b29sc3RhY2sgdG8gdGhpbmsgd2UgYXJlIGVubGlnaHRlbmVkICovCi0gICAgewotICAg
ICAgICBzdHJ1Y3QgeGVuX2h2bV9wYXJhbSBhID0gewotICAgICAgICAgICAgLmRvbWlkID0gRE9N
SURfU0VMRiwKLSAgICAgICAgICAgIC5pbmRleCA9IEhWTV9QQVJBTV9DQUxMQkFDS19JUlEsCi0g
ICAgICAgICAgICAudmFsdWUgPSAxLAotICAgICAgICB9OworICAgIHJjID0geGVuX2h5cGVyY2Fs
bF9odm1fb3AoSFZNT1Bfc2V0X3BhcmFtLCAmYSk7CiAKLSAgICAgICAgQlVHX09OKHhlbl9oeXBl
cmNhbGxfaHZtX29wKEhWTU9QX3NldF9wYXJhbSwgJmEpKTsKLSAgICB9CisgICAgaWYgKCByYyAp
CisgICAgICAgIHByaW50aygiVW5hYmxlIHRvIHNldCBIVk1fUEFSQU1fQ0FMTEJBQ0tfSVJRXG4i
KTsKKworIG91dDoKKyAgICByZXR1cm4gcmM7CiB9CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1
cCh2b2lkKQpAQCAtMjU0LDE0ICsyNjAsMjAgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwKHZv
aWQpCiAgICAgICAgICAgICAgICBYRU5fTEVHQUNZX01BWF9WQ1BVUyk7CiAgICAgfQogCi0gICAg
aW5pdF9ldnRjaG4oKTsKKyAgICBCVUdfT04oaW5pdF9ldnRjaG4oKSk7CiB9CiAKLXN0YXRpYyB2
b2lkIGFwX3NldHVwKHZvaWQpCitzdGF0aWMgaW50IGFwX3NldHVwKHZvaWQpCiB7CisgICAgaW50
IHJjOworCiAgICAgc2V0X3ZjcHVfaWQoKTsKLSAgICBtYXBfdmNwdWluZm8oKTsKLSAgICBpbml0
X2V2dGNobigpOworCisgICAgcmMgPSBtYXBfdmNwdWluZm8oKTsKKyAgICBpZiAoIHJjICkKKyAg
ICAgICAgcmV0dXJuIHJjOworCisgICAgcmV0dXJuIGluaXRfZXZ0Y2huKCk7CiB9CiAKIGludCB4
Z19hbGxvY191bnVzZWRfcGFnZShtZm5fdCAqbWZuKQpAQCAtMjgzLDggKzI5NSw4IEBAIGludCB4
Z19mcmVlX3VudXNlZF9wYWdlKG1mbl90IG1mbikKIAogc3RhdGljIHZvaWQgYXBfcmVzdW1lKHZv
aWQgKnVudXNlZCkKIHsKLSAgICBtYXBfdmNwdWluZm8oKTsKLSAgICBpbml0X2V2dGNobigpOwor
ICAgIEJVR19PTihtYXBfdmNwdWluZm8oKSk7CisgICAgQlVHX09OKGluaXRfZXZ0Y2huKCkpOwog
fQogCiBzdGF0aWMgdm9pZCByZXN1bWUodm9pZCkKQEAgLTMwMyw3ICszMTUsNyBAQCBzdGF0aWMg
dm9pZCByZXN1bWUodm9pZCkKICAgICAgICAgcGFuaWMoInVuYWJsZSB0byByZW1hcCB2Q1BVIGlu
Zm8gYW5kIHZDUFVzID4gbGVnYWN5IGxpbWl0XG4iKTsKIAogICAgIC8qIFNldHVwIGV2ZW50IGNo
YW5uZWwgdXBjYWxsIHZlY3Rvci4gKi8KLSAgICBpbml0X2V2dGNobigpOworICAgIEJVR19PTihp
bml0X2V2dGNobigpKTsKICAgICBzbXBfY2FsbF9mdW5jdGlvbihhcF9yZXN1bWUsIE5VTEwsIDEp
OwogCiAgICAgaWYgKCBwdl9jb25zb2xlICkKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZp
c29yLmgKaW5kZXggMzkyZjRiOTBhZS4uYjUwMzg1NGM1YiAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9n
dWVzdC9oeXBlcnZpc29yLmgKQEAgLTI1LDcgKzI1LDcgQEAgc3RydWN0IGh5cGVydmlzb3Jfb3Bz
IHsKICAgICAvKiBNYWluIHNldHVwIHJvdXRpbmUgKi8KICAgICB2b2lkICgqc2V0dXApKHZvaWQp
OwogICAgIC8qIEFQIHNldHVwICovCi0gICAgdm9pZCAoKmFwX3NldHVwKSh2b2lkKTsKKyAgICBp
bnQgKCphcF9zZXR1cCkodm9pZCk7CiAgICAgLyogUmVzdW1lIGZyb20gc3VzcGVuc2lvbiAqLwog
ICAgIHZvaWQgKCpyZXN1bWUpKHZvaWQpOwogfTsKQEAgLTM0LDcgKzM0LDcgQEAgc3RydWN0IGh5
cGVydmlzb3Jfb3BzIHsKIAogY29uc3QgY2hhciAqaHlwZXJ2aXNvcl9wcm9iZSh2b2lkKTsKIHZv
aWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKTsKLXZvaWQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lk
KTsKK2ludCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpOwogdm9pZCBoeXBlcnZpc29yX3Jlc3Vt
ZSh2b2lkKTsKIAogI2Vsc2UKQEAgLTQ0LDcgKzQ0LDcgQEAgdm9pZCBoeXBlcnZpc29yX3Jlc3Vt
ZSh2b2lkKTsKIAogc3RhdGljIGlubGluZSBjb25zdCBjaGFyICpoeXBlcnZpc29yX3Byb2JlKHZv
aWQpIHsgcmV0dXJuIE5VTEw7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX3NldHVw
KHZvaWQpIHsgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IH0KLXN0YXRpYyBpbmxpbmUgdm9pZCBoeXBl
cnZpc29yX2FwX3NldHVwKHZvaWQpIHsgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IH0KK3N0YXRpYyBp
bmxpbmUgaW50IGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUo
KTsgcmV0dXJuIDA7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lk
KSB7IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyB9CiAKICNlbmRpZiAgLyogQ09ORklHX0dVRVNUICov
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
