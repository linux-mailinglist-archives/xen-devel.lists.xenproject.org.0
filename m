Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547C97253FD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 08:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544369.850104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6mUG-0002kN-0s; Wed, 07 Jun 2023 06:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544369.850104; Wed, 07 Jun 2023 06:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6mUF-0002hX-Sn; Wed, 07 Jun 2023 06:17:39 +0000
Received: by outflank-mailman (input) for mailman id 544369;
 Wed, 07 Jun 2023 06:17:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6mUD-0002hP-O6
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 06:17:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdb0ad27-04fa-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 08:17:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8766.eurprd04.prod.outlook.com (2603:10a6:102:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 06:17:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 06:17:30 +0000
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
X-Inumbo-ID: fdb0ad27-04fa-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2BIjYpeXJPMAcEwjAM10MHs/kA3r+qvsl6HYVxvmXH9zO+nNlWg3PEFrl0FGpiTFJ+zB5fNVDpsUa85WXmmpQ60789TuGPokhFRCsnRnOe0I1KECGGedmTtTQdvJJWlrCxWWHaXEaGEykokyJJ/3JPxPdKuqF2qc2zEmV9DLz6Yg9X65X9+ITSTQl4kypsGBIBg+XUTFF7HU7VLvPzCqiJ3KyaXisJEHJ1XOOi+DNEy3S3X4mmVsOToqSHbaFHu9uqo+9h0psfeijMFnZFsfIrzHbUzff5FDP8DHH0Alnb1eFstODbnWtW/PcKgKPjUpBxdPjXfyFkcdw7DcKkZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDOjmyOzz76zmShyt9iByjI0GSvpNDj4zRniBntn140=;
 b=mCDX4sTodsgXdYWSfTM9Jmkb2RBlRZQBc7DpYO26VHLHFjsjsXKRRvb9/oLrUN10cNO9MnYrPjC3sfNary5o1RqTKXNenqXg7zyb3uZxlZAX2OLNg16Wo+sijFesCMhVGZCvxmhev1eX6XE8X21SVS8pt1U5yjBVcxfd9ZbvTjE+ctUuKt6cCxPSLJ2wy5mxX93DvyjvO03wldm/OAF4j1fwmMxzpJEd08yTA5QiwyBr6Qzmp8U53DtJHwn2sdF5b7M0WZlfj0XEhsx4xyamTRLpgKnJY7BRAe5HlmIk+eNOeagRy+15jK9OIslGIb8PlWoD5eE/7VYycA2W3j5N3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDOjmyOzz76zmShyt9iByjI0GSvpNDj4zRniBntn140=;
 b=oc6RqV13b0PT4UVff0OjTrQtWLHev8etiJ/5VZncaYKK8H+b1nsxaLx+osbeMtYYeRzRDWbbo+IIeBlKlNlDj1tYmFVSSufxm6mcwIXnAjyC/PN9g0PmSnk06de74VW9IuYYHajz0F/5SBGxVQDxUm+wLi5h+IPxnbGjHqsu3y4+sVZzOTrecy540PBy7Vp4w+AwV/++XSNrb/s51iPGkN/ddBvOv4Wv452KjUji0RlADmVGCn0EUZsE+vGOqOuhVHaIdPJcQ4yECeFG8H50DnQ++yJuVfa8OxqZMmmrKt5HtwVVBYpjZWHXhlBNZXMWboCk9eUjppuxuV6izvqblw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b282f2f-bce8-4c98-897c-2866ec1b6dd0@suse.com>
Date: Wed, 7 Jun 2023 08:17:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: allow non-BIGMEM configs to boot on >= 16Tb systems
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: af212d16-ee9a-41d4-f7f6-08db671edfa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4UOKOHLB0nyXFo8k+K7H8dYXSZ511Zh/O++l7VWCpKM74u/8SPUqp4L545BgWkMIX91G5pwzlxchSY7RGNCPRk+LumOZxpg+hx6RP50t9H9nxVBX2UMITROiJ/4XkVoqjIE9JB+130YRoL2krIRtQZ2jNZypR1oEBuwPqtoZ2TG6xdeMAoKcWB0kFmsAse6Zi4znGyOZ/Hw8acINlw8tXeb8F7BWnRy52+GJjb2Wjq0c/7C+h9zKqGWgj79Rr0R1yReGf1dT4uIjhEunonroyOp/UX2P/rusGZ0+Mwhtz3j5Nt+cunUDiLPmtVjVkBUJMwHhnuzRobk0ha1DZhqW2mXOgx9pMPlaW6Ho0psxuNr/tsVTRfPgpo4h7xvXclUODEiBDsBaABmKjvfs36L0Li2z8AJcrn6lAHem7ZiN3AIkqqUM5Gm2M0AD8kognXutIuv0lVGP/FV4VWcjIzT0saT0Ti7F5WOwt+H+zwpA1qXYoleLlXpvheaH8y95SgKGKASh8ramMaXZt8sxEgrz3oR0vBnkcxXUNXBpbohlqNZOBLkNMexGKBsxT9oj3y2rTOJNLEnshGJxuSPlX0bbLn67RLcGqzONffwRHbdXbVEMEwTYLtUcaN1ikP1gUR/okuOAJ+mG4nQTalrD0vxhZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(66476007)(66556008)(54906003)(478600001)(83380400001)(41300700001)(8936002)(8676002)(66946007)(2616005)(4326008)(38100700002)(6916009)(316002)(6486002)(186003)(26005)(6506007)(6512007)(86362001)(31696002)(5660300002)(2906002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG9KMEROMHZiZFJTZEkvcTBPRHZxT0R1dTRodklWdmhMZFhMODRDdWVsU25L?=
 =?utf-8?B?Q0tQN0lxODRxL1F0OVEyclBxcG42Q1dhN3JUeWZpSkFxbmNZdEMrWVNUOC9Y?=
 =?utf-8?B?ZklwK3R3Z3FSMXo2dzU3YmQ3Ni92UndmaEFiTXA5UVdzaFNhbjlsZjdjZHV2?=
 =?utf-8?B?dG93NFRVblZvMDc4eHQwZjNEdHROdmlZNE1wWGhLb0MyWTBhMDFTQWxzQVNC?=
 =?utf-8?B?UmVKbkxVOE52WjR2dXpzdVlKdURVbVRqZ3FENUF2NmJBM1NwWi9IR2J2am5W?=
 =?utf-8?B?YW4zN2NGSVpRZkdZbmtRRnpNWFlKRFBJK3NSOTE1ZE5rRlVIKzVyTjd6ZGRQ?=
 =?utf-8?B?R0JEZjlJMzdTL0JvdStuVVkyNUtwcXRJNXd5V0pnQ0RzZXF3TSs1UFlxZVpo?=
 =?utf-8?B?bHpuYXdLd0hCOE1ldWZKMkFrNm95bVNibmRjMmhhNHgvYlJyK051ck9udkZQ?=
 =?utf-8?B?WnFkTFYzSmdTZDhIZXZ2Tk0vOHBsRWRHTUtCcTBkcmZKVm9zUk9qeG13ZDNi?=
 =?utf-8?B?VHNhU0M2cHoxOXFPSjNBUWQ3U1Y3Rk00QVhLaFVwYW1nYmJaQkF1VXFyS0Jy?=
 =?utf-8?B?M21KdTJvWHlwWE1KL1FKQm5PNlhYQ2lrRkVnMmdHYmFpUm1UelhNS2IwRTdo?=
 =?utf-8?B?aE11NDdxMXB1SmZVWlNZTmlIY3E5NnZJNkU0WVFrQzRLTE0rRkJnbytQaEd5?=
 =?utf-8?B?MXhzcFgva01MTTNZWDQ0aHZmMDJnSk9lTlR1Qkd1cW1LR0tIM0h1V2lsRExs?=
 =?utf-8?B?b2NuS05IRlQwcVlxbVdpRThKYlgxeDlrSTRWRXA1aXFXQ04xVkxvWUU3T0py?=
 =?utf-8?B?V3p4aVU0ekVucDNmT05GeGlQekJQQVZNVXZqM3NNTzJKTzBRTEhDMmFqdVd4?=
 =?utf-8?B?TlE5VHRwWUExcytDVXdqbWZUcUJrNE51Q2h4Z1VncmVyVGY5SGdpdlJ3L01a?=
 =?utf-8?B?M1Z6V1VaY1RoblFDMzJMR0FXc2N2NThtWE40amZsMG1TTkgxVzlSaHFiTzNt?=
 =?utf-8?B?bHdtM2dlMFFrM2x5NG92WlFzWkJqWmEzS3g4UlRxbFJSbE5saHk5emxNYnd4?=
 =?utf-8?B?Ym9aU2c1dGEyNVFzRVA2SThqWkdFMWg5NkpHb3JwOEVYRkdPUC9vZ3ZwSzho?=
 =?utf-8?B?amhoNE9CL0gyQlBTSTg3S2owRXdvU01vdmFaL3pZWG5MQWNtYnZYZXhvMElX?=
 =?utf-8?B?MVBMQ3VrcWtqWHNKVnN5MCtWeG8zV0RHN3lBbXVMWHFRRlY2MWFjWGpmeUE5?=
 =?utf-8?B?TXY5bEJHUHlLUkViaGp5bFZZU1B1YXhFN1ZNMlA0YmNYZE9vZHBrVUI4Qk5k?=
 =?utf-8?B?NkJQeGsrbnJrSkhjNDFNbGZ0a1RVMzZOY1FlSlBCREprOWRaYnVqQ2FvQjRR?=
 =?utf-8?B?VnF2VnNSTVZlS3hGV0hqMTFvMEJwcDVHRG55eTlOdHB1VTNVQ01Ed3BWRmFI?=
 =?utf-8?B?WC9PSHJXOFpkMWhldDhmeFpWL2pXSUlTekx2aXBxamNkdCthR0taY0E1NlBH?=
 =?utf-8?B?V05nQng2dnUzU1BUK2RiYkFRYmlxcldwSFlvWGtFVUgrSzJvdStGVEJrcG4v?=
 =?utf-8?B?Z0xYV2RFdUVROXBYZFh1V0E5OTZPS3Y4YUJOZUMvWElkMS9VK3ZOMzdjcTQy?=
 =?utf-8?B?UFNXaXFNVDFraUdHNXhZVkJzeGZsQnlWQWpucDM5OHBwNlhNTUtIa2NJZnY5?=
 =?utf-8?B?SlhNdkY4MStxRmdVenBSZDZjc2paUnp0NmswWjcycWI1dmdJOGVFemFRM3Vi?=
 =?utf-8?B?akszbWtmOWxEbXBrNjF3RDB4SnJSQ1FQV1hXaUE4cjJ6amhpYWp6Z1NVZXdS?=
 =?utf-8?B?SldiVEcrY2RGR0hiUGY4blRLWDJCUnZJdFl6c3Q0Nm5iZ09Pemgxd043RTdx?=
 =?utf-8?B?a3pmRGliSG02S2NCdFErVm11ZFJ0NzRkQlkvdnozcll3dVhLMjM0L1RZbDlG?=
 =?utf-8?B?RDFreGp6WFg4ZUVQNUpOYWxlck1IVVpsSFJNQStBK2hreFMvbmNCVDJNRHpz?=
 =?utf-8?B?emVWYW1zY091NWlmYitMVVpMQ2wzM05FdERxNitzZXYvcWlyWFdmdjFZcS9o?=
 =?utf-8?B?UnE4TUViZWdDMTZpOFQ1YUU3S1Q5Nk82T1ZYMGZzUE1KRGJIZ3FFQXdLNXQy?=
 =?utf-8?Q?lsTFxLoFvaj7logs2URso30Kk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af212d16-ee9a-41d4-f7f6-08db671edfa5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 06:17:30.3287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2q0v2GrwvGpPI5Ji3QezJuMCdRFY3JtH/TZ3F1teVjFVqSnGFdWqllymOpvofJ4tI41ZpcLDcz9uV8kMcW3BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8766

While frame table setup, directmap init, and boot allocator population
respect all intended bounds, the logic passing memory to the heap
allocator which wasn't passed to the boot allocator fails to respect
max_{pdx,pfn}. This then typically triggers the BUG() in
free_heap_pages() after checking page state, because of hitting a struct
page_info instance which was set to all ~0.

Of course all the memory above the 16Tb boundary is still going to
remain unused; using it requires BIGMEM=y. And of course this fix
similarly ought to help BIGMEM=y configurations on >= 123Tb systems
(where all the memory beyond that boundary continues to be unused).

Fixes: bac2000063ba ("x86-64: reduce range spanned by 1:1 mapping and frame table indexes")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Sadly the people reporting the issue have decided to go with the 16Tb
limit, and hence the patch wasn't tested by them. I thought that I'd
still post it, though.

The "must not be passed to the boot allocator" for the range in question
may already not be applicable anymore, with all page tables now being
mapped via map_domain_page() (iirc this work has been completed). But of
course there would be a risk that something else is/was overlooked, and
hence the offending code is being fixed rather than purged (and the
purging should occur once the directmap is properly gone). (This also
seems preferable for potential backports of this change.)

--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1722,15 +1722,16 @@ void __init noreturn __start_xen(unsigne
 
     if ( max_page - 1 > virt_to_mfn(HYPERVISOR_VIRT_END - 1) )
     {
-        unsigned long limit = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
+        unsigned long lo = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
+        unsigned long hi = pdx_to_pfn(max_pdx - 1) + 1;
         uint64_t mask = PAGE_SIZE - 1;
 
         if ( !highmem_start )
-            xenheap_max_mfn(limit);
+            xenheap_max_mfn(lo);
 
         end_boot_allocator();
 
-        /* Pass the remaining memory to the allocator. */
+        /* Pass the remaining memory in the (lo, hi) range to the allocator. */
         for ( i = 0; i < boot_e820.nr_map; i++ )
         {
             uint64_t s, e;
@@ -1739,10 +1740,12 @@ void __init noreturn __start_xen(unsigne
                 continue;
             s = (boot_e820.map[i].addr + mask) & ~mask;
             e = (boot_e820.map[i].addr + boot_e820.map[i].size) & ~mask;
-            if ( PFN_DOWN(e) <= limit )
+            if ( PFN_DOWN(e) <= lo || PFN_DOWN(s) >= hi )
                 continue;
-            if ( PFN_DOWN(s) <= limit )
-                s = pfn_to_paddr(limit + 1);
+            if ( PFN_DOWN(s) <= lo )
+                s = pfn_to_paddr(lo + 1);
+            if ( PFN_DOWN(e) > hi )
+                e = pfn_to_paddr(hi);
             init_domheap_pages(s, e);
         }
     }

