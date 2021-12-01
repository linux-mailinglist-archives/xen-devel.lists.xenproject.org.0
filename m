Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB98464AD1
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 10:41:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235742.408939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msM79-0002oA-Pt; Wed, 01 Dec 2021 09:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235742.408939; Wed, 01 Dec 2021 09:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msM79-0002lv-MS; Wed, 01 Dec 2021 09:41:23 +0000
Received: by outflank-mailman (input) for mailman id 235742;
 Wed, 01 Dec 2021 09:41:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msM77-0002Rt-5a
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 09:41:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f5e5d8b-5289-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 10:30:45 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-NBdHqzgHMJyJxrDlCcu5cQ-1; Wed, 01 Dec 2021 10:40:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Wed, 1 Dec
 2021 09:40:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 09:40:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.9 via Frontend Transport; Wed, 1 Dec 2021 09:40:25 +0000
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
X-Inumbo-ID: 4f5e5d8b-5289-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638351635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0t8LMyxHaP2kl7/Dbfr610HjSp+BcW6EUg2e2egGqsk=;
	b=R8fOljW83adIBWl0iRe2bxkfwXBsng2Vs2rNIDxwsQbvBS6AOddf1kEPYh5RpCsLwZXLi7
	YxX6CRCdR4lAxNvs5dbxA5Ok5QFuv0iGB4H4fNTrZb9Xpg4VXSvyOVVVzNO2dCvCorm6xH
	ZWveT+NZ9KLDVEyxzeebudaaL0RE4qI=
X-MC-Unique: NBdHqzgHMJyJxrDlCcu5cQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwHbbjokC0TDYaIwOwb3ZDo0MhQpPxZcg/1TEo2bJ8qCjMuqJCxgYaJpmfgHS4kqiC/jClZRLP5FL7+Hj7xWbE+q4L34C9O9T5exY01Yw0FJEY+cKYl2aDzLVTM7QLcNgKuRjXlo2kfwkgg7iS7Fq1bm6+mnF5MqSckkritbJBbfaEJzODta8QluOEFxgVvRrAmlPkdp+o2p2ExBHmqHuxL2RsimntDNAIt3glh3fXJHeTS01kMOzEHCu28cBGa7y5aJ+xw/xt5E8uYRhi2e7vJLer3ExMF2SXdJBDkLHRYWSzywNdRhLEYo0wGoLZCaWBMRnDOZDQ1wXI4y7IgCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0t8LMyxHaP2kl7/Dbfr610HjSp+BcW6EUg2e2egGqsk=;
 b=R4n2TTwGvpE08/kvyoNGT1gvUTq7NDs4o3YiO2UGoLLuBmXrZjOq4F45ciFGLrKeSdxwAdEKQ3SBNmQe75XmEChV3izH82Xe/Uy5RBC2ItV7T7ABnaADKmdXr0trp+SatF4BXLRYxEsmVR4nhjjxRlk38EP+5KFeRq1UnqZhvKgzVGrSN//Uq8TwU+bEe1Lz/fa39md/lkL2+WUJYY8qZl1FUDvXpVun5A9F42Q9kOSWseYhEwd6zIrYONeA8Hek+p3Ofq/T+V713hGFjD2G8QpPQhYgiJr3WVlcqz5G8UpSDLFu30VFlkfjBovMgQHdMH9Ye+FfTXPBGd3qUPlm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0819175-83b4-9489-8e4b-7be4940f1d54@suse.com>
