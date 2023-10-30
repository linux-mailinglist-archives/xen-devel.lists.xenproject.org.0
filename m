Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301437DBAB8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 14:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625107.974032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxSKQ-0005Gx-Eh; Mon, 30 Oct 2023 13:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625107.974032; Mon, 30 Oct 2023 13:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxSKQ-0005Ed-Bv; Mon, 30 Oct 2023 13:29:14 +0000
Received: by outflank-mailman (input) for mailman id 625107;
 Mon, 30 Oct 2023 13:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxSKO-0005EX-DK
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 13:29:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4edcf156-7728-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 14:29:10 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9267.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.16; Mon, 30 Oct
 2023 13:29:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 13:29:08 +0000
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
X-Inumbo-ID: 4edcf156-7728-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEzJDjBliHFZzghfQ7XNh0ELmhgg/CSKRgyp8mBxpadaneWEC8eaJs+qMk0TaODfiuHIRbd2lk1Xtkm6Ns9web0nW3EybsJ9nhcQFs7bpjclOl/Enhk0jghOuAgFw/k/Ks1PxjW37r2YnpL4tEYN20aCqyEur7NS88fWSy/u798Tsk8hx7GhhOQ2GPiJq6rt3dOHLO6JgIC+3nslLmEup6seEGTXZQJE5xk+VfOqTTUbKEK1E22y4fxYBY1GJOqMVCwzek1GIqIstzLrhjyfnlYUJP7t0lqp91HEOrtB8awYBB38WQuCEgqeDaQfbhfWB2yN6QuJnjgxvpitWpHsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKik35MQcS6pD/HucPW4VWShefuYO4ofbGQRb7+mupM=;
 b=ERMgrpwJmP7+6NBhOlX5+2amNUgb/pk2/TWErlLrlgI3QcAJioVdxMbyGTM2mt/XfHd7Gi5cP+Be1Qaku3blV+IACkyrqKIbjnTNbEHwtwWkrBNLtLHpRFvv54y8kqa4vraTUlNSScffroB/EmAMifrwmCLboLg7faJYa0eoZtdFckRHC+YkNEZDxoAhllOSAXJbkfYgv7mOP4mGOigMNO/a0S21lzk4hax2H4JIryWBloH1hw6bCdX/Pqq+S+IZORQD0WX6R4RTuEW+qktYqpx5Yg5wOOvsif038LYoS06Kd28FQC4HBxbb/eCDYUmzG8tKIkqaxRUI1WOYpIjKjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKik35MQcS6pD/HucPW4VWShefuYO4ofbGQRb7+mupM=;
 b=LOcPvaFkl1MUUt+xdJCFLsmsboVyxtk/KiRjXyMtZqZ43JLjhIriYu+MaCf0vaejLblqGvk3VFXeQP8qsc9doHixQwEAIiQo52xjxE+i6Xltx4+tTHEzzOa1SF+1vv4muKS/OPPvc4Qwe4Vm/WXd89Th00C/0O1MTIJBueDnXsovcgd6BHEZixOMO7uUkVM1ppm2kY3mAvSwggz/Xtcz/M/27F4z1qRBGNMbPOdrhlwsGqaUWu67nn1wXzQZoj/CtUEEf++DUOR7EiI0FER48/3SXbmkHpuAGGmwMDdi78gf52Z15BkaGAZRK6cEwBu8rPDfZMy8m/sIztfeWvJUTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <446254b4-8231-f6db-5f18-ed367503454c@suse.com>
