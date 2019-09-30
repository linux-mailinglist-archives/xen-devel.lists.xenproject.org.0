Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0249DC230E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 16:20:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEwUh-0001SA-Nl; Mon, 30 Sep 2019 14:17:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jOUw=XZ=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iEwUg-0001S5-Mv
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 14:17:42 +0000
X-Inumbo-ID: 0f440f14-e38d-11e9-97fb-bc764e2007e4
Received: from mga01.intel.com (unknown [192.55.52.88])
 by localhost (Halon) with ESMTPS
 id 0f440f14-e38d-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 14:17:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Sep 2019 07:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,567,1559545200"; d="scan'208";a="342661530"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga004.jf.intel.com with ESMTP; 30 Sep 2019 07:17:37 -0700
Date: Mon, 30 Sep 2019 22:21:40 +0800
From: Chao Gao <chao.gao@intel.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190930142138.GA26290@gao-cwp>
References: <1569792271-19856-1-git-send-email-chao.gao@intel.com>
 <20190930090958.ipnrztutxql5uvrz@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930090958.ipnrztutxql5uvrz@Air-de-Roger>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH for Xen 4.13] x86/msi: Don't panic if msix
 capability is missing
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTE6MDk6NThBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPk9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0IDA1OjI0OjMxQU0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+PiBDdXJyZW50LCBYZW4gaXNuJ3QgYXdhcmUgb2YgZGV2aWNlIHJlc2V0IChp
bml0aWF0ZWQgYnkgZG9tMCkuIFhlbiBtYXkKPj4gYWNjZXNzIHRoZSBkZXZpY2Ugd2hpbGUgZGV2
aWNlIGNhbm5vdCByZXNwb25kIHRvIGNvbmZpZyByZXF1ZXN0cwo+PiBub3JtYWxseSAoZS5nLiAg
YWZ0ZXIgZGV2aWNlIHJlc2V0LCBkZXZpY2UgbWF5IHJlc3BvbmQgdG8gY29uZmlnCj4+IHJlcXVl
c3RzIHdpdGggQ1JTIGNvbXBsZXRpb25zIHRvIGluZGljYXRlIGl0IG5lZWRzIG1vcmUgdGltZSB0
bwo+PiBjb21wbGV0ZSBhIHJlc2V0LCByZWZlciB0byBwY2lfZGV2X3dhaXQoKSBpbiBsaW51eCBr
ZXJuZWwgZm9yIG1vcmUKPj4gZGV0YWlsKS4gSGVyZSwgZG9uJ3QgYXNzdW1lIG1zaXggY2FwYWJp
bGl0eSBpcyBhbHdheXMgdmlzaWJsZSBhbmQKPj4gcmV0dXJuIC1FQUdBSU4gdG8gdGhlIGNhbGxl
ci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Cj4+
IC0tLQo+PiBJIGRpZG4ndCBmaW5kIGEgd2F5IHRvIHRyaWdnZXIgdGhlIGFzc2VydGlvbiBpbiBu
b3JtYWwgdXNhZ2VzLgo+PiBJdCBpcyBmb3VuZCBieSBhbiBpbnRlcm5hbCB0ZXN0OiBlY2hvIDEg
dG8gL3N5cy9idXMvcGNpLzxzYmRmPi9yZXNldAo+PiB3aGVuIHRoZSBkZXZpY2UgaXMgYmVpbmcg
dXNlZCBieSBhIGd1ZXN0LiBBbHRob3VnaCB0aGUgdGVzdCBpcyBhCj4+IGxpdHRsZSBpbnNhbmUs
IGl0IGlzIGJldHRlciB0byBhdm9pZCBjcmFzaGluZyBYZW4gZXZlbiBmb3IgdGhpcyBjYXNlLgo+
Cj5UaGUgaGFyZHdhcmUgZG9tYWluIGRvaW5nIHN1Y2ggdGhpbmdzIGJlaGluZCBYZW4ncyBiYWNr
IGlzIHF1aXRlCj5saWtlbHkgdG8gZW5kIGJhZGx5LCBlaXRoZXIgaGl0dGluZyBhbiBBU1NFUlQg
c29tZXdoZXJlIG9yIHdpdGggYQo+bWFsZnVuY3Rpb25pbmcgZGV2aWNlLiBYZW4gc2hvdWxkIGJl
IHNpZ25hbGVkIG9mIHdoZW4gc3VjaCByZXNldCBpcwo+aGFwcGVuaW5nLCBzbyBpdCBjYW4gYWxz
byB0ZWFyIGRvd24gdGhlIGludGVybmFsIHN0YXRlIG9mIHRoZQo+ZGV2aWNlLgo+Cj5YZW4gY291
bGQgdHJhcCBhY2Nlc3NlcyB0byB0aGUgRkxSIGJpdCBpbiBvcmRlciB0byBkZXRlY3QgZGV2aWNl
Cj5yZXNldHMsIGJ1dCB0aGF0J3Mgb25seSBhIHdheSBvZiBwZXJmb3JtaW5nIGEgZGV2aWNlIHJl
c2V0LCBvdGhlcgo+bWV0aG9kcyBhcmUgbGlrZWx5IG1vcmUgY29tcGxpY2F0ZWQgdG8gZGV0ZWN0
LCBhbmQgaGVuY2UgdGhpcyB3b3VsZAo+b25seSBiZSBhIHBhcnRpYWwgc29sdXRpb24uCj4KPkhh
dmUgeW91IGNvbnNpZGVyZWQgd2hldGhlciBpdCdzIGZlYXNpYmxlIHRvIHNpZ25hbCBYZW4gdGhh
dCBhIGRldmljZQo+cmVzZXQgaXMgaGFwcGVuaW5nLCBzbyBpdCBjYW4gdG9ybiBkb3duIHRoZSBp
bnRlcm5hbCBkZXZpY2Ugc3RhdGU/CgpJIHRoaW5rIGl0IGlzIGZlYXNpYmxlLiBCdXQgSSBhbSBu
b3Qgc3VyZSB3aGV0aGVyIGl0IGlzIG5lY2Vzc2FyeS4KQXMgeW91IHNhaWQgdG8gbWUgYmVmb3Jl
LCBhZnRlciBkZXRhY2hpbmcgdGhlIGRldmljZSBmcm9tIGEgZG9tYWluLAp0aGUgaW50ZXJuYWwg
ZGV2aWNlIHN0YXRlIGluIFhlbiBzaG91bGQgaGF2ZSBiZSByZXNldC4gVGhhdCdzIHdoeQpoYXJk
d2FyZSBkb21haW4gb3Igb3RoZXIgZG9tYWluVSBjYW4gdXNlIHRoZSBkZXZpY2UgYWdhaW4uIFNv
IFhlbgpoYXMgcHJvdmlkZWQgaHlwZXJjYWxscyB0byB0ZWFyIGRvd24gdGhlIGludGVybmFsIHN0
YXRlLiAoSU1PLCB0aGUKaW50ZXJuYWwgc3RhdGUgaW5jbHVkZXMgaW50ZXJydXB0IGJpbmRpbmcg
YW5kIG1hcHBpbmcsIE1NSU8gbWFwcGluZy4KQnV0IEkgYW0gbm90IHN1cmUgaWYgSSBtaXNzIHNv
bWV0aGluZykuCgpUaGUgcXVlc3Rpb24gdGhlbiBiZWNvbWVzOiBzaG91bGQgWGVuIHRvbGVyYXRl
IGhhcmR3YXJlIGRvbWFpbidzCm1pc2JlaGF2aW9yIChyZXNldHRpbmcgYSBkZXZpY2Ugd2l0aG91
dCB0ZWFyaW5nIGRvd24gaW50ZXJuYWwgc3RhdGUpCm9yIGp1c3QgcGFuaWM/Cgo+Cj4+IC0tLQo+
PiAgeGVuL2FyY2gveDg2L21zaS5jIHwgOCArKysrKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9tc2kuYyBiL3hlbi9hcmNoL3g4Ni9tc2kuYwo+PiBpbmRleCA3NmQ0MDM0Li5lMmYzYzZj
IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbXNpLmMKPj4gKysrIGIveGVuL2FyY2gveDg2
L21zaS5jCj4+IEBAIC0xMjY1LDcgKzEyNjUsMTMgQEAgaW50IHBjaV9tc2lfY29uZl93cml0ZV9p
bnRlcmNlcHQoc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsCj4+ICAgICAg
ICAgIHBvcyA9IGVudHJ5ID8gZW50cnktPm1zaV9hdHRyaWIucG9zCj4+ICAgICAgICAgICAgICAg
ICAgICAgIDogcGNpX2ZpbmRfY2FwX29mZnNldChzZWcsIGJ1cywgc2xvdCwgZnVuYywKPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9DQVBfSURfTVNJWCk7
Cj4+IC0gICAgICAgIEFTU0VSVChwb3MpOwo+Cj5JIHRoaW5rIGF0IGxlYXN0IGEgY29tbWVudCBz
aG91bGQgYmUgYWRkZWQgaGVyZSBkZXNjcmliaW5nIHdoeSBhCj5jYXBhYmlsaXR5IG1pZ2h0IHN1
ZGRlbmx5IGRpc2FwcGVhci4KCldpbGwgZG8uCgo+Cj4+ICsgICAgICAgIGlmICggdW5saWtlbHko
IXBvcykgKQo+PiArICAgICAgICB7Cj4+ICsgICAgICAgICAgICBwcmludGtfb25jZShYRU5MT0df
V0FSTklORwo+Cj5JJ20gbm90IHN1cmUgaWYgcHJpbnRrX29uY2UgaXMgdGhlIGJlc3Qgb3B0aW9u
LCB0aGUgbWVzc2FnZSB3b3VsZCBiZQo+cHJpbnRlZCBvbmx5IG9uY2UsIGFuZCBmb3IgdGhlIGZp
cnN0IGRldmljZSB0aGF0IGhpdHMgdGhpcy4gSWRlYWxseSBJCj50aGluayBpdCBzaG91bGQgYmUg
cHJpbnRlZCBhdCBsZWFzdCBvbmNlIGZvciBlYWNoIGRldmljZSB0aGF0IGhpdHMKPnRoaXMgY29u
ZGl0aW9uLgo+Cj5BbHRlcm5hdGl2ZWx5IHlvdSBjYW4gdHVybiB0aGlzIGludG8gYSBncHJpbnRr
IHdoaWNoIHdvdWxkIGJlIGdvb2QKPmVub3VnaCBJTU8uCgpXaWxsIGRvLgoKVGhhbmtzCkNoYW8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
