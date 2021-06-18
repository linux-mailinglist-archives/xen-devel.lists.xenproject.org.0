Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0992C3ACC12
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144637.266196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luERU-0001Us-F4; Fri, 18 Jun 2021 13:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144637.266196; Fri, 18 Jun 2021 13:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luERU-0001SS-Az; Fri, 18 Jun 2021 13:21:52 +0000
Received: by outflank-mailman (input) for mailman id 144637;
 Fri, 18 Jun 2021 13:21:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luERT-0001SM-4t
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:21:51 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf25ae9a-eb27-4237-b426-34f271b611ad;
 Fri, 18 Jun 2021 13:21:50 +0000 (UTC)
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
X-Inumbo-ID: bf25ae9a-eb27-4237-b426-34f271b611ad
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624022510;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZTGNRY6RzNc22ivIBlxCdmgY7xbLd7ZEvjrlaUuZ+Kc=;
  b=BtaWEPhVKZa8a8EukgqKRmOeuWV/GD/fw32JjiW1vimHCygu5sgI5a4m
   SCGWMsVfDBcy9eF1TPUq68SQRmpXeylztnxzGxtgge4lcn7FKSXV6i6fr
   uJjfSh3V7sxPJoTPJIgmUXek4kJURKFMPHXb5C9f2+fF17L0r1nJ0L3Yp
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kSEflNvjIiGg/SfjPtCIj1IY0d89ASSG5ROKnbS0cyzL/EL0xYhcH5dC3/3mHiQVhHDTuMUXc2
 HUTSTo8VFxfX540yCsAVllqlwZ3fUp+4Zi4uf3F/41CoELgw6XMepOXVXoAB2W32/XysW8XQJ0
 evtKSId4SnS2tubclcaIpKv23z+jNWhDkYRV+i3ZPsKJNJZHIuS681BB99uOfudH82eQddyglq
 06ph5iqifnNStoQm1soIy1xZxrLubwb0bCt/YOLY5juihzj7FnHUJ9rhsIUHrm3Wb2ZNO/TFVq
 VUk=
X-SBRS: 5.1
X-MesageID: 46444919
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2smU8agr/BSVyuQdrGKAuK8pD3BQX2p13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3IwerwRJVpQRvnhPpICRF4B8bjYOCUghrWEGgE1/qg/9SAIVy+ygc578
 ZdmsdFeaXN5DRB/KTHCUyDYqsdKbq8geKVbIXlvgxQpGhRAskKhWoYe2Wm+w9NNXN77PICZc
 ahD6F81l2dkAEsH72G7w4+Lo7+TrPw5ffbSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkiTij5/T9s2T+1v57Sv+/p5WkNzuxp9oH8qXkPUYLT3ql0KBeJlhYbufpzo4ydvfrGrC0e
 O85CvIDf4Dsk85TVvF+ScFHDOQiwrG3kWSj2NwR0GT+/ARCghKVvapzrgpDCcxo3BQze2Ulp
 g7gF5x/qAnfi/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvsX+8gP87bVLHAa0cYa
 JT5fvnlbxrmJKhHgbkl3gqxMbpUmU4Hx+ATERHssuJ0yJOlHQ8y0cD3sQQknoJ6Zp4EvB/lq
 v5G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJNG6JO1zoGKwOJnqIoZ/q57c+4v2sZfUzvdcPcV
 T6IRtlXEsJCgzT4OG1rel2GyH2MSyAtG7Wu7RjDrBCy8rBrZTQQF++dGw=
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46444919"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JC1HKCZhhE2dIq64w/tVb1UT70USU/rLyfq1a2HH4Vd0ItfVTjjk3bb3XyYXf52XlaiwZQBm1zCZAdKtEZVFGwTg+7fXXkJziAKb0tgd371Q3b78mrMq2NGKhCWWgtBNr1JBvxSqaZf3Swe4fEbaqy78O4pUSSvjai2nRneBPYSC2cF3fYiMrnPTc/77PtC6tvS6lv1aksdeGVChz/Kqf4tPQ8z+e3b/Pm1V7tBl6iF/COsi0on6d5GrzMWpFfpTdkqiKkcDy0KTiFA47O7xaN4EHDGgRP3Tnc3wNM4XSk9ASovoXoeHc/Yy91yRBlFEKqXo9rZDMzLF3XKjH7tlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTGNRY6RzNc22ivIBlxCdmgY7xbLd7ZEvjrlaUuZ+Kc=;
 b=mXJWwJUETDc3bCckJCfHiEtULa835uYUjmWUdIIkQ0Tsdn1WQWuJge5dRdbckOFU7QffpeffBJheR75PzGkVCdbuC8kaO4/7TOY1PkH6T/d428XDiTTqoBeX+Oow1D9so4ErhzkDw7vb2O6u+yEtOkK9AEQmpSRGHQP/xx/KBux6iX8hjB1d5Uwa3CLw96817TkYvNoa6cJl2BlZv8pVj8D+OgzbGijsvBioWaQDXlpe0Pd8/nS5fWUWAJc2NYGnJBe0fDBkURvhtFX4eVuC1D4mss5ZMTQVZ/H3MjCcob3hv7iAdVIgjTV1AOXFycGaUbDxKcR7AqLXLAkCxmqJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTGNRY6RzNc22ivIBlxCdmgY7xbLd7ZEvjrlaUuZ+Kc=;
 b=mVDSW3gYuQUKjTf1ucLM4KF+Y16h3XcFtQ0mVsZlmsvZdJMRO6xhMcuh4efthi+YFu5Hk8FOjd6/3v8wZvw8z3PJDNSHHcRY8nC0DRTG02uBuVlXI6BE0xUzDDH2WUSUnilukLfae08yvHuEu+UKMX9pem0+w3bepVc2cDuyxY4=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: "xen-devel@lists.xenproject.prg" <xen-devel@lists.xenproject.prg>,
	xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 07/12] golang/xenlight: add logging conveniences
 for within xenlight
