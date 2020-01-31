Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D3514EE37
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 15:12:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixWzn-0000HF-R1; Fri, 31 Jan 2020 14:10:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixWzm-000082-G6
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 14:10:06 +0000
X-Inumbo-ID: 6188a8dc-4433-11ea-8bce-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6188a8dc-4433-11ea-8bce-12813bfff9fa;
 Fri, 31 Jan 2020 14:10:06 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixWzk-0003oS-HN; Fri, 31 Jan 2020 14:10:04 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixWzk-0006qQ-7O; Fri, 31 Jan 2020 14:10:04 +0000
Date: Fri, 31 Jan 2020 14:10:01 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200131141001.ysx67kpxsh2zftuz@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-4-liuwe@microsoft.com>
 <26802cc1-6d3a-8038-a38b-b7edf2dde3e7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26802cc1-6d3a-8038-a38b-b7edf2dde3e7@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 03/12] x86/smp: don't online cpu if
 hypervisor_ap_setup fails
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDI6NTM6NDVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjkuMDEuMjAyMCAyMToyMCwgV2VpIExpdSB3cm90ZToKPiA+IFB1c2ggaHlwZXJ2
aXNvcl9hcF9zZXR1cCBkb3duIHRvIHNtcF9jYWxsaW4uCj4gPiAKPiA+IFRha2UgdGhlIGNoYW5j
ZSB0byByZXBsYWNlIHhlbl9ndWVzdCB3aXRoIGNwdV9oYXNfaHlwZXJ2aXNvci4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiA+IC0tLQo+ID4g
IHhlbi9hcmNoL3g4Ni9zbXBib290LmMgfCAxMCArKysrKysrLS0tCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4gPiBpbmRl
eCBjOWQxYWI0NDIzLi45M2I4NmEwOWU5IDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3Nt
cGJvb3QuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+ID4gQEAgLTE5OSw2ICsx
OTksMTMgQEAgc3RhdGljIHZvaWQgc21wX2NhbGxpbih2b2lkKQo+ID4gICAgICAgICAgZ290byBo
YWx0Owo+ID4gICAgICB9Cj4gPiAgCj4gPiArICAgIGlmICggY3B1X2hhc19oeXBlcnZpc29yICYm
IChyYyA9IGh5cGVydmlzb3JfYXBfc2V0dXAoKSkgIT0gMCApCj4gPiArICAgIHsKPiA+ICsgICAg
ICAgIHByaW50aygiQ1BVJWQ6IEZhaWxlZCB0byBpbml0aWFsaXNlIGh5cGVydmlzb3IgZnVuY3Rp
b25zLiBOb3QgY29taW5nIG9ubGluZS5cbiIsIGNwdSk7Cj4gPiArICAgICAgICBjcHVfZXJyb3Ig
PSByYzsKPiA+ICsgICAgICAgIGdvdG8gaGFsdDsKPiA+ICsgICAgfQo+IAo+IFRoZXJlIGFyZSBh
IGZldyB0aGluZ3MgZG9uZSB1cCBmcm9tIGhlcmUgd2hpY2ggbWF5IHBvc3NpYmx5Cj4gYmV0dGVy
IGNvbWUgYWZ0ZXIgaHlwZXJ2aXNvciBpbnRlcmZhY2Ugc2V0dXAgKHRoZSB0d28gQVBJQwo+IHJl
bGF0ZWQgY2FsbHMgaW4gcGFydGljdWxhcikuIEFyZSB5b3Ugc3VyZSB5b3UgY2FuIHNhZmVseQo+
IG1vdmUgaXQgdGhpcyBmYXIgZG93biBpbiB0aGUgZnVuY3Rpb24/CgpYZW4gZ3Vlc3QncyB1c2Fn
ZSBvZiBBUElDIGlzIG5vIGRpZmZlcmVudCB0aGFuLCBzYXksIGh2bSdzIHVzYWdlLiBJZiBodm0K
Y2FuIGJlIHRoaXMgZmFyIGRvd24sIFhlbiAvIEh5cGVyLVYgY2FuLCB0b28uCgpGdXJ0aGVybW9y
ZSwgQVBJQyBjb2RlIGhhcyBubyBkZXBlbmRlbmN5IG9uIGd1ZXN0IGNvZGUuCgpXZWkuCgo+IAo+
IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
