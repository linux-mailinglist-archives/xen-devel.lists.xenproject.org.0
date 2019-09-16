Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A12B3FA6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 19:40:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9uv3-0007fd-5O; Mon, 16 Sep 2019 17:36:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ffgk=XL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1i9uv1-0007fY-U4
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 17:36:07 +0000
X-Inumbo-ID: 75b6b066-d8a8-11e9-978d-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75b6b066-d8a8-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 17:36:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E0579308620E;
 Mon, 16 Sep 2019 17:36:04 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-124-96.rdu2.redhat.com
 [10.10.124.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54A605DA5B;
 Mon, 16 Sep 2019 17:36:03 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190913145100.303433-1-anthony.perard@citrix.com>
 <20190913145100.303433-10-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <26405443-8a65-5d03-dd35-1000ac3fbf0a@redhat.com>
Date: Mon, 16 Sep 2019 19:36:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190913145100.303433-10-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 16 Sep 2019 17:36:05 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH 09/11] OvmfPkg/XenBusDxe: Fix
 NotifyExitBoot to avoid Memory Allocation Services
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTMvMTkgMTY6NTAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoaXMgcGF0Y2ggZml4
IHRoZSBFVlRfU0lHTkFMX0VYSVRfQk9PVF9TRVJWSUNFUyBoYW5kbGVyIHRvIGF2b2lkCj4gdXNp
bmcgdGhlIE1lbW9yeSBBbGxvY2F0aW9uIFNlcnZpY2VzLgo+IAo+IFRoaXMgY29tZXMgd2l0aCBh
IG5ldyBpbnRlcmZhY2UgbmFtZWQgUmVnaXN0ZXJFeGl0Q2FsbGJhY2sgc28gdGhhdCBQVgo+IGRy
aXZlcnMgY2FuIGRpc2Nvbm5lY3QgZnJvbSB0aGUgYmFja2VuZCBiZWZvcmUgWGVuQnVzRHhlIGlz
IHRlYXJlZAo+IGRvd24uCj4gCj4gSW5zdGVhZCBvZiB1c2luZyBEaXNjb25uZWN0KCkgdG8gdGVh
ciBkb3duIHRoZSBYZW5CdXMgZHJpdmVyIGFuZCB0aGUKPiBjaGlsZHJlbiBkcml2ZXJzLCB3ZSBh
cmUgZ29pbmcgdG8gYXNrIGV2ZXJ5IGRyaXZlciB1c2luZwo+IFhFTkJVU19QUk9UT0NPTCB0byBk
aXNjb25uZWN0IGZyb20gdGhlIGhhcmR3YXJlIHZpYSB0aGUgY2FsbGJhY2sgc2V0Cj4gd2l0aCBS
ZWdpc3RlckV4aXRDYWxsYmFjaywgdGhlbiByZXNldCB0aGUgeGVuc3RvcmUgc2hhcmVkIHJpbmcg
YW5kCj4gdGhlIGdyYW50IHRhYmxlLgoKSSB0aGluayB0aGlzIGFwcHJvYWNoIC0tIGEgbG93ZXIt
bGV2ZWwgYnVzIGRyaXZlciBjYWxsaW5nIG91dCB0bwpkZXBlbmRlbnQgZGV2aWNlIGRyaXZlcnMg
LS0gaXMgcXVpdGUgdW51c3VhbC4KCkhvdyBhYm91dCB0aGUgZm9sbG93aW5nIGluc3RlYWQ6Cgot
IGludHJvZHVjZSB0d28gWGVuQnVzSW8gcHJvdG9jb2wgbWVtYmVyIGZ1bmN0aW9ucywgQWRkUmVm
ZXJlbmNlKCkgYW5kClJlbW92ZVJlZmVyZW5jZSgpLiBSZW1vdmVSZWZlcmVuY2UoKSBzaG91bGQg
dGFrZSBhIEJPT0xFQU4gY2FsbGVkCiJIYW5kT2ZmVG9PcyIuIFRoZSBkZXZpY2UgZHJpdmVycyBz
aG91bGQgY2FsbCBBZGRSZWZlcmVuY2UoKSBqdXN0IGJlZm9yZQpleGl0aW5nIERyaXZlckJpbmRp
bmdTdGFydCgpIHdpdGggc3VjY2VzcywgYW5kIFJlbW92ZVJlZmVyZW5jZShGQUxTRSkgaW4KRHJp
dmVyQmluZGluZ1N0b3AoKS4KCi0gdGhlc2UgcHJvdG9jb2wgbWVtYmVyIGZ1bmN0aW9ucyB3b3Vs
ZCBpbmNyZW1lbnQgLyBkZWNyZW1lbnQgYQpyZWZlcmVuY2UgY291bnRlciBpbiB0aGUgdW5kZXJs
eWluZyBYZW5CdXMgYWJzdHJhY3Rpb24uIEFkZGl0aW9uYWxseSwKUmVtb3ZlUmVmZXJlbmNlKCkg
d291bGQgc3RvcmUgdGhlIEhhbmRPZmZUb09zIHBhcmFtZXRlciB0byBhIGJ1cy1sZXZlbApCT09M
RUFOIHRvbyAocmVnYXJkbGVzcyBvZiBwcmV2aW91cyB2YWx1ZSBzdG9yZWQgdGhlcmUgLS0gYSBU
UlVFLT5GQUxTRQp0cmFuc2l0aW9uIHdvdWxkIG5ldmVyIGhhcHBlbiBhbnl3YXk7IHNlZSBiZWxv
dykuCgotIGJvdGggWGVuQnVzRHhlIGFuZCB0aGUgWGVuIGRldmljZSBkcml2ZXJzIHNob3VsZCBy
ZWdpc3RlciBFQlMKY2FsbGJhY2tzLCBwZXIgY29udHJvbGxlciBoYW5kbGUgKGluIEJpbmRpbmdT
dGFydCgpKSwgYW5kIHVucmVnaXN0ZXIKdGhlbSAoaW4gQmluZGluZ1N0b3AoKSkKCi0gdGhlIG9y
ZGVyaW5nIGJldHdlZW4gRUJTIG5vdGlmaWNhdGlvbiBmdW5jdGlvbnMgKHF1ZXVlZCBhdCB0aGUg
c2FtZQpUUEwpIGlzIHVuc3BlY2lmaWVkLiBJbiB0aGUgZGV2aWNlIGRyaXZlciBub3RpZmljYXRp
b24gZnVuY3Rpb25zLCB0aGUKbGFzdCBhY3Rpb24gc2hvdWxkIGJlIGEgY2FsbCB0byBYZW5CdXNJ
by0+UmVtb3ZlUmVmZXJlbmNlKFRSVUUpIC0tIGFmdGVyCnRoZSBkZXZpY2Utc3BlY2lmaWMgImZv
cmdldCBtZSIgYWN0aW9ucyBoYXZlIGJlZW4gZG9uZS4KCi0gaWYgUmVtb3ZlUmVmZXJlbmNlKCkg
Z2V0cyBhIFRSVUUgcGFyYW1ldGVyLCB0aGVuIGl0IHNob3VsZCBjaGVjayB0aGUKcmVzdWx0YW50
IChwb3N0LWRlY3JlbWVudCkgdmFsdWUgb2YgdGhlIHJlZmNvdW50LiBJZiBpdCBoYXMgZ29uZSB0
bwp6ZXJvLCBSZW1vdmVSZWZlcmVuY2UoKSBzaG91bGQgcmUtc2V0IHRoZSB4ZW5idXMgLyB4ZW5z
dG9yZSBjb25uZWN0aW9uLgpJZiB0aGUgcGFyYW1ldGVyIGlzIEZBTFNFLCBpdCBzaG91bGRuJ3Qg
ZG8gYW55dGhpbmcgcGFydGljdWxhciBhZnRlcgpkZWNyZW1lbnRpbmcgdGhlIHJlZmNvdW50LgoK
LSBpbiB0aGUgWGVuQnVzIEVCUyBoYW5kbGVyLCBpZiB0aGUgcmVmY291bnQgaXMgcG9zaXRpdmUg
YXQgdGhlIHRpbWUgb2YKdGhlIGNhbGwsIG5vdGhpbmcgc2hvdWxkIGJlIGRvbmUuIE90aGVyd2lz
ZSwgaWYgSGFuZE9mZlRvT3MgaXMgVFJVRSwKbm90aGluZyBzaG91bGQgYmUgZG9uZSwgc2ltaWxh
cmx5LiBPdGhlcndpc2UsIHRoZSB4ZW5idXMveGVuc3RvcmUKY29ubmVjdGlvbiBzaG91bGQgYmUg
cmUtc2V0LgoKVGhlIGlkZWEgaXMgdGhhdCBub3JtYWwgU3RhcnQvU3RvcCBzaG91bGQgbWFuYWdl
IHRoZSByZWZjb3VudCBhcwpleHBlY3RlZC4gQXQgRXhpdEJvb3RTZXJ2aWNlcygpLCB0aGUgWGVu
QnVzIGxldmVsIGhhbmRsZXIgc2hvdWxkIG9ubHkKY2xlYXIgdGhlIGNvbm5lY3Rpb24gdG8gdGhl
IGh5cGVydmlzb3IgaWYgbm8gUmVtb3ZlUmVmZXJlbmNlKCkgY2FsbCBoYXMKZG9uZSwgb3Igd2ls
bCBkbywgaXQuIChJZiB0aGUgY291bnRlciBpcyBwb3NpdGl2ZSwgdGhlbiBhIGxhdGVyClJlbW92
ZVJlZmVyZW5jZSgpIGNhbGwgd2lsbCBkbyBpdDsgaWYgaXQncyB6ZXJvIGJ1dCBIYW5kT2ZmVG9P
cyBpcyBUUlVFLAp0aGVuIGl0J3MgYmVlbiBkb25lIGFscmVhZHkuIElmIHRoZSBjb3VudGVyIGlz
IHplcm8gYW5kIHRoZSBCT09MRUFOIGlzCkZBTFNFLCB0aGVuIGFsbCBkZXZpY2VzIGhhdmUgYmVl
biBkaXNjb25uZWN0ZWQgbm9ybWFsbHkgd2l0aCBTdG9wKCkgLS0Kb3Igbm9uZSBoYXZlIGJlZW4g
Y29ubmVjdGVkIGF0IGFsbCAtLSwgYmVmb3JlIEV4aXRCb290U2VydmljZXMoKSwgc28gdGhlClhl
bkJ1cyBkcml2ZXIgaXRzZWxmIGhhcyB0byBhc2sgZm9yIGJlaW5nIGZvcmdvdHRlbi4pCgpBZG1p
dHRlZGx5LCB0aGlzIGlzIG1vcmUgY29tcGxpY2F0ZWQgKGR1ZSB0byB0aGUgdW5zcGVjaWZpZWQg
b3JkZXJpbmcKYmV0d2VlbiBFQlMgbm90aWZpY2F0aW9ucykuIEkganVzdCBmZWVsIGl0J3MgbW9y
ZSBpZGlvbWF0aWMgdG8gZ28KdGhyb3VnaCBub3JtYWwgcHJvdG9jb2wgbWVtYmVyIGZ1bmN0aW9u
cyBpbiBFQlMgbm90aWZpY2F0aW9uIGZ1bmN0aW9ucywKcmF0aGVyIHRoYW4gc3BlY2lhbCBjYWxs
YmFja3MuCgooU2lkZSBjb21tZW50OiB0aGUgcmVmZXJlbmNlIGNvdW50aW5nIGNvdWxkIG5vcm1h
bGx5IGJlIHJlcGxhY2VkIGJ5CmdCUy0+T3BlblByb3RvY29sSW5mb3JtYXRpb24oKTsgaG93ZXZl
ciwgdGhhdCBzZXJ2aWNlIGl0c2VsZiBhbGxvY2F0ZXMKbWVtb3J5LCBzbyB3ZSBjYW4ndCB1c2Ug
aXQgaW4gRUJTIG5vdGlmaWNhdGlvbiBmdW5jdGlvbnMuKQoKVGhhbmtzCkxhc3psbwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
