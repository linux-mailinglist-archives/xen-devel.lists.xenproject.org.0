Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E4BC70D13
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 20:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166402.1492958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnto-0005C4-S7; Wed, 19 Nov 2025 19:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166402.1492958; Wed, 19 Nov 2025 19:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnto-00059Z-Oj; Wed, 19 Nov 2025 19:31:28 +0000
Received: by outflank-mailman (input) for mailman id 1166402;
 Wed, 19 Nov 2025 19:31:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GacY=53=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLntn-00059P-7I
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 19:31:27 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55af4c74-c57e-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 20:31:24 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB9PR03MB7690.eurprd03.prod.outlook.com (2603:10a6:10:2c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:31:21 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:31:21 +0000
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
X-Inumbo-ID: 55af4c74-c57e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcTL/H4tqSAOuK68UUbgqolyoI5ghnRjnx4CDSQfcLnjfVzooyWGSKPpQoH6Ew1a26OZNM1bUGSTzktqf4dYO5Y6/NN41emcnHrmfFVlyZM6Q+xRJG9VCPVQLwp+CM5flTn0DLuzm9fyKZlKCWBcQMbqCx9RBG10Wdc6wxy1T0L20Oy/zljQr4p7P/Gw2Cj3RzdgVo2o2pVfR2S6Qat0slb1EsE+Za9LG5hQhoebOzSuaG1LcNXScHf+bvfU7lrjzkqDu3cRMpc6Qg73lwJBLWd0nNL3AJavJDH88Lgye0uxdl0UWhujTfctkvQdid46fgPYdJZmDZn1hOon6iWQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwsg/Sw8se4wwGO2HVFNrhq5TqZvVjljEI8uKGyiDeY=;
 b=UuTjR+vcbsag2t5bs+Ll/dHb0P9VTLkh5m/ZbtLAjaWyOYpLhBM2XKZi/nAtaZDAW8fFbvPi20Vc/2YhvMId4PGoM2pLiJrKga3vU4UIyOMeh/sOaO2WaIB6lZMb4CyjdsjhJKhWYJ6id17WnhVczwAk7uvpfS/D2ivZ1feZ/b0h09h+KM0vhFDeP4tAiHpHqjQskNASPwK5iwf4xYrv4LnBi1pclqwsT6ycGrXT0YSjhzp5F5HlOaRyEBgU6PWBgPcUk2qjuAiFuu+StlAB1BVoVrTYcBeVPmOkOZaJLuD91bN8EGluWBSuQblSz4RlnE3ln4zNzEp51UVIwtKrFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwsg/Sw8se4wwGO2HVFNrhq5TqZvVjljEI8uKGyiDeY=;
 b=JER7r2GwKmEeJ19CH1ugWTlnCsFgZ2bpQMsumP5yv7dp21LmKr/09rzEdaalzViM9nUkMm4qFQ8rapo9puYBrRDU4otVMFVb+cTwELOA3VLIjEe1yiHeM4q6vU5jFDo4WWV/AFkFq9wmSaS5jzQwVMq1abDNX+vy03eJMERdaTC8DUy/CTZ9/9ZGyCwgTHgiVuQbsheH6hFwG5Xg69XozdI0tPneyfaHbEFUtqk55BREvnYA3KcQhsnNqK+/I1uAjTgfiIcSX+YXotEBMxtNhTfI2EaesG5jIAx/jjA710+vYXPpJJ/ZY3SwLPXErgwI1J5R98FSAruo5brPNNkheA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Tamas K
 Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>, Teddy Astie
	<teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>
Subject: [XEN][PATCH v4] xen: make VMTRACE support optional
Thread-Topic: [XEN][PATCH v4] xen: make VMTRACE support optional
Thread-Index: AQHcWYsVwkzlU6tg9E6YV8TOMrknlQ==
Date: Wed, 19 Nov 2025 19:31:20 +0000
Message-ID: <20251119193120.1011448-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|DB9PR03MB7690:EE_
x-ms-office365-filtering-correlation-id: c0654e2d-39dd-4d16-97d0-08de27a23802
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UzRtx75v68OcRkzPFAdaJNv/T3LsAeCn9RUsp0gpPaAqib+et7f55PmkOQ?=
 =?iso-8859-1?Q?rWM/Z1KW3TTxjfBzeiIOhqL6Up5jemoU2t3xfQ3bAKjAuyo5Ck/9uJk78N?=
 =?iso-8859-1?Q?vrsDszI4ukVMFBsZ2sGB2vHQ8Qs6cJsqCJ7/LdNQPKehRDa05xkPr8KbU9?=
 =?iso-8859-1?Q?b5hYBy5cb1uB/UNMpwHdWEAxkJESW79aSqYRJUu8FX4D9PN2KqjPteib4X?=
 =?iso-8859-1?Q?QxzZVO60afI9+JSPSBQp6XB0JTwVjmu9XBSs4AfT7vx7jkbaSqL9VL+YkO?=
 =?iso-8859-1?Q?syqvSJJid3t1lolfA6AyDpEWNxt3aythbHfH4LwHHFK9H66LIdN4dTyvLu?=
 =?iso-8859-1?Q?RPOsRwOaSTBf51eQohF52RN2moQ06tlKmjWjNqxsCfyske/RJkcTJueRur?=
 =?iso-8859-1?Q?NL3b+if64dXH6wvsg6CgRc7sFmi/5F5cKkReluhlo1WgQjKEnabeFkSjbk?=
 =?iso-8859-1?Q?Kyg26ni5f5N/VsIOSOq2F12Qu/WoLf9qylLcGQPLwJrOxCYDR7q1KyZZX+?=
 =?iso-8859-1?Q?6t1Auk4gJXDGWifT6MDvTfSQ3Tmdqy1GEFA6Y2AKj8VZZBcYg70o0oheQl?=
 =?iso-8859-1?Q?qhxAdMiKURKHfN4AttKjpYh+8K8LEAU/2UmlsPc4GSyZKHO/qFV4NGIhfS?=
 =?iso-8859-1?Q?DluoOJeQV0rLSlHbt7+wy15axWmZjn0QkrtdnrSLKZnBK99obByBJJx6rg?=
 =?iso-8859-1?Q?VOyI+uAhLQr7vrmHhanrOk9+hG81smQDxM3smoBU8re8nQaer26pTFKQqM?=
 =?iso-8859-1?Q?vB0brpBeXLxSCgts+9i6TzqAtsLDX1WsIlDpSxcujmh9xg1uzDV8+GCnJH?=
 =?iso-8859-1?Q?0mtloTwDvxVDMsYHuvQtQrdqu2Phf+UqK5X+rS6RScpYE91oeMJOa5+b3q?=
 =?iso-8859-1?Q?325jB5bDhPZt9zSrjjQMRLpKdQ+3ga0Bv8zNng8+yTc9vpSq+FNWlff/GD?=
 =?iso-8859-1?Q?M3C0G+R1JfgKDyMpZT82FfTAsbzvV6Io+Ms/0bxYVSb9Y4lwiyyVLaJTLG?=
 =?iso-8859-1?Q?PJBqrEecocVSvHQR+TcynUU9IlEr0xAo/MBPXA3QvlKU0W3hYkrA/BrMTl?=
 =?iso-8859-1?Q?oSnUES9ghyM/d6aWZLZcl7qnXgzXV/drbq+GCrQDRYqHvki9Zxo8LTZspj?=
 =?iso-8859-1?Q?ptrcw7Nq4upCjMS1Bb1LP6GQo7eVmNmfr/bPbCr2hRoRMtQw5/K85CFZhW?=
 =?iso-8859-1?Q?tVv9vFPKhU2vY66yxSxq4afhpHFNJUg6Us7vBZJNJISAHZeUt5Uft5oh/D?=
 =?iso-8859-1?Q?ZWoqaD2eP38oOl34f5KRtpBMhAVDxFDUFEDETg1Cs/7FNt0ycoNCIxBPAc?=
 =?iso-8859-1?Q?UzIWtCAMG5Gm4PR5CEQgMhDeYWvEKJYzHdGEp8yQuLVm1y7FQ3u5uH362g?=
 =?iso-8859-1?Q?gd/WoGmunwA5sdlzz1SrWsmyPS2p6MX/6UmaYxmEhQJtIwHhSMSVT4I9TQ?=
 =?iso-8859-1?Q?6PXmpwhEG1LKbdH59rPiQQvWQDKcLI+lkaWWchaCSsUa6BSkak9y2xSrQZ?=
 =?iso-8859-1?Q?LuXjMuCvUpMvGKDOMpGbtdXce1GsO8PLKvD+OsU/axLUgVSOpe+KEvJXdT?=
 =?iso-8859-1?Q?Reu8E+p+C+2YaQLOhRmnjuVaak8k?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Kp7e8dlo9cHg87Jfy/2GvjbkCi4CNuykAeBnsA2QMAy/uFpJHAJFbUOcJs?=
 =?iso-8859-1?Q?4yx+sUJZRqOsPfrfG+w+mt+iJTSwk8S64hZFB3xMxerfzLRCwlLx8QgKxT?=
 =?iso-8859-1?Q?pR3VH23CemItR2wpbBK91X7m87j05vGTE4zSqCMn3rrnK28a5jEJRNMn8s?=
 =?iso-8859-1?Q?fzDjNXev3R9vlPHV75nL8ERT45mBzBuI1s+3Gp1ntlElBfJA+CfWfedWSp?=
 =?iso-8859-1?Q?STsNWfx1MmK/WDtJgsTuWMK0GmrdQW4YINDRtaYLcsx6051JcJrdq1PWFO?=
 =?iso-8859-1?Q?sa3baJ+KOmRh+d9eo7TryBwMIhxmiZIYNq6OKJuCbfPQzAg0UiWWp0Pw+h?=
 =?iso-8859-1?Q?K6ULK/k/U52Rf0PR3b8DBUieTJXHtsYZzCHiOQohVE8FRsQNDmX31x1h3C?=
 =?iso-8859-1?Q?krkXCRM3OuP6uPHI/iogTMBAgSyu1xvbgRXdHO31XHnIISFI6wYGotN7+t?=
 =?iso-8859-1?Q?XuvTiHhJ7OhDpa8YS3QByjLh2yjt8o7DDlc6bD3iQeK26JWuRTg6/RGn0u?=
 =?iso-8859-1?Q?1P/bt8uxLIRtj+FxVL6hEbgQQpItCy7/sLMBLQYDyVHEzS7HAA9cIYqMUU?=
 =?iso-8859-1?Q?obFglMXf7TRK+iXEiSIU80mnN6qBemcwqQCTkiH1ZUPmVwUvl7S6vjFMiU?=
 =?iso-8859-1?Q?bZqUx6ukyNd6uPUmYODopaOn7PW2M5dqnLsAF0ba4FBD2pch3pGQoXeNWH?=
 =?iso-8859-1?Q?lu/pJkzpws2U25xvSFxZa+ebnJBDaLT/0YcC8L252AQ1WUkCJk+0V88IUA?=
 =?iso-8859-1?Q?2+DmjFolS+AMMkHCHgJE3V9DcXKvlQ1PN1ZLNIh0J+qPXjbSIoE2LK//uz?=
 =?iso-8859-1?Q?bOOq/40lGEBZFUKHycKlDM0ChdkosGJzP9zEWbURjrLjTyGGF0xiOLQyJ8?=
 =?iso-8859-1?Q?8ZP+VWsggMwtKLz0EbRBk6sRuYxVINXwdYMIFJDKx1L1C+d+oExf9VDsP8?=
 =?iso-8859-1?Q?YOhjkEUedG7VClUoKDjGatOeAEdGQJMq10Z7F+bJ2y6nrSTmq/BY9iDLPp?=
 =?iso-8859-1?Q?pSI3rMmcn/2vJlu36YPjdoxVN/QNTwLpAZjycYLqdW7Iy4qa570hnomBs8?=
 =?iso-8859-1?Q?ufFuVpSlrhRITn2MWpofI/40ehB6Lc4pNFm0efLRce2E9fBOKR886SeDbt?=
 =?iso-8859-1?Q?VCmeQADHBuNjPqu97i2lpccrKdm5gzSd5ULqCXb9n4NEHfXBewtQ4Zeso4?=
 =?iso-8859-1?Q?lTudo3oBEPzUhBLBpvxqtRGsGCji+kBR3tAvBeVWknj/uhLu758ByO9unW?=
 =?iso-8859-1?Q?TbL9DkTh/AHT7TtAHpN+wURhKC8QxYXpV9/hXu1Pn8ILatkDCDYyrT1/+O?=
 =?iso-8859-1?Q?8av6MEoLBSNBzHbeBzFvbpVMZMHwpHUmCGCp7PWu1SXLVK8eOdALj90Utn?=
 =?iso-8859-1?Q?MBCEwyuSHJ/54tqh8rX7P6jP5oAUCQziynuVy6g13szovkbWpnFnKuNKVF?=
 =?iso-8859-1?Q?99qJfEp11RCrXEeRmuKSEINQ5vhk9zZz+uzIHYZNePmKVbkUhBLW2XWyVh?=
 =?iso-8859-1?Q?sp5YziAJAuskIwR3UM31HPK8zUPPOEDe6AgyxHVj2gZSJjsgYVRRa9PqZT?=
 =?iso-8859-1?Q?McWp7/ZxoVcIXLJUUQk1RdqZne3sgkztgOf55WMFF5S7oHYohLZ7bxtGFw?=
 =?iso-8859-1?Q?DsVkea964rlFbqZUUxTvpi+vsoXffKInHG1bogN42+RZf8g8GFFEvIHg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0654e2d-39dd-4d16-97d0-08de27a23802
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 19:31:21.0254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fWArHuthegxRdZzMeY4GtbvpCdcP+T+pRIvvM+DHopVHYYLnLqj5Vd4XKuXIx96bOXgW1QO/ZSelPAUMMZf4/9Zgh4QamOdNg90w+/s6dnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7690

From: Grygorii Strashko <grygorii_strashko@epam.com>

The VMTRACE feature is depends on Platform/Arch HW and code support and now
can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
This makes VMTRACE support optional by introducing HVM Kconfig option:
- CONFIG_VMTRACE to enable/disable the feature.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v4:
- format changes

changes in v3:
- drop vmtrace stubs for HVM=3Dn case from hvm.h (VMTRACE depnds on HVM)
- hvm_vmtrace_reset() fix return err code
- add comment about using func declaration without definition

changes in v2:
 - fix comments from Jan Beulich
 - move CONFIG_VMTRACE in HVM
 - drop HAS_VMTRACE

v3:
 https://patchwork.kernel.org/project/xen-devel/patch/20251114142207.279834=
-1-grygorii_strashko@epam.com/
v2:
 https://patchwork.kernel.org/project/xen-devel/patch/20251112202442.387999=
7-1-grygorii_strashko@epam.com/=20
v1:
 https://patchwork.kernel.org/project/xen-devel/patch/20251031212005.133821=
2-1-grygorii_strashko@epam.com/

 xen/arch/x86/domctl.c                   |  4 +++
 xen/arch/x86/hvm/Kconfig                | 12 +++++++++
 xen/arch/x86/hvm/vmx/vmcs.c             |  2 ++
 xen/arch/x86/hvm/vmx/vmx.c              | 11 ++++++++
 xen/arch/x86/include/asm/guest-msr.h    |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h      | 36 ++++++++++---------------
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 ++
 xen/arch/x86/mm/mem_sharing.c           |  2 ++
 xen/arch/x86/vm_event.c                 |  8 +++---
 xen/common/domain.c                     | 10 +++++++
 xen/common/memory.c                     |  6 +++++
 xen/common/vm_event.c                   |  3 ++-
 xen/include/xen/domain.h                |  4 +++
 xen/include/xen/sched.h                 |  4 +++
 14 files changed, 80 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 6153e3c07e2d..d9521808dcba 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -154,6 +154,7 @@ void arch_get_domain_info(const struct domain *d,
 static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *o=
p,
                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
+#ifdef CONFIG_VMTRACE
     struct vcpu *v;
     int rc;
=20
@@ -198,6 +199,9 @@ static int do_vmtrace_op(struct domain *d, struct xen_d=
omctl_vmtrace_op *op,
     vcpu_unpause(v);
=20
     return rc;
+#else
+    return -EOPNOTSUPP;
+#endif
 }
=20
 #define MAX_IOPORTS 0x10000
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index c1a131d1851a..f75dec5ea40a 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -35,6 +35,18 @@ config INTEL_VMX
 	  If your system includes a processor with Intel VT-x support, say Y.
 	  If in doubt, say Y.
=20
+config VMTRACE
+	bool "HW VM tracing support"
+	depends on INTEL_VMX
+	default y
+	help
+	  Enables HW VM tracing support which allows to configure HW processor
+	  features (vmtrace_op) to enable capturing information about software
+	  execution using dedicated hardware facilities with minimal interference
+	  to the software being traced. The trace data can be retrieved using buf=
fer
+	  shared between Xen and domain
+	  (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
+
 config HVM_FEP
 	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
 	default DEBUG
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index d610988bf91b..c2e7f9aed39f 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -306,6 +306,7 @@ static int vmx_init_vmcs_config(bool bsp)
=20
     rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
=20
+#ifdef CONFIG_VMTRACE
     /* Check whether IPT is supported in VMX operation. */
     if ( bsp )
         vmtrace_available =3D cpu_has_proc_trace &&
@@ -317,6 +318,7 @@ static int vmx_init_vmcs_config(bool bsp)
                smp_processor_id());
         return -EINVAL;
     }
+#endif
=20
     if ( caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTRO=
LS )
     {
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d042e7fb927f..c98ec110d144 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -622,6 +622,7 @@ static void cf_check domain_creation_finished(struct do=
main *d)
=20
 static void vmx_init_ipt(struct vcpu *v)
 {
+#ifdef CONFIG_VMTRACE
     unsigned int size =3D v->domain->vmtrace_size;
=20
     if ( !size )
@@ -632,6 +633,7 @@ static void vmx_init_ipt(struct vcpu *v)
     ASSERT(size >=3D PAGE_SIZE && (size & (size - 1)) =3D=3D 0);
=20
     v->arch.msrs->rtit.output_limit =3D size - 1;
+#endif
 }
=20
 static int cf_check vmx_vcpu_initialise(struct vcpu *v)
@@ -724,11 +726,13 @@ static void vmx_save_guest_msrs(struct vcpu *v)
      */
     v->arch.hvm.vmx.shadow_gs =3D read_gs_shadow();
=20
+#ifdef CONFIG_VMTRACE
     if ( v->arch.hvm.vmx.ipt_active )
     {
         rdmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
         rdmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
     }
+#endif
=20
     if ( cp->feat.pks )
         msrs->pkrs =3D rdpkrs_and_cache();
@@ -747,12 +751,14 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(msrs->tsc_aux);
=20
+#ifdef CONFIG_VMTRACE
     if ( v->arch.hvm.vmx.ipt_active )
     {
         wrmsrl(MSR_RTIT_OUTPUT_BASE, page_to_maddr(v->vmtrace.pg));
         wrmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
         wrmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
     }
+#endif
=20
     if ( cp->feat.pks )
         wrpkrs(msrs->pkrs);
@@ -2626,6 +2632,7 @@ static bool cf_check vmx_get_pending_event(
     return true;
 }
=20
+#ifdef CONFIG_VMTRACE
 /*
  * We only let vmtrace agents see and modify a subset of bits in MSR_RTIT_=
CTL.
  * These all pertain to data-emitted into the trace buffer(s).  Must not
@@ -2768,6 +2775,7 @@ static int cf_check vmtrace_reset(struct vcpu *v)
     v->arch.msrs->rtit.status =3D 0;
     return 0;
 }
+#endif
=20
 static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
 {
@@ -2940,11 +2948,14 @@ static struct hvm_function_table __initdata_cf_clob=
ber vmx_function_table =3D {
     .altp2m_vcpu_emulate_ve =3D vmx_vcpu_emulate_ve,
     .altp2m_vcpu_emulate_vmfunc =3D vmx_vcpu_emulate_vmfunc,
 #endif
+
+#ifdef CONFIG_VMTRACE
     .vmtrace_control =3D vmtrace_control,
     .vmtrace_output_position =3D vmtrace_output_position,
     .vmtrace_set_option =3D vmtrace_set_option,
     .vmtrace_get_option =3D vmtrace_get_option,
     .vmtrace_reset =3D vmtrace_reset,
+#endif
=20
     .get_reg =3D vmx_get_reg,
     .set_reg =3D vmx_set_reg,
diff --git a/xen/arch/x86/include/asm/guest-msr.h b/xen/arch/x86/include/as=
m/guest-msr.h
index 5f0cb0a93995..702f47fe1e16 100644
--- a/xen/arch/x86/include/asm/guest-msr.h
+++ b/xen/arch/x86/include/asm/guest-msr.h
@@ -50,6 +50,7 @@ struct vcpu_msrs
         };
     } misc_features_enables;
=20
+#ifdef CONFIG_VMTRACE
     /*
      * 0x00000560 ... 57x - MSR_RTIT_*
      *
@@ -81,6 +82,7 @@ struct vcpu_msrs
             };
         };
     } rtit;
+#endif
=20
     /*
      * 0x000006e1 - MSR_PKRS - Protection Key Supervisor.
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index 7412256a2dab..93da4dd2dc4b 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -234,12 +234,14 @@ struct hvm_function_table {
     int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
 #endif
=20
+#ifdef CONFIG_VMTRACE
     /* vmtrace */
     int (*vmtrace_control)(struct vcpu *v, bool enable, bool reset);
     int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
     int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t value=
);
     int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *valu=
e);
     int (*vmtrace_reset)(struct vcpu *v);
