Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7FE10D06A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 02:49:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaVN7-0006od-Ob; Fri, 29 Nov 2019 01:47:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/8y=ZV=linux.intel.com=yi.y.sun@srs-us1.protection.inumbo.net>)
 id 1iaVN6-0006oY-Mw
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 01:47:00 +0000
X-Inumbo-ID: 21ee382e-124a-11ea-83b8-bc764e2007e4
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21ee382e-124a-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 01:46:59 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 17:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,255,1571727600"; d="scan'208";a="234571218"
Received: from yisun1-ubuntu.bj.intel.com (HELO localhost) ([10.238.156.100])
 by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2019 17:46:46 -0800
Date: Fri, 29 Nov 2019 09:41:49 +0800
From: Yi Sun <yi.y.sun@linux.intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191129014149.GU18465@yi.y.sun>
References: <1574936284-5139-1-git-send-email-yi.y.sun@linux.intel.com>
 <fdb27512-4ebc-8f80-7ef2-36d83c369326@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdb27512-4ebc-8f80-7ef2-36d83c369326@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v2] psr: fix bug which may cause crash
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
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTktMTEtMjggMTI6MjU6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI4LjExLjIwMTkg
MTE6MTgsIFlpIFN1biB3cm90ZToKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9wc3IuYwo+ID4gKysr
IGIveGVuL2FyY2gveDg2L3Bzci5jCj4gPiBAQCAtMTI3MSw3ICsxMjcxLDggQEAgc3RhdGljIHZv
aWQgZG9fd3JpdGVfcHNyX21zcnModm9pZCAqZGF0YSkKPiA+ICAKPiA+ICAgICAgICAgIGZvciAo
IGogPSAwOyBqIDwgY29zX251bTsgaisrLCBpbmRleCsrICkKPiA+ICAgICAgICAgIHsKPiA+IC0g
ICAgICAgICAgICBpZiAoIGZlYXQtPmNvc19yZWdfdmFsW2NvcyAqIGNvc19udW0gKyBqXSAhPSBp
bmZvLT52YWxbaW5kZXhdICkKPiA+ICsgICAgICAgICAgICBpZiAoIGNvcyA8PSBmZWF0LT5jb3Nf
bWF4ICYmCj4gPiArICAgICAgICAgICAgICAgICBmZWF0LT5jb3NfcmVnX3ZhbFtjb3MgKiBjb3Nf
bnVtICsgal0gIT0gaW5mby0+dmFsW2luZGV4XSApCj4gCj4gVGhlIGRlc2NyaXB0aW9uIGlzIGlu
ZGVlZCBtdWNoIGJldHRlciBub3csIHRoYW5rcy4gSG93ZXZlciwKPiBhcyBpbmRpY2F0ZWQgaW4g
cmVwbHkgdG8gdjEsIHRoaXMgZXh0cmEgKGFuZCBhdCB0aGUgZmlyc3QgZ2xhbmNlCj4gdW5tb3Rp
dmF0ZWQpIGJvdW5kcyBjaGVjayB3YW50cyB0byBiZSBhY2NvbXBhbmllZCBieSBhIGJyaWVmIGJ1
dAoKSSB3aWxsIGFkZCB0aGUgY29tbWVudC4KCj4gcHJlY2lzZSBjb21tZW50LiBGdXJ0aGVybW9y
ZSB3aXRoIHRoZSBsb29wIGJvdW5kZWQgYnkgYSBsb2NhbAo+IHZhcmlhYmxlLCB3aHkgbm90Cj4g
Cj4gICAgICAgICBjb3NfbnVtID0gbWluKHByb3BzLT5jb3NfbnVtLCBmZWF0LT5jb3NfbWF4ICsg
MSk7Cj4gCj4gYSBmZXcgbGluZXMgdXAgZnJvbSBoZXJlIChhZ2FpbiBzdWl0YWJsZSBjb21tZW50
ZWQpPwo+CmNvc19udW0gaXMgYSBkaWZmZXJlbnQgdGhpbmcgd2l0aCB0aGUgbnVtYmVyIG9mIENP
UyByZWdpc3RlcnMuIFRoZQptZWFuaW5nIG9mIGl0IGlzICJDT1MgcmVnaXN0ZXJzIG51bWJlciB0
aGF0IGZlYXR1cmUgdXNlcyBmb3Igb25lIENPUwpJRCIuIEUuZy4gTUJBL0NBVCBjb3NfbnVtIGlz
IGFsd2F5cyAxLiBCdXQgQ0RQIGNvc19udW0gaXMgMiBiZWNhdXNlIGl0CnVzZXMgMiBDT1MgcmVn
aXN0ZXJzIGZvciBvbmUgQ09TIElELgogCj4gSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
