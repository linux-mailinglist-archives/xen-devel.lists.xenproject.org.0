Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5F0F1205
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 10:22:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSHTa-0006tk-1q; Wed, 06 Nov 2019 09:19:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rf37=Y6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1iSHTX-0006tH-Tu
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 09:19:39 +0000
X-Inumbo-ID: 86901026-0076-11ea-984a-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86901026-0076-11ea-984a-bc764e2007e4;
 Wed, 06 Nov 2019 09:19:25 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id g3so19076591ljl.11
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 01:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=coiWn1foYoNL5/AHwQss8xRczmLkid+ReOf0kjJjIa4=;
 b=c5p9lkfkPe1akEiHY6SyoTNGB06FZdfk2JT3oZmB0h/1/HgrOtKYPPp7+/Z7S2kDXs
 DwWw0Li/JdvHxVzqL/gzj+HG1qZ1Qvfytnh8/Ma0yOmZr+/TjWRtP8u/BBeRXKO05sCy
 LKI38lXWDn2tSotce8QCXD0pZAxr4YDOiMhudt+TK/NpVMqAsbfnVyY4KyTdFYtTzJjx
 yFFnx5LZPB4GtN/KrrfJ/Kzo0P+5S0GpkZ0//1qWBPJVK/Nlh2XhUM4jPaSbTSM7TPsq
 26Y0x0zztQSsAdhon+mMKYM5MWpwIuV4T6SULhEO3qa/iuUx7Pc89ThL983fpdxV9D4+
 hJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=coiWn1foYoNL5/AHwQss8xRczmLkid+ReOf0kjJjIa4=;
 b=gam/llvvIp4trmRDtMeQ/D/C1GkRJHSOZfDf+elRnoaErCGnhH/OuKbihbxV55yxP8
 3+G7Wt08qcT3LpK90aKTLszrUyEsXzds6kp7xEtrbzF2jE1uhmZCV/jm2hTkGdqrVj0V
 f2YPGVLLragbwFZPg20aj1IRP/IGBhScsmKNcc42S3WivRH7jwB7BXes/45RWlKXppcs
 KeaaY1zyBMwLLwpGvSpoV6/S7lfOiLDjYlHlbl8c3+/7K8HO1EDfk4XvF3+qMnneLx3D
 6oMVGWYnb2MFpgEH5uI3tDtKSR954QJQ21bZAlq60xpPwwT2xpiAQdl6zzUUZHXv9s0V
 ngUg==
X-Gm-Message-State: APjAAAU36OeB7QDMrw6AxS/TMfeM6FGagnMmvWlWriZHrwSNdPPSZqP0
 vDIe0fIv2bZJVU44Gv4/CWLjVD2FpbM=
X-Google-Smtp-Source: APXvYqygdjzLjOvj1bpIRCpLaoDOXVgFUJvWRiA3Gkn04WMGh7ovdTcNuDOEBxyaYwy494eRkolrHg==
X-Received: by 2002:a2e:b163:: with SMTP id a3mr1073177ljm.72.1573031964209;
 Wed, 06 Nov 2019 01:19:24 -0800 (PST)
Received: from aanisov-work.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id g23sm3945937lja.104.2019.11.06.01.19.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 06 Nov 2019 01:19:22 -0800 (PST)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  6 Nov 2019 11:19:10 +0200
Message-Id: <1573031953-12894-5-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [RFC 4/7] arm/gic: Drop pointless assertions
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkFsc28gYXJtY2xh
bmcgY29tcGxhaW5zIGFib3V0IHRoZSBjb25kaXRpb24gYWx3YXlzIHRydWUsCmJlY2F1c2UgYHNn
aWAgaXMgb2YgdHlwZSBlbnVtIHdpdGggYWxsIGl0cyB2YWx1ZXMgdW5kZXIgMTYuCgpTaWduZWQt
b2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgotLS0KIHhlbi9h
cmNoL2FybS9naWMuYyB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLmMKaW5k
ZXggMTEzNjU1YS4uNThjNjE0MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2dpYy5jCisrKyBi
L3hlbi9hcmNoL2FybS9naWMuYwpAQCAtMjk0LDggKzI5NCw2IEBAIHZvaWQgX19pbml0IGdpY19p
bml0KHZvaWQpCiAKIHZvaWQgc2VuZF9TR0lfbWFzayhjb25zdCBjcHVtYXNrX3QgKmNwdW1hc2ss
IGVudW0gZ2ljX3NnaSBzZ2kpCiB7Ci0gICAgQVNTRVJUKHNnaSA8IDE2KTsgLyogVGhlcmUgYXJl
IG9ubHkgMTYgU0dJcyAqLwotCiAgICAgZ2ljX2h3X29wcy0+c2VuZF9TR0koc2dpLCBTR0lfVEFS
R0VUX0xJU1QsIGNwdW1hc2spOwogfQogCkBAIC0zMDYsMTUgKzMwNCwxMSBAQCB2b2lkIHNlbmRf
U0dJX29uZSh1bnNpZ25lZCBpbnQgY3B1LCBlbnVtIGdpY19zZ2kgc2dpKQogCiB2b2lkIHNlbmRf
U0dJX3NlbGYoZW51bSBnaWNfc2dpIHNnaSkKIHsKLSAgICBBU1NFUlQoc2dpIDwgMTYpOyAvKiBU
aGVyZSBhcmUgb25seSAxNiBTR0lzICovCi0KICAgICBnaWNfaHdfb3BzLT5zZW5kX1NHSShzZ2ks
IFNHSV9UQVJHRVRfU0VMRiwgTlVMTCk7CiB9CiAKIHZvaWQgc2VuZF9TR0lfYWxsYnV0c2VsZihl
bnVtIGdpY19zZ2kgc2dpKQogewotICAgQVNTRVJUKHNnaSA8IDE2KTsgLyogVGhlcmUgYXJlIG9u
bHkgMTYgU0dJcyAqLwotCiAgICBnaWNfaHdfb3BzLT5zZW5kX1NHSShzZ2ksIFNHSV9UQVJHRVRf
T1RIRVJTLCBOVUxMKTsKIH0KIAotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
