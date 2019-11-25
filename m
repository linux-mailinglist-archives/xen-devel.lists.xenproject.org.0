Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457D61092A4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 18:09:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZHop-0000de-P1; Mon, 25 Nov 2019 17:06:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nqy9=ZR=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iZHoo-0000dZ-9E
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 17:06:34 +0000
X-Inumbo-ID: ee49eed8-0fa5-11ea-b4d1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee49eed8-0fa5-11ea-b4d1-bc764e2007e4;
 Mon, 25 Nov 2019 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574701593;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=a0mtvtq0pE3W+ZSlGjU1LcCDwR2c76slXi2mm//XmoQ=;
 b=UyuEpWMS26ijnwE/NGrcIc7e7/dpgC/fBH3ZEdRCYOxtBYATaqQ6wJiS
 iVH5mO6iNu2T3TXsmmIp46XOs3JkkAH8k4/8gjvsdk6YY9fQPk43vuSo9
 ZD+2aEKMGuhBcoIuu2TMlCxbG1aR/aouSXyGG1BFS67RsSroXD/OXtDCM c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IRPRBk/ZqcfZlsbmbgM2Wh4sl0mYcNUVm8R8RuYEXSSvaJ3/y6NyqmhELGGYTYFFmNH3f6ME8a
 DgC8vbwmDJRYql3bURLTMNRBy21Y3XzLTMUYCkG2YcbIUZJ3t6U6ue3RZEMPzC40PVNO4ql/q/
 ybGgjh3prmn9A24nNP19Ou9Y2xTQTGI3CU2BROyQSNhqGSoqQs+/A2HTMLIUnNH/LQnCWiW3yy
 5WBNGSy0Hv7gSaaxptKL4H4P/TD9uNU/n21zR0YBcZUIhTfwYuqzId48cS+1+QJAmPv1K27QLB
 wTY=
X-SBRS: 2.7
X-MesageID: 8809778
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,242,1571716800"; 
   d="scan'208";a="8809778"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20191105153745.74257-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <72125e36-8006-4e21-43d0-17e962b8a44e@citrix.com>
Date: Mon, 25 Nov 2019 17:06:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105153745.74257-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] create-diff-object: do not strip STN_UNDEF
 symbols from *.fixup
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
Cc: wipawel@amazon.com, mpohlack@amazon.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvNS8xOSAzOjM3IFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBUaGUgcmVs
YSBncm91cHMgaW4gdGhlICouZml4dXAgc2VjdGlvbnMgdmFyeSBpbiBzaXplLiBUaGF0IG1ha2Vz
IGl0Cj4gbW9yZSBjb21wbGV4IHRvIGhhbmRsZSBpbiB0aGUgbGl2ZXBhdGNoX3N0cmlwX3VuZGVm
aW5lZF9lbGVtZW50cygpLgo+IEl0IGlzIGFsc28gdW5uZWNlc3NhcnkgYXMgdGhlIC5maXh1cCBz
ZWN0aW9ucyBhcmUgdW5saWtlbHkgdG8gaGF2ZQo+IGFueSBTVE5fVU5ERUYgc3ltYm9scyBhbnl3
YXkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1h
em9uLmRlPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2Fs
bEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
