Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7B114A623
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:30:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5N4-0000RT-Pc; Mon, 27 Jan 2020 14:28:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Csoy=3Q=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iw5N3-0000RN-6p
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:28:09 +0000
X-Inumbo-ID: 3c962218-4111-11ea-aecd-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c962218-4111-11ea-aecd-bc764e2007e4;
 Mon, 27 Jan 2020 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580135288;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=xALS+v0FxtzeimfyxfF0rFyqDM9x8ipCp9yklfsBhFU=;
 b=HIL3pKl9bbq6CwOd83BKd85oDU2yHaczI6o4ca0HCUVSVo10XEghv6Hr
 5m6C3lN9hIIU0APu6iUDY2dpMJpac+k74ZD5gQhBP8PWoaC0xngrBUwNt
 450nc/nqQFgl61xDiYZLe0vCh7w7sEPBZCNijJewJh6PN5M322DUAFDQP U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Bin0SIDRUQ/TbLfs+Gf0oaV3gBWRKINm0/0PWP6hiYh71lNifQ0G1WuUvKu3exj2nLm6SM+s+Z
 QABMpFJ616Xl2SaVfgJHoYu50LNNetgUzBh+HrOCxOj26Ehe5jVkryKXIrg3U1W0I62hf5UCZU
 uUv91l3bMJTdJdFRI5nkOrF5h9CQateoy0pYXqi8wSPBtaD3y8pjiyeSK383eEQc7vQaIZSght
 IW+cD4RH+/cTK2zrradF2V614YbA+ePgM997gxeC9SvuD4AtWXl74cb5EVj+sSVZ2uxXgjLxL3
 d5g=
X-SBRS: 2.7
X-MesageID: 11506172
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11506172"
From: Lars Kurth <lars.kurth@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, "Ian
 Jackson" <Ian.Jackson@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien.grall@arm.com>, Wei Liu <Wei.Liu2@citrix.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>
Thread-Topic: [Vote] Approve hypervisor project check-in policy
Thread-Index: AQHV1RvLmcH1p0simkePy9DFHKXZTKf+gP0A
Date: Mon, 27 Jan 2020 14:28:04 +0000
Message-ID: <61A54804-CE7C-44DE-92FD-5288D8C4B240@citrix.com>
References: <4cb6e142-5fec-7608-0c9c-d8c7c75e47d3@citrix.com>
In-Reply-To: <4cb6e142-5fec-7608-0c9c-d8c7c75e47d3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.21.0.200113
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <5C25F950566A4D44BF37972D8ADBCE84@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [Vote] Approve hypervisor project check-in policy
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI3LzAxLzIwMjAsIDE0OjEyLCAiR2VvcmdlIER1bmxhcCIgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4gd3JvdGU6DQoNCiAgICBJIGhhdmUgZHJhZnRlZCBhbiBleHBsaWNpdCBw
b2xpY3kgb24gd2hhdCBpcyAoZ2VuZXJhbGx5KSByZXF1aXJlZCB0bw0KICAgIGNoZWNrIGEgcGF0
Y2ggaW4uICBJdCdzIGJlZW4gdGhyb3VnaCBzZXZlcmFsIHJvdW5kcywgYW5kIHY0IGhhcyBiZWVu
DQogICAgYWNrZWQgWzFdLg0KICAgIA0KICAgIEkndmUgaGFkIGluZm9ybWFsIGFzc2VudCBmcm9t
IGFsbCBjb21taXR0ZXJzLCBidXQganVzdCB0byBkb3QgYWxsIG91cg0KICAgIGkncyBhbmQgY3Jv
c3MgYWxsIG91ciB0J3MsIGl0J3MgcHJvYmFibHkgd29ydGggaGF2aW5nIGEgdm90ZSBvZiB0aGUN
CiAgICBjb21taXR0ZXJzLCBpbiBsaW5lIHdpdGggdGhlIFhlblByb2plY3QgZ292ZXJuYW5jZSBw
b2xpY3kgWzFdLg0KICAgIA0KICAgIFBsZWFzZSByZXNwb25kIGJ5IDEwIEZlYnJ1YXJ5IHdpdGgg
eW91ciB2b3RlOg0KICAgICsxOiBmb3IgcHJvcG9zYWwNCiAgICAtMTogYWdhaW5zdCBwcm9wb3Nh
bA0KICAgIGluIHB1YmxpYyBvciBwcml2YXRlLg0KICAgIA0KR2VvcmdlOiBpbiB0aGlzIGNhc2Ug
LSBhcyBpdCBpcyBub3QgYSBYZW4gUHJvamVjdCB3aWRlIHBvbGljeSAtIHRoZSB2b3Rpbmcgb3B0
aW9ucyBhcmUgYSBiaXQgd2lkZXINCg0KKzIgOiBJIGFtIGhhcHB5IHdpdGggdGhpcyBwcm9wb3Nh
bCwgYW5kIEkgd2lsbCBhcmd1ZSBmb3IgaXQNCisxIDogSSBhbSBoYXBweSB3aXRoIHRoaXMgcHJv
cG9zYWwsIGJ1dCB3aWxsIG5vdCBhcmd1ZSBmb3IgaXQNCjAgOiBJIGhhdmUgbm8gb3Bpbmlvbg0K
LTEgOiBJIGFtIG5vdCBoYXBweSB3aXRoIHRoaXMgcHJvcG9zYWwsIGJ1dCB3aWxsIG5vdCBhcmd1
ZSBhZ2FpbnN0IGl0DQotMiA6IEkgYW0gbm90IGhhcHB5IHdpdGggdGhpcyBwcm9wb3NhbCwgYW5k
IEkgd2lsbCBhcmd1ZSBhZ2FpbnN0IGl0DQoNClNlZSBodHRwczovL3hlbnByb2plY3Qub3JnL2Rl
dmVsb3BlcnMvZ292ZXJuYW5jZS8jZGVjaXNpb25zIExlYWRlcnNoaXAgVGVhbSBEZWNpc2lvbnMN
CkZvciBwcm9qZWN0IHdpZGUgZGVjaXNpb25zIHdlIGVuZGVkIHVwIHdpdGggYSBzaW1wbGVyIGFu
ZCBkaWZmZXJlbnQgc2NoZW1lDQoNCkxhcnMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
