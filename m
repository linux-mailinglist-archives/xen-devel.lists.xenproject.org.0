Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066066C2A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 14:09:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hluJz-0003Iy-5n; Fri, 12 Jul 2019 12:06:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72A3=VJ=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1hluJx-0003IL-Jx
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 12:06:37 +0000
X-Inumbo-ID: 7e73f97d-a49d-11e9-8980-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7e73f97d-a49d-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 12:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ntU8oMPY07ayUBkHvLSDuYCv3bfOAchf1eGcoqpdijs=; b=2QOMxlXA+8126DIzk43azdjz/
 HTxF5vVgRNoK7eXeV7hS7V1jAf9WCS4q5WVvukltI89jL/68fcRWkkChom0D0Qs+ySTAPkDKhAcMW
 KIkwVCJddWmGDBwJEK/alumUxLK56Wp69kd2oqoMRl6rDT5yLxTGmVWGBe3tzhytayu293pbe063L
 XvB/wtMNFB/+jRyFzmVKAw4Evgb2W+hew33DVW73HwjR5X4oDsI19z5ZJYTqT51PkP3owlZFnQG7m
 Df0O4cQXW6b1je3YygrtUIK9fFrflY8grdrrsB/d5uUX2BncLqs+0dqdGgY/UJB0FZP4ZUUQnTGWh
 ZwFO7rzKQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hluJn-0004ys-JF; Fri, 12 Jul 2019 12:06:27 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2C84620A4087D; Fri, 12 Jul 2019 14:06:26 +0200 (CEST)
Date: Fri, 12 Jul 2019 14:06:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Message-ID: <20190712120626.GW3402@hirez.programming.kicks-ass.net>
References: <1562832921-20831-1-git-send-email-zhenzhong.duan@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562832921-20831-1-git-send-email-zhenzhong.duan@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v2] xen/pv: Fix a boot up hang revealed by
 int3 self test
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, srinivas.eeda@oracle.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMDQ6MTU6MjFQTSArMDgwMCwgWmhlbnpob25nIER1YW4g
d3JvdGU6Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gv
eDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+IGluZGV4IDQ3MjJiYTIuLjIxMzhkNjkgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCj4gKysrIGIvYXJjaC94ODYveGVuL2Vu
bGlnaHRlbl9wdi5jCj4gQEAgLTU5Niw3ICs1OTYsNyBAQCBzdHJ1Y3QgdHJhcF9hcnJheV9lbnRy
eSB7Cj4gIAo+ICBzdGF0aWMgc3RydWN0IHRyYXBfYXJyYXlfZW50cnkgdHJhcF9hcnJheVtdID0g
ewo+ICAJeyBkZWJ1ZywgICAgICAgICAgICAgICAgICAgICAgIHhlbl94ZW5kZWJ1ZywgICAgICAg
ICAgICAgICAgICAgIHRydWUgfSwKPiAtCXsgaW50MywgICAgICAgICAgICAgICAgICAgICAgICB4
ZW5feGVuaW50MywgICAgICAgICAgICAgICAgICAgICB0cnVlIH0sCj4gKwl7IGludDMsICAgICAg
ICAgICAgICAgICAgICAgICAgeGVuX2ludDMsICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSB9
LAo+ICAJeyBkb3VibGVfZmF1bHQsICAgICAgICAgICAgICAgIHhlbl9kb3VibGVfZmF1bHQsICAg
ICAgICAgICAgICAgIHRydWUgfSwKPiAgI2lmZGVmIENPTkZJR19YODZfTUNFCj4gIAl7IG1hY2hp
bmVfY2hlY2ssICAgICAgICAgICAgICAgeGVuX21hY2hpbmVfY2hlY2ssICAgICAgICAgICAgICAg
dHJ1ZSB9LAoKSSdtIGNvbmZ1c2VkIG9uIHRoZSBwdXJwb3NlIG9mIHRyYXBfYXJyYXlbXSwgY291
bGQgeW91IGVsdWNpZGF0ZSBtZT8KClRoZSBzb2xlIHVzZXIgc2VlbXMgdG8gYmUgZ2V0X3RyYXBf
YWRkcigpIGFuZCB0aGF0IHRhbGtzIGFib3V0IElTVHMsIGJ1dAojQlAgaXNuJ3QgYW4gSVNUIGFu
eW1vcmUsIHNvIHdoeSBkb2VzIGl0IGhhdmUgaXN0X29rYXk9dHJ1ZT8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
