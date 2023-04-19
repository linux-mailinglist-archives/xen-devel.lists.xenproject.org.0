Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A416E77A9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 12:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523323.813272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5JT-0005gq-7E; Wed, 19 Apr 2023 10:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523323.813272; Wed, 19 Apr 2023 10:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5JT-0005eh-4L; Wed, 19 Apr 2023 10:45:23 +0000
Received: by outflank-mailman (input) for mailman id 523323;
 Wed, 19 Apr 2023 10:45:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp5JS-0005YA-FM
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 10:45:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 487bdbbf-de9f-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 12:45:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 10:45:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 10:45:19 +0000
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
X-Inumbo-ID: 487bdbbf-de9f-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1M6CcxgYf2nBnLDT8Bl4VTGt/j/hf7cbiDpKE7i3HdlVhhwPhePaaHybCTt5Gkjz1NntW3Mshbvvu/ZgpynAQrVRKN/R396+c2deX65pfX7Of1zJF9Af9RiPaTo3js1C9ki0wdIQRyXfG740pncavtHrRACJezJRc+f/8AHiqLuF7w9JoTwjziMAQBG5DnJz97YtbaHyG/sFl6vaIPaMpSoJ5enJaAkrr1oWJOWlh0co6DF3msLy1BKUfJEW+VLLnOMKOXSv55qovm6SXK5Bts8UseP+5OCfVgTyKx0S4q0VSPZ+Xn6OPypQxOz5f8R5mziefJpn0GJGPkGcg1TCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aXdXTyOcO8LUb03EjxFppTt+3a/uazHmqVhanxapU8=;
 b=hXeIYrCYHsKEgQylQ6MxH/bQHs/KMtYlp4FCjhAQk5XP9JvWizQnPkw7GEdMN8lYjTuhb0mtGC1JbBO8MHH7sU7FCQypAbrR6u+bAb7ZrdIb8ZshV4/weVfqgHhM2MFXl3IKzUUqLC9YpkGMEBaFjJLysJyKpceyfp35UlgZcj4gZ/BezqhUS9n4NFzjjgGPocR2ZvgG+2pjTbkEldEj1AkQGj8hsNMKAgcZm9j8pzMXF9GmzEqBTqZSzDI/VWQpGIZ8S11plIWnZMpAjdDon1zQ4aP7gWX7pEuXFvasCSiZ9vEWC+dX2wZRjQIjWxYl8vhvWiNSVkSXjWtVlWMVsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aXdXTyOcO8LUb03EjxFppTt+3a/uazHmqVhanxapU8=;
 b=1E+oRGNTHTkqsodGsAw3Qs9R+WTGN8snrVKr5xmC18eozKoYpe1KfBWvpuyWJfnTYjQ6r1dcwf2KLs7h3IGaNMRHIhkzc1dXnXa6KiIR8mks065G2FuCHp/FuLRNwFpnlnNmvgm92l9pdnmlS8ChNxTFuuw9MkFSPxmR6JkezWObGJd21qU/bT6/hyZvia1Z09rz473MV8KHzrvp7NEB9buMg2LmcG3QweJTfRxCv11h8lagrCdAv2vJis7uPQDz/P/yX0zN1hYFu+daBHsww+9FG9Z7sXczUru9ByGn0OZ5+kPsMPPSfYhRsxMm0t+EMknviaYDtAUpOFMZ/D7eow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <78858961-9c8c-af8d-286d-f90981f85e07@suse.com>
