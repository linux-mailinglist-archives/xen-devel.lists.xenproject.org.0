Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A63ACBF6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144627.266174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEMz-0007ra-EZ; Fri, 18 Jun 2021 13:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144627.266174; Fri, 18 Jun 2021 13:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEMz-0007pU-BR; Fri, 18 Jun 2021 13:17:13 +0000
Received: by outflank-mailman (input) for mailman id 144627;
 Fri, 18 Jun 2021 13:17:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luEMx-0007pO-Jr
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:17:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 646bb160-991e-41f9-8741-a3c454cfa650;
 Fri, 18 Jun 2021 13:17:10 +0000 (UTC)
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
X-Inumbo-ID: 646bb160-991e-41f9-8741-a3c454cfa650
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624022230;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6fHtGz2JESlVjuScKJTP5Z1l76LA/i3gzCifQWsztXQ=;
  b=XJZ91c/sxXnStMs0g0nD6QWVyJvtgCRARc0JYZAnEwZGGw84p974oNxo
   pkAc5EmprV45JTfcWpqIreXPWG8Une+X8tqlQ5MPqOufBGpYYFh7RRT36
   jZp6iZ3k1SKGiWVeNIH1xw99K5QsbfVb/aAnPJEAmQSDxgqddwJbL+Yi8
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GmhFe+IPf3xdOPdoHEp4qGgVke3EhlFl7+baJO14VWgJ8QBZcO9kfJlS/tA0AtmiyhE5pRbeAW
 S6CIDEqkivWOrXHx9Cdnxz9c84kGAihY+Uv9AKXf7VAt7vyMSUNES2ZHshOnXnMSeSdz1SfGqQ
 JSf8gl8jWffpzFaAfgQ3adWlQaVLWRBXCndvhtZ1Gc2ztDonv9Ug/OFD33MAyyyWJoWcFLvrW4
 HlXyacnC1tgKHwCVHgNcZuFgSI1+wg4lZ2Fy6LeYPUfIqLinxw+X5m9+ehVYyjrmW0o7n7BX93
 riU=
