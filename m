Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F548B245
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 10:23:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxS2g-0005r1-9O; Tue, 13 Aug 2019 08:20:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a7Ph=WJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hxS2f-0005qw-Bd
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 08:20:29 +0000
X-Inumbo-ID: 3525fae1-bda3-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3525fae1-bda3-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 08:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565684428;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MSNDb5M/uhPTXoW2QG6d7ZGLQTVW3BXr4dqZJhjvQKQ=;
 b=Y13i+U+x/AgK3isELAIBDsHkbNux7rc1RKX2+zt0jz+pec7S/CmE3nMb
 VRCmM4zdkvDAdcOCvgmWIRhu2KQZxmMqMafGeVFyXV7PTILtlb6MyO6vM
 2akom2Z1OOv92hF5gKT9b+715PxBS2I4iper+udSswO6k4yJWkmKT02m+ Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YyJYPQ6VXMkgmOH9bE1bW7wGRnEWWYVdrhqf1LUNH9JZt+GUSq/a+mDF8iOZMrkfEZepWz3MKB
 Nbl/e827DePlYKulChWdpxlyiyCPXsSZwI3waKlSrxQtvyQHMnB796aa+296RQS+E6MqK4aQiJ
 Ih2+dXOCKw2EarPKHZodwm4FdZkwjlQZF+Psh/QfCgm0QI1BZrC0/Rs7ltNVStNAsgoeRAzvAI
 J0wCCJBaCBN938BDYB6CeYXoTL2y3zsHEmo7JiHgunnzNyMeFLf/2QMEZHcjVWFJqd/8sKSpgQ
 yWU=
X-SBRS: 2.7
X-MesageID: 4340732
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,380,1559534400"; 
   d="scan'208";a="4340732"
Date: Tue, 13 Aug 2019 10:20:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chuhong Yuan <hslester96@gmail.com>
Message-ID: <20190813082000.shprs2ci33v5eapd@Air-de-Roger>
References: <20190813061650.5483-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813061650.5483-1-hslester96@gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/blkback: Use refcount_t for
 refcount
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDI6MTY6NTBQTSArMDgwMCwgQ2h1aG9uZyBZdWFuIHdy
b3RlOgo+IFJlZmVyZW5jZSBjb3VudGVycyBhcmUgcHJlZmVycmVkIHRvIHVzZSByZWZjb3VudF90
IGluc3RlYWQgb2YKPiBhdG9taWNfdC4KPiBUaGlzIGlzIGJlY2F1c2UgdGhlIGltcGxlbWVudGF0
aW9uIG9mIHJlZmNvdW50X3QgY2FuIHByZXZlbnQKPiBvdmVyZmxvd3MgYW5kIGRldGVjdCBwb3Nz
aWJsZSB1c2UtYWZ0ZXItZnJlZS4KPiBTbyBjb252ZXJ0IGF0b21pY190IHJlZiBjb3VudGVycyB0
byByZWZjb3VudF90Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENodWhvbmcgWXVhbiA8aHNsZXN0ZXI5
NkBnbWFpbC5jb20+CgpBY2tlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
