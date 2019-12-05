Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A4D113F59
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 11:28:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icoKM-0005F1-BZ; Thu, 05 Dec 2019 10:25:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icoKK-0005Ew-MG
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 10:25:40 +0000
X-Inumbo-ID: 9541e740-1749-11ea-821d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9541e740-1749-11ea-821d-12813bfff9fa;
 Thu, 05 Dec 2019 10:25:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB8B7B4CC;
 Thu,  5 Dec 2019 10:25:38 +0000 (UTC)
To: "Xia, Hongyan" <hongyxia@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
 <3885863bfc54a5f5f05cddb3cd9afe24897f27b3.1575477921.git.hongyxia@amazon.com>
 <f13c0e4808e320a0233f82b9be005fe5b2679469.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb2c4422-f425-721b-2b66-48fe7ba300ce@suse.com>
Date: Thu, 5 Dec 2019 11:25:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f13c0e4808e320a0233f82b9be005fe5b2679469.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 6/9] x86/mm: add an end_of_loop label in
 map_pages_to_xen
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMjAxOSAxMToyMSwgWGlhLCBIb25neWFuIHdyb3RlOgo+PiBPbiAwMi4xMC4yMDE5
IDE5OjE2LCBIb25neWFuIFhpYSB3cm90ZToKPj4+IFdlIHdpbGwgc29vbiBuZWVkIHRvIGNsZWFu
IHVwIG1hcHBpbmdzIHdoZW5ldmVyIHRoZSBvdXQgbW9zdCBsb29wIGlzCj4+PiBlbmRlZC4gQWRk
IGEgbmV3IGxhYmVsIGFuZCB0dXJuIHJlbGV2YW50IGNvbnRpbnVlJ3MgaW50byBnb3RvJ3MuCj4+
Cj4+IEkgdGhpbmsgYWxyZWFkeSB3aGVuIHRoaXMgc3RpbGwgd2FzIFJGQyBJIGRpZCBpbmRpY2F0
ZSB0aGF0IEknbSBub3QKPj4gaGFwcHkgYWJvdXQgdGhlIGludHJvZHVjdGlvbiBvZiB0aGVzZSBs
YWJlbHMgKGluY2x1ZGluZyBhbHNvIHBhdGNoIDgpLgo+PiBJIHJlYWxpemUgaXQncyBxdWl0ZSBh
IGxvdCB0byBhc2ssIGJ1dCBib3RoIGZ1bmN0aW9ucyB3b3VsZCBiZW5lZml0Cj4+ZnJvbSBzcGxp
dHRpbmcgdXAgaW50byBwZXItbGV2ZWwgaGVscGVyIGZ1bmN0aW9ucywgd2hpY2ggLSBhZmFpY3Qg
LQo+PiB3b3VsZCBhdm9pZCB0aGUgbmVlZCBmb3Igc3VjaCBsYWJlbHMsIGFuZCB3aGljaCB3b3Vs
ZCBhdCB0aGUgc2FtZQo+PiB0aW1lIGxpa2VseSBtYWtlIGl0IHF1aXRlIGEgYml0IGVhc2llciB0
byBleHRlbmQgdGhlc2UgdG8gdGhlCj4+IDUtbGV2ZWwgcGFnZSB0YWJsZXMgY2FzZSBkb3duIHRo
ZSByb2FkLgo+IAo+IEEgY29tbW9uIHBhdHRlcm4gSSBoYXZlIGZvdW5kIHdoZW4gbWFwcGluZyBQ
VEUgcGFnZXMgb24tZGVtYW5kIChhbmQgSQo+IHRoaW5rIGlzIHRoZSBleGFjdCBpbnRlbnRpb24g
b2YgdGhlc2UgbGFiZWxzIGZyb20gV2VpLCBhbHNvIGRlc2NyaWJlZAo+IGluIHRoZSBjb21taXQg
bWVzc2FnZSkgaXMgdGhhdCB3ZSBvZnRlbiBuZWVkIHRvIGRvOgo+IAo+IG1hcCBzb21lIHBhZ2Vz
IC0gcHJvY2VzcyB0aG9zZSBwYWdlcyAtIGVycm9yIG9jY3VycyBvciB0aGlzIGl0ZXJhdGlvbgo+
IG9mIGxvb3AgY2FuIGJlIHNraXBwZWQgLSBfY2xlYW4gdXAgdGhlIG1hcHBpbmdzXyAtIGNvbnRp
bnVlIG9yIHJldHVybgo+IAo+IEFzIGxvbmcgYXMgY2xlYW5pbmcgdXAgaXMgcmVxdWlyZWQsIHRo
ZXNlIGxhYmVscyB3aWxsIGxpa2VseSBiZSBuZWVkZWQKPiBhcyB0aGUgY2xlYW4tdXAgcGF0aCBi
ZWZvcmUgc2tpcHBpbmcgb3IgcmV0dXJuaW5nLCBzbyBJIHdvdWxkIHNheSB3ZQo+IHdpbGwgc2Vl
IHN1Y2ggbGFiZWxzIGV2ZW4gaWYgd2Ugc3BsaXQgaXQgaW50byBoZWxwZXIgZnVuY3Rpb25zCj4g
KHZpcnRfdG9feGVuX2xbMTIzXWUoKSBsYXRlciBpbiB0aGUgcGF0Y2ggc2VyaWVzIGlzIGFuIGV4
YW1wbGUpLiBJIHNlZQo+IHRoZSBsYWJlbHMgbW9yZSBvciBsZXNzIGFzIG9ydGhvZ29uYWwgdG8g
bW9kdWxhcmlzaW5nIGludG8gaGVscGVyCj4gZnVuY3Rpb25zLgoKSSB0aGluayBkaWZmZXJlbnRs
eTogVGhlIGZhY3QgdGhhdCBsYWJlbHMgYXJlIG5lZWRlZCBpcyBiZWNhdXNlIG9mCnRoZSBjb21w
bGV4aXR5IG9mIHRoZSBmdW5jdGlvbnMuIFNpbXBsZXIgZnVuY3Rpb25zIHdvdWxkIGFsbG93Cmdv
dG8tZnJlZSBoYW5kbGluZyBvZiBzdWNoIGVycm9yIGNvbmRpdGlvbnMgKGJ5IGluc3RlYWQgYmVp
bmcgYWJsZQp0byB1c2UgY29udGludWUsIGJyZWFrLCBvciByZXR1cm4gd2l0aG91dCBtYWtpbmcg
dGhlIGNvZGUgbGVzcwpyZWFkYWJsZSwgb2Z0ZW4gZXZlbiBpbXByb3ZpbmcgcmVhZGFiaWxpdHkp
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
