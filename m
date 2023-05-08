Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BDD6FB016
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 14:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531503.827228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw03d-0004Pb-9r; Mon, 08 May 2023 12:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531503.827228; Mon, 08 May 2023 12:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw03d-0004MP-64; Mon, 08 May 2023 12:33:37 +0000
Received: by outflank-mailman (input) for mailman id 531503;
 Mon, 08 May 2023 12:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pw03b-0003kR-Uu
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 12:33:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c1e543f-ed9c-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 14:33:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Mon, 8 May
 2023 12:33:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 12:33:05 +0000
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
X-Inumbo-ID: 8c1e543f-ed9c-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eu3/82MsRMb+Xg735h6svvjGT8GvOsmLqaOVIQsKJ3cO9Enva5jsuZUxZqhxjMcK1/Ag4yYEiUSmBqm4n1Kfc52mbWI2lCZ0X3S/VDtdGZe3+jfTbhYmd7KOsiOisG86PlArmCwVh1g22FBSTXnZ3qZHMlSbKaW+8EYGR14M6boXDQao0auwfPWbGgszV3dxceewtdDtW4fzE9AFWvhDRVYIZs2JIzGKvcChdW4y2InzUEmP0q9CbnD45i2r9u30Y5RzR9bQ2GHcySVW+UpCxksPcCvCAVMfYHM38f67rv3mh3zYUVeEa3RuN2qw3hBaYHD7rkxTtTa62WKWKNN0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhas7AbeMgoLdGDJZhnhFI7UMWReMRLI7GR1/taFIZY=;
 b=bYb7OqMW1l/j/F1uzfs7MC/9s5bokkatFXAHsfpUPSiNIkF5g4AdPZZN97pvbQSq33L8oBRt7qFFQQ+TkMCfaTJy2Z8N9rblziCT1FLx/gb6guZYGlL7rYTXhLj7yD42XOO94f0zoGMQeCs2+NM9P6A3u/tiFjqTIYmzDgfG/UysnGPw2Uu0pWG8gxWRhzxr2hFF9rSXBP0yJyIYaT7n5Z4vzPc6TxQVRd71H7urIJXIXyTIHtV3hcEoL27l5ONxmg0h06jWQlRqfue6KLxdy4v39wFAa+gzJEqckHAm2II9H6cllq01QZo/f5ZJ//D0Y5jBbiRgRuCl9SN084smtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhas7AbeMgoLdGDJZhnhFI7UMWReMRLI7GR1/taFIZY=;
 b=iQpyTqRHXgUwDexql+X39Veb4ywEhj52pOZdKnc4ijT/tcAhj3jkVMkiQSFhhbMDATnCPvnq0jnXxZYarTJ7xDmFbWW4WqVFY4tSUEpqi8Ngdefzk2Th1GzzwTK0BEr0dcWhu+Qzc6+B/kjGD4PMH3ABCr4zc2/qk9maqrgA6csJ/GyaKhTpFM7P6JZN66yT5uzGlDwT0+x+5b68j/hu8n4j2ujYWL8ryhB9yjrFCJEhpWd6TcAD1mklrPQOJTVewPRxNosfzXFUPUramN2Q7cBsqpMAiwc+xSPwUHpQM9cTNQhaTx+eLO2iugc9veO3+VK5xTo5lCO60tuiWrxydQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1e4d155-f316-79a8-14d1-b236a18abcba@suse.com>
