Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A551A412F3E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191428.341452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa3e-0005jH-V8; Tue, 21 Sep 2021 07:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191428.341452; Tue, 21 Sep 2021 07:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa3e-0005h4-Rq; Tue, 21 Sep 2021 07:19:14 +0000
Received: by outflank-mailman (input) for mailman id 191428;
 Tue, 21 Sep 2021 07:19:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSa3c-0005gl-QK
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:19:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ee276b3-60c2-434f-88e2-2188a7c33695;
 Tue, 21 Sep 2021 07:19:11 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-IqfAnf8hMJiXfa4CvRlazA-1; Tue, 21 Sep 2021 09:19:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Tue, 21 Sep
 2021 07:19:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:19:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Tue, 21 Sep 2021 07:19:07 +0000
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
X-Inumbo-ID: 3ee276b3-60c2-434f-88e2-2188a7c33695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632208750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kOHPUdSszd1R6FGaIvuWyobel0/L1w9ZbdVwz40lrjw=;
	b=Pj8RS6sueAeoZuysgJQ6xuwCOBzOoGmloV3D4sfJPAdkxhiRULGGlN0+lfJqf90B7x2ppm
	1gWrlF9bhBH7pvL72bxq7orDFQqSC4SAUmrRgOlqnPjXUwI+wf5/oZ9NqCPNWdQBmrQfDf
	KkMOOMUTRSgcLOB+IGvvG9NWNx8OR2A=
