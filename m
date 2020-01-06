Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A74C131662
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 17:57:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioVf2-0003Xq-V2; Mon, 06 Jan 2020 16:55:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioVf1-0003Xj-2b
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 16:55:23 +0000
X-Inumbo-ID: 52ee58ae-30a5-11ea-ab37-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52ee58ae-30a5-11ea-ab37-12813bfff9fa;
 Mon, 06 Jan 2020 16:55:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3D2C8AC44;
 Mon,  6 Jan 2020 16:55:20 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
 <9f4b57e9-c7a4-78e9-32c1-b25530c550f4@suse.com>
 <daa065fb-d4c8-4a6c-0ba1-4a3584993dcb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b031768-c264-19e1-b2b4-af8e09b7efd5@suse.com>
Date: Mon, 6 Jan 2020 17:56:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <daa065fb-d4c8-4a6c-0ba1-4a3584993dcb@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/8] x86: determine HAVE_AS_* just once
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNzo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wMS8yMDIw
IDE2OjM0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gV2l0aCB0aGUgZXhjZXB0aW9uIG9mIEhBVkVf
QVNfUVVPVEVEX1NZTSwgcG9wdWxhdGUgdGhlIHJlc3VsdHMgaW50byBhCj4+IGdlbmVyYXRlZCBo
ZWFkZXIgaW5zdGVhZCBvZiAoYXQgbGVhc3Qgb25jZSBwZXIgW3N1Yl1kaXJlY3RvcnkpIGludG8K
Pj4gQ0ZMQUdTLiBUaGlzIHJlc3VsdHMgaW4gcHJvcGVyIHJlYnVpbGRzICh2aWEgbWFrZSBkZXBl
bmRlbmNpZXMpIGluIGNhc2UKPj4gdGhlIGNvbXBpbGVyIHVzZWQgY2hhbmdlcyBiZXR3ZWVuIGJ1
aWxkcy4gSXQgYWRkaXRpb25hbGx5IGVhc2VzCj4+IGluc3BlY3Rpb24gb2Ygd2hpY2ggYXNzZW1i
bGVyIGZlYXR1cmVzIHdlcmUgYWN0dWFsbHkgZm91bmQgdXNhYmxlLgo+Pgo+PiBTb21lIHRyaWNr
ZXJ5IGlzIG5lZWRlZCB0byBhdm9pZCBoZWFkZXIgZ2VuZXJhdGlvbiBpdHNlbGYgdG8gdHJ5IHRv
Cj4+IGluY2x1ZGUgdGhlIHRvLWJlL25vdC15ZXQtZ2VuZXJhdGVkIGhlYWRlci4KPj4KPj4gU2lu
Y2UgdGhlIGRlZmluaXRpb25zIGluIGdlbmVyYXRlZC9jb25maWcuaCwgcHJldmlvdXNseSBoYXZp
bmcgYmVlbgo+PiBjb21tYW5kIGxpbmUgb3B0aW9ucywgbWlnaHQgZXZlbiBhZmZlY3QgeGVuL2Nv
bmZpZy5oIG9yIGl0cyBkZXNjZW5kYW50cywKPj4gbW92ZSBhZGRpbmcgb2YgdGhlIC1pbmNsdWRl
IG9wdGlvbiBmb3IgdGhlIGxhdHRlciBhZnRlciBpbmNsdXNpb24gb2YgdGhlCj4+IHBlci1hcmNo
IFJ1bGVzLm1rLiBVc2UgdGhlIG9jY2FzaW9uIHRvIGFsc28gbW92ZSB0aGUgbW9zdCBnZW5lcmFs
IC1JCj4+IG9wdGlvbiB0byB0aGUgY29tbW9uIFJ1bGVzLm1rLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiB2NDogTmV3Lgo+IAo+
IElzIGl0IHYzIG9yIHY0PwoKdjQsIGFzIHNhaWQgaW4gcmVwbHkgdG8gdGhlIGNvdmVyIGxldHRl
ci4KCj4gQWxzbywgaXMgaXQgaW50ZW5kZWQgZm9yIGp1c3QgYmFja3BvcnQ/wqAgSXQgaXMgbGFy
Z2VseSByZWR1bmRhbnQgd2l0aAo+IEFudGhvbnkncyBLY29uZmlnL0tidWlsZCBlZmZvcnRzLCBh
cyBtb3ZpbmcgdGhlc2UgKGFuZCBvdGhlciBjaGVja3MpCj4gaW50byB0aGUgS2NvbmZpZyBzdGVw
IGlzIHRoZSB1bHRpbWF0ZSBnb2FsLgoKSXMgaXQ/IExvb2tpbmcgYXQgY3VycmVudCBMaW51eCBJ
IHN0aWxsIHNlZSBlLmcuCgojIGRvIGJpbnV0aWxzIHN1cHBvcnQgQ0ZJPwpjZmkgOj0gJChjYWxs
IGFzLWluc3RyLC5jZmlfc3RhcnRwcm9jXG4uY2ZpX3JlbF9vZmZzZXQgJChzcC15KSQoY29tbWEp
MFxuLmNmaV9lbmRwcm9jLC1EQ09ORklHX0FTX0NGST0xKQojIGlzIC5jZmlfc2lnbmFsX2ZyYW1l
IHN1cHBvcnRlZCB0b28/CmNmaS1zaWdmcmFtZSA6PSAkKGNhbGwgYXMtaW5zdHIsLmNmaV9zdGFy
dHByb2Ncbi5jZmlfc2lnbmFsX2ZyYW1lXG4uY2ZpX2VuZHByb2MsLURDT05GSUdfQVNfQ0ZJX1NJ
R05BTF9GUkFNRT0xKQpjZmktc2VjdGlvbnMgOj0gJChjYWxsIGFzLWluc3RyLC5jZmlfc2VjdGlv
bnMgLmRlYnVnX2ZyYW1lLC1EQ09ORklHX0FTX0NGSV9TRUNUSU9OUz0xKQoKIyBkb2VzIGJpbnV0
aWxzIHN1cHBvcnQgc3BlY2lmaWMgaW5zdHJ1Y3Rpb25zPwphc2luc3RyICs9ICQoY2FsbCBhcy1p
bnN0cixwc2h1ZmIgJXhtbTAkKGNvbW1hKSV4bW0wLC1EQ09ORklHX0FTX1NTU0UzPTEpCmF2eF9p
bnN0ciA6PSAkKGNhbGwgYXMtaW5zdHIsdnhvcnBzICV5bW0wJChjb21tYSkleW1tMSQoY29tbWEp
JXltbTIsLURDT05GSUdfQVNfQVZYPTEpCmF2eDJfaW5zdHIgOj0kKGNhbGwgYXMtaW5zdHIsdnBi
cm9hZGNhc3RiICV4bW0wJChjb21tYSkleW1tMSwtRENPTkZJR19BU19BVlgyPTEpCmF2eDUxMl9p
bnN0ciA6PSQoY2FsbCBhcy1pbnN0cix2cG1vdm0yYiAlazEkKGNvbW1hKSV6bW01LC1EQ09ORklH
X0FTX0FWWDUxMj0xKQpzaGExX25pX2luc3RyIDo9JChjYWxsIGFzLWluc3RyLHNoYTFtc2cxICV4
bW0wJChjb21tYSkleG1tMSwtRENPTkZJR19BU19TSEExX05JPTEpCnNoYTI1Nl9uaV9pbnN0ciA6
PSQoY2FsbCBhcy1pbnN0cixzaGEyNTZtc2cxICV4bW0wJChjb21tYSkleG1tMSwtRENPTkZJR19B
U19TSEEyNTZfTkk9MSkKCktCVUlMRF9BRkxBR1MgKz0gJChjZmkpICQoY2ZpLXNpZ2ZyYW1lKSAk
KGNmaS1zZWN0aW9ucykgJChhc2luc3RyKSAkKGF2eF9pbnN0cikgJChhdngyX2luc3RyKSAkKGF2
eDUxMl9pbnN0cikgJChzaGExX25pX2luc3RyKSAkKHNoYTI1Nl9uaV9pbnN0cikKS0JVSUxEX0NG
TEFHUyArPSAkKGNmaSkgJChjZmktc2lnZnJhbWUpICQoY2ZpLXNlY3Rpb25zKSAkKGFzaW5zdHIp
ICQoYXZ4X2luc3RyKSAkKGF2eDJfaW5zdHIpICQoYXZ4NTEyX2luc3RyKSAkKHNoYTFfbmlfaW5z
dHIpICQoc2hhMjU2X25pX2luc3RyKQoKaW4gYXJjaC94ODYvTWFrZWZpbGUuIEkgYW0sIGJ0dywg
YWxzbyB1bmNvbnZpbmNlZCB0aGF0IHN1Y2ggYmVsb25ncwppbnRvIC5jb25maWcgaW4gdGhlIGZp
cnN0IHBsYWNlOiBUaGUgY29uZmlndXJhdGlvbiBkb2Vzbid0IGNoYW5nZQppZiBJIHN3YXAgbXkg
dG9vbCBjaGFpbi4gT2YgY291cnNlIEkgcmVhbGl6ZWQgdGhlcmUncyB0aGUgZ3JleSBhcmVhCm9m
IHVzZXIgdmlzaWJsZSBvcHRpb25zIGRlcGVuZGluZyBvbiB0b29sIGNoYWluIGNhcGFiaWxpdGll
cyAoaWYKb25lIG1lYW5zIHRvIGFsbG93IHN1Y2gpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
