Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9468412CA73
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 19:36:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ildOW-00005p-17; Sun, 29 Dec 2019 18:34:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F+c7=2T=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ildOU-0008W9-4X
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 18:34:26 +0000
X-Inumbo-ID: c7d4fbc4-2a69-11ea-a1e1-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7d4fbc4-2a69-11ea-a1e1-bc764e2007e4;
 Sun, 29 Dec 2019 18:34:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d16so30908595wre.10
 for <xen-devel@lists.xenproject.org>; Sun, 29 Dec 2019 10:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=StyhxDStPdtUMfRwKkbsK2BEaAdOM3U2G5Vjbak1HKc=;
 b=ad4ZNFkXeZ49oe7phaJulphqWcCrj4QvF3WlthAxXUijKDxuqAv8jxfkgl10R+5ZwR
 f/OEDDRYgkOXk/+3m7qZRC8BjTXF7mCl8pDBiN/W9SR7Ub9XL3K3o1DeovbzTJaISWIP
 m1mnmN41TqaDhGmJex9zf1rUQZ73T9Ir66b28uvUJv7WxUCPqw60EzRYc2iwZum2A7FN
 /4J+kwICeFXRn4m32HApaKIYRQY/lm9usJ6BPhZwoAbHfmyKIt5NcFFDqi3e3SNtGRU/
 Id2vGL30pSA6rWrMq9vx/ceYT6dQWXLV3XoEMLHR1f6KfXSEYPDgGKHmXrkO3w8ZnSkF
 09fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=StyhxDStPdtUMfRwKkbsK2BEaAdOM3U2G5Vjbak1HKc=;
 b=T0fbyzB7XClleShFxkAE97gLJ50slSJ5Qsx7L3MaryYGxbwBxY2l/sO8spX5SSgNo6
 xNkc8/RcpVDgx6ia5QgM96Oqq8Jvv4+3JVfIWMUt6mdgY1B95PQjOi7X8Opd4Coq0PTY
 9+3dyw4qiD73oHP1EBGrPmuSrR5OTEhXFq4ak+0OXRvJKFSj9AciLUIYCReU5mLALCEN
 BT0kAtO1EOhr+SUaHky0ggephLB1IfXgZIDppFk4CX5ov4Dxja/sJJUib1hbAQ0K2d5C
 Fvq3HKKIAS7gLi2aFOLhZieXor3SHfRnLmw7CADePL12lS3GvN50HtZNx47vlp3jVNbT
 jfkQ==
X-Gm-Message-State: APjAAAW1b0MXoV7Ma9MC8qXT9uBQoSlLVpyzYZyGiuNjPkLnH78rGvTY
 nmtU3FEs24nfm+IfV66k2zz+X/rC5sA=
X-Google-Smtp-Source: APXvYqybCE4wFqLyTxmwqM75QIH48UygDKWCpeGYtU6iBh75gnOTS7eiDr1jRKDjZNqlxesQ+3JBZA==
X-Received: by 2002:adf:ee45:: with SMTP id w5mr60470220wro.352.1577644439429; 
 Sun, 29 Dec 2019 10:33:59 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id f207sm19667903wme.9.2019.12.29.10.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 10:33:59 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun, 29 Dec 2019 18:33:39 +0000
