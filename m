Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A601345D4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:10:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipCvc-0001bf-GP; Wed, 08 Jan 2020 15:07:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipCva-0001bW-9K
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:07:22 +0000
X-Inumbo-ID: 8cd49be4-3228-11ea-a38f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cd49be4-3228-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 15:07:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D733BADE0;
 Wed,  8 Jan 2020 15:07:12 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <223c0294-f769-22fb-5958-e4ede84241af@suse.com>
Date: Wed, 8 Jan 2020 16:07:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/MCE: correct struct mcinfo_extended for
 compat guests
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHVzZSBvZiBhbnkga2luZCBvZiBwb2ludGVycyBpbiB0aGUgcHVibGljIGludGVyZmFjZSBp
cyB3cm9uZywKaW5jbHVkaW5nIGRpbWVuc2lvbmluZyBhcnJheXMgYmFzZWQgb24gdGhlIHNpemUg
b2YgcG9pbnRlcnMuIFRoZSBsZWFzdApiYWQgb3B0aW9uIG9mIGFkZHJlc3NpbmcgdGhlIGlzc3Vl
IGxvb2tzIHRvIGJlIHRvIHBpbiBkb3duIHRoZSBudW1iZXIKdGhhdCB0aGUgKDY0LWJpdCkgaHlw
ZXJ2aXNvciBoYXMgdXNlZCBhbnl3YXkgKGV2ZW4gd2hlbiBwYXNzaW5nIAppbmZvcm1hdGlvbiB0
byBjb21wYXQgYnV0IHByaXZpbGVnZWQgZ3Vlc3RzKS4gVGhlcmUgYXJlbid0IGFjdHVhbAppbnN0
YW50aWF0aW9ucyBvZiB0aGUgc3RydWN0dXJlIGFwYXJ0IGZyb20gb25lcyBhbGxvY2F0ZWQgZHlu
YW1pY2FsbHkKb3V0IG9mIHN0cnVjdCBtY19pbmZvJ3MgbWlfZGF0YVtdLCB3aGljaCBpcyBlbnRp
cmVseSBjb250cm9sbGVkIGJ5IHRoZQpoeXBlcnZpc29yLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gt
eDg2L3hlbi1tY2EuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYveGVuLW1jYS5o
CkBAIC0xNzAsOSArMTcwLDkgQEAgc3RydWN0IG1jaW5mb19leHRlbmRlZCB7CiAgICAgLyoKICAg
ICAgKiBDdXJyZW50bHkgSW50ZWwgZXh0ZW5kZWQgTVNSICgzMi82NCkgaW5jbHVkZSBhbGwgZ3Ag
cmVnaXN0ZXJzCiAgICAgICogYW5kIEUoUilGTEFHUywgRShSKUlQLCBFKFIpTUlTQywgdXAgdG8g
MTEvMTkgb2YgdGhlbSBtaWdodCBiZQotICAgICAqIHVzZWZ1bCBhdCBwcmVzZW50LiBTbyBleHBh
bmQgdGhpcyBhcnJheSB0byAxNi8zMiB0byBsZWF2ZSByb29tLgorICAgICAqIHVzZWZ1bCBhdCBw
cmVzZW50LiBTbyBleHBhbmQgdGhpcyBhcnJheSB0byAzMiB0byBsZWF2ZSByb29tLgogICAgICAq
LwotICAgIHN0cnVjdCBtY2luZm9fbXNyIG1jX21zcltzaXplb2Yodm9pZCAqKSAqIDRdOworICAg
IHN0cnVjdCBtY2luZm9fbXNyIG1jX21zclszMl07CiB9OwogCiAvKiBSZWNvdmVyeSBBY3Rpb24g
ZmxhZ3MuIEdpdmluZyByZWNvdmVyeSByZXN1bHQgaW5mb3JtYXRpb24gdG8gRE9NMCAqLwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
