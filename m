Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3F8F103
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 09:16:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLMxr-0001rd-5L; Tue, 30 Apr 2019 07:14:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLMxp-0001rY-5i
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 07:14:05 +0000
X-Inumbo-ID: 86e6c8b6-6b17-11e9-83b9-33220e69f679
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86e6c8b6-6b17-11e9-83b9-33220e69f679;
 Tue, 30 Apr 2019 07:14:01 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 01:13:59 -0600
Message-Id: <5CC7F5B4020000780022A3D7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 01:13:56 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
 <7e73e556-764b-a7b6-b142-2457b8dac418@citrix.com>
In-Reply-To: <7e73e556-764b-a7b6-b142-2457b8dac418@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI5LjA0LjE5IGF0IDE4OjQyLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA0LzI5LzE5IDQ6MTggUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNi4w
NC4xOSBhdCAxOToyMSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+Pj4gUGF0Y2ggY2Y0
YjMwZGNhMGEgIkFkZCBkZWJ1ZyBjb2RlIHRvIGRldGVjdCBpbGxlZ2FsIHBhZ2VfbG9jayBhbmQg
Cj4gcHV0X3BhZ2VfdHlwZQo+Pj4gb3JkZXJpbmciIGFkZGVkIGV4dHJhIHNhbml0eSBjaGVja2lu
ZyB0byBwYWdlX2xvY2svcGFnZV91bmxvY2sgZm9yIGRlYnVnIAo+IGJ1aWxkcwo+Pj4gd2l0aCB0
aGUgYXNzdW1wdGlvbiB0aGF0IG5vIGh5cGVydmlzb3IgcGF0aCBldmVyIGxvY2tzIHR3byBwYWdl
cyBhdCBvbmNlLgo+Pj4KPj4+IFRoaXMgYXNzdW1wdGlvbiBkb2Vzbid0IGhvbGQgZHVyaW5nIG1l
bW9yeSBzaGFyaW5nIHNvIHdlIGludHJvZHVjZSBzZXBhcmF0ZQo+Pj4gZnVuY3Rpb25zLCBwYWdl
X2xvY2tfbWVtc2hyIGFuZCBwYWdlX3VubG9ja19tZW1zaHIsIHRvIGJlIHVzZWQgZXhjbHVzaXZl
bHkKPj4+IGluIHRoZSBtZW1vcnkgc2hhcmluZyBzdWJzeXN0ZW0uCj4+IAo+PiBDb21wbGV0ZWx5
IGJ5cGFzc2luZyB0aGVzZSBjaGVja3MgbG9va3MgdW5kZXNpcmFibGUgdG8gbWUsIHRvCj4+IGJl
IGhvbmVzdC4gT3RvaCBhcyBkaXNjdXNzZWQgbWVtLXNoYXJpbmcgaXMgYWJ1c2luZyB0aGUgbG9j
awo+PiBhbnl3YXkuCj4gCj4gSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYnkgImFidXNpbmci
OyB3b3VsZCBpdCBiZSBhbnkgZGlmZmVyZW50IGlmCj4gcGFnZV9zdHJ1Y3QoKSBoYWQgYSBzcGlu
bG9jayBlbGVtZW50IGNhbGxlZCAicGFnZV9sb2NrIiwgdGhhdCB3YXMgb25seQo+IHVzZWQgYnkg
UFYgZ3Vlc3RzPwoKTm8sIGl0IHdvdWxkbid0LiBCeSAiYWJ1c2luZyIgSSBtZWFuIGl0IGlzIHVz
aW5nIHNvbWV0aGluZyBmb3IgSFZNCndoaWNoIGlzIG1lYW50IHRvIGJlIHVzZWQgZm9yIFBWIG9u
bHkuIEl0IGlzIG1lbS1zaGFyaW5nJ3MgdXNlIGFsb25lCndoaWNoIHByZXZlbnRzIHBhZ2Vfeyx1
bn1sb2NrKCkgdG8gYmUgcHV0IGluc2lkZSAjaWZkZWYgQ09ORklHX1BWLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
