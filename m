Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A6B994C8
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 15:20:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0myM-00018S-0i; Thu, 22 Aug 2019 13:17:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D95g=WS=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1i0myK-00018N-Kd
 for xen-devel@lists.xen.org; Thu, 22 Aug 2019 13:17:48 +0000
X-Inumbo-ID: 3bacbb5e-c4df-11e9-add7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bacbb5e-c4df-11e9-add7-12813bfff9fa;
 Thu, 22 Aug 2019 13:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566479867;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ls5eS1FFuk3dexc2K0sTiBrY84iGU94MxEio62xqErE=;
 b=EEqRel6RuVg+u1Uvxdss2LrX+9YeozIUJW7R6R5RKvHQcDsg2l9UbOB/
 LVnh6H7XLQ93CLx68KkMmv1S9oqLhKCDjOHgoQcO2JGxvZLcjlk9wu8ZQ
 cizNskI0+8iaEqkUINq7S/rm4If/3FNiAXxFW5kqWXj5C/ZQNSs+myTB7 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RKIBQ9XDmYSf9e5Ze2fZUCKpqOzBEwi8zqKV5z9CoDYJSpjtda9TV6tt0pRKVT0ncfJ9hKBT6c
 KyOz6VSQM4VfB1ogS+NLSawEhwOI6L1MJ+GhOZH/nLe9VbRMpGC4DWPG+0KHV46uzpuIW3AxaI
 +Ct19kmkRW90kzhqQpzgOLG7JUnZW2uk6WMCOZKWWCKkcPJJVo3XBTTUDudpMyNQSGtZPKrR/A
 lzp6heeBYoW5BaMxIQ9qPyAZMIaZECYDaGNUJi7dk1IzK6o2shr/C1j/S3oxHYOf5EJWDE7wZG
 j48=
X-SBRS: 2.7
X-MesageID: 4767385
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4767385"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190821082056.91090-1-wipawel@amazon.de>
 <20190821082056.91090-11-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <6701ac1e-59d6-fb43-1387-76d61027c600@citrix.com>
Date: Thu, 22 Aug 2019 14:17:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821082056.91090-11-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 10/20] create-diff-object: Do not include
 all .rodata sections
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

T24gOC8yMS8xOSA5OjIwIEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBPbGRlciB2
ZXJzaW9ucyBvZiBHQ0MgZGlkIG5vdCBzcGxpdCAucm9kYXRhLnN0ciBzZWN0aW9ucyBieSBmdW5j
dGlvbi4KPiBCZWNhdXNlIG9mIHRoYXQsIHRoZSBlbnRpcmUgc2VjdGlvbiB3YXMgYWx3YXlzIGlu
Y2x1ZGVkLgo+IFRoZSBsaXZlcGF0Y2gtYnVpbGQtdG9vbHMgY29tbWl0IFsxXSBmaXhlZCBwYXRj
aCBjcmVhdGlvbiBhbmQga2VwdAo+IGluY2x1ZGluZyBhbGwgLnJvZGF0YS5zdHIgc2VjdGlvbnMs
IGluIG9yZGVyIHRvIG1haW50YWluIGV4aXN0aW5nCj4gYmVoYXZpb3IgZm9yIEdDQyA2LjErLgo+
IFRoaXMgbWVhbnMgYWxsIC5yb2RhdGEuc3RyIHNlY3Rpb25zIGFyZSBhbHdheXMgaW5jbHVkZWQg
YnkgZGVmYXVsdCwKPiByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhleSBhcmUgbmVlZGVkIG9yIG5v
dC4KPiAKPiBEdXJpbmcgc3RhY2tlZCBob3RwYXRjaCBidWlsZHMgaXQgbGVhZHMgdG8gdW5uZWNl
c3NhcnkgYWNjdW11bGF0aW9uIG9mCj4gdGhlIC5yb2RhdGEuc3RyIHNlY3Rpb25zIGFzIGVhY2gg
YW5kIGV2ZXJ5IGNvbnNlY3V0aXZlIGhvdHBhdGNoIG1vZHVsZQo+IGNvbnRhaW5zIGFsbCB0aGUg
LnJvZGF0YS5zdHIgc2VjdGlvbnMgb2YgcHJldmlvdXMgbW9kdWxlcy4KPiAKPiBUbyBwcmV2ZW50
IHRoaXMgc2l0dWF0aW9uLCBtYXJrIHRoZSAucm9kYXRhLnN0ciBzZWN0aW9ucyBmb3IgaW5jbHVz
aW9uCj4gb25seSBpZiB0aGV5IGFyZSByZWZlcmVuY2VkIGJ5IGFueSBvZiB0aGUgY3VycmVudCBo
b3RwYXRjaCBzeW1ib2xzIChvcgo+IGEgY29ycmVzcG9uZGluZyBSRUxBIHNlY3Rpb24pLgo+IAo+
IEV4dGVuZCBwYXRjaGFiaWxpdHkgdmVyaWZpY2F0aW9uIHRvIGRldGVjdCBhbGwgbm9uLXN0YW5k
YXJkLCBub24tcmVsYSwKPiBub24tZGVidWcgYW5kIG5vbi1zcGVjaWFsIHNlY3Rpb25zIHRoYXQg
YXJlIG5vdCByZWZlcmVuY2VkIGJ5IGFueSBvZgo+IHRoZSBzeW1ib2xzIG9yIFJFTEEgc2VjdGlv
bnMuCj4gCj4gUmVuYW1lIHNob3VsZF9pbmNsdWRlX3N0cl9zZWN0aW9uKCkgdG8gaXNfcm9kYXRh
X3N0cl9zZWN0aW9uKCkuCj4gCj4gWzFdIDJhZjZmMWFhNjIzMyBGaXggcGF0Y2ggY3JlYXRpb24g
d2l0aCBHQ0MgNi4xKwo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3
aXBhd2VsQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxh
bmRyYXByc0BhbWF6b24uY29tPgo+IFJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxA
YW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpv
bi5kZT4KPiAtLS0KClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxA
Y2l0cml4LmNvbT4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
