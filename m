Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AD413740A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 17:47:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipxOl-0004GW-1D; Fri, 10 Jan 2020 16:44:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rEUW=27=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ipxOj-0004GP-5h
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 16:44:33 +0000
X-Inumbo-ID: 75326b1e-33c8-11ea-ac27-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75326b1e-33c8-11ea-ac27-bc764e2007e4;
 Fri, 10 Jan 2020 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578674664;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=bW1D5FMmsBcscXJC5n+TwMhJo9FEVFQydt8xYd58gFA=;
 b=XFlvIxkGgtTE6WVM8H9JwNcFpJBv61WW/EQCGc4MzKIKbBIYT5ppOJnb
 /Q/Y7y0QJO7r0EpSelMgAgHp3YRtq+inhm72oKvJG5m4qIm0k8Mj4w/Cs
 +1yLl4y2zuNH7kMO/+Ru5bNMeWHT3zazIDyctsuIox2DbtwqxbdkFMmvR o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MvyTt4xu3CtHSjClGSEDmb8T9JcenfR6CgpT6YORDOUsqg5/eKj1uXoafLCa5uknpsWjrun+Zx
 7ecAS+R9IqrUhTnrfFrbrwLazxvIDIMl2kE0kOK+afjO5MBNwKggwGjHDXMQUfF08YkzB438Kb
 h9ofRdz9lDyK4ezvwBZeiu7Z08ezMsbEkFfzLSBL/bwIV8QhFcsI6OiH3L54bAi0kC4Bz4qPJF
 lRNP4g2em7G+jgMrgw9rnoiIhSJVsSNmwoa8W2NKhkCJpRYVw13GFKMr+3Qse7lYAjwli2P4qY
 HZk=
X-SBRS: 2.7
X-MesageID: 11187000
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="11187000"
From: Lars Kurth <lars.kurth@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [BUG] scripts/add_maintainers.pl adding empty Cc: lines
Thread-Index: AQHVx9U1WsAOauSM5EeJ46Ka5RJjXQ==
Date: Fri, 10 Jan 2020 16:44:21 +0000
Message-ID: <5972CBDC-7D3D-4EBC-90BD-38FCA93F57EA@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.11.191208
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <BD6307B30E932349897336CDE8F6A64D@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [BUG] scripts/add_maintainers.pl adding empty Cc:
 lines
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

