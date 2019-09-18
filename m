Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F3B60CD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 11:52:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAWan-0002Bv-9V; Wed, 18 Sep 2019 09:49:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rYmb=XN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAWal-0002Bo-PA
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 09:49:43 +0000
X-Inumbo-ID: a3a19e1c-d9f9-11e9-962b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3a19e1c-d9f9-11e9-962b-12813bfff9fa;
 Wed, 18 Sep 2019 09:49:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3759FADF0;
 Wed, 18 Sep 2019 09:49:42 +0000 (UTC)
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
References: <20190918073538.24707-1-wipawel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
Date: Wed, 18 Sep 2019 11:49:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918073538.24707-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDkuMjAxOSAwOTozNSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gVGhpcyBp
cyBuZWVkZWQgZm9yIG1vcmUgcHJlY2lzZSBwYXRjaGFiaWxpdHkgdmVyaWZpY2F0aW9uLgo+IE9u
bHkgbm9uLXNwZWNpYWwgLnJvZGF0YSBzZWN0aW9ucyBzaG91bGQgYmUgc3ViamVjdAo+IGZvciBz
dWNoIGEgbm9uLXJlZmVyZW5jZWQgY2hlY2sgaW4ga3BhdGNoX3ZlcmlmeV9wYXRjaGFiaWxpdHko
KS4KPiBDdXJyZW50IGNoZWNrIChub24tc3RhbmRhcmQsIG5vbi1yZWxhLCBub24tZGVidWcpIGlz
IHRvbyB3ZWFrIGFuZAo+IGFsbG93cyBhbHNvIG5vbi1yb2RhdGEgc2VjdGlvbnMgd2l0aG91dCBy
ZWZlcmVuY2VkIHN5bWJvbHMgdG8gc2xpcAo+IHRocm91Z2guCj4gCj4gRGV0ZWN0IC5yb2RhdGEg
c2VjdGlvbiBieSBjaGVja2luZyBzZWN0aW9uJ3MgdHlwZSAoU0hUX1BST0dCSVRTKSwKPiBmbGFn
cyAobm8gZXhlYywgbm8gd3JpdGUpIGFuZCBmaW5hbGx5IG5hbWUgcHJlZml4Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KPiBSZXZp
ZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxhbmRyYXByc0BhbWF6b24uY29tPgo+IFJl
dmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5
OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPiAtLS0KPiAgY29tbW9uLmMg
ICAgICAgICAgICAgfCAgNyArKysrKysrCj4gIGNvbW1vbi5oICAgICAgICAgICAgIHwgIDEgKwo+
ICBjcmVhdGUtZGlmZi1vYmplY3QuYyB8IDEzICsrKysrKy0tLS0tLS0KPiAgMyBmaWxlcyBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKU2VlaW5nIHRoYXQgSSBoYXZl
IGJlZW4gQ2MtZWQgaGVyZSAtIHdoYXQgdHJlZSBpcyB0aGlzIGFnYWluc3Q/IEkKZG9uJ3QgcmVj
b2duaXplIHRoZSBmaWxlIG5hbWVzIGFzIGFueXRoaW5nIEknbSBhIG1haW50YWluZXIgZm9yLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
