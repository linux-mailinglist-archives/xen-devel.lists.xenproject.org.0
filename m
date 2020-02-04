Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1C0151D66
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:40:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0GQ-0001KO-5X; Tue, 04 Feb 2020 15:37:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VjgO=3Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iz0GO-0001Jt-9r
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:37:20 +0000
X-Inumbo-ID: 35ccc6e0-4764-11ea-a933-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35ccc6e0-4764-11ea-a933-bc764e2007e4;
 Tue, 04 Feb 2020 15:37:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p9so3805615wmc.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 07:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fEg9XwS3HG4yiw/+hl5IAq+iztDUQZOPprrs17H6Elw=;
 b=UPTvmR3vxuIFBpQs2c6MWJIAT0+TAxB1oAyULf/8+udbXKufr2C23LV7+f/MlHIYGa
 PBPjQTR2vtK+sV4UkP8A/fpQf7VM79QNI410G3ILCuY7mrtLey0K53BUrRwaKYTTX/Xo
 p0qNBRSIc6iJOEu2BWXachY3fDKM2ZZpFE5ovH2sirw5buE6grqLDmxnQJOQzojQauJN
 JCjan7z5bS6TryW58CqoP0m7CdQgaehsI1psYQ7v81VrI48LwQ8/HyK1G1FNp8t2T+YW
 JIpXNOa1njuobg9t4PM2I5nQyV3KUzWYEPTR8eNLnMmr1oufktqN2cztVY/+Im+mUjDm
 ybcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fEg9XwS3HG4yiw/+hl5IAq+iztDUQZOPprrs17H6Elw=;
 b=VjDrh7YCaUHI0s6lGVkBE87AqE9js7B8yI6qA50WcVqX+gL7cZ+wY8S6QW0NQ8W6QF
 ALixm5/K1yRMotvSBQzPNLRQJGz4jS/tura66fYLfdv/gIU8ev9v7kM7uB9WqZxCKSNQ
 scF/6FqOQ8thx2U38oIcPdTLXPXiv9o8FYOJVRciBXKTMKMEmJRDZcwlZqlJVsMtQTuu
 X1N/sx7Eo45RLWCevUqV6qF0o45trjXPqSa2O8GGcnVLQzfS8y8x8uZzuap8vtHGBsNV
 EfV4zBW6Gr0o+fVd1+BqDKX7HqMtXO1J94xsU4wPQK8OjNLRyljC6nDHFX2eJfg7am6X
 NGyw==
X-Gm-Message-State: APjAAAUVKZfBJHCPAyjxaVLqyKezwBsPbLJf81gDZXxnhnSG8GI5U2HC
 J04AsROknYNbr5rI4TK+MNABSsA4Ksc=
X-Google-Smtp-Source: APXvYqw/h2j5v7RW3J0sxA6E1zesuRlFk1KvgnGKjX6iEQNzdQ+jTz96tWnZUpV8486CGqRgrscF1A==
X-Received: by 2002:a7b:c8d7:: with SMTP id f23mr6243018wml.173.1580830630796; 
 Tue, 04 Feb 2020 07:37:10 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 p26sm4067143wmc.24.2020.02.04.07.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 07:37:10 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue,  4 Feb 2020 15:36:56 +0000
Message-Id: <20200204153704.15934-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200204153704.15934-1-liuwe@microsoft.com>
References: <20200204153704.15934-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 02/10] x86/smp: don't online cpu if
 hypervisor_ap_setup fails
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

UHVzaCBoeXBlcnZpc29yX2FwX3NldHVwIGRvd24gdG8gc21wX2NhbGxpbi4KClRha2UgdGhlIGNo
YW5jZSB0byByZXBsYWNlIHhlbl9ndWVzdCB3aXRoIGNwdV9oYXNfaHlwZXJ2aXNvci4KClNpZ25l
ZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+ClJldmlld2VkLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvc21wYm9vdC5jICAgICAg
ICAgICAgICAgICB8IDEwICsrKysrKystLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlw
ZXJ2aXNvci5oIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94ZW4vYXJj
aC94ODYvc21wYm9vdC5jCmluZGV4IGM5ZDFhYjQ0MjMuLjkzYjg2YTA5ZTkgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwpAQCAt
MTk5LDYgKzE5OSwxMyBAQCBzdGF0aWMgdm9pZCBzbXBfY2FsbGluKHZvaWQpCiAgICAgICAgIGdv
dG8gaGFsdDsKICAgICB9CiAKKyAgICBpZiAoIGNwdV9oYXNfaHlwZXJ2aXNvciAmJiAocmMgPSBo
eXBlcnZpc29yX2FwX3NldHVwKCkpICE9IDAgKQorICAgIHsKKyAgICAgICAgcHJpbnRrKCJDUFUl
ZDogRmFpbGVkIHRvIGluaXRpYWxpc2UgaHlwZXJ2aXNvciBmdW5jdGlvbnMuIE5vdCBjb21pbmcg
b25saW5lLlxuIiwgY3B1KTsKKyAgICAgICAgY3B1X2Vycm9yID0gcmM7CisgICAgICAgIGdvdG8g
aGFsdDsKKyAgICB9CisKICAgICBpZiAoIChyYyA9IGh2bV9jcHVfdXAoKSkgIT0gMCApCiAgICAg
ewogICAgICAgICBwcmludGsoIkNQVSVkOiBGYWlsZWQgdG8gaW5pdGlhbGlzZSBIVk0uIE5vdCBj
b21pbmcgb25saW5lLlxuIiwgY3B1KTsKQEAgLTM3MSw5ICszNzgsNiBAQCB2b2lkIHN0YXJ0X3Nl
Y29uZGFyeSh2b2lkICp1bnVzZWQpCiAKICAgICB0c3hfaW5pdCgpOyAvKiBOZWVkcyBtaWNyb2Nv
ZGUuICBNYXkgY2hhbmdlIEhMRS9SVE0gZmVhdHVyZSBiaXRzLiAqLwogCi0gICAgaWYgKCB4ZW5f
Z3Vlc3QgKQotICAgICAgICBoeXBlcnZpc29yX2FwX3NldHVwKCk7Ci0KICAgICBzbXBfY2FsbGlu
KCk7CiAKICAgICBzZXRfY3B1X3NpYmxpbmdfbWFwKGNwdSk7CmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vl
c3QvaHlwZXJ2aXNvci5oCmluZGV4IGI1MDM4NTRjNWIuLjY0MzgzZjBjM2QgMTAwNjQ0Ci0tLSBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCkBAIC00NCw3ICs0NCw3IEBAIHZvaWQgaHlwZXJ2
aXNvcl9yZXN1bWUodm9pZCk7CiAKIHN0YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqaHlwZXJ2aXNv
cl9wcm9iZSh2b2lkKSB7IHJldHVybiBOVUxMOyB9CiBzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2
aXNvcl9zZXR1cCh2b2lkKSB7IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyB9Ci1zdGF0aWMgaW5saW5l
IGludCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpIHsgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IHJl
dHVybiAwOyB9CitzdGF0aWMgaW5saW5lIGludCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpIHsg
cmV0dXJuIDA7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKSB7
IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyB9CiAKICNlbmRpZiAgLyogQ09ORklHX0dVRVNUICovCi0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
