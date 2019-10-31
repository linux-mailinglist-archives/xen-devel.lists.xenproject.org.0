Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9797EAC7F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 10:22:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ6au-0000CI-Qt; Thu, 31 Oct 2019 09:18:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I6hz=YY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iQ6au-0000CC-4N
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 09:18:16 +0000
X-Inumbo-ID: 5e3e5d32-fbbf-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e3e5d32-fbbf-11e9-bbab-bc764e2007e4;
 Thu, 31 Oct 2019 09:18:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7F461B1AD;
 Thu, 31 Oct 2019 09:18:14 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <03d0387a-fe11-866e-81dc-f4055374b0cd@eikelenboom.it>
 <55c0bc58-32bb-79da-b75f-a20946dac94f@suse.com>
 <55f3c0e3-7da7-f1ad-37cd-e5febdda4b09@eikelenboom.it>
 <bd51711f-ab49-3638-dbb2-1806e6ef3632@suse.com>
 <52be608a-24f9-0c67-e5e7-41029ec5a071@eikelenboom.it>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6496a36e-f6be-c4e6-e6a4-f21d8eda2dc2@suse.com>
Date: Thu, 31 Oct 2019 10:18:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <52be608a-24f9-0c67-e5e7-41029ec5a071@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable: AMD-Vi: update_paging_mode Try to
 access pdev_list without aquiring pcidevs_lock.
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTAuMjAxOSAwOTozNSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IFBsYXRmb3Jt
IGlzIHBlcmhhcHMgd2hhdCBzcGVjaWZpYyAob2xkZXIgQU1EIDg5MEZYIGNoaXBzZXQpIGFuZCBJ
IG5lZWQgdGhlIGJpb3Mgd29ya2Fyb3VuZDoKPiBpdnJzX2lvYXBpY1s2XT0wMDoxNC4wIGlvbW11
PW9uLgoKU2hvdWxkbid0IG1hdHRlciBoZXJlLgoKPiBPbiB0aGUgb3RoZXIgaGFuZCwgdGhpcyBo
YXMgcmFuIGxpa2UgdGhpcyBmb3IgcXVpdGUgc29tZSB0aW1lLgo+IAo+IEkgaGF2ZSAzIGd1ZXN0
cyAoSFZNKSBmb3Igd2hpY2ggaSB1c2UgUENJIHBhc3N0aHJvdWdoIGFuZCAKPiBmb3IgZWFjaCBv
ZiB0aG9zZSAzIGd1ZXN0cyBJIGdldCB0aGlzIG1lc3NhZ2UgKm9uY2UqIG9uIHN0YXJ0IG9mIHRo
ZSBndWVzdC4KPiAJT25lIGd1ZXN0IGhhcyBhIHNvdW5kY2FyZCBwYXNzZWQgdGhyb3VnaCwKPiAJ
T25lIGd1ZXN0IGhhcyBhIFVTQjIgY2FyZCBwYXNzZWQgdGhyb3VnaCwKPiAJT25lIGd1ZXN0IGhh
cyBhIFVTQjMgY2FyZCBwYXNzZWQgdGhyb3VnaC4KPiAKPiBBbm90aGVyIG9ic2VydmF0aW9uIGlz
IHRoYXQgYm90aCB0aGUgc291bmRjYXJkIGFuZCBVU0IyIGNhcmQKPiBzdGlsbCBzZWVtIHRvIGZ1
bmN0aW9uIGRlc3BpdGUgdGhlIG1lc3NhZ2UuCgpSZWFsaXR5IGlzIC0gdGhpcyBtZXNzYWdlIGlz
IGJlbmlnbiBhcyBsb25nIGFzIHlvdSBkb24ndCBkbyBQQ0kKaG90ICh1bilwbHVnLgoKPiBUaGUg
VVNCMyBjb250cm9sbGVyIGdvZXMgaGF5d2lyZSB0aG91Z2ggKGEgbG90IG9mIGRyaXZlciBtZXNz
YWdlcyBpbiB0aGUgZ3Vlc3QgZHVyaW5nIGluaXQpLgoKQXMgYSBjb25zZXF1ZW5jZSBJIGRvbid0
IHRoaW5rIHRoZXJlJ3MgYSBjb25uZWN0aW9uIGJldHdlZW4gdGhpcwphbmQgdGhlIG9ic2VydmVk
IG1lc3NhZ2UuCgo+IEkgY291bGQgdHJ5IHRvIGJpc2VjdCwgYnV0IHRoYXQgd291bGQgYmUgc29t
ZXdoZXJlIG5leHQgd2VlayBiZWZvcmUgSSBjYW4gZ2V0IHRvIHRoYXQuCj4gCj4gQXQgcHJlc2Vu
dCBJIHJ1biB3aXRoIGEgdHJlZSB3aXRoIGFzIGxhdGVzdCBjb21taXQgZWU3MTcwODIyZjFmYzIw
OWYzM2ZlYjQ3YjI2OGJhYjM1NTQxMzUxZCwKPiB3aGljaCBpcyBzdGFibGUgZm9yIG1lLiBUaGlz
IHByZWRhdGVzIHNvbWUgb2YgdGhlIElPTU1VIGNoYW5nZXMgYW5kIEFudGhvbnkncyBRTVAgd29y
ayB0aGF0IGhhZAo+IHNvbWUgaXNzdWVzLCBidXQgdGhhdCB3b3VsZCBiZSB0aGUgbGFzdCBrbm93
biByZWFsIGdvb2QgcG9pbnQgZm9yIG1lIHRvIHN0YXJ0IGEgYmlzZWN0IGZyb20uCgpJLmUuIGF0
IHRoYXQgcG9pbnQgeW91IGRpZG4ndCBvYnNlcnZlIHRoaXMgbWVzc2FnZSwgeWV0PwoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
