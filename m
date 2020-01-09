Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F591350E6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 02:12:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipMJf-0002B9-1X; Thu, 09 Jan 2020 01:08:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=noqg=26=intel.com=tao3.xu@srs-us1.protection.inumbo.net>)
 id 1ipMJd-0002B4-2w
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 01:08:49 +0000
X-Inumbo-ID: 909b0b2e-327c-11ea-b1f0-bc764e2007e4
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 909b0b2e-327c-11ea-b1f0-bc764e2007e4;
 Thu, 09 Jan 2020 01:08:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 17:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,412,1571727600"; d="scan'208";a="371163056"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.197.127])
 ([10.239.197.127])
 by orsmga004.jf.intel.com with ESMTP; 08 Jan 2020 17:08:35 -0800
To: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200108143439.25580-1-jgross@suse.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <3876154c-aadf-3a39-8e55-0667a2e59f37@intel.com>
Date: Thu, 9 Jan 2020 09:08:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108143439.25580-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: clear per cpu stub page
 information in cpu_smpboot_free()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmsgeW91IEp1ZXJnZW4uIFRoaXMgcGF0Y2ggZml4IHRoZSBpc3N1ZSBpbgoKWEVOIGNyYXNo
IGFuZCBkb3VibGUgZmF1bHQgd2hlbiBkb2luZyBjcHUgb25saW5lL29mZmxpbmUKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTAxL21zZzAw
NDI0Lmh0bWwKClRlc3RlZC1ieTogVGFvIFh1IDx0YW8zLnh1QGludGVsLmNvbT4KCk9uIDEvOC8y
MDIwIDEwOjM0IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IGNwdV9zbXBib290X2ZyZWUoKSBy
ZW1vdmVzIHRoZSBzdHVicyBmb3IgdGhlIGNwdSBnb2luZyBvZmZsaW5lLCBidXQgaXQKPiBpc24n
dCBjbGVhcmluZyB0aGUgcmVsYXRlZCBwZXJjcHUgdmFyaWFibGVzLiBUaGlzIHdpbGwgcmVzdWx0
IGluCj4gY3Jhc2hlcyB3aGVuIGEgc3R1YiBwYWdlIGlzIHJlbGVhc2VkIGR1ZSB0byBhbGwgcmVs
YXRlZCBjcHVzIGdvbmUKPiBvZmZsaW5lIGFuZCBvbmUgb2YgdGhvc2UgY3B1cyBnb2luZyBvbmxp
bmUgbGF0ZXIuCj4gCj4gRml4IHRoYXQgYnkgY2xlYXJpbmcgc3R1YnMuYWRkciBhbmQgc3R1YnMu
bWZuIGluIG9yZGVyIHRvIGFsbG9jYXRlIGEKPiBuZXcgc3R1YiBwYWdlIHdoZW4gbmVlZGVkLgo+
IAo+IEZpeGVzOiAyZTZjOGYxODJjOWM1MCAoIng4NjogZGlzdGluZ3Vpc2ggQ1BVIG9mZmxpbmlu
ZyBmcm9tIENQVSByZW1vdmFsIikKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gLS0tCj4g
ICB4ZW4vYXJjaC94ODYvc21wYm9vdC5jIHwgMiArKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVu
L2FyY2gveDg2L3NtcGJvb3QuYwo+IGluZGV4IDdlMjk3MDQwODAuLjQ2YzA3MjkyMTQgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zbXBi
b290LmMKPiBAQCAtOTQ1LDYgKzk0NSw4IEBAIHN0YXRpYyB2b2lkIGNwdV9zbXBib290X2ZyZWUo
dW5zaWduZWQgaW50IGNwdSwgYm9vbCByZW1vdmUpCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIChwZXJfY3B1KHN0dWJzLmFkZHIsIGNwdSkgfCB+UEFHRV9NQVNLKSArIDEpOwo+ICAg
ICAgICAgICBpZiAoIGkgPT0gU1RVQlNfUEVSX1BBR0UgKQo+ICAgICAgICAgICAgICAgZnJlZV9k
b21oZWFwX3BhZ2UobWZuX3RvX3BhZ2UobWZuKSk7Cj4gKyAgICAgICAgcGVyX2NwdShzdHVicy5h
ZGRyLCBjcHUpID0gMDsKPiArICAgICAgICBwZXJfY3B1KHN0dWJzLm1mbiwgY3B1KSA9IDA7Cj4g
ICAgICAgfQo+IAo+ICAgICAgIEZSRUVfWEVOSEVBUF9QQUdFKHBlcl9jcHUoY29tcGF0X2dkdCwg
Y3B1KSk7Cj4gLS0KPiAyLjE2LjQKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVsCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
