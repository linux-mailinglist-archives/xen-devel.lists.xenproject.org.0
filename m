Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD27131769
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 19:22:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioWxr-0002Va-RS; Mon, 06 Jan 2020 18:18:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ioWxq-0002VV-TR
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 18:18:54 +0000
X-Inumbo-ID: ff2e00aa-30b0-11ea-ab4d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff2e00aa-30b0-11ea-ab4d-12813bfff9fa;
 Mon, 06 Jan 2020 18:18:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 812982070E;
 Mon,  6 Jan 2020 18:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578334433;
 bh=1OPeZmIQ84VfK1U1UEVoLp49ve7rZQFSyTXUVh3scPs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=thbyLqoXhl/vAMYsCMa3mpJkOGhJUHZtk2ViJGnBAMtWOCb0zlb61anr66JTxh1g6
 WPzuh1Ni1srr05bEgUoJLGx/eFC81iwNIWp3Ukthq8FOUGf/GU6LWNVAfi1nL/Ou4M
 HXq8rKcTSlVzNKF04i7cEOOSzZfvOBy9cZc+KC2E=
Date: Mon, 6 Jan 2020 10:13:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <2f2990a7-c8ad-0b29-3f63-b4ef648677bc@xen.org>
Message-ID: <alpine.DEB.2.21.2001061013170.732@sstabellini-ThinkPad-T480s>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <alpine.DEB.2.21.1912171737160.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy8nMc1xj4Lh4emdkxpnwBrYBWh9wOx_muHAuO2rs1HmmQ@mail.gmail.com>
 <CAMmSBy9Djc6CxLnq8br8Ha1HrsHUf8ry5c0U0spbT9YRR+0fZg@mail.gmail.com>
 <d77e7ec8-3b28-ee60-a180-794deb227099@xen.org>
 <CAMmSBy8LT4yZGoGKWTOtEeV4e=9+BQaAx+zFp1oUf6fi1PzY2A@mail.gmail.com>
 <87e4706e-5b7a-1025-5825-376ed801a6e4@xen.org>
 <CAMmSBy_26UqPHeuRC9Jw0g=1oe3jzrsxKsQXs4xB+y3xPLmm-w@mail.gmail.com>
 <86f35bc9-4059-b56f-d77d-c3aa44a75c75@xen.org>
 <alpine.DEB.2.21.1912191555240.9832@sstabellini-ThinkPad-T480s>
 <CAMmSBy8B0T1j5XhaHHNXv=HWLKqNNfzb2hP=j+mAR2VOg5Y4sw@mail.gmail.com>
 <5d085390-15e0-4a62-ea0b-ee9ddd428d6d@xen.org>
 <CAMmSBy9oQz7DkRrdBS5quO56ViCKBv-S5_uug+7x1hw6gd3svg@mail.gmail.com>
 <CAMmSBy9EP0Brn8P-N61LEZA1-RH9uBQ3NWNrvA070=PCnboy7g@mail.gmail.com>
 <2f2990a7-c8ad-0b29-3f63-b4ef648677bc@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
Cc: xen-devel@lists.xenproject.org, Roman Shaposhnik <roman@zededa.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxIEphbiAyMDIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMzEvMTIvMjAxOSAy
Mjo0OCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiA+IEhpIQo+IAo+IEhpLAo+IAo+ID4gCj4g
PiBHb29kIG5ld3M6IG9uZSB0aGF0IHR5cGUgd2FzIGZpeGVkIFhlbiBib290ZWQganVzdCBmaW5l
IGFuZCBkZXRlY3RlZAo+ID4gYWxsIHRoZSBhdmFpbGFibGUgMkcgb2YgbWVtb3J5Lgo+IAo+IFRo
YW5rIHlvdSBmb3IgdGVzdGluZy4gQFN0ZWZhbm8gYXJlIHlvdSBnb2luZyB0byBwcmVwYXJlIGFu
ZCBzdWJtaXQgdGhlIHBhdGNoPwoKeWVzLCBJIHdpbGwsIHRoYW5rIHlvdSBmb3Igc3BvdHRpbmcg
YSBidWcgaW4gdGhlIHBhdGNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
