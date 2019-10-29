Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D76E84FB
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 11:00:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPOF3-0001bt-B5; Tue, 29 Oct 2019 09:56:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1x1s=YW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPOF1-0001bo-QI
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 09:56:43 +0000
X-Inumbo-ID: 68bdd848-fa32-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68bdd848-fa32-11e9-beca-bc764e2007e4;
 Tue, 29 Oct 2019 09:56:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05F01AB89;
 Tue, 29 Oct 2019 09:56:41 +0000 (UTC)
To: "Stonehouse, Robert" <rjstone@amazon.co.uk>
References: <D5940155-716B-48BE-A00B-36FC0B5B41A9@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0acc6d6d-0a42-e3ba-31aa-d58979ee1424@suse.com>
Date: Tue, 29 Oct 2019 10:56:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <D5940155-716B-48BE-A00B-36FC0B5B41A9@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [stable-4.11] Heads-up: c719519 (x86/SMP: don't try
 to stop already stopped CPUs) causes 100% kexec/kdump failure
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Durrant,
 Paul" <pdurrant@amazon.com>, "Elnikety, Eslam" <elnikety@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMjAxOSAxODozMCwgU3RvbmVob3VzZSwgUm9iZXJ0IHdyb3RlOgo+IFJldmVydGlu
ZyBvbmUgaHVuayB2aWEgdGhlIGZvbGxvd2luZyBjb21taXQgZml4ZXMgdGhpbmdzIGZvciBtZSAo
dGhpcyBpcyBhbiBleHBlcmltZW50IGFuZCBub3QgYXQgYWxsIGEgcHJvcG9zZWQgZml4KQo+ID09
PT09PT09Cj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3Nt
cC5jCj4gQEAgLTMwMywxNSArMzAzLDE1IEBAIHN0YXRpYyB2b2lkIHN0b3BfdGhpc19jcHUodm9p
ZCAqZHVtbXkpCj4gIHZvaWQgc21wX3NlbmRfc3RvcCh2b2lkKQo+ICB7Cj4gICAgICB1bnNpZ25l
ZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+ICsgICAgCj4gKyAgICBsb2NhbF9pcnFf
ZGlzYWJsZSgpOwo+ICsgICAgZml4dXBfaXJxcyhjcHVtYXNrX29mKGNwdSksIDApOwo+ICsgICAg
bG9jYWxfaXJxX2VuYWJsZSgpOwo+IAo+ICAgICAgaWYgKCBudW1fb25saW5lX2NwdXMoKSA+IDEg
KQo+ICAgICAgewo+ICAgICAgICAgIGludCB0aW1lb3V0ID0gMTA7Cj4gIAo+IC0gICAgICAgIGxv
Y2FsX2lycV9kaXNhYmxlKCk7Cj4gLSAgICAgICAgZml4dXBfaXJxcyhjcHVtYXNrX29mKGNwdSks
IDApOwo+IC0gICAgICAgIGxvY2FsX2lycV9lbmFibGUoKTsKCkFyZSB5b3Ugc2F5aW5nIHdlIGdl
dCBoZXJlIHRoZSBmaXJzdCB0aW1lIG9ubHkgd2hlbiBudW1fb25saW5lX2NwdXMoKQphbHJlYWR5
IHJldHVybnMgMSAoYnV0IHRoZXJlIGFyZSBhY3R1YWxseSBtdWx0aXBsZSBDUFVzLCBpLmUuIGFm
ZmluaXR5CmNoYW5nZXMgYXJlIGFjdHVhbGx5IG5lZWRlZCk/IElmIHNvIC0gd2h5PwoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
