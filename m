Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A57B1B54
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 12:04:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8iOt-0004co-3D; Fri, 13 Sep 2019 10:01:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xfzx=XI=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1i8iOr-0004cB-RE
 for xen-devel@lists.xen.org; Fri, 13 Sep 2019 10:01:57 +0000
X-Inumbo-ID: 84ba6f28-d60d-11e9-978d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84ba6f28-d60d-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568368916;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=J7OdTWb0YIG65s9YRtvhvE6EUXjMo+oNxTjzh/CGnyw=;
 b=cgybCcrU1uQre3wrqRx9lz202/fBw8/NG8J+8EUDkC3+G4gCJUg3TQOb
 Tz42cNgRlyaDYfm281tMII5mIb8WDUvrT5KW4rEWIXd+00t8BUpFGIsFi
 aOeRCoBPCwXhJ5WHK9XQ6A8XBMOp0fj7sXFq5zzpGPgicwZRHvqEwOZFw E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vNfGIKD7Fe2Mi6RyBffHThBRke3dwh6k7Vk9zbH5F/dLuYUj3lvdRdCAZoNZhSHrBubcR9F6yW
 mb/51530cjyaf1nPaDjt0J1xk9Gb2Mr5W7dgtEFD7wCyWhIKMxVpoluvfGwqjzWYJcKMtakAR6
 XPDN+O1kgmb8VhszcxvH1A2nDfRsNnKZyJFrV39e4r1AfTYWgZry424+OMMIQDXKgFd0qlSTyO
 lC7yZLtAK4hj7oVBy8Lbmz8cbuS5ihf4ld26T+6C759LmF40nI11Qxf/EuVpPlo6xrfsymqRYY
 6BY=
X-SBRS: 2.7
X-MesageID: 5772894
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,500,1559534400"; 
   d="scan'208";a="5772894"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190821100430.89909-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <104d5651-e054-ae62-3137-0a8e22429969@citrix.com>
Date: Fri, 13 Sep 2019 11:01:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821100430.89909-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] livepatch: always print XENLOG_ERR
 information (ARM, ELF)
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8yMS8xOSAxMTowNCBBTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gVGhpcyBj
b21wbGVtZW50cyBbMV0gY29tbWl0IGZvciBBUk0gYW5kIGxpdmVwYXRjaF9lbGYgZmlsZXMuCj4g
Cj4gWzFdIDQ0NzBlZmVhZTQgbGl2ZXBhdGNoOiBhbHdheXMgcHJpbnQgWEVOTE9HX0VSUiBpbmZv
cm1hdGlvbgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2Vs
QGFtYXpvbi5kZT4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9hcm0zMi9saXZlcGF0Y2guYyB8ICAy
OCArKysrKy0tLS0tLQo+ICAgeGVuL2FyY2gvYXJtL2FybTY0L2xpdmVwYXRjaC5jIHwgIDI4ICsr
KysrLS0tLS0tCj4gICB4ZW4vY29tbW9uL2xpdmVwYXRjaF9lbGYuYyAgICAgfCAxMDQgKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwg
ODAgaW5zZXJ0aW9ucygrKSwgODAgZGVsZXRpb25zKC0pCj4gCldpdGggQW5kcmV3J3Mgc3VnZ2Vz
dGVkIHdoaXRlc3BhY2UgY2hhbmdlczoKClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9z
cy5sYWdlcndhbGxAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
