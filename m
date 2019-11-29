Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F48C10D29C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 09:50:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iabu2-0000Dy-IN; Fri, 29 Nov 2019 08:45:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iabu1-0000Dt-1h
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 08:45:25 +0000
X-Inumbo-ID: 947b9c82-1284-11ea-a3e0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 947b9c82-1284-11ea-a3e0-12813bfff9fa;
 Fri, 29 Nov 2019 08:45:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18A02B378;
 Fri, 29 Nov 2019 08:45:22 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, Julien Grall <jgrall@amazon.com>
References: <20191128093828.8462-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da07605c-4722-2ed5-5550-044a45cceb88@suse.com>
Date: Fri, 29 Nov 2019 09:45:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191128093828.8462-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen/x86: vpmu: Unmap per-vCPU PMU page
 when the domain is destroyed
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxMDozOCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IEZyb206IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gQSBndWVzdCB3aWxsIHNldHVwIGEgc2hhcmVk
IHBhZ2Ugd2l0aCB0aGUgaHlwZXJ2aXNvciBmb3IgZWFjaCB2Q1BVIHZpYQo+IFhFTlBNVV9pbml0
LiBUaGUgcGFnZSB3aWxsIHRoZW4gZ2V0IG1hcHBlZCBpbiB0aGUgaHlwZXJ2aXNvciBhbmQgb25s
eQo+IHJlbGVhc2VkIHdoZW4gWEVOUE1VX2ZpbmlzaCBpcyBjYWxsZWQuCj4gCj4gVGhpcyBtZWFu
cyB0aGF0IGlmIHRoZSBndWVzdCBmYWlscyB0byBpbnZva2UgWEVOUE1VX2ZpbmlzaCwgZS5nIGlm
IGl0IGlzCj4gZGVzdHJveWVkIHJhdGhlciB0aGFuIGNsZWFubHkgc2h1dCBkb3duLCB0aGUgcGFn
ZSB3aWxsIHN0YXkgbWFwcGVkIGluIHRoZQo+IGh5cGVydmlzb3IuIE9uZSBvZiB0aGUgY29uc2Vx
dWVuY2VzIGlzIHRoZSBkb21haW4gY2FuIG5ldmVyIGJlIGZ1bGx5Cj4gZGVzdHJveWVkIGFzIGEg
cGFnZSByZWZlcmVuY2UgaXMgc3RpbGwgaGVsZC4KPiAKPiBBcyBYZW4gc2hvdWxkIG5ldmVyIHJl
bHkgb24gdGhlIGd1ZXN0IHRvIGNvcnJlY3RseSBjbGVhbi11cCBhbnkKPiBhbGxvY2F0aW9uIGlu
IHRoZSBoeXBlcnZpc29yLCB3ZSBzaG91bGQgYWxzbyB1bm1hcCBzdWNoIHBhZ2VzIGR1cmluZyB0
aGUKPiBkb21haW4gZGVzdHJ1Y3Rpb24gaWYgdGhlcmUgYXJlIGFueSBsZWZ0Lgo+IAo+IFdlIGNh
biByZS11c2UgdGhlIHNhbWUgbG9naWMgYXMgaW4gcHZwbXVfZmluaXNoKCkuIFRvIGF2b2lkCj4g
ZHVwbGljYXRpb24sIG1vdmUgdGhlIGxvZ2ljIGluIGEgbmV3IGZ1bmN0aW9uIHRoYXQgY2FuIGFs
c28gYmUgY2FsbGVkCj4gZnJvbSB2cG11X2Rlc3Ryb3koKS4KPiAKPiBOT1RFOiAtIFRoZSBjYWxs
IHRvIHZwbXVfZGVzdHJveSgpIG11c3QgYWxzbyBiZSBtb3ZlZCBmcm9tCj4gICAgICAgICBhcmNo
X3ZjcHVfZGVzdHJveSgpIGludG8gZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgc3VjaCB0
aGF0Cj4gICAgICAgICB0aGUgcmVmZXJlbmNlIG9uIHRoZSBtYXBwZWQgcGFnZSBkb2VzIG5vdCBw
cmV2ZW50IGRvbWFpbl9kZXN0cm95KCkKPiAgICAgICAgICh3aGljaCBjYWxscyBhcmNoX3ZjcHVf
ZGVzdHJveSgpKSBmcm9tIGJlaW5nIGNhbGxlZC4KPiAgICAgICAtIFdoaWxzdCBpdCBhcHBlYXJz
IHRoYXQgdnBtdV9hcmNoX2Rlc3Ryb3koKSBpcyBpZGVtcG90ZW50IGl0IGlzCj4gICAgICAgICBi
eSBubyBtZWFucyBvYnZpb3VzLiBIZW5jZSBtYWtlIHN1cmUgdGhlIFZQTVVfQ09OVEVYVF9BTExP
Q0FURUQKPiAgICAgICAgIGZsYWcgaXMgY2xlYXJlZCBhdCB0aGUgZW5kIG9mIHZwbXVfYXJjaF9k
ZXN0cm95KCkuCj4gICAgICAgLSBUaGlzIGlzIG5vdCBhbiBYU0EgYmVjYXVzZSB2UE1VIGlzIG5v
dCBzZWN1cml0eSBzdXBwb3J0ZWQgKHNlZQo+ICAgICAgICAgWFNBLTE2MykuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
