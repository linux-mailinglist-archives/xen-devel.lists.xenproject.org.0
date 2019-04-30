Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD42FDB7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 18:21:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLVU8-0000bY-BU; Tue, 30 Apr 2019 16:20:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vTsw=TA=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hLVU6-0000al-O8
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 16:19:58 +0000
X-Inumbo-ID: cacbbb61-6b63-11e9-843c-bc764e045a96
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cacbbb61-6b63-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 16:19:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 09:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,414,1549958400"; d="scan'208";a="166319105"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2019 09:19:55 -0700
Date: Wed, 1 May 2019 00:24:09 +0800
From: Chao Gao <chao.gao@intel.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190430162407.GA20660@gao-cwp>
References: <1556601559-30921-1-git-send-email-chao.gao@intel.com>
 <20190430090854.5vgvu4invvuzgci6@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430090854.5vgvu4invvuzgci6@Air-de-Roger>
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMTE6MDg6NTRBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPk9uIFR1ZSwgQXByIDMwLCAyMDE5IGF0IDAxOjE5OjE5UE0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+PiBXaGVuIHRlc3Rpbmcgd2l0aCBhbiBVUCBndWVzdCB3aXRoIGEgcGFzcy10
aHJ1IGRldmljZSB3aXRoIHZ0LWQgcGkKPj4gZW5hYmxlZCBpbiBob3N0LCB3ZSBvYnNlcnZlZCB0
aGF0IGd1ZXN0IGNvdWxkbid0IHJlY2VpdmUgaW50ZXJydXB0cwo+PiBmcm9tIHRoYXQgcGFzcy10
aHJ1IGRldmljZS4gRHVtcGluZyBJUlRFLCB3ZSBmb3VuZCB0aGUgY29ycmVzcG9uZGluZwo+PiBJ
UlRFIGlzIHNldCB0byBwb3N0ZWQgZm9ybWF0IHdpdGggInZlY3RvciIgZmllbGQgYXMgMC4KPj4g
Cj4+IFdlIHdvdWxkIGZhbGwgaW50byB0aGlzIGlzc3VlIHdoZW4gZ3Vlc3QgdXNlZCB0aGUgcGly
cSBmb3JtYXQgb2YgTVNJCj4KPkkgdGhpbmsgdGhlIGFib3ZlIHNlbnRlbmNlIGlzIGEgYml0IGNv
bmZ1c2luZy4gSSB3b3VsZCByYXRoZXIgc2F5IHRoYXQKPnRoZSBndWVzdCBpcyByb3V0aW5nIGlu
dGVycnVwdHMgZnJvbSBwYXNzdGhyb3VnaCBkZXZpY2VzIG92ZXIgZXZlbnQKPmNoYW5uZWxzIHVz
aW5nIHBpcnFzLgoKWWVzLiBJdCBpcyBiZXR0ZXIgdGhhbiBpdCB3YXMuCgo+Cj4+IChzZWUgdGhl
IGNvbW1lbnQgeGVuX21zaV9jb21wb3NlX21zZygpIGluIGxpbnV4IGtlcm5lbCkuIEFzICdkZXN0
X2lkJwo+PiBpcyByZXB1cnBvc2VkLCBza2lwIG1pZ3JhdGlvbiB3aGljaCBpcyBiYXNlZCBvbiAn
ZGVzdF9pZCcuCj4KPkxpa2UgSmFuLCBJIHdvbmRlciB3aHkgdGhlIGRldmljZSBtb2RlbCAoSSBh
c3N1bWUgUUVNVSkgaXNzdWVzIGEKPlhFTl9ET01DVExfYmluZF9wdF9pcnEgaHlwZXJjYWxsIHdo
ZW4gdGhlIGd1ZXN0IGlzIGF0dGVtcHRpbmcgdG8gcm91dGUKPnRoaXMgaW50ZXJydXB0cyBvdmVy
IGFuIGV2ZW50IGNoYW5uZWwsIGF0dGVtcHRpbmcgdG8gYmluZCBpdCB0byBhCj52ZWN0b3Igc2Vl
bXMgbGlrZSBhIGJ1ZyBpbiB0aGUgZGV2aWNlIG1vZGVsLgo+Cj5JIHdvdWxkIGFsc28gY29uc2lk
ZXIgd2hldGhlciBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIG5vdCBleHBvc2UgdGhlCj5YRU5GRUFU
X2h2bV9waXJxcyBmZWF0dXJlIHdoZW4gZG9pbmcgcGFzc3Rocm91Z2ggaWYgcG9zdGVkIGludGVy
cnVwdHMKPmFyZSBzdXBwb3J0ZWQsIHBlcmZvcm1hbmNlIHdpc2UgaXQncyBiZXR0ZXIgdG8gdXNl
IHBvc3RlZCBpbnRlcnJ1cHRzCj5yYXRoZXIgdGhhbiByb3V0aW5nIHRoZW0gb3ZlciBldmVudCBj
aGFubmVscyAod2hpY2ggcmVxdWlyZXMgWGVuCj5pbnRlcmFjdGlvbikuCgpJdCBpcyByZWFzb25h
YmxlLiBCdXQgSSB0aGluayBjdXJyZW50bHkgZ3Vlc3QgY2FuIGFkZCAieGVuX25vcHYiIHRvIGl0
cwprZXJuZWwgYm9vdCBvcHRpb25zIHRvIGF2b2lkIHVzaW5nIGV2dGNobi4gVGhlcmUgbWlnaHQg
YmUgc29tZSBjYXNlcwpldmVuIHdpdGggcGFzcy10aHJ1IGRldmljZXMgKHN1Y2ggYXMsIGd1ZXN0
IHVzZXMgcG9sbGluZyBtb2RlCmRyaXZlciBmb3IgcGFzcy10aHJ1IGRldmljZXMpLCB3ZSBjYXJl
IG1vcmUgYWJvdXQgdGhlIGVmZmljaWVuY3kgb2YKZGVsaXZlcmluZyB2aXJ0dWFsIGludGVycnVw
dHMuIFNvIGEgc2VwYXJhdGUgb3B0aW9uIGZvciBldnRjaG4gaW4gZ3Vlc3QKa2VybmVsIHNlZW1z
IGxpa2UgYSBiZXR0ZXIgY2hvaWNlLgoKVGhhbmtzCkNoYW8KCj4KPk5vdGUgdGhhdCBJIHRoaW5r
IHRoaXMgd2hvbGUgWEVORkVBVF9odm1fcGlycXMgaXMgYSBiaWcgaGFjayB3aGljaAo+YWJ1c2Vz
IGEgaGFyZHdhcmUgaW50ZXJmYWNlLCBhbmQgSSB3b3VsZCBsaWtlIHRvIHNlZSBpdCByZW1vdmVk
Lgo+Cj5UaGFua3MsIFJvZ2VyLgo+Cj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+WGVuLWRldmVsIG1haWxpbmcgbGlzdAo+WGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCj5odHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
