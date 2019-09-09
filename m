Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB3AD2D8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 07:51:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7CX8-00043p-1M; Mon, 09 Sep 2019 05:48:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+J6z=XE=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i7CX6-00043c-9w
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 05:48:12 +0000
X-Inumbo-ID: 67e789da-d2c5-11e9-ac08-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67e789da-d2c5-11e9-ac08-12813bfff9fa;
 Mon, 09 Sep 2019 05:48:11 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Sep 2019 22:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,483,1559545200"; d="scan'208";a="196087515"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga002.jf.intel.com with ESMTP; 08 Sep 2019 22:48:08 -0700
Date: Mon, 9 Sep 2019 13:52:12 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190909055210.GA28376@gao-cwp>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-16-git-send-email-chao.gao@intel.com>
 <3b455c41-b5a3-2533-99a8-2200def4b19f@citrix.com>
 <20190826080759.GB11910@gao-cwp> <20190827045159.GA28509@gao-cwp>
 <d95a5b28-04c6-dcc6-8b16-fc4ade330c15@suse.com>
 <20190830063506.GD31905@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830063506.GD31905@gao-cwp>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMDI6MzU6MDZQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj5PbiBUaHUsIEF1ZyAyOSwgMjAxOSBhdCAwMjoxMToxMFBNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj5PbiAyNy4wOC4yMDE5IDA2OjUyLCBDaGFvIEdhbyB3cm90ZToKPj4+IE9uIE1vbiwg