Message-Id: <20191229183341.14877-7-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191229183341.14877-1-liuwe@microsoft.com>
References: <20191229183341.14877-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 6/8] x86/hyperv: provide percpu hypercall input
 page
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
QyBoeXBlcmNhbGxzLCBzbyBza2lwIHNldHRpbmcgdXAgYW4gb3V0cHV0IHBhZ2UuCgpUaGUgcGFn
ZSB0cmFja2luZyBzdHJ1Y3R1cmUgaXMgbm90IGJvdW5kIHRvIGh5cGVyY2FsbCBiZWNhdXNlIGl0
IGlzIGEKY29tbW9uIHBhdHRlcm4gZm9yIFhlbiB0byB3cml0ZSBndWVzdCBwaHlzaWNhbCBhZGRy
ZXNzIHRvIEh5cGVyLVYgd2hpbGUKYXQgdGhlIHNhbWUgdGltZSBhY2Nlc3NpbmcgdGhlIHBhZ2Ug
dmlhIGEgcG9pbnRlci4KCldlIHdpbGwgYWxzbyBuZWVkIHRvIHByb3ZpZGUgYW4gYXBfc2V0dXAg
aG9vayBmb3Igc2Vjb25kYXJ5IGNwdXMgdG8Kc2V0dXAgaXRzIG93biBpbnB1dCBwYWdlLgoKU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysK
IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggfCAgOCArKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMK
aW5kZXggNDM4OTEwYzhjYi4uNjc2Njc5MzZlOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi9oeXBlcnYuYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVy
di5jCkBAIC0yOCw2ICsyOCw3IEBAIHN0cnVjdCBtc19oeXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5
IG1zX2h5cGVydjsKIAogdm9pZCAqaHZfaHlwZXJjYWxsOwogc3RhdGljIHN0cnVjdCBwYWdlX2lu
Zm8gKmh2X2h5cGVyY2FsbF9wYWdlOworREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkoc3RydWN0
IGh5cGVydl9wY3B1X3BhZ2UsIGh2X3BjcHVfaW5wdXRfYXJnKTsKIAogc3RhdGljIGNvbnN0IHN0
cnVjdCBoeXBlcnZpc29yX29wcyBvcHM7CiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKl9f
aW5pdCBoeXBlcnZfcHJvYmUodm9pZCkKQEAgLTk2LDE0ICs5NywzOSBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkKICAgICB3cm1zcmwoSFZfWDY0X01TUl9I
WVBFUkNBTEwsIGh5cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKIH0KIAorc3RhdGljIHZvaWQgc2V0
dXBfaHlwZXJjYWxsX3BjcHVfYXJnKHZvaWQpCit7CisgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7
CisgICAgdm9pZCAqbWFwcGluZzsKKyAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nv
cl9pZCgpOworCisgICAgcGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoTlVMTCwgMCk7CisgICAgaWYg
KCAhcGcgKQorICAgICAgICBwYW5pYygiRmFpbGVkIHRvIHNldHVwIGh5cGVyY2FsbCBpbnB1dCBw
YWdlIGZvciAldVxuIiwgY3B1KTsKKworICAgIG1hcHBpbmcgPSBfX21hcF9kb21haW5fcGFnZV9n
bG9iYWwocGcpOworICAgIGlmICggIW1hcHBpbmcgKQorICAgICAgICBwYW5pYygiRmFpbGVkIHRv
IG1hcCBoeXBlcmNhbGwgaW5wdXQgcGFnZSBmb3IgJXVcbiIsIGNwdSk7CisKKyAgICB0aGlzX2Nw
dShodl9wY3B1X2lucHV0X2FyZykubWFkZHIgPSBwYWdlX3RvX21hZGRyKHBnKTsKKyAgICB0aGlz
X2NwdShodl9wY3B1X2lucHV0X2FyZykubWFwcGluZyA9IG1hcHBpbmc7Cit9CisKIHN0YXRpYyB2
b2lkIF9faW5pdCBzZXR1cCh2b2lkKQogewogICAgIHNldHVwX2h5cGVyY2FsbF9wYWdlKCk7Cisg
ICAgc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKCk7Cit9CisKK3N0YXRpYyB2b2lkIGFwX3NldHVw
KHZvaWQpCit7CisgICAgc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKCk7CiB9CiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzID0gewogICAgIC5uYW1lID0gIkh5cGVyLVYi
LAogICAgIC5zZXR1cCA9IHNldHVwLAorICAgIC5hcF9zZXR1cCA9IGFwX3NldHVwLAogfTsKIAog
LyoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggYi94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCmluZGV4IGM3YTdmMzJiZDUuLjgzZjI5NzQ2
OGYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKKysrIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaApAQCAtNTEsNiArNTEsOCBAQCBzdGF0
aWMgaW5saW5lIHVpbnQ2NF90IGh2X3NjYWxlX3RzYyh1aW50NjRfdCB0c2MsIHVpbnQ2NF90IHNj
YWxlLAogCiAjaWZkZWYgQ09ORklHX0hZUEVSVl9HVUVTVAogCisjaW5jbHVkZSA8eGVuL3BlcmNw
dS5oPgorCiAjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydmlzb3IuaD4KIAogc3RydWN0IG1zX2h5
cGVydl9pbmZvIHsKQEAgLTYzLDYgKzY1LDEyIEBAIHN0cnVjdCBtc19oeXBlcnZfaW5mbyB7CiB9
OwogZXh0ZXJuIHN0cnVjdCBtc19oeXBlcnZfaW5mbyBtc19oeXBlcnY7CiAKK3N0cnVjdCBoeXBl
cnZfcGNwdV9wYWdlIHsKKyAgICBwYWRkcl90IG1hZGRyOworICAgIHZvaWQgKm1hcHBpbmc7Cit9
OworREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCBoeXBlcnZfcGNwdV9wYWdlLCBodl9wY3B1X2lucHV0
X2FyZyk7CisKIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqaHlwZXJ2X3Byb2JlKHZvaWQp
OwogCiAjZWxzZQotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
