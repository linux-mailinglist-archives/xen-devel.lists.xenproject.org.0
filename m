Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BEB18D183
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:51:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFIwt-0001wA-BV; Fri, 20 Mar 2020 14:48:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFIwr-0001w5-Tv
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:48:33 +0000
X-Inumbo-ID: ded717fe-6ab9-11ea-bd93-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ded717fe-6ab9-11ea-bd93-12813bfff9fa;
 Fri, 20 Mar 2020 14:48:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 579C8AE8C;
 Fri, 20 Mar 2020 14:48:32 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
 <20200319152622.31758-5-andrew.cooper3@citrix.com>
 <5bc79b55-37c6-005f-2dd9-ac929d3627fb@suse.com>
 <65f58103-cb8e-3276-f8df-908cdbe152cd@citrix.com>
 <cbca0ee6-183b-9f1a-8c02-9b56012d5030@suse.com>
 <a3c16068-e2d7-9d91-5dc3-9b623b5adccb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <624642f8-27f0-5986-5a42-ad16296d805c@suse.com>
Date: Fri, 20 Mar 2020 15:48:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a3c16068-e2d7-9d91-5dc3-9b623b5adccb@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/6] x86/ucode: Rationalise startup and
 family/model checks
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAyMCAxNToyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8wMy8yMDIw
IDEzOjU2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjAuMDMuMjAyMCAxNDo0MCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDIwLzAzLzIwMjAgMTM6MzcsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDE5LjAzLjIwMjAgMTY6MjYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IERy
b3AgbWljcm9jb2RlX2luaXRfe2ludGVsLGFtZH0oKSwgZXhwb3J0IHtpbnRlbCxhbWR9X3Vjb2Rl
X29wcywgYW5kIHVzZSBhCj4+Pj4+IHN3aXRjaCBzdGF0ZW1lbnQgaW4gZWFybHlfbWljcm9jb2Rl
X2luaXQoKSByYXRoZXIgdGhhbiBwcm9iaW5nIGVhY2ggdmVuZG9yIGluCj4+Pj4+IHR1cm4uICBU
aGlzIGFsbG93cyB0aGUgbWljcm9jb2RlX29wcyBwb2ludGVyIHRvIGJlY29tZSBsb2NhbCB0byBj
b3JlLmMuCj4+Pj4+Cj4+Pj4+IEFzIHRoZXJlIGFyZSBubyBleHRlcm5hbCB1c2VycyBvZiBtaWNy
b2NvZGVfb3BzLCB0aGVyZSBpcyBubyBuZWVkIGZvcgo+Pj4+PiBjb2xsZWN0X2NwdV9pbmZvKCkg
dG8gaW1wbGVtZW50IHNhbml0eSBjaGVja3MuICBNb3ZlIGFwcGxpY2FibGUgY2hlY2tzIHRvCj4+
Pj4+IGVhcmx5X21pY3JvY29kZV9pbml0KCkgc28gdGhleSBhcmUgcGVyZm9ybWVkIG9uY2UsIHJh
dGhlciB0aGFuIHJlcGVhdGVkbHkuCj4+Pj4+Cj4+Pj4+IEl0ZW1zIHRvIG5vdGU6Cj4+Pj4+ICAq
IFRoZSBBTUQgdWNvZGUgZHJpdmVyIGRvZXMgaGF2ZSBhbiB1cHBlciBmYW1pbGl5IGxpbWl0IG9m
IDB4MTcsIGFzIGEgc2lkZQo+Pj4+PiAgICBlZmZlY3Qgb2YgdGhlIGxvZ2ljIGluIHZlcmlmeV9w
YXRjaF9zaXplKCkgd2hpY2ggZG9lcyBuZWVkIHVwZGF0aW5nIGZvcgo+Pj4+PiAgICBlYWNoIG5l
dyBtb2RlbC4KPj4+PiBJIGRvbid0IHNlZSB0aGlzIGJlaW5nIHRoZSBjYXNlLCBhbmQgaGVuY2Ug
SSB0aGluayBpdCBpcyB0aGlzIHBhdGNoCj4+Pj4gd2hpY2ggaW50cm9kdWNlcyBzdWNoIGEgcmVz
dHJpY3Rpb24uIEFzIGxvbmcgYSBwYXRjaGVzIGFyZSBsZXNzCj4+Pj4gdGhhbiAyaywgYWxsIHVu
c3BlY2lmaWVkIGZhbWlsaWVzIGFyZSBzdXBwb3J0ZWQgYnkgdmVyaWZ5X3BhdGNoX3NpemUoKQo+
Pj4+IHRocm91Z2ggaXRzIGRlZmF1bHQ6IGNhc2UgbGFiZWwuIChBcmd1YWJseSB0aGUgbmFtZSBG
MVhIX01QQl9NQVhfU0laRQo+Pj4+IGRvZXNuJ3QgcmVhbGx5IGZpdCBob3cgaXQgaXMgYmVpbmcg
dXNlZC4pCj4+Pj4KPj4+PiBJJ20gaGFwcHkgYWJvdXQgYWxsIG90aGVyIGNoYW5nZXMgbWFkZSBo
ZXJlLgo+Pj4gTGludXggYWN0dWFsbHkgaGFzIGEgZGlmZmVyZW50IGFsZ29yaXRobSB3aGljaCBk
cm9wcyBsZW5ndGggcmVzdHJpY3Rpb25zCj4+PiBvbiBGYW0xNWggYW5kIGxhdGVyLCBzbyB0aGV5
IGdldCBmb3J3YXJkIGNvbXBhdGliaWxpdHkgdGhhdCB3YXkuCj4+IElmIHRoYXQncyB3aGF0IEFN
RCBtYW5kYXRlcy9zdWdnZXN0cywgd2Uge2Msc2h9b3VsZCBjb25zaWRlciBkb2luZwo+PiBzbyB0
b28uIEkgdGhvdWdodCB0aG91Z2ggdGhhdCB0aGVzZSBsZW5ndGggcmVzdHJpY3Rpb25zIHdlcmUg
YWN0dWFsbHkKPj4gcHV0IGluIGJ5IEFNRCBmb2xrcy4KPiAKPiBJdHMgb24gdGhlIGxpc3Qgb2Yg
cXVlc3Rpb25zLi4uCj4gCj4+PiBXb3VsZCB5b3UgYmUgaGFwcHkgaWYgSSBkcm9wcGVkIGp1c3Qg
dGhpcyBhc3BlY3Qgb2YgdGhlIHBhdGNoLCBhbmQgZGVmZXIKPj4+IEFNRCBhZGp1c3RtZW50cyB0
byBhIGxhdGVyIHNldCBvZiBjaGFuZ2VzPwo+PiBZZXMsIGFzIHNhaWQgLSBldmVyeXRoaW5nIGVs
c2UgbG9va2VkIGdvb2QgdG8gbWUuCj4gCj4gQ2FuIEkgdGFrZSB0aGF0IGFzIGFuIEEtYnkgdGhl
biwgdG8gc2F2ZSBwb3N0aW5nIHRoZSBwYXRjaCBhZ2Fpbj8KCklmIGl0J3MganVzdCB0YWtpbmcg
b3V0IHRoZSBmYW0gPD0gMHgxNyBjaGVjayAtIHllcy4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
