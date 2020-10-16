Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389E62909B5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 18:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8180.21791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTScJ-0000Lw-FF; Fri, 16 Oct 2020 16:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8180.21791; Fri, 16 Oct 2020 16:30:07 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTScJ-0000LX-At; Fri, 16 Oct 2020 16:30:07 +0000
Received: by outflank-mailman (input) for mailman id 8180;
 Fri, 16 Oct 2020 16:30:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7OI=DX=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kTScH-0000Dv-KD
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:30:05 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 907992da-8fad-4150-8a01-9714ff5069ad;
 Fri, 16 Oct 2020 16:30:04 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=k7OI=DX=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kTScH-0000Dv-KD
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:30:05 +0000
X-Inumbo-ID: 907992da-8fad-4150-8a01-9714ff5069ad
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 907992da-8fad-4150-8a01-9714ff5069ad;
	Fri, 16 Oct 2020 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602865805;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=+PmAnM4uvorTQPw2AeRa/U2NxnD/M6ErGu5GxzohOnI=;
  b=PwB+CRq0hDGeYv4UPGimfp0FYRKRB3NZWgCTLjUK0/DTERh/Iri/2kgN
   owUhAbKlMFqyc25UObC6i+/IIa7bDwn2bgr3kR7jcWbeLamBIif/J5uZT
   NGIH9EcI5zRd9zwQSdRHu/TQ3teIj1YRloGhXaEoTP9764914lCzZxjid
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: noZIpdj67tA5J8oXSxfBQYacU3rd+GsZe59ZN9hfPD8H+rOyCZl5Qqg/ZpJiKqqdhUYOlgxUIh
 x/B7BuUUkbZfi2Nr/MOysmydwSI5aqgUrs/Up6+fUA+29XIJXJXB0QPelGIa2yKVWQx//UA1YC
 L5/mzzb+WRsN53Z/rp4Xup6/V4/lI7TZB3C3EERI/jjXBPxyLcaHRvbeI2gXUmWlMkStTsZtye
 Sg5V4BQ3DGFdZ8ZrlqiFBZ3u+/ER6AAO/CbKnDOk4Mdi9TekG8pjalsK8OCuUb649p07MMOVmS
 Edo=
X-SBRS: 2.5
X-MesageID: 29521653
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,383,1596513600"; 
   d="scan'208";a="29521653"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0YyJ8tZXp72V7VasgNh6h+i4n2tJtjdIHSYxjyHUGuzWzFz6KUIUbVwj39oh2N+uCom/7oekDYABvG/hIbJ3jHd+fcScenkCPSqwYM0eNQpOiupNl7PhnlizvHv5EmqjSA5tqofKD/+vk0gXZdvNBVI7yCLtGTiOW/7TXo/fAGRCHh00M0cAPPBP7+jv5GMfQszLSuqCzytKRfSryGApreij8haJXRq0OMsFt/I/SVv0HBFvmgI1EYUY02K5EKyXK2inmqws82XfnAhZ849gpjEsNPAAhjtsr53iPotfq0uGF9XZkuUKz4uTZTohlrhfbCX7sejyVGq/i4vzAB7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PmAnM4uvorTQPw2AeRa/U2NxnD/M6ErGu5GxzohOnI=;
 b=Zb/l7rLc1LYtAIYwewZ1nRCq8TUamz2DKJDlvqHAC+ebvOHwAK0WsGe1leQbbUobkhoIw8KBafAx5MQEQmQ/G4rSmOLMdnSQuvUNYOi9649ncss3rEPc4tsgKunIasBDHp3yhXFAqNUu3ALgr7GBuULGzxHTxvUxQj/pIJgRzPBhtnlp/V2rlqlloBoqm/Lq7Vu+9rP9mUxCFLhJHSWWx4rtKO13imXgGLSxhrs3l4+n3XbqlPkKWlvoZT1BRKuIdk7fa4KcRF1JhyCI0B++qKGaruIWQ6aqvy9t5sOYXfa7WHl5RvwJ3npiHhOQjzfas7qg1EeOtECzacUxJ4FDZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PmAnM4uvorTQPw2AeRa/U2NxnD/M6ErGu5GxzohOnI=;
 b=SMDUngB+8uN4WkIGPUTr8W3sH53Z5AodQM3xmrTC+QsNzSEFb22Y3Nrr0uYJR71SzQ310Iw0ROwmwKGOITBIIS06z5dDujkNzrmDAhdrUZqX3KT6EQPVIwiPOPhnacNmv1CAmfLKMqH+DwBevkwF9YsFE2XGFy+gNAFdpgm17bU=
