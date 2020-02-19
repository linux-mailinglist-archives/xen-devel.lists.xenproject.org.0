Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A8164496
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 13:46:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Oih-0002Js-Rz; Wed, 19 Feb 2020 12:44:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4Oig-0002Jj-AH
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 12:44:50 +0000
X-Inumbo-ID: 9dabc880-5315-11ea-aa99-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dabc880-5315-11ea-aa99-bc764e2007e4;
 Wed, 19 Feb 2020 12:44:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1D26EB261;
 Wed, 19 Feb 2020 12:43:53 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200219111904.82092-1-roger.pau@citrix.com>
 <02015cac-7bce-7247-9861-f0da21f86a3d@citrix.com>
 <20200219113216.GY4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <56bf6ea0-947d-4dd3-1dac-65862cd337ed@suse.com>
Date: Wed, 19 Feb 2020 13:43:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200219113216.GY4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] amd/iommu: add missing unlock in
 iommu_read_log
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxMjozMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAxOSwgMjAyMCBhdCAxMToyMzo0MEFNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBP
biAxOS8wMi8yMDIwIDExOjE5LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+PiAtLS0gYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4+PiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4+PiBAQCAtMzM4LDYgKzMzOCw3IEBAIHN0
YXRpYyBpbnQgaW9tbXVfcmVhZF9sb2coc3RydWN0IGFtZF9pb21tdSAqaW9tbXUsCj4+PiAgICAg
ICAgICAgICAgewo+Pj4gICAgICAgICAgICAgICAgICBBTURfSU9NTVVfREVCVUcoIkFNRC1WaTog
Tm8gZW50cnkgd3JpdHRlbiB0byAlcyBMb2dcbiIsCj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsb2cgPT0gJmlvbW11LT5ldmVudF9sb2cgPyAiRXZlbnQiIDogIlBQUiIpOwo+
Pj4gKyAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmbG9nLT5sb2NrKTsKPj4KPj4gQSBnb3Rv
IG91dCB3b3VsZCBiZSBjbGVhbmVyLsKgIENhbiBmaXggdXAgb24gY29tbWl0IGlmIHlvdSdyZSBo
YXBweT8KPiAKPiBUaGF0J3MgZmluZSwgSSBkb24ndCBoYXZlIGEgcHJlZmVyZW5jZS4gSW4gc3Vj
aCBjYXNlcyB3aGVyZSBhIHNpbXBsZQo+IHVubG9jayBpcyByZXF1aXJlZCBJIHRlbmQgdG8gYXZv
aWQgdGhlIGxhYmVsIGFzIEkga25vdyBKYW4gcHJlZmVycwo+IGF2b2lkaW5nIHRoZW0uCgpJIGFw
cHJlY2lhdGUgdGhpcywgeWV0IEkgYWNjZXB0IG90aGVycyB0aGlua2luZyBkaWZmZXJlbnRseS4g
VGhlCm9ubHkgY2FzZSB3aGVyZSBJIG91dHJpZ2h0IG9iamVjdCB0byAiZ290byIgaXMgaWYgdGhl
IHRhcmdldApzaW1wbHkgZG9lcyAicmV0dXJuIiBvciBzb21lIHN1Y2guIENlbnRyYWxpemluZyB1
bmxvY2tpbmcgaW4gYQpzaW5nbGUgcGxhY2UgaXMgYWNjZXB0YWJsZSB0byBtZSwgYWxiZWl0IHBl
cmhhcHMgbm90IHByZWZlcnJlZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
