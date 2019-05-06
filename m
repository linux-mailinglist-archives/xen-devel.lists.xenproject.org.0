Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C614581
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 09:46:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNYIf-0003bB-72; Mon, 06 May 2019 07:44:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNYIe-0003b6-37
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 07:44:36 +0000
X-Inumbo-ID: ca7ba55c-6fd2-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ca7ba55c-6fd2-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 07:44:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 01:44:33 -0600
Message-Id: <5CCFE5DC020000780022C0A2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 01:44:28 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DEA80200007800229E9D@prv1-mh.provo.novell.com>
 <20190503152142.icdzlax4arik3beg@Air-de-Roger>
In-Reply-To: <20190503152142.icdzlax4arik3beg@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/9] x86/IRQ: deal with move cleanup count
 state in fixup_irqs()
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

Pj4+IE9uIDAzLjA1LjE5IGF0IDE3OjIxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgQXByIDI5LCAyMDE5IGF0IDA1OjIzOjIwQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBUaGUgY2xlYW51cCBJUEkgbWF5IGdldCBzZW50IGltbWVkaWF0ZWx5IGJlZm9yZSBh
IENQVSBnZXRzIHJlbW92ZWQgZnJvbQo+PiB0aGUgb25saW5lIG1hcC4gSW4gc3VjaCBhIGNhc2Ug
dGhlIElQSSB3b3VsZCBnZXQgaGFuZGxlZCBvbiB0aGUgQ1BVCj4+IGJlaW5nIG9mZmxpbmVkIG5v
IGVhcmxpZXIgdGhhbiBpbiB0aGUgaW50ZXJydXB0cyBkaXNhYmxlZCB3aW5kb3cgYWZ0ZXIKPj4g
Zml4dXBfaXJxcygpJyBtYWluIGxvb3AuIFRoaXMgaXMgdG9vIGxhdGUsIGhvd2V2ZXIsIGJlY2F1
c2UgYSBwb3NzaWJsZQo+PiBhZmZpbml0eSBjaGFuZ2UgbWF5IGluY3VyIHRoZSBuZWVkIGZvciB2
ZWN0b3IgYXNzaWdubWVudCwgd2hpY2ggd2lsbAo+PiBmYWlsIHdoZW4gdGhlIElSUSdzIG1vdmUg
Y2xlYW51cCBjb3VudCBpcyBzdGlsbCBub24temVyby4KPj4gCj4+IFRvIGZpeCB0aGlzCj4+IC0g
cmVjb3JkIHRoZSBzZXQgb2YgQ1BVcyB0aGUgY2xlYW51cCBJUElzIGdldHMgYWN0dWFsbHkgc2Vu
dCB0byBhbG9uZ3NpZGUKPj4gICBzZXR0aW5nIHRoZWlyIGNvdW50LAo+PiAtIGFkanVzdCB0aGUg
Y291bnQgaW4gZml4dXBfaXJxcygpLCBhY2NvdW50aW5nIGZvciBhbGwgQ1BVcyB0aGF0IHRoZQo+
PiAgIGNsZWFudXAgSVBJIHdhcyBzZW50IHRvLCBidXQgdGhhdCBhcmUgbm8gbG9uZ2VyIG9ubGlu
ZSwKPj4gLSBiYWlsIGVhcmx5IGZyb20gdGhlIGNsZWFudXAgSVBJIGhhbmRsZXIgd2hlbiB0aGUg
Q1BVIGlzIG5vIGxvbmdlcgo+PiAgIG9ubGluZSwgdG8gcHJldmVudCBkb3VibGUgYWNjb3VudGlu
Zy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
PiAKPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
CgpUaGFua3MuCgo+IEp1c3QgYXMgYSBub3RlLCB0aGlzIHdob2xlIGludGVycnVwdCBtaWdyYXRp
b24gYnVzaW5lc3Mgc2VlbXMKPiBleHRyZW1lbHkgY29tcGxleCwgYW5kIEkgd29uZGVyIGlmIFhl
biBkb2VzIHJlYWxseSBuZWVkIGl0LCBvciB3aGF0J3MKPiBleGFjdGx5IGl0J3MgcGVyZm9ybWFu
Y2UgZ2FpbiBjb21wYXJlZCB0byBtb3JlIHNpbXBsZSBzb2x1dGlvbnMuCgpXaGF0IG1vcmUgc2lt
cGxlIHNvbHV0aW9ucyB3b3VsZCB5b3UgdGhpbmsgYWJvdXQ/IElSUSBhZmZpbml0aWVzCnRyYWNr
aW5nIHRoZWlyIGFzc2lnbmVkLXZDUFUgb25lcyB3YXMgYWRkZWQgbGFyZ2VseSB0byBhdm9pZApo
aWdoIHJhdGUgaW50ZXJydXB0cyBhbHdheXMgYXJyaXZpbmcgb24gYSBDUFUgb3RoZXIgdGhhbiB0
aGUgb25lCndoZXJlIHRoZSBhY3R1YWwgaGFuZGxpbmcgd2lsbCB0YWtlIHBsYWNlLiBBcmd1YWJs
eSB0aGlzIG1heSBnbwp0b28gZmFyIGZvciBsb3cgcmF0ZSBpbnRlcnJ1cHRzLCBidXQgYWRkaW5n
IGEgcmVzcGVjdGl2ZSBoZXVyaXN0aWMKd291bGQgcmF0aGVyIGZ1cnRoZXIgY29tcGxpY2F0ZSBo
YW5kbGluZy4KCj4gSSB1bmRlcnN0YW5kIHRoaXMgaXMganVzdCBmaXhlcywgYnV0IElNTyBpdCdz
IG1ha2luZyB0aGUgbG9naWMgZXZlbiBtb3JlCj4gY29tcGxleC4KPiAKPiBNYXliZSBpdCB3b3Vs
ZCBiZSBzaW1wbGVyIHRvIGhhdmUgdGhlIGludGVycnVwdHMgaGFyZC1ib3VuZCB0byBwQ1BVcwo+
IGFuZCBpbnN0ZWFkIGhhdmUgYSBzb2Z0LWFmZmluaXR5IG9uIHRoZSBndWVzdCB2Q1BVcyB0aGF0
IGFyZSBhc3NpZ25lZAo+IGFzIHRoZSBkZXN0aW5hdGlvbj8KCkhvdyB3b3VsZCB0aGUgc29mdCBh
ZmZpbml0eSBvZiBhIHZDUFUgYmUgY2FsY3VsYXRlZCB0aGF0IGhhcwptdWx0aXBsZSBJUlFzICh3
aXRoIGF0IG1vc3QgcGFydGlhbGx5IG92ZXJsYXBwaW5nIGFmZmluaXRpZXMpIHRvIGJlCnNlcnZp
Y2VkIGJ5IGl0PwoKPj4gLS0tCj4+IFRCRDogVGhlIHByb3BlciByZWNvcmRpbmcgb2YgdGhlIElQ
SSBkZXN0aW5hdGlvbnMgYWN0dWFsbHkgbWFrZXMgdGhlCj4+ICAgICAgbW92ZV9jbGVhbnVwX2Nv
dW50IGZpZWxkIHJlZHVuZGFudC4gRG8gd2Ugd2FudCB0byBkcm9wIGl0LCBhdCB0aGUKPj4gICAg
ICBwcmljZSBvZiBhIGZldyBtb3JlIENQVS1tYXNrIG9wZXJhdGlvbnM/Cj4gCj4gQUZBSUNUIHRo
aXMgaXMgbm90IGEgaG90IHBhdGgsIHNvIEkgd291bGQgcmVtb3ZlIHRoZQo+IG1vdmVfY2xlYW51
cF9jb3VudCBmaWVsZCBhbmQganVzdCB3ZWlnaHQgdGhlIGNwdSBiaXRtYXAgd2hlbiBuZWVkZWQu
CgpBZGRlZCBmb3IgdjIgKHBlbmRpbmcgc3VjY2Vzc2Z1bCB0ZXN0aW5nKS4KCkphbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
