Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E8F1059FC
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 19:53:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXrXq-00079i-UL; Thu, 21 Nov 2019 18:51:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4y/P=ZN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXrXp-00079E-H5
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 18:51:09 +0000
X-Inumbo-ID: d9ae429e-0c8f-11ea-9631-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9ae429e-0c8f-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 18:50:56 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 8so4976338wmo.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 10:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lp9dPk3GM26kCtmFBzgGz5LRW9FjTOSuocsi0vK/bvk=;
 b=M1VN5GGn93czJvTTl+fj7NTjiG3P7jMs/1rkeDf179J8kuqTVGZs7xhRKM7aATjbas
 bx0aJlgXf42VZdqri4tsmaFqSxfW6a6cO7RuK0q01DjQMlaOW1tLjW+ync9RGheIdtTU
 hro3h72Z+uDgENzrA3aoBqb/frQiyBCD6lYgNeZVoSZ762TJFSvpgC0rP4DUDFRYqFzf
 F28TEFSbgKh69AIFjcIF9Gtv62HgHijVDrlWKnmyjbcC3jhaWpZX55CDe9MmMtlv8KPA
 bQFYxLZq9arFgX6pJFw1Teq1vG/wxRTNP5Sikvo9urUJV7PcmojjfgWpDXZHPoq6Zvtf
 u4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Lp9dPk3GM26kCtmFBzgGz5LRW9FjTOSuocsi0vK/bvk=;
 b=rwscPIfZKMSAeunbpRQ51v6xDFEECXxgGmTCCL8sZ93c6kg/Ol4q70CdXeGnfAZ6AU
 84gcPR9MHV7pbkkeLn04kNF/aIhSm0qcK4uKLoZNvpMMqo87GEHKXMCb4JwNloQoYSR0
 a9moS/B9OotgsqVXEe1LDfzkTh4hrPS4QgxQG55+5tLKs41y5xAYa9O43kJWVqfsNDcK
 4d2TLr3Gfqjgj977CV+6VLa88UxqoOoWxzYkdo8VF6O6q5bG/MJbvKT3JjoHgQ+/pA1u
 i/w/RrwQjTu/BuSlfYxajBNw0iTaspI8GlayYBu7KSWUNYp0W63srW0jm2la1D+ckW18
 Fq2A==
X-Gm-Message-State: APjAAAWjheBeoaSHgY6Kr47puEVqTR1YxOBi2ibosYvNVRowjnHc2HNp
 y7Qf0CQiPUbuJySHvoEipQ67WCgf0PN3Hg==
X-Google-Smtp-Source: APXvYqxY9CZw7Zu4d0X3lbKELMD8ElPRO/vIXGm2iiBNVWhMiWLSNjHar5PZEfJG9BOCtGnmcly8gQ==
X-Received: by 2002:a05:600c:2911:: with SMTP id
 i17mr11678800wmd.83.1574362255514; 
 Thu, 21 Nov 2019 10:50:55 -0800 (PST)
