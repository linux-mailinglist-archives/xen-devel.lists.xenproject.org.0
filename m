Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E3014EE02
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 14:57:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixWjz-00073d-KE; Fri, 31 Jan 2020 13:53:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixWjx-00073Y-GX
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 13:53:45 +0000
X-Inumbo-ID: 18186964-4431-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18186964-4431-11ea-ad98-bc764e2007e4;
 Fri, 31 Jan 2020 13:53:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1417DAF32;
 Fri, 31 Jan 2020 13:53:43 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-4-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26802cc1-6d3a-8038-a38b-b7edf2dde3e7@suse.com>
Date: Fri, 31 Jan 2020 14:53:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129202034.15052-4-liuwe@microsoft.com>
Content-Language: en-US
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAyMToyMCwgV2VpIExpdSB3cm90ZToKPiBQdXNoIGh5cGVydmlzb3JfYXBf
c2V0dXAgZG93biB0byBzbXBfY2FsbGluLgo+IAo+IFRha2UgdGhlIGNoYW5jZSB0byByZXBsYWNl
IHhlbl9ndWVzdCB3aXRoIGNwdV9oYXNfaHlwZXJ2aXNvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvc21wYm9v
dC5jIHwgMTAgKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIv
eGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+IGluZGV4IGM5ZDFhYjQ0MjMuLjkzYjg2YTA5ZTkgMTAw
NjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9z
bXBib290LmMKPiBAQCAtMTk5LDYgKzE5OSwxMyBAQCBzdGF0aWMgdm9pZCBzbXBfY2FsbGluKHZv
aWQpCj4gICAgICAgICAgZ290byBoYWx0Owo+ICAgICAgfQo+ICAKPiArICAgIGlmICggY3B1X2hh
c19oeXBlcnZpc29yICYmIChyYyA9IGh5cGVydmlzb3JfYXBfc2V0dXAoKSkgIT0gMCApCj4gKyAg
ICB7Cj4gKyAgICAgICAgcHJpbnRrKCJDUFUlZDogRmFpbGVkIHRvIGluaXRpYWxpc2UgaHlwZXJ2
aXNvciBmdW5jdGlvbnMuIE5vdCBjb21pbmcgb25saW5lLlxuIiwgY3B1KTsKPiArICAgICAgICBj
cHVfZXJyb3IgPSByYzsKPiArICAgICAgICBnb3RvIGhhbHQ7Cj4gKyAgICB9CgpUaGVyZSBhcmUg
YSBmZXcgdGhpbmdzIGRvbmUgdXAgZnJvbSBoZXJlIHdoaWNoIG1heSBwb3NzaWJseQpiZXR0ZXIg
Y29tZSBhZnRlciBoeXBlcnZpc29yIGludGVyZmFjZSBzZXR1cCAodGhlIHR3byBBUElDCnJlbGF0
ZWQgY2FsbHMgaW4gcGFydGljdWxhcikuIEFyZSB5b3Ugc3VyZSB5b3UgY2FuIHNhZmVseQptb3Zl
IGl0IHRoaXMgZmFyIGRvd24gaW4gdGhlIGZ1bmN0aW9uPwoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
