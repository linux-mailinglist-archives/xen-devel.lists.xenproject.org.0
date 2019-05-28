Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1982C605
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 14:00:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVaj6-0001jJ-Ee; Tue, 28 May 2019 11:57:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVaj5-0001jE-2L
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 11:57:07 +0000
X-Inumbo-ID: b46b7000-813f-11e9-b625-6bed39557176
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b46b7000-813f-11e9-b625-6bed39557176;
 Tue, 28 May 2019 11:57:02 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 28 May 2019 05:57:01 -0600
Message-Id: <5CED220B0200007800233173@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 28 May 2019 05:56:59 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <20190528102823.14171-1-george.dunlap@citrix.com>
In-Reply-To: <20190528102823.14171-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3] x86/altp2m: cleanup p2m_altp2m_lazy_copy
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

Pj4+IE9uIDI4LjA1LjE5IGF0IDEyOjI4LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBGcm9tOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gCj4gVGhl
IHAybV9hbHRwMm1fbGF6eV9jb3B5IGlzIHJlc3BvbnNpYmxlIGZvciBsYXppbHkgcG9wdWxhdGlu
ZyBhbgo+IGFsdHAybSB2aWV3IHdoZW4gdGhlIGd1ZXN0IHRyYXBzIG91dCBkdWUgdG8gbm8gRVBU
IGVudHJ5IGJlaW5nIHByZXNlbnQKPiBpbiB0aGUgYWN0aXZlIHZpZXcuICBDdXJyZW50bHksIGlu
IGFkZGl0aW9uIHRvIHRha2luZyBhIG51bWJlciBvZgo+IHVudXNlZCBhcmdlbWVudHMsIHRoZSB3
aG9sZSBjYWxsaW5nIGNvbnZlbnRpb24gaGFzIGEgbnVtYmVyIG9mCj4gcmVkdW5kYW50IHAybSBs
b29rdXBzOiB0aGUgZnVuY3Rpb24gcmVhZHMgdGhlIGhvc3RwMm0sIGV2ZW4gdGhvdWdoIHRoZQo+
IGNhbGxlciBoYXMganVzdCByZWFkIHRoZSBzYW1lIGhvc3RwMm0gZW50cnk7IGFuZCB0aGVuIHRo
ZSBjYWxsZXIKPiByZS1yZWFkcyB0aGUgYWx0cDJtIGVudHJ5IHRoYXQgdGhlIGZ1bmN0aW9uIGhh
cyBqdXN0IHJlYWQgKGFuZCBwb3NzaWJseSBzZXQpLgo+IAo+IFJld29yayB0aGlzIGZ1bmN0aW9u
IHRvIG1ha2UgaXQgYSBiaXQgbW9yZSByYXRpb25hbC4gIFNwZWNpZmljYWxseToKPiAKPiAtIFBh
c3MgdGhlIGN1cnJlbnQgaG9zdHAybSBlbnRyeSB2YWx1ZXMgd2UgaGF2ZSBqdXN0IHJlYWQgZm9y
IGl0IHRvCj4gICB1c2UgdG8gcG9wdWxhdGUgdGhlIGFsdHAybSBlbnRyeSBpZiBpdCBmaW5kcyB0
aGUgZW50cnkgZW1wdHkuCj4gCj4gLSBJZiB0aGUgYWx0cDJtIGVudHJ5IGlzIG5vdCBlbXB0eSwg
cGFzcyBvdXQgdGhlIHZhbHVlcyB3ZSd2ZSByZWFkIHNvCj4gICB0aGUgY2FsbGVyIGRvZXNuJ3Qg
bmVlZCB0byByZS13YWxrIHRoZSB0YWJsZXMKPiAKPiAtIEVpdGhlciB3YXksIHJldHVybiB3aXRo
IHRoZSBnZm4gJ2xvY2tlZCcsIHRvIG1ha2UgY2xlYW4tdXAgaGFuZGxpbmcKPiAgIG1vcmUgY29u
c2lzdGVudC4KPiAKPiBSZW5hbWUgdGhlIGZ1bmN0aW9uIHRvIGJldHRlciByZWZsZWN0IHRoaXMg
ZnVuY3Rpb25hbGl0eS4KPiAKPiBXaGlsZSB3ZSdyZSBoZXJlLCBjaGFuZ2UgYm9vbF90IHRvIGJv
b2wsIGFuZCByZXR1cm4gdHJ1ZS9mYWxzZSByYXRoZXIKPiB0aGFuIDEvMC4KPiAKPiBJdCdzIGEg
Yml0IGdyYXRpbmcgdG8gZG8gYm90aCB0aGUgcDJtX2xvY2soKSBhbmQgdGhlIGdldF9nZm4oKSwK
PiBrbm93aW5nIHRoYXQgdGhleSBib2lsIGRvd24gdG8gdGhlIHNhbWUgdGhpbmcgYXQgdGhlIG1v
bWVudDsgYnV0IHdlCj4gaGF2ZSB0byBtYWludGFpbiB0aGUgZmljdGlvbiB1bnRpbCBzdWNoIHRp
bWUgYXMgd2UgZGVjaWRlIHRvIGdldCByaWQKPiBvZiBpdCBlbnRpcmVseS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKRldJVwpBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