Date: Mon, 30 Oct 2023 14:29:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] arch: drop get_processor_id()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f098182-eb9a-4ab1-779b-08dbd94c31cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	28d4nl1C7bP1oFTJM+Ue1rQCEJn/Bo6lIuB8xeoFOO7YJa64YNRF3k1MyG83HcwPRFUumWpu3WOOA+E9Py/xlswBTjAy08rEU7SEHRVqRY05ng81CYwm7eGyRWTDSlnF0feI+MWwjEw+uFFbWntn0upTeF/FCNWlUY5R9FQqSUiRng/rxqgjdfDy1/3M3633reUidKnP/+E3E4fuWmq2MWBPCTJMpeDnDZvTybCLkWIBtUxv1gPuzH495VdEkyX1PGQrAWxGzJMwk+3KIaOb8aVTcas2uRwCSUNTxXUqwa3y5C/F/hEeeAkTQ8SOx4eAsq9SyYdVoX45tcyjgcdWVLjKweu9JKCiHCnS+anbx3SIxCZyP9Rhb24LYNLFT7666R+Acdv8+QDksS06d2eoh7FBQ3VgeLHSOVgGop8hUsPx8RAanRXT2HtyAu6VY5vyh1Sgx2mceQ10xjbUT/zzpWSI/KCuFtgFNzWgOmNt9TzGCWW6l6ZxS2is4vmu3JcaaRuMTQXaBqZP53YfqL6EBi5vHBwQENBZgLhhlcPz/873QlL5fhqo8IsM2fm1/LD4J8MOvTr2s1iMMGa0SKcpEzT7mOV1X3HykLSJjQ2SH4r2ApHTvBR2oBCAun19f2PAGsNNzl6XAt0EifqrIrp+6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(346002)(136003)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(6506007)(6486002)(66946007)(6512007)(26005)(2616005)(66476007)(66556008)(41300700001)(2906002)(6916009)(8676002)(54906003)(5660300002)(7416002)(8936002)(4326008)(316002)(31696002)(86362001)(36756003)(83380400001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2RYeVVSY3hNVXJJa1NqVW56Y256ZGFIbkhvVUZQZXZ5UjVuZndrNER6UEQr?=
 =?utf-8?B?cFBaRGJndElvcytLRmxQMWNJdVRVcnNlK21Hb01rcHlPbUhPelBnL0FVY3Q4?=
 =?utf-8?B?MHFFOFk1QnhPQWFPVXhWdjFEQm5DWmRHZUNaMkdiY0ZmeTFka2tHU0p5UUE3?=
 =?utf-8?B?OWg2aVhYSjdmRk5ibXZ0QTJLaUEyVmVJeExoaFlDQUNMT05oa0VMYmZtaHhN?=
 =?utf-8?B?Z0Z5ZElVdGFCQWVsTW5HQk41dk1GNUJVcW1aMENNUVpCVFFObE1HTVQxU3px?=
 =?utf-8?B?R1VIT1IxKzhaUjJlclVncklIV2x4WmtMT0dXZFJPKzNTNmxWQ1VpVG1RWngv?=
 =?utf-8?B?Y0JzYzJTRXN2dDM4VERrQTlmMGxNdFcvM2xlQ1NVWmFJODhud3RMekxWRENa?=
 =?utf-8?B?YXNUT0pyMVNaRjZUKzJpQk1ENjNoTXk4Ni9CRTlDcndQWHhabG1yWHZmOE1G?=
 =?utf-8?B?YUxRbHJzU1lmZGZDUGlCM0puMTlIL0ZoajgyWnhVRk95MUVNY0F3dFBxZ0Zy?=
 =?utf-8?B?U3BqeEs3MXdYdVBxRkJaRFdlUCsraWs4MS8wL0k5Z01uNS9adHd1eFBReWNz?=
 =?utf-8?B?SGxLeE9kZk5raUJvR2drV2dJNDFxN290ekVqMVR2a1pwNHhEU040bmlpSUlX?=
 =?utf-8?B?aUxibFJObWpCT25iMzB4YmhJQ1Ura2s2WFY1emVFa05vWExUaURnVVAvZUVZ?=
 =?utf-8?B?eFFBVk5zYldOK285Tk92TGpwbzZxSzc2Vm45bk12V2lROWZWcFFScVdvbk1a?=
 =?utf-8?B?MkdqN0hJZXFkNUdWREQ4RmJxdTVUSjBMaDYzeWlJWGllblJXSjRzTGdMVFFI?=
 =?utf-8?B?T2RkUzFxWVdTRHlnQWRBMzJxRWtwNHhvRjN3SFcrczlRcG83MkxqbGlKbklI?=
 =?utf-8?B?TkNqZlQzUDVsYXpCRkYzYUJORzBNTHVSTnN4TFZOSFo0cWZ5cE84dktaUmg5?=
 =?utf-8?B?WGJxNEh2RmdXRE9ERENhNkpCdndRUjdYcTNZTVRXNVgwa0pSWTBhY3V4Q29u?=
 =?utf-8?B?NnE5SGkxTUhhUDdYdVBiTnYvSG4rV3h6NFpqUnJ6b0tHVnFveDh6OGMrNVJD?=
 =?utf-8?B?d0tCZ2R5OVpUeWlOanJKc1ZLNm5PYzdXVVJiTUhaeU01c0dUUGFJVmRVd1Rl?=
 =?utf-8?B?OWp4b21OMGdxbkQ0NjhKaE1qTWFhTjJubEFBaUJWT25DcEpTUEJsRzA2WVg3?=
 =?utf-8?B?OFl5WER4c24vYXo5cW85YWtKWUJ6T0ZzTDBnVkRMdXFsaDU0SXd2OWtiM1A2?=
 =?utf-8?B?WUpENzg4VWhrK282d0JtUE1wUURKMmJIbGtBRnpUSFNRV04wZE9rL3dETUZ4?=
 =?utf-8?B?MFhxR3NJNHhDdXN4YU9XQ0ExdnpTVnRHU1lXSHpZRkR6N1JDak40a2pxWkdW?=
 =?utf-8?B?YVdUSThPc1EyYUZOWU9wZ2Q5QnFxUDIzVFlYWmNoWW9OV3UvbUVUUk80S3Jz?=
 =?utf-8?B?S3c2aVhmbDM0OVRxSllrTDRYRlYxK0pqTHBQT2VGTzVGTW9ieHViaGpCeEo1?=
 =?utf-8?B?blZFdGxOL0VabTdmWkJkbFpqN3lCaHNCL25FMHRRdXVrWmwyMmNNS0tIUkw4?=
 =?utf-8?B?Y2FLeklYbVQ3R21JN0JEdldzYVZxSlI2SUEzejZvaVBTT0ZnTUwwSGt6Wk92?=
 =?utf-8?B?RkU4OTkvTlU2TTJibkJiN1dNMmMxOVBLMzNKOElsOHBxdUwzdG1POFZwQ0Fk?=
 =?utf-8?B?ZG9tdEt4R0JOSXBaNUpaYmFyaGcrVEVmbS9HVG9HQWFrZ0FXOTRUQ0ZwT3FG?=
 =?utf-8?B?MnVuUXBSY0wwS1NBdXhHSXFrSGU2OE03TkdKRVFWbzhhK3dyUU5EVGZmREZn?=
 =?utf-8?B?R1NTa1N6QW5LWmR3bTZId0VrbHZ0SUFHa00zdlR2NnhHRDZva1ZtUnNSZ1Ix?=
 =?utf-8?B?UVdKbW01cjRBdlE2OFk5Vm9PNkZmWUpNQkNUaEM4NFNON085S2dUVVYyclhM?=
 =?utf-8?B?RHlvbm5GcTJVakRJQkxQRGpsaFhqVWZ3WVhyRFZod2RuelFDU2FLdlJidzQ1?=
 =?utf-8?B?cjNXZ2NvQmFVeEFJVGh6U1NveEUyUFFhMnFLLzg4K2REVTZMNXgvUktoa0lP?=
 =?utf-8?B?dWhXQk5LSjNzZmVYeEtpa3pqVXg4eFNPSDIzS2pZb0JQcnUwZXpaQStDT0I4?=
 =?utf-8?Q?8H5/0j7BrnVg7uVIVk6f1mPaj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f098182-eb9a-4ab1-779b-08dbd94c31cf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:29:08.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBbOWKdsdz2n4isZw3TlTjbob6ARqlAE/0w9DH0h6NzbCtYklvyG7YbBsJDJWgYcnd9pYLfj7006FXKvFgQmqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9267

smp_processor_id() is what we commonly use; there's no need for it to
have an alias.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/include/asm/current.h
+++ b/xen/arch/arm/include/asm/current.h
@@ -53,7 +53,7 @@ static inline struct cpu_info *get_cpu_i
 
 DECLARE_PER_CPU(unsigned int, cpu_id);
 
-#define get_processor_id()     this_cpu(cpu_id)
+#define smp_processor_id()     this_cpu(cpu_id)
 #define set_processor_id(id)                            \
 do {                                                    \
     WRITE_SYSREG(__per_cpu_offset[(id)], TPIDR_EL2);    \
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -11,8 +11,6 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_
 
 #define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
 
-#define smp_processor_id() get_processor_id()
-
 /*
  * Do we, for platform reasons, need to actually keep CPUs online when we
  * would otherwise prefer them to be off?
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -401,7 +401,7 @@ void start_secondary(void)
 /* Shut down the current CPU */
 void __cpu_disable(void)
 {
-    unsigned int cpu = get_processor_id();
+    unsigned int cpu = smp_processor_id();
 
     local_irq_disable();
     gic_disable_cpu();
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -99,7 +99,7 @@ static inline struct cpu_info *get_cpu_i
 #define set_current(vcpu)     (get_cpu_info()->current_vcpu = (vcpu))
 #define current               (get_current())
 
-#define get_processor_id()    (get_cpu_info()->processor_id)
+#define smp_processor_id()    (get_cpu_info()->processor_id)
 #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
 
 /*
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -48,13 +48,6 @@ extern void cpu_exit_clear(unsigned int
 extern void cpu_uninit(unsigned int cpu);
 int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm);
 
-/*
- * This function is needed by all SMP systems. It must _always_ be valid
- * from the initial startup. We map APIC_BASE very early in page_setup(),
- * so this is correct in the x86 case.
- */
-#define smp_processor_id() get_processor_id()
-
 void __stop_this_cpu(void);
 
 long cf_check cpu_up_helper(void *data);
--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -122,7 +122,7 @@ static inline void mm_rwlock_init(mm_rwl
 
 static inline int mm_write_locked_by_me(mm_rwlock_t *l)
 {
-    return (l->locker == get_processor_id());
+    return (l->locker == smp_processor_id());
 }
 
 static inline void _mm_write_lock(const struct domain *d, mm_rwlock_t *l,
@@ -132,7 +132,7 @@ static inline void _mm_write_lock(const
     {
         _check_lock_level(d, level);
         percpu_write_lock(p2m_percpu_rwlock, &l->lock);
-        l->locker = get_processor_id();
+        l->locker = smp_processor_id();
         l->locker_function = func;
         l->unlock_level = _get_lock_level();
         _set_lock_level(_lock_level(d, level));

