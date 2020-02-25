Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C2716EAC5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 17:03:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6cdw-00078E-E7; Tue, 25 Feb 2020 16:01:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UvFY=4N=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6cdu-000788-SY
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 16:01:06 +0000
X-Inumbo-ID: 0749821a-57e8-11ea-8cb6-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0749821a-57e8-11ea-8cb6-bc764e2007e4;
 Tue, 25 Feb 2020 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582646467;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DKx0MmVUVvb4kVplqahEBx/lYtJW8AG8Ek3YkABamrY=;
 b=e5wqHvKVDShnaXnlEWpUgMz77n/e3KKSj0IU7h5n8PnMStXAQ92W89ez
 7wvGjW6mm01PtcpxGRwaDHPBy4q9Y01JOHgA0C0ICUuyVaPVKp9wkKdp8
 xhPxy+WylozpX2ywyyS519olsY4lgMjI3jseZaUqzJFnwXiP3KF9cCBHi I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: y9CTLcf6DLOhlDrJrfjZIhJTfCEFxu7AT9qQ+RoVcNu/1oRblEYOE6pXDz+tkNYUcjykOZRre7
 ARSot6DH/Dr+RB8jALMG4FpYfWsqKHv6GPaNlx+WrwNnSc1WBM3/i7BSFR0XgSGjXA4AKDozFH
 qnrVfB5YI/Uinic94eNII0Uqmxu2S7AnIEOrXcUK8ximog+jdSHhCs/RUrbD5n9kuw+qSpU7xB
 aB2aMxZ6LN9XyC91Yq6Qfu8JKAeyz9/Ppq78G8NyYy2Us7pTgQ8mRBxkHLZ0CkqEpEX8CB+ihk
 0p8=
X-SBRS: 2.7
X-MesageID: 12984906
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,484,1574139600"; d="scan'208";a="12984906"
Date: Tue, 25 Feb 2020 17:00:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200225160054.GC24163@Air-de-Roger.citrite.net>
References: <20200225142232.7935-1-wl@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225142232.7935-1-wl@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/pvh: drop v2 suffix from pvh.pandoc
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgMDI6MjI6MzJQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGVyZSBpcyBub3cgb25seSBvbmUgdmVyc2lvbiBvZiBQVkggaW1wbGVtZW50YXRpb24gaW4g
WGVuLiBEcm9wICJ2MiIgdG8KPiBhdm9pZCBjb25mdXNpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTog
V2VpIExpdSA8d2xAeGVuLm9yZz4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
