Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3C3F38F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 11:58:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLPTW-0007hz-Mv; Tue, 30 Apr 2019 09:54:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLPTV-0007hq-J3
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 09:54:57 +0000
X-Inumbo-ID: 0113b598-6b2e-11e9-b443-2ff0a16d95e4
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0113b598-6b2e-11e9-b443-2ff0a16d95e4;
 Tue, 30 Apr 2019 09:54:54 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 03:54:53 -0600
Message-Id: <5CC81B6B020000780022A493@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 03:54:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Chao Gao" <chao.gao@intel.com>
References: <1556601559-30921-1-git-send-email-chao.gao@intel.com>
 <5CC7FFAF020000780022A42A@prv1-mh.provo.novell.com>
 <20190430090120.GA6748@gao-cwp>
In-Reply-To: <20190430090120.GA6748@gao-cwp>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/pt: skip setup of posted format IRTE
 when gvec is 0
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMwLjA0LjE5IGF0IDExOjAxLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBP
biBUdWUsIEFwciAzMCwgMjAxOSBhdCAwMTo1NjozMUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj5JbiBhbnkgZXZlbnQgaXQgZG9lc24ndCBsb29rIGNvcnJlY3QgdG8gc2tpcCBtaWdyYXRp
b24gYWx0b2dldGhlciBpbgo+PnRoYXQgY2FzZS4gSSdkIHJhdGhlciBleHBlY3QgaXQgdG8gcmVx
dWlyZSBnZXR0aW5nIGRvbmUgZGlmZmVyZW50bHkuCj4+QWZ0ZXIgYWxsIHRoZXJlIHN0aWxsIGlz
IGEgKENQVSwgdmVjdG9yKSB0dXBsZSBhc3NvY2lhdGVkIHdpdGggdGhhdAo+PnsscH1JUlEgaWYg
aXQncyBub3QgcG9zdGVkLCBhbmQgaHZtX21pZ3JhdGVfcGlycSgpIGlzIGEgbm8tb3AgaWYgaXQg
aXMKPj5wb3N0ZWQuCj4gCj4gSGVyZSwgd2UgdHJ5IHRvIHNldCBpcnEncyB0YXJnZXQgY3B1IHRv
IHRoZSBjcHUgd2hpY2ggdGhlIHZtc2kncyB0YXJnZXQgdmNwdQo+IGlzIHJ1bm5pbmcgb24gdG8g
cmVkdWNlIElQSS4gQnV0IHRoZSAnZGVzdF9pZCcgZmllbGQgd2hpY2ggdXNlZCB0bwo+IGluZGlj
YXRlIHRoZSB2bXNpJ3MgdGFyZ2V0IHZjcHUgaXMgbWlzc2luZywgd2UgZG9uJ3Qga25vdyB3aGlj
aCBjcHUgd2Ugc2hvdWxkCj4gbWlncmF0ZSB0aGUgaXJxIHRvLiBPbmUgcG9zc2libGUgY2hvaWNl
IGlzIHRoZSAnY2huLT5ub3RpZnlfdmNwdV9pZCcKPiB1c2VkIGluIHNlbmRfZ3Vlc3RfcGlycSgp
LiBEbyB5b3UgdGhpbmsgdGhpcyBjaG9pY2UgaXMgZmluZT8KCldlbGwsIHRoZSBjb2RlIHlvdSBj
aGFuZ2UgaXMgdGhhdCBiaW5kaW5nIHRoZSBJUlEsIG5vdCBkZWxpdmVyaW5nCml0LiBJcyB0aGUg
ZXZlbnQgY2hhbm5lbCBzZXQgdXAgYWxyZWFkeSBhdCBhbGwgYXQgdGhhdCBwb2ludD8gU2VlCmFs
c28gUm9nZXIncyByZXBseS4KCj4+RmluYWxseSBpdCBoYXNuJ3QgYmVjb21lIGNsZWFyIHRvIG1l
IHdoeSB0aGlzIGlzIGEgVVAtZ3Vlc3QgaXNzdWUKPj5vbmx5Lgo+IAo+IEZvciBTTVAgY2FzZSwg
aXQgaGFwcGVucyB0byB3b3JrLiBodm1fZ2lycV9kZXN0XzJfdmNwdV9pZCgpIHdvdWxkIHJldHVy
bgo+IC0xIGZvciBTTVAgaW4gbW9zdCBjYXNlcy4gQW5kIHRoZW4gd2Ugd29uJ3QgdXNlIFZULWQg
UEkgaWYgdGhlcmUgaXMgbm8KPiBkZXN0IHZjcHUuIEZvciBVUCBjYXNlLCBodm1fZ2lycV9kZXN0
XzJfdmNwdV9pZCgpIHJldHVybnMgMCB3aXRob3V0IAo+IG1hdGNoaW5nLgoKIkhhcHBlbnMgdG8g
d29yayIgdG9nZXRoZXIgd2l0aCBob3cgaHZtX2dpcnFfZGVzdF8yX3ZjcHVfaWQoKQp3b3JrcyBs
b29rcyB0byBtZWFuICJoYXBwZW5zIHRvIHNvbWV0aW1lcyB3b3JrIiAobWF5YmUgIm9mdGVuIiwK
YnV0IGhhcmRseSAiYWx3YXlzIik6IFRoZSBmdW5jdGlvbiBlYXNpbHkgY2FuIHJldHVybiBvdGhl
ciB0aGFuIC0xCmZvciBtdWx0aS1DUFUgZ3Vlc3RzIGFzIHdlbGwuIFdoaWNoIHRoZW4gaXMgYW5v
dGhlciByZWFzb24gdG8KY29uc2lkZXIgZml4aW5nIHRoZSBpc3N1ZSBpbiBxZW11IGluc3RlYWQu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
