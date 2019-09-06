Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4520AB4C1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 11:18:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6AL5-0004mx-BW; Fri, 06 Sep 2019 09:15:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TT/o=XB=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1i6AL4-0004ms-12
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 09:15:30 +0000
X-Inumbo-ID: d8f387aa-d086-11e9-978d-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8f387aa-d086-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A7pQ/2obJSu6glFAN/iZb0WmVvetjWy1D+ZDyW159q0=; b=p6GJr2Au6TrWlxxqLStxIRds3
 7iFWkUB02Kd6586GkS4LwCk+4pdf5Jt/2Gj/B3rmkyeRULXcns1HeHJlDlGqlDZzXpBPNh1brGotx
 7PsSj7im9GKrqgL45P5+Ha5uS1MVfyXlLTI6+uV7Mqb1F5+p58D/OlqSyzA8ZDJtApIs2nhF8vIDw
 qx488sDprcKbJPSiCOum3mRkXLGiCE7aABCz1ljlJq7WoXky41y1BHMskIzL3tkj0hC0gqbhq4Kaa
 DQ5anAnYz8PPvARMepjD/L8d/dNOmHjpKJY1exF82Q/Am4cxqinCxD5WcntHqcyG9E1vTB9kJOVIX
 Ww+lODi/w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i6AKm-0004yn-IX; Fri, 06 Sep 2019 09:15:12 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9BC19301A5D;
 Fri,  6 Sep 2019 11:14:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id F2DA429E2C316; Fri,  6 Sep 2019 11:15:10 +0200 (CEST)
Date: Fri, 6 Sep 2019 11:15:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Message-ID: <20190906091510.GV2349@hirez.programming.kicks-ass.net>
References: <156773433821.31441.2905951246664148487.stgit@devnote2>
 <156773434815.31441.12739136439382289412.stgit@devnote2>
 <20190906073436.GS2349@hirez.programming.kicks-ass.net>
 <20190906174519.699b83f08d81b55203212fa1@kernel.org>
 <20190906175143.469287501610cbca73f0abbb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906175143.469287501610cbca73f0abbb@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH -tip v3 1/2] x86: xen: insn: Decode Xen and
 KVM emulate-prefix signature
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDU6NTE6NDNQTSArMDkwMCwgTWFzYW1pIEhpcmFtYXRz
dSB3cm90ZToKPiBPbiBGcmksIDYgU2VwIDIwMTkgMTc6NDU6MTkgKzA5MDAKPiBNYXNhbWkgSGly
YW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPiB3cm90ZToKPiAKPiA+ID4gCj4gPiA+IEhvdyBh
Ym91dCB3ZSBtYWtlIHRoaXMgYXNtL3ZpcnRfcHJlZml4Lmggb3Igc29tZXRoaW5nIGFuZCBpbmNs
dWRlOgo+ID4gPiAKPiA+ID4gLyoKPiA+ID4gICogVmlydCBlc2NhcGUgc2VxdWVuY2VzIHRvIHRy
aWdnZXIgaW5zdHJ1Y3Rpb24gZW11bGF0aW9uOwo+ID4gPiAgKiBpZGVhbGx5IHRoZXNlIHdvdWxk
IGRlY29kZSB0byAnd2hvbGUnIGluc3RydWN0aW9uIGFuZCBub3QgZGVzdHJveQo+ID4gPiAgKiB0
aGUgaW5zdHJ1Y3Rpb24gc3RyZWFtOyBzYWRseSB0aGlzIGlzIG5vdCB0cnVlIGZvciB0aGUgJ2t2
bScgb25lIDovCj4gPiA+ICAqLwo+ID4gPiAKPiA+ID4gI2RlZmluZSBfX1hFTl9FTVVMQVRFX1BS
RUZJWCAgMHgwZiwweDBiLDB4NzgsMHg2NSwweDZlICAvKiB1ZDIgOyAuYXNjaWkgInhlbiIgKi8K
PiA+ID4gI2RlZmluZSBfX0tWTV9FTVVMQVRFX1BSRUZJWCAgMHgwZiwweDBiLDB4NmIsMHg3Niww
eDZkCS8qIHVkMiA7IC5hc2NpaSAia3ZtIiAqLwo+IAo+IEJUVywgd2hhdCBzaG91bGQgd2UgY2Fs
bCBpdCwgImVtdWxhdGUgcHJlZml4IiBvciAidmlydCBwcmVmaXgiPwo+ICJ2aXJ0IHByZWZpeCIg
c291bmRzIHRvbyBnZW5lcmljIHRvIG1lLiBTbyBJIHJhdGhlciBsaWtlIGVtdWxhdGVfcHJlZml4
LmguCgpXb3JrcyBmb3IgbWU7IGFuZCB5ZWFoLCBqdXN0IHNlZSB3aGF0IGlzIGJlc3QgZm9yIHRo
ZSBvdGhlciB0aGluZ3MuIEkKb25seSBzdGFydGVkIGRvd24gdGhhdCByb2FkIGJlY2F1c2UgdGhl
IFhlbiBhbmQgS1ZNICdwcmVmaXhlcycgd2VyZQppbml0aWFsaXplZCBzbyBpbmNvbnNpc3RlbnRs
eS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
