Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAEC92737
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 16:42:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzinr-0008Ow-5U; Mon, 19 Aug 2019 14:38:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qYle=WP=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hzinp-0008Oq-U3
 for xen-devel@lists.xen.org; Mon, 19 Aug 2019 14:38:33 +0000
X-Inumbo-ID: 03680c5a-c28f-11e9-8bee-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03680c5a-c28f-11e9-8bee-12813bfff9fa;
 Mon, 19 Aug 2019 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566225511;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5ZtoU8dvimXaogqgraTOthP2gWZ+znHimbGpdHXfOEY=;
 b=P2cb/BY5LWZWHy7K/U5s06rAvWydgP7F2FhKQ957v9B2OLe53F+HXkHH
 zqEvep+E/7CSynLmgu1651+rbCuWvwrxmovvNlySjCzirYSk8W35KtvEi
 2mbQuoMQryvAs5UFZ9mywg6EvR7BBlHJyg1Y26vZW6n5l/M1h7M3XsZbU Y=;
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
IronPort-SDR: QsB0Aq5TdJ7MtwhA77pm+R3YzsmDq+mQvzCWUYs5jnO7SziY+IuPhKxzUKvfa0g49cwLlSqKEU
 j+NdzLjq/gcOBZaMws3qPG7GsMGiZw7+YWLNRUZABaX5aAB1Hx4dSd19O3XLpIiqQJYYpDWo06
 us7xNErpSRfIS9KtfHHsMYp7khCKbmmGqy8gTbMd6ZBiQADzLw2iUKTiXZyBtbkxeIbfRVkyUd
 JjVJPeDU4p1xQ4tKEe83XYmeV3elibuZ13YDdG/e2jht2EjJcQYOLwl0JbRskY7ojunO2EVfZf
 zhU=
X-SBRS: 2.7
X-MesageID: 4634238
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,405,1559534400"; 
   d="scan'208";a="4634238"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190814075724.83645-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <bea511f0-57bc-5eca-5a37-ccf4efebfa0a@citrix.com>
Date: Mon, 19 Aug 2019 15:38:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190814075724.83645-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-hooks-1 PATCH 2/3] livepatch: Export
 payload structure via livepatch_payload.h
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

T24gOC8xNC8xOSA4OjU3IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBUaGUgcGF5
bG9hZCBzdHJ1Y3R1cmUgd2lsbCBiZSB1c2VkIGJ5IHRoZSBuZXcgaG9va3MgaW1wbGVtZW50YXRp
b24gYW5kCj4gdGhlcmVmb3JlIGl0cyBkZWZpbml0aW9uIGhhcyB0byBiZSBleHBvcnRlZCB2aWEg
dGhlIGxpdmVwYXRjaF9wYXlsb2FkCj4gaGVhZGVyLgo+IFRoZSBuZXcgaG9va3Mgd2lsbCBtYWtl
IHVzZSBvZiB0aGUgcGF5bG9hZCBzdHJ1Y3R1cmUgZmllbGRzIGFuZCB0aGUKPiBob29rcycgcG9p
bnRlcnMgd2lsbCBhbHNvIGJlIGRlZmluZWQgaW4gdGhlIHBheWxvYWQgc3RydWN0dXJlLCBzbwo+
IHRoZSBzdHJ1Y3R1cmUgYWxvbmcgd2l0aCBhbGwgZmllbGQgZGVmaW5pdGlvbnMgbmVlZHMgdG8g
YmUgYXZhaWxhYmxlCj4gdG8gdGhlIGNvZGUgYmVpbmcgcGF0Y2hlZCBpbi4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4gUmV2aWV3
ZWQtYnk6IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5kcmFwcnNAYW1hem9uLmNvbT4KPiBSZXZp
ZXdlZC1ieTogRXNsYW0gRWxuaWtldHkgPGVsbmlrZXR5QGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1i
eTogTGVvbmFyZCBGb2Vyc3RlciA8Zm9lcnNsZW9AYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBN
YXJ0aW4gUG9obGFjayA8bXBvaGxhY2tAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogUm9zcyBMYWdl
cndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
