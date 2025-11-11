Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D69C4FAA9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 21:09:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159306.1487693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIufW-0004yE-Vo; Tue, 11 Nov 2025 20:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159306.1487693; Tue, 11 Nov 2025 20:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIufW-0004w5-Rj; Tue, 11 Nov 2025 20:08:46 +0000
Received: by outflank-mailman (input) for mailman id 1159306;
 Tue, 11 Nov 2025 20:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIufV-0004GQ-5r
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 20:08:45 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38b2c75b-bf3a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 21:08:42 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AM9PR03MB7758.eurprd03.prod.outlook.com
 (2603:10a6:20b:3dc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 20:08:27 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 20:08:27 +0000
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
X-Inumbo-ID: 38b2c75b-bf3a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gw+Hp6U5Kv5CgzluALCj3FrwmjA06q5oF8auei73QpNqxiBvJOxSKG2nPmgTPfveNMJmFV4FkNbegPhAzxdRgooVN2uSoHi4KldS24VexNGg/f3ZBXB4jRda9EDQwpuUTR9C+qv0WAtG4YvM4sEwboAPMnCrutKmCbksR0FJR9ptZzX+TP4CxzigKBiEqXMiKy8KDkWozGhGsOPMTBZ1dZiQliZff/dSriddKAHidLvOXNNYHUFvx8qY5m+MKg51rX61gmAcaLQwXjhVlyNNGwpqCK1zs7wDwv+WdvtJUf6WOJpLVTJcmR3WKNNJtJpy3DgwEIN1F6NQTDxkDxlFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fc8kqULrDlEecW0AMKDiqA+VYZUna5h4+g6PU7mwyI=;
 b=ncF02tUf3bXWZ/4GTgvkCV27izhwOTFrTZduf1h4GWJKyZWwz35vh1LCY4o+EbjVvLfemE6rnNm93A4uof7fI3CtVK5nPu+xdTGdNKvudEbpCj4QXaLUFQ0hWiKTyrN+bltHb8igCm4nWmq8iqMEVb/QUJnH8zEP8ieKXB2a510ZiAmHDP+nEieqgZFHqqLi2X02BT7HKwtn/hgl+CJAtXYYo9eLXctYX0w7W7pWFwv6/OUuNvdWk+0bESFz8Er8bHh2cNBQskBmMUVdjTWZ+6aoZA4CWlcDrS4rkzfuGgwpldHXHPcMy4piISvCISfBj8cs1tjT5rx/6sWDHMdi3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fc8kqULrDlEecW0AMKDiqA+VYZUna5h4+g6PU7mwyI=;
 b=RPcEjmJ6lkqUseVJmFvWSMndzUeUqzveZz9tiiZi0qIeAvn0h3X38ALsO6IZ2ag/L7i382CZUeWZmQO8gHQQ8JWJjrnM1iZUzs6bTAWkaSYO9iROJnVtbDexcf+TAG785Y8JZ2q5PF8INzfV/XGzVcrN1/6N3WINclAXTARHNa7gwz2E2liFqD4ceswBgyN/wTUwEpZfOP1Y8Tk0Z1g+GGBcaJYaYUNhQOOkpaED8lKXIP3IuM4UxXk07/EBEyQvY1uxQw7hQ5hDeFypxTQHQUNRDOjHd59vewjX4FRpmdjqnIrUb795spXt9vy1Cc1xKqgwQuV/lNU0mDgjvh2JIQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [RESEND PATCH v2 3/3] x86/hvm: vmx: refactor cache disable mode data
Thread-Topic: [RESEND PATCH v2 3/3] x86/hvm: vmx: refactor cache disable mode
 data
Thread-Index: AQHcU0bwLNN2MekWRUyLAAcFJooieg==
Date: Tue, 11 Nov 2025 20:08:26 +0000
Message-ID: <20251111200754.3575866-4-grygorii_strashko@epam.com>
References: <20251111200754.3575866-1-grygorii_strashko@epam.com>
In-Reply-To: <20251111200754.3575866-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AM9PR03MB7758:EE_
x-ms-office365-filtering-correlation-id: b47fb9ef-ef0b-48ad-b339-08de215e1375
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FLjFatVUM2kh2zJXml9EuJ2u/cuSAwXsX1QBgVeBTKwgJuHm+VzYHRzZEp?=
 =?iso-8859-1?Q?qChRm4y+LbiJuDg+Qt/oj09PWCfkEwhheUWDy69ZkintQ6ARcFr/QJYtlO?=
 =?iso-8859-1?Q?6nmw/XNoJq57iijrPT2ROx0wRSdhJXl8WaS/k8GlOeP17dpfbv+BbJKPvf?=
 =?iso-8859-1?Q?dEff7th4BAOuDYJZCfPe57Q1JGdXamTifAYrn4jOV6jjUZZBAVO5fTqAee?=
 =?iso-8859-1?Q?4wPWtdqrRgn5zSg/tyO76lxmqBjiIgfSUw0tyH1gARcW01KywMVpT7w30L?=
 =?iso-8859-1?Q?nY2eQWaYB/7vnTAQxiYmOPWw3szld5KI0MS0/eHHc+FKzSCQpie0m36omM?=
 =?iso-8859-1?Q?5QgwBLFXjxmw4QYAOIyqGo0mGpY4RhwlDrKQ+5ocDjzn8YF5EFsNpByjnI?=
 =?iso-8859-1?Q?zSc8dEN8v1SDk52bnu9y2b6JbM2rZc9SEdo29SlIGCUNCfJ6QJOfOAHjYN?=
 =?iso-8859-1?Q?IcHekz40jy/O9VB9muWmjmR4EUdVDWcr+UoCd9wkVOlOWtqt93Xdm8u1Ft?=
 =?iso-8859-1?Q?nYKtFr+j0UDsdThEg2weMKaMjsgrL4xSdJWHRchsyRnwfgwnFmZW6m7Zx5?=
 =?iso-8859-1?Q?AKABV176tAfPDiW29Y1o7fJx2GLspNwecTMmKDxr3efgU2Hijrp5vmGQiA?=
 =?iso-8859-1?Q?V7x0vQ/iSFeXdj41WAvKK/K9zCiLeMBrAx4QTDh9QIRVcDf584t3jD9ck/?=
 =?iso-8859-1?Q?gYTNwxhmJP4q3DmoxHHmbrNGVk8an4akgdE8eUh1IqRAd5UtREssOhnNPy?=
 =?iso-8859-1?Q?7TLDai8/JTbYbrAtzVo1u+C5Y8IFLvHs54ze2VIc6SQKDZK7EC0pi1ziW6?=
 =?iso-8859-1?Q?mN74xICCSIvEoJ2nImXKF65fwL0uBpkfSFaB2gdsbIDFGuUOciFBCOsbd7?=
 =?iso-8859-1?Q?oMTP181e/wl/gBW3FHKNZynbGh+gVta1TOP/jJZzMgeGtJ6uJCHPIKiM/d?=
 =?iso-8859-1?Q?40igmkXB5ULqg2/NeHJYPX2ltPmIzUu8d6U1RPt3UbcApLLeQnILAS3rwK?=
 =?iso-8859-1?Q?HnXqmkO0OGgqByuKARCObFXMT3aFYs70Z9tg+Gyg7yFqHlBvBNvnlhpRmD?=
 =?iso-8859-1?Q?6EV0rXpiuwyNg2jadjGthlGG5sDkvxCnRcuOLOvSTd/BivhA6u9ltXbht/?=
 =?iso-8859-1?Q?A4r0nKBIuM2WKi++sEREwfJlR5wvFjKo4nVO0HWrCJjUygLsmeNhj1Ls6f?=
 =?iso-8859-1?Q?Pe5W6528hC6ziTi0FY0Do7+GwooAAmWBi1ju8XLCaoonhjJ/vpkyiltjZt?=
 =?iso-8859-1?Q?nMETyKkP2lzwb1GFu4MLsyy0wkgdomBOUDxr7K1NIgHP+UDew/utPfbTS2?=
 =?iso-8859-1?Q?8zNhjynpo4gR7KRF7WY/mxl0L5IieZujq/TB4ZGwEqj6lAZ/4YUbj7M0Z/?=
 =?iso-8859-1?Q?swdUJBcBjLbVkz6AbevOuYT8CTzcN/+K6+sgzPzI1iMbGW890QFOqwDL9o?=
 =?iso-8859-1?Q?+9GsHx6YMt9t1mMr043zlBCWPb7jQlLjf8d++R0qVVVI7FrdwNbWSXswlH?=
 =?iso-8859-1?Q?Oy1ElcZOAyK67pxrrsBDGmYByK7mL/zbPQkYwr56uI7BV3oyQmi0WFgSOc?=
 =?iso-8859-1?Q?vbJnciiBLbUuW/tIc3QCxzDC3CDw?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7+X9rXka39UYbXAu+gtIyjzlUKTry0bQ2BVIumERRYjkNy6CSwqzwHbd+G?=
 =?iso-8859-1?Q?xHipK3VegXfpKBF4OIDhTDHsFU4UgJ4iR1Yii9KTzDUC3gpOv6gDsThBzh?=
 =?iso-8859-1?Q?JOxnlZ7DodpPGbsjs224E5+ueVx/wDX/GHeuwsXel4b/IJ179O+ueGjQho?=
 =?iso-8859-1?Q?a0zbyHVRo0J+bScVbSyNg4LuGimFNyR1E2+MXfYLcoFuZy4Z+UZdUwP479?=
 =?iso-8859-1?Q?/e2tIIMM0fkAw4HJh/ipXbqtrngVtIyNXqPUMoOuQV9s7kCCzAcfnBO70/?=
 =?iso-8859-1?Q?bJIqL8Tsr2gbdUUSv5siLG94gRbHK7gP/2xb2QFqHcUwDZW6oI5jadLh91?=
 =?iso-8859-1?Q?ZVuunb5qiKSv+kZdqeTKnO8n7GH1g7QdiNyfTmRolSmgvHOJZjEoKfJtuY?=
 =?iso-8859-1?Q?MttRKiDlsF0zcu5YNxxgBtGlqNJxZpX1Jr6/N8A07YuLN+Wu5szsVU3IcO?=
 =?iso-8859-1?Q?+tgm+d7E8ezMPtGpFEeP+UwVjqKt+S0w1sKh8GpxpeWWnV4dh+TCYmTA05?=
 =?iso-8859-1?Q?02z/W4qQw9e0GEOVm+HPt59Wos3BIhTwY+q2SfILvoITJqS8E5E0mquIB7?=
 =?iso-8859-1?Q?0g5qnfYkM3sDVVUs5W6+OwB6dZn1v0xPI6/IfF/nDeh+wSKVy133udvSbA?=
 =?iso-8859-1?Q?vvooBObkcaAOzEbyeiFhdwzQJPFBI2pTAXZL7kmvHrOWV3/t/IkS9u3cqu?=
 =?iso-8859-1?Q?ONfbGjFxQ/JWGqh70iHdmLXbji+czJW2piWcRAYuwUkoPhqdWQFQKesT6Z?=
 =?iso-8859-1?Q?/1O+mDjrl6KL2CNHQJq9Y99yvZtX2IyFrvSYfor/GNvkyeszVgz5UCjw6n?=
 =?iso-8859-1?Q?raNNMPOE8DAkdVupAUXLQwSB5fj/xX4FeS6t5L28MhMH5QxfpV090RvG22?=
 =?iso-8859-1?Q?vv1fDwEb92bIuiPB2KJPOYpj8wseBMxTqRjuz1WdJQC1B5L/MxPQHp25sV?=
 =?iso-8859-1?Q?/wSN/fn1Ao94NBx3L3TlVxPqQ2f/eb9LwXgI2klEV8BbwYwetVFZzWwE74?=
 =?iso-8859-1?Q?PxzReyndPOiBQmIihedJpy7PhOUXGkr3x4CtbNc96TRxk52zlpFBGiz2To?=
 =?iso-8859-1?Q?V2ghKtE5MEp862etSVT+ojBjYoIKvTua/F+x0uMY1l7pQM0ux9L+r338+U?=
 =?iso-8859-1?Q?C6WgoNAet/wyrECC0cn+Q2WGgMl9eOO8+kuJGMj/jliyCIsenDH4tNyTG4?=
 =?iso-8859-1?Q?+cq1TgEeSeSRzpRKzASynhAvOMa6MORkFn5LwiFuGfwlfg5dE4XaHeG1aO?=
 =?iso-8859-1?Q?y1MbR2RgGTJHWG1a2sn+qlipe7wpEJ3LDbRhM/BMe70OSf/FzIFzXNJQ1J?=
 =?iso-8859-1?Q?DQQEhgWE8PQGRe9q4q266fHUNG1nWR+spZakxtWf04tsWvo/VISVAZQr0L?=
 =?iso-8859-1?Q?6o+fXHy7ommkwgCx5/6XBDAT6JCsWkIPrhnG3YQt2A3b0DzTWR57sD4rC/?=
 =?iso-8859-1?Q?UOk46HokTDBvOfzxP1OSXbf17GJ2iXcjAqh1EFlb7VEQiP9HMWyHAL2Rph?=
 =?iso-8859-1?Q?N80CRNRyXcU3VB/VQn+XS8gvR79N7fR35i3Yd2gOFS3fuzxcd+MAWWlVRg?=
 =?iso-8859-1?Q?5QgES9kaWnQURZlpjMgNH8FQ2FsKMozs2Sj8EmdO20vbvbRZix16r7M52p?=
 =?iso-8859-1?Q?fycK27jQ25D7vGa0zmheblBdnXTQiNVxiJFd3CQaB0M+9o4DjQooPoyQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47fb9ef-ef0b-48ad-b339-08de215e1375
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 20:08:27.0007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 95jexWdLC4EiJ7V6J/bumHsONLdsuTO2KgBvdF4oPp7IbnPmfKzEFBciYKp366GXudUOxZAiAm2TWdg7IuRk2/bka7jq5/wATrY1WNyiSwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7758

From: Grygorii Strashko <grygorii_strashko@epam.com>

The Cache Disable mode data is used only by VMX code, so move it from
common HVM structures into VMX specific structures:
- move "uc_lock", "is_in_uc_mode" fields from struct hvm_domain to struct
vmx_domain;
- move "cache_mode" field from struct hvm_vcpu to struct vmx_vcpu.

Hence, the "in_uc_mode" field is used directly in mm/shadow/multi.c
_sh_propagate(), introduce the hvm_is_in_uc_mode() macro to avoid direct
access to this field and account for INTEL_VMX configuration.

While here:
- rename "is_in_uc_mode" to "in_uc_mode"
- s/NORMAL_CACHE_MODE/CACHE_MODE_NORMAL
- s/NO_FILL_CACHE_MODE/CACHE_MODE_NO_FILL

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v2:
- s/is_in_uc_mode/in_uc_mode
- s/*_CACHE_MODE/CACHE_MODE_* and move them after "cache_mode"
- reorder uc_lock,in_uc_mode in struct vmx_domain
- move spin_lock_init()

 xen/arch/x86/hvm/hvm.c                  |  1 -
 xen/arch/x86/hvm/vmx/vmx.c              | 30 +++++++++++++------------
 xen/arch/x86/include/asm/hvm/domain.h   |  6 -----
 xen/arch/x86/include/asm/hvm/hvm.h      |  3 +++
 xen/arch/x86/include/asm/hvm/vcpu.h     |  3 ---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 13 +++++++++++
 xen/arch/x86/include/asm/mtrr.h         |  3 ---
 xen/arch/x86/mm/shadow/multi.c          |  2 +-
 8 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 9caca93e5f56..c09fb2ba6873 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -608,7 +608,6 @@ int hvm_domain_initialise(struct domain *d,
     }
=20
     spin_lock_init(&d->arch.hvm.irq_lock);
-    spin_lock_init(&d->arch.hvm.uc_lock);
     spin_lock_init(&d->arch.hvm.write_map.lock);
     rwlock_init(&d->arch.hvm.mmcfg_lock);
     INIT_LIST_HEAD(&d->arch.hvm.write_map.list);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 67861bc8bccf..0d9a4a17c433 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -590,6 +590,8 @@ static int cf_check vmx_domain_initialise(struct domain=
 *d)
      */
     d->arch.hvm.vmx.exec_sp =3D is_hardware_domain(d) || opt_ept_exec_sp;
=20
+    spin_lock_init(&d->arch.hvm.vmx.uc_lock);
+
     if ( (rc =3D vmx_alloc_vlapic_mapping(d)) !=3D 0 )
         return rc;
=20
@@ -1431,7 +1433,7 @@ static void cf_check vmx_set_segment_register(
 static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
-         unlikely(v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+         unlikely(v->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) )
         return 0;
=20
     vmx_vmcs_enter(v);
@@ -1443,7 +1445,7 @@ static int cf_check vmx_set_guest_pat(struct vcpu *v,=
 u64 gpat)
 static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
 {
     if ( !paging_mode_hap(v->domain) ||
-         unlikely(v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+         unlikely(v->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) )
         return 0;
=20
     vmx_vmcs_enter(v);
@@ -1462,7 +1464,7 @@ static bool domain_exit_uc_mode(struct vcpu *v)
     {
         if ( (vs =3D=3D v) || !vs->is_initialised )
             continue;
-        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
+        if ( (vs->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) ||
              mtrr_pat_not_equal(vs, v) )
             return false;
     }
@@ -1472,7 +1474,7 @@ static bool domain_exit_uc_mode(struct vcpu *v)
=20
 static void hvm_set_uc_mode(struct domain *d, bool is_in_uc_mode)
 {
-    d->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
+    d->arch.hvm.vmx.in_uc_mode =3D is_in_uc_mode;
     shadow_blow_tables_per_domain(d);
 }
=20
@@ -1483,10 +1485,10 @@ static void hvm_shadow_handle_cd(struct vcpu *v, un=
signed long value)
     if ( value & X86_CR0_CD )
     {
         /* Entering no fill cache mode. */
-        spin_lock(&d->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
+        spin_lock(&d->arch.hvm.vmx.uc_lock);
+        v->arch.hvm.vmx.cache_mode =3D CACHE_MODE_NO_FILL;
=20
-        if ( !d->arch.hvm.is_in_uc_mode )
+        if ( !d->arch.hvm.vmx.in_uc_mode )
         {
             domain_pause_nosync(d);
=20
@@ -1496,19 +1498,19 @@ static void hvm_shadow_handle_cd(struct vcpu *v, un=
signed long value)
=20
             domain_unpause(d);
         }
-        spin_unlock(&d->arch.hvm.uc_lock);
+        spin_unlock(&d->arch.hvm.vmx.uc_lock);
     }
     else if ( !(value & X86_CR0_CD) &&
-              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
+              (v->arch.hvm.vmx.cache_mode =3D=3D CACHE_MODE_NO_FILL) )
     {
         /* Exit from no fill cache mode. */
-        spin_lock(&d->arch.hvm.uc_lock);
-        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
+        spin_lock(&d->arch.hvm.vmx.uc_lock);
+        v->arch.hvm.vmx.cache_mode =3D CACHE_MODE_NORMAL;
=20
         if ( domain_exit_uc_mode(v) )
             hvm_set_uc_mode(d, false);
=20
-        spin_unlock(&d->arch.hvm.uc_lock);
+        spin_unlock(&d->arch.hvm.vmx.uc_lock);
     }
 }
=20
@@ -1549,11 +1551,11 @@ static void cf_check vmx_handle_cd(struct vcpu *v, =
unsigned long value)
=20
             wbinvd();               /* flush possibly polluted cache */
             hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TL=
B */
-            v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
+            v->arch.hvm.vmx.cache_mode =3D CACHE_MODE_NO_FILL;
         }
         else
         {
-            v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
+            v->arch.hvm.vmx.cache_mode =3D CACHE_MODE_NORMAL;
             vmx_set_guest_pat(v, *pat);
             if ( !is_iommu_enabled(v->domain) || iommu_snoop )
                 vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/a=
sm/hvm/domain.h
index 95d9336a28f0..83be2bd1c29c 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -97,12 +97,6 @@ struct hvm_domain {
     /* VRAM dirty support.  Protect with the domain paging lock. */
     struct sh_dirty_vram *dirty_vram;
=20
-    /* If one of vcpus of this domain is in no_fill_mode or
-     * mtrr/pat between vcpus is not the same, set is_in_uc_mode
-     */
-    spinlock_t             uc_lock;
-    bool                   is_in_uc_mode;
-
     bool                   is_s3_suspended;
=20
     /* Compatibility setting for a bug in x2APIC LDR */
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index 20b373cea6fb..728b9624522f 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -394,6 +394,9 @@ static inline bool using_svm(void)
     return IS_ENABLED(CONFIG_AMD_SVM) && cpu_has_svm;
 }
=20
+#define hvm_is_in_uc_mode(d) \
+    (using_vmx() && (d)->arch.hvm.vmx.in_uc_mode)
+
 #ifdef CONFIG_HVM
=20
 #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm=
/hvm/vcpu.h
index 9ed9eaff3bc5..eae9ac53767b 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -168,9 +168,6 @@ struct hvm_vcpu {
=20
     u8                  evtchn_upcall_vector;
=20
-    /* Which cache mode is this VCPU in (CR0:CD/NW)? */
-    u8                  cache_mode;
-
     struct hvm_vcpu_io  hvm_io;
=20
     /* Pending hw/sw interrupt (.vector =3D -1 means nothing pending). */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include=
/asm/hvm/vmx/vmcs.h
index 53aa9e3556d3..d28a2682e9df 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -46,6 +46,7 @@ struct ept_data {
=20
 #define _VMX_DOMAIN_PML_ENABLED    0
 #define VMX_DOMAIN_PML_ENABLED     (1ul << _VMX_DOMAIN_PML_ENABLED)
+
 struct vmx_domain {
     mfn_t apic_access_mfn;
     /* VMX_DOMAIN_* */
@@ -56,6 +57,13 @@ struct vmx_domain {
      * around CVE-2018-12207 as appropriate.
      */
     bool exec_sp;
+    /*
+     * If one of vcpus of this domain is in no_fill_mode or
+     * mtrr/pat between vcpus is not the same, set in_uc_mode.
+     * Protected by uc_lock.
+     */
+    bool in_uc_mode;
+    spinlock_t uc_lock;
 };
=20
 /*
@@ -158,6 +166,11 @@ struct vmx_vcpu {
=20
     uint8_t              lbr_flags;
=20
+    /* Which cache mode is this VCPU in (CR0:CD/NW)? */
+    uint8_t              cache_mode;
+#define CACHE_MODE_NORMAL  0
+#define CACHE_MODE_NO_FILL 2
+
     /* Bitmask of segments that we can't safely use in virtual 8086 mode *=
/
     uint16_t             vm86_segment_mask;
     /* Shadow CS, SS, DS, ES, FS, GS, TR while in virtual 8086 mode */
diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtr=
r.h
index 25d442659df2..3a5b4f5b6eec 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -7,9 +7,6 @@
 #define MEMORY_NUM_TYPES     MTRR_NUM_TYPES
 #define NO_HARDCODE_MEM_TYPE MTRR_NUM_TYPES
=20
-#define NORMAL_CACHE_MODE          0
-#define NO_FILL_CACHE_MODE         2
-
 #define INVALID_MEM_TYPE X86_NUM_MT
=20
 /* In the Intel processor's MTRR interface, the MTRR type is always held i=
n
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.=
c
index 7be9c180ec43..03be61e225c0 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -559,7 +559,7 @@ _sh_propagate(struct vcpu *v,
         if ( !mmio_mfn &&
              (type =3D hvm_get_mem_pinned_cacheattr(d, target_gfn, 0)) >=
=3D 0 )
             sflags |=3D pat_type_2_pte_flags(type);
-        else if ( d->arch.hvm.is_in_uc_mode )
+        else if ( hvm_is_in_uc_mode(d) )
             sflags |=3D pat_type_2_pte_flags(X86_MT_UC);
         else
             if ( iomem_access_permitted(d, mfn_x(target_mfn), mfn_x(target=
_mfn)) )
--=20
2.34.1

