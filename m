Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D2DB530D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:34:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGOq-0004A0-D6; Tue, 17 Sep 2019 16:32:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGOo-00049u-U8
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:32:18 +0000
X-Inumbo-ID: b67d1886-d968-11e9-961b-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b67d1886-d968-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 16:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568737937;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=0llqJ9EWhcYuMxVEZZIdB+G80WIKPBkD8tQ3nA9RO34=;
 b=ekLUvtiU8dw3LD31EmVXr5vNQwpY/wmWCLfBvkBv870TD9imKimlkvJA
 GV0oWe9/hcdy8BZ98n2idyqL6f+pBm65ka8KzpZNaPLfpevTVmnJV9jPL
 9OAbmTRinXN3fzopxrPdLF8J5gdCHQp8+M7xYkk5wQRDerLiXyHkhvGdn 4=;
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
IronPort-SDR: F7JPZ+aRZhuuXvNfaFrpGLvm5wW6jeul0chJhs5jlzgUKPUuJgz1z84B6KGt8jbsO+jRxiXSrN
 REJM9VcCqVkrT+6/ElMcUb/IFzyLMlug4shvgcX1HfycGi5rkJxE66K/la0MBgouEtom8VvFxn
 YceRaQBqDhxnFSWABnAE9fRqbgs/nCbS7ZrkLEThDO8a0VU4g35pZeLPtkCDChIdykQmxu17Qc
 nEcJDCUyiPMO8OhDzT5dZrkspj0/c5N+H/D+okUG5MQeSCLJSG0U7UsULnV7wF2+PEztqq/czI
 XRY=
X-SBRS: 2.7
X-MesageID: 5989732
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5989732"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.2672.30813.214001@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:31:44 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614112444.29980-3-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-3-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 02/15] libxl: Remove unused variable in
 libxl__device_pci_add_xenstore
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDAyLzE1XSBsaWJ4bDogUmVtb3ZlIHVudXNl
ZCB2YXJpYWJsZSBpbiBsaWJ4bF9fZGV2aWNlX3BjaV9hZGRfeGVuc3RvcmUiKToKPiAqZGV2aWNl
IGlzbid0IHVzZWQuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
