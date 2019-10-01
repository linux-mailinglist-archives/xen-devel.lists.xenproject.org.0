Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A01C35D4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 15:36:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFIIO-0004bU-Af; Tue, 01 Oct 2019 13:34:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XqjC=X2=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iFIIN-0004bP-BE
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 13:34:27 +0000
X-Inumbo-ID: 2f95f444-e450-11e9-96fd-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 2f95f444-e450-11e9-96fd-12813bfff9fa;
 Tue, 01 Oct 2019 13:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569936866;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=s32kIX46aY8Hd4BKKox0lNJrcYvekQ/gIXvka1nyQS4=;
 b=UWzkyHVSrUPIqsZFC83nEYrcHA2ue56CJu27YiJVkO6HbRC4YNbwia6C
 pJag+nIsXSajp99ObtUa90liemcZNw3DTC6l9iwsAPSZvO46K8i6sFvX5
 aTb5VDPdGzNIDwQB3uRa2THh2MxQ2L3ty+UMqDcrmgBUXwA/oedo6Amv6 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cB+u9ijHBzHK4zNjhkiOAwN2y94nwhQXEkg031elq4/I/GJvnqOgkYhx+A4+9X+pXF61mBsES4
 QOEXUzDOVNePZkVq7W9M8veJb4FHH2x000aH2mZSwquQnEwQhOTRNK7Dw4SypaaaxfdfhTGlYX
 e2uCMTAcvTb+s3ySDTgTapZZq3lbnbbG8pOsHHvAe7JAmwuDGNLRA+d17j4DIHr6XvwyuEvgK7
 2Cu6H+T/kqrn0NZto4yK2W1WLhnv5S5vN275L+rUZAJK+jFfwdeiZ4viSrKazR/0h+4n2++yMo
 cW8=
X-SBRS: 2.7
X-MesageID: 6549670
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6549670"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23955.21983.2115.154193@mariner.uk.xensource.com>
Date: Tue, 1 Oct 2019 14:34:23 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191001131507.GI1163@perard.uk.xensource.com>
References: <20191001101259.53162-1-roger.pau@citrix.com>
 <20191001131507.GI1163@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxl: wait for the ack when issuing power
 control requests
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
Cc: Wei Liu <wl@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSF0gbGlieGw6IHdhaXQgZm9yIHRoZSBh
Y2sgd2hlbiBpc3N1aW5nIHBvd2VyIGNvbnRyb2wgcmVxdWVzdHMiKToKPiBPbiBUdWUsIE9jdCAw
MSwgMjAxOSBhdCAxMjoxMjo1OVBNICswMjAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBJ
IGJlbGlldmUgYXBwbHlpbmcgdGhpcyBwYXRjaCBpcyBub3QgZ29pbmcgdG8gY2F1c2UgcmVncmVz
c2lvbnMgaW4KPiA+IG9zc3Rlc3QsIGFsYmVpdCBGcmVlQlNEIGRvZXNuJ3QgYWNrbm93bGVkZ2Ug
cG93ZXJvZmYvcmVib290IHJlcXVlc3RzCj4gPiBpbiB0aGUgY3VycmVudGx5IHRlc3RlZCB2ZXJz
aW9ucywgaXQgd2lsbCBzaHV0ZG93biBpbiBsZXNzIHRoYW4gb25lCj4gPiBtaW51dGUsIGFuZCB0
aHVzIHRoZSB0b29sc3RhY2sgd29uJ3QgY29tcGxhaW4gYmVjYXVzZSB0aGUgY29udHJvbCBub2Rl
Cj4gPiBpcyBnb2luZyB0byBiZSByZW1vdmVkIGZyb20geGVuc3RvcmUuCj4gCj4gQWNrbm93bGVk
Z2VtZW50IGlzIGRlc2NyaWJlZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiBvZiB+L2NvbnRyb2wvc2h1
dGRvd24KPiAoZGVzY3JpYmVkIGluIHhlbnN0b3JlLXBhdGhzLnBhbmRvYyksIHNvIEkgZ3Vlc3Mg
aXQgd291bGQgYmUgYSBidWcgaW4KPiBGcmVlQlNEIHJhdGhlciB0aGFuIGEgcmVncmVzc2lvbiBv
ZiB0aGUgdG9vbHN0YWNrLiBJc24ndCBpdD8KCldlbGwsIHllcywgYnV0IHdlIHRyeSB0byBhdm9p
ZCBicmVha2luZyBvbGQgZ3Vlc3RzLCBldmVuIGlmIHRoZXkgYXJlCmJ1Z2d5LgoKSWFuLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
