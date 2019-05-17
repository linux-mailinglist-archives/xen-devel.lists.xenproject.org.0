Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1241213FC
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 09:07:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRWup-0002uF-SM; Fri, 17 May 2019 07:04:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRWun-0002uA-Ja
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 07:04:25 +0000
X-Inumbo-ID: 0037e54c-7872-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0037e54c-7872-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 07:04:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 01:04:23 -0600
Message-Id: <5CDE5CF5020000780022FF28@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 01:04:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2D010020000780022CCCC@prv1-mh.provo.novell.com>
 <20190516135208.h4njprgd477gfww2@Air-de-Roger>
In-Reply-To: <20190516135208.h4njprgd477gfww2@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/4] x86/IRQ: ACKTYPE_NONE cannot make it
 into irq_guest_eoi_timer_fn()
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

Pj4+IE9uIDE2LjA1LjE5IGF0IDE1OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0IDA2OjQ4OjE2QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBAQCAtMTExNCwxOSArMTExNCwxOCBAQCBzdGF0aWMgdm9pZCBpcnFfZ3Vlc3RfZW9p
X3RpbWVyX2ZuKHZvaWQKPj4gIAo+PiAgICAgIGFjdGlvbiA9IChpcnFfZ3Vlc3RfYWN0aW9uX3Qg
KilkZXNjLT5hY3Rpb247Cj4+ICAKPj4gKyAgICBBU1NFUlQoYWN0aW9uLT5hY2tfdHlwZSAhPSBB
Q0tUWVBFX05PTkUpOwo+PiArCj4+ICAgICAgaWYgKCAhYWN0aW9uLT5pbl9mbGlnaHQgfHwgdGlt
ZXJfaXNfYWN0aXZlKCZhY3Rpb24tPmVvaV90aW1lcikgKQo+PiAgICAgICAgICBnb3RvIG91dDsK
Pj4gIAo+PiAtICAgIGlmICggYWN0aW9uLT5hY2tfdHlwZSAhPSBBQ0tUWVBFX05PTkUgKQo+PiAr
ICAgIGZvciAoIGkgPSAwOyBpIDwgYWN0aW9uLT5ucl9ndWVzdHM7IGkrKyApCj4+ICAgICAgewo+
PiAtICAgICAgICB1bnNpZ25lZCBpbnQgaTsKPj4gLSAgICAgICAgZm9yICggaSA9IDA7IGkgPCBh
Y3Rpb24tPm5yX2d1ZXN0czsgaSsrICkKPj4gLSAgICAgICAgewo+PiAtICAgICAgICAgICAgc3Ry
dWN0IGRvbWFpbiAqZCA9IGFjdGlvbi0+Z3Vlc3RbaV07Cj4gCj4gSSB0aGluayB5b3UgY291bGQg
Y29uc3RpZnkgZCBoZXJlLgoKTm93IHRoYXQgSSd2ZSB0cmllZCBJIHJlY2FsbCB0aGF0IEkgZGlk
IHNvIGFscmVhZHkgd2hlbiBvcmlnaW5hbGx5CnB1dHRpbmcgdG9nZXRoZXIgdGhlIHBhdGNoLiBJ
dCBkb2Vzbid0IHdvcmssIGJlY2F1c2UKcmFkaXhfdHJlZV9sb29rdXAoKSByZXF1aXJlcyBhIG5v
bi1jb25zdCBwb2ludGVyLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
