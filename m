Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4641489D89
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:29:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255430.437705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xXM-000786-LT; Mon, 10 Jan 2022 16:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255430.437705; Mon, 10 Jan 2022 16:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xXM-00075f-HL; Mon, 10 Jan 2022 16:28:48 +0000
Received: by outflank-mailman (input) for mailman id 255430;
 Mon, 10 Jan 2022 16:28:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xXL-0005qR-0j
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:28:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61c9a03a-7232-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:28:45 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-kDUnx-HLM6OBvod1bb-_mg-1; Mon, 10 Jan 2022 17:28:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 16:28:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:28:42 +0000
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
X-Inumbo-ID: 61c9a03a-7232-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5hi6MW7tZB8RG4/CY0mA+kY6id7QquTQlMhD0Ew0kzk=;
	b=QFmT3Ct0CKPFsUVYnbNoXiecmcJLS9H2xscI36XjPUrbLPUE6wTHY/aDq19GZB6J9L906B
	431Wd5XLZgVSBw/U8CqaZfKXG2EGQsD2DSB2gmXkdwQFey1/O14ckInUeMHs6O8/snJBqt
	LcBIDDYDM+RejcGUdRO6QrhKmIaFOWU=
X-MC-Unique: kDUnx-HLM6OBvod1bb-_mg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZmBUi07ej4AOCk6jRuhzsWplw2QS1Wea1xIoRtJdiklUgUJLFZqlHaAQ+ynsjoRNm0ScJ6ZO12eHbGxRLIDmldQT2A3Oqf61ilwPFe1myl3V+MDDaRPeig5oId21tQmdVgx9XBGGnnZjdo5mAUBkjGHf4CbEddxY4oVELO9CRuDHFJg/DlBGHUtEju9NtLVlNtU452C+R0pvCATovjYJRxp7LwY0S5H0C9LjqyFkFc9oJccRfpX6Em+MhZY3UJ0JJhQLN5jSmlP6MBOu7NOPKu+00Kr/rRWIzm/ZtBW6/dkAd2NAb3Yxg81JSNbMKf1AXQLa7hE2BV8aFPbEaGQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hi6MW7tZB8RG4/CY0mA+kY6id7QquTQlMhD0Ew0kzk=;
 b=Ddw9s9H3NwKkPgxjoPTTL+O+VVHLXnANuU5JD2ODt00b0KeiwrL6gzDvUTk1DVFz0ImmQqV7v/yKNtXviDY/M8qExg9civCTINjDncnALCh4OS4j/hZTUm6mpn7KYQiTkQ5+U/1x9QLbKiK/OXBT2DhVjeMTrROTFsuNzJpko1tyVmLg9oSCSLNMkEJGcSlDdW6R4mhsqx7VmfAOxm6hRXAhPDWzGVzjAwJEzLsqVeufG2kh1p7LEx6eGuqvpnmqizjYA3jk7sNm6GnGal0msLdEAdWVejQZE/vEAy57eUXDE16GKds6yFflAH+H9Hig6+/Mxnne0fPwyd/wX7pFcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f62ece15-6f69-4533-e86a-28596ffc9f4d@suse.com>
