Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E517C5F0602
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 09:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414057.658126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeAnF-0001Xg-IE; Fri, 30 Sep 2022 07:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414057.658126; Fri, 30 Sep 2022 07:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeAnF-0001Un-Eo; Fri, 30 Sep 2022 07:50:45 +0000
Received: by outflank-mailman (input) for mailman id 414057;
 Fri, 30 Sep 2022 07:50:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHGM=2B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oeAnE-0001Uh-Eu
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 07:50:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130053.outbound.protection.outlook.com [40.107.13.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95c4e5a6-4094-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 09:50:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9314.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Fri, 30 Sep
 2022 07:50:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 07:50:41 +0000
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
X-Inumbo-ID: 95c4e5a6-4094-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMnNtvO6FeD5ShvoaBrPOg5sVvAIJMKK3V9n6nIW0etyeqr9SN8kg7sV/sI49/nBOeY+FSYZatzIKAcYPIdm7uRNVuhqID+mYpnZcl6EVK1tlhVl22Cbu9x+cffBEmYAvkVkz6V5LqOyROBF5f6uBPIVhSbs0+1mZhq0c1a+bqKG5R+4tzC8mV+B6awfap9cXrSvgYqI5DSSFi49eRDbkoOaKdIHwMiDAMnaVWe4Fr/zgnfJPuGhfCkHOU8HCsGmkXPGtkLhgzB6q3ilKczuWNiePSUEXOh+OcOoiv3qeVCqcIE2747FfhsKl4JenLBR7UAOTZsrEGVJs6fMSfhzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCZxGTOUES+JAZXxkpQ5pJdIxnnVHQ/0Tkkf2ZdiNJI=;
 b=QeB6H93h070IAd2C1LdnQozW4GCeY41Nen+kqPXnH+b1cJfp9wLCsItiyZA5NeMNCCXsowmidgkV5oHOYU4EJnNf4mcmYXdB4aROX8VvejPjV/1qgEN7aMbKunMBunCJLiRW+u63x7RUxS47QD+R+yw0SVDGRexL0KVK1aoqOpTUx+oMKpqYjm7iWN5FtZfU/3SZWH7eT3+OAQ5YaF54JFtcATVrgyWq9KzSIyG9X+kjVaZ0v7+KnLzXhk2aH2SKzbElbMOUUrXCc6h9aBO0ydjH3ClGhyoASJP6B6ZuubjaJRx78ndMJCSPm/fjs1Y7fbgirr0OPLySt5+i3xzmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCZxGTOUES+JAZXxkpQ5pJdIxnnVHQ/0Tkkf2ZdiNJI=;
 b=y0DR18OzL9/2LuQlfEMzVJCpdqnqOGvbKcgqsoo27Bb22BfU64cal0oUbtCv3YzujsfSCOEM2iQMJqgBa/br/ucmtOUgYsuEOoWqsn+sRoB8GrdpfzP6Z2ZL5iA5aw+UY+MNlalqRWyNFEaiyIZM/2/wB6ZCMrzS0iKRi3nvF8CRvT9+jcOBnGi3IgKcTfN+kFUDKUMLj9bOPT8PKISdQr/M8bnZAG/cKy865HKBxa0VCMEBkqrYG4QmLC8c4n1Nma8imorYVEDrMCuCWU3gm/HHL+TdKuPqSoX9TPmuPX6xofxrPjRb6LD/qExsvqzLYlLf/s0QAjNpHGDgpfFnfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
Date: Fri, 30 Sep 2022 09:50:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: d868520f-6d78-42eb-b8b1-08daa2b878bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q/W4TAiQ/nS9ULjd2lCh3472Tsnl59oPrbi4VUvK3MLkjf1oYQIe6i8f/RAnLTicxYcJ2rBwfkxiFzcxs4Ng4KJQvUBiwfJ/FEfiiYWpjdy/wMZuxkFEMnfoq9W7kMBNNN/2l7aYUHh63xyggUp0I8bkUHYtpaQFvJ+wEkZimZXOZnISE5i35nC/TOlgEmxOKaKl1dAoknFkUuLf1LJrX6D51cXYhh2FlmoJT6wl8NtbJy3qmbL24T/r3nQaW91dqUWhqNuWTJYlkaCtkxD1l51tB5BaS+aJIgtaVfMNmWN4llhKjPdvU6MfbpjnTidgRGdatGMuAogWrYMvwhlNdLu+8vfhBPDcHMcrx48dLMkkxqfDDZXE7vsqY9Zxrs3eBw1SG2zL/s+9q0Up83AR0u8BwCHphvALchFPBX2+OSPW8FHn949MTscGI8BQv6C3pP5PX72VRado3xa9EXDAhzr5yLOnn6QqcmFOwp8+ZYxfg2I42Uo0fAIphq1/i5q7AKJk1wzFlyQIxMZZPJV9LHhiZ3uDsHOqfsw8vWCG0COWnr3jXrBtbWOeWkWhkSjRTCN+/u7dlLL4RnEboxP4aH91RFLjWnxTk+5aoLHG6pD8JJcmiQD/4q+RUH/f5mgqb1nIx60rZ6pmfoLqmRl5u1qORH1J9O+DojI34EhzzWdCS+oXrC3LJ6No8hacqjDAquHlWOfPzCQFxIlm52hOXOJgA1M1+Dj4ZI68gGJCWxQbfbw7/Nl9/i84AhgTFxMV0A4RdU4TS+4MB7mXrDZWDS5aEVD4HdF1VkDdo0ltROc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199015)(36756003)(54906003)(6916009)(86362001)(31686004)(31696002)(38100700002)(2616005)(5660300002)(83380400001)(2906002)(478600001)(6512007)(316002)(8676002)(186003)(66946007)(4326008)(6486002)(6506007)(66556008)(66476007)(8936002)(41300700001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmhPSWtxME5lTkN1aVNkQzV6QjlvaVBVd3llUXdSdnc0NUsxaXhlUWJBQmt1?=
 =?utf-8?B?czNjb3l6dVhuZ1YyQVlsZDB3S1grWTZrTEwzWGFiNVJNWHZ2bjcvN3lvUU1x?=
 =?utf-8?B?UFNRY3RzMGwydWcyeXFoS2JNRzhucHpNNkpMbEhUSjVhSGc3R0hKYVgvdWYr?=
 =?utf-8?B?WDdMd0M4bUJ0VEZyeERvamFCKzZCQUtsSWZLY2lzenZQSVZCQ3NaL0xYOXpv?=
 =?utf-8?B?Y3Q3TXRPZGpLU1kwOUFCQXRybHVid1RDYmxYK0d3UVJReTNGRXZrek4xcnJI?=
 =?utf-8?B?dys4VDhjM1Z1QlpxTGtCa2hPUnVyU3RaOWlwV0ltZm1KS002RERVMG5UR1JE?=
 =?utf-8?B?a2lqblVQNUNEWTh4Tm1SNGZ2TEQ1VmRKNmplRC9XYkVtMnI1eTJTSmQxdnZZ?=
 =?utf-8?B?dE5VOHNiRmt3ZWdHQXNvNkNURWk5Y0RBTFJ4bnA1eFBPSU5mUU40VFU4bXhu?=
 =?utf-8?B?MmRJb0RqVCtZTEJ6UFpxb1V0NitMSHRQejdCTDdDdFVQWWhQWHdqWDBNRjNQ?=
 =?utf-8?B?cFlFa2xaOXVPYk9JSmg1R1RvNFVyU1J4OU1VM043RnovQStBYlJzK2NiZUc5?=
 =?utf-8?B?azNHTFdsR0psZVo3TW05bXN1bjlRNlVhRE9IN09GQUZONk8ySXZvZm5PbktK?=
 =?utf-8?B?cGZiUWNvSml5QjNvMkZ4SzhCTWd0eTErMWJ1VUZzYnRUVlAyVU40ZmtKZTVk?=
 =?utf-8?B?Q1JFTGd0bGZkM285SDlDUjduSzVIRmg3QWFRcWk0bjZPMld1OVhFYVhVS0lD?=
 =?utf-8?B?QjRGRmtDWHkrUVpjeGhGMWtrYVZJNEZsVWF5VDhCK1N0OE1MVENtVU5FaVRn?=
 =?utf-8?B?RzRjaE5TNWZ6TnorMWhHQ1hIRURNQm1OVExra3JCanU5MHpJV1NjbU14RDVC?=
 =?utf-8?B?eWpRMDR2ckJxak9qcUZkKzJDVUh6NVg2cmVLalg2YWR0UmpQVmFxMVBQTW1I?=
 =?utf-8?B?VGRZLzN5VXloa25BeGx6WWxhc0NwWWxTWDh5OXNhMUlWcFRQRW1TR2R3Qkl4?=
 =?utf-8?B?REJmUU9Ib0poV0w4YnR5TENlZ3BpOFhyKy9NNWJsQXhmQnhKcW5Bd2FqY1NI?=
 =?utf-8?B?dlNoVnI3anpKOXlJLzZrMThUME4yR0J5cHp3S3dNWGhXVFRLeFY0Uks2TW5I?=
 =?utf-8?B?TWxqZWtvMHZDdk5MTzJvNnJvTzI4VzRxSVg5QS91ODZuTk5TdWx1a1BxNGRU?=
 =?utf-8?B?ekR1K2Y0SmR2RGVCMTdsV0lkWXhBR3EyZmhyVzEzbDZZSFU4RkxBL3M3cDNJ?=
 =?utf-8?B?a0NJL3U0dUVVQzVuYTRMakhCMzRZcFlSa0tGRXh0Mk1vR1lxbUdtYVNmb2RF?=
 =?utf-8?B?ZkpmNm56YkJYVE1kd1FvR0pZZkF3ZWh1UGRJNEhsUFBrT3lOZUNHcEszVzk0?=
 =?utf-8?B?QTZJWVVobEVnNU9JU3Exa09PNmZRZFBMSlRsb1ZmM0lwVXVBcGdKb2djcUhN?=
 =?utf-8?B?QTMrd2VEYXBuay9RbmJRNjg3dm1FUmhNTkNxYkE0MFd3NDE4VEtWSXNxNU9i?=
 =?utf-8?B?WHYzdXh2Z0VOa1hPZUswd1Z2WU5SeTlkMm1aNjdlN3Y1UUp6YlFaelJWNW5y?=
 =?utf-8?B?L1l2OEQ0OTZGcEhIbW9HNU9HTFphbXVRbzhIdTVJZHIvbS9UQ2JhbTZSZm5l?=
 =?utf-8?B?NVFWc3hEVWtRQjNkV1QrY1RrdmU5ZmhUUWRONnpzTk1VOThHWjlsTGtkUm81?=
 =?utf-8?B?MlhIZlNTYS9WTmNMS1I5djl0VE1WT2Y5QjgrN2FTelZ5MU15bHRWMm5hVEtV?=
 =?utf-8?B?WE9mL1pkY0RncjB0Nis1blladVlxVlFuTHhZSmQybkF0OHk0QVJjd1lRYlIy?=
 =?utf-8?B?MmoxQkJUeEx3OUxzSGlOVW9jLy9XeGVuNFNpSVBxcDVCdzBpdi9WM3dCVkkz?=
 =?utf-8?B?a1NtM2x3bWo0U3NDVVp0Q0gzVnNWZ1BsK25QOTFTS3AzNlNtV3NnakpkM3FK?=
 =?utf-8?B?OFRrQ1RsOHVwQVUwV1FKRzM1T3hNSGwzMGhpc3hqNWtLQTZMR01QMlh4UXdk?=
 =?utf-8?B?MXFGRkZvM01qZ1VETFFFK2VYdG1uelk0SXVsNXZxa0d2RjFYZGduR2xRVjVT?=
 =?utf-8?B?ZEJYdFBqQlI5MTcybG5ZOXNPSnFhQWs1ZXNHcGxzbFFuYVZrcjlKZG55MFdY?=
 =?utf-8?Q?NnqjK94Zk6LIEvWK92Pn6+e0g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d868520f-6d78-42eb-b8b1-08daa2b878bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 07:50:41.1068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0w6Nq7u/BzLdqyY/gLQJaClzPriz9WFQxv7RDWmvfz5pgfTI96fMPqzfPWXwbyR4voLXSpsKovz4qf+GBEd8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9314

efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
higher priority than the type of the range. To avoid accessing memory at
runtime which was re-used for other purposes, make
efi_arch_process_memory_map() follow suit. While on x86 in theory the
same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
E820_ACPI memory there and hence that type's handling can be left alone.

Fixes: bf6501a62e80 ("x86-64: EFI boot code")
Fixes: facac0af87ef ("x86-64: EFI runtime code")
Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Partly RFC for Arm, for two reasons:

On Arm I question the conversion of EfiACPIReclaimMemory, in two ways:
For one like on x86 such ranges would likely better be retained, as Dom0
may (will?) have a need to look at tables placed there. Plus converting
such ranges to RAM even if EFI_MEMORY_WB is not set looks suspicious to
me as well. I'd be inclined to make the latter adjustment right here
(while the other change probably would better be separate, if there
aren't actually reasons for the present behavior).

On Arm efi_init_memory() is compiled out, so adjusting Arm code here is
perhaps more for consistency (not leaving a trap for someone to later
fall into) than a strict requirement. I wonder though how Arm has
managed to get away without at least some parts of efi_init_memory() for
all the years that ACPI support has been present there. I guess this is
connected to most of runtime.c also being compiled out, but that
continuing to be the case is another aspect puzzling me.

--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -183,13 +183,15 @@ static EFI_STATUS __init efi_process_mem
 
     for ( Index = 0; Index < (mmap_size / desc_size); Index++ )
     {
-        if ( desc_ptr->Attribute & EFI_MEMORY_WB &&
-             (desc_ptr->Type == EfiConventionalMemory ||
-              desc_ptr->Type == EfiLoaderCode ||
-              desc_ptr->Type == EfiLoaderData ||
-              (!map_bs &&
-               (desc_ptr->Type == EfiBootServicesCode ||
-                desc_ptr->Type == EfiBootServicesData))) )
+        if ( desc_ptr->Attribute & EFI_MEMORY_RUNTIME )
+            /* nothing */;
+        else if ( (desc_ptr->Attribute & EFI_MEMORY_WB) &&
+                  (desc_ptr->Type == EfiConventionalMemory ||
+                   desc_ptr->Type == EfiLoaderCode ||
+                   desc_ptr->Type == EfiLoaderData ||
+                   (!map_bs &&
+                    (desc_ptr->Type == EfiBootServicesCode ||
+                     desc_ptr->Type == EfiBootServicesData))) )
         {
             if ( !meminfo_add_bank(&bootinfo.mem, desc_ptr) )
             {
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -185,7 +185,9 @@ static void __init efi_arch_process_memo
             /* fall through */
         case EfiLoaderCode:
         case EfiLoaderData:
-            if ( desc->Attribute & EFI_MEMORY_WB )
+            if ( desc->Attribute & EFI_MEMORY_RUNTIME )
+                type = E820_RESERVED;
+            else if ( desc->Attribute & EFI_MEMORY_WB )
                 type = E820_RAM;
             else
         case EfiUnusableMemory:

