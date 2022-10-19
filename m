Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C21603ADF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425577.673495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3kE-0006qI-FE; Wed, 19 Oct 2022 07:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425577.673495; Wed, 19 Oct 2022 07:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3kE-0006na-Bi; Wed, 19 Oct 2022 07:44:06 +0000
Received: by outflank-mailman (input) for mailman id 425577;
 Wed, 19 Oct 2022 07:44:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol3kC-0006C9-JI
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:44:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd81bc68-4f81-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 09:44:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 07:44:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:44:02 +0000
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
X-Inumbo-ID: cd81bc68-4f81-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UH+93NzZPaEl9BwAyleGGJPfojXWlG5Cqh1x8Nns1vD2J5OfjNA0lFqoEYnLCUwYdzqdAd1MllGrfbBKW8sHveBYRtnSLr69sG/YVlK+ecSC9jrdz+KeOCWrlexcQ2Njj22gLpUEW1z5oXG/XV02mi+rZk+0WoAvpI+kDV0K0gMttutNRbeuLh+bIVtJl8jwhP9/dKZUvP6LrW4AhkPmWsUZ3uHE9U97+ltBhKgDvxKucFSSnzmPW/ojCo0bqkRPneXKfSLLnowg6K2fc5OCXkHBtaSy+yxq2CHNUP/c2MYR2j4ufWiVY1pUHa3YefSKgBGUMoy4rfe1VAiMKXdu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIAHlBsa3yb3lyHlE99+Grwv42zC6285qiNcBzkrcuI=;
 b=VbYTVlSL4+2k2jwzh/9QF8Ol0Bbxx599CVi2upaP0C+8sjN9P9JksUU9kvg7++HXB5pP9PdIvTKSCggK7Ci7/fJUEgkeWk5Yh3zKWy1qByw3af40iLlknKUkanRyvWv8TPYDgfEiqRzU0ThihsufIX1XFnaZn/i8TwNsEGKHi92KOtBsO5d/0J/mWuF7SsyR6PXAKgEtwXVBrV5Nn1zkK9b/iCgniF6neRhis+TU7b4xoUUhR1TfSBrLWFt7HSSo71OC+ZWZ083GiFXVqGtHZYO/BvLGuWdY6ZSnoIDNlaxkGeTh9OoOv9ui5B5tLxeTwbtWL7w8UScbqo0ACb44LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIAHlBsa3yb3lyHlE99+Grwv42zC6285qiNcBzkrcuI=;
 b=rTASEkTnnFECeR4zCziETpLVSHfq6wRAWh/OEOi9b2+MNDJ9FVRGt6TVWibfDk0kfWMPfeJNl64T9lsWiS3lywgNqvKMNYeOKaDGnczJUKVaNlyHc6zOZD2HBOpBv/0L/DQoXUriI98zD4uxOhWZF3xAUpjUnSC3nUKiKMmQ12vUk8udEaM9XkBUN2f1Qd8ShFQblXCjkk+FF6YnsEEkxhhka9cgSChuKmTE/RA/FkMjGdHzFKCUoG1wKv/KGgEMbmAt0mw4Rb/XZBPNUkLBrwyG3VN7GoY1mih6gCPOsP7Iqf1edXgBh1gUpYp/wcr7mb1olGLCGXPjQLdBrFsu+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <64915cea-918c-fc3a-6e4d-cd56b40cd225@suse.com>
