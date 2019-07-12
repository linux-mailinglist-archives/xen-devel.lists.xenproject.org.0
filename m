Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0994666FCB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 15:12:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlvIk-0007gQ-Fx; Fri, 12 Jul 2019 13:09:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72A3=VJ=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1hlvIh-0007gL-U0
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 13:09:24 +0000
X-Inumbo-ID: 443a92c4-a4a6-11e9-8980-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 443a92c4-a4a6-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 13:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RoZ9NwrBVujcpsAvtIUW8qVulCLJLVw22pbbzzk1gqI=; b=qtSyw2tgioP0MTUAKB5BWB0bt
 HZPhunYUqGQQ9wiLBRzPovUQQ/niRKOLhDBBcSKReSIE1w6VCx6OqDxBE/z3UMiHoNt2aLsb9L2aS
 jmgQPE/TMEvmYmPDTzWQP/1osZ/srt9yeZ3y9OOsC0iKx9YW5nY3wXiI6UR7+2Nkld74EwAHFhYMn
 EYftcLFpid0YlUG7gwKti7QE6USxah1Qe6GlepNAVH7oNGskDH3o12IEaXVgYAn8Sji8M4DTCCLD1
 LIuCdR8VbRYlDDmBoQSVWD0MTVtWQ6f3HXB1TY/8tIoRcxsLohVivLT+DX6GeG/Y3zef1X/jefIBT
 WVeTxAYLg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hlvIc-00078I-FO; Fri, 12 Jul 2019 13:09:18 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id DBACE2097730C; Fri, 12 Jul 2019 15:09:16 +0200 (CEST)
Date: Fri, 12 Jul 2019 15:09:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Message-ID: <20190712130916.GR3419@hirez.programming.kicks-ass.net>
References: <1562832921-20831-1-git-send-email-zhenzhong.duan@oracle.com>
 <20190712120626.GW3402@hirez.programming.kicks-ass.net>
 <a5f5ea4c-f30d-122e-0161-be7b1cb4877c@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5f5ea4c-f30d-122e-0161-be7b1cb4877c@oracle.com>
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

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMDk6MDQ6MjJQTSArMDgwMCwgWmhlbnpob25nIER1YW4g
d3JvdGU6Cj4gCj4gT24gMjAxOS83LzEyIDIwOjA2LCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+
IE9uIFRodSwgSnVsIDExLCAyMDE5IGF0IDA0OjE1OjIxUE0gKzA4MDAsIFpoZW56aG9uZyBEdWFu
IHdyb3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIGIv
YXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCj4gPiA+IGluZGV4IDQ3MjJiYTIuLjIxMzhkNjkg
MTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+ID4gPiArKysg
Yi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKPiA+ID4gQEAgLTU5Niw3ICs1OTYsNyBAQCBz
dHJ1Y3QgdHJhcF9hcnJheV9lbnRyeSB7Cj4gPiA+ICAgc3RhdGljIHN0cnVjdCB0cmFwX2FycmF5
X2VudHJ5IHRyYXBfYXJyYXlbXSA9IHsKPiA+ID4gICAJeyBkZWJ1ZywgICAgICAgICAgICAgICAg
ICAgICAgIHhlbl94ZW5kZWJ1ZywgICAgICAgICAgICAgICAgICAgIHRydWUgfSwKPiA+ID4gLQl7
IGludDMsICAgICAgICAgICAgICAgICAgICAgICAgeGVuX3hlbmludDMsICAgICAgICAgICAgICAg
ICAgICAgdHJ1ZSB9LAo+ID4gPiArCXsgaW50MywgICAgICAgICAgICAgICAgICAgICAgICB4ZW5f
aW50MywgICAgICAgICAgICAgICAgICAgICAgICB0cnVlIH0sCj4gPiA+ICAgCXsgZG91YmxlX2Zh
dWx0LCAgICAgICAgICAgICAgICB4ZW5fZG91YmxlX2ZhdWx0LCAgICAgICAgICAgICAgICB0cnVl
IH0sCj4gPiA+ICAgI2lmZGVmIENPTkZJR19YODZfTUNFCj4gPiA+ICAgCXsgbWFjaGluZV9jaGVj
aywgICAgICAgICAgICAgICB4ZW5fbWFjaGluZV9jaGVjaywgICAgICAgICAgICAgICB0cnVlIH0s
Cj4gPiBJJ20gY29uZnVzZWQgb24gdGhlIHB1cnBvc2Ugb2YgdHJhcF9hcnJheVtdLCBjb3VsZCB5
b3UgZWx1Y2lkYXRlIG1lPwo+IAo+IFVzZWQgdG8gcmVwbGFjZSB0cmFwIGhhbmRsZXIgYWRkcmVz
c2VzIGJ5IFhlbiBzcGVjaWZpYyBvbmVzIGFuZCBzYW5pdHkgY2hlY2sKPiAKPiBpZiB0aGVyZSdz
IGFuIHVuZXhwZWN0ZWQgSVNULXVzaW5nIGZhdWx0IGhhbmRsZXIuCgpnaXQgZ3JlcCB4ZW5faW50
MywgZmFpbGVkIG1lLiBXaGVyZSBkb2VzIHRoYXQgc3ltYm9sIGNvbWUgZnJvbT8KCj4gPiBUaGUg
c29sZSB1c2VyIHNlZW1zIHRvIGJlIGdldF90cmFwX2FkZHIoKSBhbmQgdGhhdCB0YWxrcyBhYm91
dCBJU1RzLCBidXQKPiA+ICNCUCBpc24ndCBhbiBJU1QgYW55bW9yZSwgc28gd2h5IGRvZXMgaXQg
aGF2ZSBpc3Rfb2theT10cnVlPwo+IAo+IE9oLCB5ZXMsIEkgbWlzc2VkIHRoYXQgYm9vbGVhbiwg
dGhhbmtzLiBJJ2xsIHRyeSBpc3Rfb2tleT1mYWxzZSBmb3IgaW50MyBhbmQKPiB0ZXN0IGl0IHRv
bW9ycm93LgoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
