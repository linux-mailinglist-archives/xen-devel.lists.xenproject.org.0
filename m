Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467B7CB8FA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 13:18:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGLXh-0004I4-8d; Fri, 04 Oct 2019 11:14:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iGLXg-0004Hz-CI
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 11:14:36 +0000
X-Inumbo-ID: 24b74363-e698-11e9-974b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24b74363-e698-11e9-974b-12813bfff9fa;
 Fri, 04 Oct 2019 11:14:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 193EBB19B;
 Fri,  4 Oct 2019 11:14:34 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
 <1570110555-24287-2-git-send-email-igor.druzhinin@citrix.com>
 <dde9c6fd-8043-cbc5-ab06-d6e238ad0e38@suse.com>
 <a19291d4-1eb0-e479-f9a7-bd442a1649dc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ebd2f8e6-42ed-d1b6-8a2d-e7f07848d5b1@suse.com>
Date: Fri, 4 Oct 2019 13:14:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a19291d4-1eb0-e479-f9a7-bd442a1649dc@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] efi/boot: fix set_color function
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTAuMjAxOSAxMjo1NCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMDQvMTAvMjAx
OSAxMTozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAzLjEwLjIwMTkgMTU6NDksIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gLSAwIGlzIGEgcG9zc2libGUgYW5kIGFsbG93ZWQgdmFsdWUg
Zm9yIGEgY29sb3IgbWFzayBhY2Nyb2RpbmcgdG8KPj4+ICAgVUVGSSBTcGVjIDIuNiAoMTEuOSkg
ZXNwZWNpYWxseSBmb3IgcmVzZXJ2ZWQgbWFzawo+Pgo+PiBIbW0sIGxvb2tpbmcgYXQgMi44ICh3
aGVyZSBpdCdzIHNlY3Rpb24gMTIuOSwgd2hpY2ggaW4gdHVybiBpcyB3aHkKPj4gc2VjdGlvbiB0
aXRsZXMgd291bGQgYmUgbW9yZSBoZWxwZnVsIGluIHN1Y2ggcmVmZXJlbmNlcykgSSBjYW4ndAo+
PiBzZWUgdGhlIGNhc2UgYmVpbmcgbWVudGlvbmVkIGV4cGxpY2l0bHkuIEkgY2FuIGFjY2VwdCB0
aGF0Cj4+IFJlc2VydmVkTWFzayBtaWdodCBiZSB6ZXJvLCBidXQgdGhlbiBJJ2QgcHJlZmVyIHRv
IGhhbmRsZSB0aGF0Cj4+IGNhc2UgaW4gdGhlIGNhbGxlciwgcmF0aGVyIHRoYW4gYWxsb3dpbmcg
emVybyBhbHNvIGZvciB0aGUgdGhyZWUKPj4gY29sb3JzLgo+IAo+ICJJZiBhIGJpdCBpcyBzZXQg
aW4gUmVkTWFzaywgR3JlZW5NYXNrLCBvciBCbHVlTWFzayB0aGVuIHRob3NlIGJpdHMgb2YKPiB0
aGUgcGl4ZWwgcmVwcmVzZW50IHRoZSBjb3JyZXNwb25kaW5nIGNvbG9yLiIgLSAiSWYgYSBiaXQg
aXMgc2V0Li4uIgo+IGltcGxpZXMgaXQgbWlnaHQgbm90IGJlIHNldC4KClRoaXMgdGFsa3MgYWJv
dXQgdGhlIGZ1bmN0aW9uIG9mIGluZGl2aWR1YWwgYml0cy4gVGhlcmUncyBub3RoaW5nIHNhaWQK
YWJvdXQgbm90IGJpdCBhdCBhbGwgYmVpbmcgc2V0IGZvciBhIHBhcnRpY3VsYXIgY29sb3IuCgo+
IE5vdGhpbmcgcHJldmVudHMgbWFzayBmb3IgdGhlIGNvbG9ycyBiZSAwIGFzIHdlbGwuCgpJIHdv
dWxkbid0IHJlYWQgaXQgbGlrZSB0aGlzLCBuby4gSSdtIGZpbmUgaW1wbHkgc3VjaCBmb3IgdGhl
IHJlc2VydmVkCmZpZWxkLCBidXQgSSdkIHJhdGhlciBjb25zaWRlciBpdCBhIGJyb2tlbiBtb2Rl
IGlmIG9uZSBvZiB0aGUgY29sb3JzCmhhcyBubyB3YXkgb2YgcmVwcmVzZW50aW5nIGF0IGFsbC4g
SW4gcGFydGljdWxhcgoKIlRoZSBjb2xvciBpbnRlbnNpdGllcyBtdXN0IGluY3JlYXNlIGFzIHRo
ZSBjb2xvciB2YWx1ZXMgZm9yIGEgZWFjaAogY29sb3IgbWFzayBpbmNyZWFzZSB3aXRoIGEgbWlu
aW11bSBpbnRlbnNpdHkgb2YgYWxsIGJpdHMgaW4gYSBjb2xvcgogbWFzayBjbGVhciB0byBhIG1h
eGltdW0gaW50ZW5zaXR5IG9mIGFsbCBiaXRzIGluIGEgY29sb3IgbWFzayBzZXQuIgoKc3VnZ2Vz
dHMgdG8gbWUgdGhhdCB0aGVyZSBjYW4ndCBiZSB6ZXJvIGJpdHMgc2V0LCBvciBlbHNlIHRoZXJl
J2QgYmUKbm8gZGlmZmVyZW5jZSBiZXR3ZWVuIG1pbmltdW0gYW5kIG1heGltdW0gaW50ZW5zaXR5
LiBBbHNvLCB3aGlsZQptYXRoZW1hdGljYWxseSBpdCBtYWtlcyBzZW5zZSBmb3IgImFsbCBiaXRz
IiB0byBpbmNsdWRlIHRoZSBjYXNlIG9mCnplcm8gb2YgdGhlbSwgaXQgZG9lc24ndCAodG8gbWUg
YXQgbGVhc3QpIGluIGRheS10by1kYXkgdXNlIG9mIHRoZQpsYW5ndWFnZS4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
