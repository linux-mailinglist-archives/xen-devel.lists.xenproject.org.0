Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73816B127A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:55:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8ROz-0003ur-Gy; Thu, 12 Sep 2019 15:52:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8ROx-0003ui-FI
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:52:55 +0000
X-Inumbo-ID: 60f09cea-d575-11e9-959d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60f09cea-d575-11e9-959d-12813bfff9fa;
 Thu, 12 Sep 2019 15:52:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 392EAB64C;
 Thu, 12 Sep 2019 15:52:52 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <443ba725-01b7-9174-3298-66f44ba3f1ec@suse.com>
 <20190912113542.bxnfmweacwfr3py4@Air-de-Roger>
 <7ea0eb1e-1063-b7ef-8cde-6f47f70e41e0@suse.com>
 <20190912144434.e7wnmdumfpnp2z3m@Air-de-Roger>
 <a77b09ff-e0df-6b54-c6e7-156ce9dd6f29@suse.com>
 <20190912154200.lakjfd6jzju7n7ok@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00ac8186-b874-f3df-aa08-642022d179ab@suse.com>
Date: Thu, 12 Sep 2019 17:52:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912154200.lakjfd6jzju7n7ok@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/9] x86/HVM: move NOFLUSH handling out of
 hvm_set_cr3()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxNzo0MiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVGh1LCBT
ZXAgMTIsIDIwMTkgYXQgMDQ6NDc6MTdQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDEyLjA5LjIwMTkgMTY6NDQsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gYSBkaWZm
ZXJlbnQgcXVlc3Rpb24sIEFGQUlDVCBodm1fc2V0X2NyMyBzaG91bGQgbmV2ZXIgYmUgY2FsbGVk
Cj4+PiB3aXRoIFg4Nl9DUjNfTk9GTFVTSCBzZXQ/IElmIHNvLCBkbyB5b3UgdGhpbmsgaXQgd291
bGQgbWFrZSBzZW5zZSB0bwo+Pj4gYWRkIGFuIGFzc2VydCB0byB0aGF0IHJlZ2FyZD8KPj4KPj4g
SSd2ZSBiZWVuIGRlYmF0aW5nIHRoaXMgd2l0aCBteXNlbGYsIGFuZCBkZWNpZGVkIGFnYWluc3Qg
Zm9yIG5vdy4KPj4gV2UgZG9uJ3Qga25vdyB3aGF0IG1lYW5pbmcgdGhlIGJpdCBtYXkgZ2FpbiBl
dmVudHVhbGx5IGluIHRoZQo+PiBhY3R1YWwgcmVnaXN0ZXIuCj4gCj4gSSdtIHNsaWdodGx5IGxv
c3QgaGVyZSwgdGhlIG5vZmx1c2ggYml0IGlzIGFjdHVhbGx5IGRlZmluZWQgaW4gdGhlCj4gSW50
ZWwgU0RNIGZvciBjcjMsIGFuZCBoZW5jZSB3b24ndCBnYWluIGFueSBvdGhlciBtZWFuaW5nPwoK
VGhlIG5vZmx1c2ggYml0IGlzIGEgb3BlcmF0aW9uIG9uZSwgaS5lLiB0YWtpbmcgZWZmZWN0IG9u
IHRoZQpNT1YtdG8tQ1IzLCB3aXRob3V0IGdldHRpbmcgd3JpdHRlbiB0byB0aGUgdW5kZXJseWlu
ZyByZWdpc3Rlci4KVGhlcmVmb3JlIHRoZXJlIG1heSB3ZWxsIGFwcGVhciBhIG1lYW5pbmcgZm9y
IHRoZSBhY3R1YWwKcmVnaXN0ZXIgYml0LCBidXQgSSBhZ3JlZSBpdCBkb2Vzbid0IHNlZW0gdmVy
eSBsaWtlbHkgZm9yIHN1Y2gKYW4gb3ZlcmxvYWQgdG8gZ2V0IHB1dCBpbiBwbGFjZS4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
