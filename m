Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60C6903E9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 16:23:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyd58-0005kn-JY; Fri, 16 Aug 2019 14:19:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CMUz=WM=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hyd57-0005ki-0m
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 14:19:53 +0000
X-Inumbo-ID: e84db33a-c030-11e9-a661-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e84db33a-c030-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565965191;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ua/UAS2LWH7BBek95h6Fa6Om9voVZOt023anZAEvbHI=;
 b=AMyo/2yBknQ41lE4IGE/YicGRyWAb2xzR9835xmSbb8miVQqVbXUzLpy
 ScZAojsPYoIXv51g6GQEgxM8r5I1943DmYeiRkv83VBgQc9oxdAroQgNX
 8VGq7F7MJtl/z72xzphgowGuemFe+Tg2NCCnuh7Cjikr0Jwl+5NFJRzQh U=;
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
IronPort-SDR: 1C0XmSjIvxD2xTAHbsyzRM3lLaIKShYRED0OXqkmdc66+BZYU9frypSuEwPb4AuCMQiNuy7QUB
 Jg+aHNebkPQQ0PnT5ywDIs2710wVh8Juk7J8wVFBhtULQbeSap6ao2HUbD0lcFa0dAezxs950u
 bJ2EWLEu0lGF/DHaaXHzw5gIKykuFRL0O/Wxi6unIlnjjKc2lThllNYCpL62IYtFK4VSzSh6Uh
 X3+M/6csZHOYJ7eWYZMHR/NB+e0xEj060iEghXcrPrM5jxf/N4Hr0zAYgAA/Pt+JCoFM8c4OYi
 t94=
X-SBRS: 2.7
X-MesageID: 4353805
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,393,1559534400"; 
   d="scan'208";a="4353805"
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190416120716.26269-5-wipawel@amazon.de>
 <20190808123527.8340-1-wipawel@amazon.de>
 <937a221e-138a-8431-e586-9c722c595f9c@citrix.com>
 <14B5F9B0-29BC-497B-B4CC-AF76D63946C9@amazon.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <0c7f68d9-9638-1960-e13f-c98c5deda71b@citrix.com>
Date: Fri, 16 Aug 2019 15:19:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <14B5F9B0-29BC-497B-B4CC-AF76D63946C9@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 v2 5/6]
 create-diff-object: Add new entries to special sections array array
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
Cc: "Pohlack, Martin" <mpohlack@amazon.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel <xen-devel@lists.xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNi8xOSAxOjA2IFBNLCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4gCj4+IE9u
IDE2LiBBdWcgMjAxOSwgYXQgMTE6NDAsIFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBj
aXRyaXguY29tIAo+PiA8bWFpbHRvOnJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+PiB3cm90ZToK
Pj4KPj4gT24gOC84LzE5IDE6MzUgUE0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+Pj4K
PiAKPiDigKZzbmlwLi4uCj4gCj4+PiDCoMKgKiBUaGUgcmVsYSBncm91cHMgaW4gdGhlIC5maXh1
cCBzZWN0aW9uIHZhcnkgaW4gc2l6ZS4gwqBUaGUgCj4+PiBiZWdpbm5pbmcgb2YgZWFjaAo+Pj4g
wqDCoCogLmZpeHVwIHJlbGEgZ3JvdXAgaXMgcmVmZXJlbmNlZCBieSB0aGUgLmV4X3RhYmxlIHNl
Y3Rpb24uIFRvIGZpbmQgCj4+PiB0aGUgc2l6ZQo+Pj4gQEAgLTEwNzIsNiArMTA5MCwxOCBAQCBz
dGF0aWMgc3RydWN0IHNwZWNpYWxfc2VjdGlvbiAKPj4+IHNwZWNpYWxfc2VjdGlvbnNbXSA9IHsK
Pj4+IC5uYW1lPSAiLmFsdGluc3RydWN0aW9ucyIsCj4+PiAuZ3JvdXBfc2l6ZT0gYWx0aW5zdHJ1
Y3Rpb25zX2dyb3VwX3NpemUsCj4+PiB9LAo+Pj4gK3sKPj4+ICsubmFtZT0gIi5hbHRpbnN0cl9y
ZXBsYWNlbWVudCIsCj4+PiArLmdyb3VwX3NpemU9IHVuZGVmaW5lZF9ncm91cF9zaXplLAo+Pj4g
K30sCj4+PiArewo+Pj4gKy5uYW1lPSAiLmxpdmVwYXRjaC5ob29rcy5sb2FkIiwKPj4+ICsuZ3Jv
dXBfc2l6ZT0gbGl2ZXBhdGNoX2hvb2tzX2dyb3VwX3NpemUsCj4+PiArfSwKPj4+ICt7Cj4+PiAr
Lm5hbWU9ICIubGl2ZXBhdGNoLmhvb2tzLnVubG9hZCIsCj4+PiArLmdyb3VwX3NpemU9IGxpdmVw
YXRjaF9ob29rc19ncm91cF9zaXplLAo+Pj4gK30sCj4+PiB7fSwKPj4+IMKgfTsKPj4+Cj4+Cj4+
IFVubGVzcyBJJ20gbWlzdW5kZXJzdGFuZGluZyBzb21ldGhpbmcsIEkgY2FuJ3Qgc2VlIGhvdyAK
Pj4ga3BhdGNoX3JlZ2VuZXJhdGVfc3BlY2lhbF9zZWN0aW9uIHdvdWxkIHdvcmsgd2l0aCAKPj4g
LmFsdGluc3RyX3JlcGxhY2VtZW50IGhhdmluZyBhIGdyb3VwIHNpemUgb2YgMC4gSXQgbG9va3Mg
dG8gbWUgbGlrZSAKPj4gdGhlIGZvciBsb29wIGluIHRoYXQgZnVuY3Rpb24gd291bGQgYmVjb21l
IGFuIGluZmluaXRlIGxvb3AgKGR1ZSB0byAKPj4gaW5jcmVtZW50aW5nIGJ5IGdyb3VwX3NpemUp
IGFuZCBzaG91bGRfa2VlcF9yZWxhX2dyb3VwIHdvdWxkIGFsd2F5cyAKPj4gcmV0dXJuIGZhbHNl
Lgo+Pgo+IAo+IEFGQUlDUywgdGhlIGdyb3VwX3NpemUgMCBzZWN0aW9ucyBhcmUgbmV2ZXIgYWN0
dWFsbHkgcHJvY2Vzc2VkIGJ5IHRoZSAKPiBrcGF0Y2hfcmVnZW5lcmF0ZV9zcGVjaWFsX3NlY3Rp
b24oKS4KPiBUaGV5IGFyZSBub3QgUkVMQSBzZWN0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBjaGVj
ayBleGNsdWRlcyB0aGVtIGZyb20gCj4gdGhpcyBwcm9jZXNzaW5nOgo+IApPSywgdGhhdCBtYWtl
cyBzZW5zZS4KClRoYW5rcywKLS0gClJvc3MgTGFnZXJ3YWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
