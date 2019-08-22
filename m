Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6C994CA
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 15:20:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0myX-0001AD-JS; Thu, 22 Aug 2019 13:18:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D95g=WS=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1i0myW-00019r-20
 for xen-devel@lists.xen.org; Thu, 22 Aug 2019 13:18:00 +0000
X-Inumbo-ID: 42a6adde-c4df-11e9-8980-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42a6adde-c4df-11e9-8980-bc764e2007e4;
 Thu, 22 Aug 2019 13:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566479879;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cLq7znEFELt3OO2MDuTxAS7VviDRlmn7i7N5QoFZk80=;
 b=LiFon1LNz/xoP0wUqZiSxTIyr8nPp2OEcWj0haz6C30hrC25UmSLEzSj
 1BeKxv3l6na6hwXLnlXKNKWQlQKfOqhCZabOJfSCGudj4YfXDCHcRJCi0
 Kv5DgB6S6GnifnK0mZ6yAmXO2y+ZAFjDpEV8LDPs2CWLL/RJEu+vHJv23 A=;
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
IronPort-SDR: bek4eZ6VBSHhUWNvkHzX6D5jc8Ij4jRjdZZj1fxPPnmf83WXavAZ4pvsGBkyoFFMhDEw7+BzzC
 ahwp79ui3nJE46IBaoAFv1FDKtj7FsrFGtbJzufR/mJcbKW1s4FzZgi/DF9/nIeQHZvMnwsL5f
 naedi5gP8tPbwmJYAJZkhQQk2x+9CRk93+ne1Ltjpvmm47qZKH1+0ZjLhoCo7QpVXcvCZ6Jkph
 a9pWaxgf7TbvyrmiT0490jABlqpOLZBinYRlK905rrf2KbBhKDTSOHelzZG44D5z0ji/zdRm+O
 iaA=
X-SBRS: 2.7
X-MesageID: 4836244
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4836244"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190821082056.91090-1-wipawel@amazon.de>
 <20190821082056.91090-12-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <240619df-1d48-aacd-e8fa-5df4ea30ef6d@citrix.com>
Date: Thu, 22 Aug 2019 14:17:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821082056.91090-12-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 11/20] create-diff-object: Do not create
 empty .livepatch.funcs section
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

T24gOC8yMS8xOSA5OjIwIEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBXaGVuIHRo
ZXJlIGlzIG5vIGNoYW5nZWQgZnVuY3Rpb24gaW4gdGhlIGdlbmVyYXRlZCBwYXlsb2FkLCBkbyBu
b3QKPiBjcmVhdGUgYW4gZW1wdHkgLmxpdmVwYXRjaC5mdW5jcyBzZWN0aW9uLiBIeXBlcnZpc29y
IGNvZGUgY29uc2lkZXJzCj4gc3VjaCBwYXlsb2FkcyBhcyBicm9rZW4gYW5kIHJlamVjdHMgdG8g
bG9hZCB0aGVtLgo+IAo+IFN1Y2ggcGF5bG9hZHMgd2l0aG91dCBhbnkgY2hhbmdlZCBmdW5jdGlv
bnMgbWF5IGFwcGVhciB3aGVuIG9ubHkKPiBob29rcyBhcmUgc3BlY2lmaWVkLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KPiBSZXZp
ZXdlZC1ieTogTWFydGluIE1hemVpbiA8YW1hemVpbkBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6
IE1hcnRpbiBQb2hsYWNrIDxtcG9obGFja0BhbWF6b24uZGU+Cj4gLS0tCj4gICBjcmVhdGUtZGlm
Zi1vYmplY3QuYyB8IDUgKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykK
PiAKClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNv
bT4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
