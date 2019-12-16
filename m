Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5218011FC1F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 01:23:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ige6z-0006i3-7X; Mon, 16 Dec 2019 00:19:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/tIY=2G=gmail.com=boqun.feng@srs-us1.protection.inumbo.net>)
 id 1ige6x-0006hy-J1
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 00:19:43 +0000
X-Inumbo-ID: be0b1a18-1f99-11ea-a1e1-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be0b1a18-1f99-11ea-a1e1-bc764e2007e4;
 Mon, 16 Dec 2019 00:19:36 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id g17so3149341qtp.11
 for <xen-devel@lists.xenproject.org>; Sun, 15 Dec 2019 16:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/LWpy3sT0NojI+6lHGq8dZmjGNhrVEiL5TtdHICIZc4=;
 b=YWwtUpgdB4C7Q4X0xMgmsDhu8K2YcKTpSy81xtryD588YUY101myAfwdgspbcp++85
 6rUIKyZFgNjmsF4vh3aNwsJ/DIr5fJmGbJgJRAG4m5DMAcJVWbNmgUvu85ZRr82QbH7N
 SjPcnTI82np5u2GBasGGK7q0ufep07XQTVE2LKC4dmpRPeGgmVk+Vbvn5SP5P+2/c0d+
 PW4xPb5dY7sVukOSE6AtRQFyG1c3wP0wyFooKOHxnXx9A2gSO+syfVPBz/XUSPLqmuEH
 O7l6gAeT6p4sbwV22GMICMLrj6hUwnTvwhKBHrhQNO6Z1EXh996On8A3IZd8QASa4dLh
 Jl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/LWpy3sT0NojI+6lHGq8dZmjGNhrVEiL5TtdHICIZc4=;
 b=l3s7X3q51aJuE9+AB/SLAmjhYZRRKfU+HV2NChNqOx8YY3IqmOvZbNMNWbQFtmRIwQ
 8y9d+SGVxaBXDdrcR8bMeyJv1DqOlAA092DI6H/kmoX98gGW7Ws2yxJ1qTJzDeDRRzA5
 Vjck+iRTAIyIUNFFHk2B3yzurKX0mwYRKKbKtQhvihJt4rqN4v9M+CTWRKVb4aPTpKKJ
 xhG4s7UY7K/IOqsPkCm/KkqxtDAfQQqB3E3ZfKCGM7Op2yd/MibA/5yNageYrLsUuFOJ
 QpGP7HF5ZV7tA8kQvjuDfhswRq9j5nGx4tvGx8JZuBplqJRB0J2P+Z1bKggQEYg3pVxQ
 FIXw==
X-Gm-Message-State: APjAAAWI8ImZEguV+eA+d73CEtCsDQXmyYxWKLRirHiCGZOgW/IQw3TT
 B5+KK1TWthnd6oR89AYExy4=
X-Google-Smtp-Source: APXvYqyhIIjZfzlpUFVMB/tiV3ydzxJugA4tfdYzQ1/oDFfstC6D6w9VTmT3ruQGJ7EWghnBfRjF2Q==
X-Received: by 2002:aed:2bc2:: with SMTP id e60mr22652718qtd.115.1576455576496; 
 Sun, 15 Dec 2019 16:19:36 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id v125sm5409912qka.47.2019.12.15.16.19.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Dec 2019 16:19:36 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 77F3122434;
 Sun, 15 Dec 2019 19:19:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 15 Dec 2019 19:19:35 -0500
X-ME-Sender: <xms:l832XfZQSIBODTOKHYP4OiihyxvNi_m-U8HmMcdMAJwD7fT-DlWZ1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtgedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhorhhtvggutfgvtghiphdvucdlgedtmdenucfjughrpefhvffufffkofgjfhgggfes
 tdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnh
 hgsehgmhgrihhlrdgtohhmqeenucfkphephedvrdduheehrdduuddurdejudenucfrrghr
 rghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrg
 hlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeep
 ghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:l832XfDsMu_b4P7cjdMpjiVhjWGLh_COxGdpGHu1Ng78W0-PKoIj6g>
 <xmx:l832XdFRYH1QxOB5aK2Pny-EtgZguMv0iUEYiIAbwvBhn9J-hOp8hw>
 <xmx:l832XaOm27CluqGyM6I7GBn5R-49iEMEdkx-rmXJKicVKLx1SwzaCw>
 <xmx:l832XZNG7-vMXq9oqX4_jGmE5UiJ3XjAVM63umg-Sj4VkYZ4Dks7cHrGOzE>
