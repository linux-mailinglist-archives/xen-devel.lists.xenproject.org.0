Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4112211FC26
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 01:24:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ige6t-0006hk-Uj; Mon, 16 Dec 2019 00:19:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/tIY=2G=gmail.com=boqun.feng@srs-us1.protection.inumbo.net>)
 id 1ige6s-0006hd-IW
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 00:19:38 +0000
X-Inumbo-ID: bc1b5f6a-1f99-11ea-88e7-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc1b5f6a-1f99-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 00:19:33 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 21so1146447qky.4
 for <xen-devel@lists.xenproject.org>; Sun, 15 Dec 2019 16:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVpf63Qd4TX5I9v6qZSm1vjU4JS6/z/tTXxQbaf4TBY=;
 b=D3mlEWftH/mVQoC67x99bNXce+yDo9uBMNOqzw1fGt6PhXd+LwHuVyfikJEw19svXT
 ahktUA0bg5LNwRtDfUXFXJtgYcVcz+WvgYNgKN52gtMp51f/HAJu//uMElnRofK2Dy+9
 Ewadu7SGqcg12XJ5zZTRprJ3NaY1znutfpXRlG4jrG/SFwQGxLAzeNLLgox4fEnUWkQw
 +J5igAXDv+iyg+LeIsh1Zj443GBnRzKKPnfRFWGm4ewPAuxQE/ACSVBktckgGgyZgqCR
 6LqvzSPpBJdipjqwU1V6qSP+X4WGwMPO3iyNej07cCFd7D54L3xTElk/AZTKjMtaVZW1
 RD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVpf63Qd4TX5I9v6qZSm1vjU4JS6/z/tTXxQbaf4TBY=;
 b=NVZCvkM7spDq/asK7oniGmlVQhC0YXm3RK1YsOrvRDQrIUyB83hqHr1Hk/6h628jE+
 J7Y3VYw83Z7Q5tjPZzUCH2Je7VO4/RCqETpEXXbBF6wF/JY+xmOFeMBngWJtG25yXuAA
 1/N7ixd6QFNbatMMydvLY0QTwkHXsxolZJD7pX5qZnRbcHuC4hLLXwToD7Yz7ZrBvEzc
 TOoQQyGq1m00fiFLLPFwup+z4i61JQ+Lq3BuHUwirFH43BTHHKJOB530Zw4UMiyjXAff
 nt/qGJ+lmqJiPgFNdC2hMkCFpMZ6Kj8aBM6nfjrkoZOliBIzfbrHnVZ6Mb6FfwHO2QXl
 Yzkg==
X-Gm-Message-State: APjAAAWsf+b4mS7EeutAXrir9zNGpFAKDT5skOr9KW4b5p/YSpZ/6cxT
 z4+eM13o431mpxIynYTsw1s=
X-Google-Smtp-Source: APXvYqx3q9o5IJDrNl2qRBw2P9CxytUA2HNSYLBG2f5II++aBKtmeVfY050HNOiMvaqJ5iFUhF31NA==
X-Received: by 2002:a37:4047:: with SMTP id n68mr24901320qka.258.1576455573256; 
 Sun, 15 Dec 2019 16:19:33 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id g16sm5431819qkk.61.2019.12.15.16.19.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Dec 2019 16:19:32 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 851932243F;
 Sun, 15 Dec 2019 19:19:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 15 Dec 2019 19:19:31 -0500
X-ME-Sender: <xms:k832XadXgrGcvhHXrQgixQfusVx3I2zgBe1vYGxMM1OBi1ia7pJkfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtgedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhorhhtvggutfgvtghiphdvucdlgedtmdenucfjughrpefhvffufffkofgjfhgggfes
 tdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnh
 hgsehgmhgrihhlrdgtohhmqeenucfkphephedvrdduheehrdduuddurdejudenucfrrghr
 rghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrg
 hlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeep
 ghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:k832XUi8fzGm26Bbd8FBjgs6V_X1Z6B77yd2PtlZUsUELS9iVEIaaA>
 <xmx:k832XW_7t8KIwsegj48VkjbCQyL995c-MkpH-jRx3rDzPL12KDDzDw>
 <xmx:k832XSbyuh6uVe5LGlV4GvbhPrxOw1t7oRzFp7J8wp3DS_UzsmDG0g>
 <xmx:k832XfcXy6BV60t5ZHB6ZgVtmayIz_Uvuf_yjzhevdi1WusdebQV2BB0RDQ>
