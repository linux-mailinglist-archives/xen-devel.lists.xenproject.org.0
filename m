Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D77A64B450
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:38:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460567.718502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53cD-0004D6-Sl; Tue, 13 Dec 2022 11:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460567.718502; Tue, 13 Dec 2022 11:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53cD-0004BK-PU; Tue, 13 Dec 2022 11:38:29 +0000
Received: by outflank-mailman (input) for mailman id 460567;
 Tue, 13 Dec 2022 11:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p53cC-0004BE-Bt
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 11:38:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a89e90cb-7ada-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 12:38:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6773.eurprd04.prod.outlook.com (2603:10a6:20b:dc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 13 Dec
 2022 11:38:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 11:38:24 +0000
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
X-Inumbo-ID: a89e90cb-7ada-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LA0D0LxmkAf+yF3cRNmCoCHyzlkaPKqJajBO8dhpqQoSZihGVGi9KR5IXfMxda2Y+tE8zt/dD4Rt7dIOt+6vCA3rxqbDQ7T6U1DQtgmqpPDAf+cf1NJ7tRBypBwvC22CUkansP3Q3Cu5mz9HiylDTbPZa3RTepj5AzA5UpT4YB4V01ch/6pw3TlKBMXXAAc5K0HFl7bySuh0EUYlHhEeP/5LQsgqqu4KllZ9EhmoV6kkOPZ7WRXifaw9XUHH2KJLU/O6fHrYDbG/54l2GzoYMYJDVrc6ZrRkMBJzQyfxuoiJJVmXBFFyG2YCe67psGsUEf00kmN4vCnYSH3g6O2hcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fKU73ItCQMSb+9aoT7onl24CYSr8frLerEBargv7u8=;
 b=h+YsQEDPYV3gG8zrouq8E37Q3ASRzFGj0KsyF7rFwqA0E2HEjoaBCJupFFmBh1kvGnoolxt3RbOwvsj6LATmYkzoA9ecD2v7PdYt+qxKL9rTGPpJit1Ti31ssAL5OvG7CZVSpg8rrshRJbPUyp62zof2X2nZa+NCDwxtOmUd4nQOilBCSiE8zO5u8PfCdz0aRwPCBPT/qjZd0ki1T9VHtX+/XCG4nIWFTK7mSX9sbVDThNklzFZIHyjuJiqTeVxpPsi2lqKukXz2cAGWlmn0eJ3H4RtcawCQ4KxBCchhHtKp5qLLIpGEO41YtNdcNRA3EmfnS7eBtgkWch96FkB7Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fKU73ItCQMSb+9aoT7onl24CYSr8frLerEBargv7u8=;
 b=oVlhHI6GZ8s99s3Z5w/lhE3Xl4TA0Q67nHrKjTxWN0UDuhoTpd0jikCa9uoSiNTjiN/DAtOSx8xYngBfQw1zWTg3FI5/8txIDy/PddZ2gcrBIrjbT3UHSI3DYJ3oCUe8736VdRqReNYny+cJ8zqZnZkBDAlxGrkgo0tscb8ejO80ZuyhiVP3texo8LKjH+7LjIKPfYWGoqXWPTmgINHn6AFRQJYVP1s/Lx7TKOJCkHshVrMYcSa0T09cslHGScwpdaIIklotf6tFzaevmUUc0irMCZ4O6gK+rHoGTIxI7XI7FvcJOwLZc5RXYQ0Bw38GzdjvACjQslS6m7Zrg6s4WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <670b7017-4a6e-fa9e-9d65-65013bd4ad80@suse.com>
Date: Tue, 13 Dec 2022 12:38:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: [PATCH 2/2] NUMA: replace phys_to_nid()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
In-Reply-To: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e5c921-9d92-4a71-c6a3-08dadcfe8b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4na9XTIPMtTlX9vSVrveEyO49QjKIJpTgCOD2IBT1ppehiI2tiDh/GBooHKmawJ+2jVYTsr1Prg4JJPY52nT9oRF1hu+u1w4WpPzVCjJgPW+Y+ZsIkoyq0RvlAEgYCgh0SQPSZjQlkjauEHwB8yH4FInvZdeD3m1gr3+z1VJFKySFAjJcGExAzICzbNJh9kbAv4OL+5Btj/QWROkL2yU3IySUN77JA+tGWxcNMuqZkg07BxY1yR/ZEh2j4YcMv1lsYujZRDhRDfihetqofnBm1BSZXbTWBOGNPZw6fnHi3FW8u5pcF9H4WH6KGXVY96+J8bwQ4KSpBQ35evZ/lU3S2AX+5Fk8onrqUQD1LMPLVjAa6lz9cxGwFZ/oMwVmqB9boUv1pV6acsPtbsK2tWYzYIiBHW4LGjEDTRKltuSdToc46cE4+Ed+k0xi5YzUegaGcKXO6D1HFEJpjOaxqlct+cMlrGg75BYleoYExP9H7GgKlMWjvvgF1Nf+cJtM9K1wOdz5SBVkUuDYuYQn78BCexN6S9Vjl382l/QAl0lQW4UaCZVNpScNElnXR27j2nJB0bf2Id7k/1W+uPnfH9594QwPjlG1Reo9M/hDKjbz0vzS8a2KD/Grt8++V01Q0+mUN44M7DQCWJYSiNNO8o1wZiZFCXoyXJjyTWs0a0RdIRbSulU+STNSM6FYuZnZ0u4BiaFjtCyE/u9oLkIP1/1S0qa6GZ0aoUMZA53SJNFkgQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(38100700002)(31696002)(6486002)(86362001)(5660300002)(478600001)(66946007)(2906002)(41300700001)(66556008)(4326008)(8676002)(316002)(83380400001)(6506007)(186003)(26005)(8936002)(6512007)(66476007)(2616005)(31686004)(54906003)(6916009)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUdOaTh5TnJBdEVIbGFZQ0V3ZkJtZXZrdVM5bVluYWpKb04zNmxiRXdMK2da?=
 =?utf-8?B?VFZHZ2xkVTVMMFdyU24xelVIWHNkWG15QkdCVzV0aklZb0R4WVJxRXJTRFpv?=
 =?utf-8?B?aFVoWmdVQmN1RkduVFA0aC9SUm5HMis3WTNOV25wRExnNTBWNW5TekkzWmZi?=
 =?utf-8?B?S1RIK3lCK3JyV3dRMjB0WDhiU3dUdVo0WlUxMUJWUDZOMmFjT2lWdTVCckFn?=
 =?utf-8?B?eHVYS1lZTnRzMllTU1NCc0FPaEFsOVR2MThYNXRCMWdOK2lGZUlETVZIK1Rj?=
 =?utf-8?B?Q1h2Q3VoYkJKTVpaN2R4U21IMXgxV2E0Wjdha1R0bHd3QUowREt2OEh2U0hY?=
 =?utf-8?B?c21LMjE2REJhc2RwQzNKSGFHWDczR1Z1ZE1Sck1BaFgrZE5TRTcvcXZyMWFJ?=
 =?utf-8?B?MEJTRUxxNEZSYVhtQmw5RGlKUEtVMlNEUXRBZEZ3UCtkcWJQSDlhTkxUQkhB?=
 =?utf-8?B?Y210Szg3WDNrb3VBVkFSV3hQV1dsczRrYkNnRzMya0lsOXRPQThjWjVGRklJ?=
 =?utf-8?B?SWdkdjEvL0tzM1ZndGtrbzBRcTR0M1l3VHp3c3d1bisvOC8va2RkUWlMbEl1?=
 =?utf-8?B?cmlRTWMxcmFhYXZQRUpYU0FxUU8wZ0Z4UEhUd1Vrb09kTkE4amZTT3dNc3ps?=
 =?utf-8?B?RDBRenBaR1dXZVdQN3JCT1REZXIySTNkMHU4UjZ0dTFlN1Z3Y2xkZnN3aXJr?=
 =?utf-8?B?RytRZ0hMRDh1akFTSS9JWktpMGl2V2NWQVdKS3c1eDdOalZUTi9RTWZpSUpM?=
 =?utf-8?B?WHlyVk1yd0J4NUNmZmxwbU5nZHJyc1lrZFdaOC9SRVd6TW4wNkpSUGVEVmZm?=
 =?utf-8?B?eUJCQkVTWisyRStqVzEyMTFZazFHNFJWd0t3TDBxbHY5K2licmNScVFuMDBY?=
 =?utf-8?B?c29vZ3lLTWVmUXZmU1BGTHZIT3VzMXc2ZDZ3WjJ5NnpEbnhTME9pMERmTlpI?=
 =?utf-8?B?VDV6WklENVlyVE5vczFJbDlSemYrVWN6WUNVRHYyM3ltOTBnWDJFdm1INEF6?=
 =?utf-8?B?M294UnpRcm5wcnhqbjcvSUtMN1Z5STVGNnVxVnphdHZuK3BTSFVsZnR3Y1FP?=
 =?utf-8?B?TzJKa2ZJbFdGUmxkbllRWEdaajd0RVQ0aVlaQzl6cFRwcXVYVno0eFVVT2hB?=
 =?utf-8?B?YUZLZWMzUUZPQWxsVHRkbEhqWG5nc25yMzgvUEJOR0VNcVZsLzhvY1RIbTAx?=
 =?utf-8?B?d1RiVHRFaHIrb3k3REI3a2x3TUZGbGEzV3J3WmVIeU0vM3lOUERpdXkyQXhz?=
 =?utf-8?B?bGxReUxmOUd0Tk5MZ1RLMEJmd3IxOG9RTEFzSU1BZ3hNaTAxTWZyREhSQUYv?=
 =?utf-8?B?NUZ4MFovSDFnUW5STmpNRnN5emxsVlU5MXZ0NVVWeExSaTRQdmF0bm81bEVZ?=
 =?utf-8?B?OFJzT0xFVjZzVk1DaVpVeHF0TmRwaEpGZmtxcWJZNWQ2OG1sb24xa0ZjN2FP?=
 =?utf-8?B?dFVSTGFyczNNL1VwaXdrdFZKL3RyMXZ6UDQ0d2NXeko2UHNLVGV5MDEzYmU1?=
 =?utf-8?B?Y2tPZ1I4bFFodHhGYlR6SC9PUGprbE5RRVhqSjcxVk1hZUxSeVZOSzBncm1p?=
 =?utf-8?B?RlRiaDFOV2pxTDBsY3p0YllsYUNOMDF0RlZ5M3dhNU41bjlXcHBkb1M5aUlx?=
 =?utf-8?B?QWJhK21EN010U1grV0htV1pJNHRmWTJQYkEzVThtS0FXdVdUYXZaN2gyTU9X?=
 =?utf-8?B?L2NXQWdyZThjM3Rxa09aMlBaSE5wdDRqaSt6bXNwbTlCSFFFWEVjbVlYWkpw?=
 =?utf-8?B?ZzhIaUFEOHJEMkdMR0tMcUdubkNSNXZ4ZEtER0ZKRHM1eXdMMStNV3ZVa2xO?=
 =?utf-8?B?NFZaV09xb0NzS2MvYlF6azRvVUxST3BVcnhxTG9IMWJjWlRYTkNNVGg4VExD?=
 =?utf-8?B?dk1ESUJCd3FoNmdNeTRSOElOSWlUalBYNVhNakE4K0w3ak80NzNSaUpIY093?=
 =?utf-8?B?Z2R2UXI2VnQvN3VVbnJNMDk1T1ZweCtZVXNuZEh1L0dkcGxPVzVrdFBkSGgx?=
 =?utf-8?B?ZnoySW5lSElway8vbUR6WnpHbk5EdnduL01Td2FsK2M3TTNkazl5djF2S1RH?=
 =?utf-8?B?MTZycnNQalFkdzByRGdyUnJhcTJIUzlhY09tUTIrTkpLMElKa3I2c0k3NTVj?=
 =?utf-8?Q?uHuCQkzu8YbwW2Mj1NtWbhgZV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e5c921-9d92-4a71-c6a3-08dadcfe8b42
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 11:38:24.3809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cCeR+a6vioXWRsXuMuLZbgpv5D8icjQ8jmW2a3eV1PNFEvr4mHNilgJC1/2VFWzOPksGINT0BQEgV52gDo57w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6773

All callers convert frame numbers (perhaps in turn derived from struct
page_info pointers) to an address, just for the function to convert it
back to a frame number (as the first step of paddr_to_pdx()). Replace
the function by mfn_to_nid() plus a page_to_nid() wrapper macro. Replace
call sites by the respectively most suitable one.

While there also introduce a !NUMA stub, eliminating the need for Arm
(and potentially other ports) to carry one individually.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
At the top of free_heap_pages() mfn_to_nid() could also be used, since
the MFN is calculated immediately ahead. The choice of using
page_to_nid() (for now at least) was with the earlier patch's RFC in
mind, addressing of which may require to make mfn_to_nid() do weaker
checking than page_to_nid().

--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -11,11 +11,6 @@ typedef u8 nodeid_t;
 #define cpu_to_node(cpu) 0
 #define node_to_cpumask(node)   (cpu_online_map)
 
-static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
-{
-    return 0;
-}
-
 /*
  * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
  * is required because the dummy helpers are using it.
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -492,7 +492,7 @@ p2m_pod_offline_or_broken_replace(struct
 {
     struct domain *d;
     struct p2m_domain *p2m;
-    nodeid_t node = phys_to_nid(page_to_maddr(p));
+    nodeid_t node = page_to_nid(p);
 
     if ( !(d = page_get_owner(p)) || !(p2m = p2m_get_hostp2m(d)) )
         return;
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -565,7 +565,7 @@ void __init paging_init(void)
                 if ( n == CNT )
                     ++holes;
                 else if ( k == holes )
-                    memflags = MEMF_node(phys_to_nid(mfn_to_maddr(mfn)));
+                    memflags = MEMF_node(mfn_to_nid(mfn));
             }
             if ( k == holes )
             {
@@ -600,7 +600,7 @@ void __init paging_init(void)
             mfn = _mfn(MFN(i) + n * PDX_GROUP_COUNT);
             if ( mfn_valid(mfn) )
             {
-                memflags = MEMF_node(phys_to_nid(mfn_to_maddr(mfn)));
+                memflags = MEMF_node(mfn_to_nid(mfn));
                 break;
             }
         }
@@ -677,7 +677,7 @@ void __init paging_init(void)
             mfn = _mfn(MFN(i) + n * PDX_GROUP_COUNT);
             if ( mfn_valid(mfn) )
             {
-                memflags = MEMF_node(phys_to_nid(mfn_to_maddr(mfn)));
+                memflags = MEMF_node(mfn_to_nid(mfn));
                 break;
             }
         }
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -671,15 +671,15 @@ static void cf_check dump_numa(unsigned
 
     for_each_online_node ( i )
     {
-        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
+        mfn_t mfn = _mfn(node_start_pfn(i) + 1);
 
         printk("NODE%u start->%lu size->%lu free->%lu\n",
                i, node_start_pfn(i), node_spanned_pages(i),
                avail_node_heap_pages(i));
-        /* Sanity check phys_to_nid() */
-        if ( phys_to_nid(pa) != i )
-            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
-                   pa, phys_to_nid(pa), i);
+        /* Sanity check mfn_to_nid() */
+        if ( node_spanned_pages(i) && mfn_to_nid(mfn) != i )
+            printk("mfn_to_nid(%"PRI_mfn") -> %d should be %u\n",
+                   mfn_x(mfn), mfn_to_nid(mfn), i);
     }
 
     j = cpumask_first(&cpu_online_map);
