Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B45D432EF9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 09:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212804.370827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcjEb-0006L6-LT; Tue, 19 Oct 2021 07:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212804.370827; Tue, 19 Oct 2021 07:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcjEb-0006IU-I0; Tue, 19 Oct 2021 07:08:29 +0000
Received: by outflank-mailman (input) for mailman id 212804;
 Tue, 19 Oct 2021 07:08:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcjEa-0006IH-2I
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 07:08:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfe17ab5-99b8-4b88-9497-cdc0a17bf1f5;
 Tue, 19 Oct 2021 07:08:27 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-7Bpm2fIYOzGrys18EFooIg-1;
 Tue, 19 Oct 2021 09:08:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Tue, 19 Oct
 2021 07:08:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 07:08:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0201CA0020.eurprd02.prod.outlook.com (2603:10a6:203:3d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 07:08:23 +0000
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
X-Inumbo-ID: dfe17ab5-99b8-4b88-9497-cdc0a17bf1f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634627306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9iDjP91x9uw6yyMgsmNw7ncw5R31osBpuVcl9P/JHo=;
	b=QfN91mYXz7p1zgkp+0sPUZSqjstHNMYSd16AfDiRmIN+bIVtwXpr8Q0tCwPugBPrW1vNwu
	uYqgX5wK3qKS+jssvyaiWhb81gKmuagKOi9KL5H9VkIrSEWLc/QUv1RaQ9aDmKnPtYbuvL
	br5AvF5WzTmMJzRHDHMPpZVTw+dj3BY=
X-MC-Unique: 7Bpm2fIYOzGrys18EFooIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYmnxWmGXyMtV/gt4dO+u389Kx9vbr4SbyuQYKvRIdr8Ns8Cu35/UuhoG7PF9XwM+xrFMdtgs4bTjIiwh44miDxAwM1fn3CC9/etHUECSFL3ZOjiwk68IGUJzG/mMXf1CNykYpymDrrs/MTGDgy/nA8gjBjAtpkgi05HpAZ01WnGTdGIWtqUFF6p1zLsTdcSusxZjOv7XbvbqgzwnNro8SLIAfFGLc6XpWIjmojogO4fF/Cg2C6F6k486ojjyQYDo8NYJKzz6BGEPQaEAR938CmJbSECAIOepnj3ypsrSJgwl1JqrKDSql2tSl1p9ZujmRQqwFd47ilb2gp+dHqJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9iDjP91x9uw6yyMgsmNw7ncw5R31osBpuVcl9P/JHo=;
 b=aYqEd6ZkSZs8iUFYkyjzDx6wfV88uixGay4Gk1+OPuFweE1/17nn26jlPqeGwnB0BZ3c3HkTFfDNJTkA0IjN9MslCEzwcBHwFQFDYlwEe4f/mZeGxmWnfXvWWBkpMqkHYAVGAW6kb4ZxAYouYTy7x7HszOH5cARY3N+0akuHF7m0kQc7nH99H/SEdJfSdNO5SfX/kHx+E21cn9EHf55flF5cf9iSiWA65yz6HDkKRba96QSlk3k1+MMXY6PxdkCdxedR5hTAkvjxSbdAOFrgfHuEiwcsgNfNfADmVujjNIKChvnsGSdNO22caGHdEyX/1Yh+Fh5Mianb67qHNEvYcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/2] x86: de-duplicate MONITOR/MWAIT CPUID-related definitions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9963c7a2-f880-66fc-8f12-b1ddd0619c91@suse.com>
