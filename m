Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4B036D770
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 14:34:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119298.225730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbjOc-0002Db-R2; Wed, 28 Apr 2021 12:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119298.225730; Wed, 28 Apr 2021 12:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbjOc-0002DC-NZ; Wed, 28 Apr 2021 12:34:26 +0000
Received: by outflank-mailman (input) for mailman id 119298;
 Wed, 28 Apr 2021 12:34:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpBE=JZ=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1lbjOb-0002D7-8S
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 12:34:25 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3eb5dce-1dae-4502-aac6-d8ce8114e22e;
 Wed, 28 Apr 2021 12:34:23 +0000 (UTC)
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
X-Inumbo-ID: e3eb5dce-1dae-4502-aac6-d8ce8114e22e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619613263;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=Le0gWx7wut1Zo5pYM1/cp2biusyQgv5NLEq99iXwqWU=;
  b=gQ5tttRAZLcNzNvqMttZdMdG74FknhFYB2JHNZylTRXrCS+0+aulUQ9s
   CFE5XA1WClweo7I6e1pG64thz+vpbBogunPhId7qeSPOTngz8t/3sPySD
   1GFrFSbeiHdyzQxLWfoG3MGdxfyrkLt+oFwwLCBo6SHOUxiN46iHI0eZN
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LpTO5jvh/cL4D74N4pAi36XdNrdFUbK7kp5Wre2KoLKx+li4XtlXIMwNpNbYhdiEisKZ8k7Tmy
 w/a40u25EaJZbRM6wzk1UrriAJB5rGiadAeeEq1PBwOUtwW5Eo92+dUXrtuJAQLOtrsdGHfCFA
 NSWKAadbh6yGNPn/pMVYvNJm06ulC/48lDXcghh+c5zz9sDq83djdS8RxGWCooJLE+v4TjHYUn
 DKnbf6H9mIWeYW1CsDjNBm7ThmcDPMz0S2nu9yiyz/k7zwoy6iv8vUgioWpIifyUDUOmuxjmZ+
 zdA=
X-SBRS: 5.1
X-MesageID: 42596002
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ehfs4a+V6LWpUkZLJJRuk+EKdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qH/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7H2vanrfAIcAFof4BSO5AnC1JfBDxOa0h0COgk/o4sKzG
 6tqW3Ez5Tmid6X4Fv212jf75NZ8eGRt+drNYi3peU+bhnpggasTox9V7OFpyBdmpDS1H8a1O
 Pijj1lE8Nv627AXmzdm2qT5yDQlAwAxlWn6ViEjWDtqcb0LQhKdfZptMZiXTbyr28D1esMt5
 5j7iaimLd8SS7kpmDb4ePFUhl7/3DE2kYKoKoooFF0FbcFZKQ5l/14wGplVK0uMQjd844dHO
 xnHKjnlYxrWGLfVXzfs2V1qebcJ0gbL1ODSkgGjMSfzyJbqnB/11cZ38wShB47heoAd6U=
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208,217";a="42596002"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmCx9t94AonCMjKwhNnTODY3GV7HDcXu4nIiHvG/JZ+iqUuI/DlZlQfNqnTMHaBF/5hYRG1GQMACkwV5wGSi0LVYcLIB+KNBrdc0H+rdQ+8vATdj+mVIgiTTSQwNoaWXnTCsXYT816ytP1zepZ8DKl1bmrxww9xvn/3bCpfo/b4VTG65sC/yNK4FI2hxxf5mdUInpBqnNcDAe+2nBcO9akam5IEBNPMTI6QvR0mbwlsoAdry+OZzGcihNHjtu+EmyrViuePUAuFOXcLglPJhphHv5dhxAXbCdyNC/FVx8eqM9gaYr0T3VaEWkqSLf+d+vMY8NzPFxXht/eNL3iieyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Le0gWx7wut1Zo5pYM1/cp2biusyQgv5NLEq99iXwqWU=;
 b=X7G651djLcO2DtDZdaAACWH0Hm5iw3VxT0v20jerT/jR9rV9vf93n3UUxJfpPEPWfYFh9Ddql7/AFPRmmYFMw9tYb5YuXbxrh0wQEEAH6mkOPvdRXPw400GzZX80HCw26ut/0BKKWlKO2paEl9bW0gzo/SybhWVRTQet+rJMXZGhoS+9GTc9NEe+BY2ooo5nlu4RMySOFqZ6BbZaJcTqeg2RcENILHmLurSoqC9GQbYvCdH4Y/eFvFX3qKEujVsRsenmb/jBRCYTCsFfH5LC0O7iALxvnIpzfvZPlqBI0hIs/61l6xKrs2jA5dAuPApLl7K9+XB0zJ8EuEy0b1Cepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Le0gWx7wut1Zo5pYM1/cp2biusyQgv5NLEq99iXwqWU=;
 b=B+Z/CNoXbvoESmmAlq2GezSrQT9C35hHpLfgREBSJ3nR9npYAdvfrg3AiL9djloONvE0upqJkK3pGJyk3bAl3dkPgWh95vDA5tJAjvdRPWnKa+9+YHncenMjtBLudfdSnXep7rTnXhaHZuY6ZNoRurqkwmYRUdXPcVbUAfXoTOw=
