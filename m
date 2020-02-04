Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ED8151A18
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 12:48:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iywdS-0005i0-1C; Tue, 04 Feb 2020 11:44:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HXg5=3Y=amazon.com=prvs=29657e233=jgrall@srs-us1.protection.inumbo.net>)
 id 1iywdQ-0005hv-ML
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 11:44:52 +0000
X-Inumbo-ID: c180ae66-4743-11ea-ad98-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c180ae66-4743-11ea-ad98-bc764e2007e4;
 Tue, 04 Feb 2020 11:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580816692; x=1612352692;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=fW4THUfiSFDuA3yYFBVMedcuO0n7bIQOn5Zl2cmilQo=;
 b=rEBlC4fNfwykvOmwPnzSRImv5dopcH2RnmnjrNE7KUua1PYaRjo2E+nw
 nHepX7U/P35cw6AqwCnXCUpNK1dMBkxGJqwYLQR8YaqHQ+n8abOBFGvT9
 cbESulcGPNMdmNSLlzf2KC40GDEeayju3ub4di4mxJavGQ/2pa2+TyrGv Y=;
IronPort-SDR: 8RifPaR2e7LtH5ztG6jmoHHqk0AQ2qPE503s+ftE+u/WsuU3faezq+EUetXneOLzZf+r8LYIJG
 y5wPANLzOtYw==
X-IronPort-AV: E=Sophos;i="5.70,401,1574121600"; d="scan'208";a="15596385"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 04 Feb 2020 11:44:51 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7C10CA18F0; Tue,  4 Feb 2020 11:44:49 +0000 (UTC)
Received: from EX13P01UWA002.ant.amazon.com (10.43.160.46) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 4 Feb 2020 11:44:48 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13P01UWA002.ant.amazon.com (10.43.160.46) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 4 Feb 2020 11:44:47 +0000
Received: from a483e7b01a66.ant.amazon.com (10.95.159.230) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 4 Feb 2020 11:44:46 +0000
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>
References: <20200204093411.15887-1-julien@xen.org>
 <20200204093411.15887-3-julien@xen.org> <20200204105156.GH4679@Air-de-Roger>
 <58bc6c70-89f5-cdcf-552c-1ea5a3fa5508@xen.org>
 <20200204112807.GK4679@Air-de-Roger>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <4b5f37a3-b3ac-6a2c-70cc-b7773beea792@amazon.com>
