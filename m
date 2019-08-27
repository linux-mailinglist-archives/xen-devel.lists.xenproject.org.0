Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E679DCD0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 06:50:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2TOl-00075G-VG; Tue, 27 Aug 2019 04:48:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YViL=WX=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i2TOk-00075B-3m
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 04:48:02 +0000
X-Inumbo-ID: d786230e-c885-11e9-ae2c-12813bfff9fa
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d786230e-c885-11e9-ae2c-12813bfff9fa;
 Tue, 27 Aug 2019 04:47:59 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 21:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,435,1559545200"; d="scan'208";a="187806575"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2019 21:47:56 -0700
Date: Tue, 27 Aug 2019 12:52:01 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Message-ID: <20190827045159.GA28509@gao-cwp>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-16-git-send-email-chao.gao@intel.com>
 <3b455c41-b5a3-2533-99a8-2200def4b19f@citrix.com>
 <20190826080759.GB11910@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190826080759.GB11910@gao-cwp>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v9 15/15] microcode: block #NMI handling
 when loading an ucode
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
Cc: Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDQ6MDc6NTlQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj5PbiBGcmksIEF1ZyAyMywgMjAxOSBhdCAwOTo0NjozN0FNICswMTAwLCBTZXJnZXkgRHlhc2xp
IHdyb3RlOgo+Pk9uIDE5LzA4LzIwMTkgMDI6MjUsIENoYW8gR2FvIHdyb3RlOgo+Pj4gcmVnaXN0
ZXIgYW4gbm1pIGNhbGxiYWNrLiBBbmQgdGhpcyBjYWxsYmFjayBkb2VzIGJ1c3ktbG9vcCBvbiB0
aHJlYWRzCj4+PiB3aGljaCBhcmUgd2FpdGluZyBmb3IgbG9hZGluZyBjb21wbGV0aW9uLiBDb250
cm9sIHRocmVhZHMgc2VuZCBOTUkgdG8KPj4+IHNsYXZlIHRocmVhZHMgdG8gcHJldmVudCBOTUkg
YWNjZXB0YW5jZSBkdXJpbmcgdWNvZGUgbG9hZGluZy4KPj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTog
Q2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPj4+IC0tLQo+Pj4gQ2hhbmdlcyBpbiB2OToK
Pj4+ICAtIGNvbnRyb2wgdGhyZWFkcyBzZW5kIE5NSSB0byBhbGwgb3RoZXIgdGhyZWFkcy4gU2xh
dmUgdGhyZWFkcyB3aWxsCj4+PiAgc3RheSBpbiB0aGUgTk1JIGhhbmRsaW5nIHRvIHByZXZlbnQg
Tk1JIGFjY2VwdGFuY2UgZHVyaW5nIHVjb2RlCj4+PiAgbG9hZGluZy4gTm90ZSB0aGF0IHNlbGYt
bm1pIGlzIGludmFsaWQgYWNjb3JkaW5nIHRvIFNETS4KPj4KPj5UbyBtZSB0aGlzIGxvb2tzIGxp
a2UgYSBoYWxmLW1lYXN1cmU6IHdoeSBrZWVwIG9ubHkgc2xhdmUgdGhyZWFkcyBpbgo+PnRoZSBO
TUkgaGFuZGxlciwgd2hlbiBtYXN0ZXIgdGhyZWFkcyBjYW4gdXBkYXRlIHRoZSBtaWNyb2NvZGUg
ZnJvbQo+Pmluc2lkZSB0aGUgTk1JIGhhbmRsZXIgYXMgd2VsbD8KPgo+Tm8gc3BlY2lhbCByZWFz
b24uIEJlY2F1c2UgdGhlIGlzc3VlIHdlIHdhbnQgdG8gYWRkcmVzcyBpcyB0aGF0IHNsYXZlCj50
aHJlYWRzIG1pZ2h0IGdvIHRvIGhhbmRsZSBOTUkgYW5kIGFjY2VzcyBNU1JzIHdoZW4gbWFzdGVy
IHRocmVhZCBpcwo+bG9hZGluZyB1Y29kZS4gU28gd2Ugb25seSBrZWVwIHNsYXZlIHRocmVhZHMg
aW4gdGhlIE5NSSBoYW5kbGVyLgo+Cj4+Cj4+WW91IG1lbnRpb24gdGhhdCBzZWxmLW5taSBpcyBp
bnZhbGlkLCBidXQgWGVuIGhhcyBzZWxmX25taSgpIHdoaWNoIGlzCj4+dXNlZCBmb3IgYXBwbHlf
YWx0ZXJuYXRpdmVzKCkgZHVyaW5nIGJvb3QsIHNvIGNhbiBiZSB0cnVzdGVkIHRvIHdvcmsuCj4K
PlNvcnJ5LCBJIG1lYW50IHVzaW5nIHNlbGYgc2hvcnRoYW5kIHRvIHNlbmQgc2VsZi1ubWkuIEkg
dHJpZWQgdG8gdXNlCj5zZWxmIHNob3J0aGFuZCBidXQgZ290IEFQSUMgZXJyb3IuIEFuZCBJIGFn
cmVlIHRoYXQgaXQgaXMgYmV0dGVyIHRvCj5tYWtlIHNsYXZlIHRocmVhZCBjYWxsIHNlbGZfbm1p
KCkgaXRzZWxmLgo+Cj4+Cj4+SSBleHBlcmltZW50ZWQgYSBiaXQgd2l0aCB0aGUgZm9sbG93aW5n
IGFwcHJvYWNoOiBhZnRlciBsb2FkaW5nX3N0YXRlCj4+YmVjb21lcyBMT0FESU5HX0NBTExJTiwg
ZWFjaCBjcHUgaXNzdWVzIGEgc2VsZl9ubWkoKSBhbmQgcmVuZGV6dm91cwo+PnZpYSBjcHVfY2Fs
bGluX21hcCBpbnRvIExPQURJTkdfRU5URVIgdG8gZG8gYSB1Y29kZSB1cGRhdGUgZGlyZWN0bHkg
aW4KPj50aGUgTk1JIGhhbmRsZXIuIEFuZCBpdCBzZWVtcyB0byB3b3JrLgo+Pgo+PlNlcGFyYXRl
IHF1ZXN0aW9uIGlzIGFib3V0IHRoZSBzYWZldHkgb2YgdGhpcyBhcHByb2FjaDogY2FuIHdlIGJl
IHN1cmUKPj50aGF0IGEgdWNvZGUgdXBkYXRlIHdvdWxkIG5vdCByZXNldCB0aGUgc3RhdHVzIG9m
IHRoZSBOTUkgbGF0Y2g/IEkuZS4KPj5jYW4gaXQgY2F1c2UgYW5vdGhlciBOTUkgdG8gYmUgZGVs
aXZlcmVkIHdoaWxlIFhlbiBhbHJlYWR5IGhhbmRsZXMgb25lPwo+Cj5Bc2hvaywgd2hhdCdzIHlv
dXIgb3BpbmlvbiBvbiBTZXJnZXkncyBhcHByb2FjaCBhbmQgaGlzIGNvbmNlcm4/CgpIaSBTZXJn
ZXksCgpJIHRhbGtlZCB3aXRoIEFzaG9rLiBXZSB0aGluayB5b3VyIGFwcHJvYWNoIGlzIGJldHRl
ci4gSSB3aWxsIGZvbGxvdwp5b3VyIGFwcHJvYWNoIGluIHYxMC4gSXQgd291bGQgYmUgbXVjaCBo
ZWxwZnVsIGlmIHlvdSBwb3N0IHlvdXIgcGF0Y2gKc28gdGhhdCBJIGNhbiBqdXN0IHJlYmFzZSBp
dCBvbnRvIG90aGVyIHBhdGNoZXMuCgpUaGFua3MKQ2hhbwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