X-MC-Unique: IqfAnf8hMJiXfa4CvRlazA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQsC5t1qnE4ToYU8KWXjKGb6ULOHbYu1/J4LvakQPdtBR3ecLi09fMTFwp+cVCRhJ6fefLvhoONDwIdaUJhSKX4mcrFgf7Vu06hO5XPTCrhCoAf/4bLcI9iB/DgBdPd+tHd4YBTSqtaKIJd1uC37kvnj0itfGj5WaTSsfat4xdhNacUCc4M62DQA9w9gpgI+ju8KRQJwgEfWU97lYe2aYy2g6BURSwxXfU3nyk5DPsaz1j8woHIFkETEkHCL0fEoR4RH1fbydU35EUfoyitAEGITXgVToHsRp14kDattxHfb5qyAqhoAp7/vOirm+ANafJRTDW8lKqe2l7aaefrT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kOHPUdSszd1R6FGaIvuWyobel0/L1w9ZbdVwz40lrjw=;
 b=BeUyHrsCvxNJVgi5tRdNxILXpJChThXQX55vbv4socxfSiALYJT+g9OMflrxdzHTuKh4OAAs9MwILSK/FXMIW2J6C3aoPvxdi777040g9nJm9fPWR5IHgauQA7ci1bnD5qk44L3T8dZgmauyvjm2y0SQ6u7uGamPi0uxacnDF23FqoyMjOle1dOkYgOz2qa/H43uFBTv/Lg2dzckGpYOHrmtjK4WItltjvxZQaKnloaQ/FxERzQLHOUbwX3u140R58Ofu1PX2u1QXqo3Yta/dx+LqPcn4HYt5f0vy0EWu1Crhy65TGP4+Y8rZ9Z2FI/VfP6gR2v39QGQTyV7WugzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v3 5/9] x86/PVH: actually show Dom0's register state from
 debug key '0'
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Message-ID: <4ae1a7ef-d6e8-75db-ddf5-987f10175196@suse.com>
Date: Tue, 21 Sep 2021 09:19:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28c134b1-4b59-425d-1804-08d97cd01987
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41908B849B2140AF80ADE1C9B3A19@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cn1h9ducNgRNq3NeT/9DLNgN8VLEtbmdddDU+eS84S5DQ26p7/kO2uoaUH1X84odJ1L81H4cgJrGK6xKIUYOkyuE5yctANU93ulOc/YCxcAcnht6l9uX0wAnlYSmi+teyekYE7UoImlLhCLoZJRbHZKtmLy87AlqlxKitdJRzH2TA2vQ8TfgKRdRwqfUZFFL1c2djsBq1rmREc+uv43i/Ez17R4NJ8uRFe0pM2rKfIChtBBlJ2KJHQHtQHj3CS1S6HgXBPXdKaHUWlIq4anQLS95X+Am+qPPMMIPhHF4cjrr0wUDWykYeNiMRDA3VyxT1K6d/3FbnAldNxnbASXj4G0pOHvWU3eOQ0HDwWK7qqEDUE0TuTquQu3S27XEi2vItmgm9mcfOBSCxYGqTzLXozPMzfu4cMFGkRpMihlHOOKxugXor5Ore8zI0lN+8bp++1Bab+5ai1XODvulZHnX8gOQlDAQGlrAppFfM1URhoyKENsl50wXudPlN0rh9efrA2VLWv6ItcOIP4qLOfT7JTIhVQJvNnnsARi8hgUs5+GQ5FG4H9iibVfJtuftaePafdL+8afDLL0GtSJXICqkNnLtl0huBDhVbzxjU7oCPwSmnpfworPKBksx/2ha3+0COTdkDt+xfdfdb+q908bjWchd0bC9dJiIVTnBR33Ws4FfLO03jxc6pvIG1Q1p0rcvTe5xD3ebDECgCsUD0q3BWQHnTA3Vj9oGVI5O0fEAt7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(26005)(8676002)(186003)(36756003)(86362001)(66946007)(66476007)(16576012)(6486002)(66556008)(38100700002)(8936002)(5660300002)(508600001)(956004)(31696002)(31686004)(4326008)(54906003)(83380400001)(2616005)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVlCZnRyMVp1NjhjTS9RcHNLL3BPOW1aRFhGd1I1bFJWOS9MUlpyYmhLOUUw?=
 =?utf-8?B?R1BDckt3ZUxIM1MxVmcwUWZ6R2NqYU5rUGYwYWJRcWRqbWN1Vjk5ZDEvajM2?=
 =?utf-8?B?eTVZRTZnOHY1ZFBmelNJSkpBZk1BT2k5cDFFRmtSQ3VyRjZobnRja2ZpTUUx?=
 =?utf-8?B?Y255aDFMbUFzMFp0aGFQSWRJOEUwMFRkL0I0Zmsxem9yWk9tT2R4NDM3Slo0?=
 =?utf-8?B?b3Q0WGZVTE5wUTRka0dQWHhjdnVmUCttMWpqa2FpTmxacUYvTjdybnpQTTlF?=
 =?utf-8?B?OGp5R3JHUnlqN2p1bmhHUzZPTFozWEl2Q296OFRVa1FTWkVBNHlwSlVrWWEy?=
 =?utf-8?B?QWNudEdxY2xVbnBVVW5WcklFSWVWcHhpTUdNZlphOFE1Z2czL2hUajQ3Mm1n?=
 =?utf-8?B?SFUrRmhweEdKWExlZm1HcDFaSTBjWlVFWUFjM1Q0c1BCV0QySldmSTNUdVl4?=
 =?utf-8?B?R1N0Sk1ENldEd1hhbUZpeU9neVQ5cVFYeWVzNElocGFRZHhwa0plZVJGREly?=
 =?utf-8?B?R00xRDJYNEN3TUNTUlpnM0tjU3hMVWQxSjJxNERSSVpBcGVLK1IveUlhelhv?=
 =?utf-8?B?Wmt6c2syV3NGdm82Ym1KM2gvN0NKR0F3SCtoano4clEyZVZRZVdsZi9kaW55?=
 =?utf-8?B?WW1hR015dFZHejRsc3lCRU56RXZwQXNPdzZDUnJKUVlDUHRuSU43NFBieGNL?=
 =?utf-8?B?MU1vN0xlcUhTVjdyekVtOHhQRnM1enU1NVBmajJyeVd5WmhlVFp4dUJrd0VE?=
 =?utf-8?B?K0o5V0RSSStERzNYbThranJvQXduS1Q3bHVSR3dBQllMSFdlbHNMeXA4MktG?=
 =?utf-8?B?T1pzLzh6VjN0a3dJcXM2Zk9LSEZ0aldLZldoNWZPUHFiZmtCdDE5eEU0TEJo?=
 =?utf-8?B?dEFIb2lnWHNjWklTN1FrZjM3S3BldWVxUi9ML3Z2ckoyS0dOM0lMZFlUR0s0?=
 =?utf-8?B?L0trb0piMTdEZndxdkpmQ1Y2elBuMFNESXNTaDFTM1FGNUtRNURDZitHQlY5?=
 =?utf-8?B?bkNXbm1DQjdSMEc5VVJITTZKMUlwWi9oT0JidVM2dEV3U0phY0EvVHV6QzN1?=
 =?utf-8?B?RFVrTjBHelZXN2lDcGljTFVUYmJIaitCZHlLeUxlTkI2U2dLVk5rNDBiRlB2?=
 =?utf-8?B?Q1FrRmp5U25EdXpjZmt5QUVJUlEyY0ltYmU5OUFxVDdzZWdwOS9zKzNsMTdI?=
 =?utf-8?B?d0hrS3dUbzA2eTFSSGhiYzJBZEtRSlRUcURhd2Y0c0x6UTZ1d3ZEVEVlTXRU?=
 =?utf-8?B?V2lhUmhkWFAwQSthTFFwcmt4ZFFzVmw3cWRhcVZOdVRDNzJVWHZueEZBQ253?=
 =?utf-8?B?ZDQ0dFc2eWFQMk5xb0tleGhLZCtWMWZNWUxZdHVCVWFVcm0weUdMbDhpR2pV?=
 =?utf-8?B?MWpoeVcwOEIzVjFtTmVoQWoxNEZpVTJKZU9EUVRxR09sT3BJUzY1cnNadmpB?=
 =?utf-8?B?RndhNWpDK1daNWlwT0wyemNxd1NzWmc2TWx0cjUyeTgzQVppemhiY0l6RWpo?=
 =?utf-8?B?RkZCUW1pVUlKZm9COTltbGdIWTBHOE8rcHNISXNvYmx0VzhpVzAwSGQ2S2pS?=
 =?utf-8?B?VXNnUlBhaFczZFJjeXJ2TVc4THdoVEFSeUJGZit2K3FLL1RhTTc5Mm94ZE5w?=
 =?utf-8?B?Vm52ZVpsMUhUcVpCeXJJYkpETjBTbm8vUGJrZ3YrcGlTTmc5ZTd0WXh3WDVY?=
 =?utf-8?B?OHJxUHc2V28ycm9LZFQxcC9FTkphSDhvNWJyalhSdnpwS2JVU3NOeloreXkw?=
 =?utf-8?Q?RAJM8uteG/mLXMwPWgliTZLTIAgD4SOdU7Kdysj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c134b1-4b59-425d-1804-08d97cd01987
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:19:07.4200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niCjkYQ3aKdW4oQpO0dESCxLK60zKsFooAqyUCZwDg61+IXks1lCXKIik02e1cZNs3sEyTy/QCzeLTBe5gyLcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

