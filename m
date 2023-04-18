Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AD26E5E6C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 12:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522722.812265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poiNX-0002xu-Oi; Tue, 18 Apr 2023 10:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522722.812265; Tue, 18 Apr 2023 10:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poiNX-0002vc-Lp; Tue, 18 Apr 2023 10:16:03 +0000
Received: by outflank-mailman (input) for mailman id 522722;
 Tue, 18 Apr 2023 10:16:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poiNW-0002vW-MH
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 10:16:02 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2054.outbound.protection.outlook.com [40.107.13.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03bbee88-ddd2-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 12:15:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7124.eurprd04.prod.outlook.com (2603:10a6:208:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 10:15:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 10:15:29 +0000
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
X-Inumbo-ID: 03bbee88-ddd2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCUfz0ppoYsFFv9sJMAIHYYae8HdhN1YZwWOIqgZmrgYfii6xSJPTx9Y2jVM9dX0YW8IBXix2NtYLNMfh/K4ctyALBrUjI81DuJA3Hn8kPNG+MqkIt+X8V475IXMKbePAd17LMEbH0uK+sVzp94OiM/VhTtiM+JgLehjPKueTk6z/xISD4EsSglMBbV8MJHQpQQCvpGPWwO+8sqH56R8PYaGoOl/TaapTox2fj4waRaRZxt8xr3T2o3NhCYpxeTE4tGg4zmnEPCG5nWIBrLMUmDk7J21YqyPWJnQTjh2hxN7zrCXzdyJZBjkFoLd6tZhNSYP52VNOs7eHt1UPV/H2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nseY0nHkP0nk+3AOLLKCsOSnbTCI3BP0bHCtUpZGXgU=;
 b=IO1pwRfj2lsK+4OgYJGB4RHfdZVZaf7tlggqw/W6kN35hlGEtcRI7ceiDztyRTBKlvmSbfs2vfiutbO09hl2tLj2GAfGPwhzvM8rkaPYqLLVemYxNucBPNGOBE4t6HHJKUXaJ8YhgtcG0NRftf6RwyXt/PH4HeH8rKIdWeNreQQNgsQlEbTupbgy7rzAXvdJE7uwNjw4xBsm4LFUF9gcDiPTcFuuPz4x1tQlmCDKLvYeByD6TzNVBs4Upr475aM2+VMJTlH56rnZZTeqgrINjVE6z6R6FvXwLZlBwOZXFPqwZn49OPXbV4ni+4ESJW/yJ/IaZHGZaFuxguRD7CgDqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nseY0nHkP0nk+3AOLLKCsOSnbTCI3BP0bHCtUpZGXgU=;
 b=0hZqLlUr+zU+aTp6uFNiaVD1ACjewWqivsjZglZkv9P4sVgAT5aGZ9KLgnqU0XBEKundH1IQxE9tdp9xU2QRtmBlBkqvqTXQBJVIYrJ/OztDD8OrMa0hp310HRO8cvj6z94uOwGmQjuYZsr/Q+rTALBOjFSaafYXw/jeVTDrsIOFaARXMTAYJwn9rBKzbEaG8SNBFgpO7JMZamuJjssiiIugGvpqwPkyJQXXHrLOlFxcpSiMnUwg4rWbwAluWj9RkjjSJfPYystpdYGdixLBdfloedn+0IVk2ASadeVuuSoEUp3kYsP4cSPEPOyZOkHAqrh9OGax9643K80eGehwOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <65f14053-1816-7f8f-b20e-c108575eabd4@suse.com>
Date: Tue, 18 Apr 2023 12:15:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: fix build with old gcc after CPU policy changes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee90ebf-9785-4155-59d1-08db3ff5d60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X/VNDVD8fF3c1AKCrzCqbkIINYIfNRlapAaBbLvlN2SvAhAcCB3l54aTMbU36HhFU8nVzRar5WlglLq443TcJsyfI2VJ6oh56Vhjdbm3tMXpPuU642b3moB3NzdeMQUun84+TMi8P1kBa4ponoGUYVzoSiMYBmIT58Lv8DfXG0CepE3GLkGpZYnwpkAj+g4qPvzlXySTEjVUReMnxLZFhVxLyB8l/XyrBwnQKccqFVb+GqrzjyPLo2+ElUXQt2JCQNF8KL86jrKddYagjW8xYXJ2CUf0C9vgYQ+HHG8Ygp9j097NJLldMB2sFqM6jt9busaMu8IS46KTjMXb/Petsy4X48fXylQzReko1d+OLRPWzSDOk1bLe62N0mamkKsEkWKti+YgkPaLQuRNjNIVipitavORAfteFY5ak+K1ovzfmNY/4BRF7c/bYCSof2jMOCFe1xhpFwVEx+X/P2W+gpupCVUKMlDSOsziAaqHp7bZlX86lsauOzdqs5hGFRZmd2kgPenFFyE5zaG4YynJAHS5kvQF70LMXkMuk9seE+UmAwo55jrM6+bBxQKF5cDQvwywkNMEdCmi6UimmcwU7kNsIQTVggXEiOB395JGK+mMPOtsGnwNayH9VyL5IOKMEAZ2qGGdz5nVN33a8YT8jw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(5660300002)(86362001)(2616005)(6512007)(31696002)(83380400001)(186003)(26005)(6506007)(38100700002)(8676002)(8936002)(478600001)(54906003)(6486002)(316002)(41300700001)(36756003)(66476007)(66556008)(4326008)(6916009)(66946007)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1lBQ29ZcjJzb1ltMndrZ0ErU1NHUzF6VDRFR2pucUtiSExLb25ZMkdyR3JJ?=
 =?utf-8?B?YitBWTQwR0dPU0Q3a2hiQmpVZWsvSjV5QmFjV3phZkVmb3FvK01WcGF3VWR3?=
 =?utf-8?B?NmJGZmpXajB1UHRidWJMZGNPeU9CaisyQVJqREdXZ2V2RGVoaWZtb3czdHdz?=
 =?utf-8?B?MnJwbW8wUm9JUUdaa0ZYKzZMT0Z1U1VLU29Hc1hpdVVMSnRKdnRGRjZjcW9y?=
 =?utf-8?B?ZUFmNnJBK1lIOUxmRGp4YzVZQ2JhNkRPenM4d2ZhLzMzT3NpVG9WRDBnanpq?=
 =?utf-8?B?Z3hUU3I4UzJocXF4YXRTRm9WK0tqS21ZSHNTV0lMTHIwdzBOZ1ViNUgrY0hQ?=
 =?utf-8?B?N2pWUnVrdldwVlZjR3AwUHRLTWprTjdrOXJQbG51eG95RXhIMHdjWTBmRUNh?=
 =?utf-8?B?RG9RTkI1VGc4S3lQbkZDM0xiQ21jRFRyaE1leitaL2wwMGtBRmc2SmpBbFpt?=
 =?utf-8?B?T3kydGlrMzY0dUNNTG8vNUpPQmRpeWlOZmZWT2hRUDBIRlhwWm9iN2htR096?=
 =?utf-8?B?R2lxNHlpdmROZVFnSTFWQ0Q1dmpCYStkVHk2SHBWQTVZcTVxMHNSL3hrdHd0?=
 =?utf-8?B?QWY5R1hhYTdsMDFrdmxSNjl3dXFHeDZUQ296NVdTNXlNUzVuTWRiaVl5QStK?=
 =?utf-8?B?anhyU1NpL3IrcTBNYmx4QmxGdXFtTEdGMXRvR2pVN3lZbUJkQjB2ck9ZdUdk?=
 =?utf-8?B?MUhrYy95MDFLT2xWOE5GNE1ONkZwL1IxbGMwWWlvZTRPeWRRNHB1ZFA4Z29n?=
 =?utf-8?B?WG1ObUwxejNlWmhld3U1SlZVaUZPTVRBeVRBS0VWelo0bDFnMmw2ZmNTeGlT?=
 =?utf-8?B?a2Jxb3JKVGhiTFRvcjhBcE0wUmdnVWJKdG1mYnAwaHBkQ3kzb082YWgzanVj?=
 =?utf-8?B?eGZ2NUtseXNUTVcxc1p6Nmpmcm9ROGI1aU1hSzJ2WFg1SWpzMzBRV2ZxaGx0?=
 =?utf-8?B?YXpGaWlmaWxVZ0pUbXQ3ZWNOa3MxNXcxU1ZmVk4zdHNnMnRwQTFzRmhwTzQw?=
 =?utf-8?B?YTY3MExWVS8vc0xSNzV0bk51UDhPVWJKUG1PYm5XY2tEeTRsRnlHalpIajA3?=
 =?utf-8?B?ekMzUGhESXFSL3BBOEN3Vk5UN253M3FiOVR6ait2YXVVam9vQ1BRSXBQYS9S?=
 =?utf-8?B?eHdZOEJWSkJmMGhnbFp5L2FwaWYvOFV4OGtIOXRIRVVlR2tqbktORExTV1hY?=
 =?utf-8?B?MWxaeE5zdnJMNXJ4UTFxVm9CemxWalQzZUlqU0hoUFM2MjFpVEdqOUZDQnJK?=
 =?utf-8?B?Ulk1SmpKaStiM1ZEQ3ZBY1VWcTBxN01KbmdRZE1NS0dycnd0cWl2eHhqL0JT?=
 =?utf-8?B?MWVGRnhxMWhSQ1NKai90Qy8ra3N5cjAwZ3BxbFBhODVZcmlRVWVBWVl3TWU4?=
 =?utf-8?B?U1F5STBBN0xYREZXejlnZldqcW1uNkJ3UE1FZzM0Um9pYXk1MDR1MXpRMkNO?=
 =?utf-8?B?U0w4RlIvcm14M0JRblJzNENYS2dxQkJhTFJuSEoxclVlTG9DZWNTbEZvd1Q3?=
 =?utf-8?B?YitqSzE4TVQzVElMQzU1ZU1LZ2pENXg1YlBQbTl4U0FsMXczUFNtTW4zV1A2?=
 =?utf-8?B?QzduelZmSDRNSDhtVU11bWE2STBHQlQ4ejEzNklVb29BUndudzhKbkIyZi9o?=
 =?utf-8?B?eHZQK3hPTE1WRFFpcnI5SFBJeVRzMnBlcE81RkFaSXl2djBwVHUyV0NRTm5F?=
 =?utf-8?B?OGdVKytla1pQS0h6ZXFWMTk1by9DdFpmejJVY2l6bjIxeXNLY3JOY211aHc5?=
 =?utf-8?B?d1l6dHBxaW9wcE1ZcmtNbDQwbnB2RGV5cjlia0xrZzhUZDd6cVVGRWdYZ2Y2?=
 =?utf-8?B?TnhmR0xIS0dOWG5jVkVmVWlTeVhoaUdURUFCZGQ0azhjdFBzbjJzQ0NxLzVV?=
 =?utf-8?B?d2Y1ajlLM3ZwemUzYVlVMnBXR25QYzRkc0kva2NpODgyOFgvUlRIaFE2Mkdn?=
 =?utf-8?B?RzVldDgyM1R5N3dSbjZsMytHV1hZZ3ZnRU8rM09JT3hyQUJaeTA3SUZGVUsr?=
 =?utf-8?B?VzVReVVFVG9SZWlXUENtRGVZMFZqbkVzcEQ5RFRvS1hQVEt2NjQrVmk1VWhy?=
 =?utf-8?B?dG9nRnF6M3Rjc3hIa0pDaGVWK2Jwci9iZXZlbjQ0b0p0UElpVnN3VkRaR1dX?=
 =?utf-8?Q?g5oQmCBUFbOIJiRTg9X+eu6JT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee90ebf-9785-4155-59d1-08db3ff5d60e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 10:15:29.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cRiY2uvIcluOQr7nT7wrTWgU2tKwGt42BpeZ2eooUUs0DnDascmtOr74VKFrfsODCGN5eTv/xPIph3TU2Hw9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7124

Old gcc won't cope with initializers involving unnamed struct/union
fields.

Fixes: 441b1b2a50ea ("x86/emul: Switch x86_emulate_ctxt to cpu_policy")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
@@ -893,12 +893,14 @@ int LLVMFuzzerTestOneInput(const uint8_t
     struct x86_emulate_ctxt ctxt = {
         .data = &state,
         .regs = &input.regs,
-        .cpu_policy = &cp,
         .addr_size = 8 * sizeof(void *),
         .sp_size = 8 * sizeof(void *),
     };
     int rc;
 
+    /* Not part of the initializer, for old gcc to cope. */
+    ctxt.cpu_policy = &cp;
+
     /* Reset all global state variables */
     memset(&input, 0, sizeof(input));
 
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1313,12 +1313,14 @@ int pv_emulate_privileged_op(struct cpu_
     struct domain *currd = curr->domain;
     struct priv_op_ctxt ctxt = {
         .ctxt.regs = regs,
-        .ctxt.cpu_policy = currd->arch.cpu_policy,
         .ctxt.lma = !is_pv_32bit_domain(currd),
     };
     int rc;
     unsigned int eflags, ar;
 
+    /* Not part of the initializer, for old gcc to cope. */
+    ctxt.ctxt.cpu_policy = currd->arch.cpu_policy;
+
     if ( !pv_emul_read_descriptor(regs->cs, curr, &ctxt.cs.base,
                                   &ctxt.cs.limit, &ar, 1) ||
          !(ar & _SEGMENT_S) ||
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -344,7 +344,6 @@ int pv_ro_page_fault(unsigned long addr,
     unsigned int addr_size = is_pv_32bit_domain(currd) ? 32 : BITS_PER_LONG;
     struct x86_emulate_ctxt ctxt = {
         .regs      = regs,
-        .cpu_policy = currd->arch.cpu_policy,
         .addr_size = addr_size,
         .sp_size   = addr_size,
         .lma       = addr_size > 32,
@@ -352,6 +351,9 @@ int pv_ro_page_fault(unsigned long addr,
     int rc;
     bool mmio_ro;
 
+    /* Not part of the initializer, for old gcc to cope. */
+    ctxt.cpu_policy = currd->arch.cpu_policy;
+
     /* Attempt to read the PTE that maps the VA being accessed. */
     pte = guest_get_eff_kern_l1e(addr);
 

