Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4635A11FC1E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 01:22:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ige7C-0006mV-Ug; Mon, 16 Dec 2019 00:19:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/tIY=2G=gmail.com=boqun.feng@srs-us1.protection.inumbo.net>)
 id 1ige7B-0006m8-FQ
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 00:19:57 +0000
X-Inumbo-ID: ca18ce18-1f99-11ea-88e7-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca18ce18-1f99-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 00:19:56 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id z76so889710qka.2
 for <xen-devel@lists.xenproject.org>; Sun, 15 Dec 2019 16:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qJHTf9gLZO0OmW0oKiFiaoMPD31UWwBIv/AQO8x022Q=;
 b=UCmY/B2PlCGXERTqtwgVAtc2JqLgwUuUJuM66myj3BI4trxbjf3g0TnSG6nt58tAr5
 b6wmX04u6YUR9eii5m+YXMa0EHZfMbtFJz9VgI+Ygal0hewZUXXIVCeMfWObhUfyF884
 ccoID02pgYC30wQuv/zvjzzmDqkBrJJHen+E411WY7HJgXTj6Wx6U3NKulvnMa5Govq9
 DZ478mLox8WXtHb8Ijf7WIhQI4NskICyGfTV78MMNlQTmCghtj1RoL0rAINJT9xwhXHE
 TFSowtCHOCjZF2GfjW67JnBz9elQipCHK+6FWG2DnYry+jvTyvmUDGnSXckYfxC8F5D2
 F7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJHTf9gLZO0OmW0oKiFiaoMPD31UWwBIv/AQO8x022Q=;
 b=VOxIF20+WVull07q3Guy2LO74xKpbr/rxT49VQw8qyeK8fBZLG3+sYgCWN5xAh5Bg/
 hBDGBiO7k0EfeM2+mO3NiuoIFw6756rtiaHTvx2Wz12qxiJOfi4GtdNkGljl4YS5Wnwc
 utEuLv6mtkNO1xYTPiWd/o92PxsBtE14yTUtHn6iZOBb9puFInfuG6X8Vc3ZHUc4Pd8D
 1N0o3nGh4hiFAG6WJewzxcjRSdpfO2b8QskKTVG7TBt5n9JU8wPaGXP/H5HwXDj1/XFV
 VCEGTnJCo+z/O4GwLB/8fchlwcy53ts41mOwrZqz0yEbjDF407nNwQnNlLTQSnuAeHxp
 kVyg==
X-Gm-Message-State: APjAAAXEBJdM3wUfREZiznVIxW4V3786Rzf4XYrhIekM7iJCjJNmVYlJ
 StLZltE4/QclcgpnrM2xrLU=
X-Google-Smtp-Source: APXvYqziDt2MJepPF60CYkhXmMwNyU7utpHzVQ8iPImbF+lXkZE5ubq26nEL7jVGpgS+wAWhxEIl4A==
X-Received: by 2002:a37:a70b:: with SMTP id q11mr24215846qke.393.1576455596683; 
 Sun, 15 Dec 2019 16:19:56 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id i28sm6346240qtc.57.2019.12.15.16.19.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Dec 2019 16:19:56 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id AC2A822434;
 Sun, 15 Dec 2019 19:19:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sun, 15 Dec 2019 19:19:55 -0500
X-ME-Sender: <xms:q832XWJ0BhXQcTrYcjk1bHKva8UP7EuqtVW4y1Ee6GAf1WjhXaMBjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtgedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhorhhtvggutfgvtghiphdvucdlgedtmdenucfjughrpefhvffufffkofgjfhgggfes
 tdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnh
 hgsehgmhgrihhlrdgtohhmqeenucffohhmrghinheplhgushdrshgsnecukfhppeehvddr
 udehhedrudduuddrjedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvg
 hsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheeh
 hedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
 enucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:q832XVNfTCZ3v6Kv4pI60WtD8isXG21O9hss97uye1E18hH8M8o9Ww>
 <xmx:q832Xa_Z41VClRCH52woC1AnmwXQ_d6yDhF5xYPbLu89-tOq4nGZrg>
 <xmx:q832XeLFb0c_FEbHERaQ81gytweMZOLjCeZvlG8JEE1w307tDWYTyA>
 <xmx:q832XbGdsmzDJ6ZAgBmhTbg-OS0cKYnSXKrIkKdBlIb_jlstk1yAcB_QM4Y>
