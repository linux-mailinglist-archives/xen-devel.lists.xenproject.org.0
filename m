Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC3A8FEF7
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 11:27:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyYTx-0000sa-Vl; Fri, 16 Aug 2019 09:25:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CMUz=WM=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hyYTw-0000sR-F8
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 09:25:12 +0000
X-Inumbo-ID: bcdfe6d8-c007-11e9-8bb2-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bcdfe6d8-c007-11e9-8bb2-12813bfff9fa;
 Fri, 16 Aug 2019 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565947508;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=H913Du6BFhlqxgRqXDXJS70Sqimriv6vhslDIV0UYaA=;
 b=RBVyKfNUz47+LgMqW4zaicR4PVtKZXEYwsbQOKX0tAsfqMal84wsK7ZZ
 KirWm5ynCgCEDaCtHlb5fy/rXMB0cR9TOt72Nl4k0nBa6rxjd2bQtpQtM
 XKjcOXcgZBx71fboSb9KfUQUmX6IO08vCOrYJsICRA9QuFSSJZjRz5RF0 w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SjRLB91ZaVe1oaYcqFpPi9fZ9MbTOW6xW5jk2N3Vj7fjpElH6dY7J0y++FRcqgi79XY2tzb2m/
 NLkRGe3BkAUcIJvPunBKQxwu+nbfnYXWGKLoUB0cAKt9E5go+/zMQjEP1aMUjZ8f8hb7QeaQIq
 RD53CjeOLj2JXBPTVrWM7HXgL4Dv7VJrOysXpRjGezvbD9nNY7cadITh5Q2B+knFDO/+c79gb6
 P04jh0rNtl/40C0sm9R3uALieM38X22rc0gTk8Fvhxjo9blqY03EhL7i9xfcDn9W/Nh/QtcXHC
 y4c=
X-SBRS: 2.7
X-MesageID: 4509527
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,391,1559534400"; 
   d="scan'208";a="4509527"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190416120716.26269-3-wipawel@amazon.de>
 <20190808122334.6671-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <915f59e7-1be2-6676-b8cb-c657d33ff839@citrix.com>
Date: Fri, 16 Aug 2019 10:24:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190808122334.6671-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 v2 3/6]
 create-diff-object: Add is_special_section() helper function function
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC84LzE5IDE6MjMgUE0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+IFRoaXMgZnVu
Y3Rpb24gZGV0ZXJtaW5lcywgYmFzZWQgb24gdGhlIGdpdmVuIHNlY3Rpb24gbmFtZSwgaWYgdGhl
Cj4gc2VjdGlvbnMgYmVsb25ncyB0byB0aGUgc3BlY2lhbCBzZWN0aW9ucyBjYXRlZ29yeS4KPiAK
PiBBZGQgbW9yZSBzcGVjaWFsIHNlY3Rpb25zIHRvIHNwZWNpYWxfc2VjdGlvbnNbXSBhbG9uZyB3
aXRoIGEgbmV3Cj4gdW5kZWZpbmVkX2dyb3VwX3NpemUoKSBoZWxwZXIgZnVuY3Rpb24gcmV0dXJu
aW5nIDAgKHVuZGVmaW5lZCkuCj4gTmV3IHNwZWNpYWwgc2VjdGlvbnMgYXJlOiAuYWx0aW5zdHJf
cmVwbGFjZW1lbnQuCgpJcyB0aGlzIHBhcmFncmFwaCBkZXNjcmliaW5nIHBhdGNoIDUvNj8KCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRl
Pgo+IFJldmlld2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+Cj4gUmV2
aWV3ZWQtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+IC0tLQoKUmV2
aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoKKFdp
dGggdGhlIGFib3ZlIHBhcmFncmFwaCBhbmQgdGhlIGR1cGxpY2F0ZSB3b3JkIGluIHRoZSBzdWJq
ZWN0IHJlbW92ZWQsIAp3aGljaCBJIGNhbiBkbyBkdXJpbmcgY29tbWl0LikKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
