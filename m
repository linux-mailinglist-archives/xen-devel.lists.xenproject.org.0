Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472B827B18
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 12:53:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTlI7-0006Tl-Bq; Thu, 23 May 2019 10:49:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTlI5-0006Tg-RV
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 10:49:41 +0000
X-Inumbo-ID: 76ebe154-7d48-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 76ebe154-7d48-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 10:49:40 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 04:49:38 -0600
Message-Id: <5CE67AC10200007800231A70@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 04:49:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558606816-17842-1-git-send-email-andrew.cooper3@citrix.com>
 <1558606816-17842-2-git-send-email-andrew.cooper3@citrix.com>
 <20190523102331.GC2373@zion.uk.xensource.com>
In-Reply-To: <20190523102331.GC2373@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/2] x86: init_hypercall_page() cleanup
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIzLjA1LjE5IGF0IDEyOjIzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTE6MjA6MTVBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4gVGhlIHZhcmlvdXMgcGllY2VzIG9mIHRoZSBoeXBlcmNhbGwgcGFnZSBpbmZyYXN0
cnVjdHVyZSBoYXZlIGdyb3duCj4+IG9yZ2FuaWNhbGx5IG92ZXIgdGltZSBhbmQgZW5kZWQgdXAg
aW4gYSBiaXQgb2YgYSBtZXNzLgo+PiAKPj4gICogUmVuYW1lIGFsbCBmdW5jdGlvbnMgdG8gYmUg
b2YgdGhlIGZvcm0gKl9pbml0X2h5cGVyY2FsbF9wYWdlKCkuICBUaGlzCj4+ICAgIG1ha2VzIHRo
ZW0gc29tZXdoYXQgc2hvcnRlciwgYW5kIG1lYW5zIHRoZXkgY2FuIGFjdHVhbGx5IGJlIGdyZXBw
ZWQKPj4gICAgZm9yIGluIG9uZSBnby4KPj4gICogTW92ZSBpbml0X2h5cGVyY2FsbF9wYWdlKCkg
dG8gZG9tYWluLmMuICBUaGUgNjQtYml0IHRyYXBzLmMgaXNuJ3QgYQo+PiAgICB0ZXJyaWJseSBh
cHByb3ByaWF0ZSBwbGFjZSBmb3IgaXQgdG8gbGl2ZS4KPj4gICogRHJvcCBhbiBvYnNvbGV0ZSBj
b21tZW50IGZyb20gaHZtX2luaXRfaHlwZXJjYWxsX3BhZ2UoKSBhbmQgZHJvcCB0aGUKPj4gICAg
ZG9tYWluIHBhcmFtZXRlciBmcm9tIGh2bV9mdW5jcy5pbml0X2h5cGVyY2FsbF9wYWdlKCkgYXMg
aXQgaXNuJ3QKPj4gICAgbmVjZXNzYXJ5Lgo+PiAgKiBSZWFycmFuZ2UgdGhlIGxvZ2ljIGluIHRo
ZSBlYWNoIGZ1bmN0aW9uIHRvIGF2b2lkIG5lZWRpbmcgZXh0cmEgbG9jYWwKPj4gICAgdmFyaWFi
bGVzLCBhbmQgdG8gd3JpdGUgdGhlIHBhZ2UgaW4gb25lIHNpbmdsZSBwYXNzLgo+PiAKPj4gTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
