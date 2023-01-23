Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA6F677E73
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:54:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482951.748776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyCx-00052h-1U; Mon, 23 Jan 2023 14:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482951.748776; Mon, 23 Jan 2023 14:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyCw-00050B-Uh; Mon, 23 Jan 2023 14:54:02 +0000
Received: by outflank-mailman (input) for mailman id 482951;
 Mon, 23 Jan 2023 14:54:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJyCv-0004vE-EM
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:54:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c47c3418-9b2d-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 15:53:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:53:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:53:57 +0000
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
X-Inumbo-ID: c47c3418-9b2d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMJyfdgY3rYBuGCAzjCkP2DZ2hlBmw72kHJFef4s67K/Cn8CGM6w9eB9exMoZ4M1xzSkxuSfxQb0TgpngCAcYWpcaeWYiYNaCRTG4eVqaTlRxHgsUKxhmntKFOAN2wEciLur2F3zNFaxZCS7W1RHpkHATbYUtuFSodWaF1PneYtIds9ebD8IffWoz5O5U92rkrhBXoBJ4/nwLZ9bujOD79J80xwny9Qck97Ak0ARlMPsDGxqWUstXB+LUd/6dAXT9tFkpkR0dlbGoffV4fImCBffTk9t/XgOYbws/IxvYhdelt0BIpDr+5FSthJoF8z+qmBMSbDdoOqCFFoU4CXjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLGElkWNJzy0Qko5n6wahh8Mc1zRhNMqrRcxVopaWLA=;
 b=iaAoEz/t1if+SToDS6yetda/Z+N0Dym+j002mXnH0j0OJdJZezseQ7Cw5GlICCv6iEmdUsj8tByh0PmVHMh1maqSXOh2EJhX7FnHCcr1l0UynSFEmS+Ocov6waolIWfeibDbT19iAw6XFL/J1574Jux907oPeVASB2Nk3bBhULnMxOOPjVKp+Sd7/Co/hOjdYJjniVsXiAtcTE3pxUWzYsMUe9vFWLIld9bpQMGGZ3qWs1dkClnHgxfSs1RpDIzLSHb0MFa4M/kAqiZu6asD4a/zzlzhKJV/45VJ435C6UaZya1WRdSK50FV+SfoROnSFkoaxRy1IJfVBoMiMxJ0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLGElkWNJzy0Qko5n6wahh8Mc1zRhNMqrRcxVopaWLA=;
 b=LRDBQ7hya00xUJBVC/1b0odQGfpICE9f+gaAn/fLIFBGTIg+J07/VvEYDlzNhtk4SpKsfYhp2nkXRs3MSq4T+VsL+K+fV2mlKMwN7ePTO/5GL6QNDRxv74yQ2vcpDZvk3kMJkLp4j+j5FZepSMsYEE1L560pDkhHSw4iot/o9l4qzxB/dD/FE2EsQ4lRWcSeaZzcFilkNawQIVuSeYSL4hIFk7kaEloIbjysk4w2/zEZ1UBw16h7IU3qki4S+LfC8RGY9zuyiB6U+XBguFKlz3Y4Q43uAEauXLEe0nxRm8dCQxGPSwTNaC07Hv9atvI9ThnPt05Qw93E07+NhZILQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0cc7c5ec-b5db-f9a6-cfd8-c05a22f417c7@suse.com>
