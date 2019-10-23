Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D132CE1D3D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:48:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGxu-00039a-DW; Wed, 23 Oct 2019 13:46:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNGxs-00039I-Au
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:46:16 +0000
X-Inumbo-ID: 7b310da6-f59b-11e9-947e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b310da6-f59b-11e9-947e-12813bfff9fa;
 Wed, 23 Oct 2019 13:46:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1942DBAA6;
 Wed, 23 Oct 2019 13:46:14 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191023121209.4814-1-jgross@suse.com>
 <20191023125548.GS17494@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4d72d941-791f-6129-6069-535ac3c035eb@suse.com>
Date: Wed, 23 Oct 2019 15:46:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023125548.GS17494@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pvhsim: fix cpu onlining
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTQ6NTUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gV2VkLCBPY3Qg
MjMsIDIwMTkgYXQgMDI6MTI6MDlQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gU2lu
Y2UgY29tbWl0IDhkM2MzMjZmNjc1NmQxICgieGVuOiBsZXQgdmNwdV9jcmVhdGUoKSBzZWxlY3Qg
cHJvY2Vzc29yIikKPj4gdGhlIGluaXRpYWwgcHJvY2Vzc29yIGZvciBhbGwgcHYtc2hpbSB2Y3B1
cyB3aWxsIGJlIDAsIGFzIG5vIG90aGVyIGNwdXMKPj4gYXJlIG9ubGluZSB3aGVuIHRoZSB2Y3B1
cyBhcmUgY3JlYXRlZC4gQmVmb3JlIHRoYXQgY29tbWl0IHRoZSB2Y3B1cwo+PiB3b3VsZCBoYXZl
IHByb2Nlc3NvcnMgc2V0IG5vdCBiZWluZyBvbmxpbmUgeWV0LCB3aGljaCB3b3JrZWQganVzdCBi
eQo+PiBjaGFuY2UuCj4+Cj4+IFdoZW4gdGhlIHB2LXNoaW0gdmNwdSBiZWNvbWVzIGFjdGl2ZSBp
dCB3aWxsIGhhdmUgYSBoYXJkIGFmZmluaXR5Cj4+IG5vdCBtYXRjaGluZyBpdHMgaW5pdGlhbCBw
cm9jZXNzb3IgYXNzaWdubWVudCBsZWFkaW5nIHRvIGZhaWxpbmcKPj4gQVNTRVJUKClzIG9yIG90
aGVyIHByb2JsZW1zIGRlcGVuZGluZyBvbiB0aGUgc2VsZWN0ZWQgc2NoZWR1bGVyLgo+Pgo+PiBG
aXggdGhhdCBieSBkb2luZyB0aGUgYWZmaW5pdHkgc2V0dGluZyBhZnRlciBvbmxpbmluZyB0aGUg
Y3B1IGJ1dAo+PiBiZWZvcmUgdGFraW5nIHRoZSB2Y3B1IHVwLiBGb3IgdmNwdSAwIHRoaXMgaXMg
c3RpbGwgaW4KPj4gc2NoZWRfc2V0dXBfZG9tMF92Y3B1cygpLCBmb3IgdGhlIG90aGVyIHZjcHVz
IHNldHRpbmcgdGhlIGFmZmluaXR5Cj4+IHRoZXJlIGNhbiBiZSBkcm9wcGVkLgo+Pgo+PiBGaXhl
czogOGQzYzMyNmY2NzU2ZDEgKCJ4ZW46IGxldCB2Y3B1X2NyZWF0ZSgpIHNlbGVjdCBwcm9jZXNz
b3IiKQo+PiBSZXBvcnRlZC1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXgu
Y29tPgo+PiBUZXN0ZWQtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNv
bT4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IAo+
IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFu
ZCBqdXN0IGZvciB0aGUgcHJvdG9jb2w6CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
