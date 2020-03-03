Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EED6177CAD
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 18:02:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9AtS-0004zE-H9; Tue, 03 Mar 2020 16:59:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9AtR-0004z9-0g
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 16:59:41 +0000
X-Inumbo-ID: 5eab8855-5d70-11ea-a1c8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5eab8855-5d70-11ea-a1c8-12813bfff9fa;
 Tue, 03 Mar 2020 16:59:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 922AFB37D;
 Tue,  3 Mar 2020 16:59:38 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b9398158-4f27-b0e0-f3e3-12eb398dd616@suse.com>
Date: Tue, 3 Mar 2020 17:59:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226124705.29212-5-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 04/12] xen: add basic hypervisor
 filesystem support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMzo0NiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIveGVuL2NvbW1vbi9oeXBmcy5jCj4gQEAgLTAsMCArMSwzNDkgQEAKPiArLyoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKgo+ICsgKgo+ICsgKiBoeXBmcy5jCj4gKyAqCj4gKyAqIFNpbXBsZSBz
eXNmcy1saWtlIGZpbGUgc3lzdGVtIGZvciB0aGUgaHlwZXJ2aXNvci4KPiArICovCj4gKwo+ICsj
aW5jbHVkZSA8eGVuL2Vyci5oPgo+ICsjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPgo+ICsj
aW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPgo+ICsjaW5jbHVkZSA8eGVuL2h5cGZzLmg+Cj4gKyNp
bmNsdWRlIDx4ZW4vbGliLmg+Cj4gKyNpbmNsdWRlIDx4ZW4vcndsb2NrLmg+Cj4gKyNpbmNsdWRl
IDxwdWJsaWMvaHlwZnMuaD4KPiArCj4gKyNpZmRlZiBDT05GSUdfQ09NUEFUCj4gKyNpbmNsdWRl
IDxjb21wYXQvaHlwZnMuaD4KPiArQ0hFQ0tfaHlwZnNfZGlyZW50cnk7Cj4gKyN1bmRlZiBDSEVD
S19oeXBmc19kaXJlbnRyeQo+ICsjZGVmaW5lIENIRUNLX2h5cGZzX2RpcmVudHJ5IHN0cnVjdCB4
ZW5faHlwZnNfZGlyZW50cnkKCkknbSBzdHJ1Z2dsaW5nIHRvIHNlZSB3aHkgeW91IG5lZWQgdGhp
cyAjdW5kZWYgYW5kICNkZWZpbmUuCgo+ICtpbnQgaHlwZnNfd3JpdGVfbGVhZihzdHJ1Y3QgaHlw
ZnNfZW50cnlfbGVhZiAqbGVhZiwKPiArICAgICAgICAgICAgICAgICAgICAgWEVOX0dVRVNUX0hB
TkRMRV9QQVJBTSh2b2lkKSB1YWRkciwgdW5zaWduZWQgbG9uZyB1bGVuKQo+ICt7Cj4gKyAgICBj
aGFyICpidWY7Cj4gKyAgICBpbnQgcmV0Owo+ICsKPiArICAgIGlmICggdWxlbiA+IGxlYWYtPmUu
c2l6ZSApCj4gKyAgICAgICAgcmV0dXJuIC1FTk9TUEM7Cj4gKwo+ICsgICAgaWYgKCBsZWFmLT5l
LnR5cGUgIT0gWEVOX0hZUEZTX1RZUEVfU1RSSU5HICYmCj4gKyAgICAgICAgIGxlYWYtPmUudHlw
ZSAhPSBYRU5fSFlQRlNfVFlQRV9CTE9CICYmIHVsZW4gIT0gbGVhZi0+ZS5zaXplICkKPiArICAg
ICAgICByZXR1cm4gLUVET007CgpXaHkgdGhlIGV4Y2VwdGlvbiBvZiBzdHJpbmcgYW5kIGJsb2I/
IE15IGNvbmNlcm4gYWJvdXQgdGhlCm1lYW5pbmcgb2YgYSBwYXJ0aWFsbHkgd3JpdHRlbiBlbnRy
eSAod2l0aG91dCBpdHMgc2l6ZSBoYXZpbmcKY2hhbmdlZCkgcmVtYWlucy4KCj4gKyAgICBidWYg
PSB4bWFsbG9jX2FycmF5KGNoYXIsIHVsZW4pOwo+ICsgICAgaWYgKCAhYnVmICkKPiArICAgICAg
ICByZXR1cm4gLUVOT01FTTsKPiArCj4gKyAgICByZXQgPSAtRUZBVUxUOwo+ICsgICAgaWYgKCBj
b3B5X2Zyb21fZ3Vlc3QoYnVmLCB1YWRkciwgdWxlbikgKQo+ICsgICAgICAgIGdvdG8gb3V0Owo+
ICsKPiArICAgIHJldCA9IC1FSU5WQUw7Cj4gKyAgICBpZiAoIGxlYWYtPmUudHlwZSA9PSBYRU5f
SFlQRlNfVFlQRV9TVFJJTkcgJiYgIW1lbWNocihidWYsIDAsIHVsZW4pICkKClRoaXMgc2hvdWxk
IGFsc28gdXNlIHRoZSAhPSBidWYgKyB1bGVuIC0gMSBmb3JtIGltby4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
