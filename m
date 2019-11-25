Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10F108FC6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 15:24:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZFGW-0001aL-Sn; Mon, 25 Nov 2019 14:23:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nqy9=ZR=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iZFGV-0001a4-Na
 for xen-devel@lists.xen.org; Mon, 25 Nov 2019 14:22:59 +0000
X-Inumbo-ID: 13f94758-0f8f-11ea-b4d1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13f94758-0f8f-11ea-b4d1-bc764e2007e4;
 Mon, 25 Nov 2019 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574691778;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=TGTiUE3uMu56FClX3X3sAqUPRU284M3OApBCMbqwLdE=;
 b=Lkkc/4JfxSJlvXaz/rZTkqKjzA8UBKsxUuotbOT6Lh+TeOd/FKPT5pdx
 M0X6sHzAbh6atMhhz5PbCZgG2Iy+EQoIRhb4l6THW5PkFXClnDWkg13Al
 F25/Jfh7CCnPjazLMcHURtep8RUF8bR1zfwp83fXTyLmrJJm3R6eB9Qm8 M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: m1dXee8It6GjFggVYJp9PS+SE7W9orOMbsyPcHz7koCyn06ax9yraL+l7mublTb0IcwgZcAeEC
 eJg3wyc3F7+UldAZO0reY+qu169v3zBsaNz5bdAUHq46qVYz7Mmx6wKU3lz4o3kef24jAyOu8R
 /TqZrOBz9ITE+Xy9Ml9o1OUn+upsTNl6nnaros6rs6c5d6RAh5WVhyw5lgMHRBIZ92iM28crN4
 dG1EOII+22i8Z9LLuosibw0+XVHkYwxH5HNRM+a59t2nsBWh6Qq92npzNvRtsnwouMVBWdecMb
 d4U=
X-SBRS: 2.7
X-MesageID: 8786752
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,241,1571716800"; 
   d="scan'208";a="8786752"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190916113056.16592-1-wipawel@amazon.de>
 <20190916113056.16592-6-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <c8d31bb9-4623-dfd6-284a-c2a4224c2d08@citrix.com>
Date: Mon, 25 Nov 2019 14:22:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190916113056.16592-6-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/7] create-diff-object: Add support for
 expectations
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNi8xOSAxMjozMCBQTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gRXh0ZW5k
IGxpdmVwYXRjaF9wYXRjaF9mdW5jIHRvIHN1cHBvcnQgYSBuZXcgZmllbGQ6IGV4cGVjdC4gVGhp
cyBuZXcKPiBmaWVsZCBkZXNjcmliZXMgdGhlIGV4cGVjdGVkIGRhdGEsIGl0cyBsZW5ndGggYW5k
IHdoZXRoZXIgZXhwZWN0YXRpb24KPiBpcyBlbmFibGVkLiBUaGUgZXhwZWN0YXRpb24ncyBkYXRh
IGlzIG9mIG9wYXF1ZSBwYWRkaW5nIHNpemUuCj4gCj4gQnkgZGVmYXVsdCB0aGUgZXhwZWN0YXRp
b24gZmllbGQgaXMgemVyby1vdXQgYW5kIHRoZSBleHBlY3RhdGlvbiBpcwo+IGRpc2FibGVkIHVu
bGVzcyBleHBsaWNpdGx5IHNwZWNpZmllZCBpbiB0aGUgcGF0Y2guCj4gCj4gU2lnbmVkLW9mZi1i
eTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTog
Um9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
