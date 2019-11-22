Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1856105F99
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 06:22:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY1Ju-0006Ds-5i; Fri, 22 Nov 2019 05:17:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Q5S=ZO=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1iXwz0-00022F-UU
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 00:39:34 +0000
X-Inumbo-ID: 8d94d7f2-0cc0-11ea-b678-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d94d7f2-0cc0-11ea-b678-bc764e2007e4;
 Fri, 22 Nov 2019 00:39:34 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a24so4490228edt.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 16:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oHj++TIMg4Ens0F3aJfk7j7E8iHr52gJeFlshV/ISiw=;
 b=YJIHNZEUFsgL4TpJs14+fbdITnHvxz0M9LOs/Dgy5BnL6M72oTwQRtOfHbO+T05ufJ
 1/h2bu5CbngwpOk9xEAXUGoL47+0wPGVl8kzdVFg01KrkZWwGTKp9iyOPCAMdvcn1fFt
 OMdq3ceEnzKogu7+hA4aBhv8w2Jc3Ofz5LZnK7luVq1GrJUQnU/fVoBM6h3G2vQprGJO
 dfL6DlR4mjWJ8D5CyC68cL6TvpB2mRxeylMzeU5xftSuNDAa8J9opSHNTrz+YLpFlpWc
 KfWihhOYnN6H7SyWReveUP0uLF3kZEWSuZ5asTyXPmCHwKTW3sgqpxJeiC1yudV73OrE
 HZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oHj++TIMg4Ens0F3aJfk7j7E8iHr52gJeFlshV/ISiw=;
 b=ofpHzZLmHNRHP1rqnh3RfnR0EYp+PXYjoAuJ/zgWvpZ/uF5u82nZrnTxTQXC0JPPdj
 Mvq+0/GJYaJYEA6mOxPDiC1d5z3Up9hLwHUH/g/PPICv0DNakTmvFsNjDa6XXr6WSHe8
 0QxZKuMc7cupATl3DlOgCcz53u3fXlnORy/It11fhTklp3361ELDmVY+3D+5NXFPC09J
 LTwUxac46W2ht0rhBnAEoU48TiQaW1LeDD3+gCzwIeCH1jeaXWHCAjp9fLs5bWtzoa9z
 wx3AOQW9XKLC+vETVeS/OCqKV0bGxcvMZOPOnTITgWlXbCABd4dtlE4pXiCAKZiqghH+
 YbGg==
X-Gm-Message-State: APjAAAWd1rfAkjxTx4dsCQDaxMGJVp8pHVxwgrtV+GNObfa1Tncs8A4V
 tssdRtzVkm69zLznVVo5ae2E7TeVB3xzU41CuzH6Zg==
X-Google-Smtp-Source: APXvYqwrtfAyjGP3wgLyPbLQNwjFVQfaBija5h4rX527rHpvOeFUrxNZS7l2iyVXlFryl9sSPZTcyswY1QHfRpt/xos=
X-Received: by 2002:a17:906:b30c:: with SMTP id
 n12mr17585915ejz.96.1574383173304; 
 Thu, 21 Nov 2019 16:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20191121184805.414758-1-pasha.tatashin@soleen.com>
 <20191121184805.414758-2-pasha.tatashin@soleen.com>
 <20191122002258.GD25745@shell.armlinux.org.uk>
 <CA+CK2bDtADA2eVwJAUEPhpic8vXWegh8yLjo6Q6WmXZDxAfJpA@mail.gmail.com>
 <20191122003403.GG25745@shell.armlinux.org.uk>
 <20191122003524.GH25745@shell.armlinux.org.uk>
In-Reply-To: <20191122003524.GH25745@shell.armlinux.org.uk>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 21 Nov 2019 19:39:22 -0500
Message-ID: <CA+CK2bAm0r8zLMz_gdq30zF8io5RzVnbXFSV9NkyT_uUxKJwLA@mail.gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Approved-At: Fri, 22 Nov 2019 05:17:22 +0000
Subject: Re: [Xen-devel] [PATCH 1/3] arm/arm64/xen: use C inlines for
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
 Catalin Marinas <catalin.marinas@arm.com>, stefan@agner.ch,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sasha Levin <sashal@kernel.org>,
 sstabellini@kernel.org, James Morris <jmorris@namei.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Marc Zyngier <marc.zyngier@arm.com>, alexios.zavras@intel.com,
 boris.ostrovsky@oracle.com, allison@lohutok.net, jgross@suse.com,
 steve.capper@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IFRoYXQgbWF5IGJlLCBidXQgYmUgdmVyeSBjYXJlZnVsIHRoYXQgeW91IG9ubHkgdXNlIHRo
ZW0gaW4gQVJNdjctb25seQo+ID4gY29kZS4gIFVzaW5nIHRoZW0gZWxzZXdoZXJlIGlzIHVuc2Fm
ZSBhcyB0aGUgZG9tYWluIHJlZ2lzdGVyIGlzIHVzZWQKPiA+IGZvciBvdGhlciBwdXJwb3Nlcywg
YW5kIG1lcmVseSBibGF0dGluZyBvdmVyIGl0IChhcyB5b3VyCj4gPiB1YWNjZXNzX2VuYWJsZSBh
bmQgdWFjY2Vzc19kaXNhYmxlIGZ1bmN0aW9ucyBkbykgaXMgdW5zYWZlLgo+Cj4gSW4gZmFjdCwg
SSdsbCB0dXJuIHRoYXQgaW50byBhIGJpdCBtb3JlIHRoYW4gYSBzdWdnZXN0aW9uLiAgSSdsbCBt
YWtlCj4gaXQgYSBOQUsgb24gYWRkaW5nIHRoZW0gdG8gMzItYml0IEFSTS4KPgoKVGhhdCdzIGZp
bmUsIGFuZCBJIGFsc28gZGlkIG5vdCB3YW50IHRvIGNoYW5nZSBBUk0gMzItYml0LiBCdXQsIGRv
IHlvdQpoYXZlIGEgc3VnZ2VzdGlvbiBob3cgZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGFybTY0IGFu
ZCBhcm0gaW4KaW5jbHVkZS94ZW4vYXJtL2h5cGVyY2FsbC5oIHdpdGhvdXQgdWdseSBpZmRlZnM/
CgpUaGFuayB5b3UsClBhc2hhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
