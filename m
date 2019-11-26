Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8142109F96
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 14:53:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZbF2-00055U-SE; Tue, 26 Nov 2019 13:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jyHG=ZS=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1iZbF0-00055P-Pc
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 13:50:54 +0000
X-Inumbo-ID: c3812d7a-1053-11ea-a55d-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3812d7a-1053-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 13:50:54 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a24so16445844edt.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 05:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=foSPG5b4GPTiNos5d2D1hghgoaS4XZmJhqxcKaf1/hY=;
 b=NcZl5aItp0okvqh8ywht5GEbFHQZpvRbSaZteZaOWnTT/+3a+lqpOUwD+y6lvbHc1+
 F2Z2YoeOlFbNXRkr+vLnML3XTByfa2aIyOkcK0G8uLGU4pVD+Hd34aEwxocvQEJ4pLxn
 a2CPLiynWbHRi3CWvIdJxAZs6uVKA+lLqEFVW2uolPSWZMwTxIJKAkFcBR7kz3aNDVzl
 KtHOYj9JRUMMIPasIqtmFYJLCsbKu59xf4XFl1EpCl8z3CSwNu9uZPH+ZC895N42pqwL
 k60YdofUhXq5ooa12uqxPihOwOLMlpzTIeJfF7lkUUyEvsHJ4Th6MvG6MR+6jjmd6M/z
 3JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=foSPG5b4GPTiNos5d2D1hghgoaS4XZmJhqxcKaf1/hY=;
 b=IWKnhdJEgESB8cs5AqVVkt6ScMZ8uml8RgLH2XmHqwGHRmxOYQiGLFvsYVG/DqpLba
 U9MGiMdPF7AkVYEV167QVrOnFA2nCK55kiYVVYxTHWHSBuCfiiE58C4OPg6msN3FaLzq
 2PtjR3RP5o8TXFREenlDbyEkn3cYYM0+C8+6oyG36t9YDTdXJSrzjvvdV6WnthRM+eC+
 IRpqT425gIILfpvsJSXQFxUHfghtNBEYUK9DL0mCPyTjmuNb9llV+zi9WnFc+XJpiymy
 TBInWhTk012d41qsR6Tk2QXg5IHi4YXWfTeYPzFEXmK750zeh3ftkhS1m86qAsa4gpiW
 kLaQ==
X-Gm-Message-State: APjAAAUZNYfD2pzW1JVLCRc6eAUZ10urRjju8qA44EShkXu3fEAtdiqL
 eSZPZvBVvA3nguJTfT3n4AWThg9Ue/yGnD4NBL1y4A==
X-Google-Smtp-Source: APXvYqx/73kewLKTGG9V8bY7IVdZRVMPs089swKOBpgQRPlsJfFEGLkEpyKXCfAg+91rOQYdzSAPGhELagFggc29VvU=
X-Received: by 2002:aa7:cc0f:: with SMTP id q15mr24919188edt.71.1574776253232; 
 Tue, 26 Nov 2019 05:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20191122022406.590141-1-pasha.tatashin@soleen.com>
In-Reply-To: <20191122022406.590141-1-pasha.tatashin@soleen.com>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 26 Nov 2019 08:50:42 -0500
Message-ID: <CA+CK2bCBS2fKOTmTFm13iv3u5TBPwpoCsYeeP352DVE-gs9GJw@mail.gmail.com>
To: Pavel Tatashin <pasha.tatashin@soleen.com>,
 James Morris <jmorris@namei.org>, 
 Sasha Levin <sashal@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 steve.capper@arm.com, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marc Zyngier <marc.zyngier@arm.com>, 
 James Morse <james.morse@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, allison@lohutok.net,
 info@metux.net, 
 alexios.zavras@intel.com, Stefano Stabellini <sstabellini@kernel.org>, 
 boris.ostrovsky@oracle.com, jgross@suse.com, Stefan Agner <stefan@agner.ch>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, xen-devel@lists.xenproject.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Kees Cook <keescook@chromium.org>
