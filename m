Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43B877F071
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 08:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585129.916141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWWOp-0002ku-H5; Thu, 17 Aug 2023 06:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585129.916141; Thu, 17 Aug 2023 06:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWWOp-0002iM-EK; Thu, 17 Aug 2023 06:22:27 +0000
Received: by outflank-mailman (input) for mailman id 585129;
 Thu, 17 Aug 2023 06:22:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWWOo-0002iG-0c
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 06:22:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ddc2013-3cc6-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 08:22:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7542.eurprd04.prod.outlook.com (2603:10a6:20b:299::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 06:22:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 06:22:21 +0000
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
X-Inumbo-ID: 6ddc2013-3cc6-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3rxA/EFEWDkaB87ubKT8P4dc40AXwkhQmh+8KnnqqeCUtRTYVQDiYAatUU+fwSJh7+TSKm0+Etl//Kt8EAq0IlQccTOyua0gMIsh/F6CijlSMg0BBH0ze88Wp8UuFZMPkHSfDhiBFeRk17awzdJrE8tUl/rOnCZuIaTxsJsaskEkWI26IG581yXM96I5y5Odotmn51dmBVzRTrC2/fm+NLjjN9seFAq1rAOc4aG8oRIqjKVtDkjx2AlerspacGG/60xpWz3XGbvK3JsxtRbPqHqM3mu2EdAc7KJEbGk2BC60GrsI7ICdzrpiLYRnGvOI+J7zaurLCPEe2ZjCoeCUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3cb4RIltlvvY2OAjg0FJ2Llo2WDe3AF8xhOKh12nWo=;
 b=SpH1Y/HNLpnSJl+oGiKyE5hukMSzoKYwg874QRDvkv5UQfp1OuIUtQ2KAJmFCRgA8u8JCPPA/EgCMdA2MRPWzE/yoiwC9IbEBN2vWuHBHexoxTrqdepy87a8dvXFioNo28DfVOa9noRZjiC9DebK1ackJa7xPCq6ZuVzLa/iVnXCFPUs84TAuWCgc5quQbyTBzFMufgCVLCkJ1c7DcQv/H4SrJqPWsqhTOWugYyi0HStlwN5PIXkFqWD8ndiWzu5QlUolHJfwPYmndN0fJTpNOKjnMabQjVu24v5EcS2ygmmpHWkt9H+PqEo3R7GEf/b6FuLG/LMmmvD99djE7sx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3cb4RIltlvvY2OAjg0FJ2Llo2WDe3AF8xhOKh12nWo=;
 b=dJdTZNeMo52gx0ufXUTHHsLsuJu30G/10c9fXJkld6YDb7kJ+zBCtMqslPUbPOQH2/046Y+CZVgZXJ+Ahwlm3efwBsk2nW1EPCC7SwW1hVZsIw9bfgR/dxger3O6cwGboa72QTdBEdMKh0+POkkAhKGzpvMPPp+AFJxiXsmRIAJEECsd5JG7D8+27QtvTk7vKM6ZEbXm/D5Is4W3LznGtAb0xiW4jusgLGbxgkf9Zc+5QOFmTBr/YtPYXzyEeUuSsRRnrNyhafDYsDjfw03sMhJUgZzyhS/POk2WboKgT8zRdXApOXSIp+cnG0i/3jR3TFlgQNWyPiBlPnxM1GJbrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4fe76484-fa35-807f-2323-276087469bc2@suse.com>
Date: Thu, 17 Aug 2023 08:22:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] x86/CPUID: bump max leaf values for guest exposure
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: e8918112-d89b-4f59-314a-08db9eea50b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q9Yal1MqynhUTxn+wAS2dvT6XVdtgapJ493WKqN4vl6wE5DxGD2t2EdmI9rL1YzWg73lKKcd0UCzLtSI9/I0Tl3orvFxf2H4U9IYHFP/0RCiN+8eAQgAVHwpvsrCUkbDzcAbah6JN+uyQ/UXhp4huiFRu3gGnPPv1amvfE/7AD58ygT8cnQ60+MYXL+FfcJaw0jMDfJ45rLkilAWdwfRWSbmO/seDhe/nRngWVeJEE8F6WoaO89pnT0L1mspJ2WPNvnZNUxLcpovTXrv8LL+XcNXp3qgqEW9836A5aUrwaiQUowYUvQTPcsKU5papq6OZ8v9Tqyx6Fq6ZM9QDQ0ITEkGXphwQ91RNZzPUlAdMJBfAnFQKd4ssBywIHCKd7XKzB17pvJJM3OVdFS9FKpzNseWiIlPDCZYr21NpGSiSvkYO/ZsisYaIN2+ah1rA7bkFWhMIwaTdGuUi0jdJdgl4/tA1m8HO0Fu5pVYaBSJ21jtdVb5uGZDs4UlZuvJUR/JxxZORbJJ91jTUv4kz6ELyxmJ4FaEoAOP15zUpZQQxEzbYUQ5wn6nLVPyrMvFR8MjM+AQbfIhNVt1fq3HmfRnoVUYjOzklqhVBHmszSNVWhEzx51xksy3YAY2rs7203ZA3crh8JMH4/ZdQCIEZp9uSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(1800799009)(186009)(451199024)(6512007)(6506007)(6486002)(83380400001)(26005)(31696002)(86362001)(38100700002)(36756003)(2616005)(2906002)(316002)(6916009)(41300700001)(54906003)(66946007)(66556008)(66476007)(5660300002)(31686004)(8936002)(8676002)(4326008)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b29PTUlVTG16dmw5VEFqcTRVVlE3V3B2Z0Fxd1k1ZGRxbUc3YWpIaDFudUZl?=
 =?utf-8?B?cTQ0Rm1OL2ppaTZPcGJ0QlBDY1JTY3M0a2YyWElXMmJDUzlFK1FDRVYwSGVB?=
 =?utf-8?B?LzdqbFdXWllRaUJIWkRVOXp1bytzRW5iRWxFdHlGOGVkdWlFU1dxN1IwVVdy?=
 =?utf-8?B?MlU5MHZMTTR5dVN1R1l1OWtwQXMxQ2NVTEVFUGF2N3BlN1NTbVpzdGtkVUh5?=
 =?utf-8?B?RTRCNlVoZ0g1UmlPZkNaNVpDdWJGMWtuT2xhZmY3T3NiWVRsa0lNNjI2QzY4?=
 =?utf-8?B?MXZsOWFhZ3J1TnY3TnlDYWY1WkFlaHhhcnROQk04cnI0SHpxdUdPbFJpWVFw?=
 =?utf-8?B?NDkzRitLVVVPQTQzSk1mMSttN21ZRTRBSzZ0WFJRbWdBMi9HaUkwbjVNVEFP?=
 =?utf-8?B?WFAzaW1GKy9Sa0ltL0c4RGF3M0JiME1aVE1zbzc1UmhsdFhLU3hjVTFPTHIr?=
 =?utf-8?B?a3dUcnhZNndoSGJvdWRpVVhkRUdIUmdwb1NiYTdqMytxNHFtZlVDSWN4aDJw?=
 =?utf-8?B?MHg4TDhFTGloZFlJVDFUVzE4OERCckxkZ3dadWdlaVo1bzdOaFhjTnpzamJP?=
 =?utf-8?B?Uzd0RTdER0pTcjBkWHVwbk4vY29zN082c0dmVFEyaFRjeUNmZUxTd0ZlcGV4?=
 =?utf-8?B?VlJlN3ZkV2grcmg2WCtYM1NYNWJwSXRiMDFsL0ZuN09YM1FiT3ZNeDVBWlcy?=
 =?utf-8?B?cS9EUTBhT2ZLU2JWOVcxRU1xZEg0NzNNbXZLOXdEWU1neThJcWpjS0IweU01?=
 =?utf-8?B?TUFoT29RTTc3YUNycnZKenluUTJBZWUwZGFxNVh3MkZsWEdHS2txaDJDdmdh?=
 =?utf-8?B?c2RpbjBQUWFVbkNuTkNJRjFrWjRDY2V2VTZUcG9WWGM2Z0krcC9iOWJlRzlI?=
 =?utf-8?B?enhlbnFYQ2ViL1FQQjN1SU1ZYmRyYzRsWXg0a1BRR3NPYXA3RG9aVWdqWlRu?=
 =?utf-8?B?Q3ZCZmdDVzh5bGkzbW5jM3ZIbzdEUGxxSzNEQnlKNVBBbUoxcUc4cGNQbUZU?=
 =?utf-8?B?M1IvcEVCazBaZktFTWQrWlBqdXprc3o4MjJySmVOdW0wRk5UUHcvNlN3S0NP?=
 =?utf-8?B?WHhZTkczWU5YaU5pRHVWYi9aTTV6cWl1dFhjaDBzT0lPUzFCblJIbjNRelhE?=
 =?utf-8?B?OGE1N2tyZDFwNEorT0xxVE5oNUN4OXdFenI5TEtYM0FsSzZIMXBHS1ZjTno1?=
 =?utf-8?B?Y3ZqMFRPUmVROXhnYm0rS2VJVnllb25iMXhKYkwzSXFTUXBuZURISFR1TmFn?=
 =?utf-8?B?RWFYM3J4Z2lQRUdRd1FlZGt5Tk0zRVBFcWN2TkYxNUlhQU5OTWdldWd4N1hr?=
 =?utf-8?B?b0hnaWI3Q05NZXVCNWhobHNSWEFuYzdvZktVZTFYQlpMMnJOTVpxYzZ2M2lE?=
 =?utf-8?B?ejBEdWRnUDNtNDBkVytSeGlwMm1tbkY0QWpKMkkrdjN3VmNUQU1UZW1QRytJ?=
 =?utf-8?B?SXlUK0NoeGNudEcvTzBScW9yeVBkbDBDSVpTOUloSnIwTHJHYXVSRm5SUFB2?=
 =?utf-8?B?Q0x4OFVEdlRQNEdHSkJNRkUwWjJ6b09jR3lmU1grdy9pc3Rpbk5WcFVtYVBO?=
 =?utf-8?B?YmwvbzMzRlU1TC9YVEYwcm5nanZxZ044ajFhVTBoNFFWYWJ4alRCRlVWTWg0?=
 =?utf-8?B?UmdzRk5tTTdQZTQybmhuV3p0U1NJbTBNRU1aaEc3aUE4eGc1bWQyVXY4VzZh?=
 =?utf-8?B?VzNEc1JiZHg2dFRuMFBhZjAwR21QT3ZUaDB4a2FjS3FqUit4WFdDbXAxVmp1?=
 =?utf-8?B?cEJyZzR5ZzFqT2ZIakFzckxMc1U1UWFBSk52elNHMlhGcmhzTkRDQmFhc0M5?=
 =?utf-8?B?OE11dEEzWm5OTmRnTkdLSVdwV05sNUJyMXRrTlhUczVBOUMvYzNRdUh4QjlT?=
 =?utf-8?B?VGgvak5nMFIwZ0hCem00MjVQUXBoNDZNdWNxVnFhWVA4STQzUnRvdk1YV2ZR?=
 =?utf-8?B?c0NWYXlPaHVsQ1ZqY0RGSFNXKytIdnZZZjZHT05IVElxNjJCVGx3YlBwTEwz?=
 =?utf-8?B?d3lheHFmcnRFM3JiNDZoUG96QTk5M3Fpa0VBaXN0NDYzMFZOczBtbExSRlJy?=
 =?utf-8?B?d3FYSDFid24zYk5WcFdVNHlnUHFHbmxtT296QXBKLy94dm8vemF0cUdYazNU?=
 =?utf-8?Q?sWFBJDjGW8mskd3TgPNAvkdeU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8918112-d89b-4f59-314a-08db9eea50b5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 06:22:21.8192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMrnIPmBTKePE04Igla9rpoSE/ffQ52O7/+/du+5CV9Q6ijUQ7vKrCI0iGV4F7K6uPdkYTezN+IbRzLICgNbAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7542

