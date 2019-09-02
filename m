Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0B7A54A4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 13:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4kAQ-0001D9-QW; Mon, 02 Sep 2019 11:06:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4kAP-0001D4-AY
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 11:06:37 +0000
X-Inumbo-ID: ba9772d4-cd71-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba9772d4-cd71-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 11:06:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BEA37B693;
 Mon,  2 Sep 2019 11:06:34 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190827105928.1769-1-jgross@suse.com>
 <20190827105928.1769-4-jgross@suse.com>
 <7a4fd708-b109-59b8-1633-2f80ef523dcb@citrix.com>
 <6a9bfc0d-ce17-e074-1c2d-98c36858f801@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <318611e2-ab1d-6c56-b36c-0195311d499c@suse.com>
Date: Mon, 2 Sep 2019 13:06:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6a9bfc0d-ce17-e074-1c2d-98c36858f801@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/sched: add minimalistic idle
 scheduler for free cpus
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDguMjAxOSAxNDo0MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyNy4wOC4xOSAx
NDozNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjcvMDgvMjAxOSAxMTo1OSwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+ICtzdGF0aWMgdm9pZCAqCj4+PiArc2NoZWRfaWRsZV9hbGxvY192
ZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCB2Y3B1ICp2LAo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGQpCj4+PiArewo+Pj4gKyAgICAvKiBBbnkgbm9u
LU5VTEwgcG9pbnRlciBpcyBmaW5lIGhlcmUuICovCj4+PiArICAgIHJldHVybiAodm9pZCAqKTFV
TDsKPj4KPj4gQXMgYW4gb2JzZXJ2YXRpb24sIHRoZSB2ZGF0YSBpbnRlcmZhY2UgKGFuZCBvdGhl
cnMsIGlmIGFwcGxpY2FibGUpIGNvdWxkCj4+IGRvIHdpdGggYmVpbmcgdXBkYXRlZCB0byB1c2Ug
RVJSX1BUUigpLCBqdXN0IGFzIGRvbmUgaW4gYy9zIDM0MGVkYzM5MAo+IAo+IE9uZSBvZiB0aGUg
aXRlbXMgZm9yIG15IHNjaGVkdWxlciBjbGVhbnVwIHBhdGNoZXMuCj4gCj4+IFBhc3NpbmcgMSBi
YWNrIGhlcmUgaXMgcmF0aGVyIGRhbmdlcm91cy4KPiAKPiBOb3QgcmVhbGx5LiB2ZGF0YSBpcyBz
Y2hlZHVsZXIgc3BlY2lmaWMsIGFuZCB0aGUgaWRsZS1zY2hlZHVsZXIgZG9lc24ndAo+IHVzZSBp
dC4KCkJ1dCBtYXliZSBoYW5kaW5nIGJhY2sgZS5nLiBaRVJPX0JMT0NLX1BUUiB3b3VsZCBzdGls
bCBiZSBiZXR0ZXI/Ck5vdCB0aGUgbGVhc3QgYmVjYXVzZSBvZiBhdm9pZGluZyBhbiBvcGVuLWNv
ZGVkIGNhc3Q/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