From: Christian Lindig <christian.lindig@citrix.com>
To: Costin Lupu <costin.lupu@cs.pub.ro>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Tim
 (Xen.org)" <tim@xen.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, David Scott <dave@recoil.org>
Subject: Re: [PATCH 0/5] Fix redefinition errors for toolstack libs
Thread-Topic: [PATCH 0/5] Fix redefinition errors for toolstack libs
Thread-Index: AQHXO12k0/hgjfv/3kiQm5n2yrTGaqrJ3uCA
Date: Wed, 28 Apr 2021 12:34:17 +0000
Message-ID: <AE965271-FE62-4EA7-91CC-F6438C34962A@citrix.com>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
In-Reply-To: <cover.1619524463.git.costin.lupu@cs.pub.ro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f53fd963-6f00-4709-c1d1-08d90a41f0d1
x-ms-traffictypediagnostic: MWHPR03MB2944:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <MWHPR03MB2944F89F2A29F46D2ED5C3FAF6409@MWHPR03MB2944.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TOhLBpoEK/b69CuKTsjC8J10ZI9d4v9x16S0939kIoY8unC+mT6TAClnVpyfYHJ+ZHtzbv8bjYRF1zNhZxuKLw5NJO5L2mK5DzsQizyEXUv8XGas4Zq/OGsNIy2OwXAs2TDHU1mUjl7LBm/9UBJtGMvcb6lXLp9zPG11e7QxnCty+pSLiV5Rsq9/VyX0qnN1SmnqbTDjR2qyfIYDu7FRq5Z7DpW62sbgicKi2nR/EPOZOiMz+6piBu45FMjLrgCl5PYtIO6xRR3P6BLQavrK4ZxyA5rr7eAnmYjpVmBnyp1IUz1Ur89QEwYag2GIQ9gBieL2YeqRsgTwWq+OXgJ6alGA0nLWURGn1ao1M64iRl6sBKbobPY6NeA25BaPq/EQl3abYZ5a8/WgG9fqdn2wX9vXxP4fbXYU7eBD1riJ7wNL9MYYX3DgfvjGHoMwVHK/KPmm/3n4ZNqHOJ063SlLRrylNtfX+fj1zSoeUG0rUwd2FnkGGYNuVVIJWkf6nHPlMe1hJoSEpqcNK/FhGZ8IPBC81l505ZniwPkkMi5lLypUoXcYqrwaOq53i5E8mE37jdZPhYAA3JE5p9XWVPqjXcPZppOJ+wsmbtbw1er2xjiqPf2fJIItoHgNbPMbEu7CDaLww+4nrqxh2bgB3kxHlBB0pla4SHoS/9bUDlrZpFs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB2445.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(66946007)(316002)(478600001)(2616005)(66476007)(6916009)(33656002)(66556008)(66446008)(6512007)(64756008)(38100700002)(8936002)(53546011)(6486002)(2906002)(86362001)(54906003)(76116006)(26005)(44832011)(83380400001)(122000001)(6506007)(8676002)(36756003)(4326008)(5660300002)(91956017)(71200400001)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aUdNTmNsMXBmSkpDaFNxeS9BSDhyRi85VUtPVTlRL3NaUE1abkcyRkIzSmt5?=
 =?utf-8?B?eWhPazZtMnh1RTJzeHdsYzlvYjJZL0xQeVFjRVMwajZDa3pOZ3k2bVArYXcy?=
 =?utf-8?B?WkJLVEZWRnRKUTRHa3ZuclFiV29EdE9RK2YydStoc21NVllmMWFIZjluVk82?=
 =?utf-8?B?UnlhL0gvV2czWnhlQ0pOQlVjeXYycUJqZEFHUG9kU0x4bituYVE5WGZCWmtK?=
 =?utf-8?B?Mm5tUzBzYjMxemh4L2d4RythM01hLzVjcStJK0svWFhOTDEwQ1ZxazhMNzE5?=
 =?utf-8?B?WVFxQjE3QmxDa1ZNWS9QV2pMQWhNQU8vY0hKNmhNNHBqY3MxRllBOUp3STVS?=
 =?utf-8?B?bXhiU3RxU0xwZHZuNHB4MHZ3QTZ6eC92c2xFSDlXR2ZkRW9xa2FKaUJoRjNt?=
 =?utf-8?B?OGhPMlZGVVdUWTVMVWNXUE8vTWFSMnhVT3lLVU9zTm5zL0lTa0pSTUFyS20z?=
 =?utf-8?B?NGpTeWVPaVNPWFNoYVdEa24yNU1CVzJ5RG5LMmIrNXZPY01WR0E0c2V1djg3?=
 =?utf-8?B?VStqSmJkU2U1bTdCWlZGQnRnaExTRGNpVkNvWVFMWVZ0MkwyM2pxUlROV2VC?=
 =?utf-8?B?VHkvUUgxditYRkIwWTlkUzZWaURqQ0ZyY0tVTEVOWUtWVEgyUEo1d2FGbVFs?=
 =?utf-8?B?RWY1a2tZTVRHL3F4UG00R0gyZTdWTzdJSHJYZmpENVpld2grZmNWY1NVTVJR?=
 =?utf-8?B?aGZWcVVGWnhGZDVHN3pXazNrK21EL3NkY3hNbVFVL3g5aTNjYVZQcHhYQjFa?=
 =?utf-8?B?YnU3TVRQUUVTRGgrU3NyYi9WN2p5MzRTZmY0YUlNWlJDVStLTVFUamNRcUZN?=
 =?utf-8?B?a1Fnc0lwWU5LMS9lTi92VHlwV0p0UVdJOU5aZnA1Sm1IZC83bjU4RHg0Q3lG?=
 =?utf-8?B?dURqVG9SWGc1TVN4YUVIbTc3dkhRUkpmMWN3SFYxSWdmUWlsUWdQR0N6OGxk?=
 =?utf-8?B?TmY2V2tTK0tIYUc5RWRHeHF3VlNYOExOR2g5R2c1b0c4TTk5aVhIblJ5dVFi?=
 =?utf-8?B?d1dZa3hEUkdWMk01ZW50cjZ5d2JSbng4Und3b1Bqb3A2QlN4OWNWbFFJT1pG?=
 =?utf-8?B?UXZWb1hFaStXcHluY2s3SldCWFdtN1Eram9nMzdNSU1LbzhMMjhVODFGU0tG?=
 =?utf-8?B?NkEvWUxBSXBQKzdTTkp1VTVIbTdMSlRrR093WWpMMHdXd1VUZDA2c21QcTdO?=
 =?utf-8?B?ZFZDWWtHZks0ME93V210SU1kaTRpNytoSFFieU9mNGxUcmtjZWFYL1piYU1l?=
 =?utf-8?B?RlRmczg5alNUQ1puK0Zmd2pUTFkycW1vSDdCUHoxVVM5SWhNTEtHdlZYM3dX?=
 =?utf-8?B?K3BJbTIyU2pTcTRjZUdYbE1oYXZKRjFEb1pxWTZCSWVoY05tYjVNM2gzcHMv?=
 =?utf-8?B?WXgrUHRxUUtEL3dETlpGMDAvbEhHSlZrRWtZM0hZNThsRlJmNXJTVi90T3Bt?=
 =?utf-8?B?Y0pGTzFvbitzZzYvQXFBeEdTbWQ5MVpXZHVNSVZLZGZmdy9HdklKak9DTkRq?=
 =?utf-8?B?dzdPdm9OTGtEOFJEZ2RoK0lrcHpacWoxZVZLL0FqaTRFRmVjbzNTQ2ZqUG83?=
 =?utf-8?B?S2pXQ3hCMC9tMmdFWUZZZlZGTXBCSXBDUlNQTEtOL255VGYxK2JoQWRpb2RT?=
 =?utf-8?B?RlZMejdvN2JyVHZ1UE5MditGZU1RTm53VDJqT1dtYThaWUorbXdFakQyN2Qz?=
 =?utf-8?B?clJWNFB3cHMrN3o3bXJlRTlSL2ZqR3dTNnc4UnhabUwxemVWTHA0WDkxRGJw?=
 =?utf-8?Q?Bx1A0dO9G4I2vMz1jgyjqor3EUztlPZtyclWFbw?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_AE965271FE624EA791CCF6438C34962Acitrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB2445.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53fd963-6f00-4709-c1d1-08d90a41f0d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 12:34:17.7826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F/3aw+soOBRl71Xs341DWvWubrMn5V4r/I7MNaPIK+Fx6j8YWBtOKWLjCwNPcTNJTfovnsrx3er2LeOzs1eIL2fyod34rSn0QAOMSLUUPa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2944
