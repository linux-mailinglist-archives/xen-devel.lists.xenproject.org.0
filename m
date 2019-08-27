Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F309F3E1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 22:19:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2htO-0005S5-0f; Tue, 27 Aug 2019 20:16:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hdZ4=WX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i2htM-0005Rz-Fb
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 20:16:36 +0000
X-Inumbo-ID: 91980894-c907-11e9-b95f-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91980894-c907-11e9-b95f-bc764e2007e4;
 Tue, 27 Aug 2019 20:16:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BD6020674;
 Tue, 27 Aug 2019 20:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566936995;
 bh=ZXao3/6LpGg0XwIrj0ul7U+cVC5mKphkjadprdduang=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=P4Lk9oMWXX5M6+i5MSRctEpHBRYa64RWJENOwyYxxb4xKugxdBn/R61rZz/Z4ZY2r
 KrxbwgZoVz8q+YpW96MY9UQHNEU22Xli5vSONhh23zW5niQFQRrxNxKVOv8CRLsHY8
 WOFRqpiy3EXf6u56RycSAt6ifS17JcURJYvPUITA=
Date: Tue, 27 Aug 2019 13:16:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <b16ba4e7-fc3c-2546-6442-6ad32255e5ff@arm.com>
Message-ID: <alpine.DEB.2.21.1908271316250.25361@sstabellini-ThinkPad-T480s>
References: <1566923614-12503-1-git-send-email-andrii.anisov@gmail.com>
 <b16ba4e7-fc3c-2546-6442-6ad32255e5ff@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] arm/traps.c: Adjust HPFAR_EL2 representation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Andrii Anisov <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyNyBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI3
LzA4LzIwMTkgMTg6MzMsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gPiBGcm9tOiBBbmRyaWkgQW5p
c292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+ID4gCj4gPiBJbiB0aGUgY29tbWl0IGFmMTU2
ZmYwODU5YzhkMzYyYTU3MDY2NDA2MTRjOWQxMGY2MmFkZjIsIGl0Cj4gPiB3YXMgbGVmdCB1bmF0
dGVuZGVkIEhQRkFSX0VMMiByZWdpc3RlciBvdXRwdXQuIE5vdyBpdCBpcyBwcmludGVkCj4gPiB3
aXRoIDE2MDggZGlnaXRzLCB3aGF0IGlzIHdheSB0b28gd2lkZSBldmVuIGZvciB0aGUgYmlnZ2Vz
dAo+ID4gbW9uaXRvcnMuIFNvIGNsZWFudXAgZXhjZXNzaXZlIHBhZGRpbmdzLgo+IAo+IEEgbW9y
ZSBjb21wbGV0ZSBwYXRjaCAoZml4IGFub3RoZXIgcGxhY2UpIGhhcyBhbHJlYWR5IGJlZW4gc2Vu
dCBvbiB0aGUgCj4gbWFpbGluZyBsaXN0IChzZWUgWzFdKS4gSXQgaXMgd2FpdGluZyBvbiBTdGVm
YW5vJ3MgYWNrIGF0IHRoZSBtb21lbnQuLi4KPiAKPiBDaGVlcnMsCj4gCj4gWzFdIAo+IGh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wOC9t
c2cwMTQzOS5odG1sCgpUaGUgcGF0Y2ggaXMgaW4gc3RhZ2luZyBub3cuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
