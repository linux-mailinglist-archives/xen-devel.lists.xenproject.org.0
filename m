Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9686210B60D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 19:47:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia2Kd-0003XU-3O; Wed, 27 Nov 2019 18:46:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8bDK=ZT=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1ia2Kb-0003XF-EV
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 18:46:29 +0000
X-Inumbo-ID: 389ed20e-1146-11ea-83b8-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 389ed20e-1146-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 18:46:28 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s10so20544134edi.5
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 10:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=tpI2XoAW/k1mZjy4gzuYvN2YL24d+FpjBX490TbnwUE=;
 b=RH8LeJhvVzlMCXZ7WjoiTtiM9N/So7uV3pgPiPV7vKSq/PW1mZ1u5DwGUkxNZYEuOE
 e5Z7Qsn+A0tUMMAoWegrtL2O64E4FgS6loxu/UM+cXi2JMBYH87LuyZMB/RSdXvhLtYm
 DEAgkP9gDh78EeN0vs6/VRGYYfyBllv8qhI9zmOdq2d8Z+MnfH33AwMB77n7qG8eTTQq
 0R00yySmFT074wdZ/W7URfBlaP1Epqn9FU74eMCZc4szX45AKQJB649QOtmGsbzHjUrR
 nNo/IBNQnWbwb3iO2Y9cm8ePzpJ97HiwmBW4sqOssrUPcTGwLzIMmo6SMS1yrPv8b5ch
 hLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=tpI2XoAW/k1mZjy4gzuYvN2YL24d+FpjBX490TbnwUE=;
 b=pqJAKMTlHxWcGHDfQfbun1LGrNDeXNyJmdqnOB8Kh7vUaUMwifHHA4+KMw7IUyZ2tj
 PP6VfUnc2igTErv0ABPfCNbjOSZ4uzlRbzo1SIAqj5fq/yIL2ttOqUwykt0UAHS2TXT/
 rN5K5Sn8DEknAHI13N8TLPH6u3dgpFBfbIQJxTMD/zlr9EZO2SUd/AwqjOl7MM+wwgfO
 YJnbni4lt78VuQMlQ+pa6iCponv2PvWUpBnQsjGblZ4RGinggYxaY/opd/NWJOWuarti
 rCpS7GLUxmwLA2pwjLmAUoj55f4nOzI3LZbjJPf27ugZqgGyTDWFOSV6cRAoutdUAo+S
 41Gw==
X-Gm-Message-State: APjAAAWA8ace5+Z8QXHswnn4pRlNmhGZt34m9ZbjGCZHGmRy+Kbg4JO/
 d2nJRSEMU58fAwCvgj8dtnPq74HttdqYQ8JJd1MlLA==
X-Google-Smtp-Source: APXvYqxzK9b1CLo07dbU3ghSiRxdeAWfozjlG21pdzxsPLtKe5C44CL7hIgPgRxjHBMEtB/mwGcYWK9arS+KDvH76zw=
X-Received: by 2002:a17:906:b30c:: with SMTP id
 n12mr49955881ejz.96.1574880387878; 
 Wed, 27 Nov 2019 10:46:27 -0800 (PST)
MIME-Version: 1.0
References: <20191127184453.229321-1-pasha.tatashin@soleen.com>
In-Reply-To: <20191127184453.229321-1-pasha.tatashin@soleen.com>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 27 Nov 2019 13:46:17 -0500
Message-ID: <CA+CK2bDk13O5-Yx9Kz_ZXj=JpfBWbqVUVgpsXcjW0TvKaRnxAw@mail.gmail.com>
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
 Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [Xen-devel] [PATCH 0/3] Use C inlines for uaccess
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

