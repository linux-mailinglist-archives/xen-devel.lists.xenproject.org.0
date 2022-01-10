Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EDE489D9C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255457.437760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xa7-0002VJ-Aw; Mon, 10 Jan 2022 16:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255457.437760; Mon, 10 Jan 2022 16:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xa7-0002T1-7d; Mon, 10 Jan 2022 16:31:39 +0000
Received: by outflank-mailman (input) for mailman id 255457;
 Mon, 10 Jan 2022 16:31:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xa5-0008Dm-VP
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:31:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7a375f8-7232-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:31:36 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-0gdKTTpoNE6LuvJHd8qH3g-2; Mon, 10 Jan 2022 17:31:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 16:31:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:31:32 +0000
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
X-Inumbo-ID: c7a375f8-7232-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3QICCLTVAYCokU58Fu1KW8azrW2zPznMQ8q1onO/ez0=;
	b=lvP0IRTUiIyBXrHcrMcF8EZrbIEd6MfvUZjR23no6tayerYDxcjCl8P1eUEk43xr/oerZu
	GEG+yZCLfXW69W3jR/yZWadEct/cvUvav+2ZKEk6aQemvEy4jk9MJVqxEd5QsrD0tcPxR/
	HV3rrSIxKq/+zrHPDMWsPvVO2Ht71OM=
X-MC-Unique: 0gdKTTpoNE6LuvJHd8qH3g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jI2ixXW72K8/7bOweVw35+7DaN5NYe9bM8SyPBn4wEaOMAFMqnkhAlST8tJgO0FwpuJoKogZ4vHZODRJIA0iLT8iCHbxG/6Vzl4gSVl1UPPeaisTG5ran35vo3dgrJZDkYMtk6kilfwLtB28KhrsBdYslQNkQEk6so3RdmpA1PKtRCVQyL4SWNOXft5KPkQpJYr/HtT8g0Uqg2RFDZrM8/62Ll+0HkkcqVlXjn2S9IkRKOJ/KZbcJyS8DZSGTCKB7neAgmTycWK4ls1rKjUiqo8jWxh3vd0w8KPXPaz0xCz5NiY4FpzGtQ3LHqd4SBa2svRLdrJogNLEPmpZGdQDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QICCLTVAYCokU58Fu1KW8azrW2zPznMQ8q1onO/ez0=;
 b=EgPgYmzxQ8PvxaicwC1CsW2Uz6IyeKfKpRYDpGTdFqbUJdEKGws7tDfUb3Ac7wQoRrVa/cu863Mw9GFPmp4OJaVfXnwswl1qhzjzGSGIpmxBqMebceu1gsn04W1BrtYaCf9xS+rvXu14MR9kUMoaSDqQMen3wtdAL6NMbHx3KQNHbCaI+pqEPYfI4RIpJnmxPQ2NJXpa7AFAKRSg5KYgSakrYH+OwV5zaW/ALs1RX5/nf9UUHGAwNPxlSW7NPhVOWYKWfejBxFRlU0TDiUlC29YbRJ5qEEw4BlO8SkY6fObgFUM+C4OX6HQIY6TuWBz31+BhyQ13mACN+EJCazQAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3815d3ce-69e7-6fd0-8052-e396af567bd7@suse.com>
