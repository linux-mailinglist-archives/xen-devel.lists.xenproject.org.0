Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C062AEE89
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 17:31:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7i3k-0003f7-9Z; Tue, 10 Sep 2019 15:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w7W/=XF=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1i7i3i-0003eu-54
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 15:27:58 +0000
X-Inumbo-ID: 90b79420-d3df-11e9-978d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90b79420-d3df-11e9-978d-bc764e2007e4;
 Tue, 10 Sep 2019 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568129277;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ePH+0HODURke10adotV6zVfszmbpvpN6me/SG1BalkM=;
 b=VJ0grsm8xmS0iLjQ6T2gobc+7+VLD1chnhGIDumPgRxPg1rtVWSp2sSS
 B9bzVhpR/rWMCVoOl3FY5lSDtX/zzdDEf6nFJnNSvh3Pa8yHDJJB7QpOm
 IxIGD1LQzEKbem3CL6PR++RzWXz/Lgyt1WkECNPlo1Wfc2wVcunLJMxcB Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FIJ89Y5I7LEpRhmWzp6nI6dRN8iWlFB6csKl2oeaygvdDcbWlzOOledSfh1Kk95BHDGpEc8fiu
 yeIt2hrhHZYSLwxoNknomfcS4Co8pm1wELjrhSqOlgYpnw+wgWNbt1ltvy2GCsDcmuIe8r9te4
 8qrWultHu++X1Mu/CQNluYUtaM0FFPfTLXVexEgGn8w2jt05TsNFHLmMxGEVFjV9YQigKNChJB
 dXoFHXLTKgeMmOesbGD+lQNg5QTj2PUyPkt0b3VSFjHphboZXB74gq7DfFe8t+0CpG9kkPZzeA
 v8A=
X-SBRS: 2.7
X-MesageID: 5621514
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5621514"
From: Christian Lindig <christian.lindig@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v4 1/2] sysctl/libxl: choose a sane default for HAP
Thread-Index: AQHVZ+wOGjXUkDZgYUK6t3ZcWVjv/qck5z8A
Date: Tue, 10 Sep 2019 15:27:52 +0000
Message-ID: <6462E530-B412-458E-87DA-A6BFAACC3D41@citrix.com>
References: <20190910152538.36921-1-roger.pau@citrix.com>
In-Reply-To: <20190910152538.36921-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <4350F6A421ED374E929AB6F876BE6C79@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 1/2] sysctl/libxl: choose a sane default
 for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, David Scott <dave@recoil.org>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDEwIFNlcCAyMDE5LCBhdCAxNjoyNSwgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMv
eGVuY3RybC5tbCBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbAo+IGluZGV4IGU1NDRl
Zjg0ZGEuLmE1ZTc3Yzk0M2EgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5j
dHJsLm1sCj4gKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sCj4gQEAgLTEwNyw2
ICsxMDcsNyBAQCB0eXBlIHBoeXNpbmZvX2NhcF9mbGFnID0KPiAJfCBDQVBfSFZNCj4gCXwgQ0FQ
X1BWCj4gCXwgQ0FQX0RpcmVjdElPCj4gKwl8IENBUF9oYXAKPiAKPiB0eXBlIHBoeXNpbmZvID0K
PiB7Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkgYi90b29s
cy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpCj4gaW5kZXggNWEzNTAwMDc2MS4uZTkyMjU2NjU0
YiAxMDA2NDQKPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpCj4gKysrIGIv
dG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQo+IEBAIC05Miw2ICs5Miw3IEBAIHR5cGUg
cGh5c2luZm9fY2FwX2ZsYWcgPQo+ICAgfCBDQVBfSFZNCj4gICB8IENBUF9QVgo+ICAgfCBDQVBf
RGlyZWN0SU8KPiArICB8IENBUF9oYXAKCkFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJp
c3RpYW4ubGluZGlnQGNpdHJpeC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
