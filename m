Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E91EAE78
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 12:09:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ8IU-0000eg-Ja; Thu, 31 Oct 2019 11:07:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I6hz=YY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iQ8IS-0000eb-TT
 for xen-devel@lists.xen.org; Thu, 31 Oct 2019 11:07:20 +0000
X-Inumbo-ID: 9ae9e166-fbce-11e9-a531-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ae9e166-fbce-11e9-a531-bc764e2007e4;
 Thu, 31 Oct 2019 11:07:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B68B7B3B1;
 Thu, 31 Oct 2019 11:07:18 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191031105609.21819-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <932471f8-fbe3-de7b-f005-d7e036f2c936@suse.com>
Date: Thu, 31 Oct 2019 12:07:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031105609.21819-1-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 for 4.13] x86/e820: fix 640k - 1M region
 reservation logic
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
Cc: Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTAuMjAxOSAxMTo1NiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvY3B1L2NvbW1vbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwo+IEBA
IC0yNzQsNiArMjc0LDE1IEBAIHN0YXRpYyBpbmxpbmUgdTMyIHBoeXNfcGtnX2lkKHUzMiBjcHVp
ZF9hcGljLCBpbnQgaW5kZXhfbXNiKQo+ICAJcmV0dXJuIF9waHlzX3BrZ19pZChnZXRfYXBpY19p
ZCgpLCBpbmRleF9tc2IpOwo+ICB9Cj4gIAo+ICsvKgo+ICsgKiBTb21ldGltZXMgaXQncyB0b28g
ZWFybHkgdG8gdXNlIGNwdV9oYXNfaHlwZXJ2aXNvciB3aGljaCBpcyBhdmFpbGFibGUgb25seQo+
ICsgKiBhZnRlciBlYXJseV9jcHVfaW5pdCgpLgo+ICsgKi8KPiArYm9vbCBfX2luaXQgZWFybHlf
Y3B1X2hhc19oeXBlcnZpc29yKHZvaWQpCj4gK3sKPiArCXJldHVybiBjcHVpZF9lY3goMSkgJiBj
cHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfSFlQRVJWSVNPUik7Cj4gK30KCk9PSSwgZGlkIHlvdSBj
b25zaWRlciBpbnRyb2R1Y2luZyBhIG1vcmUgZ2VuZXJhbCBlYXJseV9jcHVfaGFzKCksCndpdGgg
WDg2X0ZFQVRVUkVfKiBwYXNzZWQgYXMgYW4gYXJndW1lbnQ/Cgo+IEBAIC0zMTgsOSArMzE5LDEw
IEBAIHN0YXRpYyBpbnQgX19pbml0IGNvcHlfZTgyMF9tYXAoc3RydWN0IGU4MjBlbnRyeSAqIGJp
b3NtYXAsIHVuc2lnbmVkIGludCBucl9tYXApCj4gIAo+ICAgICAgICAgIC8qCj4gICAgICAgICAg
ICogU29tZSBCSU9TZXMgY2xhaW0gUkFNIGluIHRoZSA2NDBrIC0gMU0gcmVnaW9uLgo+IC0gICAg
ICAgICAqIE5vdCByaWdodC4gRml4IGl0IHVwLgo+ICsgICAgICAgICAqIE5vdCByaWdodC4gRml4
IGl0IHVwLCBidXQgb25seSB3aGVuIHJ1bm5pbmcgb24gYmFyZSBtZXRhbC4KPiAgICAgICAgICAg
Ki8KPiAtICAgICAgICBpZiAodHlwZSA9PSBFODIwX1JBTSkgewo+ICsgICAgICAgIGlmICggIWVh
cmx5X2NwdV9oYXNfaHlwZXJ2aXNvcigpICYmIHR5cGUgPT0gRTgyMF9SQU0gKQo+ICsgICAgICAg
IHsKPiAgICAgICAgICAgICAgaWYgKHN0YXJ0IDwgMHgxMDAwMDBVTEwgJiYgZW5kID4gMHhBMDAw
MFVMTCkgewo+ICAgICAgICAgICAgICAgICAgaWYgKHN0YXJ0IDwgMHhBMDAwMFVMTCkKPiAgICAg
ICAgICAgICAgICAgICAgICBhZGRfbWVtb3J5X3JlZ2lvbihzdGFydCwgMHhBMDAwMFVMTC1zdGFy
dCwgdHlwZSk7CgpTZWVpbmcgb3JpZ2luYWwgbGluZSBhbmQgbG93ZXIgY29udGV4dCAtIGFyZW4n
dCB5b3UgY29ycnVwdGluZwpwcmV2aW91c2x5IHJlYXNvbmFibHkgY29uc2lzdGVudCAoTGludXgp
IHN0eWxlIGhlcmU/IChUaGlzIGNvdWxkCmJlIGVhc2lseSB0YWtlbiBjYXJlIG9mIHdoaWxlIGNv
bW1pdHRpbmcsIGJ1dCBJJ2QgZmlyc3QgbGlrZSB0aGUKcG9pbnQgYmVsb3cgYmUgY2xhcmlmaWVk
LikKCj4gLS0tIGEveGVuL2FyY2gveDg2L21tLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+
IEBAIC01OTQzLDcgKzU5NDMsNyBAQCBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fYmFkX3BhZ2UgKl9f
aW5pdCBnZXRfcGxhdGZvcm1fYmFkcGFnZXModW5zaWduZWQgaW50ICphcnJheQo+ICAgICAgY2Fz
ZSAweDAwMDgwNmUwOiAvKiBlcnJhdHVtIEtCTD8/PyAqLwo+ICAgICAgY2FzZSAweDAwMDkwNmUw
OiAvKiBlcnJhdGEgS0JMPz8/IC8gS0JXMTE0IC8gQ0ZXMTAzICovCj4gICAgICAgICAgKmFycmF5
X3NpemUgPSAoY3B1aWRfZWF4KDApID49IDcgJiYKPiAtICAgICAgICAgICAgICAgICAgICAgICAh
KGNwdWlkX2VjeCgxKSAmIGNwdWZlYXRfbWFzayhYODZfRkVBVFVSRV9IWVBFUlZJU09SKSkgJiYK
PiArICAgICAgICAgICAgICAgICAgICAgICAhZWFybHlfY3B1X2hhc19oeXBlcnZpc29yKCkgJiYK
ClN0cmljdGx5IHNwZWFraW5nIHRoaXMgbWFrZXMgY2xlYXIgdGhhdCBpbiBlYXJseV9jcHVfaGFz
X2h5cGVydmlzb3IoKQp5b3Ugc2hvdWxkIGFsc28gY2hlY2sgY3B1aWRfZWF4KDApID49IDEuIFdl
IGRvbid0IGN1cnJlbnRseSBzZWVtIHRvCm9iamVjdCB0byBydW5uaW5nIG9uIGEgc3lzdGVtIHdp
dGggb25seSBiYXNpYyBsZWFmIDAgYXZhaWxhYmxlICh3ZQpkbyBvYmplY3QgdG8gdGhlcmUgbm90
IGJlaW5nIGV4dGVuZGVkIGxlYWYgMSkuIEFuZHJldywgZG8geW91IGhhdmUKYW55IGNsZWFyIG9w
aW5pb24gb25lIHdheSBvciB0aGUgb3RoZXI/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