U29ycnksIGZvcmdvdCB0byBzZXQgdGhlIHN1YmplY3QgcHJlZml4IGNvcnJlY3RseS4gSXQgc2hv
dWxkIGJlOiBbUEFUQ0ggdjMgMC8zXS4KCk9uIFdlZCwgTm92IDI3LCAyMDE5IGF0IDE6NDQgUE0g
UGF2ZWwgVGF0YXNoaW4KPHBhc2hhLnRhdGFzaGluQHNvbGVlbi5jb20+IHdyb3RlOgo+Cj4gQ2hh
bmdlbG9nCj4gdjM6Cj4gICAgICAgICAtIEFkZGVkIEFja2VkLWJ5IGZyb20gU3RlZmFubyBTdGFi
ZWxsaW5pCj4gICAgICAgICAtIEFkZHJlc3NlZCBjb21tZW50cyBmcm9tIE1hcmsgUnV0bGFuZAo+
IHYyOgo+ICAgICAgICAgLSBBZGRyZXNzZWQgUnVzc2VsbCBLaW5nJ3MgY29uY2VybiBieSBub3Qg
YWRkaW5nCj4gICAgICAgICAgIHVhY2Nlc3NfKiB0byBBUk0uCj4gICAgICAgICAtIFJlbW92ZWQg
dGhlIGFjY2lkZW50YWwgY2hhbmdlIHRvIHh0ZW5zYQo+Cj4gQ29udmVydCB0aGUgcmVtYWluaW5n
IHVhY2Nlc3NfKiBjYWxscyBmcm9tIEFTTSBtYWNyb3MgdG8gQyBpbmxpbmVzLgo+Cj4gVGhlc2Ug
cGF0Y2hlcyBhcHBseSBhZ2FpbnN0IGxpbnV4LW5leHQuIEkgYm9vdCB0ZXN0ZWQgQVJNNjQsIGFu
ZAo+IGNvbXBpbGUgdGVzdGVkIEFSTSBjaGFuZ2UKPiBQYXZlbCBUYXRhc2hpbiAoMyk6Cj4gICBh
cm0vYXJtNjQveGVuOiB1c2UgQyBpbmxpbmVzIGZvciBwcml2Y21kX2NhbGwKPiAgIGFybTY0OiBy
ZW1vdmUgdWFjY2Vzc190dGJyMCBhc20gbWFjcm9zIGZyb20gY2FjaGUgZnVuY3Rpb25zCj4gICBh
cm02NDogcmVtb3ZlIHRoZSByZXN0IG9mIGFzbS11YWNjZXNzLmgKPgo+ICBhcmNoL2FybS9pbmNs
dWRlL2FzbS9hc3NlbWJsZXIuaCAgICAgICB8ICAyICstCj4gIGFyY2gvYXJtL2luY2x1ZGUvYXNt
L3hlbi9oeXBlcmNhbGwuaCAgIHwgMTAgKysrKysKPiAgYXJjaC9hcm0veGVuL2VubGlnaHRlbi5j
ICAgICAgICAgICAgICAgfCAgMiArLQo+ICBhcmNoL2FybS94ZW4vaHlwZXJjYWxsLlMgICAgICAg
ICAgICAgICB8ICA0ICstCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vYXNtLXVhY2Nlc3MuaCAg
IHwgNjEgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9hcm02NC9pbmNsdWRlL2Fz
bS9jYWNoZWZsdXNoLmggICAgfCAzOSArKysrKysrKysrKysrKy0tCj4gIGFyY2gvYXJtNjQvaW5j
bHVkZS9hc20veGVuL2h5cGVyY2FsbC5oIHwgMjggKysrKysrKysrKysrCj4gIGFyY2gvYXJtNjQv
a2VybmVsL2VudHJ5LlMgICAgICAgICAgICAgIHwgMjcgKysrKysrKysrKystCj4gIGFyY2gvYXJt
NjQvbGliL2NsZWFyX3VzZXIuUyAgICAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9hcm02NC9saWIv
Y29weV9mcm9tX3VzZXIuUyAgICAgICAgfCAgMiArLQo+ICBhcmNoL2FybTY0L2xpYi9jb3B5X2lu
X3VzZXIuUyAgICAgICAgICB8ICAyICstCj4gIGFyY2gvYXJtNjQvbGliL2NvcHlfdG9fdXNlci5T
ICAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9hcm02NC9tbS9jYWNoZS5TICAgICAgICAgICAgICAg
ICAgfCA0MiArKysrKystLS0tLS0tLS0tLS0KPiAgYXJjaC9hcm02NC9tbS9mbHVzaC5jICAgICAg
ICAgICAgICAgICAgfCAgMiArLQo+ICBhcmNoL2FybTY0L3hlbi9oeXBlcmNhbGwuUyAgICAgICAg
ICAgICB8IDE5ICstLS0tLS0tCj4gIGluY2x1ZGUveGVuL2FybS9oeXBlcmNhbGwuaCAgICAgICAg
ICAgIHwgMTIgKystLS0KPiAgMTYgZmlsZXMgY2hhbmdlZCwgMTMwIGluc2VydGlvbnMoKyksIDEy
NiBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvaW5jbHVkZS9h
c20vYXNtLXVhY2Nlc3MuaAo+Cj4gLS0KPiAyLjI0LjAKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
