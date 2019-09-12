Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FB9B11CA
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:07:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8QeA-0007e0-1r; Thu, 12 Sep 2019 15:04:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1F3=XH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i8Qe8-0007do-RZ
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:04:32 +0000
X-Inumbo-ID: 9fd3f42c-d56e-11e9-959c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fd3f42c-d56e-11e9-959c-12813bfff9fa;
 Thu, 12 Sep 2019 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568300671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ac22+gLpYn6N7QIRSND+thjRx3U3ZDa7dowOv9gEuhg=;
 b=OzEFWXoVqs31xLD9aKXtdJsTsFdvjKxCLCUF7F0J9FWnQeC+nTEpM/f8
 eQq1sM//zjMa5GM5eUYtnmx8VTyYGcSplD0H4LdJNp7ggiV9ifD1GqdkU
 XHuRpaxy1ZO3k+Fo24SwRW5MM/UH2uCuLHmaJq9E/0HEhiQbE0k8BDtdF w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bRH248lHsXM9y9k4Uji6QAMC+n8ss8307fr/I+5/bWIkXIpQowqfTmBu4oEebEeOk+dmtxd93j
 PgZkFrwdnhqqUHjjYYqqF8x547TA/MKeaFj8ZTXOLlMCjZTWJv3pFVntXFIDfYz8V5H5joZq9V
 OXfxfrHSl3ZZjTGm8KZV1n8C8oA8MfGWnfhH6jbYGVyyabxm8AsGUO7Y0kmkyjISAOcUiYYb81
 24bHIYYYTQfDNYCX28dFfiJFqdWxolSVYf79k4i+Gfh9mBFtxCTZlmOCDXMRG72+9z5F0Jfyme
 Gkk=
X-SBRS: 2.7
X-MesageID: 5781798
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5781798"
Date: Thu, 12 Sep 2019 17:04:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190912150425.d64nwsxq2ljf35sb@Air-de-Roger>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <abbff654-cc50-9b43-6e1c-ff1fb0154ddd@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abbff654-cc50-9b43-6e1c-ff1fb0154ddd@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 7/9] x86/HVM: cosmetics to hvm_set_cr3()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDU6MjU6NDZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRWxpbWluYXRlIHRoZSBub3QgcmVhbGx5IHVzZWZ1bCBsb2NhbCB2YXJpYWJsZSAib2xk
Ii4gUmVkdWNlIHRoZSBzY29wZQo+IG9mICJwYWdlIi4gUmVuYW1lIHRoZSBsYXRjaGVkICJjdXJy
ZW50Ii4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
