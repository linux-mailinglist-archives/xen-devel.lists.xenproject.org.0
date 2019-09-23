Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B45FCBAF99
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 10:31:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCJii-00060F-5K; Mon, 23 Sep 2019 08:29:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCJig-00060A-7r
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 08:29:18 +0000
X-Inumbo-ID: 3b3c0c23-dddc-11e9-95f6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b3c0c23-dddc-11e9-95f6-12813bfff9fa;
 Mon, 23 Sep 2019 08:29:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 710A4AFC2;
 Mon, 23 Sep 2019 08:29:16 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c5ffff18-bded-486d-5883-da1f6e091d51@suse.com>
Message-ID: <6b9ca7a2-e2c4-5662-7f56-b1cceac75c67@suse.com>
Date: Mon, 23 Sep 2019 10:29:15 +0200
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
cyBwb2ludC4KPiAKPiBBbHNvIHphcCBsZWFmIDQgKGFuZCBhdCB0aGUgc2FtZSB0aW1lIGxlYWYg
MikgRURYIG91dHB1dCBmb3IgQU1ELCBhcyBpdAo+IHNob3VsZCBoYXZlIGJlZW4gZnJvbSB0aGUg
YmVnaW5uaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiAtLS0KPiB2MjogRHJvcCB1c2Ugb2YgcGh5c2luZm8uIERyb3AgSW50ZWwtb25seSBs
ZWFmIDQgY2hhbmdlLiBJbmNyZW1lbnQKPiAgICAgQXBpY0lkQ29yZVNpemUgb25seSB3aGVuIGRv
dWJsaW5nIE51bWJlck9mQ29yZXMuCgpUaGlua2luZyBhYm91dCBpdCBzb21lIG1vcmUsIGRyb3Bw
aW5nIHRoZSBsZWFmIDQgY2hhbmdlIHNlZW1zIGF0IGxlYXN0CnNvbWV3aGF0IHJpc2t5IHRvIG1l
LiBUaGlzIGJlaW5nIGp1c3QgYSA2LWJpdCBmaWVsZCAoYW5kIGVmZmVjdGl2ZWx5CmFscmVhZHkg
c2F0dXJhdGluZyBpbiBhIHdheSwgYXQgbGVhc3Qgd2hlbiBwb3dlci1vZi10d28gbWF4aW11bSBj
b3JlCmNvdW50cyBhcmUgaW52b2x2ZWQpLCBhbmQgaGVuY2UgdGhlcmUgYmVpbmcgMiBiaXRzIG9m
ICJwbGF5aW5nIHJvb20iCmJldHdlZW4gdGhpcyBhbmQgdGhlIGludm9sdmVkIGxlYWYgMSBmaWVs
ZCwgdGhlIGNhbGN1bGF0aW9uIHRoZXJlIG5vdApnZXR0aW5nIGFkanVzdGVkIGlzIHN0aWxsIGEg
bGF0ZW50IHJpc2sgaW1vIHdpdGggZ3Vlc3Qgc2lkZSBjYWxjdWxhdGlvbnMKbGlrZSB0aGlzIG9u
ZQoKCXNtcF9udW1fc2libGluZ3MgPSBzbXBfbnVtX3NpYmxpbmdzIC8gYy0+eDg2X21heF9jb3Jl
czsKCmZvdW5kIGluIGJhc2ljYWxseSBhbGwgdmVyc2lvbnMgb2YgTGludXggKHdoZXJlIGNlcnRh
aW4gZnVuY3Rpb25zLAplLmcuIGFwaWNfaWRfaXNfcHJpbWFyeV90aHJlYWQoKSwgd29uJ3QgY29w
ZSB3aXRoIHNtcF9udW1fc2libGluZ3MKZW5kaW5nIHVwIGFzIHplcm8sIHdoaWxlIG90aGVycywg
ZS5nLiB0b3BvbG9neV9zbXRfc3VwcG9ydGVkKCksIGRvKS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
