Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125CB10D41B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 11:31:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iadVs-0001BV-2Y; Fri, 29 Nov 2019 10:28:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iadVq-0001BO-IG
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 10:28:34 +0000
X-Inumbo-ID: fe7dd05e-1292-11ea-a3e0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe7dd05e-1292-11ea-a3e0-12813bfff9fa;
 Fri, 29 Nov 2019 10:28:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B5736BA2C;
 Fri, 29 Nov 2019 10:28:32 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Paul Durrant <pdurrant@amazon.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <98816869-c1db-52c1-baba-b878cde88d7a@suse.com>
Message-ID: <350c285e-424e-a722-b340-dbd3ea08c12f@suse.com>
Date: Fri, 29 Nov 2019 11:28:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <98816869-c1db-52c1-baba-b878cde88d7a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMToyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjguMTEuMjAxOSAx
Nzo1MiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxl
LmMKPj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+IEBAIC04NCwxMSArODQsNDAg
QEAgc3RydWN0IGdyYW50X3RhYmxlIHsKPj4gICAgICBzdHJ1Y3QgZ3JhbnRfdGFibGVfYXJjaCBh
cmNoOwo+PiAgfTsKPj4gIAo+PiArc3RhdGljIGludCBwYXJzZV9nbnR0YWJfbGltaXQoY29uc3Qg
Y2hhciAqcGFyYW0sIGNvbnN0IGNoYXIgKmFyZywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCAqdmFscCkKPj4gK3sKPj4gKyAgICBjb25zdCBjaGFyICplOwo+
PiArICAgIHVuc2lnbmVkIGxvbmcgdmFsOwo+PiArCj4+ICsgICAgdmFsID0gc2ltcGxlX3N0cnRv
dWwoYXJnLCAmZSwgMCk7Cj4+ICsgICAgaWYgKCAqZSApCj4+ICsgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+PiArCj4+ICsgICAgaWYgKCB2YWwgPiBJTlRfTUFYICkKPj4gKyAgICAgICAgcmV0dXJu
IC1FUkFOR0U7Cj4+ICsKPj4gKyAgICByZXR1cm4gMDsKPj4gK30KPiAKPiAqdmFscCBkb2Vzbid0
IGdldCB3cml0dGVuIHRvIGFueW1vcmUuIFdpdGggdGhpcyBmaXhlZCAoYW5kIG5vIG5ldwo+IGlz
c3VlcyBpbnRyb2R1Y2VkIDstKSApIGh5cGVydmlzb3Igc2lkZQo+IFJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBbmQgSSBndWVzcyBJIHNob3VsZCBoYXZlIGNs
YXJpZmllZDogSSdkIGJlIGZpbmUgYWRkaW5nIHRoZSBtaXNzaW5nCmFzc2lnbm1lbnQgd2hpbGUg
Y29tbWl0dGluZywgcHJvdmlkZWQgdGhlIHRvb2xzIHNpZGUgd29uJ3QgcmVxdWlyZQphbnkgY2hh
bmdlcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
