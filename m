Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBBC8FF44
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 11:45:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyYlu-0002hZ-DV; Fri, 16 Aug 2019 09:43:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CMUz=WM=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hyYls-0002hP-Ol
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 09:43:44 +0000
X-Inumbo-ID: 559c8be0-c00a-11e9-b90c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 559c8be0-c00a-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 09:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565948623;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8cN4zhPnuJtjKulZPhHVaaUT4VFGPeYjzvx4ncgaIzI=;
 b=b96rWMvxFrTPqh55jptnWulcY9vpIFk3vSihgEHW8YCkQ+t0OU9ZJGq5
 bMVc+esvSIdRrk79oJWZ3K8Ora0gIXyEAt2wfbu0ytXdEte34qN0OH7vo
 O2aDDVtPIPDiyxiAw7JB44A1gneM4Fja0LU5YE2DAJ3Gzh+Lp1IX3cmuM 0=;
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
IronPort-SDR: 1wjgOptIaa0qMj9+sivQlVwXjfyRiuQ52NwFywfCxsIyocRkefPK4b0rpnUGK1fDTJgScoRNPr
 GDUo3I6P57WEG0zE3EKaXbBtNny6WDydR6ha3wDJub6AVzXDKoNM0Qu3S4UueMAQ7AM4hHxByk
 aeaH1Ow9WKZ/ZV+kARdei23/LlvOsCYjwByDdGu1quYBSHtGGS4hLoYRgBfB0Hdf3z3sKM+D2t
 eD7iBMCb+mGS5KpadC2f2iD5Nen9+diJ3TIQb3CfQZWtYvbj37fWXJnM6LAC6lEma1wDYt2cjC
 taE=
X-SBRS: 2.7
X-MesageID: 4343809
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,391,1559534400"; 
   d="scan'208";a="4343809"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190416120716.26269-2-wipawel@amazon.de>
 <20190807114907.74530-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <1c58d8d4-a6ce-764f-2d60-23824884768e@citrix.com>
Date: Fri, 16 Aug 2019 10:43:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190807114907.74530-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 v2 2/6] common: Add
 is_referenced_section() helper function
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC83LzE5IDEyOjQ5IFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBUaGlzIGZ1
bmN0aW9uIGNoZWNrcyBpZiBnaXZlbiBzZWN0aW9uIGhhcyBhbiBpbmNsdWRlZCBjb3JyZXNwb25k
aW5nCj4gUkVMQSBzZWN0aW9uIGFuZC9vciBhbnkgb2YgdGhlIHN5bWJvbHMgdGFibGUgc3ltYm9s
cyByZWZlcmVuY2VzIHRoZQo+IHNlY3Rpb24uIFNlY3Rpb24gYXNzb2NpYXRlZCBzeW1ib2xzIGFy
ZSBpZ25vcmVkIGhlcmUgYXMgdGhlcmUgaXMKPiBhbHdheXMgc3VjaCBhIHN5bWJvbCBmb3IgZXZl
cnkgc2VjdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lw
YXdlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5k
cmFwcnNAYW1hem9uLmNvbT4KPiBSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFt
YXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24u
ZGU+Cj4gLS0tCgpSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
