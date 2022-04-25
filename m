Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A0050DB56
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312533.529821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuEV-0001Cc-Bc; Mon, 25 Apr 2022 08:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312533.529821; Mon, 25 Apr 2022 08:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuEV-0001Al-8L; Mon, 25 Apr 2022 08:38:11 +0000
Received: by outflank-mailman (input) for mailman id 312533;
 Mon, 25 Apr 2022 08:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuET-0001AU-P5
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:38:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0877dcb2-c473-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 10:38:08 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-9euADwJEMM6-oNQMvwzxDA-1; Mon, 25 Apr 2022 10:38:07 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VE1PR04MB7424.eurprd04.prod.outlook.com (2603:10a6:800:1a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:38:05 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:38:05 +0000
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
X-Inumbo-ID: 0877dcb2-c473-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650875888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HbAbSHg5ZYzDcoXEhcNJap9YC68omZXSPDO+MrCQoo4=;
	b=a0B/FBbG54bSiF2MRSXM3YVxNwvPbqQGkN3pnGcbCJBq1nhn7r+BIz+F5iQzn65SE1Q0/e
	H1/hYbutfq4ZtLvhqhiGCLLGBffD7R+Xwbdc+lWMRU1PK/xOgnSC5Rwhxd9ETwzGDG9pbP
	KSlXvchJxU6jUaFp9BKoPZ3ve9JBf7k=
X-MC-Unique: 9euADwJEMM6-oNQMvwzxDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cbewgt8CsIo6ZPR2bkZk0GWOw4kfOiWCRFBP4svCdR4igDdcQVjgYG+wjq+diuMhe7MwFGLIBrUcsmWpU9tBRpZAptQFKot4Bb9hm67wY9J3hF2KoK9a61t5I8Qxkhr1HmPIyIGAxHvIKQ6PLk90c54pajs5FjN/Uk2uDMOXgFFn3T9UUu6v+DqM8g9k1tKe+KVo1glkWihZN4B9UAwHjQzFcWj6n8r6ADNBG0G5pYVFRBURHrcRH504ArFQNzKs1njPZFsOnZe61pcG0H9Ftbk9T70yi31sVZn/xF9KafAaqiMWt1GZJwS2HcYuo2D/+Rp+XCnwmVMuJ04qCos3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbAbSHg5ZYzDcoXEhcNJap9YC68omZXSPDO+MrCQoo4=;
 b=AN4i23UufRgtexkGF58cmoZB5BQCTd9TvdJZGMZ++1x9LlMGs4+Y5WQJeXEeaDwVH/MhlCadrVN2Do1O92yprebqNhzq+Z4k+tSbkgjOR/h/0tP3d6FHxodxKlsaEyNaKrztmHa95GkJN3EjGVzy8F8U8Pd1kSvd5lD+GMhzaW2PFHiK4l7wISDnFkviQHGR07LObjoILRBks7/lr/0R0VJQPIQY6lOYwhi3Jb+t3Q+D6MCn0PJbdm/G/8CYlppXamvTM0u+Yfkh1kil+Ftyjm7GHMwDlq797nIiWg7j38poklIaYIvG85p+j0ZjF8D/6SD84h/qjSpijN67xMbTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5866e22e-9f31-84ab-1df9-db84aa802944@suse.com>
Date: Mon, 25 Apr 2022 10:38:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 10/21] AMD/IOMMU: allow use of superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0014.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::24) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d56cf4ea-ca11-43f8-2c34-08da2696eab8
X-MS-TrafficTypeDiagnostic: VE1PR04MB7424:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7424F897A880C91B8AAF9ADBB3F89@VE1PR04MB7424.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fiut1mesAS/t0AksbdJlXJ0SSZtzAwn9hT8AUwtxdev03uSMZxhxzu544oz/pHolxu61r4ScHKBO58niWtBcUOyfcYlZoIdrmH4gp/K1AnGWzD/trDZ6R0pzyJAEplhsEmhP/AeCX9xXZx3zbVwtbeWp272bb++7PluO1r/PCN0dzd+AcA7t4AALCHMn51Gv/nzFHwENKzZckfcyCKEQCRs9aOtrheoPrhNwt1BNmyb1CzwVUxu1ZV+tpjM3IerRSiqxcwnNg8+MJwIz8o80hT8/+M/42k2nYPC6w9lhR/7zhuB8zLHtaCEwMj917GRSMvJ7ngENqDexO2m23rTiw2F5KAf9QsBux0iHdu8t3qBj2iYmWkp170uZ+xxuAJAJ0blH0Todp7arLN+id+/rX9RS1TnmAM6V250ppHyIkdOWcuN5wEgFMaZMMdDQaGFS3MsgU/EjcH4PSoYQUpRTqYLJG2oIjIhfk7M8v2H9A0Cjw3kAiSXATAIIBP27tD//B4F231tL0GCmqmNEIRUfsJaueQLqYbfp/O7G2rH87dXlUoRqQtRqabohRdqs+sHJiGkmF5L8arT6Az7yrhvyscdL3vPNFClId3LId96AaDREy4QIElkl8tIlY4e66wMyufL0juLFzAQl5T8yyXhXh7fldTEK1xACnQ8u0Jd01s+e/fOgLJIlfBPEUHhzbIUiAgI43kolJQWVgascJDehitvQRlAcku0zxqqS5ZcH2Rk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(31696002)(86362001)(66946007)(83380400001)(66556008)(8676002)(66476007)(38100700002)(2906002)(6916009)(186003)(316002)(2616005)(4326008)(8936002)(31686004)(36756003)(6506007)(508600001)(6486002)(6512007)(26005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MS9PWnlPR244U0RtTHBhVmFjS2o1M28xZ1FsMW5DMXRGYm9mVjljbW4yeVdF?=
 =?utf-8?B?anVySUZnZDkxdXNObTJGbXg3NkdEeTdsUEJZSW5pTTFqb0JOQXp6MjFlRWkv?=
 =?utf-8?B?WUpROEUvU3ExcVdTU3A5Sm1KNzBCS0Y1c3BKMXdxOXFyWmRad254OGdwcEx3?=
 =?utf-8?B?RTRLR0xqQlhPdisrVnZ1eHllamhIMy85b1RBU1h0OGFIWDFIZ0FTMDFlZkRB?=
 =?utf-8?B?anBPNmk3ZzE3cGtERFBBTGZaVVcveTZTU0I3QTZtckRReEJWYmN1ZUtnUkVM?=
 =?utf-8?B?SEhDY2xWREZTNkdmcGNMaGg1UW1xZW1OaXpEMW1ONkZ6Q05IMTdDZGU0WlZt?=
 =?utf-8?B?Znk0aEkvQmxqMDkxY0Z3UGErUHREYTQwMldDOGJkQjdoSjlYdTJlS0JZZGpJ?=
 =?utf-8?B?N3h4QkV1WTk5UTBwcDJEdXFZbjBPVjFVbW5RRWliUTVuVTFwcG5HNHNOSjBk?=
 =?utf-8?B?T3RCMXU5Rjc3QjZLQkVHTVo0QUZRMTBldThrNkRqNytySnVPc0tmbjlONUp1?=
 =?utf-8?B?OXhaMy9rbVFwRUhSWGNHcHE1emdiWVpBNmJzRkcyejByeHFlVHVhU1RxQTNk?=
 =?utf-8?B?eWZ3VFpUNExvb2FxWDF3OE9iYkUzOVFnZU8zRlJoNnVYK2N6MHo3dGVMQlR3?=
 =?utf-8?B?OTFpV2puOTdacXdFSlZtZGJNVTJMaVU5YXRlV2YrSjhxeW5CYzV3dnlrMWFS?=
 =?utf-8?B?L3N2YnRvZjYzUGpUa3phTWJpb3ZQRmE0cGtQR0tVWDliTXZhdm1PRDhtNGdh?=
 =?utf-8?B?d2JjcUdWNm9qbnJ4QkQ4Z0doN2JhaXJzd3A2RnFLdXI0bmxadXBHdTd6Yzdk?=
 =?utf-8?B?YXBMcW9qeWlQSVZMTnUrc2ZMZlhIM1J4eldnSmVqSFd1enlzdk9YUWprR1d4?=
 =?utf-8?B?SGlDVTNZK2QwM0dKZnJoQ29OdWtPd3gzUXdBNnZNanM2MWN1SmdOZ2MwaWRt?=
 =?utf-8?B?WmFkN1dDTmJxdWdxaXZ3aGd1R2d1U3RlRDUvS2NXMWU2T3RrL0VTZEdaQzk4?=
 =?utf-8?B?RXp5WTYxTlpMNkpGbFdRYlN5dDg0UVdTQ04wdFRhemVBSjg1WlhHU0M1a2l5?=
 =?utf-8?B?MnRrMTBKZitQYmZwWDhUNTRHZmIyTTNLVVNmYm4zRFZ6Sm9ibXloK2hpOVZ0?=
 =?utf-8?B?UXZQY0tyODk5dC80SEVjSmVjNjg1MzZNUUZiY05DSzlvdDFaYVRrRE5aTmlm?=
 =?utf-8?B?VEJDdDA1RFZxcW1FM3ZLcUVjLzJYQlNxT3d4dHltOHhiV2kvNUtOL0hvbzI1?=
 =?utf-8?B?UEp1WStSTFFhN011L2k2V3l1ZmJUWEhuNmNCcVNrbUYvUDNDNllsbGhLM1Bw?=
 =?utf-8?B?UFkxSGtiaW93OWYvdHNWV1pZZ0pob29WNDRlM0ZicVA2NmpmL3lCRnB1Rngr?=
 =?utf-8?B?TmdOWWNmcUJET1JRd0UyeEg3U1F4MjFlOUNma0p4STNWZk9EODI5T1lCSlVC?=
 =?utf-8?B?V1N1R1JaUzBzNi9TVXlzVzRPSmpYcU4vQ0kvaVp6eU0zd0JHTUJ4Nlk5Z0dR?=
 =?utf-8?B?YWR4cEp2dTl4SWh2Wi9HekJwRndyUXhQWWlOZDdnTjVZbkNjQTc0ZmxvNkxI?=
 =?utf-8?B?c0lqeTJWR3NkYVdOR2ViK004SkwvY2VJSmV6WVZXdnZab00yaXRra1Z4amg5?=
 =?utf-8?B?WUJLYmg1eVV5NFpNNkoxczFoNHRhMjlTUWRSZ282ZU50MUIwbTRIMmpCM0ZD?=
 =?utf-8?B?MXJOdHlVTy96cU5hSGxHTFA1ZDJBM2JhR1JDSi9wYUcxOUExSDBlWlJ4Y1Fw?=
 =?utf-8?B?TXFoSUJCNU9ySGpCbENQb1VVTjhHODl5UUlKOVVxbFNPUkQrcXAyRU84eUVv?=
 =?utf-8?B?eHZRTEdWS3lPT1dGMG13dG5yQzRrWlhSa09ZSWd0ejlPY3BMRUJjOGRLUkFw?=
 =?utf-8?B?MHJleFM3RGxsd0tVK2d5cHo5cFUvTHJzMU8vTzVpRU5JWlQzbEJtV1FBVXFE?=
 =?utf-8?B?bG5vK0g4aTJXclEyd1JJZXBpd0hYMkJvYXFteHhWODJvdjlrbW5mY2ZFd01C?=
 =?utf-8?B?b1hQQ2pWR0xpM3BUOTNvTnc0SjNncjZKR2VUWWdXUk1VQnlKMzFlaUxwakpN?=
 =?utf-8?B?SUFpazdzMGJZaGZ2cDdXc2xpdTAzY29SL1ZGSWdVdXJJdTJVQjNwRTZlRmxW?=
 =?utf-8?B?TFJicHBOc09CZmlyM29kZ0kzM24wdUhlUlpJcDZYZW1nSHVKYTRPajFGWjd0?=
 =?utf-8?B?THdwWFFhSTZvcWgrRjFaalVxdHJvOG50Mm9jZlkzRVljSlVObEJZV2hTQ3p4?=
 =?utf-8?B?UTlEbldSaWhPYi9JaGhUU1dYRzZpVXRSVVdqenJ5RnhLK3o5azhLcnpqSTFJ?=
 =?utf-8?B?L2xsYXZFV05MNVZtTXdxZ2Q3Sy8reWFDN0RVWW9NNjNUOVFXNHJNQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56cf4ea-ca11-43f8-2c34-08da2696eab8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:38:05.2328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSo6xq+YQlGLdbM93qG9dyJ3VhSsbd5Vboxi0sDqpRnf0RaaO16IK9bKlB8dD6nUEeR6imRzjEUM5GRcJaA+rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7424

