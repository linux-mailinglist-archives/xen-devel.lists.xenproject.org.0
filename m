Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8431B583
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 14:07:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ9hl-0004OX-Ag; Mon, 13 May 2019 12:05:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQ9hj-0004OR-HH
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 12:05:15 +0000
X-Inumbo-ID: 5d2a84eb-7577-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5d2a84eb-7577-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 12:05:13 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 06:05:13 -0600
Message-Id: <5CD95D74020000780022E14B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 06:05:08 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D489020000780022CD34@prv1-mh.provo.novell.com>
 <765d6542-734a-5255-73a4-74ccce7f4ee8@citrix.com>
In-Reply-To: <765d6542-734a-5255-73a4-74ccce7f4ee8@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 03/12] x86/IRQ: avoid UB (or worse) in
 trace_irq_mask()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA1LjE5IGF0IDEyOjQyLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA1LzgvMTkgMjowNyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRCRDogSSB3b25k
ZXIgd2hldGhlciB0aGUgZnVuY3Rpb24gc2hvdWxkbid0IGdhaW4gYW4gZWFybHkgdGJfaW5pdF9k
b25lCj4+ICAgICAgY2hlY2ssIGxpa2UgbWFueSBvdGhlciB0cmFjZV8qKCkgaGF2ZS4KPiAKPiBZ
ZWFoLCBhdm9pZGluZyB0aGVzZSBtZW1jb3BpZXMgd2hlbiB0cmFjaW5nIGlzIG5vdCBlbmFibGVk
IHNlZW1zIGxpa2UgYQo+IGdvb2QgdGhpbmcuCgpJJ3ZlIHRha2VuIG5vdGUgdG8gc3VibWl0IGEg
cmVzcGVjdGl2ZSBmb2xsb3ctb24gcGF0Y2guCgo+IEVpdGhlciB3YXk6Cj4gCj4gQWNrZWQtYnk6
IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KClRoYW5rcywgSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