Date: Mon, 10 Jan 2022 17:28:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 09/23] IOMMU/x86: perform PV Dom0 mappings in batches
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0030.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 338889dc-5e56-4720-9338-08d9d45643dc
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB516523B25B94B4209B3ABBCAB3509@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:416;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q4/9iMfqICe61nIegs/HSp3ra0tkIN0ttyf8tp7QZqG6dK9PmbNQulVr+HVO74usekonuJAPmeBlaJNlaBPDun44dwiQNvlClNORNQotzUvOdp0b6DYiGWGkr1TbaQkxVrgPsS32JfFitFSkkuCMMBZoDTKTg+EnblnwrVbEseQ+r6qswzYW46ge0pf2RSP+7iaBO0m9iV/ISQbsO/cTWIIga7gxbBTttc1evO3hBmugehzmJ9BabAONb4zJxeiv2cFkiloaAbAzIqfiBDmNVEcGasoI0omTw/pEnMnE8hGM0LMTnoiwP621kZV0j/LS2nLHmKX8ZzKIKHRZbHh2JoyWFHT1WEhs/94etZqx0AI+DnHQQAQkMYdjsQpbTSxZyzaSAMaa/mLXjjZXjTjfzFZOomUXXTfKjZciwFK8FWR9xSqo5heR7vNZWNrvvTsr6QzpHqPXNnVcDRYOsUHmahxgKBJrCtTarrG7bgQFmecpHFoF57SjvR6qAdTBebMlo4R+OPdxDJMyRlEK+28HkfcdrQlAXELSY6n6QXbFMBXb/3atA7qvbLpIaJAjD973O9nteU0lhxVjQTzSoi83lf4lRE1Bkax55Os9oTEOZ5+dI0mSOMraFwtQYwFMVnbEv6wQCDL5o0G1nJcAynWFW6/GcUy3Y+YDzifOdoo8IjEf3lPjZkpWvR76WOVkT0Zef9SdMJsdznu2DYUnurMU6AXf7KBSBepMWy3cZifiFbBTm4YFRK8oAs5D2wqrMAll
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(508600001)(6506007)(26005)(5660300002)(8676002)(83380400001)(38100700002)(2906002)(8936002)(6916009)(66476007)(30864003)(2616005)(186003)(66946007)(54906003)(86362001)(6486002)(31696002)(36756003)(66556008)(31686004)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkxKWWhqbkVCSnFaVk1SREcrL3Y1YjcwdktWTzRJWGpEeitzTXA0b0gvRXVM?=
 =?utf-8?B?OC9TbDBQZTNQSDUrL2xNbU9RTFRjT0xpcTE5L2R5dUlBdGs2MWN1aGUwdFhS?=
 =?utf-8?B?U0tka0tSckNYWjZFRCtKY0tmWWJsWTVoZGl3dWgwZTVWNG5peFhIazV3TGl1?=
 =?utf-8?B?Nm1sV2ZBZmg2TjV5bGVaMFp6WjJJdjFyOEd3RzVCSStJSklnY3R1VUJwUHJx?=
 =?utf-8?B?ak14MCtDUGlsRXVPaTVweVh4a1JTT0xLUzVJekJDaDFRUFVLQ2VHYnArbGtX?=
 =?utf-8?B?d3RQVGE2OGJBelVQalFMcWoxT3E0V2JBL1Z0WlFIbTZJdlYwU2FyRVlUOFlQ?=
 =?utf-8?B?RC9LL2xGcHF0c2xZN2plbHFWditIdmpZeVQ5Z053blBQWEJXYWlnam9BeXM1?=
 =?utf-8?B?QWcxUjZURSsrZnZHUlVCdjkzbzFmUHFlNUE4SGR0bVRkK205b1lodk5WUFhX?=
 =?utf-8?B?d0lza0t5QUJRWXc5MDFtNE5RM1Y2QkFEVng0NVdVa29WbmlJUUcxQkJycWxp?=
 =?utf-8?B?bCtDSkRCQ0kzaU1ZTlNwTUFrOXBtWFFvTzN3MGc2M21Pa3dYSUh6N1JlTHVu?=
 =?utf-8?B?ekpZMlNuOTRFUzNWZzZCTnd0RWg2bkpXQVZUYlpsSjVjd1lITG9SMGttL28x?=
 =?utf-8?B?dGZPcnNIZ3pzaGFlVENmd2tpZmtTaUs5SDNpMHlGelVZRTZlcnhsU1pjNmZY?=
 =?utf-8?B?bHNHTDNrM01qSkw1NW5ha2JTSkVxcGpBZGcwbjZya09HWUVudXVQQ1VMWEVz?=
 =?utf-8?B?UUxCUDkyVEdCa2RvQ3Y1YUhSSTBHKytocDlkTlFxazg4dU1Cd1FaK0o4WWJR?=
 =?utf-8?B?eDRONTNEQ3dhdWZYZlVBeVUvVHFqaVhUVHh0dVdlUUlIYzBKb0tET0ZGOWhE?=
 =?utf-8?B?Zm9kZmtUckp2cktuUnVHWENZM2FIN0RHRy9laW5OVUV3UHN6NEtyTElCVXVo?=
 =?utf-8?B?b0ZHaER6cWRRQmJHWWFNb20xQmtMejZFbnV4YVVHRWpGSkNwWWNwb0dNKytq?=
 =?utf-8?B?RGd2TmR1bzFpdjVrSjdBempib0Z3cXhIZzc4V2VOQVZaZ3l6RS85VzFqUWRi?=
 =?utf-8?B?cTlEQmpKN1J0akFxcXNHMDc2U0M3NHlzTDJkcjBkVUQxZ2RDZWFhdzMzQzU0?=
 =?utf-8?B?N3hBSkQxODduRTRQZEtnbTNMQ01DaTFCZkdHUXRjM3p0SE1mc25UbS9tYk1L?=
 =?utf-8?B?SXZaaXJRRnJDemxkRTVDYU5QMU85YytrOHNSTm1iTTViTlhQSGcrbHRhbUE2?=
 =?utf-8?B?WUt6YjZuWVo4RUVWU2FHMldwdFpXejBjK0VrbVUxbXprY0ZhQm9FK2tGSU8w?=
 =?utf-8?B?SGI3TmVqL3JPNEJsU3N3SHQxeUZYdWJQd1BGN0RWbDdCWkw0cmhnQjZmYVFO?=
 =?utf-8?B?Z0FjQVUzNmxVMEhnaGpSKzNNRTN2N0YzQVgwUm96WEs0UWQwUWMyVytjN0pa?=
 =?utf-8?B?UjYrLzRGWGRqa1lKcWQyZld5dWtzOC93YlQ2WUFtcmNIZ2ZIRjVZS3JubndO?=
 =?utf-8?B?b0Z3aWZKMGVHMEZ5SXVtWjN0UExyWkIzZlZNd1ZZdXIrV01tbG9zc0YwckMw?=
 =?utf-8?B?blcvOGMzTUVSWnQ4ckthbFFWTUNFL3gzeWhBZmMyZ0h6OUxUYjJoWTMxOENu?=
 =?utf-8?B?eVRhSXRvdTVLTldSSGlQTkszVXA3andBRDJVdUM0dGV6dC9hZU9sUXZYTmFj?=
 =?utf-8?B?TElOTlNQQVV0cFhWcmFxSFptTmpsNG9QUWNrTW1ZQlROTGZLdTI5emJ0d1pr?=
 =?utf-8?B?RTVSdW9VeXRrcXljK3NtN2F1cFFwd3plYys3SDFrNk9UMUo0VW00d3IxMWtm?=
 =?utf-8?B?dE9LRUxsNEVKMjRTdjZyN25UOTNncEk1bktJeHJKZ200Y3E4cy90bHdEYURZ?=
 =?utf-8?B?TTZRQXJZSitiOERWRzdEWjlteVArS3cxZ1A3aVBUek53OHFlMS9uejhYVCtU?=
 =?utf-8?B?YllLYzhoMk12cHE2VGZndTRwNzJxOUo2Z1AvYnVkTGtyK0ZyMW9FYUNFVFBx?=
 =?utf-8?B?cWRycnM1c09CQ0wya3hLd0pPMFppcllpdWJSMUJnM3M3bDZFWXVwN2tRUG9Z?=
 =?utf-8?B?NnRhUEFkWjB1NFduOXhiN29md3k0ektlR3pOVk9JeHRFakJaSGtleXdYaGdk?=
 =?utf-8?B?by9zTGFtQ3lsaEhWUVJONkkyS2h1djJITlFCeW5DaUR5Um5US0tkYUpMbjZY?=
 =?utf-8?Q?848DFpq1A8x+xFl367ow/iA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338889dc-5e56-4720-9338-08d9d45643dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:28:42.1270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pu24Dy7HunUixMNH26tQhFVLyPNkYBvcRGab7X0AwVGiXmRjSb9XSvEGD2jLHm5h/vzJiYUPe+XMQ1lZ8E8BuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

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
Subsequently set_identity_p2m_entry() may want to also gain an order
parameter, for arch_iommu_hwdom_init() to use. While this only affects
non-RAM regions, systems typically have 2-16Mb of reserved space
immediately below 4Gb, which hence could be mapped more efficiently.

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
+             iommu_unmap(d, _dfn(mfn_x(page_to_mfn(page))), 1, flush_flags) )
+            BUG();
+
         /* Read-only mapping + PGC_allocated + page-table page. */
         page->count_info         = PGC_allocated | 3;
         page->u.inuse.type_info |= PGT_validated | 1;
