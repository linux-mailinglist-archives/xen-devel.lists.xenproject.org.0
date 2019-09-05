Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D1A9E6F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 11:32:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5o2Q-0005L5-5I; Thu, 05 Sep 2019 09:26:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A+Jx=XA=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1i5o2P-0005L0-30
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 09:26:45 +0000
X-Inumbo-ID: 4028e8c0-cfbf-11e9-978d-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4028e8c0-cfbf-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qYSkLdHnvOeolG6VFyI8jlB0wdCU3wLXfgUY07UlKaM=; b=mnTWqmHz60GQYCWyXoAXPg1wJy
 laNXux2PMwb6UNsbuhn1qpld14vvpOKkA/4YpU5SYUsfBhIlCLOti+pn2JKPoAMHAOzuWroPKlo2g
 vzt6E7hSxdYVVcfe2VqT/dNVdTHd5TKscWsQnFIiM5QRNvsns6ggUz7a1D9wl39eZFdi2zTpzW7/5
 NPhKQANvFLzXmTe4XgDcJTyBUkRdOi6JFO+A9vZQecfz8kE26nLFBxvyqg97Zojl16XaiPa51E9DW
 ak8+ppbL2wdpwkMV1FhlgqQVr2kVq/xSdSjSpjQzks+UfEg+ElXWw/FlGs+dvmcCHkjUyJumeyxMO
 TmzpbW/Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i5o2A-0007fx-4V; Thu, 05 Sep 2019 09:26:30 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 981A7306038;
 Thu,  5 Sep 2019 11:25:50 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 82BE329C0F166; Thu,  5 Sep 2019 11:26:27 +0200 (CEST)
Date: Thu, 5 Sep 2019 11:26:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190905092627.GB2332@hirez.programming.kicks-ass.net>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
 <ad6431be-c86e-5ed5-518a-d1e9d1959e80@citrix.com>
 <20190905104937.60aa03f699a9c0fbf1b651b9@kernel.org>
 <1372ce73-e2d8-6144-57df-a98429587826@citrix.com>
 <20190905082647.GZ2332@hirez.programming.kicks-ass.net>
 <4de91a14-2051-197e-6ab0-beb2538c40f9@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4de91a14-2051-197e-6ab0-beb2538c40f9@citrix.com>
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
 Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Randy Dunlap <rdunlap@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ingo Molnar <mingo@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDk6NTM6MzJBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwNS8wOS8yMDE5IDA5OjI2LCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+IE9u
