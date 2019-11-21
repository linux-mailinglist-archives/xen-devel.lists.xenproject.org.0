Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCD1105190
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 12:42:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXko6-0002Cf-I0; Thu, 21 Nov 2019 11:39:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bc0+=ZN=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iXko5-0002CY-70
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 11:39:29 +0000
X-Inumbo-ID: 925c63f8-0c53-11ea-a32d-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 925c63f8-0c53-11ea-a32d-12813bfff9fa;
 Thu, 21 Nov 2019 11:39:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 03:39:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="209875685"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga003.jf.intel.com with ESMTP; 21 Nov 2019 03:39:23 -0800
Date: Thu, 21 Nov 2019 19:43:24 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191121114322.GA2673@gao-cwp>
References: <1574291155-26032-1-git-send-email-chao.gao@intel.com>
 <0b848790-fcdd-1267-b621-62be6098369d@xen.org>
 <7d15f8ad-27ba-52a2-7006-d94874a2f5ba@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d15f8ad-27ba-52a2-7006-d94874a2f5ba@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v1 1/2] x86/cpu: maintain a parked CPU bitmap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTE6MDI6MTBBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAyMS4xMS4yMDE5IDEwOjQ3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDIwLzEx
LzIwMTkgMjM6MDUsIENoYW8gR2FvIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3NtcGJv
b3QuYwo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3NtcGJvb3QuYwo+Pj4gQEAgLTM5LDYgKzM5LDcg
QEAKPj4+ICAgY3B1bWFza190IGNwdV9vbmxpbmVfbWFwOwo+Pj4gICBjcHVtYXNrX3QgY3B1X3By
ZXNlbnRfbWFwOwo+Pj4gICBjcHVtYXNrX3QgY3B1X3Bvc3NpYmxlX21hcDsKPj4+ICtjcHVtYXNr
X3Zhcl90IGNwdV9wYXJrZWRfbWFwOwo+PiAKPj4gWW91IGRlZmluZSBjcHVfcGFya2VkX21hcCBi
dXQgQUZBSUsgaXQgd2lsbCBuZXZlciBnZXQgYWxsb2NhdGVkLiBUaGUgCj4+IHJpc2sgaGVyZSBp
cyBhbnkgYWNjZXNzIHRvIHRoYXQgdmFyaWFibGUgd2lsbCByZXN1bHQgdG8gYSBmYXVsdC4KPj4g
Cj4+IExvb2tpbmcgYXQgdGhlIGNoYW5nZXMgYmVsb3csIGl0IGxvb2tzIGxpa2UgYWNjZXNzIGlu
IGNvbW1vbiBjb2RlIHdpbGwgCj4+IGJlIHByb3RlY3RlZCBieSBwYXJrX29mZmxpbmVfY3B1cy4g
VGhpcyBpcyBhbHdheXMgZmFsc2Ugb24gQXJtLCBzbyB0aGUgCj4+IGNvbXBpbGVyIHNob3VsZCBy
ZW1vdmUgYW55IGFjY2VzcyB0byBjcHVfcGFya2VkX21hcC4KPj4gCj4+IFdpdGggdGhhdCBpbiBt
aW5kLCBJIHRoaW5rIGl0IHdvdWxkIGJlIGJlc3QgdG8gb25seSBwcm92aWRlIGEgcHJvdG90eXBl
IAo+PiBmb3IgY3B1X3BhcmtlZF9tYXAgYW5kIHNvIHRoZSBsaW5rZXIgY2FuIHdhcm4gaWYgc29t
ZW9uZSB1c2VkIGl0Lgo+Cj4rMQoKV2lsbCBkby4gSSBhZGRlZCB0aGlzIGJlY2F1c2UgSSBhbSBu
b3Qgc3VyZSBhbGwgY29tcGlsZXJzIHdvdWxkIG9taXQKc3VjaCBhY2Nlc3MuCgo+Cj5JbiBmYWN0
IEkgd29uZGVyIHdoZXRoZXIgdGhlIG1haW50ZW5hbmNlIG9mIHRoZSBtYXAgc2hvdWxkIGxpdmUg
aW4KPmNvbW1vbiBjb2RlIGluIHRoZSBmaXJzdCBwbGFjZS4gV2hpbGUgY2xlYXJpbmcgdGhlIHJl
c3BlY3RpdmUgYml0Cj5pbiBjcHVfdXAoKSBsb29rcyBjb3JyZWN0IChhbmQgY291bGQgYmUgZG9u
ZSB3aXRob3V0IGFueSBpZigpKSwKCkJ1dCB3aGVuIHBhcmtfb2ZmbGluZV9jcHVzKCkgaXMgZmFs
c2UsIHRoZSBtYXAgaXNuJ3QgYWxsb2NhdGVkLiBJIGRvbid0CnRoaW5rIGl0IGlzIHNhZmUgdG8g
YWNjZXNzIHRoZSBtYXAgaW4gdGhpcyBjYXNlLgoKPkknbSBub3QgY29udmluY2VkIHRoZSBzZXR0
aW5nIG9mIHRoZSBiaXQgaW4gY3B1X2Rvd24oKSBpcyBnb2luZyB0bwo+YmUgY29ycmVjdCBpbiBh
bGwgY2FzZXMuCgpEbyB5b3UgbWVhbiBpbiBzb21lIGNhc2VzLCBjcHVfZG93bigpIGlzIHRvIHJl
YWxseSBvZmZsaW5lIGEgQ1BVIGV2ZW4KcGFya19vZmZsaW5lX2NwdXMgaXMgc2V0PyBBbmQgaW4g
dGhpcyBjYXNlLCBzZXR0aW5nIHRoZSBiaXQgaXNuJ3QKY29ycmVjdC4KCklmIHllcywgb25lIHRo
aW5nIGNvbmZ1c2VzIG1lIGlzIHRoYXQgY3B1X2Rvd24oKSB3b3VsZCBjYWxsCmNwdV9ub3RpZmll
cl9jYWxsX2NoYWluKCkgc2V2ZXJhbCB0aW1lcyB1bmNvbmRpdGlvbmFsbHkuIEFuZCByZWdpc3Rl
cmVkCmNhbGxiYWNrcyB0YWtlIGFjdGlvbnMgZGVwZW5kaW5nIG9uIHRoZSB2YWx1ZSBvZiBwYXJr
X29mZmxpbmVfY3B1cy4KSSBleHBlY3RlZCB0aGF0IGNhbGxiYWNrcyB3b3VsZCBkbyBtb3JlIGNo
ZWNrIHRvIGF2b2lkIHBhcmtpbmcgYSBDUFUKaW4gc29tZSBjYXNlcy4KClRoYW5rcwpDaGFvCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
