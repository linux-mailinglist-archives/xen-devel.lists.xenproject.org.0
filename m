Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C354D3FEAB3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 10:35:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177164.322421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLiCD-0001YA-1D; Thu, 02 Sep 2021 08:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177164.322421; Thu, 02 Sep 2021 08:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLiCC-0001Vb-Tu; Thu, 02 Sep 2021 08:35:40 +0000
Received: by outflank-mailman (input) for mailman id 177164;
 Thu, 02 Sep 2021 08:35:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLiCB-0001VV-MD
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 08:35:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61649c31-d848-4c36-a8cb-50d2e2728f10;
 Thu, 02 Sep 2021 08:35:38 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-WLfgfpoDObGdH1pRwezw8Q-1; Thu, 02 Sep 2021 10:35:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4382.eurprd04.prod.outlook.com (2603:10a6:803:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 2 Sep
 2021 08:35:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 08:35:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0113.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 08:35:29 +0000
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
X-Inumbo-ID: 61649c31-d848-4c36-a8cb-50d2e2728f10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630571737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WA1KAMRckXvuUXmqZbyvq0j4l0CKS5BjF16pVyrhqnE=;
	b=l0KzgmUbnDjAa4c0c92ZIOG9cY8Js3XZN98MiqVOQXq4ylEH3DG1UtjjBbDltGZbAUAzUO
	a2thv3prkpIb6bSg5Ovkz1SGdvXsbfdhznMZ7XHkStQR1jLWwY4dcd8c3AMfU3yCvU+pKQ
	RrrLl+leruAHEGbmMdkKNNESUQDti8Y=
X-MC-Unique: WLfgfpoDObGdH1pRwezw8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgeD+kR1iFq0fUzJG7/zgifj1bz42Y7p2u26lBTkipvySMyy5MAhDAlCFtnvxt/asK6FwWehwRf8Grv4pDJc6ncyO8acE8UxX7LPyvJbL8C/KkQ2bRlW/lldNU5x20k3CYrSQtaxtCHm5eGyt9xwv5bdJpiNxqUAfMhsVmVhhzEd/RjnsHnxEvkdGYZeaQkGwb4acj5vwPaWtbWYDyjDtr4PrZgxwVDrNQi775M9li80jbYBqYM2/Z1zoY+tl4Dheea4n/je4nMxHGtMWneMqmbtMjA2AT7aZxfDFz0Iui5mZMROfVkXg6Si3JXrXAOFallipkqWaGfrTWh7QxTKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WA1KAMRckXvuUXmqZbyvq0j4l0CKS5BjF16pVyrhqnE=;
 b=LlDIJJzGwrLpIejPSQto09A+luKjSqvO85sFz+h9Ae5jsLWPqQXx8xdRj+oHCA4dOXD7W+Yedx0oQ74T+x5LFEYfRPiJZ7suc+gfRraWS0jr8E3GXODBAHpqrQpQlbhG4yNO34j8Pc+MHGh/NYaRAd4MlJfsqtOdIXPDXVDktUWDhPD79lRka8DYsWZ4vxunmS+onSQJiWIlpkwxGgJDNQRwXOurIQWtv4yguUS1AKyXQ0rBXrBcaNdDB4JTCyFJghe842o9FfAjv+DoZAqUeFJfoSXRQ13vbYTORfuODqfUs5gOxz4uzoPMcY8VNp5PRyLBXu5P3/ga1Ch4NFHsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 5/6] x86/PVH: actually show Dom0's register state from
 debug key '0'
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Message-ID: <f8e599d1-e6eb-19f9-aa9d-c217376eeab0@suse.com>
Date: Thu, 2 Sep 2021 10:35:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0113.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1203fff-04e3-4fb5-3320-08d96dec9f9c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4382:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB438207D39A0F34DA379A7988B3CE9@VI1PR04MB4382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1kujJhewmYX+Uw+noRoRi+x+Ilvv0mAPF2HIKZBEKac22XkThkOwvpReFnTUKEqZPO/15SCA5Y3Pui0aG7O7Lr5+jCkAxL+IvDZmUAuGB5CrHXUYcM99Il3kKpfEZW97x92aAz5mcnAUtE3BYWQbHSOaGhdTpaFBV5yWJN+7NScuHTgRQS/th/qbBWKXmU0NP1F7pGf4jbInKUOLCegKl6/1CgOTqBRV3wy39vVbp/JpN3dtWv5eQzueLKkoHQJZkbP7yiKwoV/x7SFPp1lY3chMepyjd28Z1Fn1zFLSPNDavx9T1tu/2dvD/YemhntkLV7uiyzvzFKZLSCRMYsIoUcWM063GhaFycO5IKzTT5hd+dNWhGGqM3V57UIRlQQh0OfVypemmB7s6REen1tpILPNOPDehPTsMsVWdXOR+lJzuv4fGEd8cLJV0v8uvrNoZY2JG2VuEsF/1/VEZ5QPYx4Ofj9gPqMB0VdfoOPTVMpTUf0cyRGEemm7G3iuxlsCaLWZ+efjpuvRo3ix/G1cA7baPq20/NV6Wsgo4wAuy/cKuB8zj4ShIaYKz8OTzBlLqN1ot9CYOlYyo7o8B6ZG1/JP+ghhPvSqqjY+uZGXwhxqkh2eY/xAXPzur1hwj53yGyy7BsaLhL+URaYMjVjxqLoqF7XWrMgcUSYUV7OiH2HglqdyDOP5jnSfhk0sDg7eNHJU+CwtxhW4mymai2OUZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(396003)(376002)(346002)(31696002)(66476007)(2906002)(186003)(66946007)(38100700002)(26005)(66556008)(5660300002)(478600001)(4326008)(31686004)(36756003)(8676002)(6486002)(316002)(16576012)(6916009)(8936002)(54906003)(956004)(2616005)(83380400001)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW1xb01rVExQNTZqVk12TjlKaURVTlRYUVVlNTFTeEdha2M0QXlydlFHaFdr?=
 =?utf-8?B?ZmcrRFZLam1mTGNNdkllZlppQlZvTXBQRzdOTUJVNmZmVzArdXllUnA4K2RH?=
 =?utf-8?B?Z2wvUUp5UmlXT1Zod0JWZmhyemV1L3hhZTJlaHFQU0UyVHlNUnZHL3ErR0VS?=
 =?utf-8?B?L0RsRkdaK2xEdDBNS29qeVdIWlZjKzNpbjA5Qk5ZTHh4SzZDdEdQZWlJLzk4?=
 =?utf-8?B?aWxJdnJteUFYaHhTeFlOOUxPZHJyeWJ1T05MWFRxemRORlpCSHByaWZkSmpY?=
 =?utf-8?B?SGhQMEFzRGYvQmdrOWswdmRYcEppWE9QalAzM281ZGJodEFMSHUzYzJ4a3FF?=
 =?utf-8?B?Mm1YOTd4REJxWFdsMzFheEVMNFNnMjU4NUgxRHZNRWNRYUNPNG5jTENaNlVO?=
 =?utf-8?B?dk04UEZDTHo3ZmxmREdGYjJ4TFRDVGYva3VlWkczdzdGVW9hblFTRmVTYnNY?=
 =?utf-8?B?dC9PTjlyaDNoNjZwdlJScmExeHI4WEppQ2s0MHBvdmJ6SDFzR2hIS3lIak8w?=
 =?utf-8?B?MVpBWnJ3REo0bFFPNFlEZ2s2UTgwK2FOTGRDbTcvUU9rNVVLTmZqNGF1WFlD?=
 =?utf-8?B?NnFxejBZb2owU1MvaEJuNCtSUWZDQ3Q5Z3NXUHFpYUZ4cm8rYWt1RTNNUUx6?=
 =?utf-8?B?cncyZGdXRnlRZU5hazNVdUFBMzVzMVBlUExpUzllMW9VL1d5OUl0UVVDZ1p5?=
 =?utf-8?B?VjgveWw0WlhLbmIrbTFsb0RTU2dCZmNLcld1VHE1UENKeXlGR0FWQldENGsy?=
 =?utf-8?B?RFBmTW9HQWs2QS9wSzA0c3NvU3RyekFnQkN4L0NFZmtjZ0xiOWJHbjlDWkdL?=
 =?utf-8?B?Rjdrc1ZHTGJOazRiL3kvWXhGRm9TTFcyTEcxekt4MGE0UjhKRElDc09kaUlP?=
 =?utf-8?B?UzJKU1FWTllSdW4zU1hVVEpOUUxoVEpIek5mck4yNHA5cFFQVWJidFplT0Vw?=
 =?utf-8?B?T2tuVmZoTVBIUmY3RkczNDRPT0xWZ3hCei9tTVJKb1I1eFVjY2lOVW81a2FX?=
 =?utf-8?B?VUZ0elhqL3M0NERyTlFIUExwY3d3Y1pZc0VPK0F2NTR1SS9Qdm5YWFgvKzdB?=
 =?utf-8?B?aE1ldjFKTVY5bEYyYTlpc21HL0pjVjNOVDJOYnFqZGREcjRoaHhoQjh4Q250?=
 =?utf-8?B?aCswM25PM2l1TDlPbDNzeDl1ZkVVUjFyUXdNMi9ZcnNPellucVJmWFRkUTFo?=
 =?utf-8?B?Q2dScVdubGxJWVU1eDB0eTZuRzRQaE1ubTcwWEhjNkNoek9Lbk9nMGxReExI?=
 =?utf-8?B?NkhrMGg2U1VqMHZNVzRvbEFDLzNpck5vSlRnWnNwS3NuRndlaWVsWHFXMmpV?=
 =?utf-8?B?dXJqWG1vaWFVdmc4c2dFSkVUUDFMcmdNMnFMbFEvc2hXMmk2eDRIUmUycmFm?=
 =?utf-8?B?Tys0R01seHB5OFoxQkQzaHQ5RTFkT2F3YzdvMnBKS0dBcEhvenB5bG52UzZq?=
 =?utf-8?B?K01sSURVUGRVMS9Kd2Qvb1FpNFdEZjhpUnI5SUZtN3RpN3dmM09IWXY3ODk4?=
 =?utf-8?B?V0dTV0Zac20vN3k0U0l6dW16c1plWmsvelllK3FHV05oa1FDY0V4NzZ1NXY1?=
 =?utf-8?B?cXlCZytJT1FzQkl4T1o1ZFVaTDZieXpzdEdZRmNkT3cvMFdRaGxsclY2Z1NS?=
 =?utf-8?B?RDFSK2g0OXFidlIva01PZVRMR2RxZXlsL0ozK3A1WEFVRDZ5N3RDN1hrNHVL?=
 =?utf-8?B?ckprL1gyaWdJT3U5WnFjOTdUMWYwSmlOTTEwWVg5MTNuL3FLWVAzTGtGZndN?=
 =?utf-8?Q?JrH28oUtXR9viFbSvsubGlI8eLp5WgE+okcIgK9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1203fff-04e3-4fb5-3320-08d96dec9f9c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 08:35:30.8818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcQ/uPgMGbWDlFY+ZF5tk7X9RMxD/7loktpn1QcPD/55qFIiyM6jj3egHPLRy7v5hyUtWM2r5B3O3CL/x5GbqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4382

