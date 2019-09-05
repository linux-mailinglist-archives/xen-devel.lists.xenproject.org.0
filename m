Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B1BA9827
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 03:53:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5guI-000798-NZ; Thu, 05 Sep 2019 01:49:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6KTe=XA=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i5guH-000791-F7
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 01:49:53 +0000
X-Inumbo-ID: 6e85d9d4-cf7f-11e9-978d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e85d9d4-cf7f-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 01:49:43 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EB0B20644;
 Thu,  5 Sep 2019 01:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567648183;
 bh=zo9ULV+hpAXsuDOpSM2OjIMnQQSkYg7lHRWUmgT2DiI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Spbz7M6vwU7hElCNqtXo3bKV+4/MX5UPtIN8l2p64GEiBqZISlxfa5bc1OunLPkii
 bjeBNfoO6cFJ+tXKjrc3gwOfSyZt/cOnKZ4x/xtyWeGsP5iif9c19VeSAr71jIuM6U
 DBVkcDC04fNdgCH4YhXG55EE5a7IGmP7Qh4b0Q98=
Date: Thu, 5 Sep 2019 10:49:37 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <20190905104937.60aa03f699a9c0fbf1b651b9@kernel.org>
In-Reply-To: <ad6431be-c86e-5ed5-518a-d1e9d1959e80@citrix.com>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
 <ad6431be-c86e-5ed5-518a-d1e9d1959e80@citrix.com>
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

T24gV2VkLCA0IFNlcCAyMDE5IDEyOjU0OjU1ICswMTAwCkFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgoKPiBPbiAwNC8wOS8yMDE5IDEyOjQ1LCBNYXNhbWkg
SGlyYW1hdHN1IHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gVGhlc2UgcGF0Y2hlcyBhbGxvdyB4ODYg
aW5zdHJ1Y3Rpb24gZGVjb2RlciB0byBkZWNvZGUKPiA+IHhlbi1jcHVpZCB3aGljaCBoYXMgWEVO
X0VNVUxBVEVfUFJFRklYLCBhbmQgcHJvaGliaXQKPiA+IGtwcm9iZXMgdG8gcHJvYmUgb24gaXQu
Cj4gPgo+ID4gSm9zaCByZXBvcnRlZCB0aGF0IHRoZSBvYmp0b29sIGNhbiBub3QgZGVjb2RlIHN1
Y2ggc3BlY2lhbAo+ID4gcHJlZml4ZWQgaW5zdHJ1Y3Rpb25zLCBhbmQgSSBmb3VuZCB0aGF0IHdl
IGFsc28gaGF2ZSB0bwo+ID4gcHJvaGliaXQga3Byb2JlcyB0byBwcm9iZSBvbiBzdWNoIGluc3Ry
dWN0aW9uLgo+ID4KPiA+IFRoaXMgc2VyaWVzIGNhbiBiZSBhcHBsaWVkIG9uIC10aXAgbWFzdGVy
IGJyYW5jaCB3aGljaAo+ID4gaGFzIG1lcmdlZCBKb3NoJ3Mgb2JqdG9vbC9wZXJmIHNoYXJpbmcg
Y29tbW9uIHg4NiBpbnNuCj4gPiBkZWNvZGVyIHNlcmllcy4KPiAKPiBUaGUgcGFyYXZpcnR1YWxp
c2VkIHhlbi1jcHVpZCBpcyB3ZXJlIHlvdSdsbCBzZWUgaXQgbW9zdCBpbiBhIHJlZ3VsYXIKPiBr
ZXJuZWwsIGJ1dCBiZSBhd2FyZSB0aGF0IGl0IGlzIGFsc28gdXNlZCBmb3IgdGVzdGluZyBwdXJw
b3NlcyBpbiBvdGhlcgo+IGNpcmN1bXN0YW5jZXMsIGFuZCB0aGVyZSBpcyBhbiBlcXVpdmFsZW50
IEtWTSBwcmVmaXggd2hpY2ggaXMgdXNlZCBmb3IKPiBLVk0gdGVzdGluZy4KCkdvb2QgY2F0Y2gh
IEkgZGlkbid0IG5vdGljZSB0aGF0LiBJcyB0aGF0IHJlYWxseSBzYW1lIHNlcXVhbmNlIG9yIEtW
TSB1c2VzCmFub3RoZXIgc2VxdWVuY2Ugb2YgaW5zdHJ1Y3Rpb25zIGZvciBLVk0gcHJlZml4PwoK
PiAKPiBJdCBtaWdodCBiZSBiZXR0ZXIgdG8gZ2VuZXJhbGlzZSB0aGUgZGVjb2RlIHN1cHBvcnQg
dG8gInZpcnR1YWxpc2F0aW9uCj4gZXNjYXBlIHByZWZpeCIgb3Igc29tZXRoaW5nIHNsaWdodGx5
IG1vcmUgZ2VuZXJpYy4KCkFncmVlZCwgaXQgaXMgZWFzeSB0byBleHBhbmQgaXQsIHdlIGNhbiBz
d2l0Y2ggdGhlIHByZWZpeCB0ZW1wbGF0ZS4KQ291bGQgeW91IHRlbGwgbWUgd2hlcmUgSSBzaG91
bGQgbG9vaz8gSSB3aWxsIGFkZCBpdC4KClRoYW5rIHlvdSwKCgo+IAo+IH5BbmRyZXcKCgotLSAK
TWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
