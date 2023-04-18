Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99A56E5D85
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 11:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522701.812226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohka-0005HN-TG; Tue, 18 Apr 2023 09:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522701.812226; Tue, 18 Apr 2023 09:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohka-0005Ey-Pq; Tue, 18 Apr 2023 09:35:48 +0000
Received: by outflank-mailman (input) for mailman id 522701;
 Tue, 18 Apr 2023 09:35:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pohka-0005Es-96
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 09:35:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64ac5037-ddcc-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 11:35:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 09:35:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 09:35:43 +0000
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
X-Inumbo-ID: 64ac5037-ddcc-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e00X9ptd8NzNCDjQIN9sLm4B7Nmi54ZeJUZL0VYiZMe2Xuu5Sjfn7SWsC4hFknkMh9iEE4f/SjJ7qQ3dDjZFYihXNo6DCv9JN4bzn2QMRlA9SYiGffGk5UMu8ck1Zwf/VcmnK2temYijxskMSUgT3f2C3BAwTZ9YOUJuvaK/SU5FzWw8/7LyxZqs6RnAcAIdB9O8j1vBRQ9FZgEQ4h4gzZRFC376kQcetJ18P6C8bDmrIvE2k4KDAYbuv4AIhemSRnKPakQAafRcueBf7m2EeBAzEK+s15eq288yZ99vKGFM8loNXrDH8aK+tVXTz6tAXEpYQpUSWObWAAPkEmxjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKyDnkik5ayw5gfaTdlRNJoU3D5nuUPMckTjZzUPdmc=;
 b=UCEttQOT8Ag4EhyV5k70RSl20QVmPAsabIKdWjrRZVa4TA9fgkjdVU6x/fR+wngYq7m4RevniH1XybZPLTqUvRodnvR20c9qvHQlv93Ulro9qh9HvUyfFUrUSy18elSD7BSJ8D1ZUr76Zn6mg/QERoeVly36hwMR56YJABDUBCCKZyPouoEz3pv07DgLCRdDxGQjvWm4zrj94ELWIaZRW3wDutE2VtaZ+GeXche6HrnoUdNDCP3CIHNl1VXqoVkZi8t+L1H8MvJ6NNj41N3SnSCmaafw+YdNRFy8Dn9Let3NfW8ON6iBp4+RtqGWpP8dpstTKaOvl87YvVldlahjPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKyDnkik5ayw5gfaTdlRNJoU3D5nuUPMckTjZzUPdmc=;
 b=p7eLVAnSq/ohPYXPSslioZFOh7Pv7oGwBvSaRj/XZ+t2atFHuafDjjbnEE7TkBmdCYoj1xktQtrgyYjUa9f/b3S4tqFLx7Y5dHWZ/TV8diRFvk76OL0hSqJnCE04OHGvhuyXum7jm+v1YSJkwsddGEArUyeP09pagx4ntm82VzgQXSlAlrSem6CxEKSoF57e2UGPWt2BxrWxsOY9NbZRcDuGxczGLbV+gTJ9ZUBuEdC5sOihGCgsOf7j9Gw5EDi1l0Uhd4G0hw+tYmN7880jxMD/wMaaJDrYjXT6sujyRKywK1+GISdzwk+04PJ09YCuYGu3lrb8H1uqDnnNSXIVFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a24ace58-2ac5-6152-c42b-0037355ce9c4@suse.com>
