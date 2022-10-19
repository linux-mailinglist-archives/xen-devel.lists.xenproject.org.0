Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334BE603AC0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425535.673418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3er-0001tR-21; Wed, 19 Oct 2022 07:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425535.673418; Wed, 19 Oct 2022 07:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3eq-0001re-Va; Wed, 19 Oct 2022 07:38:32 +0000
Received: by outflank-mailman (input) for mailman id 425535;
 Wed, 19 Oct 2022 07:38:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol3ep-0001rW-8o
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:38:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06667bb1-4f81-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 09:38:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7053.eurprd04.prod.outlook.com (2603:10a6:800:12f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 07:38:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:38:27 +0000
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
X-Inumbo-ID: 06667bb1-4f81-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZXSvtQuIDjkdFus1q3OLD+4gR7p7iKbr9kjMGS6aneK8qr17tB9PDmpAr9Y364yp+8WxqOTalInYBtnmD8/dATU94ilMXVV0BD7n69Th8ELz0+ud5TA/hq22PrRDLQDHJESM/26NFPJxOYhJlO5A4cClOk6fMMfx588ZFf2Ia0XM86y9PUzbxW3fFej1VyEmt7Wl6B7JyvVjvBpnlsxYClXRuGgE6GapFg3etDSJr8b53t2h0aIbJd6hOQ8h6T1Lh5j57YLQtGpWaVMt/+/aLfN6HrpOPfOMe2t6YVawOILeenniplpJlyJ1Y8GqKqHNGMGOwlks1WSsP5m7XHNZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COQfJ9cXtlA7UIJk7VaHsvDyCd7LmdLVrgloG0YU3Gg=;
 b=jjryaKi0TlalE8tNftmC+dFFcMr2DauN0YpAfAqcGzrqzveQsjRpk6rnpYnyWUJlxWY8wpl6HqvNmYy6Z9lWL/UJUukHsxlxRAHz6TF4deGRlF1UBnfBdwITtTLBCbsIX9K5wi88zz943KPBgi6CcQ7/8hGafzaqAirQEjz+QsnSjXmtmrsEsgLx455RsP+OOylsoc60UuDREVJgpODvK+0H1BR1Gw77pXoyEuEhsyWyQ0dXlOlAgKDMNH66auBszoyVAqkYehNFgWG7Z7u9Cak2wBQfLDzN9Ekn9cIs5/+uJERG29WhRgOSrHSp+mvgQ5OIo3BELmoGx7SMnHCDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COQfJ9cXtlA7UIJk7VaHsvDyCd7LmdLVrgloG0YU3Gg=;
 b=ek5QYgbLywyD/y1tHbgWsUxhvWgiZFXZhawagYs5mzZaWV6MIA5Y60KxU58BpBHDV2iuHbdl2Sl6a/s0Ox4Zl8vE0+rg8yxWFVCE/5fCXt79UeD3o/EjaT6eLhqAX9GleZQBr76eRImo5UgE5Rchlkbqib17mDyfQsVK06u+AE0LvZU1Q27Jzmt9uFYTmWN5Jkt9Cqiw5Dby0iAx8lxq7r6A1JrH8m5AkG3K2wpk++KIhBmbTCJAzmNBeN+DXSGnxouQjojQs+n/0amGPxByOiV5dc4Txa94/UwUaiJiiEZOLK9ja3brxt/GlzHX9UAPmuGvbcHwP6vYo4mwUEbS2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de5c29dd-7827-10e7-9d12-bd8a9a048fed@suse.com>
Date: Wed, 19 Oct 2022 09:38:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: [PATCH 01/10] unify update_runstate_area()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
In-Reply-To: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 80ce886e-6474-436c-6400-08dab1a4e938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c0qls4/pCAqsGa70KzhcNzFS0Elt6aS8WYI+sa5Hnbciwktgr0FGurxEGyylMewtIy+z+eS+LX/z9s3hJWGd2nN71JnZEO4wGzF/NCrqmVJWObGwZFcvDRKI9cjuhfvJSzALaMFTZj5DHkMJsB+spvCyrURsuUItD8qkMVmTWLHNmUv+2lNQIPUoUasSoa6yXc68wU2oW0xC5ikWnqT+5bZGQAFqhgN+EJN5N5UuCR5Ix7bRB7nLAWG0SjsBToPMTukZE2b0rk4cuPDNnd35tiRhFsnBv6jQCwWEy4iugZwUU5ZDKY1D6KMehfbsfIzGX3gfRmoqwbg22Tb2McL7m2kgybmh8DUpUcKWkwRx7Uj6kSeK7W7vS5d2nhCgpLp9aKUB8U+5lHgx5ynSpSNzyi59nqQZ8gQ+Fd0TofkuIIOsRsMZEZgmT4EhV7eNw/JnHjagIgGPFUR8dvIQkc4PwhaY1dsJ+om4yaxQ3oxkfA2yyPHetFLkqH+MWQeprHGVXAF50Z1Ro48AgGpVLpU8bYykOLn6tclaUq7VIWSFBvvSHz/yF0KpRlaPJANhdE8WFXw5uus8yIRTgUclSX3Ti8cci7dg0J8z0OcdHSCcSptWkwayHlKaWbMgq4stxEzg6whhSgGR10ChpUvoNy9+7PRx0j8isuGJ1Psxy7ajIACr1XaUBJCO9sIt3RcUNUVKb37MU84YD9M/sABZKVS46l0uv5s39IHz6Q4IskE9EZUr6AkH2O6pXCLzn13KeW9AIJCfuaFzIFz0q/fXdto9CrDftQNTuG9UC8uOZNvspfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(15650500001)(41300700001)(2906002)(5660300002)(31686004)(8936002)(316002)(6916009)(54906003)(6506007)(478600001)(66476007)(66946007)(6486002)(4326008)(8676002)(36756003)(66556008)(38100700002)(31696002)(86362001)(26005)(83380400001)(6512007)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zi9ELzRvVWpWRWE3cEJBMW8wODZVeWNnZmNBaTh3Q2VaUmxNNnU3SEt2K0E0?=
 =?utf-8?B?ekdWd1JWNHNYTjRyRC8yOHNGdEpKdmlVemVXUUUvcmNBY2FpL3p6SHFlaERZ?=
 =?utf-8?B?bnFteFV2cGJsS0JaRWM4dXdPT2kxSUV2QlpieHNWWGxVaXZDV0drTlR1YXdO?=
 =?utf-8?B?YjdTVnh1SUVBOEFINEladXlSK3hSSjVnb3JVekdtaGc3dHNvVElITHFZQmY5?=
 =?utf-8?B?U2V3b0NvY2FHWWtDQlNvUDBNRGlaV0YvNVNYYjVvd2tvK2tMNlRzSzBBbktj?=
 =?utf-8?B?clFLQjhjdWxDK0dMd0tmQUFiMGJwSXRWODMwTWNrWDQwRGMwNy8vM2RkY3g1?=
 =?utf-8?B?ZVk1SHZZSUl3YkNLZUVmNjVLMUl3ZCttSUR2N3ZWcGJCaElNeFlpVjBBTnRx?=
 =?utf-8?B?UjdLZnM1ZjV2Yi81b3JkaVYweXRvQi9LOWttMXRlL1ZWQ2FCbjFRMC81UmhR?=
 =?utf-8?B?VEdaazF6WElxTytRR1ROYWhsU2VIN0VQWndINUg3RS81NTZMaWptSkpjVkVR?=
 =?utf-8?B?azFxajBDaFpJY2xhalM1cjhHTVRGY0FqK2FjZytzSVBLaDVlQmJyaHlYV00z?=
 =?utf-8?B?cTRFUVVDTXRkNHNYRWVFQWEva3BxTDJtSkZyM1BYak02a0dGUWdzNUVKSGtU?=
 =?utf-8?B?MGVoZTNDVFJpd1BQRXZoT2s3TDJZcTVoK2NPQ0NaWnNqMG16R0hqci91dWc5?=
 =?utf-8?B?WTJyRkJSZ2oxYzBtSFdxQTlKenhlMFpiTVE2dXRhSERWWFd1OG42ZVJ1Q3Y1?=
 =?utf-8?B?Qk1ydnFLZXkvRTQxQU5BZ0h1VUR2OWFPdFAwUFlJR0prRy9CVytEMGhuTzU2?=
 =?utf-8?B?cUNIcU5yYkxnRmJtQllzeUJOanhaVGt0YUJUOU10Y2EwWWVzMC9ZQjI0TVhM?=
 =?utf-8?B?Qmg2a3YyY05yOHdpWUowcVgvTVJtRjZPc0RnS2VLV2MvVE0vQ1R0cXJtaysz?=
 =?utf-8?B?MGFBMjBsQVJibWRnQVJhb3Q5aVF2UHdUd3VwamxNdUNmWWszS2VKa2VWbTh2?=
 =?utf-8?B?YVQvNkdvaFFjL2RuemV0TzV3U0ExM0tMcEJLMWFVLzExQ0FTaVg1WDhUaWRn?=
 =?utf-8?B?eVR1dlV2cjFHbzRaYmxmVEJqRk13aTdkMDBmZTdiUGtJN3hGcDZhY2Q2aml4?=
 =?utf-8?B?ZVgxNDFpVDJ4SFpyQUU5K3FSUGFESWtOOVVhSTVpODNMSXdmVDZBYXdSeU1p?=
 =?utf-8?B?UG1ZNW9XM2R3TWlMWEo1RzhCTThPUEZFYXhySko3aUp4cVpHajAvaWJvbmpR?=
 =?utf-8?B?K25Fb1BCUGlxWFBaT1cydkh6QUl6SFFDSWwrTHB3aml2aHRvOW80bzM1V1Mw?=
 =?utf-8?B?VnI1QjFYajkreEJWalVwdkxRdzJ4NjZuSEtOWE5tYUY4dnVRWmhjY3doWWpF?=
 =?utf-8?B?RXdsa1ZDc2hSeFliU2VJRGd4Y0JLQTl6dlRXTUJDcGhKek8weVQxYzR4UDFL?=
 =?utf-8?B?WmQyUjlSY1NqeGwvOXVuQmtnQnNUTVVnekw0ZzVyc3ZZQWg0ckRiVnB0VlRH?=
 =?utf-8?B?Wkx5ZFBHVVdGaTc4c3lWUGlKV2Nwd2lMWmhHcWkwVjlXR2hLY3k0TVJCbkth?=
 =?utf-8?B?UDNySnp3enRJYmFvTkVlTHR3V0E1b3pycDQxM1JySnVWcFlHN0tFSUZ4eVIr?=
 =?utf-8?B?Y1ZydmUxWER3SlUzVjVYcURlY0graXJ6b0J4RDB3RzdVeE1DMkozUlhIVzNH?=
 =?utf-8?B?VDFIZHMrbnczZTNBNjV6ZTUrR3huakhxZEdwWE9QYTVQbnVWWkt4ZFM1TTlS?=
 =?utf-8?B?RU44a1ZWU1Uwak9uTVlWQnBENUUwR1dXaE5VazFTdEwwZDlKR0YwOVZNQnZo?=
 =?utf-8?B?eHhPcXZIRVkxcDVkSkNtbDZHT2JJU0FGOU5PZS8xYmIwL3M1NnZLc04vTCs4?=
 =?utf-8?B?bTByWGFsdUhuUW9LdjJTRE1yNTFsb1ZuRFhDL1hOcENmRnM2VFY1cXhsWGtU?=
 =?utf-8?B?bGxWbUc5dHk0MVNLUHVOVVRSSFpZeTE1ZjJ3YTJ0WXdtUHdlOWJoM3pPWm1B?=
 =?utf-8?B?WVdUTHNSdUptdy9CcGlxTUcyY2YzU3VCRmVGYitZVUZpYWNPRW9pTXJ6NXJY?=
 =?utf-8?B?N0xnOXU0aWdJTjFPdjE5ckptMkFHd1JTT2ErRXZQTVI3RGcyblRCcWpmc3c1?=
 =?utf-8?Q?QNGksONWwvH0Mnus/2JKhGtdx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ce886e-6474-436c-6400-08dab1a4e938
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:38:27.3292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfC+OdPr8EqfKYjHerugrt1a4SIHu5lpasVLwrw9KWNC2VeWVWsAPbFF75gUjp3MNJqnd3ptDxcyzvZ/D607oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7053

x86'es variant is a superset of Arm's, with CONFIG_COMPAT parts already
properly marked. The only other missing piece is
update_guest_memory_policy(): For the time being Arm simply gains an
empty struct and inline function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -281,38 +281,6 @@ static void ctxt_switch_to(struct vcpu *
     WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
 }
 
-/* Update per-VCPU guest runstate shared memory area (if registered). */
-static void update_runstate_area(struct vcpu *v)
-{
-    void __user *guest_handle = NULL;
-    struct vcpu_runstate_info runstate;
-
-    if ( guest_handle_is_null(runstate_guest(v)) )
-        return;
-
-    memcpy(&runstate, &v->runstate, sizeof(runstate));
-
-    if ( VM_ASSIST(v->domain, runstate_update_flag) )
-    {
-        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
-        guest_handle--;
-        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
-        smp_wmb();
-    }
-
-    __copy_to_guest(runstate_guest(v), &runstate, 1);
-
-    if ( guest_handle )
-    {
-        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
-        smp_wmb();
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
-    }
-}
-
 static void schedule_tail(struct vcpu *prev)
 {
     ASSERT(prev != current);
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -295,6 +295,11 @@ struct arch_vcpu_io {
     struct instr_details dabt_instr; /* when the instruction is decoded */
 };
 
+struct guest_memory_policy {};
+static inline void update_guest_memory_policy(struct vcpu *v,
+                                              struct guest_memory_policy *gmp)
+{}
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1852,64 +1852,6 @@ void cf_check paravirt_ctxt_switch_to(st
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
 }
 
-/* Update per-VCPU guest runstate shared memory area (if registered). */
-bool update_runstate_area(struct vcpu *v)
-{
-    bool rc;
-    struct guest_memory_policy policy = { .nested_guest_mode = false };
-    void __user *guest_handle = NULL;
-    struct vcpu_runstate_info runstate;
-
-    if ( guest_handle_is_null(runstate_guest(v)) )
-        return true;
-
-    update_guest_memory_policy(v, &policy);
-
-    memcpy(&runstate, &v->runstate, sizeof(runstate));
-
-    if ( VM_ASSIST(v->domain, runstate_update_flag) )
-    {
-#ifdef CONFIG_COMPAT
-        guest_handle = has_32bit_shinfo(v->domain)
-            ? &v->runstate_guest.compat.p->state_entry_time + 1
-            : &v->runstate_guest.native.p->state_entry_time + 1;
-#else
-        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
-#endif
-        guest_handle--;
-        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
-        smp_wmb();
-    }
-
-#ifdef CONFIG_COMPAT
-    if ( has_32bit_shinfo(v->domain) )
-    {
-        struct compat_vcpu_runstate_info info;
-
-        XLAT_vcpu_runstate_info(&info, &runstate);
-        __copy_to_guest(v->runstate_guest.compat, &info, 1);
-        rc = true;
-    }
-    else
-#endif
-        rc = __copy_to_guest(runstate_guest(v), &runstate, 1) !=
-             sizeof(runstate);
-
-    if ( guest_handle )
-    {
-        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
-        smp_wmb();
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
-    }
-
-    update_guest_memory_policy(v, &policy);
-
-    return rc;
-}
-
 static void _update_runstate_area(struct vcpu *v)
 {
     if ( !update_runstate_area(v) && is_pv_vcpu(v) &&
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -681,7 +681,6 @@ void update_guest_memory_policy(struct v
 
 void domain_cpu_policy_changed(struct domain *d);
 
-bool update_runstate_area(struct vcpu *);
 bool update_secondary_system_time(struct vcpu *,
                                   struct vcpu_time_info *);
 
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1579,6 +1579,64 @@ int default_initialise_vcpu(struct vcpu
     return rc;
 }
 
+/* Update per-VCPU guest runstate shared memory area (if registered). */
+bool update_runstate_area(struct vcpu *v)
+{
+    bool rc;
+    struct guest_memory_policy policy = { };
+    void __user *guest_handle = NULL;
+    struct vcpu_runstate_info runstate;
+
+    if ( guest_handle_is_null(runstate_guest(v)) )
+        return true;
+
+    update_guest_memory_policy(v, &policy);
+
+    memcpy(&runstate, &v->runstate, sizeof(runstate));
+
+    if ( VM_ASSIST(v->domain, runstate_update_flag) )
+    {
+#ifdef CONFIG_COMPAT
+        guest_handle = has_32bit_shinfo(v->domain)
+            ? &v->runstate_guest.compat.p->state_entry_time + 1
+            : &v->runstate_guest.native.p->state_entry_time + 1;
+#else
+        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
+#endif
+        guest_handle--;
+        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
+        __raw_copy_to_guest(guest_handle,
+                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
+        smp_wmb();
+    }
+
+#ifdef CONFIG_COMPAT
+    if ( has_32bit_shinfo(v->domain) )
+    {
+        struct compat_vcpu_runstate_info info;
+
+        XLAT_vcpu_runstate_info(&info, &runstate);
+        __copy_to_guest(v->runstate_guest.compat, &info, 1);
+        rc = true;
+    }
+    else
+#endif
+        rc = __copy_to_guest(runstate_guest(v), &runstate, 1) !=
+             sizeof(runstate);
+
+    if ( guest_handle )
+    {
+        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+        smp_wmb();
+        __raw_copy_to_guest(guest_handle,
+                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
+    }
+
+    update_guest_memory_policy(v, &policy);
+
+    return rc;
+}
+
 long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -98,6 +98,8 @@ void arch_get_info_guest(struct vcpu *,
 int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 
+bool update_runstate_area(struct vcpu *);
+
 int domain_relinquish_resources(struct domain *d);
 
 void dump_pageframe_info(struct domain *d);


