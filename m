Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 217DA12546E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 22:14:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihgbe-0000LM-RI; Wed, 18 Dec 2019 21:11:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VLNm=2I=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1ihgbd-0000LG-MD
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 21:11:41 +0000
X-Inumbo-ID: fc460eb2-21da-11ea-a914-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc460eb2-21da-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 21:11:41 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id f8so2839902edv.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 13:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gRnTtk9JZIi/3I1W9vSxQ7/mm0z0CC1gLLvuFpfUIuI=;
 b=SDMWOZ6lQOb/VZRxOexIDEBtyrlvnLSoH+FiJyCNSXqPnRFfJ26Gn0LuQPT12y7A0c
 lnJolpTE8N8rqaP6nxeRUdAGqO8uwJW2n+hreJFUcssOvxBco69nMD89oSqbkKa74G+n
 RxXaI2ISeSqylE/bYEEcez6fS72xry1fa1bsuc66nnJeHlIXPW9zK3oEj6ybcmuOyPEq
 NwahnSFrJp2yti1ljc0Raocs3d8Cp+JYUVuQCDw0K7ZvqfD/HnPCn6/+X7BeJLcGnkgF
 z/PFEpAyrntX6BKJDaoTI9ptXkbOuQh4C81cI86Igt/lS0jNk5pVeWMmDEocZIyYQmDS
 oI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gRnTtk9JZIi/3I1W9vSxQ7/mm0z0CC1gLLvuFpfUIuI=;
 b=Z/rf0kwPOjTez2Ly2rJnni63wj9uKFNOtAwgOXHR2ISKwCYgkiLOvN6InzCTU0ep8r
 MaIaI4rDFBCb1JF5L/RA7nWg0nGWlZAW6kndaxYpzhQYPelTL17Nc7Axv3JkjJ4gnQ1O
 n9rK7Lq2wTQQwelrWgZ5U+uuJdE3Hby7Z/AMcKPddlWbJ2tsVvaOdVgE1SNW12+m6gKO
 hDn+ocRUWuw8S27EQ7jSmW570HwRDzpDicmSZq7JMFNR1bhrKYkU3tBYnbEyoPZZJNb2
 WChbzyLEFmtoS3Qce7LcAk8Z6KFFYbOQf0jUCvxFSMdP51hZh4UFx2zBKUr93TQEZW02
 msgQ==
X-Gm-Message-State: APjAAAUTvDvoGf2zROS7Ar+ZYACbahQeBJ1y9Rb3rUTn2KPF85sp9Yza
 GjQ82ENL/PUL+00rk/6DELMCDnQAQ5k7fp+Xei+KPQ==
X-Google-Smtp-Source: APXvYqzCSdZ2WNjJ4q1+2kgxv6xiSMyDM5buf7JnxsPCxLvV6KwaInc5wgRm4EmYWM+VKPm9g7bHq7zLHX0kZcHWPLw=
X-Received: by 2002:aa7:d64f:: with SMTP id v15mr4964015edr.71.1576703500385; 
 Wed, 18 Dec 2019 13:11:40 -0800 (PST)
MIME-Version: 1.0
References: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
 <20191204232058.2500117-3-pasha.tatashin@soleen.com>
 <b3a6359a-e7df-b47b-f50d-31b716fae191@xen.org>
In-Reply-To: <b3a6359a-e7df-b47b-f50d-31b716fae191@xen.org>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 18 Dec 2019 16:11:29 -0500
Message-ID: <CA+CK2bAw62_6UpTR6316FVE3AiNV7fH7FkF55vRjE8R4=ocd+Q@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] [PATCH v4 2/6] arm/arm64/xen: use C inlines for
 privcmd_call
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Stefan Agner <stefan@agner.ch>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 boris.ostrovsky@oracle.com, Sasha Levin <sashal@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 James Morris <jmorris@namei.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 alexios.zavras@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 allison@lohutok.net, jgross@suse.com, steve.capper@arm.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMzo0MSBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gT24gMDQvMTIvMjAxOSAyMzoyMCwgUGF2ZWwgVGF0
YXNoaW4gd3JvdGU6Cj4gPiBwcml2Y21kX2NhbGwgcmVxdWlyZXMgdG8gZW5hYmxlIGFjY2VzcyB0
byB1c2Vyc3BhY2UgZm9yIHRoZQo+ID4gZHVyYXRpb24gb2YgdGhlIGh5cGVyY2FsbC4KPiA+Cj4g
PiBDdXJyZW50bHksIHRoaXMgaXMgZG9uZSB2aWEgYXNzZW1ibHkgbWFjcm9zLiBDaGFuZ2UgaXQg
dG8gQwo+ID4gaW5saW5lcyBpbnN0ZWFkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdmVsIFRh
dGFzaGluIDxwYXNoYS50YXRhc2hpbkBzb2xlZW4uY29tPgo+ID4gQWNrZWQtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPgo+IFJldmlld2VkLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKR3JlYXQsIHRoYW5rIHlvdSEKClBhc2hhCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
