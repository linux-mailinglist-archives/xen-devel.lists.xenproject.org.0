Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422AB127E62
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:47:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJWa-0007ws-QV; Fri, 20 Dec 2019 14:45:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJWZ-0007wm-2o
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:45:03 +0000
X-Inumbo-ID: 4d9c7b05-2337-11ea-9372-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d9c7b05-2337-11ea-9372-12813bfff9fa;
 Fri, 20 Dec 2019 14:45:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6CADADFE;
 Fri, 20 Dec 2019 14:45:01 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20efd995-9346-4b0c-f927-ad1152f6ccfe@suse.com>
 <bf3209e7-864d-bcb2-3bce-f051b7764952@suse.com>
 <8388f55a-d1d7-6ddd-04ea-405f7f0f7260@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f24d067-b93c-e654-ff12-2ae1cc713f73@suse.com>
Date: Fri, 20 Dec 2019 15:45:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8388f55a-d1d7-6ddd-04ea-405f7f0f7260@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/6] x86/IRQ: re-use legacy vector ranges on
 APs
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMjAxOSAxNTozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8xMi8yMDE5
IDEzOjMwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlIGxlZ2FjeSB2ZWN0b3JzIGhhdmUgYmVl
biBhY3RpdmVseSB1c2VkIG9uIENQVSAwIG9ubHkuIENQVXMgbm90Cj4+IHNoYXJpbmcgdmVjdG9y
IHNwYWNlIHdpdGggQ1BVIDAgY2FuIGVhc2lseSByZS11c2UgdGhlbSwgc2xpZ2h0bHkKPj4gaW5j
cmVhc2luZyB0aGUgcmVsYXRpdmVseSBzY2FyY2UgcmVzb3VyY2Ugb2YgdG90YWwgdmVjdG9ycyBh
dmFpbGFibGUgaW4KPj4gdGhlIHN5c3RlbS4KPiAKPiBJIHN1cHBvc2UgdGhpcyB0ZWNobmljYWxs
eSBkZXBlbmRzIG9uIEV4dElOVCBtZXNzYWdlcyBuZXZlciB0YXJnZXRpbmcKPiBDUFVzIG90aGVy
IHRoYW4gMC4KPiAKPiBFaXRoZXIgd2F5IC0gSSB0aGluayBpdHMgZmluZSByZXN0cmljdGlvbiB0
byByZWx5IG9uLgoKQW5kIHNldHVwX2xvY2FsX0FQSUMoKSBhcnJhbmdlcyBmb3IgdGhpcy4KCj4+
IEBAIC0yNjE3LDcgKzI2MTYsNyBAQCB2b2lkIF9faW5pdCBpbml0X2lvYXBpY19tYXBwaW5ncyh2
b2lkKQo+PiAgCj4+ICAgICAgaWYgKCBucl9pcnFzID09IDAgKQo+PiAgICAgICAgICBucl9pcnFz
ID0gY3B1X2hhc19hcGljID8KPiAKPiBXZSBzaG91bGQgc3RyaXAgdGhlICFjcHVfaGFzX2FwaWMg
cGF0aHMgYmVjYXVzZSB0aGV5IGFyZSBvYnNvbGV0ZSBpbgo+IDY0Yml0IHByb2Nlc3NvcnMuwqAg
SSBndWVzcyB0aGlzIGNhbiB3YWl0IGZvciBhIGZ1dHVyZSBjbGVhbnVwIHNlcmllcy4KPiAKPj4g
LSAgICAgICAgICAgICAgICAgIG1heCgxNlUgKyBudW1fcHJlc2VudF9jcHVzKCkgKiBOUl9EWU5B
TUlDX1ZFQ1RPUlMsCj4+ICsgICAgICAgICAgICAgICAgICBtYXgoMFUgKyBudW1fcHJlc2VudF9j
cHVzKCkgKiBOUl9EWU5BTUlDX1ZFQ1RPUlMsCj4gCj4gbnVtX3ByZXNlbnRfY3B1cygpIHJlYWxs
eSBjYW4ndCBiZSBuZWdhdGl2ZS7CoCBOZWl0aGVyIGNhbgo+IGNwdW1hc2tfd2VpZ2h0KCkuwqAg
V2l0aCBhIGJpdCBvZiBBUEkgY2xlYW51cCwgdGhpcyAwVSBjYXN0IGNhbiBiZSBkcm9wcGVkLgoK
UmlnaHQsIGJ1dCB0aGF0J3MgZm9yIGFub3RoZXIgZGF5LgoKPiBIb3dldmVyLCBnaXZlbiB0aGlz
IGlzIHRoZSBvbmx5IGNvbmNlcm5lZCwgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIKPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KClRoYW5rcyEKCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
