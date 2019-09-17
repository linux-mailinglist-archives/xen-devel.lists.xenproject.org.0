Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785D4B5344
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:44:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGZC-0006E6-1x; Tue, 17 Sep 2019 16:43:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGZA-0006Dg-Ca
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:43:00 +0000
X-Inumbo-ID: 35024c66-d96a-11e9-961b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35024c66-d96a-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568738579;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=sECc2U2lxrD86EUSaE9ymSkmnFmY08y9C2SPlegnnAA=;
 b=RWPmGASMzryKB+uRELaueQhRx7+6kt0A5vl7U62ARCyi+ERTHAwFHd+B
 15BVJ+aoAWCTNJkudfLQ2XplDciwp+b3//MT/+1e8C+OQr6AKTfLs3sTx
 B8ipdU+bnDkh++XjcD2cL+vF7xWtmcXDWCc2cMwkk92TAks1TLmfZ8TLp 0=;
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
IronPort-SDR: gY4hgiJQiHDml+gHEOjZ8agLTqZ22Ogdeg7BuGhRBkHihKEmfa6/7w8l1spNc99OhKzvgy3klw
 u8PfdrnkNpV/mILyB/vXkTboiXkreXpGNL4ZDnBZiV9sXsCuDoseI6a/TdcEF1l0f6esxMOOsP
 /Y5J+ha7th6Y+ztzUKVT79DQanDycK+ULtcP1kEIOxuw1STaxpIuEcylG87+n5fyAsV3UQBrGY
 eS7m4x7cRjaJdGveyPE2wNUu4PCUODN1yJ6rkuIt7eW+wl+D/pufX6s4MNtwuj9cLQAUZaldoY
 Vvs=
X-SBRS: 2.7
X-MesageID: 5885097
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5885097"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.3344.357803.41041@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:42:56 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614112444.29980-10-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-10-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 09/15] libxl_domain: Cleanup
 libxl__destroy_domid
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDA5LzE1XSBsaWJ4bF9kb21haW46IENsZWFu
dXAgbGlieGxfX2Rlc3Ryb3lfZG9taWQiKToKPiAtIGRvbV9wYXRoIGlzbid0IHVzZWQgYW55bW9y
ZSBpbiB0aGF0IGZ1bmN0aW9uLCByZW1vdmUgaXQuCj4gLSBVc2UgYHInIHRvIHN0b3JlIHJldHVy
biB2YWx1ZSBvZiBleHRlcm5hbCBjYWxscy4KPiAtIFVzZSBgQ1RYJywgbm8gbmVlZCBmb3IgYSBs
b2NhbCBgY3R4Jy4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
