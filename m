Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F8C677E75
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:54:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482954.748786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyDK-0005V4-BT; Mon, 23 Jan 2023 14:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482954.748786; Mon, 23 Jan 2023 14:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyDK-0005T8-7d; Mon, 23 Jan 2023 14:54:26 +0000
Received: by outflank-mailman (input) for mailman id 482954;
 Mon, 23 Jan 2023 14:54:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJyDI-0005Sn-VO
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:54:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d24b4f11-9b2d-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:54:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:54:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:54:21 +0000
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
X-Inumbo-ID: d24b4f11-9b2d-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKjw0lQj7/r6HOS2+9hXSwapljUiThwRDoha6a0Hy4UL5LHsxftjNusUdOObOJ+7wscsoKRk3w+OYptXaryGHbwkfJTyjtDmUqKzSid+2rlDhV/TVInyj7dJ4Lwo9jCbM9rANysDcRr/bdzryVWAQxp1G9C8LGon6FywCY5fMdRrbIht0+yyXIHgsbUUvIUW594IelZPnol5fUuaLnm613UFg3Jg2nW0l93QCiMLkrbQoysuCeBiDG11dxI6zjxUEQ4BzJAGNOHSA1NpT2VY7qNuPAk6r01yN4x0exUA0rtClBdF3zO/lTuG2dVziGRDtZNvkbhJCAx5jS1yUDtdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB3131ouV1w0eF2ri7Zz76fAeueaRAbvh0LQL2AdBT4=;
 b=L3p/eGSB/cmTKCJy5bq6b7dh2QZsx61UT6SsbOqanbWCrdH9DoMo0ADL13SCu+NwlGlJJ/PHqxliyUlgRk16/3PJuDbChU5jI/EV5EFV3ktYKPahM6YaD1YqgsaXGYIFuIv0rfy3sqG2O1V0hm/laSCz6Y295kDxIEz5G+dCsOu8nmtavjsxxukFkeHMe8zOrFZWA4fNG8iUUdt5hGApmsSMiDgLoC+tRi9OsOt4YfxVRTEJ7ZJxQB6ZDyXzTgnd3LJqJaqSS/p1EwH325ASNgit7pIKudu/100xxVmpykkO8qaQBEFbL2GnxWW2FxEjXC2cnMyjd0MH/xgzrL1W4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB3131ouV1w0eF2ri7Zz76fAeueaRAbvh0LQL2AdBT4=;
 b=e71a9TPS1qj4YG7+VbneayVFG4SxfLQ1S1JBrvarojoTYvMabVfppRJusEY1ik/gSwQmLNSchxCIkY/iD4JGczj9lsb63iIX8qKBx2+J5hY1rPUlX/x5S+O8xOC+n7Hk4g9rlD5QKsQtql6sZm1bjj4oUgHugnvx6S9+N83+C0td+xIBvCT/dQJBA8/pjsxqzHBzrmdQuZEPrb6PSwCxtoJPqH/RV0UcV/pZuN5Yj8ONGgzDJdyarWjl6ZmwxM97VInuJz0vaE6Y/rrCXtseoNhBRPMizwkexCFOiUFdBmD4LA+HgMULyRuxhJViDzbF2pVBQ/y01gYJuuVGWC5i/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74e428a9-9309-4ef6-16cf-37f7f9d5c8f7@suse.com>