Date: Tue, 4 Feb 2020 11:44:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204112807.GK4679@Air-de-Roger>
Content-Language: en-GB
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNC8wMi8yMDIwIDExOjI4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFR1ZSwg
RmViIDA0LCAyMDIwIGF0IDExOjExOjExQU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4K
Pj4KPj4gT24gMDQvMDIvMjAyMCAxMDo1MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9u
IFR1ZSwgRmViIDA0LCAyMDIwIGF0IDA5OjM0OjExQU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90
ZToKPj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+Pj4+Cj4+Pj4g
VW5saWtlIHNoYWRvd19lbmFibGUoKSwgaGFwX2VuYWJsZSgpIGNhbiBvbmx5IGJlIGNhbGxlZCBv
bmNlIGR1cmluZwo+Pj4+IGRvbWFpbiBjcmVhdGlvbiBhbmQgd2l0aCB0aGUgbW9kZSBlcXVhbCB0
byBtb2RlIGVxdWFsIHRvCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF4gZXF1YWxzIHRvCj4+Cj4+IFdpbGwgZml4IGl0Lgo+Pgo+Pj4+IFBHX2V4dGVybmFsIHwgUEdf
dHJhbnNsYXRlIHwgUEdfcmVmY291bnRzLgo+Pj4+Cj4+Pj4gSWYgaXQgd2VyZSBjYWxsZWQgdHdp
Y2UsIHRoZW4gd2UgbWlnaHQgaGF2ZSBzb21ldGhpbmcgaW50ZXJlc3RpbmcKPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gYSBwcm9ibGVtCj4+Pj4g
cHJvYmxlbSBhcyB0aGUgcDJtIHRhYmxlcyB3b3VsZCBiZSByZS1hbGxvY2F0ZWQgKGFuZCB0aGVy
ZWZvcmUgYWxsIHRoZQo+Pj4+IG1hcHBpbmdzIHdvdWxkIGJlIGxvc3QpLgo+Pj4+Cj4+Pj4gQWRk
IGNvZGUgdG8gc2FuaXR5IGNoZWNrIHRoZSBtb2RlIGFuZCB0aGF0IHRoZSBmdW5jdGlvbiBpcyBv
bmx5IGNhbGxlZAo+Pj4+IG9uY2UuIFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIGFuIGlmIGNoZWNr
aW5nIHRoYXQgUEdfdHJhbnNsYXRlIGlzIHNldC4KPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeIGFkZCBhbiBpZgo+Pgo+PiBXaWxsIGZpeCBpdC4KPj4KPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4+Pj4KPj4+PiAt
LS0KPj4+Pgo+Pj4+IEl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB3aGVuIFBHX3RyYW5zbGF0ZSB3
YXMgZW5mb3JjZWQuCj4+Pj4gLS0tCj4+Pj4gICAgeGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYyB8
IDE4ICsrKysrKysrKysrLS0tLS0tLQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9tbS9oYXAvaGFwLmMgYi94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jCj4+Pj4gaW5kZXggMzEz
NjJhMzFiNi4uYjczNGUyZTZkMyAxMDA2NDQKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vaGFw
L2hhcC5jCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwo+Pj4+IEBAIC00NDUs
NiArNDQ1LDEzIEBAIGludCBoYXBfZW5hYmxlKHN0cnVjdCBkb21haW4gKmQsIHUzMiBtb2RlKQo+
Pj4+ICAgICAgICB1bnNpZ25lZCBpbnQgaTsKPj4+PiAgICAgICAgaW50IHJ2ID0gMDsKPj4+PiAr
ICAgIGlmICggbW9kZSAhPSAoUEdfZXh0ZXJuYWwgfCBQR190cmFuc2xhdGUgfCBQR19yZWZjb3Vu
dHMpICkKPj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+PiArCj4+Pj4gKyAgICAvKiBU
aGUgZnVuY3Rpb24gY2FuIG9ubHkgYmUgY2FsbGVkIG9uY2UgKi8KPj4+PiArICAgIGlmICggZC0+
YXJjaC5wYWdpbmcubW9kZSAhPSAwICkKPj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+
Cj4+PiBJZiB5b3Ugd2FudCB0byByZXR1cm4gRUlOVkFMIGZvciBib3RoIHRoZXkgY2FuIGJlIG1l
cmdlZCBpbnRvIGEgc2luZ2xlCj4+PiBpZi4gQWxzbyBub3RlIHRoYXQgdGhpcyB3b3VsZCB1c3Vh
bGx5IGJlIHdyaXR0ZW4gYXMKPj4+IGlmICggZC0+YXJjaC5wYWdpbmcubW9kZSApIHRvIGtlZXAg
aXQgc2hvcnRlci4KPj4KPj4gVG8gYmUgaG9uZXN0LCB0aGlzIGlzIGEgbWF0dGVyIG9mIHRhc3Rl
LiBUaGVyZSBpcyBhbHNvIGFuIGFyZ3VtZW50IHRoYXQgZm9yCj4+IE1JU1JBLCB5b3VyIHN1Z2dl
c3Rpb24gaXMgbm90IGNvbXBsaWFudCAoc2VlIFJ1bGUgMTQuNCkuCj4gCj4gT2gsIHRoZW4gd2Ug
c2hvdWxkIGFkZCB0aG9zZSBydWxlcyB0byBDT0RJTkdfU1RZTEUgaWYgdGhleSBhcmUgdG8gYmUK
PiBlbmZvcmNlZC4KCkkgYW0gbm90IGxvb2tpbmcgdG8gZW5mb3JjZSBhbnl0aGluZyBhdCB0aGUg
bW9tZW50LiBNeSBtYWluIHBvaW50IGhlcmUgCmlzIHRoaXMgaXMgcHJldHR5IG11Y2ggYXMgbWF0
dGVyIG9mIHRhc3RlLiBCdXQgdGhlcmUgbWlnaHQgYmUgY29uY2VybiAKd2l0aCB5b3VyIHN1Z2dl
c3Rpb24gaWYgZ28gZm9yd2FyZCB3aXRoIE1JU1JBICh0aGlzIGlzIG5vdCB0aGUgb25seSBvbmUg
CnRob3VnaCA7KSkuCgo+IAo+IFNvIGZhciB0aGUgc3R5bGUgb2YgbW9zdCBvZiB0aGUgaHlwZXJ2
aXNvciBjb2RlIGlzIHRvIG9taXQgdGhlIHZhbHVlCj4gd2hlbiBjb21wYXJpbmcgYWdhaW5zdCAw
IG9yIE5VTEwgQUZBSUsuCj4gCj4gSSBkb24ndCBoYXZlIGFuIGlzc3VlIHdpdGggcmVxdWlyaW5n
IGV4cGxpY2l0IGNvbXBhcmlzb25zLCBidXQgaXQKPiBuZWVkcyB0byBiZSBkb2N1bWVudGVkIHNv
IHdlIGNhbiBhaW0gdG8gaGF2ZSBhbiBob21vZ2VuZW91cyBzdHlsZSwKPiBiZWNhdXNlIHNvIGZh
ciBJJ3ZlIGJlZW4gcmVjb21tZW5kaW5nIHRoZSBvdGhlciB3YXkgYXJvdW5kLgoKQXNpZGUgdGhl
IE1JU1JBLCB0aGVyZSBhcmUgc29tZSBjYXNlcyB3aGVyZSBJIGZlZWwgdGhlIGV4cGxpY2l0IApj
b21wYXJpc29ucyBtYWtlIHNlbnNlLiBCdXQgSSBkb24ndCBoYXZlIGFueSByYXRpb25hbCBmb3Ig
dGhlbSBhbmQgdmlldyAKdGhpcyBhcyBhIG1hdHRlciBvZiB0YXN0ZS4gU28gSSB3b3VsZCBsZWF2
ZSBpdCB0byB0aGUgYXV0aG9yIG9mIHRoZSAKcGF0Y2ggdGhlIGNob2ljZS4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
