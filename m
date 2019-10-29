Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC2E8A3D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 15:06:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPS5n-0005m3-TQ; Tue, 29 Oct 2019 14:03:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1x1s=YW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPS5n-0005ly-2T
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 14:03:27 +0000
X-Inumbo-ID: e003e5ba-fa54-11e9-9513-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e003e5ba-fa54-11e9-9513-12813bfff9fa;
 Tue, 29 Oct 2019 14:03:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84DB6B59B;
 Tue, 29 Oct 2019 14:03:24 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
 <9a76e252-b9a3-4454-6ca8-ab521276fc31@suse.com>
 <782089aa-7994-f471-3c52-2afb30f95812@citrix.com>
 <c12afdd1-c561-bc79-5c36-22ac2e994953@suse.com>
 <6d7c899e-81ab-bc61-a589-043b327b3137@citrix.com>
 <477a6513-0caf-fc4a-21cf-a3a101b6c5ca@suse.com>
 <5b6b2cd3-b8a5-7697-e6f4-f7c337242276@amazon.de>
 <5d075fd9-acbe-0fcd-8f22-9f49c61f657f@citrix.com>
 <15ce3d44-0eaf-c01b-8c80-b0067de9e249@amazon.de>
 <1924da4a-b2d7-456e-5276-6c33338ec86b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad9f735e-4c68-95f9-aa8d-44b5a09095ff@suse.com>
Date: Tue, 29 Oct 2019 15:03:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1924da4a-b2d7-456e-5276-6c33338ec86b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/7] xen/nospec: Use always_inline to fix
 code gen for evaluate_nospec
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTAuMjAxOSAxNDo0NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJZiB0aGlzIHBhdGNo
IHNlcmllcyBkb2VzIG5vdCBhZ3JlZW1lbnQsIEkgd2lsbCB1bmJsb2NrIGxpdmVwYXRjaGluZyBv
bgo+IDQuMTMgYnkgY29tbWl0dGluZyB0aGUgdjIgcGF0Y2ggd2hpY2ggY2F1c2VzIEJSQU5DSF9I
QVJERU4gdG8gZGVwZW5kIG9uCj4gQlJPS0VOIGFuZCBmb3JjZSBpdCB0byBiZSBjb21waWxlZCBv
dXQgd2l0aCBubyB1c2VyIGNob2ljZSBhdCBhbGwuCj4gCj4gVW5icmVha2luZyBsaXZlcGF0Y2hp
bmcgaXMgc3RyaWN0bHkgbW9yZSBpbXBvcnRhbnQgdGhhbiBrZWVwaW5nIGEgYnJhbmQKPiBuZXcg
ZmVhdHVyZSBpbiA0LjEzIGluIGEgYnJva2VuIGZvcm0uwqAgSSd2ZSBwcm92aWRlZCB0d28gYWx0
ZXJuYXRpdmUKPiBzdHJhdGVnaWVzIHRvIGZpeCB0aGUgNC4xMyBibG9ja2VycywgYnV0IGlmIG5v
b25lIGNhbiBhZ3JlZSBvbiB3aGljaAo+IGFwcHJvYWNoIHRvIHVzZSwgSSB3aWxsIGNvbW1pdCB0
aGUgc2ltcGxlciBmaXguCgpBcyB0byB1bmJsb2NraW5nIGxpdmUgcGF0Y2hpbmcgLSBtYXkgSSBh
c2sgeW91IGxvb2sgYXQgdGhlIHN5bWJvbApkaXNhbWJpZ3VhdGlvbiBwYXRjaCBJIGRpZCBzdWJt
aXQ/IFRoZSB0aHJlYWQgaGVyZSwgYXMgc3VnZ2VzdGVkCmJlZm9yZSwgc2hvdWxkIG5vdyBiZSBz
b2xlbHkgYWJvdXQgY29kZSBnZW5lcmF0aW9uLiBBbmQganVzdCBpbgpjYXNlIHlvdSd2ZSBtaXNz
ZWQgdGhpczogSSBkaWQgaW5kaWNhdGUgSSdtIHdpbGxpbmcgdG8gZ2l2ZSBteQphY2sgb24gdGhl
IHYzIHBhdGNoIGhlcmUsIHByb3ZpZGVkIHlvdSBhZGp1c3QgdGhlIGRlc2NyaXB0aW9uIGFzCmFz
a2VkIGZvciBpbiBteSBpbml0aWFsKD8pIHJlcGx5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