Date: Wed, 19 Oct 2022 09:44:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: [PATCH 08/10] domain: introduce GADDR based runstate area
 registration alternative
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
In-Reply-To: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c7400c-f9cb-48c3-26f9-08dab1a5b114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IOgZRECG5gH1I6OM4Y80/3SiCbMCzeXOvt25L2g1amD8Dmop75BIYhkOSjKwjiFDYGDCM1jl/oFxdjSwpR4jc8UXabfuawKmlChvaUoShqp3w86cpZNu9tSc90HenYP94TJ4CBCYu2scoy3iJBdrW49Ol4YA0wnGmibONUqhCz6jxqumX+bTtJU9mzhsZdjeUkePwLJ4o6G17XavJUuKxbQ++bpCHczNonrlUuPrQk3Zp3rCZYzzH3DV+TZxDKLdGdYNALn6haWYibSXYZa//4W3lxgNXMN7gmm8QMR7b2cpvT0qsrsAeoiUZ6qfM949yqw9wyDoi3SoN0O1hd8zbvrcL+UhN1ibgaBXIZLa5CMoDDYvtR/REhlAsPjg47vaJGwIrFY23gyV7NGqjKp8T18DxMVkl6o/mWbJJ3S0BVH74UDchYK7kUGx+PC91es/zRg9S3A2wSCbeGV3Tyarc3fb29Iw90WXZQ6CF5YDTNIsUPpv3HXxMokR0k+tN9VcioTEjNr8E9qTc2zi1bRGNS2ohRfWXNHz39XM6IoEc66GLRrWT+wffLlYdVRPlzj6r+ldksbd6eo1vF5RmoCcr1xMPUs/hzbin0jQK/lMfBL9m0aCmTpXz3dTyDiE5C8TozXDsp9XeOtAmevOwajY1yUu0JbgqcDDSyoS8lAg3jb3QP1I6aj9keJfKHZeO528zCu2E2WM0aYv1yNtcl7XbmatQOkH1XmKXwmbSsVdPIRuOrmYFm8gxExPcUZ0GLj0CmDI+cVP8gGBzVQQv38uz1TkFyKMff9/d+vVPPq9USU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(36756003)(31686004)(86362001)(31696002)(38100700002)(2906002)(5660300002)(186003)(2616005)(6916009)(83380400001)(26005)(6486002)(316002)(6506007)(41300700001)(478600001)(6512007)(54906003)(66556008)(66946007)(66476007)(8936002)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXU2UWJPS2dYWW9zZEd6bmd0dlQ2YXpSamlSVmhkWmQ1QWMvbGdCYjNjMkU5?=
 =?utf-8?B?S1JzM1BRNmlLc21zaVQ0OW10MW55bTE1NDBRNytQdzBIS0RaQ1E0V0FwQkoy?=
 =?utf-8?B?YzgxNS9sZkFBRWJsOHZPR201VjhrcWNQZ2FTKzcxTGVEVWk2dmFXamFkTUVU?=
 =?utf-8?B?cjQ0RCtKdVlvYmFSZlpDKzJqeDd4ZjlwSzEySzdEb2RydnYxcW1yTG4wc0VR?=
 =?utf-8?B?dmVkb3lsajRFS3VEZWl1emNFbnFtOG1BaTAwTkZYZThUeWtvOFo2eGNnTnM0?=
 =?utf-8?B?ZjFlcWJkMHZYcXNPeE9iUkVYMVVDbkhneGRCU3VOQy9rZFFNM3lUcCtIcFpm?=
 =?utf-8?B?TU9GV0prY2dmSm5VLzBBZ091dVdoem5xYU1BSkhhRGRmOGhHUzF6U3VCK29G?=
 =?utf-8?B?ZXdEUWNkY1hEc0FLdzVjZ1MxVWRXa2w1YmRhUTk2SHBteWF4RzE0S0tKazRM?=
 =?utf-8?B?RmFnMkllL0tOSkhuUDBvaE96SHZYSThsZC9TbnBRSGxhU3p4TEI3cUJRdlcr?=
 =?utf-8?B?L2JRZkFIczU0c252SXE2SHVxV1llbXRXb0U2VUhwa3NJQnBLQVNGaFU1L2g0?=
 =?utf-8?B?UTdxT0dja0t6Sk9rdUIyTVhvMGp1UGdnVFhISEhQVWRaT1ltY3lrdTlGeG04?=
 =?utf-8?B?QWxPcHk1empTL013dkRSc01lRUlXMGZ3K3gxMlc0VjlqYUdLTGVjT2E4amhw?=
 =?utf-8?B?UHZLODhFNlBzNDdFa1JITTdVV1JRSExZcnhsc3kydGs3RnlOVndoZDJmalVH?=
 =?utf-8?B?MWZtVDdPT1hqMFI1NDJLa3k5RnBPcE0rbFhIV1dnUU9IVnhtTEFKcENrTXNH?=
 =?utf-8?B?RmVFWUlPVWpjK2hTOEpIaStNRWxvQ0hiY1V6QVB3M3dnSXJ5c3JrbHArTWxE?=
 =?utf-8?B?NUZsbU5zWTlCYTJuVE01MTcxT05PWDVYVWhGWVF6UXV6ekdieEFGZS9qSWZT?=
 =?utf-8?B?SVRzZndsRmYxaUt5UzFqR3BXd3VKTFJhRGY0TzdYbXFwTC83MDdnTWF6ZmxL?=
 =?utf-8?B?TGhaaWZMV3JrU05Va1ZLM1J6UTI1dWd5SEkwa0VzRWd5aFV6cWJpM3hISTVH?=
 =?utf-8?B?ZmsrTm1WUGw5Tis0aW90WDFFUnZ2YnozMk1PZjJBczkvMVczUGtDQVd1M292?=
 =?utf-8?B?MXNEd2pxV1F4K2U2SS92Ky96RzZGM1prd1laQUs2Y0d6VlZHMjhiM3IySGlJ?=
 =?utf-8?B?WEwyV2JxbWpBcGdVRGJVZE1CdVRiWE9JRTNjbVpQanRQaEJZNDhxNmJoaE1Z?=
 =?utf-8?B?RVB1ZUg4RVhNenFjRWZVOTBIWEd2TnZxejFwTm13b1pVbGVqYkM0YWM4bHg0?=
 =?utf-8?B?UXZzMlN5NE1Ja0hrMWhVdFkyalhxYUo0NElJOWJZdVVtKzBaVi9YaUZ3ODVT?=
 =?utf-8?B?WGJFd1hpcXNnNDUvWXZWQ2UyWG56dFE0QXNrNzVxd2FIV0IrcFB0UkE5cHJ3?=
 =?utf-8?B?WTJlL2h4OWNrUTJxdlI3R2JtUmNDWFJScC9NOFVYRi9XZGYxNDV4b29TR0Ry?=
 =?utf-8?B?NWpmUkVhMkwvbGEyVXhBQ1EzWmhOMCtyUzNoU0RNSURvUHp6QjFMUHdiSzRD?=
 =?utf-8?B?VndjdWYvZGp5aGZsSkNvOW9oTEhkRFhWT0ZMSWE0VDRRbXNDcTB2K0xTTjE4?=
 =?utf-8?B?dnRaWnZZai9EMUdLQ0ZkVW5pWnUwL0MwY2dBWThqUDlEdm1tK25kR0piRmlD?=
 =?utf-8?B?WkErRWFiWkx4UDFMeDh4b1g5em5mSWhSaWVxSS9HeHp6ZUJXT3k1OFZPenBZ?=
 =?utf-8?B?dElQb0JDRTc1VWZZQXpRTUM3L0VJc05tNG1BRlYxTlJIa2NuSTRFWHZHWU9w?=
 =?utf-8?B?MVBpQ25GTmpFZVh2K1d1OU04RllqVGpIYnV6ZVRiSE0rSUtwVEZCWFdLSXYv?=
 =?utf-8?B?MlFBem5tL2NRcm1PMjdEUWY4TGZFUDQ1VUJIc3EzNFR2OW1LdXM3YzB3dlhm?=
 =?utf-8?B?a09rby9JMENadnNQeFBUVVRaL3IvNm5pNXp1bzVIVDVvZDVCOWlyc1hLR09W?=
 =?utf-8?B?LzNmL3ZxQkQvekhrOHV0NU9sUVkrcG1EYVJIU0I0M1JwS3BiSk1CYnlENWlL?=
 =?utf-8?B?a1B1QkJXeWMwNzFJeHJJcTIwbDJzQ2ZiaUJpaTQ4aW1kUUlwZzh5Y2dIY3Ey?=
 =?utf-8?Q?HygieqmEWl+R0Ric+pows71av?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c7400c-f9cb-48c3-26f9-08dab1a5b114
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:44:02.6048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FH0OPZQNC2aytKi8GbB8EBedXXPjhTSRlpqI1OcdNirYjhPDHWkdxKeN7hjlCu71X/RPPyCM9nDT6eFrhSn5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064

