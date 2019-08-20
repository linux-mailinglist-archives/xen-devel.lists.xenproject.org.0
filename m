Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B31495F96
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 15:14:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i03vz-00031x-LP; Tue, 20 Aug 2019 13:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y3HU=WQ=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1i03vy-00031a-6f
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 13:12:22 +0000
X-Inumbo-ID: 245ef06e-c34c-11e9-a661-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 245ef06e-c34c-11e9-a661-bc764e2007e4;
 Tue, 20 Aug 2019 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566306740;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=iHAEFIMs2T75vHCSEyFF4rUSI5TGrIo99gXC2+W291A=;
 b=cXB/gvX7c1PbCddSOFk3IeKZQmfZxBHWiitJbtfoM/AW8bDeFfoz9I+6
 SFU332xRszoe0r5gooG90l2/wGzAN5we7wjNNq3lTMA+HhzcZ7LR9qJsF
 e3EI6+zlDPJmDeppo8reTav18ppoRTu60WiHoxp07hvXmAo1k4WiSkWML g=;
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
IronPort-SDR: 4eA1MjoKdFq5rvaePFx6j7IYHHxdwnsuDg40MK3ap+CpxggBCv0TIZHL5DF44rCHRna7nb+weI
 vKE3079rssUNF4MDPc++3CICgzi45lecRCeGS0k+MX9IzKsOv+qiDBKMHp7v9bdqecj3AJG0kx
 bcI4RPQ7pyeQLEOkR0h4P9qGsdetJ1qEExoCgh+lSKajPl7w0aRwijvV2hkdpxHMABHey1QRqC
 jm6poV1UKzSxfmC+/6gYkf7KZ5gS2IwBKdP9H8yqY1a9LrHSffvI957bPICIBCF7COlk6cSBhQ
 gig=
X-SBRS: 2.7
X-MesageID: 4650994
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4650994"
To: Lars Kurth <lars.kurth@citrix.com>, <xen-devel@lists.xenproject.org>
References: <4c08e311d56967af4e9cb7863c2ecc3a90ceb83a.1565892726.git.lars.kurth@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <37bf15a4-28ab-424b-c865-ab7593c79813@citrix.com>
Date: Tue, 20 Aug 2019 14:12:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <4c08e311d56967af4e9cb7863c2ecc3a90ceb83a.1565892726.git.lars.kurth@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH LIVEPATCH-BUILD-TOOLS] Introduce a
 MAINTAINERS file
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNS8xOSA3OjE2IFBNLCBMYXJzIEt1cnRoIHdyb3RlOgo+IFJhdGlvbmFsZTogdGhpcyB3
aWxsIGFsbG93IHVzIHRvIHVzZSBnZXRfbWFpbnRhaW5lci5wbCAvCj4gYWRkX21haW50YWluZXJz
LnBsIHNjcmlwdHMgZnJvbSB4ZW4uZ2l0Cj4gCj4gU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8
bGFycy5rdXJ0aEBjaXRyaXguY29tPgoKQWNrZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxh
Z2Vyd2FsbEBjaXRyaXguY29tPgoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
