Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DAA49E2DF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 13:55:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261459.452735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4If-0003wz-SY; Thu, 27 Jan 2022 12:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261459.452735; Thu, 27 Jan 2022 12:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4If-0003u8-Of; Thu, 27 Jan 2022 12:54:53 +0000
Received: by outflank-mailman (input) for mailman id 261459;
 Thu, 27 Jan 2022 12:54:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD4Ie-0003u2-8u
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 12:54:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50c2904f-7f70-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 13:54:51 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-DWnCEEcaMaWHZ0mTJJvaLw-1; Thu, 27 Jan 2022 13:54:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS1PR04MB9407.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 12:54:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 12:54:43 +0000
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
X-Inumbo-ID: 50c2904f-7f70-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643288090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUcJmN6jlKijIbl/I51T24eZTzV7QGvASK1sSh8ViyY=;
	b=A+KuYW8iqGwOJHZHd7L367ita9L/SVyqvcZ9bzXBUmY4wMyaE6kuDOdKmdsRyBye4LElDr
	7Zh+FtCxDIGN6p/2TYFfjyOoO/IY+71g8L5EOkI2foweHsFli1OPPd4x7ysCEIRHuXMVcP
	zYbaz18b2L1gBQKFwv2E2MJsy/N09Y0=
X-MC-Unique: DWnCEEcaMaWHZ0mTJJvaLw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeVpcIlHYW7TNNDudCUbIsw/IhFT2Uv9tYK5R+D9znWIc303GlwbYSCLEQhcj0bAOQFf++aAwZiAZEwExoPFzHCd5eUSBCnBVn6l2tbr9LAx+Ril07aesjycPY5RIrTIAV6Agn/VybM3IDja/ty5pRDMKm/Gr7M/uV3+ImqHf4hSYcZ8zSwxC+msN64bBpOSgTVntC91N4SB9Db5aR9QOYJZko4zDKSdq+5pWsduhIzu2S8msPgUmdxNy1vTn3cxt98HWX8mSfT5kY7Gw4CPNdTvQFy1oyqqebPZrjbp+uPvg8Jb5YMk3VpgxJeGGNMd00CGx0xD0amCBN/zTAgYNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUcJmN6jlKijIbl/I51T24eZTzV7QGvASK1sSh8ViyY=;
 b=fyOybCQG1cvVgum08Qsv4R0fVSMvVehI8fHTwFoDQxZ4MaqZXvDCBzotXjIbefxI/UynxJaHW6ulAgnFdlbclW4nG9gBT17O184nngGf5MGlWBburuaHQD0xvv95t2VhIVpnZNbhLrknlNgT8YrqW8dT98r4Eja/v/3e4k8mIldWoGalR/0iCdN8FicTZdG87iBEELAP6FSArBV0IIzrQeo1U8SFAWiDqdi0PyVcOk+u7ftMJctbIPYwvGvsmPMQ3omGRwccQ7W+72GAOuZR8pMZzIgZfg+v0GE0mLldkFM3m6TCyPRXvwXT62uiJgQ1/+RSm2HcIyDHCWN72AeLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc8d27b6-411e-51b5-ee57-c6715ce8c50f@suse.com>
