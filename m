Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB15E9B4E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 13:05:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPmfv-0006Ej-6B; Wed, 30 Oct 2019 12:02:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iUym=YX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPmft-0006Ee-Nh
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 12:02:05 +0000
X-Inumbo-ID: 15ff7d4c-fb0d-11e9-a531-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15ff7d4c-fb0d-11e9-a531-bc764e2007e4;
 Wed, 30 Oct 2019 12:02:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DD073B3B4;
 Wed, 30 Oct 2019 12:02:02 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1e714166-ffeb-06a1-9caf-412eb040ac5a@suse.com>
 <005a7254-aae8-ec7c-6e65-9dfe06803208@suse.com>
 <2b7a7130-9532-82fe-c5fc-58745862e6dd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8be656ff-d372-8e67-0732-e85ae0bab49c@suse.com>
Date: Wed, 30 Oct 2019 13:02:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2b7a7130-9532-82fe-c5fc-58745862e6dd@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86: explicitly disallow guest access
 to PPIN
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

T24gMzAuMTAuMjAxOSAxMjo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8xMC8yMDE5
IDEwOjM5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVG8gZnVsZmlsbCB0aGUgInByb3RlY3RlZCIg
aW4gaXRzIG5hbWUsIGRvbid0IGxldCB0aGUgcmVhbCBoYXJkd2FyZQo+PiB2YWx1ZXMgInNoaW5l
IHRocm91Z2giLiBSZXBvcnQgYSBjb250cm9sIHJlZ2lzdGVyIHZhbHVlIGV4cHJlc3NpbmcgdGhp
cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiAtLS0KPj4gVEJEOiBEbyB3ZSB3YW50IHRvIHBlcm1pdCBEb20wIGFjY2Vzcz8KPiAKPiBJIHdv
dWxkIHJlY29tbWVuZCByZW9yZGVyaW5nIHRoZSB0d28gcGF0Y2hlcyBhbmQgcHV0dGluZyB0aGlz
IG9uZSBmaXJzdAo+IChhbG9uZyB3aXRoIHRoZSBlbnVtZXJhdGlvbiBkZXRhaWxzLCBhbG9uZyB3
aXRoIGEgcGFpciBvZiBmZWF0dXJlCj4gc3RyaW5ncyBpbiB4ZW4tY3B1aWQpLsKgIFRoaXMgcGF0
Y2ggYXQgbGVhc3Qgd2FudHMgYmFja3BvcnRpbmcuCgpXZWxsLCB0aGUgcmVhc29uIGZvciB0aGlz
IG9yZGVyaW5nIGlzIGJlY2F1c2UgdGhpcyB3YXkgRG9tMApkb2Vzbid0IHRyYW5zaWVudGx5IGxv
c2UgYWxsIGFjY2Vzcy4KCkFzIHRvIHhlbi1jcHVpZCAtIEkgYWRtaXQgSSBzaW1wbHkgZm9yZ290
IHRvIHVwZGF0ZSBpdCwgbGFyZ2VseQpkdWUgdG8gdGhlcmUgbm90IGJlaW5nIGFueSBDUFVJRCBi
aXQgb24gdGhlIEludGVsIHNpZGUuIFRoYXQgcGFydAp3b3VsZCBvYnZpb3VzbHkgbGl2ZSBpbiB3
aGljaGV2ZXIgcGF0Y2ggd2UgZWxlY3QgdG8gYmUgZmlyc3QuCgo+IFRoaXMgd291bGQgYmUgZmFy
IG1vcmUgc2ltcGxlIGlmIHdlIGRvbid0IHBlcm1pdCBkb20wIGFjY2Vzcy7CoCBZZXMsIGl0Cj4g
c2hhcmVzIHBsYXRmb3JtIHJlc3BvbnNpYmlsaXR5IHdpdGggWGVuLCBidXQgaXQgYWxzbyBjYW4n
dCBkbyBhbnl0aGluZwo+IG1vcmUgd2l0aCB0aGUgdmFsdWUgdGhhbiBYZW4gY2FuLCB3aGljaCBp
cyB0byBzaW1wbHkgcHJpbnQgaXQgb3V0IGZvciAjTUNFcy4KCk9rYXksIHRoZW4gbGV0J3Mgbm90
IGV4cG9zZSBpdC4gSSdsbCBkcm9wIHRoZSBUQkQuCgo+IEF2b2lkaW5nIGdpdmluZyBkb20wIGFj
Y2VzcyB3b3VsZCByZW1vdmUgdGhlIG5lZWQgdG8gYXR0ZW1wdCB0bwo+IHZpcnR1YWxpc2Ugc29t
ZXRoaW5nIHdoaWNoIGlzIG1vZGVsIHNwZWNpZmljIG9uIHRoZSBJbnRlbCBzaWRlLCBhbmQKPiBh
bGxvdyBhbGwgNCBNU1JzIHRvIGJlIHVuY29uZGl0aW9uYWwgI0dQJ3MuwqAgSSBmb3Igb25lIGRv
bid0IHdhbnQgdG8KPiBoYXZlIHRvIGNvbnNpZGVyIHRoZSBtaWdyYXRpb24gaW1wbGljYXRpb25z
IG9mIGxldHRpbmcgZ3Vlc3RzIHNlZSB0aGlzLgoKSSBkb24ndCB1bmRlcnN0YW5kIHRoZSBjb25u
ZWN0aW9uIGJldHdlZW4gRG9tMCBhY2Nlc3MgYW5kIHBvc3NpYmxlCm1pZ3JhdGlvbiBpbXBsaWNh
dGlvbnMuIEknbSBhbHNvIHN0cnVnZ2xpbmcgdG8gc2VlIGhvdywgZm9yIGEgd2VsbApiZWhhdmVk
IGd1ZXN0LCB0aGVyZSB3b3VsZCBuZWVkIHRvIGJlIGFueSBtaWdyYXRpb24gY29uc2lkZXJhdGlv
bnMKaW4gdGhlIGZpcnN0IHBsYWNlOiBPbmNlIGl0IGhhcyByZWFkIHRoZSBjb250cm9sIHJlZ2lz
dGVyIGFuZCBmb3VuZAp0aGUgbG9ja291dCBiaXQgc2V0LCBpdCBzaG91bGRuJ3QgbWFrZSBhbnkg
ZnVydGhlciBhY2Nlc3MgYXR0ZW1wdHMuClNpbWlsYXJseSBvbmNlIGl0IGdvdCBhICNHUCgwKSB1
cG9uIGFjY2VzcywgaXQgd291bGRuJ3QgdHJ5IGFnYWluLgpUaGVyZSB3b3VsZCBiZSBhbiBpc3N1
ZSBvbmx5IGlmIHdlIGFjdHVhbGx5IHN1cHBsaWVkIFBQSU4gdmFsdWVzLApldmVuIGlmIGl0IHdl
cmUganVzdCBmYWtlIG9uZXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
