Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4397237B43
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 19:41:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYwLL-0006L2-CU; Thu, 06 Jun 2019 17:38:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2G1I=UF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYwLJ-0006Kx-LX
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 17:38:25 +0000
X-Inumbo-ID: e264228a-8881-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e264228a-8881-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 17:38:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03903374;
 Thu,  6 Jun 2019 10:38:24 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39BB23F690;
 Thu,  6 Jun 2019 10:38:23 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-20-julien.grall@arm.com>
 <alpine.DEB.2.21.1906041055180.14041@sstabellini-ThinkPad-T480s>
 <7ca0ad84-1f84-96f4-40e2-1b911eadd2bb@arm.com>
 <alpine.DEB.2.21.1906041518570.14041@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0eb647f6-7f4f-e7b0-9984-8b954cba91c1@arm.com>
Date: Thu, 6 Jun 2019 18:38:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906041518570.14041@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 19/19] xen/arm: Pair call
 to set_fixmap with call to clear_fixmap in copy_from_paddr
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
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA1LzA2LzIwMTkgMDA6MTIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDQgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gNi80LzE5
IDY6NTkgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE9uIFR1ZSwgMTQgTWF5IDIw
MTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBBdCB0aGUgbW9tZW50LCBzZXRfZml4bWFwIG1h
eSByZXBsYWNlIGEgdmFsaWQgZW50cnkgd2l0aG91dCBmb2xsb3dpbmcKPj4+PiB0aGUgYnJlYWst
YmVmb3JlLW1ha2Ugc2VxdWVuY2UuIFRoaXMgbWF5IHJlc3VsdCB0byBUTEIgY29uZmxpY3QgYWJv
cnQuCj4+Pj4KPj4+PiBSYXRoZXIgdGhhbiBkZWFsaW5nIHdpdGggQnJlYWstQmVmb3JlLU1ha2Ug
aW4gc2V0X2ZpeG1hcCwgZXZlcnkgY2FsbCB0bwo+Pj4+IHNldF9maXhtYXAgaXMgcGFpcmVkIHdp
dGggYSBjYWxsIHRvIGNsZWFyX2ZpeG1hcC4KPj4+Cj4+PiBJdCBpcyBub3QgZXZlcnkgY2FsbCB0
byBzZXRfZml4bWFwOiBpdCBpcyBldmVyeSBjYWxsIHRvCj4+PiBzZXRfZml4bWFwKEZJWE1BUF9N
SVNDLCAuLi4KPj4KPj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcmVxdWVzdC4uLiBUaGUgdGl0
bGUgZXhwbGljaXQgbWVudGlvbgo+PiAiY29weV9mcm9tX3BhZGRyIiBhbmQgZml4bWFwIGlzIG9u
bHkgY2FsbGVkIHdpdGggRklYTUFQX01JU0MuCj4+Cj4+IFNvIHdoeSBzaG91bGQgSSBuZWVkIHRv
IHNwZWNpZnkgdGhlIGFyZ3VtZW50Pwo+IAo+IEkgd2Fzbid0IGFza2luZyB0byBtZW50aW9uIEZJ
WE1BUF9NSVNDIGV4cGxpY2l0ZWx5LCBJIGRvbid0IHRoaW5rIGl0IGlzCj4gcGFydGljdWxhcmx5
IHVzZWZ1bC4gSSB3YXMgb25seSB0cnlpbmcgdG8gbWFrZSB0aGUgd29yZGluZyBtb3JlCj4gc3Bl
Y2lmaWMgdG8gd2hhdCB0aGUgcGF0Y2ggZG9lcy4KCkkgaGF2ZSB0byBhZG1pdCB0aGlzIHdhc24n
dCBjbGVhciBmcm9tIHlvdXIgYW5zd2VyLiBBbnl3YXksLi4uCgo+IAo+IFRoZSBzdGF0ZW1lbnQg
ImV2ZXJ5IGNhbGwgdG8gc2V0X2ZpeG1hcCBpcyBwYWlyZWQgd2l0aCBhIGNhbGwgdG8KPiBjbGVh
cl9maXhtYXAiIGlzIHRvbyBnZW5lcmljIGFuZCBJIHdvdWxkIHByZWZlciBpZiBpdCB3YXMgbGlt
aXRlZCBpbgo+IHNjb3BlIGJ5IHNvbWV0aGluZyBsaWtlCj4gCj4gICAgImluIGNvcHlfZnJvbV9w
YWRkciIKPiAKPiBMaWtlIHlvdSBoYXZlIGRvbmUgaW4gdGhlIHN1YmplY3QuIFJlc3VsdGluZyBp
bjoKPiAgICAKPiAgICBldmVyeSBjYWxsIHRvIHNldF9maXhtYXAgaW4gY29weV9mcm9tX3BhZGRy
IGlzIHBhaXJlZCB3aXRoIGEgY2FsbCB0bwo+ICAgIGNsZWFyX2ZpeG1hcAoKLi4uIHRoYW5rIHlv
dSBmb3IgeW91ciBjbGFyaWZpY2F0aW9uLiBJIGhhdmUgdXBkYXRlZCB0aGUgY29tbWl0IG1lc3Nh
Z2UgYWNjb3JkaW5nbHkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
