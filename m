Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E434DD4170
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 15:36:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIv3Q-0002TZ-Km; Fri, 11 Oct 2019 13:34:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1MXO=YE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIv3P-0002TR-A8
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 13:33:59 +0000
X-Inumbo-ID: c75bc172-ec2b-11e9-933b-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c75bc172-ec2b-11e9-933b-12813bfff9fa;
 Fri, 11 Oct 2019 13:33:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F871337;
 Fri, 11 Oct 2019 06:33:58 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 362733F6C4;
 Fri, 11 Oct 2019 06:33:57 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20191010175238.4769-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910101706350.9081@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6784a597-0865-5069-18be-4dc4197de7ff@arm.com>
Date: Fri, 11 Oct 2019 14:33:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910101706350.9081@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
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
Cc: jgross@suse.com, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgQW5kcmV3IGFuZCBKYW4pCgpIaSwKCk9uIDExLzEwLzIwMTkgMDE6MjcsIFN0ZWZhbm8gU3Rh
YmVsbGluaSB3cm90ZToKPiBPbiBUaHUsIDEwIE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCj4+
IGluZGV4IGJlMjNhY2ZlMjYuLmE2NjM3Y2UzNDcgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9tbS5jCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jCj4+IEBAIC05NjQsMTEgKzk2NCw0MCBA
QCBzdGF0aWMgaW50IGNyZWF0ZV94ZW5fdGFibGUobHBhZV90ICplbnRyeSkKPj4gICAKPj4gICBz
dGF0aWMgbHBhZV90ICp4ZW5fbWFwX3RhYmxlKG1mbl90IG1mbikKPj4gICB7Cj4+ICsgICAgLyoK
Pj4gKyAgICAgKiBXZSBtYXkgcmVxdWlyZSB0byBtYXAgdGhlIHBhZ2UgdGFibGUgYmVmb3JlIG1h
cF9kb21haW5fcGFnZSgpIGlzCj4+ICsgICAgICogdXNlYWJsZS4gVGhlIHJlcXVpcmVtZW50cyBo
ZXJlIGlzIGl0IG11c3QgYmUgdXNlYWJsZSBhcyBzb29uIGFzCj4+ICsgICAgICogcGFnZS10YWJs
ZXMgYXJlIGFsbG9jYXRlZCBkeW5hbWljYWxseSB2aWEgYWxsb2NfYm9vdF9wYWdlcygpLgo+PiAr
ICAgICAqCj4+ICsgICAgICogV2UgbmVlZCB0byBkbyB0aGUgY2hlY2sgb24gcGh5c2ljYWwgYWRk
cmVzcyByYXRoZXIgdGhhbiB2aXJ0dWFsCj4+ICsgICAgICogYWRkcmVzcyB0byBhdm9pZCB0cnVu
Y2F0aW9uIG9uIEFybTMyLiBUaGVyZWZvcmUgaXNfa2VybmVsKCkgY2Fubm90Cj4+ICsgICAgICog
YmUgdXNlZC4KPj4gKyAgICAgKi8KPj4gKyAgICBpZiAoIHN5c3RlbV9zdGF0ZSA9PSBTWVNfU1RB
VEVfZWFybHlfYm9vdCApCj4+ICsgICAgewo+PiArICAgICAgICBjb25zdCBtZm5fdCBtc3RhcnQg
PSB2aXJ0X3RvX21mbihfc3RhcnQpOwo+PiArICAgICAgICBjb25zdCBtZm5fdCBtZW5kID0gdmly
dF90b19tZm4oX2VuZCk7Cj4+ICsKPj4gKyAgICAgICAgaWYgKCAobWZuX3gobXN0YXJ0KSA8PSBt
Zm5feChtZm4pKSAmJiAobWZuX3gobWZuKSA8IG1mbl94KG1lbmQpKSApCj4+ICsgICAgICAgIHsK
PiAKPiBUaGUgcGF0Y2ggaXMgZ29vZC4gQWN0dWFsbHkgSSBub3RpY2VkIHRoYXQgd2UgYWxyZWFk
eSBoYXZlCj4gaXNfeGVuX2ZpeGVkX21mbigpLCBsb29rcyBsaWtlIGl0IGlzIG1hZGUgZm9yIHRo
aXMuIEkgdGhpbmsgd2Ugc2hvdWxkCj4gdXNlIGl0IGhlcmUsIGV4Y2VwdCB0aGF0IGlzX3hlbl9m
aXhlZF9tZm4gaGFzOgoKVGhhbmtzLCBJIHRob3VnaHQgd2UgaGFkIG9uZSBidXQgSSBjb3VsZG4n
dCByZW1lbWJlciB0aGUgbmFtZSA6KC4KCj4gCj4gICAgICAgKG1mbl90b19tYWRkcihtZm4pIDw9
IHZpcnRfdG9fbWFkZHIoJl9lbmQpKSkKPiAKPiBJIHRoaW5rIGl0IHNob3VsZCBhY3R1YWxseSBi
ZToKPiAKPiAgICAgICAobWZuX3RvX21hZGRyKG1mbikgPCB2aXJ0X3RvX21hZGRyKCZfZW5kKSkp
Cj4gCj4gTWF5YmUgd2UgY291bGQgZml4IHRoYXQgYXQgdGhlIHNhbWUgdGltZSBpbiBvbmUgcGF0
Y2g/IEhvd2V2ZXIsIGl0IGlzCj4gdGhlIHNhbWUgZGVmaW5pdGlvbiBhcyBvbiB4ODYsIHNvIEkg
ZG9uJ3Qga25vdyB3aGF0IGlzIGdvaW5nIG9uIHRoZXJlLgoKRm9yIEFybSB3ZSBzaG91bGQgZGVm
aW5pdGVseSB1c2UgPCBhbmQgbm90IDw9LgoKSSBhbSBhc3N1bWluZyB0aGlzIGlzIHRoZSBzYW1l
IGZvciB4ODYuIEFuZHJldz8gSmFuPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