IFRodSwgU2VwIDA1LCAyMDE5IGF0IDA4OjU0OjE3QU0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3Jv
dGU6Cj4gPgo+ID4+IEkgZG9uJ3Qga25vdyBpZiB5b3UndmUgc3BvdHRlZCwgYnV0IHRoZSBwcmVm
aXggaXMgYSB1ZDJhIGluc3RydWN0aW9uCj4gPj4gZm9sbG93ZWQgYnkgJ3hlbicgaW4gYXNjaWku
Cj4gPj4KPiA+PiBUaGUgS1ZNIHZlcnNpb24gd2FzIGFkZGVkIGluIGMvcyA2Yzg2ZWVkYzIwNmRk
MWY5ZDM3YTI3OTZmYWE4ZTZmMjI3ODIxNWQyCj4gPiBXaGlsZSB0aGUgWGVuIG9uZSBkaXNhc3Nl
YmxlcyB0byB2YWxpZCBpbnN0cnVjdGlvbnMsIHRoYXQgS1ZNIG9uZSBkb2VzCj4gPiBub3Q6Cj4g
Pgo+ID4gCS50ZXh0Cj4gPiB4ZW46Cj4gPiAJdWQyOyAuYXNjaWkgInhlbiIKPiA+IGt2bToKPiA+
IAl1ZDI7IC5hc2NpaSAia3ZtIgo+ID4KPiA+IGRpc2Fzc2VtYmxlcyBsaWtlOgo+ID4KPiA+IDAw
MDAwMDAwMDAwMDAwMDAgPHhlbj46Cj4gPiAgICAwOiAgIDBmIDBiICAgICAgICAgICAgICAgICAg
IHVkMgo+ID4gICAgMjogICA3OCA2NSAgICAgICAgICAgICAgICAgICBqcyAgICAgNjkgPGt2bSsw
eDY0Pgo+ID4gICAgNDogICA2ZSAgICAgICAgICAgICAgICAgICAgICBvdXRzYiAgJWRzOiglcnNp
KSwoJWR4KQo+ID4gMDAwMDAwMDAwMDAwMDAwNSA8a3ZtPjoKPiA+ICAgIDU6ICAgMGYgMGIgICAg
ICAgICAgICAgICAgICAgdWQyCj4gPiAgICA3OiAgIDZiICAgICAgICAgICAgICAgICAgICAgIC5i
eXRlIDB4NmIKPiA+ICAgIDg6ICAgNzYgNmQgICAgICAgICAgICAgICAgICAgamJlICAgIDc3IDxr
dm0rMHg3Mj4KPiA+Cj4gPiBXaGljaCBpcyBhIGJpdCB1bmZvcnR1bmF0ZSBJIHN1cHBvc2UuIEF0
IGxlYXN0IHRoZXkgZG9uJ3QgYXBwZWFyIHRvCj4gPiBjb25zdW1lIGZ1cnRoZXIgYnl0ZXMuCj4g
Cj4gSXQgZG9lcyB3aGVuIHlvdSBnaXZlIG9iamR1bXAgb25lIGV4dHJhIGJ5dGUgdG8gbG9vayBh
dC4KPiAKPiAwMDAwMDAwMDAwMDAwMDA1IDxrdm0+Ogo+IMKgwqAgNTrCoMKgwqAgMGYgMGLCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIHVkMsKgwqDCoAo+IMKgwqAgNzrCoMKg
wqAgNmIgNzYgNmQgMDDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIGltdWzCoMKgICQweDAsMHg2
ZCglcnNpKSwlZXNpCj4gCj4gSSBkaWQgdHJ5IHRvIHBvaW50IG91dCB0aGF0IHRoaXMgcHJvcGVy
dHkgc2hvdWxkIGhhdmUgYmVlbiBjaGVja2VkCj4gYmVmb3JlIHNldHRsaW5nIG9uICdrdm0nIGFz
IHRoZSBzdHJpbmcuCgpCYWggeW91J3JlIHJpZ2h0OyB3aGVuIEkgd3JpdGU6CgoJdWQyOyAuYXNj
aWkgImt2bSI7IGNwdWlkCgpUaGUgb3V0cHV0IGlzIGdpYmJlcmlzaCA6LwoKPiBidXQgd2UncmUg
MTMgeWVhcnMgdG9vIGxhdGUgdG8gYW1lbmQgdGhpcy4KCllhaCwgSSBmaWd1cmVkIDovCgo+ID4g
SSBrbm93IGl0IGlzIHdhdGVyIHVuZGVyIHRoZSBicmlkZ2UgYXQgdGhpcyBwb2ludDsgYnV0IHlv
dSBjb3VsZCd2ZSB1c2VkCj4gPiBVRDEgd2l0aCBhIGRpc3BsYWNlbWVudCB3aXRoIHNvbWUgJ3Vu
bGlrZWx5JyB2YWx1ZXMuIFRoYXQgd2F5IGl0Cj4gPiB3b3VsZCd2ZSBkZWNvZGVkIHRvIGEgc2lu
Z2xlIGluc3RydWN0aW9uLgo+ID4KPiA+IFNvbWV0aGluZyBsaWtlOgo+ID4KPiA+IAl1ZDEgICAg
MHg2ZTY1NzgoJXJheCksJXJheAo+ID4KPiA+IHdoaWNoIHNwZWxscyBvdXQgInhlblwwIiBpbiB0
aGUgZGlzcGxhY2VtZW50Ogo+ID4KPiA+IAk0OCAwZiBiOSA4MCA3OCA2NSA2ZSAwMAo+IAo+IDop
Cj4gCj4gSSBzZWVtIHRvIHJlY2FsbCBVRDAgYW5kIFVEMSBiZWluZyB2ZXJ5IGxhdGUgdG8gdGhl
IGRvY3VtZW50YXRpb24gcGFydHkuCgpUaGV5IHdlcmU7IGFuZCB0aGUgZG9jdW1lbnRhdGlvbiBm
b3Igc3RpbGwgVUQwIGRpZmZlcnMgYmV0d2VlbiB2ZW5kb3JzIDovCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
