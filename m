Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D97D16C2D9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 14:56:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6aej-0002rY-Qo; Tue, 25 Feb 2020 13:53:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6aei-0002rT-Iu
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 13:53:48 +0000
X-Inumbo-ID: 3e32988c-57d6-11ea-930e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e32988c-57d6-11ea-930e-12813bfff9fa;
 Tue, 25 Feb 2020 13:53:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E6513AFA9;
 Tue, 25 Feb 2020 13:53:45 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200221185550.30545-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6b96fc5-9747-fdd4-1a10-bab6969d9844@suse.com>
Date: Tue, 25 Feb 2020 14:53:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221185550.30545-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/build: Fix -mskip-rax-setup handling
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxOTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgd2F5IC1tc2tp
cC1yYXgtc2V0dXAgaXMgY3VycmVudGx5IHNwZWNpZmllZCByZXN1bHRzIGluIGNvbXBpbGVyIHN1
cHBvcnQKPiBiZWluZyBldmFsdWF0ZWQgcGVyIHRyYW5zbGF0aW9uIHVuaXQsIHJhdGhlciB0aGFu
IHBlciBzdWJkaXIuICBTd2l0Y2ggdG8gdXNpbmcKPiBjYy1hZGQtb3B0aW9uIGluc3RlYWQuCj4g
Cj4gVGhpcyBkcm9wcyB0aGUgbnVtYmVyIG9mIGNhbGxvdXRzIGZyb20gNDI4IHRvIDYwLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
CgpJIGhhdmUgdG8gYWRtaXQgdGhhdCBJIGZpbmQgaXQgb2RkIHRoYXQgeW91IHBvc3Qgc3VjaCBh
IHBhdGNoCndoZW4gZWFybGllciBvbiB5b3UndmUgb2JqZWN0ZWQgdG8gbXkgIng4NjogZGV0ZXJt
aW5lIEhBVkVfQVNfKgpqdXN0IG9uY2UiIGJlY2F1c2UgQW50aG9ueSBhbHJlYWR5IGhhdmluZyB0
aGlzIHdvcmsgaW4gcHJvZ3Jlc3MuCkknbSBoYXBweSB0byBzZWUgdGhpcyBnbyBpbiBpbmRlcGVu
ZGVudGx5LCBlc3BlY2lhbGx5IGlmIHlvdQpyZWFsbHkgdGhpbmsgLi4uCgo+IC0tLQo+IENDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAKPiBUaGlzIGRyb3BzIGFi
b3V0IDAuNXMgZnJvbSBteSBjY2FjaGUtYWNjZWxlcmF0ZWQgYnV0IG90aGVyd2lzZS1jbGVhbiBi
dWlsZCwKPiBhbmQgd2lsbCBsaWtlbHkgaGF2ZSBhIG1vcmUgcHJvbm91bmNlZCBkaWZmZXJlbmNl
IG9uIG9sZGVyIGhhcmR3YXJlLiAgSWYgaXQKPiB3YW50cyBiYWNrcG9ydGluZywgaXQgd2FudHMg
dG8gZ28gYmFjayBpbiB0aGlzIGZvcm0uCgouLi4gaXQgbWF5IHdhbnQgYmFja3BvcnRpbmcgKG9m
IHdoaWNoIEknbSBub3QgY29udmluY2VkKSwgYW5kCnNlZWluZyBBbnRob255IHdvdWxkIGJlIG9r
YXkgdG8gcmUtYmFzZSBvdmVyIGl0OgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCkJ1dCB0aGVuIEknZCBsaWtlIHRvIGFzayB5b3UgdG8gcmUtY29uc2lkZXIg
eW91ciBvYmplY3Rpb24gdG8KbXkgcGF0Y2ggYXMgd2VsbC4gSW4gcGFydGljdWxhciwgaWYgdGhp
cyBvbmUgd2FzIHdvcnRoCmJhY2twb3J0aW5nLCB0aGVuIEkgZ3Vlc3MgdGhlIG90aGVyIG9uZSB3
b3VsZCBiZSwgdG9vLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
