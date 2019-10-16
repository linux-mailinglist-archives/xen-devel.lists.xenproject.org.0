Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D1AD87B1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 06:58:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKbM9-00070E-OW; Wed, 16 Oct 2019 04:56:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QYkk=YJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iKbM7-000708-QX
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 04:56:15 +0000
X-Inumbo-ID: 4712fcfd-efd1-11e9-93a7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4712fcfd-efd1-11e9-93a7-12813bfff9fa;
 Wed, 16 Oct 2019 04:56:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9C11AB264;
 Wed, 16 Oct 2019 04:56:12 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20191015181802.21957-1-julien.grall@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a58572c9-aa1b-31a5-82d8-e7618641b21a@suse.com>
Date: Wed, 16 Oct 2019 06:56:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191015181802.21957-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTAuMTkgMjA6MTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiB2aXJ0X3RvX21hZGRyKCkg
aXMgdXNpbmcgdGhlIGhhcmR3YXJlIHBhZ2UtdGFibGUgd2FsayBpbnN0cnVjdGlvbnMgdG8KPiB0
cmFuc2xhdGUgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gcGh5c2ljYWwgYWRkcmVzcy4gVGhlIGZ1bmN0
aW9uIHNob3VsZAo+IG9ubHkgYmUgY2FsbGVkIG9uIHZpcnR1YWwgYWRkcmVzcyBtYXBwZWQuCj4g
Cj4gX2VuZCBwb2ludHMgcGFzdCB0aGUgZW5kIG9mIFhlbiBiaW5hcnkgYW5kIG1heSBub3QgYmUg
bWFwcGVkIHdoZW4gdGhlCj4gYmluYXJ5IHNpemUgaXMgcGFnZS1hbGlnbmVkLiBUaGlzIG1lYW5z
IHZpcnRfdG9fbWFkZHIoKSB3aWxsIG5vdCBiZSBhYmxlCj4gdG8gZG8gdGhlIHRyYW5zbGF0aW9u
IGFuZCB0aGVyZWZvcmUgY3Jhc2ggWGVuLgo+IAo+IE5vdGUgdGhlcmUgaXMgYWxzbyBhbiBvZmYt
Ynktb25lIGlzc3VlIGluIHRoaXMgY29kZSwgYnV0IHRoZSBwYW5pYyB3aWxsCj4gdHJ1bXAgdGhh
dC4KPiAKPiBCb3RoIGlzc3VlcyBjYW4gYmUgZml4ZWQgYnkgdXNpbmcgX2VuZCAtIDEgaW4gdGhl
IGNoZWNrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+CgpXaXRoIG9yIHdpdGhvdXQgdGhlIGNhc3Qgc3VnZ2VzdGVkIGJ5IFN0ZWZhbm86CgpS
ZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
