Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0C3C46E0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 07:12:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFWrl-0007RS-FN; Wed, 02 Oct 2019 05:07:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFWrk-0007RJ-F9
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 05:07:56 +0000
X-Inumbo-ID: 9722be1c-e4d2-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 9722be1c-e4d2-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 05:07:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B7BE5AE3A;
 Wed,  2 Oct 2019 05:07:53 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <20190812202735.23411-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011907080.26319@sstabellini-ThinkPad-T480s>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <daa146e1-c131-7cd2-aa55-678b6267d314@suse.com>
Date: Wed, 2 Oct 2019 07:07:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910011907080.26319@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: p2m: Free the p2m entry after
 flushing the IOMMU TLBs
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
Cc: olekstysh@gmail.com, oleksandr_tyshchenko@epam.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMTkgMDQ6MDcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiArIEp1ZXJnZW4K
PiAKPiBPbiBNb24sIDEyIEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFdoZW4gZnJl
ZWluZyBhIHAybSBlbnRyeSwgYWxsIHRoZSBzdWItdHJlZSBiZWhpbmQgaXQgd2lsbCBhbHNvIGJl
IGZyZWVkLgo+PiBUaGlzIG1heSBpbmNsdWRlIGludGVybWVkaWF0ZSBwYWdlLXRhYmxlcyBvciBh
bnkgbDMgZW50cnkgcmVxdWlyaW5nIHRvCj4+IGRyb3AgYSByZWZlcmVuY2UgKGUuZyBmb3IgZm9y
ZWlnbiBwYWdlcykuIEFzIHNvb24gYXMgcGFnZXMgYXJlIGZyZWVkLAo+PiB0aGV5IG1heSBiZSBy
ZS11c2VkIGJ5IFhlbiBvciBhbm90aGVyIGRvbWFpbi4gVGhlcmVmb3JlIGl0IGlzIG5lY2Vzc2Fy
eQo+PiB0byBmbHVzaCAqYWxsKiB0aGUgVExCcyBiZWZvcmVoYW5kLgo+Pgo+PiBXaGlsZSBDUFUg
VExCcyB3aWxsIGJlIGZsdXNoZWQgYmVmb3JlIGZyZWVpbmcgdGhlIHBhZ2VzLCB0aGlzIGlzIG5v
dAo+PiB0aGUgY2FzZSBmb3IgSU9NTVUgVExCcy4gVGhpcyBjYW4gYmUgc29sdmVkIGJ5IG1vdmlu
ZyB0aGUgSU9NTVUgVExCcwo+PiBmbHVzaCBlYXJsaWVyIGluIHRoZSBjb2RlLgo+Pgo+PiBUaGlz
IHdhc24ndCBjb25zaWRlcmVkIGFzIGEgc2VjdXJpdHkgaXNzdWUgYXMgZGV2aWNlIHBhc3N0aHJv
dWdoIG9uIEFybQo+PiBpcyBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IFJldmlld2VkLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpSZWxlYXNlLWFj
a2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