Date: Tue, 18 Apr 2023 11:35:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: cpu{id,}_policy_updated() can be static
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: cff6c923-2c5a-44c3-e011-08db3ff047a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KQOx2KRzWEqvnPhJGUSgkZJKHIE/xqNOjp5KdRH0Uu7Ah79fp473iitDvwIjWqfO9H1T/OKEUYT755+Nwf+1KEhRiPiasL2jle8LtESoGwwWtdao1kEQKdsAwTcvtxLS+rwcTGeCaFSpYOQzAeRPLn0/5WbAUVKnenQKdii90Bv0MkydvIoVqutcofLUes6tyKpTiMHZAxt3bxSOKePw38KvxlAStFjjZBPXr/vPNl7rklrmQi6jLW0NooftuUttHcH3WuAWXEnBe6TvR4EmbAGHbhSHDNY9VjRgTX2/4iwUZ5sMnoA5gcZEen3lCO2tnnQfuKefaiqUx2ib/WzZh8GciHKz40ADDivZCNAEGQqS366oUkRSLxFquLCjcy79YmHSFXPU8wkbSYjc0WSj3qCBVxvI9F0PQjUb6AkZnay+bOBm9FkPLOKBPUW/JC7WcO0reQQpEtMmGvP3sGs3noTHEL3K/uHBu/dGMsQCDp8B4DqUCA0WxioNmSY5xM49HXg5juOpcTbedGmuaSlqcqlBJbqCEyeRay6hW6gY2hTZs6yfVrf9ngf3IgzL44K6qeQF3sKZiL7eqY0ljerF5XBg1FpJp00EN2HTZ9LIha7h7lYpUNWXTXcifugFb4+7erzfrj9T7Lxnj1JGSRDdEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(36756003)(38100700002)(8936002)(8676002)(5660300002)(2906002)(86362001)(31696002)(478600001)(6486002)(54906003)(31686004)(186003)(2616005)(6512007)(66946007)(6506007)(66476007)(26005)(41300700001)(316002)(83380400001)(6916009)(4326008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTJiaXNjMU9iSTZJWlNzKzVLejRzWGVPN0J1M2ZRTFBnRHp2NlFQR3ladHY2?=
 =?utf-8?B?ZFVsOG1oaG51dVZ6Z2daTEdkYThRYnhTeEdLNWFmRDFBcXZQd3dGMERyMTBE?=
 =?utf-8?B?TDg5R0RVV1NQRzVEelVLU0NjOHJBWWFKOG1rL1o3TjFFMjFDZ2R0SzArck9P?=
 =?utf-8?B?VDBEMXlvK1ZacUFSTTlkaktDckpRK2FMYk4wN1pKMjJxaUcxYUZPL1pTelRG?=
 =?utf-8?B?T3VPYlpDYXpRYWt5MXRWazdkSnl0N3hUb0pvTk82SVF3NFp6SWdtNHlMYmo0?=
 =?utf-8?B?RTVCUGI2NzZyQXdicDRRRm1jTGVCajg1bXRHWnpEZkZLR0h0SWpIYlNxOUhS?=
 =?utf-8?B?MDVRLzIzbzdaeGt4WSt2LzNPV250RERMbVI0cWRTMEJpUE9DQlVPZWR5Tjcv?=
 =?utf-8?B?dXhqaW5xU2l1bHJ2ZTJOeFFKOHpZSCtrZWRaU1VaQnlIWDhETlJ4QVBEZEwr?=
 =?utf-8?B?QTU5UURqZGZkQUlKZGprU080RkpiU0xpK2FFdlFucTh5T1hMbGdWRHpENXNh?=
 =?utf-8?B?Vm1FN3BCUy81Qjg3YjNnc2k2WGNCOVpzeitsN3dHV0MyR1lub2lPNVJxTklv?=
 =?utf-8?B?ZkxtMVZlSTdFbGlwaHFrUVhNQnBneXJ4QTFzL0t4WFdsNjZmVGt6MCszeEZ2?=
 =?utf-8?B?VHIvTWNOaHE1NXJzMklmU1ZPR0lJS2Z1RzBDcXI3OTlzRXVvWlkwYnk0b0hq?=
 =?utf-8?B?ZTBITDhZL1U5cHl0TmRHV01Uakg2Rk96KzZCdVdEazZCZjkyR3VFaXcrM1NM?=
 =?utf-8?B?L3JVbzk4SXM2WlJvekpGaDh4ZGZ4REwrWWRiUHFodlVtMFIzbmd1Y0hic3V4?=
 =?utf-8?B?Q04vOVdsaDdVZnJKL0RjSStLaWxGS1RWUWtCNkZDbU0yQndYcnJhQjdlbDhu?=
 =?utf-8?B?WndqY3pZZkpiYzRXdmg4V0F0VHE5YjFFdW52TGVmbTNUWUhyWjFvSXBsck1i?=
 =?utf-8?B?UVJPLzhzWkJZRkNLSStOWmZJbEpMQmltZndRemJOVnJKNkhSNHFNWVpNbnd3?=
 =?utf-8?B?ck8xbWk4Qk5FZkZ0TkMzbi95dk5zcVd5RU5tM2UreUJzUFo4dDlaN3NvamxL?=
 =?utf-8?B?YmEreE0xbys2YmRabFBLMGpFSzcrTkEvVjdqRWU0bU9lbUdmQXVsR1MrZHhs?=
 =?utf-8?B?T1oxYmdOMStOS2ZoRVpnK3NCdDFLMTJEKzJVZDVNWGhrWGFFc0lCT2c1cEZj?=
 =?utf-8?B?bTlZVmlLbVFLUVBWNVV0aFpuZ3hQd2NLQUpCZWRqYnVWRGRId3QyeVdJUHpT?=
 =?utf-8?B?RzhpaFNYSzE2b1MwdFlwYXdoNGNwRzhSU2R4ZFBVZXg1dFFmbWQrUVA0MVNM?=
 =?utf-8?B?Z2R3S1kvTER6a1RqOWVtRUxraDNXV2ZpK0FMSms0SDh6cUFUdWg4dStGcXlW?=
 =?utf-8?B?SVlJRGx4elZrK0U5Y3YrODA0Q1F1bUxwWDd1Y0NoZjhsWE5MVEdGeVNwLzE2?=
 =?utf-8?B?N1h2MURrNHlSNzJYckRPR3NNSVZvS0xZd0FkTjk3MlFnbUs1MjVCdWMvUjhQ?=
 =?utf-8?B?SjJoc28zM2VDT1VkSmp6aks1VEIzNmtQY2ZFQlEyT25xK1dDM3FpNnR2b21o?=
 =?utf-8?B?YTJBRTRIT2NLNU1yOG1LdjV6RXd3ZCtLNkg3NWE5WHl4VVZUcW90a2FXdWZZ?=
 =?utf-8?B?TEJDTHk4OEJhSnNacjJncVlPZ2xqZWtCWm04M3J0UGNRdkxYMnFoTXJyQWlx?=
 =?utf-8?B?QXgzbkg1cWxCMmpDTXgrTkdyeW9KNFpUbXByNDNxMjJkbWlKYzJRVVkzN0cz?=
 =?utf-8?B?Q0pzZE1STUlUMlVVby85Z2lmU3NFemROT1FiOHQ3OW9iQ2srdjB1WVJ6cjBm?=
 =?utf-8?B?QTNmRGVxOUxRMU5WNThwY0RyQnFaSFBBVU1PTmQ5UGpyM05yQ2gvRjlLbCs1?=
 =?utf-8?B?SnBUWlluZGN0L3NSRGRtMUJYd2hLTnViT0ovaUI5cTdELzlLN0tLdDFXbE1W?=
 =?utf-8?B?TTdOZGxUdURSWCtHS2tEMjBXbGlUNVAzdkF3SnlPR005YmJCVnI3STMrYnVN?=
 =?utf-8?B?U1d0dEJoM2dQeVd3Yy8xYzVpemc0YWN2aDN3Z01neFBROUVGSW1DTlBzVWdX?=
 =?utf-8?B?QjN6Y2VHVXBvZXhrN25Gb2tuY2tTSGlJelk5WWlNbWtia0ViV3JjVU1ORFJj?=
 =?utf-8?Q?dXDjEcPU7gyVmlMs1hOJtjh0N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cff6c923-2c5a-44c3-e011-08db3ff047a9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 09:35:43.1204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpqkQ3kao7DFMo6yGrjscESP9BsYSZ8JyScEocp1ieLIxh5HNLrFe7/CL1YNBM4Lo860KTvDQJ3p5LHtwkZbSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624

The function merely needs moving earlier in the file to avoid the need
for a forward declaration. While moving it, also rename it following the
recent folding of CPUID and MSR policies.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -288,6 +288,16 @@ void update_guest_memory_policy(struct v
     }
 }
 
