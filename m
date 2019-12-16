Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4D311FC27
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 01:24:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ige7F-0006nh-87; Mon, 16 Dec 2019 00:20:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/tIY=2G=gmail.com=boqun.feng@srs-us1.protection.inumbo.net>)
 id 1ige7D-0006n6-Ct
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 00:19:59 +0000
X-Inumbo-ID: cb387a82-1f99-11ea-b6f1-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb387a82-1f99-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 00:19:58 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c17so3085676qkg.7
 for <xen-devel@lists.xenproject.org>; Sun, 15 Dec 2019 16:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=usI7ZLlrtnzO1xtvE7qJdWgNGyWRiX0DoyyW1z56fjQ=;
 b=ZcL1vAcUgKjuyp97OeIAQ0epiqggmuG3QljxDovgnIuPeifT/+ziT7ngleb475gqEn
 9Id1YfFkwJtqKMX0R1rk4968ygu0mENq1hVBHVVJjj7GS6YEfuggH3SpS/odI+aZbuZ+
 wR1yKLxVoaENYO8aHVbpIBMGdc4fc6a0jRTmluYEgR7vyqYJmsDxWaczEy3PKU2+pxMW
 4r5P1g4JLkfLLzURF05vGcUJxbw7J3nbdZaBY2LNdkHfzssQ0qogl+PdzqVn4BSuUfn+
 nbAbEfWsiinDCitUgRfKhjdzIctPFTcitdQwBDqSgMyKeBA1RokL0sW+os4Hxyvm/m+6
 lbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=usI7ZLlrtnzO1xtvE7qJdWgNGyWRiX0DoyyW1z56fjQ=;
 b=bEzhwG+NmIvmCRVTMU/wJ7jw8YOzhtLuVZqAUMEgGXt5y1Lk5mmPLjVEZE4pqCXjeq
 yQkIt7Me+cX4TnkdBsBXqFSM3sGjUf6Uo5lkQV+N2K2yXIatuBNwkOSfo/1vSxYsw75f
 PIZZXXIWNCkRB6nFpisej8vtbECn9VstTxxRjKIh2+hpTNOtlGViJd9g4dR8AAbKuu7W
 LQfX1595O/EjloWCCN/T+XMuNAM/5+fXIQAjwLgGeZ4YN38Hqiv4anGytHQpsDKOflqx
 sjhJzLj3+/QKxmP5XQTyX3jwjaKs3c88VcV9o7ZJtdUf3hfM/amE7NA5u1JPNBsHoE8J
 2tsA==
X-Gm-Message-State: APjAAAXcjA6tcdbkm3wWM70YrYugpK4XupItro5ZvRtnK8Tb+VetRWaq
 5B8axcdrHNWPtyCa08KEYPU=
X-Google-Smtp-Source: APXvYqyuGzwONPf0HzeujWXJY0HQfLDKVVu2G/wH3GBxfrZbbw4VCaxRxyLj5AO/cD1ig93OBJk46w==
X-Received: by 2002:a05:620a:12d5:: with SMTP id
 e21mr24635272qkl.44.1576455598605; 
 Sun, 15 Dec 2019 16:19:58 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id c3sm5440772qkk.8.2019.12.15.16.19.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Dec 2019 16:19:58 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 9C34422430;
 Sun, 15 Dec 2019 19:19:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sun, 15 Dec 2019 19:19:57 -0500
X-ME-Sender: <xms:rc32XeSK_XIhpZp_q6SHBGjzCrk7LYTS0EdnFG89Fi_i0f50st2aLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtgedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhorhhtvggutfgvtghiphdvucdlgedtmdenucfjughrpefhvffufffkofgjfhgggfes
 tdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnh
 hgsehgmhgrihhlrdgtohhmqeenucfkphephedvrdduheehrdduuddurdejudenucfrrghr
 rghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrg
 hlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeep
 ghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvnecuvehluhhsthgvrhfuihiivgepfe
X-ME-Proxy: <xmx:rc32XX6d4jyRmd4tKl3p9ANUzk8f_g2bkGBtCdx4i3jUIRFJRCMOwQ>
 <xmx:rc32XY0BaUO6RdE8-TbG8yWCGc0H1qf_yj9N5hWRyK05jdyeSAKEbA>
 <xmx:rc32XUnz94HOWgvI1mfW1PO5gpiP854b7tKxdNAYRcyw8TDkcTvztw>
 <xmx:rc32XRUat6VRrm1rGJNTqr5wfVloWQuRubAEE2UNJMw1hd2W28FeOHH7XYQ>
