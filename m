Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BE13AD03D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:19:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144836.266537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHCo-0002Al-3G; Fri, 18 Jun 2021 16:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144836.266537; Fri, 18 Jun 2021 16:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHCn-00028L-UW; Fri, 18 Jun 2021 16:18:53 +0000
Received: by outflank-mailman (input) for mailman id 144836;
 Fri, 18 Jun 2021 16:18:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luHCm-00028B-JK
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:18:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37e3e002-7d26-4d98-96ba-7408e90a7ee7;
 Fri, 18 Jun 2021 16:18:51 +0000 (UTC)
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
X-Inumbo-ID: 37e3e002-7d26-4d98-96ba-7408e90a7ee7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624033130;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wR/FLwG+HqsAqx2kOjn3nKF0NDAb9DW0DAztudyIirM=;
  b=DFdTiJ5IddGbm4s8rHZYbPDtXadNhynLSqfB3BKWNbrU4jiVy3JNaz18
   FzQhfvpYIDMPDT9mfOHwldgqX9nSGJBF5iWCbM63LQ8uJUcLuyc7/t1ES
   GyB5zPH776lDzDjRWM4I7mHUABlAMqHnrhoPaJbRWv0JAn2nMgNLH7zaK
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pi0AL+V0vxbRqttopNs7cKEpn95qoshkb3qy9FfqEgcpwgOxXGP7fWe1CeIGHS8UR8IijNtfow
 QNFA6VVLDbgxaeL7G3vu9r/4ZBFV7qd+g184ktWQDxMibAR4wbxalIMqZXsxJkbZ6itEmkgps7
 /7WDMIvnLBdHta/XxMWm5ZOANW5jyjqNtLsqIwbdfKHc2EP7MHoVObPsjIR5CQJC4stC3PwQxP
 01PVJukjgjZLBH+ota4HpuvP/jCt+dG+svKSNVMp6NUoXWpJS7jmChlr2LUUTimvqDHga4CeGt
 Sfs=
X-SBRS: 5.1
X-MesageID: 46842819
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:iiEdpKMgtibJL8BcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46842819"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mjqj8JCwownivfsj/d1hBw9daand2ZmpDtBLaabBkai1QajaejuVg+gUW4vhZ5wsKXeYX1eLY5vV3HWWE7TlJTRqXBb1YksChCfTVG6wqUD3WFUV8OK8RM6c2ZdYQ0yGnii6ev9SG5pKqe565lbLH3ILLZ7fEM+n0o7TVy/MtJb9znztMH8jMgQg65dkyGLV2KzYQuT1YxBE15GXpW0JEjj3eSeEuXVBZyJQojh68oS7Rn4mX+uqF9aMCeCYYJReAkprRDswxH3ERDzMEtBDK1/3mAGCVQKyVH2a4BX+B6+lq1UvK2w+Jgeij8pyAo3hEMABbaDq92useUJ09/Tiuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wR/FLwG+HqsAqx2kOjn3nKF0NDAb9DW0DAztudyIirM=;
 b=RO5D9ga2LtptonTTacSho9bhDtUGcIGUbQ18K4X9/U7bv3hjQw8+S4Tr+L/EA5vyZMLjmSWiLEjmzO0rJMWMC5KJJ1IG4qtjuDGcBjQqXQkh9GuQBq6E9hpEg6f/Jh5iPGDzQI1YhZNiQ3s2EWOLCBbmfd5kiBwAbWaW1Gu8re5M4CqHqcX+/FeO1iEQwnOjsX7njkUs8YWnUNhkRwWWFMUad3nnjU+yciYnXNpB0yECJvTqnvvyBtcYd8uNjN7Tn6LrBcvTHBgGI0TRstI5zqM/b5DBtikWE3Fs84brB6n8vlqs8HM89Da1H9TrEzJqNakK9sAsP8QTFti7V9WRJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wR/FLwG+HqsAqx2kOjn3nKF0NDAb9DW0DAztudyIirM=;
 b=gkl7rhvaB/XekG7hrcX9L49HxlLisnnLxIatpvljSdV1Po5P9bcFSZXfLsUPodP11fj8OMFa39x5zYpqfPEWybT7KpG6UnpU481pKO8p6kUaBgtzU8k3lfJIvDJyjmR4UXnWxVonDpuiNqEc1OKtBLEUfad4fIgf6bkR7wFIS6w=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 08/12] golang/xenlight: add functional options to
 configure Context
