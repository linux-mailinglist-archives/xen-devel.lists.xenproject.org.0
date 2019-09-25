Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AC1BDEFD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:29:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD7JM-0001pD-ET; Wed, 25 Sep 2019 13:26:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ACI=XU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iD7JK-0001ov-EZ
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:26:26 +0000
X-Inumbo-ID: 129f52de-df98-11e9-9630-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 129f52de-df98-11e9-9630-12813bfff9fa;
 Wed, 25 Sep 2019 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569417985;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jc8PZwMMjeXryW30Gf75JrMicFf0R23YCuP+Oh+Nj9c=;
 b=OsTstLdkLTTMt2yiKMfWau9Npn2juFaPxi2UEOjUsBVmT0BbQHvPUsfd
 WVUQ0yYypKFFAgg5JguBjLtZQa1p0hQf1QhUlaamctUPHZoFNBbtq2mZG
 fYW5tY4I7dpqY+pf4HwEyUVIe4yy3gVBP30PKVBLulccP3PpUJDs68k39 o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yj60L+IMDegxlZuU/PuF0Rtj3KlIUrI/RTezg1MS6Npoz3ucBMqXCc0pYnH+iBUA3a9jX7SoTj
 HAwyFQjZIMHAR7iRbGXztrJqCb9+hXEnJof6bdg7ghpDbjJmWttm+qEl6nBgmU54znv4Kw7KJ9
 RUMGeoZmRewlFIBUQ7kba8sC6KgDE5hYwt7CRPY/cJQOSxkhMOJSrVagSXB+kKVLUi372tHV59
 dbDAyuaQBjvrk15n14nPR13d3cdh2mSK3cWXzs4nVVjiUCE50N61Z8hrOy668jc6GMfjo9P0Xk
 ZMk=
X-SBRS: 2.7
X-MesageID: 6113120
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,548,1559534400"; 
   d="scan'208";a="6113120"
Date: Wed, 25 Sep 2019 15:26:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190925132617.73qdovaeddl45f2o@Air-de-Roger>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
 <7d011094eed3f5c3cf6971cc8760874fd56ca443.1569379186.git-series.marmarek@invisiblethingslab.com>
 <20190925094150.qibuqwj6nynjo6vi@Air-de-Roger>
 <20190925122941.GP8065@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925122941.GP8065@mail-itl>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v7 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDI6Mjk6NDFQTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDExOjQxOjUwQU0g
KzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBJdCB3b3VsZCBzdGlsbCBiZSBuaWNl
IHRvIGdldCB0aGUgbWlzc2luZyBiaXRzIChpbnRlcnJ1cHQgZW5hYmxpbmcpLAo+ID4gb3IgZWxz
ZSB0aGlzIHBhdGNoIGlzIGtpbmQgb2YgcG9pbnRsZXNzLCBzaW5jZSBpdCBzdGlsbCBkb2Vzbid0
IGFsbG93Cj4gPiBzdHViZG9tYWlucyB0byB3b3JrIGNvcnJlY3RseSB3aXRoIHBhc3NlZCB0aHJv
dWdoIGRldmljZXMuCj4gCj4gV2VsbCwgdGhhdCBwYXJ0LCBhcyBkaXNjdXNzZWQsIGRvZXNuJ3Qg
bmVlZCB0byBiZSBpbiBYZW4uIEZvciBleGFtcGxlCj4gdGhlIHNvbHV0aW9uIGRlcGxveWVkIGlu
IGN1cnJlbnQgUXViZXMgc3RhYmxlIHZlcnNpb24gaXMgYmFzZWQgb24KPiBwY2liYWNrIGZvciB0
aGlzIHB1cnBvc2UuCgpBY2suIERvIHlvdSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIHN1
Ym1pdCB0aGF0IHBhcnQgdG8gTGludXgKdGhlbj8KCkl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSB0
aGlzIGZlYXR1cmUgd29ya2luZyB1cHN0cmVhbSBJTU8sIGFuZCB3aWxsCmFsc28gYWxsb3cgUXVi
ZXMgdG8gZ2V0IHJpZCBvZiB0aG9zZSBwYXRjaGVzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
