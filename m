Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24041C0628
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 15:18:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDq6A-0004oP-NJ; Fri, 27 Sep 2019 13:15:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAPT=XW=amazon.com=prvs=166d6d219=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDq69-0004oK-3i
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 13:15:49 +0000
X-Inumbo-ID: eb2112be-e128-11e9-9678-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id eb2112be-e128-11e9-9678-12813bfff9fa;
 Fri, 27 Sep 2019 13:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569590147; x=1601126147;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=PJYhbUK+H65E83MAgWicFCWQe+e+wW+TMtNoTLDvh7g=;
 b=fLxN8ZwSfmyTgzllF69kejddvS04x1mNVsWbpat1Fhzf4L6SG+U51McD
 sfqHQ5xKGYvjRUzNXyNW7Rzsv6lW8SmkKzezrzH4VIqmo1tyNYjhytnA6
 U+Ng0/Am2/iOLvUexC2VCkAflBQo1I4AvMOLA3rKlLL9/AvmSp5c3lTqD Y=;
X-IronPort-AV: E=Sophos;i="5.64,555,1559520000"; d="scan'208";a="837350796"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 27 Sep 2019 13:12:26 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5AB8FA1816; Fri, 27 Sep 2019 13:12:12 +0000 (UTC)
Received: from EX13D28UWB004.ant.amazon.com (10.43.161.56) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 27 Sep 2019 13:12:11 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D28UWB004.ant.amazon.com (10.43.161.56) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 27 Sep 2019 13:12:11 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 27 Sep 2019 13:12:09 +0000
To: Wei Liu <wl@xen.org>
References: <cover.1569489002.git.hongyax@amazon.com>
 <6d79e6301ff15af71b21c64d10760abb9775b626.1569489002.git.hongyax@amazon.com>
 <20190926131653.sunfgehtp4zi4fvt@debian>
From: <hongyax@amazon.com>
Message-ID: <dbf84568-4dfb-758b-5ecf-e487d225c732@amazon.com>
Date: Fri, 27 Sep 2019 14:12:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926131653.sunfgehtp4zi4fvt@debian>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH 58/84] x86/mm: fix leaks in
 map_xen_pagetable.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDkvMjAxOSAxNDoxNiwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIFNlcCAyNiwgMjAx
OSBhdCAxMDo0NjoyMUFNICswMTAwLCBob25neWF4QGFtYXpvbi5jb20gd3JvdGU6Cj4+Cj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4+IGluZGV4
IGIyYjJlZGJlZDEuLjE0NWM1YWI0N2MgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5j
Cj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4+IEBAIC01MTYwLDYgKzUxNjAsNyBAQCBpbnQg
bWFwX3BhZ2VzX3RvX3hlbigKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICEobDJl
X2dldF9mbGFncyhvbDJlKSAmIF9QQUdFX1BTRSkgKQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmcmVlX3hlbl9wYWdldGFibGUobDJlX2dldF9tZm4ob2wyZSkpOwo+PiAgICAgICAg
ICAgICAgICAgICAgICAgfQo+PiArICAgICAgICAgICAgICAgICAgICBVTk1BUF9YRU5fUEFHRVRB
QkxFKGwydCk7Cj4gCj4gVGhpcyBpcyBwcmVzdW1hYmx5IHRoZSBpc3N1ZSB5b3UgdHJ5IHRvIGZp
eC4KPiAKClllcy4gQWN0dWFsbHkgdGhpcyBwYXRjaCBmaXhlcyB0d28gaXNzdWVzLCB0aGlzIGlz
IHRoZSBmaXJzdCBvbmUuCgo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi92bWFwLmMgYi94ZW4v
Y29tbW9uL3ZtYXAuYwo+PiBpbmRleCBmYWViYzFkZGYxLi5mY2RiODQ5NWM4IDEwMDY0NAo+PiAt
LS0gYS94ZW4vY29tbW9uL3ZtYXAuYwo+PiArKysgYi94ZW4vY29tbW9uL3ZtYXAuYwo+IAo+IEkg
ZmFpbCB0byBzZWUgd2h5IHlvdSBuZWVkIHRvIGNoYW5nZSB2bWFwIHRvIGZpeCBhIGxlYWsgc29t
ZXdoZXJlIGVsc2UuCj4gCgpUaGUgc2Vjb25kIGxlYWsgaXMgdGhhdCBhZnRlciB0aGUgcGF0Y2hl
cywgd2UgY2Fubm90IGp1c3QgY2FsbCB2bWFwX3RvX21mbigpIApiZWNhdXNlIGl0IGNhbGxzIHZp
cnRfdG9feGVuX2wxZSgpIHVuZGVyIHRoZSBob29kIHdoaWNoIG1hcHMgYSBwYWdlLiBXZSBoYXZl
IHRvIAp1bm1hcCBpdCwgdGhlcmVmb3JlIEkgbW9kaWZpZWQgdGhlIHZtYXBfdG9fbWZuIHRvIGFs
c28gZG8gdGhlIHVubWFwcGluZy4gVGhpcyAKaXMgYSBzZXBhcmF0ZSBpc3N1ZSB0aGFuIHRoZSBm
aXJzdCBvbmUsIHNvIG1heWJlIEkgY291bGQgc3BsaXQgdGhlIHBhdGNoIGludG8gdHdvLgoKPiBJ
IGd1ZXNzIEkgd2lsbCBuZWVkIHRvIHdhaXQgZm9yIHlvdXIgYnJhbmNoIHRvIGhhdmUgYSBjbG9z
ZXIgbG9vay4KPiAKPiBXZWkuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