X-SBRS: 5.1
X-MesageID: 46529273
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:pt2IWKjllDpjItuGpA3vqxFmk3BQX2p13DAbv31ZSRFFG/FwyP
 re/sjzhCWE6wr5BktBpTnZAtjwfZvdnaQFmLX5To3SLDUO2VHYbr2KgrGSvgEIdxeOkdK1kJ
 0QDZSWBeeaMbEYt7e+3ODbKadd/DDvysnB6YixrgYJPGVXguNbnnhE426gYxJLrWJ9dOIE/e
 +nl7B6Tk2bCA8qh6qAdx84tu74zeEjdqiKXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3Q/MyYwrWG4y6Z81WWw4VdmdPnxNcGLteLkNIpJjLljRvtTJh9WoeFoCs+rIiUmREXeZ
 j30lEd1vZImivsl1KO0EDQMs7boWwTAkrZuAalaL3Y0JHErXwBepZ8bMliA2jkAgIbzaNBOe
 RwrjykXtNsfGb9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQJo+Tg7bWnHAa0cYa
 ZT5fvnlbhrmJKhHjrkl3gqxMbpUmU4Hx+ATERHssuJ0yJOlHQ8y0cD3sQQknoJ6Zp4EvB/lq
 f5G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJNG6JO1zoGKwOJnqIoZ/q57c+4v2sZfUzvdsPcV
 T6IR9lXEsJCgrT4OG1ret2GyH2MSiAtG7Wu7ZjDrBCy/TBrZTQQFm+dGw=
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46529273"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lno6nbYN5oEdfgJ+vsXkMNF57SFUpu61vAMdv1o11qwBXA8xfq+HtXWI2W2dQbZe70/z7tKw4GorgvjhAfVdswjXalgD+rKcvGfkVqFnlXmc5+xO0tf9hNlhKPE3bz7Jv7w9Y1pjeQY77mApSHdoXacn115qNkpzRQGY+vcx1WZXx6ujeayxzJxBVD7sEEOFtCoktUvvX+PsJhTCotGEwI1Di8RJyN1OolWYduXS+p5Azjwlfb3mEBuOY9jgct/z+UHdf5vbFNKBJQYZjzVLi4n2H56uzHxi4lCvK4agNGv9GrwRq8ICf92zQGLQxeSG0naMiPdoxNYYD6t4bia7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fHtGz2JESlVjuScKJTP5Z1l76LA/i3gzCifQWsztXQ=;
 b=EwY/3MyFzG8oA1pWU9e7HK1eoHBX87BgjxvhG0bcZESJDLVPSs0ioOX0cvplfRBDhyzbl3ZSpBrMbxeUUU418gzm49Oa6gJ5GJI7JiA0cgCseEJ7RdM+gtPN5iqxkc6mixJhp73BqmJFqrulF/N0ZQQFrEBfO34wsSWBsySwINSIDm8kHam1cdHlfiZ8/0ZV0RUxrednd3vW26LekD+zIvFmTLsaMaLkZFECPUOcvIhywGCfSnB/Z48gj2e84R8U2UrBxP4fiqdUnxDlJEZrar7NA9n+sfoCXbPh+e9jeekn9/B41tki8JyhbBIV0bW4bMCC6JJAFXkS/QYeSQdH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fHtGz2JESlVjuScKJTP5Z1l76LA/i3gzCifQWsztXQ=;
 b=cBWGsKEYIEMBuL4haxnq3pyDaQX2a5kch+wkBTFdT8MdFV9xFxGwrUGp+iUKBDCa5BQ+Astmu0uh00s2IaLSQeBKBPq9+6wC9557xfAuH6KXgtzpCf9/gHQUJXaSo9tPfL2c2ZyU66c8tbj4JtZNMUEZuVZ2EqakFksHV4qt+bw=
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
Thread-Index: AQHXUNy8b62kbX7r3k+nzGZDJK+dZqsZ5r2A
Date: Fri, 18 Jun 2021 13:17:07 +0000
Message-ID: <A96AD4DD-35CB-495F-A008-D72A5C2AF45D@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <452aac2489990ac0195c62d8cb820fbe5786c466.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <452aac2489990ac0195c62d8cb820fbe5786c466.1621887506.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76e60eb2-513d-435b-eb3c-08d9325b5f4d
x-ms-traffictypediagnostic: PH0PR03MB6368:
x-microsoft-antispam-prvs: <PH0PR03MB6368FE28176A0F18F184A1BF990D9@PH0PR03MB6368.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mHIOe+CFMiT8X0s68W2zUTtor5QEpR0fGyxvRCq9tXuq7HBDe1cDMtPIl8M1gzPyltEBWBGncNgRSHbXyOCqfz8KDQshAk5uh56ri7yPWfmZ67RpD8NkJlcKUGhy7lgKVawx3Un0d2OeDZJx9rvqLKNYNEl5DedwodjO9bAyr+IwZiQ+4jhiFjfiSGK8xLjETWAZ3T+xvHEdL+r9N/AKiWoR049L1zV7dVgDdiwtsfb68KCU7ZGNiXe/K6DqjctfSZF3o7r8xeUIkLHkmkAx2+2Yj/Fj0M9P1+3yKU5YNhDulVojK74p5llnvIO4ZLnVKxlhRnrvmnh2tO541YDNbFWqHRPJRldLjqqHTjo5FMSfYe/SfYFngfYkUYS2dyuClUXJ38TyZ404m0DcbpWI/XiZ5f3Mcjzj6IiIzfCskqUh+YdxzhD+N6nZokL69OLvZVF00SCQK6YJUBhfuKyd1U/i7RWlX5EZVuWGIeLXiB4p4bXtVRbGhNCPpglD+DhD3ULMX+WoryDXkpz03Vw3IoEuSr5FXnq5lOw5Vqv3l6bh/vVewxFwoum2zobHzxlIXIO6k61ENUZFtsylzeQ3hr4kDeOm9sorekxVlpiII/hmYNcbHIAvSYCeLFDIB8XYnpv3vojNYNUWEuDD699Zi3I+cz2ySTHLgF3TpYSquoA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(83380400001)(8676002)(53546011)(86362001)(186003)(6506007)(71200400001)(4326008)(36756003)(33656002)(6486002)(55236004)(91956017)(54906003)(76116006)(66946007)(478600001)(66476007)(66556008)(64756008)(5660300002)(38100700002)(122000001)(6512007)(2616005)(26005)(6916009)(316002)(8936002)(66446008)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkNMdjU1d2ZyTWd5bldqT3pPcEpLVEZHN1ZodjFsQ3l0cEp6b3IwYmxDdEpD?=
 =?utf-8?B?R1N2YnVqU1VSeC85aVpEWmJLdlNtc3g0YnZ1MVdFZVhUcE1GWlo3MHZaZXpq?=
 =?utf-8?B?ajhNcUU2RGlLOERxSVBzVkJ6b0kxcGFTMGtKUEFUeVBpN09PTEI3QUU2UUsx?=
 =?utf-8?B?dDRrdHBVby9tUlRxeHhTUnZaZzBMNlQ5TStkN1lvcVMwRTZTa0dFbkNxUGRj?=
 =?utf-8?B?RnZTdTJSUVgvVWEySmdvMXp1ZHd1U1Mzeld2TkZPSzVBUlduODN6QTVKUWZU?=
 =?utf-8?B?c0swQmJEaVo5YjNzNEp3VnFHaG9acG5FbnhFeDIrREhNZkExK0szdGpxcXpp?=
 =?utf-8?B?Z1ZBM0hObGU5OWlSd2FLeG5CQW52eGZ0NkFGNjh6aXgraUpaYVhuK0s4dnFh?=
 =?utf-8?B?bEJxcnMvOU9xYWh4WjVMQzNLOUtwZzU4NGw5bnNWWTJKTXk5NWlhK3NuSTBh?=
 =?utf-8?B?MW5OWTY0MGRWNktZb0lwbHdsNjRWVGFmSEZwaXYzZUZwT2hzRzc4VDRmWnhX?=
 =?utf-8?B?V0YrTGkrYUEwMHZYa2pCZGk0N0t1WHpMR091TS9mRk1xSVNWc1RCT21Ebkk5?=
 =?utf-8?B?WEJadGFyd0F5VE4zSE1ySktGWmZHcVB5TkpPQTJEbGYvNWMzZ1ZsT1NlMkls?=
 =?utf-8?B?N2tVQ0F2MThKeFJFeXdoUHE1ZVR5alJzQUE2M2c3SmR3VEQrRWxjMm53QWwr?=
 =?utf-8?B?bjl4QVI4ejlURFk0Z05Hbnh3MWNvc2ZDeCtrQW9sTnlDU3FDTkhYbUxOMUJi?=
 =?utf-8?B?aW9qOEhHYlVFYUZsNHNZZklVdXVqMGVHQmdiRUpBQjBOQnVBeVMyUFFDYmFG?=
 =?utf-8?B?OUFGWE9objY5aXo3WUwzOGhmMUdnOEgxMXh0d0lyeC8vdEpaRmZVdjFlOVQr?=
 =?utf-8?B?WkJ3RDdaTjhUWDlHTU4rY1JpYkdpWVQ2b2Noa3hRaUFSV21VeFZITVVUUUxR?=
 =?utf-8?B?cmwvL0tDNm56K09NSGRPZ1hFZU8rb1ZzSmIrelVleDZPcDVPRWhWQy9MZEtn?=
 =?utf-8?B?ZERjcUdkL1FiZXFjTEdoTDZrRXdLY0xJZEJWQTJDU2ozTm5PeVltTGxUR0tL?=
 =?utf-8?B?OUFoc3B4d2pod0dnVkpaVGdjSUFSUkNndnh4NUgwRnBseHNnSFE5eTlkNDNM?=
 =?utf-8?B?K2VCckQrblNIekgrakt0WFhyVVlrZ1JuSVBCTnVrenNtNVgzQ1RBNmdUdktx?=
 =?utf-8?B?ckFpcGpRa1o0cStjUzBiNnFydVR6UnRmS0dmMWRZZ0ZQZW5Jd2JtRmZVaWdM?=
 =?utf-8?B?U1FFaXB2djVZVFUzdXk3VjlsUWFjQ3o2enN0cGZNL2VudENHN2R2THRJc1Jx?=
 =?utf-8?B?WTJ0MGpTZmtEVTVGOFhZSVVyYVZqVzRlQWh2ZUxGZ3ZEWUp1TEViMnhCUkZI?=
 =?utf-8?B?M2d4K005dEVsdDRqVStXWldiejBzOFVZRHFQSUEwU29hSGlOc0krRHF2cTlD?=
 =?utf-8?B?eTFWekxHQmUzSDZmM1FTdlN3NVdtRXlFUll3bmpmN3Q3OTNDNmVMa2FxUmFZ?=
 =?utf-8?B?THJxdUFQYWdBcGdSM0FzS3Fsc0JyaFV6dDZNUk5SbnBRV1BvbWI1dGh4OThZ?=
 =?utf-8?B?ZXdWdExlS01SeXlvdllmdVdiNGo4bEllT3Vld3hSbFB6bWNNVk5TRFNnanhi?=
 =?utf-8?B?Z0RJU1ltb2RPWlZYWG9JQ00xbUlKb2ZjVXdwTERhRGxpT0Z1SEx6dmpERDVi?=
 =?utf-8?B?dDdyeUNEalc0QkkyOWJtK3ZWMXZWcFk5S0lOdlFudERyWjhmTlFhWlJDSVE1?=
 =?utf-8?Q?V8pFRm8SvHYqAH5/Pj3swA9tKPVm7xxIHCsrtIl?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAFE456E750AD04985AC1D8046DF6B94@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e60eb2-513d-435b-eb3c-08d9325b5f4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 13:17:07.0487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gN444GdOPdDZlQZ02Ldn2RkcshPNjtYQd349ixv1mT8/xwTpLwBiukAOwu6JRUtAl8/0y8CP848VH1mULncg15qO3ikR/P3bb4vn/4YgdyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6368
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWF5IDI0LCAyMDIxLCBhdCA5OjM2IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEFkZCBzb21lIGxvZ2dpbmcgbWV0aG9kcyB0byBD
b250ZXh0IHRvIHByb3ZpZGUgZWFzeSB1c2Ugb2YgdGhlDQo+IENvbnRlbnh0J3MgeGVudG9vbGxv
Z19sb2dnZXIuIFRoZXNlIGFyZSBub3QgZXhwb3J0ZWQsIGJ1dCB0aGUgTG9nTGV2ZWwNCj4gdHlw
ZSBpcyBzbyB0aGF0IGEgbGF0ZXIgY29tbWl0IGNhbiBhbGxvdyB0aGUgQ29udGV4dCdzIGxvZyBs
ZXZlbCB0byBiZQ0KPiBjb25maWd1cmFibGUuDQo+IA0KPiBCZWN1YXNlIGNnbyBkb2VzIG5vdCBz
dXBwb3J0IGNhbGxpbmcgQyBmdW5jdGlvbnMgd2l0aCB2YXJpYWJsZQ0KPiBhcmd1bWVudHMsIGUu
Zy4geHRsX2xvZywgYWRkIGFuIHh0bF9sb2dfd3JhcCBmdW5jdGlvbiB0byB0aGUgY2dvIHByZWFt
YmxlDQo+IHRoYXQgYWNjZXB0cyBhbiBhbHJlYWR5IGZvcm1hdHRlZCBzdHJpbmcsIGFuZCBoYW5k
bGUgdGhlIGZvcm1hdHRpbmcgaW4NCj4gR28uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIFJv
c2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPg0KDQpMb29rcyBnb29kLiAgT25lIGNvbW1l
bnQ6DQoNCj4gLS0tDQo+IHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDQ1ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGln
aHQuZ28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28NCj4gaW5kZXggZmMzZWIw
YmYzZi4uZjY4ZDdiNmU5NyAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hl
bmxpZ2h0LmdvDQo+ICsrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbw0KPiBA
QCAtMzIsNiArMzIsMTUgQEAgc3RhdGljIGNvbnN0IGxpYnhsX2NoaWxkcHJvY19ob29rcyBjaGls
ZHByb2NfaG9va3MgPSB7IC5jaGxkb3duZXIgPSBsaWJ4bF9zaWdjaGwNCj4gdm9pZCB4ZW5saWdo
dF9zZXRfY2hsZHByb2MobGlieGxfY3R4ICpjdHgpIHsNCj4gCWxpYnhsX2NoaWxkcHJvY19zZXRt
b2RlKGN0eCwgJmNoaWxkcHJvY19ob29rcywgTlVMTCk7DQo+IH0NCj4gKw0KPiArdm9pZCB4dGxf
bG9nX3dyYXAoc3RydWN0IHhlbnRvb2xsb2dfbG9nZ2VyICpsb2dnZXIsDQo+ICsJCSAgeGVudG9v
bGxvZ19sZXZlbCBsZXZlbCwNCj4gKwkJICBpbnQgZXJybm92YWwsDQo+ICsJCSAgY29uc3QgY2hh
ciAqY29udGV4dCwNCj4gKwkJICBjb25zdCBjaGFyICptc2cpDQo+ICt7DQo+ICsgICAgeHRsX2xv
Zyhsb2dnZXIsIGxldmVsLCBlcnJub3ZhbCwgY29udGV4dCwgIiVzIiwgbXNnKTsNCj4gK30NCj4g
Ki8NCj4gaW1wb3J0ICJDIg0KPiANCj4gQEAgLTE5Miw2ICsyMDEsNDIgQEAgZnVuYyAoY3R4ICpD
b250ZXh0KSBDbG9zZSgpIGVycm9yIHsNCj4gCXJldHVybiBuaWwNCj4gfQ0KPiANCj4gKy8vIExv
Z0xldmVsIHJlcHJlc2VudHMgYW4geGVudG9vbGxvZ19sZXZlbCwgYW5kIGNhbiBiZSB1c2VkIHRv
IGNvbmZpZ3JlIHRoZSBsb2cNCj4gKy8vIGxldmVsIG9mIGEgQ29udGV4dCdzIGxvZ2dlci4NCj4g
K3R5cGUgTG9nTGV2ZWwgaW50DQo+ICsNCj4gK2NvbnN0ICgNCj4gKwkvL0xvZ0xldmVsTm9uZSAg
ICAgTG9nTGV2ZWwgPSBDLlhUTF9OT05FDQoNCldoeSBhcmUgd2Ugbm90IGRlZmluaW5nIHRoaXMg
b25lPyAgRG9u4oCZdCB3ZSB3YW50IHRvIGJlIGFibGUgdG8gZGlzYWJsZSBsb2dnaW5nIGVudGly
ZWx5Pw0KDQo+ICsJTG9nTGV2ZWxEZWJ1ZyAgICBMb2dMZXZlbCA9IEMuWFRMX0RFQlVHDQo+ICsJ
TG9nTGV2ZWxWZXJib3NlICBMb2dMZXZlbCA9IEMuWFRMX1ZFUkJPU0UNCj4gKwlMb2dMZXZlbERl
dGFpbCAgIExvZ0xldmVsID0gQy5YVExfREVUQUlMDQo+ICsJTG9nTGV2ZWxQcm9ncmVzcyBMb2dM
ZXZlbCA9IEMuWFRMX1BST0dSRVNTDQo+ICsJTG9nTGV2ZWxJbmZvICAgICBMb2dMZXZlbCA9IEMu
WFRMX0lORk8NCj4gKwlMb2dMZXZlbE5vdGljZSAgIExvZ0xldmVsID0gQy5YVExfTk9USUNFDQo+
ICsJTG9nTGV2ZWxXYXJuICAgICBMb2dMZXZlbCA9IEMuWFRMX1dBUk4NCj4gKwlMb2dMZXZlbEVy
cm9yICAgIExvZ0xldmVsID0gQy5YVExfRVJST1INCj4gKwlMb2dMZXZlbENyaXRpY2FsIExvZ0xl
dmVsID0gQy5YVExfQ1JJVElDQUwNCj4gKwkvL0xvZ0xldmVsTnVtTGV2ZWxzIExvZ0xldmVsID0g
Qy5YVExfTlVNX0xFVkVMUw0KPiArKQ0KPiArDQo+ICtmdW5jIChjdHggKkNvbnRleHQpIGxvZyhs
dmwgTG9nTGV2ZWwsIGVycm5vdmFsIGludCwgZm9ybWF0IHN0cmluZywgYSAuLi5pbnRlcmZhY2V7
fSkgew0KPiArCW1zZyA6PSBDLkNTdHJpbmcoZm10LlNwcmludGYoZm9ybWF0LCBhLi4uKSkNCj4g
KwlkZWZlciBDLmZyZWUodW5zYWZlLlBvaW50ZXIobXNnKSkNCj4gKwljb250ZXh0IDo9IEMuQ1N0
cmluZygieGVubGlnaHQiKQ0KPiArCWRlZmVyIEMuZnJlZSh1bnNhZmUuUG9pbnRlcihjb250ZXh0
KSkNCg0KSG1tLCBhbGxvY2F0aW5nIGFuZCBmcmVlaW5nIGEgZml4ZWQgc3RyaW5nIGV2ZXJ5IHRp
bWUgc2VlbXMgcHJldHR5IHdhc3RlZnVsLiAgV291bGQgaXQgbWFrZSBtb3JlIHNlbnNlIHRvIGVp
dGhlciB1c2UgYSBzdGF0aWMgQyBzdHJpbmcgaW4gdGhlIENHbyBjb2RlIGF0IHRoZSB0b3AgaW5z
dGVhZD8gIE9yIGlmIG5vdCwgdG8gbWFrZSBjb250ZXh0IGEgZ2xvYmFsIHZhcmlhYmxlIHdlIGFs
bG9jYXRlIG9uY2UgYXQgdGhlIHBhY2thZ2UgbGV2ZWwgYW5kIHJlLXVzZT8NCg0KQWxzbywgaXMg
4oCYeGVubGlnaHTigJkgaW5mb3JtYXRpdmUgZW5vdWdoPyAgSSBoYXZlbuKAmXQgbG9va2VkIGF0
IHRoZSBvdGhlciDigJxjb250ZXh04oCdIHN0cmluZ3M7IHdvdWxkIOKAnGdvLXhlbmxpZ2h04oCd
IG9yIHNvbWV0aGluZyBiZSBiZXR0ZXI/DQoNCj4gKw0KPiArCUMueHRsX2xvZ193cmFwKCgqQy54
ZW50b29sbG9nX2xvZ2dlcikodW5zYWZlLlBvaW50ZXIoY3R4LmxvZ2dlcikpLA0KPiArCQlDLnhl
bnRvb2xsb2dfbGV2ZWwobHZsKSwgQy5pbnQoZXJybm92YWwpLCBjb250ZXh0LCBtc2cpDQo+ICt9
DQoNCkkgdGhpbmsgd2Ugd2FudCB0byBtYWtlIGl0IHBvc3NpYmxlIGxvbmctdGVybSB0byBjb25m
aWd1cmUgeW91ciBvd24gbG9nZ2VyIG9yIGhhdmUgbm8gbG9nZ2VyIGF0IGFsbDsgc28gbWF5YmUg
d2Ugc2hvdWxkIGFkZCBhIGBpZiAoY3R4LmxvZ2dlciA9PSBuaWwpIHJldHVybjtgIGF0IHRoZW4g
dG9wPw0KDQpPdGhlciB0aGFuIHRoYXQgbG9va3MgZ29vZCwgdGhhbmtzIQ0KDQogLUdlb3JnZQ==