Date: Mon, 8 May 2023 14:33:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 3/4] VMX: tertiary execution control infrastructure
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <0b2a4e8c-ab43-4e6e-2c51-027dcdf1425d@suse.com>
In-Reply-To: <0b2a4e8c-ab43-4e6e-2c51-027dcdf1425d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: 894566cc-d6b5-471d-9cc9-08db4fc05f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NK1oHSgzst9vZzeZga3Z+xHv99CxtFl1Cm2mKi04S2SGA9+lSucMxCl3KSD7kGrXqHzetzwtvKSgDtcvJzDqgdmSa++LQ8CicnnM13LZOO2fXkhp3Dp3TbraJp4MOglAFeKGCpoFxMMROfQzGd5LT1dvL4+dYSmrzYE0azb6QKeNmwSJ7pW7pZn9nEamCPBGmAdyFjvg/5s3hkKISDsPmkwV6L5pk45grpA8Am9ljnW9ULljP4rQ9+/MfYJWji2OixN/UG/B9awXbGUR9kNpF0KAnBYeZPNfCQUkJ7zY4kOZCjAUX5XinwNpHVAWGVkT+ypO7XeMNK2U8iCX31z8p7/NIbZkYsDxIFBDVKYacshlfIKQfUs74CYJRxG8h3Tbm7pG+PWKl2PGYIQ2CDedcEV+tQzH6/KvQzbsrgikfDLitFcUWfBNtixZr5V8Vyx69Nb0mMt/DSsbh+D5d15+zMzPvfYgiCiAyhpIEGGKm33IFufDftiL7PmTHFTi4yFL8ybjUO907Ak4m9UHDXG3ssizgJISuDo77SwZfB9I3XJafNaY2Kg4AKtkmLr3MaX3IwqTydN5qUUy8/KwPB84XiPKVVMbagqMzvzaddUsxfLWLYPQ4PBMMm+6MhKfQZN+X01ltjqTC76zWPvV0MxZyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(31686004)(36756003)(38100700002)(2906002)(8676002)(5660300002)(316002)(86362001)(31696002)(8936002)(6916009)(66556008)(66946007)(41300700001)(66476007)(4326008)(83380400001)(186003)(6512007)(6506007)(26005)(6486002)(478600001)(2616005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUN2OW5iL1grQ2YyQXBwejNXOUdGb1NmaStQclZXcjZRQnQ4ZitlVVNSSzhE?=
 =?utf-8?B?cEtsVG9WU2VqU3YrTVJ4dWJDVUlvejNxQ0JodG9rSjFuVzYvZzBNQ3pmdS9a?=
 =?utf-8?B?L09SWWJHRXZqVUhLaU5qR0RocitaVzgvRjRlWnZJS0R1Q1hPanJJZEh1M2w5?=
 =?utf-8?B?ZCtrS0VZc0dsSDZqMlZMZlBma0VjOXFCeStnbnpneG5CaDR6TCtPYlBJTS92?=
 =?utf-8?B?MGcxQ3F4NlYvNUJaWVpsMUc3TjA5czRMdzBzVkNzNmdsM29IckN1dkZSTDBH?=
 =?utf-8?B?dUFQOHhPaGdCaE55NjlPL0t0VXhiUXZYMStEM2ZjRVd3SXhqU0dnakZtUEUr?=
 =?utf-8?B?akZNOTVqd2FOV0RLKzUvMWJPb2I2UXpTTVd4SXA3UXFBRWQ5YzlWNVg4cFg5?=
 =?utf-8?B?NWJzNjZMamZ0aGxoTkFQSUdKbU5Ja1IwNHJ1cURabnlDTy8wUHlzbmJrR25Y?=
 =?utf-8?B?YnNMR2lVeXl3aGEwVjdRK0EwUHcxcDFLY3QyVkp4NkxJWUV4bDJYOHR4MEZC?=
 =?utf-8?B?Rk1QSnpZZXY5Y3BnK0pRa2JGWkZjSm0rbDQrWjZZSzNiOTV2aXF0Uk11M3p2?=
 =?utf-8?B?cFRoRGN3azRPZk9razFlLzNyMnE2eWxoUEYzZFk2eU50MEJJUDIvbDBqWmd5?=
 =?utf-8?B?Rkd5UEd2UW50V0dBVFdHdHJqVTJvcGlhc0wySUgrMitVRUJ1bVFKeWUranBZ?=
 =?utf-8?B?ajZ5emhOSWo2ZlNBVUp2bi9xcDhEY2Yzc0E5cysvakJTWjR5V2kxemxRSjNO?=
 =?utf-8?B?YlZaanNzaTNGdDd3Qldkc1BWWmY0cnRMT1BkaFplLytnWGMwMWFlRGZLOXoy?=
 =?utf-8?B?MFNXMlM0dmp6L2tsd01LMHNCOXRjcVhJOWZNMUlsaGdrUm4rR2IrSE5URnFn?=
 =?utf-8?B?YXNJM3RaNVdSY054Z0llVzhNWFJrRlJmQnZnVUlNRkl2M25xTVF5MGlHZEp6?=
 =?utf-8?B?TjB4S0k0RXFMYTdicTR3eWlCSm1tV2NUeWQwVTRoZGZadGp5ZCtXL1VPaW9r?=
 =?utf-8?B?SldPcTc5dFZ4US8zcTJPMENiTmp4Q05QeWpyWDFqWEpHbEpEelJkWHdrc20y?=
 =?utf-8?B?ZHJuWGYrMVVXcFRPalk5SzVxQktMU2gvUnp5OHFVdTNQMzBGa1dnYmRHRjB1?=
 =?utf-8?B?bk1lVFFxTHhTVytwMlM2Y1hvTUxrNzg2MHpMa3BwOExvNm12VkhXc0wvbGY4?=
 =?utf-8?B?ck93SE9nQUJLNWJzckMrZ2ZSdG5yc0JGVmR0Y1lIbG94eWxUV0pYS295cEFC?=
 =?utf-8?B?NVZpSFJXSy9BZEVYSEpObk9IZzd3Qlc1dnhPL21oQXZieFVHenZCTXZVOHNl?=
 =?utf-8?B?cTBlOU16RjBlU3NkV2wwMXlGaGJFUnBCYW4wVnZSN2hIcWRGakZOUlkwMEsx?=
 =?utf-8?B?UW9Rb0xEZUY0ZjErOHhhWWRvWFJ1WlFFakMwYUg3Nlh3UDdNYnVkYnA0eE50?=
 =?utf-8?B?djBzSHFwaWcxbnVGell4dHZZWnRpSERUNW5LNC9MQkdDMGVkSzVrVzZBaW9x?=
 =?utf-8?B?dW1zcVdBUEg0NURaWkxOVGNFZHE1bEo2NGdIQklEMHdXaDM0KzlVTmtYQ0Np?=
 =?utf-8?B?eWdDNEJrcTljTXFZQ3NVdk84ZTQraE5YNUE0VHZzQTJXK0dmUXNBN1FHeGVS?=
 =?utf-8?B?Yml4anUremt6cC90KzNSaWxDZjRzNUR6UVhnQzQzOXNyaG5OZ3dWWkVPZXRS?=
 =?utf-8?B?bm5TcERTVmxFL1FtKzI1RnVUUmFrcWVRUDJkaHYwdDFTK1QySmhsRlBGcldq?=
 =?utf-8?B?a3o1Wlc0cGg4YlA5RUsvd20vSjNHWG9TV1dEMDE2dk9kbkxjYTFjcW5aR2VN?=
 =?utf-8?B?UXZMV1lOcHVNdW5kTDRYTGlESmpKM1JwVVVSaFlMdldSVFRTV09LOGZIZ0I0?=
 =?utf-8?B?UHRnN3RDL3cwZ2Fnb3J4ZXRJOHFWM2Q0MjZpSkI5SUpCajZzVnhZYmhRcUVq?=
 =?utf-8?B?cFU1Q1h6bWZYODkvMnIzWnVSMDA0Y21tSWtHb0JubmZZMVQ3U1ZNZlNHTUhJ?=
 =?utf-8?B?Q05xamh2TWxMVE5BalByOHFlcHB4ajlTSXA5U2F0NENCZnRTU3NQYUtYTkt6?=
 =?utf-8?B?a0tJa29JWlJmOVkzTnUvR2lod2NiWGhyemlkeU40ODJZUnNyazdYMHJPUjhu?=
 =?utf-8?Q?Gb+W02zxAdGwKqVU0VCJkKZW9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 894566cc-d6b5-471d-9cc9-08db4fc05f63
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 12:33:05.6933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRijHlB1aNuOVndKmzJoQxzy21Pd/Wbqbw8VmnxENBqC/b/4CoTc4hCqv3xvQ1lUDfEgZSZRkWEFpVE3R3YFjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318

This is a prereq to enabling the MSRLIST feature.

Note that the PROCBASED_CTLS3 MSR is different from other VMX feature
reporting MSRs, in that all 64 bits report allowed 1-settings.

vVMX code is left alone, though, for the time being.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -164,6 +164,7 @@ static int cf_check parse_ept_param_runt
 u32 vmx_pin_based_exec_control __read_mostly;
 u32 vmx_cpu_based_exec_control __read_mostly;
 u32 vmx_secondary_exec_control __read_mostly;
+uint64_t vmx_tertiary_exec_control __read_mostly;
 u32 vmx_vmexit_control __read_mostly;
 u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
@@ -229,10 +230,32 @@ static u32 adjust_vmx_controls(
     return ctl;
 }
 
-static bool_t cap_check(const char *name, u32 expected, u32 saw)
+static uint64_t adjust_vmx_controls2(
+    const char *name, uint64_t ctl_min, uint64_t ctl_opt, unsigned int msr,
+    bool *mismatch)
+{
+    uint64_t vmx_msr, ctl = ctl_min | ctl_opt;
+
+    rdmsrl(msr, vmx_msr);
+
+    ctl &= vmx_msr; /* bit == 0 ==> must be zero */
+
+    /* Ensure minimum (required) set of control bits are supported. */
+    if ( ctl_min & ~ctl )
+    {
+        *mismatch = true;
+        printk("VMX: CPU%u has insufficient %s (%#lx; requires %#lx)\n",
+               smp_processor_id(), name, ctl, ctl_min);
+    }
+
+    return ctl;
+}
+
+static bool cap_check(
+    const char *name, unsigned long expected, unsigned long saw)
 {
     if ( saw != expected )
-        printk("VMX %s: saw %#x expected %#x\n", name, saw, expected);
+        printk("VMX %s: saw %#lx expected %#lx\n", name, saw, expected);
     return saw != expected;
 }
 
@@ -242,6 +265,7 @@ static int vmx_init_vmcs_config(bool bsp
     u32 _vmx_pin_based_exec_control;
     u32 _vmx_cpu_based_exec_control;
     u32 _vmx_secondary_exec_control = 0;
+    uint64_t _vmx_tertiary_exec_control = 0;
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
     u32 _vmx_vmexit_control;
@@ -275,7 +299,8 @@ static int vmx_init_vmcs_config(bool bsp
     opt = (CPU_BASED_ACTIVATE_MSR_BITMAP |
            CPU_BASED_TPR_SHADOW |
            CPU_BASED_MONITOR_TRAP_FLAG |
-           CPU_BASED_ACTIVATE_SECONDARY_CONTROLS);
+           CPU_BASED_ACTIVATE_SECONDARY_CONTROLS |
+           CPU_BASED_ACTIVATE_TERTIARY_CONTROLS);
     _vmx_cpu_based_exec_control = adjust_vmx_controls(
         "CPU-Based Exec Control", min, opt,
         MSR_IA32_VMX_PROCBASED_CTLS, &mismatch);
@@ -339,6 +364,15 @@ static int vmx_init_vmcs_config(bool bsp
             MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
     }
 
+    if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS )
+    {
+        uint64_t opt = 0;
+
+        _vmx_tertiary_exec_control = adjust_vmx_controls2(
+            "Tertiary Exec Control", 0, opt,
+            MSR_IA32_VMX_PROCBASED_CTLS3, &mismatch);
+    }
+
     /* The IA32_VMX_EPT_VPID_CAP MSR exists only when EPT or VPID available */
     if ( _vmx_secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
                                         SECONDARY_EXEC_ENABLE_VPID) )
