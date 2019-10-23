Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFBDE1DF0
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:19:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHRb-0007oV-Ql; Wed, 23 Oct 2019 14:16:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNHRa-0007oQ-AU
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 14:16:58 +0000
X-Inumbo-ID: c41ca013-f59f-11e9-947f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c41ca013-f59f-11e9-947f-12813bfff9fa;
 Wed, 23 Oct 2019 14:16:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E0D3ACBD;
 Wed, 23 Oct 2019 14:16:56 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191023135644.46847-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <46488d97-7416-624c-1af4-6a0201bd6711@suse.com>
Date: Wed, 23 Oct 2019 16:17:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023135644.46847-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/tsc: limit the usage of synchronization
 rendezvous
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMjAxOSAxNTo1NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IElmIFhlbiBkZXRl
Y3RzIHRoZSBUU0MgaXMgdW5yZWxpYWJsZSBpdCB3aWxsIHNldCBhIHJlbmRlenZvdXMgaGVscGVy
Cj4gdGhhdCB0cmllcyB0byBzeW5jaHJvbml6ZSB0aGUgZGlmZmVyZW50IENQVXMgVFNDIHZhbHVl
IGJ5IHByb3BhZ2F0aW5nCj4gdGhlIG9uZSBmcm9tIENQVSMwIGFuZCB3cml0aW5nIGl0IGludG8g
dGhlIElBMzJfVFNDIE1TUiBvbiBlYWNoIENQVS4KPiAKPiBXaGVuIHRoZSBzeXN0ZW0gaGFzIGEg
c2luZ2xlIHRocmVhZCBhbmQgdGhlcmUgYXJlIG5vIGhvdHBsdWdhYmxlIENQVXMKPiBkb2luZyB0
aGUgYWJvdmUganVzdCByZXN1bHRzIGluIHJlYWRpbmcgdGhlIFRTQyBmcm9tIENQVSMwIGFuZCB3
cml0aW5nCj4gaXQgaW50byB0aGUgSUEzMl9UU0MgTVNSIG9mIENQVSMwLCB3aGljaCBpcyBwb2lu
dGxlc3MsIHNvIGxpbWl0IHRoZQo+IHVzYWdlIG9mIHRoZSBzeW5jaHJvbml6YXRpb24gcmVuZGV6
dm91cyB0byBzeXN0ZW1zIHRoYXQgaGF2ZSBtb3JlIHRoYW4KPiBvbmUgQ1BVLCBldmVuIGlmIHRo
b3NlIENQVXMgYXJlIHlldCB0byBiZSBob3RwbHVnZ2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IEknbSBub3Qgc3Vy
ZSB3aGV0aGVyIHRoaXMgaXMgc3VpdGFibGUgZm9yIDQuMTMsIGJlaW5nIGEgcGVyZm9ybWFuY2UK
PiBpbXByb3ZlbWVudCBidXQgbm90IGZpeGluZyBhIGZ1bmN0aW9uYWwgYnVnLgoKVW5sZXNzIHdl
IGtub3cgdGhlcmUncyBhIGxvdCBvZiB1c2Ugb2YgWGVuIGluIFVQIG1vZGUsIEknZCBzYXkKcmF0
aGVyIG5vdC4gX0lmXyB0aGVyZSB3YXMgYSBsb3Qgb2Ygc3VjaCB1c2UsIHRoZW4gSSB0aGluayB3
ZQpvdWdodCB0byBkbyBtb3JlIHdvcmsgdG93YXJkcyBwZXJmb3JtYW5jZSB0aGVyZSAobGlrZSBy
ZS0KaW50cm9kdWNpbmcgU01QIGFsdGVybmF0aXZlcyBwYXRjaGluZykuCgpPZiBjb3Vyc2UgaW4g
dGhlIGVuZCB0aGUgZGVjaXNpb24gaXMgdG8gYmUgdGFrZW4gYnkgSsO8cmdlbiwKd2hvbSB5b3Ug
ZGlkbid0IGV2ZW4gQ2MuCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMKPiArKysgYi94ZW4v
YXJjaC94ODYvdGltZS5jCj4gQEAgLTE4MjEsNyArMTgyMSw4IEBAIHN0YXRpYyBpbnQgX19pbml0
IHZlcmlmeV90c2NfcmVsaWFiaWxpdHkodm9pZCkKPiAgICAgICAqIGFyZSBub3QgbWFya2VkIGFz
ICdyZWxpYWJsZScsIHJlLXN5bmMgZHVyaW5nIHJlbmRlenZvdXMuCj4gICAgICAgKi8KPiAgICAg
IGlmICggYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX0NPTlNUQU5UX1RTQykgJiYKPiAtICAgICAg
ICAgIWJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9UU0NfUkVMSUFCTEUpICkKPiArICAgICAgICAg
IWJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9UU0NfUkVMSUFCTEUpICYmCj4gKyAgICAgICAgIG51
bV9wcmVzZW50X2NwdXMoKSA+IDEgKQo+ICAgICAgICAgIHRpbWVfY2FsaWJyYXRpb25fcmVuZGV6
dm91c19mbiA9IHRpbWVfY2FsaWJyYXRpb25fdHNjX3JlbmRlenZvdXM7CgpEaWQgeW91IGNvbnNp
ZGVyIHRoZSBhbHRlcm5hdGl2ZSBvZiBzd2l0Y2hpbmcgdGhlIHJlbmRlenZvdXMKZnVuY3Rpb24g
d2hlbiBnb2luZyBmcm9tIFVQIHRvIE1QIG1vZGUgKG9yIGJhY2spPwoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