@@ -721,7 +721,7 @@ static void cf_check dump_numa(unsigned
         spin_lock(&d->page_alloc_lock);
         page_list_for_each ( page, &d->page_list )
         {
-            i = phys_to_nid(page_to_maddr(page));
+            i = page_to_nid(page);
             page_num_node[i]++;
         }
         spin_unlock(&d->page_alloc_lock);
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -971,7 +971,7 @@ static struct page_info *alloc_heap_page
         return NULL;
     }
 
-    node = phys_to_nid(page_to_maddr(pg));
+    node = page_to_nid(pg);
     zone = page_to_zone(pg);
     buddy_order = PFN_ORDER(pg);
 
@@ -1078,7 +1078,7 @@ static struct page_info *alloc_heap_page
 /* Remove any offlined page in the buddy pointed to by head. */
 static int reserve_offlined_page(struct page_info *head)
 {
-    unsigned int node = phys_to_nid(page_to_maddr(head));
+    unsigned int node = page_to_nid(head);
     int zone = page_to_zone(head), i, head_order = PFN_ORDER(head), count = 0;
     struct page_info *cur_head;
     unsigned int cur_order, first_dirty;
@@ -1443,7 +1443,7 @@ static void free_heap_pages(
 {
     unsigned long mask;
     mfn_t mfn = page_to_mfn(pg);
-    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn));
+    unsigned int i, node = page_to_nid(pg);
     unsigned int zone = page_to_zone(pg);
     bool pg_offlined = false;
 
@@ -1487,7 +1487,7 @@ static void free_heap_pages(
                  !page_state_is(predecessor, free) ||
                  (predecessor->count_info & PGC_static) ||
                  (PFN_ORDER(predecessor) != order) ||
-                 (phys_to_nid(page_to_maddr(predecessor)) != node) )
+                 (page_to_nid(predecessor) != node) )
                 break;
 
             check_and_stop_scrub(predecessor);
