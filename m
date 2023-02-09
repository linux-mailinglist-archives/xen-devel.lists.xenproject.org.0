Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BBA690543
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 11:43:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492300.761785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4OT-0002tP-EH; Thu, 09 Feb 2023 10:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492300.761785; Thu, 09 Feb 2023 10:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4OT-0002r0-BS; Thu, 09 Feb 2023 10:43:09 +0000
Received: by outflank-mailman (input) for mailman id 492300;
 Thu, 09 Feb 2023 10:43:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ4OR-0002qh-Df
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 10:43:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8726017f-a866-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 11:43:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9649.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Thu, 9 Feb
 2023 10:43:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:43:01 +0000
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
X-Inumbo-ID: 8726017f-a866-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGVQX2k2/gZbC2/zFX7PsMzUPIQZHjCjEv0pkHxb5+suyv6EqKeT0picWHB9B2heVw4ijaecjG2VVuflcRDhaD2p1ZFz4SkGEe6e6NeDxprXoPnDx6IPVJjXTPg/O+dr7KHrPXCOkCVwTAl85zxY8dNqMj9457mOCsTjZJJLp1worygIz8ebrpeaSh86ilVjDBo3Ypbmq3RKoEtM6s1bVVZbuPGKW5HkeWa1N+TbLlWt/Zt1NrSRDLFTgCxrxUqQPYPVd8nCVLRet/2DOyP+IC+KxD6wOW8nPLd32YZRGm+PVxINrMWgs8aoj8HF4IyrD1EygOpT6zz4cnK+ZraFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJVJeI3VEzCV6YzhKqBfgIWU3kFqNTq9u2bZ49rhjQk=;
 b=NtN72dCwfen2oRhnSjBrLirE4DEQduXdLtDAanyolrc/xudQ3nnuJcLxw6ag40mcAbcr+foW4xvdbGqOPygeoexQLgB7GGMB+KYemQcs9HjGO1WG9W4OinmqahX1qEXcEQo2oxr5qaR0cY6Qnwx5SvFkj1C76XcTSif2lHfHiJZguGXzImXCwR4bsbHVGzzpncXxEGFSiIUZOu2d2IGWb1trA87YRkTLmli9qzmtgv/52Ty5thk30ImmocJeD1U493aWta/1cIEvSwiM//KsU1gdq9+SN2OG88CjOJQV/lwFOVogy6WFjRkBNqY+1GPpnaO15FK3By+sUlI7PC7IIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJVJeI3VEzCV6YzhKqBfgIWU3kFqNTq9u2bZ49rhjQk=;
 b=w+W64sXlQehQ0GrzRlLJmLNgtwCFrNV1+Hc5mSl2rtluAevrC+pLsro6ShBB21iTdXx0w2t+ED0zeV5TN9WIOTr272QL+MsS2hdVn+tb3fVLNeWoSCKEl3XQ58BZ55gkfeKC3LWGJLZTJimZRxr7EiCMhGBvTHCmbkYnrADefCdnUAA7UQP5eAcpY/1qaswiYkpPDPo3sbC+FWBlai/D0+oOPFheBA04UrUJMRcz4yTL5NHtoIZBsEBX/B1wWHyemB3aIbnB8H7A9tIS5p6lhtIWH3R0vuyLxQshusX4KO2J6/F08Gr6lYx/gHlt/LdKdrHZpypt4GcSJYSxzBciPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <969e851e-5674-9aa5-b00f-4fe4d4cf8e5e@suse.com>
