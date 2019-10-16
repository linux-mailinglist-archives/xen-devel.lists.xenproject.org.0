Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD22D934C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 16:04:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKjqp-0001g7-IS; Wed, 16 Oct 2019 14:00:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uxYd=YJ=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iKjqo-0001g2-3f
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 14:00:30 +0000
X-Inumbo-ID: 4f3404fc-f01d-11e9-93b5-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f3404fc-f01d-11e9-93b5-12813bfff9fa;
 Wed, 16 Oct 2019 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571234429;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=FZdO+jRNyrPyKsyNjXa1eMiypKf4USyqjVJfCNtsIQY=;
 b=ciNrRlApz1Pf6vol8g+V2pgARoTgCdxk0RLa/fpj/1oz8JHX6O71svzN
 tWd3mp0kw+HjZNSlwA0BJO7i2tQjfKm5UfCEpUOvSCyTXyKydtuA82Zhh
 CDf3ici5d1fBJmEW6Ui8gx4jLnY48Aw4nnRAEKUkjLrmm431YRp7flCzU M=;
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
IronPort-SDR: hOSas01xv7tkt3BFvf8HIyVfBgSIUdoAee6xzthNc4YQs8MZgNxJX10Zd3rAUAh96oJXdTfkdC
 33QVaC1sK7FZMjp3R8a3M17yHMwXWA4L6n+oOezgIl0wJKMaLNCG1xg9GbvqGsT3dpDtpPy+D7
 Nf4SN9amMOWfoA3LdkWcYU6GDyuYNrd0U8JT75bJs/g30nhtoPYl5ViBA4m90HigD1fYfNEnOF
 92TRNgV9rav5sF33vA0VhpvFA40oXU9zE58nSk2yN0FK1SL0sIJLItoAe39G8qVeeMZHOaGcV6
 ciE=
X-SBRS: 2.7
X-MesageID: 7045433
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,304,1566878400"; d="scan'208,217";a="7045433"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, "julien.grall@xen.org"
 <julien.grall@xen.org>
Thread-Topic: Please Welcome Julien Grall as new Security Team Member
Thread-Index: AQHVhCoOak7072PFB0+Po+YVxmzLUQ==
Date: Wed, 16 Oct 2019 14:00:24 +0000
Message-ID: <6F9CF3F5-6EDF-4E42-8A46-952A7605B4DB@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.f.191014
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: [Xen-devel] Please Welcome Julien Grall as new Security Team Member
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
Cc: "security@xenproject.org" <security@xenproject.org>
Content-Type: multipart/mixed; boundary="===============4524133417910887768=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4524133417910887768==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6F9CF3F56EDF4E428A46952A7605B4DBcitrixcom_"

--_000_6F9CF3F56EDF4E428A46952A7605B4DBcitrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciBDb21tdW5pdHkgbWVtYmVycywNCg0KDQoNCkkgYW0gcGxlYXNlZCB0byBhbm5vdW5jZSB0
aGF0IEp1bGllbiBHcmFsbGggaGFzIGJlZW4gbm9taW5hdGVkIGFuZA0KDQp2b3RlZCB0byBiZWNv
bWUgYSBuZXcgbWVtYmVyIG9mIHRoZSBYZW4gUHJvamVjdCBzZWN1cml0eSB0ZWFtLg0KDQoNCg0K
SnVsaWVuIGhhcyBtYWRlIHNpZ25pZmljYW50IGNvbnRyaWJ1dGlvbnMgdG8gdGhlIFhlbiBQcm9q
ZWN0IG92ZXIgdGhlDQoNCnllYXJzIGFuZCBoYXMgYmVlbiBhIG1haW50YWluZXIgYW5kIHByb2pl
Y3QgbGVhZGVyc2hpcCB0ZWFtIG1lbWJlcg0KZm9yIGEgbG9uZyB0aW1lLg0KDQoNCg0KQmVzdCBS
ZWdhcmRzDQoNCkxhcnMgS3VydGgNCg0KWGVuIFByb2plY3QgQ29tbXVuaXR5IE1hbmFnZXINCg0K
Q2hhaXJtYW4gb2YgWGVuIFByb2plY3QgQWR2aXNvcnkgQm9hcmQNCg0K

