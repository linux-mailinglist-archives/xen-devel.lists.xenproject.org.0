Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52E03ACE60
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144761.266404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGBC-0005xZ-Si; Fri, 18 Jun 2021 15:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144761.266404; Fri, 18 Jun 2021 15:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGBC-0005v8-PS; Fri, 18 Jun 2021 15:13:10 +0000
Received: by outflank-mailman (input) for mailman id 144761;
 Fri, 18 Jun 2021 15:13:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luGBB-0005v2-Ut
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:13:09 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14f66d6d-1e4b-41ec-8d4c-e21849ea2e84;
 Fri, 18 Jun 2021 15:13:09 +0000 (UTC)
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
X-Inumbo-ID: 14f66d6d-1e4b-41ec-8d4c-e21849ea2e84
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624029188;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zL7N5KFhmFYYv0XI5Kv9FvWQfJWS92wFtadgO96hjps=;
  b=fdwpLqP6Qylttk3d5s5hkcFzNqFQKhI2nT7HfWwL9G/a82IAktRTLGs6
   YMjoWx0JCamb74CU49ugJanSCh9mBS4/Q+MxVtifMK6DnxdF6lB92314u
   v195Cmr0QZ4JcsgxKm6Z+0djxx51sQdvTdXR8+v/1TC1jeFBgoa3Gr4aK
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yxLrxzVWBPX5BrauzYGrM3EzmamD8m0d8ockMkQXm5seTqgSbYGl8ULGi8j6lY9ckZIXJiDO5u
 EHdWhI55tuulrQCX/QPFoJ2wRBpf57I0cB3ekMLCC/U0Xx4lzU0IMQxyo613PzDFtWobFbD2s+
 I6lcT1bNlpfmabtpBlhfibGZby3CCcKgKJbVp3/YM8snEuXrBkH6dYhZMDQIYnqqHgYPZfO0FX
 V28H1/IXDZeWZYafJKXluyATneP+QcAFCJmKO959f3K9qR0TlPgPy/EgFA/LTjjtWYSPokawUR
 pH0=
X-SBRS: 5.1
X-MesageID: 46470061
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bfAx/KyNx9T02tmBW3OiKrPxkuskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE81bfZOkMgs1MSZLXXbUQyTXcFfBOrZsnPd8kjFmNK1up
 0QCpSWZOeAbmSSyPyKmjVQcOxQg+VvkprY/ds2pk0FJWoBCsFdBkVCe32m+yVNNVR77PECZf
 6hD7981lydkAMsH6OG7xc+Lor+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10TDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy+Qzd4dvfrGrCou
 O85SvIDP4Dsk85uVvF+ScF7jOQlwrGLUWSkmNwz0GT+/ARDwhKdPapzbgpDCcxrXBQ4O2UmZ
 g7r16xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuIoO4PeQkjTJo+bo7bWrHAbocYa
 JT5QDnlYFrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd4AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlayXkVwzvdIPcb
 H6IRxlXEIJCjfT4Py1ret2G0r2MReAtBzWu7VjDrZCy87BeIY=
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46470061"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjHCnrJ0EN14y2xFlE3N4ejP4NPg1rFETrmh/39qXmFlicCWm431AtVpt85IW9YwxCOJdR806H+qPlZy+VdylB8FcrIciTbOEZA8l2rAy8oKSXueIkXgHDc2sruRh0aRqkPYNBh6VJkIyCd7w40CWNdw7LaZD37aYWMyYDQukMKjcNj4Nl63SIxi12QiJ0tB3V95fqhzFGRaAlnHWOKOUQDDqSUthbyZMZocxfUyfD/PDAM3IPbO0brDOez40R0erFfRy+YUK2BfvhDMgcNkOOXZOeuFe72A6yWuGvqTzNkGrJQIBLg8PImD6Zo7uQiA/fMhA6tgHQY6DTzLBpIk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zL7N5KFhmFYYv0XI5Kv9FvWQfJWS92wFtadgO96hjps=;
 b=CNxs2JCkknQJSKDQjLRbZiu+DY0izHAXwmPlyOITWsXNUbS7C9uotKBdEk7h+I3GXIhFp0NsPsRzTVF9/blHoCVwnNoCqkWKPeHiFRVuihY4ie0QTdSs/og5VdRKkL7cCypEt5Zznunj2L3WkeBk8QJrWSkGTH5/PepnB98KBT7gCIydKYWBmUtjjRETex9s5A4iiG26uMFRPXCx1tQt3AGVymavsrnngkMRnJw58lbmrSlHjPIvyiNJcGZBNGUvqRt4rVyUQH9NY0dxh/Nf4xLAceYZ0+GOdr0pIHhsm1eHnXYiUYqK/g7C5a7RbwzusAv3dNWd8xs8FqIT68kHfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zL7N5KFhmFYYv0XI5Kv9FvWQfJWS92wFtadgO96hjps=;
 b=cWpkNLzh4SG5sg7iioaz9MsGDIrJMh/kEiR8mGCbYEvMxCNDGQ75sGbNSUi5MUYhjzrUrtBXIQ+cSbguaenDMMHi7SXgBsIT8n4HOE46N5CCi7/Lwl0HROUR4ZLJdoygdjwgu3OZJJ0/hu3J1mxTQM2WV2BqFjn6U3P3Fg64zcA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 11/12] golang/xenlight: do not negate ret when
 converting to Error
