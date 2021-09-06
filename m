Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4668F401C0F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179827.326230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEF3-0006W7-EN; Mon, 06 Sep 2021 13:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179827.326230; Mon, 06 Sep 2021 13:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEF3-0006Tc-B7; Mon, 06 Sep 2021 13:00:53 +0000
Received: by outflank-mailman (input) for mailman id 179827;
 Mon, 06 Sep 2021 13:00:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNEF2-0006TU-AQ
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:00:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7f79551-92a2-43cf-8f1d-71134edeb319;
 Mon, 06 Sep 2021 13:00:51 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-9Bx13LP0PrKwqSeciJeBJQ-2;
 Mon, 06 Sep 2021 15:00:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 13:00:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:00:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0185.eurprd02.prod.outlook.com (2603:10a6:20b:28e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Mon, 6 Sep 2021 13:00:47 +0000
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
X-Inumbo-ID: d7f79551-92a2-43cf-8f1d-71134edeb319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630933250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbwG033IYOy80/NWLE0KFiBS2xDM7Ke8HGRpzdh07P8=;
	b=XgWq3RIqJvoN4psFBGnchKCfQbvC/8Vta8PECiyF1/8RoOfHmaZxWexuxyco2G0CRhjoNd
	VBmbaz8UpiaZjE8WQIL/NX8NwjqiNsHv2aB/sHDnPoABDalEWCh83pXp5wjVfNE4lyv8aO
	sOOhlD0Jmf8bXIJNvUdk1iCztpU4CWU=
X-MC-Unique: 9Bx13LP0PrKwqSeciJeBJQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFaY0g6K971tMrHClPEJn3tNCVWy2LI8T2tjRGy6BHgpPB4FB4MKe7Wy6mZI4qifrcH3+S/CnUsN7DuggklVQ+yJCElaEH/lPkKFMxBdIz0Chnu+NtHRVuxhZAGQY2o3JMOvzQc5tdQ9dmJ5RVAgICtYP1UF7nJ1qeNmpJ2PNSXAkJnagNIQkGu8ZyMc8EGwoYIzunBVlJN5cz5lilnI9x8c3pOc9xJLUp9lFJNJ7QAMEo9IWOGgB603EMwqsIFw7DQhgzbcaq7aID9DntCXxF3+bSFWHGMnbK+t0EgMDGl/pIARbRsJVzfo+SwiQClGwjxnZFqwWhHzbKNFmVvm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dbwG033IYOy80/NWLE0KFiBS2xDM7Ke8HGRpzdh07P8=;
 b=QVkNP6lP5NN+6SQIXjVDOKxQpBEn9ySo6Qa4+Gj49AEMyj8RQolBr+S/Oz5m5eLffTMqpjkIPtzOePT/YiJVNltyKwh76oZbFPHrkkQ3Bl2oTVnt4g1+vrCNGleu6ibRZvSJnypAbtL+hOSqYFAMcKBsb5Xd67ukHETiDC8VfyLmwc/GAR/zbKjYHuZHiwOFQufO0w45g8vVI0HWFdoPOyhGaeKaBAsJqpx4ThuoYeiYiLVlMQJsub2qB9+H2Obk0fxFOb7HFAdWg+LC9oD9AUGbK3vtoqVCFnhYfAAPCMlN0aRNJofdosJ5kIhKC9fsLxPEUAJK8fRxcOUp4tco+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/5] x86/mwait-idle: add SnowRidge C-state table
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Message-ID: <b21c106b-b852-b4f0-efa9-fb5c465bfdac@suse.com>
Date: Mon, 6 Sep 2021 15:00:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0185.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a5413c7-79c1-4ce5-2931-08d97136587e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608A11A2CBBD78936236FF7B3D29@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UvanncNRt3CVO5T4rfui0iaRvjPOLgPVLYFajDhaE8raOtDWDiFid9eL5OCMnTAPwJPTFEkJ/fVkSd01EZGhsIKu39kgI42aIeeVe6m0Mau29B8Puqd6/JI5TXi3RaLs4T/R2Qw6sGXbWGM5F7qAyBTwh8kO7dgJ0610WFWpo2R+xBtdbY5luhgrAlSsF5dNxOTXJel+XR4vG0K2sKSDvZkOQd/7AroTBsLbCs9VMI1oRBfRWvoFNPST4Q/BnxuUnrPpAip7c/u4CpChdzKSqm3WDkw4G8z7SL+vtRF5bGBP1kIKmiED1/QLuKkEDtCsa0SvdkpzdqHdHTzf/AbqrWlJZjg4XTHp4x/9wU4sUEwLc9UOxYaBhG+1ltjPmoFpA9dOa6lbePFtpx92XFnRf3OHeCMxVFFFuaLMiyhklj7CC/AAhkr6k4FNLAywSSsI0EYz79kscZMb9BgJJ0PksmYTb7EqPk3S0kQyE/brt5HTWFON1YPbOFG9a5NiuHKYZCrqwrsGeKF50r5OLlLxIakCUQcT9+2RgqLmeeb2YCqJ1qHLz9l8Cv+bnmf/ZxOnN7DJwSCCx92GRYOb6rj/KYOcE+8jlsOLCHWLQcIkzBy3XdBx8tXK4dSVMX6Lwg4sxDajZzPK5sysUYN2U52XKwrysxejAkablqoVE8eMc3QPXLt3frMEmvjdkI8LcXxVJrt/aegDYidFiC9A2GPfoP4AYn33NolW8hMXKIrN9lk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(396003)(136003)(39860400002)(66476007)(66946007)(54906003)(478600001)(5660300002)(2616005)(6486002)(16576012)(8936002)(2906002)(31686004)(8676002)(316002)(956004)(4326008)(26005)(6916009)(86362001)(186003)(31696002)(38100700002)(36756003)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGdQazlYVVRFQ2FvcnVYYVRPQndnMUVUelRUSWNFaFdmRWxrcW8vSzJSWGNt?=
 =?utf-8?B?akdHTXp6bzU5c2lQTjdqelZkcDZrSW4wY1NsRXpwcEpxZlBnTGlTZTVTNWZK?=
 =?utf-8?B?KzJjb1k5aHY4QWFnOWJGWWhPSXM3THN6b0k5YmRRa0xJUUpqc1R0dWg1VVNl?=
 =?utf-8?B?cjJpTXZ6cTkzNFhBdlA0NHUyM1FraHJSZ2VabjMvZFZ6azZRK0tybnh1NUVp?=
 =?utf-8?B?ZU9saE44WkJHclJOQVAwbFNWRjBKb24xK3puMTVHWGJya2xqaVkvQWVDMWJy?=
 =?utf-8?B?U0k5VXZNNllVUEdmQWJqYWxTUEtmTEVuWlNtSHBIZFVyTCtINEQ2bWJEVFYx?=
 =?utf-8?B?Q1IwYWF4bkZsbVUxSW13TlpFNEs4NzJKT3Q3OERhaktueU9VM0psYWZLQksx?=
 =?utf-8?B?VDZiUVo5b0l1TG9UWXhTTmZjYzM0UzhUV0dlNXA3cStJZjlXa21WTHhZUkls?=
 =?utf-8?B?aFBwU1ZJejRaa05HM014VVMxd3NQbGhpUVd3VHZjS0FnZ2dSVnJCOXVpYXNJ?=
 =?utf-8?B?aVBKMVNCL055NzRlSVhuQU1zZFpYVFBORDlUUkNWMW03VE9XNFFQdGRURU5C?=
 =?utf-8?B?SmV4V3VjdWVDM2o1MUg4MVpiVjRNbEYzTmN3UnJScTVTYTQvSDl1aHIvN3Q5?=
 =?utf-8?B?Vng3d241UDlUU0U2enFLRGlITFdET3hVblNERU9OaVpNSFd1NnlWUEViVzFL?=
 =?utf-8?B?RGo4ZEdlbndWeVBKbm9jZ1UwaTBnd1U0R2FIM3ljYktOYXNaN3FPR0ZPd0h4?=
 =?utf-8?B?ZnVJdmVROEFNMzd1TWl3OFV1dGFYaityRDFVcDZnMzByRm9ZeE1UTUVvVDV3?=
 =?utf-8?B?VENHRjFFaCt0SFpSR3RJQU5JSkxlUlJRblNnVm93dlJWd0lCbTFWdWdhMXhF?=
 =?utf-8?B?U1VVVTh2eE1mL2ZqTXNBYzlyY1Q0VFBCUS83a0pEdVJzWVhQZDVVeXlxcCtF?=
 =?utf-8?B?cWl2aUFha0FDcEZET2x0ZzBFYXFXbnhsc0p4dk8rRTlJcDU2ZEJMNSs5K1Zx?=
 =?utf-8?B?TFY2UERwVGpJNlBrZnMrWmhrVXlQSzEzVzM4NlhKbm9lVUtTNGFsVmE3dGx3?=
 =?utf-8?B?VkcrL2FLcGZDcjBmMUtkc2dscmpRTUh0NDlSQ3pwY1hZeHh3R2l1Sk4reGNk?=
 =?utf-8?B?TVhscXk0RHc2VVdBbnMyNnJ6UXVGTXJxSWFvTGlyblBrUnBrYTZOYnF3T0tB?=
 =?utf-8?B?dWhUU2JIZW5YakV0c29STmpDRmhMNU1KMnh1Rnh4Mk8rZ1kvQkRqU2YzMlFa?=
 =?utf-8?B?S1J1cVgwczkzc0VXSDZJRHZ3bS94ME5Weks0b00vcEE2dFdMTDBzekRxeVNL?=
 =?utf-8?B?UFNYaUJObmx2eGFvcEVwSDBkS25CWWZHTUtKTmw0SkR1Tm12QVQ0MGh6Tjlv?=
 =?utf-8?B?Y21TQ2NIemU5SE0vK1IyenlsOXQyenhVOWFGTVRkTTJ1YWloRWJoTWVucVJC?=
 =?utf-8?B?U0VOVGdKTXRJZjZWb2VJbW5HQXlHbU84VlB0TE5FOFkrTzRubkdYOGZyQkJT?=
 =?utf-8?B?bjRKMWU0K1pwc3I2UTc2N1hlMi85WXFpMlg4MWY1VlhOSzJOQ0hnQTVGczl1?=
 =?utf-8?B?THp3UU9GRWtsVVFPSHI5Sm1pK0dRdmtjbVFpdEMrVzUvcUpSRmJ2QUJTeTZX?=
 =?utf-8?B?RFNGTVY1VmUrWHZLZTlBVEpWQ3U5aTBaSUVubzRsaE5sNW02UDZTS05GYUFQ?=
 =?utf-8?B?MHRFeExQcDB4OThkVUwvMGE2MUV5NzVnRmFDRjlLN3hHczYwQjBQUXQ2RlE4?=
 =?utf-8?Q?WYU2dVH9UHMJXzxfqcdUVpFYl3z8QEef2XWjqF9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5413c7-79c1-4ce5-2931-08d97136587e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 13:00:47.7291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LM5RyPaoQrPL30amNzacVtuxbHakgb9YTZUAkyIQJQG2u9hpUvBixHNvhy39UxNHDy8hP0FOPy+s09sEBdP+2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Add C-state table for the SnowRidge SoC which is found on Intel Jacobsville