Date: Wed, 1 Dec 2021 10:40:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 2/4] VT-d / x86: re-arrange cache syncing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
In-Reply-To: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b9d5ddd-7e77-4c67-b398-08d9b4ae9ab2
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32931BACA3F42F3E418BF56AB3689@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vbcnGYpe9bLgLDUKvSGZ2hOcp/dEj/qbF95TeMb364lbYxvcz3G7A60zawJ4Bqc14Z3P3N+QGwRTM6woZie41/uzfVwlKmKOIBEKmwOhpKv9gp+FC2MTPiJ1OrkBgGmbDqKNBSpz0HaFbGZHRwZ0gl0VxVkiNa3GGayJ9dOz1Zb4KNcsr0n/g0pKsM8mmeIBo3Gk5U/zBvbrGoD+jrvw09285v7NDkLYamLCSSdr5BtvSLW2ZJgk8/xoJcUJfhei0Y/lL+MxH0KLzkF3HfAbaQleB/2nkMcY+JVgs3MIdyYPT3yx93tzWFidCIMka7B5xByWGRt8iVanpqMwNrIcPnuuZPYtWeddPYpv/bY5kDzf+JpZFqMuD5WLS3lmRHOEx2XVoA+NB7zEtFtyWJSGhK47EI4qUvuYElocdeMfsHP9EsSVEfELoFMWflIliI30PQG6bc2TLjGZtEUgg67W68+0sQ5RmZmPjvzJxSjqiQqI3xTgCHm9VC6/GxspP+2CybP5J03+qwE37ITTRgAAHuoWIqHDVjS648H8YZovovqXQBj9bW7f+YfzBkWhhw4MU61/P90PpcP74BaDnhZuWAQ09Aoy3Ji6mvLn/cZI3CGZpSFbMYUnR24S0qrP7aiR0WUP/QHK3Q5mkPdwFsx4l2LcueAeMzB+EFsr6Wq4g4KeLErvN0IcgClrr2GJO9603QcYhTMC8DiyWJNOV5l8dwrh1k4YJGhGCV0Bu4bMCiqvb+dcApfyPcEbqYErOct9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(2906002)(26005)(66946007)(4326008)(2616005)(66476007)(956004)(38100700002)(8676002)(86362001)(186003)(8936002)(5660300002)(31696002)(31686004)(16576012)(66556008)(6916009)(316002)(6486002)(36756003)(54906003)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elVoZ3V3dlZ2UlFkZ2xMZFIyOGNUekR4cGV1OUVrVlFGU2crQkp0bHJ2V2NT?=
 =?utf-8?B?azJxcVdYNUpvUjIrWjE4T0IrYVQ2SExRWWQ0Qm1ILzZRSTNvQjV2bXN6ME5j?=
 =?utf-8?B?Zkl5aHNHQy9oT0drWnFHZnF1UENyL2dDRlQ0ODR3ODk3M1haRE9pQ3JpaGtn?=
 =?utf-8?B?VmdlTzRWd1Nhb0twQ0l3RUN2YXVkMjluWDZLMlZKTm1Gb0MreUl5ZnVydi9L?=
 =?utf-8?B?SDNPbDhSYjVXc3BhNy9Cem1EYmllUnZCUDBQUWUzWnRQOVFwUStGOVdaTHhV?=
 =?utf-8?B?Rm84bWZwNGlyWUNaWTVjTHJzMnlOVEVIRld0VEYwZlRFN05BV2VCZ0ZkaEFl?=
 =?utf-8?B?YUtCWHc2WWV4UW1vOWc4Y1NNaC9SNmZvMnhYY3NIR1NaVFBQL2FhOTBkTFJ1?=
 =?utf-8?B?QUZmWXRaRGN6bVI4Y1lWTC9LQVc4a0xLcWJBTzRId2NtS010R0FleWMvK3dx?=
 =?utf-8?B?RDV2aUlIdFhyMnRIa2M2ZE5PSjN5Qk94ZzBNcytyV2RxdVdkM2RNQ09UTkxp?=
 =?utf-8?B?MjhTSy9JcER2d0hnYWJnNlU0ZHcyOFVnVlBpZ3RMY3VIQU01NnVzUW9LWlll?=
 =?utf-8?B?RDU4bGdpbkNRL285b2NPK0NmVzlwVDZ5VitpY1BxOXRhcGs4dWwveDZHWEV2?=
 =?utf-8?B?dE9qbCtkaHJENFNOcjZ2Wm5WYXY4L1NwVHI2TWp3VCs2OUttY012dFNia3RG?=
 =?utf-8?B?dEtjY2MwMWZjOEtvMG9oSlJYSDVYejRuSjhUTDZ3TDF3TWJHYmJ0TEh2cGt4?=
 =?utf-8?B?NEhwa2VXbVRCYk5zUmpwS1JqWTJUZGs3VUViaGVkUjVVVzFJOTZOLzBOT2Ns?=
 =?utf-8?B?Tmd0eDQzalRTeUp4L2dMNnhycmVIVUtzVVFOaW9WRGxaRUVMdzNHMElnVUZl?=
 =?utf-8?B?TytGdmQ3QzlmTWtOajFkczVTV0JVK3JHdGEwVkxRUDM2cVdmcFppYkR4NFJS?=
 =?utf-8?B?WHJxdXBHVFpxUFV1bjBVdnY1ZVA3VFhRMnp5WXdtcFRBd1J5bXVFNCsvV0VB?=
 =?utf-8?B?U3oyd1pBR0w0d3E0UFJNZ0lFSGhHZmYxMVR4RUpBMmxoZFlkZDgrWVV1Yk96?=
 =?utf-8?B?TkRKbEE2b01Yb3dHN0lNNXljSXcwQWhpWVhZYlN1ZHpaMmVmNm1ndmYzSE1u?=
 =?utf-8?B?UVVnTjZrRlk4R1Nrem9pd1FObVc4L2MvYVJIbkl6bDNYOTJ2NDJ5UVh5SzFF?=
 =?utf-8?B?YnpCMW5MY21YNzBrR3g3MXptMjNkalZkYVlLRnAvaWptYjcwbjBka3VrQkE5?=
 =?utf-8?B?Nk0wYVlwaU5OajM0TFlRZUpqVWpYR1JyTVdtLzJHMUpJU25JRGREQnNPMlRC?=
 =?utf-8?B?WlFlQUtaV1hBZk5NeXR2SkJpUGlFeXFOdmh1TWFIV2Q3M1YrZEUxMFZYVThO?=
 =?utf-8?B?REtJUjJPQTVmMlY1Y3dGVHdtMkpadjFpaysxS2JYYytVUFBxRGJmZVdWNTBY?=
 =?utf-8?B?RzdvMUZCbXRJMURDdU1sdC95VzN6V0JVVW1QSS8yazA0SXNocWZpSklTSHEv?=
 =?utf-8?B?dFBpQlkvWU41VEY0STl4SUJ1bVZjSVEwK05kNTNFMUJOQ1F2NTBSdjFDUXRQ?=
 =?utf-8?B?cFg2aUZmcWdIWGNhTG5sT0x1Ykl3YU1Wcmplbzg4NGtXL0dHR3V3V3dFbVNz?=
 =?utf-8?B?c1BBNUVtTmlERlFZUXN5citXWDFMM3pmNVVySVJLNkR5WUNuVnVSQWFDUHRt?=
 =?utf-8?B?Z3pkeWpmSDF6V1MwdGNTN0E5S05wRzd1UkxJbTE5Mzg1OWs3TnpycUNIVXBz?=
 =?utf-8?B?R0lOckRCRERvak1qcjZXV2QyNHk4aml0ZWp1UmVlZVpudHcyZzIvNjVmSHh0?=
 =?utf-8?B?aGd6U2hJc2tyRnlvdDlEY0dpUDNiaDJSZGxQWDZjNU5keWFhV3RXVG5YeFpu?=
 =?utf-8?B?N1dWcHlVM1FRNkhoc205ZlRBTlFNOU5wbk1CS2ZaQ0xwSmJmYllLVk9iVkRh?=
 =?utf-8?B?dE03OHBjMU54OU5RUUkza1Jva1doaVJkVDJ1WW5Oc1hQcXExL3F3ZGRDbHZq?=
 =?utf-8?B?U3hJZ3hmNVUxMmV4VDFtYUNpekIwMXpGdzV4Q0ZqelpERWpXZytlUEdBcER3?=
 =?utf-8?B?NmhMcktoL3lrK3A3bVVQcjVBS3hxWWJpcFNQelVENi9SNUZqUytQVWxRYkto?=
 =?utf-8?B?bEtKNXhhK0xwbFUxY25pcnVnY0JNNy9hT0tubEVWVVcyWWRyL0x1MG1wd1U0?=
 =?utf-8?Q?TAwEg4mRA1rdnAy6TQ7FeT8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9d5ddd-7e77-4c67-b398-08d9b4ae9ab2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 09:40:26.3696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Wz+LTp+1WdQ0+SraFh5OHLf18oPjNnt9Vaor7etwSnEJuGV0wXLXc/wAXkC1yrmCEBhEjobtlrO1CpzLCqMJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

