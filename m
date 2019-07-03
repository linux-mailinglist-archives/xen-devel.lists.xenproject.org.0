Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15835DE14
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 08:33:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiYmq-0003Fl-5h; Wed, 03 Jul 2019 06:30:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aXhv=VA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hiYmo-0003Fc-5X
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 06:30:34 +0000
X-Inumbo-ID: 0c382f98-9d5c-11e9-9a2d-ef6e9ed5eb8e
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c382f98-9d5c-11e9-9a2d-ef6e9ed5eb8e;
 Wed, 03 Jul 2019 06:30:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6CE71ACB4;
 Wed,  3 Jul 2019 06:30:27 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-40-jgross@suse.com>
 <9c499d2e-a241-5ebb-b62c-70d189926621@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b5589b2f-1d8d-a2f2-036f-06b6233c9c08@suse.com>
Date: Wed, 3 Jul 2019 08:30:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9c499d2e-a241-5ebb-b62c-70d189926621@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 39/60] x86: optimize loading of GDT at
 context switch
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMTkgMTg6MDksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjgvMDUvMjAxOSAx
MTozMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW5zdGVhZCBvZiBkeW5hbWljYWxseSBkZWNp
ZGUgd2hldGhlciB0aGUgcHJldmlvdXMgdmNwdSB3YXMgdXNpbmcgZnVsbAo+IAo+ICJkZWNpZGlu
ZyIKPiAKPj4gb3IgZGVmYXVsdCBHRFQganVzdCBhZGQgYSBwZXJjcHUgdmFyaWFibGUgZm9yIHRo
YXQgcHVycG9zZS4gVGhpcyBhdAo+IAo+ICJ3YXMgdXNpbmcgYSBmdWxsIG9yIGRlZmF1bHQgR0RU
LCBqdXN0IGFkZCIKPiAKPj4gb25jZSByZW1vdmVzIHRoZSBuZWVkIGZvciB0ZXN0aW5nIHZjcHVf
aWRzIHRvIGRpZmZlciB0d2ljZS4KPj4KPj4gQ2FjaGUgdGhlIG5lZWRfZnVsbF9nZHQobmQpIHZh
bHVlIGluIGEgbG9jYWwgdmFyaWFibGUuCj4gCj4gV2hhdCdzIHRoZSBwb2ludCBvZiBkb2luZyB0
aGlzP8KgIEkga25vdyB0aGUgbG9naWMgaXMgcmF0aGVyIGNvbXBsaWNhdGVkCj4gaW4gX19jb250
ZXh0X3N3aXRjaCgpLCBidXQgYXQgbGVhc3QgaXQgaXMgdmlzdWFsbHkgY29uc2lzdGVudC7CoCBB
ZnRlcgo+IHRoaXMgY2hhbmdlLCBpdCBpcyBhc3ltbWV0cmljIGFuZCBoYXJkZXIgdG8gZm9sbG93
LgoKVGhpcyBpcyBhIGhvdCBwYXRoLiBuZWVkX2Z1bGxfZ2R0KCkgbmVlZHMgdHdvIGNvbXBhcmVz
LCBvZiB3aGljaCBvbmUgaXMKdXNpbmcgZXZhbHVhdGVfbm9zcGVjKCkuCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
