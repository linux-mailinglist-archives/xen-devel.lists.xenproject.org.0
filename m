Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF72FBDC
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 15:00:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWKd3-0005GU-6t; Thu, 30 May 2019 12:57:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uW51=T6=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hWKd1-0005GP-DN
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 12:57:55 +0000
X-Inumbo-ID: 882618b4-82da-11e9-b992-679877c0f57a
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 882618b4-82da-11e9-b992-679877c0f57a;
 Thu, 30 May 2019 12:57:51 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 5Nxtgl3melSD2MahEA0crpbg4XD1DZghbn8x6QoCr0Qpci2+NacfOQgskI8yymKJ9kSrvCbABA
 R5mCp9ToC9cKoz+6F7wAPK9Qcxm4AO3gNKG+SPwg8lOj4t475oZk0t/E8WibR8zTTmdeGJxHcW
 pLX5FWGqDcpzFN0RhwZ8du+hfVigvVyX3ZEeNV5Gz5uIE3i6fy3Ld17+/xMQxF3LXELykpXm1h
 Ot2UqfFsUYWeRQ6dpWRzah+5hYkGDs0Xtp5zow6W9NCZPl1B+4YJmAWxQA4NC3AipZo7TdlRHO
 yR8=
X-SBRS: 2.7
X-MesageID: 1100219
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,531,1549947600"; 
   d="scan'208";a="1100219"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23791.54062.185246.825377@mariner.uk.xensource.com>
Date: Thu, 30 May 2019 13:57:18 +0100
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>, Olaf Hering <olaf@aepfle.de>, Juergen Gross
 <jgross@suse.com>, <xen-devel@lists.xenproject.org>
In-Reply-To: <23790.28482.572598.843984@mariner.uk.xensource.com>
References: <23751.6062.590245.436664@mariner.uk.xensource.com>
 <23751.6297.231034.162861@mariner.uk.xensource.com>
 <23789.37660.726217.578999@mariner.uk.xensource.com>
 <23790.28482.572598.843984@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] Stable trees (4.6 and 4.7), building on stretch,
 osstest, redux
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

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFN0YWJsZSB0cmVlcyAoNC42IGFuZCA0LjcpLCBidWls
ZGluZyBvbiBzdHJldGNoLCBvc3N0ZXN0LCByZWR1eCIpOgo+IEkgaGF2ZSBub3cgcHVzaGVkIGFs
bCBvZiB0aGVzZSB0byA0LjYgYW5kIDQuNyBhbmQgaXQgYnVpbGRzIGZvciBtZS4KPiBJIHdpbGwg
a2lsbCB0aGUgY3VycmVudCwgZG9vbWVkLCA0LjYgYW5kIDQuNyBmbGlnaHRzLgoKSSBoYXZlIG5v
dyBhbHNvIGJhY2twb3J0ZWQKICA1ZjI4ZGUwYjBlNDc0ZTAxOTMxYjcxOWZhMjdjYTMwYjhhYTQ0
NmUwCiAgbGlieGw6IGNvbXBpbGF0aW9uIHdhcm5pbmcgZml4IGZvciBhcm0gJiBhYXJjaDY0CgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
