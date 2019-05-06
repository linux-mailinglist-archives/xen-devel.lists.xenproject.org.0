Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E969514BCC
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 16:29:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNeZJ-0000ch-1U; Mon, 06 May 2019 14:26:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNeZH-0000cZ-1A
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 14:26:11 +0000
X-Inumbo-ID: dd7f2da6-700a-11e9-b6e3-7fb7b1abad4f
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd7f2da6-700a-11e9-b6e3-7fb7b1abad4f;
 Mon, 06 May 2019 14:25:59 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 08:25:57 -0600
Message-Id: <5CD043EF020000780022C382@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 08:25:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DF710200007800229EC5@prv1-mh.provo.novell.com>
 <20190506135203.by4dre24krtuy3up@Air-de-Roger>
In-Reply-To: <20190506135203.by4dre24krtuy3up@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 8/9] x86/IRQ: make fixup_irqs() skip
 unconnected internally used interrupts
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDE1OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgQXByIDI5LCAyMDE5IGF0IDA1OjI2OjQxQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2ly
cS5jCj4+IEBAIC0yNDEyLDggKzI0MTIsMjAgQEAgdm9pZCBmaXh1cF9pcnFzKGNvbnN0IGNwdW1h
c2tfdCAqbWFzaywgYgo+PiAgICAgICAgICB2ZWN0b3IgPSBpcnFfdG9fdmVjdG9yKGlycSk7Cj4+
ICAgICAgICAgIGlmICggdmVjdG9yID49IEZJUlNUX0hJUFJJT1JJVFlfVkVDVE9SICYmCj4+ICAg
ICAgICAgICAgICAgdmVjdG9yIDw9IExBU1RfSElQUklPUklUWV9WRUNUT1IgKQo+PiArICAgICAg
ICB7Cj4+ICAgICAgICAgICAgICBjcHVtYXNrX2FuZChkZXNjLT5hcmNoLmNwdV9tYXNrLCBkZXNj
LT5hcmNoLmNwdV9tYXNrLCBtYXNrKTsKPj4gIAo+PiArICAgICAgICAgICAgLyoKPj4gKyAgICAg
ICAgICAgICAqIFRoaXMgY2FuIGluIHBhcnRpY3VsYXIgaGFwcGVuIHdoZW4gcGFya2luZyBzZWNv
bmRhcnkgdGhyZWFkcwo+PiArICAgICAgICAgICAgICogZHVyaW5nIGJvb3QgYW5kIHdoZW4gdGhl
IHNlcmlhbCBjb25zb2xlIHdhbnRzIHRvIHVzZSBhIFBDSSBJUlEuCj4+ICsgICAgICAgICAgICAg
Ki8KPj4gKyAgICAgICAgICAgIGlmICggZGVzYy0+aGFuZGxlciA9PSAmbm9faXJxX3R5cGUgKQo+
IAo+IEkgZm91bmQgaXQgd2VpcmQgdGhhdCBhIGlycSBoYXMgYSB2ZWN0b3IgYXNzaWduZWQgKGlu
IHRoaXMgY2FzZSBhCj4gaGlnaC1wcmlvcml0eSB2ZWN0b3IpIGJ1dCBubyBpcnEgdHlwZSBzZXQu
Cj4gCj4gU2hvdWxkbid0IHRoZSB2ZWN0b3IgYmUgYXNzaWduZWQgd2hlbiB0aGUgdHlwZSBpcyBz
ZXQ/CgpJbiBnZW5lcmFsIEkgd291bGQgYWdyZWUsIGJ1dCB0aGUgd2F5IHRoZSBzZXJpYWwgY29u
c29sZSBJUlEKZ2V0cyBzZXQgdXAgaXMgZGlmZmVyZW50IC0gc2VlIHNtcF9pbnRyX2luaXQoKS4g
V2hlbiBpdCdzIGEgUENJCklSUSAoSU8tQVBJQyBwaW4gMTYgb3IgYWJvdmUpLCB3ZSdsbCBrbm93
IGhvdyB0byBwcm9ncmFtCnRoZSBJTy1BUElDIFJURSAoZWRnZS9sZXZlbCwgYWN0aXZpdHkgaGln
aC9sb3cpIG9ubHkgd2hlbgpEb20wIGJvb3RzLCBhbmQgaGVuY2Ugd2UgZG9uJ3Qgc2V0IC0+aGFu
ZGxlciBlYXJseS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
