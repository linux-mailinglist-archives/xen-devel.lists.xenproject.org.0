Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3116B126FB6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 22:29:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii3In-0001mL-HI; Thu, 19 Dec 2019 21:25:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CEs5=2J=amazon.com=prvs=2492cfbf4=elnikety@srs-us1.protection.inumbo.net>)
 id 1ii3Im-0001mG-AK
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 21:25:44 +0000
X-Inumbo-ID: 1cdc2f0a-22a6-11ea-88e7-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cdc2f0a-22a6-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 21:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576790744; x=1608326744;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=BwgY2WtQctPVtpkV1pv1Xt6YtVaRkWZEWG7741HFSeU=;
 b=O37Q8SXmNb4XKXFQ1MD+3VneTVLAThohCmdXJ8b7KLxLzYEew6VnuROd
 Q2YeIfnJDePofpDYYCziRTKkTuBVRr0DUhjQMT3KgG3vsp08mI3eEMjlp
 ofbtYLmvzROCUccogUSzIjvk/KUWw9atXXdk2c1oiOgcevvc/y5N79btn I=;
IronPort-SDR: WTOrV5pizNEMWPJlTbb+1+NSE0qlu4iCW7H8uOpqKMMSCj30/1CMaZ+7dLi2feOPRZKcQs2L7E
 Trxm1N1aFfVA==
X-IronPort-AV: E=Sophos;i="5.69,333,1571702400"; d="scan'208";a="14555380"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 19 Dec 2019 21:25:43 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id 40A18A239D; Thu, 19 Dec 2019 21:25:42 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 19 Dec 2019 21:25:41 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.160.109) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 21:25:36 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <d3fb2800517d79a422acc62628ad362f919824ea.1576630344.git.elnikety@amazon.com>
 <eaaffb6f-b2b1-f81e-8643-ccc238914e52@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <8a15bbca-e730-cbf7-2108-b8f0260e846a@amazon.com>
Date: Thu, 19 Dec 2019 22:25:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <eaaffb6f-b2b1-f81e-8643-ccc238914e52@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.109]
X-ClientProxiedBy: EX13D03UWA003.ant.amazon.com (10.43.160.39) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/microcode: avoid unnecessary
 xmalloc/memcpy of ucode data
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMTkgMTM6MDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE4LjEyLjIwMTkgMDI6
MzIsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+PiBAQCAtNzI1LDcgKzcwMSw3IEBAIHN0YXRpYyBp
bnQgX19pbml0IG1pY3JvY29kZV9pbml0KHZvaWQpCj4+ICAgICAgICAqLwo+PiAgICAgICBpZiAo
IHVjb2RlX2Jsb2Iuc2l6ZSApCj4+ICAgICAgIHsKPj4gLSAgICAgICAgeGZyZWUodWNvZGVfYmxv
Yi5kYXRhKTsKPj4gKyAgICAgICAgYm9vdHN0cmFwX21hcChOVUxMKTsKPiAKPiBBcyBtdWNoIGFz
IEkgbGlrZSB0aGUgY2hhbmdlLCBJIHdob2xlaGVhcnRlZGx5IGRpc2FncmVlIHdpdGggdGhpcwo+
IGFzcGVjdCBvZiBpdDogWW91IG1ha2UgaXQgbGFyZ2VseSB1bnByZWRpY3RhYmxlIHdoZW4gdGhl
IGJvb3QKPiBtYXBwaW5ncyB3aWxsIGdvIGF3YXkgLSBpdCBiZWNvbWVzIGVudGlyZWx5IGRlcGVu
ZGVudCB1cG9uIGxpbmsKPiBvcmRlci4gQW5kIG9mIGNvdXJzZSB3ZSByZWFsbHkgd2FudCB0aGVz
ZSBtYXBwaW5ncyB0byBiZSBnb25lLAo+IHRoZSB2ZXJ5IGxhdGVzdCAoSSB0aGluayksIGJ5IHRo
ZSB0aW1lIHdlIHN0YXJ0IGJyaW5naW5nIHVwIEFQcwo+IChidXQgZ2VuZXJhbGx5IHRoZSBzb29u
ZXIgdGhlIGJldHRlcikuIFRoaXMgaXMgKG9uZSBvZj8pIHRoZSBtYWluCj4gcmVhc29uKHMpIHdo
eSBpdCBoYWRuJ3QgYmVlbiBkb25lIHRoaXMgd2F5IHRvIGJlZ2luIHdpdGguIFRoZQo+IGFsdGVy
bmF0aXZlIGlzIG1vcmUgY29tcGxpY2F0ZWQgKHNldCB1cCBhIHByb3BlciwgbG9uZyB0ZXJtCj4g
bWFwcGluZyksIGJ1dCBpdCdzIGdvaW5nIHRvIGJlIG1vcmUgY2xlYW4gKGluY2x1ZGluZyB0aGUg
bWFwcGluZwo+IHRoZW4gYWxzbyBiZWluZyBzdWl0YWJsZSB0byBwb3N0LWJvb3QgQ1BVIG9ubGlu
aW5nKS4KPiAKClRoaXMgY2hhbmdlIGlzIGFuIGltcHJvdmVtZW50IG9uIHRoZSBjdXJyZW50IHN0
YXR1cy4gV2UgZ2V0IHRvIGF2b2lkIAp4bWFsbG9jL21lbWNweSBpbiB0aGUgY2FzZSBvZiBhIHN1
Y2Nlc3NmdWwgdWNvZGU9c2Nhbi4gVGhlIHByb2JsZW1hdGljIAphc3BlY3QgeW91IGhpZ2hsaWdo
dCBpcyBhbnl3YXkgdGhlcmUgcmVnYXJkbGVzcyBvZiB0aGlzIHBhdGNoIChyZWYuIHRvIAp0aGUg
ImVsc2UgaWYgKCB1Y29kZV9tb2QubW9kX2VuZCApIiBpbiBtaWNyb2NvZGVfaW5pdCkuIFRoZSBw
cm9wZXIsIGxvbmcgCnRlcm0gbWFwcGluZyB3b3VsZCBiZSBhIHdlbGNvbWUgY2hhbmdlLCBidXQg
aXMgb3RoZXJ3aXNlIGluZGVwZW5kZW50IG9mIAp0aGlzIHBhdGNoIGltby4KClRoYW5rcywKRXNs
YW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
