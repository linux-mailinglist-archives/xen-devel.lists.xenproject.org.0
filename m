Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 925FDB534F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:47:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGb8-0006nw-VH; Tue, 17 Sep 2019 16:45:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGb6-0006nN-LV
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:45:00 +0000
X-Inumbo-ID: 5e396dbc-d96a-11e9-961b-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e396dbc-d96a-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568738648;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=MJqbuQh6iTAw0vtxJEbWFW2jLfXii9nV0Sw24n8ArTw=;
 b=fo3w1Qrdt7zholi2xKFFMDd+zf6HmS4xjVMOibGThPDW9NyeWTp1B1YN
 cE7LygXg8DsCcmnAhj1AyVlvkML0Pudmefiw2qAFl6CNEJ3DcdC0hjUpn
 Pw67KBtcs3nfomhXs5fW8+Gk8gp0K3cjGsqwjJc6dKxyR65LJ4N5Or7FS g=;
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
IronPort-SDR: m7ozpCXWhVBcHAm91xNnDmR744lX67B4yyhq1IZ9nob+9IpUOx2lDOs1/qW+yqW83mrksX8JsP
 kQv81jBff4d/0JNsx9tSIA4TrVKALPn7yin4FwVxsY+Lj/5k4+IOaEnzXYoGIpNQieOmLjK0fT
 mKJ3HTcXOdaypDpLQ4o8MG2sNMJ5gn0wfam0OqcSZL2AhJgbSvj27eSffqLY+w2N4A5/X0jcUW
 9mN+sEXF5tptbL7s/iPlW9BrVwGC7bhDA2Xu+0+YMmDoNkn5PPqxWXdkB7XZlIFabnHdyCxYf5
 BLk=
X-SBRS: 2.7
X-MesageID: 5990463
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5990463"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.3411.877144.354998@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:44:03 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614112444.29980-12-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-12-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 11/15] libxl_usb: Fix wrong usage of asserts
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDExLzE1XSBsaWJ4bF91c2I6IEZpeCB3cm9u
ZyB1c2FnZSBvZiBhc3NlcnRzIik6Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpJJ20gbm90IHN1cmUgd2h5IHlvdSB3b3VsZG4ndCBq
dXN0IGRlbGV0ZSB0aGUgYnJlYWtzLCByYXRoZXIgdGhhbgpyZXBsYWNpbmcgdGhlbSAicmV0dXJu
IiA/CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