Received: from localhost (unknown [52.155.111.71])
 by mail.messagingengine.com (Postfix) with ESMTPA id DF9058005C;
 Sun, 15 Dec 2019 19:19:30 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Dec 2019 08:19:17 +0800
Message-Id: <20191216001922.23008-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216001922.23008-1-boqun.feng@gmail.com>
References: <20191216001922.23008-1-boqun.feng@gmail.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC 1/6] arm64: hyperv: Allow hv_get_raw_timer()
 definition to be overridden
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

SW4gb3JkZXIgdG8gc3VwcG9ydCB2RFNPLCBodl9yZWFkX3RzY19wYWdlKCkgc2hvdWxkIGJlIGFi
bGUgdG8gYmUgY2FsbGVkCmZyb20gdXNlcnNwYWNlIGlmIHRzYyBwYWdlIG1hcHBlZC4gQXMgYSBy
ZXN1bHQsIGh2X2dldF9yYXdfdGltZXIoKSwKY2FsbGVkIGJ5IGh2X3JlYWRfdHNjX3BhZ2UoKSBy
ZXF1aXJlcyB0byBiZSBjYWxsZWQgYnkgYm90aCBrZXJuZWwgYW5kCnZEU08uIEN1cnJlbnRseSwg
aXQncyBkZWZpbmVkIGFzIGFyY2hfdGltZXJfcmVhZF9jb3VudGVyKCksIHdoaWNoIGlzIGEKZnVu
Y3Rpb24gcG9pbnRlciBpbml0aWFsaXplZCAodXNpbmcgYSBrZXJuZWwgYWRkcmVzcykgYnkgdGhl
IGFyY2ggdGltZXIKZHJpdmVyLCB0aGVyZWZvcmUgbm90IHVzYWJsZSBpbiB2RFNPLgoKRml4IHRo
aXMgYnkgYWxsb3dpbmcgYSBwcmV2aW91cyBkZWZpbml0aW9uIHRvIG92ZXJyaWRlIHRoZSBkZWZh
dWx0IG9uZSwKc28gdGhhdCBpbiB2RFNPIGNvZGUsIHdlIGNhbiBkZWZpbmUgaXQgYXMgYSBmdW5j
dGlvbiBjYWxsYWJsZSBpbgp1c2Vyc3BhY2UuCgpTaWduZWQtb2ZmLWJ5OiBCb3F1biBGZW5nIChN
aWNyb3NvZnQpIDxib3F1bi5mZW5nQGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybTY0L2luY2x1ZGUv
YXNtL21zaHlwZXJ2LmggfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
bXNoeXBlcnYuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vbXNoeXBlcnYuaAppbmRleCBhODQ2
OGE2MTE5MTIuLjljYzRhZWRkZjJkMCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2Fz
bS9tc2h5cGVydi5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vbXNoeXBlcnYuaApAQCAt
OTcsOCArOTcsMTUgQEAgZXh0ZXJuIHZvaWQgaHZfZ2V0X3ZwcmVnXzEyOCh1MzIgcmVnLCBzdHJ1
Y3QgaHZfZ2V0X3ZwX3JlZ2lzdGVyX291dHB1dCAqcmVzdWx0KTsKICNkZWZpbmUgaHZfZGlzYWJs
ZV9zdGltZXIwX3BlcmNwdV9pcnEoaXJxKQlkaXNhYmxlX3BlcmNwdV9pcnEoaXJxKQogI2VuZGlm
CiAKLS8qIEFSTTY0IHNwZWNpZmljIGNvZGUgdG8gcmVhZCB0aGUgaGFyZHdhcmUgY2xvY2sgKi8K
Ky8qCisgKiBBUk02NCBzcGVjaWZpYyBjb2RlIHRvIHJlYWQgdGhlIGhhcmR3YXJlIGNsb2NrLgor
ICoKKyAqIFRoaXMgY291bGQgYmUgdXNlZCBpbiBib3RoIGtlcm5lbCBzcGFjZSBhbmQgdXNlcnNw
YWNlICh2RFNPKSwgc28gbWFrZSBpdAorICogcG9zc2libGUgZm9yIGEgcHJldmlvdXMgZGVmaW5p
dGlvbiB0byBvdmVycmlkZSB0aGUgZGVmYXVsdCBvbmUuCisgKi8KKyNpZm5kZWYgaHZfZ2V0X3Jh
d190aW1lcgogI2RlZmluZSBodl9nZXRfcmF3X3RpbWVyKCkgYXJjaF90aW1lcl9yZWFkX2NvdW50
ZXIoKQorI2VuZGlmCiAKICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9tc2h5cGVydi5oPgogCi0tIAoy
LjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