Received: from localhost (unknown [52.155.111.71])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1C0B1306012F;
 Sun, 15 Dec 2019 19:19:56 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Dec 2019 08:19:21 +0800
Message-Id: <20191216001922.23008-6-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216001922.23008-1-boqun.feng@gmail.com>
References: <20191216001922.23008-1-boqun.feng@gmail.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC 5/6] arm64: hyperv: Enable userspace to read cntvct
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

U2luY2UgcmVhZGluZyBoeXBlcnYtdGltZXIgY2xvY2tzb3VyY2UgcmVxdWlyZXMgcmVhZGluZyBj
bnR2Y3QsCnVzZXJzcGFjZSBzaG91bGQgYmUgYWxsb3dlZCB0byByZWFkIGl0LCBvdGhlcndpc2Ug
cmVhZGluZyBjbnR2Y3Qgd2lsbApyZXN1bHQgaW4gdHJhcHMsIHdoaWNoIG1ha2VzIHZzeXNjYWxs
J3MgY29zdCBzaW1pbGFyIGNvbXBhcmVkIHRvCnN5c2NhbGwncy4KClNvIGVuYWJsZSBpdCBvbiBl
dmVyeSBjcHUgd2hlbiBhIEh5cGVyLVYgZ3Vlc3QgYm9vdGluZyB1cC4KClNpZ25lZC1vZmYtYnk6
IEJvcXVuIEZlbmcgKE1pY3Jvc29mdCkgPGJvcXVuLmZlbmdAZ21haWwuY29tPgotLS0KIGFyY2gv
YXJtNjQvaHlwZXJ2L2h2X2luaXQuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaHlwZXJ2L2h2X2luaXQuYyBiL2Fy
Y2gvYXJtNjQvaHlwZXJ2L2h2X2luaXQuYwppbmRleCA4NmU0NjIxZDU4ODUuLjFlYTk3ZWNmYjE0
MyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9oeXBlcnYvaHZfaW5pdC5jCisrKyBiL2FyY2gvYXJt
NjQvaHlwZXJ2L2h2X2luaXQuYwpAQCAtMjcsNiArMjcsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3Nj
aGVkX2Nsb2NrLmg+CiAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvYnVnLmg+CiAjaW5jbHVkZSA8YXNt
L2h5cGVydi10bGZzLmg+CisjaW5jbHVkZSA8YXNtL2FyY2hfdGltZXIuaD4KICNpbmNsdWRlIDxh
c20vbXNoeXBlcnYuaD4KICNpbmNsdWRlIDxhc20vc3lzcmVnLmg+CiAjaW5jbHVkZSA8Y2xvY2tz
b3VyY2UvaHlwZXJ2X3RpbWVyLmg+CkBAIC00NSw2ICs0Niw3IEBAIEVYUE9SVF9TWU1CT0xfR1BM
KGh2X21heF92cF9pbmRleCk7CiBzdGF0aWMgaW50IGh2X2NwdV9pbml0KHVuc2lnbmVkIGludCBj
cHUpCiB7CiAJdTY0IG1zcl92cF9pbmRleDsKKwl1MzIgY250a2N0bDsKIAogCWh2X2dldF92cF9p
bmRleChtc3JfdnBfaW5kZXgpOwogCkBAIC01Myw2ICs1NSwxMSBAQCBzdGF0aWMgaW50IGh2X2Nw
dV9pbml0KHVuc2lnbmVkIGludCBjcHUpCiAJaWYgKG1zcl92cF9pbmRleCA+IGh2X21heF92cF9p
bmRleCkKIAkJaHZfbWF4X3ZwX2luZGV4ID0gbXNyX3ZwX2luZGV4OwogCisJLyogRW5hYmxlIEVM
MCB0byBhY2Nlc3MgY250dmN0ICovCisJY250a2N0bCA9IGFyY2hfdGltZXJfZ2V0X2NudGtjdGwo
KTsKKwljbnRrY3RsIHw9IEFSQ0hfVElNRVJfVVNSX1ZDVF9BQ0NFU1NfRU47CisJYXJjaF90aW1l
cl9zZXRfY250a2N0bChjbnRrY3RsKTsKKwogCXJldHVybiAwOwogfQogCi0tIAoyLjI0LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
