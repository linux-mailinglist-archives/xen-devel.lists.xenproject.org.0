Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DD1D4596
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 18:38:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIxsK-00047u-5I; Fri, 11 Oct 2019 16:34:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIxsI-00047o-KC
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 16:34:42 +0000
X-Inumbo-ID: 058267c6-ec45-11e9-933c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 058267c6-ec45-11e9-933c-12813bfff9fa;
 Fri, 11 Oct 2019 16:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570811680;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Yzmv61F3k1S1F/MTcuJwJFzHoZeKvOrGu+dpFQdMNsM=;
 b=dMldkRPgml0GR96+zWT9zk2j0XtYwIhOvOElV3ObesRCL/CzNM41PRjW
 B1e1xAD8//q2HcU+0QfFLAus3kBcUSZeM6gyjFeu1eY8+6YciUJFRI7M6
 3PuMAf5Im6Htyi4wMUgmbbUsbRoIixLZHnWatpCmGgVD8IZSvaudV8o1r 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0MpcXc0xbKm8eA8iyCr1jNIFSGxsbB3/DipQ6L95Z9xbu7AV1x63JYDEmpaa6I7F6lGeCsl3b8
 0MQ6iIDnsA7ycdeHIPJ0774amem0IjH9ghETRbTMcSkeSsd+9azaavfxeR0EJE6ZIYUWkHXf0i
 JvF4fN4nWrDsBK+hfCvBxCoB9Fdog1POUBM5BSKgILRbL3CvM0JLrxzE9HyhqJ7yLyeDZGOSBg
 F+Ng1BsK2lA38aw1n7apgtmA5nMLNuOiptYW+coLQtkPGl0ZyLB3vmoh7NpQIhPv0S+92LYtVF
 5ec=
X-SBRS: 2.7
X-MesageID: 7092071
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="7092071"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23968.44828.940652.851219@mariner.uk.xensource.com>
Date: Fri, 11 Oct 2019 17:34:36 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <33aee478-52b9-df46-67d7-f81702e5e0f9@suse.com>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <CAFLBxZapoPdDx+2rokrq0KPE_-mTgYtyE-rk4hFsvjX8g76iZQ@mail.gmail.com>
 <23968.33869.906302.573866@mariner.uk.xensource.com>
 <33aee478-52b9-df46-67d7-f81702e5e0f9@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 9/9] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <dunlapg@umich.edu>, Paul Durrant <pdurrant@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1hFTiBQQVRDSCBmb3ItNC4x
MyB2MiA5LzldIGxpYnhsL3hsOiBPdmVyaGF1bCBwYXNzdGhyb3VnaCBzZXR0aW5nIGxvZ2ljIik6
Cj4gT24gMTEuMTAuMTkgMTU6MzEsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gSSBkbyBub3QgaGF2
ZSBhIHN0cm9uZyBvcGluaW9uIGFib3V0IHRoaXMuICBJIHdvdWxkIGJlIGhhcHB5IHdpdGgKPiA+
ICJhdXRvIiAob3IgImRlZmF1bHQiIG1heWJlKS4KPiAKPiAidW5zcGVjaWZpZWQiPwoKVGhhdCBp
cyBJTU8gdGhlIGJlc3Qgc3VnZ2VzdGlvbiBzbyBmYXIgc28gSSB3aWxsIGdvIHdpdGggdGhhdCBp
biBteQp2My4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