From: George Dunlap <George.Dunlap@citrix.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>
CC: Nick Rosbrook <rosbrookn@gmail.com>, Rich Persaud <persaur@gmail.com>, Ian
 Jackson <iwj@xenproject.org>, Olivier Lambert <olivier.lambert@vates.fr>,
	Edwin Torok <edvin.torok@citrix.com>
Subject: RFC: Early mock-up of a xenopsd based on golang libxl bindings
Thread-Topic: RFC: Early mock-up of a xenopsd based on golang libxl bindings
Thread-Index: AQHWo9mWX/nzbew8RUGADXmvLnD2mQ==
Date: Fri, 16 Oct 2020 16:29:58 +0000
Message-ID: <84FEBEAF-5859-421E-B595-2358D8490D3F@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d54db249-6256-42a6-0d54-08d871f0b90d
x-ms-traffictypediagnostic: BYAPR03MB3816:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB3816C62B5AEAF9BD59D72CFE99030@BYAPR03MB3816.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aR+1Z8XRikOKYatX+/sDhuh08/M0wRTJZSiAAq65SBar7CqPfYqt90LsfthPQR14TT4UFofIW/+vNN34KPknxaYZAG8jltr0NpVa5ppTZCC03rXuSdL9UsismNhFE+9qGVUq2bB3iDP6WC6n/kfG9Q8iWFctq6pjASDJBjZtP3l1Gde6pSnJo1No8/9TeQwsQthNluvlyjg7Y2+eqWNH3JHjzeHQTCCgMHLDeKOwB148XvlVTPziNk20E7BxoLNq3JrtuixRWevVhROokba+qhIpv+PCGrbXGDWHQiVh7rXsY49KGvKOrbGdSHeqplwbl7dG08dyKi1Ie+keYGUL5EsVR9yjPfjSOOTPIeGoT3ssB0XpQ+OYt/tXhAENR2Mwop2W+R5m2BtDFiEgBt34zA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(86362001)(26005)(55236004)(76116006)(54906003)(66946007)(316002)(107886003)(478600001)(8676002)(966005)(91956017)(71200400001)(8936002)(2616005)(6512007)(5660300002)(2906002)(33656002)(6916009)(6486002)(66476007)(66446008)(186003)(83380400001)(64756008)(36756003)(6506007)(4326008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 93NRJGpxHbcBtEp3ABcL6sv3Aeudsnv7l9ouJPm777dCgbGHORJJc8rfIQun4g/L+4jOn3wpgORMpYoVgHUfZmXSqMj3N+6kJPAmkPacCfb+rDq5tAF2fJA0OR1486mxJf5DBA/yRf16/JzykgknIuxlrDWiRJYW6x8+fWG7sYqY/uk3hVFB4m9FgepGjdtE4pUi29rcDv0g6HaymulnrNTwEMA+NfLsqvrGmD6GWC54J0jK3sDoQRN1bat+4tSPn513f3ZdbgKOOo2vVm9NGfisRiHoRXcbyhD+x+9adOgc1AWmNYq9oU3su+giSOait+ENw9ASi6uQadWUHR+VlfhLMVC7n19Mef118G3HJoRu3ZEK+otuuQda84zNGnE1Wkm5bEhhF2yUDuTRAM728T1jgfeX5OZthq0qanaZWzxSo9rzQSO+EoW1j4zX537Kv+EfkLbEO4i3jas3mkKDtpdvseyTp2OgXnZFs5Uxf+n3r/o9QhJwl8nVnAAEsRgixt35t/z2BSdq/EvdWbwmqlGZyEINpqlZkYCKJz+hOxK5oFsI60x995xjQKWI2KoLsuRzHWUGOrzYnmdCpqkkmtA+Mu1uJAN67rtrcSsbsiDPDxZgMcEJuAXLouvTuWxW70j19jzAQaYu8bxNQK6jkw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9A4F276E48BBC4BAAAD41849955E6A2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54db249-6256-42a6-0d54-08d871f0b90d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 16:29:58.1936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WT8Utg08NMQ0HmA2IbBH7S9FYetaTWZvFjpd9zx2VNcWKohlejxno7Y7ApMGs0/8n0nrHquebbeGg/QqyhrHH71wgVelzp8lhCdDKO3B4Wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3816
X-OriginatorOrg: citrix.com

aHR0cHM6Ly9naXRsYWIuY29tL21hcnR5cm9zL2dvLXhlbiBicmFuY2ggYHdvcmtpbmcveGVub3Bz
YCBjb250YWlucyBhIHN1cGVyLWJhc2ljIG1vY2stdXAgb2YgYSB1bml4IGRvbWFpbiB4ZW5vcHNk
IGJhc2VkIG9uIHRoZSBnb2xhbmcgbGlieGwgYmluZGluZ3MuDQoNClRvIHVzZToNCg0KKiBJbnN0
YWxsIFhlbiA+PSA0LjE0IG9uIHlvdXIgdGFyZ2V0IHN5c3RlbQ0KDQoqIE1ha2Ugc3VyZSB5b3Ug
aGF2ZSBnbyA+PSAxLjExIGluc3RhbGxlZA0KDQoqIENsb25lICYgYnVpbGQgdGhlIHNlcnZlcg0K
DQokIGdpdCBjbG9uZSBodHRwczovL2dpdGxhYi5jb20vbWFydHlyb3MvZ28teGVuDQoNCiQgY2Qg
Z28teGVuDQoNCiQgZ2l0IGNoZWNrb3V0IHdvcmtpbmcveGVub3BzDQoNCk5vdGUgdGhhdCB0aGlz
IGlzICpub3QqIGEgZmFzdC1mb3J3YXJkaW5nIGJyYW5jaC4NCg0KJCBjZCB4ZW5vcHMveGVub3Bz
ZA0KDQokIGdvIGJ1aWxkDQoNCiQgLi94ZW5vcHNkDQoNClRoZW9yZXRpY2FsbHkgdGhpcyB3aWxs
IG5vdyBhY2NlcHQganNvbnJwYyB2MSBjYWxscyBvbiBgL3RtcC94ZW5vcHNgLiAgSSBoYXZlbuKA
mXQgZHVnIGludG8gZXhhY3RseSB3aGF0IHRoZSB3aXJlIHByb3RvY29sIGxvb2tzIGxpa2UsIGJ1
dCB5b3UgY2FuIHRlc3QgZ29sYW5n4oCZcyB2ZXJzaW9uIG9mIGl0IGJ5IHVzaW5nIG9uZSBvZiB0
aGUg4oCcY2xpZW50IGV4YW1wbGVz4oCdLiAgSW4gYW5vdGhlciB0ZXJtaW5hbDoNCg0KJCBjZCB4
ZW5vcHMvY2xpZW50LWV4YW1wbGVzDQoNCiQgZ28gcnVuIGdldC1kb21haW5zLWV4YW1wbGUuY28N
Cg0KSXQgc2hvdWxkIGxpc3QgdGhlIGN1cnJlbnRseS1ydW5uaW5nIGRvbWFpbnMgYW5kIHRoZWly
IGRvbWFpbiBuYW1lcy4NCg0KVGhlIGNvcmUgb2YgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBp
cyBpbiBnby14ZW4veGVub3BzL3hlbm9wcy94ZW5vcHMuZ28uICBCYXNpY2FsbHksIGV2ZXJ5IG1l
dGhvZCB5b3UgYWRkIHRvIHRoZSBYZW5vcHMgdHlwZSBvZiB0aGUgY29ycmVjdCBmb3JtYXQgKGRl
c2NyaWJlZCBpbiB0aGUg4oCcbmV0L3JwY+KAnSBkb2N1bWVudGF0aW9uKSB3aWxsIGJlIGV4cG9z
ZWQgYXMgYSBtZXRob2QgYXZhaWxhYmxlIHZpYSBSUEMuDQoNClRoZSBjdXJyZW50IGNvZGUgb25s
eSBkb2VzIGEgVW5peCBzb2NrZXQsIGJ1dCBpdCBjb3VsZCBlYXNpbHkgYmUgbW9kaWZpZWQgdG8g
d29yayBvdmVyIGh0dHAgYXMgd2VsbC4NCg0KT25jZSB3ZSBoYXZlIGZ1bmN0aW9uIHNpZ25hdHVy
ZXMgaW4gdGhlIGxpYnhsIElETCwgdGhlIHhlbm9wcyBtZXRob2RzIGNvdWxkIGFsbCBiZSBhdXRv
Z2VuZXJhdGVkLCBqdXN0IGxpa2UgdGhlIHR5cGVzIGFyZSBmb3IgdGhlIGdvbGFuZyBiaW5kaW5n
cy4NCg0KSXQgc2hvdWxkIGJlIG5vdGVkIHRoYXQgYXQgdGhlIG1vbWVudCB0aGVyZSB3aWxsIGJl
IHR3byDigJxsYXllcnPigJ0gb2YgdHJhbnNsYXRpb24gYm90aCB3YXlzIGhlcmU6IFRoZSBnb2xh
bmcgcGFja2FnZSB3aWxsIGJlIGNvbnZlcnRpbmcgcnBjIGludG8gZ29sYW5nIHN0cnVjdHVyZXMs
IHRoZW4gdGhlIGxpYnhsIGxpYnJhcmllcyB3aWxsIGJlIGNvbnZlcnRpbmcgZ29sYW5nIHN0cnVj
dHVyZXMgaW50byBDIHN0cnVjdHVyZXM7IHRoZW4gYW55IHJldHVybiB2YWx1ZXMgaGF2ZSB0byBi
ZSBjb252ZXJ0ZWQgZnJvbSBDIHN0cnVjdHVyZXMgaW50byBnb2xhbmcgc3RydWN0dXJlcywgYW5k
IHRoZW4gY29udmVydGVkIGEgZ2FpbiBmcm9tIGdvbGFuZyBzdHJ1Y3R1cmVzIGludG8ganNvbiBi
ZWZvcmUgYmVpbmcgc2VudCBiYWNrIG92ZXIgdGhlIHdpcmUuICBUaGlzIG1heSBvciBtYXkgbm90
IGJlIGEgYmlnIG92ZXJoZWFkLg0KDQpUd28gdGhpbmdzIHRoYXQgYXJlIGN1cnJlbnRseSBzdWIt
b3B0aW1hbCBhYm91dCB0aGUgYHhlbmxpZ2h0YCBwYWNrYWdlIGZvciB0aGlzIHVzZSBjYXNlLg0K
DQpGaXJzdCwgYWx0aG91Z2ggd2UgaGF2ZSBhIHhlbmxpZ2h0LkVycm9yIHR5cGUsIGEgbG90IG9m
IHRoZSB4ZW5saWdodCB3cmFwcGVycyByZXR1cm4gYSBnZW5lcmljIOKAnGVycm9y4oCdLiAgSeKA
mW0gbm90IHN1cmUgaG93IHRoYXQgd2lsbCBlbmQgdXAgYmVpbmcgY29udmVydGVkIGludG8ganNv
biwgYnV0IHdlIG1pZ2h0IHRoaW5nIGFib3V0IG1ha2luZyB0aGUgeGVubGlnaHQgd3JhcHBlcnMg
YWxsIHJldHVybiB4ZW5saWdodC5FcnJvciBpbnN0ZWFkLg0KDQpTZWNvbmRseSwgYXQgdGhlIG1v
bWVudCB0aGUgeGVubGlnaHQgdHlwZXMgYXJlIGluIHRoZSBzYW1lIHBhY2thZ2UgYXMgdGhlIGZ1
bmN0aW9uIHdyYXBwZXJzLiAgVGhpcyBtZWFucyB0aGF0IGluIG9yZGVyIHRvIGJ1aWxkIGV2ZW4g
dGhlIGNsaWVudCwgeW91IG5lZWQgdG8gYmUgYWJsZSB0byBsaW5rIGFnYWluc3QgYW4gaW5zdGFs
bGVkIGxpYnhsIGxpYnJhcnkg4oCUIGV2ZW4gdGhvdWdoIHRoZSBmaW5hbCBiaW5hcnkgd29u4oCZ
dCBuZWVkIHRvIGxpbmsgYWdhaW5zdCBsaWJ4bCBhdCBhbGwsIGFuZCBjb3VsZCB0aGVvcmV0aWNh
bGx5IGJlIG9uIGEgY29tcGxldGVseSBzZXBhcmF0ZSBob3N0Lg0KDQpVbmZvcnR1bmF0ZWx5IHRo
ZSB3YXkgd2XigJl2ZSBzdHJ1Y3R1cmVkIHhlbmxpZ2h0LCBpdOKAmXMgbm90IHNpbXBsZSB0byBt
b3ZlIHR5cGVzLmdlbi5nbyBpbnRvIGl0cyBvd24gcGFja2FnZSwgYmVjYXVzZSBvZiB0aGUgdG9D
IGFuZCBmcm9tQyB3cmFwcGVycywgd2hpY2ggKmRvKiBuZWVkIHRvIGxpbmsgYWdhaW5zdCBsaWJ4
bCAoZm9yIHRoZSBpbml0IGFuZCBkaXNwb3NlIGZ1bmN0aW9ucykuICBOaWNrLCB3ZSBtaWdodCB0
aGluayBhYm91dCB3aGV0aGVyIHdlIHNob3VsZCBtYWtlIHNlcGFyYXRlIHRvQyBhbmQgZnJvbUMg
ZnVuY3Rpb25zIGZvciBlYWNoIG9mIHRoZSB0eXBlcywgcmF0aGVyIHRoYW4gbWFraW5nIHRob3Nl
IG1ldGhvZHMuDQoNCiAtR2Vvcmdl

