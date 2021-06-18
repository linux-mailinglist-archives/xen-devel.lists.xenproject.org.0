Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB363AD21F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 20:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144952.266738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luJEd-0007gD-23; Fri, 18 Jun 2021 18:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144952.266738; Fri, 18 Jun 2021 18:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luJEc-0007dU-Ue; Fri, 18 Jun 2021 18:28:54 +0000
Received: by outflank-mailman (input) for mailman id 144952;
 Fri, 18 Jun 2021 18:28:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luJEb-0007dO-HM
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 18:28:53 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc1463f3-1471-4f8e-9544-586c8187f2c3;
 Fri, 18 Jun 2021 18:28:51 +0000 (UTC)
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
X-Inumbo-ID: cc1463f3-1471-4f8e-9544-586c8187f2c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624040931;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=M70gTATHOyQFtqqrtQeN05DFbaJkhmQ4gWznLU+T/Bc=;
  b=JOBVa5d0QiKmmqLusX8dxWbbBmMUkDZE33ZV34M8TbStMU997iEuyAfH
   5uxLsCEqqEx8UKAcv3ZLs+RoFi5zP9/Fbs5W1LcuezXKgJ2Gc6ZIE4VlL
   +/p+SkmfftNZTqSHaobOa0xrTUmofn/V6IYoo4qTgZ6QmPKdxxdbyd8DI
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: p1yKKSg80IUkElYVko/bszzkkhCpRy57MqVSOfWh1lWIHSuGJk2yMgScsZoPduPMT2ujAwco7T
 tVYPW+L6BIdHLtPN/OybwXqzAcBnOfWw4moIkj5GK9J2rkNbBeq0BFeU6f4ORJt1XHGLfZzzS/
 5tK/gbDAZjo1esMAACbTFyOSjvbz7N1/zdyR8X3dwZXDXGk80etk3s+dm3AoYnlVb+V19SHuZq
 q/kJovfijwBtJ+ZCvCsg1NN5rQunRnRUd3599eh03OyPdDNy/ZwfFBFMzX68C7sv4xVRH3j1ab
 oP8=
X-SBRS: 5.1
X-MesageID: 46852530
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wLZUAqDcQp+esv3lHegZsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U4ssQIb6Ku90ci7MD3hHPtOjbX5Uo3SODUO1FHIEGgm1/qa/9SCIVy+ygc+79
 YGT0EWMrSZYjZHZITBkW+F+r0bsbq6GdWT9ILjJgBWPGNXgs9bjztRO0K+KAlbVQNGDZ02GN
 63/cxcvQetfnwRc4CSGmQFd/KrnayJqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 n+lRDj7KnLiYD49vac7R6X031loqqn9jJxPr3LtiHTEES0tu+cXvUkZ1RFhkFsnAjg0idwrD
 CGmWZbAy060QKtQojym2qs5+Co6kde15c7pGXo/kcKeqHCNUwH4xAtv/MkTjLJr0ElppV7iv
 0Wm3+UsJJREHr77VPAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYd099Q/Bmcga+d
 NVfYrhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtV5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdE1JVsJ6d
 38uXZjxCEPkm7VeL+zNaxwg2bwqT+GLEfQI+lllu1EU5PHNcrWDRE=
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46852530"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfS/prxqV3f1b7hP7Mvp+ANlYuiJmaz1bj0otmJX14z05joWQMC+mKdClK6jKSM5/1NfUd9B5H2yD6d76l3OPKtR4ouKbOYnbGNt149lVBQX7RX0Gd5QIy2/U0aOVk+HG2BKI5huoDSQb2RfAg1mkbt95Ly1JOiL3dLLNbNEf6ApPH1JYuvX4QSuUQI/Pz4Jj5CiHUt0jTdyJT31PNbSyKskro8xGZLUWJtiexFmvcd5nXhlxPZFD0xIuipCmtPLGEy4iFcc83wZDW4+1BOmS6Qzi17K/URsEGO82jey7h8/8W8UN3V6Aei2U98v5DOLDSgZAmAV8cx7sJPJnYd/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M70gTATHOyQFtqqrtQeN05DFbaJkhmQ4gWznLU+T/Bc=;
 b=T6WDL5xISxg9X2i4bUn5VYloBcZira2dHuSS1JY2W7l83E5kGMg72G1ZuyHPSYzrPVWeKGdi9AruhJC0M2WzbAZ+mf3quJSkfiOMd2TZppmSPDF4E32F178psTR0z6ABhtdPaDdaKNm7oFVpeTHof813afk8XSalYvB32c/MVHRc2U2o6HsaiKX4PWQ10G3TSGHr4tyI2wNpuXXXp8Y/wYI8kd0U6h3OfYq/yablzPlsDucFRcDRM2TfUobpBupUhy7HnvFVye2HEKq6TIxBFKU8vmMUxinhr+XMyUOz+tzy2N1NrNWERn0XZ8msgxMH2uaO3FU74HrgZg394u3oJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M70gTATHOyQFtqqrtQeN05DFbaJkhmQ4gWznLU+T/Bc=;
 b=BRAGaTRcbHcSkcutE+/o3jQoEYvg0uLCdnhD+s973wmrXQUMnYuVVZkO2MATup+EubN5U5WsH+1SBHk54+IT3VdCqzR0bm+NEYezD+zHNchc+NmEZEcOqsW2PZEHiWKKFce14ibECWKpV++Efzjo41xWqm0w4sXmTNEBKxKUWME=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 12/12] golang/xenlight: add NotifyDomainDeath
 method to Context
