Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6949DF244
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:59:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMa4L-0008Oj-EB; Mon, 21 Oct 2019 15:58:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMa4J-0008O2-Sr
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:58:03 +0000
X-Inumbo-ID: 7c1217e6-f41b-11e9-beca-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c1217e6-f41b-11e9-beca-bc764e2007e4;
 Mon, 21 Oct 2019 15:57:29 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q70so6756663wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f6in2kwAF9sUzg2Mb4eb4h7EVvG820SHOVnsWYNNk9o=;
 b=MUKAOFhlOV0lipkA3Qj18xiI6jhWf6fmWwWPwtnJAQzlhbmMRVzmaR0NXuyaM3yipW
 HOsi01QexFr6Q83AJHRNVrlChT1Fkk93sxOhWiXsmIL0f2ZKitcm/73nC0K+NLF7+k+p
 XNxgHpVNeerACM3motyD2xj5Ms89+puPCEb2bdG6WgiGKIzc5rFhdWxBa3PN+kEilxYA
 WzsXBSzxopWNanWlRO2dko8eQQTxn9xuGvBCMKwGk+5bsz+u6zQg0uZ+HTo6KuMzjuzm
 ktJtP/45Vu4dlEIb3prsn0fYjtMlgX+2cvUvn71CAnSls/Qm/rvTx2TZg0+qttjsc3T/
 X6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=f6in2kwAF9sUzg2Mb4eb4h7EVvG820SHOVnsWYNNk9o=;
 b=JLlFyr3Dz2RFt6k38GPzWRohTurEEMUZ1l1msd8nblRlcKUL3/PJlL5q+TZvcOcYvD
 lGsm+agTAYdpJOmW5GWwf8mK7ND09dbnQipM58iLZdV7Yv0tfc7R091QQ9D3Rqssx8ZS
 H0VlUVWbi8Q4rp3d7ejytwlrz4QRL0O5eSvxhs1PpJ6GSQP8cER8iqePNmhhTna3JiWF
 N5GziDXe/xaz1ymzb1rFveiz2PHblHv4Sx1xPiEDYPsC3wDx1ASnPFhzAaRAzwumpD8T
 9ugjtnyWvk2W3qIJvuroVl8QTNa9ieYF2+ENnni7mqxNX3Slsrc1d9w8s/6VMf/uEVjL
 4Jxg==
X-Gm-Message-State: APjAAAVkvrQYG+Sfrj7CHEhElg4Xab4+Nhst3KM/jr3A/WNRmG1GLivz
 Vr3FNhYo1eWdSqdcEfVi7S5QtbkWzHA=
X-Google-Smtp-Source: APXvYqxHE3iK/0W6DtLJyb6xZXf4NNJOheJkAeLWWTme7Y7mktHsl4XmDpU67XhLM0PcvmGGFT/xtQ==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr19445804wmi.21.1571673448928; 
 Mon, 21 Oct 2019 08:57:28 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id x12sm5667410wru.93.2019.10.21.08.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 08:57:28 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 21 Oct 2019 16:57:17 +0100
