Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEFA168CD7
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2020 07:09:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5NvE-0007no-SG; Sat, 22 Feb 2020 06:05:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/A98=4K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j5NvE-0007nj-62
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2020 06:05:52 +0000
X-Inumbo-ID: 608ec8aa-5539-11ea-87b1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 608ec8aa-5539-11ea-87b1-12813bfff9fa;
 Sat, 22 Feb 2020 06:05:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 48418ACCA;
 Sat, 22 Feb 2020 06:05:50 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <20200218122114.17596-1-jgross@suse.com>
 <709bf8df-1635-cb71-11ea-f8d1b629a071@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1fe4ab0e-0b36-af09-557a-e7783315ea4f@suse.com>
Date: Sat, 22 Feb 2020 07:05:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <709bf8df-1635-cb71-11ea-f8d1b629a071@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/4] xen/rcu: let rcu work better with
 core scheduling
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDIuMjAgMDM6MjksIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IE9uIDE4LzAyLzIwMjAg
MTI6MjEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFRvZGF5IHRoZSBSQ1UgaGFuZGxpbmcgaW4g
WGVuIGlzIGFmZmVjdGluZyBzY2hlZHVsaW5nIGluIHNldmVyYWwgd2F5cy4KPj4gSXQgaXMgcmFp
c2luZyBzY2hlZCBzb2Z0aXJxcyB3aXRob3V0IGFueSByZWFsIG5lZWQgYW5kIGl0IHJlcXVpcmVz
Cj4+IHRhc2tsZXRzIGZvciByY3VfYmFycmllcigpLCB3aGljaCBpbnRlcmFjdHMgYmFkbHkgd2l0
aCBjb3JlIHNjaGVkdWxpbmcuCj4+Cj4+IFRoaXMgc21hbGwgc2VyaWVzIHJlcGFpcnMgdGhvc2Ug
aXNzdWVzLgo+Pgo+PiBBZGRpdGlvbmFsbHkgc29tZSBBU1NFUlQoKXMgYXJlIGFkZGVkIGZvciB2
ZXJpZmljYXRpb24gb2Ygc2FuZSByY3UKPj4gaGFuZGxpbmcuIEluIG9yZGVyIHRvIGF2b2lkIHRo
b3NlIHRyaWdnZXJpbmcgcmlnaHQgYXdheSB0aGUgb2J2aW91cwo+PiB2aW9sYXRpb25zIGFyZSBm
aXhlZC4KPiAKPiBJJ3ZlIGRvbmUgbW9yZSB0ZXN0aW5nIG9mIHRoaXMgd2l0aCBbMV0gYW5kLCB1
bmZvcnR1bmF0ZWx5LCBpdCBxdWl0ZSBlYXNpbHkKPiBkZWFkbG9ja3Mgd2hpbGUgd2l0aG91dCB0
aGlzIHNlcmllcyBpdCBkb2Vzbid0Lgo+IAo+IFN0ZXBzIHRvIHJlcHJvOgo+IC0gYXBwbHkgWzFd
Cj4gLSB0YWtlIGEgaG9zdCB3aXRoIGNvbnNpZGVyYWJsZSBDUFUgY291bnQgKH42NCkKPiAtIHJ1
biBhIGxvb3A6IHhlbi1ocHRvb2wgc210LWRpc2FibGU7IHhlbi1ocHRvb2wgc210LWVuYWJsZQo+
IAo+IFsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRl
dmVsLzIwMjAtMDIvbXNnMDEzODMuaHRtbAoKWWVhaCwgdGhlIHJlYXNvbiBmb3IgdGhhdCBpcyB0
aGF0IHJjdV9iYXJyaWVyKCkgaXMgYSBub3AgaW4gdGhpcwpzaXR1YXRpb24gd2l0aG91dCBteSBw
YXRjaCwgYXMgdGhlIHRoZW4gY2FsbGVkIHN0b3BfbWFjaGluZV9ydW4oKSBpbgpyY3VfYmFycmll
cigpIHdpbGwganVzdCByZXR1cm4gLUVCVVNZLgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
