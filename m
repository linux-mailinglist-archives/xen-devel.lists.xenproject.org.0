Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0A2CDFAD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 12:52:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHQZz-00009U-Kg; Mon, 07 Oct 2019 10:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHQZx-00009J-NU
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 10:49:25 +0000
X-Inumbo-ID: 1fc1efce-e8f0-11e9-96dc-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fc1efce-e8f0-11e9-96dc-bc764e2007e4;
 Mon, 07 Oct 2019 10:49:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F77CB2BB;
 Mon,  7 Oct 2019 10:49:22 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <ba0fd598-9102-e765-e7f5-61e91d47b124@suse.com>
 <dc7d25e5-11f8-b6c3-7137-ceb0814e836a@suse.com>
 <c694e8f7-fd64-f2be-fadb-edc1478d07ae@citrix.com>
 <44d87efa-36af-7c06-6530-a1691ab55a83@suse.com>
 <f7f47cb5-a08b-ca08-93df-73427d94b847@citrix.com>
 <ee24c8e1-c925-f78e-1d51-d0d1f03f7326@suse.com>
 <f0c08d79-fad2-4760-6e18-99bfe84509e2@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <19607600-ebcd-2700-abce-19f53c503633@suse.com>
Date: Mon, 7 Oct 2019 12:49:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f0c08d79-fad2-4760-6e18-99bfe84509e2@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/3] AMD/IOMMU: allocate one device table
 per PCI segment
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTAuMjAxOSAxMjoxOSwgSsO8cmdlbiBHcm/DnyAgd3JvdGU6Cj4gT24gMDcuMTAuMTkg
MTI6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJIGFwcHJlY2lhdGUgdGhlIGFjaywgYnV0IEkg
dGhpbmsgSSdkIHByZWZlciB0byBub3QgbWFrZSB1c2Ugb2YgaXQKPj4gaWYgYXQgYWxsIHBvc3Np
YmxlIHVuZGVyIHRoZXNlIGNvbmRpdGlvbnMuIEluc3RlYWQgSSdkIGxpa2UgdXMgdG8KPj4gcmVh
Y2ggc29tZSBjb21tb24gZ3JvdW5kIGhlcmUuIFNlZWluZyB0aGF0IHdlJ3JlIHBhc3QgdGhlIGRl
YWRsaW5lCj4+IGFscmVhZHksIErDvHJnZW4ncyByZWxlYXNlIGFjayB3aWxsIG5vdyBiZSBuZWVk
ZWQgYW55d2F5LiBKw7xyZ2VuIC0KPj4gd291bGQgeW91IGJlIGZpbmUgd2l0aCBzZXR0bGluZyBv
biB0aGlzIHRha2luZyBhIGZldyBtb3JlIGRheXMsCj4+IGFuZCB0aGVuIHN0aWxsIGFsbG93IGlu
IHRoaXMgc2VyaWVzPyBPciBpcyB0cnlpbmcgdG8gc29vbiBmaW5kIGEKPj4gcmVzb2x1dGlvbiBo
ZXJlIHBvaW50bGVzcyBhcyB5b3UnZCByYXRoZXIgbm90IHNlZSB0aGlzIGdvIGluCj4+IGFueW1v
cmU/Cj4gCj4gQXMgaXQgaXNuJ3QgYSBjb21wbGV0ZWx5IHRyaXZpYWwgcGF0Y2ggc2VyaWVzIEkn
ZCBsaWtlIHRvIGtub3cgd2hhdAo+IHRoZSBnYWluIHdvdWxkIGJlOiBpcyBpdCBqdXN0IGEgIm5p
Y2UgdG8gaGF2ZSIsIGRvZXMgaXQgc29sdmUgYQo+IHRoZW9yZXRpY2FsIChub3QgdG8gYmUgZXhw
ZWN0ZWQpIHByb2JsZW0sIG9yIGRvIHlvdSB0aGluayBpdCB3aWxsCj4gYmUgbmVlZGVkIHRvIGJl
IGJhY2twb3J0ZWQgaWYgSSBzYXkgIm5vIj8KClRoZSAzcmQgcGF0Y2ggaW4gdGhpcyBzZXJpZXMg
aXMgd2hhdCBpcyByZWFsbHkgd2FudGVkLCB0byBjbG9zZQphIHByZXZpb3VzbHkganVzdCB0aGVv
cmV0aWNhbCBidXQgKEkgdGhpbmspIG5vdyBpbiBwcmluY2lwbGUKcG9zc2libGUgZ2FwIHdpdGgg
ZGV2aWNlIHRhYmxlIGluaXRpYWxpemF0aW9uLCBwb3RlbnRpYWxseQphbGxvd2luZyB1bnRyYW5z
bGF0ZWQgRE1BIG9yIGludGVycnVwdCByZXF1ZXN0cyB0byBtYWtlIGl0CnRocm91Z2ggd2hlbiBu
b3Qgc28gaW50ZW5kZWQuIElmIHRoaXMgd2FzIHRvIGJlIGJhY2twb3J0ZWQsIEkKdGhpbmsgSSdk
IHRyeSByZS1iYXNpbmcgcGF0Y2hlcyAyIGFuZCAzIG9udG8gYSB0cmVlIHdpdGhvdXQKcGF0Y2gg
MSwgYnV0IGRvaW5nIHNvIGZvciBtYXN0ZXIgZG9lc24ndCBsb29rICh0byBtZSkgdG8gYmUgYQp2
ZXJ5IHJlYXNvbmFibGUgc3RlcCwgc2VlaW5nIHRoYXQgcGF0Y2ggMSBoYWQgYmVlbiB0aGVyZSBm
aXJzdC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
