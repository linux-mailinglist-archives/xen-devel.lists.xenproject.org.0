Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1530F177B20
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 16:54:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j99p8-0006yN-9U; Tue, 03 Mar 2020 15:51:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7kGC=4U=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j99p6-0006yI-Pw
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 15:51:08 +0000
X-Inumbo-ID: cbee9550-5d66-11ea-8adc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbee9550-5d66-11ea-8adc-bc764e2007e4;
 Tue, 03 Mar 2020 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583250667;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=g1MGswsR0ivzcA/9t3NORqawSMSu3vu4ll+917K0QV0=;
 b=bbdDvpOPia2PdOdwqfu2DKbkufacUgK99s8aHJZFS9zAzRa390dJxOoK
 ZWCAPgA+xrcZ+Rh19xAaItg8/2XMNq1oJclLTQQOpbo1/KW0OjJettXHV
 W8ZjsrF+TKiItrX67AtrcKnJu1y8vAMxCSMdvVbF0vF0MQFG6xdq94Grx 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: J3GUoCDipfQOYSWSHWmddg5+qkrFayb6lVmJHzXxhQLi7G4mIPR2+WGp17O9KBYnxAWtq3H3/N
 itVsZvD+H8E95yW/7ADQFDi/MKlJK8YT14p8mMl7mSj8AqwhtxNlWa19o6m0rewZEweasKo6kN
 XbdiP7nTF4Xc9UQthQBBsmcn77KVVw9qAVEGhZ0QfsV3xhdopgvD2QV/gTsG4OfYKJ3nfyqli1
 kdvymJf1cmhC8A//SFq7Ror1gnzcvvknusj29niNT412TM+y6f1Z/ATwGxy9a8V3K64IgrDxno
 xFY=
X-SBRS: 2.7
X-MesageID: 13685469
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,511,1574139600"; d="scan'208";a="13685469"
Date: Tue, 3 Mar 2020 15:51:04 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: =?utf-8?B?UGF3ZcWC?= Marczewski <pawel@invisiblethingslab.com>
Message-ID: <20200303155104.GB1229@perard.uk.xensource.com>
References: <ddbffc40de3a8fc9f0104f66b9725fe3f2b6b6c8.1583241706.git.pawel@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ddbffc40de3a8fc9f0104f66b9725fe3f2b6b6c8.1583241706.git.pawel@invisiblethingslab.com>
Subject: Re: [Xen-devel] [XEN PATCH v4] libxl: wait for console path before
 firing console_available
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMDMsIDIwMjAgYXQgMDI6Mjg6MjBQTSArMDEwMCwgUGF3ZcWCIE1hcmN6ZXdz
a2kgd3JvdGU6Cj4gSWYgdGhlIHBhdGggZG9lc24ndCBiZWNvbWUgYXZhaWxhYmxlIGFmdGVyIExJ
QlhMX0lOSVRfVElNRU9VVAo+IHNlY29uZHMsIGZhaWwgdGhlIGRvbWFpbiBjcmVhdGlvbi4KPiAK
PiBJZiB3ZSBza2lwIHRoZSBib290bG9hZGVyLCB0aGUgVFRZIHBhdGggd2lsbCBiZSBzZXQgYnkg
eGVuY29uc29sZWQuCj4gSG93ZXZlciwgdGhlcmUgaXMgbm8gZ3VhcmFudGVlIHRoYXQgdGhpcyB3
aWxsIGhhcHBlbiBieSB0aGUgdGltZSB3ZQo+IHdhbnQgdG8gY2FsbCB0aGUgY29uc29sZV9hdmFp
bGFibGUgY2FsbGJhY2ssIHNvIHdlIGhhdmUgdG8gd2FpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQ
YXdlxYIgTWFyY3pld3NraSA8cGF3ZWxAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiBSZXZpZXdl
ZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGlu
Z3NsYWIuY29tPgoKUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPgoKVGhhbmtzIQoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
