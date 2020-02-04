Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46911519CE
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 12:22:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iywG3-0003JF-IO; Tue, 04 Feb 2020 11:20:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2C6S=3Y=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iywG2-0003J9-NW
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 11:20:42 +0000
X-Inumbo-ID: 6101cd84-4740-11ea-8396-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6101cd84-4740-11ea-8396-bc764e2007e4;
 Tue, 04 Feb 2020 11:20:42 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iywG1-0005hg-BY; Tue, 04 Feb 2020 11:20:41 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iywG1-0003vp-1z; Tue, 04 Feb 2020 11:20:41 +0000
Date: Tue, 4 Feb 2020 11:20:38 +0000
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Message-ID: <20200204112038.ad5xvu3zxffokj5w@debian>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-3-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200131174930.31045-3-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v6 02/11] x86/smp: don't online cpu if
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
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDU6NDk6MjFQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBQdXNoIGh5cGVydmlzb3JfYXBfc2V0dXAgZG93biB0byBzbXBfY2FsbGluLgo+IAo+IFRha2Ug
dGhlIGNoYW5jZSB0byByZXBsYWNlIHhlbl9ndWVzdCB3aXRoIGNwdV9oYXNfaHlwZXJ2aXNvci4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IFJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94
ODYvc21wYm9vdC5jIHwgMTAgKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21w
Ym9vdC5jIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+IGluZGV4IGM5ZDFhYjQ0MjMuLjkzYjg2
YTA5ZTkgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9zbXBib290LmMKPiBAQCAtMTk5LDYgKzE5OSwxMyBAQCBzdGF0aWMgdm9pZCBzbXBf
Y2FsbGluKHZvaWQpCj4gICAgICAgICAgZ290byBoYWx0Owo+ICAgICAgfQo+ICAKPiArICAgIGlm
ICggY3B1X2hhc19oeXBlcnZpc29yICYmIChyYyA9IGh5cGVydmlzb3JfYXBfc2V0dXAoKSkgIT0g
MCApCgpJbiBsaWdodCBvZiBhIGNvbW1lbnQgbWFkZSBieSBSb2dlciB5ZXN0ZXJkYXksIHdpdGgg
dGhpcyBjaGFuZ2UgdGhlCkFTU0VSVF9VTlJFQUNIQUJMRSBpbiBoeXBlcnZpc29yX2FwX3NldHVw
KCkgc3R1YiBzaG91bGQgYmUgZHJvcHBlZCwgdG8KZGVhbCB3aXRoIFhlbiBydW5uaW5nIG9uIGEg
aHlwZXJ2aXNvciB3aXRoICFDT05GSUdfR1VFU1QuCgpJIGhhdmUgZm9sZGVkIGluIHRoZSBmb2xs
b3dpbmcgZGlmZjoKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
dmlzb3IuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCmluZGV4IGI1
MDM4NTRjNWIuLjY0MzgzZjBjM2QgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vl
c3QvaHlwZXJ2aXNvci5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNv
ci5oCkBAIC00NCw3ICs0NCw3IEBAIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCk7Cgogc3Rh
dGljIGlubGluZSBjb25zdCBjaGFyICpoeXBlcnZpc29yX3Byb2JlKHZvaWQpIHsgcmV0dXJuIE5V
TEw7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpIHsgQVNTRVJU
X1VOUkVBQ0hBQkxFKCk7IH0KLXN0YXRpYyBpbmxpbmUgaW50IGh5cGVydmlzb3JfYXBfc2V0dXAo
dm9pZCkgeyBBU1NFUlRfVU5SRUFDSEFCTEUoKTsgcmV0dXJuIDA7IH0KK3N0YXRpYyBpbmxpbmUg
aW50IGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkgeyByZXR1cm4gMDsgfQogc3RhdGljIGlubGlu
ZSB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpIHsgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IH0K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
