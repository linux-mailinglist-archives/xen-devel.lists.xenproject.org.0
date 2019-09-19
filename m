Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0DB7F03
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 18:25:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAzCL-0004uw-3R; Thu, 19 Sep 2019 16:22:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Iqgf=XO=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iAzCK-0004um-85
 for xen-devel@lists.xen.org; Thu, 19 Sep 2019 16:22:24 +0000
X-Inumbo-ID: a917cf00-daf9-11e9-978d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a917cf00-daf9-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 16:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568910144;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0mk5CIOgmRMQgXpE0NgbHmYvAX34xVVJYckdflr+IKM=;
 b=TQfu/6PKMUzNBACzXnB5CqLp6cBb7AsQ6b9wia9+QEqxwmxifL7kJTNV
 min37Z7ccjZxFHhLERq6EJdpsZvxMJYuEC4oR+iOe6R5iLMno3wPh40GT
 5hhqi/zIi7IKY6jFofp8vRZYn7ayWuAagSRGSuO3YLKoVm57Z0xONZ7O3 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zQ5XhRJAduA0h40vOxM+q+Bwy90N+iGZwqLY8JEmO7JH75CcWH+WXAj5tTGGv0Ph/hXN8myItf
 qSkCUQLOjLW/N/vL5JE0AJcdrmCsEJCcRTPP7cBGQvmxOSwicIsw9p5CvB5YOMrurI1ZVHZnaa
 GKWLMZ5LxOsiahQ/UG4zleHLR+9R+BVJVqG69uhY88+64rDzsptNbqa75pGYinRlATwFtfeks+
 HhlQLY/kgrhDDW4EIq03ZinCQhGZJWWbKishVAbmxjyxnAefOKs/mQsfqO5cSJyU7ep6eDJ9qq
 Jos=
X-SBRS: 2.7
X-MesageID: 5797203
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5797203"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-10-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <306e1287-3b1f-d916-45e8-14119737fafc@citrix.com>
Date: Thu, 19 Sep 2019 17:22:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916105945.93632-10-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 09/12] livepatch: Add support for modules
 .modinfo section metadata
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNi8xOSAxMTo1OSBBTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gSGF2aW5n
IGRldGFpbGVkIGhvdHBhdGNoIG1ldGFkYXRhIGhlbHBzIHRvIHByb3Blcmx5IGlkZW50aWZ5IG1v
ZHVsZSdzCj4gb3JpZ2luIGFuZCB2ZXJzaW9uLiBJdCBhbHNvIGFsbG93cyB0byBrZWVwIHRyYWNr
IG9mIHRoZSBoaXN0b3J5IG9mCj4gaG90cGF0Y2ggbG9hZHMgaW4gdGhlIHN5c3RlbSAoYXQgbGVh
c3Qgd2l0aGluIGRtZXNnIGJ1ZmZlciBzaXplCj4gbGltaXRzKS4KPiAKPiBUaGUgaG90cGF0Y2gg
bWV0YWRhdGEgYXJlIGVtYmVkZGVkIGluIGEgZm9ybSBvZiAubW9kaW5mbyBzZWN0aW9uLgo+IEVh
Y2ggc3VjaCBzZWN0aW9uIGNvbnRhaW5zIGRhdGEgb2YgdGhlIGZvbGxvd2luZyBmb3JtYXQ6Cj4g
a2V5PXZhbHVlXDBrZXk9dmFsdWVcMC4uLmtleT12YWx1ZVwwCj4gCj4gVGhlIC5tb2RpbmZvIHNl
Y3Rpb24gbWF5IGJlIGdlbmVyYXRlZCBhbmQgYXBwZW5kZWQgdG8gdGhlIHJlc3VsdGluZwo+IGhv
dHBhdGNoIEVMRiBmaWxlIG9wdGlvbmFsbHkgYXMgYW4gZXh0cmEgc3RlcCBvZiBhIGhpZ2hlciBs
ZXZlbAo+IGhvdHBhdGNoIGJ1aWxkIHN5c3RlbS4KPiAKPiBUaGUgbWV0YWRhdGEgc2VjdGlvbiBw
b2ludGVyIGFuZCB0aGUgc2VjdGlvbiBsZW5ndGggaXMgc3RvcmVkIGluIHRoZQo+IGhvdHBhdGNo
IHBheWxvYWQgc3RydWN0dXJlIGFuZCBpcyB1c2VkIHRvIGRpc3BsYXkgdGhlIGNvbnRlbnQgdXBv
bgo+IGhvdHBhdGNoIGFwcGx5IG9wZXJhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXdlbCBX
aWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJhLUly
aW5hIFBhcmFzY2hpdiA8YW5kcmFwcnNAYW1hem9uLmNvbT4KPiBSZXZpZXdlZC1ieTogQmpvZXJu
IERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogTGVvbmFyZCBGb2Vyc3Rl
ciA8Zm9lcnNsZW9AYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBNYXJ0aW4gUG9obGFjayA8bXBv
aGxhY2tAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5
QGFtYXpvbi5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJh
ZC53aWxrQG9yYWNsZS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJv
c3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
