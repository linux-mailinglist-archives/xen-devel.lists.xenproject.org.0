Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219737B1490
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 09:17:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609323.948354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllHF-0000LG-N4; Thu, 28 Sep 2023 07:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609323.948354; Thu, 28 Sep 2023 07:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllHF-0000IK-KJ; Thu, 28 Sep 2023 07:17:37 +0000
Received: by outflank-mailman (input) for mailman id 609323;
 Thu, 28 Sep 2023 07:17:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qllHE-0007vD-DA
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 07:17:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1804ff52-5dcf-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 09:17:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8884.eurprd04.prod.outlook.com (2603:10a6:20b:42f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 07:17:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 07:17:32 +0000
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
X-Inumbo-ID: 1804ff52-5dcf-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBH63qH2I2T1kLmiH0qUjmap+t0DXcgR0/Gke2lrwyxN7P9CEt3kig/Wn6wio1R08Grgjpln/+7+io/Tn70jayxGXF6CM7LPCMaWRRxH3Z9OSO14GrJynwZigbkCT4peXcvfEVpJreH+WetEcW4AqoXn2z6DXBRg0MX+IjyN+Me+oiJS6Q4VLJPpO31+RX9RKB0j9AdLhthe4iW1XshFFxmjiY7zKf51m+cM2I6DRvooJMaEg0F93jCmzjEMIYZ74IyGDF708luzUYv7MpiXFXI7Q49u1V5XiEvzlwPoVaNKBSXUkQofc3nzAirOKR0SzshgWph1fuIlnHG6jkVzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHe12jYFCsixkC+lD66ZJrCoQJgG2Et89o2kOEOZydg=;
 b=VpJyExhxKzCC6rUcM0D0xGEMdMNIGXhkOFOLzmreoRDT6HyNGiGLB+6nZP1IeSeSl+/ZR+MJdEfCyolo4c4RsqRfX8yg+4BcR5jb+gzBNiOfdjqonfAY2pHGMiIomkNpoo6ReZTGhXIjTDHEZHVUmITovklisR9Hf7yuuWtt0hirxD5hHiLNGy5AnetZbKf/+pXvPVZ7A9su3z3ei66S5npeCUbWM0VVMWodylBoKS83mpKrUUmTmRV48WEDZkHdChLxVHCyuuQaS6EZNvJj7TMN/90YrD5bU19V4w77nQMFFu3VC5DOYIpLMjIRhXhGdnsER1B/cCKuHVpgml7DWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHe12jYFCsixkC+lD66ZJrCoQJgG2Et89o2kOEOZydg=;
 b=xFMu8r8JuEU2YjKCWjdIKRzeWtqXG7RFR6oDic0x0/Lxk1o824jCSL/Wp3tvoSbfi+d1yQD0BVAg2DXtQE3cdSzGc3MGl3QCWmGanvwxlbeh+JC3zj1+RPP3sdRgvA7eaGVC/YfqQTeU8gDWN+aO5wkP6+PdGvfL+K+7u8T3Q/M9dgbWikpioM4vIqGurfKGvXbNCHTOeBr363R158XAu68cX5kVo5zeJa0kR2Wl0tztgOPlFV62WXIkXNiTXXBRAFSHHi8vXb1A2dso9/0bj7Mk6JsYsI2SRaHiMmIoFXu+G3GC6rhRr1EncxWcz83D5RqodoKyWVomNctMcevA4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00736f1f-6a0e-f368-194c-edca196ec577@suse.com>
Date: Thu, 28 Sep 2023 09:17:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: [PATCH v4 7/9] domain: introduce GADDR based runstate area
 registration alternative
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
In-Reply-To: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8b28f6-3851-4203-ffa3-08dbbff2fb94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mM5aKLELW8bAnciazI5LknkegWzpP6f4wYSpqcqQ/TF5LwllXCOmkEeRdVvP7XaXnMWtxe08yWdHUO3O0jAR9hpFI8rPzCHblKu0WDb8aFVhvPIZWSYmb/Y3zNOSlyUODb2i0fajShQif9QIP1R5MFEMA3KuAUdPEbDXALmcr42Vbi+AJ90EojVilTyyxu4H4+0g4hK62clSDNjbYa2J8nKo6b1hB/kLZAVPyocKDBWQupSnRNcPnQJUfwWd+U5bsVeFQUacKDvq7Awc2bVA5cKJs3xpStCcv1fVeIHdHsv+e/hRB0UfBIVMoOP38SGnePGHP822qk51pcq55g8eEYxQC1Fqd+sWgBrH3c15XUzCKm/ESroEG8AA0l1pQqpL4wyKgQi1R6/qP6KBayu55Uh/NruRTy0O414rQNmF5/HPnHXQq+Y3ksqRCALV5fh1bogjx3ABtsqtyjdPr21ebl8Is3q3JMyphAxDqTzMCbJrCWppYLRiqwwy+MXsOWIUcwrELMA5OQ2VkCClWxlFXOjzqJbyFcxfsnWKMQ3Nb/+g82QApxaGnjW56Biz9c67iMTvprUQTzdczFOL0hwJncbEmntkURC2nzFrSE3s9Z1lTvzvpaDDvP1h7H7VTp4QuFdBZXj9UCEMcl+qwhBEPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(2616005)(83380400001)(26005)(31686004)(478600001)(36756003)(6512007)(6506007)(6486002)(66946007)(66476007)(316002)(66556008)(54906003)(6916009)(8676002)(41300700001)(8936002)(4326008)(86362001)(5660300002)(31696002)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blhiSnNwN0oreFFzR0h5NUpySTd4S0pQTUx2cURBTkJIZlE2RkVIMXc2dVNo?=
 =?utf-8?B?c3JaSUZFeStBbmdnM0pyYjZqcUF5SUY5UkVYVEFzdWhqdERnY0RQbVBXeGRS?=
 =?utf-8?B?bjRNSTZjVkg3eHc4OGN5cUVXUDR2R2JCSWpSUlB6SHNiL3ltY2kvblNyeEMz?=
 =?utf-8?B?dTdJcG9TdHpaeTQzLzJOM0dTTHJiWG9QeHYwZG9LSGZQYzk5b2tIMXNtamZa?=
 =?utf-8?B?WFhGVHZpdGViUDcyZi9qMEMzbEV0eVY3Y1FCT1ZXMTZDb2gwR24wZmVhRHRu?=
 =?utf-8?B?VHpKOHZmQjVqaTBsNFBFSmRHVFg3NFpHYjdMU1JVMlVYMUpYWVY3ZHcxc1N0?=
 =?utf-8?B?OWg2aGxUNUNpWmNEQ3RSUVpvc3NiS3grUmVSUG5TRjBrWkJPQmR5NHlVNzV0?=
 =?utf-8?B?R0MvSm1wUW1FdDBLaVozelozTTZ1eXViTHlld1BHRVlRdldhVmpveWJERU9t?=
 =?utf-8?B?VVZyLzdNek54SkcyTWRnWnZiam4vQS8vKzFhWmZxOVhwTndHa2lpd2RTSmhw?=
 =?utf-8?B?OS94MVJmVEEydzRLSDE0VG8xTHFnMldnc1FJOXp5MjhHUURjTDN5cGxGUDZW?=
 =?utf-8?B?UVE5ZHRRdlFMdUpGeXZyRVQ2NG1CczB4ZTJaSTdreUlvcEp3M3BPNWNDOWpC?=
 =?utf-8?B?U0QvZm5TSGNHOW5tazNkLzBHbnRjeWZ3VnVvUDNkZEhWWHB1MmtqMEovK25u?=
 =?utf-8?B?TnU5R3JOZ3pKT0lqYmxTUXorWlVkY2FiNXBlQ1Q3dWRteW9UMGRIL09Wdmhq?=
 =?utf-8?B?NVk5dm9YakJNNVNCdWFRdUFheU5Qbm95YnRBK3BzcGNWN0RNSkljeDZHVEJU?=
 =?utf-8?B?NVlzVFpuVlh3S1JLOFJRM0V0NzYvd0hBRXIyTktvYjN1UGVoZHN5R3RiTDVr?=
 =?utf-8?B?Mi9RLzRoUHEzNDNpZlRXdk0yVWJtZDdkaDBuU3ZKZXpaVWJRNGI3Rk1VSlIy?=
 =?utf-8?B?a2lWcitSYjdHTEkzcHpWdUFiR3JHSVlBMkZGZFU1amVjdTMxdmsxcUhXbEpJ?=
 =?utf-8?B?U1NlSkl2dVBtVVEwMUkrRlFDN1BxSXBnRlhyYnV6WnpyOVRGUTBUZTYyVEJK?=
 =?utf-8?B?UkxhdDZiWnk2Ym9VYm5WT2w1TUNDM25NcmFENWppWERyTHB0K2V5eC9EVkM4?=
 =?utf-8?B?d20rUjBFL3RPWDJyUHhNNHV0S0hZdFo4RG9abDVoZzFad3ZNM1R3Y3FDK0U0?=
 =?utf-8?B?dmNXcDZMS09td3FnY2dlc0FaaHVhaVJPeDlITVpoNndMSEk2ZGlCZnFxQk56?=
 =?utf-8?B?Rmk1SytsWDIrUXpFRnE0dW5JaHhTQ28yRHlSQVhZUHh1cEVBT2lUWW1za1Z2?=
 =?utf-8?B?Z2lPd1VoUmdFdFZTUWdGVmdzMmlaREIrRVJHaXk4RGRCa3J4UkhKd0RFQ3k5?=
 =?utf-8?B?aC9QYjkyU0p3bFVzYmZXUzYxRVljSi83eGVPaWZHMFR0ZEp2UGoxL0ZMb0x5?=
 =?utf-8?B?Y1I0VEx2TC82N0ljR3R3R2tHM245RkJBR1NVOFRPRFoyZkRESGlKeWx2L3Vx?=
 =?utf-8?B?a05pejFvNGlLaUVjTzhsbGJkeVVKdFN0ak9WcGhkVXc1T3paR3Z4RVhVN0Q1?=
 =?utf-8?B?UUtIZVFuNGtjZFUxRkJXV2dnd1FQSmJUWWxIRWREWlEwemtJMU1MOTlCUHlE?=
 =?utf-8?B?bHN4QzcwelFVVkJtTkdWN1JZaGdYbng3dlU0VVcvb2R6VGJMTXlOS3Vyd0Zn?=
 =?utf-8?B?M0k5alZDVkZpTFR5dXRDekRGdm5Nb3dZSXJGalg2MGFqNGtRdXl3b0Fwd2VI?=
 =?utf-8?B?Z2dFdS9YNHk0SXJaOXB2K2lFYXJEUjJHZmhLLzliQnk3YzdLM2p2UHViNzhC?=
 =?utf-8?B?QXhvS0xuWk16Uyt3ZFI0V3IyYlMvMTQ2RUwzK283N1YvNDVORlNPMmhNM3hp?=
 =?utf-8?B?RnRtbWx0NFZwd0dhSVJlaFlTdGZsd1d0RExEeU1OcGl0bWZva2tVaVJhK1Zh?=
 =?utf-8?B?L3ZnK0FqbW91TVFkaWgzR3dvbDNpV1JwYWNscFhad0d4Tndxa2x0WTVINCs4?=
 =?utf-8?B?Nm9vYnVuWlVHUDkyL2FqZU9mNHVhQ3lzZEEwL3AzMm1WVmdXMk5BcE81bUZt?=
 =?utf-8?B?bmQwWndyVmk0VTAzWWN5MzB2aXJzZHQ3d25UTklmSEZOanNSRkM5eXlqR2xi?=
 =?utf-8?Q?YRTs8bV6u+i2JiZr9cBCRLYtn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8b28f6-3851-4203-ffa3-08dbbff2fb94
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 07:17:32.7990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlRg5ig4Xhl20PRt6+MguBjWK/7mIxaqEzfUVvwN9mu9HpjgqU9X9pTou3BHPlTgwYbHFmbjiPQWvDavD6bo1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8884

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
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4: Add xref in public header.
v2: Extend comment in public header.

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
@@ -1830,6 +1830,26 @@ bool update_runstate_area(struct vcpu *v
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
@@ -2011,6 +2031,25 @@ long common_vcpu_op(int cmd, struct vcpu
 
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
@@ -110,6 +110,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_in
  *     runstate.state will always be RUNSTATE_running and
  *     runstate.state_entry_time will indicate the system time at which the
  *     VCPU was last scheduled to run.
+ *  3. New code wants to prefer VCPUOP_register_runstate_phys_area, and only
+ *     fall back to the operation here for backwards compatibility.
  * @extra_arg == pointer to vcpu_register_runstate_memory_area structure.
  */
 #define VCPUOP_register_runstate_memory_area 5
@@ -221,6 +223,19 @@ struct vcpu_register_time_memory_area {
 typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
 
+/*
+ * Like the respective VCPUOP_register_*_memory_area, just using the "addr.p"
+ * field of the supplied struct as a guest physical address (i.e. in GFN space).
+ * The respective area may not cross a page boundary.  Pass ~0 to unregister an
+ * area.  Note that as long as an area is registered by physical address, the
+ * linear address based area will not be serviced (updated) by the hypervisor.
+ *
+ * Note that the area registered via VCPUOP_register_runstate_memory_area will
+ * be updated in the same manner as the one registered via virtual address PLUS
+ * VMASST_TYPE_runstate_update_flag engaged by the domain.
+ */
+#define VCPUOP_register_runstate_phys_area      14
+
 #endif /* __XEN_PUBLIC_VCPU_H__ */
 
 /*