vcpu_show_registers() didn't do anything for HVM so far. Note though
that some extra hackery is needed for VMX - see the code comment.

Note further that the show_guest_stack() invocation is left alone here:
While strictly speaking guest_kernel_mode() should be predicated by a
PV / !HVM check, show_guest_stack() itself will bail immediately for
HVM.

While there and despite not being PVH-specific, take the opportunity and
filter offline vCPU-s: There's not really any register state associated
with them, so avoid spamming the log with useless information while
still leaving an indication of the fact.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was pondering whether to also have the VMCS/VMCB dumped for every
vCPU, to present full state. The downside is that for larger systems
this would be a lot of output.
---
v2: New.

--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -49,6 +49,39 @@ static void read_registers(struct cpu_us
     crs[7] = read_gs_shadow();
 }
 
+static void get_hvm_registers(struct vcpu *v, struct cpu_user_regs *regs,
+                              unsigned long crs[8])
+{
+    struct segment_register sreg;
+
+    crs[0] = v->arch.hvm.guest_cr[0];
+    crs[2] = v->arch.hvm.guest_cr[2];
+    crs[3] = v->arch.hvm.guest_cr[3];
+    crs[4] = v->arch.hvm.guest_cr[4];
+
+    hvm_get_segment_register(v, x86_seg_cs, &sreg);
+    regs->cs = sreg.sel;
+
+    hvm_get_segment_register(v, x86_seg_ds, &sreg);
+    regs->ds = sreg.sel;
+
+    hvm_get_segment_register(v, x86_seg_es, &sreg);
+    regs->es = sreg.sel;
+
+    hvm_get_segment_register(v, x86_seg_fs, &sreg);
+    regs->fs = sreg.sel;
+    crs[5] = sreg.base;
+
+    hvm_get_segment_register(v, x86_seg_gs, &sreg);
+    regs->gs = sreg.sel;
+    crs[6] = sreg.base;
+
+    hvm_get_segment_register(v, x86_seg_ss, &sreg);
+    regs->ss = sreg.sel;
+
+    crs[7] = hvm_get_shadow_gs_base(v);
+}
+
 static void _show_registers(
     const struct cpu_user_regs *regs, unsigned long crs[8],
     enum context context, const struct vcpu *v)
