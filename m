Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BAC7B1469
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 09:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609304.948314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllFC-0006MW-HL; Thu, 28 Sep 2023 07:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609304.948314; Thu, 28 Sep 2023 07:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllFC-0006Jw-DM; Thu, 28 Sep 2023 07:15:30 +0000
Received: by outflank-mailman (input) for mailman id 609304;
 Thu, 28 Sep 2023 07:15:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qllFA-0005tI-6R
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 07:15:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7d00::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb1fc30e-5dce-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 09:15:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7811.eurprd04.prod.outlook.com (2603:10a6:20b:236::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 28 Sep
 2023 07:15:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 07:15:23 +0000
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
X-Inumbo-ID: cb1fc30e-5dce-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbFPiYwOhifIbt1NM1mxTVIVbqPV564zTdle3GTgCkVgU0nZCvYU2HA0PMfbCF9baKqMAY8BnMke/o2ZAJR5m3tbGPKOO51EaOZkxdTx4wNZXlZkeztdXwqYjJnSe0/28Qs00GuBg3r7BwIZqWVTMk47As+oo32b70g0HSwUVW/t1xGOyPj5Br3grw/miIVsAUqZoBUfrsz7U4fA/qtnHRvLIEKHqJkTiEJi+r7MEzVeppuso8YZYz5pI7K5kOTJ8/GhyPYlKWi6NJT9LordX+/2aKPOQHfwqk7ISd7ot08SDmjBCurfRt+c9ojls9xEfK7yCu59JiPPRWYpOuTSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDhjKzeHPCvDjdSeahyLl9mEZAFQA0ykwX0ENFaYkNo=;
 b=Cxfqu6SS2JvIR3NbA7R7/NOpK593g54EuZWe/waNav6pyCHp4kheHcbLJ7yeMR9JlE/1pJ/054x+sKTqDIchP9iiSpfpu389J8SLyUEqROcnDqT0d+8RHh5eWqSd454taSLUgE9loPgGx8NF389P4SKj6IystqnUq2Rnrf9Naz5gIUwOmliISuX8+zB4+0EMcWUMT4avl1rqm7by86CS782mnMBYuReZLuFL+FPmtgG9sM+oPx1JDqrTGWKm5DvFsfp4XNKrzIvUdb+uXSGPM2C0NN0n+EYYvnnQJm486+Ob1rG2dslcW9E2mM3ApSfM+DfZavpOP3Dl/LNLjTUhzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDhjKzeHPCvDjdSeahyLl9mEZAFQA0ykwX0ENFaYkNo=;
 b=pTBEjckrWHD8y5a4iKJwF3dZEg6coFR5XVHWBqTxZB0CPkA5kqm84SDeKC6ozIxA26xXjYL26P9FFVjvbczwuCO6bqmfADhr+URs6IklN223MNCQv5LI5sEcSEJTo5OTtx858qJFpAX0QgO8g+4gwD2z+FKP+U34X0HrTRXVNy8dOI+m2SsyNaLvNe8lJAtEmyo2tbmBM9mVtYB1EbPzLBIYHdlQnm8H5sB0gZTj0C/EuByWH3uRjTluxCsNx/cg22A8+Rt8JUXE3WQz9TGVdewR1AL8pOPARbPtQ7c1OMSGZIbS340xzNNt0is8pMzrXAHsqoGcu20Ghh3lkfUQ2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fedb0869-a26f-8080-4e3c-7d8f55db00ed@suse.com>
Date: Thu, 28 Sep 2023 09:15:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: [PATCH v4 3/9] domain: update GADDR based runstate guest area
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
X-ClientProxiedBy: FR2P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::26) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 838047bd-c25e-44fd-be17-08dbbff2aeb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9BVXjzIc2LxQVKyzzFgSelRPBXdrqMLRb4emBmmANbpCh3ksbsZ16QoHm4VZ0497VapLb8IvVirgT4xcEPwSRBBPvEchHFJv6pCOLfQTgs8C1GScZXYZqIiPUD8E9Ypa0ahzcf51Mb2dJix/JP+OVcPAAnUI6ESA2+5t9xXuPMBJ7jUYxanPa3nDFwLdvLkg+JSTVGPvv6VCUcf7CDqQLnzYaPorHBlQVAQXT8wb+cLb3H1auqiVzWJM20nWP5g9/4Tb4q6OscYyZwKXMkIa9hpaOnMnkPqQEePrYaNkHSnAiKvGFU5z4PbP6XLNSDCSc5Ve1g0kETILuweS5W1e0whq6x1tyOLs582cCKViYUr8G5ZY69VqssVAfPWsfVgSZ77hcngG5p1MU0FeG7nKPvnVD7zSNuhxRyZRqzCJ6mKfAocVhTjR1Ht61FVd3iGdPDRRZtgVZiO5Ny1eM0HkgoeS3V/BvkTsnN0OD3AzWneJ7YRVWb4H9dbuy3LCXlOZ28SBrotpSUihxcM6AtHSaLirclpKZ86kqo9p2W+evJNv5FfSsk9ytwh84Ok9+xk3uH4NPsa/rfanwKcd6qZzs40wEQDA9Kn4MsLN9tZ3cyAx9ogiVE/FUFdp8rQT5bdbOc4Z2CyPMr01nWh+DJZjjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(6512007)(6486002)(6506007)(478600001)(83380400001)(2616005)(2906002)(15650500001)(316002)(6916009)(66556008)(54906003)(66476007)(66946007)(8936002)(41300700001)(8676002)(5660300002)(4326008)(36756003)(38100700002)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmRkUm9MU1RIQUlNL2hDUXJsbm5iL1ppbFhnR09ueUtxNVJ0UEpMLzNhM0t0?=
 =?utf-8?B?VVYzS3ZlZWNTdllCRmZBSjVTQldXNDlOejh0dzlLUVVpR2xpRUxPUDdIL3li?=
 =?utf-8?B?aWRRODl5UEcybWE2TUlGZlhUUkF2UnRsdDVJZDlwM3Y4NS9EZ3c4R1U3U0Uz?=
 =?utf-8?B?WW1mazIwQmhMa2MvUU1PVWhyRzVnWG01Unh6SFFjd05jWGJ1OVZtbXUwdGFZ?=
 =?utf-8?B?UVJxOWxzdnZ4MkhwMDYveDEzODRadTE0T2JUM2psWjNDNUxQVG9jT1B1c21H?=
 =?utf-8?B?b0I5V0p0UVVRc1dMa1A2TXNNbmE0b2l1TFRidTlQUHd3THl5T0w5cDlmT3ZZ?=
 =?utf-8?B?bnpPeVhwSXBkcUZVUDZNaCt6VU84YmxRZnlpM2pIVmVXVklKcTVSOUROU2Vz?=
 =?utf-8?B?bmFQdU5UcHBDYUxnTTF0WCtaSW52Z3hkajZlcGJ2dmpGbTNicnRDL0ZLWjVZ?=
 =?utf-8?B?RlZXWHl1cjNmNWZiZ2lXSGlGc2hlc3Q0V1FBMENmd1dIdXZ5OXg1T053VkJG?=
 =?utf-8?B?MVc3RHI0STd4Rk1LL3lkTkRGRWFMZHBWZlArVkdYeWloZnJvOVM0RWlUczlC?=
 =?utf-8?B?UEJFdmJPSC8vVklCSXpCakZYOTFHRnFsVTBqNEpaczdrTnlkSUQrQVFCd2xF?=
 =?utf-8?B?N2V5ekxoWmwwcE03L2lvMHM0NUljeUtiaVBjRmt1NDRocHpINXIwTmZ3TFNo?=
 =?utf-8?B?VVpJakVIeitCdWlwMTBSbmFOZ2hXemY0RHhTZ0NBeGoyQk9SYVFFdTBURG92?=
 =?utf-8?B?VHorN2xsRmkzcHpqcXRNSlhuK1lyQm5XdXA1bGxwZG81WkRQRmZtaSs3c2pt?=
 =?utf-8?B?UnNwWk8zWVM4b0JOS2xVdzVoK3haYkhsdGxNSFk1SFJWcUUzWnRPM1d0TzhW?=
 =?utf-8?B?TmNzUWhWUmpvVnAxVFF4bEpKODhENC9IdGZkMlBNazZINnFkUWZ2VFJoMFZO?=
 =?utf-8?B?R0JldUNTSmgxRDBSQ0NIYW5OY3pEeCtqejR2czVSUGIrWm04YWpJcTF1UDJi?=
 =?utf-8?B?MzBLT3Z3VzMwQmNPUEY0QjlFaXdtbWNxbGdsbXQ5RWtGZlIwOWhjNjMxcTIx?=
 =?utf-8?B?WFNpYnNVYjV1SVpFbGFFU0orR1NzcEIyT2lGbUpwcjdaRE9LVmk5ZTVHeG1Y?=
 =?utf-8?B?QzIwT2NlUURQNC9LVXlzS0MwNEVGOWhjN2p4dVZUS252eHBTanR5MFoyM2sw?=
 =?utf-8?B?ZlZNVG1UWXV4N2FaQWtTWUVYY1d3Nk11bEJ6a1YxQjJXYW1ESGlaNTdqNXJ4?=
 =?utf-8?B?TDNwWGtDejFTYjNocnIvTDVablg5ZmpRNkR6ZVllanVQVWpGaS9vQW5mREF6?=
 =?utf-8?B?N0hVRlU3WFZlTHJzNGxhdkF5NEVMc3lrMUxha0pBaHNPZ1ZMVmR3cER5VUxJ?=
 =?utf-8?B?UGt1MDVLLzkzRXgrM2xvY3lQTUMxVjUvMEF6WkZoeUcwWHhvaHF4cHluOVFY?=
 =?utf-8?B?Z1VFTkJINy9nSEpuTEZ6K3RFcWNTNnVrK2hVT09vNXpKZ1huaGpxSlI2VkJD?=
 =?utf-8?B?bFd6MmZjdVZHbkNxcDNuM3RoQUgwSFBQSW9qY1c2aEJYdldnV3cxdGlmbVZL?=
 =?utf-8?B?S25nTEs3NDgxbDQ4YUFCUjBYTU5ienFmTkNVQVA3cE10ajVkVGpTZGJJYndN?=
 =?utf-8?B?Sng5bS9lMnlzRlI2STFvbGcwTkRqUUFRR3Vpb3ltL1hMZzNHOE9zY2RaNUxI?=
 =?utf-8?B?SmRrVVhLUzZUaWNWeU5Dbkxla0VuTlpKc1VGRHJHWTZrOUZ3ZnFQUHA3eENs?=
 =?utf-8?B?bTdoMDdHbjF2RW8xMDFnSm9wa1l5bWtOQjlOalJwM3Mwd3NZSU5xbW1Fc3dF?=
 =?utf-8?B?V1g2UlBIZXI5SUhVVUNrVTdjZUI2SDR2U0FDd2ZRcndLM0RNbkJSbHFEV1ZD?=
 =?utf-8?B?Q0RHK0o2K3JXUnNad2tLMzl5ck1xZURiVWNMQVU2TGMxeEJNWWFoUStOU1N1?=
 =?utf-8?B?VlBRenFPb0pjeFpVVGFkclcvOWZ2QzM4VndUc3hYdmV3bU5icTFDb3VSRkZw?=
 =?utf-8?B?a2RCcFJIeXpsb1dpSndyQUdoTHpTMFhqWGVsbEpZSFNzTTByc25heHE1d2xt?=
 =?utf-8?B?bEFEYnBOMm13dE5zL2l5RU9KTThVbEoxWHZJeEVwcUEzcDUrVTZhd3Y4blJh?=
 =?utf-8?Q?oVu6WkIDdOfCL/82LQFviB1DE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838047bd-c25e-44fd-be17-08dbbff2aeb4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 07:15:23.8086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNEER+3DpGt6wAojgTSRaD4UAu57IMTtOgV+nN7JzMY3Set5DM3ac+Xo8FvzHjYGBC/EikupuihNyqAGOUR/dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7811

