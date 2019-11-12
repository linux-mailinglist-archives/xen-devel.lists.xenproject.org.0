Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6A5F9A47
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 21:11:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUcSB-0001QX-Cf; Tue, 12 Nov 2019 20:07:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H3Su=ZE=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iUcSA-0001QS-9B
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 20:07:54 +0000
X-Inumbo-ID: 1bccc268-0588-11ea-b678-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bccc268-0588-11ea-b678-bc764e2007e4;
 Tue, 12 Nov 2019 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573589274;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uTieL3UpRNAUDBS7Z0yDnaodG06BMhM6vXa0FJOZSmM=;
 b=Xwzd40YuzS7Rjl8RENqMe+YAvIJSoecVaHTy2j8O1BULYs/Eh/8p/K3M
 Pd5urhGa1TK+02wh8HpKH0tQo7e8rOvE0iQ78CUIpEKuQv6z59alTyl+e
 qB+4l7UcN+nGGLPmTSjIrXLxm1tmy4ZzRvfobULHjk4B1dYVx8+0pzMtm g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Dje/2hdB2Wa7xUq/l/5vypO9mo7gsrQUozQO4ha4APlemprdzJyivqfta1x1P1q1qg+YmiJJsT
 jw3xp8Fcs2Hv0CQz8R19WxZ4Fx68eOHAbX7rSaty3uCPwmj5kyNFPP8Ld2zawjNBM6hq8Tx8gD
 dEnzW2CqGzDG3R9MLqkt9qiRAcBU8Navqa+oWG1EgKKHUYmYwl3wZdccjASDtw5etX6KiUURC+
 0Pr8IRX5mMPKrtD8pdyPd+YAVEMxrbifJEcImaRAsBr8w4q7/s+3t8iSHET1lVuy03r+g1A8dH
 qUQ=
X-SBRS: 2.7
X-MesageID: 8337127
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,297,1569297600"; 
   d="scan'208";a="8337127"
From: Lars Kurth <lars.kurth@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [Xen-devel] [PATCH] Introduce a description of a new optional
 tag for Backports
Thread-Index: AQHVlmgfiNV0BAuOmESFGDJkYFUlYaeHVxAAgAAA2wCAAGKugP//zPSA
Date: Tue, 12 Nov 2019 20:07:49 +0000
Message-ID: <47C2CE45-A4E4-4B88-AC62-21D6BCE143BE@citrix.com>
References: <20191108190952.22163-1-sstabellini@kernel.org>
 <20191112111416.GA2337@perard.uk.xensource.com>
 <24010.38080.707256.901442@mariner.uk.xensource.com>
 <alpine.DEB.2.21.1911120908390.2863@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911120908390.2863@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.f.191014
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <40FBB10E804DB0479A9EC46ED44F4114@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Introduce a description of a new optional
 tag for Backports
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
Cc: "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDEyLzExLzIwMTksIDExOjEwLCAiU3RlZmFubyBTdGFiZWxsaW5pIiA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQoNCiAgICBPbiBUdWUsIDEyIE5vdiAyMDE5LCBJYW4g
SmFja3NvbiB3cm90ZToNCiAgICA+IEFudGhvbnkgUEVSQVJEIHdyaXRlcyAoIlJlOiBbWGVuLWRl
dmVsXSBbUEFUQ0hdIEludHJvZHVjZSBhIGRlc2NyaXB0aW9uIG9mIGEgbmV3IG9wdGlvbmFsIHRh
ZyBmb3IgQmFja3BvcnRzIik6DQogICAgPiA+IFNob3VsZCB3ZSBkZXNjcmliZSB0aGUgRml4ZXM6
IHRhZyBhcyB3ZWxsPyBUaGVzZSB3b3VsZCBoYXZlIGEgc2ltaWxhcg0KICAgID4gPiBwdXJwb3Nl
IHRvIHRoZSBiYWNrcG9ydCB0YWcsIEkgbWVhbiBpdCBjb3VsZCBoZWxwIGZpZ3VyZSBvdXQgd2hp
Y2gNCiAgICA+ID4gY29tbWl0IHRvIGJhY2twb3J0IHRvIHdoaWNoIHRyZWUuDQogICAgPiANCiAg
ICA+IEdvb2QgcG9pbnQuDQogICAgDQogICAgWWVzLCBnb29kIGlkZWEuDQogICAgDQogICAgDQog
ICAgTGFycywgSSB0aGluayB3ZSBhcmUgYWxyZWFkeSBpbiBhZ3JlZW1lbnQuDQogICAgDQogICAg
WW91IGNhbiBmaW5kIHRoZSBkZXNjcmlwdGlvbiBvZiAiRml4ZXMiIGhlcmUgaW4gTGludXgNCiAg
ICBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdC4NCg0KSXQgd291
bGQgYmUgZ29vZCB0byBnZXQgSmFuJ3MgQUNLIGF0IGxlYXN0DQpMYXJzDQogICAgDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