Date: Mon, 23 Jan 2023 15:54:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 3/8] x86: update GADDR based secondary time area
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
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df1fba5-82b1-4f13-3f8a-08dafd51b5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0w/0LhDVftYWDWoCh1ba820g4syNQVcr0uFTTylJy/lERty2h8mJx+VYSvsWPsv5wGAY+iwfuJK+qTtX27N6CfKTMSljN+y2Dly0WyJzXsrYBEw8SL5jzDR/HaKVf6GrcPdvqkhNes7HtGqJB9LGQHmfU07qJMtmO1GXqY0jWT5aH2yNWDNTy9eQfe02FfxA2uZPi90W/sT/kCcZuaMOonlmtqJ9FZJ2pgpZcTJO7YAIEAnAFtbZP7YjSLlYj7C2Xw3jEMgK22aVoBDb9DQCcgW/O2PkmmY322OLQXd52a/Qb+VMaP93XARNSdvhLhEOekj/Ox51Kt/1/SA2B5V2d5S89LevfbAvyfVK1qIPtPEnjIsbUFFfEEyfcZpDcLHjr7Q/WkY3Mz67QzCKDfC+VlvMY8d5BjQe+65v/mHQ45leafZmkJwpKRT71raJaZeLeYZGCpJQprrBFnYXUqYrCPCAItAFQi6mNmfn4FEECpOgKoXf2+l1mRnrqYJpe0lqXN4K4l+CtcXnG3Aek4O9NpjWEqJIR82jmgxBeOILX9G++sXtn4lNH5b7U5afmCFqwNHbGQt/RNnF1DiGPVNYY+2u9LrqxTcAl7khzlB3yOC5EBQ4eEDageCrZoqJ8WnUWNEUJ6B2koMeYhbwj+/iP+8oQXtGzQ4b8S+NhAWC0pjQx75onMlUmty3kWeK9Q5jekeD8dH4b6UyDEshWDY31jfCrTywCvZr41cFBKihdQw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199015)(54906003)(86362001)(41300700001)(316002)(8676002)(36756003)(6916009)(66946007)(4326008)(66476007)(83380400001)(66556008)(31696002)(6486002)(38100700002)(478600001)(2616005)(186003)(6512007)(6506007)(26005)(31686004)(2906002)(15650500001)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aldSTExpU3N1aFl2UWVzdlcwVytWb2tJTEdrK3p3cVJXSE9ndUs0UlUyRlBj?=
 =?utf-8?B?YUIrbmxxWHZBUHdTdjIwSUxrQ2VYdE1XZmJyd1Rzb0ZHUkQwcWp5TFM0UmJ5?=
 =?utf-8?B?eStZZ3o5RlAvMm9CRkFUWnVPQ2xmTWd0eXNVOE8xYUhMYXA2TEJIa2tYS09B?=
 =?utf-8?B?WXR0QVlLOG9wZkVpRlVMTlhsT3ByajNzSHJUN0ZHbWh4VmMvUERKRm11SmpJ?=
 =?utf-8?B?QzNpMFJlbWp4R1VHZWZSSkRwS1dMRE5nZVpJQ0luQjNkc0FzbzJZVmg3K2RB?=
 =?utf-8?B?NzcvbnZxZnVkcDZYYW5vT0JNRDZVZjNCUWtqWVVKVWtNR3dtc1BNcUJMYklD?=
 =?utf-8?B?TFowb24vM0lwc0hJdXFrV285TExKbytrT0pFMUVRUkw0d1ZCVUIzTk9LK25R?=
 =?utf-8?B?Y0g0NHpQTk9GcWs4b2srd2xRQTJmU0g2MllRSUZpZ1M3dFlSVjRSd1k3TGJU?=
 =?utf-8?B?MGZPTXdWZmxyRkNBRC9SZVJBUlorbjZodi9JV3dRcXV6aE9qNWx2MkhEd1Bx?=
 =?utf-8?B?TEtPTFZYOEd5RHJTL2ZJbzE4SERyem9NbjhNVnorK2xHbS9wd25vd2VjcGVp?=
 =?utf-8?B?UUFwbENmQ3hydXVHQm5QSzFlanlMYWZlaEt6NFNtU21oTVV0T0tnREk2Wk1x?=
 =?utf-8?B?UkxQQkZ4TDIrbFd4NXB6cVlybnJYQVVuV2hvZ1EvYitTZ1d6NEFFdHFNcnRF?=
 =?utf-8?B?a3RNdnQ3Q2FTWjk5WlczM2d5SUh5VzN0OXdzQ2laWlFUeUlJc3JCM2tZSVVH?=
 =?utf-8?B?Z25MejdqNE1jUUU1YUxIWmJUNnRKN1o2dGNqblpNZjRZYUdQVFc3Z29HTy91?=
 =?utf-8?B?TlYxNXUvQmtZbE13emFJS3FZbk5hcGF1c2lwSFh1VmMyTkt6OGk1VndCQjYx?=
 =?utf-8?B?OUk4cXIxdUFIcXpjT3NDV0orSTdmQXN6MkUxMi84MTczVHI1VUtCbzFrRFp2?=
 =?utf-8?B?M21qWUVqbG9aT21KUzlzSjBQRGwxVTh2UnBJeUFnYmJjNVh4RDRMSHZ2aUN4?=
 =?utf-8?B?emJVR1N2eDJjb1Zzd2h3NDNieEE3NTU2ZlRnbFdwZHBzTFN6RHRBeHFDVzQ5?=
 =?utf-8?B?STBpY01FekNpWWpCZWdMdjRML1AzT0JUdmVvZHhaYXQ5NzVtbTRDK3JkRDF1?=
 =?utf-8?B?eXUwRG1UUTVSZWduOGVJWkFrN01aL2xKMzZRNk1MeGZaWkFGai92Skk4VUNq?=
 =?utf-8?B?eXMxV2RKcjF4b3FyTW5FTW9tQTlqdXhiOGZWVGtDU1BTb1NZTzd0TFErK1JM?=
 =?utf-8?B?L1kzL01WcjcxYXI5bzhkd3FhQ1d3cy9zSEdhV2JobklGQVphWFc1NzE0b0JI?=
 =?utf-8?B?VGVmWVJ1UVl5TEltZkRiSnpUMDJDckZudFVkL2t1ZWJaSWRja3puQ0FFb3p1?=
 =?utf-8?B?RVRzTms4NkVYRFZwb01ONDRXS25TWEFiZUNCWERsZkREOWFYaGE2ZW1VTlRV?=
 =?utf-8?B?RVRIZXIwNTBzSSt1aVRpenpReGE3M3RQaVJISUsxWU1IL3k4WU5KUUtOaGU3?=
 =?utf-8?B?YlJheVI5cVF4K3ExWDNrTWpMODZCSTBlaW1OYnFGMmUrZFBIV2ppMFJNbU1I?=
 =?utf-8?B?TndVN29JM3NKeldFT3pzem9nUmlsZEJWOWxmVklRbkRHOEtudnBLbkczYlA0?=
 =?utf-8?B?N0dMSDF0RzM4RThyM0JiaEllQjJvS2U3blhRdjhRUmMwdmdPL0J2dG1Cb1R1?=
 =?utf-8?B?a0tYR3RKUFA2VjBUV21Wb0ZkSmU0T1BPeFZDSTlNMVpUWW9Qb3BhVWFQQVdL?=
 =?utf-8?B?d3JoeDZnUW5IQVRpendJOUdZcjlUQmdBaG1LeG1IWTdtOWVhL1krZVJ2djFm?=
 =?utf-8?B?ZmpoS1pYREplbGFnMFN6NFEzLzJMb0p2czlBZkE0cUtsRUc5MU1YbFZKRHRh?=
 =?utf-8?B?M0RzV0VrY3RjQ1lFalB0OGsxNjhhVEFDMjN6RWZRRXNtdDRrcldYaGpETHRz?=
 =?utf-8?B?RjNLaEFOMXBSY2dwUm42bkZSY2hNM1dwV0VSbExyZ2d5S2x0ZVB1OEU2d3JU?=
 =?utf-8?B?b3FlUldvdTZJRTJmVDhWZnI5enFCVkJGNlJ0dXAwbFRPcithWnhZUDFzY1o4?=
 =?utf-8?B?RHN1cVc4bmNQaDE0UDdvME14RldRY3VDTzY4alBveDFFSkcrVlZqMkdERmN5?=
 =?utf-8?Q?2bsnhDEb/Q33apRTMu9CbsIkd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df1fba5-82b1-4f13-3f8a-08dafd51b5b8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:54:21.0994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhLXKreFrhMnMQNzXvWHDpOlPbCG+WH6nBALruo5xev2dWcSyOdtcfvis0tK5vTrw1kLOWSYVCbpf+7UcsP2Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773

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

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1462,12 +1462,34 @@ static void __update_vcpu_system_time(st
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
 


