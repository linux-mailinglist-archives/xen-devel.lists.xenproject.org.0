Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607CCFE0A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 18:40:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLVkg-0002Mx-Ab; Tue, 30 Apr 2019 16:37:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vTsw=TA=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hLVkf-0002Ms-Hf
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 16:37:05 +0000
X-Inumbo-ID: 2d9a3654-6b66-11e9-ae41-d37e041ff47c
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d9a3654-6b66-11e9-ae41-d37e041ff47c;
 Tue, 30 Apr 2019 16:37:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 09:37:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,414,1549958400"; d="scan'208";a="147140980"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga007.fm.intel.com with ESMTP; 30 Apr 2019 09:36:59 -0700
Date: Wed, 1 May 2019 00:41:13 +0800
From: Chao Gao <chao.gao@intel.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190430164113.GB20660@gao-cwp>
References: <1556601559-30921-1-git-send-email-chao.gao@intel.com>
 <5CC7FFAF020000780022A42A@prv1-mh.provo.novell.com>
 <20190430090120.GA6748@gao-cwp>
 <20190430093033.ncd2ism7n4mvy733@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430093033.ncd2ism7n4mvy733@Air-de-Roger>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH] x86/pt: skip setup of posted format IRTE
 when gvec is 0
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMTE6MzA6MzNBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPk9uIFR1ZSwgQXByIDMwLCAyMDE5IGF0IDA1OjAxOjIxUE0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+PiBPbiBUdWUsIEFwciAzMCwgMjAxOSBhdCAwMTo1NjozMUFNIC0wNjAwLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4gPj4+PiBPbiAzMC4wNC4xOSBhdCAwNzoxOSwgPGNoYW8uZ2Fv
QGludGVsLmNvbT4gd3JvdGU6Cj4+ID4+IFdoZW4gdGVzdGluZyB3aXRoIGFuIFVQIGd1ZXN0IHdp
dGggYSBwYXNzLXRocnUgZGV2aWNlIHdpdGggdnQtZCBwaQo+PiA+PiBlbmFibGVkIGluIGhvc3Qs
IHdlIG9ic2VydmVkIHRoYXQgZ3Vlc3QgY291bGRuJ3QgcmVjZWl2ZSBpbnRlcnJ1cHRzCj4+ID4+
IGZyb20gdGhhdCBwYXNzLXRocnUgZGV2aWNlLiBEdW1waW5nIElSVEUsIHdlIGZvdW5kIHRoZSBj
b3JyZXNwb25kaW5nCj4+ID4+IElSVEUgaXMgc2V0IHRvIHBvc3RlZCBmb3JtYXQgd2l0aCAidmVj
dG9yIiBmaWVsZCBhcyAwLgo+PiA+PiAKPj4gPj4gV2Ugd291bGQgZmFsbCBpbnRvIHRoaXMgaXNz
dWUgd2hlbiBndWVzdCB1c2VkIHRoZSBwaXJxIGZvcm1hdCBvZiBNU0kKPj4gPj4gKHNlZSB0aGUg
Y29tbWVudCB4ZW5fbXNpX2NvbXBvc2VfbXNnKCkgaW4gbGludXgga2VybmVsKS4gQXMgJ2Rlc3Rf
aWQnCj4+ID4+IGlzIHJlcHVycG9zZWQsIHNraXAgbWlncmF0aW9uIHdoaWNoIGlzIGJhc2VkIG9u
ICdkZXN0X2lkJy4KPj4gPgo+PiA+SSd2ZSBnb25lIHRocm91Z2ggYWxsIHVzZXMgb2YgZ3ZlYywg
YW5kIEkgY291bGRuJ3QgZmluZCBhbnkgZXhpc3RpbmcKPj4gPnNwZWNpYWwgY2FzaW5nIG9mIGl0
IGJlaW5nIHplcm8uIEkgYXNzdW1lIHRoaXMgaXMgYWN0dWFsbHkgY29tbXVuaWNhdGlvbgo+PiA+
YmV0d2VlbiB0aGUga2VybmVsIGFuZCBxZW11LAo+PiAKPj4gWWVzLiAKPj4gCj4+ID5pbiB3aGlj
aCBjYXNlIEknZCBsaWtlIHRvIHNlZSBhbgo+PiA+ZXhwbGFuYXRpb24gb2Ygd2h5IHRoZSBpc3N1
ZSBuZWVkcyB0byBiZSBhZGRyZXNzZWQgaW4gWGVuIHJhdGhlcgo+PiA+dGhhbiBxZW11Lgo+PiAK
Pj4gVG8gY2FsbCBwaXJxX2d1ZXN0X2JpbmQoKSB0byBjb25maWd1cmUgaXJxX2Rlc2MgcHJvcGVy
bHkuCj4+IEVzcGVjaWFsbHksIHdlIGFwcGVuZCBhIHBvaW50ZXIgb2Ygc3RydWN0IGRvbWFpbiB0
byAnYWN0aW9uLT5ndWVzdCcgaW4KPj4gcGlycV9ndWVzdF9iaW5kKCkuIFRoZW4gX19kb19JUlFf
Z3Vlc3QoKSBrbm93cyBkb21haW5zIHRoYXQgYXJlIGludGVyZXN0ZWQKPj4gaW4gdGhpcyBpbnRl
cnJ1cHQgYW5kIGluamVjdHMgYW4gaW50ZXJydXB0IHRvIHRob3NlIGRvbWFpbnMuCj4+IAo+PiA+
T3RoZXJ3aXNlLCBpZiBJJ3ZlIG92ZXJsb29rZWQgc29tZXRoaW5nLCB3b3VsZCB5b3UKPj4gPm1p
bmQgcG9pbnRpbmcgb3V0IHdoZXJlIHN1Y2ggc3BlY2lhbCBjYXNpbmcgbGl2ZXMgaW4gWGVuPwo+
PiA+Cj4+ID5JbiBhbnkgZXZlbnQgaXQgZG9lc24ndCBsb29rIGNvcnJlY3QgdG8gc2tpcCBtaWdy
YXRpb24gYWx0b2dldGhlciBpbgo+PiA+dGhhdCBjYXNlLiBJJ2QgcmF0aGVyIGV4cGVjdCBpdCB0
byByZXF1aXJlIGdldHRpbmcgZG9uZSBkaWZmZXJlbnRseS4KPj4gPkFmdGVyIGFsbCB0aGVyZSBz
dGlsbCBpcyBhIChDUFUsIHZlY3RvcikgdHVwbGUgYXNzb2NpYXRlZCB3aXRoIHRoYXQKPj4gPnss
cH1JUlEgaWYgaXQncyBub3QgcG9zdGVkLCBhbmQgaHZtX21pZ3JhdGVfcGlycSgpIGlzIGEgbm8t
b3AgaWYgaXQgaXMKPj4gPnBvc3RlZC4KPj4gCj4+IEhlcmUsIHdlIHRyeSB0byBzZXQgaXJxJ3Mg
dGFyZ2V0IGNwdSB0byB0aGUgY3B1IHdoaWNoIHRoZSB2bXNpJ3MgdGFyZ2V0IHZjcHUKPj4gaXMg
cnVubmluZyBvbiB0byByZWR1Y2UgSVBJLiBCdXQgdGhlICdkZXN0X2lkJyBmaWVsZCB3aGljaCB1
c2VkIHRvCj4+IGluZGljYXRlIHRoZSB2bXNpJ3MgdGFyZ2V0IHZjcHUgaXMgbWlzc2luZywgd2Ug
ZG9uJ3Qga25vdyB3aGljaCBjcHUgd2Ugc2hvdWxkCj4+IG1pZ3JhdGUgdGhlIGlycSB0by4gT25l
IHBvc3NpYmxlIGNob2ljZSBpcyB0aGUgJ2Nobi0+bm90aWZ5X3ZjcHVfaWQnCj4+IHVzZWQgaW4g
c2VuZF9ndWVzdF9waXJxKCkuIERvIHlvdSB0aGluayB0aGlzIGNob2ljZSBpcyBmaW5lPwo+Cj5J
IHRoaW5rIHRoYXQgYnkgdGhlIHRpbWUgdGhlIGRldmljZSBtb2RlbCBjYWxscyBpbnRvIHBpcnFf
Z3Vlc3RfYmluZAo+dGhlIFBJUlEgd29uJ3QgYmUgYm91bmQgdG8gYW55IGV2ZW50IGNoYW5uZWws
IHNvIHBpcnEtPmV2dGNobiB3b3VsZCBiZQo+MC4KClRoZW4gc2tpcCBwaXJxIG1pZ3JhdGlvbiBp
cyB0aGUgb25seSBjaG9pY2UgaGVyZT8gQW5kIHdlIGNhbiBtaWdyYXRlCnBpcnEgd2hlbiBpdCBp
cyBib3VuZCB3aXRoIGFuIGV2ZW50IGNoYW5uZWwuCgo+Cj5Ob3RlIHRoYXQgdGhlIGJpbmRpbmcg
b2YgdGhlIFBJUlEgd2l0aCB0aGUgZXZlbnQgY2hhbm5lbCBpcyBkb25lCj5hZnRlcndhcmRzIGlu
IHhlbl9odm1fc2V0dXBfbXNpX2lycXMgYnkgdGhlIExpbnV4IGtlcm5lbC4KPgo+SXQgc2VlbXMg
bGlrZSB0aGUgZGV2aWNlIG1vZGVsIHNob3VsZCBiZSB1c2luZyBhIGRpZmZlcmVudCBzZXQgb2YK
Pmh5cGVyY2FsbHMgdG8gc2V0dXAgYSBQSVJRIHRoYXQgaXMgcm91dGVkIG92ZXIgYW4gZXZlbnQg
Y2hhbm5lbCwgaWU6Cj5QSFlTREVWT1BfbWFwX3BpcnEgYW5kIGZyaWVuZHMuCgpOb3cgcWVtdSBp
cyB1c2luZyBQSFlTREVWT1BfbWFwX3BpcnEuIFJpZ2h0PwoKVGhhbmtzCkNoYW8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
