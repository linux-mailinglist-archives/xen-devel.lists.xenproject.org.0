Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A20C51C6A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159699.1488037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8SB-0007WM-Cw; Wed, 12 Nov 2025 10:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159699.1488037; Wed, 12 Nov 2025 10:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8SB-0007O7-8F; Wed, 12 Nov 2025 10:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1159699;
 Wed, 12 Nov 2025 10:51:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulhw=5U=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vJ8S9-0006fP-U2
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:51:53 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9947d3f4-bfb5-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 11:51:53 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9786.eurprd03.prod.outlook.com
 (2603:10a6:102:2e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 12 Nov
 2025 10:51:48 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 10:51:48 +0000
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
X-Inumbo-ID: 9947d3f4-bfb5-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xq3AMRceXQOpZuHdxUeHS/m2Yr/1YG3voPokSFkMINk0XAc2XWhxX3YDOrqEz8JYb9jX7Pln7t5Mj6SkV9fgzD6aKVMLRyVUDyqohWnqF+0YR5WiiYuu8OtkZqHFowa+CB5r27qI6UHrsLGw52Y2owOxeP7pkPMpYbIYyUJArS6/qKwjYxY3rvuqYG/1q4ittA6QpWAMXF+JjZUhyuGgvI77DRJ7rfuatD0733c5xsTVHnCShKLX2XHBVwqaEQkKJb0mOvbflGeZOynAzmo7cOIkF/3zuJgc59Ak9yIgdQ45jlpEpGclYepJ/3tOtfy0vlneksXWgPFqlNYprZ//Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7Xue1J/5TT4npEO/DAmlQiS+zcOzlt5re/MztD1gyY=;
 b=Zo+VdohhfjAgn6TpdFOBW1jtFpSCFiK8IvD4bBWppiPY8Ye3r9YqfDR61vGtyNS2XTVxsIwpBGTmK9/DrHrNwUfGpmgGi7rM0i/4VWDVeePsodYKbY5H0C/nNo25f7a7gZ1vsLe5nQ6nI4zkNiHzA4uB80LKdqxPejlbOlHW0DYOXmm3PcXKR4Wn6yGKIx2SOBQs/DPf4t/39WqYAWS/bX+Jdg7QYDAgqt9K7QA6CnQ88udlqu6cWh1gcTZ7Ws99AnNTLxf/wrMPuFpTjlckR6kEjf4hbNVqPVZNKlFApcywMOR4jMYJCVmTUPCDUSfKySdl/aPwQFkD1IrjLKNnzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7Xue1J/5TT4npEO/DAmlQiS+zcOzlt5re/MztD1gyY=;
 b=vJbu7+qPn3b+54iPwQFRusTGws/QVFFTFTOBVOb2atIAr2O4KUMP9Ue5HzUoH4AdKaf2reVtUPbx57Gcm6eilIlryDls7rnZLk8AvA5jS/OwAdo+zDnAVSbb6seKMMgLJfiOB8Zl9Hf1t9KWJsN8neYrhrHJd5T5qPILlUnMxRhg4oMwijgU8vXFRdEW/MYOFsTxpFJqdri9ClBnO234pyw6TO8P8FhsPOHV8OGwtHH7a79giLTTM32S/1f9DlEY7rlFvmKdusJ4nPW3yAQnGnyOH1Uxx55ItlXK1W/YHNWLqogsOaa+h5Yk5VcOAAxNQXwkl3yVGkSjlBlePY+9mg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 4/8] arm/irq: Migrate IRQs from dyings CPUs
Thread-Topic: [PATCH v4 4/8] arm/irq: Migrate IRQs from dyings CPUs
Thread-Index: AQHcU8JYvjT2yDm5JUiekiWBeQTl2w==
Date: Wed, 12 Nov 2025 10:51:48 +0000
Message-ID:
 <6371ac96102f48b55ffd884656770187ed3a7f84.1762939773.git.mykyta_poturai@epam.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1762939773.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9786:EE_
