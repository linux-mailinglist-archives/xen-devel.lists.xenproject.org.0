Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637A97B1480
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 09:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609308.948325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllFc-0006wB-RW; Thu, 28 Sep 2023 07:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609308.948325; Thu, 28 Sep 2023 07:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllFc-0006u9-O3; Thu, 28 Sep 2023 07:15:56 +0000
Received: by outflank-mailman (input) for mailman id 609308;
 Thu, 28 Sep 2023 07:15:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qllFc-0005tI-4r
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 07:15:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc5530f7-5dce-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 09:15:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7811.eurprd04.prod.outlook.com (2603:10a6:20b:236::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 28 Sep
 2023 07:15:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 07:15:53 +0000
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
X-Inumbo-ID: dc5530f7-5dce-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ak/6LZXoGblaIYV1cb9K7e4Cjj7CbkKgr+dJxzx4e4bnDmAmRrZxJJ/5g3B+oZ7KQw/OTku7OO2l48MdWM2L/bhd8zV7oE/XhA7ljKFQSk3d1MBwuSz5iz2CJaWuhqEUwP1GywiuMUCW5ceSQBPT3zgZF5LPEeevkX5eEyzrLUnrL6sRcWKmQUCojbqgoYPyPHRlWPwNfKHiRbNvVAN6YHAz9Lt1YJWfnYFyKcXHiHwCmqAURgWPq1vYVRCOeaCYF2dZOoeZ3pfuY2nNefZEUTklQ9bSiYO7TWKzAIuF9qAW7rNbYDkNuH7e/MXfscdDyYZZpyhdegGILfxaQV8UnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+s4DsrfFOHtuNkr1T98TjoML0TVrNHd1UjKvdCbUR0U=;
 b=bMSubdvkgcWfmCe9chRcwCNNKuVDfwi11y23lgtZKaWK6vZ7wcNCMnOkM4k7jZjgT6dAyB0DQi7YDlTAv5BJTfEYvw4Xtw4VDRi4V+KDX1nHe5d6Ipa9zEEwxOnwiC5ArrKjwnE+gGa984rb8ODGaR8snt6y+52+wbbRzjlbQPGy3M0g90Euy9XZTRDgG67/gL2pBW539EcF9zT/8zotT3n/NBsj8iztwLHuV6jmqBwednAfnyi8EZEdA4W5Y572JsqiKbwNWsCCPn/HQMN6IM1a3OjXeUeXAhCuj7Cv6QSQzzE5yUDDuYz5tDuoxqpUaxZNYmiqGUg3P1y/sKtkeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s4DsrfFOHtuNkr1T98TjoML0TVrNHd1UjKvdCbUR0U=;
 b=SKXXc2drqLOCEIf0MRa6CIRJ+nTtaQN6aolcerelsiNFPcgqrbGSY1N41z5l9s1eHI2W/mXUowUq0LVBqVYYK2lLwT8+GpQVYIJjkkzKNLe7NVJIERWM6o/L0/aloogmjnOe1mKZhilhhkt+aDdU5dWXglNYR2y1/sD1/r6EElnOVSMyS8ToeAxmil8hhCFk5JMDCR3CtrwPgQQvQ88A56fbn1nVhqrIX7CzUD0k/9FV9TrtI/2wETLDxS9CSDPy/l06T1ydBqzR3I56iy4TzDZn4lIRVWtfH1DLX/sp6XWbWPa+9VTC62zVJ4LkRY9qvRgUnOHIivnOiseDm9myng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5346355-108b-b978-c4b9-3f55e6f7bea3@suse.com>
Date: Thu, 28 Sep 2023 09:15:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: [PATCH v4 4/9] x86: update GADDR based secondary time area
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
In-Reply-To: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5b67e4-77d0-4c18-2d55-08dbbff2c074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XWdqj1YJTXyQU+plhk3Ibcidbb8+7f1pfuqtwLiduD1x5ZTHYOxs5GWQk5+gWilHhvhIAnzQDiq2qRF6MZYc9WmRVJweWEGjdpRKBSDKLNYWJ59mfH4LDabq9FGGbuP5g910i4Ov/Dz1hN4W8saBYhTH3EJcB1QgX5gqwZToWlIToh0O/f/ff4JZC5Y+YTGKxt6VcboIWMTMCQG+HWzuCeTsCNmtJN25Ul2LL31mpJXhVbU7ZfD8Jgar7zmAL5OgnkzucNWiZpDQRHo6Gz0mMSUsyiZUyHASksOEYplFrD0nI/70LDTb8AYRhL70S6nBuOw4QVHrzmpTp1I8VVXwUKPVq5uc51BLu1wobzbwrnICVxu39twFeH+AbtAUFdqZRDeRuP2jGG9zb3+Ad78iXFX0NTI0DQYdreqPziKTUcyWnq6NrlhwAhTAGyz0/wYoPBVrIzf/ekz6FyL4mc2ac4FK1eSMarShNSYyhdl4FQtgl2XBRMVYFDmUadtWGBMLtGHXIB50OHVqgmyWjDrd1JABDr2mHTLEyNRejedKBLI7kprZ6yH/79V0qPzRk45BY3COf35vOT4NPZEBUoR/EqniHuRWLnWt2wKQmfs4iWB0ru7p4pmKXtGByUNbnc+6QVSbXVFfC7wKyrglONFDNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(6512007)(6486002)(6506007)(478600001)(83380400001)(2616005)(2906002)(15650500001)(316002)(6916009)(66556008)(54906003)(66476007)(66946007)(8936002)(41300700001)(8676002)(5660300002)(4326008)(36756003)(38100700002)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFdkYmRtWjhVQ09NUnBadDVzNmd5bmpHT2d0SXhBTmhlcEI0bDdJcDB3L2gz?=
 =?utf-8?B?WGpQbklmS05sOGxZdGsyL3FwTXNiNG5PVURtOXkrSGJjMWpSN1pjWWJ3bEJ0?=
 =?utf-8?B?SW1JS2MvN0duWHJOU1NMUHhWVVlGZ0s2V0JJenlQV2duQUJhNlROMUtEOGg2?=
 =?utf-8?B?T1VoYUVYUTJNY3V5L0dQMnd6T0Nta1Z1bFhicG5RM0dzbTRxcG1qaFg0UzFJ?=
 =?utf-8?B?NFM4SGQweU9EQUZ5K0pxNXp2Rm03VGd4UlEySDhNbCtEZFk1aUhOeUxLb0lI?=
 =?utf-8?B?UDBRc3M3eWlKSnQyaE5ud1Q4cWFnR3F0UCszTTNzMHNjS2RuaExoNm5yQm9n?=
 =?utf-8?B?dE5tT1U2elpEVWxjL0RYOUI0cm16blEwYkM2c2h3bHdTR2xQMCtOR21XbGRE?=
 =?utf-8?B?VVYwUnZBSnJydHZsU1cyWStiRzdDQ0VZeFowWk5VNVpvWTFFd1RHNjBvQjVk?=
 =?utf-8?B?NFZIam1YY2ZFanlURC9aUW41WXN4SkdJQmRxN2ZjcjJTZ2RIRGxhVEJiTGdU?=
 =?utf-8?B?dTNranlIZ0VJajdXL1V6YlkvQno2UWdKQXJtMkJGaXM1M2VET2VBU3VFajZG?=
 =?utf-8?B?OWJnbWlYcFNXS3V2VXBUdE5HdFFpam53QldnUk5VOHJsRVZLUWQ5NUkxT1ls?=
 =?utf-8?B?Wlo5d1hoSWRTYnZ4U0E1TXF2UCtrREN1VE9uT095WlZ0S1lIWXhBNHRKZ05w?=
 =?utf-8?B?eUhrQ0IrUUZNQ3lFeVdUYXMwWHgwL3hLYTJOcUFSL2hSck5ZQS9sT0lOT0J5?=
 =?utf-8?B?U252ek9qNGN4bjYycmNVREFWM2ZTd3BBSlo4Z2VJY3FxNE90enJXMmxwbUMv?=
 =?utf-8?B?M3pQU1M3TERwNFdPcjFNZGsrTC96Qk5xMHhJei9rYm9rYXk2Rk1xc1JrK05B?=
 =?utf-8?B?T1d5OTV5a0dpSk14S2FwcXdxMXl2b1ltMDNBQXgvZDgxT2FEVGJ2Q2doZHUy?=
 =?utf-8?B?N1g5WCtLYllyRGdsUTdjeXhXNUhQSGQ4OFRiM2gybDlNb2N6aXEwRE5VYzl1?=
 =?utf-8?B?c1hDTFhQRjJXV1h6SHlHUkhKYUVwY2VpdnFTVHRLTGd1R3J3bzVuWmpSb25k?=
 =?utf-8?B?TTJBSjNWQUozQ2JaZkZLQ2hDVTh3VFpsUElEd1dEckwzQzNjbno4c2Yxd1Jn?=
 =?utf-8?B?eDZKeWtUTGtZbGRUUEpYMlJCOFBRNlo4RTdzT3dTcFVCdG9oOW8vayt0ZjI3?=
 =?utf-8?B?ZFJ2dWlROFpIOU41cTd0eExuOFFFYUw3djd3MmhHc0pmZnVRakFyd2lqZkZu?=
 =?utf-8?B?cFMwL09HUmRhazlPMGs2dWFQVFJaUGppclNEWFZNd1B5dEJvQ0EwdlBYWUov?=
 =?utf-8?B?eFhSVCsxa2ZJT21SU0xhZzVZUFVrS2lhWmcyK1k5RlpoUWRQOXk2cWhKUXRh?=
 =?utf-8?B?dVN3cFo0bVF6NlVCZEVTQVJDYzdxTDRGc05sNkZXSTh0Z2tPdGhvZjdhY0g0?=
 =?utf-8?B?MWEyUEdqRTdOaXFOOFZBaEY1aU90ekJ4RTJ1T2Q3M3RIMk5TbXh0ZEZGMGhR?=
 =?utf-8?B?cjBSYldOdGZrUFcwZmV3QlBrWDZtS3BwQWVwSStBcWJYT0kzNXY0UkxNdGFB?=
 =?utf-8?B?WlJBN1NuRlJWQjFGblNJbzZGMUJ2SERQelg5WlpIek1nbGZiU2VkQktjUFVv?=
 =?utf-8?B?Y3VtbHBadEt3L2pKMDdQM3JLQXY4c09rbHBncjFNUHJBbkphMWw0Umt1YStm?=
 =?utf-8?B?eDZFQ1BDSHVtY0h2UnpxaDVodmNDZGJ0TU1tcnB5aVRISnRyL1pUZVQ2dHAx?=
 =?utf-8?B?UXMwV3cvdFNlVlFjd3hyNlVVcDdOZ3FrM3RyVUxsMVZHZG5xeTU2OWthUzRJ?=
 =?utf-8?B?MzJvNVM4Wk0zc1RBQXdNVk05Uk9ZN0VIcjZDZkpQV1dtdCswd1pmMytqb1Ft?=
 =?utf-8?B?a3pTZUpmazJ1VlUzM1Q0cHhNT2taZk5JUHBYcUFNd05sRmE4K2RkdFRZMkZt?=
 =?utf-8?B?OXkxVnhlR3VydkFqK3EzWDc4NjRwZnZLMlVBdDNIUDMwK3RIcWZnT2NiWlJS?=
 =?utf-8?B?MGU4MjBDaTIxRUpFT0hjVDJsWjhjcXZqT3NoaWFlcHYrVlIwUit5dkE1aTFD?=
 =?utf-8?B?NGE2NmFyWGlqMTMxVlVFdk0vdFJFc0h5M3F2aXRuZno0cVZOV3JPTE1EeTc1?=
 =?utf-8?Q?mfhRrpGix1fgq7NrDeXgEXDQb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5b67e4-77d0-4c18-2d55-08dbbff2c074
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 07:15:53.5863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYmXnp8Xua0tmrZz+wnjNR5Da1Riso1lvfEcMRGM+zcanixt6eEqcJhSzE+UPT0ne/YDNU4rw2un/PK04Fo9YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7811

Before adding a new vCPU operation to register the secondary time area
by guest-physical address, add code to actually keep such areas up-to-
date.

Note that pages aren't marked dirty when written to (matching the
handling of space mapped by map_vcpu_info()), on the basis that the
registrations are lost anyway across migration (or would need re-
populating at the target for transparent migration). Plus the contents
of the areas in question have to be deemed volatile in the first place
(so saving a "most recent" value is pretty meaningless even for e.g.
snapshotting).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1566,12 +1566,34 @@ static void __update_vcpu_system_time(st
         v->arch.pv.pending_system_time = _u;
 }
 
+static void write_time_guest_area(struct vcpu_time_info *map,
+                                  const struct vcpu_time_info *src)
+{
+    /* 1. Update userspace version. */
+    write_atomic(&map->version, src->version);
+    smp_wmb();
+
+    /* 2. Update all other userspace fields. */
+    *map = *src;
+
+    /* 3. Update userspace version again. */
+    smp_wmb();
+    write_atomic(&map->version, version_update_end(src->version));
+}
+
 bool update_secondary_system_time(struct vcpu *v,
                                   struct vcpu_time_info *u)
 {
     XEN_GUEST_HANDLE(vcpu_time_info_t) user_u = v->arch.time_info_guest;
+    struct vcpu_time_info *map = v->arch.time_guest_area.map;
     struct guest_memory_policy policy = { .nested_guest_mode = false };
 
+    if ( map )
+    {
+        write_time_guest_area(map, u);
+        return true;
+    }
+
     if ( guest_handle_is_null(user_u) )
         return true;
 


