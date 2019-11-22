Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD827105F90
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 06:21:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY1Ju-0006Dy-Eo; Fri, 22 Nov 2019 05:17:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Q5S=ZO=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1iXyZ0-0001C7-E0
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 02:20:50 +0000
X-Inumbo-ID: b266dd1a-0cce-11ea-b678-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b266dd1a-0cce-11ea-b678-bc764e2007e4;
 Fri, 22 Nov 2019 02:20:48 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m13so4578625edv.9
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 18:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZZKiFJfK+QnaDabq2KuDAv3MPPigTMKz2YqtvbwcsBE=;
 b=e6NPk8y0Od9eSqId12ooausAsOJe6fSLW4i2fperQF/VoSj/UBOW77u8q1bk2zdVaO
 DJjhD73XFlXItuuIQnFx/PrjmxuCLTxyGlx8MIR4Yb19Q81k4CFHK46heedRrUDGJUta
 MUYGHnmbbQ+fZA5UryP11na5aTitYSj4B+UkVvqO+v16FUUsgnjCoHCDalIVdoqSsTNT
 NXkpV2aCP/qSIc6bL9zaw3NvKvn9glnZMwfSgD9HHMfNwJncDpWSvTdReALlyRyFlToJ
 Lknl9s2+nb52Rv9LqHJD2ssgN2xV9ZZIvMw0O0r/KpKAVGBIug/y/rxT318m+tgtKKrt
 XB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZZKiFJfK+QnaDabq2KuDAv3MPPigTMKz2YqtvbwcsBE=;
 b=AzLuSoW+DrlYwxIR4LesMBcNMH20SP967JlRmym8XNNUXiNqCkqLgc6sGSBm13m1DX
 aOQq7+ymI4nX8Z5VzAJUKc3W6UvBtKzont9fdcOMY+UBuTjBdyUey3FkW2N3lhY/SPQb
 tUA7cepaDX8CrXBE6U+QCP5IJ5rxQlCTwjrMCfEoSoQK+wn5WGQtbgFfyhdJhbwr3M0J
 rhNVE7/k8jQPanC2VBn8qy93G5bjzS9w6ZxA2rqUve3oWtvH+48u/w7j5WOiTHlxSVkD
 d+Gp3havVNckA2VEmLD4sfTnuDWw30VfQP56i4MFI9W5Azt6S2FySupNgnGt2x5JN4nE
 D90A==
X-Gm-Message-State: APjAAAWTAst6FiJMyuhZ88zfSyV3i9q94RkAZoRzY2GeoMMgW+LXAHoL
 lhhnuRcqmzJNEOCLO55P5HGIg2bV952h5hX8UpTGAw==
X-Google-Smtp-Source: APXvYqw9amlPQfGbqL89y89/NKWzDB1NXkpkS7Lf2eLq8xcEu/NYPT00O/pqP8qpKSe6hmyYrC521a/FC0f4bs3UFx8=
X-Received: by 2002:a17:906:5246:: with SMTP id
 y6mr18836740ejm.330.1574389247998; 
 Thu, 21 Nov 2019 18:20:47 -0800 (PST)
MIME-Version: 1.0
References: <20191121184805.414758-1-pasha.tatashin@soleen.com>
 <20191121184805.414758-4-pasha.tatashin@soleen.com>
 <CAMo8BfJYEh_HYGuKwKgfwVdVwg-w-AxN=+6zDuYdwB+E_dTSzA@mail.gmail.com>
In-Reply-To: <CAMo8BfJYEh_HYGuKwKgfwVdVwg-w-AxN=+6zDuYdwB+E_dTSzA@mail.gmail.com>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 21 Nov 2019 21:20:37 -0500
Message-ID: <CA+CK2bCvbZCseGgZV9wjmko3z6h2yNyLy=k3onhL=-7CERSbMw@mail.gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>
X-Mailman-Approved-At: Fri, 22 Nov 2019 05:17:22 +0000
Subject: Re: [Xen-devel] [PATCH 3/3] arm64: remove the rest of asm-uaccess.h
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
 Russell King <linux@armlinux.org.uk>,
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

PiBUaGlzIGlzIG5vdCByZWxhdGVkIHRvIGFybTY0IG9yIHRvIHRoZSBjaGFuZ2VzIGluIHRoZSBk
ZXNjcmlwdGlvbiwKPiBidXQgdGhlIGNoYW5nZSBpdHNlbGYgaXMgT0suIFdoZXRoZXIgeW91IGtl
ZXAgaXQgaW4gdGhpcyBwYXRjaCwKPiBvciBjaG9vc2UgdG8gc3BsaXQgaXQgb3V0IGZlZWwgZnJl
ZSB0byBhZGQKPgo+IEFja2VkLWJ5OiBNYXggRmlsaXBwb3YgPGpjbXZia2JjQGdtYWlsLmNvbT4g
IyBmb3IgeHRlbnNhIGJpdHMKClNvcnJ5LCB0aGlzIHdhcyBhY2NpZGVudGFsIGNoYW5nZS4gSSB3
aWxsIHJlbW92ZSBpdCBmcm9tIHRoZSBuZXh0CnZlcnNpb24gb2YgdGhpcyBzZXJpZXMuCgpQYXNo
YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