No separate feature flags exist which would control availability of
these; the only restriction is HATS (establishing the maximum number of
page table levels in general), and even that has a lower bound of 4.
Thus we can unconditionally announce 2M, 1G, and 512G mappings. (Via
non-default page sizes the implementation in principle permits arbitrary
size mappings, but these require multiple identical leaf PTEs to be
written, which isn't all that different from having to write multiple
consecutive PTEs with increasing frame numbers. IMO that's therefore
beneficial only on hardware where suitable TLBs exist; I'm unaware of
such hardware.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not fully sure about allowing 512G mappings: The scheduling-for-
freeing of intermediate page tables would take quite a while when
replacing a tree of 4k mappings by a single 512G one. Yet then again
there's no present code path via which 512G chunks of memory could be
allocated (and hence mapped) anyway, so this would only benefit huge
systems where 512 1G mappings could be re-coalesced (once suitable code
is in place) into a single L4 entry. And re-coalescing wouldn't result
in scheduling-for-freeing of full trees of lower level pagetables.
---
v4: Change type of queue_free_pt()'s 1st parameter. Re-base.
v3: Rename queue_free_pt()'s last parameter. Replace "level > 1" checks
    where possible.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -32,12 +32,13 @@ static unsigned int pfn_to_pde_idx(unsig
 }
 
 static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
-                                                   unsigned long dfn)
+                                                   unsigned long dfn,
+                                                   unsigned int level)
 {
     union amd_iommu_pte *table, *pte, old;
 
     table = map_domain_page(_mfn(l1_mfn));
-    pte = &table[pfn_to_pde_idx(dfn, 1)];
+    pte = &table[pfn_to_pde_idx(dfn, level)];
     old = *pte;
 
     write_atomic(&pte->raw, 0);
@@ -351,11 +352,32 @@ static int iommu_pde_from_dfn(struct dom
     return 0;
 }
 
+static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level)
+{
+    if ( level > 1 )
+    {
+        union amd_iommu_pte *pt = map_domain_page(mfn);
+        unsigned int i;
+
+        for ( i = 0; i < PTE_PER_TABLE_SIZE; ++i )
+            if ( pt[i].pr && pt[i].next_level )
+            {
+                ASSERT(pt[i].next_level < level);
+                queue_free_pt(hd, _mfn(pt[i].mfn), pt[i].next_level);
+            }
+
+        unmap_domain_page(pt);
+    }
+
+    iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
+}
+
 int cf_check amd_iommu_map_page(
     struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
     unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
     int rc;
     unsigned long pt_mfn = 0;
     union amd_iommu_pte old;
@@ -384,7 +406,7 @@ int cf_check amd_iommu_map_page(
         return rc;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, true) ||
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, true) ||
          !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
