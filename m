Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99676189CE0
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 14:25:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEYcS-0000wy-5v; Wed, 18 Mar 2020 13:20:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEYcQ-0000wt-1B
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 13:20:22 +0000
X-Inumbo-ID: 37daae7e-691b-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37daae7e-691b-11ea-bec1-bc764e2007e4;
 Wed, 18 Mar 2020 13:20:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E4B0B135;
 Wed, 18 Mar 2020 13:20:20 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <916bbc82cafac74f0a203b48eebfbc711bd33a70.camel@infradead.org>
 <c22d4a40717c7d2fad243c244619d2882ad5baf2.camel@infradead.org>
 <5fc87ac4-8be9-3881-03af-85faca1e2bf5@suse.com>
 <9664816b-7607-c3f4-b70c-455bb946241f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <079ba681-0a2d-95a5-046d-15be3e123a4f@suse.com>
Date: Wed, 18 Mar 2020 14:20:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9664816b-7607-c3f4-b70c-455bb946241f@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/setup: simplify handling of
 initrdidx when no initrd present
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <xadimgnik@gmail.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAxMzoxMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDE4
LzAzLzIwMjAgMTE6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxOC4wMy4yMDIwIDEyOjQ2
LCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4+PiBGcm9tOiBEYXZpZCBXb29kaG91c2UgPGR3bXdA
YW1hem9uLmNvLnVrPgo+Pj4KPj4+IFJlbW92ZSBhIHRlcm5hcnkgb3BlcmF0b3IgdGhhdCBtYWRl
IG15IGJyYWluIGh1cnQuCj4+Cj4+IE15IHBvc2l0aW9uIHRvd2FyZHMgdGhpcyBoYXNuJ3QgY2hh
bmdlZCwganVzdCBmdHIuCj4+Cj4+PiBSZXBsYWNlIGl0IHdpdGggc29tZXRoaW5nIHNpbXBsZXIg
dGhhdCBtYWtlcyBpdCBzb21ld2hhdCBjbGVhcmVyIHRoYXQKPj4+IHRoZSBjaGVjayBmb3IgaW5p
dHJkaWR4IDwgbWJpLT5tb2RzX2NvdW50IGlzIGJlY2F1c2UgbGFyZ2VyIHZhbHVlcyBhcmUKPj4+
IHdoYXQgZmluZF9maXJzdF9iaXQoKSB3aWxsIHJldHVybiB3aGVuIGl0IGRvZXNuJ3QgZmluZCBh
bnl0aGluZy4KPj4+Cj4+PiBBbHNvIGRyb3AgdGhlIGV4cGxpY2l0IGNoZWNrIGZvciBtb2R1bGUg
IzAgc2luY2UgdGhhdCB3b3VsZCBiZSB0aGUKPj4+IGRvbTAga2VybmVsIGFuZCB0aGUgY29ycmVz
cG9uZGluZyBiaXQgaXMgYWx3YXlzIGNsZWFyIGluIG1vZHVsZV9tYXAuCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KPj4+IEFja2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+Pgo+PiBTdHJpY3RseSBzcGVha2luZyB0
aGlzIGlzIG5vdCBhIHZhbGlkIHRhZyBoZXJlLCBvbmx5IFItYiB3b3VsZCBiZS4KPiAKPiBJIGNh
bid0IGZpbmQgYW55IHJ1bGUgaW4gb3VyIGNvZGUgYmFzZSBwcmV2ZW50aW5nIGEgbm9uLW1haW50
YWluZXIgdG8gYWRkIGl0cyAiYWNrZWQtYnkiIHRhZy4KCkkgY291bGQgaGF2ZSBzYWlkICJtZWFu
aW5nZnVsIiBpbnN0ZWFkIG9mICJ2YWxpZCI6IEEgcGF0Y2ggaXMgbm90CnN1cHBvc2VkIHRvIGdv
IGluIHdpdGhvdXQgYSBkaXJlY3QgbWFpbnRhaW5lcidzIGFjaywgdW5sZXNzIHRoZXJlJ3MKYSBy
ZWFzb24gdG8gaW52b2tlIHRoZSBuZXN0ZWQgbWFpbnRhaW5lcnNoaXAgcnVsZXMuIFRoYXQncyBt
eQp1bmRlcnN0YW5kaW5nIGF0IGxlYXN0LgoKPiBCdXQgaWYgeW91IHdhbnQgdG8gcGxheSBhdCB0
aGlzIGdhbWUsIG15IHRhZyBpcyB0ZWNobmljYWxseSB2YWxpZAo+IGJlY2F1c2UgIlRIRSBSRVNU
IiBlbmdsb2JlcyB0aGUgZnVsbCBYZW4gY29kZWJhc2UgKE5vdGUgdGhlICogaW4KPiB0aGUgTUFJ
TlRBSU5FUlMgZmlsZSkuCgpOb3RlIHRoZSBuZXN0ZWQgbWFpbnRhaW5lcnNoaXAgd29yZGluZyBp
biB0aGF0IGZpbGUsIHdoaWNoIHdhcyBhZGRlZApwcmV0dHkgcmVjZW50bHkuIElmIHRoYXQgd29y
ZGluZyBpc24ndCBjbGVhciBlbm91Z2gsIHBlcmhhcHMgd2UgY2FuCmZ1cnRoZXIgcmVmaW5lIGl0
PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
