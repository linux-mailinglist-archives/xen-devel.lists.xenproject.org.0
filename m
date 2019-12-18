Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5307C123F41
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 06:50:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihSBQ-0001Yq-Qa; Wed, 18 Dec 2019 05:47:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1UoQ=2I=gmail.com=boqun.feng@srs-us1.protection.inumbo.net>)
 id 1ihSBO-0001Yl-Re
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 05:47:38 +0000
X-Inumbo-ID: e5dbc530-2159-11ea-a1e1-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5dbc530-2159-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 05:47:38 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c17so608212qkg.7
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 21:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rdMMSS5mGXhXxSzn8vN5OSqGco+TdXWURJZsejhpNlU=;
 b=IbnAbj6RtNE27gTD/82fE5rTu6luXBFeErBAampq/mDtF+82hybj1EYlIJDNleRtWb
 Tc4xby6WNKEe1VSWAzvQ40QRBdEwkpaoip/jXm9+Y+0/Tdp34uz38tiuwZMmV3ZpCX+7
 bO+zDh5JQqe502cQCnq8O8hMlBmXcXFxstpyjlB6KqjnSJs6eyObBs9hyl+/FL3Y1wkq
 k9CEZwWyoAAnbiVWo5OLtx6PDUm03DNKDOhovQncKCIVwQztzjY5dDfDcORDypYn1Ciq
 IFdm/4n/bUxaAX34UFIFDcwT7AykhHSdACqkLGLZmGzdHLujESdTVCUvUhxVm2CULKmL
 Uzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rdMMSS5mGXhXxSzn8vN5OSqGco+TdXWURJZsejhpNlU=;
 b=JTMeEAjuQrffE2Ct8XbwIerUIW0uJHGDdgZnWCI3Xy5kPUKaqsF/UwXIaj5j5jKN37
 tWq+CkrhLbhzVB2VglBhdg3i6G3TenMqwcPJnvHQH9Kcf/P0p8fJBT6xMQWlXUA3xndh
 Uzoqs5gsjI3MCexnT85BegvMh1tWJ+PgZ6gzclALuxBz7VKyw9h6m6JccYtPC7kg7U1/
 LADAGQbe7Ud1nwtufpYw83tpf2VV4kAo4lgW++k8o5orUU2Ynl7k2eT9vXlrMhnSD4cq
 uZDRaju8+yHw70QOtlj/ecJmNdXDP9GdrpkhG+uvQYO5CpNWqBGVz7nfvPtFgSNphjTE
 eQag==
X-Gm-Message-State: APjAAAWd7CqbRl7VI3Jfc9Ruuo2FMuSbHVMfKUj7aZQHXFLlqDmlpah0
 P5yN0Inv1E89/uCQKzrHSQE=
X-Google-Smtp-Source: APXvYqxaNz0RO1lOZKINUdqFpRia863ytJsrYewYWjT74VbIG5he6WOrbsQMH4RbQA7++XwYkL1Icg==
X-Received: by 2002:ae9:e41a:: with SMTP id q26mr790211qkc.288.1576648057742; 
 Tue, 17 Dec 2019 21:47:37 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228])
 by smtp.gmail.com with ESMTPSA id t198sm354933qke.6.2019.12.17.21.47.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Dec 2019 21:47:37 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 751CC22223;
 Wed, 18 Dec 2019 00:47:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 18 Dec 2019 00:47:35 -0500
X-ME-Sender: <xms:dr35XX1gdcqGAIqLT51JyHjdGnzLF1l4WLjUXPweExjBpT4Ci871Yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtkedgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepuehoqhhu
 nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucfkphephe
 dvrdduheehrdduuddurdejudenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
 mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
 ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
 mhgvnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:dr35XQd4G4lVVfUNeZx2swRweY951aczqjlN0OH0Ok8mYQMGgCrtzQ>
 <xmx:dr35XeAEw3MdzyfTpxLn4CyJvUYuy7W7U_PYH1XUlribC_owMFWxJg>
 <xmx:dr35XX93UVrpEnOnntHX8srZBT8vFtWAMQ0ErbFr4ymsIt3qA4Z23Q>
 <xmx:d735XRpK3pJiUKvIRHERfgQkVY3faW59Xm1i2MFCfRkSRilXSIUcNFuGAOc>
