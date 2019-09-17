Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD94B53B6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:13:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAH0O-0004ze-QS; Tue, 17 Sep 2019 17:11:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAH0N-0004zJ-Eu
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:11:07 +0000
X-Inumbo-ID: 2280d537-d96e-11e9-961c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2280d537-d96e-11e9-961c-12813bfff9fa;
 Tue, 17 Sep 2019 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568740266;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=D+3NeHXpxsxm2X9DzNYB1im9jnD5CRZYL3b4OjhOQ9c=;
 b=abN4j+qnHgXkmsAj455f91wWbsKrwzkUFaoBryQf57VGIXy+Mh6fFlDf
 MTQKOhUjTT7YFKpC5n5RoGU/Sp/OsJJilpRuMaKfP9lC1GNTfYNpVvtb8
 1iMmKTIUo4Q7/upVShBn2UYcQxwu1DGdogv1SslIkQ5Sityw5xT4UGdT2 s=;
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
IronPort-SDR: +vXd7zKAGSXgqIXBiw512lPUNQQTWL7wWWfoR7jus5IaH6uay4M6RwMtJj5WvvvhPwlFlavEGV
 wbOZgCuv0Awsng6rinQ1q2AQQTEZ+Oxh6/6BnFPoN5fOKNI4xRY7p7Sk9gmgxJGjOiUrAAQJfa
 MP1D8Lr40yef4yqvBwcbG31Fizj6a2Ta+qnXsc+I0ZD4Hl0TV4YPzrh75DONJUT0sVCYdYrhw2
 l3AxjA2tstEYQf4LusGXsQS9QdUzv0l9BP1iedY7eB+Hkgo2j6Li7zfkCh1Ooa0o6nehlwBvv0
 rIc=
X-SBRS: 2.7
X-MesageID: 5886640
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5886640"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.5025.700139.700572@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:10:57 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-22-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-22-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 21/35] libxl_usb: Make
 libxl__device_usbdev_add uses ev_qmp
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDIxLzM1XSBsaWJ4bF91c2I6IE1ha2UgbGli
eGxfX2RldmljZV91c2JkZXZfYWRkIHVzZXMgZXZfcW1wIik6Cj4gU2lnbmVkLW9mZi1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