@@ -469,6 +503,7 @@ static int vmx_init_vmcs_config(bool bsp
         vmx_pin_based_exec_control = _vmx_pin_based_exec_control;
         vmx_cpu_based_exec_control = _vmx_cpu_based_exec_control;
         vmx_secondary_exec_control = _vmx_secondary_exec_control;
+        vmx_tertiary_exec_control  = _vmx_tertiary_exec_control;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_vmexit_control         = _vmx_vmexit_control;
         vmx_vmentry_control        = _vmx_vmentry_control;
@@ -505,6 +540,9 @@ static int vmx_init_vmcs_config(bool bsp
             "Secondary Exec Control",
             vmx_secondary_exec_control, _vmx_secondary_exec_control);
         mismatch |= cap_check(
+            "Tertiary Exec Control",
+            vmx_tertiary_exec_control, _vmx_tertiary_exec_control);
+        mismatch |= cap_check(
             "VMExit Control",
             vmx_vmexit_control, _vmx_vmexit_control);
         mismatch |= cap_check(
@@ -1082,6 +1120,7 @@ static int construct_vmcs(struct vcpu *v
         v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
 
     v->arch.hvm.vmx.secondary_exec_control = vmx_secondary_exec_control;
+    v->arch.hvm.vmx.tertiary_exec_control  = vmx_tertiary_exec_control;
 
     /*
      * Disable features which we don't want active by default:
@@ -1136,6 +1175,10 @@ static int construct_vmcs(struct vcpu *v
         __vmwrite(SECONDARY_VM_EXEC_CONTROL,
                   v->arch.hvm.vmx.secondary_exec_control);
 
+    if ( cpu_has_vmx_tertiary_exec_control )
+        __vmwrite(TERTIARY_VM_EXEC_CONTROL,
+                  v->arch.hvm.vmx.tertiary_exec_control);
+
     /* MSR access bitmap. */
     if ( cpu_has_vmx_msr_bitmap )
     {
@@ -2071,10 +2114,12 @@ void vmcs_dump_vcpu(struct vcpu *v)
                vmr(HOST_PERF_GLOBAL_CTRL));
 
     printk("*** Control State ***\n");
-    printk("PinBased=%08x CPUBased=%08x SecondaryExec=%08x\n",
+    printk("PinBased=%08x CPUBased=%08x\n",
            vmr32(PIN_BASED_VM_EXEC_CONTROL),
-           vmr32(CPU_BASED_VM_EXEC_CONTROL),
-           vmr32(SECONDARY_VM_EXEC_CONTROL));
+           vmr32(CPU_BASED_VM_EXEC_CONTROL));
+    printk("SecondaryExec=%08x TertiaryExec=%08lx\n",
+           vmr32(SECONDARY_VM_EXEC_CONTROL),
+           vmr(TERTIARY_VM_EXEC_CONTROL));
     printk("EntryControls=%08x ExitControls=%08x\n", vmentry_ctl, vmexit_ctl);
     printk("ExceptionBitmap=%08x PFECmask=%08x PFECmatch=%08x\n",
            vmr32(EXCEPTION_BITMAP),
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -114,6 +114,7 @@ struct vmx_vcpu {
     /* Cache of cpu execution control. */
     u32                  exec_control;
     u32                  secondary_exec_control;
+    uint64_t             tertiary_exec_control;
     u32                  exception_bitmap;
 
     uint64_t             shadow_gs;
@@ -196,6 +197,7 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define CPU_BASED_RDTSC_EXITING               0x00001000
 #define CPU_BASED_CR3_LOAD_EXITING            0x00008000
 #define CPU_BASED_CR3_STORE_EXITING           0x00010000
+#define CPU_BASED_ACTIVATE_TERTIARY_CONTROLS  0x00020000
 #define CPU_BASED_CR8_LOAD_EXITING            0x00080000
 #define CPU_BASED_CR8_STORE_EXITING           0x00100000
 #define CPU_BASED_TPR_SHADOW                  0x00200000
@@ -260,6 +262,13 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000
 extern u32 vmx_secondary_exec_control;
 
+#define TERTIARY_EXEC_LOADIWKEY_EXITING         BIT(0, UL)
+#define TERTIARY_EXEC_ENABLE_HLAT               BIT(1, UL)
+#define TERTIARY_EXEC_EPT_PAGING_WRITE          BIT(2, UL)
+#define TERTIARY_EXEC_GUEST_PAGING_VERIFY       BIT(3, UL)
+#define TERTIARY_EXEC_IPI_VIRT                  BIT(4, UL)
+extern uint64_t vmx_tertiary_exec_control;
+
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
 #define VMX_EPT_WALK_LENGTH_4_SUPPORTED                     0x00000040
 #define VMX_EPT_MEMORY_TYPE_UC                              0x00000100
@@ -295,6 +304,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
 #define cpu_has_vmx_secondary_exec_control \
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
+#define cpu_has_vmx_tertiary_exec_control \
+    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
 #define cpu_has_vmx_ept \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
 #define cpu_has_vmx_dt_exiting \
@@ -418,6 +429,7 @@ enum vmcs_field {
     VIRT_EXCEPTION_INFO             = 0x0000202a,
     XSS_EXIT_BITMAP                 = 0x0000202c,
     TSC_MULTIPLIER                  = 0x00002032,
+    TERTIARY_VM_EXEC_CONTROL        = 0x00002034,
     GUEST_PHYSICAL_ADDRESS          = 0x00002400,
     VMCS_LINK_POINTER               = 0x00002800,
     GUEST_IA32_DEBUGCTL             = 0x00002802,
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -320,6 +320,7 @@
 #define MSR_IA32_VMX_TRUE_EXIT_CTLS             0x48f
 #define MSR_IA32_VMX_TRUE_ENTRY_CTLS            0x490
 #define MSR_IA32_VMX_VMFUNC                     0x491
+#define MSR_IA32_VMX_PROCBASED_CTLS3            0x492
 
 /* K7/K8 MSRs. Not complete. See the architecture manual for a more
    complete list. */
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -760,6 +760,12 @@ void vmx_update_secondary_exec_control(s
                   v->arch.hvm.vmx.secondary_exec_control);
 }
 
+void vmx_update_tertiary_exec_control(struct vcpu *v)
+{
+    __vmwrite(TERTIARY_VM_EXEC_CONTROL,
+              v->arch.hvm.vmx.tertiary_exec_control);
+}
+
 void vmx_update_exception_bitmap(struct vcpu *v)
 {
     u32 bitmap = unlikely(v->arch.hvm.vmx.vmx_realmode)
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -80,6 +80,7 @@ void vmx_realmode(struct cpu_user_regs *
 void vmx_update_exception_bitmap(struct vcpu *v);
 void vmx_update_cpu_exec_control(struct vcpu *v);
 void vmx_update_secondary_exec_control(struct vcpu *v);
+void vmx_update_tertiary_exec_control(struct vcpu *v);
 
 #define POSTED_INTR_ON  0
 #define POSTED_INTR_SN  1