Received: from localhost (unknown [52.155.111.71])
 by mail.messagingengine.com (Postfix) with ESMTPA id EB795306012F;
 Sun, 15 Dec 2019 19:19:54 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Dec 2019 08:19:20 +0800
Message-Id: <20191216001922.23008-5-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216001922.23008-1-boqun.feng@gmail.com>
References: <20191216001922.23008-1-boqun.feng@gmail.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC 4/6] arm64: vdso: hyperv: Map tsc page into vDSO
 if enabled
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Matteo Croce <mcroce@redhat.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gSHlwZXItViwgYSB0c2MgcGFnZSBoYXMgdGhlIGRhdGEgZm9yIGFkanVzdGluZyBjbnR2Y3Qg
bnVtYmVycyB0bwpjbG9ja3NvdXJjZSBjeWNsZXMsIGFuZCB0aGF0J3MgaG93IEh5cGVyLVYgZ3Vl
c3Qga2VybmVsIHJlYWRzIHRoZQpjbG9ja3NvdXJjZS4gSW4gb3JkZXIgdG8gYWxsb3cgdXNlcnNw
YWNlIHRvIHJlYWQgdGhlIHNhbWUgY2xvY2tzb3VyY2UKZGlyZWN0bHksIHRoZSB0c2MgcGFnZSBo
YXMgdG8gYmVlbiBtYXBwZWQgaW50byB1c2Vyc3BhY2UgdmlhIHZEU08uCgpVc2UgdGhlIGZyYW1l
d29yayBmb3IgdkRTTyBzZXQtdXAgaW4gX192ZHNvX2luaXQoKSB0byBkbyB0aGlzLgoKTm90ZTog
aWYgSFlQRVJWX1RJTUVSPXkgYnV0IHRoZSBrZXJuZWwgaXMgdXNpbmcgb3RoZXIgY2xvY2tzb3Vy
Y2Ugb3IKZG9lc24ndCBoYXZlIHRoZSBoeXBlcnYgdGltZXIgY2xvY2tzb3VyY2UsIHRzYyBwYWdl
IHdpbGwgc3RpbGwgYmUgbWFwcGVkCmludG8gdXNlcnNwYWNlLgoKU2lnbmVkLW9mZi1ieTogQm9x
dW4gRmVuZyAoTWljcm9zb2Z0KSA8Ym9xdW4uZmVuZ0BnbWFpbC5jb20+Ci0tLQogYXJjaC9hcm02
NC9rZXJuZWwvdmRzby5jICAgICAgICAgIHwgMTIgKysrKysrKysrKysrCiBhcmNoL2FybTY0L2tl
cm5lbC92ZHNvL3Zkc28ubGRzLlMgfCAxMiArKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
a2VybmVsL3Zkc28uYyBiL2FyY2gvYXJtNjQva2VybmVsL3Zkc28uYwppbmRleCBiOWI1ZWM3YTMw
ODQuLjE4YTYzNDk4N2JkYyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvdmRzby5jCisr
KyBiL2FyY2gvYXJtNjQva2VybmVsL3Zkc28uYwpAQCAtOSw2ICs5LDcgQEAKIAogI2luY2x1ZGUg
PGxpbnV4L2NhY2hlLmg+CiAjaW5jbHVkZSA8bGludXgvY2xvY2tzb3VyY2UuaD4KKyNpbmNsdWRl
IDxjbG9ja3NvdXJjZS9oeXBlcnZfdGltZXIuaD4KICNpbmNsdWRlIDxsaW51eC9lbGYuaD4KICNp
bmNsdWRlIDxsaW51eC9lcnIuaD4KICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgpAQCAtMTA1LDE0
ICsxMDYsMjIgQEAgc3RhdGljIGludCBfX3Zkc29faW5pdChlbnVtIGFyY2hfdmRzb190eXBlIGFy
Y2hfaW5kZXgpCiAJc3RydWN0IHBhZ2UgKip2ZHNvX2NvZGVfcGFnZWxpc3Q7CiAJdW5zaWduZWQg
bG9uZyBucl92ZHNvX3BhZ2VzOwogCXVuc2lnbmVkIGxvbmcgcGZuOworCXN0cnVjdCBtc19oeXBl
cnZfdHNjX3BhZ2UgKnRzY19wYWdlOworCWludCB0c2NfcGFnZV9pZHg7CiAKIAlpZiAobWVtY21w
KHZkc29fbG9va3VwW2FyY2hfaW5kZXhdLnZkc29fY29kZV9zdGFydCwgIlwxNzdFTEYiLCA0KSkg
ewogCQlwcl9lcnIoInZEU08gaXMgbm90IGEgdmFsaWQgRUxGIG9iamVjdCFcbiIpOwogCQlyZXR1
cm4gLUVJTlZBTDsKIAl9CiAKKwkvKiBPbmUgdkRTTyBkYXRhIHBhZ2UgKi8KIAl2ZHNvX2xvb2t1
cFthcmNoX2luZGV4XS5ucl92ZHNvX2RhdGFfcGFnZXMgPSAxOwogCisJLyogR3JhYiB0aGUgSHlw
ZXItViB0c2MgcGFnZSwgaWYgZW5hYmxlZCwgYWRkIG9uZSBtb3JlIHBhZ2UgKi8KKwl0c2NfcGFn
ZSA9IGh2X2dldF90c2NfcGFnZSgpOworCWlmICh0c2NfcGFnZSkKKwkJdHNjX3BhZ2VfaWR4ID0g
dmRzb19sb29rdXBbYXJjaF9pbmRleF0ubnJfdmRzb19kYXRhX3BhZ2VzKys7CisKIAl2ZHNvX2xv
b2t1cFthcmNoX2luZGV4XS5ucl92ZHNvX2NvZGVfcGFnZXMgPSAoCiAJCQl2ZHNvX2xvb2t1cFth
cmNoX2luZGV4XS52ZHNvX2NvZGVfZW5kIC0KIAkJCXZkc29fbG9va3VwW2FyY2hfaW5kZXhdLnZk
c29fY29kZV9zdGFydCkgPj4KQEAgLTEzMCw2ICsxMzksOSBAQCBzdGF0aWMgaW50IF9fdmRzb19p
bml0KGVudW0gYXJjaF92ZHNvX3R5cGUgYXJjaF9pbmRleCkKIAkvKiBHcmFiIHRoZSB2RFNPIGRh
dGEgcGFnZS4gKi8KIAl2ZHNvX3BhZ2VsaXN0WzBdID0gcGh5c190b19wYWdlKF9fcGFfc3ltYm9s
KHZkc29fZGF0YSkpOwogCisJaWYgKHRzY19wYWdlKQorCQl2ZHNvX3BhZ2VsaXN0W3RzY19wYWdl
X2lkeF0gPSBwaHlzX3RvX3BhZ2UoX19wYSh0c2NfcGFnZSkpOworCiAJLyogR3JhYiB0aGUgdkRT
TyBjb2RlIHBhZ2VzLiAqLwogCXBmbiA9IHN5bV90b19wZm4odmRzb19sb29rdXBbYXJjaF9pbmRl
eF0udmRzb19jb2RlX3N0YXJ0KTsKIApkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rZXJuZWwvdmRz
by92ZHNvLmxkcy5TIGIvYXJjaC9hcm02NC9rZXJuZWwvdmRzby92ZHNvLmxkcy5TCmluZGV4IDdh
ZDJkM2EwY2Q0OC4uZTQwYTFmNWE2ZDMwIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2tlcm5lbC92
ZHNvL3Zkc28ubGRzLlMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvdmRzby92ZHNvLmxkcy5TCkBA
IC0xNyw3ICsxNywxNyBAQCBPVVRQVVRfQVJDSChhYXJjaDY0KQogCiBTRUNUSU9OUwogewotCVBS
T1ZJREUoX3Zkc29fZGF0YSA9IC4gLSBQQUdFX1NJWkUpOworCS8qCisJICogdmRzbyBkYXRhIHBh
Z2VzOgorCSAqICAgdmRzbyBkYXRhICgxIHBhZ2UpCisJICogICBodiB0c2MgcGFnZSAoMSBwYWdl
IGlmIGVuYWJsZWQpCisJICovCisJUFJPVklERShfdmRzb19kYXRhID0gX2h2Y2xvY2tfcGFnZSAt
IFBBR0VfU0laRSk7CisjaWZkZWYgQ09ORklHX0hZUEVSVl9USU1FUgorCVBST1ZJREUoX2h2Y2xv
Y2tfcGFnZSA9IC4gLSBQQUdFX1NJWkUpOworI2Vsc2UKKwlQUk9WSURFKF9odmNsb2NrX3BhZ2Ug
PSAuKTsKKyNlbmRpZgogCS4gPSBWRFNPX0xCQVNFICsgU0laRU9GX0hFQURFUlM7CiAKIAkuaGFz
aAkJOiB7ICooLmhhc2gpIH0JCQk6dGV4dAotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
