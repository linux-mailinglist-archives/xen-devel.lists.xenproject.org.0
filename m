Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B6AA810
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 18:14:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5uN7-0004q9-6w; Thu, 05 Sep 2019 16:12:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6KTe=XA=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i5uN6-0004q4-7Z
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 16:12:32 +0000
X-Inumbo-ID: f6aa1ff0-cff7-11e9-abd4-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6aa1ff0-cff7-11e9-abd4-12813bfff9fa;
 Thu, 05 Sep 2019 16:12:31 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1EFB020825;
 Thu,  5 Sep 2019 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567699951;
 bh=eXl4eYahB1aGqdIO4XlYgDiYZoYYX53kWxQSYsX4y4o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WdNZI6L1F1Du6+UD+3leGaA/lnP9ad/3lg9we5IJuUO2tiN4Z27EO2vzYCN/Gtacx
 OyyGH0jl8gQLo8kAo/0f6HjvEEJZVOXdm3oSJovUZyDY0mQHas+CsQnrwTVl/dlC7I
 JweZK5XSEhINZiNuF89OBJP6yMEFk6/pBn/BgqH8=
Date: Fri, 6 Sep 2019 01:12:26 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <20190906011226.f5e8f3d69c6cc8254f97ae7c@kernel.org>
In-Reply-To: <1d868c99-58c5-1bbd-e6a4-2003dd319b5b@citrix.com>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
 <ad6431be-c86e-5ed5-518a-d1e9d1959e80@citrix.com>
 <20190905104937.60aa03f699a9c0fbf1b651b9@kernel.org>
 <1372ce73-e2d8-6144-57df-a98429587826@citrix.com>
 <20190905203224.e41d7f3dfbf918c5031f9766@kernel.org>
 <20190905220958.d0189e1e253f9e553b880675@kernel.org>
 <1d868c99-58c5-1bbd-e6a4-2003dd319b5b@citrix.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Randy Dunlap <rdunlap@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA1IFNlcCAyMDE5IDE0OjMxOjU2ICswMTAwCkFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgoKPiA+Pj4gVGhlIEtWTSB2ZXJzaW9uIHdhcyBhZGRl
ZCBpbiBjL3MgNmM4NmVlZGMyMDZkZDFmOWQzN2EyNzk2ZmFhOGU2ZjIyNzgyMTVkMgo+ID4gSG1t
LCBJIHRoaW5rIEkgbWlnaHQgbWlzdW5kZXJzdGFuZCB3aGF0IHRoZSAiZW11bGF0ZSBwcmVmaXgi
Li4uIHRoYXQgaXMgbm90Cj4gPiBhIHByZWZpeCB3aGljaCByZXBsYWNlIGFjdHVhbCBwcmVmaXgs
IGJ1dCBqdXN0IHdvcmtzIGxpa2UgYW4gZXNjYXBlIHNlcXVlbmNlLgo+ID4gVGh1cyB0aGUgbmV4
dCBpbnN0cnVjdGlvbiBjYW4gaGF2ZSBhbnkgeDg2IHByZWZpeCwgY29ycmVjdD8KPiAKPiBUaGVy
ZSBpcyBhIGJpdCBvZiBoaXN0b3J5IGhlcmUgOikKPiAKPiBPcmlnaW5hbGx5LCAxMyB5ZWFycyBh
Z28sIFhlbiBpbnZlbnRlZCB0aGUgIkZvcmNlIEVtdWxhdGUgUHJlZml4Iiwgd2hpY2gKPiB3YXMg
dGhlIHNlcXVlbmNlOgo+IAo+IHVkMmE7IC5hc2NpaSAneGVuJzsgY3B1aWQKPiAKPiB3aGljaCBo
aXQgdGhlICNVRCBoYW5kbGVyIGFuZCB3YXMgcmVjb2duaXNlZCBhcyBhIHJlcXVlc3QgZm9yCj4g
dmlydHVhbGlzZWQgQ1BVSUQgaW5mb3JtYXRpb24uwqAgVGhpcyB3YXMgZm9yIHJpbmctZGVwcml2
aWxlZ2VkCj4gdmlydHVhbGlzYXRpb24sIGFuZCBpcyBuZWVkZWQgYmVjYXVzZSB0aGUgQ1BVSUQg
aW5zdHJ1Y3Rpb24gaXRzZWxmCj4gZG9lc24ndCB0cmFwIHRvIHRoZSBoeXBlcnZpc29yLgo+IAo+
IEZvbGxvd2luZyBzb21lIHNlY3VyaXR5IGlzc3VlcyBpbiBvdXIgaW5zdHJ1Y3Rpb24gZW11bGF0
b3IsIEkgcmV1c2VkCj4gdGhpcyBwcmVmaXggd2l0aCBWVC14L1NWTSBndWVzdHMgZm9yIHRlc3Rp
bmcgcHVycG9zZXMuwqAgSXQgYmVoYXZlcyBpbiBhCj4gc2ltaWxhciBtYW5uZXIgLSB3aGVuIGVu
YWJsZWQsIGl0IGlzIHJlY29nbmlzZWQgaW4gI1VEIGV4Y2VwdGlvbgo+IGludGVyY2VwdCwgYW5k
IGNhdXNlcyBYZW4gdG8gYWRkIDUgdG8gdGhlIGluc3RydWN0aW9uIHBvaW50ZXIsIHRoZW4KPiBl
bXVsYXRlIHRoZSBpbnN0cnVjdGlvbiBzdGFydGluZyB0aGVyZS4KPiAKPiBUaGVuIHZhcmlvdXMg
Zm9sayB0aG91Z2h0IHRoYXQgaGF2aW5nIHRoZSBzYW1lIGtpbmQgb2YgYWJpbGl0eSB0byB0ZXN0
Cj4gS1ZNJ3MgaW5zdHJ1Y3Rpb24gZW11bGF0b3Igd291bGQgYmUgYSBnb29kIGlkZWEsIHNvIHRo
ZXkgYm9ycm93ZWQgdGhlIGlkZWEuCj4gCj4gRnJvbSBhIGJlaGF2aW91ciBwb2ludCBvZiB2aWV3
LCBpdCBpcyBhbiBvcGFxdWUgNSBieXRlcyB3aGljaCBtZWFucwo+ICJicmVhayBpbnRvIHRoZSBo
eXBlcnZpc29yLCB0aGVuIGVtdWxhdGUgdGhlIGZvbGxvd2luZyBpbnN0cnVjdGlvbiIuCj4gCj4g
VGhlIG5hbWUgInByZWZpeCIgaXMgdW5mb3J0dW5hdGUuwqAgSXQgd2FzIG5hbWVkIHRodXNseSBi
ZWNhdXNlIGZyb20gdGhlCj4gcHJvZ3JhbW1lcnMgcG9pbnQgb2YgdmlldywgaXQgd2FzIHNvbWV0
aGluZyB5b3UgcHV0IGJlZm9yZSB0aGUgQ1BVSUQKPiBpbnN0cnVjdGlvbiB3aGljaCB3YW50ZWQg
dG8gYmUgZW11bGF0ZWQuwqAgSXQgaXMgbm90IHJlbGF0ZWQgdG8geDg2Cj4gaW5zdHJ1Y3Rpb24g
Y29uY2VwdCBvZiBhIHByZWZpeC4KCk9LLCB0aGVuIHdlIHNob3VsZCBub3QgdXNlIHRoZSBpbnNu
LT5wcmVmaXhlcyBmb3IgdGhvc2UgZXNjYXBlIHNlcXVlbmNlcy4KClRoYW5rIHlvdSwKCi0tIApN
YXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
