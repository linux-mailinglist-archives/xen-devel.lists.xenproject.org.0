Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4816787C6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 10:52:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs1Le-0006T0-Vv; Mon, 29 Jul 2019 08:49:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uQHP=V2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hs1Ld-0006So-Hj
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 08:49:37 +0000
X-Inumbo-ID: c7ec8d34-b1dd-11e9-80de-533773beaff7
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7ec8d34-b1dd-11e9-80de-533773beaff7;
 Mon, 29 Jul 2019 08:49:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 924CAB5EC;
 Mon, 29 Jul 2019 08:49:30 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190729043624.16965-1-jgross@suse.com>
 <a45276d3-b0e2-aab9-3180-962d7741b43d@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6e95a0ee-ac09-ded3-627c-f20735c9af0e@suse.com>
Date: Mon, 29 Jul 2019 10:49:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <a45276d3-b0e2-aab9-3180-962d7741b43d@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] xen: don't longjmp() after domain_crash()
 in check_wakeup_from_wait()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMTkgMTA6MzQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjkvMDcvMjAxOSAw
NTozNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQ29udGludWluZyBvbiB0aGUgc3RhY2sgc2F2
ZWQgYnkgX19wcmVwYXJlX3RvX3dhaXQoKSBvbiB0aGUgd3JvbmcgY3B1Cj4+IGlzIHJhdGhlciBk
YW5nZXJvdXMuCj4+Cj4+IEluc3RlYWQgb2YgZG9pbmcgc28ganVzdCBjYWxsIHRoZSBzY2hlZHVs
ZXIgYWdhaW4gYXMgaXQgYWxyZWFkeSBpcwo+PiBoYXBwZW5pbmcgaW4gdGhlIHNpbWlsYXIgY2Fz
ZSBpbiBfX3ByZXBhcmVfdG9fd2FpdCgpIHdoZW4gZG9pbmcgdGhlCj4+IHNldGptcCgpIHdvdWxk
IGJlIHdyb25nLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Cj4gCj4gSSdtIGFmcmFpZCB0aGlzIGlzIHN0aWxsIHByb2JsZW1hdGljLsKgIEJ5IHN1
Y2Nlc3NmdWxseSBpbnZva2luZyB0aGUKPiB3YWl0cXVldWUsIHdlIGtub3cgdGhhdCBubyBzcGlu
bG9ja3Mgd2VyZSBoZWxkLCBidXQgd2UgaGF2ZSBubyBndWFyYW50ZWUKPiB0aGF0IGUuZy4gYW4g
eG1hbGxvYygpJ2QgcG9pbnRlciBpcyBzdGlsbCBvbmx5IHN0YXNoZWQgaW4gdGhlIHN0YWNrLgoK
QnV0IGhvdyBhcmUgdGhlIGRvbWFpbl9jcmFzaCgpIGludm9jYXRpb25zIHdpdGggZm9sbG93aW5n
IGRvX3NvZnRpcnEoKQpjYWxscyBpbiB0aGUgX19wcmVwYXJlX3RvX3dhaXQoKSBjYXNlIGZpbmUg
dGhlbj8gQXQgdGhlIHBsYWNlIHdoZXJlCmVpdGhlciBkb2luZyBzZXRqbXAoKSBvciBsb25nam1w
KCkgaXQgc2hvdWxkIGJlIG9rYXkgdG8gdGhyb3cgYXdheSB0aGUKY3VycmVudCBzdGFjaywgb3Ig
b3RoZXJ3aXNlIHRoZXJlIHdvdWxkIGJlIGluY29uc2lzdGVuY2llcy4KClNvIGVpdGhlciB0aGVy
ZSBpcyBhbHJlYWR5IGEgcHJvYmxlbSBpbiB0aGUgY29kZSByZWdhcmRpbmcgaG93IHRoZQpkb21h
aW4gY3Jhc2hpbmcgaXMgZG9uZSBpbiBfX3ByZXBhcmVfdG9fd2FpdCgpLCBvciBteSBzb2x1dGlv
biBpcyBqdXN0CmZpbmUsIGFzIGl0IGlzIGp1c3QgZXhwYW5kaW5nIHRoZSBjdXJyZW50IGJlaGF2
aW9yLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
