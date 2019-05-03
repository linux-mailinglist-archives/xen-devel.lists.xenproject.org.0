Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0747013146
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:34:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMa8w-0004NT-7g; Fri, 03 May 2019 15:30:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XpsL=TD=citrix.com=prvs=019780e18=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hMa8u-0004NO-EC
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:30:32 +0000
X-Inumbo-ID: 613136c4-6db8-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 613136c4-6db8-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:30:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="89635210"
Date: Fri, 3 May 2019 17:29:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190503152953.xcisr7n2bs4v76mi@Air-de-Roger>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
 <20190503161132.06f85271.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190503161132.06f85271.olaf@aepfle.de>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] libxl: fix migration of PV and PVH domUs
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDQ6MTE6MzJQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gRnJpLCAzIE1heSAyMDE5IDEzOjA0OjExICswMjAwCj4gc2NocmllYiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT46Cj4gCj4gPiBXb3VsZG4ndCBpdCBiZSBl
YXNpZXIgdG8gbGVhdmUgbGlieGxfX25lZWRfeGVucHZfcWVtdSBhbG9uZSBhbmQganVzdAo+ID4g
dXNlIHRoZSBjb250ZW50cyBvZiB0aGUgbWlncmF0aW9uIHN0cmVhbSB0byBkZWNpZGUgd2hldGhl
ciB0byBsYXVuY2ggYQo+ID4gUUVNVSBmb3IgdGhlIFBWIGJhY2tlbmRzIG9yIG5vdD8gaWU6IGp1
c3QgcGFyc2luZyB0aGUgZG9tYWluIGNvbmZpZyBvbgo+ID4gdGhlIG1pZ3JhdGlvbiBzdHJlYW0g
c2hvdWxkIGJlIGVub3VnaCBmb3IgdGhlIGRlc3RpbmF0aW9uIHNpZGUgdG8KPiA+IGRlY2lkZSB3
aGV0aGVyIGEgUUVNVSBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gaGFuZGxlIHRoZSBQViBiYWNrZW5k
cz8KPiAKPiBJIHRoaW5rIHRoYXQgaXMgZG9uZSBhbnl3YXkuIEhvdyB3b3VsZCB0aGUgcmVjZWl2
aW5nIHNpZGUga25vdyB3aGF0IHRvIGRvPwoKSG0sIE9LLiBJIHdpbGwgd2FpdCBmb3IgdjMgd2l0
aCB0aGUgZG9taWQgc3R1ZmYgZml4ZWQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
