Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA8310F56
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 00:48:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLxyI-0004lk-Je; Wed, 01 May 2019 22:45:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/tq=TB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLxyH-0004lf-Dk
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 22:45:01 +0000
X-Inumbo-ID: c018a25a-6c62-11e9-843c-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c018a25a-6c62-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 22:45:00 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BCC32075E;
 Wed,  1 May 2019 22:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556750699;
 bh=rWIuwsFefCWgwX16TqALm6hjypNeR2xV4G+gVkB/qwg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=BKDwj9K3Az+vO/ms62QZnEWVpNAWB04HNqUgWXz+PqZx3q3qxlUrr9FNuZ0XghDHL
 2Y8GfIAKWvxgBm0ywg01BeL5Kdm9VS6VQL6Vbh4jNhJxLn8S1p6jcs7wZT0hGtb1tf
 pM7Idfo9AcyYlIB+Ba8FbrFWOi0oO0/8xD8xyOF4=
Date: Wed, 1 May 2019 15:44:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: JBeulich@suse.com
In-Reply-To: <alpine.DEB.2.10.1904291008070.27577@sstabellini-ThinkPad-X260>
Message-ID: <alpine.DEB.2.10.1905011536510.23881@sstabellini-ThinkPad-X260>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
 <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
 <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
 <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
 <alpine.DEB.2.10.1904261621360.24598@sstabellini-ThinkPad-X260>
 <5CC6A47E0200007800229D67@prv1-mh.provo.novell.com>
 <10687f88-fb6b-721c-c6e8-a1ab06023616@arm.com>
 <5CC72125020000780022A20F@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1904291008070.27577@sstabellini-ThinkPad-X260>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: skip first page when RAM starts at
 0x0
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 206497@studenti.unimore.it, xen-devel <xen-devel@lists.xenproject.org>,
 nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyOSBBcHIgMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIE1vbiwg
MjkgQXByIDIwMTksIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPj4+IE9uIDI5LjA0LjE5IGF0IDE3
OjU0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+ID4gPiBBbnl3YXksIEkgYWxzbyB0
ZXN0ZWQgdGhlIGNoYW5nZSBzdWdnZXN0ZWQgYnkgU3RlZmFuby4gVGhpcyB3aWxsIHN1YnN0YW50
aWFsbHkgCj4gPiA+IGluY3JlYXNlIHRoZSBzaXplIG9mIHRoZSBmcmFtZXRhYmxlIG9uIHBsYXRm
b3JtIHdoZXJlIHRoZSBSQU0gZG9lcyBub3Qgc3RhcnQgCj4gPiA+IGF0IDAuCj4gPiA+IAo+ID4g
PiBGb3IgaW5zdGFuY2UsIG9uIEZvdW5kYXRpb24gTW9kZWwgdGhlIFJBTSBzdGFydHMgYXQgMkdC
LiBBcyB3ZSBkb24ndCBjb21wcmVzcyAKPiA+ID4gYW55IG9mIHRoZSBmaXJzdCAzMSBiaXRzLCB0
aGUgZnJhbWV0YWJsZSB3aWxsIG5vdyBiZSAyOE1CIGJpZ2dlciB0aGFuIHdlIAo+ID4gPiBjdXJy
ZW50bHkgaGF2ZSAoMTEyTUIgdXAgZnJvbSA4NE1CKS4KPiA+ID4gCj4gPiA+IFNvIEkgdGhpbmsg
d2hhdCB3ZSB3YW50IGlzOgo+ID4gPiAKPiA+ID4gbnJfcGR4cyA9IHBmbl90b19wZHgoZW5kIC0g
MSkgLSBwZm5fdG9fcGR4KHN0YXJ0KSArIDE7Cj4gPiA+IGZyYW1lX3RhYmxlX2Jhc2VfcGR4ID0g
cGZuX3RvX3BkeChzdGFydCk7Cj4gPiAKPiA+IFllcywgaWYgdGhlcmUncyBvbmx5IGEgc2luZ2xl
IG1lbW9yeSByYW5nZSBhdCAyR2IsIHRoZW4gc3VidHJhY3RpbmcKPiA+IHRoZSBiYXNlIGFkZHJl
c3Mgd2lsbCBvZiBjb3Vyc2UgeWllbGQgYmV0dGVyIHJlc3VsdHMuIEJ1dCBpZiB0aGVyZSBhcmUK
PiA+IG11bHRpcGxlIHJlZ2lvbnMsIHRoaW5ncyByZWFsbHkgZGVwZW5kIG9uIHRoZSBwbGFjZW1l
bnQgb2YgYWxsIG9mCj4gPiB0aGVtLgo+IAo+IElmIHdlIGRvIG5vdCBjb21wcmVzcyBhbnkgUkFN
IGFkZHJlc3NlcyBiZWxvdyA0RywgdGhlbiB3ZSBjYW5ub3QKPiBjb21wZW5zYXRlIGZvciBhbnkg
aG9sZXMgaW4gdGhhdCByYW5nZS4gSG93ZXZlciwgYXQgbGVhc3Qgd2UgY2FuIHNhZmVseQo+IHNr
aXAgdGhlIGZpcnN0IFswLXN0YXJ0XSBsaWtlIEp1bGllbiBzdWdnZXN0ZWQgaW4gdGhlIGNhbGN1
bGF0aW9uIG9mCj4gbnJfcGR4cy4KCgpIaSBKYW4sIEkgaGF2ZSBhIHF1ZXN0aW9uIG9uIHRoZSBQ
RFggY29kZS4KClRoZSBQRFggaW5pdGlhbGl6YXRpb24gaXMgYSBiaXQgZGlmZmVyZW50IGJldHdl
ZW4geDg2IGFuZCBBUk0sIGJ1dCBpdApmb2xsb3dzIHJvdWdobHkgdGhlIHNhbWUgcGF0dGVybiwg
bG9vayBhdAp4ZW4vYXJjaC94ODYvc3JhdC5jOnNyYXRfcGFyc2VfcmVnaW9ucyAoSSB0YWtlIHRo
YXQgaXMgd2hlcmUgdGhpbmdzCmhhcHBlbiBvbiB4ODYpIGFuZCB4ZW4vYXJjaC9hcm0vc2V0dXAu
Yzppbml0X3BkeC4KCk1hc2sgaXMgaW5pdGlhbGl6ZWQgY2FsbGluZyBwZHhfaW5pdF9tYXNrIG9u
IGEgc3RhcnQgYWRkcmVzcywgdGhlbiBhCmxvb3AgZmlsbHMgaW4gdGhlIHJlc3Qgb2YgdGhlIG1h
c2sgY2FsbGluZyBwZHhfcmVnaW9uX21hc2ssIGJhc2VkIG9uIHRoZQptZW1vcnkgcmVnaW9ucyBw
cmVzZW50LgoKSSB3cm90ZSBhIHNtYWxsIHVuaXQgdGVzdCBvZiB0aGUgQVJNIFBEWCBpbml0aWFs
aXphdGlvbiBhbmQgd2hpbGUgSSB3YXMKcGxheWluZyB3aXRoIGFkZHJlc3NlcyBhbmQgdmFsdWVz
IEkgbm90aWNlZCB0aGF0IGFjdHVhbGx5IGlmIEkgc2ltcGx5CnNraXAgcGR4X2luaXRfbWFzayBh
bmQganVzdCBpbml0aWFsaXplIHRoZSBtYXNrIHRvIDAgKG1hc2sgPSAwKSBpbgppbml0X3BkeCwg
dGhlIHJlc3Qgb2YgdGhlIGZ1bmN0aW9uIGFsd2F5cyBjYWxjdWxhdGVzIHRoZSByaWdodCBtYXNr
LgoKSW4gZmFjdCwgdGhlcmUgYXJlIGNhc2VzIHdoZXJlIGluaXRpYWxpemluZyB0aGUgbWFzayB0
byBhIHZhbHVlIGNhdXNlcwp0aGUgcmVzdCBvZiB0aGUgY29kZSB0byBtaXNzIHNvbWUgcG90ZW50
aWFsIGNvbXByZXNzaW9ucy4gV2hpbGUKaW5pdGlhbGl6aW5nIHRoZSBtYXNrIHRvIDAgbGVhZHMg
dG8gbW9yZSBvcHRpbWl6YXRpb25zLiBJIGNhbiBwcm92aWRlCnNwZWNpZmljIGV4YW1wbGVzIGlm
IHlvdSBhcmUgY3VyaW91cy4KCkJlZm9yZSBJIG1ha2UgYW55IGNoYW5nZXMgdG8gdGhhdCBjb2Rl
LCBJIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCBhIGJpdApiZXR0ZXIgd2h5IHRoaW5ncyBhcmUg
ZG9uZSB0aGF0IHdheSB0b2RheS4gRG8geW91IGtub3cgd2h5IHRoZSBtYXNrIGlzCmluaXRpYWxp
emVkIHRvIHBkeF9pbml0X21hc2soc3RhcnQtb2YtcmFtKT8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
