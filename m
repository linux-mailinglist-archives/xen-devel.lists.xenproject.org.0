Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66537FDBB3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 11:49:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVZ8n-0004Hn-1t; Fri, 15 Nov 2019 10:47:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVZ8m-0004Hi-2x
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 10:47:48 +0000
X-Inumbo-ID: 5ae1a5e0-0795-11ea-a264-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ae1a5e0-0795-11ea-a264-12813bfff9fa;
 Fri, 15 Nov 2019 10:47:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2BB3CAFD4;
 Fri, 15 Nov 2019 10:47:44 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <31625143-edf7-2517-b4a0-c49b8b242934@suse.com>
Message-ID: <eb364fd9-cbaa-fc52-5205-2961823b324a@suse.com>
Date: Fri, 15 Nov 2019 11:48:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <31625143-edf7-2517-b4a0-c49b8b242934@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 1/2] x86: fix clang .macro retention check
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgd2VyZSB0d28gcHJvYmxlbXMgaGVyZTogVGhlIGZpcnN0IGNsb3NpbmcgcGFyZW50aGVz
ZXMgZ290IHBhcnNlZApieSBtYWtlIHRvIGVuZCB0aGUgJChjYWxsIGludm9jYXRpb24sIGFuZCB0
aGUgZXNjYXBpbmcgb2YgdGhlIHF1b3Rlcwp3YXNuJ3QgcmlnaHQgZWl0aGVyLCBhcyB0aGVyZSdz
IG5vd2hlcmUgdGhleSB3b3VsZCBnZXQgdW4tZXNjYXBlZC4KCkZ1cnRoZXJtb3JlIHRoZXJlIGFw
cGVhcnMgdG8gYmUgYSBwdXp6bGluZyBwcm9ibGVtIHdpdGggXG4gZ2V0dGluZwpleHBhbmRlZCB0
byBhbiBhY3R1YWwgbmV3bGluZSB0b28gZWFybHkgaW4gc29tZSBlbnZpcm9ubWVudHMuIENvbnZl
cnQKdGhlc2UgdG8gc2VtaWNvbG9ucyBhdCB0aGUgc2FtZSB0aW1lLgoKU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IEFsc28gcmVwbGFjZSBcbiBi
eSBzZW1pY29sb25zLgoKVGhpcyBuZWVkcyB0byBiZSB0ZXN0ZWQgaW4gYW4gZW52aXJvbm1lbnQg
d2hlcmUgdGhpcyB3YXMgYWN0dWFsbHkgZm91bmQKdG8gbWF0dGVyOyBJIGNhbid0IHNlZSBob3cg
aXQgY2FuIGhhdmUgd29ya2VkIGluIGl0cyBmb3JtZXIgc2hhcGUuIEkKYWxzbyBkb24ndCB1bmRl
cnN0YW5kIHdoeSB0aGUgc2FtZSBjb21taXQgaW50cm9kdWNpbmcgdGhlIGNoZWNrIHRoYXQKZ2V0
cyBmaXhlZCBoZXJlIHB1dCB0aGUgLnNraXAgY2hlY2sgaW4geGVuL1J1bGVzLm1rIC0gdGhlIG9u
bHkgdXNlIG9mCi5za2lwIHRoYXQgSSBjYW4gc3BvdCBpcyBpbiB4ODYgY29kZS4KCi0tLSBhL0Nv
bmZpZy5taworKysgYi9Db25maWcubWsKQEAgLTYsNiArNiw4IEBAIGVuZGlmCiAKICMgQ29udmVu
aWVudCB2YXJpYWJsZXMKIGNvbW1hICAgOj0gLAorb3BlbiAgICA6PSAoCitjbG9zZSAgIDo9ICkK
IHNxdW90ZSAgOj0gJwogIycgQmFsYW5jaW5nIHNxdW90ZSwgdG8gaGVscCBzeW50YXggaGlnaGxp
Z2h0aW5nCiBlbXB0eSAgIDo9Ci0tLSBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5taworKysgYi94ZW4v
YXJjaC94ODYvUnVsZXMubWsKQEAgLTgxLDYgKzgxLDYgQEAgJChjYWxsIGFzLW9wdGlvbi1hZGQs
Q0ZMQUdTLENDLCIuaW5jbHVkZQogIyBDaGVjayB3aGV0aGVyIGNsYW5nIGtlZXBzIC5tYWNyby1z
IGJldHdlZW4gYXNtKCktczoKICMgaHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9p
ZD0zNjExMAogJChjYWxsIGFzLW9wdGlvbi1hZGQsQ0ZMQUdTLENDLFwKLSAgICAgICAgICAgICAg
ICAgICAgICIubWFjcm8gRk9PXG4uZW5kbVwiKTsgYXNtIHZvbGF0aWxlIChcIi5tYWNybyBGT09c
bi5lbmRtIixcCisgICAgICAgICAgICAgICAgICAgICAiLm1hY3JvIEZPTzsuZW5kbSIkJChjbG9z
ZSk7IGFzbSB2b2xhdGlsZSAkJChvcGVuKSIubWFjcm8gRk9POy5lbmRtIixcCiAgICAgICAgICAg
ICAgICAgICAgICAtbm8taW50ZWdyYXRlZC1hcykKIGVuZGlmCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
