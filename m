Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB82D7A9F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 17:55:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKP79-00084J-QV; Tue, 15 Oct 2019 15:51:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yms0=YI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iKP78-00084B-2k
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 15:51:58 +0000
X-Inumbo-ID: b7a3814e-ef63-11e9-9396-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7a3814e-ef63-11e9-9396-12813bfff9fa;
 Tue, 15 Oct 2019 15:51:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4C2720854;
 Tue, 15 Oct 2019 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571154717;
 bh=1ksx8yndDmaEGLERQlQh2L+Ieel4igeo8CcwT/6B6vw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=VVggsuq4oOe7jbgYfjx6ZtP4fDSYqYlkJRHuipc+Y0ZPjPmfx70/eLKIHu9/Zuhpm
 CHQycg7InZnMg85Rv6sY/SE2MUjCa84H0PmiKE8Tzend/eIl3aqFs5MqKXjAfNwomM
 tiFExxXa9JsUCiTj2RltfWJV2/YTXxDLFzBJ4tV4=
Date: Tue, 15 Oct 2019 08:51:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <db570cdf-10ef-2e1a-b3c3-650f2e729315@arm.com>
Message-ID: <alpine.DEB.2.21.1910150851050.6326@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910142041270.6326@sstabellini-ThinkPad-T480s>
 <db570cdf-10ef-2e1a-b3c3-650f2e729315@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: remove special dom0 case in
 dump_hyp_walk
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNSBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMTAvMTUvMTkgNDo0OSBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gVGhl
cmUgaXMgbm8gbmVlZCB0byBoYXZlIGEgc3BlY2lhbCBkb20wIGNhc2UgdG8gY29udmVydCB0aGUg
cGd0YWJsZQo+ID4gdmlydHVhbCBhZGRyZXNzIGludG8gYSBwaHlzaWNhbCBhZGRyZXNzLiBUaGUg
dmlydF90b19tYWRkciBmdW5jdGlvbiBjYW4KPiA+IHdvcmsgYm90aCBpbiB0aGUgZG9tMCBjYXNl
IGFuZCB0aGUgZG9tVSBjYXNlLgo+ID4gCj4gPiBUaGlzIGlzIG1vcmUgdGhhbiBhIGNsZWFudXA6
IHdoZW4gWGVuIGlzIGxvYWRlZCBhdCBhZGRyZXNzZXMgbG93ZXIgdGhhbgo+ID4gMk1CIG9uIGFy
bTMyIHBoeXNfb2Zmc2V0IG1pZ2h0IG5vdCBob2xkIHRoZSByaWdodCB2YWx1ZSBhbmQgYmUgdW5h
YmxlIHRvCj4gPiBwZXJmb3JtIGEgdmlydCB0byBwaHlzIGNvbnZlcnNpb24gcHJvcGVybHkuIFJl
ZHVjaW5nIHRoZSB1bm5lY2Vzc2FyeQo+ID4gdXNhZ2Ugb2YgcGh5c19vZmZzZXQgaXMgYSBnb29k
IGlkZWEuCj4gCj4gQXNpZGUgd2hhdCBKdWVyZ2VuIHNhaWQsIHRoaXMgcGFyYWdyYXBoIHJhaXNl
cyB0aGUgcXVlc3Rpb24gd2h5IHBoeXNfb2Zmc2V0IGlzCj4gYWN0dWFsbHkgbm90IG1vZGlmaWVk
IChvciBjb21wbGV0ZWx5IGRyb3BwZWQpPyBBZnRlciBhbGwsIGlmIHRoZSB2YWx1ZSBob2xkcwo+
IGlzIHdyb25nIHRoZW4gb3RoZXIgdXNlcnMgbWF5IGdldCB3cm9uZyB2YWx1ZSBhcyB3ZWxsLi4u
CgpTaG91bGQgSSBhZGQgc29tZXRoaW5nIGxpa2UgInRoaXMgaXMgbm90IGEgZml4LCBidXQgcmVk
dWNpbmcgdW5uZWNlc3NhcnlbLi4uXSIgPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