Date: Thu, 9 Feb 2023 11:42:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH 5/6] x86: use standard C types in struct cpuinfo_x86
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
In-Reply-To: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 13d93d16-cae3-4276-3880-08db0a8a6aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QyOkqZrvgrRuO6IjBt3DPNA2UivYIMN+D5ynzjUX3Ygy1Ck0BPmMysFETOROs5c2kkhjML6J2kmHG1w9yN7OSrXrFPfX4jkIiO3HMEWR+SffWNbNd7kv7yTDc8Xkl7wOTGULROhADId4rI5ISPs6vozxHhOaSJNuzJnLX7Z2uUk6pWz+r7wYmTVjWLZN4u6ObpZCrJVngxS1W98sJS6J9lDinW5B8q6ZwaEe6Jjd1O9vgx6RWUQtsR18SWTKxnX8+MlOCilmpifqyMZhyHswNRo2N/Um5ODlrmTtHdoT4JgRtwdIaWPXnP9T1jF56xQ3DhkXpR23cT2hVAS/AR8tMs8WFuD+qpF/C1iov56Z7N3AcEpGI5I7ZelRl9kSGNdr+hR6EbqzGcl67InASe28Tf9Vo0AxZYKdqjdsdvfxxW80OKK0AxAH0FAdjtmnZ07IhkQGrrFMi8p4v2Q6vhF2HBw9NX2D97ls3hmN9rmgoFaUTH6G9R3fi/bOpy/YRgYpkZ0L0EnX35ueNnSoYhfDnB5LIA5fA+HrBlIfoB4pu8fAjppbIZ2GBYhZ18ZLsJZx0AZ2urIm8dTgqolKq/dJhlP6ybBSxPM1n5vk1fbhh9/+M5v6DpImf/4796UUZ+okc02HwTsdFkJ5L1ESj5e4/BzWso4lCUzmIqfdug3M0vi8DsTqEQzIUOgmzGmc4kXwIrpqTUvM383GrhErrsz8yLyO3goKvbBOPavXA98dxQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199018)(4326008)(6916009)(8676002)(41300700001)(66476007)(66556008)(66946007)(2906002)(36756003)(86362001)(31696002)(8936002)(38100700002)(5660300002)(478600001)(6486002)(316002)(2616005)(54906003)(6512007)(186003)(26005)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUxmSnlRM0VOOUNWdlNqWDZFMzFTVEJRZmluaHhDTUZMZ2Y5ckNISGpFdStj?=
 =?utf-8?B?K0s2S3FnalQ4QXA2ZkRCOFBUSHpYbWowTzRnS0h4VHJsRnQzVmROK1M4TTM5?=
 =?utf-8?B?RnI5Vnd1RHFGQ1NTcTJTRFRoeGtGRzJhUEpROUs0b3J4UDRzdTJ1V0Nxajhv?=
 =?utf-8?B?VXdROGNSRFdvR1JtQ21zcjhvd2F0N3k4V00vK1VjeWY0ZEQ4K3M4VFNoVWtN?=
 =?utf-8?B?dWJ2WTBldUcxMSsvdDE5K2dtMDhxaGtTUklzekhzTko0d0NxdVJxcHcwMHBo?=
 =?utf-8?B?bEhyTzFvUEVJRFhHSG1DMEo3cHFJL1g3UExmeUc0YXBkN2RvZVdlMVY0OE5N?=
 =?utf-8?B?cCtUYnUrZXAxay92ZmY1NHE2RHVxTTJGRVpWSk1Xa1RtcHdCR1JXTS9CVFpT?=
 =?utf-8?B?cXFUMFNJZHhkYU9BdEhOL1o2eFpacFZsTHhmdXBGbHBrbjZRM1kwOWFPVEdO?=
 =?utf-8?B?TVpLZExSY3FUVS9xNTZ0NmpDVVZuTzJiMGtkMGZjWS95UGpBNTkzd3RIZjJu?=
 =?utf-8?B?U0VOVXpvdHJlUlR0bVBNYmlzNmhjdkdzbmRCQm5LSXgzNTZKZW42QnpQdlhs?=
 =?utf-8?B?VzU2Y0phZ01Oamhzc0JPMkpLTFhSZVl1WlV4VW9vSStEOXN0ZTNDbzZaZDRx?=
 =?utf-8?B?RXJlTloxaS9IaWhZQWw4aHVDNzFKNUVVYmVUVzdvNXA0TUp0eU1JSmlsTnQr?=
 =?utf-8?B?NkZlS1lJdDA2MlhzMFFHYWtQMHVsdzNSeGx4TUtDdm1hQXM2emEwSldKcGto?=
 =?utf-8?B?dEUvTUZQVEVLWkxCeXMwTTNuWENoci9WNEZDaVN6bS83Nnp6ZWRrSkdWdzl0?=
 =?utf-8?B?ejhZRkRocytKVTNRZFNxcmFtVnpGTVJGbXRiTmx6VEJtNUNlODdWcUdCU3ZR?=
 =?utf-8?B?b0hFMkNuNE94MDZWRUs2eFFUYVFPT1Y4WGhFbVBsYXZ6UFhuU0thRXBlL2lj?=
 =?utf-8?B?OUZRWGQ5QStRNlF1MER3UGZMdWFJQkpmWE5EdGorRlczQ0pkUFRSOXdOZkpo?=
 =?utf-8?B?dFJ4TTYweTlJNXRhYmJBNnB0R3Vnamk5ZzR3TDFlNElGMG5yaWxmTVVrOUty?=
 =?utf-8?B?bU54aVdSUTR6Vis0RlF5NjRqNzBXOUp4blFKQk5SemVpU0lnQ1NvUkRHUDNF?=
 =?utf-8?B?dHJjOERpeE9IOTBwejFETk8vU3J3S1BQdmdEWno4cTF6YlluMTIvZ2VxUFg0?=
 =?utf-8?B?UVplK3JSRGRRcmczMkl5QldleDltYTlWcEY2V1RERE1MUUdyV3pWUk02TDhE?=
 =?utf-8?B?SnVva1FIWU9UUUs2WkRFc0twY0NCbzAreVo5d3lYckUwNGhwRHZjS1BJVytq?=
 =?utf-8?B?T3cyNXJ0OTdwa21odjUvZzVHcnJYS1RPbmxPV1JmcWVVbmxON1ZiWVYzZzRE?=
 =?utf-8?B?eEx2OTArenNEMjFBbnVLQk1jWmpaamZKMWw2c1VUWGNrOTIzNFhHSU9VUTBO?=
 =?utf-8?B?WG9TSVlvUVdvRXhBd2NHdTlGbFRyQlRPOGlMOXY3MVNIMHc3N214dzAraW5L?=
 =?utf-8?B?UEVIbCtQQzl0M1VFWHB3QXJaZUh0UWE0eTF6aFNXam5Qbit4SjdBR1FETkNK?=
 =?utf-8?B?ejJtKzczbmFvRFVHbXpnRXduY1FIUjZQWWNOeTlqaHpoUGJVVWRPN0RzQWxB?=
 =?utf-8?B?UDZrc0p2WVZTSHlTc0xNY0hLaHc5K3crdzIxOVBKeEpoOENEK1ArS3pLaURx?=
 =?utf-8?B?cjRJVG9Pd0ZHRDFLaGxrM2JrdWR5MG9FeTdYSzBCeWZqcC9hQ1h2QjgxSjNh?=
 =?utf-8?B?M0NUbzQ0UlMvb1ZmTkUrejRibXdKRUt5S1dDZVF2RzczUDUrSEQyZTZ3V1Fq?=
 =?utf-8?B?SDBhZUhrWVFNaXpQaldEQjBWaTBmTk42eDdkZElqaGlJeDhGZEpUL2tpSjVQ?=
 =?utf-8?B?Y3ZML1VlR00rdkQ5VDROZlVWa0NMTDlDbzhXd1V5cm0zamlJMDZiOVBJSVhy?=
 =?utf-8?B?Vnd5QjVEOUduUVl6VEpmOG42MGJ5aWhyZUtxelJ1QWtqM01xUzFPZTZEeXJS?=
 =?utf-8?B?QkYvL204T2R2L1RaRjZEOUFwN0R3ZllIQkN3NVB3Rkk3b2ZMb0JWaXlNeWho?=
 =?utf-8?B?dUl0cDdKQ0JzdW4xS1BPcnIwbkgzLzN4VWRwVlVQV1V4djcxZEVSN2R5VWJW?=
 =?utf-8?Q?t4dwrMRDEO7MASw2/mqtjCHmc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d93d16-cae3-4276-3880-08db0a8a6aac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:43:01.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnabBtj8Heszq/9zguIyLxYQx8fDP631u41/UHx+clJdfiz3ND0cAQx7zGUj3ZmuW9w0BfMpEJAZmVbksxMTpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9649