Thread-Topic: [RESEND PATCH 11/12] golang/xenlight: do not negate ret when
 converting to Error
Thread-Index: AQHXUNy0cb4zmhfPmk6oj5nz8SWtlasaByMA
Date: Fri, 18 Jun 2021 15:13:03 +0000
Message-ID: <2C77D13E-ABB5-47F2-B466-07CD6652AF33@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <82bc8b720c3dfb178e52d10ddbebfa8dc5880e7b.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <82bc8b720c3dfb178e52d10ddbebfa8dc5880e7b.1621887506.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 106e4bbe-a815-4bf5-1d37-08d9326b9187
x-ms-traffictypediagnostic: PH0PR03MB5734:
x-microsoft-antispam-prvs: <PH0PR03MB5734573EBD69C881D99987BD990D9@PH0PR03MB5734.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T6j4w4WnumrJRnAabXhASor4D3xkeK8SJJLLEWj90/9oYqi/YXflRSjSfEpy9k9bOxJcgfRsaSlQH0xI9IOqQV7MB5PUvthWzD9rbDZBSTxK/tk5R8P1zVpO9NpamgyRgYJ942aY+HjQJ3mC+5S99dxtUAcilBOxC3hx8SvOX8wi9f45nXAMBlhNAizPdwKGNgf5oufXHYKIJuVOJqNMaZIuuiWy8vjM8n2VYKTNZt0H7Njm3BpdgPBlduPefgVGpFzUMlAtvH0DzEOpQCZqwYEVeM0YzWkYy9s5vjLXYlUD7fGH+soTNRMzxHYoisIRC2ZDMhimY+tgwVHvso5YhTZs9lDeZslCxKiO66Q+tDnzhNo4NoQmMug/dM6B6jzMlIk5KTSwuETojbQyokPfoD6aF/CWbZpe3I5J75b0lyyJPFb7AoltJy6RbbzReXdnyTy0Nr7/oNCpbFX+ZGzEPWhV6OSsog52lIv3QZngTLJBzFQ2EZstabnqwzHY1m/uqwAahq6OoSoB2urOpjizLJtNVT6JN5EVs6UB+TIqPFjwMmC+ai+0PhyQk4cqPaEyOeexEKeeVJ5E5NO2Mrc2w2Kn0JuJbDH0AhHqerz2kfIu6arDCzOatJ52K1MFderKGONaaEvhaNdLgVIbGQU4BbpYHB+peVhESNih49q+OjM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(4326008)(186003)(26005)(478600001)(122000001)(66556008)(2616005)(38100700002)(316002)(5660300002)(86362001)(83380400001)(64756008)(54906003)(91956017)(66476007)(4744005)(66446008)(6916009)(6512007)(53546011)(6506007)(8676002)(2906002)(66946007)(6486002)(36756003)(33656002)(76116006)(8936002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjZnWTg0OTVybWVSd0tINjdJUUdQMXlmaTREazRmdlE0Z1o5N3QrZXY1QWEx?=
 =?utf-8?B?U2x1T0R2K0xYbS9oUHZSTGdxTzUwZm9XYmhLSm8vY3IrQmpRblc2aWVMZ2Rr?=
 =?utf-8?B?YUhYSStNbjlMVW02NXJucVFDVVYxdDRuMXQ1eHgvVjFBUW5wbnV5VEMyeVpJ?=
 =?utf-8?B?aThOKzdoeU5UQUdwUGJ1WDlzTHVRbVdnQTBRZkFtREQrdExMYzROdVNJanpp?=
 =?utf-8?B?SzFxOXFxaFh0bllEUXc3dFMwT1EzRCtvWHNrRTFPZUY5RVJZbHVTdWd4a3p3?=
 =?utf-8?B?aWcvNkFnM3lXVmIxTHZpZjJZUjhBTE0rbWl6Zk1mNm1sek4wSkRsZldrK0I1?=
 =?utf-8?B?TGlwUHhRTEg0L0RpdjA5STVzZjlRMjAycTJMYzVLQ1ZhRXRZcFJjT2JUdVRs?=
 =?utf-8?B?NWdHWWFpbGxWQmZRSkV2UDB1K0lmQkJHLzYwZkRGRnNPYWhnYitKTlE5Sk5i?=
 =?utf-8?B?QUR1MFJBSC9KTzZHcWFUVEp1WlhGN2lRS09QS21jWVpGbTNIRVZRVEFObnpo?=
 =?utf-8?B?QU9DOVpvMnlpdGZwMGd1VHUyL0p1cXNpRFhFMjhjd0NCeks1SmtYMFNRV2xE?=
 =?utf-8?B?K2luYkNJZksvSzQxUnluYzlCcjlWNkZORnB5TWtjV2FBTjFORXZqZk52L1hx?=
 =?utf-8?B?cEc4NS9UUXBXbUpvM3h3WkFqK2x0OFpiUG5qM1NuL05RUFNIOTVzZkE2YXg0?=
 =?utf-8?B?Q05JeHdlT0dTaUdXMStLTlNaQWlqbTNMQ0FYeE9DNzZZc3BCVHpmL2JkcjlH?=
 =?utf-8?B?K29qYXo1TlczN1dKb01wdTFHbVFyRkpNNnJjUkdxMFN2bXlMc2cyTHU4YTJQ?=
 =?utf-8?B?V0xHSWNLRmpDVjBrZDlIZkpkaFd5N0lvcVFHR01kWjFoR2k1VjM2WnFzalJY?=
 =?utf-8?B?Q09KRjNMVytDWW5GK2tFV3k4Vk8xZlhrRDRMOEh1QjAxak9JMEMvYmFkS3dz?=
 =?utf-8?B?UlZPdmp5VW03RytGY1ZwamV6TTdjaFJkbCtzdGRKTDVCRGtRbWcrZExta0VQ?=
 =?utf-8?B?UmxsamFXRWRZMWRpOXZ5RVBaOEZPSlNzc2c3bTJ6WkcrWFlJOEtSUC9rUWhK?=
 =?utf-8?B?Q3RDQmh4SXdPUGFRZ1ZwL0p1WldxTzVZTjZkUHE1TzdTZ0dsUW14QXdRQnl4?=
 =?utf-8?B?YWlMellOK2FJdmk5MzUvZlZHZGk0SllHR2lPaXVER1BnNVZvSWJYczcwU0l2?=
 =?utf-8?B?dGpEaFVWUTd5VE92YVlISlhmOGIrQ1pFM01GZFUrdG94YnpiRU1nS3R4Ujg4?=
 =?utf-8?B?RU5UdlhEbUpUd1MzSDY1UjBobVQ2UEc3OWZ3aC9lckpscEJIZEFsbCtydElY?=
 =?utf-8?B?bzduekpic2JLU3B2TitBZmdYWHdwUFhYeTg3TWluRTZTcUlJNVpMdGhMYlBR?=
 =?utf-8?B?ZkczY2Vpak1oRTJ0blJhdGdTbVFVcFBQNVkrUmVQK1d1MklTeVdkcFRmeVFm?=
 =?utf-8?B?amFCNVM1RDQ3K3N0MFpkM3BMZDUvK3JMbUpWSlUvZW5RbS9FbnZMRDVUTCtG?=
 =?utf-8?B?dCtocGV4LzBUc0kydGZhbnQyak9JZER0RWhnSUk1Q1N1dkNyV21UdzJwdkM4?=
 =?utf-8?B?MzFFVStiL3JhMC9DVWdRdkRRR2NPT0VMZzA2NHVqN2cvYnBRTEY0T1pVRGxm?=
 =?utf-8?B?ZDN3azdkM2ZQek5Pb3dsS2RXUnQxZnQwamJ3QTB3WGVIdEZWRG13T3JHSVpl?=
 =?utf-8?B?SnllUG1jTTZLLzRFMUR3TU92ZkJyR0s1ZnNnYTVPR2VRWXBxeElGT3pFSzMz?=
 =?utf-8?Q?Wg75+E6xxyv5xUjAZp3ijNXAG7gvneOV90aZq34?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <657902F5BDB09A48A70DAEA39AEF54FE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 106e4bbe-a815-4bf5-1d37-08d9326b9187
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 15:13:03.3050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kv9PLUcGnrQGnVvoqQGv7ru5/Qc/lOFxNSjzk/1TaSwdTua1kdkx+Nw/ztznaH1PUlwGXMIX3kDTH0zgK252XKekwmyGo2DahaLA0SD//G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5734
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWF5IDI0LCAyMDIxLCBhdCA5OjM2IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IFRoZXJlIGFyZSBzZXZlcmFsIGxvY2F0aW9ucyB3
aGVyZSB0aGUgcmV0dXJuIGNvZGUgZnJvbSBjYWxsaW5nIGludG8gQyBpcw0KPiBuZWdhdGVkIHdo
ZW4gYmVpbmcgY29udmVydGVkIHRvIEVycm9yLiBUaGlzIHJlc3VsdHMgaW4gZXJyb3Igc3RyaW5n
cw0KPiBsaWtlICJsaWJ4bCBlcnJvcjogPHg+IiwgcmF0aGVyIHRoYW4gdGhlIGNvcnJlY3QgbWVz
c2FnZS4gRml4IGFsbA0KPiBvY2N1cnJhbmNlcyBvZiB0aGlzIGJ5IHJ1bm5pbmc6DQo+IA0KPiAg
Z29mbXQgLXcgLXIgJ0Vycm9yKC1yZXQpIC0+IEVycm9yKHJldCknIHhlbmxpZ2h0LmdvDQo+IA0K
PiBmcm9tIHRvb2xzL2dvbGFuZy94ZW5saWdodC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pY2sg
Um9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+DQoNCkVyay4gIEnigJlkIGJlIHRlbXB0
ZWQgdG8gc2F5IHNvbWV0aGluZyBtb3JlIGxpa2U6DQoNCiJDb21taXQgODcxZTUxZDJkNCBjaGFu
Z2VkIHRoZSBzaWduIG9uIHRoZSB4ZW5saWdodCBlcnJvciB0eXBlcyAobWFraW5nIHRoZSB2YWx1
ZXMgbmVnYXRpdmUsIHNhbWUgYXMgdGhlIEMtZ2VuZXJhdGVkIGNvbnN0YW50cyksIGJ1dCBmYWls
ZWQgdG8gcmVtb3ZlIHRoZSBjb2RlIGNoYW5naW5nIHRoZSBzaWduIGJlZm9yZSBjYXN0aW5nIHRv
IEVycm9yKCkuICBUaGlzIHJlc3VsdHMgaW7igKbigJ0NCg0KSSBjYW4gZWRpdCB0aGlzIG9uIGNo
ZWNrLWluIGlmIHlvdeKAmXJlIE9LIHdpdGggaXQuICBFaXRoZXIgd2F5Og0KDQpBY2tlZC1ieTog
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KDQo=

