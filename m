Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8AA3AD2EA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 21:32:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144965.266762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luKDc-0006My-9k; Fri, 18 Jun 2021 19:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144965.266762; Fri, 18 Jun 2021 19:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luKDc-0006Ko-6X; Fri, 18 Jun 2021 19:31:56 +0000
Received: by outflank-mailman (input) for mailman id 144965;
 Fri, 18 Jun 2021 19:31:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luKDa-0006Ki-12
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 19:31:54 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e71707e5-85e2-46b2-bc47-65fd885e7a37;
 Fri, 18 Jun 2021 19:31:52 +0000 (UTC)
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
X-Inumbo-ID: e71707e5-85e2-46b2-bc47-65fd885e7a37
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624044712;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=x0fOnCH0yAQs/bd9+Sl21d26qdj9CFx97Mu0niP1xfE=;
  b=ZM39YF0frOXWDBnwstrX2G5B/PEmcW22EnF5qI+3gBrkvSkYuTb6C3wy
   n7jtRPBwtfM/cUHAXmmZupf1mL8ssm64y+E/jSLKGCIipKBucZkEMbXnX
   TBVthRnQp5R9Y7Q/I2TFefg34Q1S0thu83+v76/oi74Zhc0RC6jxbNBaG
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9dHkLl3LBTTtm8y7cZlnwtjI9Bcvr4oWJxUVGlkzUPbIsLQkpEKpMlUlDGUMOubkA/UmRT8J46
 xU25OjhtklKp2rfu4KT5RCW9vT7SNwH66IacraQB6OgwLgZQ+GYD4oKaAf2RJVEZU7QSLBH/nQ
 IwV6Ae/B0CqJT8Bx3i49ZNSthblLFwaEiVu/G1ouV1H3tjEQ+iwRCUjFkcBoVE8AMAYRmQ6Dax
 HsdnLbGpH/rCHMUI9ehPBSqKTgJO/gH5V9Znn75tToEtczinz3bqbvDpQNZ4xX4LB4K6ZA3ioS
 zb8=
X-SBRS: 5.1
X-MesageID: 46215958
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LwXOJ6kahREvkQTYP44Hvne0i4HpDfNqiWdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcIi7SdW9qXO1z+8Q3WBjB8bcYOCGghrnEGgG1+GC/9SOIVyHygcw79
 YDT0E6MqyMMbEYt7e63ODbKada/DDvysnB7oq/vhRQpENRGttdBmxCe2Gm+zhNNXB77O0CZf
 yhD6R81l+dUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonSs2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlaAkEyzzYIbiJaYfy+wzdk9vfrmrCV+
 O8+ivICv4Dr085uFvF+ScFlTOQiwrGoEWSt2NwyUGT0PARAghKS/ZptMZhaR3e5FMnvNZglI
 x2/0/xjesMMTrw2B3n4d7GThdrkVfxh0EDv6o8s1xzOLFuNYN5nMgn50VSH44HHCXmrLocN4
 BVfZ7hDNA/SyLHU5mRhBge/PW8Gns0BRuIWU4Ep4ic1CVXhmlwyw8CyNUYhWpozuN2d3Bo3Z
 WNDk1TrsAEcibWV9MLOM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI75r6+q886u2mcIEBiMJaou
 WMbHpI8WopP07+A8yH25NGthjLXWWmRDzojsVT/YJwtLHwTKfidSeDVFctmc29pOh3OLyXZx
 9yAuMePxbHFxqgJW9k5XyKZ3BiEwhpbCROgKdIZ7unmLO+FmTFjJ2pTMru
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46215958"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2mUstABdH14gWlOy93+fQBCkAGI8DJ89Uuaj62oYa/9O5JyTj76CkJOdGU5OZHEyrLCtMiunPcwGgp8U13L5DERc6RcgPsfExFFVeiNbLoMW/6x5zJgVkpWOFp95+Dvty0/WKYqpDMxHFgC80ZMP7yk8nKw8qjWstsbx34OF0jeDnhHTRTu2UXrBRbeJYlq1taX3xWW9AkewhPEQ4NEujmwMzXynUFg2zm72IGX5W93o1r3tgeoiRTRrm1yUwNR2nWaz003QwGXSIyUeMiy1m7oWaoFO75djgqMQKHoYZzKxUmT2G4s3bKuuQIMH6qh1lxKHWX96ihyTvj0u1IfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0fOnCH0yAQs/bd9+Sl21d26qdj9CFx97Mu0niP1xfE=;
 b=TNzrltIqP0cZz3N4kFdcdhHyGUde4BDyxOi1yJjzgqC7PdT/UpL/l+Ki0NcaCM8ls2/w8WiDsPfRoGrDYaY2G0LU85IafRkbsgmkYxEXOP881dLb4quioBWRWsy1/J9SFg7lqjaWGM2jZMhQnD4QrIrP35rYG8aoIFdmv/TAYMQVl/1CGLh8emhjE+WQ8ILPhAWcGoUygR+scBm1p0yMrDGw+Saqygz06SAGAVf+nHKNet+Zo1Et4OtK25ECfzfU/SvrrDqB4Ojsg7RrdhUq7wpvD+flE64ylBNwPgSeAQd7edE+uW2hN3ANi4ZJizGRosz6LL62Iiz4o5QlGHacQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0fOnCH0yAQs/bd9+Sl21d26qdj9CFx97Mu0niP1xfE=;
 b=XUNRLn9E4OY/GJTJmw1tL2I2/tHIYSYIKQNvtWWa/d8bDb7U3kdiA6o8a5OVcpnsvkjAqYcSs2n/M7J7pbyqT7nqjL1mnqCjcWwJYMPARkPBK/QNWS8wlMUr6czfDbXmjlnSkit2v7Zlu8WJd4YYxkBTyI5jumh2qbLVDH2B9K4=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 12/12] golang/xenlight: add NotifyDomainDeath
 method to Context