Date: Wed, 19 Apr 2023 12:45:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 2/5] x86/HVM: restrict guest-induced WBINVD to cache writeback
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
In-Reply-To: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 24010689-b390-419c-f5fa-08db40c32b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WjOd2uMuEeDuagaAURUeHgfUZHWpAQrPusNvXmlOUKd3Iep3i+j7VsySTEc3LVhGSvA6/QC+hlC99lqIkx46pZ5B2I8Uf8dHJERuJ1GjYraEF4CDoObm7ZmOpjnL9S9qq5aqWQkRgeKcdFchOoTZFi4xaHOKcjIq46ib1Ppi51HRaauNFEuFAsulHSzUozRH2xz/zPzBSn0tXzp+t8O50uN23Q0lasGAIPPNWN46pqWkhwNwHC0PNVHhTUzF+FbKw3JjMORsXl7+l7hR/yyrU6X/QsPJ7oTYBl41IbTw4mI2svW+mJp/RlqbM76aB8x/TNygscytd8kOQfJjngtDa8n7+aJ4Arn7PpzicEIW0p3mR9r3sPeYLszda7kPnt024a6aUTbOeqvZ1S3yhgbWJ4yt09M2E3CUpzHZwKfuKGd+XPrytNddKpYAAPHln/UeOMcFFBLGmN2GpBn1SnMzadVxPaUY8CwDxYmQGDW7dZnv7s6tmtaHbmCN7wmc/4YcDNqgj98isU2YD/n38qBOo+pE/ZWne98cCdt4PDsvCcD3ZZIQu8Gtzs50tFjS+gUiwk7dxhEoYBvWAK544KH3yMKLRt7JdbPaJGOCD5BaJmgc6YHn85bCSDwmgFLu8YtEJnTGxrn5JbEvHc960Xa21Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39850400004)(396003)(346002)(376002)(366004)(451199021)(5660300002)(86362001)(2616005)(83380400001)(31696002)(6512007)(186003)(6506007)(26005)(38100700002)(8676002)(8936002)(54906003)(478600001)(6486002)(316002)(41300700001)(36756003)(4326008)(6916009)(66946007)(66556008)(31686004)(66476007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVcvdDcxTHZrbUQ2enNwSGttM3AraWUwWUtMTzN2cmhkei9RTnBNd0hUcHRa?=
 =?utf-8?B?MkZ6Uk4wNHRlMERmL2M5VDZSUm1iUXhweFRPTTRtNHEzZ0RvbHhkb2tUM1cz?=
 =?utf-8?B?S1B1OXBZZFVWaEU3K29VZkFYQUlSRW9aT3AzbzV3ZURHNmhOQXVNUEQzUkZS?=
 =?utf-8?B?YzE0T012Qit6eElrV0FXMFo5OVVEMFJTY3FWUXhRTnlaclNDZUhLMGVLVGpX?=
 =?utf-8?B?U1dacy9NOVVyOHFPRmFqNUw0cFZTcDJVV0ErcE5RbVBmbWlxUVBDTFJhd0pW?=
 =?utf-8?B?SmVNLzN1MlNuNUpvdlU4bisvaE1vdmNxcXora0ovZGVXZ1FSc0JCc1cyN1VK?=
 =?utf-8?B?dDlkUmJkTUNkMGVhQUFkLzNxSEVYem5JN3h4dDAvQ0xpN2Z0enh3aGV6TklR?=
 =?utf-8?B?eGNxY3YwQmc5UWNRaWIyR01BZVRPZzRLLzl4SUxRaFVDMmFPcE1KSnNXaTh5?=
 =?utf-8?B?c3daR2k1aEJPQTAzeU1YN0gxRFd2dDNoeGRrUVRwOFIzcU5KODJjRDhNazhq?=
 =?utf-8?B?eE5PU3RWK1NUVVM4TjNsa0ZLNzRpS2ZZeitHNVhvcFh4b3FzdXpjZm5Fd2VL?=
 =?utf-8?B?Ylo4OGtVdXdtMGhETGJRZkM1Q3Q2TGtHWnJkQmw0Z1NpWjJOYzlHM3FwZzI3?=
 =?utf-8?B?aXQva28xdVM2dGdURUdQUjR3aWZUQUxFczVwWVl5bjA4OTl2SEh3VFZ0RXU4?=
 =?utf-8?B?Z2ZCdDBYbFJLNUtvZXNqakpPdW1kVCtnL1FORkNNSCtUeU9zUDFkTDFaa2Fz?=
 =?utf-8?B?eVdBSzIydWFDZ3k4MFhUYnU0MHBwZ2NOcVNYUDVEeDV1RGtzK2VnM2tkNlFU?=
 =?utf-8?B?enE0cHd0K2hKTFVsTW93NHZrakM4OExMYTljOWNTM283MlYrcDQrUzFhdVl4?=
 =?utf-8?B?ZVRFWlVwWVRydU1iWitONjk3dnN4eklHRWU0cW5UME0vTXRPSmdhQUwycG5w?=
 =?utf-8?B?b0tZbVpKanZ0QmczenZ1ajNZd2FTR3JWWXlkRlFyUVVQL2dkaEFmTnVVTWZP?=
 =?utf-8?B?YXRVYzF4Q21ESFV6aUczb09lN1Jra3JsTm9EV0E2TFp4aXUzODhkZTc4c2Mr?=
 =?utf-8?B?NGN4bjRxTVpxZ2lobkEyN3JBU3Y1RHErbUt5ZDhOaGpKSWhtZFJvV0E1V0dl?=
 =?utf-8?B?a1dpcmErZkhKb0gyU0ZOSm9DRVg4RXZ2YjZGc0w5U3ppNGw2UWdRQ2ZzWnRU?=
 =?utf-8?B?SWJnYjBGMnMrNEYzQ0MyRHJOYXhlNno0dWJXNzU3OEg5c2E5eVRjeE1tS1hT?=
 =?utf-8?B?RTRENkFYUEFUVEIvbVpJZWNhQ2d6NGc4RCtQZDFDQlBBblRqMVAycnh6ZVVB?=
 =?utf-8?B?OG54eGt0MGYrN1BNV2wrcG16NVUyZHRYTys1QTdXcnlHdTk1RDFGSktZeXky?=
 =?utf-8?B?dFlRc0pURVpQM2txektLRzdyNTdXY1Jzc2RoS2xLdkxmRnZMQlZCZEZGak9P?=
 =?utf-8?B?cis1SDFtYzFoTmZPR1BiNTdaZFB5dFJFVEdHRmhUak1YRTdwZ1E0b2YzZURp?=
 =?utf-8?B?NC9uVnI2UWFVdkk5QzZNaGpJOTd5N3c0WjBOQTRNTUhwK0FrMmJrTWR3NnI5?=
 =?utf-8?B?cUZyNk9LRXJ6RDhLaUk1WGh0R3ptRWtLR29jbmtlSzVsRHJ4RWFUSWRrOEZ0?=
 =?utf-8?B?Zi9DeDVDMWRrYnA3ZG9pR3FHdWZMT3l3MXFKTXZYdDhhY3plYjROa09uanRt?=
 =?utf-8?B?SkEyaVdCd0MxbExLZTRKNHQ3eWlJUzMvMnJCK1NSQ0xXOFVqMGFLVE5aTHVv?=
 =?utf-8?B?VWdQb3RqbzVLbXV2RWxyOVJQU1lZcU1TZGlDRk9PVVJ3cUU1S3d0RGJqbzhK?=
 =?utf-8?B?b3BGeVlLWUtBQU5QQnpHMHBzNmlkVHovc0NZSVVWOG8rb05DZmVpa2Rqcjdk?=
 =?utf-8?B?NnRVaW5KSnBPSWlwV2dyOUtVWExIcXNXci9aL3RKZ2I1UkF3WjBVZll3MFJy?=
 =?utf-8?B?Nmo4ejdGR3VGT3JOaFVvWjZ4Y2djYnRHaTlBTmNXVEFNdytWNlg5Zkk4b3Jv?=
 =?utf-8?B?SEJJOW9jSnkvb0tTZ0FqRnJsOFF5V3d3dmNOQUVRNGR2T0FMZUZUSFRzbTEr?=
 =?utf-8?B?RXp1WXZlajBlVzlGTEtDWFhqWURha2o4b3BpajlLdHV1QjY0bk0wSmczMXNG?=
 =?utf-8?Q?R9QH7Ayhh59meXszAdTpYIpGC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24010689-b390-419c-f5fa-08db40c32b60
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 10:45:19.7709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woSSJO5IQrDxjEhbK8FqYNOrKO3DAW0eTQv+TxYLJfqLVSAyziidfWQ0QKABtXZYR4cdW3sTCVz+F+HbTi+Xgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013

We allow its use for writeback purposes only anyway, so let's also carry
these out that way on capable hardware.

With it now known that WBNOINVD uses the same VM exit code as WBINVD for
both SVM and VT-x, we can now also expose the feature that way without
further distinguishing the specific cases of those VM exits. Note that
on SVM this builds upon INSTR_WBINVD also covering WBNOINVD, as the
decoder won't set prefix related bits for this encoding in the resulting
canonicalized opcode.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2364,7 +2364,7 @@ static void svm_vmexit_mce_intercept(
 static void cf_check svm_wbinvd_intercept(void)
 {
     if ( cache_flush_permitted(current->domain) )
-        flush_all(FLUSH_CACHE);
+        flush_all(FLUSH_WRITEBACK);
 }
 
 static void svm_vmexit_do_invalidate_cache(struct cpu_user_regs *regs,
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1881,12 +1881,12 @@ void cf_check vmx_do_resume(void)
     {
         /*
          * For pass-through domain, guest PCI-E device driver may leverage the
-         * "Non-Snoop" I/O, and explicitly WBINVD or CLFLUSH to a RAM space.
-         * Since migration may occur before WBINVD or CLFLUSH, we need to
-         * maintain data consistency either by:
-         *  1: flushing cache (wbinvd) when the guest is scheduled out if
+         * "Non-Snoop" I/O, and explicitly WB{NO,}INVD or CL{WB,FLUSH} RAM space.
+         * Since migration may occur before WB{NO,}INVD or CL{WB,FLUSH}, we need
+         * to maintain data consistency either by:
+         *  1: flushing cache (wbnoinvd) when the guest is scheduled out if
          *     there is no wbinvd exit, or
-         *  2: execute wbinvd on all dirty pCPUs when guest wbinvd exits.
+         *  2: execute wbnoinvd on all dirty pCPUs when guest wbinvd exits.
          * If VT-d engine can force snooping, we don't need to do these.
          */
         if ( has_arch_pdevs(v->domain) && !iommu_snoop
@@ -1894,7 +1894,7 @@ void cf_check vmx_do_resume(void)
         {
             int cpu = v->arch.hvm.vmx.active_cpu;
             if ( cpu != -1 )
-                flush_mask(cpumask_of(cpu), FLUSH_CACHE);
+                flush_mask(cpumask_of(cpu), FLUSH_WRITEBACK);
         }
 
         vmx_clear_vmcs(v);
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3714,9 +3714,9 @@ static void cf_check vmx_wbinvd_intercep
         return;
 
     if ( cpu_has_wbinvd_exiting )
-        flush_all(FLUSH_CACHE);
+        flush_all(FLUSH_WRITEBACK);
     else
-        wbinvd();
+        wbnoinvd();
 }
 
 static void ept_handle_violation(ept_qual_t q, paddr_t gpa)
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -238,7 +238,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /
 /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
 XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
-XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
+XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*S  WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
 XEN_CPUFEATURE(IBRS,          8*32+14) /*S  MSR_SPEC_CTRL.IBRS */
 XEN_CPUFEATURE(AMD_STIBP,     8*32+15) /*S  MSR_SPEC_CTRL.STIBP */