Date: Mon, 10 Jan 2022 17:31:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 14/23] AMD/IOMMU: allow use of superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a1aac83-c9bb-434d-02f8-08d9d456a92d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51657094554FE2BD53730DF0B3509@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+ackIdt8+kvYJbJilcDXHHroQQYVB/VQNg+P3m2q/4xcBiqSwe3pESc+/itxTLQ8mp/gbi30f2Y3njROejZl3fnHKSpIRpzpInkGS8fHq9x3tl95VebTbcV9vEaUwFo8pr6EkG5UATK0lF3trWgLgz7kfUp3mrrr7lhG4ieDOjSDwI5xF1wNKKLe7xChA1vJDwWaSn0Mdf0xIcblrgNyLNClhwnUV7LsiZcppq25kVeKgQ/MotcgjvKGWnBTH8e/DaQfO4xW0OOZJiBHDMzu/D0C051HDuJvuTaBhLJiP346grh1rEoIOJKqhdKiAAbVQBeOYMjxrboeNzDxxK/TzvvknWz0K51j8DD5jIOlyAAl8i0ovu9aqgFEeouempFLEuEpkO+cxyW8+xUj07eQ1Pg9Qlq9/UKgNrCi3+mPH7vL8vov0GRH5uMlcV+7fK4o7oNb//orNzhkSG3FUhDQMS4adSbYS4ccjWRKVikD+ilrMsrKMCgC9a3DeO8r4jiA3bdPAXzKDXZoejN8fHFFboxwv/wwJUaVIhmvy8HNdxwT22YDkjn8eeYsCt1zcK9jZLvkLK5g1r/uyh1tyxOwY7wjmqb1uYaP8Rl06hUPV3CT3yNbDDD0nlY8SWftGvo5gROEg2vD9Xw6W+EwtL7eMGflcDX7eYQC6ulTqAPnL81W2jGnon/6yjosaQ+NSsaKQTcAQcIOpkiqt5h2E2uePwgX61Gjma27IaE9bb13n+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(508600001)(6506007)(26005)(5660300002)(8676002)(83380400001)(38100700002)(2906002)(8936002)(6916009)(66476007)(2616005)(186003)(66946007)(54906003)(86362001)(6486002)(31696002)(36756003)(66556008)(31686004)(4326008)(6512007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmxaV2hNdVZwTkZESXQrMWdPRmFsSE9JTUJiRUFKZVJROVAvSk9VNmc2OGtE?=
 =?utf-8?B?bDdVbUlHM2tyVkcyays5YkRlakxSYngyTWQ1b3hzMHRPaERKb3hPYWl4dWhP?=
 =?utf-8?B?MGlKVGYzd3RFdDhYcGZORExTbnpTSWhGTjRQMVBoV2xaZzYxQ2tUcTBRblhU?=
 =?utf-8?B?VTluQTV3ditIR0VuclhycitpZHZNcFpDL05zS0hmVzN6Mm52L2xPVWNVTVky?=
 =?utf-8?B?T1VLQmJwTFFETkN1K3E0akdCaVUrMnl4Rzd2eXM4aWN4THpWWHEyZ01BK0lp?=
 =?utf-8?B?bEY0VW9KYzl1RzFrcmpjb0UvNkhPT0dWc0Vob09HREZGOG9BejY4Um1NUEpQ?=
 =?utf-8?B?SGJ6Wm10OWVrNFpNZHhYZDc3blFFSlRES0JvRmNtc2I2RmkxMEwyeU1nSWd1?=
 =?utf-8?B?SVpJNE5NejRId3o2R3RJVGppQmxxNjJyZFY5Kzd0TURGbUVIQjBOcThjc2pU?=
 =?utf-8?B?bjl2QkRqMFl6UzJRaGN1bmU3eGNiUlFicE9FTjZxMWkwWnJmc1diOEhyd0ZN?=
 =?utf-8?B?eWtKNDl4M2ZKRTZyTVl1U1gxN3hwWmIzbFNGUm0zNGNoWWV1MndmSXg4bjI2?=
 =?utf-8?B?SGZkaUxMUjc1dlZXOWRUV1hWYSthOEtzcyt1eHhGNEJyODVHQ1o2eVE0b1JI?=
 =?utf-8?B?SFBIMFFLMmVVcnNoZVE0RDJsK1p2SHVaSFBmbWhrckJQTWhqMStIRjZydFRZ?=
 =?utf-8?B?N0I2U3lpMEI4eFNYU1pJSE83akdIT2djUjRTWnB4RUZPV2plODl5N1dEMlVu?=
 =?utf-8?B?VG9RbzlIbWgrOTZsYk85bXk4RXprVG9NNkhrR1pEL1lyYWFUWmdTTTB4NHBo?=
 =?utf-8?B?dTJBYjk3U2NkS0hvVGJyd1NjZDhYQjQxOXlhbjV1bTJ4T2hMTUUwLzljSUtr?=
 =?utf-8?B?STBZTmt2V2VzOHhsbjAyYzF4dDBEOXh2OTlDWXJpZ3ZaYlhMdWc3WFF4aDlV?=
 =?utf-8?B?SHRZaFFKUE53bEdpeUZncklHNTNGVmRDM3ZuakNzanBWOHNMRHQwSnFNZUlt?=
 =?utf-8?B?QitEdjZtMDB2dmU0TU1xRDkwckZ2dDNxTHdIWW9QYXdxYSt5S2Zjemc0MWg0?=
 =?utf-8?B?RUxJNm8zKzhPRFFBRWEzYnRjT1hVaDFlZ3crTDZaK3JOckhtWGJKdnUwbTZ0?=
 =?utf-8?B?Wm5aSjlpYTB5L045YVZLbUlGakw0U1JTUGhDS3NXQ2hnKzZJZHVrU2lZeVFq?=
 =?utf-8?B?NEo5TXAzdkgrQXdXVVVVektieEhaZUFOVU9EU3VBWUtyZG42UGswR2g3U2lu?=
 =?utf-8?B?NzNYeEJCYnRvV2VxalFmWG5LNkxrdVQ2dHlBWDEvTi9SK1VEUml1TC9tZ1lM?=
 =?utf-8?B?MUxiVVFIb29PVEh0MTNNbVNLRjYvT2NQcldjQmdHc2h0WElxdDQ4MHFjNHpV?=
 =?utf-8?B?Z1U4dFJXM1NVZE9pcXpCQ21ZYVFVN0taUjFyRDdPNFlxQzVmckdnOWxlVFhG?=
 =?utf-8?B?cVVCUVhGeXZrUjhadjJpemlEUmQ4cDd1TlNpM1Rud1hGbHhkRlVuL0JtaHRy?=
 =?utf-8?B?Q1ZLZzJUa21VNHhMQU15NTQ4Z0JranF4bjhzbmtoeEQyNFVZcW93TTIzYWgv?=
 =?utf-8?B?Ykk2UUNjbVEwWisyMGJ4UmtOVWNwTHpjbjdzeUNqSE4rd3dpakJCMU44NEZJ?=
 =?utf-8?B?SkZvSUxxK2xiYTZRM1N4a2ZnRXErckNWMTJEaXpDYXA3alJuOW43Q0VEMHpp?=
 =?utf-8?B?OWZmVGs2L2tRa21sRXl4Vmh6eWYzbGZZZzlwcm9qYnRyaGlGcmRlZ2dPU2Y4?=
 =?utf-8?B?T29DbERtdmVVT2sxSE5SWm5PQSttVUU0YUVCYzVOQmErMFRFbUhpSlVhTW9y?=
 =?utf-8?B?Ym9mK2JXc3hrd1VXS0oraXc3WlV6WjdYbERxemNKc0VsclFYUnRpbk1ualdF?=
 =?utf-8?B?S21oR0pabTVKWXl6V1BkQXcxWVA1alNwNi8xaStpanY0ampYRU5QcmtlMkhz?=
 =?utf-8?B?OW1MaDc1dnhZSW01dWc0K3FnQXRRejRUTEFvdVY4YlRXNTZseHdoWk9IaTVI?=
 =?utf-8?B?eFVVZEdHT1N3eTMyemhXNUVsMEZNUlRIajVGaUpleTBxZTZUVVlOTTFjZkdw?=
 =?utf-8?B?cjlvY3BkZW9GV2J5UmdQOEpoL20xK1dJRGVvUHN2WVFUM0F1aU9JdHNlN2lK?=
 =?utf-8?B?c2ZuOVVmeFFBWDlrVm01Vy9GdEVhdTFZWjY1cGd4aTBuZHE5VFVWZFNlSnpP?=
 =?utf-8?Q?MYJpdiaDUNvOHgpmCgPgArw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1aac83-c9bb-434d-02f8-08d9d456a92d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:31:32.1150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ncVdYPrI5L3V6bsfRt5w70ePAN4YvU14kDYXw1IjLlV9/kgymMYuBNUiecMQbjUj2D8HBcnddFlpUu45LzORw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

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
@@ -291,10 +292,31 @@ static int iommu_pde_from_dfn(struct dom
     return 0;
 }
 