Received: from localhost (unknown [52.155.111.71])
 by mail.messagingengine.com (Postfix) with ESMTPA id A59FA80059;
 Sun, 15 Dec 2019 19:19:34 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Dec 2019 08:19:18 +0800
Message-Id: <20191216001922.23008-3-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216001922.23008-1-boqun.feng@gmail.com>
References: <20191216001922.23008-1-boqun.feng@gmail.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC 2/6] arm64: vdso: Add support for multiple vDSO
 data pages
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
 Stefano Stabellini <sstabellini@kernel.org>, Matteo Croce <mcroce@redhat.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3BsaXQgX192ZHNvX2FiaTo6dmRzb19wYWdlcyBpbnRvIG5yX3Zkc29fe2RhdGEsY29kZX1fcGFn
ZXMsIHNvIHRoYXQKX19zZXR1cF9hZGRpdGlvbmFsX3BhZ2VzKCkgY291bGQgd29yayB3aXRoIG11
bHRpcGxlIHZEU08gZGF0YSBwYWdlcyB3aXRoCnRoZSBzZXR1cCBmcm9tIF9fdmRzb19pbml0KCku
CgpNdWx0aXBsZSB2RFNPIGRhdGEgcGFnZXMgYXJlIHJlcXVpcmVkIHdoZW4gcnVubmluZyBpbiBh
IHZpcnR1YWxpemVkCmVudmlyb25tZW50LCB3aGVyZSB0aGUgY3ljbGVzIHJlYWQgZnJvbSBjbnR2
Y3QgYXQgdXNlcnNwYWNlIG5lZWQgdG8KYmUgYWRqdXN0ZWQgd2l0aCBzb21lIGRhdGEgZnJvbSBh
IHBhZ2UgbWFpbnRhaW5lZCBieSB0aGUgaHlwZXJ2aXNvci4gRm9yCmV4YW1wbGUsIHRoZSBUU0Mg
cGFnZSBpbiBIeXBlci1WLgoKVGhpcyBpcyBhIHByZXJlcXVpc2l0ZSBmb3IgdkRTTyBzdXBwb3J0
IGluIEFSTTY0IG9uIEh5cGVyLVYuCgpTaWduZWQtb2ZmLWJ5OiBCb3F1biBGZW5nIChNaWNyb3Nv
ZnQpIDxib3F1bi5mZW5nQGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybTY0L2tlcm5lbC92ZHNvLmMg
fCA0MyArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9rZXJuZWwvdmRzby5jIGIvYXJjaC9hcm02NC9rZXJuZWwvdmRzby5jCmluZGV4IDM1
NGIxMWUyN2MwNy4uYjliNWVjN2EzMDg0IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2tlcm5lbC92
ZHNvLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvdmRzby5jCkBAIC01MCw3ICs1MCw4IEBAIHN0
cnVjdCBfX3Zkc29fYWJpIHsKIAljb25zdCBjaGFyICpuYW1lOwogCWNvbnN0IGNoYXIgKnZkc29f
Y29kZV9zdGFydDsKIAljb25zdCBjaGFyICp2ZHNvX2NvZGVfZW5kOwotCXVuc2lnbmVkIGxvbmcg
dmRzb19wYWdlczsKKwl1bnNpZ25lZCBsb25nIG5yX3Zkc29fZGF0YV9wYWdlczsKKwl1bnNpZ25l
ZCBsb25nIG5yX3Zkc29fY29kZV9wYWdlczsKIAkvKiBEYXRhIE1hcHBpbmcgKi8KIAlzdHJ1Y3Qg
dm1fc3BlY2lhbF9tYXBwaW5nICpkbTsKIAkvKiBDb2RlIE1hcHBpbmcgKi8KQEAgLTEwMSw2ICsx
MDIsOCBAQCBzdGF0aWMgaW50IF9fdmRzb19pbml0KGVudW0gYXJjaF92ZHNvX3R5cGUgYXJjaF9p
bmRleCkKIHsKIAlpbnQgaTsKIAlzdHJ1Y3QgcGFnZSAqKnZkc29fcGFnZWxpc3Q7CisJc3RydWN0
IHBhZ2UgKip2ZHNvX2NvZGVfcGFnZWxpc3Q7CisJdW5zaWduZWQgbG9uZyBucl92ZHNvX3BhZ2Vz
OwogCXVuc2lnbmVkIGxvbmcgcGZuOwogCiAJaWYgKG1lbWNtcCh2ZHNvX2xvb2t1cFthcmNoX2lu
ZGV4XS52ZHNvX2NvZGVfc3RhcnQsICJcMTc3RUxGIiwgNCkpIHsKQEAgLTEwOCwxNCArMTExLDE4
IEBAIHN0YXRpYyBpbnQgX192ZHNvX2luaXQoZW51bSBhcmNoX3Zkc29fdHlwZSBhcmNoX2luZGV4
KQogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKLQl2ZHNvX2xvb2t1cFthcmNoX2luZGV4XS52ZHNv
X3BhZ2VzID0gKAorCXZkc29fbG9va3VwW2FyY2hfaW5kZXhdLm5yX3Zkc29fZGF0YV9wYWdlcyA9
IDE7CisKKwl2ZHNvX2xvb2t1cFthcmNoX2luZGV4XS5ucl92ZHNvX2NvZGVfcGFnZXMgPSAoCiAJ
CQl2ZHNvX2xvb2t1cFthcmNoX2luZGV4XS52ZHNvX2NvZGVfZW5kIC0KIAkJCXZkc29fbG9va3Vw
W2FyY2hfaW5kZXhdLnZkc29fY29kZV9zdGFydCkgPj4KIAkJCVBBR0VfU0hJRlQ7CiAKLQkvKiBB
bGxvY2F0ZSB0aGUgdkRTTyBwYWdlbGlzdCwgcGx1cyBhIHBhZ2UgZm9yIHRoZSBkYXRhLiAqLwot
CXZkc29fcGFnZWxpc3QgPSBrY2FsbG9jKHZkc29fbG9va3VwW2FyY2hfaW5kZXhdLnZkc29fcGFn
ZXMgKyAxLAotCQkJCXNpemVvZihzdHJ1Y3QgcGFnZSAqKSwKKwlucl92ZHNvX3BhZ2VzID0gdmRz
b19sb29rdXBbYXJjaF9pbmRleF0ubnJfdmRzb19kYXRhX3BhZ2VzICsKKwkJCXZkc29fbG9va3Vw
W2FyY2hfaW5kZXhdLm5yX3Zkc29fY29kZV9wYWdlczsKKworCS8qIEFsbG9jYXRlIHRoZSB2RFNP
IHBhZ2VsaXN0LiAqLworCXZkc29fcGFnZWxpc3QgPSBrY2FsbG9jKG5yX3Zkc29fcGFnZXMsIHNp
emVvZihzdHJ1Y3QgcGFnZSAqKSwKIAkJCQlHRlBfS0VSTkVMKTsKIAlpZiAodmRzb19wYWdlbGlz
dCA9PSBOVUxMKQogCQlyZXR1cm4gLUVOT01FTTsKQEAgLTEyMywxNSArMTMwLDE3IEBAIHN0YXRp
YyBpbnQgX192ZHNvX2luaXQoZW51bSBhcmNoX3Zkc29fdHlwZSBhcmNoX2luZGV4KQogCS8qIEdy
YWIgdGhlIHZEU08gZGF0YSBwYWdlLiAqLwogCXZkc29fcGFnZWxpc3RbMF0gPSBwaHlzX3RvX3Bh
Z2UoX19wYV9zeW1ib2wodmRzb19kYXRhKSk7CiAKLQogCS8qIEdyYWIgdGhlIHZEU08gY29kZSBw
YWdlcy4gKi8KIAlwZm4gPSBzeW1fdG9fcGZuKHZkc29fbG9va3VwW2FyY2hfaW5kZXhdLnZkc29f
Y29kZV9zdGFydCk7CiAKLQlmb3IgKGkgPSAwOyBpIDwgdmRzb19sb29rdXBbYXJjaF9pbmRleF0u
dmRzb19wYWdlczsgaSsrKQotCQl2ZHNvX3BhZ2VsaXN0W2kgKyAxXSA9IHBmbl90b19wYWdlKHBm
biArIGkpOworCXZkc29fY29kZV9wYWdlbGlzdCA9IHZkc29fcGFnZWxpc3QgKworCQkJICAgICB2
ZHNvX2xvb2t1cFthcmNoX2luZGV4XS5ucl92ZHNvX2RhdGFfcGFnZXM7CisKKwlmb3IgKGkgPSAw
OyBpIDwgdmRzb19sb29rdXBbYXJjaF9pbmRleF0ubnJfdmRzb19jb2RlX3BhZ2VzOyBpKyspCisJ
CXZkc29fY29kZV9wYWdlbGlzdFtpXSA9IHBmbl90b19wYWdlKHBmbiArIGkpOwogCi0JdmRzb19s
b29rdXBbYXJjaF9pbmRleF0uZG0tPnBhZ2VzID0gJnZkc29fcGFnZWxpc3RbMF07Ci0JdmRzb19s
b29rdXBbYXJjaF9pbmRleF0uY20tPnBhZ2VzID0gJnZkc29fcGFnZWxpc3RbMV07CisJdmRzb19s
b29rdXBbYXJjaF9pbmRleF0uZG0tPnBhZ2VzID0gdmRzb19wYWdlbGlzdDsKKwl2ZHNvX2xvb2t1
cFthcmNoX2luZGV4XS5jbS0+cGFnZXMgPSB2ZHNvX2NvZGVfcGFnZWxpc3Q7CiAKIAlyZXR1cm4g
MDsKIH0KQEAgLTE0MSwyNiArMTUwLDI2IEBAIHN0YXRpYyBpbnQgX19zZXR1cF9hZGRpdGlvbmFs
X3BhZ2VzKGVudW0gYXJjaF92ZHNvX3R5cGUgYXJjaF9pbmRleCwKIAkJCQkgICAgc3RydWN0IGxp
bnV4X2JpbnBybSAqYnBybSwKIAkJCQkgICAgaW50IHVzZXNfaW50ZXJwKQogewotCXVuc2lnbmVk
IGxvbmcgdmRzb19iYXNlLCB2ZHNvX3RleHRfbGVuLCB2ZHNvX21hcHBpbmdfbGVuOworCXVuc2ln
bmVkIGxvbmcgdmRzb19iYXNlLCB2ZHNvX3RleHRfbGVuLCB2ZHNvX2RhdGFfbGVuOwogCXZvaWQg
KnJldDsKIAotCXZkc29fdGV4dF9sZW4gPSB2ZHNvX2xvb2t1cFthcmNoX2luZGV4XS52ZHNvX3Bh
Z2VzIDw8IFBBR0VfU0hJRlQ7Ci0JLyogQmUgc3VyZSB0byBtYXAgdGhlIGRhdGEgcGFnZSAqLwot
CXZkc29fbWFwcGluZ19sZW4gPSB2ZHNvX3RleHRfbGVuICsgUEFHRV9TSVpFOworCXZkc29fZGF0
YV9sZW4gPSB2ZHNvX2xvb2t1cFthcmNoX2luZGV4XS5ucl92ZHNvX2RhdGFfcGFnZXMgPDwgUEFH
RV9TSElGVDsKKwl2ZHNvX3RleHRfbGVuID0gdmRzb19sb29rdXBbYXJjaF9pbmRleF0ubnJfdmRz
b19jb2RlX3BhZ2VzIDw8IFBBR0VfU0hJRlQ7CiAKLQl2ZHNvX2Jhc2UgPSBnZXRfdW5tYXBwZWRf
YXJlYShOVUxMLCAwLCB2ZHNvX21hcHBpbmdfbGVuLCAwLCAwKTsKKwl2ZHNvX2Jhc2UgPSBnZXRf
dW5tYXBwZWRfYXJlYShOVUxMLCAwLAorCQkJCSAgICAgIHZkc29fZGF0YV9sZW4gKyB2ZHNvX3Rl
eHRfbGVuLCAwLCAwKTsKIAlpZiAoSVNfRVJSX1ZBTFVFKHZkc29fYmFzZSkpIHsKIAkJcmV0ID0g
RVJSX1BUUih2ZHNvX2Jhc2UpOwogCQlnb3RvIHVwX2ZhaWw7CiAJfQogCi0JcmV0ID0gX2luc3Rh
bGxfc3BlY2lhbF9tYXBwaW5nKG1tLCB2ZHNvX2Jhc2UsIFBBR0VfU0laRSwKKwlyZXQgPSBfaW5z
dGFsbF9zcGVjaWFsX21hcHBpbmcobW0sIHZkc29fYmFzZSwgdmRzb19kYXRhX2xlbiwKIAkJCQkg
ICAgICAgVk1fUkVBRHxWTV9NQVlSRUFELAogCQkJCSAgICAgICB2ZHNvX2xvb2t1cFthcmNoX2lu
ZGV4XS5kbSk7CiAJaWYgKElTX0VSUihyZXQpKQogCQlnb3RvIHVwX2ZhaWw7CiAKLQl2ZHNvX2Jh
c2UgKz0gUEFHRV9TSVpFOworCXZkc29fYmFzZSArPSB2ZHNvX2RhdGFfbGVuOwogCW1tLT5jb250
ZXh0LnZkc28gPSAodm9pZCAqKXZkc29fYmFzZTsKIAlyZXQgPSBfaW5zdGFsbF9zcGVjaWFsX21h
cHBpbmcobW0sIHZkc29fYmFzZSwgdmRzb190ZXh0X2xlbiwKIAkJCQkgICAgICAgVk1fUkVBRHxW
TV9FWEVDfAotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