Thread-Topic: [RESEND PATCH 08/12] golang/xenlight: add functional options to
 configure Context
Thread-Index: AQHXUNzBxrtRVA/FskCGl/j6ZWY3UKsZ/xcAgAAG0ICAABOXAA==
Date: Fri, 18 Jun 2021 16:18:44 +0000
Message-ID: <8727719E-9548-40CF-A186-14E2ECA3801D@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <dc5cd6728e8477c9eb3ba75a55c7128da46a86ef.1621887506.git.rosbrookn@ainfosec.com>
 <EF069373-26FC-4151-9CD9-6B8C48D9AEB0@citrix.com>
 <YMy29arbPMnPI/+W@FED-nrosbr-BE.crux.rad.ainfosec.com>
In-Reply-To: <YMy29arbPMnPI/+W@FED-nrosbr-BE.crux.rad.ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 543f1a9f-c055-43a3-068d-08d93274bec1
x-ms-traffictypediagnostic: PH0PR03MB5720:
x-microsoft-antispam-prvs: <PH0PR03MB5720CFCF4CA9E2192378898A990D9@PH0PR03MB5720.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6cLIgv6HHnZ8kFSmUi2rHPj4Md29Hin8m+q8I2Irc6WNnWkveHklT9PgGPf1t0OVgCkDV4qFPcTeyLAcYkMau8BzAYZ+uv5ij6pfsIoLwYW6n2NopFxn0V1uNuANElyzptFgj9hlXUizBpck1N95Fb+eSmXFlrxiCIJX+sRbGsOOZsnZV2W2ElERfUZ/anDEl4fRCoZzJDx3V2F+WcBfJ1lL9bpmfh+ESRhE/lPmV5nlkkvxGlO1eoE9NM2maBnWUurRaJ3T4pVdbQPgVhkn5bp3qREeq8/75C/B3ePqO9/qxtU5ioDeRdswri6UG0JTP8E207ycXB7X9FOittbaTq5+qWGohRyhL8sTITjqFog9sO1ptFLqHWxNpG9I2nlhisT8jE+sROSaHAdJc80fGEX6K/iyshJMbhxK/tXmP0N/QSbz509RdeszLYmKYJrHJxhaRzGcGmIHmLbnHB8da+Zeg/X1WtyfXftMKN+tVwLvppgutfrJEhh+p7aNQPomAJIA3H/bJz0B6Aov9fGb3cBR/zCyHLvGFZ4Vykp06/rDxhdKbZ1CE8jH7uLEwc1nDxuC1EMtP7WiSoQ0vMuDgGcn6vx7vhGj+t1OjmF3iqAhCcqXAe+DOYmUY9IBrRjrSdsrsqAD6asuFzC84I5rpp5NX9gnkQkOgmhQbw5057+/zVjEAe2i993X18IQFMTiEoeYxtxrLSQ7H3vhGxuYrzptuJ0ajzXRen8FrWYfngDZjHFYJSussCh0QK5kCvfjwloVUsfwQzumfJKUSjg+Wt9+iMiExrVCuIbi913s5N4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(33656002)(8676002)(38100700002)(122000001)(966005)(66446008)(86362001)(6506007)(66556008)(71200400001)(36756003)(66476007)(64756008)(53546011)(478600001)(26005)(54906003)(8936002)(76116006)(91956017)(6512007)(6916009)(66946007)(316002)(4326008)(6486002)(83380400001)(186003)(2616005)(5660300002)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDRVdG11WGZENHhYRlNnZG1UZ1FZYXdqbzRReXhLcjhHMEJ5OEJKVW5FQzli?=
 =?utf-8?B?TU1CdmdEZldPQVNtUEJsL3N2dm5UdnBjZU1HZTdPUy82dk1zM2ZYK2cydlVz?=
 =?utf-8?B?SEFlVWZVT1ZFRU45c2RRT0RidnNMY2V1TjFqT0ErOGtuNHFPSUUxc3ZYWm1S?=
 =?utf-8?B?ZGJlVDQyYnZPd1M3anY4em9NN2oyUnZkN0hzbjY1RE1VM3pUSUNHc1dNTHcz?=
 =?utf-8?B?emxmTTUxSitlS2J5OTJ0bUNTMGNYcHRkdHNtVnBicjZZMlVVZ2Y3RDlwZTY4?=
 =?utf-8?B?WUdBYmZVcnBwWXpyYXNQb29hZEdvY2pmMzRPb1RaTEdKcXorVHV3emZCNmxn?=
 =?utf-8?B?T0VjQWVIOUJWZExGRTlDMXFGUk1yMlBvZnBGSUtQZTI3S0c0WnoyNnhBSXFT?=
 =?utf-8?B?bE5uaXRpbzNqQ3FBV0xSUmo3Z1ZPSHdrNHEva1YvY1ZCeUN0SnVHOWVQclgz?=
 =?utf-8?B?TTFuZDM5WGhsbHZtalNzWXB1RGlRVzdQWXFDZWpDaHRiR2RHRnNRTjd4UUxC?=
 =?utf-8?B?ZXR1Tm16aXl5KzU2eUxWQzNFdSs2aFpkaGhvRmUzbmNYR1o0UkVBV3NCV0dr?=
 =?utf-8?B?TVpmR3h0VldRVVZCbnZiTVJlM0VZVDJvMGxld0JVSjlOQk9CNU53czNQek05?=
 =?utf-8?B?WE8zaXA3RzFQZnBBMStudGNsN3BOZmdwZSttcFJlRlN6aEJTWHdqOE4yR1Jm?=
 =?utf-8?B?bjZuaVRReC81ZWlGUk5hakNxUGoxUmVaUlRjbzdkSUs1bVhxVXlTRTBQNFA4?=
 =?utf-8?B?Qk5SdWduc09IWEFyZlNSOUVNZ1BPWThPSUEvN2Nyd1hpa1FHK2loQzZKVVYz?=
 =?utf-8?B?MFFSOWptcE42eU8wMTlBYjh5N1VsUlhId0puWW04UEJMMm4xd0UzN0FFbjQy?=
 =?utf-8?B?ZkVhT05CRDhYM2p3c2JaQ1B6QWhTUHc4eHF4RzhpVkJqM1RnR1A4d0kxMlQx?=
 =?utf-8?B?QUlFaWJvdUQyMmNkeVNVVzhWMWNwWkFIUlYrUnhreUdkMXFiWXJnSytETFVn?=
 =?utf-8?B?b2JjMEFpV2pMOUZ5a0w1Q3l4cFdSeHArcDNTTjFIbjg4azRiYmIzRjFJWG0z?=
 =?utf-8?B?QU0yb3J5ZGhTdDJMWDcvY3IzRzAvSzZpRDRXMWxqakxHYldyYk5YekZncWQ1?=
 =?utf-8?B?cDZyTU85MzZiOVFDNmNYWWFJaENtU0dYSkJKNEJrU1VmclZqTXppTlpuSmc4?=
 =?utf-8?B?R1hLVFZLeDQrRkpkbXJXR1I0M2RWekI4YXdpRzdGd1hwb0Vra0FySy85bW12?=
 =?utf-8?B?T3VsclNXeWY1QkxrQ09WK1czV0NPNDZaVFZYTFJ5QzRqY0xBUmhYVmRiSFdk?=
 =?utf-8?B?cG1hRSs4SGlKSTZBaEJXZXI0WEZwU3BhZ1BYRVRRZkVDMUJnTmxRYWh4Y1FJ?=
 =?utf-8?B?WDJZdHhpN2N6MFdKVGdRWUhKcjRFN1VFOEl3Tk9jUkZiK0lsWWFSY1lwdWp2?=
 =?utf-8?B?QWZsSXExLzJmenpGSEp4cjk0czQ4c2xDRzNVeU5HdDZobG9DcE5Dd1ZueFNk?=
 =?utf-8?B?V2YwTjloT3YxbkkxVi9ETjJOSzBZWlhzR1FYOCtPaklJb3RnWDE0L1FQN2h4?=
 =?utf-8?B?aXdrNERiTU1OaEkxaDZjVC9yMkdzdFpCMHUrcXpBZ09JQWQybDdEeGkxSC9O?=
 =?utf-8?B?NnBjeCtza1E2anVnSjNNWTN0OWZvR1RkVmlpWVVHdjB1YTBWZzRTeEdCd2pL?=
 =?utf-8?B?a05rUjl4ajVNRlRYUmFORlNTOGExZmxWS2RLRlVqbmt4MzFpSE9HNGo5T3Ux?=
 =?utf-8?Q?9WQ7XcrSaUeSzOJgZiclDf1hVyOE2PytBoJBm+H?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8358BEC8F8A4A44BB7B4D4702E9161A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543f1a9f-c055-43a3-068d-08d93274bec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 16:18:44.6267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b/CI8UwZ60iNX/OcyABS/pqyIhzrq+Hcj1iymh+l0YgR2ckqh1VE7FsYGyQ9fsT/Sfqyp/mfelGLgg2V87lFw3XX4cdA+pD5oC8ip77vTZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5720
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSnVuIDE4LCAyMDIxLCBhdCA0OjA4IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgSnVuIDE4LCAyMDIxIGF0IDAyOjQ0
OjE1UE0gKzAwMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9uIE1heSAy
NCwgMjAyMSwgYXQgOTozNiBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGdtYWlsLmNvbT4g
d3JvdGU6DQo+Pj4gDQo+Pj4gQWRkIGEgQ29udGV4dE9wdGlvbiB0eXBlIHRvIHN1cHBvcnQgZnVu
Y3Rpb25hbCBvcHRpb25zIGluIE5ld0NvbnRleHQuDQo+Pj4gVGhlbiwgYWRkIGEgdmFyaWFkaWMg
Q29udGV4dE9wdGlvbiBwYXJhbWV0ZXIgdG8gTmV3Q29udGV4dCwgd2hpY2ggYWxsb3dzDQo+Pj4g
Y2FsbGVycyB0byBzcGVjaWZ5IDAgb3IgbW9yZSBjb25maWd1cmF0aW9uIG9wdGlvbnMuDQo+Pj4g
DQo+Pj4gRm9yIG5vdywganVzdCBhZGQgdGhlIFdpdGhMb2dMZXZlbCBvcHRpb24gc28gdGhhdCBj
YWxsZXJzIGNhbiBzZXQgdGhlDQo+Pj4gbG9nIGxldmVsIG9mIHRoZSBDb250ZXh0J3MgeGVudG9v
bGxvZ19sb2dnZXIuIEZ1dHVyZSBjb25maWd1cmF0aW9uDQo+Pj4gb3B0aW9ucyBjYW4gYmUgY3Jl
YXRlZCBieSBhZGRpbmcgYW4gYXBwcm9wcmlhdGUgZmllbGQgdG8gdGhlDQo+Pj4gY29udGV4dE9w
dGlvbnMgc3RydWN0IGFuZCBjcmVhdGluZyBhIFdpdGg8T3B0aW9uTmFtZT4gZnVuY3Rpb24gdG8g
cmV0dXJuDQo+Pj4gYSBDb250ZXh0T3B0aW9uDQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogTmlj
ayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4NCj4+PiAtLS0NCj4+PiB0b29scy9n
b2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tDQo+Pj4gMSBmaWxlIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdo
dC5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbw0KPj4+IGluZGV4IGY2OGQ3
YjZlOTcuLjY1ZjkzYWJlMzIgMTAwNjQ0DQo+Pj4gLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0
L3hlbmxpZ2h0LmdvDQo+Pj4gKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0Lmdv
DQo+Pj4gQEAgLTEzNiw3ICsxMzYsNyBAQCBmdW5jIHNpZ2NobGRIYW5kbGVyKGN0eCAqQ29udGV4
dCkgew0KPj4+IH0NCj4+PiANCj4+PiAvLyBOZXdDb250ZXh0IHJldHVybnMgYSBuZXcgQ29udGV4
dC4NCj4+PiAtZnVuYyBOZXdDb250ZXh0KCkgKGN0eCAqQ29udGV4dCwgZXJyIGVycm9yKSB7DQo+
Pj4gK2Z1bmMgTmV3Q29udGV4dChvcHRzIC4uLkNvbnRleHRPcHRpb24pIChjdHggKkNvbnRleHQs
IGVyciBlcnJvcikgew0KPj4+IAljdHggPSAmQ29udGV4dHt9DQo+Pj4gDQo+Pj4gCWRlZmVyIGZ1
bmMoKSB7DQo+Pj4gQEAgLTE0Niw4ICsxNDYsMTkgQEAgZnVuYyBOZXdDb250ZXh0KCkgKGN0eCAq
Q29udGV4dCwgZXJyIGVycm9yKSB7DQo+Pj4gCQl9DQo+Pj4gCX0oKQ0KPj4+IA0KPj4+ICsJLy8g
U2V0IHRoZSBkZWZhdWx0IGNvbnRleHQgb3B0aW9ucy4gVGhlc2UgZmllbGRzIG1heQ0KPj4+ICsJ
Ly8gYmUgbW9kaWZpZWQgYnkgdGhlIHByb3ZpZGVkIG9wdHMuDQo+Pj4gKwljb3B0cyA6PSAmY29u
dGV4dE9wdGlvbnN7DQo+Pj4gKwkJbG9nTGV2ZWw6IExvZ0xldmVsRXJyb3IsDQo+Pj4gKwl9DQo+
Pj4gKw0KPj4+ICsJZm9yIF8sIG9wdCA6PSByYW5nZSBvcHRzIHsNCj4+PiArCQlvcHQuYXBwbHko
Y29wdHMpDQo+Pj4gKwl9DQo+Pj4gKw0KPj4+IAkvLyBDcmVhdGUgYSBsb2dnZXINCj4+PiAtCWN0
eC5sb2dnZXIgPSBDLnh0bF9jcmVhdGVsb2dnZXJfc3RkaW9zdHJlYW0oQy5zdGRlcnIsIEMuWFRM
X0VSUk9SLCAwKQ0KPj4+ICsJY3R4LmxvZ2dlciA9IEMueHRsX2NyZWF0ZWxvZ2dlcl9zdGRpb3N0
cmVhbShDLnN0ZGVyciwNCj4+PiArCQlDLnhlbnRvb2xsb2dfbGV2ZWwoY29wdHMubG9nTGV2ZWwp
LCAwKQ0KPj4+IA0KPj4+IAkvLyBBbGxvY2F0ZSBhIGNvbnRleHQNCj4+PiAJcmV0IDo9IEMubGli
eGxfY3R4X2FsbG9jKCZjdHguY3R4LCBDLkxJQlhMX1ZFUlNJT04sIDAsDQo+Pj4gQEAgLTIwMSw2
ICsyMTIsMzUgQEAgZnVuYyAoY3R4ICpDb250ZXh0KSBDbG9zZSgpIGVycm9yIHsNCj4+PiAJcmV0
dXJuIG5pbA0KPj4+IH0NCj4+PiANCj4+PiArdHlwZSBjb250ZXh0T3B0aW9ucyBzdHJ1Y3Qgew0K
Pj4+ICsJbG9nTGV2ZWwgTG9nTGV2ZWwNCj4+PiArfQ0KPj4+ICsNCj4+PiArLy8gQ29udGV4dE9w
dGlvbiBpcyB1c2VkIHRvIGNvbmZpZ3VyZSBvcHRpb25zIGZvciBhIENvbnRleHQuDQo+Pj4gK3R5
cGUgQ29udGV4dE9wdGlvbiBpbnRlcmZhY2Ugew0KPj4+ICsJYXBwbHkoKmNvbnRleHRPcHRpb25z
KQ0KPj4+ICt9DQo+Pj4gKw0KPj4+ICt0eXBlIGZ1bmNDb250ZXh0T3B0aW9uIHN0cnVjdCB7DQo+
Pj4gKwlmIGZ1bmMoKmNvbnRleHRPcHRpb25zKQ0KPj4+ICt9DQo+Pj4gKw0KPj4+ICtmdW5jIChm
Y28gKmZ1bmNDb250ZXh0T3B0aW9uKSBhcHBseShjICpjb250ZXh0T3B0aW9ucykgew0KPj4+ICsJ
ZmNvLmYoYykNCj4+PiArfQ0KPj4gDQo+PiBXaHkgYWxsIHRoaXMgY29udm9sdXRpb24gd2l0aCBp
bnRlcmZhY2VzIGFuZCBzdWNoLCByYXRoZXIgdGhhbiBqdXN0IGRlZmluaW5nIENvbnRleHRPcHRp
b24gYXMgYSBmdW5jdGlvbiBwb2ludGVyPyAgSXMgaXQganVzdCB0byBrZWVwIGNvbnRleHRPcHRp
b25zIG91dCBvZiB0aGUgZG9jdW1lbnRhdGlvbiBwYWdlPw0KPiANCj4gUGFydCBvZiB0aGUgbW90
aXZhdGlvbiBmb3IgdXNpbmcgZnVuY3Rpb25hbCBvcHRpb25zIGlzIHRvIGFic3RyYWN0IHRoZQ0K
PiAib3B0aW9ucyIgc3RydWN0LCB5ZXMuIFRoaXMgYWxsb3dzIGludGVybmFsIGRlZmF1bHRzIHRv
IGJlIGFwcGxpZWQgbW9yZQ0KPiBlYXNpbHkgLS0gaWYgeW91IHJlcXVpcmUgZS5nLiBhIENvbnRl
eHRPcHRpb25zIHN0cnVjdCB0byBiZSBwYXNzZWQgYnkNCj4gdGhlIGNhbGxlciwgaG93IGRvIHlv
dSBrbm93IGlmIHRoZXkgaW50ZW5kZWQgdG8gb3ZlcnJpZGUgYSBkZWZhdWx0LCBvcg0KPiBpZiB0
aGV5IGp1c3QgZGlkbid0IHNldCB0aGUgZmllbGQ/IEFkZGl0aW9uYWxseSwgdXNpbmcgdGhlIENv
bnRleHRPcHRpb24NCj4gYXMgYW4gaW50ZXJmYWNlIGFsbG93cyB2YXJpYWRpYyBhcmd1bWVudHMs
IHdoaWNoIGFyZSBqdXN0IGNvbnZlbmllbnQgZm9yDQo+IEFQSSB1c2VycyAtLSB0aGUgc2FtZSBO
ZXdDb250ZXh0IGZ1bmN0aW9uIGNhbiBiZSB1c2VkIHdoZXRoZXIgeW91IG5lZWQNCj4gdG8gcGFz
cyAzIG9wdGlvbnMgb3IgMC4NCj4gDQo+IFRoZSByZWFzb24gd2UgdXNlIENvbnRleHRPcHRpb24g
YXMgYW4gaW50ZXJmYWNlLCByYXRoZXIgdGhhbiBmdW5jdGlvbg0KPiBwb2ludGVyIG9mIHNvcnRz
IGlzIGZvciBmbGV4aWJpbGl0eSBpbiB0aGUgc2lnbmF0dXJlcyBvZiBDb250ZXh0T3B0aW9uDQo+
IGltcGxlbWVudGF0aW9ucy4gRS5nLiwgd2UgY291bGQgaGF2ZQ0KPiANCj4gZnVuYyBXaXRoTG9n
TGV2ZWwobHZsIExvZ0xldmVsKSBDb250ZXh0T3B0aW9uDQo+IGZ1bmMgV2l0aExvZ0NvbnRleHQo
cyBzdHJpbmcpIENvbnRleHRPcHRpb24NCj4gZnVuYyBXaXRoRm9vQW5kQmFyKHMgc3RyaW5nLCBu
IGludCkgQ29udGV4dE9wdGlvbg0KPiANCj4gU2VlIFsxXSBmb3IgbW9yZSBiYWNrZ3JvdW5kIG9u
IHRoaXMgcGF0dGVybi4NCj4gDQo+IFRoYW5rcywNCj4gTlINCj4gDQo+IFsxXSBodHRwczovL2Rh
dmUuY2hlbmV5Lm5ldC8yMDE0LzEwLzE3L2Z1bmN0aW9uYWwtb3B0aW9ucy1mb3ItZnJpZW5kbHkt
YXBpcw0KDQpZZXMsIEkgZnJlcXVlbnRseSB1c2UgYSBwYXR0ZXJuIGxpa2UgdGhlIG9uZSBkZXNj
cmliZWQgaW4gdGhhdCBibG9nIHBvc3QgbXlzZWxmLiAgQnV0IHRoYXQgYmxvZyBwb3N0IGRvZXNu
4oCZdCB1c2UgaW50ZXJmYWNlcyDigJQgdGhlIGZpbmFsIHNsaWRlIGFjdHVhbGx5IGhhcyB0aGUg
4oCcb3B0aW9uIGZ1bmN0aW9u4oCdIHR5cGUgYXMgYW4gb3Blbi1jb2RlZCBmdW5jdGlvbiBwb2lu
dGVyIHR5cGUuDQoNClNvIG15IHF1ZXN0aW9uIHdhcywgd2h5IG5vdCBkbyBzb21ldGhpbmcgbGlr
ZSB0aGlzOg0KDQp0eXBlIENvbnRleHRPcHRpb24gZnVuYygqY29udGV4dE9wdGlvbnMpIGVycm9y
DQoNCmZ1bmMgV2l0aExvZ0xldmVsKGxldmVsIExvZ0xldmVsKSBDb250ZXh0T3B0aW9uIHsNCiAg
cmV0dXJuIGZ1bmMoY28gKmNvbnRleHRPcHRpb25zKSB7DQogICAgY28ubG9nTGV2ZWwgPSBsZXZl
bA0KICB9DQp9DQoNCkFUTSB0aGUgb25seSBhZHZhbnRhZ2UgSSBjYW4gc2VlIG9mIGRlZmluaW5n
IENvbnRleHRPcHRpb24gYXMgYW4gaW50ZXJmYWNlIHJhdGhlciB0aGFuIGFzIGEgZnVuY3Rpb24g
cG9pbnRlciBpcyB0aGF0IHRoZSBnb2RvYyBmb3IgQ29udGV4dE9wdGlvbiB3b3VsZCBsb29rIGxp
a2U6DQoNCnR5cGUgQ29udGV4dE9wdGlvbiBpbnRlcmZhY2Ugew0KICAgLy8gY29udGFpbnMgZmls
dGVyZWQgb3IgdW5leHBvcnRlZCBmaWVsZHMNCn0NCg0KUmF0aGVyIHRoYW4NCg0KdHlwZSBDb250
ZXh0T3B0aW9uIGZ1bmMoKmNvbnRleHRPcHRpb25zKSBlcnJvcg0KDQpXaGljaCBzaG93cyB5b3Ug
dGhlIG5hbWUgb2YgdGhlIHVuZXhwb3J0ZWQgZmllbGQuDQoNCklzIHRoZXJlIGFub3RoZXIgcmVh
c29uIEkgbWlzc2VkPw0KDQogLUdlb3JnZQ==

