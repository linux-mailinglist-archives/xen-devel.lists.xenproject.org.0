Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97ED177BEF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 17:31:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9AOY-0002Jx-Az; Tue, 03 Mar 2020 16:27:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9AOX-0002Js-0p
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 16:27:45 +0000
X-Inumbo-ID: e8d9f100-5d6b-11ea-a1b6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8d9f100-5d6b-11ea-a1b6-12813bfff9fa;
 Tue, 03 Mar 2020 16:27:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5C908B343;
 Tue,  3 Mar 2020 16:27:43 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200303123058.27210-1-jgross@suse.com>
 <c1bea0c8-3dc8-ede3-eb63-ca601b6d2d91@suse.com>
 <c8946349-ae40-fe58-26a8-c1bc918ddc82@suse.com>
 <79bdd397-4c90-fe07-5d10-a62d193c2c83@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <95548aca-d49f-e29a-3314-dd98293ab990@suse.com>
Date: Tue, 3 Mar 2020 17:27:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <79bdd397-4c90-fe07-5d10-a62d193c2c83@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix cpu offlining with core
 scheduling
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxNzoyMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwMy4wMy4yMCAx
NzowNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMDMuMDMuMjAgMTQ6NDUsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMDMuMDMuMjAyMCAxMzozMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiBAQCAtMjUzOCw3ICsyNTUyLDEwIEBAIHN0YXRpYyB2b2lkIHNjaGVkX3NsYXZlKHZvaWQp
Cj4+Pj4gwqDCoMKgwqDCoCBuZXh0ID0gc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKHByZXYsICZs
b2NrLCBjcHUsIG5vdyk7Cj4+Pj4gwqDCoMKgwqDCoCBpZiAoICFuZXh0ICkKPj4+PiArwqDCoMKg
IHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9j
ayk7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+PiArwqDCoMKgIH0KPj4+Cj4+
PiBUaGlzIGFuZCAuLi4KPj4+Cj4+Pj4gQEAgLTI1OTksNyArMjYxNiwxMCBAQCBzdGF0aWMgdm9p
ZCBzY2hlZHVsZSh2b2lkKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjcHVtYXNrX3JhaXNlX3Nv
ZnRpcnEobWFzaywgU0NIRURfU0xBVkVfU09GVElSUSk7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IG5leHQgPSBzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4ocHJldiwgJmxvY2ssIGNwdSwgbm93KTsK
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCAhbmV4dCApCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jl
c19yY3Vsb2NrKTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIH0KPj4+Cj4+PiAuLi4gdGhpcyBsb29rIGxpa2UgaW5kZXBlbmRlbnQg
Zml4ZXMsIGFzIG9uIEFybSwKPj4+IHNjaGVkX3dhaXRfcmVuZGV6dm91c19pbigpIGNhbiBhbHJl
YWR5IHJldHVybiBOVUxMLiBJZiB0aGV5IGdldAo+Pj4gZm9sZGVkIGludG8gaGVyZSwgSSB0aGlu
ayB0aGUgZGVzY3JpcHRpb24gc2hvdWxkIGNsYXJpZnkgdGhhdAo+Pj4gdGhlc2UgYXJlIG9ydGhv
Z29uYWwgdG8gdGhlIHJlc3QuCj4+Cj4+IFllYWgsIHByb2JhYmx5IGJldHRlciB0byBzcGxpdCB0
aGUgcGF0Y2guCj4gCj4gT2gsIHRoaXMgcGF0Y2ggd2FzIHdyb25nOiBVcCB0byBub3cgc2NoZWRf
d2FpdF9yZW5kZXp2b3VzX2luKCkgYWx3YXlzCj4gd2FzIHJlc3BvbnNpYmxlIGZvciBkcm9wcGlu
ZyBzY2hlZF9yZXNfcmN1bG9jaywgc28gSSBzaG91bGQgZG8gdGhhdCBpbgo+IHRoZSBuZXcgTlVM
TCByZXR1cm4gY2FzZSwgdG9vLgoKT2gsIHRocm91Z2ggY2FsbGluZyBvZiBzY2hlZF9jb250ZXh0
X3N3aXRjaCgpLiBJIGd1ZXNzIGJvdGggZnVuY3Rpb25zCndhbnQgdG8gZ2FpbiBhIGNvbW1lbnQg
YWJvdXQgdGhpcyBhc3BlY3Qgb2YgdGhlaXIgYmVoYXZpb3IuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
