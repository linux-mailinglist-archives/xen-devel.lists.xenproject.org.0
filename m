Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6AC17E0C8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 14:07:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBI4t-0000Gd-Do; Mon, 09 Mar 2020 13:04:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBI4r-0000GY-Og
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 13:04:13 +0000
X-Inumbo-ID: 785c789a-6206-11ea-ac2c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 785c789a-6206-11ea-ac2c-12813bfff9fa;
 Mon, 09 Mar 2020 13:04:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B3EBAC37;
 Mon,  9 Mar 2020 13:04:11 +0000 (UTC)
To: paul@xen.org
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-4-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae9cc4a6-0378-571c-9d46-0561e536884f@suse.com>
Date: Mon, 9 Mar 2020 14:04:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309102304.1251-4-paul@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAyMCAxMToyMywgcGF1bEB4ZW4ub3JnIHdyb3RlOgo+IEZyb206IFBhdWwgRHVy
cmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiBUaGlzIHBhdGNoIG1vZGlmaWVzIHNldmVy
YWwgcGxhY2VzIHdhbGtpbmcgdGhlIGRvbWFpbidzIHBhZ2VfbGlzdCB0byBtYWtlCj4gdGhlbSBp
Z25vcmUgUEdDX2V4dHJhIHBhZ2VzOgo+IAo+IC0gZHVtcF9wYWdlZnJhbWVfaW5mbygpIHNob3Vs
ZCBpZ25vcmUgUEdDX2V4dHJhIHBhZ2VzIGluIGl0cyBkdW1wIGFzIGl0Cj4gICBkZXRlcm1pbmVz
IHdoZXRoZXIgdG8gZHVtcCB1c2luZyBkb21haW5fdG90X3BhZ2VzKCkgd2hpY2ggYWxzbyBpZ25v
cmVzCj4gICBQR0NfZXh0cmEgcGFnZXMuCgpUaGlzIGFyZ3VtZW50IGxvb2tzIHdyb25nIHRvIG1l
OiBMZXQncyB0YWtlIGFuIGV4YW1wbGUgLSBhIGRvbWFpbgphbG1vc3QgZnVsbHkgY2xlYW5lZCB1
cCwgd2l0aCA4ICJub3JtYWwiIGFuZCAzICJleHRyYSIgcGFnZXMgbGVmdC4KZG9tYWluX3RvdF9w
YWdlcygpIHJldHVybnMgOCBpbiB0aGlzIGNhc2UsIGkuZS4gIm5vcm1hbCIgcGFnZQpkdW1waW5n
IGRvZXNuJ3QgZ2V0IHNraXBwZWQuIEhvd2V2ZXIsIHRoZXJlIG5vdyB3b24ndCBiZSBhbnkgdHJh
Y2UKb2YgdGhlICJleHRyYSIgcGFnZXMsIGJlY2F1c2UgdGhleSdyZSBhbHNvIG5vdCBvbiB4ZW5w
YWdlX2xpc3QsCndoaWNoIGdldHMgYWxsIGl0cyBwYWdlcyBkdW1wZWQgaW4gYWxsIGNhc2VzLiBD
b3JyZWN0IHJlc3RvcmF0aW9uCm9mIG9yaWdpbmFsIGJlaGF2aW9yIHdvdWxkIGJlIHRvIGR1bXAg
Im5vcm1hbCIgcGFnZXMgd2hlbiB0aGVyZQphcmUgbGVzcyB0aGFuIDEwLCBhbmQgdG8gZHVtcCBh
bGwgImV4dHJhIiBwYWdlcy4gKFNhbWUgb2YgY291cnNlCmdvZXMgZm9yIGxpdmUgZG9tYWlucywg
d2hlcmUgIm5vcm1hbCIgcGFnZSBkdW1waW5nIHdvdWxkIGJlCnNraXBwZWQgaW4gdGhlIGNvbW1v
biBjYXNlLCBidXQgeGVuaGVhcCBwYWdlcyB3b3VsZCBiZSBkdW1wZWQsIGFuZApoZW5jZSBzbyBz
aG91bGQgYmUgImV4dHJhIiBvbmVzLikgQXMgaW5kaWNhdGVkIGJlZm9yZSwgdGhlIHJlbW92YWwK
b2YgdGhlIEFQSUMgYXNzaXN0IHBhZ2UgZnJvbSB4ZW5wYWdlX2xpc3Qgd2FzIGFscmVhZHkgc2xp
Z2h0bHkKcmVncmVzc2luZyBpbiB0aGlzIHJlZ2FyZCAoYXMgd2VsbCBhcyBpbiBhdCBsZWFzdCBv
bmUgb3RoZXIgd2F5LApJJ20gYWZyYWlkKSwgYW5kIHlvdSdyZSBub3cgZGVsaWJlcmF0ZWx5IG1h
a2luZyB0aGUgcmVncmVzc2lvbgpldmVuIGJpZ2dlci4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
