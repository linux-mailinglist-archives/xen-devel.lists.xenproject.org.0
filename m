Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BC113C92D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 17:24:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irlQ7-00049m-IR; Wed, 15 Jan 2020 16:21:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irlQ5-00049h-M7
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 16:21:25 +0000
X-Inumbo-ID: 0e481798-37b3-11ea-a2eb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e481798-37b3-11ea-a2eb-bc764e2007e4;
 Wed, 15 Jan 2020 16:21:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 271C5ABF5;
 Wed, 15 Jan 2020 16:21:16 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
 <20200115115338.GL11756@Air-de-Roger>
 <c13cbf1e-2e1d-dc17-ec90-a1098a11ec58@suse.com>
 <20200115134408.GN11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7f91928-6013-75fc-d7ec-0a70654f4b64@suse.com>
Date: Wed, 15 Jan 2020 17:21:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200115134408.GN11756@Air-de-Roger>
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com,
 wl@xen.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAyMCAxNDo0NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEph
biAxNSwgMjAyMCBhdCAwMTo0OToyMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gV2hh
dCBJJ20gdGhlbiB3b3JyaWVkIGFib3V0IGlzIHRvbwo+PiBsaXR0bGUgcHJvZ3Jlc3Mgb2JzZXJ2
YWJsZSBieSBndWVzdHMuIFRoZSBQViB0aW1lIHByb3RvY29sCj4+IG91Z2h0IHRvIGJlIGZpbmUg
aW4gdGhpcyByZWdhcmQgKGFuZCBjb25zdW1lcnMgb2YgcmF3IFRTQyB2YWx1ZXMKPj4gYXJlIG9u
IHRoZWlyIG93biBhbnl3YXkpLCBidXQgd291bGRuJ3QgeW91IG5lZWQgdG8gdXBkYXRlIFRTQwo+
PiBvZmZzZXRzIG9mIEhWTSBndWVzdHMgaW4gb3JkZXIgdG8gY29tcGVuc2F0ZSBmb3IgdGhlIGVs
YXBzZWQKPj4gdGltZT8KPiAKPiBUaGF0IHdpbGwgYmUgZG9uZSB3aGVuIHRoZSBIVk0gdkNQVSBn
ZXRzIHNjaGVkdWxlZCBpbiBhcyBwYXJ0IG9mIHRoZQo+IHVwZGF0ZV92Y3B1X3N5c3RlbV90aW1l
IGNhbGwgQUZBSUNULiBjc3RhdGVfcmVzdG9yZV90c2Mgd2lsbCBhbHdheXMgYmUKPiBjYWxsZWQg
d2l0aCB0aGUgaWRsZSB2Q1BVIGNvbnRleHQsIGFuZCBoZW5jZSB0aGVyZSdzIGFsd2F5cyBnb2lu
ZyB0bwo+IGJlIGEgdkNQVSBzd2l0Y2ggYmVmb3JlIHNjaGVkdWxpbmcgYW55dGhpbmcgZWxzZS4K
CldoaWNoIHN0ZXAgd291bGQgdGhpcyBiZT8gQWxsIEkgc2VlIGlzIGEgY2FsbCB0byBodm1fc2Nh
bGVfdHNjKCkuCkluIHRpbWUuYyBvbmx5IHRzY19zZXRfaW5mbygpIGNhbGxzIGh2bV9zZXRfdHNj
X29mZnNldCgpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
