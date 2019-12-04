Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E7112DC3
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 15:51:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icVxG-0005Y1-Vq; Wed, 04 Dec 2019 14:48:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ScHe=Z2=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1icVxE-0005Xw-NO
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 14:48:36 +0000
X-Inumbo-ID: 2606acd4-16a5-11ea-a0d2-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2606acd4-16a5-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575470915;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ih8a0JIGo8HoXSS0N2DtgHFNOyEoG6ptnYG6XVxFKgw=;
 b=W8HvjSQAnoT+XKoRZGQ+Bqd80EaN75ccBQjlHhZ4ZTS3ZfNOcMISyJEv
 tiBFRBOvM6dLSEmR0Hescx71rQKp4ByHR16N85HyNtx1gT1exH3YfzsDv
 97mJar7WeTzMFnSdCjDT46bgGd092KFmkmSLQv+7eMyH9syRQ8uM/bBt/ o=;
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
IronPort-SDR: RMoRjyqkvHEisD2/O9IYTLywM/sINCGJN6WfiZpTdXft3bDdFEESzsX04RCPoNP2qaUTmJciTW
 cQoOK0DnySgb3xxqLznQ2m3zqz6sRpS6ga89YwjD7JSfqxYVv+TBkiRjKifKvnDdthRoM1P8yq
 2EcwgBbmlYwbwkYGPDWMfIevUXr8p3L7ZnJ+8YKgroY2b4YzSuyfTcWfO/NdUr63mqKohw4XhA
 BU5VyUT+wpbVt4jZiS5ZEdMRuBXcC8OnQlGuzsMPlmqHvVZOCRA+Nv/NyqV5BcZ88Rm1DDwqr8
 71A=
X-SBRS: 2.7
X-MesageID: 9544086
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9544086"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20191203075709.107811-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <dc74c6aa-1d94-d962-bba9-a19119ac6287@citrix.com>
Date: Wed, 4 Dec 2019 14:48:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191203075709.107811-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH livepatch-build-tools] create-diff-object:
 Ignore .init sections
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
Cc: mpohlack@amazon.de, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMy8xOSA3OjU3IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBUaGUgLmlu
aXQgc2VjdGlvbnMgbXVzdCBub3QgYmUgY29uc2lkZXJlZCBmb3IgcGF0Y2hpbmcgcmVnYXJkbGVz
cyBvZgo+IHdoZXRoZXIgdGhleSBhcmUgQ0hBTkdFRCBvciBORVcuCj4gRXhwbGljaXRlbHkgZGV0
ZWN0IGFuZCBpZ25vcmUgYWxsIHN1Y2ggc2VjdGlvbnMsIGJlZm9yZSBtYXJraW5nCj4gaWdub3Jl
ZCBzZWN0aW9ucyBhcyBTQU1FLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3
aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3Nz
LmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
