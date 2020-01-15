Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6984E13C215
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:57:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iriBr-0001Vh-2a; Wed, 15 Jan 2020 12:54:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iriBp-0001VH-Bd
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:54:29 +0000
X-Inumbo-ID: 27c2b628-3796-11ea-8537-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27c2b628-3796-11ea-8537-12813bfff9fa;
 Wed, 15 Jan 2020 12:54:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 90822AD2D;
 Wed, 15 Jan 2020 12:54:23 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <7938484e-14a0-8edf-635b-15b05af6dace@suse.com>
 <6f6064f9-5400-3d85-75c5-b63ca460383d@citrix.com>
 <7951674e-1b8a-03b0-00b9-e7d7fe7eb10c@suse.com>
 <b8b5f2f3-74ab-d874-5f11-de4d5a9ec941@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7300bce-4ebb-da65-9737-3a23f51fca39@suse.com>
Date: Wed, 15 Jan 2020 13:54:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b8b5f2f3-74ab-d874-5f11-de4d5a9ec941@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAyMCAxMzo0NywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMTUvMDEvMjAy
MCAxMjozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE1LjAxLjIwMjAgMTM6MjgsIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gT24gMTUvMDEvMjAyMCAxMTozMiwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMTQuMDEuMjAyMCAyMDozNiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+Pj4+
IElmIElUU0MgaXMgbm90IGF2YWlsYWJsZSBvbiBDUFUgKGUuZyBpZiBydW5uaW5nIG5lc3RlZCBh
cyBQViBzaGltKQo+Pj4+PiB0aGVuIFg4Nl9GRUFUVVJFX05PTlNUT1BfVFNDIGlzIG5vdCBhZHZl
cnRpc2VkIGluIGNlcnRhaW4gY2FzZXMsIGkuZS4KPj4+Pj4gYWxsIEFNRCBhbmQgc29tZSBvbGQg
SW50ZWwgcHJvY2Vzc29ycy4gSW4gd2hpY2ggY2FzZSBUU0Mgd291bGQgbmVlZCB0bwo+Pj4+PiBi
ZSByZXN0b3JlZCBvbiBDUFUgZnJvbSBwbGF0Zm9ybSB0aW1lIGJ5IFhlbiB1cG9uIGV4aXRpbmcg
ZGVlcCBDLXN0YXRlcy4KPj4+Pgo+Pj4+IEhvdyBkb2VzIHdha2luZyBmcm9tIGRlZXAgQyBzdGF0
ZXMgY29ycmVzcG9uZCB0byB0aGUgUFYgc2hpbT8gSSBub3RpY2UKPj4+PiB0aGF0IGNzdGF0ZV9y
ZXN0b3JlX3RzYygpIGdldHMgY2FsbGVkIGlycmVzcGVjdGl2ZSBvZiB0aGUgQyBzdGF0ZSBiZWlu
Zwo+Pj4+IGV4aXRlZCwgc28gSSB3b25kZXIgd2hldGhlciB0aGVyZSdzIHJvb20gZm9yIGltcHJv
dmVtZW50IHRoZXJlCj4+Pj4gaW5kZXBlbmRlbnQgb2YgdGhlIGlzc3VlIGF0IGhhbmQuIEFzIGZh
ciBhcyB0aGlzIGNoYW5nZSBpcyBjb25jZXJuZWQsCj4+Pj4gSSB0aGluayB5b3Ugd2FudCB0byBk
cm9wIHRoZSBub3Rpb24gb2YgImRlZXAiIGZyb20gdGhlIGRlc2NyaXB0aW9uLgo+Pj4KPj4+IEkn
bSBub3QgZmFtaWxpYXIgd2l0aCB3aGF0IHRvIGNhbGwgImRlZXAgQy1zdGF0ZSIgc28gZm9yIG1l
IGl0IHdhcyBhbnl0aGluZwo+Pj4gaGlnaGVyIHRoYW4gQzEuIElmIHlvdSBwcmVmZXIgImRlZXAi
IHRvIGJlIGRyb3BwZWQgLSBzbyBiZSBpdC4KPj4KPj4gIkhpZ2hlciB0aGFuIEMxIiBtYXkgYmUg
ZmluZSAoYWxiZWl0IEkgdmFndWVseSByZWNhbGwgVFNDIGlzc3Vlcwo+PiBzdGFydGluZyB3aXRo
IEMzIG9ubHkpLCBidXQgYXQgbGVhc3QgbXdhaXRfaWRsZSgpIGNhbGxzIHRoZQo+PiBmdW5jdGlv
biBldmVuIGZvciBDMS4gQXMgdG8gdGhlIFBWIHNoaW0gLSBkb2VzIGl0IGtub3cgYWJvdXQgYW55
Cj4+IEMtc3RhdGVzIGF0IGFsbCAoYmV5b25kIEhMVC1pbnZva2VkIEMxKT8KPiAKPiBZZXMsIFBW
LXNoaW0ga25vd3MgYWJvdXQgQyBzdGF0ZXMgYXMgaXQgbG9va3MgdGhleSBhcmUgdGllZCB0bwo+
IHByb2Nlc3NvciBJRCBpbiBzb21lIGNhc2VzLiBGb3IgQU1EIHNwZWNpZmljYWxseSBDMiBpcyBI
TFQuCgpUaGUgQU1EIHBhcnQgaXMgcHJldHR5IG5ldywgYW5kIGlzIC0gYWZhaWN0IC0gYW4gZXhj
ZXB0aW9uIGNvbXBhcmVkCnRvIGV2ZXJ5dGhpbmcgZWxzZS4gVW5kZXIgUFZIIHRoZXJlJ3Mgbm8g
cmVzcGVjdGl2ZSBBQ1BJIGRhdGEgKGlpcmMpLAphbmQgd2UgYWxzbyBkb24ndCBzdXJmYWNlIE1P
TklUT1IvTVdBSVQgdG8gSFZNL1BWSCBndWVzdHMsIG1ha2luZwptd2FpdF9pZGxlX3Byb2JlKCkg
YmFpbCBlYXJseS4gSSB3b25kZXIgd2hldGhlciB0aGlzIHNwZWNpYWwKYmVoYXZpb3Igb24gQU1E
IEZhbTE3IHNob3VsZCBiZSBzdXBwcmVzc2VkIGluIHRoaXMgY2FzZS4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