x-ms-office365-filtering-correlation-id: 28371c27-a8b0-463d-f3a7-08de21d97a9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Chr7kuPHwSmrOW3fu4daLM2bZj+xl3vtqgGCRvOJq62ZlEFQGaq5ObuBDU?=
 =?iso-8859-1?Q?NK9dhLwQoqmNoTKMVsCBYnDxYOQyWi/+sR3l9LouS52j72nuud8MVqHdMA?=
 =?iso-8859-1?Q?u9owY12NFjKzoMIhJpiADXVy1uuEAJ63Jbepq1UdIueetspsDWEA7aEHPN?=
 =?iso-8859-1?Q?EQc6HN3xz1mSMIkehrln7w+PtETwBqqMiqqc4kmuq9kniuN7FxVZVZiMNu?=
 =?iso-8859-1?Q?dHaD43yscZTeP9Bwfddd/C4R/JUIpTl5ZwF/JvgKCQGxgZirXNqBLYYRgB?=
 =?iso-8859-1?Q?atUtBqbLwL7TM5ZrssudlqYJhTaFZOgn5RZmyF4FqjDr2ve3BRAaxkeenC?=
 =?iso-8859-1?Q?1koayFURvNm9TmMZuNdivvgPgDq23SYcqg434gP0/v4YpU8hQ99rtOyVdc?=
 =?iso-8859-1?Q?J2Js+1HgUlH61nzSHkregaawBECwq9cty5GY5Fn79E8jXof3ZxjWCf3utz?=
 =?iso-8859-1?Q?pUjt5RDJL2nBEC1gAwKw0g08N6MH4xyeyBNEfF5nrVj4NXfx9JPuXinXaM?=
 =?iso-8859-1?Q?rqIP59Ljj9uRL98f1ir9dsf9NuFEg1CSlo77EGKJxyqIavH1Gw74UHi6Y/?=
 =?iso-8859-1?Q?Gh/dDPKx3o+9sNzxjFVfJtdulwszqJkP3RTeegOURDcknbz5NbcA3sr+Yh?=
 =?iso-8859-1?Q?YvdXvzf6+9CdD6jfwNq2zG143agUL+oJAuIBIIAwNbiNVLGE/JhPEWzXbO?=
 =?iso-8859-1?Q?eJP+z/cfA+cEy2dm2eihPsajHmM8bbHr4jPUf2ANVLY9ZEG8IrhUFqtt+e?=
 =?iso-8859-1?Q?3h5ZCd9WeM21vXG2xDVtD2iN69lx17sx3PBx58/SoIkxI4OzTi7cIGvX18?=
 =?iso-8859-1?Q?AwFwv2rTIY3gy7QaVFVvFHa9AcqEKSJG2S/uoijUGZvHQDA9LWgsnq/0xe?=
 =?iso-8859-1?Q?d63vfk+IzyRJAn5+NqKT3Nl8i8qAM1AREPGpC2B1aMf2F5zQDx8RInevA4?=
 =?iso-8859-1?Q?9xjUJSXWlfuDE6R5dhyVv+PLTB6jia1BHg4kpemRXHNq63IrlBI72EfzKt?=
 =?iso-8859-1?Q?L+f+t7douKSobbsggKMZ4z2OB0ZMYMtCi84T5z9z3oTtN4Yz4NpI6L9YOL?=
 =?iso-8859-1?Q?qFPHT5853KBFW5fkFDD3Tp9COPh5h7s0w5v88yBTY5fhQJlkjpgTv6aLzt?=
 =?iso-8859-1?Q?YPnQbT3+jJ2xj9culfNEsoezwsYc4waGGYxAVXaCP7YmhQShBmxVsOzOw1?=
 =?iso-8859-1?Q?pVL0BqrnyzhdRBHwvJjPGEqKTRjDdeaSPFMvAekBPOeTCTjbykFrJVmDRN?=
 =?iso-8859-1?Q?ghvLpJ/2eXfkhUGxhoGxZ/iQAnzKIIV6NxNNDT1AWb8GOsmxLBlOi2uGc9?=
 =?iso-8859-1?Q?Do4DksL9Fao+L2D4scFjEhZE+3O8GdS+IHkR+3mzRe2YGMZ3EfrvtirDwB?=
 =?iso-8859-1?Q?HPNQi9Lfbv/xP+m4llMCAKG/B91XXo6Go7aOkg+e+G/sg4No8UH/YNFN/+?=
 =?iso-8859-1?Q?whD4PDW4swosv7J1LiaY7C0eQcNgLcTFSxstLTzi95dB33OTP9rsOvLUeT?=
 =?iso-8859-1?Q?SKRFwOOVcuFRkr27fdPuljTkorATUP0RG+MlEaxR+J6dZXGz5J0DYwa1QW?=
 =?iso-8859-1?Q?O6NjmrruoxdGL2y3G+lmuj68mv9U?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?euEOK8VJiDGSt8X31jLxDhxkhZjrFCa87PNb6I8JSnRzD8ncTiD4kQgaEz?=
 =?iso-8859-1?Q?F3IpRRk32XPtSJWmeqtrKTgnw+hVXC/tRTQyzywVxtNalccNpiam+kxhny?=
 =?iso-8859-1?Q?hV/oetGMZVhf72vsL1nVV9MJVFaxkhn6xq7V1hE+PxHxk7cvWFA5hM97I2?=
 =?iso-8859-1?Q?I4RrwPdvhjPUpFtcRYiTL+hd371A7IkkHEurGQygfzAmLtmqqtYRvJhALC?=
 =?iso-8859-1?Q?KFtGLfyjxwPka3Z+EB4AstRSOU3yrL//eRfX0LyPJ15FFjY8B0QTGvtppV?=
 =?iso-8859-1?Q?41gY/KVKLCz9VEmDDVrLnLWBWy8ZcT0sGrijU2POyBn0i+PiG+UGsRMspF?=
 =?iso-8859-1?Q?841NDcxwYpq2L/M/r2CReVPlAAWL17okyTWjSOJafBYZChXCZhWodYggkY?=
 =?iso-8859-1?Q?C20/HdjVEqiuw71pi5ZhXHap4Ma76GPrJVjVQS/aQZouHnSYa0gIllV6lq?=
 =?iso-8859-1?Q?HXVVd7U/RgT+tkABSrVHBL6DnK7LtYNVYdftIeoi+xeCYpYR8xCMkuhAvH?=
 =?iso-8859-1?Q?z4boFB94TNqH6JR4ZMD2SQdHv4YeAkINuCXWe8UDgzTF/KElLRFFEt9Qjw?=
 =?iso-8859-1?Q?/EDfOskzDSkBZToaWe3gEaVm/Y16yxAuRfUNV83Q3t0mMJLPbePS40CGYN?=
 =?iso-8859-1?Q?ofQa4noZx22Lg6UYB4CwM2i3SX+OYjk9DhM8iocX+VDkC8wfP9Bc0LmM5Q?=
 =?iso-8859-1?Q?e7LQx4fkjsNAxqB8/HmgqdlSkhIoKV6zu98Ma3Z5lZUGCoJFcKGn5ngaI6?=
 =?iso-8859-1?Q?JIXD8pq6+9nfI58WqdKxK6vQsnlVzKL5q+tMXm1jBneHrP8MATyp/E0sts?=
 =?iso-8859-1?Q?kVaS4mg/9fbWBPhhcL/vNU9yvLsty2FhA6VIMDb4iBF+FfxW6QCzGn9jOc?=
 =?iso-8859-1?Q?ArHnJDO8uJXdSFITgqtw/KXyMh37ppzG+z9bU8tloH6lGSthp+1zr3pokK?=
 =?iso-8859-1?Q?fp9sPrbA3naMY9om/Id+1yCFERBXnOAFGgGETLWOk+MLFnASjc/FmZZ4V/?=
 =?iso-8859-1?Q?cfdMBljUGee7iru2fEvn0UM4y+EWdFYwdazvTqY/VVPHJHWZ78KVsWCQ5U?=
 =?iso-8859-1?Q?RO819bsV0thocZWo5m/O4iaYNYaVUroxzV5UaHbmlAITgv5nqLiW8N4XwF?=
 =?iso-8859-1?Q?XVNaq/kbqxP73uy76tKZnOco7LcNIFfxlhMuVrdFJksDcz5zVTMzci/ujL?=
 =?iso-8859-1?Q?VGx1zEMK+bAry9/NRw7ujQ8leZRciNUYV3zF/odDh4XS2EXoz5ESYH6XQS?=
 =?iso-8859-1?Q?fLrloJozhKQfFjir+WV1vMK01d1raeOKrAMaacb3XaY6lbQyzyxPN9X/OV?=
 =?iso-8859-1?Q?7V7OIrPdRM4CKBBtzIuo44g8PVowI58fRdQYapBuNExlP0GOi2ogD3ZdB9?=
 =?iso-8859-1?Q?Da5xNLSN+xITcGz/dcZklW23AXEG4XB+ruoYX8k9UYPzIUOGqwH3khaV+j?=
 =?iso-8859-1?Q?y1T4xwTaktBhK7BiyTqLfSI9cvRQjdU82guJG3dsbINxC+VLusZZuIubar?=
 =?iso-8859-1?Q?bCUJ7f8ihmwSk0m5pCRXTJu+BS1YCF3wwu8xel9hig41XoY08tbzLxqYhV?=
 =?iso-8859-1?Q?7eqTU48vxNpGeyItLWvNQOWZf4+TD6d4OIQ68b5v4rjhtspxTDVSzLn50q?=
 =?iso-8859-1?Q?37Hkcso6R94R/3qpZRie+VVbJUGLqQyNURybVlhmLZ/rVXDMBzP24crA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28371c27-a8b0-463d-f3a7-08de21d97a9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 10:51:48.1152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l5FLPJZUFgD3iE5eRA1Q4RFrlG7pSqeuJWkOqEp91KdRQnJdDP0yzUAwwmAPkM7tCJbOxAqgdJeLNeU8faecng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9786

