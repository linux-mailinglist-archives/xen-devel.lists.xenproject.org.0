Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113DCC4FAC4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 21:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159342.1487702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIugn-00071o-Ar; Tue, 11 Nov 2025 20:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159342.1487702; Tue, 11 Nov 2025 20:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIugn-0006xs-88; Tue, 11 Nov 2025 20:10:05 +0000
Received: by outflank-mailman (input) for mailman id 1159342;
 Tue, 11 Nov 2025 20:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIugl-0006ga-UT
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 20:10:03 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 686292d3-bf3a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 21:10:03 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AM9PR03MB7758.eurprd03.prod.outlook.com
 (2603:10a6:20b:3dc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 20:09:59 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 20:09:59 +0000
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
X-Inumbo-ID: 686292d3-bf3a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKx1Hf/PxqC5nvxnCXGRlpRXz0QONd/AFIupcLKW7Y1wVGrzVD63BHK91GQbrFSN4GqakOPJGdFLJMlhx1khpaz0nvn3U6aN6VIhaRQtmtpomID94bxSkn14OsS1RzmJtr1ngTzsrQZW9g+kzwjYQu/dWCakKKUezzQUF1xYnccdTgO/XXCfkqXtlBBpVdh83c1Xi4TTJ/eKcCX5tVpbvKhOW6w8WBO38NA6m/jLnTVnjqxF+1K39S8K7LECPVnExKofgxzLZwE4W/BhQL+mystOZVnBgmagR770tTSnfKlQL42T0nZvrbnNkvW9Icn391ASPi8tAjl5duWIEi4ucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avySyVoUNnEQXlDAooPk+JX3+HVzZzILNmAQk4gwOnc=;
 b=N5gesflvMk6vxvrNNZ1nQGSM0QOjSc5fN4caK6WRvQhdaEwhL+aoHlU1AL8U2XdQd66XrXIMk7/1065FmvSoUMOiq2fuhUwvjKkTb5cOsv70QeVcIWNNiCthZtKaFydXVETT913K8B6c/aYTQF+uRbssKYK6/Vo9fqbe5sDIdhQfQhkn0SsUIRXzT7lo+gyuG0F9tMjvuvmm5OncjZ4r7oZkYlmLx3M22G8kLFBRn+8wTqZI2IVTQvsjZychnVkRJyYiMkIBndDsHVKKQyRWV5UQE+cqm2emens34W1pUbgOwRLq0XrtAAnsQR/FZK9lk1REocsKvh3wv3wiYTywbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avySyVoUNnEQXlDAooPk+JX3+HVzZzILNmAQk4gwOnc=;
 b=PwBfP7awMogWTOPY3bkQwHzvLW1oEFeyrTmBWpOaETvtWlXUnwcE7SmX1bnwP5La7Tlg0A42b9bQEIvqmi3D/wr5ZyU6opAM/bgtQIyoIqlFhjVgI+qSkvu9+FgIgbts8WA8fLFPrqSwUDyuOIJfFQqz8zHAI69UKaRZjycVxsod8TMGriGOGIrLmf82U4cM1E1pTHRWOetVeaixo7elXlS6S/tNT+Fe0VGvkeewYD3gaBpq18srFnU10VW9EQcGW0MG6QaD+Ksm9kCLHs+1CvB4AGBbccyr6eqjjilmGFs9GT03NCv/apFfvi9IPG5tAok/l8ww5GkpRBGunmSRIw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Tim Deegan
	<tim@xen.org>, Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [RESEND PATCH v2 0/3] x86/hvm: vmx: refactor cache disable mode code
Thread-Topic: [RESEND PATCH v2 0/3] x86/hvm: vmx: refactor cache disable mode
 code
Thread-Index: AQHcU0co4QnguYI6BEq1l/TCR7Zibg==
Date: Tue, 11 Nov 2025 20:09:59 +0000
Message-ID: <20251111200958.3576341-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AM9PR03MB7758:EE_
x-ms-office365-filtering-correlation-id: 04a338fb-0a39-4438-1275-08de215e4a9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oKTYyGKVAaniklo7kLZPkdYTv/HkOAXzFuJL6rtFbt+Nqc/xU/UZu9ysWM?=
 =?iso-8859-1?Q?CiDGtbbDNaiwFJWN3VfED/axzs8y7kNq9DilHI8A43K84E7MncjUjjXJw5?=
 =?iso-8859-1?Q?aU2ZEpY51aRxxe2aQ2sPR4bfbihWSJD279+rkWNyzsW9uhP2RA8R/kBm0D?=
 =?iso-8859-1?Q?0N99UEJzwp3SN5aAogF2zlGCXhfbMxQeby7E73gJ+U2BLGnB+c+0ZCrA9A?=
 =?iso-8859-1?Q?hCIMVcO1eaIAZKlhDa3Hb3US9pIdOa1ICNfRdbA0oxNlwr2I78UQ08wmM+?=
 =?iso-8859-1?Q?ml8ReyITZuQULP648aIJ6Z4duexZ1lGEO1aFM6CsR3hBiH/LKX0GL4WRRv?=
 =?iso-8859-1?Q?+7W20V1j+5mDFn9nUNH0t9rg7RSwVzw1fGdG5S4uexwcAQXe1LhbE7ftRW?=
 =?iso-8859-1?Q?in1niuxpdo6DX9PmTCyYsVrKdlEBNUfwPo7Z4iGsQlnAYF+EPEGeENx3XZ?=
 =?iso-8859-1?Q?yax87HyfrHQKzOMn4ymaYOBAYUTifNd3afBXNp0Lu8viCAUramPB8D5VP9?=
 =?iso-8859-1?Q?ITS9xZvCqt56XZJfAFPdeOdtbPZFuy+vKgsrzjNc+5nShxn1oKwOBtPoFN?=
 =?iso-8859-1?Q?UpvZafBqn98nodUS7F/EXFabsAcbxkj3OiovcF82MZZTK5uOQ5CydfzarO?=
 =?iso-8859-1?Q?4dr+Vv1xFvCqLiY5MGOVNERyPHxi9n8NZ20mA3HJu29mAB2jUvTK4iQdoS?=
 =?iso-8859-1?Q?lJiOH6iC/etKnvqJctYlJzCx1vazmIFNm43OK3qB9ASdTBcwufMjZWKy9y?=
 =?iso-8859-1?Q?E5oRxgAMwxbbusz0cd27WbSe8zV1b9TBMMp000Qb2xmC7q0BZBgftnuWmI?=
 =?iso-8859-1?Q?lI+JwpQDOgVXGy74ixGPVLYHnBtIHpURKCrdBXQ5/tbfwaHL03xXt0mWLw?=
 =?iso-8859-1?Q?bI1tg2ckBuxqN3jdZZMSrRHioGyI8IZKv+eYlNuTPiStyvTTfirHwN3wxs?=
 =?iso-8859-1?Q?pGP6qJT+UIvjoq6lJvlQOK6m3XTPP4XZ1ls+q9rP3gcGPiK8DcNOOiNiSz?=
 =?iso-8859-1?Q?YJgZS3T/NRReGByFpmcb6opgUbog4MU/Uv+cCntNR0et5cv+rAH6TiRObn?=
 =?iso-8859-1?Q?ZtznLXrg++WaYjQthSUnUpb5CYdbuLNlgRg2NQbeFNhG6qqMFPg4NZSxxa?=
 =?iso-8859-1?Q?NCjDXksN2bkXagdhMgs384TtgGPXEWQuNfWQTLvqtiwxBjXNJ9IFKiI5+N?=
 =?iso-8859-1?Q?X6+SYTPdQ34gYxGIc67YSdmkzc3SIN+KaZffHLTfxDxj34kj5AJb8ycmLp?=
 =?iso-8859-1?Q?Wmlh52qxBfh2VR7froTvMoydafm8p+5yR/X/u55SNQiuJxZdHDLmqA5UGr?=
 =?iso-8859-1?Q?cWFnGVCPggqjncZxrW3Cq+dpwSVdHhDUPD9Ndj8HEoIPfghLsqF9Yjok2Z?=
 =?iso-8859-1?Q?3KGkfLHZsQdsI8uGxdNiZKivctxDFAa6HZyfaT6FNGLxl5yjY+P6gDMhfv?=
 =?iso-8859-1?Q?RQJ8D1/SjLKK6OY7I+B0NVW9xDKWx6b3uiyfvoJdudQeTQc1KosrSRBhjb?=
 =?iso-8859-1?Q?vkUHB/et/sMu4vqgZ3UHOPSVnxj/kkDcrqkW/HcYUPVk86VBjkN0XgHiog?=
 =?iso-8859-1?Q?Z7pYODrOOtM4+t3J0fUe3TDViy/O?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/GTuhB83NfIZX4aA43fpCiGb1ZJ1teBRpyodUez0RHI9SPhOpWKaLSDnCB?=
 =?iso-8859-1?Q?iQLZwvELSVhqCkt5pM7AY8icPY3N+Bb5xW0uUejta+5lwBsfsaZoa0rGA/?=
 =?iso-8859-1?Q?CASsgyefZLlT9JjZsav97NQi081NV9yC0O2MllxkhubsuJm2x4Ub60naOb?=
 =?iso-8859-1?Q?Ymjw2Db+CjRBaq2BcPedNqeMDSc8mv6PiN7PA4OLRJk2vDAZy2pSKCYDTc?=
 =?iso-8859-1?Q?gk0sk9gIJ+Vu+FrJSKwrzuQj5r0iUh5UZVEgZ/J1PsgwbCzTn/j/asSXAj?=
 =?iso-8859-1?Q?RjCesfWCZqpJGOEDfRYeL8BXDtvM50alSquHdKY6Tq/H9cWP09YnZhXU2N?=
 =?iso-8859-1?Q?UoKVi4sEEJWzKAHLn5V7OTE+XUXFdPsY9u8S7p4wFd5xySe0aFaRoWGq+s?=
 =?iso-8859-1?Q?BdKWUXH8eMzh0DkIpW7brp/J7h7A44QNmYO5ETjIcKaOXfeGMtiPwj6kVw?=
 =?iso-8859-1?Q?BPS6EMIvzAxRbXUdS989OUbice3Kr3Y19eWkZ5Js3T52L+M46Q0JN4uXMq?=
 =?iso-8859-1?Q?9LKcbPdnw7tWvDX1escp8sL/FCM2Miw4yadCXuVNkHwQtS0PO1ijnY2K58?=
 =?iso-8859-1?Q?fmwiMaPgkqhtM3vqcwltEdATBttYx5TY0DS+JOZyNWGL+eYUdeh0NOOl4u?=
 =?iso-8859-1?Q?CRrh/WYpSGXPQuMu13VWIl9wvSgFSq0ymjK/2v/ebfvagLxIl3yKqvBye6?=
 =?iso-8859-1?Q?JWnhAgbEcAifZx7PdMjcE4DTHZW1ATZVry6j7FT3SEtwZWHfvQqk921Ltp?=
 =?iso-8859-1?Q?0pb+sqo1VroXzNPw6a8trLPswbuTfkkGcyVSscuAk0t4n2gdAaFNg4ZX3e?=
 =?iso-8859-1?Q?9qx6UNCQ8OhxFSj/MAuhw67I2w9ydC2S1M1NGleYncayHIDeY5aIg7giYn?=
 =?iso-8859-1?Q?Ij5dMHAJz8XCUO9JZLqBrxf+iYNHW5oFSq3XyZr5bFdo2+4xhHT091xX+E?=
 =?iso-8859-1?Q?pUxLcdWcG+3Nw8pS5tb/7PAQ1M4S3FJi7ELbMlfZTXxXakbXPxGX5jjFic?=
 =?iso-8859-1?Q?YSiBBJYNpCA1RRpXU0x+MPREIKo6Evg1C1G0OC12j/NqckTdweo6S8Afs/?=
 =?iso-8859-1?Q?vO85lVWPa6LuHusF+rPkdGUii9kKqQKK1Po9ETQFaf3QX3vZ8FeO03bte7?=
 =?iso-8859-1?Q?lWSYtSYvwpgk8fguYLf+DSWVMRpUSP8I6rLnwEzmxIwU2xCV/8VcVwgYT9?=
 =?iso-8859-1?Q?plGcO8urvo8G1ocsKXRu/Py1jaLmW5eRefgDW76QzjWD+O7zPI+p9XsXOr?=
 =?iso-8859-1?Q?MSTWrQqsXPHQbQbkEhx/DNQJDIPvGnOsrpPRREr3c4SheP8sFxpJ44G7RI?=
 =?iso-8859-1?Q?aqYPnKJbmNks3eVqfguS2dykmqfVEEWdVDqjfF2pxIJ0lH6OUykds2KPHh?=
 =?iso-8859-1?Q?9SLJusnqDgVBH4CGv8FrzPC6xMjWAEt5d06RahZFjfenAJdogiuFODvwkI?=
 =?iso-8859-1?Q?LkrnV3iQg8IuhOfG3H2f+E3sZEc+PeVMToKaFng5xPyoEPxVfSyzGoEn/r?=
 =?iso-8859-1?Q?xWUAeMgV+bsuOcm2qybdgcxc3mptg6NlvLkd+xQK5oZ85CqYEvEvbmdPw7?=
 =?iso-8859-1?Q?10/AAJgfwMr+x91spP0UR55LkOjA3NK7CV2gafhOl1Uiz74laEOpWgbh5B?=
 =?iso-8859-1?Q?zYdSF14D3gv7Xp9M+YPvgHYjiMXCwv521VgotBZoiYROkJetYmz3eKQw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a338fb-0a39-4438-1275-08de215e4a9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 20:09:59.5267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: odmjKHajuqlvjwLr4qssNvObhcSx+YklTdKm180I/xPf9PfdYtGANRCCYCE5lIyDyfkNA5vMFIJBa3j+ZaCODZxaASCkpGcYbXqf1gVmV7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7758

From: Grygorii Strashko <grygorii_strashko@epam.com>

The cache disable mode code (hvm_shadow_handle_cd()) is relevant only for I=
ntel VT-x (VMX),
hence:
- move hvm_shadow_handle_cd()/ hvm_set_uc_mode()/domain_exit_uc_mode() in V=
MX code
- account for SHADOW_PAGING when use hvm_shadow_handle_cd()
- move cache disable mode data into VMX specific structures

Based on discussion [1].

[1] https://patchwork.kernel.org/project/xen-devel/patch/20251023151903.560=
947-1-grygorii_strashko@epam.com/

v1: https://patchwork.kernel.org/project/xen-devel/cover/20251029235448.602=
380-1-grygorii_strashko@epam.com/

Grygorii Strashko (3):
  x86/hvm: move hvm_shadow_handle_cd() to vmx code
  x86/hvm: vmx: account for SHADOW_PAGING when use
    hvm_shadow_handle_cd()
  x86/hvm: vmx: refactor cache disable mode data

 xen/arch/x86/hvm/hvm.c                  | 59 --------------------
 xen/arch/x86/hvm/vmx/vmx.c              | 73 +++++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/domain.h   |  6 --
 xen/arch/x86/include/asm/hvm/hvm.h      |  3 +
 xen/arch/x86/include/asm/hvm/support.h  |  2 -
 xen/arch/x86/include/asm/hvm/vcpu.h     |  3 -
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 13 +++++
 xen/arch/x86/include/asm/mtrr.h         |  3 -
 xen/arch/x86/mm/shadow/multi.c          |  2 +-
 9 files changed, 85 insertions(+), 79 deletions(-)

--=20
2.34.1

