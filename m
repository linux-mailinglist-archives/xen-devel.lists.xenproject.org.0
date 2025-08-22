Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A5B31483
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 12:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089816.1447287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upOZW-0000P1-Qy; Fri, 22 Aug 2025 10:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089816.1447287; Fri, 22 Aug 2025 10:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upOZW-0000Ml-OH; Fri, 22 Aug 2025 10:00:34 +0000
Received: by outflank-mailman (input) for mailman id 1089816;
 Fri, 22 Aug 2025 10:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jNg=3C=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1upOZU-0000Mf-Ep
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:00:32 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d459ed4b-7f3e-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 12:00:27 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by VI2PR03MB10619.eurprd03.prod.outlook.com (2603:10a6:800:27b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.21; Fri, 22 Aug
 2025 10:00:25 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 10:00:25 +0000
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
X-Inumbo-ID: d459ed4b-7f3e-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9WCGdS/eIWHIRxFnc8PbxtwwxcnStT5HO9psDucP5c88X3kR4peVVBYKnhuH14G7XSSs85ZEy6TDhWwSqmvrPzz89QpiweGWyDLUkK42hL707Say3jMNyOFnCbbATIM/6wU4++SREATHQeq14fvQC7/3fxuA0KWBHYq3uBCjsizfRA2X8Xm82hh+/MQtuq3WTU/j1r+a977w0gcI8EPc/9CiuyNP8kljt2ec1xHLrzWaJcR8W0pVSUnYct2DSmcuxeL4D+Ts48MYqNW6SqqnDcMJQYxMWzNS9DwOgNrm+YeCEBbf5oTFEK3VmtWV1OgAak1xcJzkS0YADYDn0T0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YO3dNsDeu5Cz+i3/tjLoxZMpt6P+NAXrBw1O7aTvSF8=;
 b=MavUXC8uaqhbuPnJD3SGg1L+WnZMoVwOAJASyszhn1KrCeh+21z+s+aG440hAOJmKnWhStJr1epJmNx4YoDP+2IwlGMtCf9knrNlxe4Ng0yDlNY384kfw1liAWcceTlxJaLZ6lJYwhPBGtRMkK0X0OC0EL2vbObTf2K0OD2a5obj42sZaZ0x6C7p8pkV8qLPm9jsI0TDG2sudYLZtg5HtqvhiA/ORaYbjJ6RLFY+W5z8V34Zvtvl6xzEXdEx0RFNu8rms3CJs4LMnto6br2vI4FdhqwnGO6gvNwmQ31CjI9D1N+jzrmQ8iNXcpTrdhxzsOjYIMdmRi45OMKucMtnaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO3dNsDeu5Cz+i3/tjLoxZMpt6P+NAXrBw1O7aTvSF8=;
 b=U/O9MkpDpdPEoVFkR7Sd3FE6hsXNOVwGjgrA3iv3n6eDmGshHcBaur9kNre9Qq9CD+Vdj6aWkgkhrMo0WMxUZx0RoTCVqD+TaSfv4aUWZuPt+lyLLTXirooLtIsgk/0p0nozbQxyKeWJ+bC14ByltwiBzNYG6mXxV5i2xXph2cwESiJo3gwVz0W1066mASTbAoMTOndQjBD2w95uB3UEbm7WZ5kiEcpgPafMeZBzIggi6jWJKKIY7doW1kxH3pJJzum+K01Sc08IMVHcE7oKfJ5VR3cS5GLEh9DDlg3ZdZwhA7G8PYnPjZHxPkzfhrNySJrgaef3J0Radoxerh2xvQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 10/10] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v2 10/10] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcB5d9o2YugLH3UUKTUBQVCD+iyrRuh/gA
Date: Fri, 22 Aug 2025 10:00:25 +0000
Message-ID: <554da5a0-2c36-4f52-ae9d-9e39cb07165d@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <3ba2381b4c782a5187161f9418e5a35e7916c752.1754568795.git.leonid_komarianskyi@epam.com>
 <87a53sd1ry.fsf@epam.com>
