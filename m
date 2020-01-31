Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1258414EE2F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 15:08:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixWvL-00089z-4I; Fri, 31 Jan 2020 14:05:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixWvJ-00089u-Vt
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 14:05:30 +0000
X-Inumbo-ID: bc528e00-4432-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc528e00-4432-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 14:05:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 30E42AE57;
 Fri, 31 Jan 2020 14:05:28 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-8-liuwe@microsoft.com>
 <20200130104143.GH4679@Air-de-Roger> <20200130111821.zmzp7ykg4slqpa5y@debian>
 <20200130113947.GI4679@Air-de-Roger> <20200130114752.lmpvpgttcnadymqa@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2cd03009-a36f-0913-719d-0b57b5475d8b@suse.com>
Date: Fri, 31 Jan 2020 15:05:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200130114752.lmpvpgttcnadymqa@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 07/12] x86/hyperv: setup hypercall page
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

T24gMzAuMDEuMjAyMCAxMjo0NywgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAzMCwgMjAy
MCBhdCAxMjozOTo0N1BNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+PiBJIHRoaW5r
IHdoYXQgeW91IG5lZWQgaXMgYSBob29rIHRoYXQgbW9kaWZpZXMgdGhlIG1lbW9yeSBtYXAgYW5k
IGFkZHMKPj4gYSByZXNlcnZlZCByZWdpb24gYXQgKCgxIDw8IHBhZGRyX2JpdHMpIC0gUEFHRV9T
SVpFKSBvZiBzaXplCj4+IFBBR0VfU0laRS4gU2VlIHdoZXJlIHB2X3NoaW1fZml4dXBfZTgyMCBp
cyB1c2VkLCBhbmQgSSB0aGluayB5b3Ugd2FudAo+PiB0byBtYWtlIHRoaXMgYSBoeXBlcnZpc29y
IGhvb2sgYW5kIGFkZCB0aGUgSHlwZXJWIGNvZGUgdG8gcmVzZXJ2ZSB0aGUKPj4gaHlwZXJjYWxs
IHBhZ2UgaW4gdGhlIGU4MjAgdGhlcmUuCj4gCj4gVGhhdCB3b3JrcyBmb3IgbWUgdG9vLiBMZXQn
cyBzZWUgd2hhdCBvdGhlciBwZW9wbGUgdGhpbmsuCgpUaGUgaWRlYSBsZ3RtLCBwZW5kaW5nIHNl
ZWluZyBpdCBhY3R1YWxseSBjYXJyaWVkIG91dC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
