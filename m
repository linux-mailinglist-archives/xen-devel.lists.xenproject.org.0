Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7EC994CB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 15:20:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0myQ-00018h-9w; Thu, 22 Aug 2019 13:17:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D95g=WS=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1i0myP-00018b-Fv
 for xen-devel@lists.xen.org; Thu, 22 Aug 2019 13:17:53 +0000
X-Inumbo-ID: 3c115776-c4df-11e9-add7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c115776-c4df-11e9-add7-12813bfff9fa;
 Thu, 22 Aug 2019 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566479868;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=svW59gE6E6aqhNKzMjHxtByXQzeSAEWkryYpmSTKfLw=;
 b=WD61ajkaf11vB/LN04pRSI8iKv+PIcLVKKGflECWgMvK+vKj97vBKf7f
 hS3u76dRmav6BIXkxjHowTIhwmdSakaN05xLYluF4RG6DnWkJpC/OdtFA
 ZWIrvL7f6deRs91kDvTjpPz8QKzbnscsysEHfHwuHJ6KLMKZa30/weoog Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ktARnCekGaYnRtEb3WZRxJHf6sPNxNXg4EQYBNqE+TP6UstKs/CIBk3aUV48uSosn5KDkuNot+
 pdFh0yi1Ci2Dt5hY6S/NqAl1yjRjvF7KuyU5LwwV9y6OemY3iK/XWEtAj3vxn8ZhIyLZB+cVBh
 e3MwCl4PofDfarOQBuQWK66ukhs/jhT4/q7yoFUNal1SBzuxBCnijilNasC2e0EbMY6S5aRrwv
 MMiqOFlWLqaNaZtRgYFsPE03RU8hN4sdVQDEk2iGYxT1hRwy1Z7xA4lEv/VsCOM4JKtmCVhJe5
 ewo=
X-SBRS: 2.7
X-MesageID: 4836240
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4836240"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190821082056.91090-1-wipawel@amazon.de>
 <20190821082056.91090-10-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <41ef2138-ec41-b188-f5d1-f51f8e4c7549@citrix.com>
Date: Thu, 22 Aug 2019 14:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821082056.91090-10-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/20] create-diff-object: Add new entries
 to special sections array
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, wipawel@amazon.com,
 mpohlack@amazon.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8yMS8xOSA5OjIwIEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBIYW5kbGUg
LmxpdmVwYXRjaC5ob29rcyogYW5kIC5hbHRpbnN0cl9yZXBsYWNlbWVudCBzZWN0aW9ucyBhcyB0
aGUKPiBzcGVjaWFsIHNlY3Rpb25zIHdpdGggYXNzaWduZWQgZ3JvdXBfc2l6ZSByZXNvbHV0aW9u
IGZ1bmN0aW9uLgo+IEJ5IGRlZmF1bHQgZWFjaCAubGl2ZXBhdGNoLmhvb2tzKiBzZWN0aW9ucycg
ZW50cnkgaXMgOCBieXRlcyBsb25nIChhCj4gcG9pbnRlcikuIFRoZSAuYWx0aW5zdHJfcmVwbGFj
ZW1lbnQgc2VjdGlvbiBoYXMgdW5kZWZpbmVkIGdyb3VwX3NpemUuCj4gCj4gQWxsb3cgdG8gc3Bl
Y2lmeSBkaWZmZXJlbnQgLmxpdmVwYXRjaC5ob29rcyogc2VjdGlvbiBlbnRyeSBzaXplIHVzaW5n
Cj4gc2hlbGwgZW52aXJvbm1lbnQgdmFyaWFibGUgSE9PS19TVFJVQ1RfU0laRS4KPiAKPiBBZGQg
YW4gZXhwbGljaXQgY2hlY2sgdG8ga3BhdGNoX3JlZ2VuZXJhdGVfc3BlY2lhbF9zZWN0aW9uKCkg
c2tpcHBpbmcKPiByZWdlbmVyYXRpb24gb2Ygc3BlY2lhbCBzZWN0aW9ucywgd2hvc2UgZ3JvdXBf
c2l6ZSBpcyAwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBh
d2VsQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxhbmRy
YXByc0BhbWF6b24uY29tPgo+IFJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1h
em9uLmRlPgo+IFJldmlld2VkLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5k
ZT4KClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNv
bT4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
