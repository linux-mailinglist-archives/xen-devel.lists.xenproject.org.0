Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F222C04C6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:03:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDouq-0002tV-SE; Fri, 27 Sep 2019 12:00:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nII6=XW=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iDoup-0002nK-2P
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:00:03 +0000
X-Inumbo-ID: 55b3eb0c-e11e-11e9-9677-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 55b3eb0c-e11e-11e9-9677-12813bfff9fa;
 Fri, 27 Sep 2019 12:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569585601;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rqd5CS31twPgztY2e67YX5r7iqR25Vl/awZM50sB4nM=;
 b=DKV2dAEyRKnF5wePmxI/5AeEXM/l0YLOuuCzxyjXOZgi2brrgIdOB3lm
 GVUm+z3soglK0vzaI+6DcpHQxV2JhNZXG4QdH1foEc+G0tuO3nHbNKA5B
 FeWEyLyeWBxGmtFqNIriCHVFaPocxw6j80tBYQHUdtXn8DfaSLZAdeRyB w=;
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
IronPort-SDR: koSzQRtsyvJNTORhy1Z1sTygvH0bA1pwrMbGC/DS6os2/PBJwvSvuc2dAO5GTk2tDEczftubKd
 9n/vuutuxXh6xyP0KeJP0ORNllQp8FW6HyLKCESon0kFr83sQg7ShPv6Bql9JGcUeugnH3yqkD
 KEoMhy7DhL7oRnGlbYoH/C/Z7+6zDEnqVvB9aL3Jv2SNve8Kd3/I0Hab6BmfWqxKTrNj0vsd2B
 sMyxVmeQZvpo2h4PLzXsVnIgY9j5e2kG2lFVUmpSA4Vjc4Cdexps4cm3P71IxTxtmcX3JnDZLg
 W54=
X-SBRS: 2.7
X-MesageID: 6446532
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6446532"
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-7-julien.grall@arm.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <f14a8a9a-e378-ec3a-612c-c97720edf7e2@citrix.com>
Date: Fri, 27 Sep 2019 12:59:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926183808.11630-7-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 06/10] xen/arm: Move
 ARCH_PATCH_INSN_SIZE out of the header livepatch.h
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, andrii.anisov@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yNi8xOSA3OjM4IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQXQgdGhlIG1vbWVudCwg
QVJDSF9QQVRDSF9JTlNOX1NJWkUgaXMgZGVmaW5lZCBpbiB0aGUgaGVhZGVyCj4gbGl2ZXBhdGNo
LmguIEhvd2V2ZXIsIHRoaXMgaXMgYWxzbyB1c2VkIGluIHRoZSBhbHRlcm5hdGl2ZSBjb2RlLgo+
IAo+IFJhdGhlciB0aGFuIGluY2x1ZGluZyBsaXZlcGF0Y2guaCBqdXN0IGZvciB1c2luZyB0aGUg
ZGVmaW5lLCBtb3ZlIGl0IGluCj4gdGhlIGhlYWRlciBpbnNuLmggd2hpY2ggc2VlbXMgbW9yZSBz
dWl0YWJsZS4KPiAKUmV2aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
