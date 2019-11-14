Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F2AFC5A3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 12:47:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVDYo-0007qu-TE; Thu, 14 Nov 2019 11:45:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8MhN=ZG=citrix.com=jennifer.herbert@srs-us1.protection.inumbo.net>)
 id 1iVDYn-0007qj-Hg
 for xen-devel@lists.xen.org; Thu, 14 Nov 2019 11:45:13 +0000
X-Inumbo-ID: 372d3234-06d4-11ea-984a-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 372d3234-06d4-11ea-984a-bc764e2007e4;
 Thu, 14 Nov 2019 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573731911;
 h=from:subject:to:references:cc:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cg8cTx5wlQt4H9UuU7MGk3z0xrh6hV+m41pzzJH5yOs=;
 b=Yvgu1xF8Hstan5vMXrJ/mdzw/jHM9usi8bQYYYJek3ZahORqaYzV+vLa
 G0mHBuoE/r9HuEHB0pXNU3OTTEhwGZWT3mTKBxRaJDRskH/TXSXiDKSl6
 LCx5kJKq9tAKqdTIyBAl5zVn56tkldlS5xTuyv5GwOWvlVgPsQ1tNwc5m Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Jennifer.Herbert@citrix.com;
 spf=Pass smtp.mailfrom=jennifer.herbert@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Jennifer.Herbert@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="jennifer.herbert@citrix.com";
 x-sender="Jennifer.Herbert@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 jennifer.herbert@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="jennifer.herbert@citrix.com";
 x-sender="jennifer.herbert@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="jennifer.herbert@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6lhysftvy0QUW3wlIIK+JxpptltnsJe0Okg3VoitmFE2a1By83Po6aiWxZyL15J6bHNnqYJlNW
 4WGLJ2uraWeYLS+ZmaZpwR7PBg5HbC0Mf/d2V6V8Zl0us+KlKSTHBTM01fQrVeSXvd9SHrRl8Z
 vjaf9kxykP348CUT6+5mWAVe2vbWRXuWtDIJ8wv5mvz+My2KDfbzivJgCwNaHy+T2m4/FdrfTI
 MF6HSZX2kKPOqGvb/6kZzJA4Sw9HPrB5wjWgRxVvKS0VGOVpg61wIQw210GwA5+/kwbawyKXaT
 +yM=
X-SBRS: 2.7
X-MesageID: 8677281
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,304,1569297600"; 
   d="scan'208";a="8677281"
From: Jennifer Herbert <Jennifer.Herbert@citrix.com>
To: Xen-devel <xen-devel@lists.xen.org>
References: <20191111205514.2779-1-andrew.cooper3@citrix.com>
Message-ID: <5DCD3E45.80505@citrix.com>
Date: Thu, 14 Nov 2019 11:45:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <20191111205514.2779-1-andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: Fix passthrough following c/s
 d7cfeb7c13e
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDExLzExLzE5IDIwOjU1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ICJBTUQvSU9NTVU6IGRv
bid0IGJsaW5kbHkgYWxsb2NhdGUgaW50ZXJydXB0IHJlbWFwcGluZyB0YWJsZXMiIGludHJvZHVj
ZXMgYQo+IGNhbGwgYXQgcnVudGltZSBmcm9tIGFtZF9pb21tdV9hZGRfZGV2aWNlKCkgdG8gYW1k
X2lvbW11X3NldF9pbnRyZW1hcF90YWJsZSgpCj4gd2hpY2ggaXMgc3RpbGwgbWFya2VkIGFzIF9f
aW5pdC4KPgo+IE9uIG9uZSBBTUQgUm9tZSBtYWNoaW5lIHdlIGhhdmUsIHRoaXMgcmVzdWx0cyBp
biBhIGNyYXNoIHRoZSBtb21lbnQgd2UgdHJ5IHRvCj4gdXNlIGFuIFNSLUlPViBWRiBpbiBhIFZN
Lgo+Cj4gUmVwb3J0ZWQtYnk6IEplbm5pZmVyIEhlcmJlcnQgPGplbm5pZmVyLmhlcmJlcnRAY2l0
cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgoKClRlc3RlZC1ieTogSmVubmlmZXIgSGVyYmVydCA8amVubmlmZXIuaGVyYmVy
dEBjaXRyaXguY29tPgoKVGhpcyBmaXhlcyB0aGUgZmF0YWwgcGFnZSBmYXVsdCBJIGZvdW5kLCB3
aGljaCB3YXNuJ3Qgc2VlbiBvbiA0LjExLgoKQ2hlZXJzLAoKLUplbm55CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