X-OriginatorOrg: citrix.com

--_000_AE965271FE624EA791CCF6438C34962Acitrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDI3IEFwciAyMDIxLCBhdCAxMzowNSwgQ29zdGluIEx1cHUgPGNvc3Rpbi5sdXB1QGNz
LnB1Yi5ybzxtYWlsdG86Y29zdGluLmx1cHVAY3MucHViLnJvPj4gd3JvdGU6DQoNCkZvciByZXBs
aWNhdGlvbiBJIHVzZWQgZ2NjIDEwLjMgb24gYW4gQWxwaW5lIHN5c3RlbS4gSW4gb3JkZXIgdG8g
cmVwbGljYXRlIHRoZQ0KcmVkZWZpbml0aW9uIGVycm9yIGZvciBQQUdFX1NJWkUgb25lIHNob3Vs
ZCBpbnN0YWxsIHRoZSAnZm9ydGlmeS1oZWFkZXJzJw0KcGFja2FnZSB3aGljaCB3aWxsIGNoYW5n
ZSB0aGUgY2hhaW4gb2YgaW5jbHVkZWQgaGVhZGVycyBieSBpbmRpcmVjdGx5IGluY2x1ZGluZw0K
L3Vzci9pbmNsdWRlL2xpbWl0cy5oIHdoZXJlIFBBR0VfU0laRSBhbmQgUEFUSF9NQVggYXJlIGRl
ZmluZWQuDQoNCkNvc3RpbiBMdXB1ICg1KToNCiB0b29scy9kZWJ1Z2dlcjogRml4IFBBR0VfU0la
RSByZWRlZmluaXRpb24gZXJyb3INCiB0b29scy9saWJmc2ltYWdlOiBGaXggUEFUSF9NQVggcmVk
ZWZpbml0aW9uIGVycm9yDQogdG9vbHMvbGlicy9mb3JlaWdubWVtb3J5OiBGaXggUEFHRV9TSVpF
IHJlZGVmaW5pdGlvbiBlcnJvcg0KIHRvb2xzL2xpYnMvZ250dGFiOiBGaXggUEFHRV9TSVpFIHJl
ZGVmaW5pdGlvbiBlcnJvcg0KIHRvb2xzL29jYW1sOiBGaXggcmVkZWZpbml0aW9uIGVycm9ycw0K
DQp0b29scy9kZWJ1Z2dlci9rZGQva2RkLXhlbi5jICAgICAgICAgICAgICAgICAgIHwgNCArKysr
DQp0b29scy9kZWJ1Z2dlci9rZGQva2RkLmMgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKysr
DQp0b29scy9saWJmc2ltYWdlL2V4dDJmcy9mc3lzX2V4dDJmcy5jICAgICAgICAgIHwgMiArKw0K
dG9vbHMvbGliZnNpbWFnZS9yZWlzZXJmcy9mc3lzX3JlaXNlcmZzLmMgICAgICB8IDIgKysNCnRv
b2xzL2xpYnMvZm9yZWlnbm1lbW9yeS9wcml2YXRlLmggICAgICAgICAgICAgfCA2ICsrKystLQ0K
dG9vbHMvbGlicy9nbnR0YWIvbGludXguYyAgICAgICAgICAgICAgICAgICAgICB8IDYgKysrKysr
DQp0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyAgICAgICAgICAgIHwgOCArKysr
KysrKw0KdG9vbHMvb2NhbWwvbGlicy94ZW50b29sbG9nL3hlbnRvb2xsb2dfc3R1YnMuYyB8IDQg
KysrKw0KdG9vbHMvb2NhbWwvbGlicy94bC94ZW5saWdodF9zdHVicy5jICAgICAgICAgICB8IDQg
KysrKw0KOSBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
DQrigJQNCjIuMjAuMQ0KDQoNCkZvciB0aGUgT0NhbWwgYmluZGluZ3MsIHRoaXMgYXZvaWRzIHJl
ZGVmaW5pdGlvbnMgYXMgeW91IHNheS4gTG9va3MgZ29vZCB0byBtZS4NCg0KQWNrZWQtYnk6IENo
cmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbTxtYWlsdG86Y2hyaXN0
aWFuLmxpbmRpZ0BjaXRyaXguY29tPj4NCg0K