DQoNCu+7v09uIDA4LzAxLzIwMjAsIDE2OjUyLCAiSsO8cmdlbiBHcm/DnyIgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICBKdXN0IGhhZCBhIGNoYXQgd2l0aCBMYXJzIG9uIElSQywgd2hp
Y2ggbWlnaHQgYmUgb2YgY29tbW9uDQogICAgaW50ZXJlc3QgKGFuZCBMYXJzIGFza2VkIG1lIHRv
IHBvc3QgaXQgdG8geGVuLWRldmVsKToNCiAgICANCiAgICAoMTc6MDA6MTYpIGp1ZXJnZW5fZ3Jv
c3M6IGxhcnNfa3VydGg6IGFueSBpZGVhIHdoeSANCiAgICAuL3NjcmlwdHMvYWRkX21haW50YWlu
ZXJzLnBsIHdvdWxkIGFkZCBhICJDYzoiIHdpdGhvdXQgYSBtYWlsIGFkZHJlc3MgdG8gDQogICAg
YSBwYXRjaD8gSGFwcGVuZWQgZS5nLiBpbiBteSBzZXJpZXMgIltQQVRDSCB2MiAwLzldIHhlbjog
c2NoZWR1bGVyIA0KICAgIGNsZWFudXBzIiAoY292ZXItbGV0dGVyLCBwYXRjaGVzIDEsIDIsIDcg
YW5kIDkpDQogICAgKDE3OjAxOjU4KSBsYXJzX2t1cnRoOiBqdWVyZ2VuX2dyb3NzOiBvaCwgYW4g
YWN0dWFsIGJ1ZyEgTGV0IG1lIGxvb2sgYXQgDQogICAgdGhlIGNvZGUNCiAgICAoMTc6MDI6MTkp
IGxhcnNfa3VydGg6IGp1ZXJnZW5fZ3Jvc3M6ICBpcyBpdCBtaXNzaW5nIHNvbWUgZS1tYWlscz8N
CiAgICAoMTc6MDI6MzQpIGp1ZXJnZW5fZ3Jvc3M6IGdpdCBzZW5kLWVtYWlsIHNlZW1zIHRvIHJl
bW92ZSB0aG9zZSBlbXB0eSBDYzogDQogICAgbGluZXMNCiAgICAoMTc6MDI6NTMpIGp1ZXJnZW5f
Z3Jvc3M6IEknbSBub3QgYXdhcmUgb2YgYSBtYWlsIGFkZHJlc3MgbWlzc2luZy4gTGV0IA0KICAg
IG1lIGRvdWJsZSBjaGVjaw0KICAgICgxNzowNjo1NikganVlcmdlbl9ncm9zczogbGFyc19rdXJ0
aDogaG1tLCBzaG91bGRuJ3QgdGhlIE1BSU5UQUlORVJTIA0KICAgIGVudHJ5ICJMOiAgICAgIERv
cm5lcldvcmtzIFhlbi1EZXZlbCA8eGVuLWRldmVsQGRvcm5lcndvcmtzLmNvbT4iIHJlc3VsdCAN
CiAgICBpbiBhIENjOj8NCiAgICAoMTc6MDg6MTcpIGxhcnNfa3VydGg6IExldCBtZSBoYXZlIGEg
bG9vaw0KICAgICgxNzoxMzoxNikganVlcmdlbl9ncm9zczogbGFyc19rdXJ0aDogYXQgbGVhc3Qg
dGhlIHJlbGF0ZWQgZmlsZSBpcyANCiAgICB0b3VjaGVkIGV4YWN0bHkgYnkgdGhlIGFmZmVjdGVk
IHBhdGNoZXMgKGFuZCBub3QgYnkgYW55IG5vdCBhZmZlY3RlZCBwYXRjaCkNCiAgICAoMTc6MTM6
MzYpIGxhcnNfa3VydGg6IExvb2tpbmcgYXQgdGhlIHNlcmllcyB0aGUgbW9zdCBsaWtlbHkgY2F1
c2Ugb2YgDQogICAgdGhpcyBpcyB0aGUgTDogZW50cnkgLSBuZWVkIHRvIGxvb2sgYXQgdGhlIGNv
ZGUNCiAgICAoMTc6MTU6MjEpIGxhcnNfa3VydGg6IGp1ZXJnZW5fZ3Jvc3M6IGl0J3MgYWxzbyBh
biBvZGQgb25lIGJlY2F1c2UgaXQgDQogICAgY2hhbmdlcyBNQUlOVEFJTkVSUyBhbmQgcmVuYW1l
cyBhIGxvdCBvZiBmaWxlcywgd2hpY2ggbWF5IGJlIHRoZSBjYXVzZSANCiAgICBmb3IgdGhlIGVt
cHR5IHNwYWNlcw0KICAgICgxNzoxNTo1MikganVlcmdlbl9ncm9zczogbGFyc19rdXJ0aDogaW4g
TGludXggTUFJTlRBSU5FUlMgYWxsICJMOiIgDQogICAgZW50cmllcyBqdXN0IGhhdmUgYSBtYWls
IGFkZHJlc3MgYXMgZmlyc3Qgd29yZCBhZnRlciB0aGUgIkw6IiAobm90ICJibGEgDQogICAgYmxh
IDxhZGRyQGRvbWFpbj4iKQ0KICAgICgxNzoxNjoxMSkgbGFyc19rdXJ0aDogQWggeWVzOiBsZXQg
bWUgbG9vayBhdCB0aGF0IGNvZGUNCiAgICAoMTc6MjE6MjkpIGxhcnNfa3VydGg6IGp1ZXJnZW5f
Z3Jvc3M6IEkgdGhpbmsgdGhhdCBpcyBpbiBmYWN0IHRoZSBpc3N1ZQ0KICAgICgxNzoyNzoxNikg
bGFyc19rdXJ0aDoganVlcmdlbl9ncm9zczogSSBjYW4ndCBmaXggdGhpcyB3aXRoIHNvbWUgDQog
ICAgZGVidWdnaW5nLiBDb3VsZCB5b3UgY29weSB0aGlzIGNvbnZlcnNhdGlvbiBpbnRvIGEgbWFp
bCBvbiB4ZW4tZGV2ZWxAIA0KICAgIHN1Y2ggdGhhdCBJIHJlbWVtYmVyDQogICAgKDE3OjI3OjQz
KSBsYXJzX2t1cnRoOiB1ZXJnZW5fZ3Jvc3M6IHdpdGg9d2l0aG91dA0KICAgICgxNzoyOTozNikg
bGFyc19rdXJ0aDogIGp1ZXJnZW5fZ3Jvc3M6IEkgdGhpbmsgd2hhdCBoYXBwZW5zIGlzIHRoYXQg
DQogICAgZ2V0X21haW50YWluZXIucGwgYW5kIGFkZF9tYWludGFpbmVyLnBsIHByb2Nlc3MgdGhl
c2UgbGluZXMgZGlmZmVyZW50bHksIA0KICAgIGJ1dCBhZGRfbWFpbnRhaW5lci5wbCBhbHNvIGNo
ZWNrcyBhZ2FpbnN0IG91dHB1dCBjcmVhdGVkIGZyb20gDQogICAgZ2V0X21haW50YWluZXIucGwN
CiAgICAoMTc6NDQ6NTgpIGp1ZXJnZW5fZ3Jvc3M6IGxhcnNfa3VydGg6IHdoYXQgYWJvdXQgZG9p
bmcgaXQgdGhlIGVhc3kgd2F5PyANCiAgICBXaXRoIGEgbW9kaWZlZCBNQUlOVEFJTkVSUyBmaWxl
ICh1c2luZyAiTDogeGVuLWRldmVsQGRvcm5lcndvcmtzLmNvbSIpIA0KICAgIGV2ZXJ5dGhpbmcg
aXMgZmluZS4gSSBjYW4gc2VuZCBhIHBhdGNoIGluIGNhc2UgeW91IGFncmVlLg0KICAgICgxNzo0
Njo0MSkgbGFyc19rdXJ0aDoganVlcmdlbl9ncm9zczogbGV0J3MgZG8gdGhhdCBmaXJzdCwgYnV0
IEkgc3RpbGwgDQogICAgd291bGQgbGlrZSB0byBmaXggdGhlIHVuZGVybHlpbmcgaXNzdWUgYXQg
c29tZSBwb2ludCAtIGFza2luZyBmb3IgeW91IHRvIA0KICAgIHNlbmQgdGhlIElSQyBsb2csIGFz
IEkgY2xlYXJlZCBteSBoaXN0b3J5IGJ5IG1pc3Rha2UgKHdoZW4gSSB3YXMgdHlwaW5nIA0KICAg
IGEgcmVwbHkgSSBzbGlwcGVkIGZyb20gc2hpZnQgdG8gY3RybCwgd2hpY2ggZGlkIGl0KQ0KICAg
IA0KICAgIA0KRm9yIG15IG93biByZWZlcmVuY2UsIHRoZSBpc3N1ZSBpcyBzb21ld2hlcmUgaW4g
Z2V0X21haW50YWluZXIucGwsIG5vdCBpbiBhZGRfbWFpbnRhaW5lcnMucGwNCg0KSW4gYSBudXRz
aGVsbCwgYSBsaW5lIHN1Y2ggYXMNCkw6IGZvbyBiYXIgPGUtbWFpbCBhZGRyZXNzPiBpbiBNQUlO
VEFJTkVSUw0KDQpXaWxsIHByb2R1Y2UgYW4gZW1wdHkgbGluZSB3aGVuIGV4ZWN1dGluZyBzdGgg
bGlrZSAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwgPCAuLi9wYXRjaGVzL3Rlc3QvMDAwMS1B
ZGQtdGVzdC1jYXNlLnBhdGNoDQoNCkluIHRoZSB0ZXN0IGNhc2UgSSB1c2VkLCBJIHVzZQ0KTDog
eHh4IHl5eSA8eHh4QGxpc3RzLnhlbnByb2plY3Qub3JnPiBpbiBNQUlOVEFJTkVSUw0KYW5kIGdl
dA0KQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCi4uLg0KV2VpIExp
dSA8d2xAeGVuLm9yZz4NCg0KeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQoNCldoZW4g
SSB1c2UNCkw6IHh4eEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyBpbiBNQUlOVEFJTkVSUw0KSSBnZXQN
CkFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQouLi4NCldlaSBMaXUg
PHdsQHhlbi5vcmc+DQp4eHhAbGlzdHMueGVucHJvamVjdC5vcmcNCnhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KDQpOZWVkIHRvIGludmVzdGlnYXRlIGZ1cnRoZXINCkxhcnMNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
