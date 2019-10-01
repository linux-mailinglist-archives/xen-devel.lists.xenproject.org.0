Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A55C2EF5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 10:36:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFDcG-0008TH-HZ; Tue, 01 Oct 2019 08:34:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFDcE-0008TC-Ba
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 08:34:38 +0000
X-Inumbo-ID: 4d8d1f9c-e426-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4d8d1f9c-e426-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 08:34:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F6FFAF27;
 Tue,  1 Oct 2019 08:34:36 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20191001082534.12067-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8ff366c-dd2c-b4b3-1832-8b93d11d1181@suse.com>
Date: Tue, 1 Oct 2019 10:34:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001082534.12067-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/efi: have a common runtime setup
 function
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxMDoyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBAQCAtMjgxLDQgKzI3
MCwyNiBAQCB2b2lkIHhlbl9lZmlfcmVzZXRfc3lzdGVtKGludCByZXNldF90eXBlLCBlZmlfc3Rh
dHVzX3Qgc3RhdHVzLAo+ICAJCUJVRygpOwo+ICAJfQo+ICB9Cj4gLUVYUE9SVF9TWU1CT0xfR1BM
KHhlbl9lZmlfcmVzZXRfc3lzdGVtKTsKPiArCj4gKy8qCj4gKyAqIFNldCBYRU4gRUZJIHJ1bnRp
bWUgc2VydmljZXMgZnVuY3Rpb24gcG9pbnRlcnMuIE90aGVyIGZpZWxkcyBvZiBzdHJ1Y3QgZWZp
LAo+ICsgKiBlLmcuIGVmaS5zeXN0YWIsIHdpbGwgYmUgc2V0IGxpa2Ugbm9ybWFsIEVGSS4KPiAr
ICovCj4gK3ZvaWQgX19pbml0IHhlbl9lZmlfcnVudGltZV9zZXR1cCh2b2lkKQo+ICt7Cj4gKwll
ZmkuZ2V0X3RpbWUJCQk9IHhlbl9lZmlfZ2V0X3RpbWU7Cj4gKwllZmkuc2V0X3RpbWUJCQk9IHhl
bl9lZmlfc2V0X3RpbWU7Cj4gKwllZmkuZ2V0X3dha2V1cF90aW1lCQk9IHhlbl9lZmlfZ2V0X3dh
a2V1cF90aW1lOwo+ICsJZWZpLnNldF93YWtldXBfdGltZQkJPSB4ZW5fZWZpX3NldF93YWtldXBf
dGltZTsKPiArCWVmaS5nZXRfdmFyaWFibGUJCT0geGVuX2VmaV9nZXRfdmFyaWFibGU7Cj4gKwll
ZmkuZ2V0X25leHRfdmFyaWFibGUJCT0geGVuX2VmaV9nZXRfbmV4dF92YXJpYWJsZTsKPiArCWVm
aS5zZXRfdmFyaWFibGUJCT0geGVuX2VmaV9zZXRfdmFyaWFibGU7Cj4gKwllZmkuc2V0X3Zhcmlh
YmxlX25vbmJsb2NraW5nCT0geGVuX2VmaV9zZXRfdmFyaWFibGU7Cj4gKwllZmkucXVlcnlfdmFy
aWFibGVfaW5mbwkJPSB4ZW5fZWZpX3F1ZXJ5X3ZhcmlhYmxlX2luZm87Cj4gKwllZmkucXVlcnlf
dmFyaWFibGVfaW5mb19ub25ibG9ja2luZyA9IHhlbl9lZmlfcXVlcnlfdmFyaWFibGVfaW5mbzsK
PiArCWVmaS51cGRhdGVfY2Fwc3VsZQkJPSB4ZW5fZWZpX3VwZGF0ZV9jYXBzdWxlOwo+ICsJZWZp
LnF1ZXJ5X2NhcHN1bGVfY2FwcwkJPSB4ZW5fZWZpX3F1ZXJ5X2NhcHN1bGVfY2FwczsKPiArCWVm
aS5nZXRfbmV4dF9oaWdoX21vbm9fY291bnQJPSB4ZW5fZWZpX2dldF9uZXh0X2hpZ2hfbW9ub19j
b3VudDsKPiArCWVmaS5yZXNldF9zeXN0ZW0JCT0geGVuX2VmaV9yZXNldF9zeXN0ZW07Cj4gK30K
PiArRVhQT1JUX1NZTUJPTF9HUEwoeGVuX2VmaV9ydW50aW1lX3NldHVwKTsKCkkgZG9uJ3QgdGhp
bmsgZXhwb3J0aW5nIGFuIF9faW5pdCBmdW5jdGlvbiBpcyBhIGdvb2QgaWRlYSwgYW5kIEkgYWxz
bwpkb24ndCBzZWUgd2h5IHRoZSBmdW5jdGlvbiB3b3VsZCBuZWVkIGV4cG9ydGluZyBoYWQgaXQg
aGFkIHRoZSBfX2luaXQKZHJvcHBlZC4gV2l0aCB0aGUgbGluZSBkcm9wcGVkClJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
