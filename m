Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA53B8D4C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 10:59:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBEgy-0006Lm-UF; Fri, 20 Sep 2019 08:55:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBEgx-0006Lh-Eh
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 08:55:03 +0000
X-Inumbo-ID: 55084c06-db84-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55084c06-db84-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 08:55:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7A312ABE9;
 Fri, 20 Sep 2019 08:55:01 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <845737d3-e16e-61d7-7733-0f8b9eddfb45@suse.com>
 <f7660d87-a36d-80b0-f44d-21a31d80aa84@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a83a10b-2457-6e27-9b7e-a56d62c7eba9@suse.com>
Date: Fri, 20 Sep 2019 10:55:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f7660d87-a36d-80b0-f44d-21a31d80aa84@citrix.com>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 RazvanCojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMjAxOSAxMDo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8wOS8yMDE5
IDExOjM3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gaHZtX21vbml0b3JfY3B1aWQoKSBleHBlY3Rz
IHRoZSBpbnB1dCByZWdpc3RlcnMsIG5vdCB0d28gb2YgdGhlIG91dHB1dHMuCj4gCj4gUGVyaGFw
cyB3b3J0aCBub3RoaW5nIHRoYXQgdGhpcyBoYXMgYmVlbiBicm9rZW4gc2luY2UgaXRzIGludHJv
ZHVjdGlvbgo+IGluIGMvcyBkMDVmMWViMzc0MWI4NSA/CgpBaCwgeWVzLCBJIHNob3VsZCBoYXZl
IGRvbmUgdGhpcy4gSSd2ZSBhZGRlZCBoYWxmIGEgc2VudGVuY2UuCgo+PiBIb3dldmVyLCBvbmNl
IGhhdmluZyBtYWRlIHRoZSBuZWNlc3NhcnkgYWRqdXN0bWVudCwgdGhlIFNWTSBhbmQgVk1YCj4+
IGZ1bmN0aW9ucyBhcmUgc28gc2ltaWxhciB0aGF0IHRoZXkgc2hvdWxkIGJlIGZvbGRlZCAodGh1
cyBhdm9pZGluZwo+PiBmdXJ0aGVyIHNpbWlsYXIgYXN5bW1ldHJpZXMgdG8gZ2V0IGludHJvZHVj
ZWQpLiBVc2UgdGhlIGJlc3Qgb2YgYm90aAo+PiB3b3JsZHMgYnkgZS5nLiB1c2luZyAiY3VyciIg
Y29uc2lzdGVudGx5LiBUaGlzIHRoZW4gYmVpbmcgdGhlIG9ubHkKPj4gY2FsbGVyIG9mIGh2bV9j
aGVja19jcHVpZF9mYXVsdGluZygpLCBmb2xkIGluIHRoYXQgZnVuY3Rpb24gYXMgd2VsbC4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFJl
dmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhh
bmtzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
