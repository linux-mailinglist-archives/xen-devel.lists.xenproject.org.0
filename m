Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6874CFEFA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 13:40:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285982.485282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRCem-0007hc-28; Mon, 07 Mar 2022 12:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285982.485282; Mon, 07 Mar 2022 12:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRCel-0007fT-VM; Mon, 07 Mar 2022 12:40:07 +0000
Received: by outflank-mailman (input) for mailman id 285982;
 Mon, 07 Mar 2022 12:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRCek-0007b7-Mx
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 12:40:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6e7cae0-9e13-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 13:40:05 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-S2bDrfhxNbCTtJOEA6RXpQ-1; Mon, 07 Mar 2022 13:40:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 12:40:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 12:40:02 +0000
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
X-Inumbo-ID: b6e7cae0-9e13-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646656805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YEKtCAuOOZJ7TSZFF1yLRHnEVddhkovDTQcW6zuHdVs=;
	b=Kb6aIm1Mm1qbsIiyw8Xq4U73OccQBOwCetZKn9djRhqhdKLRujrn1PsnM9CCljtXco19+k
	i3vWVMDPiwumSRzoFEUpTGK7yQSo69nHu5deLHA2hWKwZjcDX2GXeavRxM6/EsLT69mi7R
	pmG2WkHkCB6MjiLTSvewwZI3r20uyug=
X-MC-Unique: S2bDrfhxNbCTtJOEA6RXpQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmS5nC2JdFyGEK1dINx4/jsL0b/whqZlqMXn+Uayrp7tMbBmzjpmZd5RanHvZ7qGnfTkmWxsox0KLWhIAALzLjWPGvEqUyfIkNesL9m9y+o9Cz9MiX3NScZsX/b0AygdAoH1QIHoM4Lut1rJWkdUB1dItJDxKUIIhme0koU7PjhDsz810hGsjfHslGOrcM4wcKVLCmcNdJ8LAd14J1OiLT3sOA/2lBAvZTnXbyC98pl/W6lBiuy8TEyGPuprmhEaL9Pz4uR/ttqWmm4xFXGobwmiVMFQzrWs8kYuS8g4LktRdSrKbCkmNoYSNybHP26oGlEScsrY8+ThdBGkgNKp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEKtCAuOOZJ7TSZFF1yLRHnEVddhkovDTQcW6zuHdVs=;
 b=JFAtVSv8GZMlEmDE5xKXETuvcv3fex20/m0TLN5bOxRokZ035rdLrF6tUv4cc8wjDIonmogTlv+6oR35vUbfwyiy/T2Vk2HNofKmYY5MT8WT/1SLCzWenS5X7EOE+I805f6nIARTyBD9OxECjsANC8B175ShD2oyYveYsdC5PQItAqcK7UplBWRBeceCux0Ca4qEYhx12kf58EiRQFqFyT86o5/JCKOQzeITs1QUc2r5ii840V4i+WJqQS48a3WRkdZKz/vXGt733sUhF3QpC8KikyZ5/FO585socdWOsrNMaBlw2ib4QTNm5tdfk/OFYHv2aIlKreEdwWfH2/KWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <67e34863-74fd-6d7f-8b63-26f45bf0426f@suse.com>