Date: Thu, 27 Jan 2022 13:54:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/Intel: use CPUID bit to determine PPIN availability
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <64a5a3ac-8f4c-b13d-0b7d-4c4ec15e2721@suse.com>
Content-Language: en-US
In-Reply-To: <64a5a3ac-8f4c-b13d-0b7d-4c4ec15e2721@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0344.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13418d3f-762e-4904-7993-08d9e194302f
X-MS-TrafficTypeDiagnostic: AS1PR04MB9407:EE_
X-Microsoft-Antispam-PRVS:
	<AS1PR04MB9407585E4B427C5D79FE3709B3219@AS1PR04MB9407.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cchV9Fc/D+VWXkW7Eur2ysvRaHPSnyd+jftB2neeuE4IhrX60FhDfIa9ytB954y60iaWbb1pzPcH2Ro6vniVXgXVkvvdtZ5ZiqPVQOVWTi6aRuY4E0agDQxpxm0aqxwbyyOJwFPen0YdWhl25Q/x+uTSPyBVc07RbEBz8WnZqmxkdQ17KeMJjaF2QiD0z/3qwicoPl8Fj5eit7OWXfdQHNi5NIMg0jdyu54jNMzQ9k1nhKLp/GyIOskfLO6AqQq+GADuKhv9qiI3YyTO3+LMpMdj/me1yHOwihKXHcNrG4jWPyuLoHLZrcR5lQNooX0M6uW/+XY+ZIDPDRFoH1qC1jIdgwKj6KeqjriIHN1CmiXb+qlIDVdS1iGOubVSCErdKBLsf3WXSDTn5OAHgxDzDqr4zY8UDNWkTY6gCfRzIr5Vmmla7lVzS69SpEhxnTIF74jbwEhm08P3wb6GBhzdnr9ooo8ROuI5hglblEgmgEdBAMJtXurQwR0yLPenrzMLAJva7jLXlkkgvP1+6vOB+eIgVF6ep6xQrUbsS5R3IpA+un2Gux+PC+8Vj41NzsonKJCIY3iF0vxhMA4IA2bydvE8lBWzUe1UqtKfKhX+rLCV6ths1hyx9PnwcKpaJWL8sHJ9xWxmopp5KxtXRys/NribgCMeCusUdEH4J7FBEtVIDWULrrmO67a+1fdFO0tm0Z8awqQ5OpbcxQDBKORfGgIdOPTin2E1L1pnlzEVhsoqx+Cwz+J6cIOwIuVUUQJI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(83380400001)(6506007)(2906002)(26005)(186003)(2616005)(6512007)(66946007)(66476007)(66556008)(31696002)(4326008)(8936002)(5660300002)(31686004)(8676002)(6486002)(508600001)(316002)(6916009)(86362001)(54906003)(36756003)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3gzMW1ybkpnODJhaFlnbi9rV0NtSDdmTHJwSGpyV3FmZlpxckpYcXNjMFFU?=
 =?utf-8?B?alhrMGdNWmY2Vk5ZM2pIQ09WMVVxalZVanFRS2s4dDdlVHdtb1E5UHp6MmVa?=
 =?utf-8?B?WDBSUnQzY1RQVy92ZzgxZFQ4bW0zNENlSm00cHptd0tOdzhtNGtuTnBBaDB5?=
 =?utf-8?B?eGJ1WnJVNkxxUWo3Z3FhT0QvQkNWQWF5ZUl0N3NUZGxsZUZpSVZpVHlQYUNk?=
 =?utf-8?B?bkljdWJCQ2x5TmtwUVpkZDR4QVUxQThGY2pwS1hKNUJjaGJnL0w0RDFGcjJB?=
 =?utf-8?B?VjhCT21GZUc2aGp5ZmNzdlVaSk1MRnVOWW5xVEpvdWNnblNHQzVlYzZ6NHFs?=
 =?utf-8?B?VVJzbTFhNjNwWDZPNWZmNVEzNU1TVFhNRytiWVh3ZWdQWFgxaFFGRHJ0NG9s?=
 =?utf-8?B?NlRuYWs1NmNZQlZ3cWZ4THQxMHZVVHh1ajJHdVRCZUVQYXhQcTlsMlBFeTBa?=
 =?utf-8?B?MnQ1THNTUC9WUUVEb243djJOS2hXUXoxdHk2L09TM05saHY5ZEZXSkcwYzUr?=
 =?utf-8?B?QVlHOVVISG00T1hRSEFVWEs1VmNPcE1vL2J5R0ZHaHBNd0Z3a1NmL1FxQlB6?=
 =?utf-8?B?VnlzUkZTb2hudmw4WUtvYjZQS2R3eWlOdHREdTBXZDVrUHpqbEduOVpRVkVo?=
 =?utf-8?B?ODExZU1QNy9TUWo2VEhFR3BJayt2UkUzcEx3VHBvd2d6V1dDUmMyVFV6OXFv?=
 =?utf-8?B?aHBmVmtUMGxVUlVCSnVVQnQ0NUlWRE9sUTZzQzh5dEt2Y3dGcjN6MHQrRTlV?=
 =?utf-8?B?RE5peC83bC9IdGJReE1ZVHJMZkxrMWdhSlJCT1JGWFdjOG82WTZWZlJtTWJQ?=
 =?utf-8?B?TjZLbGNsWkFzOHNCVWRxWStpanhCanJ6MW9OZW5udWFhQnRzeGJRNW9NZDFU?=
 =?utf-8?B?QjIzZmJ3VGhGUjFwdHlmR3hTcHlVQjhjT3dKeXg0enJ2V1Y3YXkwOFhySUcv?=
 =?utf-8?B?dDZRVEgvRkhWeWZxYXZFVGtvRitnRlRtdS9lRzY1aHBzY0dGZjFhbmZPS3pU?=
 =?utf-8?B?U2p0YklpTkxZL05LeTFzdXpJUzZjdE1BNmltODVwZ1h1NjZBQlJLRTdYS1Jo?=
 =?utf-8?B?bFladFBNR29EalRxTit3azdUQkFGU3JNV1Zza3d4MEMwZ0pMTm55U25PS0xm?=
 =?utf-8?B?bTRad2lCdDF6UldFeVRkU2lnbHp1MEdzSndhaDJJTDNzajErdEpwRW9weG9z?=
 =?utf-8?B?elZpV0NhM1lKZ3ZwWnQxUFlOd2NRbFBoTENHWFMzK0hjNWhibnZiRXZhQXFH?=
 =?utf-8?B?UzlQUDh6aFZvUVlRZ2NlRlA0S3phY2hpWTR1T3RoM0hSQ2JVdjdwN0xvOTR6?=
 =?utf-8?B?RG1zUHplME04Qmw5b3g1SXJJb0VJd3Rjd2FGeG1ET0NqTktGK296NTh3cWRy?=
 =?utf-8?B?YVJwVStIK2k4MmUxS3hNR09hUDNWR3laTDBzT1NBMVBsUSsvWXE1Wnk0bHJL?=
 =?utf-8?B?UHV1UktNdnkyVzAydzR6ZUlHVTVqdDhDZXJTTW5zbHgyVnBKTmZPNytnR3Fa?=
 =?utf-8?B?MGp2UlF4bEJRaTY4QmZzOFZURFAxOU5QOXQ2MDNuY0l5ZGlLTGRubzIzRGZD?=
 =?utf-8?B?aUoybHJmSWE2clNKRlF3dWF4UkVpR2FzaFU5Sy9TWjlEVlZmUGlNNWhqOGE4?=
 =?utf-8?B?SkEwWUlNdjBKT3dQalFMRWVMdzRVN05CZnhiYUpraXJWeEs4U3JBdjZMV2dJ?=
 =?utf-8?B?QjZjaTNST3lLSFZtbEhVMnJnc2t5dnFveVVHTGxvam5XNnkrZEpVc0hVZlRN?=
 =?utf-8?B?dDFlNURENWx5Zkk2R2tVanZ1S05DODAxRURTQUgyZWNYRXlCVm0vOVhGbHlk?=
 =?utf-8?B?ZzF5NHE3dHZUbGhmYWltU0E2eGd2ejlndjNtcmZyNXdkRTMwbEdNOTUrMEZ3?=
 =?utf-8?B?WktwRTZISUgrOUk0Z2VMNlpTT1ZiQ0tNN2ZPd3ZSd1FKd2FaVmhnQzJtL21O?=
 =?utf-8?B?V1NFa0t6N1E0Y24wVFAvaGswQS84MjVsay8rbDBTWlhQbWNBRFFTMXdaQjZU?=
 =?utf-8?B?anhGMTgwdGdpWitBZ3RpZDQ0OFZMSVV4Uy91cFBzcnpmSTBXM004MjRndUdC?=
 =?utf-8?B?MjN3MkdNZmIzTGZLTWZRZTE2ZDJHbHFqbkE2Mk1iR2RSVkQwUDVwTnNBQlVX?=
 =?utf-8?B?WXp5Ni93eUg4anRGM0gxSjhVS2F5SWZGM1hqajFYNVNtVFo5U0dQYm1DVThZ?=
 =?utf-8?Q?xICij7FRR2kVSXYaMA6sYpw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13418d3f-762e-4904-7993-08d9e194302f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 12:54:43.1025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKYPJlMTQcDdVgcFGsuSZT0PhgIc5+lZndZ0GX0C8ec5sbhl1IzBunqzb1Vr6sXb0wVjY/+PA3wo/kvCm5FZMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9407

