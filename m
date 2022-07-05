Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF37566E93
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:44:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361136.590467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8huQ-0002Nh-Ps; Tue, 05 Jul 2022 12:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361136.590467; Tue, 05 Jul 2022 12:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8huQ-0002Kr-MS; Tue, 05 Jul 2022 12:44:06 +0000
Received: by outflank-mailman (input) for mailman id 361136;
 Tue, 05 Jul 2022 12:44:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8huO-0002H7-Os
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:44:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60075.outbound.protection.outlook.com [40.107.6.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26652464-fc60-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 14:44:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2613.eurprd04.prod.outlook.com (2603:10a6:4:37::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:44:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:44:01 +0000
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
X-Inumbo-ID: 26652464-fc60-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DP0e7rZrhRCpGDdGkPUcMJm7//LFvtq00xoN67ERTD4+sm7HwqgrbJPnhJC1mzWleHdffkaZ4ukpWF200fzOBrSVBO5NCUdHQiwsGetu4ixQuqQOPNFO1DXbtS6MKrw6YX74e4iasejJfxL481ezOspmElto8KYAm9n2AzMBEgELn8ufGVjLYH2NAEl/ooge0cwq8nLoADzdiMZ3h5dr2QYVIpEufzUOrdgMXmLeTfAa0RDd92JsDgXcKEzEsgde265jS6EyEaZWozXlhpVpfof3px9dYkjWgU3T6t4g39fo4M1JqU3VtskSd8I/oEULai41z9kBW/P1GwYpLM4Epw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AowG0vv4ZZNfRrLvkMOzyPPLjiwpxv5SlEjEedcSkM=;
 b=cwRHCCpn2g+GY22eSdl1KDoeWZlth3nwEn9lOSW1i8cacyeUtHt03FF19sfQXup/6IVbDFUDQY1pw4CPTJlGNkilBIScpfj/MgfugVszK8HK+Ad3Cs741Qbc02E4+e4kLUyYezgGXwzomB75QuxHTM0ajnwoPK+hIXlE8qyIKivdn+qo7q/bBDizcc7eg/qEXwL71BpTs45vOQdaUV/rYiK/XAKlKMtedjQ1OPV9vJiEprk3Hi8yi/a2uHW5IRTTPDarpjvIMFPT/+cNllIEN65rtvjgyr3hSMXxVjbUZVPGEd1jQDaMlIdfIjyKfNn6iHdT2C6/YxOEHhHWbmWa8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AowG0vv4ZZNfRrLvkMOzyPPLjiwpxv5SlEjEedcSkM=;
 b=xPwpKA9I/3/V44DMvfkXIV1u+SX+PRqoxwidIKRqYdz55093yvSqcZ0X6jV2Gua2Rt/NvzPndNirqLHTzK25UqT2oLeNenPCK9zpunc5ZdA3t3yzVbbLJxyp3ltpyEJQWzHSjPuUSRyY1YnQe3aqOAbP4pRagtVxsGI26y3KMTYkvsWE8fUT/Z3Nvh1Rn1BlIPhSKP4JL4Q5CGwP9Ltbw+cCe7iEeP5+R+rA7Z0IMGrr1tRF+ZAFdijddQDU3ORbbGV+u33XS+lrTryQCztrbZQj+fq4cxCcv+VCR/9kbTzfXU3jiWNGNPyYDcFS51qFWclYDXpbPbqV6jqhCPXt+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1adca369-c911-e126-6b94-b26859a01e5f@suse.com>
Date: Tue, 5 Jul 2022 14:44:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 02/14] IOMMU/x86: perform PV Dom0 mappings in batches
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 546c4a98-d0a3-4d4c-fd25-08da5e8409a2
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2613:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fJzdYLGHY22wgJ3efnWaCWf0Uj3YR6IHvO6AY2nsugIXj1/cUBaQ94sw68P2LCUqvi2B9c3LQcfs5huFhoZ4AkY+59Z/bMexlan6WzUqfvymeTdStKM3vBCNisnTz2fkhiAjipSUSgeFXOM5+fUM7iImttQN6NYNheA2pfVNRBJgIs9p9O9VCzZ7UopTHPLl8uhYKdu+qNRxSPKyM1ZmAu9egcuR+X0S1MT8WwuhWvGjWBArtJcxna1sP9xOJdUwxfLhIusKS9f9v9HRTf6tjQ1LUJvp84ZUvMRlGI7ohnRrv/h4w9lMlyzX0orZUAcLcwk7Qy90h1kDkJYCZyKgn8x+MuLPvC/ciJ9TDDqNMwWUOyl4vyPokUSCdWkW7mvN2uDlGierYtZNr4vDqA4WaYgpzyWYooDOkjaxezs0LbJGyIHdW5ys3Lm2p90pw+ir15kzSXfa30XPzBFX356ZpOOKrXZRPjz3gOhDL0UcOJ0bGT+P0IA5YPR6v1qstDPZzB+TMl78uq7RzMGEV0pBdX+4iW+pRi63ArmkW6OATMEgNGbkSUISvkO7troBbbn3wXHi8Jy8nDpnAoMb1UImfxSNAxMdfkXoMDDAhPRcK2eA1GIfSvJWLN3XTb5Ds43yCOiNJLWaoM51a5tj3879WuvPmFFL12CLCzcRX1V2KvI2dkAl/ZhPH1MTqZnwT9VqBifsLz1IRkGRP3/3DkmgkeAPImF1YMbONuqjY2kJZ4gIIFCmI0VwVUqYRuydPtLZh3+4N98Jpy1lw8Y95UxZXEpqY2QYD3SDpumpZQGeKhKClNdftIRKZcxyYDYO6x1mZPzZg4GfX7/1a74bAudVeQ8NH4fkD//oKPWXvhXs5t0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(396003)(366004)(39860400002)(346002)(8936002)(31696002)(38100700002)(6486002)(478600001)(86362001)(66946007)(4326008)(6512007)(8676002)(66476007)(30864003)(66556008)(5660300002)(2616005)(26005)(186003)(36756003)(316002)(6916009)(31686004)(54906003)(6506007)(41300700001)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VS9KSC90cVRPRllXZGxxS0xNTTh1Slp6Vm95MllJdi85ZFNSL21NWHRpU3B4?=
 =?utf-8?B?bjd4Sk8rb1V2L1F6YmlDWFNieXZkMk5rUnNCb2Y1NVB3dHRXT25xZDlGN25K?=
 =?utf-8?B?bkxUemZmblN4OHVZdEtIemdMZmNWMnZDdEljazZaSnVkaFFzaGdQY2hJWlI5?=
 =?utf-8?B?c0VyaGFHaHl6alBsTzI1VTRrVXRObG4wc1pHT0pxczcyVXNiRitiMFVhUkE3?=
 =?utf-8?B?Qjh4TFgrVjBBNTZJZ21DTExmNWJ4TjUyb1YxeEhsYlR4MVRMTGZHeVZGaGNT?=
 =?utf-8?B?Z3I3R0xTTkt2MTdXOG52MWNMN0RSK0JDKzBSNDdHdzJyOEw0dEkvSys0ZkI5?=
 =?utf-8?B?TTA0L1VJb0RsdXp2SmoxTEhLM2VheFRLZ3cwY0tCUitsa240amt5NnRpMDI3?=
 =?utf-8?B?dWRaTTJ4bklCb3JjYmpPd2FTeVRTNk40TzJtWG9QR2hhTzFNcUFLOG1UcDZV?=
 =?utf-8?B?NzhVMS9XemRBMzc2RFZMRE5MRGNzckJBSVoxbnVXTTlUaHFMNTlRbkMzTFJM?=
 =?utf-8?B?L2xpSUUwRmNoZFkxcEYzTjBjU2IrREdrQU1QWUtmVEw0TGVwV1FMeURVMlVh?=
 =?utf-8?B?cVhVb0s3NStWYjFydmJ0ZnBrVDlMVElYV2VvVU1IcXJhaEpHZEJGK3h2a1kr?=
 =?utf-8?B?S3FtbXkydVRTejMwR0VLTkxtZjVHd21USWtaUlZzS3l6Y2lpVnE5TXowT0JT?=
 =?utf-8?B?aU12cVpwd1VjVy9VVVdIc1VlMTQ4amYzZkdMalRLcWk4UHZiSkR1MTV1SkMw?=
 =?utf-8?B?TkdySkY0VFQ3djJnbFAybHljcW9ucEhKOFl6WldjMDNOS0NCWHlhcm9DOC85?=
 =?utf-8?B?cTVZS00vQ25SU280Q0JCcmF0bkZlcEFWYy9GbTlORzl4anJ1QXVWNENhajB2?=
 =?utf-8?B?Mk1YbWY3ejd1a3dnSUJYOCtMblVpUXNFdGJmTXkzbXR1bys2UlM4OW4rbkV5?=
 =?utf-8?B?U2FIZlJjYWMyMldqVTNNNGVEdWN6d1dYNldOTXJ5TFVyR3ppRGtCYWRCS0h6?=
 =?utf-8?B?eFBibGJVUElpcWVtWEwwQ3NpY1JSN0h5NGZ6YzJHK1MyOTg3K1FwWmVsYVpj?=
 =?utf-8?B?Z0xkVFlQdUZUeWpvOFlJdXA5czl1aCtKMzZJdXhRdDlWM1IwWEkxUUl5NFhU?=
 =?utf-8?B?b3FtQmhoN3dpR0pPbUs3MUd5cHVXaDF2OEIrZTFiWDJtU0dUM3JjTWhld3lG?=
 =?utf-8?B?aFFaMXJQaGZlclJtRFpsS00wRlN5Qi8rMW1JbVBkMElSRlFNRmNSWHhXWmk1?=
 =?utf-8?B?QlpsZ2ptaFozL1lJMU9kNkh6TzVYMncvbUtSWXpCRW1GZ2JrcUlGdFJlMEla?=
 =?utf-8?B?aE1nTmN3Y3BDbjdUNFdXdkpiWGxVT2xmRDl2MUtRSW44Zkd2VUNRdXlFMzVK?=
 =?utf-8?B?Tlp3WHdvL0V4V2hRM0FYOHNJTE44RVRtSEtmb1RGUkxrNk1xRlUvdVNyaFFz?=
 =?utf-8?B?cDhQdjk1eGlqaHdWVytDaEtGQThqUUh0OTZHSjdmdzYrZ3doMXJ3eE0zZXhi?=
 =?utf-8?B?akM5YVBpZDR0Z2tPQXB4Z0NndndULzJFRVdlU2JPRUxnaVNnODRObzlKSDJr?=
 =?utf-8?B?QnhVc0huTjM3VU9RTVpNZ29iSGVCSURqNm9oQUJPQXVXZnlmZGExR1JoMFpY?=
 =?utf-8?B?UFRBcWVGekJSdjB2Z0prQ2FkRW5JTW1QM21mNlErTStQcDhXeU1LVmwwMk9K?=
 =?utf-8?B?NHZ3emRjaExjNzQ2R3EyK3dBVk1vcytWSkhJZmp6MHV0UDI2UGhETTFUbXpj?=
 =?utf-8?B?KzVrTTdxRE9JbXpDaTg2dXBwbk1wem45QkxxMzZPTnYwS0czNzlZaE03Rzk1?=
 =?utf-8?B?OW5yUkpJOCtVRk1hMWwzWlZMZFV4NG43dHlzSVBoaHJZblI1R3JXcEJ3YlVm?=
 =?utf-8?B?ZWU2NWNMR2xqeksxdmI5NWM2SlM5L3ovbkdIUWV6U0FVdFVoN1BwaXFIa21F?=
 =?utf-8?B?bDRVeUhodk96ODNTSDQrTVFRRzYwcUN4QkNBNG9Oc2RreGZ1YzBOL2d6WGpa?=
 =?utf-8?B?eHZHdTZLWGdWQU9xcnA1V3lZQ1BXL3NPMzc0SU9kZndycVRob0NaOUprVUtH?=
 =?utf-8?B?S3kyb0xuVGpXQmRRMGZyVUdydHZ1VXFBS0ZieDc2aXJoRHpKbHZ4aXN0VmUr?=
 =?utf-8?Q?FmstIF5GipGjHA+s/Y0FG8J/o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546c4a98-d0a3-4d4c-fd25-08da5e8409a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:44:01.7967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sdn3wX+chzf50tOWYiG8qt9PdG0wIbEkUfMg9YIjzyrExDYincqxARlo06dVzmyQWdc61CNVuBwxX3EKRZD3/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2613

For large page mappings to be easily usable (i.e. in particular without
un-shattering of smaller page mappings) and for mapping operations to
then also be more efficient, pass batches of Dom0 memory to iommu_map().
In dom0_construct_pv() and its helpers (covering strict mode) this
additionally requires establishing the type of those pages (albeit with
zero type references).

The earlier establishing of PGT_writable_page | PGT_validated requires
the existing places where this gets done (through get_page_and_type())
to be updated: For pages which actually have a mapping, the type
refcount needs to be 1.

There is actually a related bug that gets fixed here as a side effect:
Typically the last L1 table would get marked as such only after
get_page_and_type(..., PGT_writable_page). While this is fine as far as
refcounting goes, the page did remain mapped in the IOMMU in this case
(when "iommu=dom0-strict").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Subsequently p2m_add_identity_entry() may want to also gain an order
parameter, for arch_iommu_hwdom_init() to use. While this only affects
non-RAM regions, systems typically have 2-16Mb of reserved space
immediately below 4Gb, which hence could be mapped more efficiently.

Eventually we may want to overhaul this logic to use a rangeset based
approach instead, punching holes into originally uniformly large-page-
mapped regions. Doing so right here would first and foremost be yet more
of a change.

The installing of zero-ref writable types has in fact shown (observed
while putting together the change) that despite the intention by the
XSA-288 changes (affecting DomU-s only) for Dom0 a number of
sufficiently ordinary pages (at the very least initrd and P2M ones as
well as pages that are part of the initial allocation but not part of
the initial mapping) still have been starting out as PGT_none, meaning
that they would have gained IOMMU mappings only the first time these
pages would get mapped writably. Consequently an open question is
whether iommu_memory_setup() should set the pages to PGT_writable_page
independent of need_iommu_pt_sync().

I didn't think I need to address the bug mentioned in the description in
a separate (prereq) patch, but if others disagree I could certainly
break out that part (needing to first use iommu_legacy_unmap() then).

Note that 4k P2M pages don't get (pre-)mapped in setup_pv_physmap():
They'll end up mapped via the later get_page_and_type().

As to the way these refs get installed: I've chosen to avoid the more
expensive {get,put}_page_and_type(), favoring to put in place the
intended type directly. I guess I could be convinced to avoid this
bypassing of the actual logic; I merely think it's unnecessarily
expensive.

Note also that strictly speaking the iommu_iotlb_flush_all() here (as
well as the pre-existing one in arch_iommu_hwdom_init()) shouldn't be
needed: Actual hooking up (AMD) or enabling of translation (VT-d)
occurs only afterwards anyway, so nothing can have made it into TLBs
just yet.
---
v7: Restore after the prior verson having been reverted. Use preemption
    when calling iommu_map(). Correct log message in
    arch_iommu_hwdom_init().
v3: Fold iommu_map() into (the now renamed) iommu_memory_setup(). Move
    iommu_unmap() into mark_pv_pt_pages_rdonly(). Adjust (split) log
    message in arch_iommu_hwdom_init().

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -46,7 +46,8 @@ void __init dom0_update_physmap(bool com
 static __init void mark_pv_pt_pages_rdonly(struct domain *d,
                                            l4_pgentry_t *l4start,
                                            unsigned long vpt_start,
-                                           unsigned long nr_pt_pages)
+                                           unsigned long nr_pt_pages,
+                                           unsigned int *flush_flags)
 {
     unsigned long count;
     struct page_info *page;
@@ -71,6 +72,14 @@ static __init void mark_pv_pt_pages_rdon
         ASSERT((page->u.inuse.type_info & PGT_type_mask) <= PGT_root_page_table);
         ASSERT(!(page->u.inuse.type_info & ~(PGT_type_mask | PGT_pae_xen_l2)));
 
+        /*
+         * Page table pages need to be removed from the IOMMU again in case
+         * iommu_memory_setup() ended up mapping them.
+         */
+        if ( need_iommu_pt_sync(d) &&
+             iommu_unmap(d, _dfn(mfn_x(page_to_mfn(page))), 1, 0, flush_flags) )
+            BUG();
+
         /* Read-only mapping + PGC_allocated + page-table page. */
         page->count_info         = PGC_allocated | 3;
         page->u.inuse.type_info |= PGT_validated | 1;
@@ -107,11 +116,56 @@ static __init void mark_pv_pt_pages_rdon
     unmap_domain_page(pl3e);
 }
 
+static void __init iommu_memory_setup(struct domain *d, const char *what,
+                                      struct page_info *page, unsigned long nr,
+                                      unsigned int *flush_flags)
+{
+    long rc;
+    mfn_t mfn = page_to_mfn(page);
+
+    if ( !need_iommu_pt_sync(d) )
+        return;
+
+    while ( (rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn, nr,
+                            IOMMUF_readable | IOMMUF_writable | IOMMUF_preempt,
+                            flush_flags)) > 0 )
+    {
+        mfn_add(mfn, rc);
+        nr -= rc;
+        /* See comment below. */
+        for ( ; rc--; ++page )
+        {
+            ASSERT(!page->u.inuse.type_info);
+            page->u.inuse.type_info = PGT_writable_page | PGT_validated;
+        }
+        process_pending_softirqs();
+    }
+    if ( rc )
+    {
+        printk(XENLOG_ERR
+               "pre-mapping %s MFN [%lx,%lx) into IOMMU failed: %ld\n",
+               what, mfn_x(mfn), mfn_x(mfn) + nr, rc);
+        return;
+    }
+
+    /*
+     * For successfully established IOMMU mappings the type of the page(s)
+     * needs to match (for _get_page_type() to unmap upon type change). Set
+     * the page(s) to writable with no type ref.
+     */
+    for ( ; nr--; ++page )
+    {
+        ASSERT(!page->u.inuse.type_info);
+        page->u.inuse.type_info = PGT_writable_page | PGT_validated;
+    }
+}
+
 static __init void setup_pv_physmap(struct domain *d, unsigned long pgtbl_pfn,
                                     unsigned long v_start, unsigned long v_end,
                                     unsigned long vphysmap_start,
                                     unsigned long vphysmap_end,
-                                    unsigned long nr_pages)
+                                    unsigned long nr_pages,
+                                    unsigned int *flush_flags)
 {
     struct page_info *page = NULL;
     l4_pgentry_t *pl4e, *l4start = map_domain_page(_mfn(pgtbl_pfn));
@@ -177,6 +231,10 @@ static __init void setup_pv_physmap(stru
                                              L3_PAGETABLE_SHIFT - PAGE_SHIFT,
                                              MEMF_no_scrub)) != NULL )
             {
+                iommu_memory_setup(d, "P2M 1G", page,
+                                   SUPERPAGE_PAGES * SUPERPAGE_PAGES,
+                                   flush_flags);
+
                 *pl3e = l3e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
                 vphysmap_start += 1UL << L3_PAGETABLE_SHIFT;
                 continue;
@@ -203,6 +261,9 @@ static __init void setup_pv_physmap(stru
                                              L2_PAGETABLE_SHIFT - PAGE_SHIFT,
                                              MEMF_no_scrub)) != NULL )
             {
+                iommu_memory_setup(d, "P2M 2M", page, SUPERPAGE_PAGES,
+                                   flush_flags);
+
                 *pl2e = l2e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
                 vphysmap_start += 1UL << L2_PAGETABLE_SHIFT;
                 continue;
@@ -311,6 +372,7 @@ int __init dom0_construct_pv(struct doma
     unsigned long initrd_pfn = -1, initrd_mfn = 0;
     unsigned long count;
     struct page_info *page = NULL;
+    unsigned int flush_flags = 0;
     start_info_t *si;
     struct vcpu *v = d->vcpu[0];
     void *image_base = bootstrap_map(image);
@@ -573,6 +635,9 @@ int __init dom0_construct_pv(struct doma
                     BUG();
         }
         initrd->mod_end = 0;
+
+        iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
+                           PFN_UP(initrd_len), &flush_flags);
     }
 
     printk("PHYSICAL MEMORY ARRANGEMENT:\n"
@@ -606,6 +671,13 @@ int __init dom0_construct_pv(struct doma
 
     process_pending_softirqs();
 
+    /*
+     * Map the full range here and then punch holes for page tables
+     * alongside marking them as such in mark_pv_pt_pages_rdonly().
+     */
+    iommu_memory_setup(d, "init-alloc", mfn_to_page(_mfn(alloc_spfn)),
+                       alloc_epfn - alloc_spfn, &flush_flags);
+
     mpt_alloc = (vpt_start - v_start) + pfn_to_paddr(alloc_spfn);
     if ( vinitrd_start )
         mpt_alloc -= PAGE_ALIGN(initrd_len);
@@ -690,7 +762,8 @@ int __init dom0_construct_pv(struct doma
         l1tab++;
 
         page = mfn_to_page(_mfn(mfn));
-        if ( !page->u.inuse.type_info &&
+        if ( (!page->u.inuse.type_info ||
+              page->u.inuse.type_info == (PGT_writable_page | PGT_validated)) &&
              !get_page_and_type(page, d, PGT_writable_page) )
             BUG();
     }
@@ -719,7 +792,7 @@ int __init dom0_construct_pv(struct doma
     }
 
     /* Pages that are part of page tables must be read only. */
-    mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages);
+    mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages, &flush_flags);
 
     /* Mask all upcalls... */
     for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
@@ -794,7 +867,7 @@ int __init dom0_construct_pv(struct doma
     {
         pfn = pagetable_get_pfn(v->arch.guest_table);
         setup_pv_physmap(d, pfn, v_start, v_end, vphysmap_start, vphysmap_end,
-                         nr_pages);
+                         nr_pages, &flush_flags);
     }
 
     /* Write the phys->machine and machine->phys table entries. */
@@ -825,7 +898,9 @@ int __init dom0_construct_pv(struct doma
         if ( get_gpfn_from_mfn(mfn) >= count )
         {
             BUG_ON(compat);
-            if ( !page->u.inuse.type_info &&
+            if ( (!page->u.inuse.type_info ||
+                  page->u.inuse.type_info == (PGT_writable_page |
+                                              PGT_validated)) &&
                  !get_page_and_type(page, d, PGT_writable_page) )
                 BUG();
 
@@ -841,8 +916,12 @@ int __init dom0_construct_pv(struct doma
 #endif
     while ( pfn < nr_pages )
     {
-        if ( (page = alloc_chunk(d, nr_pages - domain_tot_pages(d))) == NULL )
+        count = domain_tot_pages(d);
+        if ( (page = alloc_chunk(d, nr_pages - count)) == NULL )
             panic("Not enough RAM for DOM0 reservation\n");
+
+        iommu_memory_setup(d, "chunk", page, domain_tot_pages(d) - count,
+                           &flush_flags);
         while ( pfn < domain_tot_pages(d) )
         {
             mfn = mfn_x(page_to_mfn(page));
@@ -857,6 +936,10 @@ int __init dom0_construct_pv(struct doma
         }
     }
 
+    /* Use while() to avoid compiler warning. */
+    while ( iommu_iotlb_flush_all(d, flush_flags) )
+        break;
+
     if ( initrd_len != 0 )
     {
         si->mod_start = vinitrd_start ?: initrd_pfn;
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -348,8 +348,8 @@ static unsigned int __hwdom_init hwdom_i
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
-    unsigned long i, top, max_pfn;
-    unsigned int flush_flags = 0;
+    unsigned long i, top, max_pfn, start, count;
+    unsigned int flush_flags = 0, start_perms = 0;
 
     BUG_ON(!is_hardware_domain(d));
 
@@ -380,31 +380,57 @@ void __hwdom_init arch_iommu_hwdom_init(
      * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
      * setting up potentially conflicting mappings here.
      */
-    i = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
+    start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
 
-    for ( ; i < top; i++ )
+    for ( i = start, count = 0; i < top; )
     {
         unsigned long pfn = pdx_to_pfn(i);
         unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
-        int rc;
 
         if ( !perms )
-            rc = 0;
+            /* nothing */;
         else if ( paging_mode_translate(d) )
+        {
+            int rc;
+
             rc = p2m_add_identity_entry(d, pfn,
                                         perms & IOMMUF_writable ? p2m_access_rw
                                                                 : p2m_access_r,
                                         0);
-        else
-            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
-                           perms, &flush_flags);
+            if ( rc )
+                printk(XENLOG_WARNING
+                       "%pd: identity mapping of %lx failed: %d\n",
+                       d, pfn, rc);
+        }
+        else if ( pfn != start + count || perms != start_perms )
+        {
+            long rc;
 
-        if ( rc )
-            printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",
-                   d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, rc);
+        commit:
+            while ( (rc = iommu_map(d, _dfn(start), _mfn(start), count,
+                                    start_perms | IOMMUF_preempt,
+                                    &flush_flags)) > 0 )
+            {
+                start += rc;
+                count -= rc;
+                process_pending_softirqs();
+            }
+            if ( rc )
+                printk(XENLOG_WARNING
+                       "%pd: IOMMU identity mapping of [%lx,%lx) failed: %ld\n",
+                       d, start, start + count, rc);
+            start = pfn;
+            count = 1;
+            start_perms = perms;
+        }
+        else
+            ++count;
 
-        if (!(i & 0xfffff))
+        if ( !(++i & 0xfffff) )
             process_pending_softirqs();
+
+        if ( i == top && count )
+            goto commit;
     }
 
     /* Use if to avoid compiler warning */