Received: from localhost (unknown [52.155.111.71])
 by mail.messagingengine.com (Postfix) with ESMTPA id 06F2B8005A;
 Wed, 18 Dec 2019 00:47:33 -0500 (EST)
Date: Wed, 18 Dec 2019 13:47:32 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-ID: <20191218054732.GK97412@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
References: <20191216001922.23008-1-boqun.feng@gmail.com>
 <20191216001922.23008-7-boqun.feng@gmail.com>
 <87y2vb82lz.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2vb82lz.fsf@vitty.brq.redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [RFC 6/6] arm64: hyperv: Enable vDSO
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
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org,
 Michael Kelley <mikelley@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMDM6MTA6MTZQTSArMDEwMCwgVml0YWx5IEt1em5ldHNv
diB3cm90ZToKPiBCb3F1biBGZW5nIDxib3F1bi5mZW5nQGdtYWlsLmNvbT4gd3JpdGVzOgo+IAo+
ID4gU2ltaWxhciB0byB4ODYsIGFkZCBhIG5ldyB2Y2xvY2tfbW9kZSBWQ0xPQ0tfSFZDTE9DSywg
YW5kIHJldXNlIHRoZQo+ID4gaHZfcmVhZF90c2NfcGFnZSgpIGZvciB1c2Vyc3BhY2UgdG8gcmVh
ZCB0c2MgcGFnZSBjbG9ja3NvdXJjZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCb3F1biBGZW5n
IChNaWNyb3NvZnQpIDxib3F1bi5mZW5nQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvYXJt
NjQvaW5jbHVkZS9hc20vY2xvY2tzb3VyY2UuaCAgICAgICB8ICAzICsrLQo+ID4gIGFyY2gvYXJt
NjQvaW5jbHVkZS9hc20vbXNoeXBlcnYuaCAgICAgICAgICB8ICAyICstCj4gPiAgYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oIHwgMTkgKysrKysrKysrKysrKysrKysr
Kwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9jbG9ja3NvdXJjZS5o
IGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9jbG9ja3NvdXJjZS5oCj4gPiBpbmRleCBmYmU4MDA1
NzQ2OGMuLmM2YWNkNDVmZTc0OCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vY2xvY2tzb3VyY2UuaAo+ID4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9jbG9ja3Nv
dXJjZS5oCj4gPiBAQCAtNCw3ICs0LDggQEAKPiA+ICAKPiA+ICAjZGVmaW5lIFZDTE9DS19OT05F
CTAJLyogTm8gdkRTTyBjbG9jayBhdmFpbGFibGUuCQkqLwo+ID4gICNkZWZpbmUgVkNMT0NLX0NO
VFZDVAkxCS8qIHZEU08gc2hvdWxkIHVzZSBjbnR2Y250CQkqLwo+ID4gLSNkZWZpbmUgVkNMT0NL
X01BWAkxCj4gPiArI2RlZmluZSBWQ0xPQ0tfSFZDTE9DSwkyCS8qIHZEU08gc2hvdWxkIHVzZSB2
cmVhZF9odmNsb2NrKCkJKi8KPiA+ICsjZGVmaW5lIFZDTE9DS19NQVgJMgo+ID4gIAo+ID4gIHN0
cnVjdCBhcmNoX2Nsb2Nrc291cmNlX2RhdGEgewo+ID4gIAlpbnQgdmNsb2NrX21vZGU7Cj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9tc2h5cGVydi5oIGIvYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS9tc2h5cGVydi5oCj4gPiBpbmRleCAwYWZiMDBlMzUwMWQuLjdjODVkZDgx
NmRjYSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vbXNoeXBlcnYuaAo+
ID4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9tc2h5cGVydi5oCj4gPiBAQCAtOTAsNyAr
OTAsNyBAQCBleHRlcm4gdm9pZCBodl9nZXRfdnByZWdfMTI4KHUzMiByZWcsIHN0cnVjdCBodl9n
ZXRfdnBfcmVnaXN0ZXJfb3V0cHV0ICpyZXN1bHQpOwo+ID4gICNkZWZpbmUgaHZfc2V0X3JlZmVy
ZW5jZV90c2ModmFsKSBcCj4gPiAgCQlodl9zZXRfdnByZWcoSFZfUkVHSVNURVJfUkVGRVJFTkNF
X1RTQywgdmFsKQo+ID4gICNkZWZpbmUgaHZfc2V0X2Nsb2Nrc291cmNlX3Zkc28odmFsKSBcCj4g
PiAtCQkoKHZhbCkuYXJjaGRhdGEudmNsb2NrX21vZGUgPSBWQ0xPQ0tfTk9ORSkKPiA+ICsJCSgo
dmFsKS5hcmNoZGF0YS52Y2xvY2tfbW9kZSA9IFZDTE9DS19IVkNMT0NLKQo+ID4gIAo+ID4gICNp
ZiBJU19FTkFCTEVEKENPTkZJR19IWVBFUlYpCj4gPiAgI2RlZmluZSBodl9lbmFibGVfc3RpbWVy
MF9wZXJjcHVfaXJxKGlycSkJZW5hYmxlX3BlcmNwdV9pcnEoaXJxLCAwKQo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaCBiL2FyY2gvYXJt
NjQvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaAo+ID4gaW5kZXggZTZlM2ZlMDQ4OGM3
Li43ZTY4OWI5MDNmNGQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Zk
c28vZ2V0dGltZW9mZGF5LmgKPiA+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby9n
ZXR0aW1lb2ZkYXkuaAo+ID4gQEAgLTY3LDYgKzY3LDIwIEBAIGludCBjbG9ja19nZXRyZXNfZmFs
bGJhY2soY2xvY2tpZF90IF9jbGtpZCwgc3RydWN0IF9fa2VybmVsX3RpbWVzcGVjICpfdHMpCj4g
PiAgCXJldHVybiByZXQ7Cj4gPiAgfQo+ID4gIAo+ID4gKyNpZmRlZiBDT05GSUdfSFlQRVJWX1RJ
TUVSCj4gPiArLyogVGhpcyB3aWxsIG92ZXJyaWRlIHRoZSBkZWZhdWx0IGh2X2dldF9yYXdfdGlt
ZXIoKSAqLwo+ID4gKyNkZWZpbmUgaHZfZ2V0X3Jhd190aW1lcigpIF9fYXJjaF9jb3VudGVyX2dl
dF9jbnR2Y3QoKQo+ID4gKyNpbmNsdWRlIDxjbG9ja3NvdXJjZS9oeXBlcnZfdGltZXIuaD4KPiA+
ICsKPiA+ICtleHRlcm4gc3RydWN0IG1zX2h5cGVydl90c2NfcGFnZQo+ID4gK19odmNsb2NrX3Bh
Z2UgX19hdHRyaWJ1dGVfXygodmlzaWJpbGl0eSgiaGlkZGVuIikpKTsKPiA+ICsKPiA+ICtzdGF0
aWMgdTY0IHZyZWFkX2h2Y2xvY2sodm9pZCkKPiA+ICt7Cj4gPiArCXJldHVybiBodl9yZWFkX3Rz
Y19wYWdlKCZfaHZjbG9ja19wYWdlKTsKPiA+ICt9Cj4gPiArI2VuZGlmCj4gCj4gVGhlIGZ1bmN0
aW9uIGlzIGFsbW9zdCB0aGUgc2FtZSBvbiB4ODYgKCZfaHZjbG9ja19wYWdlIC0+Cj4gJmh2Y2xv
Y2tfcGFnZSksIHdvdWxkIGl0IG1heWJlIG1ha2Ugc2Vuc2UgdG8gbW92ZSB0aGlzIHRvIGFyY2gg
bmV1dHJhbAo+IGNsb2Nrc291cmNlL2h5cGVydl90aW1lci5oPwo+IAoKSSdtIG5vdCBzdXJlIHdo
ZXRoZXIgdGhlIHVuZGVyc2NvcmUgbWF0dGVycyBpbiB0aGUgdkRTTyBkYXRhIHN5bWJvbCwgc28K
SSBmb2xsb3cgdGhlIGFyY2hpdGVjdHVyYWwgbmFtZSBjb252ZW50aW9uLiBJZiB0aGUgbGVhZGlu
ZyB1bmRlcnNjb3JlCmRvZXNuJ3QgaGF2ZSBzcGVjaWFsIHB1cnBvc2UgSSdtIGhhcHB5IHRvIG1v
dmUgdGhpcyB0byBhcmNoIG5ldXRyYWwKaGVhZGVyIGZpbGUuCgo+ID4gKwo+ID4gIHN0YXRpYyBf
X2Fsd2F5c19pbmxpbmUgdTY0IF9fYXJjaF9nZXRfaHdfY291bnRlcihzMzIgY2xvY2tfbW9kZSkK
PiA+ICB7Cj4gPiAgCXU2NCByZXM7Cj4gPiBAQCAtNzgsNiArOTIsMTEgQEAgc3RhdGljIF9fYWx3
YXlzX2lubGluZSB1NjQgX19hcmNoX2dldF9od19jb3VudGVyKHMzMiBjbG9ja19tb2RlKQo+ID4g
IAlpZiAoY2xvY2tfbW9kZSA9PSBWQ0xPQ0tfTk9ORSkKPiA+ICAJCXJldHVybiBfX1ZEU09fVVNF
X1NZU0NBTEw7Cj4gPiAgCj4gPiArI2lmZGVmIENPTkZJR19IWVBFUlZfVElNRVIKPiA+ICsJaWYg
KGxpa2VseShjbG9ja19tb2RlID09IFZDTE9DS19IVkNMT0NLKSkKPiA+ICsJCXJldHVybiB2cmVh
ZF9odmNsb2NrKCk7Cj4gCj4gSSdtIG5vdCBzdXJlIGxpa2VseSgpIGlzIGp1c3RpZmllZCBoZXJl
OiBpdCdsbCBtYWtlIEFMTCBidWlsZHMgd2hpY2gKPiBlbmFibGUgQ09ORklHX0hZUEVSVl9USU1F
UiAoZS5nLiBkaXN0cm8ga2VybmVscykgdG8gcHJlZmVyCj4gVkNMT0NLX0hWQ0xPQ0ssIGV2ZW4g
aWYgdGhlIGtlcm5lbCBpcyBub3QgcnVubmluZyBvbiBIeXBlci1WLgo+IAoKTWFrZSBzZW5zZS4g
VGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dCEgSSB3aWxsIGNoYW5nZSBpdCBpbiB0aGUgbmV4
dAp2ZXJzaW9uLgoKUmVnYXJkcywKQm9xdW4KCj4gPiArI2VuZGlmCj4gPiArCj4gPiAgCS8qCj4g
PiAgCSAqIFRoaXMgaXNiKCkgaXMgcmVxdWlyZWQgdG8gcHJldmVudCB0aGF0IHRoZSBjb3VudGVy
IHZhbHVlCj4gPiAgCSAqIGlzIHNwZWN1bGF0ZWQuCj4gCj4gLS0gCj4gVml0YWx5Cj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
