Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA6A1B83F
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:23:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBnL-00007d-Od; Mon, 13 May 2019 14:19:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQBnK-00007Y-Sb
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:19:10 +0000
X-Inumbo-ID: 12ef7228-758a-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 12ef7228-758a-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 14:19:09 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 08:19:09 -0600
Message-Id: <5CD97CD8020000780022E2AA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 08:19:04 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D563020000780022CD40@prv1-mh.provo.novell.com>
 <20190513134821.pomwew6vmtibxvem@Air-de-Roger>
In-Reply-To: <20190513134821.pomwew6vmtibxvem@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 07/12] x86/IRQ: fix locking around vector
 management
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

Pj4+IE9uIDEzLjA1LjE5IGF0IDE1OjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0IDA3OjEwOjU5QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+PiArKysg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+PiBAQCAtMjEzNCwxMSArMjEz
NCwxNiBAQCBzdGF0aWMgdm9pZCBhZGp1c3RfaXJxX2FmZmluaXR5KHN0cnVjdCBhCj4+ICAgICAg
dW5zaWduZWQgaW50IG5vZGUgPSByaHNhID8gcHhtX3RvX25vZGUocmhzYS0+cHJveGltaXR5X2Rv
bWFpbikKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBOVU1BX05PX05PREU7Cj4+
ICAgICAgY29uc3QgY3B1bWFza190ICpjcHVtYXNrID0gJmNwdV9vbmxpbmVfbWFwOwo+PiArICAg
IHN0cnVjdCBpcnFfZGVzYyAqZGVzYzsKPj4gIAo+PiAgICAgIGlmICggbm9kZSA8IE1BWF9OVU1O
T0RFUyAmJiBub2RlX29ubGluZShub2RlKSAmJgo+PiAgICAgICAgICAgY3B1bWFza19pbnRlcnNl
Y3RzKCZub2RlX3RvX2NwdW1hc2sobm9kZSksIGNwdW1hc2spICkKPj4gICAgICAgICAgY3B1bWFz
ayA9ICZub2RlX3RvX2NwdW1hc2sobm9kZSk7Cj4+IC0gICAgZG1hX21zaV9zZXRfYWZmaW5pdHko
aXJxX3RvX2Rlc2MoZHJoZC0+aW9tbXUtPm1zaS5pcnEpLCBjcHVtYXNrKTsKPj4gKwo+PiArICAg
IGRlc2MgPSBpcnFfdG9fZGVzYyhkcmhkLT5pb21tdS0+bXNpLmlycSk7Cj4+ICsgICAgc3Bpbl9s
b2NrX2lycSgmZGVzYy0+bG9jayk7Cj4gCj4gSSB3b3VsZCB1c2UgdGhlIGlycXNhdmUvaXJxcmVz
dG9yZSB2YXJpYW50cyBoZXJlIGZvciBleHRyYSBzYWZldHkuCgpIbW0sIG1heWJlLiBCdXQgSSB0
aGluayB3ZSdyZSBpbiBiaWdnZXIgdHJvdWJsZSBpZiBJUlFzIGluZGVlZAplbmRlZCB1cCBlbmFi
bGVkIGF0IGFueSBvZiB0aGUgdHdvIHBvaW50cyB3aGVyZSB0aGlzIGZ1bmN0aW9uCmdldHMgY2Fs
bGVkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
