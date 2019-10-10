Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4A8D2D9B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:22:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIaDV-0007QM-0M; Thu, 10 Oct 2019 15:19:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ubId=YD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIaDT-0007Q9-2p
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:18:59 +0000
X-Inumbo-ID: 47415840-eb71-11e9-931d-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47415840-eb71-11e9-931d-12813bfff9fa;
 Thu, 10 Oct 2019 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570720738;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=QwuqATNlsyuTdbrh6AtC9cbaxGj6NOG0i0hW4uQIoXI=;
 b=EiA2dMw7YUjgsadXoR1x/+pVYHYAXfChzSZW8m/pDxyIEWkxHtdgAhru
 hcQwGYqm1Vya2+/2ch+ga5UT5BFBmKjwmxYQEKaaCGMTtKkiWtkCcUxqM
 K1idiFoc3+upvPWRNZzQgDG6y4M24rBDXHQchvglFS2y3tXujagWda7Kp Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fEVB9kROUqGsffMEbiTfVToid+xEptKxFeJYl0jIEz1Jzg7l5XcDoL3Os9Vs5VF7GENA+2Nbc+
 eNkK3FyTy0yd+VaBzkmebe3EpFaLQpRFajTZZAuWq8IBdUw7bCyqYK/zzSUXVNZ6a/GC+CilbV
 fqGpwruRnR6X4nlJCnkY9UAugYxtYoofEqTvHyTZsV9km/bzLTe6Sgsr0Bw+KvsDgtnuGRFc6R
 XFNXytliaIepZCRtO1XMErGWGIqucKh+c9RoXMHNiiUW0ORl9vMLAfNYNC9oK3bstIxbXQJfK9
 5Ls=
X-SBRS: 2.7
X-MesageID: 6798653
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,280,1566878400"; 
   d="scan'208";a="6798653"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23967.19421.809579.499607@mariner.uk.xensource.com>
Date: Thu, 10 Oct 2019 16:18:53 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
 <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Paul Durrant
 <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>
In-Reply-To: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 0/9] libxl memkb & pt
 defaulting
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xMyB2MiAwLzldIGxpYnhsIG1l
bWtiICYgcHQgZGVmYXVsdGluZyIpOgo+IFRoaXMgaXMgdjIgb2YgbXkgc2VyaWVzIHRvIHNvcnQg
b3V0IHRoZSBzaGFkb3cvaW9tbXUgbWVtb3J5IGFuZCBwY2kKPiBwYXNzdGhyb3VnaCBzaXR1YXRp
b24uICBJIHRoaW5rIHRoaXMgc2VyaWVzIHdpbGwgbWFzayB0aGUgYnVnIHdoaWNoIGlzCj4gY3Vy
cmVudGx5IGJsb2NraW5nIHN0YWdpbmcgcHJvcGFnYXRpbmcgdG8gbWFzdGVyLgoKSSBoYXZlIHB1
c2hlZCB0aGlzIHRvOgogICBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVvcGxl
L2l3ai94ZW4uZ2l0O2E9c3VtbWFyeQogICB3aXAubGlieGwtbWVta2ItcHRjZmcudjIKCklhbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
