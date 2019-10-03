Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A78DCADA4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 19:51:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG5Cy-0006wH-3A; Thu, 03 Oct 2019 17:48:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KLgg=X4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iG5Cw-0006wC-TG
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 17:48:06 +0000
X-Inumbo-ID: f464780c-e605-11e9-8c93-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f464780c-e605-11e9-8c93-bc764e2007e4;
 Thu, 03 Oct 2019 17:48:06 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7AADB20865;
 Thu,  3 Oct 2019 17:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570124885;
 bh=UKSWLFeQmP5I53P3x8lOdLKQEjlquxipFJkKUfI80WY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=YYfP42xiCcmoKUihQ7SK95FPpcZEPTGXqeDFoukJBLQU7vDYnCOYC0msChI4u2YUe
 AeGv4dpN8WBbjTgfojyg5MJWgEI6HAQ850jfFJcdbkQ9kTSLCu6CZX8DqE35qbDeMA
 +qmFoELoXPH7BvnD7FYXNFIQdS8Fw2geohJeYSTc=
Date: Thu, 3 Oct 2019 10:48:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <080c5cf0-d57b-65a2-a89a-1a6080595a72@arm.com>
Message-ID: <alpine.DEB.2.21.1910031044260.30844@sstabellini-ThinkPad-T480s>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-4-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011312180.20899@sstabellini-ThinkPad-T480s>
 <af8c7f32-699b-7611-495b-575a81361952@arm.com>
 <alpine.DEB.2.21.1910011714570.2943@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1910020541060.26319@sstabellini-ThinkPad-T480s>
 <a34363de-bafe-eb22-472f-4b0f2e0d325d@arm.com>
 <alpine.DEB.2.21.1910021454250.2691@sstabellini-ThinkPad-T480s>
 <080c5cf0-d57b-65a2-a89a-1a6080595a72@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 03/10] xen/arm: traps: Rework
 entry/exit from the guest path
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
 Andre Przywara <Andre.Przywara@arm.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAzIE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAwMi8xMC8yMDE5IDIzOjI2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBX
ZWQsIDIgT2N0IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+IFRoYXQgd2FzIG15IHJlZmxl
Y3Rpb24gb24gd2hldGhlciBpdCB3b3VsZCBiZSBhIGdvb2QgaWRlYSBvciBhIGJhZCBpZGVhCj4g
PiB0byBoYXZlIGEgU0VSUk9SIGNoZWNrIG9uIHRoZSBmaXEgaHlwZXJ2aXNvciBlbnRyaWVzLiBO
b3QgbmVjZXNzYXJlbHkgaW4KPiA+IHRoaXMgcGF0Y2guIFByb2JhYmx5IG5vdCBpbiB0aGlzIHBh
dGNoLgo+IAo+IElmIHlvdSByZWNlaXZlIGEgRklRIGV4Y2VwdGlvbiBvbiBBcm02NCwgdGhlbiB5
b3UgYXJlIGFscmVhZHkgZG9vbWVkIGJlY2F1c2UKPiB0aGUgaHlwZXJ2aXNvciB3aWxsIGNyYXNo
IChzZWUgZG9fYmFkX21vZGUoKSkuIFNvIHJlY2VpdmluZyB0aGUgU0Vycm9yIGlzCj4gZ29pbmcg
dG8gYmUgeW91ciBsYXN0IGNvbmNlcm4gaGVyZS4KCkkgcmVhbGl6ZSB0aGF0IFhlbiBpcyBkb29t
ZWQgYW55d2F5LCBidXQgaWYgSSB3YXMgdGhlIHVzZXIsIEkgd291bGQKc3RpbGwgd2FudCB0byBr
bm93IGFib3V0IHRoZSBTRXJyb3I6IGl0IGlzIG5vdCBnb2luZyB0byBzYXZlIHRoZQpwbGF0Zm9y
bSBpbiBhbnkgd2F5IGJ1dCBpdCBtaWdodCBtYWtlIG1lIHJlYWxpemUgdGhlcmUgaXMgc29tZXRo
aW5nCndyb25nIHdpdGggdGhlIGd1ZXN0IGNvbmZpZ3VyYXRpb24gKGluIGFkZGl0aW9uIHRvIHRo
ZSBGSVEgcHJvYmxlbS4pCgpCdXQgYmVjYXVzZSB0aGVyZSBpcyBubyB3YXkgdG8gZ2V0IGEgRklR
IGluIFhlbiwgYXQgbGVhc3Qgb24gcGFwZXIsIHRoaXMKaXMga2luZCBvZiBhIHRoZW9yZXRpY2Fs
IGV4ZXJjaXNlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