@@ -99,27 +132,8 @@ void show_registers(const struct cpu_use
 
     if ( guest_mode(regs) && is_hvm_vcpu(v) )
     {
-        struct segment_register sreg;
+        get_hvm_registers(v, &fault_regs, fault_crs);
         context = CTXT_hvm_guest;
-        fault_crs[0] = v->arch.hvm.guest_cr[0];
-        fault_crs[2] = v->arch.hvm.guest_cr[2];
-        fault_crs[3] = v->arch.hvm.guest_cr[3];
-        fault_crs[4] = v->arch.hvm.guest_cr[4];
-        hvm_get_segment_register(v, x86_seg_cs, &sreg);
-        fault_regs.cs = sreg.sel;
-        hvm_get_segment_register(v, x86_seg_ds, &sreg);
-        fault_regs.ds = sreg.sel;
-        hvm_get_segment_register(v, x86_seg_es, &sreg);
-        fault_regs.es = sreg.sel;
-        hvm_get_segment_register(v, x86_seg_fs, &sreg);
-        fault_regs.fs = sreg.sel;
-        fault_crs[5] = sreg.base;
-        hvm_get_segment_register(v, x86_seg_gs, &sreg);
-        fault_regs.gs = sreg.sel;
-        fault_crs[6] = sreg.base;
-        hvm_get_segment_register(v, x86_seg_ss, &sreg);
-        fault_regs.ss = sreg.sel;
-        fault_crs[7] = hvm_get_shadow_gs_base(v);
     }
     else
     {
@@ -159,24 +173,35 @@ void show_registers(const struct cpu_use
 void vcpu_show_registers(const struct vcpu *v)
 {
     const struct cpu_user_regs *regs = &v->arch.user_regs;
-    bool kernel = guest_kernel_mode(v, regs);
+    struct cpu_user_regs aux_regs;
+    enum context context;
     unsigned long crs[8];
 
-    /* Only handle PV guests for now */
-    if ( !is_pv_vcpu(v) )
-        return;
-
-    crs[0] = v->arch.pv.ctrlreg[0];
-    crs[2] = arch_get_cr2(v);
-    crs[3] = pagetable_get_paddr(kernel ?
-                                 v->arch.guest_table :
-                                 v->arch.guest_table_user);
-    crs[4] = v->arch.pv.ctrlreg[4];
-    crs[5] = v->arch.pv.fs_base;
-    crs[6 + !kernel] = v->arch.pv.gs_base_kernel;
-    crs[7 - !kernel] = v->arch.pv.gs_base_user;
+    if ( is_hvm_vcpu(v) )
+    {
+        aux_regs = *regs;
+        get_hvm_registers(v->domain->vcpu[v->vcpu_id], &aux_regs, crs);
+        regs = &aux_regs;
+        context = CTXT_hvm_guest;
+    }
+    else
+    {
+        bool kernel = guest_kernel_mode(v, regs);
+
+        crs[0] = v->arch.pv.ctrlreg[0];
+        crs[2] = arch_get_cr2(v);
+        crs[3] = pagetable_get_paddr(kernel ?
+                                     v->arch.guest_table :
+                                     v->arch.guest_table_user);
+        crs[4] = v->arch.pv.ctrlreg[4];
+        crs[5] = v->arch.pv.fs_base;
+        crs[6 + !kernel] = v->arch.pv.gs_base_kernel;
+        crs[7 - !kernel] = v->arch.pv.gs_base_user;
+
+        context = CTXT_pv_guest;
+    }
 
-    _show_registers(regs, crs, CTXT_pv_guest, v);
+    _show_registers(regs, crs, context, v);
 }
 
 void show_page_walk(unsigned long addr)
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -631,6 +631,12 @@ void vcpu_show_execution_state(struct vc
 {
     unsigned long flags;
 
+    if ( test_bit(_VPF_down, &v->pause_flags) )
+    {
+        printk("*** %pv is offline ***\n", v);
+        return;
+    }
+
     printk("*** Dumping Dom%d vcpu#%d state: ***\n",
            v->domain->domain_id, v->vcpu_id);
 
@@ -642,6 +648,21 @@ void vcpu_show_execution_state(struct vc
 
     vcpu_pause(v); /* acceptably dangerous */
 
+#ifdef CONFIG_HVM
+    /*
+     * For VMX special care is needed: Reading some of the register state will
+     * require VMCS accesses. Engaging foreign VMCSes involves acquiring of a
+     * lock, which check_lock() would object to when done from an IRQs-disabled
+     * region. Despite this being a layering violation, engage the VMCS right
+     * here. This then also avoids doing so several times in close succession.
+     */
+    if ( cpu_has_vmx && is_hvm_vcpu(v) )
+    {
+        ASSERT(!in_irq());
+        vmx_vmcs_enter(v);
+    }
+#endif
+
     /* Prevent interleaving of output. */
     flags = console_lock_recursive_irqsave();
 
@@ -651,6 +672,11 @@ void vcpu_show_execution_state(struct vc
 
     console_unlock_recursive_irqrestore(flags);
 
+#ifdef CONFIG_HVM
+    if ( cpu_has_vmx && is_hvm_vcpu(v) )
+        vmx_vmcs_exit(v);
+#endif
+
     vcpu_unpause(v);
 }
 


