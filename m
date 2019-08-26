Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7269CBB9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 10:38:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2ATd-0005dX-1K; Mon, 26 Aug 2019 08:35:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5J6g=WW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i2ATb-0005dP-IP
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 08:35:47 +0000
X-Inumbo-ID: 800c01ec-c7dc-11e9-ae23-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 800c01ec-c7dc-11e9-ae23-12813bfff9fa;
 Mon, 26 Aug 2019 08:35:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A9BFB011
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2019 08:35:46 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190802130730.15942-1-jgross@suse.com>
 <20190802130730.15942-2-jgross@suse.com>
 <a230e9a93d32f16bd4821d9a97b55b4343641526.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <47c2c666-656f-80ae-0898-4df29d0aaf83@suse.com>
Date: Mon, 26 Aug 2019 10:35:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a230e9a93d32f16bd4821d9a97b55b4343641526.camel@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 1/3] xen/sched: populate cpupool0 only after
 all cpus are up
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDguMTkgMTg6MDcsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIEZyaSwgMjAxOS0w
OC0wMiBhdCAxNTowNyArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gV2l0aCBjb3JlIG9y
IHNvY2tldCBzY2hlZHVsaW5nIHdlIG5lZWQgdG8ga25vdyB0aGUgbnVtYmVyIG9mIHNpYmxpbmdz
Cj4+IHBlciBzY2hlZHVsaW5nIHVuaXQgYmVmb3JlIHdlIGNhbiBzZXR1cCB0aGUgc2NoZWR1bGVy
IHByb3Blcmx5LiBJbgo+PiBvcmRlciB0byBwcmVwYXJlIHRoYXQgZG8gY3B1cG9vbDAgcG9wdWxh
dGlvbiBvbmx5IGFmdGVyIGFsbCBjcHVzIGFyZQo+PiB1cC4KPj4KPj4gV2l0aCB0aGF0IGluIHBs
YWNlIHRoZXJlIGlzIG5vIG5lZWQgdG8gY3JlYXRlIGNwdXBvb2wwIGVhcmxpZXIsIHNvCj4+IGRv
IHRoYXQganVzdCBiZWZvcmUgYXNzaWduaW5nIHRoZSBjcHVzLiBJbml0aWFsaXplIGZyZWUgY3B1
cyB3aXRoIGFsbAo+PiBvbmxpbmUgY3B1cyBhdCB0aGF0IHRpbWUgaW4gb3JkZXIgdG8gYmUgYWJs
ZSB0byBhZGQgdGhlIGNwdSBub3RpZmllcgo+PiBsYXRlLCB0b28uCj4+Cj4gU28sIG5vdyB0aGF0
IHRoaXMgc2VyaWVzIGhhcyBiZWVuIG1hZGUgaW5kZXBlbmRlbnQsIEkgdGhpbmsgdGhhdAo+IG1l
bnRpb25zIHRvIHRoZSBjb3JlLXNjaGVkdWxpbmcgb25lIHNob3VsZCBiZSBkcm9wcGVkLgo+IAo+
IEkgbWVhbiwgaXQgaXMgYXQgbGVhc3QgcG9zc2libGUgdGhhdCB0aGlzIHNlcmllcyB3b3VsZCBn
byBpbiwgd2hpbGUgdGhlCj4gY29yZS1zY2hlZHVsaW5nIG9uZSBuZXZlciB3aWxsLiBBbmQgYXQg
dGhhdCBwb2ludCwgaXQgd291bGQgYmUgdmVyeQo+IGhhcmQsIGZvciBzb21lb25lIGRvaW5nIGFy
Y2hhZW9sb2d5LCB0byB1bmRlcnN0YW5kIHdoYXQgd2VudCBvbi4KPiAKPiBJdCBzZWVtcyB0byBt
ZSB0aGF0LCB0aGlzIHBhdGNoLCBzaW1wbGlmaWVzIGNwdXBvb2wgaW5pdGlhbGl6YXRpb24gKGFz
LAo+IGUuZy4sIHRoZSBkaXJlY3QgY2FsbCB0byB0aGUgQ1BVX09OTElORSBub3RpZmllciBmb3Ig
dGhlIEJTUCB3YXMgSU1PCj4gcmF0aGVyIGNvbnZvbHV0ZWQpLiBBbmQgdGhhdCBpcyBtYWRlIHBv
c3NpYmxlIGJ5IG1vdmluZyB0aGUKPiBpbml0aWFsaXphdGlvbiBpdHNlbGYgdG8gYSBsYXRlciBw
b2ludCwgbWFraW5nIGFsbCB0aGUgb25saW5lIENQVXMgbG9vawo+IGxpa2UgZnJlZSBDUFVzLCBh
bmQgdXNpbmcgdGhlIHN0YW5kYXJkIChpbnRlcm5hbCkgQVBJIGRpcmVjdGx5IChpLmUuLAo+IGNw
dXBvb2xfYXNzaWduX2NwdV9sb2NrZWQoKSkgdG8gYWRkIHRoZW0gdG8gUG9vbC0wLgo+IAo+IFNv
LCBJJ2Qga2lsbCB0aGUgdmVyeSBmaXJzdCBzZW50ZW5jZSBhbmQgcmVhcnJhbmdlIHRoZSByZXN0
IHRvIGluY2x1ZGUKPiBhdCBsZWFzdCBhIHF1aWNrIG1lbnRpb24gdG8gdGhlIHNpbXBsaWZpY2F0
aW9uIHRoYXQgd2UgYWNoaWV2ZS4KCkZpbmUgd2l0aCBtZS4KCgpKdWVyZ2VuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
