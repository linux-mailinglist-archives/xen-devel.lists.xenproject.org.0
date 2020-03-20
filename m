Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A8718CF9B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 14:59:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFI8T-00055W-2Q; Fri, 20 Mar 2020 13:56:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFI8R-00055R-Hz
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 13:56:27 +0000
X-Inumbo-ID: 976adfba-6ab2-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 976adfba-6ab2-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 13:56:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 01238ADE8;
 Fri, 20 Mar 2020 13:56:25 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
 <20200319152622.31758-5-andrew.cooper3@citrix.com>
 <5bc79b55-37c6-005f-2dd9-ac929d3627fb@suse.com>
 <65f58103-cb8e-3276-f8df-908cdbe152cd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cbca0ee6-183b-9f1a-8c02-9b56012d5030@suse.com>
Date: Fri, 20 Mar 2020 14:56:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <65f58103-cb8e-3276-f8df-908cdbe152cd@citrix.com>
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

T24gMjAuMDMuMjAyMCAxNDo0MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8wMy8yMDIw
IDEzOjM3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTkuMDMuMjAyMCAxNjoyNiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IERyb3AgbWljcm9jb2RlX2luaXRfe2ludGVsLGFtZH0oKSwgZXhw
b3J0IHtpbnRlbCxhbWR9X3Vjb2RlX29wcywgYW5kIHVzZSBhCj4+PiBzd2l0Y2ggc3RhdGVtZW50
IGluIGVhcmx5X21pY3JvY29kZV9pbml0KCkgcmF0aGVyIHRoYW4gcHJvYmluZyBlYWNoIHZlbmRv
ciBpbgo+Pj4gdHVybi4gIFRoaXMgYWxsb3dzIHRoZSBtaWNyb2NvZGVfb3BzIHBvaW50ZXIgdG8g
YmVjb21lIGxvY2FsIHRvIGNvcmUuYy4KPj4+Cj4+PiBBcyB0aGVyZSBhcmUgbm8gZXh0ZXJuYWwg
dXNlcnMgb2YgbWljcm9jb2RlX29wcywgdGhlcmUgaXMgbm8gbmVlZCBmb3IKPj4+IGNvbGxlY3Rf
Y3B1X2luZm8oKSB0byBpbXBsZW1lbnQgc2FuaXR5IGNoZWNrcy4gIE1vdmUgYXBwbGljYWJsZSBj
aGVja3MgdG8KPj4+IGVhcmx5X21pY3JvY29kZV9pbml0KCkgc28gdGhleSBhcmUgcGVyZm9ybWVk
IG9uY2UsIHJhdGhlciB0aGFuIHJlcGVhdGVkbHkuCj4+Pgo+Pj4gSXRlbXMgdG8gbm90ZToKPj4+
ICAqIFRoZSBBTUQgdWNvZGUgZHJpdmVyIGRvZXMgaGF2ZSBhbiB1cHBlciBmYW1pbGl5IGxpbWl0
IG9mIDB4MTcsIGFzIGEgc2lkZQo+Pj4gICAgZWZmZWN0IG9mIHRoZSBsb2dpYyBpbiB2ZXJpZnlf
cGF0Y2hfc2l6ZSgpIHdoaWNoIGRvZXMgbmVlZCB1cGRhdGluZyBmb3IKPj4+ICAgIGVhY2ggbmV3
IG1vZGVsLgo+PiBJIGRvbid0IHNlZSB0aGlzIGJlaW5nIHRoZSBjYXNlLCBhbmQgaGVuY2UgSSB0
aGluayBpdCBpcyB0aGlzIHBhdGNoCj4+IHdoaWNoIGludHJvZHVjZXMgc3VjaCBhIHJlc3RyaWN0
aW9uLiBBcyBsb25nIGEgcGF0Y2hlcyBhcmUgbGVzcwo+PiB0aGFuIDJrLCBhbGwgdW5zcGVjaWZp
ZWQgZmFtaWxpZXMgYXJlIHN1cHBvcnRlZCBieSB2ZXJpZnlfcGF0Y2hfc2l6ZSgpCj4+IHRocm91
Z2ggaXRzIGRlZmF1bHQ6IGNhc2UgbGFiZWwuIChBcmd1YWJseSB0aGUgbmFtZSBGMVhIX01QQl9N
QVhfU0laRQo+PiBkb2Vzbid0IHJlYWxseSBmaXQgaG93IGl0IGlzIGJlaW5nIHVzZWQuKQo+Pgo+
PiBJJ20gaGFwcHkgYWJvdXQgYWxsIG90aGVyIGNoYW5nZXMgbWFkZSBoZXJlLgo+IAo+IExpbnV4
IGFjdHVhbGx5IGhhcyBhIGRpZmZlcmVudCBhbGdvcml0aG0gd2hpY2ggZHJvcHMgbGVuZ3RoIHJl
c3RyaWN0aW9ucwo+IG9uIEZhbTE1aCBhbmQgbGF0ZXIsIHNvIHRoZXkgZ2V0IGZvcndhcmQgY29t
cGF0aWJpbGl0eSB0aGF0IHdheS4KCklmIHRoYXQncyB3aGF0IEFNRCBtYW5kYXRlcy9zdWdnZXN0
cywgd2Uge2Msc2h9b3VsZCBjb25zaWRlciBkb2luZwpzbyB0b28uIEkgdGhvdWdodCB0aG91Z2gg
dGhhdCB0aGVzZSBsZW5ndGggcmVzdHJpY3Rpb25zIHdlcmUgYWN0dWFsbHkKcHV0IGluIGJ5IEFN
RCBmb2xrcy4KCj4gV291bGQgeW91IGJlIGhhcHB5IGlmIEkgZHJvcHBlZCBqdXN0IHRoaXMgYXNw
ZWN0IG9mIHRoZSBwYXRjaCwgYW5kIGRlZmVyCj4gQU1EIGFkanVzdG1lbnRzIHRvIGEgbGF0ZXIg
c2V0IG9mIGNoYW5nZXM/CgpZZXMsIGFzIHNhaWQgLSBldmVyeXRoaW5nIGVsc2UgbG9va2VkIGdv
b2QgdG8gbWUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