Date: Mon, 7 Mar 2022 13:40:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] IOMMU/x86: tidy adjust_irq_affinities hook
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0009.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d872c7dd-3f7c-4691-f897-08da0037995d
X-MS-TrafficTypeDiagnostic: PAXPR04MB8605:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8605DBE229CDA5F7EDE4473DB3089@PAXPR04MB8605.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6uQysCJ4rHDO5J5RP/01BLg2Gm0l6boN8pMdLM6LWrl96dFkjdPRHpmP94sgnrjGtgRDBhOpJhBPeEBqSVcsCXG0Ycj7EPvBbxmSe5X9yVL4KLdYFoloEUaXS+LYz08lLmhjUJezB+JkMtMK/Nhlcyzm3/s49LGM5cGR+uAXKkgtAVOtLK+cqoigstq7MHUqqbSqzqM6PRjmk6zUInOLDjg8B7PWSo5Y1bWITEXv+dUBFseSOgg+Rw3guWlJQUb62/KNwu/XvamOwhb2gcF4oH10h0BlnmTS82nq8mMIqYYsRBDIYGxK5+0YKQ6WSc3MUgJVQJX28U/JEWgMIYjMUBF6m0k8Qb2qOtHrtAI7ARhkLP5p3a8NmLxTVaqz51kiGTHx4+TT0HagxnBwj6SoGV/UBLCiohhcWQRRFQdj2woKMmOPtcyfRE6FR88pVKTu5TrqulfYthFcXTlOUU498ebSzfLMZNeuNFzcsygnnRKY/gF8uyBLeou9tfhecV/nUW3RbWE3ow8S2oAKrag4nlcf6UvgI8LoCPDFaSMd1/6Q1UZmtVd+RCrTuxoLb4Q+CM62Xfg66RI0wWOZXhVLzr3/JxNidoqAXcZO/GzwJontCaQeKDCkjVnd6V3TpUoc2/0QT0qE+CedKVF72hKONTZly1QnzhOPd9iqNMv8Rct92DlCID3700uZ3S7XxPEHqG6vAaeoL/cBEbRX2mTDtfaPj+1+Pi/QUoSgQYPo+KO58p3UFFoLpipS2EFiON0w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(8936002)(186003)(2616005)(6506007)(36756003)(38100700002)(26005)(31686004)(83380400001)(6512007)(8676002)(2906002)(66946007)(66476007)(4326008)(508600001)(66556008)(5660300002)(86362001)(6486002)(316002)(54906003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmU1UTl0bGJQS0xmRURpOHA2OWpNSThXRDhqQ0djdWx4dUxTU3Z3bE1LR1Rt?=
 =?utf-8?B?YjFQMTJ2aklaZ3k5TS9IZGJONlhhTlRQQ3h1RmZ0eW9SZnViUk1DQlFyUnh0?=
 =?utf-8?B?aDV2YzhEc3FQVzlJVDdwcTh0WXJlWWpMTXJKS1haQjNzT3ZqVFRycmxORGt6?=
 =?utf-8?B?ZUdwSXowRUttQnJKdWJBckRsUHpvcm1VZ3dSdERsYU95SllBSlIwZFhyNXFj?=
 =?utf-8?B?V2l3M1BmaEhwMWt6ZG8rbzc0MWFXVXBqZjZOTXg1YS9lclcwTmlPUk5EWi9q?=
 =?utf-8?B?NWRQcitwaTZ6NlJ0MHFXSW4zMVh0bHkxV2N1SG41cS9mZm1Hd2NpSEN6NEZs?=
 =?utf-8?B?UmhRak1zN0hlSjNBb0tyVnpoOUd3R0x1MStvR0ZYWGR2N3Q2WmNtQTNnU3V2?=
 =?utf-8?B?RzN6LzZJc3BsNkNhSkcwcWQ4ZThMTUREOXlxN3lhcEd5eWJGUDZOY3gxRStX?=
 =?utf-8?B?Sm1LclZJaEN5Z2NmS3R0ZGcxWGtMK0VyOFZoOE1mckg0WlQvWCtyeE1DM2dw?=
 =?utf-8?B?c0ExcmtFU2FMOHlnU29xb0lxazh6WlZzaytPczY2OEpiZ0ZFLzA3NVFhN0NC?=
 =?utf-8?B?Um96WUdJbkgvNkdOVm1Gcjgwd3lFckNlVzFURUZncGt6OG5OTFFQVHpudVhP?=
 =?utf-8?B?TDFmM2I3Y3NYeDRyZFJoWG91bTZUZ096VTh0OHh2MXVrblB6WVFualNHRG1h?=
 =?utf-8?B?MmcrNmdXUlZ2T1FQTzFRbVVKdDQ5V01qVWs5V1d6MGthdkpjd2d3Q1p1SWRC?=
 =?utf-8?B?d2RCT2NsMjEvYlFUdWUxaHQvbS93eHE4OXMrU3ZvenhBenFwYTRyRUMyeXNk?=
 =?utf-8?B?R3hmaFh2MUhHbTdZL09ZeEN6Y25RNzB5WGFaYm5zeThMSi9WVFdjVUhrbGRZ?=
 =?utf-8?B?YUwzbVd2QnU3d2JXaFRTWDJUaTcyV2dxUEdCTjlFbk4ybmNyUXRXRDd2Njh5?=
 =?utf-8?B?dTRIbmFUVmZRL2Q1VkRsT1FaaHN6MHIrdzZ0ZzVPM3VXS2Ywcm9RcWJyWE4w?=
 =?utf-8?B?aytNUytuV2ZEWUF6dmhya1ZwTms4ckRnRkhETURrd3dReDdsOWpHVUtFRlFn?=
 =?utf-8?B?M3hsZWxGTldnVmpZOUFiNGdWc2N4eHd0aDlaakNsWUpmVG96VXg3dEk4M2x1?=
 =?utf-8?B?bGNvVm1vZ3FNSGdzNnI0MXY0SjhMQ1BrbTROOVRiWURSQVhNSmFnUGsrVUhO?=
 =?utf-8?B?TU9JbEhvNGFaaFNxUUxRTmtrR0NVY1Z3NFppU004QmZNOTljV2RMNmcrZzBs?=
 =?utf-8?B?ZlVzYW5wZ1MvVk9LaVF4Q1JXRDdKeURoUU1ZS0dIdzRjekZ0NUwxWHk2bWZv?=
 =?utf-8?B?dTZWRXl5cVdnb2owQlhXZDFOa3FCOUF4U2JiUklTbXk0RWtBR29OWDhORGFZ?=
 =?utf-8?B?UmxlZ3VIbWpXUGFVQWttNEhpSm9JdFRLYUhEbUtPc2ZSMFFySFhaWUZMOWN4?=
 =?utf-8?B?MUtnZ0JjVmRHdWZGWlBndmdFUmNIVWZsNkxCYkw4NFBqTWRmc1RhaVFPRkd4?=
 =?utf-8?B?VHA0a3dPMm9pNGNON2xBL2d5OXVwdmtGd3BMcDRlWjF5ZjVSMTh1UVFmWGJC?=
 =?utf-8?B?K2NYZW9RSGpBTHVMb1puMnUwZk0vc2NZK2Z3MENwVnNGZW1NRmpmQ1BVdDdj?=
 =?utf-8?B?cFhrMjJlWE4va0d4emVWZm0ydnhhb2JmYVVnSFo3WGgwV0FXeGhpanhOMWt1?=
 =?utf-8?B?TVNxSHA0ZEFzYUp2bVFPeWcvT2xqQWVFN09vUWJpWVRuYllsZkEvNzhpZHJX?=
 =?utf-8?B?aEpQQU1rU3p5bGc2WmlIcVBUNEFkL2oraDl0ajFia3F1NHZUbkQyMTNiQmtE?=
 =?utf-8?B?VlZncnBkcktMRDVEZWZzZWNNUUI2R3BnVWtOdTF6YUlTV2ZNeGZXRkJoOW1x?=
 =?utf-8?B?RkpmR0lLcDJtbkNlV3J6WjhvMVkzS2JOd1VzUFdQVzR2V1Y5RHpKeTRmMlBq?=
 =?utf-8?B?VGw2ZENQbGNPUXlDUWlyTjBCazF5UWNFVmUvOCtOTXRMbzQ5dmxCTUl6NkxY?=
 =?utf-8?B?QlEzT1NidU9NeUpZM0RVdnJzWUU1Q3FjditPbWw3MXpjMVI2L09rTWxlMWxs?=
 =?utf-8?B?ZmZnYXhIZXZsTEZ4ZkF6NTd0WmkvcGo2VWhlTlZzSG10VE0vRTY4L2NXZWJB?=
 =?utf-8?B?Tm1CSWhSSUEybFMxQU1wYkhTdFgxeExMZDVqOG8ralZmMnM3OUV5dzBEeENw?=
 =?utf-8?Q?EPmCchBWLgoc9xkjwSlyZwY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d872c7dd-3f7c-4691-f897-08da0037995d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 12:40:02.3557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHhkS1PpIPTlxgh3tVe9uJ8P15ZQlXiiEFeA2D/UC8VzpbhkkaBnqnGH+MK7TXJOEjrVCYb9kxJH27i3C2q1cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605

As of 3e56754b0887 ("xen/cet: Fix __initconst_cf_clobber") there's no
need for a non-void return value anymore, as the hook functions are no
longer themselves passed to __initcall(). For the same reason the
iommu_enabled checks can now move from the individual functions to the
wrapper.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -101,11 +101,10 @@ void iommu_update_ire_from_apic(unsigned
 unsigned int iommu_read_apic_from_ire(unsigned int apic, unsigned int reg);
 int iommu_setup_hpet_msi(struct msi_desc *);
 
-static inline int iommu_adjust_irq_affinities(void)
+static inline void iommu_adjust_irq_affinities(void)
 {
-    return iommu_ops.adjust_irq_affinities
-           ? iommu_call(&iommu_ops, adjust_irq_affinities)
-           : 0;
+    if ( iommu_enabled && iommu_ops.adjust_irq_affinities )
+        iommu_vcall(&iommu_ops, adjust_irq_affinities);
 }
 
 static inline bool iommu_supports_x2apic(void)
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -234,7 +234,7 @@ int amd_iommu_prepare(bool xt);
 int amd_iommu_init(bool xt);
 int amd_iommu_init_late(void);
 int amd_iommu_update_ivrs_mapping_acpi(void);
-int cf_check iov_adjust_irq_affinities(void);
+void cf_check iov_adjust_irq_affinities(void);
 
 int cf_check amd_iommu_quarantine_init(struct domain *d);
 
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -809,13 +809,10 @@ static bool_t __init set_iommu_interrupt
     return 1;
 }
 
-int cf_check iov_adjust_irq_affinities(void)
+void cf_check iov_adjust_irq_affinities(void)
 {
     const struct amd_iommu *iommu;
 
-    if ( !iommu_enabled )
-        return 0;
-
     for_each_amd_iommu ( iommu )
     {
         struct irq_desc *desc = irq_to_desc(iommu->msi.irq);
@@ -828,8 +825,6 @@ int cf_check iov_adjust_irq_affinities(v
             set_msi_affinity(desc, NULL);
         spin_unlock_irqrestore(&desc->lock, flags);
     }
-
-    return 0;
 }
 
 /*
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2107,17 +2107,12 @@ static void adjust_irq_affinity(struct a
     spin_unlock_irqrestore(&desc->lock, flags);
 }
 
-static int cf_check adjust_vtd_irq_affinities(void)
+static void cf_check adjust_vtd_irq_affinities(void)
 {
     struct acpi_drhd_unit *drhd;
 
-    if ( !iommu_enabled )
-        return 0;
-
     for_each_drhd_unit ( drhd )
         adjust_irq_affinity(drhd);
-
-    return 0;
 }
 
 static int __must_check init_vtd_hw(bool resume)
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -464,7 +464,9 @@ bool arch_iommu_use_permitted(const stru
 
 static int __init cf_check adjust_irq_affinities(void)
 {
-    return iommu_adjust_irq_affinities();
+    iommu_adjust_irq_affinities();
+
+    return 0;
 }
 __initcall(adjust_irq_affinities);
 
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -267,7 +267,7 @@ struct iommu_ops {
 
     int (*setup_hpet_msi)(struct msi_desc *);
 
-    int (*adjust_irq_affinities)(void);
+    void (*adjust_irq_affinities)(void);
     void (*clear_root_pgtable)(struct domain *d);
     int (*update_ire_from_msi)(struct msi_desc *msi_desc, struct msi_msg *msg);
 #endif /* CONFIG_X86 */


