Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D171B11FC24
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 01:23:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ige6o-0006hX-MO; Mon, 16 Dec 2019 00:19:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/tIY=2G=gmail.com=boqun.feng@srs-us1.protection.inumbo.net>)
 id 1ige6n-0006hS-Nn
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 00:19:33 +0000
X-Inumbo-ID: bbd8e982-1f99-11ea-88e7-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbd8e982-1f99-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 00:19:33 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id x1so3866108qkl.12
 for <xen-devel@lists.xenproject.org>; Sun, 15 Dec 2019 16:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aZ6sGO0KS0Q8EYVwWz/tNENQC8GnXFZ6xRDHj7knL74=;
 b=Gmb45a2redl2v2Psqc9UmK5BWjcPglzmbzjDpsikHLbmggLKdOVorJeLzaOihAp93n
 dZuMPP9Yq0XhR4kkhOpXSkhSDgDY7Q1xUpGZhMf6Ogg+p7xlsNEqI8pOq07smNJIb729
 KRa4FwyruYu+W4RNN1PJgXm4h6Ulv+MJjNPQcDIV0FZh4+eA8lE6SlNe6p65GE7u3Z6k
 Wa+wg8XDsBh++bc/vo63jVSfEKICDmwU/S4INp786dJO2HHJnWsMRwktN9Y0UajVgbpm
 NrNsEFU0hxV8nLsegKRlsf3oghWVDY2nCi+m+2Fp1dRlscQL+URlyVJ1jR+XgzFXJbZM
 L3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aZ6sGO0KS0Q8EYVwWz/tNENQC8GnXFZ6xRDHj7knL74=;
 b=OrrNwpDMu5znlMNrYKP6vPeY1GoTuwEDa4KpHFP5scdx/sTXoV2eeP8zySIuOduTzt
 4Ls1Raa+JD52AanptRyjt9xFeU2f3jpBADdePMihDhon2WfYTH6arZy8STBENPdpBCCA
 wstOFGTu8ZLvawh1MNXG15VGDuudFhz+FV89L3B0VVhKfvw1NFPtev9ULrmVpFVNXTUR
 HRY7S1tYzhuRy+OHdefj3D8b1G+Avd4xsXBl4ioBtOBdwbgIldvhXFEGVwA4Qun2M2GR
 b+Nxf8zmoPp1dsmJ0l2gcGbTipclz+OsDmIdBHzin6NqSYdEUFw1M8z/wfkFNWYjoOCe
 0Yng==
X-Gm-Message-State: APjAAAXJAcijln10E+GaVLZUNu73jY8pZF0df9r1de7UIU1poo3jkClz
 cV5fsYDvcNP2e7L1S1zHw4+BWNLZ
X-Google-Smtp-Source: APXvYqzAQwy89lyacoeuw+asSDBQYlTp0vqfLPII18paqb1S/uBBbW6TqUEv6w6/z3AIjjLrHyaopg==
X-Received: by 2002:a37:48f:: with SMTP id 137mr24677846qke.25.1576455572728; 
 Sun, 15 Dec 2019 16:19:32 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id e2sm5376739qkl.3.2019.12.15.16.19.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Dec 2019 16:19:31 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 7111D22430;
 Sun, 15 Dec 2019 19:19:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 15 Dec 2019 19:19:30 -0500
X-ME-Sender: <xms:kc32XeNibvP_au8cm_jiN6rThl2eefciU1Jc-App3cBtSjKNtAWevA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtgedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhorhhtvggutfgvtghiphdvucdlgedtmdenucfjughrpefhvffufffkofgggfestdek
 redtredttdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgse
 hgmhgrihhlrdgtohhmqeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhu
 sgdrtghomhenucfkphephedvrdduheehrdduuddurdejudenucfrrghrrghmpehmrghilh
 hfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieel
 vdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtg
 homhesfhhigihmvgdrnhgrmhgvnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:kc32Xdl8_zahWOQvooHUe9tKxDScPH3OeodcADOCpBCp0dUmiJjnvQ>
 <xmx:kc32XQbukJFCvrLL7M4nc72CTroIKyNCxbhWdtmCCe5vP3l91CwIyQ>
 <xmx:kc32XTTHwezsupdARHAEkG3utLJ_lpz0EFhC-pw3X_mCxe6pmXP0Eg>
 <xmx:ks32XdWhDOQlVK8lfpDMef_v7K-YnFb-v4AwmCwl5TJhn4VnUW0LfBRLVg8>
Received: from localhost (unknown [52.155.111.71])
 by mail.messagingengine.com (Postfix) with ESMTPA id 992E780062;
 Sun, 15 Dec 2019 19:19:28 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Dec 2019 08:19:16 +0800
Message-Id: <20191216001922.23008-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [RFC 0/6] vDSO support for Hyper-V guest on ARM64
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