Thread-Topic: [RESEND PATCH 12/12] golang/xenlight: add NotifyDomainDeath
 method to Context
Thread-Index: AQHXUNy1vChg4LMpNU6QjEPyRTou1KsaPdIAgAARmAA=
Date: Fri, 18 Jun 2021 19:31:46 +0000
Message-ID: <8D6E3510-754C-450C-99F6-63BE9FA6F748@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <e415b0e26954cfc6689fbd3ba7d79fe664f3bb50.1621887506.git.rosbrookn@ainfosec.com>
 <56DEEBE0-88E3-4E00-A998-30FF034BCB73@citrix.com>
In-Reply-To: <56DEEBE0-88E3-4E00-A998-30FF034BCB73@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08fb4591-f49e-461e-e2d3-08d9328fb5d8
x-ms-traffictypediagnostic: PH0PR03MB5832:
x-microsoft-antispam-prvs: <PH0PR03MB5832380F6C8D1A1EEFEA4BC0990D9@PH0PR03MB5832.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gTqShPlO6fbV7LdeEuaXKfSz1/2IEsPoqEHoxvHd6DUMXnj7Me+kU8qoGktCOymCgcqXBBq4/qEDsLbrYtxaSuhQRQS+GtE7zR0s/RPup+yrNayaLe2VUze/F10aHPim6YqfjuDK9zuGS1aBslh1RbZqsqhQX4wmvORduIidN2K+3HkVXrHEpXaQzi9ITtbJAIlhFsgtkn5+X7grz7wqxb2XEDXJPqbc4WrXxmf/fxGh+iuHoCskY/bUNVQyl/s2KtCTi6D3iti3/78zC35x06Q03ECki4dMnPsg3SvRpA3EHB2VFKUaNABvzeLJ40E6v7uTJdIOL+m1o+kv/Kp0eYO21padAiiipfas+OZ6NxxTZbFERCg0kksEhtg+XimxW2mEZ1N2UV65YklcgDDOqEqB4I9+Rf+tsqYPNySa08FQ6Vpfe0AhkTX2+U81yfXqN9durhOYvqbzjJng7Zq5BpzLam/C3fBaTUKimefBpRekM7Tx6MXbrIO0ow2VKqtLEBzdK3nAOOtqow/mgUJrJ75Oa01hjGW3hoi/oQ59SMySPqZ7fAGJdIRejrhjWhmVu4vs9P61GbtFcDi1NMj8n3QjWEFMwTBDu5Jnqng2iZoOl8p1sOmRh5ZDDTueg5btb2siDdH9SMeevza2fe+5fc67Cs64REs2DCWJEQa4SxQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(2906002)(26005)(83380400001)(6916009)(86362001)(33656002)(5660300002)(4326008)(53546011)(6506007)(478600001)(316002)(186003)(54906003)(66556008)(2616005)(66476007)(8676002)(66946007)(76116006)(64756008)(122000001)(38100700002)(71200400001)(91956017)(66446008)(36756003)(6486002)(8936002)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWNsRHF6Uy9mV0M1L1pzVmJadnp6T0lNV3l3aTlVamtRdG1zMTBpVlE4SzdD?=
 =?utf-8?B?UzA5Wm5FUU5Vc1hUNmR3MGI5OGlRdGpxckZtWlhkY0l1R0ExUVZVRGJpSTBy?=
 =?utf-8?B?Q1hWaitQOHcrT21HTE0veGtremFVMXJuVFFqdW1LZ3gvbE42Wm9WTGFBMnpp?=
 =?utf-8?B?eXNPN3pLTUJwSzFhUGFJNTc4bytUcXpQZVBpMEVHVXJ3Znd2TDRtU01CTDFv?=
 =?utf-8?B?OWI0OERQSFZ3ejdmRFVORFJwaHZvNkpNUkxZVHRCYzJuNmtXZnM5a01aaGsr?=
 =?utf-8?B?TWpOb3MyZ1NZdEdhTGsrSjVSS2xHUCtFUjdHUHFybFpiZEJ3WVVkWFBraGtk?=
 =?utf-8?B?a0hWMGMzRHZoNzBTNStIMUNVLy9oWVgyeWhXeDZiZ1JXYTVjbW1nNmhaa0Rh?=
 =?utf-8?B?OEZpWHNhc28rYWxvRTFQZzJNUUFiNXpITklzaFVQNmhqS0FQdG45SmR3aHds?=
 =?utf-8?B?eEV4djlsSmdOL2RHMExFZmxkVFF0ZGE4MGVLS3dtVm12KzFwR25yUkRhMHg1?=
 =?utf-8?B?UEJQUkk5QW9FVmozcThLOEcxYWFnWm1yd1NybDdML1NyR0prQ3J5NGdFNmdu?=
 =?utf-8?B?NmMyZVBFODkzTjBYdFJzZkZjdmlkUkFWVm5uYXpEZXdjMk1NMHNXd2Mwa1ZC?=
 =?utf-8?B?b3p0eUhmWFBiL0d1aVJoSzRpU0pDdXNCeHFLKzhObFZSc3Y4dGZSQmxlVWZa?=
 =?utf-8?B?RjVZV0ozSEpTTTl2anJtK2tUUmg5T0FmQWlScTg0VkxLTkI2SjNuZXVVZFQy?=
 =?utf-8?B?dGFFR2lpWk8vbXczQy9QeHNUdGFLWW9QTVRrZ1VJSU9mZy9xVmQ2Y2liajdQ?=
 =?utf-8?B?cjZIQlk0UUZMankxU1A3akJZRWlqbGxaUkJ1ZExKSjFDSTFiZjNtWmlzY25v?=
 =?utf-8?B?ZElRcmpBdGJHNzlHeUdxQlNMSkx5ZVRYTDc2UWQ0R05WdXNidjhyby9LTnJi?=
 =?utf-8?B?cG9vQXJxcG9LSkdxWEVOTHJYdnh3cWxVNmdKaWVIcm9xQnBMbHdFQm90NWF5?=
 =?utf-8?B?bWxBZkpHN2NvNWE2Q3poUCs0QkRya3F0cElXVEhzaUk3UGJMaE9hTmFUY09k?=
 =?utf-8?B?cHdma2ZzbytTSzFrbUdnMUpNZk1OdHhDSkdQb3V0M3hTODVwL1ZXRDRlQjlq?=
 =?utf-8?B?UHpKRVJIVGF1RjYwdXdzb1JtZGhPZmFtQ2ZSNmlsQkh4VTBnRmxWZmN2TlM1?=
 =?utf-8?B?U1FCWUZJZ1ErQ29PYWxKbU1NaCs2SnhwSkwvSTU1UWp6REdVYzhGMFd2VkZE?=
 =?utf-8?B?eVRtMm9DckdVU2c1WnNtVWVmR0ZXbVVKeVFiR1pMcDJwU3BaUU5iL2wxUlJG?=
 =?utf-8?B?bWJaek1aYVQ0Vkg2MTkvUGtJZS9JYjVyakZTVmhIVFZOSjFKb01VbXM3UkRL?=
 =?utf-8?B?aFBBdGhGTHNoK1I0ZjZkeDUrcjkrdGtoTmpKMmJLUGxOLy9qOW1LeWtIVmEx?=
 =?utf-8?B?RUpDWmtud3JVSEhRY3Y3eVV5VWwxcEZSUUdCYlRTMWxTbFlvSlA1bFVXangv?=
 =?utf-8?B?YVBxRGJOZnM3aU04cHN2UUs5T1MrSS9Yd2ZhRDl6YjgyN0V6MHIyQ21vd3h5?=
 =?utf-8?B?VW5DK251OTJPWEtncSsrcllDTm9CVWdKMDc1Rnc1ZVY4eVZHaW8wdVRiOFlR?=
 =?utf-8?B?bFJtL2hiTkJMcmg4dWN5eU4rL0tjb3pUOTh0VmRKWTJQM3hBK1R6RUpVek5G?=
 =?utf-8?B?MitkajVzeXNlUnJzczczc1hmZlBKWWJsQWR0UmRJV3YxV294SEtlaWl0UlB3?=
 =?utf-8?Q?Fdjuor+ZOkq5e9D7hx0qBTC4fBTrE6hGJ5BSZa3?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <907EBCE509A36E4D803E8D23E0EA59E0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fb4591-f49e-461e-e2d3-08d9328fb5d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 19:31:46.0694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A29vX2cY1uWOKZ01Boz+XxSahGN7U0DHwZ3t4qb8hylW54DYbHVBsoW7fv9c3uQAZSK2sps8iDCjVdEkFXqTCTVDpv9QEqfTBtnm9Led/j0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5832
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSnVuIDE4LCAyMDIxLCBhdCA3OjI4IFBNLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gTWF5IDI0LCAyMDIx
LCBhdCA5OjM2IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AZ21haWwuY29tPiB3cm90ZToN
Cj4+IA0KPj4gQWRkIGEgaGVscGVyIGZ1bmN0aW9uIHRvIHdhaXQgZm9yIGRvbWFpbiBkZWF0aCBl
dmVudHMsIGFuZCB0aGVuIHdyaXRlDQo+PiB0aGUgZXZlbnRzIHRvIGEgcHJvdmlkZWQgY2hhbm5l
bC4gVGhpcyBoYW5kbGVzIHRoZSBlbmFibGluZy9kaXNhYmxpbmcgb2YNCj4+IHRoZSBldmVudCB0
eXBlLCBmcmVlaW5nIHRoZSBldmVudCwgYW5kIGNvbnZlcnRpbmcgaXQgdG8gYSBHbyB0eXBlLiBU
aGUNCj4+IGNhbGxlciBjYW4gdGhlbiBoYW5kbGUgdGhlIGV2ZW50IGhvd2V2ZXIgdGhleSBuZWVk
IHRvLiBUaGlzIGZ1bmN0aW9uDQo+PiB3aWxsIHJ1biB1bnRpbCBhIHByb3ZpZGVkIGNvbnRleHQu
Q29udGV4dCBpcyBjYW5jZWxsZWQuDQo+PiANCj4+IE5vdGlmeURvbWFpbkRlYXRoIHNwYXducyB0
d28gZ29yb3V0aW5lcyB0aGF0IHJldHVybiB3aGVuIHRoZQ0KPj4gY29udGV4dC5Db250ZXh0IGlz
IGRvbmUuIFRoZSBmaXJzdCB3aWxsIG1ha2Ugc3VyZSB0aGF0IHRoZSBkb21haW4gZGVhdGgNCj4+
IGV2ZW50IGlzIGRpc2FibGVkLCBhbmQgdGhhdCB0aGUgY29ycmVzcG9uZGluZyBldmVudCBxdWV1
ZSBpcyBjbGVhcmVkLg0KPj4gVGhlIHNlY29uZCBjYWxscyBsaWJ4bF9ldmVudF93YWl0LCBhbmQg
d3JpdGVzIHRoZSBldmVudCB0byB0aGUgcHJvdmlkZWQNCj4+IGNoYW5uZWwuDQo+PiANCj4+IFdp
dGggdGhpcywgY2FsbGVycyBzaG91bGQgYmUgYWJsZSB0byBtYW5hZ2UgYSBmdWxsIGRvbWFpbiBs
aWZlIGN5Y2xlLg0KPj4gQWRkIHRvIHRoZSBjb21tZW50IG9mIERvbWFpbkNyZWF0ZU5ldyBzbyB0
aGF0IHBhY2thZ2UgdXNlcyBrbm93IHRoZXkNCj4+IHNob3VsZCB1c2UgdGhpcyBtZXRob2QgaW4g
Y29uanVuY3Rpb24gd2l0aCBEb21haW5DcmVhdGVOZXcuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6
IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+DQo+PiAtLS0NCj4+IHRvb2xz
L2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDgzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0NCj4+IDEgZmlsZSBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQu
Z28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28NCj4+IGluZGV4IDZmYjIyNjY1
Y2MuLjg0MDY4ODM0MzMgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQveGVu
bGlnaHQuZ28NCj4+ICsrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbw0KPj4g
QEAgLTUzLDYgKzUzLDcgQEAgaW1wb3J0ICJDIg0KPj4gKi8NCj4+IA0KPj4gaW1wb3J0ICgNCj4+
ICsJImNvbnRleHQiDQo+PiAJImZtdCINCj4+IAkib3MiDQo+PiAJIm9zL3NpZ25hbCINCj4+IEBA
IC0xMzQwLDcgKzEzNDEsOSBAQCBmdW5jIChjdHggKkNvbnRleHQpIERldmljZVVzYmRldlJlbW92
ZShkb21pZCBEb21pZCwgdXNiZGV2ICpEZXZpY2VVc2JkZXYpIGVycm9yDQo+PiAJcmV0dXJuIG5p
bA0KPj4gfQ0KPj4gDQo+PiAtLy8gRG9tYWluQ3JlYXRlTmV3IGNyZWF0ZXMgYSBuZXcgZG9tYWlu
Lg0KPj4gKy8vIERvbWFpbkNyZWF0ZU5ldyBjcmVhdGVzIGEgbmV3IGRvbWFpbi4gQ2FsbGVycyBv
ZiBEb21haW5DcmVhdGVOZXcgYXJlDQo+PiArLy8gcmVzcG9uc2libGUgZm9yIGhhbmRsaW5nIHRo
ZSBkZWF0aCBvZiB0aGUgcmVzdWx0aW5nIGRvbWFpbi4gVGhpcyBzaG91bGQgYmUNCj4+ICsvLyBk
b25lIHVzaW5nIE5vdGlmeURvbWFpbkRlYXRoLg0KPj4gZnVuYyAoY3R4ICpDb250ZXh0KSBEb21h
aW5DcmVhdGVOZXcoY29uZmlnICpEb21haW5Db25maWcpIChEb21pZCwgZXJyb3IpIHsNCj4+IAl2
YXIgY2RvbWlkIEMudWludDMyX3QNCj4+IAl2YXIgY2NvbmZpZyBDLmxpYnhsX2RvbWFpbl9jb25m
aWcNCj4+IEBAIC0xMzU4LDYgKzEzNjEsODQgQEAgZnVuYyAoY3R4ICpDb250ZXh0KSBEb21haW5D
cmVhdGVOZXcoY29uZmlnICpEb21haW5Db25maWcpIChEb21pZCwgZXJyb3IpIHsNCj4+IAlyZXR1
cm4gRG9taWQoY2RvbWlkKSwgbmlsDQo+PiB9DQo+PiANCj4+ICsvLyBOb3RpZnlEb21haW5EZWF0
aCByZWdpc3RlcnMgYW4gZXZlbnQgaGFuZGxlciBmb3IgZG9tYWluIGRlYXRoIGV2ZW50cyBmb3Ig
YQ0KPj4gKy8vIGdpdmVuIGRvbW5pZCwgYW5kIHdyaXRlcyBldmVudHMgcmVjZWl2ZWQgdG8gZWMu
IE5vdGlmeURvbWFpbkRlYXRoIHJldHVybnMgYW4NCj4+ICsvLyBlcnJvciBpZiBpdCBjYW5ub3Qg
cmVnaXN0ZXIgdGhlIGV2ZW50IGhhbmRsZXIsIGJ1dCBvdGhlciBlcnJvcnMgZW5jb3VudGVyZWQN
Cj4+ICsvLyBhcmUganVzdCBsb2dnZWQuIFRoZSBnb3JvdXRpbmUgc3Bhd25lZCBieSBjYWxsaW5n
IE5vdGlmeURvbWFpbkRlYXRoIHJ1bnMNCj4+ICsvLyB1bnRpbCB0aGUgcHJvdmlkZWQgY29udGV4
dC5Db250ZXh0J3MgRG9uZSBjaGFubmVsIGlzIGNsb3NlZC4NCj4+ICtmdW5jIChjdHggKkNvbnRl
eHQpIE5vdGlmeURvbWFpbkRlYXRoKGMgY29udGV4dC5Db250ZXh0LCBkb21pZCBEb21pZCwgZWMg
Y2hhbjwtIEV2ZW50KSBlcnJvciB7DQo+PiArCXZhciBkZWF0aHcgKkMubGlieGxfZXZnZW5fZG9t
YWluX2RlYXRoDQo+PiArDQo+PiArCXJldCA6PSBDLmxpYnhsX2V2ZW5hYmxlX2RvbWFpbl9kZWF0
aChjdHguY3R4LCBDLnVpbnQzMl90KGRvbWlkKSwgMCwgJmRlYXRodykNCj4+ICsJaWYgcmV0ICE9
IDAgew0KPj4gKwkJcmV0dXJuIEVycm9yKHJldCkNCj4+ICsJfQ0KPj4gKw0KPj4gKwkvLyBTcGF3
biBhIGdvcm91dGluZSB0aGF0IGlzIHJlc3BvbnNpYmxlIGZvciBjbGVhbmluZyB1cCB3aGVuIHRo
ZQ0KPj4gKwkvLyBwYXNzZWQgY29udGV4dC5Db250ZXh0J3MgRG9uZSBjaGFubmVsIGlzIGNsb3Nl
ZC4NCj4+ICsJZ28gZnVuYygpIHsNCj4+ICsJCTwtYy5Eb25lKCkNCj4+ICsNCj4+ICsJCWN0eC5s
b2dkKCJjbGVhbmluZyB1cCBkb21haW4gZGVhdGggZXZlbnQgaGFuZGxlciBmb3IgZG9tYWluICVk
IiwgZG9taWQpDQo+PiArDQo+PiArCQkvLyBEaXNhYmxlIHRoZSBldmVudCBnZW5lcmF0aW9uLg0K
Pj4gKwkJQy5saWJ4bF9ldmRpc2FibGVfZG9tYWluX2RlYXRoKGN0eC5jdHgsIGRlYXRodykNCj4+
ICsNCj4+ICsJCS8vIE1ha2Ugc3VyZSBhbnkgZXZlbnRzIHRoYXQgd2VyZSBnZW5lcmF0ZWQgZ2V0
IGNsZWFuZWQgdXAgc28gdGhleQ0KPj4gKwkJLy8gZG8gbm90IGxpbmdlciBpbiB0aGUgbGlieGwg
ZXZlbnQgcXVldWUuDQo+PiArCQl2YXIgZXZjICpDLmxpYnhsX2V2ZW50DQo+PiArCQlmb3Igew0K
Pj4gKwkJCXJldCA6PSBDLmxpYnhsX2V2ZW50X2NoZWNrKGN0eC5jdHgsICZldmMsIEMuTElCWExf
RVZFTlRNQVNLX0FMTCwgbmlsLCBuaWwpDQo+PiArCQkJaWYgcmV0ICE9IDAgew0KPj4gKwkJCQly
ZXR1cm4NCj4+ICsJCQl9DQo+PiArCQkJQy5saWJ4bF9ldmVudF9mcmVlKGN0eC5jdHgsIGV2YykN
Cj4gDQo+IEkgaGF2ZSB0byBhZG1pdCwgSSBkb27igJl0IHJlYWxseSB1bmRlcnN0YW5kIGhvdyB0
aGUgbGlieGwgZXZlbnQgc3R1ZmYgaXMgc3VwcG9zZWQgdG8gd29yay4gIEJ1dCBpdCBsb29rcyBs
aWtlIHRoaXMgd2lsbCBkcmFpbiBhbGwgZXZlbnRzIG9mIGFueSB0eXBlLCBmb3IgYW55IGRvbWFp
biwgYXNzb2NpYXRlZCB3aXRoIHRoaXMgY29udGV4dD8NCj4gDQo+IFNvIGlmIHlvdSBoYWQgdHdv
IGRvbWFpbnMsIGFuZCBjYWxsZWQgTm90aWZ5RG9tYWluRGVhdGgoKSBvbiBib3RoIHdpdGggZGlm
ZmVyZW50IGNvbnRleHRzLCBhbmQgeW91IGNsb3NlZCB0aGUgb25lIGNvbnRleHQsIHlvdSBtaWdo
dCBtaXNzIGV2ZW50cyBmcm9tIHRoZSBvdGhlciBjb250ZXh0Pw0KPiANCj4gT3IsIHN1cHBvc2Ug
eW91IGRpZCB0aGlzOg0KPiAqIGN0eC5Ob3RpZnlEb21haW5EZWF0aChjdHgxLCBkb20xLCBlYzEp
DQo+ICogY3R4Lk5vdGlmeURpc2tFamVjdChjdHgyLCBkb20xLCBlYzIpDQo+ICogY3R4MUNhbmNl
bEZ1bmMoKQ0KPiANCj4gV291bGRu4oCZdCB0aGVyZSBiZSBhIHJpc2sgdGhhdCB0aGUgZGlzayBl
amVjdCBtZXNzYWdlIHdvdWxkIGdldCBsb3N0Pw0KPiANCj4gSWFuLCBhbnkgc3VnZ2VzdGlvbnMg
Zm9yIHRoZSByaWdodCB3YXkgdG8gdXNlIHRoZXNlIGZ1bmN0aW9ucyBpbiB0aGlzIHNjZW5hcmlv
Pw0KDQpJdCBsb29rcyBsaWtlIG9uZSBvcHRpb24gd291bGQgYmUgdG8gYWRkIGEg4oCccHJlZGlj
YXRl4oCdIGZ1bmN0aW9uIGZpbHRlciwgdG8gZmlsdGVyIGJ5IHR5cGUgYW5kIGRvbWlkLg0KDQpJ
dCBsb29rcyBsaWtlIHRoZSBvdGhlciBvcHRpb24gd291bGQgYmUgdG8gdHJ5IHRvIHVzZSBsaWJ4
bF9ldmVudF9yZWdpc3Rlcl9jYWxsYmFja3MoKS4gIFdlIGNvdWxkIGhhdmUgdGhlIEMgY2FsbGJh
Y2sgcGFzcyBhbGwgdGhlIGV2ZW50cyB0byBhIGdvcm91dGluZSB3aGljaCB3b3VsZCBhY3QgYXMg
YSBkaXNwYXRjaGVyLg0KDQogLUdlb3JnZQ==

