Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BD0494FF5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 15:17:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259086.446882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAYFd-0002Si-9q; Thu, 20 Jan 2022 14:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259086.446882; Thu, 20 Jan 2022 14:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAYFd-0002QP-56; Thu, 20 Jan 2022 14:17:21 +0000
Received: by outflank-mailman (input) for mailman id 259086;
 Thu, 20 Jan 2022 14:17:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAYFa-0002D7-VI
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 14:17:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac96892d-79fb-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 15:17:18 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-OCKKYu1mNK6pDA7MmKA6aA-1; Thu, 20 Jan 2022 15:17:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB5786.eurprd04.prod.outlook.com (2603:10a6:10:a8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 14:17:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 14:17:15 +0000
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
X-Inumbo-ID: ac96892d-79fb-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642688238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hSoDsIzAqt0gE1mEnXjo3VJvwAW5xapG8X8G07FEs6o=;
	b=O3meA6GNUdnZlLP+l9E9TdA3lkPMyxMU+6BF51XokmBemzvlpFcJ2sB0cmL/ZCenSYOhPL
	xKF447NTkS71iWWhW2+BLhx6zhpmH9K5SE97aJS3Iy2wH8Perq/CIzlQRO9jt6VIQc0yxv
	Lo+5j/Rm5vb7tItYc7QuBbrELE+xBHY=
X-MC-Unique: OCKKYu1mNK6pDA7MmKA6aA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhaZRN4PgvEwDLqjG69f0f2kRpglF7UMB/jeq+5KLexr7CV4Yot/6RzrPY3RWj6LbKbWuphyFiEk2lefjniYwFjL+4s3SMbFg6e/feiVd2Y1/suR8MrR4kEjPNoa/oW/ZgrEuCW0ZZ0+O2MreLBeV3vi4LoX2H8NhGP8Y0FiGknX2T65CDZKcvXLmf0UXiEUA1PWZgSu9Le4wwqt0lftA2YiCthxMIzRn+VPzgI27dr2kyNEc2Cl14F/yaEwoFMcA6ip+r/FbpvujUcFAm7DtVi/ObyvlPhssG28IOaEKtw8vxw5dp04QOgAkKYTYM2ikzKOnrE8yHgy3mE86g2wlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSoDsIzAqt0gE1mEnXjo3VJvwAW5xapG8X8G07FEs6o=;
 b=Kmvh2grLHHBIkwRB/hU8EX03D2nNq4giv/1etiXR1jBb6hEwhj8QPeGIPduf3hWLMrVRnaIW+YWhTtuBG0Acfm6eoJ0k73RB2K+WxnyxazqGQoKh8w8JN3E7Vho0EA8YuBuB7SIzLRaatglH0gC4SzgiBaePi99LxdOAQy54FaCcXXUDuq/PPKL81jJ7kLtI3zKbQJ2AmE/sUXXTZJ/1K2U4O588TP82Zj3xghzxbnsbF3IhGpC9096Amgxrh0uTdWdDs9TZVIeKnNM3hd9J2JB+09mL3Vk+6yHed0GmtnpWbdzgEbxs4ONDxCCONbXtY5WUziIlwYiQ2yM8BrJPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d13a663-f03e-b1e2-0c38-5dc3282dab10@suse.com>
Date: Thu, 20 Jan 2022 15:17:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 2/2] x86/Intel: use CPUID bit to determine PPIN
 availability
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <64a5a3ac-8f4c-b13d-0b7d-4c4ec15e2721@suse.com>
In-Reply-To: <64a5a3ac-8f4c-b13d-0b7d-4c4ec15e2721@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba4bfa96-a676-4be1-5f1b-08d9dc1f8f3e
X-MS-TrafficTypeDiagnostic: DB8PR04MB5786:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB5786A7C778F684B6B5294D45B35A9@DB8PR04MB5786.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jo2SHIa2j+Mr/2iaBZCu7Rvo7cu9km0+tdrUFRIhgDoXgqpTKAgpOsywudEcnGjpCUFY/GkULNlnBLj7iC7nWBglG4ZVhVl16NqwXD8VQhWGg2LUeT+dE9iyihgb9pp4eGxMqThix96Gc1ipp1Np+raOQDRN/v5vtJzTHmHwI2FatL65PoKSapltO8CQoXnREzXL5ODGBdWPfe3irn/CtoZG00m3avZ2tz+sthPO4xB124iqipJnrBbBIlnm3AL/SUp+gsE9LVKSzu9Ii7upwPJWFND9aK9YLQIuuIpJrnw9I6SnLOBYPLbl7MmSiEiHZVKl6zF/4GqJZL1a3rIrMA+TpuzRwe/+BUwY6U/gKrwK58U51rYdAC/HpIcSqe09mZvOJ9LJtjHGjAei3vz1RC2ruaV3SA6LiBNC5SVQdInLP533CqR/QE2RJklPu9wKeSJ6iMqzoI7IsRUIj7jNe0GLszUKqoPplNUQncCfcRB8GI4i96HADEsVB4CxTkqyCCIKq4j8ykxvMGRZADCKkzgEn7sjSPka6Tz/Yy0UDs+Wa0b4wArTD+XgMVn/Sn61XPJf/r0gKsjhaiEkq90BsQ8fPOWds5kIDUyp4rjYuYHC75PiNdnK32ZztXqc7pIePVXPivmAVBbTjwqJjXPmL2NxWBZ8Sb6BulUyEfvtGJwRQVLIqbKn+8EeYhny53RhRsnafzDc6/3a1d83EMPFq0ZVJjiCZQ2IoAdpNWaBzk9g66D8YtbRfnkK23L9sw74
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(2906002)(66556008)(2616005)(66476007)(6486002)(38100700002)(26005)(6916009)(83380400001)(186003)(86362001)(4326008)(6506007)(36756003)(66946007)(31696002)(316002)(8936002)(31686004)(8676002)(508600001)(6512007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTJSdjRXNGYxemR0ZXpIdTZLNGZOT1F5RE9aSTZsakFJQkw2NXdPekhjZnRM?=
 =?utf-8?B?SjMyV1BYYzJTcXd6bjY5SGQ2S0VpMG9vSGdJY2gzaXQwQUlvV0g2V3pLNk5V?=
 =?utf-8?B?Z2taak1PTjVFeFpYbmhQS2wweGRLeXpEcGZXVDdRRnpOWWxKRklHV3JmbE9F?=
 =?utf-8?B?cGduRklCQVZMUCtFendFMFBVNGtBbjhtS1Bjb2EwcnVhdWtkT0ZaK2xnR2tt?=
 =?utf-8?B?NlJ5aUpMQklkUFJVc0xOMjc0U0JPU1djK1U2b2FVOUtWWHZjY0xiN2RvTGY1?=
 =?utf-8?B?bGdGS2ZnazlWYnltcEsvMnNjOWtjNGsxVFhWdWR1bmxZR1BiTDZNUS9Rcjly?=
 =?utf-8?B?Z2YwY3dFdkcvVkpkblY4WExnMW4rVElRMkJwTFlWSGkrenJsdi84cHhFTGl6?=
 =?utf-8?B?VENESjFHZEhtT0toUmZ5Z0ozcnZmSEwrd0pqdmhvSE9XTzh6UFpPRkFwM0dp?=
 =?utf-8?B?MndxYmJQeE51djZyL2RIblIvYkNrbHp6SHp5SEdnQ1VyOGNyWkNwY1BZTXJY?=
 =?utf-8?B?L1F5enNOTXN0SEx2TW9YUmZFWmc4QWs1R1FYWklibUFHRVA2THd3L1JtNzVx?=
 =?utf-8?B?RUtlcjYvVkZocFlXc2YzVm9lTHNpOTFCdm14QktJa25IVHJyWDlzcUsxWnZz?=
 =?utf-8?B?OE52Nk9NTE9ETzlVZTBRMFhiK0IvSzZQSHBFLzVBMHlpMjVEeHpZQWowWUJZ?=
 =?utf-8?B?K0JzTlhzRytTWGhtN2tkYUFVUFQvMzdPOUVWOGpRK2pBZVBwK2gwTTdjZEti?=
 =?utf-8?B?U3RmS1laM04rUXMyZmQzcEZJRGMrYjFMNUxwYTVQck5tR09FajRMd0wwWmE1?=
 =?utf-8?B?Sng0Q0FWZ1VyRGJaRGVSakprV2owMVZQMnM2YVRsTWZHNlJlMTdFUW1qZVRD?=
 =?utf-8?B?cmg0dVh1dHQ5RGduVTFJN2UvQ3RCWE1iU25DZjNOdm5SRVZ4VDB1T2RCVkJu?=
 =?utf-8?B?Y0MwM3JzZEN1MnkvNTB6bjVkYkRPVzg5ZWpoekgwZktqWDgxMnNPUGpGT2NB?=
 =?utf-8?B?WEV5Zzh4dWlwMWQ4MGhwUHRXMXpFc0ZhdzFCS3hJdVQzNCtyd2pGMFphNTVD?=
 =?utf-8?B?UExPekZEM255ZldKMVE1bUZxQm0rSlRtNHBidHNnNTBEekRJSGhHUmZiT21O?=
 =?utf-8?B?S2dxSWlFYk1YcGxoSUNsSFMvTTMvcmFjanNab2V1NzI5SDllV0lVODUrM2R6?=
 =?utf-8?B?UG1DaElxQ3RNcy8vc3NxUlBSTGlMbXMrbHFubmhRdWVtbEhxdkFwdG1jZmVz?=
 =?utf-8?B?OHNwTndrUkRpbEdYdHR2aERacnp2SjVCUitkVWt1c3hQditRaEtHVUoxa0NL?=
 =?utf-8?B?Y2tPdFBNb1E5aCt0cGdRLzBwSTVBeVpVS00wQU1QTU8rRVYwTityQkpybkww?=
 =?utf-8?B?TzB0TGhPU3JZRXJLSi9nNmNIdFVlT1FkMHB1NUx2b3hOTUlQUUFSb3FCUElH?=
 =?utf-8?B?cWlSTVZCN0ZRSXlycUg0MXNtc2daeVhUVTZ6NVFnbFJvRkxPSWpMaDA1Z3NK?=
 =?utf-8?B?dEp2emExdVc0MEczOTJvZmNqa21oMHV5Mk9pR0dIb1F0NDZjYzZqODJSaDgy?=
 =?utf-8?B?eWhZRFhnRUNSZ1AxM3k4aEFpRVZSOHlLUU5RTmY2OWJVcExrcExVRGVoTkpq?=
 =?utf-8?B?M3ZjWFhFWXloM0drN1pwRmJtT3VoVVNzc2ZTRGF2Rlpyai9ZZmMvZHRNUllW?=
 =?utf-8?B?cnh3TjI3dm5ZLzdYN2svZm9TSTVNQ05NSnNHMmViNjVNYkdjVDE5YURMNklv?=
 =?utf-8?B?Vy9hMkVZWlRNK2VGZWJWcUNlMERaWng0UlZZSFIzNWpFclNOU01ycWh1ZG1V?=
 =?utf-8?B?bGRaZEt3bGJpdjRGVU05QnJLN2FnZnR3bitncEpxdEJCcDNoWTRaQWtVaWdm?=
 =?utf-8?B?VE1LcVgyN3IvMjRyNXBBYXY4QTkrNHdicEhBYTdLaDRCREpoUkhCcG1IM2Zw?=
 =?utf-8?B?VDR6bjdPZHFqRHBFYUE1RFhsOEZ1SWViVytaT2xpZHhlRFZJSTlOS1l2MFRm?=
 =?utf-8?B?aHZ5RkhhSTVlWllneHlNUnVWcjFVRkR3VHlaM3BsZVNIT2NIMk85UzJZYkJO?=
 =?utf-8?B?aTBjL1BWRjlkQTBTcDJqcmxPWFE3WjZDdDNYV2JMTE9YSHRYTWQxV2JPMmVF?=
 =?utf-8?B?VVNWQXBzZkxXbHIrU2xCOFduUUlIMTE0djFDOUc0TG1KczBWZjdxbzZKSk5V?=
 =?utf-8?Q?mNoXIzpZE8D5E+Lm1PnEGLw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4bfa96-a676-4be1-5f1b-08d9dc1f8f3e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:17:15.6321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5EytEB/N5yy7D60KSCBBZtbkI/x3sHGcKT3Q/S+Ev22LsY/5Zpwc8rFxm/VQIpudmVCx1+D0m7jH3A3kX9xwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5786

As of SDM revision 076 there is a CPUID bit for this functionality. Use
it to amend the existing model-based logic.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
It continues to be unclear for which CPU models, if any, the PPIN_CAP
bit in PLATFORM_INFO could be used in favor of a model check.
---
v2: Don't rename AMD's identifier in xen-cpuid.c. Name Intel's just
    "ppin" as well. Move str_7b1[]. Update a comment.

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -195,6 +195,11 @@ static const char *const str_e21a[32] =
     [ 6] = "nscb",
 };
 
