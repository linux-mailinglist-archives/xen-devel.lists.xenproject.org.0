Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47981845E4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 12:25:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCiPZ-0007n7-9u; Fri, 13 Mar 2020 11:23:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCiPX-0007n1-T5
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 11:23:27 +0000
X-Inumbo-ID: 0f183620-651d-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f183620-651d-11ea-b34e-bc764e2007e4;
 Fri, 13 Mar 2020 11:23:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8F942AAC7;
 Fri, 13 Mar 2020 11:23:26 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1583863578-18063-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <681ec79d-a0ce-0066-7100-0867e2f06214@suse.com>
Date: Fri, 13 Mar 2020 12:23:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583863578-18063-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] x86/cpu: Sync any remaining RCU
 callbacks before CPU up/down
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
Cc: jgross@suse.com, sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxOTowNiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gRHVyaW5nIENQVSBk
b3duIG9wZXJhdGlvbiBSQ1UgY2FsbGJhY2tzIGFyZSBzY2hlZHVsZWQgdG8gZmluaXNoCj4gb2Zm
IHNvbWUgYWN0aW9ucyBsYXRlciBhcyBzb29uIGFzIENQVSBpcyBmdWxseSBkZWFkICh0aGUgc2Ft
ZSBhcHBsaWVzCj4gdG8gQ1BVIHVwIG9wZXJhdGlvbiBpbiBjYXNlIGVycm9yIHBhdGggaXMgdGFr
ZW4pLiBJZiBpbiB0aGUgc2FtZSBncmFjZQo+IHBlcmlvZCBhbm90aGVyIENQVSB1cCBvcGVyYXRp
b24gaXMgcGVyZm9ybWVkIG9uIHRoZSBzYW1lIENQVSwgUkNVIGNhbGxiYWNrCj4gd2lsbCBiZSBj
YWxsZWQgbGF0ZXIgb24gYSBDUFUgaW4gYSBwb3RlbnRpYWxseSB3cm9uZyAoYWxyZWFkeSB1cCBh
Z2Fpbgo+IGluc3RlYWQgb2Ygc3RpbGwgYmVpbmcgZG93bikgc3RhdGUgbGVhZGluZyB0byBldmVu
dHVhbCBzdGF0ZSBpbmNvbnNpc3RlbmN5Cj4gYW5kL29yIGNyYXNoLgo+IAo+IEluIG9yZGVyIHRv
IGF2b2lkIGl0IC0gZmx1c2ggUkNVIGNhbGxiYWNrcyBleHBsaWNpdGx5IGJlZm9yZSBzdGFydGlu
ZyB0aGUKPiBuZXh0IENQVSB1cC9kb3duIG9wZXJhdGlvbi4KPiAKPiBSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhp
bmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+IC0tLQo+IFRoaXMgZ290IGRpc2NvdmVy
ZWQgdHJ5aW5nIHRvIHJlc3VtZSBQViBzaGltIHdpdGggbXVsdGlwbGUgdkNQVXMgb24gQU1ECj4g
bWFjaGluZSAod2hlcmUgcGFya19vZmZsaW5lX2NwdXMgPT0gMCkuIFJDVSBjYWxsYmFjayByZXNw
b25zaWJsZSBmb3IKPiBmcmVlaW5nIHBlcmNwdSBhcmVhIG9uIENQVSBvZmZsaW5lIGdvdCBmaW5h
bGx5IGNhbGxlZCBhZnRlciBDUFUgd2VudAo+IG9ubGluZSBhZ2FpbiBhcyB0aGUgZ3Vlc3QgcGVy
Zm9ybWVkIHJlZ3VsYXIgdkNQVSBvZmZsaW5lL29ubGluZSBvcGVyYXRpb25zCj4gb24gcmVzdW1l
Lgo+IAo+IE5vdGU6IHRoaXMgcGF0Y2ggcmVxdWlyZXMgUkNVIHNlcmllcyB2NCBmcm9tIEp1ZXJn
ZW4gdG8gYmUgYXBwbGllZCAtCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZl
cy9odG1sL3hlbi1kZXZlbC8yMDIwLTAzL21zZzAwNjY4Lmh0bWwKCkkgd2FzIGFib3V0IHRvIGFw
cGx5IHRoZSBwYXRjaCB5ZXN0ZXJkYXkgKEkgdGhpbmspIHdoZW4gSSBzdHVtYmxlZAphY3Jvc3Mg
dGhpcyBub3RlLiBJcyB0aGlzIGFjdHVhbGx5IHN0aWxsIHRydWU/IElmIHNvLCB3b3VsZCB5b3UK
bWluZCBoZWxwaW5nIG1lIHNlZSB0aGUgZGVwZW5kZW5jeT8KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