As of SDM revision 076 there is a CPUID bit for this functionality. Use
it to amend the existing model-based logic.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
It continues to be unclear for which CPU models, if any, the PPIN_CAP
bit in PLATFORM_INFO could be used in favor of a model check.
---
v3: Actually record CPUID[7:1].EBX. Adjust policy <-> feature conversion
    functions.
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
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -445,7 +445,8 @@ static void generic_identify(struct cpui
 		if (eax > 0)
 			cpuid_count(0x00000007, 1,
 				    &c->x86_capability[cpufeat_word(X86_FEATURE_AVX512_BF16)],
-				    &tmp, &tmp, &tmp);
+				    &c->x86_capability[cpufeat_word(X86_FEATURE_INTEL_PPIN)],
+				    &tmp, &tmp);
 	}
 
 	if (c->cpuid_level >= 0xd)
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
 
@@ -327,6 +332,7 @@ static inline void cpuid_policy_to_featu
     fs[FEATURESET_7d0] = p->feat._7d0;
     fs[FEATURESET_7a1] = p->feat._7a1;
     fs[FEATURESET_e21a] = p->extd.e21a;
+    fs[FEATURESET_7b1] = p->feat._7b1;
 }
 
 /* Fill in a CPUID policy from a featureset bitmap. */
@@ -345,6 +351,7 @@ static inline void cpuid_featureset_to_p
     p->feat._7d0  = fs[FEATURESET_7d0];
     p->feat._7a1  = fs[FEATURESET_7a1];
     p->extd.e21a  = fs[FEATURESET_e21a];
+    p->feat._7b1  = fs[FEATURESET_7b1];
 }
 
 static inline uint64_t cpuid_policy_xcr0_max(const struct cpuid_policy *p)