platforms.

The following has been changed.

 1. C1E latency changed from 10us to 15us. It was measured using the
    open source "wult" tool (the "nic" method, 15us is the 99.99th
    percentile).

 2. C1E power break even changed from 20us to 25us, which may result
    in less C1E residency in some workloads.

 3. C6 latency changed from 50us to 130us. Measured the same way as C1E.

The C6 C-state is supported only by some SnowRidge revisions, so add a C-state
table commentary about this.

On SnowRidge, C6 support is enumerated via the usual mechanism: "mwait" leaf of
the "cpuid" instruction. The 'intel_idle' driver does check this leaf, so even
though C6 is present in the table, the driver will only use it if the CPU does
support it.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
[Linux commit: 9cf93f056f783f986c19f40d5304d1bcffa0fc0d]
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -742,6 +742,32 @@ static const struct cpuidle_state dnv_cs
 	{}
 };
 
+/*
+ * Note, depending on HW and FW revision, SnowRidge SoC may or may not support
+ * C6, and this is indicated in the CPUID mwait leaf.
+ */
+static const struct cpuidle_state snr_cstates[] = {
+	{
+		.name = "C1",
+		.flags = MWAIT2flg(0x00),
+		.exit_latency = 2,
+		.target_residency = 2,
+	},
+	{
+		.name = "C1E",
+		.flags = MWAIT2flg(0x01),
+		.exit_latency = 15,
+		.target_residency = 25,
+	},
+	{
+		.name = "C6",
+		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 130,
+		.target_residency = 500,
+	},
+	{}
+};
+
 static void mwait_idle(void)
 {
 	unsigned int cpu = smp_processor_id();
@@ -954,6 +980,11 @@ static const struct idle_cpu idle_cpu_dn
 	.disable_promotion_to_c1e = 1,
 };
 
+static const struct idle_cpu idle_cpu_snr = {
+	.state_table = snr_cstates,
+	.disable_promotion_to_c1e = true,
+};
+
 #define ICPU(model, cpu) \
 	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ALWAYS, &idle_cpu_##cpu}
 
@@ -995,7 +1026,7 @@ static const struct x86_cpu_id intel_idl
 	ICPU(0x5c, bxt),
 	ICPU(0x7a, bxt),
 	ICPU(0x5f, dnv),
-	ICPU(0x86, dnv),
+	ICPU(0x86, snr),
 	{}
 };
 