The actual function should always have lived in core x86 code; move it
there, replacing get_cache_line_size() by readily available (except very
early during boot; see the code comment) data.

Drop the respective IOMMU hook, (re)introducing a respective boolean
instead. Replace a true and an almost open-coding instance of
iommu_sync_cache().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Placing the function next to flush_area_local() exposes a curious
asymmetry between the SFENCE placements: sync_cache() has it after the
flush, while flush_area_local() has it before it. I think the latter one
is misplaced.

--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -11,6 +11,7 @@
 #include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/softirq.h>
+#include <asm/cache.h>
 #include <asm/flushtlb.h>
 #include <asm/invpcid.h>
 #include <asm/nops.h>
@@ -265,6 +266,57 @@ unsigned int flush_area_local(const void
     return flags;
 }
 
+void sync_cache(const void *addr, unsigned int size)
+{
+    /*
+     * This function may be called before current_cpu_data is established.
+     * Hence a fallback is needed to prevent the loop below becoming infinite.
+     */
+    unsigned int clflush_size = current_cpu_data.x86_clflush_size ?: 16;
+    const void *end = addr + size;
+
+    addr -= (unsigned long)addr & (clflush_size - 1);
+    for ( ; addr < end; addr += clflush_size )
+    {
+/*
+ * The arguments to a macro must not include preprocessor directives. Doing so
+ * results in undefined behavior, so we have to create some defines here in
+ * order to avoid it.
+ */
+#if defined(HAVE_AS_CLWB)
+# define CLWB_ENCODING "clwb %[p]"
+#elif defined(HAVE_AS_XSAVEOPT)
+# define CLWB_ENCODING "data16 xsaveopt %[p]" /* clwb */
+#else
+# define CLWB_ENCODING ".byte 0x66, 0x0f, 0xae, 0x30" /* clwb (%%rax) */
+#endif
+
+#define BASE_INPUT(addr) [p] "m" (*(const char *)(addr))
+#if defined(HAVE_AS_CLWB) || defined(HAVE_AS_XSAVEOPT)
+# define INPUT BASE_INPUT
+#else
+# define INPUT(addr) "a" (addr), BASE_INPUT(addr)
+#endif
+        /*
+         * Note regarding the use of NOP_DS_PREFIX: it's faster to do a clflush
+         * + prefix than a clflush + nop, and hence the prefix is added instead
+         * of letting the alternative framework fill the gap by appending nops.
+         */
+        alternative_io_2(".byte " __stringify(NOP_DS_PREFIX) "; clflush %[p]",
+                         "data16 clflush %[p]", /* clflushopt */
+                         X86_FEATURE_CLFLUSHOPT,
+                         CLWB_ENCODING,
+                         X86_FEATURE_CLWB, /* no outputs */,
+                         INPUT(addr));
+#undef INPUT
+#undef BASE_INPUT
+#undef CLWB_ENCODING
+    }
+
+    alternative_2("", "sfence", X86_FEATURE_CLFLUSHOPT,
+                      "sfence", X86_FEATURE_CLWB);
+}
+
 unsigned int guest_flush_tlb_flags(const struct domain *d)
 {
     bool shadow = paging_mode_shadow(d);
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -202,54 +202,6 @@ static void check_cleanup_domid_map(stru
     }
 }
 
