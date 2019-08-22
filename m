Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E95995B2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 16:00:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0nbA-0005aQ-9X; Thu, 22 Aug 2019 13:57:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D95g=WS=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1i0nb8-0005aL-EA
 for xen-devel@lists.xen.org; Thu, 22 Aug 2019 13:57:54 +0000
X-Inumbo-ID: d5986d44-c4e4-11e9-ac23-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5986d44-c4e4-11e9-ac23-bc764e2007e4;
 Thu, 22 Aug 2019 13:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566482273;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Fg0ZJgbcTu+N8HOExqZBHzI8Kwq3WBMq/aUD4cRmUaw=;
 b=gKE+Rxc62Pf5zqEWUAOhXh8/30MzTU3ieSa5XPKloOAO3C4TtnvZ5/hm
 aBLB4W5C+NxuPPDG2WlrcmyFy4241w4NpFC8M/Q1UrT8yDHIK193QxUjI
 6G1ZTAsDd0SdNWACXwta2NkP4C+EcA+a2xbyHrk6UMNmfwvyw4TsP1hHP 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uX58/NtD7SN6kKy6rfWu9B/F8NLPr9mx9zaPFxDkLERh4bnqch5ba3piqFlG0xlqmhcig6I1ea
 3CCC2onmcw/keeksjFhGmYxzaGFQcb9smG0sjVGAjvg4J+nKCEni26Cf2QV+Xfxl5F2JO4zW+S
 2dolmTDbeSkUV6I1oCgXh1CbIZvXIMh8ot9NkQoLCnIi4csovQG5/lq5/j5E+MszaPSOnRBpx8
 lv5mKLbIaPznWdtUWYReCg9mPmn8VFOYj0EgkaSwzc9uEmUyDGrdtw/8yiNjMOXxkXYe3x92lc
 yEg=
X-SBRS: 2.7
X-MesageID: 4802526
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4802526"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190821082056.91090-1-wipawel@amazon.de>
 <20190821082056.91090-13-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <2555b4c4-ec14-8759-0fe3-83d1196b3a50@citrix.com>
Date: Thu, 22 Aug 2019 14:57:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821082056.91090-13-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 12/20] create-diff-object: Extend
 patchability verification: STN_UNDEF
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, wipawel@amazon.com,
 mpohlack@amazon.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8yMS8xOSA5OjIwIEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBEdXJpbmcg
dmVyaWZpY2F0aW9uIGNoZWNrIGlmIGFsbCBzZWN0aW9ucyBkbyBub3QgY29udGFpbiBhbnkgZW50
cmllcwo+IHdpdGggdW5kZWZpbmVkIHN5bWJvbHMgKFNUTl9VTkRFRikuIFRoaXMgc2l0dWF0aW9u
IGNhbiBoYXBwZW4gd2hlbiBhCj4gc2VjdGlvbiBpcyBjb3BpZWQgb3ZlciBmcm9tIGl0cyBvcmln
aW5hbCBvYmplY3QgdG8gYSBwYXRjaGVkIG9iamVjdCwKPiBidXQgdmFyaW91cyBzeW1ib2xzIHJl
bGF0ZWQgdG8gdGhlIHNlY3Rpb24gYXJlIG5vdCBjb3BpZWQgYWxvbmcuCj4gVGhpcyBzY2VuYXJp
byBoYXBwZW5zIHR5cGljYWxseSBkdXJpbmcgc3RhY2tlZCBob3RwYXRjaGVzIGNyZWF0aW9uCj4g
KGJldHdlZW4gMiBkaWZmZXJlbnQgaG90cGF0Y2ggbW9kdWxlcykuCj4gCj4gU2lnbmVkLW9mZi1i
eTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5
OiBNYXJ0aW4gUG9obGFjayA8bXBvaGxhY2tAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBCam9l
cm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBOb3JiZXJ0IE1hbnRo
ZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNj
aGl2IDxhbmRyYXByc0BhbWF6b24uY29tPgo+IC0tLQpSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndh
bGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpUaGFua3MKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