Move IRQs from dying CPU to the online ones.
Guest-bound IRQs are already handled by scheduler in the process of
moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
itself.

If IRQ is to be migrated, it's affinity is set to a mask of all online
CPUs. With current GIC implementation, this means they are routed to a
random online CPU. This may cause extra moves if multiple cores are
disabled in sequence, but should prevent all interrupts from piling up
on CPU0 in case of repeated up-down cycles on different cores.

IRQs from CPU 0 are never migrated, as dying CPU 0 means we are either
shutting down compeletely or entering system suspend.

Considering that all Xen-used IRQs are currently allocated during init
on CPU 0, and setup_irq uses smp_processor_id for the initial affinity.
This change is not strictly required for correct operation for now, but
it should future-proof cpu hotplug and system suspend support in case
some kind if IRQ balancing is implemented later.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v3->v4:
* patch introduced
---
 xen/arch/arm/include/asm/irq.h |  2 ++
 xen/arch/arm/irq.c             | 39 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/smpboot.c         |  2 ++
 3 files changed, 43 insertions(+)

diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 09788dbfeb..6e6e27bb80 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -126,6 +126,8 @@ bool irq_type_set_by_domain(const struct domain *d);
 void irq_end_none(struct irq_desc *irq);
 #define irq_end_none irq_end_none