The registration by virtual/linear address has downsides: At least on
x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
PV domains the area is inaccessible (and hence cannot be updated by Xen)
when in guest-user mode.

Introduce a new vCPU operation allowing to register the runstate area by
guest-physical address.

An at least theoretical downside to using physically registered areas is
that PV then won't see dirty (and perhaps also accessed) bits set in its
respective page table entries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -12,6 +12,22 @@
 CHECK_vcpu_get_physid;
 #undef xen_vcpu_get_physid
 
+static void cf_check
+runstate_area_populate(void *map, struct vcpu *v)
+{
+    if ( is_pv_vcpu(v) )
+        v->arch.pv.need_update_runstate_area = false;
+
+    v->runstate_guest_area_compat = true;
+
+    if ( v == current )
+    {
+        struct compat_vcpu_runstate_info *info = map;
+
+        XLAT_vcpu_runstate_info(info, &v->runstate);
+    }
+}
+
 int
 compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
@@ -57,6 +73,25 @@ compat_vcpu_op(int cmd, unsigned int vcp
 
         break;
     }
+
+    case VCPUOP_register_runstate_phys_area:
+    {
+        struct compat_vcpu_register_runstate_memory_area area;
+
+        rc = -EFAULT;
+        if ( copy_from_guest(&area.addr.p, arg, 1) )
+            break;
+
+        rc = map_guest_area(v, area.addr.p,
+                            sizeof(struct compat_vcpu_runstate_info),
+                            &v->runstate_guest_area,
+                            runstate_area_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
+
+        break;
+    }
 
     case VCPUOP_register_vcpu_time_memory_area:
     {
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1789,6 +1789,26 @@ bool update_runstate_area(struct vcpu *v
     return rc;
 }
 
+static void cf_check
+runstate_area_populate(void *map, struct vcpu *v)
+{
+#ifdef CONFIG_PV
+    if ( is_pv_vcpu(v) )
+        v->arch.pv.need_update_runstate_area = false;
+#endif
+
+#ifdef CONFIG_COMPAT
+    v->runstate_guest_area_compat = false;
+#endif
+
+    if ( v == current )
+    {
+        struct vcpu_runstate_info *info = map;
+
+        *info = v->runstate;
+    }
+}
+
 long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
@@ -1963,6 +1983,25 @@ long common_vcpu_op(int cmd, struct vcpu
 
         break;
     }
+
+    case VCPUOP_register_runstate_phys_area:
+    {
+        struct vcpu_register_runstate_memory_area area;
+
+        rc = -EFAULT;
+        if ( copy_from_guest(&area.addr.p, arg, 1) )
+            break;
+
+        rc = map_guest_area(v, area.addr.p,
+                            sizeof(struct vcpu_runstate_info),
+                            &v->runstate_guest_area,
+                            runstate_area_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
+
+        break;
+    }
 
     default:
         rc = -ENOSYS;
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -235,6 +235,15 @@ struct vcpu_register_time_memory_area {
 typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
 
+/*
+ * Like the respective VCPUOP_register_*_memory_area, just using the "addr.p"
+ * field of the supplied struct as a guest physical address (i.e. in GFN space).
+ * The respective area may not cross a page boundary.  Pass 0 to unregister an
+ * area.  Note that as long as an area is registered by physical address, the
+ * linear address based area will not be serviced (updated) by the hypervisor.
+ */
+#define VCPUOP_register_runstate_phys_area      14
+
 #endif /* __XEN_PUBLIC_VCPU_H__ */
 
 /*


