Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39861112DC6
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 15:51:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icVxc-0005Zs-9b; Wed, 04 Dec 2019 14:49:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ScHe=Z2=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1icVxb-0005Zk-HQ
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 14:48:59 +0000
X-Inumbo-ID: 33b8f602-16a5-11ea-aea8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33b8f602-16a5-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575470938;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zLZR79f1zWEYco/KFyt/TstEK4zVcXt7V8baX708lJ8=;
 b=CsSk4L9ffPIyfKAX7roh+Ejg74FmIXzmuSKsJd4PJLoljoyC0pQTAgkm
 ngUmKG54tzPUia+bK3Q063tNWPoaKzXBaLxGu3Z18wRNZh8/l/jS8CZ/A
 9LmTjq+PlwagrvPdk4wMcZsWLrnGxW28TOavYj5FRvkH4eD4Ad8yi9obH Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IU4g7P1XwQ2EGLPvzKZbBVAI1afsc9Q/Yc9R36QWeEK11o5ppegXMZ4avi4Kdrq9iNWqgbEF9U
 Am6/M65KKDjBgndgGkxysIXgiBEKmMaYb3xMtNFmZUNNOng8fZE0qbgaLOS+za4T595iF8V1l2
 FDDVQg5NSrwbWRUU3wRdhSFOmWAt/Eh6DJbFF98kxhd/cnXtS5+PIIJLc7uTvej6VByVvc0Pe3
 XesOT5nLRs+3oBuaarOJdxwBA/3URTGA6QMPVGIR0mQozcotOtAzzFOYd/0Du+Z321iJrtQJfR
 bvA=
X-SBRS: 2.7
X-MesageID: 9544123
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9544123"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20191203075722.107886-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <9ad6530d-db99-c523-0d3d-efae6d244f34@citrix.com>
Date: Wed, 4 Dec 2019 14:48:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191203075722.107886-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH livepatch-build-tools] create-diff-object:
 Include string sections later
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
Cc: mpohlack@amazon.de, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMy8xOSA3OjU3IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiAuLi4gd2hl
biBhbGwgc3ltYm9scyBoYXZlIHRoZWlyIHN0YXR1cyBhbmQgaW5jbHVkZSBmbGFncyBwcm9jZXNz
ZWQuCj4gCj4gUHJvY2Vzc2luZyBzcGVjaWFsIHNlY3Rpb25zIG1heSBpbmNsdWRlIGFkZGl0aW9u
YWwgc3ltYm9scy4gU3RyaW5nCj4gc2VjdGlvbnMgKC5yb2RhdGEqKSBhcmUgaW5jbHVkZWQgaWZm
IHRoZXkgYXJlIHJlZmVyZW5jZWQgYnkgYXQgbGVhc3QKPiBvbmUgc3ltYm9sLiBUaHVzLCBpbiBv
cmRlciB0byBkZWNpZGUgaWYgc3RyaW5nIHNlY3Rpb24gc2hvdWxkIGJlCj4gaW5jbHVkZWQgb3Ig
bm90LCBhbGwgc3ltYm9scyBtdXN0IGJlIGV2YWx1YXRlZCBmaXJzdC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4gUmVwb3J0ZWQt
Ynk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5
OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KCi4uLiBhbmQgcHVz
aGVkLiBUaGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
