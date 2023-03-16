Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F616BCC17
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 11:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510471.788157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckYU-00040W-FA; Thu, 16 Mar 2023 10:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510471.788157; Thu, 16 Mar 2023 10:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckYU-0003xG-CH; Thu, 16 Mar 2023 10:09:54 +0000
Received: by outflank-mailman (input) for mailman id 510471;
 Thu, 16 Mar 2023 10:09:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pckYT-0003xA-KZ
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 10:09:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b15e118e-c3e2-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 11:09:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7471.eurprd04.prod.outlook.com (2603:10a6:800:1a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 10:09:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 10:09:49 +0000
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
X-Inumbo-ID: b15e118e-c3e2-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3YezusTQ8bOl3QZd233UH7J2KKpJpKXTaTj1B0rvm/vSwhwI6AEpnxmrgn9bwLVbDFyIyz/SOdcmJVOfTx/dVLfjpv3/+L+4hAC4MZ2QqsEcgLVSmPvC1TUA6m+6Tx5AiPGrbvd+zDCvLrDb2SD9fBWasD488/he8cdUe5ITocCrfQD87Hk3l84dbEYvlM2iUhSynoBPWIpp8ePJgVX22UFpz54ftXVBZHOSNMPxv2kGNX+U9YHvP90emUjvJSBfbv6gUwxcdvN6veW1NJ4p96XL+QbqZOkeBA/AdMoa1kIGrLIlUn663Tj6w5aFcFPrDMwI+lH81uU4jKTsbCrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F61rJ1VJqnbVyOmO0Vewtq+N4fnWO8vW7lTHIHqvJKk=;
 b=DVPgBaA11qD6Nh3dJV1Aduavx6oNCDg7velrE4ENZ5MFPrfGnrdtitBkCFIWAvDWueaY5ORqqv/pS88pAQbvAzGEob5jLC5g+fiHeuUBVyoApk9tjHhcTd0j7mLGSV6C60nGsphwdxi0spRkF1+cK3qZ/SypbE0x2Uw9DDcX7sO/d1G3ca17NIxAMQPiLnCXn2su/yROrj6hkIqlwUVEci8CxC5PfCWScLupj4wck4QTEM1X5Oc7yioyaYkWikEBFV2/XvlxtLlBImzticNxlfymqL5I71GC6Ud0p+kgoa2EDpyi7QavKslH5Kj1hvl64jS7NCTuSfhQ/NCwvUay/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F61rJ1VJqnbVyOmO0Vewtq+N4fnWO8vW7lTHIHqvJKk=;
 b=RX9yOjXHCPia2n6YnKgfQfKiYMQlcSD1n6v9eKExt7stP6HWuQRHZBorfP30ST/ro98ZXFjXXHe0W5P1W3F18hJOVwRYGrlwC/yRQJJ9lVahq2SZm6IJXdQIgfUXqPkGhaLvXTmrDsnkx32yTVQWZ6hPpvYKnTGW9I/RviuL25beGJX+/XMEtGr4ByUKhrMmhOtzLSZ21qyPEXExH6nyjY6kc+tuEVwmagWM3OZTMm9tzR/w3CbPdvYrFUV9Za8xjai9ZQWf6RRZdfk/NDeVnXUzAts5xGigvjri7/jOVRCxcoTbueAR8H4B/P1YUh2DNe+SJoag4Rwnc0CFKrN2Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f605fa5-b763-bc8b-6bb0-b70e718eb585@suse.com>
Date: Thu, 16 Mar 2023 11:09:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: don't include processor.h from system.h
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc07265-303e-4614-a58b-08db260693d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HnK2GoT6yHTz86JrN6s6kKEHCWme85NK0uh7JJ6CAdegHER3s4GbzfA9TD+K7Tf5GijNB2alpPCmrlzIst5oB+WM7kwxPIJzp1gpeHdB2QvVa74Fb/s9WW/T33jULqC6LEwPOE8oSZvkIKJxvrNn+HqS3wSxUjLQCOJ1NqeuvXQB5LejIZvhrLOdO4F0ZHmjbdk8YSqgCxlVyfp2KqnegzoeAgkYnhlnVek60SaDvSH0pNbDZq0Apqxh9Te7M2472i6nMCkOMIqRY0Lv9F0LGfuq2KUiK9+gCHj+X5BnwCahWduDYDJ1zc7zoiEr0qm8xu3h0qfz+GdrY762jJZ9h5mPow0uqqTynGLEESjd3k/ewDKLwGcJJ0MggnQGupjX12MNKdXffogKb/hqTyzUhrgxrt0wVQR/nxemIpD/r6/PsS+GqutJUivA1Hy9GfjtMSGC+BRxvljFj6Q/zEM4TqegubRmAUxJ+KwWy9z58xyjD8S6pcEjNV+EjdmQ1/IBpkeZLiIczvEePPFEpdDdVRH2pOWp56SWik4id8IwMNOoI1z6Bm6pgTkhb8wQRT4h1Mc62Kf1zVxmRv9MEZaHuCVHYvhuvxr5WT77EcxgTAMnbcX9t7g4uZSjqQRNeWhNvTklvzfMhXh3H3+5Lux4+INDm8vC0Cjt52k7EhXLO/xQu4fUABqHPryt0prvr5FSjr87J4wbk8kcajSQVjOZDjAFTLhTj7BsABhBfSHi97c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(346002)(376002)(396003)(39850400004)(451199018)(38100700002)(31696002)(86362001)(36756003)(2906002)(4326008)(5660300002)(41300700001)(8936002)(6916009)(2616005)(26005)(6506007)(186003)(6512007)(316002)(54906003)(66476007)(66556008)(8676002)(66946007)(6666004)(6486002)(478600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlQwcjFPR2c0WExUVE1rMVY0emV4ZTZGYUR4RExsQXdEK0EyWmN1S01UTkNp?=
 =?utf-8?B?ODJ3QkU3SmQ4VHBWQWJldGZzYnUzVjM2aUhwYStLdGY4NXcwcndMTW1rV3c5?=
 =?utf-8?B?cUdkSEVQcndxNHl2QWhIcmR2UGhCb2w0d2FMTlRUTW50b21kbGdVYXlDbkt5?=
 =?utf-8?B?S0ljL2swZWVrREg1S1VFTVd1cnlCRks1clZCbE5oTDRtRXFZaFBSRjBtUFpE?=
 =?utf-8?B?eUwvdDV6Wk1kcHhYU1NzSHhOUWZkMzJ0SlphWWZvL3VuTlZGNlFxbkRpam1Y?=
 =?utf-8?B?SXFaNHVObVA2QkhaOW1XOHE3RW1STTJ3dGxGYncvdk5YRDhxaWpTaEd2OGlY?=
 =?utf-8?B?ZXgwR2w1VWpiWVhvRGN2cTZTSVA4aEExalNYY0dSd1U3VGYyWXN6Q1B2NlRr?=
 =?utf-8?B?d3FtL2c0K1J2dlF4SiszSzJnUkc3Z3BYR3dEclFMemZwL1RzWWtkMzdLMTgr?=
 =?utf-8?B?TVRXdFBRZUovUnNFbnYzSFJFK2szWDlLZjhESTUwR2pFWWRWMGI0Nk5ubzl2?=
 =?utf-8?B?RWUwR2MzSjlZOEFNbVFwcy9HQ0FnMCtKKzVFbHBnR2dOdDJOT25acS9lTGRo?=
 =?utf-8?B?VWdteW9YcGUrRGtVdElQalRxMU9QZ29SSHlScmhsQlR4M0d3M0RvQnh6SXJm?=
 =?utf-8?B?dzBuTXB1TGVtcllQam9ZVytLZGpyM2VPd1hyZ05sbjhYZ2hFdXF3Y1IwRmUy?=
 =?utf-8?B?ck45WEJDMGFxUzEwTFVnOGMycmE3VEVQL3NVNEJrVVowMWRmaUNCQXRhZlRB?=
 =?utf-8?B?SkZCRnRYTnM5L29mYjF0U3BHRWhqb2FCUFJvaFZQclhmWlN0TktodGF4NFRw?=
 =?utf-8?B?UEdGVGpxM0doKzV0M3BKcGlVQnVGZ1dQZlEwUDl5aXYwVFNRMGN2R0RmWlZn?=
 =?utf-8?B?aTRsNVMvaEh5N1BHVUJTMnJUQldMRXN6MjUyWXZ2RzBFeVJUeHNwQzhPdVpp?=
 =?utf-8?B?djA2NUlxam84U1NhYk1UUXRNZ1hLekpydHJsVXFQRXRzcW1ZWCt4ZXd5Mi8z?=
 =?utf-8?B?eFQ2bUVWL2NKWDdIWGdkai9lK0d1Nk1NeWRCQzQrbTk4N1ZVMytaUVVVM0xK?=
 =?utf-8?B?bEJBRk44ZTJETGZpQ3FMMkJZcEpIWFFWOTBmL0ttQ1dWQkQ0ZWFCKzhWZzky?=
 =?utf-8?B?bUk1QUpGYlhJbkhxajVTOGxuSnNQVjM4MEhweTUzNEhNZDRPR3ZYZExTUTZB?=
 =?utf-8?B?dGlnUEhDaU1GbW5hUVQ2SDFMZkd5Q0NMZEF1Vkw2a21TU01RUmd1TTA2ODZS?=
 =?utf-8?B?TzFqeGlhZGRQMUNrY0VpT0pueVFrTFQrMkFBekgzYzNpVTNmeTVRdXZBQkpO?=
 =?utf-8?B?TzF4VDEzK3JSYlFDMG1selU3MWlwUldLRGZwdjkwSHBLNTlLNDFkWXlJdyty?=
 =?utf-8?B?ekxhMnluR0Zka1FTRzJlZjZobGNaV3RLVVM4d0VBeXBrRy9sajVmWThZL3Ny?=
 =?utf-8?B?bEl4bW1Kdzd2R1ZOb0MzNmJ4LzVvY09DT3hmNStUU0IzampaL25CekJFSzZT?=
 =?utf-8?B?d1NJVm5TZTdjVU1LU1F1OXRyZXNhV0F1RlA1cW9UZTdaN2JKL3h3TnZhdkdV?=
 =?utf-8?B?Ylp3YlZsanlLdkZZQnFFdVo0WnBGZ1BOaklTNFFNZWZHSytHZHlUMjdxd2Q5?=
 =?utf-8?B?Z3JZMWpVUWNIa1VjOG1pTHRVTW9kOXZQSFVDb2RRRmkvd25kV00wSTM1cTgy?=
 =?utf-8?B?cExtYXh3bFZ6NU52YUQrM3h3TnlEY1dlN3NkRXhoa1k5ek1EdlJwY3ZvQkJh?=
 =?utf-8?B?NE5JZWsrK3hpbTRMY1pyYlNjVXRiL2FHRVdPd05FK1ZveEFsWnlmVS8xaVpL?=
 =?utf-8?B?akhrcVR0Y0RvNXVGOWozVzR6OTNFVitvTUExVytSLzdSQkZPdTBvRjBZWTVD?=
 =?utf-8?B?Z2lrVUtzSERLSzhzeWtkM1BxUGc1Q1FzQlAzRVE3ZlRBZ1hQWWhVRHl3MEl5?=
 =?utf-8?B?Qjl6OC9VNkxqczZTU3d3bmRKK21ZN28rZG8yWXMvMWE2Y3hMalloMGpMWTFS?=
 =?utf-8?B?TmxUR21uT0RqZUhEV0NIelU3TGtpT2tXc0xVMitKZERRTUJVZ2JSSDlUcEVp?=
 =?utf-8?B?WDBrRnh1T2FJbVFEa2JoZXBMREQwM3lUeTNZcUVpSG0waFF3R3NiRzk0b044?=
 =?utf-8?Q?mT2xZDLEc0gJBYrPRA2HLeFMn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc07265-303e-4614-a58b-08db260693d3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 10:09:49.5931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNQl43WX5gMU56uCYlsQEAY8LsOzBm4338VpHrSoXCHQvsz1d9nRMoLOC8ZWysyqHqyjizUpYvhbnnr33wWIjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7471

processor.h in particular pulls in xen/smp.h, which is overly heavy for
a supposedly pretty fundamental header like system.h. To keep things
building, move the declarations of struct cpuinfo_x86 and boot_cpu_data
to asm/cpufeature.h (which arguably also is where they belong). In the
course of the move switch away from using fixed-width types and convert
plain "int" to "unsigned int" for the two x86_cache_* fields.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -19,6 +19,30 @@
 #ifndef __ASSEMBLY__
 #include <xen/bitops.h>
 
+struct cpuinfo_x86 {
+    unsigned char x86;                 /* CPU family */
+    unsigned char x86_vendor;          /* CPU vendor */
+    unsigned char x86_model;
+    unsigned char x86_mask;
+    int cpuid_level;                   /* Maximum supported CPUID level, -1=no CPUID */
+    unsigned int extended_cpuid_level; /* Maximum supported CPUID extended level */
+    unsigned int x86_capability[NCAPINTS];
+    char x86_vendor_id[16];
+    char x86_model_id[64];
+    unsigned int x86_cache_size;       /* in KB - valid only when supported */
+    unsigned int x86_cache_alignment;  /* In bytes */
+    unsigned int x86_max_cores;        /* cpuid returned max cores value */
+    unsigned int booted_cores;         /* number of cores as seen by OS */
+    unsigned int x86_num_siblings;     /* cpuid logical cpus per chip value */
+    unsigned int apicid;
+    unsigned int phys_proc_id;         /* package ID of each logical CPU */
+    unsigned int cpu_core_id;          /* core ID of each logical CPU */
+    unsigned int compute_unit_id;      /* AMD compute unit ID of each logical CPU */
+    unsigned short x86_clflush_size;
+} __cacheline_aligned;
+
+extern struct cpuinfo_x86 boot_cpu_data;
+
 #define cpu_has(c, bit)		test_bit(bit, (c)->x86_capability)
 #define boot_cpu_has(bit)	test_bit(bit, boot_cpu_data.x86_capability)
 
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -118,34 +118,6 @@ struct x86_cpu_id {
     const void *driver_data;
 };
 
-struct cpuinfo_x86 {
-    uint8_t x86;            /* CPU family */
-    uint8_t x86_vendor;     /* CPU vendor */
-    uint8_t x86_model;
-    uint8_t x86_mask;
-    int  cpuid_level;    /* Maximum supported CPUID level, -1=no CPUID */
-    uint32_t extended_cpuid_level; /* Maximum supported CPUID extended level */
-    unsigned int x86_capability[NCAPINTS];
-    char x86_vendor_id[16];
-    char x86_model_id[64];
-    int  x86_cache_size; /* in KB - valid for CPUS which support this call  */
-    int  x86_cache_alignment;    /* In bytes */
-    uint32_t x86_max_cores;   /* cpuid returned max cores value */
-    uint32_t booted_cores;    /* number of cores as seen by OS */
-    uint32_t x86_num_siblings; /* cpuid logical cpus per chip value */
-    uint32_t apicid;
-    uint32_t phys_proc_id;    /* package ID of each logical CPU */
-    uint32_t cpu_core_id;     /* core ID of each logical CPU */
-    uint32_t compute_unit_id; /* AMD compute unit ID of each logical CPU */
-    unsigned short x86_clflush_size;
-} __cacheline_aligned;
-
-/*
- * capabilities of CPUs
- */
-
-extern struct cpuinfo_x86 boot_cpu_data;
-
 extern struct cpuinfo_x86 cpu_data[];
 #define current_cpu_data cpu_data[smp_processor_id()]
 
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -3,7 +3,8 @@
 
 #include <xen/lib.h>
 #include <xen/bitops.h>
-#include <asm/processor.h>
+#include <asm/cpufeature.h>
+#include <asm/x86-defns.h>
 
 static inline void wbinvd(void)
 {