QXVnIDI2LCAyMDE5IGF0IDA0OjA3OjU5UE0gKzA4MDAsIENoYW8gR2FvIHdyb3RlOgo+Pj4+IE9u
IEZyaSwgQXVnIDIzLCAyMDE5IGF0IDA5OjQ2OjM3QU0gKzAxMDAsIFNlcmdleSBEeWFzbGkgd3Jv
dGU6Cj4+Pj4+IE9uIDE5LzA4LzIwMTkgMDI6MjUsIENoYW8gR2FvIHdyb3RlOgo+Pj4+Pj4gcmVn
aXN0ZXIgYW4gbm1pIGNhbGxiYWNrLiBBbmQgdGhpcyBjYWxsYmFjayBkb2VzIGJ1c3ktbG9vcCBv
biB0aHJlYWRzCj4+Pj4+PiB3aGljaCBhcmUgd2FpdGluZyBmb3IgbG9hZGluZyBjb21wbGV0aW9u
LiBDb250cm9sIHRocmVhZHMgc2VuZCBOTUkgdG8KPj4+Pj4+IHNsYXZlIHRocmVhZHMgdG8gcHJl
dmVudCBOTUkgYWNjZXB0YW5jZSBkdXJpbmcgdWNvZGUgbG9hZGluZy4KPj4+Pj4+Cj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgo+Pj4+Pj4gLS0tCj4+
Pj4+PiBDaGFuZ2VzIGluIHY5Ogo+Pj4+Pj4gIC0gY29udHJvbCB0aHJlYWRzIHNlbmQgTk1JIHRv
IGFsbCBvdGhlciB0aHJlYWRzLiBTbGF2ZSB0aHJlYWRzIHdpbGwKPj4+Pj4+ICBzdGF5IGluIHRo
ZSBOTUkgaGFuZGxpbmcgdG8gcHJldmVudCBOTUkgYWNjZXB0YW5jZSBkdXJpbmcgdWNvZGUKPj4+
Pj4+ICBsb2FkaW5nLiBOb3RlIHRoYXQgc2VsZi1ubWkgaXMgaW52YWxpZCBhY2NvcmRpbmcgdG8g
U0RNLgo+Pj4+Pgo+Pj4+PiBUbyBtZSB0aGlzIGxvb2tzIGxpa2UgYSBoYWxmLW1lYXN1cmU6IHdo
eSBrZWVwIG9ubHkgc2xhdmUgdGhyZWFkcyBpbgo+Pj4+PiB0aGUgTk1JIGhhbmRsZXIsIHdoZW4g
bWFzdGVyIHRocmVhZHMgY2FuIHVwZGF0ZSB0aGUgbWljcm9jb2RlIGZyb20KPj4+Pj4gaW5zaWRl
IHRoZSBOTUkgaGFuZGxlciBhcyB3ZWxsPwo+Pj4+Cj4+Pj4gTm8gc3BlY2lhbCByZWFzb24uIEJl
Y2F1c2UgdGhlIGlzc3VlIHdlIHdhbnQgdG8gYWRkcmVzcyBpcyB0aGF0IHNsYXZlCj4+Pj4gdGhy
ZWFkcyBtaWdodCBnbyB0byBoYW5kbGUgTk1JIGFuZCBhY2Nlc3MgTVNScyB3aGVuIG1hc3RlciB0
aHJlYWQgaXMKPj4+PiBsb2FkaW5nIHVjb2RlLiBTbyB3ZSBvbmx5IGtlZXAgc2xhdmUgdGhyZWFk
cyBpbiB0aGUgTk1JIGhhbmRsZXIuCj4+Pj4KPj4+Pj4KPj4+Pj4gWW91IG1lbnRpb24gdGhhdCBz
ZWxmLW5taSBpcyBpbnZhbGlkLCBidXQgWGVuIGhhcyBzZWxmX25taSgpIHdoaWNoIGlzCj4+Pj4+
IHVzZWQgZm9yIGFwcGx5X2FsdGVybmF0aXZlcygpIGR1cmluZyBib290LCBzbyBjYW4gYmUgdHJ1
c3RlZCB0byB3b3JrLgo+Pj4+Cj4+Pj4gU29ycnksIEkgbWVhbnQgdXNpbmcgc2VsZiBzaG9ydGhh
bmQgdG8gc2VuZCBzZWxmLW5taS4gSSB0cmllZCB0byB1c2UKPj4+PiBzZWxmIHNob3J0aGFuZCBi
dXQgZ290IEFQSUMgZXJyb3IuIEFuZCBJIGFncmVlIHRoYXQgaXQgaXMgYmV0dGVyIHRvCj4+Pj4g
bWFrZSBzbGF2ZSB0aHJlYWQgY2FsbCBzZWxmX25taSgpIGl0c2VsZi4KPj4+Pgo+Pj4+Pgo+Pj4+
PiBJIGV4cGVyaW1lbnRlZCBhIGJpdCB3aXRoIHRoZSBmb2xsb3dpbmcgYXBwcm9hY2g6IGFmdGVy
IGxvYWRpbmdfc3RhdGUKPj4+Pj4gYmVjb21lcyBMT0FESU5HX0NBTExJTiwgZWFjaCBjcHUgaXNz
dWVzIGEgc2VsZl9ubWkoKSBhbmQgcmVuZGV6dm91cwo+Pj4+PiB2aWEgY3B1X2NhbGxpbl9tYXAg
aW50byBMT0FESU5HX0VOVEVSIHRvIGRvIGEgdWNvZGUgdXBkYXRlIGRpcmVjdGx5IGluCj4+Pj4+
IHRoZSBOTUkgaGFuZGxlci4gQW5kIGl0IHNlZW1zIHRvIHdvcmsuCj4+Pj4+Cj4+Pj4+IFNlcGFy
YXRlIHF1ZXN0aW9uIGlzIGFib3V0IHRoZSBzYWZldHkgb2YgdGhpcyBhcHByb2FjaDogY2FuIHdl
IGJlIHN1cmUKPj4+Pj4gdGhhdCBhIHVjb2RlIHVwZGF0ZSB3b3VsZCBub3QgcmVzZXQgdGhlIHN0
YXR1cyBvZiB0aGUgTk1JIGxhdGNoPyBJLmUuCj4+Pj4+IGNhbiBpdCBjYXVzZSBhbm90aGVyIE5N
SSB0byBiZSBkZWxpdmVyZWQgd2hpbGUgWGVuIGFscmVhZHkgaGFuZGxlcyBvbmU/Cj4+Pj4KPj4+
PiBBc2hvaywgd2hhdCdzIHlvdXIgb3BpbmlvbiBvbiBTZXJnZXkncyBhcHByb2FjaCBhbmQgaGlz
IGNvbmNlcm4/Cj4+PiAKPj4+IEkgdGFsa2VkIHdpdGggQXNob2suIFdlIHRoaW5rIHlvdXIgYXBw
cm9hY2ggaXMgYmV0dGVyLiBJIHdpbGwgZm9sbG93Cj4+PiB5b3VyIGFwcHJvYWNoIGluIHYxMC4g
SXQgd291bGQgYmUgbXVjaCBoZWxwZnVsIGlmIHlvdSBwb3N0IHlvdXIgcGF0Y2gKPj4+IHNvIHRo
YXQgSSBjYW4ganVzdCByZWJhc2UgaXQgb250byBvdGhlciBwYXRjaGVzLgo+Pgo+PkRvaW5nIHRo
ZSBhY3R1YWwgdWNvZGUgdXBkYXRlIGluc2lkZSBhbiBOTUkgaGFuZGxlciBzZWVtcyByYXRoZXIg
cmlza3kKPj50byBtZS4gRXZlbiBpZiBBc2hvayBjb25maXJtZWQgaXQgd291bGQgbm90IGJlIGFu
IGlzc3VlIG9uIHBhc3QgYW5kCj4+Y3VycmVudCBJbnRlbCBDUFVzIC0gd2hhdCBhYm91dCBmdXR1
cmUgb25lcywgb3Igb25lcyBmcm9tIG90aGVyIHZlbmRvcnM/Cj4KCkludGVsIFNETSBkb2Vzbid0
IHNheSB0aGF0IGxvYWRpbmcgdWNvZGUgaXNuJ3QgYWxsb3dlZCBpbnNpZGUgYW4gTk1JCmhhbmRs
ZXIuIFNvIGl0IGlzIGFsbG93ZWQgaW1wbGljaXRseS4gSWYgZnV0dXJlIENQVXMgY2Fubm90IGxv
YWQgdWNvZGUKaW4gTk1JIGhhbmRsZXIsIFNETSBzaG91bGQgZG9jdW1lbnQgaXQgYW5kIGF0IHRo
YXQgdGltZSwgd2UgY2FuIG1vdmUKdWNvZGUgbG9hZGluZyBvdXQgb2YgTk1JIGhhbmRsZXIgZm9y
IG5ldyBDUFVTLiBBcyB0byBBTUQsIGlmIHNvbWVvbmUKb2JqZWN0cyB0byB0aGlzIGFwcHJvYWNo
LCBsZXQncyB1c2UgdGhpcyBhcHByb2FjaCBmb3IgSW50ZWwgb25seS4KClRoYW5rcwpDaGFvCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
