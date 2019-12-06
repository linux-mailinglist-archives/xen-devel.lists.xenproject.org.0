Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F3B114FD4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 12:36:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idBqk-00028L-4q; Fri, 06 Dec 2019 11:32:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1idBqj-00028G-6e
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 11:32:41 +0000
X-Inumbo-ID: 1bd35f28-181c-11ea-8252-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bd35f28-181c-11ea-8252-12813bfff9fa;
 Fri, 06 Dec 2019 11:32:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AD9C6B3A8;
 Fri,  6 Dec 2019 11:32:38 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <57491ade-fa47-5e66-47ac-a5f79de84070@suse.com>
 <313f5f41-1572-aa0e-1112-d606ad5dee9c@suse.com>
 <355ec482-c6f7-4ec7-cefe-dbcc1bdf5f3f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3f5f0679-758d-c1c9-0beb-681a7495c44c@suse.com>
Date: Fri, 6 Dec 2019 12:32:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <355ec482-c6f7-4ec7-cefe-dbcc1bdf5f3f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86: relax GDT check in
 arch_set_info_guest()
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

T24gMDYuMTIuMjAxOSAxMToyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8xMi8yMDE5
IDEwOjE0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSXQgaXMgd3JvbmcgZm9yIHVzIHRvIGNoZWNr
IGZyYW1lcyBiZXlvbmQgdGhlIGd1ZXN0IHNwZWNpZmllZCBsaW1pdC4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEkgZG9uJ3QgY29tcGxl
dGVseSBhZ3JlZS7CoCBUaGUgY29kZSBoYXMgYmVlbiBsaWtlIHRoaXMgc2luY2UgaXQgd2FzCj4g
aW50cm9kdWNlZCwgYW5kIGlzIHVzZWQgdG8gY2hlY2sgZGF0YSBmcm9tIHRoZSBkb21haW4gYnVp
bGRlciAoaW5jCj4gbWlncmF0aW9uKSwgYW5kIGZyb20gdGhlIGd1ZXN0cy4KPiAKPiBBdCB0aGUg
bW9tZW50LCBldmVyeSBjYWxsZXIgaXMgcmVxdWlyZWQgbm90IHRvIHBhc3MganVuayBpbiB1bnVz
ZWQKPiBmcmFtZXMsIGFuZCBJIGRvbid0IHNlZSBhbiBpc3N1ZSB3aXRoIGtlZXBpbmcgdGhpcyBi
ZWhhdmlvdXIuCgpLZWVwaW5nIHRoZSBiZWhhdmlvciBpc24ndCBnb2luZyB0byBicmVhayBhbnl0
aGluZywgeWVzLCBidXQgaXQKc2hvdWxkbid0IGhhdmUgYmVlbiB0aGlzIHdheSB0byBiZWdpbiB3
aXRoLiBJIHNpbXBseSBkb24ndCBzZWUKdGhlIHZhbHVlIG9mIHZhbGlkYXRpbmcgZGF0YSB3ZSdy
ZSBub3QgY29uc3VtaW5nIGFueXdheS4gUGVyaGFwcwpJIGNvdWxkIHNheSAibm90IGhlbHBmdWwi
IG9yICJwb2ludGxlc3MiIGluc3RlYWQgb2YgIndyb25nIiAuLi4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
