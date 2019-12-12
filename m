Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F0311CA52
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 11:14:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifLR1-0004Qf-P2; Thu, 12 Dec 2019 10:11:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifLQz-0004Qa-Hg
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 10:11:01 +0000
X-Inumbo-ID: b20e6a82-1cc7-11ea-8d11-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b20e6a82-1cc7-11ea-8d11-12813bfff9fa;
 Thu, 12 Dec 2019 10:11:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 77AE2B175;
 Thu, 12 Dec 2019 10:10:59 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <cd54bc0e-9e7b-42bb-ea60-8d4578a59cac@suse.com>
 <f150033a-ec07-7542-ab49-b5a8b746c2c1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <43160a9d-2738-0b1d-01ef-b3ad8f1c50dc@suse.com>
Date: Thu, 12 Dec 2019 11:11:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f150033a-ec07-7542-ab49-b5a8b746c2c1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86emul: correct LFS et al handling for
 64-bit mode
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMjAxOSAyMTo1NywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMS8xMi8yMDE5
IDA5OjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQU1EIGFuZCBmcmllbmRzIGV4cGxpY2l0bHkg
c3BlY2lmeSB0aGF0IDY0LWJpdCBvcGVyYW5kcyBhcmVuJ3QgcG9zc2libGUKPj4gZm9yIHRoZXNl
IGluc25zLiBOZXZlcnRoZWxlc3MgUkVYLlcgaXNuJ3QgZnVsbHkgaWdub3JlZDogSXQgc3RpbGwK
Pj4gY2FuY2VscyBhIHBvc3NpYmxlIG9wZXJhbmQgc2l6ZSBvdmVycmlkZSAoMHg2NikuIEludGVs
IG90b2ggZXhwbGljaXRseQo+PiBwcm92aWRlcyBmb3IgNjQtYml0IG9wZXJhbmRzIG9uIHRoZSBy
ZXNwZWN0aXZlIGluc24gcGFnZSBvZiB0aGUgU0RNLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gSXQgaXMgZGVmaW5pdGVseSBtb3JlIHRo
YW4ganVzdCB0aGVzZS7CoCBOZWFyIGp1bXBzIGhhdmUgcGVyLXZlbmRvcgo+IGJlaGF2aW91ciBv
biBob3cgbG9uZyB0aGUgaW5zdHJ1Y3Rpb24gaXMsIHdoZXJlYXMgZmFyIGp1bXAvY2FsbHMgYXJl
IGluCj4gdGhlIHNhbWUgY2F0ZWdvcnkgYXMgdGhlc2UgYnkgdGhlIGxvb2tzIG9mIHRoaW5ncy4K
CkJ1dCB5b3UgZG9uJ3QgZXhwZWN0IG1lIHRvIGZvbGQgYWxsIG9mIHRoZXNlIGludG8gb25lIHBh
dGNoLCBkbwp5b3U/IFdlIGhhdmUgX3NvbWVfIHZlbmRvciBkZXBlbmRlbnQgYmVoYXZpb3IgYWxy
ZWFkeSwgYW5kIEknbQpzbG93bHkgYWRkaW5nIHRvIGl0LiBPdXIgZmFyIGNhbGwvam1wIHN1cHBv
cnQgaXMgcmF0aGVyCmluY29tcGxldGUgaW4gb3RoZXIgd2F5cyBhbnl3YXkuIChBcyBhbiBhc2lk
ZSwgSSdtIHRyeWluZyB0byBkbwp0aGUgYmludXRpbHMgc2lkZSBvZiBzb21lIG9mIHRoZXNlIGJl
Zm9yZSB3YW50aW5nIHRvIGRvIHRoZQplbXVsYXRvciBwYXJ0cy4gSSdtIG9ubHkgYWJvdXQgdG8g
Z2V0IHRvIHRoZSBmYXIgY2FsbC9qbXAgaXNzdWVzCnRoZXJlLCBhcyByZXBvcnRlZCBieSB5b3Ug
aW4gYnVnIDI0NTQ2LikKCkknZCBhcHByZWNpYXRlIGlmIHlvdSBjb3VsZCBjbGFyaWZ5IHdoYXQg
ZXhhY3RseSB5b3VyIHJlcGx5Cm1lYW5zIGZvciB0aGUgcGF0Y2ggYXQgaGFuZC4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