Subject: Re: [Xen-devel] [PATCH v2 0/3] Use C inlines for uaccess
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

S2VlcyBDb29rIG1lbnRpb25lZCB0aGF0IGl0IGlzIGEgZ29vZCBpZGVhIHRvIGFzc2VydCB0aGUg
UEFOIHN0YXRlCmR1cmluZyBkaXNhYmxlL2VuYWJsZS4gU2luY2UsIHdpdGggdGhpcyBjaGFuZ2Ug
ZXZlcnl0aGluZyBpcyBtb3ZlZCB0bwp0aGUgc2FtZSBDIHBsYWNlLCBpZiB0aGlzIGhhcmRlbmlu
ZyBpcyBzb21ldGhpbmcgb3RoZXJzIGFsc28gd2FudCB0bwpzZWUsIEkgY291bGQgYWRkIGl0IGlu
IHRoZSBuZXh0IHJldmlzaW9uIG9mIHRoaXMgc2VyaWVzLiBIZXJlIGFyZSB0aGUKb3B0aW9ucyB0
byBjaG9vc2UgZnJvbToKMS4gRG8gc29tZXRoaW5nIHNpbWlsYXIgdG8gd2hhdCBpcyBkb25lIGlu
IHByZWVtcHQgd2l0aApDT05GSUdfUFJFRU1QVF9DT1VOVDogIGtlZXAgYSBib29sZWFuIChjb3Vs
ZCBiZSBvcHRpb25hbGx5IGVuYWJsZWQgYnkKYSBjb25maWcpIHRoYXQgaXMgY2hlY2tlZCB3aGVu
IHVhY2Nlc3NfZW5hYmxlKCkvdWFjY2Vzc19kaXNhYmxlKCkgYXJlCmNhbGxlZC4gVGhpcyB3YXkg
d2Ugd2lsbCBhbHdheXMgY2hlY2sgdGhhdCBzdGF0ZSBldmVuIG9uIHByb2Nlc3NvcnMKd2l0aCBo
YXJkd2FyZSBQQU4gYW5kIFVBTywgaG93ZXZlciwgdGhlcmUgaXMgZ29pbmcgdG8gYmUgdGhpcyBl
eHRyYQpvdmVyaGVhZCBvZiBjaGVja2luZy9zdG9yaW5nIHRoZSB2YXJpYWJsZSBvbiB1c2VybGFu
ZCBlbnRlci9leGl0cyBldmVuCm9uIHN5c3RlbXMgd2hpY2ggaGF2ZSB0aGVzZSBtYXJjb3Mgc2V0
IHRvIG5vdGhpbmcgb3RoZXJ3aXNlLgoyLiBDaGVjayBvbmx5IGluIF9fdWFjY2Vzc190dGJyMF9k
aXNhYmxlKCkvX191YWNjZXNzX3R0YnIwX2VuYWJsZSgpCnRoYXQgdHRicjBfZWwxIGlzIGluIHRo
ZSBleHBlY3RlZCBzdGF0ZSwgb3IgYWRkIGFub3RoZXIgYm9vbGVhbiAgZm9yCnRoaXMgcHVycG9z
ZSB0byB0aHJlYWRfaW5mby4KMy4gS2VlcCBhcyBpcywgYW5kIGRvIG5vdCBhZGQgZXh0cmEgb3Zl
cmhlYWQgZm9yIHRoaXMgaGFyZGVuaW5nLgoKVGhhbmsgeW91LApQYXNoYQoKT24gVGh1LCBOb3Yg
MjEsIDIwMTkgYXQgOToyNCBQTSBQYXZlbCBUYXRhc2hpbgo8cGFzaGEudGF0YXNoaW5Ac29sZWVu
LmNvbT4gd3JvdGU6Cj4KPiBDaGFuZ2Vsb2cKPiB2MjoKPiAgICAgICAgIC0gQWRkcmVzc2VkIFJ1
c3NlbGwgS2luZydzIGNvbmNlcm4gYnkgbm90IGFkZGluZwo+ICAgICAgICAgICB1YWNjZXNzXyog
dG8gQVJNLgo+ICAgICAgICAgLSBSZW1vdmVkIHRoZSBhY2NpZGVudGFsIGNoYW5nZSB0byB4dGVu
c2EKPgo+IENvbnZlcnQgdGhlIHJlbWFpbmluZyB1YWNjZXNzXyogY2FsbHMgZnJvbSBBU00gbWFj
cm9zIHRvIEMgaW5saW5lcy4KPgo+IFRoZXNlIHBhdGNoZXMgYXBwbHkgYWdhaW5zdCBsaW51eC1u
ZXh0LiBJIGJvb3QgdGVzdGVkIEFSTTY0LCBhbmQKPiBjb21waWxlIHRlc3RlZCBBUk0gY2hhbmdl
cy4KPgo+IFBhdmVsIFRhdGFzaGluICgzKToKPiAgIGFybS9hcm02NC94ZW46IHVzZSBDIGlubGlu
ZXMgZm9yIHByaXZjbWRfY2FsbAo+ICAgYXJtNjQ6IHJlbW92ZSB1YWNjZXNzX3R0YnIwIGFzbSBt
YWNyb3MgZnJvbSBjYWNoZSBmdW5jdGlvbnMKPiAgIGFybTY0OiByZW1vdmUgdGhlIHJlc3Qgb2Yg
YXNtLXVhY2Nlc3MuaAo+Cj4gIGFyY2gvYXJtL2luY2x1ZGUvYXNtL2Fzc2VtYmxlci5oICAgICAg
IHwgIDIgKy0KPiAgYXJjaC9hcm0vaW5jbHVkZS9hc20veGVuL2h5cGVyY2FsbC5oICAgfCAxMCAr
KysrKwo+ICBhcmNoL2FybS94ZW4vZW5saWdodGVuLmMgICAgICAgICAgICAgICB8ICAyICstCj4g
IGFyY2gvYXJtL3hlbi9oeXBlcmNhbGwuUyAgICAgICAgICAgICAgIHwgIDQgKy0KPiAgYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS9hc20tdWFjY2Vzcy5oICAgfCA2MCAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCAgICB8IDM4ICsr
KysrKysrKysrKysrLS0KPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmgg
fCAyOCArKysrKysrKysrKysKPiAgYXJjaC9hcm02NC9rZXJuZWwvZW50cnkuUyAgICAgICAgICAg
ICAgfCAgNiArLS0KPiAgYXJjaC9hcm02NC9saWIvY2xlYXJfdXNlci5TICAgICAgICAgICAgfCAg
MiArLQo+ICBhcmNoL2FybTY0L2xpYi9jb3B5X2Zyb21fdXNlci5TICAgICAgICB8ICAyICstCj4g
IGFyY2gvYXJtNjQvbGliL2NvcHlfaW5fdXNlci5TICAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9h
cm02NC9saWIvY29weV90b191c2VyLlMgICAgICAgICAgfCAgMiArLQo+ICBhcmNoL2FybTY0L21t
L2NhY2hlLlMgICAgICAgICAgICAgICAgICB8IDMxICsrKysrLS0tLS0tLS0KPiAgYXJjaC9hcm02
NC9tbS9jb250ZXh0LmMgICAgICAgICAgICAgICAgfCAxMiArKysrKysKPiAgYXJjaC9hcm02NC9t
bS9mbHVzaC5jICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBhcmNoL2FybTY0L3hlbi9oeXBl
cmNhbGwuUyAgICAgICAgICAgICB8IDE5ICstLS0tLS0tCj4gIGluY2x1ZGUveGVuL2FybS9oeXBl
cmNhbGwuaCAgICAgICAgICAgIHwgMTIgKysrLS0tCj4gIDE3IGZpbGVzIGNoYW5nZWQsIDExNSBp
bnNlcnRpb25zKCspLCAxMTkgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybTY0L2luY2x1ZGUvYXNtL2FzbS11YWNjZXNzLmgKPgo+IC0tCj4gMi4yNC4wCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
