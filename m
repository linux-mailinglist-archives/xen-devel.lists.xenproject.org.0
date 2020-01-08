Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6148E134A07
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 19:02:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipFck-0007cF-VW; Wed, 08 Jan 2020 18:00:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GmMw=25=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1ipFcj-0007Ya-Pd
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 18:00:05 +0000
X-Inumbo-ID: b2d8f9da-3240-11ea-a38f-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2d8f9da-3240-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 18:00:05 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v28so3285381edw.12
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 10:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qIJ0Kicl6j4bwXIU5AzbCNCUfZFKVKAfMopkDEnB5BY=;
 b=k1icy9J+CME6Q3G9G6W6/Wv1Th4TizSEtmEO2uqDn9/R2gnG7nTvQmcSUcyeHKx2Ac
 yAEmz18kLhG+P+c7VgJ6jc+I3/8OBYKPwV9OP6COSgjbIAAlPOXTNAfxz+Uaf7a9VJmv
 KojoOW3+tXzg/ogcCuK6wOSJLJvkNGAEOihfGv3uPgnHkLvuVmyZSUrnSQ8dRrU1eqz1
 cBsJlNdEhUKxsfziEmjwcL6E6MdqoEVqj68ZvsiX6UgHLIMaIOiglQPN5EknHspqLo5v
 SnTPTnUG0niEvIsg0Y//qMlhQ2dHa11PKPesbSSgAmwib6yaPg11UY72yqqevSn6TJzH
 4FQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qIJ0Kicl6j4bwXIU5AzbCNCUfZFKVKAfMopkDEnB5BY=;
 b=jGm70jwdqi6K0ByMucVSDuaE1OQDATgF5nMX4lG9RoUqLUoRQqT2D1WnAfKU8NTGSt
 RgBM9mQgl73s0/4K3H1Ax+mDPyDVcK6FyjHHchm+UydAWcBhQq1OsXYBFiLFo19c9djb
 R947ZwpgFT/tc7GbQdvi0ZrZn22YKkGO7dDTfHxrO50BT8oGerJ+saYamCj5bYcmrcAd
 n7r3Jc6rsKpSZh1EG3XU2VVs7mob1XLaEuTKQxnNxB8gc6GyZYXvBEeLDlcoTcjwIc71
 jKOMxQr0R3lgJ5SycLVA6ZklyHkKSWchgf70ze0hhBfh8A/QzTanrh8OM9DqEDYJhZGN
 oryg==
X-Gm-Message-State: APjAAAXTJy6beCIUhqcVr19WDpGLLdQuMQCzF25sAIVugat/XaJlq1kf
 cDWtmzamt44Ui4Ve6Xe4rGTcVdSSnXGwb4iBkM7LuQ==
X-Google-Smtp-Source: APXvYqxFiszEz1ruqvN1JxacvGk2YwwdHvkB9/n82UcGb5OJEZoTXm7+hnEEp5cKFmWsqXK5/IDqdumJ8FpMF8USO5g=
X-Received: by 2002:a50:cbc3:: with SMTP id l3mr6877488edi.258.1578506402641; 
 Wed, 08 Jan 2020 10:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20200102211357.8042-1-pasha.tatashin@soleen.com>
 <20200102211357.8042-2-pasha.tatashin@soleen.com>
 <alpine.DEB.2.21.2001060918470.732@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2001060918470.732@sstabellini-ThinkPad-T480s>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 8 Jan 2020 12:59:51 -0500
Message-ID: <CA+CK2bAbMqusWhGmPg32zZ2gaZ3KPS_6LTDPh3rdi1ohO_yQqw@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [PATCH v5 1/6] arm/arm64/xen: hypercall.h add
 includes guards
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
 James Morris <jmorris@namei.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 boris.ostrovsky@oracle.com, Sasha Levin <sashal@kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Julien Grall <julien@xen.org>, alexios.zavras@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net, jgross@suse.com,
 steve.capper@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gNiwgMjAyMCBhdCAxMjoxOSBQTSBTdGVmYW5vIFN0YWJlbGxpbmkKPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCAyIEphbiAyMDIwLCBQYXZlbCBU
YXRhc2hpbiB3cm90ZToKPiA+IFRoZSBhcm0gYW5kIGFybTY0IHZlcnNpb25zIG9mIGh5cGVyY2Fs
bC5oIGFyZSBtaXNzaW5nIHRoZSBpbmNsdWRlCj4gPiBndWFyZHMuIFRoaXMgaXMgbmVlZGVkIGJl
Y2F1c2UgQyBpbmxpbmVzIGZvciBwcml2Y21kX2NhbGwgYXJlIGdvaW5nIHRvCj4gPiBiZSBhZGRl
ZCB0byB0aGUgZmlsZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGF2ZWwgVGF0YXNoaW4gPHBh
c2hhLnRhdGFzaGluQHNvbGVlbi5jb20+Cj4gPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4KPgo+IEFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CgoKVGhhbmsgeW91LApQYXNoYQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
