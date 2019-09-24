Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92234BD0F2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:51:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCovb-0005tl-Oj; Tue, 24 Sep 2019 17:48:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0Hj=XT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iCova-0005tg-KP
 for xen-devel@lists.xen.org; Tue, 24 Sep 2019 17:48:42 +0000
X-Inumbo-ID: 8b74074a-def3-11e9-97fb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 8b74074a-def3-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 17:48:41 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48A9F207FD;
 Tue, 24 Sep 2019 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569347320;
 bh=kIbVItgI//vAl0hzz/L4q5Az8T6ryPOFt8NG7BIkvCI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=r4gwG8BBhg2zKMpEopf9vPfgFocsgBX4QB7jCuB73EMUeu+BJMx16aWjnlUK7YK+U
 A0ZLbN0jNZ+jcq9isd8S9fIxAiqzXEIcaOp2SfDK2Nf/RltFm/o5zJvYdhdeZPLpO0
 JvRYgvvBIjAqqwpEEwjOP+pkvOobS42sGCC89zPE=
Date: Tue, 24 Sep 2019 10:48:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <ecb07901-c374-c3c1-afcd-c19a7d82958c@arm.com>
Message-ID: <alpine.DEB.2.21.1909241046100.24909@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-5-sstabellini@kernel.org>
 <13e675a2-6628-ccab-9122-94ed9ea2a23d@arm.com>
 <alpine.DEB.2.21.1909240941360.24909@sstabellini-ThinkPad-T480s>
 <ecb07901-c374-c3c1-afcd-c19a7d82958c@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 5/8] xen/arm: assign devices to boot
 domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Achin.Gupta@arm.com, xen-devel@lists.xen.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyNCBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gOS8yNC8xOSA1OjUyIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBX
ZWQsIDExIFNlcCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IEl0IGFsc28gcmFpc2Vz
IHRoZSBxdWVzdGlvbiB3aGF0IHNob3VsZCB3ZSBkbyBpZiB0aGUgc2l6ZSBwYXNzZWQgaW4gbm90
Cj4gPiA+IHBhZ2UtYWxpZ25lZD8gU2hhbGwgd2UganVzdCBibGluZGx5IHJvdW5kIHVwL2Rvd24/
IFNob3VsZCB3ZSB3YXJuPwo+ID4gPiAKPiA+ID4gVGhpcyB3YXMgbm90IGltcG9ydGFudCBmb3Ig
ZG9tMCwgYnV0IGlzIHBvdGVudGlhbGx5IGNyaXRpY2FsIGZvciBkb21VIGFzCj4gPiA+IHlvdQo+
ID4gPiBtYXkgaGFwcGVuIHRvIGluYWR2ZXJ0ZW50bHkgdG8gZXhwb3J0IG1vcmUgdGhhbiB5b3Ug
aG9wZSB0byBhIGd1ZXN0Lgo+ID4gCj4gPiBBIHdhcm5pbmcgb3IgZXZlbiBhIHBhbmljIHdvdWxk
IGJlIE9LIGJlY2F1c2UgaXQgaXMgYSBzdGF0aWMKPiA+IG1pc2NvbmZpZ3VyYXRpb24uCj4gCj4g
WWVzIGFuZCBubywgdGhlcmUgYXJlIHBsYXRmb3JtcyB3aGVyZSBkZXZpY2VzIGFyZSBzaGFyaW5n
IHRoZSBzYW1lIHBhZ2VzIChzZWUKPiB0aGUgVUFSVCBvbiBTdW54aSBTb0MgZm9yIGluc3RhbmNl
KS4gU28gdGhpcyBpcyBhIHZhbGlkIGNvbmZpZ3VyYXRpb24sIGJ1dCB3ZQo+IGRvbid0IHN1cHBv
cnQgaXQuCgpIb3BlZnVsbHkgdGhlIHVzZXIgc2hvdWxkIGtub3cgdGhhdCB0aGUgbWluaW11bSBn
cmFudWxhcml0eSBpcyA0Sy4KCgo+IFRoZSBwcm9ibGVtIGRvZXMgbm90IGFyaXNlIGZvciBkb21V
IGNyZWF0ZWQgYnkgdGhlIHRvb2xzdGFjayBiZWNhdXNlIHdlCj4gcmVxdWVzdCBhIGZyYW1lLiBO
b3RlIHRoYXQgSSB3b3VsZCBub3Qgd2FudCB0byB1c2UgYSBmcmFtZSBmb3IgRG9tMGxlc3MKPiBh
c3NpZ25tZW50IGFzIEkgdGhpbmsgdGhpcyBpcyBidWdneS4KPiAKPiBBbnl3YXksIEkgd291bGQg
cmF0aGVyIG5vdCBhZGQgYSBwYW5pYyBpbiB0aGlzIGNvZGUgYW5kIGxldCB0aGUgdXBwZXIgbGF5
ZXIKPiBkZWNpZGluZyB3aGF0IHRvIGRvLgoKT0suIEkgYWRkZWQgYSB3YXJuaW5nLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
