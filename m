Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D372124BED
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 16:43:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihbQ7-0001bg-U8; Wed, 18 Dec 2019 15:39:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0dd+=2I=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ihbQ6-0001bb-84
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 15:39:26 +0000
X-Inumbo-ID: 8cbec8c8-21ac-11ea-a914-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cbec8c8-21ac-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576683557;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Wl9pl1kMukBYCbVKQkHk840YzxAN29QtMoPAicZ3dzw=;
 b=TgFS9BiN4rEOw8CWsD0wn02GP1qwc1YuIE1inh5A0lmnY1QEKeto0nUj
 2woR1y6my4hKCJCNM8dBXf3K5QrddHiT4CugMtYKDSxhIZ3iGKv68kfNv
 hSH9vLUGhYGwDK/8Mftf0lftTDmAsm1JL+gDZGeAmsK+kFqVnPsw+nYQ3 U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
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
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: h3dCnaM5+ZFl7mD9+FJFS8Hi75Eux/JivjR+K68wIeh2ewzQa8bY5vAo+V8KwkcfbsjtajZvZD
 LeA9DaTyNT7jgB4Fr8E6m4p3O5XDRzl6oqO35OEtOp/NvniKaeXeODU+x752R8Ry8Jkfb+22UE
 cZ34tH2mlFesSP5IfyIcUyxHV73hFnTn2szcioEuCdUbySJS45sFeLddNaEsbCTlQ+a1NK9a8a
 dStR4TaW3uD67+iAXQ78RfmKWfr+lIFmxeG46+tyamLu61h3bZSBHuX3bD1dIWWx9W1sG9RoO8
 h34=
X-SBRS: 2.7
X-MesageID: 10249248
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,330,1571716800"; d="scan'208";a="10249248"
From: Lars Kurth <lars.kurth@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] tools/python: Drop test.py
Thread-Index: AQHVtaoQnL2koBj0sESV+qQKY8nSfKe/9fIA
Date: Wed, 18 Dec 2019 15:39:13 +0000
Message-ID: <DA92E283-67AE-4BEF-9639-69131226F7AF@citrix.com>
References: <20191218135006.4117-1-andrew.cooper3@citrix.com>
In-Reply-To: <20191218135006.4117-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.11.191208
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <432042049EB93E4A8C876039E1E53AC8@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] tools/python: Drop test.py
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE4LzEyLzIwMTksIDEzOjUwLCAiQW5kcmV3IENvb3BlciIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KDQogICAgVGhpcyBmaWxlIGhhc24ndCBiZWVuIHRvdWNo
ZWQgc2luY2UgaXQgd2FzIGludHJvZHVjZWQgaW4gMjAwNSAoYy9zIDBjNmYzNjYyOCkNCiAgICBh
bmQgaGFzIGEgd2lsZGx5IG9ic29sZXRlIHNoZWJhbmcgZm9yIFB5dGhvbiAyLjMuICBNb3N0IGlt
cG9ydGFudGx5IGZvciB1cyBpcw0KICAgIHRoYXQgaXQgaXNuJ3QgUHl0aG9uIDMgY29tcGF0aWJs
ZS4NCiAgICANCiAgICBEcm9wIHRoZSBmaWxlIGVudGlyZWx5LiAgU2luY2UgdGhlIDIuMyBkYXlz
LCBhdXRvbWF0aWMgZGlzY292ZXJ5IG9mIHRlc3RzIGhhcw0KICAgIGJlZW4gaW5jbHVkZWQgaW4g
c3RhbmRhcmQgZnVuY3Rpb25hbGl0eS4gIFJld3JpdGUgdGhlIHRlc3QgcnVsZSB0byB1c2UNCiAg
ICAiJChQWVRIT04pIC1tIHVuaXR0ZXN0IGRpc2NvdmVyIiB3aGljaCBpcyBlcXVpdmVsZW50Lg0K
ICAgIA0KICAgIERyb3BwaW5nIHRlc3QucHkgZHJvcHMgdGhlIG9ubHkgcGllY2Ugb2YgWlBMLTIu
MCBjb2RlIGluIHRoZSB0cmVlLiAgRHJvcCB0aGUNCiAgICBhbmNpbGxhcnkgZmlsZXMsIGFuZCBh
ZGp1c3QgQ09QWUlORyB0byBtYXRjaC4NCiAgICANCiAgICBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KICAgIC0tLQ0KICAgIENDOiBJYW4g
SmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4NCiAgICBDQzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4NCiAgICBDQzogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPg0KICAgIA0K
ICAgIFRoaXMgd2FudHMgYmFja3BvcnRpbmcgdG8gNC4xMyBhcyBzb29uIGFzIHByYWN0aWNhbC4N
Cg0KUmV2aWV3ZWQtYnk6IExhcnMgS3VydGggKGxhcnMua3VydGhAY2l0cml4LmNvbSkgLSBmcm9t
IGEgbGljZW5zaW5nIHBlcnNwZWN0aXZlDQogICAgDQogICAgDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
