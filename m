Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB237DA687
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 09:35:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL0EI-0002Sy-U3; Thu, 17 Oct 2019 07:29:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K5Dy=YK=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1iL0EG-0002St-GV
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 07:29:48 +0000
X-Inumbo-ID: dc849cc6-f0af-11e9-beca-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc849cc6-f0af-11e9-beca-bc764e2007e4;
 Thu, 17 Oct 2019 07:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7wFvMRX5TjmoFzlFtCpVT79A1OWYMSfZ1xr6DoHurAY=; b=FHgaLqDuzNECct36pr4DbNDQP
 cR5oenemMl5KnQ+4YcOwPUe4ceiGkr751/GQYZx2vLWPUQmfHutK9OCWO3Di7eaS9gCX8PxBpHuTx
 oY84EGCL3F7c12O3AEZzU1+YbPf0Kn6ctG5TN4YbhiQFbMBalp0ITm3TH12v7a2YknLpXhhmsab3x
 tkp/3jiBq5vL+7kAHQvXRydh4LJMDWrxgPPesMHNPuPoXxY3K1Bq9xCu0P/VV4F4dxrSMlJlPP+3t
 jl7AotmrdXoclsnu2bvNhKXHmj8EzPo8vD2ThImHRTPMKL+I9ae89iWzuzrIThf0oXWRnyKRYRjen
 r4weYZWpg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL0Dr-0003IB-Ia; Thu, 17 Oct 2019 07:29:23 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6FCC7304B4C;
 Thu, 17 Oct 2019 09:28:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B2C1929E86617; Thu, 17 Oct 2019 09:29:20 +0200 (CEST)
Date: Thu, 17 Oct 2019 09:29:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Message-ID: <20191017072920.GU2328@hirez.programming.kicks-ass.net>
References: <156777561745.25081.1205321122446165328.stgit@devnote2>
 <20190917151403.60023814bda80304777a35e5@kernel.org>
 <20191009123106.GK2311@hirez.programming.kicks-ass.net>
 <20191017122655.6fae3c0e44417a0af30cd2d1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017122655.6fae3c0e44417a0af30cd2d1@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH -tip v4 0/4] x86: kprobes: Prohibit kprobes
 on Xen/KVM emulate prefixes
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

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6MjY6NTVQTSArMDkwMCwgTWFzYW1pIEhpcmFtYXRz
dSB3cm90ZToKPiBIaSBQZXRlciwKPiAKPiBPbiBXZWQsIDkgT2N0IDIwMTkgMTQ6MzE6MDYgKzAy
MDAKPiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+IAo+ID4g
T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDM6MTQ6MDNQTSArMDkwMCwgTWFzYW1pIEhpcmFtYXRz
dSB3cm90ZToKPiA+ID4gSGkgUGV0ZXIsCj4gPiA+IAo+ID4gPiBDb3VsZCB5b3UgcmV2aWV3IHRo
aXMgdmVyc2lvbj8KPiA+IAo+ID4gVGhlc2UgbG9vayBnb29kIHRvIG1lOyBzaGFsbCBJIG1lcmdl
IHRoZW0gb3Igd2hhdCB3YXMgdGhlIHBsYW4/Cj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LCB5
ZXMsIGNvdWxkIHlvdSBtZXJnZSB0aGlzIHNlcmllcyB0byBzdXBwb3J0IGVtdWxhdGVkIHByZWZp
eGVzIGNvcnJlY3RseT8KCk9LLCBJJ2xsIGdldCB0aGVtIG1lcmdlZC4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
