Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305F010A04C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:32:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZbqH-00014J-OI; Tue, 26 Nov 2019 14:29:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3zt1=ZS=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iZbqG-00014E-OF
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 14:29:24 +0000
X-Inumbo-ID: 24373f24-1059-11ea-a3a3-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24373f24-1059-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574778563;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=4/7pBarqQ2tG7O57R2a1wteKxhu2ubIAwvusApe3Ls8=;
 b=I4llawEvoWdESWVCXBNeWpTsWc3oG8umpngKCTuZbjsUOgREZBUAWQpM
 eTKw4Wg7A3ilpb6gIJq4tpib1/M45aqMxkzX38xIhOmZd8A3u2OJdxuF0
 sXLZODs0WZ14/LfRTZJGg+hXzfcs+qP+jLenmyG/qc+tO/KTXlzaLjG+H o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: t2YvzSCZ6tgzRTLV+gsAKzWpV002JuEJFBQqWN4Y0YoCpU7849VE4naQttL8lgx+s65gWExayn
 iNKQ7RlK8RC65XJpuBqdY+4bmx+Xhrn6ltktw3XKZAsuMxmQan7lM/7bJbjh1C3kzqATGfnqjS
 xZHAGuP5pBCA0RUWQFhqL6w7YpGgN2fE9B+4PzMqVS8ArfajXDizwPedHoe93KuTBr1zB6Wu2E
 E2WprlOEay3J0KiTSViwNMrPHe3kK8k1+ovtnALGNwnXK1EqkrrtWJp2LXn7APbvUcw5AHQ3av
 enQ=
X-SBRS: 2.7
X-MesageID: 9261436
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9261436"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20191126123027.9032-1-wipawel@amazon.de>
 <20191126131139.14476-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <567fac49-d81f-719b-29e3-16a087755d8d@citrix.com>
Date: Tue, 26 Nov 2019 14:29:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191126131139.14476-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] MAINTAINERS: Add mandatory V: version
 identifier
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjYvMTkgMToxMSBQTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gVGhlIGxp
dmVwYXRjaC1idWlsZC10b29scyBNQUlOVEFJTkVSUyBmaWxlIGlzIG1pc3NpbmcgVjogdmVyc2lv
bgo+IGlkZW50aWZpZXIuIFRoaXMgc2VlbXMgcmVxdWlyZWQgYnkgdGhlIFhlbiByZXBvJ3MgYWRk
X21haW50YWluZXJzLnBsCj4gc2NyaXB0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6
b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KPiAtLS0KCkFja2VkLWJ5OiBSb3NzIExhZ2Vy
d2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