--_000_AE965271FE624EA791CCF6438C34962Acitrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <DD18F8B03CA87F469630EEA882208C37@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDI3IEFwciAyMDIxLCBhdCAxMzowNSwgQ29zdGluIEx1cHUgJmx0OzxhIGhyZWY9Im1haWx0bzpj
b3N0aW4ubHVwdUBjcy5wdWIucm8iIGNsYXNzPSIiPmNvc3Rpbi5sdXB1QGNzLnB1Yi5ybzwvYT4m
Z3Q7IHdyb3RlOjwvZGl2Pg0KPGJyIGNsYXNzPSJBcHBsZS1pbnRlcmNoYW5nZS1uZXdsaW5lIj4N
CjxkaXYgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPkZvciByZXBsaWNhdGlvbiBJIHVzZWQgZ2Nj
IDEwLjMgb24gYW4gQWxwaW5lIHN5c3RlbS4gSW4gb3JkZXIgdG8gcmVwbGljYXRlIHRoZTxiciBj
bGFzcz0iIj4NCnJlZGVmaW5pdGlvbiBlcnJvciBmb3IgUEFHRV9TSVpFIG9uZSBzaG91bGQgaW5z
dGFsbCB0aGUgJ2ZvcnRpZnktaGVhZGVycyc8YnIgY2xhc3M9IiI+DQpwYWNrYWdlIHdoaWNoIHdp
bGwgY2hhbmdlIHRoZSBjaGFpbiBvZiBpbmNsdWRlZCBoZWFkZXJzIGJ5IGluZGlyZWN0bHkgaW5j
bHVkaW5nPGJyIGNsYXNzPSIiPg0KL3Vzci9pbmNsdWRlL2xpbWl0cy5oIHdoZXJlIFBBR0VfU0la
RSBhbmQgUEFUSF9NQVggYXJlIGRlZmluZWQuPGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0K
Q29zdGluIEx1cHUgKDUpOjxiciBjbGFzcz0iIj4NCiZuYnNwO3Rvb2xzL2RlYnVnZ2VyOiBGaXgg
UEFHRV9TSVpFIHJlZGVmaW5pdGlvbiBlcnJvcjxiciBjbGFzcz0iIj4NCiZuYnNwO3Rvb2xzL2xp
YmZzaW1hZ2U6IEZpeCBQQVRIX01BWCByZWRlZmluaXRpb24gZXJyb3I8YnIgY2xhc3M9IiI+DQom
bmJzcDt0b29scy9saWJzL2ZvcmVpZ25tZW1vcnk6IEZpeCBQQUdFX1NJWkUgcmVkZWZpbml0aW9u
IGVycm9yPGJyIGNsYXNzPSIiPg0KJm5ic3A7dG9vbHMvbGlicy9nbnR0YWI6IEZpeCBQQUdFX1NJ
WkUgcmVkZWZpbml0aW9uIGVycm9yPGJyIGNsYXNzPSIiPg0KJm5ic3A7dG9vbHMvb2NhbWw6IEZp
eCByZWRlZmluaXRpb24gZXJyb3JzPGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0KdG9vbHMv
ZGVidWdnZXIva2RkL2tkZC14ZW4uYyAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDt8IDQgKysrKzxiciBjbGFzcz0iIj4NCnRvb2xzL2RlYnVnZ2VyL2tk
ZC9rZGQuYyAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDt8IDQgKysrKzxiciBjbGFzcz0iIj4NCnRvb2xzL2xp
YmZzaW1hZ2UvZXh0MmZzL2ZzeXNfZXh0MmZzLmMgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7fCAyICsrPGJyIGNsYXNzPSIiPg0KdG9vbHMvbGli
ZnNpbWFnZS9yZWlzZXJmcy9mc3lzX3JlaXNlcmZzLmMgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7fCAyICsrPGJyIGNsYXNzPSIiPg0KdG9vbHMvbGlicy9mb3JlaWdubWVtb3J5L3ByaXZh
dGUuaCAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDt8IDYgKysrKy0tPGJyIGNsYXNzPSIiPg0KdG9vbHMvbGlicy9n
bnR0YWIvbGludXguYyAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDt8IDYgKysrKysrPGJyIGNsYXNzPSIiPg0KdG9vbHMv
b2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7fCA4ICsrKysrKysrPGJyIGNs
YXNzPSIiPg0KdG9vbHMvb2NhbWwvbGlicy94ZW50b29sbG9nL3hlbnRvb2xsb2dfc3R1YnMuYyB8
IDQgKysrKzxiciBjbGFzcz0iIj4NCnRvb2xzL29jYW1sL2xpYnMveGwveGVubGlnaHRfc3R1YnMu
YyAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDt8IDQgKysrKzxiciBjbGFzcz0iIj4NCjkgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSk8YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+DQrigJQgPGJy
IGNsYXNzPSIiPg0KMi4yMC4xPGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8
L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+
DQo8L2Rpdj4NCkZvciB0aGUgT0NhbWwgYmluZGluZ3MsIHRoaXMgYXZvaWRzIHJlZGVmaW5pdGlv
bnMgYXMgeW91IHNheS4gTG9va3MgZ29vZCB0byBtZS4NCjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNz
PSIiPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPkFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnICZs
dDs8YSBocmVmPSJtYWlsdG86Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tIiBjbGFzcz0iIj5j
aHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb208L2E+Jmd0OzxiciBjbGFzcz0iIj4NCjxkaXYgY2xh
c3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_AE965271FE624EA791CCF6438C34962Acitrixcom_--

