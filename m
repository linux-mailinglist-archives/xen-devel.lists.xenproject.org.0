Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52881168F41
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2020 15:01:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5VGn-0000mH-4n; Sat, 22 Feb 2020 13:56:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/A98=4K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j5VGm-0000mC-46
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2020 13:56:36 +0000
X-Inumbo-ID: 22d42d24-557b-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22d42d24-557b-11ea-bc8e-bc764e2007e4;
 Sat, 22 Feb 2020 13:56:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2C7F4AC9D;
 Sat, 22 Feb 2020 13:56:33 +0000 (UTC)
To: Julien Grall <julien@xen.org>, Igor Druzhinin
 <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <20200218122114.17596-1-jgross@suse.com>
 <709bf8df-1635-cb71-11ea-f8d1b629a071@citrix.com>
 <1fe4ab0e-0b36-af09-557a-e7783315ea4f@suse.com>
 <01202d13-95a5-4491-63a3-ed3195d92974@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <396b66ef-f6f5-93d6-029b-b8c5aa0090a4@suse.com>
Date: Sat, 22 Feb 2020 14:56:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <01202d13-95a5-4491-63a3-ed3195d92974@xen.org>
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
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDIuMjAgMTM6MzIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAyMi8w
Mi8yMDIwIDA2OjA1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAyMi4wMi4yMCAwMzoyOSwg
SWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+PiBPbiAxOC8wMi8yMDIwIDEyOjIxLCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+Pj4+IFRvZGF5IHRoZSBSQ1UgaGFuZGxpbmcgaW4gWGVuIGlzIGFmZmVjdGlu
ZyBzY2hlZHVsaW5nIGluIHNldmVyYWwgd2F5cy4KPj4+PiBJdCBpcyByYWlzaW5nIHNjaGVkIHNv
ZnRpcnFzIHdpdGhvdXQgYW55IHJlYWwgbmVlZCBhbmQgaXQgcmVxdWlyZXMKPj4+PiB0YXNrbGV0
cyBmb3IgcmN1X2JhcnJpZXIoKSwgd2hpY2ggaW50ZXJhY3RzIGJhZGx5IHdpdGggY29yZSBzY2hl
ZHVsaW5nLgo+Pj4+Cj4+Pj4gVGhpcyBzbWFsbCBzZXJpZXMgcmVwYWlycyB0aG9zZSBpc3N1ZXMu
Cj4+Pj4KPj4+PiBBZGRpdGlvbmFsbHkgc29tZSBBU1NFUlQoKXMgYXJlIGFkZGVkIGZvciB2ZXJp
ZmljYXRpb24gb2Ygc2FuZSByY3UKPj4+PiBoYW5kbGluZy4gSW4gb3JkZXIgdG8gYXZvaWQgdGhv
c2UgdHJpZ2dlcmluZyByaWdodCBhd2F5IHRoZSBvYnZpb3VzCj4+Pj4gdmlvbGF0aW9ucyBhcmUg
Zml4ZWQuCj4+Pgo+Pj4gSSd2ZSBkb25lIG1vcmUgdGVzdGluZyBvZiB0aGlzIHdpdGggWzFdIGFu
ZCwgdW5mb3J0dW5hdGVseSwgaXQgcXVpdGUgCj4+PiBlYXNpbHkKPj4+IGRlYWRsb2NrcyB3aGls
ZSB3aXRob3V0IHRoaXMgc2VyaWVzIGl0IGRvZXNuJ3QuCj4+Pgo+Pj4gU3RlcHMgdG8gcmVwcm86
Cj4+PiAtIGFwcGx5IFsxXQo+Pj4gLSB0YWtlIGEgaG9zdCB3aXRoIGNvbnNpZGVyYWJsZSBDUFUg
Y291bnQgKH42NCkKPj4+IC0gcnVuIGEgbG9vcDogeGVuLWhwdG9vbCBzbXQtZGlzYWJsZTsgeGVu
LWhwdG9vbCBzbXQtZW5hYmxlCj4+Pgo+Pj4gWzFdIAo+Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTAyL21zZzAxMzgzLmh0bWwgCj4+
Pgo+Pgo+PiBZZWFoLCB0aGUgcmVhc29uIGZvciB0aGF0IGlzIHRoYXQgcmN1X2JhcnJpZXIoKSBp
cyBhIG5vcCBpbiB0aGlzCj4+IHNpdHVhdGlvbiB3aXRob3V0IG15IHBhdGNoLCBhcyB0aGUgdGhl
biBjYWxsZWQgc3RvcF9tYWNoaW5lX3J1bigpIGluCj4+IHJjdV9iYXJyaWVyKCkgd2lsbCBqdXN0
IHJldHVybiAtRUJVU1kuCj4gCj4gSSB0aGluayByY3VfYmFycmllcigpIGJlZW4gYSBOT1AgaXMg
YWxzbyBwcm9ibGVtIGFzIGl0IG1lYW5zIHlvdSB3b3VsZCAKPiBiZSBhYmxlIHRvIGNvbnRpbnVl
IGJlZm9yZSB0aGUgaW4tZmxpZ2h0IGNhbGxiYWNrIGhhcyBiZWVuIGNvbXBsZXRlZC4KPiAKPiBC
dXQgSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aHkgYSBkZWFkbG9jayB3b3VsZCBoYXBwZW4gd2l0
aCB5b3VyIAo+IHN1Z2dlc3Rpb24/IENvdWxkIHlvdSBkZXRhaWxzIGEgYml0IG1vcmU/CgpnZXRf
Y3B1X21hcHMoKSB3aWxsIHJldHVybiBmYWxzZSBhcyBsb25nIHN0b3BfbWFjaGluZV9ydW4oKSBp
cyBob2xkaW5nCnRoZSBsb2NrLCBhbmQgcmN1IGhhbmRsaW5nIHdpbGwgbG9vcCB1bnRpbCBpdCBn
ZXRzIHRoZSBsb2NrLi4uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