+static const char *const str_7b1[32] =
+{
+    [ 0] = "ppin",
+};
+
 static const struct {
     const char *name;
     const char *abbr;
@@ -213,6 +218,7 @@ static const struct {
     { "0x00000007:0.edx", "7d0", str_7d0 },
     { "0x00000007:1.eax", "7a1", str_7a1 },
     { "0x80000021.eax",  "e21a", str_e21a },
+    { "0x00000007:1.ebx", "7b1", str_7b1 },
 };
 
 #define COL_ALIGN "18"
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -859,12 +859,20 @@ static void intel_init_ppin(const struct
     /*
      * Even if testing the presence of the MSR would be enough, we don't
      * want to risk the situation where other models reuse this MSR for
-     * other purposes.
+     * other purposes.  Despite the late addition of a CPUID bit (rendering
+     * the MSR architectural), keep using the same detection logic there.
      */
     switch ( c->x86_model )
     {
         uint64_t val;
 
+    default:
+        if ( !cpu_has(c, X86_FEATURE_INTEL_PPIN) )
+        {
+            ppin_msr = 0;
+            return;
+        }
+        fallthrough;
     case 0x3e: /* IvyBridge X */
     case 0x3f: /* Haswell X */
     case 0x4f: /* Broadwell X */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -299,6 +299,9 @@ XEN_CPUFEATURE(FSRCS,        10*32+12) /
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
 XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
 
+/* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
+XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -16,6 +16,7 @@
 #define FEATURESET_7d0    9 /* 0x00000007:0.edx    */
 #define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
 #define FEATURESET_e21a  11 /* 0x80000021.eax      */
+#define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
 
 struct cpuid_leaf
 {
@@ -188,6 +189,10 @@ struct cpuid_policy
                 uint32_t _7a1;
                 struct { DECL_BITFIELD(7a1); };
             };
+            union {
+                uint32_t _7b1;
+                struct { DECL_BITFIELD(7b1); };
+            };
         };
     } feat;
 