Generalize what was done for LFENCE_DISPATCH: To make certain features
that we artificially enable recognizable by guests, respective maximum
leaf values may need to be bumped as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: The call to the function from recalculate_cpuid_policy() is
     somewhat problematic: It's not clear whether a tool stack request
     with a low maximum leaf value should be honored despite our desire
     to expose certain features.

This omits checking basic/extended leaf 1 features, some of which we
also force. I think requests to run guests with max basic/extended leaf
set to zero are sufficiently insane.

Among the large set of changes I don't think I can identify the commit
to validly name in a possible Fixes: tag here.

The cpu-policy.c change would imo look quite a bit better on top of
"x86/CPUID: move bounding of max_{,sub}leaf fields to library code",
which has been pending for a long time.

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -360,7 +360,6 @@ void calculate_raw_cpu_policy(void)
 static void __init calculate_host_policy(void)
 {
     struct cpu_policy *p = &host_cpu_policy;
-    unsigned int max_extd_leaf;
 
     *p = raw_cpu_policy;
 
@@ -368,20 +367,8 @@ static void __init calculate_host_policy
         min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
     p->feat.max_subleaf =
         min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
-
-    max_extd_leaf = p->extd.max_leaf;
-
-    /*
-     * For AMD/Hygon hardware before Zen3, we unilaterally modify LFENCE to be
-     * dispatch serialising for Spectre mitigations.  Extend max_extd_leaf
-     * beyond what hardware supports, to include the feature leaf containing
-     * this information.
-     */
-    if ( cpu_has_lfence_dispatch )
-        max_extd_leaf = max(max_extd_leaf, 0x80000021);
-
-    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, max_extd_leaf & 0xffff,
-                                          ARRAY_SIZE(p->extd.raw) - 1);
+    p->extd.max_leaf = 0x80000000 | min(p->extd.max_leaf & 0xffffUL,
+                                        ARRAY_SIZE(p->extd.raw) - 1);
 
     x86_cpu_featureset_to_policy(boot_cpu_data.x86_capability, p);
     recalculate_xstate(p);
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -104,6 +104,22 @@ void x86_cpu_featureset_to_policy(
     p->feat._7d1             = fs[FEATURESET_7d1];
     p->arch_caps.lo          = fs[FEATURESET_m10Al];
     p->arch_caps.hi          = fs[FEATURESET_m10Ah];
+
+    /*
+     * We may force-enable certain features, which then needs reflecting in
+     * respective max leaf / subleaf values.
+     *
+     * ARCH_CAPS lives in 7d0.
+     */
+    if ( p->feat._7d0 && p->basic.max_leaf < 7 )
+        p->basic.max_leaf = 7;
+
+    /*
+     * AMD's speculation related features (e.g. LFENCE_DISPATCH) live in
+     * leaf e21a.
+     */
+    if ( p->extd.e21a && p->extd.max_leaf < 0x80000021 )
+        p->extd.max_leaf = 0x80000021;
 }
 
 void x86_cpu_policy_recalc_synth(struct cpu_policy *p)

