Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D910297F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 17:36:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX6Qz-0003Jw-08; Tue, 19 Nov 2019 16:32:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=56Vh=ZL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iX6Qx-0003Jr-MD
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 16:32:55 +0000
X-Inumbo-ID: 3c8c4d2c-0aea-11ea-a2ff-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c8c4d2c-0aea-11ea-a2ff-12813bfff9fa;
 Tue, 19 Nov 2019 16:32:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B3B80C0FA;
 Tue, 19 Nov 2019 16:32:53 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191114180542.1016867-1-anthony.perard@citrix.com>
 <d0f286d0-544e-70e2-a298-b37bdd5bf017@suse.com>
Message-ID: <e16dd837-49bc-aad3-6080-35490f46cda4@suse.com>
Date: Tue, 19 Nov 2019 17:32:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d0f286d0-544e-70e2-a298-b37bdd5bf017@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] xen: Fix race to build
 arch/x86/efi/relocs-dummy.o
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTEuMjAxOSAxNzoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTQuMTEuMjAxOSAx
OTowNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IFdpdGggJChUQVJHRVQpLmVmaSBkZXBlbmRp
bmcgb24gZWZpL3JlbG9jcy1kdW1teS5vLCBhcmNoL3g4Ni9NYWtlZmlsZQo+PiB3aWxsIGF0dGVt
cHQgdG8gYnVpbGQgdGhhdCBvYmplY3QuIFRoaXMgcmVzdWx0IGluIHRoZSBkZXBlbmRlbmN5IGZp
bGUKPj4gYmVlbiBnZW5lcmF0ZWQgd2l0aCByZWxvY3MtZHVtbXkubyBkZXBlbmRpbmcgb24gZWZp
L3JlbG9jcy1kdW1teS5vLgo+Pgo+PiBUaGVuLCB3aGVuIGFyY2gveDg2L2VmaS9NYWtlZmlsZSB0
cmllcyB0byBidWlsZCByZWxvY3MtZHVtbXkubywgd2VsbAo+PiBlZmkvcmVsb2NzLWR1bW15LlMg
ZG9lc24ndCBleGlzdC4KPj4KPj4gSGF2ZSBvbmx5IG9uZSBtYWtlZmlsZSByZXNwb25zaWJsZSBm
b3IgYnVpbGRpbmcgcmVsb2NzLWR1bW15Lm8uCj4gCj4gT24gYSBzeXN0ZW0gd2l0aCB0b28gb2xk
IGEgdG9vbCBjaGFpbiBmb3IgdGhlIEVGSSBidWlsZCB0byBnZXQKPiBlbmFibGVkIEkgbm93IGdl
dCBhYm91dCBhIGRvemVuIGluc3RhbmNlcyBwZXIgYnVpbGQgb2YKPiAKPiBubTogJ2VmaS9yZWxv
Y3MtZHVtbXkubyc6IE5vIHN1Y2ggZmlsZQo+IAo+IEkgZG9uJ3Qgc3VwcG9zZSB5b3UgZGlkIHRy
eSBvdXQgeW91ciBjaGFuZ2UgaW4gc3VjaCBhbiBvbGRpc2gKPiBlbnZpcm9ubWVudD8gSSBhc3N1
bWUgdGhlIHByb2JsZW0gYXJlIHRoZXNlIHR3byBsaW5lczoKPiAKPiAkKFRBUkdFVCkuZWZpOiBW
SVJUX0JBU0UgPSAweCQoc2hlbGwgJChOTSkgZWZpL3JlbG9jcy1kdW1teS5vIHwgc2VkIC1uICdz
LCBBIFZJUlRfU1RBUlQkJCwscCcpCj4gJChUQVJHRVQpLmVmaTogQUxUX0JBU0UgPSAweCQoc2hl
bGwgJChOTSkgZWZpL3JlbG9jcy1kdW1teS5vIHwgc2VkIC1uICdzLCBBIEFMVF9TVEFSVCQkLCxw
JykKPiAKPiBJJ20gbm90IHN1cmUgaXQgaXMgd2VsbCBkZWZpbmVkIHdoZW4gbWFrZSB3b3VsZCBl
dmFsdWF0ZSBzdWNoCj4gdGFyZ2V0IHNwZWNpZmljIHZhcmlhYmxlIGFzc2lnbm1lbnRzIChpLmUu
IEknbSBub3Qgc3VyZSB0aGlzCj4gZG9lc24ndCBwb2ludCBvdXQgYW4gaXNzdWUgZXZlbiBvbiBF
RkkgY2FwYWJsZSB0b29sIGNoYWlucykuCj4gVGhlbiBhZ2FpbiB0aGVzZSBub3QgdXNpbmcgOj0g
c2hvdWxkIGNhdXNlIHRoZW0gdG8gZ2V0Cj4gZXZhbHVhdGVkIG9ubHkgdXBvbiB1c2UsIGkuZS4g
bmV2ZXIuCgpBaCwgdGhpcyB3YXMgd3JvbmcgLSB0aGUgJChndWFyZCkgcHJlZml4IGNhdXNlcyB0
aGVtIHRvIGdldApldmFsdWF0ZWQgZXZlbiB3aGVuIHhlbi5lZmkgY2Fubm90IGJlIGJ1aWx0LiBT
byBJIGd1ZXNzIHRoaXMgaXMKanVzdCBhIGNvc21ldGljIGlzc3VlIHRoZW4sIHdoaWNoIHdvdWxk
IGhvd2V2ZXIgc3RpbGwgYmUgbmljZQp0byBzZWUgYWRkcmVzc2VkLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
