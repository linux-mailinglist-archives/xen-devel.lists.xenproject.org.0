Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B421F1529C5
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 12:21:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izIhz-00029X-IC; Wed, 05 Feb 2020 11:19:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HwEA=3Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izIhy-00029S-77
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:19:02 +0000
X-Inumbo-ID: 4ee51420-4809-11ea-8396-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ee51420-4809-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 11:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580901540;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OTLo9lSQwHGx5o4yZkP6LcDHq/DqrXOl0g305vui/t8=;
 b=CjLeX3GQQAyVO4aC6Z7iQxjjSSi8G8YRQSyap6oRmWGWKjmZkpG59ArT
 xEqB5kCOTk9+79Tw7wDR4Cr6IE/s779iW0SgRZRv0v5cyQX8jXl76e/4+
 GWn8qPp40KsxnWSQposib1giBmSKyeq9Ov2jboGAPgQ5uA/6CRTlz4pij k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Vs7wwXcnfoVPEDFZQl077CrY3K0Gz9Q/vwK8FtBTB07zk78t15s2L1ho0ZBHy8Wwg5ALNfGkQm
 SwNni8gOdLRIJ8ofbNhbeFbzei9HNF5MrkYTeV3t1GCqsCWKRiEhnTz1oyVx1slumlweQ0shcm
 kHpvawf2vyGmltqEky+1C1iftMU/aui3udo/eTbzmJOae6QXX3aQMMT/KCwK+J6sKViFgaZYQO
 yhr2PQsC9XFf9EzNxLv4N4g1zFR3QlbBW/5JA//dzfWHDsaGhMyDnNVUrsqgR+/LZhRS8ztPsk
 Pm0=
X-SBRS: 2.7
X-MesageID: 12344787
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,405,1574139600"; d="scan'208";a="12344787"
Date: Wed, 5 Feb 2020 12:18:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20200205111853.GR4679@Air-de-Roger>
References: <ebd9cf75-36cd-c064-661d-88a49445ecce@eikelenboom.it>
 <20200203122319.GU4679@Air-de-Roger>
 <3bcb67a6-3156-f4b0-5ac6-58ca61038cec@eikelenboom.it>
 <20200203124127.GV4679@Air-de-Roger>
 <fe191f7a-b902-19a3-e4c8-ace8c02319c6@eikelenboom.it>
 <20200203132108.GW4679@Air-de-Roger>
 <20200205102356.GQ4679@Air-de-Roger>
 <0952d329-f5f3-9215-5bab-76f45d21a482@eikelenboom.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0952d329-f5f3-9215-5bab-76f45d21a482@eikelenboom.it>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Xen-unstable: pci-passthrough regression bisected
 to: x86/smp: use APIC ALLBUT destination shorthand when possible
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMTI6MDM6MDBQTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+IEhpIFJvZ2VyLAo+IAo+IFNvcnJ5LCBJICBoYXZlbid0IGJlZW4gYWJsZSB0
byBmb2xsb3cgdXAgb24gdGVzdGluZyB5ZXQuCj4gKEkgaGF2ZSBzb21lIGxvbmdlciBydW5uaW5n
IHRhc2sgZm9yIHdoaWNoIEkgbmVlZCBzb21lIHNlcnZpY2VzIG9uIHRoZSBib3gsIAo+IHNvIHRl
c3RpbmcgYW5kIHJlYm9vdGluZyBpcyBuZWVkZWQuKQo+IENvdWxkIGJlIHRvbW9ycm93LCBidXQg
Y291bGQgYWxzbyBiZSB0aGlzIHdlZWtlbmQgYmVmb3JlIEkgd2lsbCBjb21lIGFyb3VuZCB0bwo+
IHRoZSB0ZXN0aW5nIGFuZCByZXBvcnRpbmcgYmFjay4KCkFjayBubyBwcm9ibGVtLiBJIGp1c3Qg
d2FudGVkIHRvIG1ha2Ugc3VyZSB0aGlzIGlzIG5vdCBmb3Jnb3R0ZW4gOikuCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
