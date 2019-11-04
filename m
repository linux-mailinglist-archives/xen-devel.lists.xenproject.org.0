Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA16EDC1A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 11:08:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRZEE-0004dy-Cx; Mon, 04 Nov 2019 10:04:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iRZED-0004dt-9R
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 10:04:53 +0000
X-Inumbo-ID: 89e5d16c-feea-11e9-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89e5d16c-feea-11e9-984a-bc764e2007e4;
 Mon, 04 Nov 2019 10:04:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 928CBAE12;
 Mon,  4 Nov 2019 10:04:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1e714166-ffeb-06a1-9caf-412eb040ac5a@suse.com>
 <005a7254-aae8-ec7c-6e65-9dfe06803208@suse.com>
 <2b7a7130-9532-82fe-c5fc-58745862e6dd@citrix.com>
 <8be656ff-d372-8e67-0732-e85ae0bab49c@suse.com>
 <8ae24f32-9b30-a19f-d6ed-5136bbf87c8c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <180b441a-7941-d580-67d6-3aad67c12de8@suse.com>
Date: Mon, 4 Nov 2019 11:04:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8ae24f32-9b30-a19f-d6ed-5136bbf87c8c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86: explicitly disallow guest access
 to PPIN
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTEuMjAxOSAxOTozNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8xMC8yMDE5
IDEyOjAyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMzAuMTAuMjAxOSAxMjo0MywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDMwLzEwLzIwMTkgMTA6MzksIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IFRvIGZ1bGZpbGwgdGhlICJwcm90ZWN0ZWQiIGluIGl0cyBuYW1lLCBkb24ndCBsZXQg
dGhlIHJlYWwgaGFyZHdhcmUKPj4+PiB2YWx1ZXMgInNoaW5lIHRocm91Z2giLiBSZXBvcnQgYSBj
b250cm9sIHJlZ2lzdGVyIHZhbHVlIGV4cHJlc3NpbmcgdGhpcy4KPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+PiAtLS0KPj4+PiBUQkQ6
IERvIHdlIHdhbnQgdG8gcGVybWl0IERvbTAgYWNjZXNzPwo+Pj4gSSB3b3VsZCByZWNvbW1lbmQg
cmVvcmRlcmluZyB0aGUgdHdvIHBhdGNoZXMgYW5kIHB1dHRpbmcgdGhpcyBvbmUgZmlyc3QKPj4+
IChhbG9uZyB3aXRoIHRoZSBlbnVtZXJhdGlvbiBkZXRhaWxzLCBhbG9uZyB3aXRoIGEgcGFpciBv
ZiBmZWF0dXJlCj4+PiBzdHJpbmdzIGluIHhlbi1jcHVpZCkuwqAgVGhpcyBwYXRjaCBhdCBsZWFz
dCB3YW50cyBiYWNrcG9ydGluZy4KPj4gV2VsbCwgdGhlIHJlYXNvbiBmb3IgdGhpcyBvcmRlcmlu
ZyBpcyBiZWNhdXNlIHRoaXMgd2F5IERvbTAKPj4gZG9lc24ndCB0cmFuc2llbnRseSBsb3NlIGFs
bCBhY2Nlc3MuCj4gCj4gTm90aGluZyBwcmUtZXhpc3RpbmcgY2FuIGJlIHVzZWQgcmVsaWFibHkg
YnkgZG9tMCBiZWNhdXNlIG9mIHRoZQo+IHJhei93cml0ZS1kaXNjYXJkIGJlaGF2aW91ci4KCldo
eSAicmF6IiAtIGRlZmF1bHQgYmVoYXZpb3IgZm9yICJ1bi1lbnVtZXJhdGVkIiBNU1JzIGlzIHRv
IGhhbmQKb3V0IHRoZSByYXcgaGFyZHdhcmUgdmFsdWUuIEkgYWdyZWUgRG9tMCBjYW4ndCBfZW5h
YmxlXyB0aGUgUFBJTgpNU1IgKGR1ZSB0byB0aGUgd3JpdGUtZGlzY2FyZCBkZWZhdWx0IGJlaGF2
aW9yKSwgYnV0IG9uIHN5c3RlbXMKd2hlcmUgdGhlIGZpcm13YXJlIGRvZXMgdGhlIGVuYWJsaW5n
IGl0IGNvdWxkIHN0aWxsIGhhdmUgcmVhZCB0aGUKdmFsdWVzLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
