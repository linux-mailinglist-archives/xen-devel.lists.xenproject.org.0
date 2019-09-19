Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51A0B765D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 11:33:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAsmd-0001Zm-6y; Thu, 19 Sep 2019 09:31:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAsmb-0001ZU-TG
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 09:31:25 +0000
X-Inumbo-ID: 3eb2141a-dac0-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3eb2141a-dac0-11e9-a337-bc764e2007e4;
 Thu, 19 Sep 2019 09:31:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 985F6BD97;
 Thu, 19 Sep 2019 09:31:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
 <f075274c-46ed-bedd-9a0f-3ab157544cb1@suse.com>
 <16d3de95-bcb3-87c3-dec2-f436a17e4b29@citrix.com>
 <902700ef-3405-ecfd-45ba-fd0d6f63ac4d@suse.com>
 <3f304d31-5047-b4ec-83f1-aa1a65e341fc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <39e9ad3d-e3b0-e5c3-f115-33af4e2ee688@suse.com>
Date: Thu, 19 Sep 2019 11:31:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3f304d31-5047-b4ec-83f1-aa1a65e341fc@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86emul: adjust MOVSXD source operand
 handling
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDkuMjAxOSAyMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOC8wOS8yMDE5
IDA3OjM0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTcuMDkuMjAxOSAxOToxNywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDE2LzA5LzIwMTkgMTA6NDgsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IFhFRCBjb21taXQgMWIyZmQ5NDQyNSAoIlVwZGF0ZSBNT1ZTWEQgdG8gbW9kZXJuIGJl
aGF2aW9yIikgcG9pbnRzIG91dAo+Pj4+IHRoYXQgYXMgb2YgU0RNIHJldiAwNjQgTU9WU1hEIGlz
IHNwZWNpZmllZCB0byByZWFkIG9ubHkgMTYgYml0cyBmcm9tCj4+Pj4gbWVtb3J5IChvciByZWdp
c3Rlcikgd2hlbiB1c2VkIHdpdGhvdXQgUkVYLlcgYW5kIHdpdGggb3BlcmFuZCBzaXplCj4+Pj4g
b3ZlcnJpZGUuIFNpbmNlIHRoZSB1cHBlciAxNiBiaXRzIG9mIHRoZSB2YWx1ZSByZWFkIHdvbid0
IGJlIHVzZWQKPj4+PiBhbnl3YXkgaW4gdGhpcyBjYXNlLCBtYWtlIHRoZSBlbXVsYXRpb24gdW5p
Zm9ybWx5IGZvbGxvdyB0aGlzIG1vcmUKPj4+PiBjb21wYXRpYmxlIGJlaGF2aW9yIHdoZW4gbm90
IGVtdWxhdGluZyBhbiBBTUQtbGlrZSBDUFUsIGF0IHRoZSByaXNrCj4+Pj4gb2YgbWlzc2luZyBh
biBleGNlcHRpb24gd2hlbiBlbXVsYXRpbmcgb24vZm9yIG9sZGVyIGhhcmR3YXJlICh0aGUKPj4+
PiBib3VuZGFyeSBhdCBTYW5keUJyaWRnZSBub3RlZCBpbiBzYWlkIGNvbW1pdCBsb29rcyBxdWVz
dGlvbmFibGUgLSBJJ3ZlCj4+Pj4gb2JzZXJ2ZWQgdGhlICJuZXciIGJlaGF2aW9yIGFsc28gb24g
V2VzdG1lcmUpLgo+Pj4gQU1EIGRvY3VtZW50cyB0aGlzIGluc3RydWN0aW9uIGhhcyBhbHdheXMg
dXNpbmcgYW4gOCBvciAxNmJpdCBzb3VyY2UKPj4+IG9wZXJhbmQuCj4+IEhhdmUgeW91IG1peGVk
IHVwIE1PVlNYIHdpdGggTU9WU1hEPyBCb3RoIGhhdmUgc2VwYXJhdGUgcGFnZXMgaW4KPj4gQU1E
J3MgZG9jLCBidXQgYSBjb21tb24gcGFnZSBpbiBJbnRlbCdzLgo+IAo+IEkgaGFkIGNvbmZ1c2Vk
IHRoZSB0d28sIHllcy4KPiAKPiBJIGNvbnN0cnVjdGVkIGFuIGV4cGVyaW1lbnQgdXNpbmcgNjYg
NmUgMDgsIGkuZS4KPiAKPiBtb3ZzbHEgKCVyYXgpLCVjeAo+IAo+IGFjY29yZGluZyB0byBvYmpk
dW1wLCBhbmQgaXRlcmF0aW5nIGJhY2t3YXJkcyBvdmVyIHRoZSBib3VuZGFyeSB0byB0aGUKPiB1
bm1hcHBlZCBwYWdlIGF0IDAuCj4gCj4gT24gYSBSb21lIHN5c3RlbToKPiAKPiAoZDI0KSBQdHI6
IDAwMDAwMDAwMDAwMDEwMDAKPiAoZDI0KcKgID0+IGMyYzIKPiAoZDI0KSBQdHI6IDAwMDAwMDAw
MDAwMDBmZmYKPiAoZDI0KSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiAoZDI0KSBQ
QU5JQzogVW5oYW5kbGVkIGV4Y2VwdGlvbiBhdCAwMDA4OjAwMDAwMDAwMDAxMDQ3YTUKPiAoZDI0
KSBWZWMgMTQgI1BGWy1kLXNyLV0gJWNyMiAwMDAwMDAwMDAwMDAwZmZmCj4gKGQyNCkgKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqCj4gCj4gV2hpY2ggYWxzbyBjb25maXJtcyB0aGUgZGVz
Y3JpcHRpb24gd2hpY2ggc3RhdGVzIHRoYXQgaW4gdGhlIGNhc2Ugb2YgYQo+IDE2IGJpdCBvcGVy
YW5kLCBubyBzaWduIGV4dGVuc2lvbiBvY2N1cnMuCj4gCj4gSSB0aGVuIHRyaWVkIHRoZSBzYW1l
IHRlc3Qgb24gYW4gSW50ZWwgSGFzd2VsbCBzeXN0ZW06Cj4gCj4gKGQ5MSkgUHRyOiAwMDAwMDAw
MDAwMDAxMDAwCj4gKGQ5MSnCoCA9PiBjMmMyCj4gKGQ5MSkgUHRyOiAwMDAwMDAwMDAwMDAwZmZm
Cj4gKGQ5MSkgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gKGQ5MSkgUEFOSUM6IFVu
aGFuZGxlZCBleGNlcHRpb24gYXQgMDAwODowMDAwMDAwMDAwMTA0N2E1Cj4gKGQ5MSkgVmVjIDE0
ICNQRlstZC1zci1dICVjcjIgMDAwMDAwMDAwMDAwMGZmZgo+IChkOTEpICoqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKgoKQnV0IGp1ZGdpbmcgZnJvbSB0aGUgIlB0cjogMDAwMDAwMDAwMDAw
MGZmZiIgaW4gdGhlIGxvZyBJIHRha2UKaXQgeW91IHRyaWVkIHRvIGFjY2VzcyBhIGJ5dGUgcmF0
aGVyIHRoYW4gYSB3b3JkICh3aGljaCB3b3VsZApuZWVkIGFuIGFkZHJlc3Mgb2YgMDAwMDAwMDAw
MDAwMGZmZSB0byBkaXN0aW5ndWlzaCB3aGV0aGVyIGl0J3MKYSAyLSBvciA0LWJ5dGUgcmVhZCB0
aGF0IHRoZSBDUFUgaXNzdWVzKS4gVHJ1c3QgbWUsIEkgZGlkIHRyeQp0aGlzIG91dCwgd2hpY2gg
aXMgYWxzbyB3aHkgSSBub3RpY2VkIHRoYXQgTWFyaydzIGNsYWltIG9mCnRoZSBiZWhhdmlvciBo
YXZpbmcgY2hhbmdlZCB3aXRoIFNhbmR5QnJpZGdlIGlzIGxpa2VseSB3cm9uZy4KSGUgaGFzIG1l
YW53aGlsZSBjb25maXJtZWQgdGhhdCBNZXJvbSBhbHNvIGFscmVhZHkgYmVoYXZlZCB0aGlzCndh
eS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
