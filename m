Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7071974B3A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqafE-0007Y6-GW; Thu, 25 Jul 2019 10:07:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqafD-0007Y0-GS
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:07:55 +0000
X-Inumbo-ID: 112a1791-aec4-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 112a1791-aec4-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 10:07:54 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XRdN8PqSFbs4eNOsz64wgcNQS8RS/vI+9kCSottWDtRHqBWh2heNI8R7vCdOufNel6xTimswoM
 dQn+XsJXr+T3NzrCYW1CABPHIteufv7u1OUVpVUWGD+N3DfKHrL+amNlzAe36nVVD11LlD3f8N
 Qb01xPVJyiEnuMk0YcWKxG3UcbpLHqvTe+87d32OKFwobc/wGlb5cTL552tALmuR+axfPhf7cc
 pOGj7J7m2IdDZefU9TZBW25hZMEp7J23brPcKJC56FydNj3L7AkkZqvNkYLJbMdtXQSf2K3VO4
 iZ4=
X-SBRS: 2.7
X-MesageID: 3430974
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3430974"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH 3/6] x86/hvm/domain: remove the 'hap_enabled' flag
Thread-Index: AQHVQXCNXhv9G8acKEKtv9HbpWg4LKba9qgAgAAn+eA=
Date: Thu, 25 Jul 2019 10:07:49 +0000
Message-ID: <6bed666c7c604fada293b3d650c8f643@AMSPEX02CL03.citrite.net>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
 <20190723160609.2177-4-paul.durrant@citrix.com>
 <20190725094420.g2wv7cur7xfoat5t@Air-de-Roger>
In-Reply-To: <20190725094420.g2wv7cur7xfoat5t@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/6] x86/hvm/domain: remove the
 'hap_enabled' flag
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMjUgSnVseSAyMDE5IDEwOjQ0Cj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENv
b3Blcgo+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4K
PiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNl0geDg2L2h2bS9kb21haW46IHJlbW92ZSB0aGUgJ2hh
cF9lbmFibGVkJyBmbGFnCj4gCj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDU6MDY6MDZQTSAr
MDEwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4gLSNpZmRlZiBDT05GSUdfSFZNCj4gPiAtI2Rl
ZmluZSBoYXBfZW5hYmxlZChkKSAgKGlzX2h2bV9kb21haW4oZCkgJiYgKGQpLT5hcmNoLmh2bS5o
YXBfZW5hYmxlZCkKPiA+IC0jZWxzZQo+ID4gLSNkZWZpbmUgaGFwX2VuYWJsZWQoZCkgICh7KHZv
aWQpKGQpOyBmYWxzZTt9KQo+ID4gLSNlbmRpZgo+ID4gKyNkZWZpbmUgaGFwX2VuYWJsZWQoZCkg
XAo+ID4gKyAgICAoaHZtX2hhcF9zdXBwb3J0ZWQoKSAmJiBpc19odm1fZG9tYWluKGQpICYmIFwK
PiA+ICsgICAgIGV2YWx1YXRlX25vc3BlYyhkLT5jcmVhdGVmbGFncyAmIFhFTl9ET01DVExfQ0RG
X2hhcCkpCj4gCj4gWW91IGNvdWxkIG1ha2UgdGhpcyBhbiBpbmxpbmUgZnVuY3Rpb24gd2hpbGUg
YXQgaXQgQUZBSUNULgoKWWVhaCwgdGhhdCdzIG5vdCBhIGJhZCBpZGVhLgoKICBQYXVsCgo+IAo+
IFRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