+#endif
=20
     uint64_t (*get_reg)(struct vcpu *v, unsigned int reg);
     void (*set_reg)(struct vcpu *v, unsigned int reg, uint64_t val);
@@ -738,6 +740,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *=
v)
 bool altp2m_vcpu_emulate_ve(struct vcpu *v);
 #endif /* CONFIG_ALTP2M */
=20
+#ifdef CONFIG_VMTRACE
 static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool re=
set)
 {
     if ( hvm_funcs.vmtrace_control )
@@ -772,13 +775,24 @@ static inline int hvm_vmtrace_get_option(
=20
     return -EOPNOTSUPP;
 }
+#else
+/*
+ * Function declaration(s) here are used without definition(s) to make com=
piler
+ * happy when VMTRACE=3Dn, compiler DCE will eliminate unused code.
+ */
+int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos);
+#endif
=20
 static inline int hvm_vmtrace_reset(struct vcpu *v)
 {
+#ifdef CONFIG_VMTRACE
     if ( hvm_funcs.vmtrace_reset )
         return alternative_call(hvm_funcs.vmtrace_reset, v);
=20
     return -EOPNOTSUPP;
+#else
+    return -EOPNOTSUPP;
+#endif
 }
=20
 /*
@@ -934,28 +948,6 @@ static inline bool hvm_has_set_descriptor_access_exiti=
ng(void)
     return false;
 }
=20
-static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool re=
set)
-{
-    return -EOPNOTSUPP;
-}
-
-static inline int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *po=
s)
-{
-    return -EOPNOTSUPP;
-}
-
-static inline int hvm_vmtrace_set_option(
-    struct vcpu *v, uint64_t key, uint64_t value)
-{
-    return -EOPNOTSUPP;
-}
-
-static inline int hvm_vmtrace_get_option(
-    struct vcpu *v, uint64_t key, uint64_t *value)
-{
-    return -EOPNOTSUPP;
-}
-
 static inline uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
 {
     ASSERT_UNREACHABLE();
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include=
/asm/hvm/vmx/vmcs.h
index 8ff7c8045fc6..879ec10cefd0 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -154,8 +154,10 @@ struct vmx_vcpu {
     /* Do we need to tolerate a spurious EPT_MISCONFIG VM exit? */
     bool                 ept_spurious_misconfig;
