Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E809EFA87
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 15:35:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLSt2-0002U6-NB; Tue, 30 Apr 2019 13:33:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLSt1-0002Ty-0E
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 13:33:31 +0000
X-Inumbo-ID: 8a116210-6b4c-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a116210-6b4c-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 13:33:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 07:33:28 -0600
Message-Id: <5CC84EA5020000780022A7C0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 07:33:25 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <3ce4998b*a8a8*37bd*bb26*9550571709b6@suse.com>
 <5CC82306020000780022A4E3@prv1*mh.provo.novell.com>
 <ae94fdca-bd2a-2086-450e-c485ca4e59f0@arm.com>
 <5CC82593020000780022A50D@suse.com>
 <dd2eb4c4-4144-17ae-f7a6-a4287aeac461@suse.com>
 <5CC8360E020000780022A70A@prv1-mh.provo.novell.com>
 <c82f388c-49f3-d40d-7e68-bb913cc40d06@arm.com>
In-Reply-To: <c82f388c-49f3-d40d-7e68-bb913cc40d06@arm.com>
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

Pj4+IE9uIDMwLjA0LjE5IGF0IDE1OjE2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDMwLzA0LzIwMTkgMTI6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAzMC4wNC4x
OSBhdCAxMjo0NCwgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+PiBBbiBhbHRlcm5hdGl2ZSB3
b3VsZCBiZSBtZW1vcnkgYmFycmllcnMgYmV0d2VlbiB0aGUgd3JpdGVzIG9uIEFSTSwKPj4+IHJp
Z2h0PyBPciBhIHN0cm9uZyBvcmRlcmVkIHNldF9iaXQoKSB2YXJpYW50ICh3ZSBoYWQgdGhhdCBk
aXNjdXNzaW9uCj4+PiByZWNlbnRseSByZWxhdGVkIHRvIGEgYmFycmllciBpbiBBUk0tc3BlY2lm
aWMgX19jcHVfZGlzYWJsZSgpKS4KPiAKPiBJIGFtIG5vdCBlbnRpcmVseSBhIGJpZyBmYW4gb2Yg
YSBzdHJvbmctb3JkZXIgdmFyaWFudC4gSXQgd2lsbCBwb3RlbnRpYWxseSBhZGQgCj4gbW9yZSBt
ZW1vcnkgYmFycmllcnMgdGhhbiBuZWNlc3NhcnkgaW4gdGhpcyBjb250ZXh0Lgo+IAo+PiAKPj4g
WWVzLgo+IAo+IFdoYXQgd291bGQgYmUgdGhlIGFkdmFudGFnZSBvZiAyLTMgbWVtb3J5IGJhcnJp
ZXJzIG92ZXIgYSBtZW1vcnkgYmFycmllciArIAo+IGNoZWNrPwoKRHVubm8gLSBJJ3ZlIG1lcmVs
eSBjb25maXJtZWQgdGhhdCB0aGlzIGxvb2tzIHRvIGJlIGFuIGFsdGVybmF0aXZlCmNvcnJlY3Qg
c29sdXRpb24uCgo+Pj4gVGhlbiB3ZSBjb3VsZCBkcm9wIHRoaXMgI2lmbmRlZiBzZWN0aW9uLgo+
PiAKPj4gTm90IHN1cmUgYWJvdXQgdGhpcyAtIEknbSBhY3R1YWxseSB1bmNvbnZpbmNlZCB0aGUg
bGF0dGVyIHBhcnQgb2YKPj4gd2hhdCdzIGluc2lkZSB0aGUgI2lmZGVmIGlzbid0IGFjdHVhbGx5
IG5lZWRlZCBvbiB4ODYgYXMgd2VsbC4gSnVzdAo+PiBjb25zaWRlciB0aGUgY2FzZSBvZiB2Y3B1
X3VuYmxvY2soKSBtYWtpbmcgaXQgdG8gdGhlIHZjcHVfd2FrZSgpCj4+IGludm9jYXRpb24gb24g
YW5vdGhlciBDUFUgd2hpbGUgd2UncmUgYmV0d2VlbiBhbnkgdHdvIG9mIHRoZQo+PiB0aHJlZSB3
cml0ZXMgaGVyZS4gKEkga25vdyBJJ3ZlIGJlZW4gZmVlbGluZyB1bmVhc3kgYWJvdXQgdGhpcwo+
PiBiZWZvcmUsIGJ1dCBJIGd1ZXNzIEkgbXVzdCBoYXZlIGNvbWUgdG8gdGhlIGNvbmNsdXNpb24g
dGhhdCBpdCdzCj4+IF9wcm9iYWJseV8gb2theS4pCj4gVGhhdCdzIG5vdCBnb2luZyB0byBiZSBj
b3ZlcmVkIGJ5IHRoZSBjaGVjayBvbiBub24teDg2IHBsYXRmb3JtLiBJbmRlZWQsIAo+IHZjcHVf
d2FrZSgpIGlzIG5vdCB1cGRhdGluZyBhbnkgb2YgdGhlIGZpZWxkcy4gU28sIGZyb20gbXkgdW5k
ZXJzdGFuZGluZywgdGhlIAo+IHdha2UtdXAgcmVxdWVzdCB3aWxsIGp1c3QgYmUgaWdub3JlZC4K
ClBlcmhhcHMgYSBtaXN1bmRlcnN0YW5kaW5nIChvciBJJ20gY29uZnVzZWQgbm93KTogSSBtZW50
aW9uZWQKdmNwdV93YWtlKCkgb25seSB0byBkZWxpbWl0IGhvdyBtdWNoIG9mIHZjcHVfdW5ibG9j
aygpIG5lZWRzCmNvbXBsZXRpbmcgZm9yIHRoZSBwb3NzaWJsZSBwcm9ibGVtIHRvIHN1cmZhY2Ug
dGhhdCBJJ20gc3VzcGVjdGluZy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
