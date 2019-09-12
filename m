Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17400B0DCF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 13:30:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8NFs-0002D4-R9; Thu, 12 Sep 2019 11:27:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TKPp=XH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i8NFr-0002Cz-Gh
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 11:27:15 +0000
X-Inumbo-ID: 44d4d50a-d550-11e9-83e7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44d4d50a-d550-11e9-83e7-12813bfff9fa;
 Thu, 12 Sep 2019 11:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568287634;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IsK2YwJPy4QTQ6atrOPJy0yGrY6gZzq2Q6xM9wwsL9c=;
 b=ci0p1oJHwqWQVO7+6yOe+qV3ZQlaEUH6Dx0EN7GaKtBqF4u+FB/dEmKp
 NdQASpx2dJ4rSYNYRY7JUdYJQfC4tk7gjt+o/veH+6mt2aOqMNWr3XJ9M
 lqF7WNC1b7pPHZrOU7qBjlPL236URJ5HszDEbLygzmt7yXlyPbgooGV0C E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cYZJ1UvFYiTnwpf4OZhK0oDClZ3oqj/MsuPT7ZY3VsTVLcsjvkdVMoU3YnFTis5I6ASN1QKZCn
 Wx/jxl3+IlT+QYBvw2+QoOT+UyKaWZBGaF1Y9X3uo9sbEnmst/B6GA4B6rRRLSb4oK2c+64GNm
 n1wFdxX0eyBwM3oadzvdSQEJqySx7P52vd0Ffwj/M8cMgPlOUqmKnD7GkchOb/ynXruyOvzPlg
 8bliLMogLLk64FzMTxcOUFnj7zwLUQZhNwYJuEUIkgXzppDXr6ZqYanKAEdqJIiFOV3iRGAe15
 s+Q=
X-SBRS: 2.7
X-MesageID: 5767853
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5767853"
Date: Thu, 12 Sep 2019 12:27:11 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190912112711.GC1308@perard.uk.xensource.com>
References: <20190911143618.23477-1-paul.durrant@citrix.com>
 <20190911143618.23477-3-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911143618.23477-3-paul.durrant@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 2/3] xen: introduce separate XenWatchList
 for XenDevice objects
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
Cc: xen-devel@lists.xenproject.org, Stefano
 Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDM6MzY6MTdQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggdXNlcyB0aGUgWGVuV2F0Y2hMaXN0IGFic3RyYWN0aW9uIHRvIGFk
ZCBhIHNlcGFyYXRlIHdhdGNoIGxpc3QKPiBmb3IgZWFjaCBkZXZpY2UuIFRoaXMgaXMgbW9yZSBz
Y2FsYWJsZSB0aGFuIHdhbGtpbmcgYSBzaW5nbGUgbm90aWZpZXIKPiBsaXN0IGZvciBhbGwgd2F0
Y2hlcyBhbmQgaXMgYWxzbyBuZWNlc3NhcnkgdG8gaW1wbGVtZW50IGEgYnVnLWZpeCBpbiBhCj4g
c3Vic2VxdWVudCBwYXRjaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwu
ZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
