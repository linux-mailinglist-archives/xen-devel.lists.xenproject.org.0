Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4768B3A1C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 16:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712855.1113728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Mdo-0000IA-BV; Fri, 26 Apr 2024 14:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712855.1113728; Fri, 26 Apr 2024 14:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Mdo-0000GR-8N; Fri, 26 Apr 2024 14:33:32 +0000
Received: by outflank-mailman (input) for mailman id 712855;
 Fri, 26 Apr 2024 14:33:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/P6z=L7=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s0Mdm-0000Fn-TP
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 14:33:30 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e88::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f229a3c4-03d9-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 16:33:29 +0200 (CEST)
Received: from CH0PR13CA0028.namprd13.prod.outlook.com (2603:10b6:610:b1::33)
 by SJ1PR12MB6169.namprd12.prod.outlook.com (2603:10b6:a03:45c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 14:33:24 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::53) by CH0PR13CA0028.outlook.office365.com
 (2603:10b6:610:b1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.18 via Frontend
 Transport; Fri, 26 Apr 2024 14:33:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 26 Apr 2024 14:33:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 09:33:23 -0500
Received: from [172.20.132.216] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 26 Apr 2024 09:33:21 -0500
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
X-Inumbo-ID: f229a3c4-03d9-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1ojq8+SFUa25LR9tOz9+pt5GjNx2tYayTUKhJxzAgeDboHPEGZOD3m30TbUwhAjrobudov4bZjRbeO5zC+m+cR/a6+O9WpB1EhKmaYnuC3VBYavu8xMNn5DOgZHYkvx1BbLGAtY5JzukIbkZ41RH6M5fT7v7ZpY8538qGt3TWvnO24LJ+95gz3nzn9t39NEup4z8IDYIgbUs5CGiZG4eAvvF5bCqK27RAnfqpzberugjsziNOUr5uX3oCPA1fyu2h5I8Yg5rWXikP21eW89uADZrh42yge4SM6UF5xcIfqcuOd09uDaEY9Az/myGDxIE8BUvuL39OS7orth2bg3ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vpx/cFxweS61wRRRkOw84SPvY4PtH2Glydv/7cYPezA=;
 b=XMrbDOpMM9B6F0Ld6t4H5yuJvtjBL32/8nir92BitdCdMeaA29SMBLqE3/ppdirV0gVnN8WxfuVRAR5ajmFS4ViOTXrM9NBhJR2GyqBn/0XiCBzEhxCZYuw07VigKeYHKmbx95BdxYBdzLqQstKY+Ei/fx+o39oYlxAHwwB4gerjrvZdnQkwzfl5X6abWOx9f7mg4zPtS+/LjKnQ1GuyjyIbth2K2UOhV1AxrKniMkVFVELu8oLdwEb+hyPFue8qMhqBkPRc5/AYBRBeiSV45SXsN8AMzsxo8BeofK2S18rX6WrxNDL7AGRkq78VTVdDdfn9nJUyfIxFuF8hWUWOMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vpx/cFxweS61wRRRkOw84SPvY4PtH2Glydv/7cYPezA=;
 b=Z7H9sTl0rMGr/Pc8mFhm0tRzA29gBdjlfeAKkO/Yq7jbBcB8sJhXyPtHn4bs7o+u2J6bTESe1UMSF8DgFoU8qg5TPmH0wIDtilI5sC6G+Ej1XfAAt6VRVea35ncb+js8BPkWBEkzUdlEclgAINQCXXwYHtpS6bWJoAYkJFkisM8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <261fce46-56e9-4a7e-8f2f-b741bf5b8251@amd.com>
Date: Fri, 26 Apr 2024 10:33:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/spinlock: use correct pointer
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240425204547.658536-1-stewart.hildebrand@amd.com>
 <08165a0d-d8ee-4405-ba04-e1cfb51489b4@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <08165a0d-d8ee-4405-ba04-e1cfb51489b4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|SJ1PR12MB6169:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d1d038c-236d-46c6-c53f-08dc65fdd413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDhwaStNMnhUeVpLRVFweDdlTTUrR0dmenlnelR5K0pKaDM2WWFFdlVjUmlr?=
 =?utf-8?B?MVJVNHF5Mkp1eldjWFJOU0U5QkEwUWM5dkdzVFE5WmFwc3MvbkhwUGpVMkRI?=
 =?utf-8?B?S0E5c0lFcHJWRTlhVVJvOHZIZytuMEtRaC9TRG1BQXZzcEVKbngvblVYci9J?=
 =?utf-8?B?d1hqZHVXcGQ3cVJQa3RtVWdaOHJJTzlweUZBcTlBeXRRdkJkQnlWdVh2TWJN?=
 =?utf-8?B?amxQZW5GQ2ZaV1lHc1RFa2xDTVh4VWJTZjhtdVptdmdGQ1liMXZmdDRJcy9x?=
 =?utf-8?B?QmNRRGpFcGZpbTNQc2Ixa2UyY1hMZGdnS3dPVG9RYzhjVjU3b29UMzBpV1lL?=
 =?utf-8?B?MmZaRjF2KzhOUGtkcXYwYlgrVThibmJtNmZLM2FsN1lvMEhWVXdBQlp6NThv?=
 =?utf-8?B?bnA2L2tXS0JRMG14aUQ2c3F1eHMzcE4veTFNZzRIeER5empvcUVTQ0VMdEJ6?=
 =?utf-8?B?aDhObVlsd2JnVlRvVThua2dpaHFKWW95SzczcVU4QXVXbkIvaHR0czBRU1A1?=
 =?utf-8?B?VzlIeE5KUW9RbEtBNDRPZjNFcGpieThIajBwZG8xMjFvSjVOc3djN1U3WEZZ?=
 =?utf-8?B?Vm5uMVMrcUxIMDJ6bDB1endYeGVGZ0hEZ0tmdmo5UmpDZ0ZDbFlBdVduSVN4?=
 =?utf-8?B?eFNaMlFscjduZ3FLWDhTS2J2M2psSUpLK3N1ZC9xR09sWEE5VUxMWm1NaGxn?=
 =?utf-8?B?MFhMbVdEWWFTS0wzbU5rdktoTjh0eWxTRWIrby9pUXdEb1hYVlg3M2F3b2sw?=
 =?utf-8?B?dUUrZEVJUnN6Yy9sUFdLMW1nS0xaLzd1ajJVb3Z5b2pDR0dVZmxUM0J0b1RN?=
 =?utf-8?B?Y0I3czA5aVFEMEpTdUVDQ3NEdFFVQWV0ZHNRQTBVY1ZESXVnTktBL3UvbnNs?=
 =?utf-8?B?bmZqTnBIUjg5M09TMUhQQlhZQVBqTktqTUhlY0JXMGF6U0h1Yk1rQ1k5aEJv?=
 =?utf-8?B?bElCWXVhZkFOcExXT1h3SzdEUmdUeE52aTY2MExnZVJhUUpLLzMrQjBwZHFi?=
 =?utf-8?B?VCtkS2wyQ0J4aFZ4cW56K082T2prKzF3SlNYNTJXRTYzbFhnL1VEbEYvU3dt?=
 =?utf-8?B?enhSVnhWS0FUMTZ2N0RPQVdhQ3U5V0QwNy8xTjE4VXNLVVdKUjI1RkJsbHV2?=
 =?utf-8?B?bDRwMi9mUEJMdDZEWWhBOFdrZWRBZDJScHErQVkxSkxtZitmUkxnZFZ6RTZx?=
 =?utf-8?B?ZStkZFV4WWF6Qk5sOWNyLzBEL01WZnZKZTh5cFlMbGhzVVgxR0JsRWRGY08r?=
 =?utf-8?B?UWZyNk9wNEk2UkhIcDBheHVVSFdvWE9iQlVLR1h3c1FPTng4eXhCRDVVT1dI?=
 =?utf-8?B?dmRiYkc3ZVhaeko2cG9Jd0FJb2p2WUhrQjFSYzhnMS8yaTZhK29rbTBmQTJh?=
 =?utf-8?B?SGNzY2krQ29ieThJQzU3Z1ZQU3QrelBVdUc2ZFJjMXJNZXFqeFV3M2puZEVo?=
 =?utf-8?B?WUtDWmcwdnl3Z3YrOEtEOEZ6T3ZVNmFmVHdjRjV0ZndFOFNqVVNmc1BwQm1N?=
 =?utf-8?B?MnFmTEhSZEorT0V6RDJtM2tQTW9Od3pZa2JKb1pPYU1oaG5CRjZIRThNQ05v?=
 =?utf-8?B?eE0xdWtTVVZIRGt4VVFZNkdKMmVmMEtndHJtRTh3dWh0ZlBvajVuUlJaTTZV?=
 =?utf-8?B?TFFYTER3WjBudXZyMGRnamRnemZNVTZQcFN2Tmh3K1hocG9HUmtSVkpRRjc4?=
 =?utf-8?B?T0Q2VkIwLzlINDByY2x0MWxLRW9oUXJDd1VrMXZuM1pEdkd0TWkySVNwakhh?=
 =?utf-8?B?NGNUSUVRQU5UY1VScjVhWGNhVExHakk2SFdCQU01bDQ3alJrOWFtb2hsSVZU?=
 =?utf-8?B?YTk3all3aCtyblE4L1BSYlR2d0xTVXdSbVQ0L21weGZPSnZTdEZqa2pTYkl2?=
 =?utf-8?Q?rJLg0sAwzthXH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 14:33:23.7714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1d038c-236d-46c6-c53f-08dc65fdd413
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6169

On 4/26/24 02:31, Jan Beulich wrote:
> On 25.04.2024 22:45, Stewart Hildebrand wrote:
>> The ->profile member is at different offsets in struct rspinlock and
>> struct spinlock. When initializing the profiling bits of an rspinlock,
>> an unrelated member in struct rspinlock was being overwritten, leading
>> to mild havoc. Use the correct pointer.
>>
>> Fixes: b053075d1a7b ("xen/spinlock: make struct lock_profile rspinlock_t aware")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!

> 
>> --- a/xen/common/spinlock.c
>> +++ b/xen/common/spinlock.c
>> @@ -789,7 +789,11 @@ static int __init cf_check lock_prof_init(void)
>>      {
>>          (*q)->next = lock_profile_glb_q.elem_q;
>>          lock_profile_glb_q.elem_q = *q;
>> -        (*q)->ptr.lock->profile = *q;
>> +
>> +        if ( (*q)->is_rlock )
>> +            (*q)->ptr.rlock->profile = *q;
>> +        else
>> +            (*q)->ptr.lock->profile = *q;
>>      }
>>  
>>      _lock_profile_register_struct(LOCKPROF_TYPE_GLOBAL,
> 
> Just to mention it: Strictly speaking spinlock_profile_print_elem()'s
> 
>     printk("%s: addr=%p, lockval=%08x, ", data->name, data->ptr.lock, lockval);
> 
> isn't quite right either (and I would be surprised if Misra didn't have
> to say something about it).
> 
> Jan

I'd be happy to send a patch for that instance, too. Would you like a
Reported-by: tag?

That patch would look something like:

--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -637,22 +637,25 @@ static void cf_check spinlock_profile_print_elem(struct lock_profile *data,
 {
     unsigned int cpu;
     unsigned int lockval;
+    void *lockaddr;
 
     if ( data->is_rlock )
     {
         cpu = data->ptr.rlock->debug.cpu;
         lockval = data->ptr.rlock->tickets.head_tail;
+        lockaddr = data->ptr.rlock;
     }
     else
     {
         cpu = data->ptr.lock->debug.cpu;
         lockval = data->ptr.lock->tickets.head_tail;
+        lockaddr = data->ptr.lock;
     }
 
     printk("%s ", lock_profile_ancs[type].name);
     if ( type != LOCKPROF_TYPE_GLOBAL )
         printk("%d ", idx);
-    printk("%s: addr=%p, lockval=%08x, ", data->name, data->ptr.lock, lockval);
+    printk("%s: addr=%p, lockval=%08x, ", data->name, lockaddr, lockval);
     if ( cpu == SPINLOCK_NO_CPU )
         printk("not locked\n");
     else


That case is benign since the pointer is not dereferenced. So the
rationale would primarily be for consistency (and possibly satisfying
Misra).