--_000_6F9CF3F56EDF4E428A46952A7605B4DBcitrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <A6B6C4ACCD0E3C46AC78AF7F7298C65D@citrix.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGNtOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpz
cGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1z
b0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6NjEyLjBw
dCA3OTIuMHB0Ow0KCW1hcmdpbjo3Mi4wcHQgNzIuMHB0IDcyLjBwdCA3Mi4wcHQ7fQ0KZGl2Lldv
cmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0K
PGJvZHkgbGFuZz0iRU4tR0IiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYg
Y2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBzdHlsZT0ibWFyZ2luOjBjbTttYXJnaW4tYm90dG9t
Oi4wMDAxcHQ7YmFja2dyb3VuZDp3aGl0ZSI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90
O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6YmxhY2siPkRlYXIgQ29tbXVuaXR5IG1lbWJl
cnMsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgc3R5bGU9Im1hcmdpbjowY207bWFyZ2luLWJv
dHRvbTouMDAwMXB0O2JhY2tncm91bmQ6d2hpdGUiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTom
cXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOmJsYWNrIj48bzpwPiZuYnNwOzwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBzdHlsZT0ibWFyZ2luOjBjbTttYXJnaW4tYm90dG9tOi4wMDAxcHQ7
YmFja2dyb3VuZDp3aGl0ZTtmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7Zm9udC12YXJp
YW50LWNhcHM6IG5vcm1hbDtvcnBoYW5zOiAyO3RleHQtYWxpZ246c3RhcnQ7d2lkb3dzOiAyOy13
ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDt0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRp
YWw7dGV4dC1kZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFsO3dvcmQtc3BhY2luZzowcHgiPg0KPHNw
YW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6
YmxhY2siPkkgYW0gcGxlYXNlZCB0byBhbm5vdW5jZSB0aGF0IEp1bGllbiBHcmFsbGggaGFzIGJl
ZW4gbm9taW5hdGVkIGFuZDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIHN0eWxlPSJtYXJnaW46
MGNtO21hcmdpbi1ib3R0b206LjAwMDFwdDtiYWNrZ3JvdW5kOndoaXRlIj48c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjpibGFjayI+dm90
ZWQgdG8gYmVjb21lIGEgbmV3IG1lbWJlciBvZiB0aGUgWGVuIFByb2plY3Qgc2VjdXJpdHkgdGVh
bS4NCjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIHN0eWxlPSJtYXJnaW46MGNtO21hcmdpbi1i
b3R0b206LjAwMDFwdDtiYWNrZ3JvdW5kOndoaXRlIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6
JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjpibGFjayI+PG86cD4mbmJzcDs8L286
cD48L3NwYW4+PC9wPg0KPHAgc3R5bGU9Im1hcmdpbjowY207bWFyZ2luLWJvdHRvbTouMDAwMXB0
O2JhY2tncm91bmQ6d2hpdGU7Zm9udC12YXJpYW50LWxpZ2F0dXJlczogbm9ybWFsO2ZvbnQtdmFy
aWFudC1jYXBzOiBub3JtYWw7b3JwaGFuczogMjt0ZXh0LWFsaWduOnN0YXJ0O3dpZG93czogMjst
d2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7dGV4dC1kZWNvcmF0aW9uLXN0eWxlOiBpbml0
aWFsO3RleHQtZGVjb3JhdGlvbi1jb2xvcjogaW5pdGlhbDt3b3JkLXNwYWNpbmc6MHB4Ij4NCjxz
cGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9y
OmJsYWNrIj5KdWxpZW4gaGFzIG1hZGUgc2lnbmlmaWNhbnQgY29udHJpYnV0aW9ucyB0byB0aGUg
WGVuIFByb2plY3Qgb3ZlciB0aGUNCjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIHN0eWxlPSJt
YXJnaW46MGNtO21hcmdpbi1ib3R0b206LjAwMDFwdDtiYWNrZ3JvdW5kOndoaXRlIj48c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjpibGFj
ayI+eWVhcnMgYW5kIGhhcyBiZWVuIGEgbWFpbnRhaW5lciBhbmQgcHJvamVjdCBsZWFkZXJzaGlw
IHRlYW0gbWVtYmVyPGJyPg0KZm9yIGEgbG9uZyB0aW1lLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIHN0eWxlPSJtYXJnaW46MGNtO21hcmdpbi1ib3R0b206LjAwMDFwdDtiYWNrZ3JvdW5kOndo
aXRlIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJp
Zjtjb2xvcjpibGFjayI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgc3R5bGU9Im1h
cmdpbjowY207bWFyZ2luLWJvdHRvbTouMDAwMXB0O2JhY2tncm91bmQ6d2hpdGUiPjxpPjxzcGFu
IHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOmJs
YWNrIj5CZXN0IFJlZ2FyZHMNCjxvOnA+PC9vOnA+PC9zcGFuPjwvaT48L3A+DQo8cCBzdHlsZT0i
bWFyZ2luOjBjbTttYXJnaW4tYm90dG9tOi4wMDAxcHQ7YmFja2dyb3VuZDp3aGl0ZSI+PGk+PHNw
YW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6
YmxhY2siPkxhcnMgS3VydGgNCjxvOnA+PC9vOnA+PC9zcGFuPjwvaT48L3A+DQo8cCBzdHlsZT0i
bWFyZ2luOjBjbTttYXJnaW4tYm90dG9tOi4wMDAxcHQ7YmFja2dyb3VuZDp3aGl0ZSI+PGk+PHNw
YW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6
YmxhY2siPlhlbiBQcm9qZWN0IENvbW11bml0eSBNYW5hZ2VyDQo8bzpwPjwvbzpwPjwvc3Bhbj48
L2k+PC9wPg0KPHAgc3R5bGU9Im1hcmdpbjowY207bWFyZ2luLWJvdHRvbTouMDAwMXB0O2JhY2tn
cm91bmQ6d2hpdGUiPjxpPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90
OyxzYW5zLXNlcmlmO2NvbG9yOmJsYWNrIj5DaGFpcm1hbiBvZiBYZW4gUHJvamVjdCBBZHZpc29y
eSBCb2FyZDxvOnA+PC9vOnA+PC9zcGFuPjwvaT48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9w
Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_6F9CF3F56EDF4E428A46952A7605B4DBcitrixcom_--


--===============4524133417910887768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4524133417910887768==--

