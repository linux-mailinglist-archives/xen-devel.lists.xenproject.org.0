Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60305F8E1E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 12:19:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUUAo-0007P2-9P; Tue, 12 Nov 2019 11:17:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WcyK=ZE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iUUAm-0007Oi-UH
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 11:17:24 +0000
X-Inumbo-ID: 002d934c-053e-11ea-adbe-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 002d934c-053e-11ea-adbe-bc764e2007e4;
 Tue, 12 Nov 2019 11:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573557444;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=9d0UH6cd+LQ51gGkVdxb1rrkSC0/0bjHHUMBzOx12rc=;
 b=IP3pHlnBb3VweG6hVqWeG1FBb6T3dLp3Jo51TJFLlr1giwo0ztpBWeFa
 SFoF4+Flu0UdRTvJ8eEPSQ96Wey/GY9NFJZYLjHsncUTvx1P9FQDufbJ8
 ZDWUW2CDwGc8fKxW2gs9uxAJOw/59uTIudY5b/4HsBzccTswQYI9COaUC 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cWDFpdnpjagBV3wg+Cw9hstZlfMpy7mxbeHAvVDHdDJ+eK24zbP9uSFcbQAlnfQPmDz5+wMDUk
 Q781mJ1FdUEuk6204aC4LtV/TjeMAxSXnMQde4kKvWA/9pFrwqkbJMkV2sLyBVWo3GOD73WRP+
 X7+b8LLFDBKndBiSs4JFCK6GEw144W7kGnqN2uEDceraehmtBysE9DsmnWAMdv1nUDaAeI03M6
 uyFNd9KKCMGAdxqFGaXa5jg9LT7QzPgjiLRNLP6M0vTNJPxYLp7PJrnGB+vTJqFevyZME/+8Iw
 hCk=
X-SBRS: 2.7
X-MesageID: 8704703
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,296,1569297600"; 
   d="scan'208";a="8704703"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24010.38080.707256.901442@mariner.uk.xensource.com>
Date: Tue, 12 Nov 2019 11:17:20 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191112111416.GA2337@perard.uk.xensource.com>
References: <20191108190952.22163-1-sstabellini@kernel.org>
 <20191112111416.GA2337@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] Introduce a description of a new optional
 tag for Backports
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
Cc: Lars
 Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0gSW50cm9kdWNl
IGEgZGVzY3JpcHRpb24gb2YgYSBuZXcgb3B0aW9uYWwgdGFnIGZvciBCYWNrcG9ydHMiKToKPiBT
aG91bGQgd2UgZGVzY3JpYmUgdGhlIEZpeGVzOiB0YWcgYXMgd2VsbD8gVGhlc2Ugd291bGQgaGF2
ZSBhIHNpbWlsYXIKPiBwdXJwb3NlIHRvIHRoZSBiYWNrcG9ydCB0YWcsIEkgbWVhbiBpdCBjb3Vs
ZCBoZWxwIGZpZ3VyZSBvdXQgd2hpY2gKPiBjb21taXQgdG8gYmFja3BvcnQgdG8gd2hpY2ggdHJl
ZS4KCkdvb2QgcG9pbnQuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