@@ -107,11 +116,43 @@ static __init void mark_pv_pt_pages_rdon
     unmap_domain_page(pl3e);
 }
 
+static void __init iommu_memory_setup(struct domain *d, const char *what,
+                                      struct page_info *page, unsigned long nr,
+                                      unsigned int *flush_flags)
+{
+    int rc;
+    mfn_t mfn = page_to_mfn(page);
+
+    if ( !need_iommu_pt_sync(d) )
+        return;
+
+    rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn, nr,
+                   IOMMUF_readable | IOMMUF_writable, flush_flags);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "pre-mapping %s MFN [%lx,%lx) into IOMMU failed: %d\n",
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
@@ -177,6 +218,10 @@ static __init void setup_pv_physmap(stru
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
@@ -203,6 +248,9 @@ static __init void setup_pv_physmap(stru
                                              L2_PAGETABLE_SHIFT - PAGE_SHIFT,
                                              MEMF_no_scrub)) != NULL )
             {
+                iommu_memory_setup(d, "P2M 2M", page, SUPERPAGE_PAGES,
+                                   flush_flags);
+
                 *pl2e = l2e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
                 vphysmap_start += 1UL << L2_PAGETABLE_SHIFT;
                 continue;
@@ -311,6 +359,7 @@ int __init dom0_construct_pv(struct doma
     unsigned long initrd_pfn = -1, initrd_mfn = 0;
     unsigned long count;
     struct page_info *page = NULL;
+    unsigned int flush_flags = 0;
     start_info_t *si;
     struct vcpu *v = d->vcpu[0];
     void *image_base = bootstrap_map(image);
@@ -573,6 +622,9 @@ int __init dom0_construct_pv(struct doma
                     BUG();
         }
         initrd->mod_end = 0;
+
+        iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
+                           PFN_UP(initrd_len), &flush_flags);
     }
 
     printk("PHYSICAL MEMORY ARRANGEMENT:\n"
@@ -606,6 +658,13 @@ int __init dom0_construct_pv(struct doma
 
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
@@ -690,7 +749,8 @@ int __init dom0_construct_pv(struct doma
         l1tab++;
 
         page = mfn_to_page(_mfn(mfn));
-        if ( !page->u.inuse.type_info &&
+        if ( (!page->u.inuse.type_info ||
+              page->u.inuse.type_info == (PGT_writable_page | PGT_validated)) &&
              !get_page_and_type(page, d, PGT_writable_page) )
             BUG();
     }
@@ -719,7 +779,7 @@ int __init dom0_construct_pv(struct doma
     }
 
     /* Pages that are part of page tables must be read only. */
-    mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages);
+    mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages, &flush_flags);
 
     /* Mask all upcalls... */
     for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
@@ -794,7 +854,7 @@ int __init dom0_construct_pv(struct doma
     {
         pfn = pagetable_get_pfn(v->arch.guest_table);
         setup_pv_physmap(d, pfn, v_start, v_end, vphysmap_start, vphysmap_end,
-                         nr_pages);
+                         nr_pages, &flush_flags);
     }
 
     /* Write the phys->machine and machine->phys table entries. */
@@ -825,7 +885,9 @@ int __init dom0_construct_pv(struct doma
         if ( get_gpfn_from_mfn(mfn) >= count )
         {
             BUG_ON(compat);
-            if ( !page->u.inuse.type_info &&
+            if ( (!page->u.inuse.type_info ||
+                  page->u.inuse.type_info == (PGT_writable_page |
+                                              PGT_validated)) &&
                  !get_page_and_type(page, d, PGT_writable_page) )
                 BUG();
 
@@ -841,8 +903,12 @@ int __init dom0_construct_pv(struct doma
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
@@ -857,6 +923,10 @@ int __init dom0_construct_pv(struct doma
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
@@ -346,8 +346,8 @@ static unsigned int __hwdom_init hwdom_i
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
-    unsigned long i, top, max_pfn;
-    unsigned int flush_flags = 0;
+    unsigned long i, top, max_pfn, start, count;
+    unsigned int flush_flags = 0, start_perms = 0;
 
     BUG_ON(!is_hardware_domain(d));
 
@@ -378,9 +378,9 @@ void __hwdom_init arch_iommu_hwdom_init(
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
@@ -389,20 +389,41 @@ void __hwdom_init arch_iommu_hwdom_init(
         if ( !perms )
             rc = 0;
         else if ( paging_mode_translate(d) )
+        {
             rc = set_identity_p2m_entry(d, pfn,
                                         perms & IOMMUF_writable ? p2m_access_rw
                                                                 : p2m_access_r,
                                         0);
+            if ( rc )
+                printk(XENLOG_WARNING
+                       "%pd: identity mapping of %lx failed: %d\n",
+                       d, pfn, rc);
+        }
+        else if ( pfn != start + count || perms != start_perms )
+        {
+        commit:
+            rc = iommu_map(d, _dfn(start), _mfn(start), count, start_perms,
+                           &flush_flags);
+            if ( rc )
+                printk(XENLOG_WARNING
+                       "%pd: IOMMU identity mapping of [%lx,%lx) failed: %d\n",
+                       d, pfn, pfn + count, rc);
+            SWAP(start, pfn);
+            start_perms = perms;
+            count = 1;
+        }
         else
-            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
-                           perms, &flush_flags);
+        {
+            ++count;
+            rc = 0;
+        }
 
-        if ( rc )
-            printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",
-                   d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, rc);
 
-        if (!(i & 0xfffff))
+        if ( !(++i & 0xfffff) )
             process_pending_softirqs();
+
+        if ( i == top && count )
+            goto commit;
     }
 
     /* Use if to avoid compiler warning */