@@ -1511,7 +1511,7 @@ static void free_heap_pages(
                  !page_state_is(successor, free) ||
                  (successor->count_info & PGC_static) ||
                  (PFN_ORDER(successor) != order) ||
-                 (phys_to_nid(page_to_maddr(successor)) != node) )
+                 (page_to_nid(successor) != node) )
                 break;
 
             check_and_stop_scrub(successor);
@@ -1574,7 +1574,7 @@ static unsigned long mark_page_offline(s
 static int reserve_heap_page(struct page_info *pg)
 {
     struct page_info *head = NULL;
-    unsigned int i, node = phys_to_nid(page_to_maddr(pg));
+    unsigned int i, node = page_to_nid(pg);
     unsigned int zone = page_to_zone(pg);
 
     for ( i = 0; i <= MAX_ORDER; i++ )
@@ -1794,7 +1794,7 @@ static void _init_heap_pages(const struc
                              bool need_scrub)
 {
     unsigned long s, e;
-    unsigned int nid = phys_to_nid(page_to_maddr(pg));
+    unsigned int nid = page_to_nid(pg);
 
     s = mfn_x(page_to_mfn(pg));
     e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
@@ -1869,7 +1869,7 @@ static void init_heap_pages(
 #ifdef CONFIG_SEPARATE_XENHEAP
         unsigned int zone = page_to_zone(pg);
 #endif
-        unsigned int nid = phys_to_nid(page_to_maddr(pg));
+        unsigned int nid = page_to_nid(pg);
         unsigned long left = nr_pages - i;
         unsigned long contig_pages;
 
@@ -1893,7 +1893,7 @@ static void init_heap_pages(
                 break;
 #endif
 
-            if ( nid != (phys_to_nid(page_to_maddr(pg + contig_pages))) )
+            if ( nid != (page_to_nid(pg + contig_pages)) )
                 break;
         }
 
@@ -1934,7 +1934,7 @@ void __init end_boot_allocator(void)
     {
         struct bootmem_region *r = &bootmem_region_list[i];
         if ( (r->s < r->e) &&
-             (phys_to_nid(pfn_to_paddr(r->s)) == cpu_to_node(0)) )
+             (mfn_to_nid(_mfn(r->s)) == cpu_to_node(0)) )
         {
             init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
             r->e = r->s;
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -1,6 +1,7 @@
 #ifndef _XEN_NUMA_H
 #define _XEN_NUMA_H
 
+#include <xen/mm-frame.h>
 #include <asm/numa.h>
 
 #define NUMA_NO_NODE     0xFF
@@ -68,12 +69,15 @@ struct node_data {
 
 extern struct node_data node_data[];
 
-static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
+static inline nodeid_t __attribute_pure__ mfn_to_nid(mfn_t mfn)
 {
     nodeid_t nid;
-    ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
-    nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
+    unsigned long pdx = mfn_to_pdx(mfn);
+
+    ASSERT((pdx >> memnode_shift) < memnodemapsize);
+    nid = memnodemap[pdx >> memnode_shift];
     ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
+
     return nid;
 }
 
@@ -102,6 +106,15 @@ extern bool numa_update_node_memblks(nod
                                      paddr_t start, paddr_t size, bool hotplug);
 extern void numa_set_processor_nodes_parsed(nodeid_t node);
 
+#else
+
+static inline nodeid_t __attribute_pure__ mfn_to_nid(mfn_t mfn)
+{
+    return 0;
+}
+
 #endif
 
+#define page_to_nid(pg) mfn_to_nid(page_to_mfn(pg))
+
 #endif /* _XEN_NUMA_H */