+/*
+ * Called during vcpu construction, and each time the toolstack changes the
+ * CPUID configuration for the domain.
+ */
+static void cpu_policy_updated(struct vcpu *v)
+{
+    if ( is_hvm_vcpu(v) )
+        hvm_cpuid_policy_changed(v);
+}
+
 void domain_cpu_policy_changed(struct domain *d)
 {
     const struct cpu_policy *p = d->arch.cpu_policy;
@@ -446,7 +456,7 @@ void domain_cpu_policy_changed(struct do
 
     for_each_vcpu ( d, v )
     {
-        cpuid_policy_updated(v);
+        cpu_policy_updated(v);
 
         /* If PMU version is zero then the guest doesn't have VPMU */
         if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
@@ -591,7 +601,7 @@ int arch_vcpu_create(struct vcpu *v)
     {
         vpmu_initialise(v);
 
-        cpuid_policy_updated(v);
+        cpu_policy_updated(v);
     }
 
     return rc;
@@ -2416,16 +2426,6 @@ int domain_relinquish_resources(struct d
     return 0;
 }
 
-/*
- * Called during vcpu construction, and each time the toolstack changes the
- * CPUID configuration for the domain.
- */
-void cpuid_policy_updated(struct vcpu *v)
-{
-    if ( is_hvm_vcpu(v) )
-        hvm_cpuid_policy_changed(v);
-}
-
 void arch_dump_domain_info(struct domain *d)
 {
     paging_dump_domain_info(d);
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -83,8 +83,6 @@ void toggle_guest_mode(struct vcpu *);
 /* x86/64: toggle guest page tables between kernel and user modes. */
 void toggle_guest_pt(struct vcpu *);
 
-void cpuid_policy_updated(struct vcpu *v);
-
 /*
  * Initialise a hypercall-transfer page. The given pointer must be mapped
  * in Xen virtual address space (accesses are not validated or checked).