=20
+#ifdef CONFIG_VMTRACE
     /* Processor Trace configured and enabled for the vcpu. */
     bool                 ipt_active;
+#endif
=20
     /* Is the guest in real mode? */
     uint8_t              vmx_realmode;
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 4787b2796479..074f1b2562b3 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1888,7 +1888,9 @@ static int fork(struct domain *cd, struct domain *d)
         domain_pause(d);
         cd->max_pages =3D d->max_pages;
         *cd->arch.cpu_policy =3D *d->arch.cpu_policy;
+#ifdef CONFIG_VMTRACE
         cd->vmtrace_size =3D d->vmtrace_size;
+#endif
         cd->parent =3D d;
     }
=20
diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index fc349270b9c5..112d2ef66dc7 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -253,7 +253,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
     req->data.regs.x86.shadow_gs =3D ctxt.shadow_gs;
     req->data.regs.x86.dr6 =3D ctxt.dr6;
=20
-    if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos=
) !=3D 1 )
+    if ( IS_ENABLED(CONFIG_VMTRACE) &&
+         hvm_vmtrace_output_position(curr,
+                                     &req->data.regs.x86.vmtrace_pos) !=3D=
 1 )
         req->data.regs.x86.vmtrace_pos =3D ~0;
 #endif
 }