Before adding a new vCPU operation to register the runstate area by
guest-physical address, add code to actually keep such areas up-to-date.

Note that updating of the area will be done exclusively following the
model enabled by VMASST_TYPE_runstate_update_flag for virtual-address
based registered areas.

Note further that pages aren't marked dirty when written to (matching
the handling of space mapped by map_vcpu_info()), on the basis that the
registrations are lost anyway across migration (or would need re-
populating at the target for transparent migration). Plus the contents
of the areas in question have to be deemed volatile in the first place
(so saving a "most recent" value is pretty meaningless even for e.g.
snapshotting).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
RFC: HVM guests (on x86) can change bitness and hence layout (and size!
     and alignment) of the runstate area. I don't think it is an option
     to require 32-bit code to pass a range such that even the 64-bit
     layout wouldn't cross a page boundary (and be suitably aligned). I
     also don't see any other good solution, so for now a crude approach
     with an extra boolean is used (using has_32bit_shinfo() isn't race
     free and could hence lead to overrunning the mapped space).
---
v3: Use assignment instead of memcpy().
v2: Drop VM-assist conditionals.

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1644,15 +1644,52 @@ bool update_runstate_area(struct vcpu *v
     bool rc;
     struct guest_memory_policy policy = { };
     void __user *guest_handle = NULL;
-    struct vcpu_runstate_info runstate;
+    struct vcpu_runstate_info runstate = v->runstate;
+    struct vcpu_runstate_info *map = v->runstate_guest_area.map;
+
+    if ( map )
+    {
+        uint64_t *pset;
+#ifdef CONFIG_COMPAT
+        struct compat_vcpu_runstate_info *cmap = NULL;
+
+        if ( v->runstate_guest_area_compat )
+            cmap = (void *)map;
+#endif
+
+        /*
+         * NB: No VM_ASSIST(v->domain, runstate_update_flag) check here.
+         *     Always using that updating model.
+         */
+#ifdef CONFIG_COMPAT
+        if ( cmap )
+            pset = &cmap->state_entry_time;
+        else
+#endif
+            pset = &map->state_entry_time;
+        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
+        write_atomic(pset, runstate.state_entry_time);
+        smp_wmb();
+
+#ifdef CONFIG_COMPAT
+        if ( cmap )
+            XLAT_vcpu_runstate_info(cmap, &runstate);
+        else
+#endif
+            *map = runstate;
+
+        smp_wmb();
+        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+        write_atomic(pset, runstate.state_entry_time);
+
+        return true;
+    }
 
     if ( guest_handle_is_null(runstate_guest(v)) )
         return true;
 
     update_guest_memory_policy(v, &policy);
 
-    memcpy(&runstate, &v->runstate, sizeof(runstate));
-
     if ( VM_ASSIST(v->domain, runstate_update_flag) )
     {
 #ifdef CONFIG_COMPAT
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -232,6 +232,8 @@ struct vcpu
 #ifdef CONFIG_COMPAT
     /* A hypercall is using the compat ABI? */
     bool             hcall_compat;
+    /* Physical runstate area registered via compat ABI? */
+    bool             runstate_guest_area_compat;
 #endif
 
 #ifdef CONFIG_IOREQ_SERVER


