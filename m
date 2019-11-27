Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E610B27B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:33:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzIW-0000V2-Ch; Wed, 27 Nov 2019 15:32:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8bDK=ZT=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1iZzIV-0000Ur-6M
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:32:07 +0000
X-Inumbo-ID: 116e01ac-112b-11ea-b155-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 116e01ac-112b-11ea-b155-bc764e2007e4;
 Wed, 27 Nov 2019 15:32:06 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t11so19957316eds.13
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 07:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xep35NOUiSEhnzznO79e2fvbBNLtDBMI+/zstnlMPYc=;
 b=aTIeH/BzHrCwyIraGx4HfI21tiaCubyUHiuQLrXwGLSUKVjrY+ps0pcmHy4eRlm3PN
 tfitfqcvNJ3HUbAvxjz2HdEovCrH1HSvt6qWxfxsn8svACC2PNmYiYZzDkqLIyvPD6dc
 SYbo+KHbjyt8Gx0q6nOilLA1ErlqeWRysumRcNDAwNmxity5rmmVIGyPcg216/ETEdi2
 FVU2F3dSV6nNMy3ZkFOkTupdiy6zg7MY2h6uBYIHGOtj5Mi/BVhJfvPAqUFMhZ8chHHM
 LM7sC4fo5gcgcFmNR+aeax3OQJQyxyaxAW5JiCFgFEy33LjEUzX6TT964OfF+8/eCNRz
 3NNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xep35NOUiSEhnzznO79e2fvbBNLtDBMI+/zstnlMPYc=;
 b=IP+cDSSSIk9xHQa6DNY5DUcYKR+Fw8rL16En9LW2WAhlpJUkUj4gxRYjMuYhCWZphb
 q/7R1ffm4XrGOQ7miDdH+LNDSv5a4IkQddKl22lIWNW4AYE6sYjjj358jFgfrnlWYSZN
 4QtKaD8rKF4tJJfdAnQOIcMpgBVeiu4nBLUWRUS+RVLeVDqeGQ9I12Mn9v4ONuUjLcUh
 hJMlSoec9QfoDkR6yhRasOybXLV1AppN/9zSwgGhPBqe+EIU9wzgdAROVCk4mN8/Tx+U
 CIwjGbFm8HqB57sDemyapt6wnKtt9CQidZMhcAV3CpST3QXKypBdpfRsol9vqlmHPjW8
 I5yg==
X-Gm-Message-State: APjAAAUodh830rPgHbogdu3bW0vGibn8qTFSvTnrrx7rgjASEYid7qWF
 fWh3HSmrh3X9x/r2sW1EHjeutpwELsjKng8izVKSJA==
X-Google-Smtp-Source: APXvYqw+fdhDVDwoSsZuVb3eLmS5SoW5oV0ma0DwgE4YGBgMCjVO3YAn2ZeKw6HasOpTNrIjFoMuZFR2WFJKRJ/d0OA=
X-Received: by 2002:a17:906:a2d0:: with SMTP id
 by16mr1286976ejb.322.1574868725771; 
 Wed, 27 Nov 2019 07:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20191122022406.590141-1-pasha.tatashin@soleen.com>
 <20191122022406.590141-4-pasha.tatashin@soleen.com>
 <20191127151154.GC51937@lakrids.cambridge.arm.com>
In-Reply-To: <20191127151154.GC51937@lakrids.cambridge.arm.com>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 27 Nov 2019 10:31:54 -0500
Message-ID: <CA+CK2bDDom_pwLC-ABwDw66ynyELH3f3NdjUEdhr1LYLkgWJvg@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [Xen-devel] [PATCH v2 3/3] arm64: remove the rest of
 asm-uaccess.h
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Stefan Agner <stefan@agner.ch>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 boris.ostrovsky@oracle.com, Sasha Levin <sashal@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, James Morris <jmorris@namei.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Marc Zyngier <marc.zyngier@arm.com>, alexios.zavras@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net, jgross@suse.com,
 steve.capper@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTA6MTIgQU0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxh
bmRAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAwOToyNDowNlBN
IC0wNTAwLCBQYXZlbCBUYXRhc2hpbiB3cm90ZToKPiA+IFRoZSBfX3VhY2Nlc3NfdHRicjBfZGlz
YWJsZSBhbmQgX191YWNjZXNzX3R0YnIwX2VuYWJsZSwKPiA+IGFyZSB0aGUgbGFzdCB0d28gbWFj
cm9zIGRlZmluZWQgaW4gYXNtLXVhY2Nlc3MuaC4KPiA+Cj4gPiBSZXBsYWNlIHRoZW0gd2l0aCBD
IHdyYXBwZXJzIGFuZCBjYWxsIEMgZnVuY3Rpb25zIGZyb20KPiA+IGtlcm5lbF9lbnRyeSBhbmQg
a2VybmVsX2V4aXQuCj4KPiBGb3Igbm93LCBwbGVhc2UgbGVhdmUgdGhvc2UgYXMtaXMuCj4KPiBJ
IGRvbid0IHRoaW5rIHdlIHdhbnQgdG8gaGF2ZSBvdXQtb2YtbGluZSBDIHdyYXBwZXJzIGluIHRo
ZSBtaWRkbGUgb2YKPiB0aGUgZW50cnkgYXNzZW1ibHkgd2hlcmUgd2UgZG9uJ3QgaGF2ZSBhIGNv
bXBsZXRlIGtlcm5lbCBlbnZpcm9ubWVudC4KPiBUaGUgdXNlIGluIGVudHJ5IGNvZGUgY2FuIGFs
c28gYXNzdW1lIG5vbi1wcmVlbXB0aWJpbGl0eSwgd2hpbGUgdGhlIEMKPiBmdW5jdGlvbnMgaGF2
ZSB0byBleHBsY2l0aWx5IGRpc2FibGUgdGhhdC4KCkkgZG8gbm90IHVuZGVyc3RhbmQsIGlmIEMg
ZnVuY3Rpb24gaXMgY2FsbGVkIGZvcm0gbm9uLXByZWVtcHRpYmxlCmNvbnRleHQgaXQgc3RheXMg
bm9uLXByZWVtcHRpYmxlLiBrZXJuZWxfZXhpdCBhbHJlYWR5IG1heSBjYWxsIEMKZnVuY3Rpb25z
IGFyb3VuZCB0aGUgdGltZSBfX3VhY2Nlc3NfdHRicjBfZW5hYmxlIGlzIGNhbGxlZCAoaXQgbWF5
CmNhbGwgcG9zdF90dGJyX3VwZGF0ZV93b3JrYXJvdW5kKSwgYW5kIHRoYXQgQyBmdW5jdGlvbnMg
ZG9lcyBub3QgZG8KZXhwbGljaXQgcHJlZW1wdCBkaXNhYmxlOgoKPiBXZSBjYW4gY2VydGFpbmx5
IHJlbW92ZSB0aGUgaW5jbHVkZXMgb2YgPGFzbS9hc20tdWFjY2Vzcy5oPiBlbHNld2hlcmUsCj4g
YW5kIG1heWJlIGZvbGQgdGhlIG1hY3JvcyBpbnRvIGVudHJ5LlMgaWYgaXQncyBub3QgdG9vIGNy
b3dkZWQuCgpJIGNhbiBkbyB0aGlzIGFzIGEgc2VwYXJhdGUgcGF0Y2guCgpUaGFuayB5b3UsClBh
c2hhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