Received: from debian.mshome.net (74.162.147.147.dyn.plus.net.
 [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id f24sm535776wmb.37.2019.11.21.10.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 10:50:55 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 18:50:44 +0000
Message-Id: <20191121185049.16666-4-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121185049.16666-1-liuwe@microsoft.com>
References: <20191121185049.16666-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 3/8] x86: drop hypervisor_cpuid_base
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

VGhlIG9ubHkgdXNlciBpcyBYZW4gc3BlY2lmaWMgY29kZSBpbiBQViBzaGltLiBXZSBjYW4gdGhl
cmVmb3JlIGV4cG9ydAp0aGUgdmFyaWFibGUgZGlyZWN0bHkuCgpNb3ZlIF9fcmVhZF9tb3N0bHkg
dG8gaXRzIHN0YW5kYXJkIHBsYWNlIHdoaWxlIGF0IGl0LgoKU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgICAgfCA3ICstLS0tLS0KIHhl
bi9hcmNoL3g4Ni9wdi9zaGltLmMgICAgICAgICAgfCAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2
L2d1ZXN0L3hlbi5oIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKaW5kZXggYTMyOWU3Yzg4Ni4uMWUzNzA4NjUx
OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYworKysgYi94ZW4vYXJj
aC94ODYvZ3Vlc3QveGVuL3hlbi5jCkBAIC0zNyw3ICszNyw3IEBACiAKIGJvb2wgX19yZWFkX21v
c3RseSB4ZW5fZ3Vlc3Q7CiAKLXN0YXRpYyBfX3JlYWRfbW9zdGx5IHVpbnQzMl90IHhlbl9jcHVp
ZF9iYXNlOwordWludDMyX3QgX19yZWFkX21vc3RseSB4ZW5fY3B1aWRfYmFzZTsKIGV4dGVybiBj
aGFyIGh5cGVyY2FsbF9wYWdlW107CiBzdGF0aWMgc3RydWN0IHJhbmdlc2V0ICptZW07CiAKQEAg
LTI5NywxMSArMjk3LDYgQEAgaW50IGh5cGVydmlzb3JfZnJlZV91bnVzZWRfcGFnZShtZm5fdCBt
Zm4pCiAgICAgcmV0dXJuIHJhbmdlc2V0X3JlbW92ZV9yYW5nZShtZW0sIG1mbl94KG1mbiksIG1m
bl94KG1mbikpOwogfQogCi11aW50MzJfdCBoeXBlcnZpc29yX2NwdWlkX2Jhc2Uodm9pZCkKLXsK
LSAgICByZXR1cm4geGVuX2NwdWlkX2Jhc2U7Ci19Ci0KIHN0YXRpYyB2b2lkIGFwX3Jlc3VtZSh2
b2lkICp1bnVzZWQpCiB7CiAgICAgbWFwX3ZjcHVpbmZvKCk7CmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvcHYvc2hpbS5jIGIveGVuL2FyY2gveDg2L3B2L3NoaW0uYwppbmRleCAzNWJmMzk0NWFj
Li4zNTFkYTk3MGVmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9wdi9zaGltLmMKQEAgLTk5NSw3ICs5OTUsNyBAQCBkb21pZF90IGdldF9pbml0
aWFsX2RvbWFpbl9pZCh2b2lkKQogICAgIGlmICggIXB2X3NoaW0gKQogICAgICAgICByZXR1cm4g
MDsKIAotICAgIGNwdWlkKGh5cGVydmlzb3JfY3B1aWRfYmFzZSgpICsgNCwgJmVheCwgJmVieCwg
JmVjeCwgJmVkeCk7CisgICAgY3B1aWQoeGVuX2NwdWlkX2Jhc2UgKyA0LCAmZWF4LCAmZWJ4LCAm
ZWN4LCAmZWR4KTsKIAogICAgIHJldHVybiAoZWF4ICYgWEVOX0hWTV9DUFVJRF9ET01JRF9QUkVT
RU5UKSA/IGVjeCA6IDE7CiB9CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0
L3hlbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaAppbmRleCA3ZTA0ZTRhN2Fi
Li5iMDE1ZWQxODgzIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmgKQEAgLTMwLDEzICszMCwxMyBA
QAogCiBleHRlcm4gYm9vbCB4ZW5fZ3Vlc3Q7CiBleHRlcm4gYm9vbCBwdl9jb25zb2xlOworZXh0
ZXJuIHVpbnQzMl90IHhlbl9jcHVpZF9iYXNlOwogCiB2b2lkIHByb2JlX2h5cGVydmlzb3Iodm9p
ZCk7CiB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCk7CiB2b2lkIGh5cGVydmlzb3JfYXBfc2V0
dXAodm9pZCk7CiBpbnQgaHlwZXJ2aXNvcl9hbGxvY191bnVzZWRfcGFnZShtZm5fdCAqbWZuKTsK
IGludCBoeXBlcnZpc29yX2ZyZWVfdW51c2VkX3BhZ2UobWZuX3QgbWZuKTsKLXVpbnQzMl90IGh5
cGVydmlzb3JfY3B1aWRfYmFzZSh2b2lkKTsKIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCk7
CiAKIERFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIHZjcHVfaWQpOwotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
