Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27A1B8EB
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:45:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQC9x-0003co-6Z; Mon, 13 May 2019 14:42:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQC9v-0003ci-Rd
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:42:31 +0000
X-Inumbo-ID: 556386e5-758d-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 556386e5-758d-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 14:42:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85391664"
Date: Mon, 13 May 2019 15:42:16 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190513144216.GS2798@zion.uk.xensource.com>
References: <20190510152047.17299-1-olaf@aepfle.de>
 <20190513143733.2xodq4nexe7n6er2@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513143733.2xodq4nexe7n6er2@Air-de-Roger>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v4] libxl: fix migration of PV and PVH domUs
 with and without qemu
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6Mzc6MzNQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgYi90
b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKPiA+IGluZGV4IGNiNDcwMmZkN2EuLjdkNzViZDM4
NTAgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKPiA+ICsrKyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+ID4gQEAgLTEwNiw2ICsxMDYsNyBAQCBsaWJ4
bF9kZXZpY2VfbW9kZWxfdmVyc2lvbiA9IEVudW1lcmF0aW9uKCJkZXZpY2VfbW9kZWxfdmVyc2lv
biIsIFsKPiA+ICAgICAgKDAsICJVTktOT1dOIiksCj4gPiAgICAgICgxLCAiUUVNVV9YRU5fVFJB
RElUSU9OQUwiKSwgIyBIaXN0b3JpY2FsIHFlbXUteGVuIGRldmljZSBtb2RlbCAocWVtdS1kbSkK
PiA+ICAgICAgKDIsICJRRU1VX1hFTiIpLCAgICAgICAgICAgICAjIFVwc3RyZWFtIGJhc2VkIHFl
bXUteGVuIGRldmljZSBtb2RlbAo+ID4gKyAgICAoMywgIk5PTkVfUkVRVUlSRUQiKSwKPiAKPiBQ
bGFpbiAiTk9ORSIgd291bGQgYWxzbyBiZSBmaW5lIGhlcmUgSU1PLgoKQWxzbyBwbGVhc2UgYWRk
IGEgTElCWExfSEFWRSBtYWNybyB0byBsaWJ4bC5oCgpSb2dlciwgdGhhbmtzIGZvciByZXZpZXdp
bmcgdGhpcyBwYXRjaC4KCldlaS4KCj4gCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
