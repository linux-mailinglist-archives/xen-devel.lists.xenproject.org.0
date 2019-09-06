Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5709CABCB7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 17:39:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6GIi-0007lA-CR; Fri, 06 Sep 2019 15:37:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XnaT=XB=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i6GIg-0007kt-NH
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 15:37:26 +0000
X-Inumbo-ID: 2c43cbc4-d0bc-11e9-abf7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c43cbc4-d0bc-11e9-abf7-12813bfff9fa;
 Fri, 06 Sep 2019 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567784223;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QhNfwDZHgH9gQrN1l+NK5+pKpAJGvv3+xx59gVti6CE=;
 b=OD54sMS+vUzwLGnjs7IsErcIkcrEwpaJBqXPGpQ6Mo6TRoUym49TkgO8
 wYMLhXYRs28/d8a3KBtMcQuEVVaXK8rwjDjvftgOdfBQUMkvrk2QXSt0b
 2Q11pYdjFJdc6yj9VKrJ0mQ1ZpYkxv/TpHwCg8ONZalnrruCitIpkGXmz g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FqDRpkuv9DkEZgCz92Ct/z1fuvBMZaZ60CpCi17+26ujZaqh/ZISffdIAh7GdKFwHqxi2FXZOZ
 xsYiK580Xg6Tphua5RtZuf5+lowfgxzK3Bvw26/zai0NSBzoKeKRXy/Cg5eeLwdxbrWFazw0Cl
 nT7XYho/fna9AULBhWs5heqgDOP/9i42UKhYMeXyBt6YuwtFrypsGX4mK2sHNd2Qnw/cAin8LD
 yJ4tZ7lgXFtA3iNLMLoEi7w0yS/ZVtEEY7C/SLLK7Hq/8IQiZCvyouLt3nxZkzb8sz3K4x0BiY
 Zuw=
X-SBRS: 2.7
X-MesageID: 5520917
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5520917"
From: Lars Kurth <lars.kurth@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] Xen Project Code of Conduct
Thread-Index: AQHVY0xS7k25XmSzskSR/W9PSVPWpKceomQAgAAYF4A=
Date: Fri, 6 Sep 2019 15:36:59 +0000
Message-ID: <7C473E1E-7870-4F30-BDE8-254E04B5ADBE@citrix.com>
References: <cover.1567620587.git.lars.kurth@citrix.com>
 <bce250afe71018f1a62f1b34866833588670a1f9.1567620587.git.lars.kurth@citrix.com>
 <20190906151046.r7cremzaqw73btu3@Air-de-Roger>
In-Reply-To: <20190906151046.r7cremzaqw73btu3@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <611AC95F651D0D468B3C5C6C82044607@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Xen Project Code of Conduct
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
Cc: "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQrvu79PbiAwNi8wOS8yMDE5LCAxNjoxMCwgIlJvZ2VyIFBhdSBNb25uZSIgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToNCg0KICAgIE9uIFdlZCwgU2VwIDA0LCAyMDE5IGF0IDA3OjEyOjE4
UE0gKzAxMDAsIExhcnMgS3VydGggd3JvdGU6DQogICAgWy4uLl0NCiAgICA+ICsjIyBDb25kdWN0
IFRlYW0gbWVtYmVycw0KICAgID4gK0NvbmR1Y3QgVGVhbSBtZW1iZXJzIGFyZSBwcm9qZWN0IGxl
YWRlcnNoaXAgdGVhbSBtZW1iZXJzIGZyb20gYW55DQogICAgPiArc3ViLXByb2plY3QuIFRoZSBj
dXJyZW50IGxpc3Qgb2YgQ29uZHVjdCBUZWFtIG1lbWJlcnMgaXM6DQogICAgPiArKiBMYXJzIEt1
cnRoIDxsYXJzIGRvdCBrdXJ0aCBhdCB4ZW5wcm9qZWN0IGRvdCBvcmc+DQogICAgPiArKiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UgZG90IGR1bmxhcCBhdCBjaXRyaXggZG90IGNvbT4NCiAgICA+ICsq
IElhbiBKYWNrc29uIDxpYW4gZG90IGphY2tzb24gYXQgY2l0cml4IGRvdCBjb20+DQogICAgPiAr
DQogICAgPiArQ29uZHVjdCBUZWFtIG1lbWJlcnMgYXJlIGNoYW5nZWQgYnkgcHJvcG9zaW5nIGEg
Y2hhbmdlIHRvIHRoaXMgZG9jdW1lbnQsDQogICAgPiArcG9zdGVkIG9uIGFsbCBzdWItcHJvamVj
dCBsaXN0cywgZm9sbG93ZWQgYnkgYSBmb3JtYWwgZ2xvYmFsIHZvdGUgYXMgb3V0bGluZWQgW2hl
cmVdOiBodHRwczovL3hlbnByb2plY3Qub3JnL2RldmVsb3BlcnMvZ292ZXJuYW5jZS8jcHJvamVj
dC1kZWNpc2lvbnMNCiAgICANCiAgICBDb3VsZCB5b3UgYnJlYWsgdGhlIGFib3ZlIGxpbmUgdG8g
bWF0Y2ggdGhlIGV4aXN0aW5nIGxpbmUgbGVuZ3RoIG9mDQogICAgdGhlIGRvY3VtZW50Pw0KICAg
IA0KU3VyZSwgSSBjYW4gZG8gdGhpcyBpbiB0aGUgbmV4dCByZXZpc2lvbg0KDQpJIGludGVudGlv
bmFsbHkgZGlkbid0IGRvIGxpbmUgYnJlYWtzIG9uIG1vc3QgY2hhbmdlcyB0byBtYWtlIHN1cmUg
dGhhdCB0aGUgZGlmZmVyZW5jZXMgY2FuIGJlIHNlZW4NCg0KQWxzbywgd2Ugd2lsbCBwcm9iYWJs
eSBuZXZlciBwdWJsaXNoIHRoaXMgY29udGVudCBhbnl3aGVyZSBidXQgb24gdGhlIG1haW4gd2Vi
c2l0ZSAoYXMgaHRtbCBnZW5lcmF0ZWQgZnJvbSB0aGUgTUQpDQoNCkxhcnMNCiAgICANCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