SGksCgpUaGlzIGlzIHRoZSBSRkMgcGF0Y2hzZXQgZm9yIHZEU08gc3VwcG9ydCBpbiBBUk02NCBI
eXBlci1WIGd1ZXN0LiBUbwp0ZXN0IGl0LCBNaWNoYWVsJ3MgQVJNNjQgc3VwcG9ydCBwYXRjaHNl
dDoKCglodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzE1NzAxMjkzNTUt
MTYwMDUtMS1naXQtc2VuZC1lbWFpbC1taWtlbGxleUBtaWNyb3NvZnQuY29tLwoKaXMgbmVlZGVk
LgoKU2ltaWxhciBhcyB4ODYsIEh5cGVyLVYgb24gQVJNNjQgdXNlIGEgVFNDIHBhZ2UgZm9yIGd1
ZXN0cyB0byByZWFkCnRoZSB2aXJ0dWFsaXplZCBoYXJkd2FyZSB0aW1lciwgdGhpcyBUU0MgcGFn
ZSBpcyByZWFkLW9ubHkgZm9yIHRoZQpndWVzdHMsIHNvIGNvdWxkIGJlIHVzZWQgZm9yIHZEU08g
ZGF0YSBwYWdlLiBBbmQgdGhlIHZEU08gKHVzZXJzcGFjZSkKY29kZSBjb3VsZCB1c2UgdGhlIHNh
bWUgY29kZSBmb3IgdGltZXIgcmVhZGluZyBhcyBrZXJuZWwsIHNpbmNlCnRoZXkgcmVhZCB0aGUg
c2FtZSBUU0MgcGFnZS4KClRoaXMgcGF0Y2hzZXQgdGhlcmVmb3JlIGV4dGVuZHMgQVJNNjQncyBf
X3ZzZG9faW5pdCgpIHRvIGFsbG93IG11bHRpcGxlCmRhdGEgcGFnZXMgYW5kIGludHJvZHVjZXMg
dGhlIHZjbG9ja19tb2RlIGNvbmNlcHQgc2ltaWxhciB0byB4ODYgdG8KYWxsb3cgZGlmZmVyZW50
IHBsYXRmb3JtcyAoYmFyZS1tZXRhbCwgSHlwZXItViwgZXRjLikgdG8gc3dpdGNoIHRvCmRpZmZl
cmVudCBfX2FyY2hfZ2V0X2h3X2NvdW50ZXIoKSBpbXBsZW1lbnRhdGlvbnMuIFRoZSByZXN0IG9m
IHRoaXMKcGF0Y2hzZXQgZG9lcyB0aGUgbmVjZXNzYXJ5IHNldHVwIGZvciBIeXBlci1WIGd1ZXN0
czogbWFwcGluZyB0c2MgcGFnZSwKZW5hYmxpbmcgdXNlcnNwYWNlIHRvIHJlYWQgY250dmN0LCBl
dGMuIHRvIGVuYWJsZSB2RFNPLgoKVGhpcyBwYXRjaHNldCBjb25zaXN0cyBvZiA2IHBhdGNoZXM6
CgpwYXRjaCAjMSBhbGxvd3MgaHZfZ2V0X3Jhd190aW1lcigpIGRlZmluaXRpb24gdG8gYmUgb3Zl
cnJpZGRlbiBmb3IKdXNlcnNwYWNlIGFuZCBrZXJuZWwgdG8gc2hhcmUgdGhlIHNhbWUgaHZfcmVh
ZF90c2NfcGFnZSgpIGRlZmluaXRpb24uCgpwYXRjaCAjMiBleHRlbmRzIEFSTTY0IHRvIHN1cHBv
cnQgbXVsdGlwbGUgdkRTTyBkYXRhIHBhZ2VzLgoKcGF0Y2ggIzMgaW50cm9kdWNlcyB2Y2xvY2tf
bW9kZSBzaW1pbGlhciB0byB4ODYgdG8gYWxsb3cgZGlmZmVyZW50Cl9fYXJjaF9nZXRfaHdfY291
bnRlcigpIGltcGxlbWVudGF0aW9ucyBmb3IgZGlmZmVyZW50IGNsb2Nrc291cmNlcy4KCnBhdGNo
ICM0IG1hcHMgSHlwZXItViBUU0MgcGFnZSBpbnRvIHZEU08gZGF0YSBwYWdlLgoKcGF0Y2ggIzUg
YWxsb3dzIHVzZXJzcGFjZSB0byByZWFkIGNudHZjdCwgc28gdGhhdCB1c2Vyc3BhY2UgY2FuCmVm
ZmljaWVudGx5IHJlYWQgdGhlIGNsb2Nrc291cmNlLgoKcGF0Y2ggIzYgZW5hYmxlcyB0aGUgdkRT
TyBmb3IgQVJNNjQgSHlwZXItViBndWVzdC4KClRoZSB3aG9sZSBwYXRjaHNldCBpcyBiYXNlZCBv
biB2NS41LXJjMSBwbHVzIE1pY2hhZWwncyBBUk02NCBzdXBwb3J0CnBhdGNoc2V0LCBhbmQgSSd2
ZSBkb25lIGEgZmV3IHRlc3RzIHdpdGg6CgoJaHR0cHM6Ly9naXRodWIuY29tL25seW5jaC1tZW50
b3IvdmRzb3Rlc3QKCkNvbW1lbnRzIGFuZCBzdWdnZXN0aW9ucyBhcmUgd2VsY29tZSEKClJlZ2Fy
ZHMsCkJvcXVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