@@ -394,8 +416,8 @@ int cf_check amd_iommu_map_page(
         return -EFAULT;
     }
 
-    /* Install 4k mapping */
-    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), 1,
+    /* Install mapping */
+    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), level,
                                 (flags & IOMMUF_writable),
                                 (flags & IOMMUF_readable));
 
@@ -403,8 +425,13 @@ int cf_check amd_iommu_map_page(
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( old.pr )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( IOMMUF_order(flags) && old.next_level )
+            queue_free_pt(hd, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
 
@@ -413,6 +440,7 @@ int cf_check amd_iommu_unmap_page(
 {
     unsigned long pt_mfn = 0;
     struct domain_iommu *hd = dom_iommu(d);
+    unsigned int level = (order / PTE_PER_TABLE_SHIFT) + 1;
     union amd_iommu_pte old = {};
 
     spin_lock(&hd->arch.mapping_lock);
@@ -423,7 +451,7 @@ int cf_check amd_iommu_unmap_page(
         return 0;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, false) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, false) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn = %"PRI_dfn"\n",
@@ -435,14 +463,19 @@ int cf_check amd_iommu_unmap_page(
     if ( pt_mfn )
     {
         /* Mark PTE as 'page not present'. */
-        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn));
+        old = clear_iommu_pte_present(pt_mfn, dfn_x(dfn), level);
     }
 
     spin_unlock(&hd->arch.mapping_lock);
 
     if ( old.pr )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( order && old.next_level )
+            queue_free_pt(hd, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -747,7 +747,7 @@ static void cf_check amd_dump_page_table
 }
 
 static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
-    .page_sizes = PAGE_SIZE_4K,
+    .page_sizes = PAGE_SIZE_4K | PAGE_SIZE_2M | PAGE_SIZE_1G | PAGE_SIZE_512G,
     .init = amd_iommu_domain_init,
     .hwdom_init = amd_iommu_hwdom_init,
     .quarantine_init = amd_iommu_quarantine_init,
--- a/xen/include/xen/page-defs.h
+++ b/xen/include/xen/page-defs.h
@@ -21,4 +21,19 @@
 #define PAGE_MASK_64K               PAGE_MASK_GRAN(64K)
 #define PAGE_ALIGN_64K(addr)        PAGE_ALIGN_GRAN(64K, addr)
 
+#define PAGE_SHIFT_2M               21
+#define PAGE_SIZE_2M                PAGE_SIZE_GRAN(2M)
+#define PAGE_MASK_2M                PAGE_MASK_GRAN(2M)
+#define PAGE_ALIGN_2M(addr)         PAGE_ALIGN_GRAN(2M, addr)
+
+#define PAGE_SHIFT_1G               30
+#define PAGE_SIZE_1G                PAGE_SIZE_GRAN(1G)
+#define PAGE_MASK_1G                PAGE_MASK_GRAN(1G)
+#define PAGE_ALIGN_1G(addr)         PAGE_ALIGN_GRAN(1G, addr)
+
+#define PAGE_SHIFT_512G             39
+#define PAGE_SIZE_512G              PAGE_SIZE_GRAN(512G)
+#define PAGE_MASK_512G              PAGE_MASK_GRAN(512G)
+#define PAGE_ALIGN_512G(addr)       PAGE_ALIGN_GRAN(512G, addr)
+
 #endif /* __XEN_PAGE_DEFS_H__ */


