Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E675DC0553
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:41:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpVk-0007wx-C5; Fri, 27 Sep 2019 12:38:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tE9W=XW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDpVi-0007ws-Ty
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:38:10 +0000
X-Inumbo-ID: a974bc08-e123-11e9-9677-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id a974bc08-e123-11e9-9677-12813bfff9fa;
 Fri, 27 Sep 2019 12:38:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4740B1000;
 Fri, 27 Sep 2019 05:38:09 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94AC83F67D;
 Fri, 27 Sep 2019 05:38:08 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1569585474-8955-1-git-send-email-olekstysh@gmail.com>
 <a630303c-7951-385d-2875-da40eca2511a@arm.com>
Message-ID: <03825b64-8773-d0fe-7b3d-e185d3382b50@arm.com>
Date: Fri, 27 Sep 2019 13:38:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a630303c-7951-385d-2875-da40eca2511a@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5] xen/arm: Restrict "p2m_ipa_bits"
 according to the IOMMU requirements
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDkvMjAxOSAxMzozNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI3
LzA5LzIwMTkgMTI6NTcsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+PiBGcm9tOiBPbGVr
c2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4+Cj4+IFRo
ZXJlIGlzIGEgc3RyaWN0IHJlcXVpcmVtZW50IGZvciB0aGUgSU9NTVUgd2hpY2ggd2FudHMgdG8g
c2hhcmUKPj4gdGhlIFAyTSB0YWJsZSB3aXRoIHRoZSBDUFUuIFRoZSBJT01NVSdzIFN0YWdlLTIg
aW5wdXQgc2l6ZSBtdXN0IGJlIGVxdWFsCj4+IHRvIHRoZSBQMk0gSVBBIHNpemUuIEl0IGlzIG5v
dCBhIHByb2JsZW0gd2hlbiB0aGUgSU9NTVUgY2FuIHN1cHBvcnQKPj4gYWxsIHZhbHVlcyB0aGUg
Q1BVIHN1cHBvcnRzLiBJbiB0aGF0IGNhc2UsIHRoZSBJT01NVSBkcml2ZXIgd291bGQganVzdAo+
PiB1c2UgYW55ICJwMm1faXBhX2JpdHMiIHZhbHVlIGFzIGlzLiBCdXQsIHRoZXJlIGFyZSBjYXNl
cyB3aGVuIG5vdC4KPj4KPj4gSW4gb3JkZXIgdG8gbWFrZSBQMk0gc2hhcmluZyBwb3NzaWJsZSBv
biB0aGUgcGxhdGZvcm1zIHdoaWNoCj4+IElPTU1VcyBoYXZlIGEgbGltaXRhdGlvbiBpbiBtYXhp
bXVtIFN0YWdlLTIgaW5wdXQgc2l6ZSBpbnRyb2R1Y2UKPj4gdGhlIGZvbGxvd2luZyBsb2dpYy4K
Pj4KPj4gRmlyc3QgaW5pdGlhbGl6ZSB0aGUgSU9NTVUgc3Vic3lzdGVtIGFuZCBnYXRoZXIgcmVx
dWlyZW1lbnRzIHJlZ2FyZGluZwo+PiB0aGUgbWF4aW11bSBJUEEgYml0cyBzdXBwb3J0ZWQgYnkg
ZWFjaCBJT01NVSBkZXZpY2UgdG8gZmlndXJlIG91dAo+PiB0aGUgbWluaW11bSB2YWx1ZSBhbW9u
ZyB0aGVtLiBJbiB0aGUgUDJNIGNvZGUsIHRha2UgaW50byB0aGUgYWNjb3VudAo+PiB0aGUgSU9N
TVUgcmVxdWlyZW1lbnRzIGFuZCBjaG9vc2Ugc3VpdGFibGUgInBhX3JhbmdlIiBhY2NvcmRpbmcK
Pj4gdG8gdGhlIHJlc3RyaWN0ZWQgInAybV9pcGFfYml0cyIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4g
Q0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDb21taXR0ZWQgbm93LiBUaGFu
ayB5b3UhCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
