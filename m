Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C0019F8A
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:50:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP6oq-0004Rl-5V; Fri, 10 May 2019 14:48:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP6oo-0004Rg-PR
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:48:14 +0000
X-Inumbo-ID: a36ac0d2-7332-11e9-a174-b70377ad6e19
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a36ac0d2-7332-11e9-a174-b70377ad6e19;
 Fri, 10 May 2019 14:48:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8ED4A78;
 Fri, 10 May 2019 07:48:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB2453F73C;
 Fri, 10 May 2019 07:48:12 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-12-julien.grall@arm.com>
 <5CD571FE020000780022D826@prv1-mh.provo.novell.com>
 <22eaed55-f714-0c97-385d-72cf796f5936@arm.com>
 <5CD57E04020000780022D8F0@prv1-mh.provo.novell.com>
 <fac9e2db-c746-5f53-bebc-0615fe60e8a4@arm.com>
 <5CD58127020000780022D963@prv1-mh.provo.novell.com>
 <210fee0a-bbd0-ccef-82d5-d81ed55ef587@arm.com>
 <5CD588E1020000780022D9FF@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ad3aca99-a519-dad2-cb9c-7ccbd2161b33@arm.com>
Date: Fri, 10 May 2019 15:48:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD588E1020000780022D9FF@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 11/14] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8wNS8yMDE5IDE1OjIxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMC4w
NS4xOSBhdCAxNjowNSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMTAvMDUv
MjAxOSAxNDo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAxMC4wNS4xOSBhdCAxNTo0
MSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiBPbiAxMC8wNS8yMDE5IDE0OjM1
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gSSBkaWRuJ3QgbWVhbiBpdCB0byByZW1haW4gTlVM
TC4gQ29tbW9uIGNvZGUgZG9lc24ndCBkZXJlZmVyZW5jZSBpdAo+Pj4+PiAoYW5kIGlzbid0IHN1
cHBvc2VkIHRvKSwgc28gSSdkIGNvbnNpZGVyIGluaXRpYWxpemluZyBpdCB0byBzb21lIGtub3du
Cj4+Pj4+IGZhdWx0aW5nIG5vbi1OVUxMIGFkZHJlc3MsIGlmIHRoZXJlIGlzIHN1Y2ggb24gQXJt
Lgo+Pj4+Cj4+Pj4gUGF0Y2hlcyBhcmUgd2VsY29tZWQgOykuCj4+Pgo+Pj4gU28gaXMgdGhlcmUg
c3VjaCBhbiBhZGRyZXNzIG9uIEFybT8KPj4KPj4gMCAtIDJNQiBpcyB1bm1hcHBlZCBzbyBmYXIu
IEkgZG9uJ3Qga25vdyB3aGV0aGVyIHRoaXMgd2lsbCBzdGlsbCBiZSB0aGUgY2FzZSAoYXQKPj4g
bGVhc3QgZm9yIHRoZSByYW5nZSA0S0IgLSAyTUIpIHdpdGggdGhlIHJld29yayBJIGFtIGF0dGVt
cHRpbmcuCj4gCj4gSG1tLCBJIHdhcyBob3BpbmcgZm9yIGFuIGFyY2hpdGVjdHVyYWxseSBmYXVs
dGluZyBhZGRyZXNzLCBsaWtlCj4gdGhlIG5vbi1jYW5vbmljYWwgb25lcyB3ZSBoYXZlIG9uIHg4
Ni02NC4KCk5vdGhpbmcgd2UgY2FuIHJlbGlhYmx5IHVzZSBhY3Jvc3MgQXJtdjcgYW5kIEFybXY4
IChhbmQgZnV0dXJlIGV4dGVuc2lvbikuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
