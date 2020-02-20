Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982FE1661B7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 17:02:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4oFm-0005sh-1o; Thu, 20 Feb 2020 16:00:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vvQh=4I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4oFk-0005sc-He
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 16:00:40 +0000
X-Inumbo-ID: 23aaf5e8-53fa-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23aaf5e8-53fa-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 16:00:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C803CAC91;
 Thu, 20 Feb 2020 16:00:38 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20200220120231.86907-1-roger.pau@citrix.com>
 <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
 <20200220141117.GK4679@Air-de-Roger>
 <0a3a762e-9a0d-7395-d3c4-aca07c366979@suse.com>
 <20200220151734.GM4679@Air-de-Roger>
 <9f82c3cb-862d-87bd-7a01-4812be98eedd@suse.com>
 <20200220155729.GP4679@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <01f6d0de-c36f-7506-f64a-48d8278df455@suse.com>
Date: Thu, 20 Feb 2020 17:00:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220155729.GP4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] rwlock: allow recursive read locking when
 already locked in write mode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAgMTY6NTcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVGh1LCBGZWIg
MjAsIDIwMjAgYXQgMDQ6NTA6MjJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIw
LjAyLjIwMjAgMTY6MTcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBUaHUsIEZlYiAy
MCwgMjAyMCBhdCAwNDowMjo1NVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAy
MC4wMi4yMDIwIDE1OjExLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+PiBPbiBUaHUsIEZl
YiAyMCwgMjAyMCBhdCAwMTo0ODo1NFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+
IEFub3RoZXIgb3B0aW9uIGlzIHRvIHVzZSB0aGUgcmVjdXJzZV9jcHUgZmllbGQgb2YgdGhlCj4+
Pj4+PiBhc3NvY2lhdGVkIHNwaW4gbG9jazogVGhlIGZpZWxkIGlzIHVzZWQgZm9yIHJlY3Vyc2l2
ZSBsb2Nrcwo+Pj4+Pj4gb25seSwgYW5kIGhlbmNlIHRoZSBvbmx5IGNvbmZsaWN0IHdvdWxkIGJl
IHdpdGgKPj4+Pj4+IF9zcGluX2lzX2xvY2tlZCgpLCB3aGljaCB3ZSBkb24ndCAoYW5kIGluIHRo
ZSBmdXR1cmUgdGhlbgo+Pj4+Pj4gYWxzbyBzaG91bGRuJ3QpIHVzZSBvbiB0aGlzIGxvY2suCj4+
Pj4+Cj4+Pj4+IEkgbG9va2VkIGludG8gdGhhdCBhbHNvLCBidXQgdGhpbmdzIGdldCBtb3JlIGNv
bXBsaWNhdGVkIEFGQUlDVCwgYXMgaXQncwo+Pj4+PiBub3QgcG9zc2libGUgdG8gYXRvbWljYWxs
eSBmZXRjaCB0aGUgc3RhdGUgb2YgdGhlIGxvY2sgYW5kIHRoZSBvd25lcgo+Pj4+PiBDUFUgYXQg
dGhlIHNhbWUgdGltZS4gTmVpdGhlciB5b3UgY291bGQgc2V0IHRoZSBMT0NLRUQgYml0IGFuZCB0
aGUgQ1BVCj4+Pj4+IGF0IHRoZSBzYW1lIHRpbWUuCj4+Pj4KPj4+PiBUaGVyZSdzIG5vIG5lZWQg
dG8gYXRvbWljYWxseSBmZXRjaCBib3RoIGFmYWljczogVGhlIGZpZWxkIGlzCj4+Pj4gdmFsaWQg
b25seSBpZiB0aGUgTE9DS0VEIGJpdCBpcyBzZXQuIEFuZCB3aGVuIHJlYWRpbmcgdGhlCj4+Pj4g
ZmllbGQgeW91IG9ubHkgY2FyZSBhYm91dCB0aGUgdmFsdWUgYmVpbmcgZXF1YWwgdG8KPj4+PiBz
bXBfcHJvY2Vzc29yX2lkKCksIGkuZS4gaXQgaXMgZmluZSB0byBzZXQgTE9DS0VEIGJlZm9yZQo+
Pj4+IHVwZGF0aW5nIHRoZSBDUFUgZmllbGQgb24gbG9jaywgYW5kIHRvIHJlc2V0IHRoZSBDUFUg
ZmllbGQgdG8KPj4+PiBTUElOTE9DS19OT19DUFUgKG9yIHdoYXRldmVyIGl0J3MgY2FsbGVkKSBi
ZWZvcmUgY2xlYXJpbmcKPj4+PiBMT0NLRUQuCj4+Pgo+Pj4gWWVzIHRoYXQgd291bGQgcmVxdWly
ZSB0aGUgdXNhZ2Ugb2YgYSBzZW50aW5lbCB2YWx1ZSBhcyAwIHdvdWxkIGJlIGEKPj4+IHZhbGlk
IHByb2Nlc3NvciBJRC4KPj4+Cj4+PiBJIHdvdWxkIHRyeSB0byByZWZyYWluIGZyb20gKGFidSlz
aW5nIGludGVybmFsIHNwaW5sb2NrIGZpZWxkcywgYXMgSQo+Pj4gdGhpbmsgd2UgY2FuIHNvbHZl
IHRoaXMganVzdCBieSB1c2luZyB0aGUgY250cyBmaWVsZCBvbiB0aGUgY3VycmVudAo+Pj4gcnds
b2NrIGltcGxlbWVudGF0aW9uLgo+Pj4KPj4+IFdoYXQgaXNzdWUgZG8geW91IGhhdmUgaW4gbWlu
ZCB0aGF0IHdvdWxkIHByZXZlbnQgc3RvcmluZyB0aGUgQ1BVCj4+PiB3cml0ZSBsb2NrZWQgaW4g
dGhlIGNudHMgZmllbGQ/Cj4+Cj4+IFRoZSByZWR1Y3Rpb24gb2YgdGhlIG51bWJlciBvZiBiaXRz
IHVzZWQgZm9yIG90aGVyIHB1cnBvc2VzLgo+IAo+IEkgdGhpbmsgaXQgc2hvdWxkIGJlIGZpbmUg
Zm9yIG5vdywgYXMgd2Ugd291bGQgc3VwcG9ydCBzeXN0ZW1zIHdpdGggdXAKPiB0byAxNjM4NCBD
UFUgSURzLCBhbmQgNjU1MzYgY29uY3VycmVudCByZWFkIGxvY2tlcnMsIHdoaWNoIG1lYW4gZWFj
aAo+IENQVSBjb3VsZCB0YWtlIHRoZSBsb2NrIHVwIHRvIDQgdGltZXMgcmVjdXJzaXZlbHkuIE5v
dGUgdGhhdAo+IHN1cHBvcnRpbmcgMTYzODQgQ1BVcyBpcyBzdGlsbCB2ZXJ5LCB2ZXJ5IGZhciBv
ZmYgdGhlIHJhZGFyLgoKQ3VycmVudCBzcGlubG9jayBpbXBsZW1lbnRhdGlvbiBsaW1pdHMgTlJf
Q1BVUyB0byA0MDk2LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
