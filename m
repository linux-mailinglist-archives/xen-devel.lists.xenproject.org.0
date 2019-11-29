Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DF610D61B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 14:29:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iagIP-0002xF-Nw; Fri, 29 Nov 2019 13:26:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iagIN-0002xA-Ux
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 13:26:51 +0000
X-Inumbo-ID: e66b59e6-12ab-11ea-a3e6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e66b59e6-12ab-11ea-a3e6-12813bfff9fa;
 Fri, 29 Nov 2019 13:26:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4611AC9A;
 Fri, 29 Nov 2019 13:26:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <78b1df38-864c-768e-b306-2db75f3b76e0@citrix.com>
 <e765c741-cba4-42bf-b61a-20a206cd628d@suse.com>
 <24033.2185.509756.178278@mariner.uk.xensource.com>
 <47257a2e-5454-6115-93c9-e1b9ed3a4131@suse.com>
 <d8e8729a-3a20-f65d-0c1b-9f5522f4a450@citrix.com>
 <f998ce81-8b77-a2c6-ab90-cedff89799da@suse.com>
 <358e29a0-0fce-28de-fdf3-730e6b4aaf26@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11a7ce02-b4cd-a24f-f477-d3fe720b04ee@suse.com>
Date: Fri, 29 Nov 2019 14:26:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <358e29a0-0fce-28de-fdf3-730e6b4aaf26@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, KonradWilk <konrad.wilk@oracle.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 GeorgeDunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMzozNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOS8xMS8yMDE5
IDEyOjE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjkuMTEuMjAxOSAxMzoxNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDI5LzExLzIwMTkgMTI6MTMsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDI5LjExLjIwMTkgMTM6MDEsIElhbiBKYWNrc29uIHdyb3RlOgo+Pj4+PiBKYW4g
QmV1bGljaCB3cml0ZXMgKCJSZTogW1BBVENIXSBjb25zb2xlOiBhdm9pZCBidWZmZXIgb3ZlcmZs
b3cgaW4gZ3Vlc3RfY29uc29sZV93cml0ZSgpIik6Cj4+Pj4+PiBPbiAyOS4xMS4yMDE5IDExOjIy
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4+IElzIHNpemVvZihhcnJheVswXSkgYWx3YXlz
IDAsIG9yIGlzIHRoaXMganVzdCBhIEdDQy1pc20gP8KgIEdvZGJvbHQKPj4+Pj4+PiBzdWdnZXN0
cyBpcyAwIG9uIGFsbCBjb21waWxlciB3ZSBzdXBwb3J0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gRWl0aGVy
IHdheSwgaXNuJ3QgdGhlIG1vcmUgY29tbW9uIGlkaW9tICsgMHVsID/CoCBQZXJzb25hbGx5LCBJ
IGZlZWwgdGhhdAo+Pj4+Pj4+IGlzIGNsZWFyZXIgdG8gZm9sbG93Lgo+Pj4+Pj4gSSBkZWNpZGVk
IGFnYWluc3QgKyAwdWwgb3IgYWxpa2UgYmVjYXVzZSBpbiBwcmluY2lwbGUgc2l6ZV90Cj4+Pj4+
PiBhbmQgdW5zaWduZWQgbG9uZyBhcmUgZGlmZmVyZW50IHR5cGVzLiBJbiBwYXJ0aWN1bGFyIDMy
LWJpdAo+Pj4+Pj4geDg2IGdjYyB1c2VzIHVuc2lnbmVkIGludCBmb3Igc2l6ZV90LCBhbmQgaGVu
Y2UgbWluKCkncwo+Pj4+Pj4gdHlwZSBzYWZldHkgY2hlY2sgd291bGQgY2F1c2UgdGhlIGJ1aWxk
IHRvIGZhaWwgdGhlcmUuIFRoZQo+Pj4+Pj4gc2FtZSByaXNrIG9idmlvdXNseSBleGlzdHMgZm9y
IGFueSAzMi1iaXQgYXJjaCAoZS5nLiBBcm0zMiwKPj4+Pj4+IGJ1dCBJIGhhdmVuJ3QgY2hlY2tl
ZCB3aGF0IHR5cGUgaXQgYWN0dWFsbHkgdXNlcykuCj4+Pj4+IEkgZG9uJ3Qga25vdyB3aGF0IGkg
d3Jvbmcgd2l0aAo+Pj4+PiAgICAoc2l6ZV90KTAKPj4+Pj4gd2hpY2ggaXMgc2hvcnRlciwgZXZl
biAhCj4+Pj4gVHJ1ZS4gWWV0IGl0IGNvbnRhaW5zIGEgY2FzdCwgbm8gbWF0dGVyIGhvdyByaXNr
LWZyZWUgaXQgbWF5IGJlCj4+Pj4gaW4gdGhpcyBjYXNlLiBXaXRoIGEgY2FzdCwgSSBjb3VsZCBh
cyB3ZWxsIGhhdmUgd3JpdHRlbiAoeWV0Cj4+Pj4gc2hvcnRlcikgKHNpemVfdCljb3VudC4KPj4+
IEdpdmVuIHRoYXQgbWluKCkgaGFzIGEgdmVyeSBzdHJpY3QgdHlwZWNoZWNrLCBJIHRoaW5rIHdl
IHNob3VsZCBwZXJtaXQKPj4+IGFueSB1c2Ugb2YgYW4gZXhwbGljaXQgY2FzdCBpbiBhIHNpbmds
ZSBvcGVyYW5kLCBiZWNhdXNlIGl0ICppcyogc2FmZXIKPj4+IHRoYW4gc3dpdGNoaW5nIHRvIHRo
ZSBtaW5fdCgpIHJvdXRlIHRvIG1ha2UgdGhpbmdzIGNvbXBpbGUuCj4+IFdlbGwsIEkgY2FuIHN3
aXRjaCB0byAoc2l6ZV90KWNvdW50IGlmIHRoaXMgaXMgbGlrZWQgYmV0dGVyCj4+IG92ZXJhbGwu
Cj4gCj4gUGVyc29uYWxseSwgSSdkIHByZWZlciB0aGlzIG9wdGlvbiBtb3N0IG9mIGFsbC4KCk9r
YXksIEkndmUgc3dpdGNoZWQgdG8gdGhpcywgYnV0IHdoaWxlIGRvaW5nIHNvIEkgc3RhcnRlZCB3
b25kZXJpbmcKd2h5IHdlJ2QgdGhlbiBub3QgdXNlCgogICAgICAgIGtjb3VudCA9IG1pbihjb3Vu
dCwgKHVuc2lnbmVkIGludClzaXplb2Yoa2J1ZikgLSAxKTsKCndoaWNoIGlzIGFuIChvZnRlbiBz
bGlnaHRseSBjaGVhcGVyKSAzMi1iaXQgb3BlcmF0aW9uIChhbmQgd2hpY2gKaXMgd2hhdCBJIGhh
ZCBhY3R1YWxseSBzdGFydGVkIGZyb20pLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
