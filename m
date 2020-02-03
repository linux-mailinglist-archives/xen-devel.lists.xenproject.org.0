Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD5150593
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:43:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iya63-0004SD-Ki; Mon, 03 Feb 2020 11:40:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iya62-0004S6-UC
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:40:54 +0000
X-Inumbo-ID: 0915f8aa-467a-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0915f8aa-467a-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 11:40:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97B2EB0E6;
 Mon,  3 Feb 2020 11:40:53 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200203105654.22998-1-pdurrant@amazon.com>
 <20200203105654.22998-3-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e2e7924-5fe1-f73d-19f9-e71b1ffc5e99@suse.com>
Date: Mon, 3 Feb 2020 12:40:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203105654.22998-3-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 2/4] add a domain_tot_pages() helper
 function
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxMTo1NiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoaXMgcGF0Y2ggYWRk
cyBhIG5ldyBkb21haW5fdG90X3BhZ2VzKCkgaW5saW5lIGhlbHBlciBmdW5jdGlvbiBpbnRvCj4g
c2NoZWQuaCwgd2hpY2ggd2lsbCBiZSBuZWVkZWQgYnkgYSBzdWJzZXF1ZW50IHBhdGNoLgo+IAo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IE5PVEU6IFdoaWxlIG1vZGlmeWluZyB0aGUgY29t
bWVudCBmb3IgJ3RvdF9wYWdlcycgaW4gc2NoZWQuaCB0aGlzIHBhdGNoCj4gICAgICAgbWFrZXMg
c29tZSBjb3NtZXRpYyBmaXhlcyB0byBzdXJyb3VuZGluZyBjb21tZW50cy4KPiAKPiBTdWdnZXN0
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
