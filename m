Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1F916813A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:14:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59xM-0007cL-KX; Fri, 21 Feb 2020 15:11:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j59xL-0007cF-3H
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 15:11:07 +0000
X-Inumbo-ID: 61e8587e-54bc-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61e8587e-54bc-11ea-bc8e-bc764e2007e4;
 Fri, 21 Feb 2020 15:11:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9100B278;
 Fri, 21 Feb 2020 15:11:05 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <20200221142635.GA4679@Air-de-Roger>
 <41526075-cab4-064b-dbd5-3d4667bb6309@suse.com>
 <20200221144924.GC4679@Air-de-Roger>
 <270e3f03-a1e8-1cf8-af82-e7fed515985a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <34865479-4175-7ae6-3dc7-432746d8a1e1@suse.com>
Date: Fri, 21 Feb 2020 16:11:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <270e3f03-a1e8-1cf8-af82-e7fed515985a@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxNTo1NiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDIxLzAyLzIwMjAg
MTQ6NDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIEZyaSwgRmViIDIxLCAyMDIwIGF0
IDAzOjQxOjU5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gQmVjYXVzZSB5b3UgbmVl
ZCB0byBpbnZva2Ugc21wX3Byb2Nlc3Nvcl9pZCgpIHRvIGNhbGN1bGF0ZSB0aGUgdmFsdWUKPj4+
IHRvIHVzZSBpbiB0aGUgc3VidHJhY3Rpb24uIEknbSBub3QgbWVhbmluZyB0byBzYXkgSSdtIGVu
dGlyZWx5Cj4+PiBvcHBvc2VkIChzZWVpbmcgaG93IG11Y2ggb2YgYSBkaXNjdXNzaW9uIHdlJ3Jl
IGhhdmluZyksIGJ1dCB0aGUKPj4+ICJzaW1wbGUgd3JpdGUgb2YgemVybyIgYXBwcm9hY2ggaXMg
Y2VydGFpbmx5IGFwcGVhbGluZy4KPj4KPj4gV2VsbCwgd2UgY291bGQgYXZvaWQgdGhlIHNtcF9w
cm9jZXNzb3JfaWQoKSBjYWxsIGFuZCBpbnN0ZWFkIHVzZToKPj4KPj4gYXRvbWljX3N1YihhdG9t
aWNfcmVhZCgmbG9jay0+Y250cykgJiAweGZmZmYsICZsb2NrLT5jbnRzKTsKPiAKPiBBRkFJQ1Qs
IHRoaXMgd291bGQgbm90IGJlIHNhZmUgYmVjYXVzZSB0aGUgdG9wIDE2LWJpdCBtYXkgY2hhbmdl
IGJlaGluZCAKPiB5b3VyIGJhY2sgKHZpYSBhIHJlYWRfbG9jaykuCgpCdXQgdGhlbSBjaGFuZ2lu
ZyBiZXR3ZWVuIHRoZSBhdG9taWNfcmVhZCgpIGFuZCB0aGUgYXRvbWljX3N1YigpCmlzIGZpbmUu
IFRoZSBzdWIgdGhlbiB3aWxsIHN0aWxsIG9ubHkgYWZmZWN0IHRoZSBsb3cgYml0cywgbGVhdmlu
Zwp0aGUgaGlnaCBvbmVzIGFzIHRoZXkgd2VyZSAocG90ZW50aWFsbHkgYXMgdXBkYXRlZCBhZnRl
ciB0aGUgcmVhZCkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
