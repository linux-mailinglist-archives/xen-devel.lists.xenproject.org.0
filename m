Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BF111FC23
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 01:23:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ige7N-0007Sl-HI; Mon, 16 Dec 2019 00:20:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/tIY=2G=gmail.com=boqun.feng@srs-us1.protection.inumbo.net>)
 id 1ige7M-0007Ow-09
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 00:20:08 +0000
X-Inumbo-ID: cfc2af5a-1f99-11ea-88e7-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfc2af5a-1f99-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 00:20:07 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id j9so2938094qkk.1
 for <xen-devel@lists.xenproject.org>; Sun, 15 Dec 2019 16:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7S615KofXaQ1yUG/3GM94cEkec6rvE87OWT0R1mkHVE=;
 b=nqPgX5mFOvAOvhSP8TsLpj5UaQakaOAGyTfIYXnrJ98dEtbMpEP8y70bY2krwxvBGv
 3sK8HR/8589X7H4aSpRQYDfPVFxXCiHAWknqhsEK4Dqnmtom1eCmt/84ndxMicvGc0tX
 SK1DtIiUK/u/cmwstnoeopb3cfXxGD4PGhoanmWF1wQx39CgqDz+4kssxSIdbFWyWPOB
 y63NGEJciBnX0t8sIT3OXdy/PBOf6jMsRpwBBJWBXrJ9vblwvEfFYeeNeGZ2SeNxLe1f
 oSONG29STbtZuutO4OQ8C6uyMnSUAFvzBbOaI53Zjw4vhBWJIWjfAI2QyCTMnpNHF0F/
 6NtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7S615KofXaQ1yUG/3GM94cEkec6rvE87OWT0R1mkHVE=;
 b=o0hQY65NiZVtQaQFmBuSVBIhwVdam8R/IsP4wML81kSe0WBmdNQ6d4YpwTVaym/s3+
 /pbTxC09n0ZA8F5nH0oLB3c3WYAORSr6Hq9pGQ8f+vSn+8HuaTuzKFpgPnA7S0skyVUz
 XWL8heCp55QMAISFOsXecyl/e1PQXBZOEtDe8+Gf0HAj3tH/cYTi/WlAYk25cSssMTAD
 LpilLAbdd6BfnYvFqlcKa8pGJpmOWpTzG4FY/LIdZKmffSa3MCEs4DVjhW3OKg9h7Sx5
 Gl+nAHTmfjUaKIUQ2vGCdhHbJ8WNVBbb+2YdK3m1O7erqzpfvVCmS+uBbLFS7p/DpzL9
 9svQ==
X-Gm-Message-State: APjAAAXr722Tf+QA3tSlPM3rINPiWdW2foPhXkgCShPMXxkJgd4bGzq4
 NXSGxxyVwPKRqWXxut5Z+uk=
X-Google-Smtp-Source: APXvYqw+Sd5f8LCDwfYgXxyt3Pq91Kobn432DMObcmpR4URJPQMO29VkBjNnlDH47LvcwB6Snoz7LA==
X-Received: by 2002:a37:684a:: with SMTP id d71mr22545035qkc.201.1576455606206; 
 Sun, 15 Dec 2019 16:20:06 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id h1sm5312169qkc.38.2019.12.15.16.20.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Dec 2019 16:20:05 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 18F2B22442;
 Sun, 15 Dec 2019 19:20:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 15 Dec 2019 19:20:04 -0500
X-ME-Sender: <xms:s832Xf_utJ7BzzzxXT8sbRHR_jIVZkfwcioGr8KILEE-3_xWYJBHKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtgedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhorhhtvggutfgvtghiphdvucdlgedtmdenucfjughrpefhvffufffkofgjfhgggfes
 tdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnh
 hgsehgmhgrihhlrdgtohhmqeenucfkphephedvrdduheehrdduuddurdejudenucfrrghr
 rghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrg
 hlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeep
 ghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvnecuvehluhhsthgvrhfuihiivgepge
