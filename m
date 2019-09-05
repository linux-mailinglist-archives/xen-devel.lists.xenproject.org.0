Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15FAA199
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 13:37:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5q08-0000Tw-2X; Thu, 05 Sep 2019 11:32:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6KTe=XA=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i5q06-0000Tr-Oe
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 11:32:30 +0000
X-Inumbo-ID: d821929c-cfd0-11e9-b299-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d821929c-cfd0-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 11:32:30 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A0B92070C;
 Thu,  5 Sep 2019 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567683149;
 bh=Y+myvtaL/wVtidX/HGF2iJ5MxtkmherpGfkJw9XyNpI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fQ2pxKWhksD2CMPVfQNcHYobKtpPfkh2PKa4YujwIMyaCVYwLoqBvhennaA8SVflm
 R9qs0Vv7rIyRfbig0j3hXq/kINB3MvWzLvOzxi68MnM/ekvP7JK/QJJ7LLKSiIBvt5
 2XV21+pxjeh1LIhtWyY4qv3ZlRFs2OtjL6I20LdA=
Date: Thu, 5 Sep 2019 20:32:24 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <20190905203224.e41d7f3dfbf918c5031f9766@kernel.org>
In-Reply-To: <1372ce73-e2d8-6144-57df-a98429587826@citrix.com>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
 <ad6431be-c86e-5ed5-518a-d1e9d1959e80@citrix.com>
 <20190905104937.60aa03f699a9c0fbf1b651b9@kernel.org>
 <1372ce73-e2d8-6144-57df-a98429587826@citrix.com>
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

T24gVGh1LCA1IFNlcCAyMDE5IDA4OjU0OjE3ICswMTAwCkFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgoKPiBPbiAwNS8wOS8yMDE5IDAyOjQ5LCBNYXNhbWkg
SGlyYW1hdHN1IHdyb3RlOgo+ID4gT24gV2VkLCA0IFNlcCAyMDE5IDEyOjU0OjU1ICswMTAwCj4g
PiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+Cj4g
Pj4gT24gMDQvMDkvMjAxOSAxMjo0NSwgTWFzYW1pIEhpcmFtYXRzdSB3cm90ZToKPiA+Pj4gSGks
Cj4gPj4+Cj4gPj4+IFRoZXNlIHBhdGNoZXMgYWxsb3cgeDg2IGluc3RydWN0aW9uIGRlY29kZXIg
dG8gZGVjb2RlCj4gPj4+IHhlbi1jcHVpZCB3aGljaCBoYXMgWEVOX0VNVUxBVEVfUFJFRklYLCBh
bmQgcHJvaGliaXQKPiA+Pj4ga3Byb2JlcyB0byBwcm9iZSBvbiBpdC4KPiA+Pj4KPiA+Pj4gSm9z
aCByZXBvcnRlZCB0aGF0IHRoZSBvYmp0b29sIGNhbiBub3QgZGVjb2RlIHN1Y2ggc3BlY2lhbAo+
ID4+PiBwcmVmaXhlZCBpbnN0cnVjdGlvbnMsIGFuZCBJIGZvdW5kIHRoYXQgd2UgYWxzbyBoYXZl
IHRvCj4gPj4+IHByb2hpYml0IGtwcm9iZXMgdG8gcHJvYmUgb24gc3VjaCBpbnN0cnVjdGlvbi4K
PiA+Pj4KPiA+Pj4gVGhpcyBzZXJpZXMgY2FuIGJlIGFwcGxpZWQgb24gLXRpcCBtYXN0ZXIgYnJh
bmNoIHdoaWNoCj4gPj4+IGhhcyBtZXJnZWQgSm9zaCdzIG9ianRvb2wvcGVyZiBzaGFyaW5nIGNv
bW1vbiB4ODYgaW5zbgo+ID4+PiBkZWNvZGVyIHNlcmllcy4KPiA+PiBUaGUgcGFyYXZpcnR1YWxp
c2VkIHhlbi1jcHVpZCBpcyB3ZXJlIHlvdSdsbCBzZWUgaXQgbW9zdCBpbiBhIHJlZ3VsYXIKPiA+
PiBrZXJuZWwsIGJ1dCBiZSBhd2FyZSB0aGF0IGl0IGlzIGFsc28gdXNlZCBmb3IgdGVzdGluZyBw
dXJwb3NlcyBpbiBvdGhlcgo+ID4+IGNpcmN1bXN0YW5jZXMsIGFuZCB0aGVyZSBpcyBhbiBlcXVp
dmFsZW50IEtWTSBwcmVmaXggd2hpY2ggaXMgdXNlZCBmb3IKPiA+PiBLVk0gdGVzdGluZy4KPiA+
IEdvb2QgY2F0Y2ghIEkgZGlkbid0IG5vdGljZSB0aGF0LiBJcyB0aGF0IHJlYWxseSBzYW1lIHNl
cXVhbmNlIG9yIEtWTSB1c2VzCj4gPiBhbm90aGVyIHNlcXVlbmNlIG9mIGluc3RydWN0aW9ucyBm
b3IgS1ZNIHByZWZpeD8KPiAKPiBJIGRvbid0IGtub3cgaWYgeW91J3ZlIHNwb3R0ZWQsIGJ1dCB0
aGUgcHJlZml4IGlzIGEgdWQyYSBpbnN0cnVjdGlvbgo+IGZvbGxvd2VkIGJ5ICd4ZW4nIGluIGFz
Y2lpLgo+IAo+IFRoZSBLVk0gdmVyc2lvbiB3YXMgYWRkZWQgaW4gYy9zIDZjODZlZWRjMjA2ZGQx
ZjlkMzdhMjc5NmZhYThlNmYyMjc4MjE1ZDIKPiAKCkFoLCBPSy4gSSBzZWUgaXQuIEJ1dCBpdCBz
ZWVtcyB0aGF0IGFub3RoZXIgdWQwL3VkMSBjYW4gYmUgdXNlZCBieQpvdGhlciAobmV3KSB2aXJ0
dWFsaXphdGlvbi4gU28gYXQgdGhpcyBtb21lbnQgSSB3aWxsIGp1c3QgYWRkIGEgc2VxdWVuY2UK
YXMgYSBwYXR0ZXJuIG9mIHByZWZpeC4gTm90IHVzZSBhIGZpeGVkIHVkMiArIHNpZy4KClRoYW5r
IHlvdSwKCj4gPgo+ID4+IEl0IG1pZ2h0IGJlIGJldHRlciB0byBnZW5lcmFsaXNlIHRoZSBkZWNv
ZGUgc3VwcG9ydCB0byAidmlydHVhbGlzYXRpb24KPiA+PiBlc2NhcGUgcHJlZml4IiBvciBzb21l
dGhpbmcgc2xpZ2h0bHkgbW9yZSBnZW5lcmljLgo+ID4gQWdyZWVkLCBpdCBpcyBlYXN5IHRvIGV4
cGFuZCBpdCwgd2UgY2FuIHN3aXRjaCB0aGUgcHJlZml4IHRlbXBsYXRlLgo+ID4gQ291bGQgeW91
IHRlbGwgbWUgd2hlcmUgSSBzaG91bGQgbG9vaz8gSSB3aWxsIGFkZCBpdC4KPiAKPiBUaGVzZSBh
cmUgdGhlIG9ubHkgdHdvIEknbSBhd2FyZSBvZi4KCgoKPiAKPiB+QW5kcmV3CgoKLS0gCk1hc2Ft
aSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