=20
+void evacuate_irqs(unsigned int from);
+
 #endif /* _ASM_HW_IRQ_H */
 /*
  * Local variables:
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 28b40331f7..b383d71930 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -158,6 +158,45 @@ static int init_local_irq_data(unsigned int cpu)
     return 0;
 }
=20
+static void evacuate_irq(int irq, unsigned int from)
+{
+    struct irq_desc *desc =3D irq_to_desc(irq);
+    unsigned long flags;
+
+    /* Don't move irqs from CPU 0 as it is always last to be disabled */
+    if ( from =3D=3D 0 )
+        return;
+
+    ASSERT(!cpumask_empty(&cpu_online_map));
+    ASSERT(!cpumask_test_cpu(from, &cpu_online_map));
+
+    spin_lock_irqsave(&desc->lock, flags);
+    if ( likely(!desc->action) )
+        goto out;
+
+    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
+                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
+        goto out;
+
+    if ( cpumask_test_cpu(from, desc->affinity) )
+        irq_set_affinity(desc, &cpu_online_map);
+
+out:
+    spin_unlock_irqrestore(&desc->lock, flags);
+    return;
+}
+
+void evacuate_irqs(unsigned int from)
+{
+    int irq;
+
+    for ( irq =3D NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
+        evacuate_irq(irq, from);
+
+    for ( irq =3D ESPI_BASE_INTID; irq < ESPI_MAX_INTID; irq++ )
+        evacuate_irq(irq, from);
+}
+
 static int cpu_callback(struct notifier_block *nfb, unsigned long action,
                         void *hcpu)
 {
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..46b24783dd 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -425,6 +425,8 @@ void __cpu_disable(void)
=20
     smp_mb();
=20
+    evacuate_irqs(cpu);
+
     /* Return to caller; eventually the IPI mechanism will unwind and the=
=20
      * scheduler will drop to the idle loop, which will call stop_cpu(). *=
/
 }
--=20
2.51.2