In-Reply-To: <87a53sd1ry.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|VI2PR03MB10619:EE_
x-ms-office365-filtering-correlation-id: 114ddf18-f7b5-4838-fdae-08dde162b710
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZzlXSWZSUXJXQWRTeW8rVTRlOGQwb3hYcElxY3Q2bTV1Z1ZjcDhaazZDUEtU?=
 =?utf-8?B?QXVjNDYrVjFBd2lkeDJCVk8xTk9NSHozamJpcWl4Q0ZpdWloZ2l4SFpjaEpw?=
 =?utf-8?B?M1BkM2VsRVpqM0FXNmtheE4va01EMlo3NHBaZkRVaW9ETm10RU5RTUhGZWpE?=
 =?utf-8?B?U21BMHUraDNPL3Q3R1NUOTdYejRlTG1FRU1waHgyR28xRExkRVJJUU1CV3p5?=
 =?utf-8?B?U1lwNjlBanNCb0hqelNpWXBObzMwOGZxRG4xeGZhMDEvWU1MNDA5ZVQxN2Zz?=
 =?utf-8?B?blFRdXBqQkVVSVVhSkQ1cjRsbWc2cG5aK3lTZlk2azBYc1kzODFBcm1BMStp?=
 =?utf-8?B?WEx3U2JjYkxnblprcnA1VkFsRnNWaGJHMnhQcjE5VkFhL0Yydjl5Wi9EYTVu?=
 =?utf-8?B?YW5OQlRYU29aMmduVy9BeGxNRmUyUlQvZVZ6aDFaMTRCTFFUWFpDNzhqRWo3?=
 =?utf-8?B?TU5BekFBWmdIeUJuMkdvWklVOUd6Nzh6YXQvL3lZWW5pM0d4aE4yVjRPbEJa?=
 =?utf-8?B?OHYxaUZwVk5uN1owSkt4UUhKNUNOeWlNTURCdGtVNzYzRVpRdkFIWHN2VmlE?=
 =?utf-8?B?Vm5ybllQVGthd01TTnNmZlRNVXVWdjF3Y2NLUE5YVHA3ZWNkbGJJMWw5U1pE?=
 =?utf-8?B?dGM2UFJYbGdWcEQycDVibnpVVm1mTlBKaXlPWThqQkJPcndHNEhkaWc1V1Bo?=
 =?utf-8?B?MTJPTjl1RHN5ZWxPWk5EMmMyMmRRSjdXelpIT2FpRlhSempDVGVQSkduMFRo?=
 =?utf-8?B?RGU5dEVoMU90TkpNR25qeHJ3QXlBem9TTEU4VGwwbFZCS2RSUkVrbUptV0Ur?=
 =?utf-8?B?YU85ZTkwTXg3UWtpQzRNM2tGaUlXeUlqRExaV3dPUG1OK1JuWGxiVnRKcmFJ?=
 =?utf-8?B?Z011aHJyZWZxT0hqMlIvUHJaeFpWbEVtSC8xT2VoSlFUcTg2KzdaZDNZUXJP?=
 =?utf-8?B?K1NBN1ZkQTVKZTd3MlltZ054R0oyRUhxU3JkbS8wbzRIdEE2UXh2M3JaOTFC?=
 =?utf-8?B?dnFEZkpkQURrbHY1ZVJuNTVtcWFaNUVmSHlEMXRUVnA1MHM4Znd6bStIR3pW?=
 =?utf-8?B?MUN2TzNQWWhaaUloMWl0blNTRkcrN090QWxLTWY0U2dYYnVEYTZSUTRlaVJQ?=
 =?utf-8?B?QlNuMUdWaE1RTGtoN0o5TVEzaGtkbngrUUQwc1NmVnQwYm5vNURKcEthaUEx?=
 =?utf-8?B?d2Q5SHQ4Z0lLV2JQNnZWZzM2TGgrelROVWtmRWErVnRNSzdPZmplV29ma1lM?=
 =?utf-8?B?b2JNbHgrVzdaTlpWYVNuTXhnc1NZanliZDFzWXlrdFZhS2Rwb0FFNXBYZEhH?=
 =?utf-8?B?WXN2QzlSZTlCVHZTOFljb24zRXM4RktTazZWRzI4SEpuZW5rNUp6aU1JWVJC?=
 =?utf-8?B?dTQ4OVNkQld4Y2VOcGYwZldsZFZPdjZORjVHamx0R2k5Uk1QRmx4UUdDZStQ?=
 =?utf-8?B?WXp5aExROVl0cWk2RXorM2JyV2pTaHloTVphUWpLUGVkNnNPOHZwdEZ1TFJi?=
 =?utf-8?B?cnh3WW1WNmtqL1VTSG4rcWU5cTc0R0FtQXhnMVNZM3ozRUtReFdkaHUyRktn?=
 =?utf-8?B?dmtVcFZ5dDhMd2I3V29FY2FmazBoMWpJcDg4bENCcFJJTURWT0ZsODNhUzdN?=
 =?utf-8?B?blI4VzhZSUM3RmRvdXMrenR5SlJTdzZPc2V3RERsSkp1cUVBZW44Y00rcitT?=
 =?utf-8?B?MFBnWkZIRDIyVE5MVlpxQUwvNUpIVnV0OXBLeUlWTVJBb1ZYN3UxQVBHdUxL?=
 =?utf-8?B?YkJSYWZENE9ydHFRZm5nbjI4SGJyS3VJVUJhYk1zUlNjd0pzSFpmbmNKbW80?=
 =?utf-8?B?TmZRT2ZPN25rYmx0bUNBeTZnUTZGNHdIR1E3dUZzWmxRLzc0SDQ2ZGdDVi9v?=
 =?utf-8?B?cnBKQUJhdzVWbFZUYzl4NmRHWWlmdXJDNDVpRFlYOGR6QlRrcTNYSnVXNkFV?=
 =?utf-8?B?aUtkSklkYWZleURXUFkzUjJ3c0NpYVAzajVtQTFmaDZwdGE2UzlWZ2k4VTh2?=
 =?utf-8?B?RUR5aTdGc2p3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cVgzeXJ2TWVER042ZldkbkhoYWkyZUQ3cmRoRVloNmU3cEZxMkpqZ2hkdlR3?=
 =?utf-8?B?M3ZxSlVmTDZMSDErQ252UU1BbitLMFpjTlV2SnVab0Vpdit5c1Ntd1ByL2tr?=
 =?utf-8?B?SEwyQzJQV1ZyUXZQbHBzcDBPMVFJampqS3REa21UNVdiT1RWL253akRrV1FW?=
 =?utf-8?B?Qkd6bXQxTk5XTU5WaUJ1WDFQQ1BVMXk4MEprQ3ZMYzJtWEhVU3FOdUd5YUhs?=
 =?utf-8?B?WWUrekd6aThtaEgwbm9EUW1EU0hjbXlmbVRzazJGTTNiNktYdnpCS0ZVSFZV?=
 =?utf-8?B?Z21CMzJmOWhRMFgzS0FyM2w2NDZYMkRHRENYbUhIR2tZeDBaYnVsMEJoSkhI?=
 =?utf-8?B?aHdJZVNNNDlzMSsvZ2VJNU0wM2JXYjVwdFRBOHh6dmFYNC93aW9SZXZMeVVO?=
 =?utf-8?B?cUx1eTVESys3RGhlNU5XTXNiNi8rUjVKZ2xNTlpnakpBUytFYlN2T2pNZ05J?=
 =?utf-8?B?YkZBTXFBbjRIRjJ3bTNNVTZsRzl5amx3TWIrd2hrVFBPZEF2S25CUVhzYUIv?=
 =?utf-8?B?cGVuYnVVYTc3YUdXWlhkUjQwaUwrOTlQMnA3U204NFBUY1BYdERBeDBsMFFM?=
 =?utf-8?B?aXk5MjdRSEN3Ny85V2xXUmFzN0kzYW83bUFodW01d081VEtHTnNjbUphbGZq?=
 =?utf-8?B?MkwrV0tURDlLZGFYc3NsQSt2MUFsS0dQTXQ2WXBtZ2t6bGZnWkx6a2JUeEpz?=
 =?utf-8?B?cE5UbXNHN2NkWHZJNnJEa203c3dmcEtackVhL24xSDdGdEtjWUZaRmttaUJv?=
 =?utf-8?B?a1NsdlY1b3lpZzhHSGg4d2s5cTRJMDRMd1hoSy9qbXV4N29KQ3BCOUNjeWl4?=
 =?utf-8?B?bWd2TDloUFBuaGNLcUx2REFQRFdEdm1FLzVGblV6R0czdXhTRkVhbEd3QU95?=
 =?utf-8?B?SGE5ZTJlTlZZaDFDQ0hlVWlBWDM2d0JEUDUrQW1tMnhpWlR2dG54QmRCbUVT?=
 =?utf-8?B?clVCWDUvTUZpZksxeHF2dDJlUmRoNWc1TWNSOEFmbVA3SVNLNjduUlQ4anJa?=
 =?utf-8?B?WEdTM1pwM25CdnN1V2hzdEFxQ1ovaUcxUlNoZ0YweDRSbk1OOVcrR1BzcFN5?=
 =?utf-8?B?clMwTWZwakVLN2tWZ2FFQVovV1EvVDZPUHJ0MXIwNVpTdEx6MDdPYm1vRDNo?=
 =?utf-8?B?SVhTS2RRSkVmWGovWGdnUGExcitBNnFvZUpneGZEczNLUi9XMlBZaEZ0cjYx?=
 =?utf-8?B?S1lkZldsai9IUGRKdThucEFnRVdlYWEwU3EyUlVlS003bGwxVUxNa0RWNW5V?=
 =?utf-8?B?NTk0S3IwZ295MlFSUmdiT3FPT1NJZFo1Wk9lYnNNamJNdlVpdldldDNPRHRI?=
 =?utf-8?B?cURpR1N6L0NkQTBDa2xqN0tYcmhCNTBwOHVWVlVReWhJTnh3RjkrT2Y2V3Zp?=
 =?utf-8?B?K3Nac0RnbUxMaEdzaGhZQTdCYm8rVFlnTGZhbE1vV2lkd1o4ZC9RVlpGcG1F?=
 =?utf-8?B?VXdUbEsyTGZvRmsrRnRETG1ENXhWOXZaYTZpM08zWEtnKzZYbFgyS0xGbUxM?=
 =?utf-8?B?dXN2RWJWVkIrRDNvMTN5UnpPRzZ6NGxHRUxtcFFVMWNuUGdYTnhMWGJ2MC9z?=
 =?utf-8?B?RnlmY0x3UDdkUXRwTkJUb3pPeUlOKzZiSHFha1FaT3RnSFkwdHV0Qk9YbkRt?=
 =?utf-8?B?S1RYVms0bHcwUTdoc2N4QzBtOHB3Q0Fpc0dkaDhmSHpHUkpJUllEWldRY0FW?=
 =?utf-8?B?RHpkVFM3SDhmblcvczBqdEJBQ05VTE9XRXVKVzBPK1QxL3hBK1BhUXNBa0o3?=
 =?utf-8?B?bURvZjh5TC9hQWdxUjltemU3RUhwYi9aMXEzd1hKcmU0YU1TNWxrdlVMM3BH?=
 =?utf-8?B?SnRYNTdRUGJCcG5Wa2p1bjNmOFM4NjlnRy8zcnAvMGl0MWZTVjd0TFJYU3B0?=
 =?utf-8?B?VlFQSllaN1BwSDJiWnVxRXpzUHJ4c1FZcEpuV0JQYVFpMTVRZ1hnUmUwZjRh?=
 =?utf-8?B?aG5DdDJWc09VRkFJRXhTYUtwcnMwR3hMQWJpWkpMNDFpMTJvNlFRUnFSYi8v?=
 =?utf-8?B?VzZVNW5jM21qTXk3MEhndWQ5YjErM0xZSktMUUZadXZwcklwTzBUT1R5bk5w?=
 =?utf-8?B?WG4wUm93c2RnTm5CNUt0Kzh6RFAwSXJEclhWdHZrZlc3MjZjYUlkQjVTclVm?=
 =?utf-8?B?dDV2ZTN3eHk1QTJ4UGN0d1A5OUlsZGF3N2VYcFdZU05mb21Qb3RzWXhwU0Ez?=
 =?utf-8?Q?GUnjawxpD+vxoLKy2vMDblE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0D7FDE3F5B3F0418068F23E98838B63@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114ddf18-f7b5-4838-fdae-08dde162b710
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 10:00:25.0533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fH3e+TeazMnDq8XQ4y5DexnvYeHrUuH5y72Wa7AH4cWPeZpX9HSOIL30S9cbdtkk3qdaWIt9sJACuHesmOtvQ+w4jjEouNrvWuXvj0yV11Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10619

