Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E987BBE0
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 10:39:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsk6O-0004e2-D1; Wed, 31 Jul 2019 08:36:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ohEi=V4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hsk6M-0004dx-Rm
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 08:36:50 +0000
X-Inumbo-ID: 5661eb1f-b36e-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5661eb1f-b36e-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 08:36:49 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8uONd5YGzBPH9Ix/YIKM6xMtTYJiqWhUoeBiWw6Gyfsj/iGKn5/y+qbGrUVt1lmoRLnz0P9ju2
 hzZes4Ia0fOkoA/etkZLnkI7CLWKNxje3Ipa8ETH2NDMljdvPx3C1YtYgiusQlfctmCE+BfWLG
 jXLWWbmboQBDmz3Jyw30eXqpf4BS4FCRrxLcXDTr+o5BlsSOR/ZDW26JSUvleu8PnHh1lHjwlY
 lTHHL2422CCcD5YZNxoa9k9MlqmCLgu8LqvQv4M5uMUhgad7nLW3fyLfHOZOcHOhI5fTv/+72J
 cpE=
X-SBRS: 2.7
X-MesageID: 3789495
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,329,1559534400"; 
   d="scan'208";a="3789495"
Date: Wed, 31 Jul 2019 10:36:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
References: <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <20190724141145.hg4aa5wyg5tsgv5p@Air-de-Roger>
 <CAMmSBy_XRLrxdM-U11pu4JinAKP3fi2TO=VCSo8g_BzMG3X0TA@mail.gmail.com>
 <20190726093545.zwmbt27c24skd3iz@Air-de-Roger>
 <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
 <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTA6NTU6MjRBTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5p
ayB3cm90ZToKPiBTb3JyeSAtLSBnb3QgYSBiaXQgZGlzdHJhY3RlZCB5ZXN0ZXJkYXkuIEF0dGFj
aGVkIGlzIHRoZSBsb2cgd2l0aCBvbmx5Cj4geW91ciBsYXRlc3QgcGF0Y2ggYXR0YWNoZWQuIElu
dGVyZXN0aW5nbHkgZW5vdWdoIHRoZSBib3ggYm9vdGVkIGZpbmUKPiB3aXRob3V0IHNjcmVlbiBh
cnRpZmFjdHMuIFNvIEkgZ3Vlc3Mgd2UncmUgZ2V0dGluZyBjbG9zZXIuLi4KPiAKPiBUaGFua3Mg
Zm9yIGFsbCB0aGUgaGVscCEKClRoYXQncyBxdWl0ZSB3ZWlyZCwgdGhlcmUncyBubyBmdW5jdGlv
bmFsIGNoYW5nZXMgYmV0d2VlbiB0aGUKcHJldmlvdXMgcGF0Y2hlcyBhbmQgdGhpcyBvbmUsIHRo
ZSBvbmx5IGRpZmZlcmVuY2UgaXMgdGhhdCB0aGlzIHBhdGNoCmhhcyBtb3JlIHZlcmJvc2Ugb3V0
cHV0LgoKQXJlIHlvdSBzdXJlIHlvdSBkaWRuJ3QgaGF2ZSBhbnkgbG9jYWwgcGF0Y2hlcyBvbiB0
b3Agb2YgWGVuIHRoYXQKY291bGQgZXhwbGFpbiB0aGlzIGRpZmZlcmVuY2UgaW4gYmVoYXZpb3Vy
PwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
