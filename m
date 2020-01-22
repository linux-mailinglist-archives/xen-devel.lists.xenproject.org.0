Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC716145787
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:14:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuGjl-0005hC-P1; Wed, 22 Jan 2020 14:12:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuGjk-0005h7-W9
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:12:05 +0000
X-Inumbo-ID: 2571bc8a-3d21-11ea-8e9a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2571bc8a-3d21-11ea-8e9a-bc764e2007e4;
 Wed, 22 Jan 2020 14:11:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 70572AD69;
 Wed, 22 Jan 2020 14:11:55 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200117110811.43321-1-roger.pau@citrix.com>
 <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
 <20200120171840.GF11756@Air-de-Roger>
 <96edb88c-5ae3-22a1-913d-83f76c925270@suse.com>
 <20200121102941.GH11756@Air-de-Roger>
 <624c69b6-9a9d-7719-fdec-1c6e939a9f65@suse.com>
 <20200121155708.GI11756@Air-de-Roger>
 <ddac90c5-2fe5-ba92-d7ab-f258f483521d@suse.com>
 <20200121165758.GK11756@Air-de-Roger>
 <73a7af47-bcf6-50f9-8901-e8c2da2ac908@suse.com>
 <20200122105155.GA57924@desktop-tdan49n.eng.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4345fd83-523e-7209-727e-77d6a36cef01@suse.com>
Date: Wed, 22 Jan 2020 15:12:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200122105155.GA57924@desktop-tdan49n.eng.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/hvmloader: round up memory BAR size
 to 4K
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAxMTo1MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEph
biAyMiwgMjAyMCBhdCAxMToyNzoyNEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjEuMDEuMjAyMCAxNzo1NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IFRoZSBQQ0kgc3Bl
YyBhY3R1YWxseSByZWNvbW1lbmRzIG1lbW9yeSBCQVJzIHRvIGJlIGF0IGxlYXN0IG9mIHBhZ2UK
Pj4+IHNpemUsIGJ1dCB0aGF0J3Mgbm90IGEgc3RyaWN0IHJlcXVpcmVtZW50LiBJIHdvdWxkIGhv
cGUgdGhlcmUgYXJlbid0Cj4+PiB0aGF0IG1hbnkgZGV2aWNlcyB3aXRoIG1lbW9yeSBCQVJzIHNt
YWxsZXIgdGhhbiBhIHBhZ2UuCj4+Cj4+IEkndmUgc2ltcGx5IGdvbmUgYW5kIGdyZXAtZWQgYWxs
IHRoZSBzdG9yZWQgbHNwY2kgb3V0cHV0IEkgaGF2ZQo+PiBmb3Igc29tZSBvZiB0aGUgdGVzdCBz
eXN0ZW1zIEkgaGF2ZSBoZXJlOgo+Pgo+PiAwLzEyCj4+IDMvMzEgKGFsbCA0ay1hbGlnbmVkKQo+
PiA2LzEzIChhbGwgNGstYWxpZ25lZCkKPj4gMy8xMgo+PiA2LzE5IChhbGwgNGstYWxpZ25lZCkK
Pj4gMy83IChhbGwgNGstYWxpZ25lZCkKPiAKPiBXaGF0IGRvZXMgWC9ZIGF0IHRoZSBiZWdpbm5p
bmcgb2YgdGhlIGxpbmUgc3RhbmQgZm9yPwoKPG51bWJlci1vZi1sZXNzLXRoYW4tNGstQkFScz4g
LyA8dG90YWwtbnVtYmVyLW9mLUJBUnM+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