Consolidate this to use exclusively standard types, and change oprofile
code (apparently trying to mirror those types) at the same time. Where
sensible actually drop local variables.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Much like x86_capability[] already doesn't use a fixed width type, most
if not all of the other fields touched here probably also shouldn't. I
wasn't sure though whether switching might be controversial for some of
them ...

--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -119,24 +119,24 @@ struct x86_cpu_id {
 };
 
 struct cpuinfo_x86 {
-    __u8 x86;            /* CPU family */
-    __u8 x86_vendor;     /* CPU vendor */
-    __u8 x86_model;
-    __u8 x86_mask;
+    uint8_t x86;            /* CPU family */
+    uint8_t x86_vendor;     /* CPU vendor */
+    uint8_t x86_model;
+    uint8_t x86_mask;
     int  cpuid_level;    /* Maximum supported CPUID level, -1=no CPUID */
-    __u32 extended_cpuid_level; /* Maximum supported CPUID extended level */
+    uint32_t extended_cpuid_level; /* Maximum supported CPUID extended level */
     unsigned int x86_capability[NCAPINTS];
     char x86_vendor_id[16];
     char x86_model_id[64];
     int  x86_cache_size; /* in KB - valid for CPUS which support this call  */
     int  x86_cache_alignment;    /* In bytes */
-    __u32 x86_max_cores; /* cpuid returned max cores value */
-    __u32 booted_cores;  /* number of cores as seen by OS */
-    __u32 x86_num_siblings; /* cpuid logical cpus per chip value */
-    __u32 apicid;
-    __u32 phys_proc_id;    /* package ID of each logical CPU */
-    __u32 cpu_core_id;     /* core ID of each logical CPU*/
-    __u32 compute_unit_id; /* AMD compute unit ID of each logical CPU */
+    uint32_t x86_max_cores;   /* cpuid returned max cores value */
+    uint32_t booted_cores;    /* number of cores as seen by OS */
+    uint32_t x86_num_siblings; /* cpuid logical cpus per chip value */
+    uint32_t apicid;
+    uint32_t phys_proc_id;    /* package ID of each logical CPU */
+    uint32_t cpu_core_id;     /* core ID of each logical CPU */
+    uint32_t compute_unit_id; /* AMD compute unit ID of each logical CPU */
     unsigned short x86_clflush_size;
 } __cacheline_aligned;
 
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -311,11 +311,11 @@ void nmi_stop(void)
 
 static int __init p4_init(char ** cpu_type)
 {
-	__u8 cpu_model = current_cpu_data.x86_model;
+	unsigned int cpu_model = current_cpu_data.x86_model;
 
 	if ((cpu_model > 6) || (cpu_model == 5)) {
 		printk("xenoprof: Initialization failed. "
-		       "Intel processor model %d for pentium 4 family is not "
+		       "Intel processor model %u for pentium 4 family is not "
 		       "supported\n", cpu_model);
 		return 0;
 	}
@@ -355,12 +355,10 @@ custom_param("cpu_type", force_cpu_type)
 
 static int __init ppro_init(char ** cpu_type)
 {
-	__u8 cpu_model = current_cpu_data.x86_model;
-
 	if (force_arch_perfmon && cpu_has_arch_perfmon)
 		return 0;
 
-	switch (cpu_model) {
+	switch (current_cpu_data.x86_model) {
 	case 14:
 		*cpu_type = "i386/core";
 		break;
@@ -390,9 +388,8 @@ static int __init arch_perfmon_init(char
 
 static int __init cf_check nmi_init(void)
 {
-	__u8 vendor = current_cpu_data.x86_vendor;
-	__u8 family = current_cpu_data.x86;
-	__u8 _model = current_cpu_data.x86_model;
+	unsigned int vendor = current_cpu_data.x86_vendor;
+	unsigned int family = current_cpu_data.x86;
 
 	if (!cpu_has_apic) {
 		printk("xenoprof: Initialization failed. No APIC\n");
@@ -406,7 +403,7 @@ static int __init cf_check nmi_init(void
 			switch (family) {
 			default:
 				printk("xenoprof: Initialization failed. "
-				       "AMD processor family %d is not "
+				       "AMD processor family %u is not "
 				       "supported\n", family);
 				return -ENODEV;
 			case 0xf:
@@ -458,15 +455,15 @@ static int __init cf_check nmi_init(void
 			}
 			if (!cpu_type && !arch_perfmon_init(&cpu_type)) {
 				printk("xenoprof: Initialization failed. "
-				       "Intel processor family %d model %d "
-				       "is not supported\n", family, _model);
+				       "Intel processor family %u model %d is not supported\n",
+				       family, current_cpu_data.x86_model);
 				return -ENODEV;
 			}
 			break;
 
 		default:
 			printk("xenoprof: Initialization failed. "
-			       "Unsupported processor. Unknown vendor %d\n",
+			       "Unsupported processor. Unknown vendor %u\n",
 				vendor);
 			return -ENODEV;
 	}


