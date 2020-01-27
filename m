Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5AA14A838
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 17:41:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw7PU-00079a-6R; Mon, 27 Jan 2020 16:38:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1l6N=3Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iw7PT-00079V-Bx
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 16:38:47 +0000
X-Inumbo-ID: 7c9b0664-4123-11ea-8578-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c9b0664-4123-11ea-8578-12813bfff9fa;
 Mon, 27 Jan 2020 16:38:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6A8C8B07B;
 Mon, 27 Jan 2020 16:38:45 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200123180615.69370-1-roger.pau@citrix.com>
 <20200123180615.69370-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2ad764fa-d609-63d9-676e-58e4afff4724@suse.com>
Date: Mon, 27 Jan 2020 17:38:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200123180615.69370-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/apic: fix disabling LVT0 in
 disconnect_bsp_APIC
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDEuMjAyMCAxOTowNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBJbnRlbCBT
RE0gc3RhdGVzOgo+IAo+ICJXaGVuIGFuIGlsbGVnYWwgdmVjdG9yIHZhbHVlICgwIHRvIDE1KSBp
cyB3cml0dGVuIHRvIGEgTFZUIGVudHJ5IGFuZAo+IHRoZSBkZWxpdmVyeSBtb2RlIGlzIEZpeGVk
IChiaXRzIDgtMTEgZXF1YWwgMCksIHRoZSBBUElDIG1heSBzaWduYWwgYW4KPiBpbGxlZ2FsIHZl
Y3RvciBlcnJvciwgd2l0aG91dCByZWdhcmQgdG8gd2hldGhlciB0aGUgbWFzayBiaXQgaXMgc2V0
IG9yCj4gd2hldGhlciBhbiBpbnRlcnJ1cHQgaXMgYWN0dWFsbHkgc2VlbiBvbiB0aGUgaW5wdXQu
Igo+IAo+IEFuZCB0aGF0J3MgZXhhY3RseSB3aGF0J3MgY3VycmVudGx5IGRvbmUgaW4gZGlzY29u
bmVjdF9ic3BfQVBJQyB3aGVuCj4gdmlydF93aXJlX3NldHVwIGlzIHRydWUgYW5kIExWVCBMSU5U
MCBpcyBiZWluZyBtYXNrZWQuIEJ5IHdyaXRpbmcgb25seQo+IEFQSUNfTFZUX01BU0tFRCBYZW4g
aXMgYWN0dWFsbHkgc2V0dGluZyB0aGUgdmVjdG9yIHRvIDAgYW5kIHRoZQo+IGRlbGl2ZXJ5IG1v
ZGUgdG8gRml4ZWQgKDApLCBhbmQgaGVuY2UgaXQgdHJpZ2dlcnMgYW4gQVBJQyBlcnJvciBldmVu
Cj4gd2hlbiB0aGUgTFZUIGVudHJ5IGlzIG1hc2tlZC4KPiAKPiBUaGlzIHdvdWxkIHVzdWFsbHkg
bWFuaWZlc3Qgd2hlbiBYZW4gaXMgYmVpbmcgc2h1dCBkb3duLCBhcyB0aGF0J3MKPiB3aGVyZSBk
aXNjb25uZWN0X2JzcF9BUElDIGlzIGNhbGxlZDoKPiAKPiAoWEVOKSBBUElDIGVycm9yIG9uIENQ
VTA6IDQwKDAwKQo+IAo+IEZpeCB0aGlzIGJ5IGNhbGxpbmcgY2xlYXJfbG9jYWxfQVBJQyBwcmlv
ciB0byBzZXR0aW5nIHRoZSBMVlQgTElOVAo+IHJlZ2lzdGVycyB3aGljaCBhbHJlYWR5IGNsZWFy
IExWVCBMSU5UMCwgYW5kIGhlbmNlIHRoZSB0cm91Ymxlc29tZQo+IHdyaXRlIGNhbiBiZSBhdm9p
ZGVkIGFzIHRoZSByZWdpc3RlciBpcyBhbHJlYWR5IGNsZWFyZWQuCj4gCj4gUmVwb3J0ZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