Thread-Topic: [RESEND PATCH 07/12] golang/xenlight: add logging conveniences
 for within xenlight
Thread-Index: AQHXUNy8b62kbX7r3k+nzGZDJK+dZqsZ5r2AgAABRgA=
Date: Fri, 18 Jun 2021 13:21:40 +0000
Message-ID: <E74C0DF9-3EA4-4B79-8CE4-02F00EC9875C@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <452aac2489990ac0195c62d8cb820fbe5786c466.1621887506.git.rosbrookn@ainfosec.com>
 <A96AD4DD-35CB-495F-A008-D72A5C2AF45D@citrix.com>
In-Reply-To: <A96AD4DD-35CB-495F-A008-D72A5C2AF45D@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d827b23-e350-4b79-2d24-08d9325c0248
x-ms-traffictypediagnostic: PH0PR03MB6313:
x-microsoft-antispam-prvs: <PH0PR03MB63137C4E4CE92ACF57F2F3C6990D9@PH0PR03MB6313.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gvhct0ZFsw9db4PDNEGAx6Kf2bkYxWF+gOxDItAzXlxYxnE79PCrKK1eQZliz+1Tlmj9QF99mFJq/XN3P/8V/ZHIbuVzXAuaCTmuqnS/2KVqj8Csn8q3u39oCul3I/Z++ujlvDQN0ieQ7ji9WAMVbxQn6hlBi4wM8pfx3BjzpIlfEudDoziAQ6VQaHq2rSzEAPmx8x6ZE5S0fakVPEhh5Wk1p3hUaQiywg5aA32E83OFfmfUMb32TUC0coZVKvYOkyaALe0FatJr9+fnGdimUSiQEOOunp7wQ5zsptKfQOxO5j604TiR1hcoNAbLYEKujR4fxNxBTi/li9a4QXq5MVThH6iDVFPqoCDV6g83kqRxpGGeMUYVohR995463C/Kc3Uzo+9nOhGV8CpdGDJ1ohy4l79bOi+I663rl5KdblgzN9k2619PjL7SE2Q+9pV7abOxssjLRmF7cxj9z1+isIKVy/PBBYBTXWclyHimJRFRvxNzv0iVlJ20cIU1BDf11dAv/6mMEvmUlCYslumI6gMeJZA7S5bGGnA02n+2HFVMkWCnpT2z/wpDrjT0BpfzMSvjOYjT8qxiuFnllYLAC7nsTyxZuCCPMTVOklSncwNK9E2yYfF31rG3jp7Ud65djBTAAvFIO97KvIlabAbtXg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(66946007)(66556008)(64756008)(66476007)(66446008)(6916009)(4744005)(6506007)(86362001)(91956017)(478600001)(71200400001)(186003)(76116006)(53546011)(55236004)(316002)(36756003)(6486002)(33656002)(4326008)(2616005)(54906003)(5660300002)(26005)(2906002)(6512007)(122000001)(38100700002)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NW9OVXhYYkNaY1ZRNkVVYVJKMU1oclRJUldMYzhoajBMaU14bkgyT3o2bTN3?=
 =?utf-8?B?NEI5aTBrNENwUUp6YmlSU0ZGMERKWEJiaGp5NlRiaHhVZis3OHJZUDdFcXp4?=
 =?utf-8?B?Z29rS0UySk1yZFA2WFZ0ZS9uc3VDTHFBNDdqTmVkdmgyUXY4emw0UHI0Yjc3?=
 =?utf-8?B?cEtlLzJuQnZGeFg5eUR3MkdvR2Nla2ErNFRTSitORFFFMEpqdm1HRWhON1A3?=
 =?utf-8?B?Qmd1M2tUSjFRM1RVbllaQzZtYWlZQ3c1NERveDF0MTlxcGlRWXc2YmdBeFNZ?=
 =?utf-8?B?K2NKblcwM0VaMjFpVS9yMm52SG1Pdk5WcFNnakkvNkcxMGNUQ0xPekRNU2R0?=
 =?utf-8?B?RjFidFBKRnArWW9FL3hoOUIrWXh4RjVOU1NqaWdYUW45ZUpCZWVkbFlVQStB?=
 =?utf-8?B?ek1oZU0wU2VldTU3MGRFK29GR1cySTJFNmR2ZFJ3ZjhSMlg5WmpnTWlPNlE2?=
 =?utf-8?B?OGRVcmRBWXdVM3BFM3JRSU9VUjVBWGpiMURWaEEwc2FjZnpWT2VGUlArYXNO?=
 =?utf-8?B?SlB6QzZ6ejh1OUFKcEEyeVpoV01oQUdER1o4KzJpRWhqdXVLS0JKaFFsR3l4?=
 =?utf-8?B?U21MMUJtQWFjK0hSbzVkbHBVWGVkcXJkcTNLdnJoS0xQWFVHK0hQNzJ3Slcr?=
 =?utf-8?B?eU14emVaSnZPbTEvVm12L2t3MXB0U25uUnR0WDcrTEdTaVlVZ1l6eFp2d1dF?=
 =?utf-8?B?STRnZ1piek9CK2x1YUhtaTZPbkM0UVEveGdVTDhlcFRiMGdLY3ZjamZHR2Q5?=
 =?utf-8?B?S0R5V1pTeW52Vm9kRjNaSC9TdDJPcy9Ua2gyMGh2UWNOTTg3MTVvNEFhRkR2?=
 =?utf-8?B?Y2VYZjNmL3lqU0tjSENiNThUYVJyQmh3QkViclFGWUhDWTBKZkpUUVBTaUNR?=
 =?utf-8?B?RlVWZzR1SHU5ZVVZb3A3Ti9mQ3BOUzFmQ0k2NDBBbmNXWHU5bHRHU3hoaGRL?=
 =?utf-8?B?YzYvbGpsQURrbnlWbGZZR1JNQXJvOElQcWUxYWdMWWxYWTQ4d3JSY3o3eE5P?=
 =?utf-8?B?OGR6Z1dBdTgyeW1hWSt5cWwrd0pNcmZtd2djMTcybGsyb0xraTVuS0RUamt2?=
 =?utf-8?B?MHFKTUxGUjUzZkUwR2dqWmdHaE9DNGhGd2NueVFXbVFWaWo1Q2ZCVkpUVGJF?=
 =?utf-8?B?bXU5a09jam13YjFiVTBma05FRmtMN1VrMVh6R2VzNytEUitWSG12NnVpaFVN?=
 =?utf-8?B?RE5JM1lJRk92UjRhaVQxbnkrMzdmLzhYMXBwVDh5WjhOQ1pRZTJxNjlQdTkw?=
 =?utf-8?B?S21sejdBQzBDTW9QYWRzbjJCY2g2ck5GVXRiUjVmVE5sOENNakRSODVNMm9u?=
 =?utf-8?B?RFBtc3Yra1NseTkvR0lndFVsLzhtYjZEVzZLWEdpMFl2S3dka2l6VHNBSldM?=
 =?utf-8?B?eko2RVhCY0tzRExuNWlOVG9UakdadjVCblhkWFQ1V09XVW9yMG9MS09DRm9B?=
 =?utf-8?B?RHYvK25MVXBJTnJob1VqWmxTVWxLWlFNNXhDR3YyL1o4QzBpVGFjZzA1akpx?=
 =?utf-8?B?Y24vQ1JiOVY0VDVTUGRjWEJWNXZWRFlleVlhTFBwRDJHdm93bE9CUHBlOGtK?=
 =?utf-8?B?MjR0RklWU3pVR0Y4YUVQRnVjS0cvRkRPbnlMQjF0R3dWUWN6QTAzVEEzTnFz?=
 =?utf-8?B?VHhwaUsrRk9TdUhuZ0ZmZFd3L0JPbnNnT2ZLaWNMUDJBZU1UYWJCbjJsRW53?=
 =?utf-8?B?R0RsdUk2S2h4ZFlvTHdUVE1aQjRLL1JUM3RFS1BHVjVqUW0yekpXWXl0MXJy?=
 =?utf-8?Q?WmN5eke/cETtY4ROlKid/VEgNVOsOuBRxLWbaNE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8B832458E4B174B9BA2C3325083B906@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d827b23-e350-4b79-2d24-08d9325c0248
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 13:21:40.4866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1QMN3hGQfBzC2zvitSfTxy3vRSu4Day175t8GXCYcLIzbhxDdXtzHQ+cxlR5b/qHllbQDgNQtpna1SJm5aeADELVS6yTc4L0u6Y94uBl0E0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6313
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSnVuIDE4LCAyMDIxLCBhdCAyOjE3IFBNLCBHZW9yZ2UgRHVubGFwIDxHZW9yZ2Uu
RHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gTWF5IDI0LCAyMDIx
LCBhdCA5OjM2IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AZ21haWwuY29tPiB3cm90ZToN
Cj4+IA0KPj4gQWRkIHNvbWUgbG9nZ2luZyBtZXRob2RzIHRvIENvbnRleHQgdG8gcHJvdmlkZSBl
YXN5IHVzZSBvZiB0aGUNCj4+IENvbnRlbnh0J3MgeGVudG9vbGxvZ19sb2dnZXIuIFRoZXNlIGFy
ZSBub3QgZXhwb3J0ZWQsIGJ1dCB0aGUgTG9nTGV2ZWwNCj4+IHR5cGUgaXMgc28gdGhhdCBhIGxh
dGVyIGNvbW1pdCBjYW4gYWxsb3cgdGhlIENvbnRleHQncyBsb2cgbGV2ZWwgdG8gYmUNCj4+IGNv
bmZpZ3VyYWJsZS4NCj4+IA0KPj4gQmVjdWFzZSBjZ28gZG9lcyBub3Qgc3VwcG9ydCBjYWxsaW5n
IEMgZnVuY3Rpb25zIHdpdGggdmFyaWFibGUNCj4+IGFyZ3VtZW50cywgZS5nLiB4dGxfbG9nLCBh
ZGQgYW4geHRsX2xvZ193cmFwIGZ1bmN0aW9uIHRvIHRoZSBjZ28gcHJlYW1ibGUNCj4+IHRoYXQg
YWNjZXB0cyBhbiBhbHJlYWR5IGZvcm1hdHRlZCBzdHJpbmcsIGFuZCBoYW5kbGUgdGhlIGZvcm1h
dHRpbmcgaW4NCj4+IEdvLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxy
b3Nicm9va25AYWluZm9zZWMuY29tPg0KPiANCj4gTG9va3MgZ29vZC4gIE9uZSBjb21tZW50Og0K
DQpFciwgc29ycnksIHR1cm5zIG91dCBJIGhhZCByYXRoZXIgbW9yZSB0aGFuIG9uZSBjb21tZW50
LiAgSGVyZeKAmXMgb25lIG1vcmU6DQoNCklzIHRoZXJlIGFueSBwYXJ0aWN1bGFyIHJlYXNvbiBu
b3QgdG8gZXhwb3J0IHRoZSBDdHguTG9nW1hdKCkgZnVuY3Rpb25zPw0KDQogLUdlb3JnZQ0KDQo=