SGkgVm9sb2R5bXlyLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY2xvc2UgcmV2aWV3Lg0KDQpPbiAy
MS4wOC4yNSAyMDoyNiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+IA0KPiBIaSBMZW9uaWQs
DQo+IA0KPiBMZW9uaWQgS29tYXJpYW5za3lpIDxMZW9uaWRfS29tYXJpYW5za3lpQGVwYW0uY29t
PiB3cml0ZXM6DQo+IA0KPj4gSW1wbGVtZW50ZWQgc3VwcG9ydCBmb3IgR0lDdjMuMSBleHRlbmRl
ZCBTUEkgcmVnaXN0ZXJzIGZvciB2R0lDdjMsDQo+PiBhbGxvd2luZyB0aGUgZW11bGF0aW9uIG9m
IGVTUEktc3BlY2lmaWMgYmVoYXZpb3IgZm9yIGd1ZXN0IGRvbWFpbnMuDQo+PiBUaGUgaW1wbGVt
ZW50YXRpb24gaW5jbHVkZXMgcmVhZCBhbmQgd3JpdGUgZW11bGF0aW9uIGZvciBlU1BJLXJlbGF0
ZWQNCj4+IHJlZ2lzdGVycyAoZS5nLiwgR0lDRF9JU0VOQUJMRVJuRSwgR0lDRF9JUk9VVEVSbkUs
IGFuZCBvdGhlcnMpLA0KPj4gZm9sbG93aW5nIGEgc2ltaWxhciBhcHByb2FjaCB0byB0aGUgaGFu
ZGxpbmcgb2YgcmVndWxhciBTUElzLg0KPj4NCj4+IFRoZSBlU1BJIHJlZ2lzdGVycywgcHJldmlv
dXNseSBsb2NhdGVkIGluIHJlc2VydmVkIGFkZHJlc3MgcmFuZ2VzLA0KPj4gYXJlIG5vdyBhZGp1
c3RlZCB0byBzdXBwb3J0IE1NSU8gcmVhZCBhbmQgd3JpdGUgb3BlcmF0aW9ucyBjb3JyZWN0bHkN
Cj4+IHdoZW4gQ09ORklHX0dJQ1YzX0VTUEkgaXMgZW5hYmxlZC4NCj4+DQo+PiBUaGUgYXZhaWxh
YmlsaXR5IG9mIGVTUElzIGFuZCB0aGUgbnVtYmVyIG9mIGVtdWxhdGVkIGV4dGVuZGVkIFNQSXMN
Cj4+IGZvciBndWVzdCBkb21haW5zIGlzIHJlcG9ydGVkIGJ5IHNldHRpbmcgdGhlIGFwcHJvcHJp
YXRlIGJpdHMgaW4gdGhlDQo+PiBHSUNEX1RZUEVSIHJlZ2lzdGVyLCBiYXNlZCBvbiB0aGUgbnVt
YmVyIG9mIGVTUElzIHJlcXVlc3RlZCBieSB0aGUNCj4+IGRvbWFpbiBhbmQgc3VwcG9ydGVkIGJ5
IHRoZSBoYXJkd2FyZS4gSW4gY2FzZXMgd2hlcmUgdGhlIGNvbmZpZ3VyYXRpb24NCj4+IG9wdGlv
biBpcyBkaXNhYmxlZCwgdGhlIGhhcmR3YXJlIGRvZXMgbm90IHN1cHBvcnQgZVNQSXMsIG9yIHRo
ZSBkb21haW4NCj4+IGRvZXMgbm90IHJlcXVlc3Qgc3VjaCBpbnRlcnJ1cHRzLCB0aGUgZnVuY3Rp
b25hbGl0eSByZW1haW5zIHVuY2hhbmdlZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMZW9uaWQg
S29tYXJpYW5za3lpIDxsZW9uaWRfa29tYXJpYW5za3lpQGVwYW0uY29tPg0KPj4NCj4+IC0tLQ0K
Pj4gQ2hhbmdlcyBpbiBWMjoNCj4+IC0gYWRkIG1pc3NpbmcgcmFuayBpbmRleCBjb252ZXJzaW9u
IGZvciBwZW5kaW5nIGFuZCBpbmZsaWdodCBpcnFzDQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gvYXJt
L3ZnaWMtdjMuYyB8IDI0OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMjQ1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMgYi94ZW4vYXJjaC9h
cm0vdmdpYy12My5jDQo+PiBpbmRleCA0MzY5YzU1MTc3Li4xY2FjYmI2ZTQzIDEwMDY0NA0KPj4g
LS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMtdjMuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3ZnaWMt
djMuYw0KPj4gQEAgLTExMSw3ICsxMTEsNyBAQCBzdGF0aWMgdWludDY0X3QgdmdpY19mZXRjaF9p
cm91dGVyKHN0cnVjdCB2Z2ljX2lycV9yYW5rICpyYW5rLA0KPj4gICAgKiBOb3RlIHRoZSBvZmZz
ZXQgd2lsbCBiZSBhbGlnbmVkIHRvIHRoZSBhcHByb3ByaWF0ZSBib3VuZGFyeS4NCj4+ICAgICov
DQo+PiAgIHN0YXRpYyB2b2lkIHZnaWNfc3RvcmVfaXJvdXRlcihzdHJ1Y3QgZG9tYWluICpkLCBz
dHJ1Y3QgdmdpY19pcnFfcmFuayAqcmFuaywNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IG9mZnNldCwgdWludDY0X3QgaXJvdXRlcikNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9mZnNldCwgdWludDY0X3QgaXJv
dXRlciwgYm9vbCBlc3BpKQ0KPiANCj4gSSBhbSB3b25kZXJpbmc6IG1heWJlIGl0IGlzIGJldHRl
ciB0byBwYXNzIHZpcnEgaW5zdGVhZCBvZiBvZmZzZXQgaW50bw0KPiB0aGlzIGZ1bmN0aW9uPyBJ
biB0aGF0IGNhc2UgeW91IGNhbiBnZXQgcmlkIG9mIGVzcGkgcGFyYW1ldGVyLg0KPiANClllcywg
aXQgbWFrZXMgc2Vuc2UsIGJlY2F1c2UgaW4gYW55IGNhc2Ugd2UgcmVjYWxjdWxhdGUgdGhlIG9m
ZnNldCANCmxhdGVyLCBhZnRlciBnZXR0aW5nIHRoZSB2aXJxOg0KID4gICAgLyogR2V0IHRoZSBp
bmRleCBpbiB0aGUgcmFuayAqLw0KID4gICAgb2Zmc2V0ID0gdmlycSAmIElOVEVSUlVQVF9SQU5L
X01BU0s7DQoNCkFuZCBhcyBhIGJvbnVzLCBJIGNhbiBnZXQgcmlkIG9mIHRoZSBlc3BpIHBhcmFt
ZXRlci4gSG93ZXZlciwgaXQgDQpyZXF1aXJlcyB0aGUgY2FsbGVyIHRvIGNhbGN1bGF0ZSB0aGUg
dmlycSBieSBpdHNlbGYuDQpJZiBhcHBsaWNhYmxlLCBJIGNhbiBhZGQgb25lIG1vcmUgcHJlcGFy
YXRpb24gcGF0Y2ggaW4gVjMgYmVmb3JlIA0KYWN0dWFsbHkgaW1wbGVtZW50aW5nIGVTUEkgd2l0
aCBzdWNoIGNoYW5nZXMuIFdvdWxkIHRoYXQgYmUgYmV0dGVyPw0KDQo+PiAgIHsNCj4+ICAgICAg
IHN0cnVjdCB2Y3B1ICpuZXdfdmNwdSwgKm9sZF92Y3B1Ow0KPj4gICAgICAgdW5zaWduZWQgaW50
IHZpcnE7DQo+PiBAQCAtMTIzLDcgKzEyMyw4IEBAIHN0YXRpYyB2b2lkIHZnaWNfc3RvcmVfaXJv
dXRlcihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgdmdpY19pcnFfcmFuayAqcmFuaywNCj4+ICAg
ICAgICAqIFRoZSBJUk9VVEVSMC0zMSwgdXNlZCBmb3IgU0dJcy9QUElzLCBhcmUgcmVzZXJ2ZWQg
YW5kIHNob3VsZA0KPj4gICAgICAgICogbmV2ZXIgY2FsbCB0aGlzIGZ1bmN0aW9uLg0KPj4gICAg
ICAgICovDQo+PiAtICAgIEFTU0VSVCh2aXJxID49IDMyKTsNCj4+ICsgICAgaWYgKCAhZXNwaSAp
DQo+PiArICAgICAgICBBU1NFUlQodmlycSA+PSAzMik7DQo+IA0KPiBiZXR0ZXIgdG8gd3JpdGUN
Cj4gQVNTRVJUICghZXNwaSAmICh2aXJxPj0zMikpDQo+IA0KSSBhZ3JlZSB3aXRoIHRoYXQsIGl0
IGxvb2tzIG11Y2ggYmV0dGVyLiBJIHdpbGwgY2hhbmdlIGl0IGluIFYzIG9yIGRyb3AgDQphdCBh
bGwgaWYgaXQgd291bGQgYmUgb2theSB0byB1c2UgdmlycSBhcyBhIHBhcmFtZXRlci4NCg0KPiBh
bmQgcHJvYmFibHkgeW91IG5lZWQgc3ltbWV0cmljYWwgQVNTRVJUIGZvciBlc3BpID09IHRydWUN
ClRoaXMgaXMgbm90IG5lZWRlZCBmb3IgZVNQSSBiZWNhdXNlLCB1bmxpa2UgcmVndWxhciBTUElz
IHRoYXQgaGF2ZSANCmluZGV4ZXMgc3RhcnRpbmcgZnJvbSAzMiwgZVNQSSBJTlRJRHMgc3RhcnQg
ZnJvbSA0MDk2IGFuZCBjb3ZlciBhbGwgMTAyNCANCklSUSBsaW5lcy4NCg0KPiANCj4+ICAgICAg
IC8qIEdldCB0aGUgaW5kZXggaW4gdGhlIHJhbmsgKi8NCj4+ICAgICAgIG9mZnNldCA9IHZpcnEg
JiBJTlRFUlJVUFRfUkFOS19NQVNLOw0KPj4gQEAgLTE0Niw2ICsxNDcsMTEgQEAgc3RhdGljIHZv
aWQgdmdpY19zdG9yZV9pcm91dGVyKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Z2ljX2lycV9y
YW5rICpyYW5rLA0KPj4gICAgICAgLyogT25seSBtaWdyYXRlIHRoZSBJUlEgaWYgdGhlIHRhcmdl
dCB2Q1BVIGhhcyBjaGFuZ2VkICovDQo+PiAgICAgICBpZiAoIG5ld192Y3B1ICE9IG9sZF92Y3B1
ICkNCj4+ICAgICAgIHsNCj4+ICsjaWZkZWYgQ09ORklHX0dJQ1YzX0VTUEkNCj4+ICsgICAgICAg
IC8qIENvbnZlcnQgdmlycSBpbmRleCB0byBlU1BJIHJhbmdlICovDQo+PiArICAgICAgICBpZiAo
IGVzcGkgKQ0KPj4gKyAgICAgICAgICAgIHZpcnEgPSBFU1BJX0lEWDJJTlRJRCh2aXJxKTsNCj4+
ICsjZW5kaWYNCj4gDQo+IElmIHlvdSBkZWZpbmUgRVNQSV9JRFgySU5USUQoKSB1bmNvZGl0aW9u
YWxseSwgeW91IGNhbiBnZXQgcmlkIG9mICNpZmRlZg0KPiBDT05GSUdfR0lDVjNfRVNQSSBoZXJl
DQo+DQpBY3R1YWxseSwgRVNQSV9JRFgySU5USUQgaXMgZGVmaW5lZCB1bmRlciBpZmRlZiBjb25k
aXRpb246DQoNCiA+ICNpZmRlZiBDT05GSUdfR0lDVjNfRVNQSQ0KID4gI2RlZmluZSBFU1BJX0JB
U0VfSU5USUQgNDA5Ng0KID4gI2RlZmluZSBFU1BJX01BWF9JTlRJRCAgNTExOQ0KDQogPiAjZGVm
aW5lIEVTUElfSU5USUQySURYKGludGlkKSAoKGludGlkKSAtIEVTUElfQkFTRV9JTlRJRCkNCiA+
ICNkZWZpbmUgRVNQSV9JRFgySU5USUQoaWR4KSAgICgoaWR4KSArIEVTUElfQkFTRV9JTlRJRCkN
CiA+ICNlbmRpZg0KDQpTbyBpdCBzaG91bGQgYmUgdXNlZCB1bmRlciBDT05GSUdfR0lDVjNfRVNQ
SSwgbGlrZSBpbiBvdGhlciBwbGFjZXMuDQoNCj4+ICAgICAgICAgICBpZiAoIHZnaWNfbWlncmF0
ZV9pcnEob2xkX3ZjcHUsIG5ld192Y3B1LCB2aXJxKSApDQo+PiAgICAgICAgICAgICAgIHdyaXRl
X2F0b21pYygmcmFuay0+dmNwdVtvZmZzZXRdLCBuZXdfdmNwdS0+dmNwdV9pZCk7DQo+PiAgICAg
ICB9DQo+PiBAQCAtNjg1LDYgKzY5MSw5IEBAIHN0YXRpYyBpbnQgX192Z2ljX3YzX2Rpc3RyX2Nv
bW1vbl9tbWlvX3JlYWQoY29uc3QgY2hhciAqbmFtZSwgc3RydWN0IHZjcHUgKnYsDQo+PiAgICAg
ICB7DQo+PiAgICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUdST1VQUiwgR0lDRF9JR1JPVVBSTik6
DQo+PiAgICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUdSUE1PRFIsIEdJQ0RfSUdSUE1PRFJOKToN
Cj4+ICsjaWZkZWYgQ09ORklHX0dJQ1YzX0VTUEkNCj4gDQo+IERvIHlvdSByZWFsbHkgbmVlZCBp
ZmRlZiBoZXJlPw0KPiANCg0KT2gsIHllcywgdGhpcyBpZmRlZiBpcyByZWR1bmRhbnQgYmVjYXVz
ZSwgd2l0aG91dCBDT05GSUdfR0lDVjNfRVNQSSANCmVuYWJsZWQsIHdlIGNhbm5vdCByZWFjaCB0
aGlzIGZ1bmN0aW9uIHdpdGggZVNQSS1zcGVjaWZpYyBvZmZzZXRzIGZyb20gDQp0aGUgY2FsbGVy
Lg0KU28sIHllcywgSSB3aWxsIHJlbW92ZSB0aGlzIGlmZGVmIGluIFYzLg0KPj4gKyAgICBjYXNl
IFZSQU5HRTMyKEdJQ0RfSUdST1VQUm5FLCBHSUNEX0lHUk9VUFJuRU4pOg0KPj4gKyNlbmRpZg0K
PiANCj4gDQo+PiAgICAgICAgICAgLyogV2UgZG8gbm90IGltcGxlbWVudCBzZWN1cml0eSBleHRl
bnNpb25zIGZvciBndWVzdHMsIHJlYWQgemVybyAqLw0KPj4gICAgICAgICAgIGlmICggZGFidC5z
aXplICE9IERBQlRfV09SRCApIGdvdG8gYmFkX3dpZHRoOw0KPj4gICAgICAgICAgIGdvdG8gcmVh
ZF9hc196ZXJvOw0KPj4gQEAgLTcxMCwxMSArNzE5LDE5IEBAIHN0YXRpYyBpbnQgX192Z2ljX3Yz
X2Rpc3RyX2NvbW1vbl9tbWlvX3JlYWQoY29uc3QgY2hhciAqbmFtZSwgc3RydWN0IHZjcHUgKnYs
DQo+PiAgICAgICAvKiBSZWFkIHRoZSBwZW5kaW5nIHN0YXR1cyBvZiBhbiBJUlEgdmlhIEdJQ0Qv
R0lDUiBpcyBub3Qgc3VwcG9ydGVkICovDQo+PiAgICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVNQ
RU5EUiwgR0lDRF9JU1BFTkRSTik6DQo+PiAgICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSUNQRU5E
UiwgR0lDRF9JQ1BFTkRSTik6DQo+PiArI2lmZGVmIENPTkZJR19HSUNWM19FU1BJDQo+IA0KPiBT
YW1lIGFzIGhlcmUNCg0KSSB3aWxsIHJlbW92ZSBpdCBpbiBWMy4NCj4gDQo+PiArICAgIGNhc2Ug
VlJBTkdFMzIoR0lDRF9JU1BFTkRSbkUsIEdJQ0RfSVNQRU5EUm5FTik6DQo+PiArICAgIGNhc2Ug
VlJBTkdFMzIoR0lDRF9JQ1BFTkRSbkUsIEdJQ0RfSUNQRU5EUm5FTik6DQo+PiArI2VuZGlmDQo+
PiAgICAgICAgICAgZ290byByZWFkX2FzX3plcm87DQo+PiAgIA0KPj4gICAgICAgLyogUmVhZCB0
aGUgYWN0aXZlIHN0YXR1cyBvZiBhbiBJUlEgdmlhIEdJQ0QvR0lDUiBpcyBub3Qgc3VwcG9ydGVk
ICovDQo+PiAgICAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVNBQ1RJVkVSLCBHSUNEX0lTQUNUSVZF
Uk4pOg0KPj4gICAgICAgY2FzZSBWUkFOR0UzMihHSUNEX0lDQUNUSVZFUiwgR0lDRF9JQ0FDVElW
RVJOKToNCj4+ICsjaWZkZWYgQ09ORklHX0dJQ1YzX0VTUEkNCj4gDQo+IC4uLiBhbmQgaGVyZSBh
bmQgaW4gYWxsIG90aGVyIHBsYWNlcw0KPiANCg0KVGhhbmsgeW91LCB0aGF0J3MgYSByZWFsbHkg
Z29vZCBwb2ludC4gSSB3aWxsIHJldmlzZSBhbGwgdGhlIHBsYWNlcyB3aXRoIA0KaWZkZWZzIGlu
IHRoaXMgcGF0Y2ggYW5kIGZpeCB0aGVtIGluIFYzLg0KDQpCZXN0IHJlZ2FyZHMsDQpMZW9uaWQN
Cg==

