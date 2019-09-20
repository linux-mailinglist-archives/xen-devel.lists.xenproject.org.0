Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49FFB8D2C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 10:49:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBEWz-0005DT-7i; Fri, 20 Sep 2019 08:44:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBEWx-0005DN-S6
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 08:44:43 +0000
X-Inumbo-ID: e36d5218-db82-11e9-9686-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e36d5218-db82-11e9-9686-12813bfff9fa;
 Fri, 20 Sep 2019 08:44:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 56103B01F;
 Fri, 20 Sep 2019 08:44:41 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <845737d3-e16e-61d7-7733-0f8b9eddfb45@suse.com>
 <57f40bec-d2ad-192f-aeb1-008a0a701fcc@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab2163be-abea-e0f5-5019-c28d863c52b5@suse.com>
Date: Fri, 20 Sep 2019 10:44:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <57f40bec-d2ad-192f-aeb1-008a0a701fcc@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] SVM: correct CPUID event processing
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMjAxOSAxMDozOSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMTkuMDkuMjAxOSAxMzozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IGh2bV9tb25pdG9y
X2NwdWlkKCkgZXhwZWN0cyB0aGUgaW5wdXQgcmVnaXN0ZXJzLCBub3QgdHdvIG9mIHRoZSBvdXRw
dXRzLgo+Pgo+PiBIb3dldmVyLCBvbmNlIGhhdmluZyBtYWRlIHRoZSBuZWNlc3NhcnkgYWRqdXN0
bWVudCwgdGhlIFNWTSBhbmQgVk1YCj4+IGZ1bmN0aW9ucyBhcmUgc28gc2ltaWxhciB0aGF0IHRo
ZXkgc2hvdWxkIGJlIGZvbGRlZCAodGh1cyBhdm9pZGluZwo+PiBmdXJ0aGVyIHNpbWlsYXIgYXN5
bW1ldHJpZXMgdG8gZ2V0IGludHJvZHVjZWQpLiBVc2UgdGhlIGJlc3Qgb2YgYm90aAo+PiB3b3Js
ZHMgYnkgZS5nLiB1c2luZyAiY3VyciIgY29uc2lzdGVudGx5LiBUaGlzIHRoZW4gYmVpbmcgdGhl
IG9ubHkKPj4gY2FsbGVyIG9mIGh2bV9jaGVja19jcHVpZF9mYXVsdGluZygpLCBmb2xkIGluIHRo
YXQgZnVuY3Rpb24gYXMgd2VsbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNh
aWxhQGJpdGRlZmVuZGVyLmNvbT4KClRoYW5rcy4KCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
aHZtLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+PiBAQCAtMzM0OSwxNCArMzM0
OSwyOCBAQCB1bnNpZ25lZCBsb25nIGNvcHlfZnJvbV91c2VyX2h2bSh2b2lkICp0Cj4+ICAgICAg
IHJldHVybiByYyA/IGxlbiA6IDA7IC8qIGZha2UgYSBjb3B5X2Zyb21fdXNlcigpIHJldHVybiBj
b2RlICovCj4+ICAgfQo+Pgo+IAo+IFVzZWZ1bCBmb2xkLiBNYXliZSBhIHNtYWxsIGNvbW1lbnQg
d2l0aCB0aGUgcmVhc29uIHRvIGhhdmUgb25lIGZ1bmN0aW9uIAo+IHdvdWxkIGhlbHAuIFNvbWV0
aGluZyBsaWtlIGJvdGggU1ZNIGFuZCBWTVggZG8gdGhlIHNhbWUgdGhpbmcsIGJ1dCBpdCdzIAo+
IHVwIHRvIHlvdSBpZiBpdCBpcyBuZWNlc3NhcnkuCj4gCj4+IC1ib29sIGh2bV9jaGVja19jcHVp
ZF9mYXVsdGluZyhzdHJ1Y3QgdmNwdSAqdikKPj4gK2ludCBodm1fdm1leGl0X2NwdWlkKHN0cnVj
dCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1bnNpZ25lZCBpbnQgaW5zdF9sZW4pCgpUaGUgcGF0Y2gg
ZGVzY3JpcHRpb24gZXhwbGljaXRseSBzYXlzIHNvLiBTaW5jZSBoYXZpbmcgY29tbW9uIGNvZGUK
Zm9yIHRoaW5ncyBub3QgZGlmZmVyaW5nIGJldHdlZW4gdmVuZG9ycyBpcyB0aGUgcnVsZSByYXRo
ZXIgdGhhbgphbiBleGNlcHRpb24sIGNvbW1lbnRpbmcgaW5kaXZpZHVhbCBmdW5jdGlvbnMgdG8g
dGhpcyBlZmZlY3Qgd291bGQKc2VlbSByYXRoZXIgb2RkIHRvIG1lLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
