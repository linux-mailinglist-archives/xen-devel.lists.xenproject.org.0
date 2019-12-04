Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DCF112FAE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:10:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icXBv-0004oJ-IG; Wed, 04 Dec 2019 16:07:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icXBt-0004oE-VS
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 16:07:49 +0000
X-Inumbo-ID: 3727855a-16b0-11ea-8206-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3727855a-16b0-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 16:07:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CBAE3B021;
 Wed,  4 Dec 2019 16:07:47 +0000 (UTC)
To: Julien Grall <jgrall@amazon.com>
References: <20191128093828.8462-1-pdurrant@amazon.com>
 <33cd176f-074f-9c3a-1ba6-7a1b40f604ed@suse.com>
 <b39e656f-47a2-0132-1dd4-e6a3a9c3607a@oracle.com>
 <6992520f-c191-8282-d0f2-74713cfe0e54@amazon.com>
 <14C0E8CA-60F6-4903-8AC5-A7285F283A4E@ORACLE.COM>
 <e17569a6-d47c-63e7-e11d-9920435b711a@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <16886ce8-379b-2577-8fea-fac21f7abc5c@suse.com>
Date: Wed, 4 Dec 2019 17:08:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e17569a6-d47c-63e7-e11d-9920435b711a@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen/x86: vpmu: Unmap per-vCPU PMU page
 when the domain is destroyed
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <BORIS.OSTROVSKY@ORACLE.COM>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxNzowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDA0LzEy
LzIwMTkgMTU6NTksIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4KPj4KPj4+IE9uIERlYyA0LCAy
MDE5LCBhdCAxMDo1NSBBTSwgSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4gd3JvdGU6
Cj4+Pgo+Pj4gSGkgQm9yaXMsCj4+Pgo+Pj4gT24gMjgvMTEvMjAxOSAyMTo1MCwgQm9yaXMgT3N0
cm92c2t5IHdyb3RlOgo+Pj4+IE9uIDExLzI4LzE5IDU6MjMgQU0sIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+PiBPbiAyOC4xMS4yMDE5IDEwOjM4LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4+Cj4+
Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L3ZwbXUuYwo+Pj4+Pj4gKysrIGIveGVuL2FyY2gv
eDg2L2NwdS92cG11LmMKPj4+Pj4+IEBAIC01NzYsMTEgKzU3NiwzNiBAQCBzdGF0aWMgdm9pZCB2
cG11X2FyY2hfZGVzdHJveShzdHJ1Y3QgdmNwdSAqdikKPj4+Pj4+ICAgICAgICAgICAgICB2cG11
LT5hcmNoX3ZwbXVfb3BzLT5hcmNoX3ZwbXVfZGVzdHJveSh2KTsKPj4+Pj4+ICAgICAgIH0KPj4+
Pj4+ICsKPj4+Pj4+ICsgICAgdnBtdV9yZXNldCh2cG11LCBWUE1VX0NPTlRFWFRfQUxMT0NBVEVE
KTsKPj4+Pj4+ICAgfQo+Pj4+PiBCb3JpcywgdG8gYmUgb24gdGhlIHNhZmUgc2lkZSAtIGFyZSB5
b3UgaW4gYWdyZWVtZW50IHdpdGggdGhpcwo+Pj4+PiBjaGFuZ2UsIG5vdyB0aGF0IHRoZSBzZXR0
aW5nIG9mIHRoZSBmbGFnIGlzIGJlaW5nIGxlZnQgdW50b3VjaGVkPwo+Pj4+IFllcywgdGhpcyBp
cyBmaW5lLgo+Pj4KPj4+IENhbiB3ZSB0YWtlIHRoaXMgYXMgYW4gQUNLPwo+Pgo+Pgo+PiBZZXMs
IG9mIGNvdXJzZS4KPiAKPiBUaGFuayB5b3UhCj4gCj4gQEFuZHJldywgQEphbjogdGhpcyBpcyB4
ODYgY29kZSwgYnV0IEkgYW0gaGFwcHkgdG8gY29tbWl0IGl0IGlmIHlvdSBwcmVmZXIuCgpJdCBo
YXMgYmVlbiBjb21taXR0ZWQgYWxyZWFkeS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
