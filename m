Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B4B8E0C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 11:51:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBFWj-00042e-C2; Fri, 20 Sep 2019 09:48:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tu7L=XP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iBFWh-00041s-FQ
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 09:48:31 +0000
X-Inumbo-ID: cd030d67-db8b-11e9-9687-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd030d67-db8b-11e9-9687-12813bfff9fa;
 Fri, 20 Sep 2019 09:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568972911;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6mVBnAlNlFqnwpqpi7RQPJ2jHNfA7pI9VRHRkWkS/Hc=;
 b=Wp11750qStZFvIWXTL6kAtjK7+NMen6099jGerWA4Phfi/B1sqxm1qS4
 ojREgw38fuUUKoDc56LgxXXcZSNzlrOtOVJgopSkTRx+EnA9EIf7hGzdc
 FSoENvMPdB6YFilxX8J0Q5YF6uTztu6v7nlz2GJD8Lqf/EFbr7Z1LRbej o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3ESEhlG2ZdvyBqJhrWXqK7fIvIlHaTlT6SP2C+QbnIMWP3s6PbYywP0H31BdLl+AUcM1WYOC3C
 ScZn2nz1LKcQpLD6tJPZZeZTgD0IwxZRoJj/B4TWRndM2hjTkyVdt4VWTxE0aE7bP3rp555yqR
 /gf6NDWCnSvxAwc5oAhw5pu9G9c2LSaSqaztsztM6vxTsF/51sciAi1ksMo2O3/n2Oqq7UDAZX
 qsJRy0DQi8Qi2PftPKkxuMPTN9tmoJT7LBKmrq3Zah7AsGlni3hgy/l6Yt15gPT6U8atXgRiXx
 qsM=
X-SBRS: 2.7
X-MesageID: 5841024
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,528,1559534400"; 
   d="scan'208";a="5841024"
Date: Fri, 20 Sep 2019 10:48:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190920094818.GW1308@perard.uk.xensource.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
 <20190919171656.899649-33-anthony.perard@citrix.com>
 <23939.54359.383717.347600@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23939.54359.383717.347600@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v2 00/35] libxl refactoring to use ev_qmp
 (with API changes) [and 1 more messages]
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDg6MTc6NDNQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYyIDAwLzM1XSBsaWJ4bCByZWZh
Y3RvcmluZyB0byB1c2UgZXZfcW1wICh3aXRoIEFQSSBjaGFuZ2VzKSIpOgo+ID4gUGF0Y2hlcyB3
aXRoIG1pc3NpbmcgYWNrZXM6Cj4gLi4uCj4gPiAgICAgbGlieGw6IFVzZSBldl9xbXAgaW4gbGli
eGxfc2V0X3ZjcHVvbmxpbmUKPiAKPiBGcm9tIG15IHBvaW50IG9mIHZpZXcgSSBzZWVtIHRvIGhh
dmUgc2VudCBhIGFjayBmb3IgdGhpcywKPiAKPiAgICBNZXNzYWdlLUlEOiA8MjM5MzcuNjg0Mi40
MjY4NTcuODAwODY2QG1hcmluZXIudWsueGVuc291cmNlLmNvbT4KPiAgICBJbi1SZXBseS1Ubzog
PDIwMTkwODAyMTUzNjA2LjMyMDYxLTMzLWFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gICAg
UmVmZXJlbmNlczogPDIwMTkwODAyMTUzNjA2LjMyMDYxLTEtYW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KPiAgICAgICAgICAgIDwyMDE5MDgwMjE1MzYwNi4zMjA2MS0zMy1hbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPgo+ICAgIEZyb206IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXgu
Y29tPgo+ICAgIFRvOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
PiAgICBDYzogInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIgPHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4sCj4gICAgICAgIFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gICAgU3Vi
amVjdDogUmU6IFtQQVRDSCAzMi8zNV0gbGlieGw6IFVzZSBldl9xbXAgaW4gbGlieGxfc2V0X3Zj
cHVvbmxpbmUKPiAgICBEYXRlOiBUdWUsIDE3IFNlcCAyMDE5IDE4OjQxOjE0ICswMTAwCj4gCj4g
PyAgSSBob3BlIGl0J3Mgbm90IG1haWwgZ29pbmcgbWlzc2luZyBhZ2Fpbi4uLgoKSSBkaWRuJ3Qg
Y2FycnkgdGhlIGFja3MgYmVjYXVzZSBJJ3ZlIHNxdWFzaGVkIGEgcGF0Y2ggaW50byB0aGlzIG9u
ZSBhbmQKSSd2ZSBjaGFuZ2UgdGhlIGNvbW1pdCBtZXNzYWdlIChhZGRpbmcgYW4gZXh0cmEgcGFy
YWdyYXBoIHRvIHJlZmxlY3QgdGhlCnNxdWFzaGVkIGNvbW1pdCkuCgotLSAKQW50aG9ueSBQRVJB
UkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
