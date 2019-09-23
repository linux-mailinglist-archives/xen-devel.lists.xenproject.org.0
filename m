Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3175ABB216
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:17:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLMv-0008RE-8P; Mon, 23 Sep 2019 10:14:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UlS=XS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iCLMu-0008R8-5D
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:14:56 +0000
X-Inumbo-ID: fd16a286-ddea-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd16a286-ddea-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 10:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569233695;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=EY8POQw5hNKGIspj+sqsH6im+OFlT/0NZDTpTFksaEc=;
 b=cNTCZdqPJwGB6K+8DEQwlx8RtWbZcu1Fyj0b0b/U/jP1BFAGNrYI1cIb
 BGcNSgKhaBIwhrvyUemEYRQOcuGQVEdWQQ70/v0nmpmeECVztY/RbosL3
 JF6a2u7NKiDtYrEowatTFl/4JP6WqcmIU3D+lyHmscjAF7x7CoCf76ktP I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8xg9Dhqf4gDWpojbD7YFU2Pyb1TbqQYi7db6A9VLSLhwl2diFN+Fe4rnHSZaQXi2MweYEg4ogx
 85cmgbE6MJRtvRPBwpJ9oEUfTINlPSbdyVHcHGQ4+hx6ZdVey8d3u3o/vB0OXXlVVk0mnop64e
 f02Nqdlz+6Jxl3CtTJQJsslA1pfF+WS7lKCKbubr6sADnv6bgCSHIZeBU35axOOXgU169LB9c5
 ycNqEdFu8P1N7G08vq5rzDoxxzPfZgbuamLK6HZgRfQPQpPlvOI7Sy9N446AGHpGVFX1qSoo+1
 9Bc=
X-SBRS: 2.7
X-MesageID: 6248996
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,539,1559534400"; 
   d="scan'208";a="6248996"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23944.39708.81253.486521@mariner.uk.xensource.com>
Date: Mon, 23 Sep 2019 11:14:52 +0100
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <252a2100-32e6-5aaa-c31f-a2aa37a812bd@suse.com>
References: <20190920161902.1353598-1-anthony.perard@citrix.com>
 <20190920170054.GX1308@perard.uk.xensource.com>
 <23941.2337.713234.62031@mariner.uk.xensource.com>
 <252a2100-32e6-5aaa-c31f-a2aa37a812bd@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] tools/ocaml: Build fix following libxl API
 changes
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 DavidScott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0gdG9vbHMvb2NhbWw6
IEJ1aWxkIGZpeCBmb2xsb3dpbmcgbGlieGwgQVBJIGNoYW5nZXMiKToKPiBBY2NvcmRpbmcgdG8g
b3NzdGVzdCByZXN1bHRzIGFjY3VtdWxhdGVkIG92ZXIgdGhlIHdlZWtlbmQgYW5kIHRoZQo+IHN0
YXRlIG9mIHRoZSB0cmVlLCBkaWQgeW91IHBlcmhhcHMgY29tbWl0IHRoZSBjaGFuZ2UgYnV0IGZv
cmdvdAo+IHRvIGFjdHVhbGx5IHB1c2ggaXQ/CgpHYWgsIGFwcGFyZW50bHkgc28uICBOb3cgZG9u
ZS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