+static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int level)
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
+                queue_free_pt(d, _mfn(pt[i].mfn), pt[i].next_level);
+            }
+
+        unmap_domain_page(pt);
+    }
+
+    iommu_queue_free_pgtable(d, mfn_to_page(mfn));
+}
+
 int amd_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
                        unsigned int flags, unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    unsigned int level = (IOMMUF_order(flags) / PTE_PER_TABLE_SHIFT) + 1;
     int rc;
     unsigned long pt_mfn = 0;
     union amd_iommu_pte old;
@@ -323,7 +345,7 @@ int amd_iommu_map_page(struct domain *d,
         return rc;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, true) ||
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, true) ||
          !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
@@ -333,8 +355,8 @@ int amd_iommu_map_page(struct domain *d,
         return -EFAULT;
     }
 
-    /* Install 4k mapping */
-    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), 1,
+    /* Install mapping */
+    old = set_iommu_pte_present(pt_mfn, dfn_x(dfn), mfn_x(mfn), level,
                                 (flags & IOMMUF_writable),
                                 (flags & IOMMUF_readable));
 
@@ -342,8 +364,13 @@ int amd_iommu_map_page(struct domain *d,
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( old.pr )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( IOMMUF_order(flags) && old.next_level )
+            queue_free_pt(d, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
 
@@ -352,6 +379,7 @@ int amd_iommu_unmap_page(struct domain *
 {
     unsigned long pt_mfn = 0;
     struct domain_iommu *hd = dom_iommu(d);
+    unsigned int level = (order / PTE_PER_TABLE_SHIFT) + 1;
     union amd_iommu_pte old = {};
 
     spin_lock(&hd->arch.mapping_lock);
@@ -362,7 +390,7 @@ int amd_iommu_unmap_page(struct domain *
         return 0;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, flush_flags, false) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), level, &pt_mfn, flush_flags, false) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_ERROR("invalid IO pagetable entry dfn = %"PRI_dfn"\n",
@@ -374,14 +402,19 @@ int amd_iommu_unmap_page(struct domain *
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
+            queue_free_pt(d, _mfn(old.mfn), old.next_level);
+    }
+
     return 0;
 }
 
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -630,7 +630,7 @@ static void amd_dump_page_tables(struct
 }
 
 static const struct iommu_ops __initconstrel _iommu_ops = {
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