X-ME-Proxy: <xmx:s832Xaf6uB8opnROUrWBVo_oq9K0wWLiPN_7SZTDlz-uaVSDV_V5-Q>
 <xmx:s832XclLRpyr1FDzNKmXKAtYVIdNduUR00tMwI8SBw9qloS3PHxvIg>
 <xmx:s832XVwgiH4W1-JxHD2H0dy8J1UrSR2HXikSjfrgI9BuAUt7nedTCg>
 <xmx:tM32Xdbw_MsAUFdQXzs8LV5BQT0Fa223mJ-DPb6TdsQ2b8XitXSIMLuE1VQ>
Received: from localhost (unknown [52.155.111.71])
 by mail.messagingengine.com (Postfix) with ESMTPA id 69CB980063;
 Sun, 15 Dec 2019 19:20:03 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Dec 2019 08:19:22 +0800
Message-Id: <20191216001922.23008-7-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216001922.23008-1-boqun.feng@gmail.com>
References: <20191216001922.23008-1-boqun.feng@gmail.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC 6/6] arm64: hyperv: Enable vDSO
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
Cc: Sasha Levin <sashal@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2ltaWxhciB0byB4ODYsIGFkZCBhIG5ldyB2Y2xvY2tfbW9kZSBWQ0xPQ0tfSFZDTE9DSywgYW5k
IHJldXNlIHRoZQpodl9yZWFkX3RzY19wYWdlKCkgZm9yIHVzZXJzcGFjZSB0byByZWFkIHRzYyBw
YWdlIGNsb2Nrc291cmNlLgoKU2lnbmVkLW9mZi1ieTogQm9xdW4gRmVuZyAoTWljcm9zb2Z0KSA8
Ym9xdW4uZmVuZ0BnbWFpbC5jb20+Ci0tLQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9jbG9ja3Nv
dXJjZS5oICAgICAgIHwgIDMgKystCiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL21zaHlwZXJ2Lmgg
ICAgICAgICAgfCAgMiArLQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRh
eS5oIHwgMTkgKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vY2xvY2tzb3VyY2UuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2xvY2tzb3VyY2UuaApp
bmRleCBmYmU4MDA1NzQ2OGMuLmM2YWNkNDVmZTc0OCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS9jbG9ja3NvdXJjZS5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2xv
Y2tzb3VyY2UuaApAQCAtNCw3ICs0LDggQEAKIAogI2RlZmluZSBWQ0xPQ0tfTk9ORQkwCS8qIE5v
IHZEU08gY2xvY2sgYXZhaWxhYmxlLgkJKi8KICNkZWZpbmUgVkNMT0NLX0NOVFZDVAkxCS8qIHZE
U08gc2hvdWxkIHVzZSBjbnR2Y250CQkqLwotI2RlZmluZSBWQ0xPQ0tfTUFYCTEKKyNkZWZpbmUg
VkNMT0NLX0hWQ0xPQ0sJMgkvKiB2RFNPIHNob3VsZCB1c2UgdnJlYWRfaHZjbG9jaygpCSovCisj
ZGVmaW5lIFZDTE9DS19NQVgJMgogCiBzdHJ1Y3QgYXJjaF9jbG9ja3NvdXJjZV9kYXRhIHsKIAlp
bnQgdmNsb2NrX21vZGU7CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL21zaHlw
ZXJ2LmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL21zaHlwZXJ2LmgKaW5kZXggMGFmYjAwZTM1
MDFkLi43Yzg1ZGQ4MTZkY2EgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vbXNo
eXBlcnYuaAorKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL21zaHlwZXJ2LmgKQEAgLTkwLDcg
KzkwLDcgQEAgZXh0ZXJuIHZvaWQgaHZfZ2V0X3ZwcmVnXzEyOCh1MzIgcmVnLCBzdHJ1Y3QgaHZf
Z2V0X3ZwX3JlZ2lzdGVyX291dHB1dCAqcmVzdWx0KTsKICNkZWZpbmUgaHZfc2V0X3JlZmVyZW5j
ZV90c2ModmFsKSBcCiAJCWh2X3NldF92cHJlZyhIVl9SRUdJU1RFUl9SRUZFUkVOQ0VfVFNDLCB2
YWwpCiAjZGVmaW5lIGh2X3NldF9jbG9ja3NvdXJjZV92ZHNvKHZhbCkgXAotCQkoKHZhbCkuYXJj
aGRhdGEudmNsb2NrX21vZGUgPSBWQ0xPQ0tfTk9ORSkKKwkJKCh2YWwpLmFyY2hkYXRhLnZjbG9j
a19tb2RlID0gVkNMT0NLX0hWQ0xPQ0spCiAKICNpZiBJU19FTkFCTEVEKENPTkZJR19IWVBFUlYp
CiAjZGVmaW5lIGh2X2VuYWJsZV9zdGltZXIwX3BlcmNwdV9pcnEoaXJxKQllbmFibGVfcGVyY3B1
X2lycShpcnEsIDApCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Zkc28vZ2V0
dGltZW9mZGF5LmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmgK
aW5kZXggZTZlM2ZlMDQ4OGM3Li43ZTY4OWI5MDNmNGQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQv
aW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaAorKysgYi9hcmNoL2FybTY0L2luY2x1ZGUv
YXNtL3Zkc28vZ2V0dGltZW9mZGF5LmgKQEAgLTY3LDYgKzY3LDIwIEBAIGludCBjbG9ja19nZXRy
ZXNfZmFsbGJhY2soY2xvY2tpZF90IF9jbGtpZCwgc3RydWN0IF9fa2VybmVsX3RpbWVzcGVjICpf
dHMpCiAJcmV0dXJuIHJldDsKIH0KIAorI2lmZGVmIENPTkZJR19IWVBFUlZfVElNRVIKKy8qIFRo
aXMgd2lsbCBvdmVycmlkZSB0aGUgZGVmYXVsdCBodl9nZXRfcmF3X3RpbWVyKCkgKi8KKyNkZWZp
bmUgaHZfZ2V0X3Jhd190aW1lcigpIF9fYXJjaF9jb3VudGVyX2dldF9jbnR2Y3QoKQorI2luY2x1
ZGUgPGNsb2Nrc291cmNlL2h5cGVydl90aW1lci5oPgorCitleHRlcm4gc3RydWN0IG1zX2h5cGVy
dl90c2NfcGFnZQorX2h2Y2xvY2tfcGFnZSBfX2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5KCJoaWRk
ZW4iKSkpOworCitzdGF0aWMgdTY0IHZyZWFkX2h2Y2xvY2sodm9pZCkKK3sKKwlyZXR1cm4gaHZf
cmVhZF90c2NfcGFnZSgmX2h2Y2xvY2tfcGFnZSk7Cit9CisjZW5kaWYKKwogc3RhdGljIF9fYWx3
YXlzX2lubGluZSB1NjQgX19hcmNoX2dldF9od19jb3VudGVyKHMzMiBjbG9ja19tb2RlKQogewog
CXU2NCByZXM7CkBAIC03OCw2ICs5MiwxMSBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHU2NCBf
X2FyY2hfZ2V0X2h3X2NvdW50ZXIoczMyIGNsb2NrX21vZGUpCiAJaWYgKGNsb2NrX21vZGUgPT0g
VkNMT0NLX05PTkUpCiAJCXJldHVybiBfX1ZEU09fVVNFX1NZU0NBTEw7CiAKKyNpZmRlZiBDT05G
SUdfSFlQRVJWX1RJTUVSCisJaWYgKGxpa2VseShjbG9ja19tb2RlID09IFZDTE9DS19IVkNMT0NL
KSkKKwkJcmV0dXJuIHZyZWFkX2h2Y2xvY2soKTsKKyNlbmRpZgorCiAJLyoKIAkgKiBUaGlzIGlz
YigpIGlzIHJlcXVpcmVkIHRvIHByZXZlbnQgdGhhdCB0aGUgY291bnRlciB2YWx1ZQogCSAqIGlz
IHNwZWN1bGF0ZWQuCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
