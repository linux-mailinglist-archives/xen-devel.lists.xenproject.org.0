Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E0166072
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 16:07:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4nLt-0007AZ-I2; Thu, 20 Feb 2020 15:02:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4nLs-0007AU-1i
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 15:02:56 +0000
X-Inumbo-ID: 12c5ae7e-53f2-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12c5ae7e-53f2-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 15:02:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 92025AF38;
 Thu, 20 Feb 2020 15:02:54 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200220120231.86907-1-roger.pau@citrix.com>
 <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
 <20200220141117.GK4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a3a762e-9a0d-7395-d3c4-aca07c366979@suse.com>
Date: Thu, 20 Feb 2020 16:02:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220141117.GK4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] rwlock: allow recursive read locking when
 already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAyMCAxNToxMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEZl
YiAyMCwgMjAyMCBhdCAwMTo0ODo1NFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQW5v
dGhlciBvcHRpb24gaXMgdG8gdXNlIHRoZSByZWN1cnNlX2NwdSBmaWVsZCBvZiB0aGUKPj4gYXNz
b2NpYXRlZCBzcGluIGxvY2s6IFRoZSBmaWVsZCBpcyB1c2VkIGZvciByZWN1cnNpdmUgbG9ja3MK
Pj4gb25seSwgYW5kIGhlbmNlIHRoZSBvbmx5IGNvbmZsaWN0IHdvdWxkIGJlIHdpdGgKPj4gX3Nw
aW5faXNfbG9ja2VkKCksIHdoaWNoIHdlIGRvbid0IChhbmQgaW4gdGhlIGZ1dHVyZSB0aGVuCj4+
IGFsc28gc2hvdWxkbid0KSB1c2Ugb24gdGhpcyBsb2NrLgo+IAo+IEkgbG9va2VkIGludG8gdGhh
dCBhbHNvLCBidXQgdGhpbmdzIGdldCBtb3JlIGNvbXBsaWNhdGVkIEFGQUlDVCwgYXMgaXQncwo+
IG5vdCBwb3NzaWJsZSB0byBhdG9taWNhbGx5IGZldGNoIHRoZSBzdGF0ZSBvZiB0aGUgbG9jayBh
bmQgdGhlIG93bmVyCj4gQ1BVIGF0IHRoZSBzYW1lIHRpbWUuIE5laXRoZXIgeW91IGNvdWxkIHNl
dCB0aGUgTE9DS0VEIGJpdCBhbmQgdGhlIENQVQo+IGF0IHRoZSBzYW1lIHRpbWUuCgpUaGVyZSdz
IG5vIG5lZWQgdG8gYXRvbWljYWxseSBmZXRjaCBib3RoIGFmYWljczogVGhlIGZpZWxkIGlzCnZh
bGlkIG9ubHkgaWYgdGhlIExPQ0tFRCBiaXQgaXMgc2V0LiBBbmQgd2hlbiByZWFkaW5nIHRoZQpm
aWVsZCB5b3Ugb25seSBjYXJlIGFib3V0IHRoZSB2YWx1ZSBiZWluZyBlcXVhbCB0bwpzbXBfcHJv
Y2Vzc29yX2lkKCksIGkuZS4gaXQgaXMgZmluZSB0byBzZXQgTE9DS0VEIGJlZm9yZQp1cGRhdGlu
ZyB0aGUgQ1BVIGZpZWxkIG9uIGxvY2ssIGFuZCB0byByZXNldCB0aGUgQ1BVIGZpZWxkIHRvClNQ
SU5MT0NLX05PX0NQVSAob3Igd2hhdGV2ZXIgaXQncyBjYWxsZWQpIGJlZm9yZSBjbGVhcmluZwpM
T0NLRUQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
