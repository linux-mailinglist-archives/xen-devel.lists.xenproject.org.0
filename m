Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F62303B
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 11:24:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSeUS-0002fK-PX; Mon, 20 May 2019 09:21:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R9VY=TU=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hSeUR-0002fE-C3
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:21:51 +0000
X-Inumbo-ID: b1117c34-7ae0-11e9-95ad-2f54c629ae29
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1117c34-7ae0-11e9-95ad-2f54c629ae29;
 Mon, 20 May 2019 09:21:47 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: wd/hObBhs4Ebu4Npv5aN1WeznlPFnjvVcG0ZsTo0Ci06uPFrH3W+XOYZ8KDxSRM1nYfi2AX4L2
 /xGz2Qxay9zAUBani1P1/tDtrW8W9aW32a8OUCpq6yqMn8TmFOvYvb3oq+Ph3hLsKhgq6kwvvr
 o++DXYOmWU2pCKCKfUvU3poBTSJPKmMpFzyZMk2tplBvxS+izEGXG4A/6A0AjUi3q2Xbe1D4J5
 J+YK83+MQ24HuiQfDND6Tl/vhX+XAp3QZ28M7O8GVjyjhdg5u9wkIaV3FhAP3IeelDebt9byVc
 WY0=
X-SBRS: 2.7
X-MesageID: 644028
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="644028"
Date: Mon, 20 May 2019 10:21:44 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190520092144.GT2798@zion.uk.xensource.com>
References: <20190517170555.17423-1-wei.liu2@citrix.com>
 <20190520091435.k4txcb4m3lx7n4py@Air-de-Roger>
 <236744ae-6faa-d543-3450-2da58019e117@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <236744ae-6faa-d543-3450-2da58019e117@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] libxl: fix libxl_domain_need_memory after
 899433f149d
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
Cc: Juergen Gross <jgross@suse.com>, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTA6MTk6MjZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMC8wNS8yMDE5IDEwOjE0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4K
PiA+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfbWVtLmMgYi90b29scy9saWJ4bC9s
aWJ4bF9tZW0uYwo+ID4+IGluZGV4IDQ0OGEyYWY4ZmQuLmZlMWY5YzJmZjggMTAwNjQ0Cj4gPj4g
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfbWVtLmMKPiA+PiArKysgYi90b29scy9saWJ4bC9saWJ4
bF9tZW0uYwo+ID4+IEBAIC00NTcsNiArNDU3LDI0IEBAIGludCBsaWJ4bF9kb21haW5fbmVlZF9t
ZW1vcnkobGlieGxfY3R4ICpjdHgsCj4gPj4gICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb19p
bml0KGJfaW5mbyk7Cj4gPj4gICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb19jb3B5KGN0eCwg
Yl9pbmZvLCBiX2luZm9faW4pOwo+ID4+ICAKPiA+PiArICAgIC8qCj4gPj4gKyAgICAgKiBJdCBo
YXMgYmVjb21lIGEgcmVxdWlyZW1lbnQgdGhhdCB0byBmaWd1cmUgb3V0IHdoaWNoIFFFTVUgdG8K
PiA+PiArICAgICAqIHVzZSwgbGlieGwgd2lsbCBuZWVkIHRvIHBlZWsgZF9jb25maWcncyBjb250
ZW50LiBUaGUgY29kZSBoYXMKPiA+PiArICAgICAqIGJlZW4gY2hhbmdlZCBzdWNoIHRoYXQgb25l
IHdpbGwgbmVlZCB0byBjYWxsCj4gPj4gKyAgICAgKiBsaWJ4bF9fZG9tYWluX3NldF9kZXZpY2Vf
bW9kZWwgYmVmb3JlIGNhbGxpbmcKPiA+PiArICAgICAqIGxpYnhsX19kb21haW5fYnVpbGRfaW5m
b19zZXRkZWZhdWx0IGluc2lkZSBsaWJ4bC4KPiA+PiArICAgICAqCj4gPj4gKyAgICAgKiBUaGlz
IChwcm9ibGVtYXRpYykgcHVibGljIEFQSSBpcyB0aGUgb25seSBvbmUgd2hpY2ggdGFrZXMgYQo+
ID4+ICsgICAgICogYl9pbmZvLCBpbXBvc2luZyB0aGUgc2FtZSByZXF1aXJlbWVudCBvbiB0aGUg
dXNlcnMgb2YgdGhpcwo+ID4+ICsgICAgICogcHVibGljIEFQSSB3aWxsIGJyZWFrIHRoZW0uCj4g
Cj4gVGhpcyBzZW50ZW5jZSBkb2Vzbid0IHF1aXRlIHBhcnNlLsKgIFlvdSBlaXRoZXIgd2FudCAi
Yl9pbmZvLsKgIEltcG9zaW5nIiwKPiBvciBzb21ldGhpbmcgbGlrZSAiYl9pbmZvLCBhbmQgaW1w
b3NpbmciLgoKWWVwLiBBbHJlYWR5IGZpeGVkIGluIG15IGxvY2FsIGNvcHkuCgpJIHNlbnQgYW4g
ZW1haWwgdmlhIHhlbi5vcmcgYWRkcmVzcyB0byB0aGF0IGVmZmVjdCBidXQgaXQgZGlkbid0IGNv
bWUKdGhyb3VnaC4KCldlaS4KCj4gCj4gfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