vcpu_show_registers() didn't do anything for HVM so far. Note though
that some extra hackery is needed for VMX - see the code comment.

Note further that the show_guest_stack() invocation is left alone here:
While strictly speaking guest_kernel_mode() should be predicated by a
PV / !HVM check, show_guest_stack() itself will bail immediately for
HVM.

While there and despite not being PVH-specific, take the opportunity and
filter offline vCPU-s: There's not really any register state associated
with them, so avoid spamming the log with useless information while
still leaving an indication of the fact.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was pondering whether to also have the VMCS/VMCB dumped for every
vCPU, to present full state. The downside is that for larger systems
this would be a lot of output.
---
v2: New.

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -631,6 +631,12 @@ void vcpu_show_execution_state(struct vc
 {
     unsigned long flags;
 
+    if ( test_bit(_VPF_down, &v->pause_flags) )
+    {
+        printk("*** %pv is offline ***\n", v);
+        return;
+    }
+
     printk("*** Dumping Dom%d vcpu#%d state: ***\n",
            v->domain->domain_id, v->vcpu_id);
 
@@ -642,6 +648,21 @@ void vcpu_show_execution_state(struct vc
 
     vcpu_pause(v); /* acceptably dangerous */
 
+#ifdef CONFIG_HVM
+    /*
+     * For VMX special care is needed: Reading some of the register state will
+     * require VMCS accesses. Engaging foreign VMCSes involves acquiring of a
+     * lock, which check_lock() would object to when done from an IRQs-disabled
+     * region. Despite this being a layering violation, engage the VMCS right
+     * here. This then also avoids doing so several times in close succession.
+     */
+    if ( cpu_has_vmx && is_hvm_vcpu(v) )
+    {
+        ASSERT(!in_irq());
+        vmx_vmcs_enter(v);
+    }
+#endif
+
     /* Prevent interleaving of output. */
     flags = console_lock_recursive_irqsave();
 
@@ -651,6 +672,11 @@ void vcpu_show_execution_state(struct vc
 
     console_unlock_recursive_irqrestore(flags);
 
+#ifdef CONFIG_HVM
+    if ( cpu_has_vmx && is_hvm_vcpu(v) )
+        vmx_vmcs_exit(v);
+#endif
+
     vcpu_unpause(v);
 }
 
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -49,6 +49,39 @@ static void read_registers(struct cpu_us
     crs[7] = read_gs_shadow();
 }
 
+static void get_hvm_registers(struct vcpu *v, struct cpu_user_regs *regs,
+                              unsigned long crs[8])
+{
+    struct segment_register sreg;
+
+    crs[0] = v->arch.hvm.guest_cr[0];
+    crs[2] = v->arch.hvm.guest_cr[2];
+    crs[3] = v->arch.hvm.guest_cr[3];
+    crs[4] = v->arch.hvm.guest_cr[4];
+
+    hvm_get_segment_register(v, x86_seg_cs, &sreg);
+    regs->cs = sreg.sel;
+
+    hvm_get_segment_register(v, x86_seg_ds, &sreg);
+    regs->ds = sreg.sel;
+
+    hvm_get_segment_register(v, x86_seg_es, &sreg);
+    regs->es = sreg.sel;
+
+    hvm_get_segment_register(v, x86_seg_fs, &sreg);
+    regs->fs = sreg.sel;
+    crs[5] = sreg.base;
+
+    hvm_get_segment_register(v, x86_seg_gs, &sreg);
+    regs->gs = sreg.sel;
+    crs[6] = sreg.base;
+
+    hvm_get_segment_register(v, x86_seg_ss, &sreg);
+    regs->ss = sreg.sel;
+
+    crs[7] = hvm_get_shadow_gs_base(v);
+}
+
 static void _show_registers(
     const struct cpu_user_regs *regs, unsigned long crs[8],
     enum context context, const struct vcpu *v)
@@ -99,27 +132,8 @@ void show_registers(const struct cpu_use
 
     if ( guest_mode(regs) && is_hvm_vcpu(v) )
     {
-        struct segment_register sreg;
+        get_hvm_registers(v, &fault_regs, fault_crs);
         context = CTXT_hvm_guest;
-        fault_crs[0] = v->arch.hvm.guest_cr[0];
-        fault_crs[2] = v->arch.hvm.guest_cr[2];
-        fault_crs[3] = v->arch.hvm.guest_cr[3];
-        fault_crs[4] = v->arch.hvm.guest_cr[4];
-        hvm_get_segment_register(v, x86_seg_cs, &sreg);
-        fault_regs.cs = sreg.sel;
-        hvm_get_segment_register(v, x86_seg_ds, &sreg);
-        fault_regs.ds = sreg.sel;
-        hvm_get_segment_register(v, x86_seg_es, &sreg);
-        fault_regs.es = sreg.sel;
-        hvm_get_segment_register(v, x86_seg_fs, &sreg);
-        fault_regs.fs = sreg.sel;
-        fault_crs[5] = sreg.base;
-        hvm_get_segment_register(v, x86_seg_gs, &sreg);
-        fault_regs.gs = sreg.sel;
-        fault_crs[6] = sreg.base;
-        hvm_get_segment_register(v, x86_seg_ss, &sreg);
-        fault_regs.ss = sreg.sel;
-        fault_crs[7] = hvm_get_shadow_gs_base(v);
     }
     else
     {
@@ -159,24 +173,35 @@ void show_registers(const struct cpu_use
 void vcpu_show_registers(const struct vcpu *v)
 {
     const struct cpu_user_regs *regs = &v->arch.user_regs;
-    bool kernel = guest_kernel_mode(v, regs);
+    struct cpu_user_regs aux_regs;
+    enum context context;
     unsigned long crs[8];
 
-    /* Only handle PV guests for now */
-    if ( !is_pv_vcpu(v) )
-        return;
-
-    crs[0] = v->arch.pv.ctrlreg[0];
-    crs[2] = arch_get_cr2(v);
-    crs[3] = pagetable_get_paddr(kernel ?
-                                 v->arch.guest_table :
-                                 v->arch.guest_table_user);
-    crs[4] = v->arch.pv.ctrlreg[4];
-    crs[5] = v->arch.pv.fs_base;
-    crs[6 + !kernel] = v->arch.pv.gs_base_kernel;
-    crs[7 - !kernel] = v->arch.pv.gs_base_user;
+    if ( is_hvm_vcpu(v) )
+    {
+        aux_regs = *regs;
+        get_hvm_registers(v->domain->vcpu[v->vcpu_id], &aux_regs, crs);
+        regs = &aux_regs;
+        context = CTXT_hvm_guest;
+    }
+    else
+    {
+        bool kernel = guest_kernel_mode(v, regs);
+
+        crs[0] = v->arch.pv.ctrlreg[0];
+        crs[2] = arch_get_cr2(v);
+        crs[3] = pagetable_get_paddr(kernel ?
+                                     v->arch.guest_table :
+                                     v->arch.guest_table_user);
+        crs[4] = v->arch.pv.ctrlreg[4];
+        crs[5] = v->arch.pv.fs_base;
+        crs[6 + !kernel] = v->arch.pv.gs_base_kernel;
+        crs[7 - !kernel] = v->arch.pv.gs_base_user;
+
+        context = CTXT_pv_guest;
+    }
 
-    _show_registers(regs, crs, CTXT_pv_guest, v);
+    _show_registers(regs, crs, context, v);
 }
 
 void show_page_walk(unsigned long addr)


