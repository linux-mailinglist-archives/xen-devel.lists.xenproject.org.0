Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A03112F74A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 12:33:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inLAW-0004Kk-Hw; Fri, 03 Jan 2020 11:31:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inLAV-0004Kf-Ny
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 11:31:03 +0000
X-Inumbo-ID: 80fdd9d0-2e1c-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80fdd9d0-2e1c-11ea-a1e1-bc764e2007e4;
 Fri, 03 Jan 2020 11:30:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DAB40AD0F;
 Fri,  3 Jan 2020 11:30:53 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <ce92465a-8a54-e8b3-035f-46b695704169@suse.com>
 <7168c5da-c250-a79f-3b11-a4c516a9e220@xen.org>
 <dc927ca7-6072-b89b-70ff-33844b5d3a44@suse.com>
 <CAF3u54A+HJjZ-C=CF3BkAwqebGf_i2MpuTsnkLo+L6ac2DcBWA@mail.gmail.com>
 <86f54aec-1120-62e4-dde3-4d49c54a8188@suse.com>
 <28da91bd-006f-79b1-38d0-e22eae4986ff@xen.org>
 <751bc20c-7c85-d7b1-c3e7-f2a1e77b60a5@suse.com>
 <5f56f48f-29d3-f5d4-479f-f1ebe5fcf47c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96678d3a-1b2f-9ff5-6b92-1ce1ae51e23b@suse.com>
Date: Fri, 3 Jan 2020 12:31:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5f56f48f-29d3-f5d4-479f-f1ebe5fcf47c@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: move vgc_flags to struct pv_vcpu
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDEuMjAyMCAxMjoxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhvdyBkbyB5b3UgbWFu
YWdlIHNlY29uZGFyeSBDUFVzIG9uIEhWTS9QVkggZ3Vlc3Q/CgpTZWNvbmRhcnkgQ1BVcyBoYXZl
IGFyY2hpdGVjdHVyYWwgc3RhdGUgdGhleSBzdGFydCB3aXRoLCBhbmQKdGhlcmUncyB2ZXJ5IGxp
dHRsZSBjb250cm9sIGFuIE9TIGhhcyBvdmVyIGluaXRpYWwgcmVnaXN0ZXIKc3RhdGU6IFRoZXJl
J3MganVzdCBhbiA4LWJpdCB2YWx1ZSBzcGVjaWZ5aW5nIChwYXJ0IG9mKSB0aGUKYWRkcmVzcyB0
aGUgQ1BVIHNob3VsZCBzdGFydCBleGVjdXRpbmcgZnJvbS4gQWxsIG90aGVyCnJlZ2lzdGVycyBn
ZXQgc2V0IHRvIGhhcmQgY29kZWQgdmFsdWVzLiBBbmQgdGhhdCA4LWJpdCB2YWx1ZQppcyBwYXJ0
IG9mIHRoZSBJUEkgbWVzc2FnZSB0aGUgcHJpbWFyeSBDUFUgc2VuZHMgdG8gdGhlIEFQCnRvIGJl
IGJyb3VnaHQgdXAgKGkuZS4gdGhlcmUncyBubyBoeXBlcmNhbGwgaW52b2x2ZWQgaGVyZSkuCgpG
b3IgUFZILCBhIHZhcmlhbnQgb2YgdGhlIG5vcm1hbCBQViBtb2RlbCBvZiBzdGFydGluZyB2Q1BV
LXMKZ2V0cyB1c2VkLCBpLmUuIHZpYSBWQ1BVT1BfaW5pdGlhbGlzZS4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