Message-Id: <20191021155718.28653-9-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021155718.28653-1-liuwe@microsoft.com>
References: <20191021155718.28653-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v3 8/9] x86: be more verbose when
 running on a hypervisor
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tClYzOiBBZGRy
ZXNzIFJvZ2VyJ3MgY29tbWVudCwgYWRkIEFTU0VSVHMKLS0tCiB4ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2aXNvci5jICAgICAgICB8IDYgKysrKysrCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAg
ICAgICAgICAgICAgICB8IDYgKysrKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
dmlzb3IuaCB8IDMgKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jIGIv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwppbmRleCAzM2JmMWE3NjlkLi5hNjY2YWQ5
NTI2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKQEAgLTQ2LDYgKzQ2LDEyIEBAIGJvb2wgaHlw
ZXJ2aXNvcl9wcm9iZSh2b2lkKQogICAgIHJldHVybiBmYWxzZTsKIH0KIAorY29uc3QgY2hhciAq
aHlwZXJ2aXNvcl9uYW1lKHZvaWQpCit7CisgICAgQVNTRVJUKGhvcHMpOworICAgIHJldHVybiBo
b3BzLT5uYW1lOworfQorCiB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKIHsKICAgICBpZiAo
IGhvcHMgJiYgaG9wcy0+c2V0dXAgKQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMg
Yi94ZW4vYXJjaC94ODYvc2V0dXAuYwppbmRleCAwZWUxMWIxNWE2Li5jZjVhN2I4ZTFlIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpA
QCAtNjg5LDYgKzY4OSw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2ln
bmVkIGxvbmcgbWJpX3ApCiAgICAgaW50IGksIGosIGU4MjBfd2FybiA9IDAsIGJ5dGVzID0gMDsK
ICAgICBib29sIGFjcGlfYm9vdF90YWJsZV9pbml0X2RvbmUgPSBmYWxzZSwgcmVsb2NhdGVkID0g
ZmFsc2U7CiAgICAgaW50IHJldDsKKyAgICBib29sIHJ1bm5pbmdfb25faHlwZXJ2aXNvcjsKICAg
ICBzdHJ1Y3QgbnMxNjU1MF9kZWZhdWx0cyBuczE2NTUwID0gewogICAgICAgICAuZGF0YV9iaXRz
ID0gOCwKICAgICAgICAgLnBhcml0eSAgICA9ICduJywKQEAgLTc2Myw3ICs3NjQsNyBAQCB2b2lk
IF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAgICAq
IGFsbG9jaW5nIGFueSB4ZW5oZWFwIHN0cnVjdHVyZXMgd2FudGVkIGluIGxvd2VyIG1lbW9yeS4g
Ki8KICAgICBrZXhlY19lYXJseV9jYWxjdWxhdGlvbnMoKTsKIAotICAgIGh5cGVydmlzb3JfcHJv
YmUoKTsKKyAgICBydW5uaW5nX29uX2h5cGVydmlzb3IgPSBoeXBlcnZpc29yX3Byb2JlKCk7CiAK
ICAgICBwYXJzZV92aWRlb19pbmZvKCk7CiAKQEAgLTc4OSw2ICs3OTAsOSBAQCB2b2lkIF9faW5p
dCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogCiAgICAgcHJpbnRr
KCJYZW4gaW1hZ2UgbG9hZCBiYXNlIGFkZHJlc3M6ICUjbHhcbiIsIHhlbl9waHlzX3N0YXJ0KTsK
IAorICAgIGlmICggcnVubmluZ19vbl9oeXBlcnZpc29yICkKKyAgICAgICAgcHJpbnRrKCJSdW5u
aW5nIG9uICVzXG4iLCBoeXBlcnZpc29yX25hbWUoKSk7CisKICNpZmRlZiBDT05GSUdfVklERU8K
ICAgICBwcmludGsoIlZpZGVvIGluZm9ybWF0aW9uOlxuIik7CiAKZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9n
dWVzdC9oeXBlcnZpc29yLmgKaW5kZXggMzgzNDRlMmU4OS4uYjU4MzcyMmY1ZCAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmgKKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmgKQEAgLTM2LDE1ICszNiwxOCBAQCBib29sIGh5
cGVydmlzb3JfcHJvYmUodm9pZCk7CiB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCk7CiB2b2lk
IGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCk7CiB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQp
OworY29uc3QgY2hhciAqaHlwZXJ2aXNvcl9uYW1lKHZvaWQpOwogCiAjZWxzZQogCisjaW5jbHVk
ZSA8eGVuL2xpYi5oPgogI2luY2x1ZGUgPHhlbi90eXBlcy5oPgogCiBzdGF0aWMgaW5saW5lIGJv
b2wgaHlwZXJ2aXNvcl9wcm9iZSh2b2lkKSB7IHJldHVybiBmYWxzZTsgfQogc3RhdGljIGlubGlu
ZSB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCkge30KIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBl
cnZpc29yX2FwX3NldHVwKHZvaWQpIHt9CiBzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9y
ZXN1bWUodm9pZCkge30KK3N0YXRpYyBpbmxpbmUgY2hhciAqaHlwZXJ2aXNvcl9uYW1lKHZvaWQp
IHsgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IHJldHVybiBOVUxMOyB9CiAKICNlbmRpZiAgLyogQ09O
RklHX0dVRVNUICovCiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
