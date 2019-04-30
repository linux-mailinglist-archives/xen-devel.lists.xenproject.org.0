Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C35CFAC3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 15:47:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLT3m-0003UU-83; Tue, 30 Apr 2019 13:44:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLT3k-0003UP-OY
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 13:44:36 +0000
X-Inumbo-ID: 1726f120-6b4e-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1726f120-6b4e-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 13:44:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 07:44:34 -0600
Message-Id: <5CC8513F020000780022A7DB@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 07:44:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <3ce4998b*a8a8*37bd*bb26*9550571709b6@suse.com>
 <5CC82306020000780022A4E3@prv1*mh.provo.novell.com>
 <ae94fdca-bd2a-2086-450e-c485ca4e59f0@arm.com>
 <5CC82593020000780022A50D@suse.com>
 <dd2eb4c4-4144-17ae-f7a6-a4287aeac461@suse.com>
 <5CC8360E020000780022A70A@prv1-mh.provo.novell.com>
 <c82f388c-49f3-d40d-7e68-bb913cc40d06@arm.com>
 <5CC84EA5020000780022A7C0@prv1-mh.provo.novell.com>
 <0d999744-93b6-aee6-ff04-785dddcadbee@arm.com>
In-Reply-To: <0d999744-93b6-aee6-ff04-785dddcadbee@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] vcpu_block() and do_poll() question
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
 xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMwLjA0LjE5IGF0IDE1OjM1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDMwLzA0LzIwMTkgMTQ6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAzMC4wNC4x
OSBhdCAxNToxNiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDMwLzA0LzIw
MTkgMTI6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDMwLjA0LjE5IGF0IDEyOjQ0
LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4gVGhlbiB3ZSBjb3VsZCBkcm9wIHRoaXMg
I2lmbmRlZiBzZWN0aW9uLgo+Pj4+Cj4+Pj4gTm90IHN1cmUgYWJvdXQgdGhpcyAtIEknbSBhY3R1
YWxseSB1bmNvbnZpbmNlZCB0aGUgbGF0dGVyIHBhcnQgb2YKPj4+PiB3aGF0J3MgaW5zaWRlIHRo
ZSAjaWZkZWYgaXNuJ3QgYWN0dWFsbHkgbmVlZGVkIG9uIHg4NiBhcyB3ZWxsLiBKdXN0Cj4+Pj4g
Y29uc2lkZXIgdGhlIGNhc2Ugb2YgdmNwdV91bmJsb2NrKCkgbWFraW5nIGl0IHRvIHRoZSB2Y3B1
X3dha2UoKQo+Pj4+IGludm9jYXRpb24gb24gYW5vdGhlciBDUFUgd2hpbGUgd2UncmUgYmV0d2Vl
biBhbnkgdHdvIG9mIHRoZQo+Pj4+IHRocmVlIHdyaXRlcyBoZXJlLiAoSSBrbm93IEkndmUgYmVl
biBmZWVsaW5nIHVuZWFzeSBhYm91dCB0aGlzCj4+Pj4gYmVmb3JlLCBidXQgSSBndWVzcyBJIG11
c3QgaGF2ZSBjb21lIHRvIHRoZSBjb25jbHVzaW9uIHRoYXQgaXQncwo+Pj4+IF9wcm9iYWJseV8g
b2theS4pCj4+PiBUaGF0J3Mgbm90IGdvaW5nIHRvIGJlIGNvdmVyZWQgYnkgdGhlIGNoZWNrIG9u
IG5vbi14ODYgcGxhdGZvcm0uIEluZGVlZCwKPj4+IHZjcHVfd2FrZSgpIGlzIG5vdCB1cGRhdGlu
ZyBhbnkgb2YgdGhlIGZpZWxkcy4gU28sIGZyb20gbXkgdW5kZXJzdGFuZGluZywgdGhlCj4+PiB3
YWtlLXVwIHJlcXVlc3Qgd2lsbCBqdXN0IGJlIGlnbm9yZWQuCj4+IAo+PiBQZXJoYXBzIGEgbWlz
dW5kZXJzdGFuZGluZyAob3IgSSdtIGNvbmZ1c2VkIG5vdyk6IEkgbWVudGlvbmVkCj4+IHZjcHVf
d2FrZSgpIG9ubHkgdG8gZGVsaW1pdCBob3cgbXVjaCBvZiB2Y3B1X3VuYmxvY2soKSBuZWVkcwo+
PiBjb21wbGV0aW5nIGZvciB0aGUgcG9zc2libGUgcHJvYmxlbSB0byBzdXJmYWNlIHRoYXQgSSdt
IHN1c3BlY3RpbmcuCj4gCj4gSSBhbSBub3Qgc3VyZSB3aGF0IHByb2JsZW0geW91IHJlZmVyLiBJ
cyBpdCB0aGUgd2FrZS11cCByZXF1ZXN0IHdpbGwgZ2V0IAo+IGlnbm9yZWQ/CgpJJ3ZlIG5vdCBu
b3RpY2VkIGFueSByaXNrIG9mIGFuIGlnbm9yZWQgd2FrZXVwIHNvIGZhci4gV2hhdCBJIGRpZApu
b3RpY2UgaXMgdGhhdCBpZiB0aGUgaW5pdGlhbCBwYXJ0IG9mIHZjcHVfdW5ibG9jaygpIHJ1bnMg
YmV0d2VlbiBhbnkKdHdvIG9mIHRoZSB0aHJlZSBzdG9yZXMgaW4gZG9fcG9sbCgpLCBpbmNvbnNp
c3RlbnQgc3RhdGUgbWF5IHJlc3VsdDoKV2UgbWF5IGVuZCB1cCB3aXRoIFZQRl9ibG9ja2VkIGNs
ZWFyIGJ1dCAtPnBvbGxfZXZ0Y2huIHNldCB0byAtMQphbmQvb3IgdGhlIHJlc3BlY3RpdmUgcG9s
bF9tYXNrIGJpdCBzZXQuIEkndmUgbm90IGRvbmUgYW55IGFuYWx5c2lzCnRvIGRlY2lkZSB3aGV0
aGVyIHN1Y2ggaW5jb25zaXN0ZW50IHN0YXRlIGNvdWxkIGxlYWQgdG8gYWN0dWFsIGlzc3Vlcy4K
CldpdGggdGhlIChjdXJyZW50bHkgQXJtLW9ubHkpIGV4dHJhIGlmKCkgbm90aGluZyBsaWtlIHRo
aXMgY2FuIHJlc3VsdAp1cG9uIGNvbXBsZXRpb24gb2YgZG9fcG9sbCgpLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