Thread-Topic: [RESEND PATCH 12/12] golang/xenlight: add NotifyDomainDeath
 method to Context
Thread-Index: AQHXUNy1vChg4LMpNU6QjEPyRTou1KsaPdIA
Date: Fri, 18 Jun 2021 18:28:47 +0000
Message-ID: <56DEEBE0-88E3-4E00-A998-30FF034BCB73@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <e415b0e26954cfc6689fbd3ba7d79fe664f3bb50.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <e415b0e26954cfc6689fbd3ba7d79fe664f3bb50.1621887506.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c971a2c4-81b1-41b0-15b0-08d93286e97d
x-ms-traffictypediagnostic: PH0PR03MB5797:
x-microsoft-antispam-prvs: <PH0PR03MB5797D9140C0AD46D15BA2B53990D9@PH0PR03MB5797.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ceijTakFFwDDrwJeTlf2NP4wRDsVcSzE5+2SvtsK0szfE1FbWX5WMam10sO/iLEzo5c31PaCgd64ljRfAYJ4/wfmLy20sDZ1p05dcsiJVIobuaTm0qS1FWEQ+Sf+c2I/OshukHVoHsf9543u3ao/OVDVIaE2MepJBBSgDw4r0/LAleJeVJBuTvJmcQ1AA15d0nDs3WMxiLsWnHvoAVCr9yjzxlezqS2Qz4EhtMD3EOgF/GkdxapjCEmLwNzMidhko5kKgl+ZwH1TogNJYPwq25h0R67WEo58TFJAWdoBzw4EZgE9GzAjDrU9xV/Wf7KC4d41j2vK1Eja+jbNfB7/JXG7FQWoBpjuvBfX9P5aoKfaFsu/CCiaJYemxX13eEbCnuwYBts/O7pzngLJ2gY7qR/0xmtvP7cVL04SHMPcYaSuOY/ODylzRmW/zNQWGJKcNZlfdTnOpNHZ1trqFfR/jHx3SN8VL3qJC8RKHnHPP8IEiqqHhZHCKlJB4TKw+iHdxH5CLrF0CzJYSpzMFKESibcWiFRD/jOBpZs4kWWQ4O/QwN1S9TUY1aWd6Bnb8vFozh+It/ZwND/DE0YnQib21bAsru8YSQcljkZpjx5CTa8N3uvPcXSwwk8tVsQDLfyJmQDH1Kp55whM/alYr5mtcfT8OIhuiTiwHb8+x0wB4z4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(66446008)(54906003)(71200400001)(33656002)(64756008)(8936002)(122000001)(2906002)(66476007)(36756003)(91956017)(6916009)(6506007)(76116006)(2616005)(66556008)(316002)(83380400001)(66946007)(186003)(6512007)(5660300002)(478600001)(4326008)(26005)(53546011)(8676002)(86362001)(38100700002)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDhTSFBzc1YxRVdkb0NMSkJhTHVLRXJWRzZSeDRXYnlaZGpHVS8yK2c0dmFp?=
 =?utf-8?B?U1c4TElqRkl6aW9Ddm84SmlZQ3ZXWTNaQ05HV1IzanVROHJic2NzMEdjL0hy?=
 =?utf-8?B?M2VGRld2WmdMc0RuaHUyN0VBSUVLeVVkTWx1TlB2cW1HNVcyTjhiQ2FPRGlm?=
 =?utf-8?B?U2NrRG5JM0krSnNzUnZ5eGgvU0xCcEZ5emRxQWVWZ3ZYWkRhNVJSVm5OL3F3?=
 =?utf-8?B?Uk0wVjlFeDlnNVRXRXdWcTF5R1k5MmpNcUw0cWhkMytyWEoycFdyTlhlckJB?=
 =?utf-8?B?ZHN0c1cxeUw2SjZ2c01taFpMa2lzdnVxTU5oVUw2N3ZBdytYWmxBOE9Ga3RV?=
 =?utf-8?B?ZzRURC8xRSsxQjBzeG1PVDZLQjJkYjJ4MUE2Z08ydmtNR0NUQVBwQXJTcGM1?=
 =?utf-8?B?SkhEa1ltbDVqTktvUVJmVGV0NlBQbTRNUnIvVXBrZGJaUFZJenRlaHRScHpj?=
 =?utf-8?B?RFpjM2FpUkhTQUpyZHlvdG9oeGdMN205T3JVblY5NGRnNTRwZXRwWFZmUUI2?=
 =?utf-8?B?d0ZtaHhJZ3JHUmJUcEtodGxPZ2pKU0tIcDlwOTJsY25QaVdLMFVyQWZRS2U2?=
 =?utf-8?B?SnR3US9QQWE2RitRM3NmTld2MGFhRWo2V2g2OTVaTnp5Nm1GazlGbTBFYXBS?=
 =?utf-8?B?TklJcjc2UW1zR0IrYm4rcllqNWJuV0JWYzVBYkZRaEJlK2FEelFlNy9iRi9j?=
 =?utf-8?B?akd6UDlZM3pPQTR1b0dXWFFWU2Vwd0R3OGViMm9tOWRRQ1lRZys1aG5TZXdr?=
 =?utf-8?B?VHpoUDkxZDlkbGVBbEVqL1NNZFJwVzdTTWhhV2s3T01BdGp3REU2NzlTdllN?=
 =?utf-8?B?V0s1SVNQZ2M1bWV2TlpLSUIyVkJQNm4xeE1UaWc5M3NCN3ZISXJIUitBWkNV?=
 =?utf-8?B?MVpNUmptdFhHZ3RVNDU2enJIdUErT2Z6S1lyYzd1UTNrM2FhVkZwUnkvRDFF?=
 =?utf-8?B?RmhiNVZZZFhiNlJ1ejZIZUpuK0l6bWJMemZ0MStsM01YQm5ZMEdrZzhFNTY4?=
 =?utf-8?B?R25iTzlVRTJjbHZRMGF1U1JNSFpSN0lNaWplTUFMVU5CNU5nR3p5RkoxOHRX?=
 =?utf-8?B?eXlvWjFXVDQzd1hDbEp1SW11SjdlK1dtcEV5UTVTQmF3OGNiTEUyc0pYZWFK?=
 =?utf-8?B?RjV4YjUydWlMTW1YQ0RxbkdpWGR4RXVHNkJXb2o2eHdPNzFuM0p5N2MvRnkw?=
 =?utf-8?B?ZERPM2I2bzJQcWZEZ3B1WFdjZStjUU5NWk5QaXAvcTY4TktBMEtoY0lYL28x?=
 =?utf-8?B?aFRvVVZZMnFFZU4rdENzNSt6NTg2akgrM3JERDE4QmZlL2ZqbGVwbnNBWUJI?=
 =?utf-8?B?d2Y3VTFNTlFObVVLOE5Lei9ka2JaWW5JSWI5dEMyNldtTU92WmF6VEp4c3dl?=
 =?utf-8?B?LzZwcDRMNHJFaFdTSVNIYy8zWC9ZVXV0b09HK0NDb3dhdWQ2NFE1RWRZdkV5?=
 =?utf-8?B?UEpidFU2L3VxUFBja0h4MXg1KzEzT1FBL1NTSWhGN0wxQ1dHbndZTTduTWtk?=
 =?utf-8?B?eGlEdEhoODFrUmlhVXE1VGkySHZKQ3Nhay92T3NDWFFCUnJ5T3NQV2x3L1RX?=
 =?utf-8?B?ZFgvK3JrdGlTVGxTUFdlOER6SjBGVWJnYTdMRnVEbEVWbkkrdVhhZ2hFYnBO?=
 =?utf-8?B?WUJETXdvV2Jmd29KS21hMDNwSjFKTVlvTVJQNTk1Nmp3bkhZODBxSHErc2VY?=
 =?utf-8?B?eVR2YVQ4QXpER3g5ZGllM1ROY2lZeG4rSk93Y3lWdzRuOEk1azVBa1hwT1dh?=
 =?utf-8?Q?rJScgmv4qya2Zbe1eAw6zZ4X6/ioG50csi9OrXl?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDB28C33B02CEB4FA78C64FC39702B64@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c971a2c4-81b1-41b0-15b0-08d93286e97d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 18:28:47.3025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KuS49agjjdG4qcG9PwqyAFOOhLOeb2wN154WywnjTaTHVK3cVKw/OQfCWzuOhKeWrOCIILdQEYtoJoxSYj/SeoJ7iqC7JoMufC6szeUepBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5797
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWF5IDI0LCAyMDIxLCBhdCA5OjM2IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEFkZCBhIGhlbHBlciBmdW5jdGlvbiB0byB3YWl0
IGZvciBkb21haW4gZGVhdGggZXZlbnRzLCBhbmQgdGhlbiB3cml0ZQ0KPiB0aGUgZXZlbnRzIHRv
IGEgcHJvdmlkZWQgY2hhbm5lbC4gVGhpcyBoYW5kbGVzIHRoZSBlbmFibGluZy9kaXNhYmxpbmcg
b2YNCj4gdGhlIGV2ZW50IHR5cGUsIGZyZWVpbmcgdGhlIGV2ZW50LCBhbmQgY29udmVydGluZyBp
dCB0byBhIEdvIHR5cGUuIFRoZQ0KPiBjYWxsZXIgY2FuIHRoZW4gaGFuZGxlIHRoZSBldmVudCBo
b3dldmVyIHRoZXkgbmVlZCB0by4gVGhpcyBmdW5jdGlvbg0KPiB3aWxsIHJ1biB1bnRpbCBhIHBy
b3ZpZGVkIGNvbnRleHQuQ29udGV4dCBpcyBjYW5jZWxsZWQuDQo+IA0KPiBOb3RpZnlEb21haW5E
ZWF0aCBzcGF3bnMgdHdvIGdvcm91dGluZXMgdGhhdCByZXR1cm4gd2hlbiB0aGUNCj4gY29udGV4
dC5Db250ZXh0IGlzIGRvbmUuIFRoZSBmaXJzdCB3aWxsIG1ha2Ugc3VyZSB0aGF0IHRoZSBkb21h
aW4gZGVhdGgNCj4gZXZlbnQgaXMgZGlzYWJsZWQsIGFuZCB0aGF0IHRoZSBjb3JyZXNwb25kaW5n
IGV2ZW50IHF1ZXVlIGlzIGNsZWFyZWQuDQo+IFRoZSBzZWNvbmQgY2FsbHMgbGlieGxfZXZlbnRf
d2FpdCwgYW5kIHdyaXRlcyB0aGUgZXZlbnQgdG8gdGhlIHByb3ZpZGVkDQo+IGNoYW5uZWwuDQo+
IA0KPiBXaXRoIHRoaXMsIGNhbGxlcnMgc2hvdWxkIGJlIGFibGUgdG8gbWFuYWdlIGEgZnVsbCBk
b21haW4gbGlmZSBjeWNsZS4NCj4gQWRkIHRvIHRoZSBjb21tZW50IG9mIERvbWFpbkNyZWF0ZU5l
dyBzbyB0aGF0IHBhY2thZ2UgdXNlcyBrbm93IHRoZXkNCj4gc2hvdWxkIHVzZSB0aGlzIG1ldGhv
ZCBpbiBjb25qdW5jdGlvbiB3aXRoIERvbWFpbkNyZWF0ZU5ldy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+DQo+IC0tLQ0KPiB0b29s
cy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCA4MyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystDQo+IDEgZmlsZSBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0Lmdv
IGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvDQo+IGluZGV4IDZmYjIyNjY1Y2Mu
Ljg0MDY4ODM0MzMgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdo
dC5nbw0KPiArKysgYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28NCj4gQEAgLTUz
LDYgKzUzLDcgQEAgaW1wb3J0ICJDIg0KPiAgKi8NCj4gDQo+IGltcG9ydCAoDQo+ICsJImNvbnRl
eHQiDQo+IAkiZm10Ig0KPiAJIm9zIg0KPiAJIm9zL3NpZ25hbCINCj4gQEAgLTEzNDAsNyArMTM0
MSw5IEBAIGZ1bmMgKGN0eCAqQ29udGV4dCkgRGV2aWNlVXNiZGV2UmVtb3ZlKGRvbWlkIERvbWlk
LCB1c2JkZXYgKkRldmljZVVzYmRldikgZXJyb3INCj4gCXJldHVybiBuaWwNCj4gfQ0KPiANCj4g
LS8vIERvbWFpbkNyZWF0ZU5ldyBjcmVhdGVzIGEgbmV3IGRvbWFpbi4NCj4gKy8vIERvbWFpbkNy
ZWF0ZU5ldyBjcmVhdGVzIGEgbmV3IGRvbWFpbi4gQ2FsbGVycyBvZiBEb21haW5DcmVhdGVOZXcg
YXJlDQo+ICsvLyByZXNwb25zaWJsZSBmb3IgaGFuZGxpbmcgdGhlIGRlYXRoIG9mIHRoZSByZXN1
bHRpbmcgZG9tYWluLiBUaGlzIHNob3VsZCBiZQ0KPiArLy8gZG9uZSB1c2luZyBOb3RpZnlEb21h
aW5EZWF0aC4NCj4gZnVuYyAoY3R4ICpDb250ZXh0KSBEb21haW5DcmVhdGVOZXcoY29uZmlnICpE
b21haW5Db25maWcpIChEb21pZCwgZXJyb3IpIHsNCj4gCXZhciBjZG9taWQgQy51aW50MzJfdA0K
PiAJdmFyIGNjb25maWcgQy5saWJ4bF9kb21haW5fY29uZmlnDQo+IEBAIC0xMzU4LDYgKzEzNjEs
ODQgQEAgZnVuYyAoY3R4ICpDb250ZXh0KSBEb21haW5DcmVhdGVOZXcoY29uZmlnICpEb21haW5D
b25maWcpIChEb21pZCwgZXJyb3IpIHsNCj4gCXJldHVybiBEb21pZChjZG9taWQpLCBuaWwNCj4g
fQ0KPiANCj4gKy8vIE5vdGlmeURvbWFpbkRlYXRoIHJlZ2lzdGVycyBhbiBldmVudCBoYW5kbGVy
IGZvciBkb21haW4gZGVhdGggZXZlbnRzIGZvciBhDQo+ICsvLyBnaXZlbiBkb21uaWQsIGFuZCB3
cml0ZXMgZXZlbnRzIHJlY2VpdmVkIHRvIGVjLiBOb3RpZnlEb21haW5EZWF0aCByZXR1cm5zIGFu
DQo+ICsvLyBlcnJvciBpZiBpdCBjYW5ub3QgcmVnaXN0ZXIgdGhlIGV2ZW50IGhhbmRsZXIsIGJ1
dCBvdGhlciBlcnJvcnMgZW5jb3VudGVyZWQNCj4gKy8vIGFyZSBqdXN0IGxvZ2dlZC4gVGhlIGdv
cm91dGluZSBzcGF3bmVkIGJ5IGNhbGxpbmcgTm90aWZ5RG9tYWluRGVhdGggcnVucw0KPiArLy8g
dW50aWwgdGhlIHByb3ZpZGVkIGNvbnRleHQuQ29udGV4dCdzIERvbmUgY2hhbm5lbCBpcyBjbG9z
ZWQuDQo+ICtmdW5jIChjdHggKkNvbnRleHQpIE5vdGlmeURvbWFpbkRlYXRoKGMgY29udGV4dC5D
b250ZXh0LCBkb21pZCBEb21pZCwgZWMgY2hhbjwtIEV2ZW50KSBlcnJvciB7DQo+ICsJdmFyIGRl
YXRodyAqQy5saWJ4bF9ldmdlbl9kb21haW5fZGVhdGgNCj4gKw0KPiArCXJldCA6PSBDLmxpYnhs
X2V2ZW5hYmxlX2RvbWFpbl9kZWF0aChjdHguY3R4LCBDLnVpbnQzMl90KGRvbWlkKSwgMCwgJmRl
YXRodykNCj4gKwlpZiByZXQgIT0gMCB7DQo+ICsJCXJldHVybiBFcnJvcihyZXQpDQo+ICsJfQ0K
PiArDQo+ICsJLy8gU3Bhd24gYSBnb3JvdXRpbmUgdGhhdCBpcyByZXNwb25zaWJsZSBmb3IgY2xl
YW5pbmcgdXAgd2hlbiB0aGUNCj4gKwkvLyBwYXNzZWQgY29udGV4dC5Db250ZXh0J3MgRG9uZSBj
aGFubmVsIGlzIGNsb3NlZC4NCj4gKwlnbyBmdW5jKCkgew0KPiArCQk8LWMuRG9uZSgpDQo+ICsN
Cj4gKwkJY3R4LmxvZ2QoImNsZWFuaW5nIHVwIGRvbWFpbiBkZWF0aCBldmVudCBoYW5kbGVyIGZv
ciBkb21haW4gJWQiLCBkb21pZCkNCj4gKw0KPiArCQkvLyBEaXNhYmxlIHRoZSBldmVudCBnZW5l
cmF0aW9uLg0KPiArCQlDLmxpYnhsX2V2ZGlzYWJsZV9kb21haW5fZGVhdGgoY3R4LmN0eCwgZGVh
dGh3KQ0KPiArDQo+ICsJCS8vIE1ha2Ugc3VyZSBhbnkgZXZlbnRzIHRoYXQgd2VyZSBnZW5lcmF0
ZWQgZ2V0IGNsZWFuZWQgdXAgc28gdGhleQ0KPiArCQkvLyBkbyBub3QgbGluZ2VyIGluIHRoZSBs
aWJ4bCBldmVudCBxdWV1ZS4NCj4gKwkJdmFyIGV2YyAqQy5saWJ4bF9ldmVudA0KPiArCQlmb3Ig
ew0KPiArCQkJcmV0IDo9IEMubGlieGxfZXZlbnRfY2hlY2soY3R4LmN0eCwgJmV2YywgQy5MSUJY
TF9FVkVOVE1BU0tfQUxMLCBuaWwsIG5pbCkNCj4gKwkJCWlmIHJldCAhPSAwIHsNCj4gKwkJCQly
ZXR1cm4NCj4gKwkJCX0NCj4gKwkJCUMubGlieGxfZXZlbnRfZnJlZShjdHguY3R4LCBldmMpDQoN
CkkgaGF2ZSB0byBhZG1pdCwgSSBkb27igJl0IHJlYWxseSB1bmRlcnN0YW5kIGhvdyB0aGUgbGli
eGwgZXZlbnQgc3R1ZmYgaXMgc3VwcG9zZWQgdG8gd29yay4gIEJ1dCBpdCBsb29rcyBsaWtlIHRo
aXMgd2lsbCBkcmFpbiBhbGwgZXZlbnRzIG9mIGFueSB0eXBlLCBmb3IgYW55IGRvbWFpbiwgYXNz
b2NpYXRlZCB3aXRoIHRoaXMgY29udGV4dD8NCg0KU28gaWYgeW91IGhhZCB0d28gZG9tYWlucywg
YW5kIGNhbGxlZCBOb3RpZnlEb21haW5EZWF0aCgpIG9uIGJvdGggd2l0aCBkaWZmZXJlbnQgY29u
dGV4dHMsIGFuZCB5b3UgY2xvc2VkIHRoZSBvbmUgY29udGV4dCwgeW91IG1pZ2h0IG1pc3MgZXZl
bnRzIGZyb20gdGhlIG90aGVyIGNvbnRleHQ/DQoNCk9yLCBzdXBwb3NlIHlvdSBkaWQgdGhpczoN
CiAqIGN0eC5Ob3RpZnlEb21haW5EZWF0aChjdHgxLCBkb20xLCBlYzEpDQogKiBjdHguTm90aWZ5
RGlza0VqZWN0KGN0eDIsIGRvbTEsIGVjMikNCiAqIGN0eDFDYW5jZWxGdW5jKCkNCg0KV291bGRu
4oCZdCB0aGVyZSBiZSBhIHJpc2sgdGhhdCB0aGUgZGlzayBlamVjdCBtZXNzYWdlIHdvdWxkIGdl
dCBsb3N0Pw0KDQpJYW4sIGFueSBzdWdnZXN0aW9ucyBmb3IgdGhlIHJpZ2h0IHdheSB0byB1c2Ug
dGhlc2UgZnVuY3Rpb25zIGluIHRoaXMgc2NlbmFyaW8/DQoNCiAtR2VvcmdlDQoNCg==