Message-ID: <b809979b-5d43-482b-921b-65a4e203db2f@suse.com>
Date: Tue, 19 Oct 2021 09:08:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9963c7a2-f880-66fc-8f12-b1ddd0619c91@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0020.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96347f4d-d916-4dfe-4973-08d992cf3db7
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6861B3AEC9A63334E063B2AAB3BD9@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YVjqP4l1zR34Qu9DUZYTho8qhXOpurt75y1uqa2cO+xFED93+zBIuLJGu3WFtM3mOfS3/fNPHHeHQm+X1Vmp+DDtrPRwR1Pn4PBbsWfnl0NwWETP/jtro0DyKbTM83u8xKkNcZeHGBlCGUWhrytaDxqQvPNuSdH7kpbJzN2Pehm1WevPtoSK5FW2c11zU75txnFwlBX6g0hNK5Jp86tByPJqWQLgUwYdikJG4SOT2drMMKklOqbKXN2iGAtfnPydkVhnsbB6i8EYc1ewS4J8jHEu5j7HF/WCJ8ZNcqvPG4Mvf6K9jYRnInCH4/MtXLZWNCpxI12HOIRHVAPTL1xNI6bNyCRhQpHetd3nw90AuY/qhMKbNrn8lSfhSdIgIsXjU1/xGki7Aee57hYKExm5lA1Pr0aUm5nBUqEhGE0+MSOUlmpwOyhEy0FMy2og/voKbcxlAd9MavdsvtHkNVReI2SXSrb5D9jUHEWrU5pcgoKPAwywgnbjM553I5JCy+/KQkoIv6aj0Jrl0O4M/j+PbcDJdoOB7Ksxcm1QcwHMFe0vOn9c6qZJVxwwURXCT0r9rJY7MkSm+N88bZd421ngHqU2zWwn7qr/5V+7D500yIeQJsOPM3sW1FFjXBtSUgQnMyPYbiNOFCelJkZbs6VDuBm6pvV6YJCsb6JCmF0qXKzW1Vdm83Ss9Nf4LtIhNKV0v3usAHPDJY/XbeW4K3qPdrbOEsPob6kZbUm+zGmq4jU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(86362001)(4744005)(8936002)(66476007)(16576012)(36756003)(66946007)(66556008)(38100700002)(956004)(31686004)(2906002)(26005)(316002)(186003)(31696002)(6916009)(6486002)(2616005)(54906003)(8676002)(4326008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHVlUGc2RWFZSy9RbG54Z0g5ZGJrOGFuR05wK1RDeGc0cHNqTE9DUVJpN245?=
 =?utf-8?B?d3lPU01Qb3Z1Y3cyaHRRblRzUnczRytlSmQrNTlNUGd6b3lYMDkvN2EybzJB?=
 =?utf-8?B?OGRKMkFubE8wMWNVVU5ISEFwMTBXMnZvc3JsenhsMWJnM0xyS3czTkE3Vklm?=
 =?utf-8?B?dGZUa2M5VDB2dVdicUpaeDdteFBQVytWUTlmdHNudW9jandUdGVnQTU3THhZ?=
 =?utf-8?B?aGJubkV2emsyY2ZuVFcxM1NvR25Gc2x4SVBjUFpwMjFpTndOSHorU1cwdWlD?=
 =?utf-8?B?bkI1Mmo0U2NUMlJFaUFxaW9SVTdoQ1dCL1M2b2ZYcWtxd04vR081MisxSXNF?=
 =?utf-8?B?QVdQYkJsa1daZUtlMnBZd2htaG5QZGJjNlBvUm9zQmtNWDZRUkhmejE4K3Zi?=
 =?utf-8?B?VWhqM3I0blk4TnhkUERadHh5VmZYLzFwQXlJZnJISVdXZkZSZlVYbWV6eGZB?=
 =?utf-8?B?VGh6U0h6NkxiRUdpMkJmR3cyWm5aS2c1YXpLUFF6STBDclpFTDRXZzAyRGFt?=
 =?utf-8?B?N1B5R0lNZ0R6ejk4am9IVDJxRXZmb1d6UldCaHBHNWgyZTFNZXJaSEFWOWhT?=
 =?utf-8?B?RU91L1QvNjlhbmM4Qk1pYUFjUDhhOWN5VzFHMlJyMzRwdXVEcXlJaUJlU0Fl?=
 =?utf-8?B?dWk1R2kzZnM3M1BUd3BjazhvRVNNQi80SjgrbFlxREJFWmpvMHFKdkNXdWZO?=
 =?utf-8?B?RnR1akMxQTBqRU8yK2VHY3NNaDRHc3pGSTk1alZhVEdiVHNGZGoxWm5hWmE4?=
 =?utf-8?B?WiswR052Z3c4WVNrVXE4dDFTUm4rNGNjWmVtaEl0TG0wVFVoaU9WWGltWENn?=
 =?utf-8?B?ZFFkaEd6QWtXWUFkM29MNncxb1UwWTBua3RMTHphdEN6dkFUV2E3aUozTy9u?=
 =?utf-8?B?MHpZNitIeTJlK2crcWcvTDhWcEJlWldQTi9PVlFiUHgybGN5bnF1bHhLN0JD?=
 =?utf-8?B?dXFUVHhqWCtsbXNJNUhJK2l5dzB3LzdqNGhIMC91Y2ErdDJCTzNhZEEra1Nh?=
 =?utf-8?B?ZkVON0VMejJ0aVJ1MzVnOWR1RHcwTTVZTFB5b0FoM2s0T1N5TzJQMG93VHlC?=
 =?utf-8?B?TmlHUzZGcHcxS01SYXk3Sm9UUFRZdGRVVjFsaVAzRlhoUlRNb05vTFdXNXZT?=
 =?utf-8?B?ODcxakRWRnBxeHRqNVFod0libkUzcjBYdjVjcEVpdi9lK0M5dGxJNUpvb2VC?=
 =?utf-8?B?aUNNblV3WXQ5SS84Q0w0SXBjNDV5bXhiR05IdXp0WlVWTGFubUtGcFkvOVky?=
 =?utf-8?B?djNhMm1pZVNzZGNQUXNBZmRsMEdZTXJ5TWZ1WmxkNTY3WmxobVFzQzA1N3Zi?=
 =?utf-8?B?MlpGbUtwUC9HQ0c4bWZKcVFEWDBxcUowY0traE9HRkRmUkZhVkxqZXJPUUkx?=
 =?utf-8?B?ajZxUGVRcU0vWFVJQ0JKQzA3WEtSY2I4NW5iL0UrT3JJK3dyMTV2M203bUlG?=
 =?utf-8?B?cWNHVkNQUnNLYTFEaG93U0dkS09VVkllQWdYVHVIa3BCNko0UWhYc2Vya3N6?=
 =?utf-8?B?TW9lbXpiTDBLaFp4citZa3VkcmpibzlUS1luN1hPSWs4aEUxQnhzY1VPdkVB?=
 =?utf-8?B?ZjlaRkpzZExkdStGMDlWbnl2NTVQSytSdzdrUG52aWZ1VUV3RUNWN29uU2dY?=
 =?utf-8?B?NWFIcmpSS2I1aGIvbm5RbDlaNXRSM3JNSGxieDF1SDBiTi9WNXU2bnE5bGRK?=
 =?utf-8?B?VjRrYndyRytIclpJbWNXS0ptTWZ2NklTbnovQk84OTEyQnM2Sk50MFhzblJu?=
 =?utf-8?Q?Z+w7eFeRT9XQu+rIfI6CBCIExvrkdsalnaUQKtu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96347f4d-d916-4dfe-4973-08d992cf3db7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:08:24.2242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVAsLxfqFr+YcxOemrIdQ1VCRfYvHC6gT9/kD6sak9PsuKAgqSFMPflAaVbP2A4eNkhpNWzgQrPVSyjvEx+5lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

As of 724b55f48a6c ("x86: introduce MWAIT-based, ACPI-less CPU idle
driver") they (also) live in asm/mwait.h; no idea how I missed the
duplicates back at the time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/lib.c
+++ b/xen/arch/x86/acpi/lib.c
@@ -24,6 +24,7 @@
 #include <xen/acpi.h>
 #include <asm/apic.h>
 #include <asm/fixmap.h>
+#include <asm/mwait.h>
 
 u32 __read_mostly acpi_smi_cmd;
 u8 __read_mostly acpi_enable_value;
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -22,10 +22,6 @@
 #define cpu_has(c, bit)		test_bit(bit, (c)->x86_capability)
 #define boot_cpu_has(bit)	test_bit(bit, boot_cpu_data.x86_capability)
 
-#define CPUID_MWAIT_LEAF                5
-#define CPUID5_ECX_EXTENSIONS_SUPPORTED 0x1
-#define CPUID5_ECX_INTERRUPT_BREAK      0x2
-
 #define CPUID_PM_LEAF                    6
 #define CPUID6_ECX_APERFMPERF_CAPABILITY 0x1
 


