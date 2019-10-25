Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84477E5058
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 17:43:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO1hS-0000CW-In; Fri, 25 Oct 2019 15:40:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iO1hQ-0000CQ-WF
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 15:40:25 +0000
X-Inumbo-ID: c1c1143e-f73d-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1c1143e-f73d-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 15:40:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2433CB47A;
 Fri, 25 Oct 2019 15:40:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
 <9a76e252-b9a3-4454-6ca8-ab521276fc31@suse.com>
 <782089aa-7994-f471-3c52-2afb30f95812@citrix.com>
 <c12afdd1-c561-bc79-5c36-22ac2e994953@suse.com>
 <6d7c899e-81ab-bc61-a589-043b327b3137@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <477a6513-0caf-fc4a-21cf-a3a101b6c5ca@suse.com>
Date: Fri, 25 Oct 2019 17:40:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6d7c899e-81ab-bc61-a589-043b327b3137@citrix.com>
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

T24gMjUuMTAuMjAxOSAxNzoyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNS8xMC8yMDE5
IDEzOjM0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjUuMTAuMjAxOSAxNDoxMCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IFRoZSB0d28gY2hvaWNlcyB0byB1bmJsb2NrIDQuMTMgYXJlIHRo
aXMgcGF0Y2gsIG9yIHRoZSBwcmV2aW91cyB2ZXJzaW9uCj4+PiB3aGljaCBtYWRlIENPTkZJR19I
QVJERU5fQlJBTkNIIGRlcGVuZCBvbiBCUk9LRU4sIHdoaWNoIHdhcyBldmVuIG1vcmUKPj4+IGRp
c2xpa2VkLgo+PiBPcHRpb24gMyBpcyB0byBoYXZlIGp1c3QgdGhlIGNvbmZpZyBvcHRpb24sIGZv
ciBwZW9wbGUgdG8gdHVybiB0aGlzCj4+IG9mZiBpZiB0aGV5IGZlZWwgbGlrZSBkb2luZyBzby4K
PiAKPiBZZXMsIGJ1dCBuby7CoCBBIGZhY2FkZSBvZiBzZWN1cml0eSBpcyB3b3JzZSB0aGFuIG5v
IHNlY3VyaXR5LCBhbmQgSQo+IGRvbid0IGNvbnNpZGVyIGRvaW5nIHRoYXQgYW4gYWNjZXB0YWJs
ZSBzb2x1dGlvbiBpbiB0aGlzIGNhc2UuCgpCdXQgSSB0aG91Z2h0IHdlIGFsbCBhZ3JlZSB0aGF0
IHRoaXMgaXMgc29tZXRoaW5nIHRoYXQncyBwcmVzdW1hYmx5CmdvaW5nIHRvIHJlbWFpbiBpbmNv
bXBsZXRlIChhcyBpbiBub3QgcHJvdmFibHkgY29tcGxldGUpIGFsdG9nZXRoZXIKYW55d2F5LiBJ
dCdzIGp1c3QgdGhhdCB3aXRob3V0IHRoZSBjaGFuZ2UgaGVyZSBpdCdzIGZhciBtb3JlCmluY29t
cGxldGUgdGhlbiB3aXRoIGl0LgoKSW4gYW55IGV2ZW50IEkgdGhpbmsgd2Ugc2hvdWxkIChhbHNv
KSBoYXZlIGFuIG9waW5pb24gZnJvbSB0aGUgcGVvcGxlCndobyBoYWQgb3JpZ2luYWxseSBjb250
cmlidXRlZCB0aGlzIGxvZ2ljLiBZb3UgZGlkbid0IENjIGFueW9uZSBvZgp0aGVtOyBJJ3ZlIGFk
ZGVkIGF0IGxlYXN0IE5vcmJlcnQgbm93LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
