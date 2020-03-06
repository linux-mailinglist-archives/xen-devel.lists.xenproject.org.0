Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E213717B822
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 09:12:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA829-0004W1-N0; Fri, 06 Mar 2020 08:08:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D+BG=4X=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jA828-0004Vw-Ck
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 08:08:36 +0000
X-Inumbo-ID: ad30ce40-5f81-11ea-a75d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad30ce40-5f81-11ea-a75d-12813bfff9fa;
 Fri, 06 Mar 2020 08:08:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 569C9AF73;
 Fri,  6 Mar 2020 08:08:34 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200213125449.14226-1-jgross@suse.com>
 <20200213125449.14226-5-jgross@suse.com>
 <6f6bf0ce-045f-6c6c-fd98-bba72bcf89d1@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c9a90a26-b318-b93a-90fd-6df8292b3b55@suse.com>
Date: Fri, 6 Mar 2020 09:08:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6f6bf0ce-045f-6c6c-fd98-bba72bcf89d1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/8] xen: add locks with timeouts for
 keyhandlers
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDMuMjAgMTY6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjAyLjIwMjAgMTM6
NTQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE1vc3Qga2V5aGFuZGxlcnMgYXJlIHVzZWQgdG8g
ZHVtcCBoeXBlcnZpc29yIGRhdGEgdG8gdGhlIGNvbnNvbGUgYW5kCj4+IHRoZXkgYXJlIHVzZWQg
bW9zdGx5IGZvciBkZWJ1Z2dpbmcgcHVycG9zZXMuIEluIHRob3NlIGNhc2VzIGl0IG1pZ2h0Cj4+
IGhhcHBlbiB0aGF0IHNvbWUgZGF0YSBzdHJ1Y3R1cmVzIGFyZSBsb2NrZWQgYW5kIHRodXMgYXJl
IGJsb2NraW5nIHRoZQo+PiBoYW5kbGVyIHRvIGFjY2VzcyB0aGUgZGF0YS4KPj4KPj4gSW4gb3Jk
ZXIgdG8gYmUgYWJsZSB0byBzdGlsbCBnZXQgc29tZSBpbmZvcm1hdGlvbiBkb24ndCB1c2UgcGxh
aW4KPj4gbG9ja2luZyBmdW5jdGlvbnMgaW4gdGhlIGtleWhhbmRsZXJzLCBidXQgYSB2YXJpYW50
IG9mIHRyeWxvY2tzIHdpdGgKPj4gYSB0aW1lb3V0IHZhbHVlLiBUaGlzIGFsbG93cyB0byB3YWl0
IGZvciBzb21lIHRpbWUgYW5kIHRvIGdpdmUgdXAgaW4KPj4gY2FzZSB0aGUgbG9jayB3YXMgbm90
IG9idGFpbmVkLgo+Pgo+PiBBZGQgdGhlIG1haW4gaW5mcmFzdHJ1Y3R1cmUgZm9yIHRoaXMgZmVh
dHVyZSBpbmNsdWRpbmcgYSBuZXcgcnVudGltZQo+PiBwYXJhbWV0ZXIgYWxsb3dpbmcgdG8gc3Bl
Y2lmeSB0aGUgdGltZW91dCB2YWx1ZSBpbiBtaWxsaXNlY29uZHMuCj4+Cj4+IFVzZSB0aGUgbmV3
IGxvY2tpbmcgc2NoZW1lIGluIHRoZSBoYW5kbGVycyBkZWZpbmVkIGluIGtleWhhbmRsZXIuYy4K
PiAKPiBQZXJzb25hbGx5IEkgdGhpbmsgdHJ5bG9jayAoYXMgYWxyZWFkeSB1c2VkIGluIHNvbWUg
cGxhY2VzKSBpcyB0aGUKPiB3YXkgdG8gZ28uIElpcmMgb3RoZXJzIGRpc2FncmVlZCwgYnV0IGFs
c28gZGlkbid0IGxpa2UgdGhlIGFwcHJvYWNoCj4gdGFrZW4gaGVyZS4gSSdtIG5vdCBpbnRlbmRp
bmcgdG8gc3RhbmQgaW4gdGhlIHdheSBpZiBhIG1ham9yaXR5Cj4gYXBwcm92ZXMgb2YgdGhpcyBt
b2RlbCwgYnV0IEknbSBub3QgZ29pbmcgdG8gYWNrIHRoZXNlIGNoYW5nZXMKPiBteXNlbGYuCgpG
YWlyIGVub3VnaC4KCkJUVywgdHJ5bG9jayBpcyB1c2VkIGF0IGV4YWN0bHkgdGhyZWUgcGxhY2Vz
OiBmb3IgZHVtcGluZyB2TlVNQSwgTVNJIGFuZApsaXZlcGF0Y2ggaW5mby4KCkFuZCBUQkg6IHRo
ZSB2TlVNQSBjYXNlIGlzIHJlYWxseSBzdHJhbmdlLCBhcyB0aGlzIGlzIGEgcndsb2NrIHdoaWNo
IGlzCmhlbGQgYXMgd3JpdGVyIG9ubHkgaW4gb25lIHBsYWNlIGZvciBhIHZlcnkgYnJpZWYgdGlt
ZSBwZXJpb2Qgd2hlbgpmcmVlaW5nIHRoZSBkb21haW4ncyB2bnVtYSBkYXRhLgoKVGhlIE1TSSBj
YXNlIGlzIG1vcmUgY29tcGxpY2F0ZWQgYW5kIGxvb2tpbmcgYXQgaXQgaW4gbW9yZSBkZXRhaWwg
SSd2ZQpyZWFsaXplZCB0aGF0IHRoZXJlIGlzIGFub3RoZXIgdHJ5bG9jayBoaWRkZW4gaW4gYSBz
dWJmdW5jdGlvbjoKdnBjaV9tc2l4X2FyY2hfcHJpbnQoKS4gQXMgdnBjaV9tc2l4X2FyY2hfcHJp
bnQoKSB3aWxsIGRyb3AgdGhlIGxvY2sgaW4KdGhlIGVycm9yIGNhc2UgdGhlIGludGVyZmFjZSB0
byB0aGlzIGZ1bmN0aW9uIGlzIHJhdGhlciB3ZWlyZC4gSW4KYWRkaXRpb24gdGhlIG9jY2FzaW9u
YWwgc29mdGlycSBwcm9jZXNzaW5nIGlzIGVycm8gcHJvbmUsIHRvbywgYXMgaXQKd2lsbCBoYXBw
ZW4gb25seSBpZiBhIHNpbmdsZSBkb21haW4gaGFzIGF0IGxlYXN0IDY0IE1TSSBlbnRyaWVzLiBJ
biBjYXNlCm9mIGxvdHMgb2YgZG9tYWlucyB3aXRoIHVwIHRvIDYzIGVudHJpZXMgd2F0Y2hkb2cg
dGltZW91dHMgY2FuIHN0aWxsCmhhcHBlbiwgc28gSSdsbCBzZW5kIGEgcGF0Y2ggcmVwYWlyaW5n
IHRoaXMgaXNzdWUgYnkgbGV0dGluZwp2cGNpX21zaXhfYXJjaF9wcmludCgpIGR1bXAgb25seSBv
bmUgZW50cnkgYW5kIHB1dHRpbmcgdGhlIGxvb3AgYW5kCnNvZnRpcnEgaGFuZGxpbmcgaW50byB2
cGNpX2R1bXBfbXNpKCkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
