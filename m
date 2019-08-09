Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E2B88427
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 22:40:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwBdk-0005nO-Qu; Fri, 09 Aug 2019 20:37:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gc9A=WF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hwBdi-0005nJ-Ue
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 20:37:30 +0000
X-Inumbo-ID: 81414403-bae5-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 81414403-bae5-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 20:37:29 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9864B20C01;
 Fri,  9 Aug 2019 20:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565383048;
 bh=ycEUwMQXb1sO5LWF9GN+/TI2Re3FxnSOlhMz4TVgKFQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=X8DGso6pQcjrFebsLafkAG7tROvYuoURmK1/0s5enuIkuYWPQzjbLBo9NyW1AyXiJ
 4DsDSGPiv2l8z8Mas+ux5G+Kf7osEhPY0d2EgfeAAYUtZDfqfbHL3zd+2gGPiLnYRX
 tPg+2i8GxqX2ojdLOxtFSE4WIY+0j+lmdeqNX/ZY=
Date: Fri, 9 Aug 2019 13:37:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <f796767f-6644-43f4-3e13-7a0aa40c5441@arm.com>
Message-ID: <alpine.DEB.2.21.1908091333160.7788@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-3-sstabellini@kernel.org>
 <f796767f-6644-43f4-3e13-7a0aa40c5441@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 3/7] xen/arm: keep track of
 reserved-memory regions
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA3IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMDYvMDgvMjAxOSAy
Mjo0OSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gICBzdGF0aWMgdm9pZCBfX2luaXQg
cHJvY2Vzc19tdWx0aWJvb3Rfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpuYW1l
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgYWRk
cmVzc19jZWxscywgdTMyCj4gPiBzaXplX2NlbGxzKQo+ID4gQEAgLTMwNyw3ICszMzQsMTEgQEAg
c3RhdGljIGludCBfX2luaXQgZWFybHlfc2Nhbl9ub2RlKGNvbnN0IHZvaWQgKmZkdCwKPiA+ICAg
ICAgICAgaWYgKCBkZXZpY2VfdHJlZV9ub2RlX21hdGNoZXMoZmR0LCBub2RlLCAibWVtb3J5Iikg
KQo+ID4gICAgICAgICAgIHJjID0gcHJvY2Vzc19tZW1vcnlfbm9kZShmZHQsIG5vZGUsIG5hbWUs
IGRlcHRoLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkZHJlc3NfY2Vs
bHMsIHNpemVfY2VsbHMsIE5VTEwpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMsICZib290aW5mby5tZW0pOwo+ID4gKyAgICBl
bHNlIGlmICggZGVwdGggPT0gMSAmJiAhc3RyY21wKG5hbWUsICJyZXNlcnZlZC1tZW1vcnkiKSAm
Jgo+ID4gKyAgICAgICAgICAgICAgc3RybGVuKG5hbWUpID09IHN0cmxlbigicmVzZXJ2ZWQtbWVt
b3J5IikgKQo+IAo+IFVubGVzcyBteSBzdGRsaWIga25vd2xlZGdlIGlzIHJ1c3R5LCBzdHJjbXAo
KSB3aWxsIG9ubHkgcmV0dXJuIDAgaWYgdGhlIHR3bwo+IHN0cmluZyBleGFjdGx5IG1hdGNoZXMu
IFRoaXMgaW1wbGllcyB0aGUgdHdvIHN0cmluZ3MgYXJlIGV4YWN0bHkgdGhlIHNhbWUKPiBsZW5n
dGguCgpHb29kIG1lbW9yeSA6LSkKWW91IGFyZSByaWdodCwgSSBkb3VibGUtY2hlY2tlZCB0byBj
b25maXJtIGl0LiBJJ2xsIHJlbW92ZSB0aGUgc3RybGVuCmNoZWNrLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
