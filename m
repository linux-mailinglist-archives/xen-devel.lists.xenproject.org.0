Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DFB18CF1E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 14:39:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFHpn-000383-Hd; Fri, 20 Mar 2020 13:37:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFHpm-00037x-0d
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 13:37:10 +0000
X-Inumbo-ID: e55a41aa-6aaf-11ea-bd66-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e55a41aa-6aaf-11ea-bd66-12813bfff9fa;
 Fri, 20 Mar 2020 13:37:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 46931ADBB;
 Fri, 20 Mar 2020 13:37:08 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
 <20200319152622.31758-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bc79b55-37c6-005f-2dd9-ac929d3627fb@suse.com>
Date: Fri, 20 Mar 2020 14:37:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319152622.31758-5-andrew.cooper3@citrix.com>
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

T24gMTkuMDMuMjAyMCAxNjoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBEcm9wIG1pY3JvY29k
ZV9pbml0X3tpbnRlbCxhbWR9KCksIGV4cG9ydCB7aW50ZWwsYW1kfV91Y29kZV9vcHMsIGFuZCB1
c2UgYQo+IHN3aXRjaCBzdGF0ZW1lbnQgaW4gZWFybHlfbWljcm9jb2RlX2luaXQoKSByYXRoZXIg
dGhhbiBwcm9iaW5nIGVhY2ggdmVuZG9yIGluCj4gdHVybi4gIFRoaXMgYWxsb3dzIHRoZSBtaWNy
b2NvZGVfb3BzIHBvaW50ZXIgdG8gYmVjb21lIGxvY2FsIHRvIGNvcmUuYy4KPiAKPiBBcyB0aGVy
ZSBhcmUgbm8gZXh0ZXJuYWwgdXNlcnMgb2YgbWljcm9jb2RlX29wcywgdGhlcmUgaXMgbm8gbmVl
ZCBmb3IKPiBjb2xsZWN0X2NwdV9pbmZvKCkgdG8gaW1wbGVtZW50IHNhbml0eSBjaGVja3MuICBN
b3ZlIGFwcGxpY2FibGUgY2hlY2tzIHRvCj4gZWFybHlfbWljcm9jb2RlX2luaXQoKSBzbyB0aGV5
IGFyZSBwZXJmb3JtZWQgb25jZSwgcmF0aGVyIHRoYW4gcmVwZWF0ZWRseS4KPiAKPiBJdGVtcyB0
byBub3RlOgo+ICAqIFRoZSBBTUQgdWNvZGUgZHJpdmVyIGRvZXMgaGF2ZSBhbiB1cHBlciBmYW1p
bGl5IGxpbWl0IG9mIDB4MTcsIGFzIGEgc2lkZQo+ICAgIGVmZmVjdCBvZiB0aGUgbG9naWMgaW4g
dmVyaWZ5X3BhdGNoX3NpemUoKSB3aGljaCBkb2VzIG5lZWQgdXBkYXRpbmcgZm9yCj4gICAgZWFj
aCBuZXcgbW9kZWwuCgpJIGRvbid0IHNlZSB0aGlzIGJlaW5nIHRoZSBjYXNlLCBhbmQgaGVuY2Ug
SSB0aGluayBpdCBpcyB0aGlzIHBhdGNoCndoaWNoIGludHJvZHVjZXMgc3VjaCBhIHJlc3RyaWN0
aW9uLiBBcyBsb25nIGEgcGF0Y2hlcyBhcmUgbGVzcwp0aGFuIDJrLCBhbGwgdW5zcGVjaWZpZWQg
ZmFtaWxpZXMgYXJlIHN1cHBvcnRlZCBieSB2ZXJpZnlfcGF0Y2hfc2l6ZSgpCnRocm91Z2ggaXRz
IGRlZmF1bHQ6IGNhc2UgbGFiZWwuIChBcmd1YWJseSB0aGUgbmFtZSBGMVhIX01QQl9NQVhfU0la
RQpkb2Vzbid0IHJlYWxseSBmaXQgaG93IGl0IGlzIGJlaW5nIHVzZWQuKQoKSSdtIGhhcHB5IGFi
b3V0IGFsbCBvdGhlciBjaGFuZ2VzIG1hZGUgaGVyZS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