Date: Mon, 23 Jan 2023 15:53:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH RFC v2 2/8] domain: update GADDR based runstate guest area
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
In-Reply-To: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: a8850510-960a-43c0-a7fb-08dafd51a7d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a9iwsAwBTZwqj493zHfISErjmTXBkwGwLbkPMLzuEtV1oi32wWBgTW25PfCvNEEM+iTOVC7zzX+ZJGnsnB7hE7uAj3UVx6ZNDDY+2Z/sOG6j77dUGKFOZMkcVwSYPFpLxnQzyYKT7sgDaJxkl5jkw1srXAXKERb3ffbd8CP6C8t3/ppFXUN3V0PZqcgc3sirqbAjc28Smf/ZXrDqu6c2Dh0xYMCrJvB8nTuHfbpvYcaN0lvIuS8OlpjwDiXPm3bE1kdndvWevU1B+Z4nQamPLJJuhPV9XYAKzq9lvN3KNIpS2R+TMjk4D8mwCqPIHqOOFP29to/Hf2B1wMHVYIq4ElCEpE3lF+VYddeX7YKUzrzzZlM+mKRx7KlePFvk+0CyqocN5H7zawPtjiTomoOP7OU0kPZy4vZwwmKDM79T7pNwLUWA6Gu+dRR9c+T2GqusJdzbUEb4zyphL5Q1aS7MYdnYE29rN1UXGaH98M92A3pUxGQqWumNJghOL2gRP+DN4U9ZbnnqKjZEnwuRaYsHuxc4uZ+hPc7u0hhNAdfN1/o4xSd2EU44kWbiDi//VGGL/lDw0z8q3jmHpvQ90Qu81VS1rr5k42CKMLp7JfbCXPkxM5HO+0XWdyG7I8ibkncreT+GOoPv2CbqCrqsZzzIcFVwPl160d/95JxFQUsV7y2OdUDVsSApE9q1AejGqF7iPpIp4v5CiTln3rMyn+9wqsCFz7V7+FADpc4KD/MQ20Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199015)(54906003)(86362001)(41300700001)(316002)(8676002)(36756003)(6916009)(66946007)(4326008)(66476007)(83380400001)(66556008)(31696002)(6486002)(38100700002)(478600001)(2616005)(186003)(6512007)(6506007)(26005)(31686004)(2906002)(15650500001)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2w3MVBLRmlmdkp5anJOclNNTmxINFpFNHV1UjdubGxoWWg1V1JEN1p0Z3Yx?=
 =?utf-8?B?bnNJeTJwUGNHNmlqOEQ0TFg3NklzZVk0WEhwaVJ6NCthNmJhSzdVUE9ST0Nv?=
 =?utf-8?B?THl6UWZxaXM2enphdkpDRGhEVGp1d0dieFZPL2QxZTRoNldPRlRDaEJSL0lu?=
 =?utf-8?B?NmNBU0tIWEdoaHFYN21VRVdvVG9yK0xFdUI5bFNyRWtUNzI3ZEdUYVZ4dEl2?=
 =?utf-8?B?cjRtc2xRbkhoT2p0UDh6N3VveVJCbnFnMFNXaGlKUXRKQUdlU2JSMEMxSjZC?=
 =?utf-8?B?eXpCS2gwNmxwVmVidVRsSGh2RUVReE9IUlVwaENqUytUOElVRUxOcGIwWnE1?=
 =?utf-8?B?SnNrZ1R4RW42YVE5VTZtUURMSWoxRVZVS2FzVW9mbDB0a1FVdGtHL3M3ZWw2?=
 =?utf-8?B?TnUwcmwwSk9sSnprRkVnQS80RFZZeTBJN05JR3IwUFgxYXFtU2F5Q1lGTzRl?=
 =?utf-8?B?eDcrdnoyTUw1QzMzNysxT0ljcjBZRHlJQWFUTkw4dXZiWFNITjZadExJOEo2?=
 =?utf-8?B?QXp0TTFkTHFvSnhwVlUrUkdhWjlWT1N2bUNGQjFmU2FDbzJLYWxWSHUxLzJD?=
 =?utf-8?B?K1EyQUJDMjlLaUUwdzFtU291bmtOY005SllWUTZlWkV5Szc3ODAweW5ydmxN?=
 =?utf-8?B?WHFCSmJpSXhDRmxsS2JUS3FuRnpxWGJDQkpaVWErWVBabmxvb1FJZ09CazUz?=
 =?utf-8?B?Qk5tTlRsRlViYVdNeW5uMVhQY1RHRjNORmhxdWF3dWFNZitVRUVkMjVBTjZD?=
 =?utf-8?B?RTd5Y3J6UFNNeUQrcjVSbHVORUc5bSt0bkw4UGJmbC9qYjFtR3ppY2JINVFC?=
 =?utf-8?B?Q1ErMTJTY2I1YTJ1RXY2SzRHaHhQZEZtUnQ3ckJidE0xcUFnL2hlTE4yU0RQ?=
 =?utf-8?B?S3ZQQ05INWVhTEZ5S2NzT1NKOGlkY0VrRUJDUGZiVnBVeWI1SnRMSFdhano0?=
 =?utf-8?B?cy9JVVRqQ04rNEZqSXdUZi9IYml0SFkvMlpWaEE2UXRSdmNDem5UekltSmg5?=
 =?utf-8?B?SUtNTHFKOXRYb0xEb2IxYjROVXlTeVZvZlY3YS9vL2Y2T1V1NDl4NlJVMDRq?=
 =?utf-8?B?bm9HVkZ1bjRzZTdCVDBkQnE0RWp6ZW9vc1gveS91OWVRYm9vcEFJci9TNFNH?=
 =?utf-8?B?WFVDNUFadzRSNHE3T1FOYjdJOU51dVpJa0UwTnhHY09HbU5Yc09lTnM5Tk9I?=
 =?utf-8?B?eHZvdGlEZGRObjJ5cmZMcjRneUNwU2JsZ2loclRYcTNKUXNFWHlGdURockFF?=
 =?utf-8?B?ZnUwV00zMWpweHhwekhodGtNZkFFc1hEa0JpdVFHMGt6dkd2MGpDMW1oRWkv?=
 =?utf-8?B?VTVPdHFXc3kzZXI5YzNoOXc5NG83SjZJTGxsVytJeU1xQk8wNnZUMnladHRD?=
 =?utf-8?B?cmJzZE9handCeTgvTi9ybnhRNVpxNVI1azZtR0R4N29HdDZlRnhiYjB0U01h?=
 =?utf-8?B?eFg0UjB2ZU53OGVKdXMwMUt1amRaUWxWQzRZYWJuM0xJZVdRbXBSM1M3ejdC?=
 =?utf-8?B?SUNaQjlZL0FVMGcwcU9ScTBGeGc2dlFpR3YrT1k3MmVEOVMra2hFbCs3Sm1J?=
 =?utf-8?B?ZGFuejBOTis3YzNVYUR3cVhoMnNERStCUnY1WnhzY3ZUS3hWQ1lxMWZiYWxh?=
 =?utf-8?B?Vkh3RjB0ZFNnY2NEaWJBY0dqZTlxZG5pZVJXL2FGMHJaUDRycjdoR0szQm1a?=
 =?utf-8?B?ZWNnUStlam0rNWIzZ1ZNQ2lOQWV5K2V2Tk1PODlNa2hBYXRZQjNjYkJkWU5m?=
 =?utf-8?B?VjdPRjlhcDB0TGY0SlRGTEorUXgvWGFCa1I1cXczaHgwWk41dnA1bWd3cmV6?=
 =?utf-8?B?WlU5bVJDelBkdGJoalFUd1lhY3FLOVowSk9oeDRlRXRrci9BYy9US3UvYVU4?=
 =?utf-8?B?cTR2dzFVQ2N3L1ZGQjlZWm9tcXVqL0NEckZTYUhDQTc5bmNZUkpkOElWQndu?=
 =?utf-8?B?bi9Tc0Jiek85a25lcVB3ZUd2dWRISERBWTYyM1dTQmh4bElHdTRVdlhUdEFt?=
 =?utf-8?B?ZDdVbXNvbDhnNEFRYXkwRFUyZ1JtYmZ2TzVaQldlTU5OVTVpRDVnSG5vanB4?=
 =?utf-8?B?Y3dCc3hQbnBDV3loRDdha3hlbGZ1YksyNU00REozS1E2TWI0NXFQRjRzQitK?=
 =?utf-8?Q?QPk/UbySPRoK6ABpFOzsT9gKj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8850510-960a-43c0-a7fb-08dafd51a7d5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:53:57.7884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4hTpLgHb0Xlm0+u4YCrqVn8pFVwfYs2Jb4Tx2TXGQ9v0ew02XNL9QXiLnsU8WVfz46X9GzxZcp6Gy/e+pCY1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773

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
---
RFC: HVM guests (on x86) can change bitness and hence layout (and size!
     and alignment) of the runstate area. I don't think it is an option
     to require 32-bit code to pass a range such that even the 64-bit
     layout wouldn't cross a page boundary (and be suitably aligned). I
     also don't see any other good solution, so for now a crude approach
     with an extra boolean is used (using has_32bit_shinfo() isn't race
     free and could hence lead to overrunning the mapped space).
---
v2: Drop VM-assist conditionals.

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1616,14 +1616,53 @@ bool update_runstate_area(struct vcpu *v
     struct guest_memory_policy policy = { };
     void __user *guest_handle = NULL;
     struct vcpu_runstate_info runstate;
+    struct vcpu_runstate_info *map = v->runstate_guest_area.map;
+
+    memcpy(&runstate, &v->runstate, sizeof(runstate));
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
@@ -231,6 +231,8 @@ struct vcpu
 #ifdef CONFIG_COMPAT
     /* A hypercall is using the compat ABI? */
     bool             hcall_compat;
+    /* Physical runstate area registered via compat ABI? */
+    bool             runstate_guest_area_compat;
 #endif
 
 #ifdef CONFIG_IOREQ_SERVER