-static void sync_cache(const void *addr, unsigned int size)
-{
-    static unsigned long clflush_size = 0;
-    const void *end = addr + size;
-
-    if ( clflush_size == 0 )
-        clflush_size = get_cache_line_size();
-
-    addr -= (unsigned long)addr & (clflush_size - 1);
-    for ( ; addr < end; addr += clflush_size )
-/*
- * The arguments to a macro must not include preprocessor directives. Doing so
- * results in undefined behavior, so we have to create some defines here in
- * order to avoid it.
- */
-#if defined(HAVE_AS_CLWB)
-# define CLWB_ENCODING "clwb %[p]"
-#elif defined(HAVE_AS_XSAVEOPT)
-# define CLWB_ENCODING "data16 xsaveopt %[p]" /* clwb */
-#else
-# define CLWB_ENCODING ".byte 0x66, 0x0f, 0xae, 0x30" /* clwb (%%rax) */
-#endif
-
-#define BASE_INPUT(addr) [p] "m" (*(const char *)(addr))
-#if defined(HAVE_AS_CLWB) || defined(HAVE_AS_XSAVEOPT)
-# define INPUT BASE_INPUT
-#else
-# define INPUT(addr) "a" (addr), BASE_INPUT(addr)
-#endif
-        /*
-         * Note regarding the use of NOP_DS_PREFIX: it's faster to do a clflush
-         * + prefix than a clflush + nop, and hence the prefix is added instead
-         * of letting the alternative framework fill the gap by appending nops.
-         */
-        alternative_io_2(".byte " __stringify(NOP_DS_PREFIX) "; clflush %[p]",
-                         "data16 clflush %[p]", /* clflushopt */
-                         X86_FEATURE_CLFLUSHOPT,
-                         CLWB_ENCODING,
-                         X86_FEATURE_CLWB, /* no outputs */,
-                         INPUT(addr));
-#undef INPUT
-#undef BASE_INPUT
-#undef CLWB_ENCODING
-
-    alternative_2("", "sfence", X86_FEATURE_CLFLUSHOPT,
-                      "sfence", X86_FEATURE_CLWB);
-}
-
 /* Allocate page table, return its machine address */
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node)
 {
@@ -268,8 +220,7 @@ uint64_t alloc_pgtable_maddr(unsigned lo
 
         clear_page(vaddr);
 
-        if ( (iommu_ops.init ? &iommu_ops : &vtd_ops)->sync_cache )
-            sync_cache(vaddr, PAGE_SIZE);
+        iommu_sync_cache(vaddr, PAGE_SIZE);
         unmap_domain_page(vaddr);
         cur_pg++;
     }
@@ -1295,7 +1246,7 @@ int __init iommu_alloc(struct acpi_drhd_
     iommu->nr_pt_levels = agaw_to_level(agaw);
 
     if ( !ecap_coherent(iommu->ecap) )
-        vtd_ops.sync_cache = sync_cache;
+        iommu_non_coherent = true;
 
     /* allocate domain id bitmap */
     nr_dom = cap_ndoms(iommu->cap);
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -28,6 +28,7 @@
 
 const struct iommu_init_ops *__initdata iommu_init_ops;
 struct iommu_ops __read_mostly iommu_ops;
+bool __read_mostly iommu_non_coherent;
 
 enum iommu_intremap __read_mostly iommu_intremap = iommu_intremap_full;
 
@@ -435,8 +436,7 @@ struct page_info *iommu_alloc_pgtable(st
     p = __map_domain_page(pg);
     clear_page(p);
 
-    if ( hd->platform_ops->sync_cache )
-        iommu_vcall(hd->platform_ops, sync_cache, p, PAGE_SIZE);
+    iommu_sync_cache(p, PAGE_SIZE);
 
     unmap_domain_page(p);
 
--- a/xen/include/asm-x86/cache.h
+++ b/xen/include/asm-x86/cache.h
@@ -11,4 +11,10 @@
 
 #define __read_mostly __section(".data.read_mostly")
 
+#ifndef __ASSEMBLY__
+
+void sync_cache(const void *addr, unsigned int size);
+
+#endif
+
 #endif
--- a/xen/include/asm-x86/iommu.h
+++ b/xen/include/asm-x86/iommu.h
@@ -19,6 +19,7 @@
 #include <xen/mem_access.h>
 #include <xen/spinlock.h>
 #include <asm/apicdef.h>
+#include <asm/cache.h>
 #include <asm/processor.h>
 #include <asm/hvm/vmx/vmcs.h>
 
@@ -134,12 +135,13 @@ extern bool untrusted_msi;
 int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
                    const uint8_t gvec);
 
-#define iommu_sync_cache(addr, size) ({                 \
-    const struct iommu_ops *ops = iommu_get_ops();      \
-                                                        \
-    if ( ops->sync_cache )                              \
-        iommu_vcall(ops, sync_cache, addr, size);       \
-})
+extern bool iommu_non_coherent;
+
+static inline void iommu_sync_cache(const void *addr, unsigned int size)
+{
+    if ( iommu_non_coherent )
+        sync_cache(addr, size);
+}
 
 int __must_check iommu_free_pgtables(struct domain *d);
 struct page_info *__must_check iommu_alloc_pgtable(struct domain *d);
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -268,7 +268,6 @@ struct iommu_ops {
     int (*setup_hpet_msi)(struct msi_desc *);
 
     int (*adjust_irq_affinities)(void);
-    void (*sync_cache)(const void *addr, unsigned int size);
     void (*clear_root_pgtable)(struct domain *d);
     int (*update_ire_from_msi)(struct msi_desc *msi_desc, struct msi_msg *msg);
 #endif /* CONFIG_X86 */
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -76,7 +76,6 @@ int __must_check qinval_device_iotlb_syn
                                           struct pci_dev *pdev,
                                           u16 did, u16 size, u64 addr);
 
-unsigned int get_cache_line_size(void);
 void flush_all_cache(void);
 
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
--- a/xen/drivers/passthrough/vtd/x86/vtd.c
+++ b/xen/drivers/passthrough/vtd/x86/vtd.c
@@ -47,11 +47,6 @@ void unmap_vtd_domain_page(const void *v
     unmap_domain_page(va);
 }
 
-unsigned int get_cache_line_size(void)
-{
-    return ((cpuid_ebx(1) >> 8) & 0xff) * 8;
-}
-
 void flush_all_cache()
 {
     wbinvd();


