Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B6DB9147
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 15:59:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBJOX-0007W7-OA; Fri, 20 Sep 2019 13:56:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBJOW-0007W1-EJ
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 13:56:20 +0000
X-Inumbo-ID: 6bed2764-dbae-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bed2764-dbae-11e9-978d-bc764e2007e4;
 Fri, 20 Sep 2019 13:56:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0BBF3ACA0;
 Fri, 20 Sep 2019 13:56:19 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c5ffff18-bded-486d-5883-da1f6e091d51@suse.com>
Message-ID: <924dbb6b-1fcb-de5a-32ac-8439324ad4d4@suse.com>
Date: Fri, 20 Sep 2019 15:56:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c5ffff18-bded-486d-5883-da1f6e091d51@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] libxc/x86: avoid overflow in CPUID APIC
 ID adjustments
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMjAxOSAxNTo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gUmVjZW50IEFNRCBwcm9j
ZXNzb3JzIG1heSByZXBvcnQgdXAgdG8gMTI4IGxvZ2ljYWwgcHJvY2Vzc29ycyBpbiBDUFVJRAo+
IGxlYWYgMS4gRG91YmxpbmcgdGhpcyB2YWx1ZSBwcm9kdWNlcyAwICh3aGljaCBPU2VzIHNpbmNl
cmVseSBkaXNsaWtlKSwKPiBhcyB0aGUgcmVzcGVjdGl2ZSBmaWVsZCBpcyBvbmx5IDggYml0cyB3
aWRlLiBTdXBwcmVzcyBkb3VibGluZyB0aGUgdmFsdWUKPiAoYW5kIGl0cyBsZWFmIDB4ODAwMDAw
MDggY291bnRlcnBhcnQpIGluIHN1Y2ggYSBjYXNlLgo+IAo+IE5vdGUgdGhhdCB3aGlsZSB0aGVy
ZSdzIGEgc2ltaWxhciBvdmVyZmxvdyBpbiBpbnRlbF94Y19jcHVpZF9wb2xpY3koKSwKPiB0aGF0
IG9uZSBpcyBiZWluZyBsZWZ0IGFsb25lIGZvciBub3cuCj4gCj4gTm90ZSBmdXJ0aGVyIHRoYXQg
d2hpbGUgaXQgd2FzIGNvbnNpZGVyZWQgdG8gc3VwcHJlc3MgdGhlIG11bHRpcGxpY2F0aW9uCj4g
YnkgMiBhbHRvZ2V0aGVyIGlmIHRoZSBob3N0IHRvcG9sb2d5IGFscmVhZHkgcHJvdmlkZXMgYXQg
bGVhc3Qgb25lIGJpdAo+IG9mIHRocmVhZCBJRCB3aXRoaW4gQVBJQyBJRHMsIGl0IHdhcyBkZWNp
ZGVkIHRvIGF2b2lkIG1vcmUgY2hhbmdlIGhlcmUKPiB0aGFuIHJlYWxseSBuZWVkZWQgYXQgdGhp
cyBwb2ludC4KCkdpdmVuIHRoaXMgSSd2ZSBqdXN0IGNoYW5nZWQgdGhlIHRpdGxlIHRvICJhdm9p
ZCBjZXJ0YWluIG92ZXJmbG93cyBpbgpDUFVJRCBBUElDIElEIGFkanVzdG1lbnRzIi4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