@@ -303,12 +305,12 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_=
response_t *rsp)
 #endif
 }
=20
+#ifdef CONFIG_VMTRACE
 void vm_event_reset_vmtrace(struct vcpu *v)
 {
-#ifdef CONFIG_HVM
     hvm_vmtrace_reset(v);
-#endif
 }
+#endif
=20
 /*
  * Local variables:
diff --git a/xen/common/domain.c b/xen/common/domain.c
index e13e01c1d272..ce4f55339fb4 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -136,7 +136,9 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
=20
 vcpu_info_t dummy_vcpu_info;
=20
+#ifdef CONFIG_VMTRACE
 bool __read_mostly vmtrace_available;
+#endif
=20
 bool __read_mostly vpmu_is_available;
=20
@@ -318,6 +320,7 @@ static void vcpu_info_reset(struct vcpu *v)
=20
 static void vmtrace_free_buffer(struct vcpu *v)
 {
+#ifdef CONFIG_VMTRACE
     const struct domain *d =3D v->domain;
     struct page_info *pg =3D v->vmtrace.pg;
     unsigned int i;
@@ -332,10 +335,12 @@ static void vmtrace_free_buffer(struct vcpu *v)
         put_page_alloc_ref(&pg[i]);
         put_page_and_type(&pg[i]);
     }
+#endif
 }
=20
 static int vmtrace_alloc_buffer(struct vcpu *v)
 {
+#ifdef CONFIG_VMTRACE
     struct domain *d =3D v->domain;
     struct page_info *pg;
     unsigned int i;
@@ -377,6 +382,9 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
     }
=20
     return -ENODATA;
+#else
+    return 0;
+#endif
 }
=20
 /*
@@ -825,7 +833,9 @@ struct domain *domain_create(domid_t domid,
         ASSERT(!config->altp2m.nr);
 #endif
=20
+#ifdef CONFIG_VMTRACE
         d->vmtrace_size =3D config->vmtrace_size;
+#endif
     }
=20
     /* Sort out our idea of is_control_domain(). */
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3688e6dd5032..66dc7f7a0a41 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1155,8 +1155,10 @@ static unsigned int resource_max_frames(const struct=
 domain *d,
     case XENMEM_resource_ioreq_server:
         return ioreq_server_max_frames(d);
=20
+#ifdef CONFIG_VMTRACE
     case XENMEM_resource_vmtrace_buf:
         return d->vmtrace_size >> PAGE_SHIFT;
+#endif
=20
     default:
         return 0;
@@ -1198,6 +1200,7 @@ static int acquire_ioreq_server(struct domain *d,
 #endif
 }
=20
+#ifdef CONFIG_VMTRACE
 static int acquire_vmtrace_buf(
     struct domain *d, unsigned int id, unsigned int frame,
     unsigned int nr_frames, xen_pfn_t mfn_list[])
@@ -1220,6 +1223,7 @@ static int acquire_vmtrace_buf(
=20
     return nr_frames;
 }
+#endif
=20
 /*
  * Returns -errno on error, or positive in the range [1, nr_frames] on
@@ -1238,8 +1242,10 @@ static int _acquire_resource(
     case XENMEM_resource_ioreq_server:
         return acquire_ioreq_server(d, id, frame, nr_frames, mfn_list);
=20
+#ifdef CONFIG_VMTRACE
     case XENMEM_resource_vmtrace_buf:
         return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
+#endif
=20
     default:
         ASSERT_UNREACHABLE();
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index b2787c010890..cf0258223f50 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -441,7 +441,8 @@ static int vm_event_resume(struct domain *d, struct vm_=
event_domain *ved)
             if ( rsp.flags & VM_EVENT_FLAG_GET_NEXT_INTERRUPT )
                 vm_event_monitor_next_interrupt(v);
=20
-            if ( rsp.flags & VM_EVENT_FLAG_RESET_VMTRACE )
+            if ( IS_ENABLED(CONFIG_VMTRACE) &&
+                 (rsp.flags & VM_EVENT_FLAG_RESET_VMTRACE) )
                 vm_event_reset_vmtrace(v);
=20
             if ( rsp.flags & VM_EVENT_FLAG_VCPU_PAUSED )
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 8aab05ae93c8..aa86a9f46022 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -191,7 +191,11 @@ void vnuma_destroy(struct vnuma_info *vnuma);
 static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma=
); }
 #endif
=20
+#ifdef CONFIG_VMTRACE
 extern bool vmtrace_available;
+#else
+#define vmtrace_available false
+#endif
=20
 extern bool vpmu_is_available;
=20
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 02bdc256ce37..dcd8647e0d36 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -300,9 +300,11 @@ struct vcpu
     /* vPCI per-vCPU area, used to store data for long running operations.=
 */
     struct vpci_vcpu vpci;
=20
+#ifdef CONFIG_VMTRACE
     struct {
         struct page_info *pg; /* One contiguous allocation of d->vmtrace_s=
ize */
     } vmtrace;
+#endif
=20
     struct arch_vcpu arch;
=20
@@ -623,7 +625,9 @@ struct domain
     unsigned int nr_altp2m;    /* Number of altp2m tables. */
 #endif
=20
+#ifdef CONFIG_VMTRACE
     unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disable. *=
/
+#endif
=20
 #ifdef CONFIG_ARGO
     /* Argo interdomain communication support */
--=20
2.34.1

