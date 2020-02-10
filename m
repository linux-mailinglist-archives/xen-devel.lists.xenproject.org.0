Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D313C157E08
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 16:01:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1AWa-0008LS-5F; Mon, 10 Feb 2020 14:59:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1AWY-0008LL-BH
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 14:58:58 +0000
X-Inumbo-ID: dcf37c2e-4c15-11ea-852a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcf37c2e-4c15-11ea-852a-bc764e2007e4;
 Mon, 10 Feb 2020 14:58:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C7FAAAC4B;
 Mon, 10 Feb 2020 14:58:56 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200203144340.4614-1-andrew.cooper3@citrix.com>
 <20200203144340.4614-3-andrew.cooper3@citrix.com>
 <89901b01-ba20-e099-cf06-a047abc88761@suse.com>
 <37637e68-1f88-8839-7686-3aeb294c99a9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7794018e-84fd-b9a4-6de0-f4a00fbd3be3@suse.com>
Date: Mon, 10 Feb 2020 15:59:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <37637e68-1f88-8839-7686-3aeb294c99a9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] AMD/IOMMU: Delete iommu_{get, set,
 clear}_bit() helpers
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDIuMjAyMCAxNTozOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNS8wMi8yMDIw
IDA5OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDMuMDIuMjAyMCAxNTo0MywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEBAIC04NSwxNiArODUsMTQgQEAgc3RhdGljIHZvaWQgZmx1c2hf
Y29tbWFuZF9idWZmZXIoc3RydWN0IGFtZF9pb21tdSAqaW9tbXUpCj4+PiAgICAgIGxvb3BfY291
bnQgPSAxMDAwOwo+Pj4gICAgICBkbyB7Cj4+PiAgICAgICAgICBzdGF0dXMgPSByZWFkbChpb21t
dS0+bW1pb19iYXNlICsgSU9NTVVfU1RBVFVTX01NSU9fT0ZGU0VUKTsKPj4+IC0gICAgICAgIGNv
bXBfd2FpdCA9IGdldF9maWVsZF9mcm9tX3JlZ191MzIoc3RhdHVzLAo+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9TVEFUVVNfQ09NUF9XQUlUX0lO
VF9NQVNLLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJ
T01NVV9TVEFUVVNfQ09NUF9XQUlUX0lOVF9TSElGVCk7Cj4+PiArICAgICAgICBjb21wX3dhaXQg
PSBzdGF0dXMgJiBJT01NVV9TVEFUVVNfQ09NUF9XQUlUX0lOVDsKPj4gVW5sZXNzIHlvdSBhbHNv
IGNoYW5nZSBjb21wX3dhaXQgdG8gYm9vbCwgdGhpcyBqdXN0IGhhcHBlbnMgdG8KPj4gYmUgY29y
cmVjdCB0aGlzIHdheSBiZWNhdXNlIG9mIHRoZSBiaXQgY2hlY2tlZCBiZWluZyBhdCBhIGxvdwo+
PiBlbm91Z2ggcG9zaXRpb24uCj4+Cj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
bWQvaW9tbXVfaW5pdC5jCj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9t
bXVfaW5pdC5jCj4+PiBAQCAtMzUxLDEzICszNTEsMTIgQEAgc3RhdGljIHZvaWQgaW9tbXVfcmVz
ZXRfbG9nKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LAo+Pj4gICAgICBCVUdfT04oIWlvbW11IHx8
ICgobG9nICE9ICZpb21tdS0+ZXZlbnRfbG9nKSAmJiAobG9nICE9ICZpb21tdS0+cHByX2xvZykp
KTsKPj4+ICAKPj4+ICAgICAgcnVuX2JpdCA9ICggbG9nID09ICZpb21tdS0+ZXZlbnRfbG9nICkg
Pwo+Pj4gLSAgICAgICAgSU9NTVVfU1RBVFVTX0VWRU5UX0xPR19SVU5fU0hJRlQgOgo+Pj4gLSAg
ICAgICAgSU9NTVVfU1RBVFVTX1BQUl9MT0dfUlVOX1NISUZUOwo+Pj4gKyAgICAgICAgSU9NTVVf
U1RBVFVTX0VWRU5UX0xPR19SVU4gOiBJT01NVV9TVEFUVVNfUFBSX0xPR19SVU47Cj4+PiAgCj4+
PiAgICAgIC8qIHdhaXQgdW50aWwgRXZlbnRMb2dSdW4gYml0ID0gMCAqLwo+Pj4gICAgICBkbyB7
Cj4+PiAgICAgICAgICBlbnRyeSA9IHJlYWRsKGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9TVEFU
VVNfTU1JT19PRkZTRVQpOwo+Pj4gLSAgICAgICAgbG9nX3J1biA9IGlvbW11X2dldF9iaXQoZW50
cnksIHJ1bl9iaXQpOwo+Pj4gKyAgICAgICAgbG9nX3J1biA9IGVudHJ5ICYgcnVuX2JpdDsKPj4g
U2FtZSBoZXJlIGZvciBsb2dfcnVuIHRoZW4uIEkgYWxzbyB0aGluayBydW5fYml0IHdvdWxkIGJl
dHRlcgo+PiBiZWNvbWUgdW5zaWduZWQgaW50IHRoZW4uCj4+Cj4+IFdpdGggdGhlc2UgdGFrZW4g
Y2FyZSBvZgo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
IAo+IEkgaGF2ZSBzZXBhcmF0ZSBjbGVhbnVwIGRvaW5nIHRoYXQgKGFuZCBtb3JlKS7CoCBJIGRv
bid0IHdhbnQgdG8gY29uZmxhdGUKPiB1bnJlbGF0ZWQgY2hhbmdlcyAtIHRoaXMgcGF0Y2ggaXMg
Y29tcGxpY2F0ZWQgZW5vdWdoIHRvIGZvbGxvdy4KCkJ1dCBzdHJpY3RseSBzcGVha2luZyB0aGUg
YXNzaWdubWVudHMgZW5kIHVwIHdyb25nIHRoaXMgd2F5LiBJZgp5b3UgcmVhbGx5IHRoaW5rIHN1
Y2ggKGJlbmlnbikgd3JvbmduZXNzIGlzIG9rYXksIHRoZW4gbWF5IEkKcGxlYXNlIGFzayB0aGF0
IHlvdSBwb2ludCBvdXQgdGhpcyBhc3BlY3QgaW4gaGFsZiBhIHNlbnRlbmNlIGluCnRoZSBkZXNj
cmlwdGlvbj8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
