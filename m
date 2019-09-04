Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262F3A81BB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 14:06:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Tzo-0001pr-OT; Wed, 04 Sep 2019 12:02:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QU6R=W7=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1i5Tzn-0001pe-J0
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 12:02:43 +0000
X-Inumbo-ID: e272f012-cf0b-11e9-978d-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e272f012-cf0b-11e9-978d-bc764e2007e4;
 Wed, 04 Sep 2019 12:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GsVa4yBAwzmv4Q60UbCa2vOPmiuB6G1uChzTAMk5k7Y=; b=CgTpuOsYCDrY2EiDKKfsx+W3p
 0NqRvwq2ZFunMq46iPRUlz1WguNNOCGRjKWo8MYrW6OXfyaEnb/u9QQoJSvaXQ5G2xbv8nKMryr1T
 rY6SekaoFp8ZIBQJr/pf78ixfls+HMMdjKfxRk1/ih5Bqk1wLfiNaz3WV6anRkbeHXwMv3tMu85vg
 BKJUXqsXLTbv0aqiY0GQA5GnaobxwYx2PcoYqb19oXj5YyoYXL2gg8FO15Ox4/fgzfuYnaoxp7owI
 HwSYdVRSJlrEtcz12WQ8TwqUztWEth573Ba/RdCC/UWiukINgItRv6cU6lu4S3qjLSf92Cq1NnZta
 S3PDJga1w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i5Tze-0004tb-HJ; Wed, 04 Sep 2019 12:02:34 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 079F5306024;
 Wed,  4 Sep 2019 14:01:55 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7FFFC29D8830A; Wed,  4 Sep 2019 14:02:32 +0200 (CEST)
Date: Wed, 4 Sep 2019 14:02:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Message-ID: <20190904120232.GH2349@hirez.programming.kicks-ass.net>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156759754770.24473.11832897710080799131.stgit@devnote2>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH -tip 0/2] x86: Prohibit kprobes on
 XEN_EMULATE_PREFIX
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDg6NDU6NDdQTSArMDkwMCwgTWFzYW1pIEhpcmFtYXRz
dSB3cm90ZToKPiBIaSwKPiAKPiBUaGVzZSBwYXRjaGVzIGFsbG93IHg4NiBpbnN0cnVjdGlvbiBk
ZWNvZGVyIHRvIGRlY29kZQo+IHhlbi1jcHVpZCB3aGljaCBoYXMgWEVOX0VNVUxBVEVfUFJFRklY
LCBhbmQgcHJvaGliaXQKPiBrcHJvYmVzIHRvIHByb2JlIG9uIGl0Lgo+IAo+IEpvc2ggcmVwb3J0
ZWQgdGhhdCB0aGUgb2JqdG9vbCBjYW4gbm90IGRlY29kZSBzdWNoIHNwZWNpYWwKPiBwcmVmaXhl
ZCBpbnN0cnVjdGlvbnMsIGFuZCBJIGZvdW5kIHRoYXQgd2UgYWxzbyBoYXZlIHRvCj4gcHJvaGli
aXQga3Byb2JlcyB0byBwcm9iZSBvbiBzdWNoIGluc3RydWN0aW9uLgo+IAo+IFRoaXMgc2VyaWVz
IGNhbiBiZSBhcHBsaWVkIG9uIC10aXAgbWFzdGVyIGJyYW5jaCB3aGljaAo+IGhhcyBtZXJnZWQg
Sm9zaCdzIG9ianRvb2wvcGVyZiBzaGFyaW5nIGNvbW1vbiB4ODYgaW5zbgo+IGRlY29kZXIgc2Vy
aWVzLgo+IAo+IAo+IFRoYW5rIHlvdSwKPiAKPiAtLS0KPiAKPiBNYXNhbWkgSGlyYW1hdHN1ICgy
KToKPiAgICAgICB4ODY6IHhlbjogaW5zbjogRGVjb2RlIFhFTl9FTVVMQVRFX1BSRUZJWCBjb3Jy
ZWN0bHkKPiAgICAgICB4ODY6IGtwcm9iZXM6IFByb2hpYml0IHByb2Jpbmcgb24gaW5zdHJ1Y3Rp
b24gd2hpY2ggaGFzIFhlbiBwcmVmaXgKPiAKPiAKPiAgYXJjaC94ODYvaW5jbHVkZS9hc20vaW5z
bi5oICAgICAgICAgICAgIHwgICAgMiArCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRl
cmZhY2UuaCAgICB8ICAgIDcgKysrKy0KPiAgYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3ByZWZp
eC5oICAgICAgIHwgICAxMCArKysrKysrCj4gIGFyY2gveDg2L2tlcm5lbC9rcHJvYmVzL2NvcmUu
YyAgICAgICAgICB8ICAgIDQgKysrCj4gIGFyY2gveDg2L2xpYi9pbnNuLmMgICAgICAgICAgICAg
ICAgICAgICB8ICAgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICB0b29scy9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnNuLmggICAgICAgfCAgICAyICsKPiAgdG9vbHMvYXJjaC94
ODYvaW5jbHVkZS9hc20veGVuL3ByZWZpeC5oIHwgICAxMCArKysrKysrCj4gIHRvb2xzL2FyY2gv
eDg2L2xpYi9pbnNuLmMgICAgICAgICAgICAgICB8ICAgNDMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICB0b29scy9vYmp0b29sL3N5bmMtY2hlY2suc2ggICAgICAgICAgICAgfCAg
ICAzICstCj4gIDkgZmlsZXMgY2hhbmdlZCwgMTIxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4
LmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9w
cmVmaXguaAoKQWNrZWQtYnk6IFBldGVyIFppamxzdHJhIChJbnRlbCkgPHBldGVyekBpbmZyYWRl
YWQub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
