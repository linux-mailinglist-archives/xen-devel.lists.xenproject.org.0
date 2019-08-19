Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFE89275C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 16:46:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzis5-0000mP-OG; Mon, 19 Aug 2019 14:42:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qYle=WP=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hzis4-0000mJ-B5
 for xen-devel@lists.xen.org; Mon, 19 Aug 2019 14:42:56 +0000
X-Inumbo-ID: a0cbc07c-c28f-11e9-b90c-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0cbc07c-c28f-11e9-b90c-bc764e2007e4;
 Mon, 19 Aug 2019 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566225775;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=a0TnvwDVspLPRR5WEeHiB4d/UESVhgT/WZ6baOWBxe8=;
 b=TlroFee6690SYlC7XnCx83GwCTujCNceP+8FMsSPu45dtY8lA+ZMMy5w
 0ogapZa+oo9URExwVCqs51EM/FpdR1wREBPXFoYpprvPd+U5tQ8rm8aOI
 Kr2GPWkwBR6Gqcezuish6HVifw6Q0M732g7NEuJ12kt0w6PyKsrwJ/hEa Q=;
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
IronPort-SDR: 2NKMfOIscim0/Qj38eHhIEj1wxktxr9HWRLCTPo1EGu8d4NyVBdarL8xp9IgwvjrVpQmpiwWL+
 eks+B1Gu0laMNlZLFALio8WP+RZq/mhBqyl7jDXmLJHKLjhwGRFN5ydxGcmw18z4+iDnbFwY6m
 /pQTZ8NR/3h03R/0rux/2pzZMOawzTUO5NJCJahbwp5HPtaHBTM6mMYgTeyl+yljkF3PRUwSy5
 wc7SGLPN+4pZqQ7qdngunJH+K4efAPrF/GbICLHjvgiQ9v6FkW7LziaRFxtS9S5eCV9TVNIhNN
 CnU=
X-SBRS: 2.7
X-MesageID: 4634497
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,405,1559534400"; 
   d="scan'208";a="4634497"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190814122305.20176-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <d5cba6b9-9517-be58-b4bf-5917245883eb@citrix.com>
Date: Mon, 19 Aug 2019 15:42:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190814122305.20176-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH livepatch-hooks-4 1/1] livepatch: always
 print XENLOG_ERR information
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

T24gOC8xNC8xOSAxOjIzIFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBBIGxvdCBv
ZiBsZWdpdGltYXRlIGVycm9yIG1lc3NhZ2VzIHdlcmUgaGlkZGVuIGJlaGluZCBkZWJ1ZyBwcmlu
dGsKPiBvbmx5LiBNb3N0IG9mIHRoZXNlIG1lc3NhZ2VzIGNhbiBiZSB0cmlnZ2VyZWQgYnkgbG9h
ZGluZyBhIG1hbGZvcm1lZAo+IGhvdHBhdGNoIHBheWxvYWQgYW5kIGFyZSBwcmljZWxlc3MgZm9y
IHVuZGVyc3RhbmRpbmcgaXNzdWVzIHdpdGggc3VjaAo+IHBheWxvYWRzLgo+IFRodXMsIGFsd2F5
cyBkaXNwbGF5IGFsbCByZWxldmFudCBYRU5MT0dfRVJSIG1lc3NhZ2VzLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KPiBSZXZpZXdl
ZC1ieTogQW1pdCBTaGFoIDxhYW1zQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogTWFydGluIE1h
emVpbiA8YW1hemVpbkBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRv
ZWJlbEBhbWF6b24uZGU+Cj4gLS0tClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5s
YWdlcndhbGxAY2l0cml4LmNvbT4KClRoaXMgY2hhbmdlcyBpcyBtdWNoLW5lZWRlZC4KClRoYW5r
cywKUm9zcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
