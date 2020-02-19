Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413E11645E5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 14:46:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4PeA-0008NL-Q5; Wed, 19 Feb 2020 13:44:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4Pe9-0008NF-Pe
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 13:44:13 +0000
X-Inumbo-ID: e9b419a0-531d-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9b419a0-531d-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 13:44:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89E17BEB2;
 Wed, 19 Feb 2020 13:44:12 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-3-roger.pau@citrix.com>
 <1b278189-c96a-796a-1733-a3584809227f@suse.com>
 <20200219132217.GB4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <960b4da8-4522-082a-42b9-ab870698a5ec@suse.com>
Date: Wed, 19 Feb 2020 14:44:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200219132217.GB4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] smp: convert cpu_hotplug_begin into a
 blocking lock acquisition
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxNDoyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAxOSwgMjAyMCBhdCAwMTo1OTo1MVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTMuMDIuMjAyMCAxMjozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gRG9uJ3QgYWxsb3cg
Y3B1X2hvdHBsdWdfYmVnaW4gdG8gZmFpbCBieSBjb252ZXJ0aW5nIHRoZSB0cnlsb2NrIGludG8g
YQo+Pj4gYmxvY2tpbmcgbG9jayBhY3F1aXNpdGlvbi4gV3JpdGUgdXNlcnMgb2YgdGhlIGNwdV9h
ZGRfcmVtb3ZlX2xvY2sgYXJlCj4+PiBsaW1pdGVkIHRvIENQVSBwbHVnL3VucGx1ZyBvcGVyYXRp
b25zLCBhbmQgY2Fubm90IGRlYWRsb2NrIGJldHdlZW4KPj4+IHRoZW1zZWx2ZXMgb3Igb3RoZXIg
dXNlcnMgdGFraW5nIHRoZSBsb2NrIGluIHJlYWQgbW9kZSBhcwo+Pj4gY3B1X2FkZF9yZW1vdmVf
bG9jayBpcyBhbHdheXMgbG9ja2VkIHdpdGggaW50ZXJydXB0cyBlbmFibGVkLiBUaGVyZQo+Pj4g
YXJlIGFsc28gbm8gb3RoZXIgbG9ja3MgdGFrZW4gZHVyaW5nIHRoZSBwbHVnL3VucGx1ZyBvcGVy
YXRpb25zLgo+Pgo+PiBJIGRvbid0IHRoaW5rIHRoZSBnb2FsIHdhcyBkZWFkbG9jayBhdm9pZGFu
Y2UsIGJ1dCByYXRoZXIgbGltaXRpbmcKPj4gb2YgdGhlIHRpbWUgc3BlbnQgc3Bpbm5pbmcgd2hp
bGUgdHJ5aW5nIHRvIGFjcXVpcmUgdGhlIGxvY2ssIGluCj4+IGZhdm9yIG9mIGhhdmluZyB0aGUg
Y2FsbGVyIHJldHJ5Lgo+IAo+IE5vdyB0aGF0IHRoZSBjb250ZW50aW9uIGJldHdlZW4gcmVhZC1v
bmx5IHVzZXJzIGlzIHJlZHVjZWQgYXMgdGhvc2UKPiBjYW4gdGFrZSB0aGUgbG9jayBpbiBwYXJh
bGxlbCBJIHRoaW5rIGl0J3Mgc2FmZSB0byBzd2l0Y2ggd3JpdGVycyB0bwo+IGJsb2NraW5nIG1v
ZGUuCgpJJ2QgYWdyZWUgaWYgd3JpdGVycyBjb3VsZG4ndCBiZSBzdGFydmVkIGJ5IChtYW55KSBy
ZWFkZXJzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
