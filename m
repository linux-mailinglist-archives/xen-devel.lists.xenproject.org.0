Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BBD50DB76
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312577.529888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuJ6-0005nu-EC; Mon, 25 Apr 2022 08:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312577.529888; Mon, 25 Apr 2022 08:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuJ6-0005lx-9x; Mon, 25 Apr 2022 08:42:56 +0000
Received: by outflank-mailman (input) for mailman id 312577;
 Mon, 25 Apr 2022 08:42:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuJ5-0005as-70
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:42:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b29b928a-c473-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:42:54 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-GNVznJqEMCyrHfr4cwFnUw-1; Mon, 25 Apr 2022 10:42:51 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6647.eurprd04.prod.outlook.com (2603:10a6:20b:f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:42:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:42:49 +0000
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
X-Inumbo-ID: b29b928a-c473-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650876174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F76uggdKpcuSYHZPwCK0FV2JMpLEoy075SIPYzCN2oY=;
	b=aHt0+UEKQ5szrRaM/h7CXa47hjLmRn1XOA9ssQzOkcVIYIrXHiEz0uRpdNfjmTdcEXnFIw
	DI1dMvwvY/FkFGZqH6Sb1bv7Z7zW/w6QwDJeKG18o+PXr+wSEml6gyRqZblSHrO3EdDucw
	h2PMLOLjfEU7rNDkQVre18RRe9uavs0=
X-MC-Unique: GNVznJqEMCyrHfr4cwFnUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwIt75MDAsiF5vuXMEKM7Qs+6xXxJvstqdESHtOtEwDLFLjwSSEFbGjSRN97SO7fthl7A00hE/kQdhmu4/fnuQ8CULnCFlXWgDkL/odcVYm+sviWr5/OBkc56EvarFy+JyiNXunjq/wK4+0B6MkcQfXNFvaIGkXRj3FUPeEM8d3AaP/k7Ktk5+xfSUSURSnWMAIJLDktKyNb96SgacdOPoJVovH0P6Cau75VKGOAY8cLchySdky7j2AYWFok0aTjLmdeyEFvVEKW3aGiaCOlYSQU7g7QtLhz7NpzDiusy+7bVE6LcEoC1LGVybKdqJIGO6ELqasXif/BYww+Dx/9uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F76uggdKpcuSYHZPwCK0FV2JMpLEoy075SIPYzCN2oY=;
 b=CMkyhM7LTzpt/ZYD1AKt5b6zsuaGrv43WnK6Zjz7u6vRl9zfWCFmTmkaFMDjIPHHRcM+Ak2136f9pEDzP2r0cehOsB1BH5HCuWCWUIjMSnYKcgb8cwD+K/y/QY8ut2IKHmmRxBjyT5YjjZn2acCnU69Jg+eTVL6mzPRaYgpHzTvRknrQqSYZAvkFpVVRZZiZaq7nvo/ESTe6RIR4m84sEnClCO3F/G98gFoyu5sBSX55UIoMgj2+gO8WFbIGqruxF0PRmsRBlCA6XCMXwTLCfYLlyx8K5JrU6qrdppfRuU+AyvnqfJbRg+TdsOBOcOtUoVinldcYz922sv8xETHUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9a2be8d-3bb9-3718-6e3b-f07f6dcdde20@suse.com>
Date: Mon, 25 Apr 2022 10:42:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 16/21] VT-d: free all-empty page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0033.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::8) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f36f1ab-8f0d-44cf-4b65-08da269793cc
X-MS-TrafficTypeDiagnostic: AM6PR04MB6647:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB66472FA36886A4E5EB0E4277B3F89@AM6PR04MB6647.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+sZCJwKu+kKqohWo2wnpRtkG+226O4gDKlAtsuJIqnk6FjMeovxdmo9YulYupX9OPLn6n5NO0Hut7derq1vXpL6swurkfUaU/VJ3MICXKVkbaXw1gR0hWKgVsfdnzFoynS7dKGn+r5acRHdsoVEauALfhsqfnzK00kOIfk/tM2c6c4bevJ0noXrpJRdXpzUgTdATF30uSaLV6qhH0B74J+ZKs9ueRvFeBZqwKzZdzqC27CK+XPzxBsuYt8EuF6nvIUOLo1hXVHeq+pwZ1GwmkdbvsWzdgjmiWPz/k4dtZ6OhrOZoLDoiKSsY/ZxLcChd4h2MJBy8d/6jZWp1TCnVogvDP0ibWdD26nZmD/r+kZHzAc7V/8t5aTb7rMZz+ST44TAF1VrXT0yFawWMn0VsYcEeUokz5NYe5emXbp6K/jqUPtTmuwJo/l620EsFUw/WMdlhq6Y5WSyIq/uP84T4y+jaqX+yRcTE4pmKjeCO9RLKDUJhq4HWnCma+HasPxv3X/AwCJDcSxhjaffLF2pAO0cPQsgk77pIKXQPDnh158H3gLku2rXUq6pYpR7sHEnEhVpMF0jTIC1RbXRLDkjY43E51cAVdzw/Mr3V8Fdpy7XqbbDymywUB4+amsZLvRAOJ2Pd3xKPuQv2Jps+ZoxTnfMQad7Xo6RFTTQKsuQpgYtC4vhfhP1wwDISLIL7l8EHKWAlQ1WkEL49c5X/JdziyYliCRB+KW1iTPMDn3D4WdQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(66556008)(66476007)(4326008)(2616005)(31696002)(8676002)(38100700002)(86362001)(26005)(6666004)(6506007)(6486002)(2906002)(83380400001)(5660300002)(508600001)(66946007)(36756003)(316002)(8936002)(186003)(31686004)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aC82d1NidEowdi9UUTlmVXAvL0w4S1JmbWN1NVJKY3JPVTlYZ0FVR1g4QnJZ?=
 =?utf-8?B?Z0VVWmN6bUIvZm85UnhlRFlqWG1DN293NjFKWEtVZnNUMjFSQlJsZ08vakVm?=
 =?utf-8?B?a2xycjgvczl1dlE2ZG1ERHZ2bU5INFU2ZG5nTS9uYi9QZHBBWUo5OHJ2U00v?=
 =?utf-8?B?dWE0dk5nQTREVlpBWWRlZWkrRHVON1JIa1BnYUIyenFHUk1rd2VrcVlFWmov?=
 =?utf-8?B?TDA3V2N4aFIzek5GSWwxd1RkZVFzL0prOGFDZUhIUUJSRVNTZGlIN2pic2Vi?=
 =?utf-8?B?bXVzQ3VvTnM3aDRTb1ZVcVZkbTJRZUNBMnEvNCtwZmh1T1VzaWdTVnZHZ24z?=
 =?utf-8?B?VnJ5SXBqRk0xeE94dTRoSDFvaXlHQjVnaWdyLzg1VXk1UHdhRFFwZFFIUzVh?=
 =?utf-8?B?a1pkQmk1eENUMlV0OGNKN1ZMbFhIaXlmUHQ1RjIvT0RMc2t5ZFhXMzFlMHRN?=
 =?utf-8?B?cDVqaFdPN0NoQTlIU2pya2Fvc0VIYVRBZ1JEbDR4ZDk4NEZqOEYyNXpOSFFP?=
 =?utf-8?B?ZFF0MmF5aXJtMkU2VU4xdzltdThkQXU5d3NtOGZ3QXNXd1hBMHg4MktWVTdY?=
 =?utf-8?B?aUZZNTZRMW45a0xHNE52c3BHMGNQVFZHYjBvZXVBcTVIYlUwdDJUQThsc3VU?=
 =?utf-8?B?bzhKQnZtbUUvM3VRRVRKOFUxVGJveHM2a25EWTJheGVxckk4RTlPNk9Ucm5J?=
 =?utf-8?B?Q0VESmJmajVpM29UUXk0N1dyS0lIOWFoQW9kNmdMTjN2aHFQdGRuRXhkQ3U3?=
 =?utf-8?B?SEtIMUZyNU11MnA3eW9nQjZvODNMbnkxckt0MWxYbHdzMmZmVDlOZjJsd2hB?=
 =?utf-8?B?Vm05Z2lOeGVFK2o3eHhEVGRWMmhvV0NCK3piU2ZudkFMbnZreWhzam5xMWl5?=
 =?utf-8?B?SW5tMTZYdXN2WmRheE5qS1NHTU45ZVRZSmIzZmo2cDlKdzRNMDU3cVlsNTJv?=
 =?utf-8?B?OENPL253WlphbjFzdytLTUF6VmhielN2d1JyTWVHT1M4YUViUllNS25BUnpl?=
 =?utf-8?B?ckFyRzBFbnVoNFZkNGVUWnhHc2dEUStFRkxJMmxvcG93MHpuMUt0dVkrRXBx?=
 =?utf-8?B?RDNtUjFHV3hhd0FDWG5kNytRdjY0ZERGbnZ3ZVRGK2VLdVhMTVNmbWR6RVla?=
 =?utf-8?B?MllQY21jOFNySnZhUk9XUnhRZVFtVnpMZ2UzYU5Rd2dta3VleUNvd3BMNW44?=
 =?utf-8?B?NXVnaHNhbEFjUlcwd3dPQVpkY3ZvN0IwZ0VDNGRzd0NoSUozQXdLY3EwME55?=
 =?utf-8?B?VmJKOXpBWlhxMTFLRUFoSEFiclFlYkJEamM4MWhqUnBNNlkrUHU5aHNMMXlB?=
 =?utf-8?B?ZytET09YdHZJc0poazJBcHprNTFKNjNMcEUvdEpFT2pzaURFUUh5amZmYmJZ?=
 =?utf-8?B?eWdJaW53UXkvN3ZYNlQ1bFVndHdEL3cya3lWdjAySHVoMC9pNCt6c1dTVU1u?=
 =?utf-8?B?VElvTUhrWEdVdlRpNzNvV3kvUzBjUGxGRXl6UTRvSzQ4M21Da3ZiTlh3cUZu?=
 =?utf-8?B?Z3E2blFvWUZsOVhoQmZuZG9STkZ2UW5PTmRaUTQxb2ZaV0tFeSswVHZRR3Vt?=
 =?utf-8?B?MytXN1psQnlFYlE5cnllUU92Wk5hRVBVWjExOGVpU1lwcFZ4cGwrK21aWXdG?=
 =?utf-8?B?Q3hoUlhobDY0aGo0c3I1dWpPbnhRUHRsVkRGdis0cFBnRXFKell0ZWYwQndu?=
 =?utf-8?B?RlFVWkJPRWgyUnZUUzlWR3V3L1JvZmJDOXZaeVo4TS9QekJkdmt2M0xpWDBS?=
 =?utf-8?B?bXJjaTFEMWhqVDZVT2R1anpkZzBBdE51emJWQUIwYy9rcCszbnp1dGxuSXFY?=
 =?utf-8?B?T3hTLy9adFZScHZOSGE3eExKdWZBMUVPaFZJRDMvbVFvZFdVQkhxbkJaTXpL?=
 =?utf-8?B?SEMyaDhVakp1ckY2WnArdmZQVVYzNzR0MHJ2YklEMU43eXh2TEtoOGdoNVJ0?=
 =?utf-8?B?T25rOVF6YkFVd2kzNnA2cm5XelJUZUFhcFRUd0hmM2krc21TdEx2cWs2Umc2?=
 =?utf-8?B?eXhZTDRRVFlKbXV0Qm5DaWlTVmZ6aU9ET2NESUs1Q0hxOURmaEJCUjR5Y1hC?=
 =?utf-8?B?aURWeXFQQjZtUk9aSFhIRTAvdGphSWl5QVI1MGM5MGtudXZPY1h5d1dJMTVu?=
 =?utf-8?B?M0lSMGhTSjF4MWtCQkxZZ2swRmZoSnNXQmpFY0cxOEFGY003QUF0T2l0Zjhm?=
 =?utf-8?B?bktGaFV3Q3JTRFpkQWN5TndBUUx0WTRlSmxiWkRnZk1aQWs5T2hIODBmRkdp?=
 =?utf-8?B?VFNIQnpEaGpGTnpZRldhaTVtNjBPajVRQ29TSlR3RkpjRENOZ0dsUjZ3dWFU?=
 =?utf-8?B?VlhRUlg1b0ozYUZOMU1ldWk2ODFrQ2xDa2tTT2R3N3EwZnB1RjJIdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f36f1ab-8f0d-44cf-4b65-08da269793cc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:42:48.9933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsmPMr0Ur35rlFPrzoOZ5DbnsRGaLvtm54hMftZ30/8sLRqFmrAOKhr7z/nR7CubGlwix4WOz85X9hPsdgTFgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6647

When a page table ends up with no present entries left, it can be
replaced by a non-present entry at the next higher level. The page table
itself can then be scheduled for freeing.

Note that while its output isn't used there yet,
pt_update_contig_markers() right away needs to be called in all places
where entries get updated, not just the one where entries get cleared.

Note further that while pt_update_contig_markers() updates perhaps
several PTEs within the table, since these are changes to "avail" bits
only I do not think that cache flushing would be needed afterwards. Such
cache flushing (of entire pages, unless adding yet more logic to me more
selective) would be quite noticable performance-wise (very prominent
during Dom0 boot).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Re-base over changes earlier in the series.
v3: Properly bound loop. Re-base over changes earlier in the series.
v2: New.
---
The hang during boot on my Latitude E6410 (see the respective code
comment) was pretty close after iommu_enable_translation(). No errors,
no watchdog would kick in, just sometimes the first few pixel lines of
the next log message's (XEN) prefix would have made it out to the screen
(and there's no serial there). It's been a lot of experimenting until I
figured the workaround (which I consider ugly, but halfway acceptable).
I've been trying hard to make sure the workaround wouldn't be masking a
real issue, yet I'm still wary of it possibly doing so ... My best guess
at this point is that on these old IOMMUs the ignored bits 52...61
aren't really ignored for present entries, but also aren't "reserved"
enough to trigger faults. This guess is from having tried to set other
bits in this range (unconditionally, and with the workaround here in
place), which yielded the same behavior.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -43,6 +43,9 @@
 #include "vtd.h"
 #include "../ats.h"
 
+#define CONTIG_MASK DMA_PTE_CONTIG_MASK
+#include <asm/pt-contig-markers.h>
+
 /* dom_io is used as a sentinel for quarantined devices */
 #define QUARANTINE_SKIP(d, pgd_maddr) ((d) == dom_io && !(pgd_maddr))
 #define DEVICE_DOMID(d, pdev) ((d) != dom_io ? (d)->domain_id \
@@ -405,6 +408,9 @@ static uint64_t addr_to_dma_page_maddr(s
 
             write_atomic(&pte->val, new_pte.val);
             iommu_sync_cache(pte, sizeof(struct dma_pte));
+            pt_update_contig_markers(&parent->val,
+                                     address_level_offset(addr, level),
+                                     level, PTE_kind_table);
         }
 
         if ( --level == target )
@@ -837,9 +843,31 @@ static int dma_pte_clear_one(struct doma
 
     old = *pte;
     dma_clear_pte(*pte);
+    iommu_sync_cache(pte, sizeof(*pte));
+
+    while ( pt_update_contig_markers(&page->val,
+                                     address_level_offset(addr, level),
+                                     level, PTE_kind_null) &&
+            ++level < min_pt_levels )
+    {
+        struct page_info *pg = maddr_to_page(pg_maddr);
+
+        unmap_vtd_domain_page(page);
+
+        pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags,
+                                          false);
+        BUG_ON(pg_maddr < PAGE_SIZE);
+
+        page = map_vtd_domain_page(pg_maddr);
+        pte = &page[address_level_offset(addr, level)];
+        dma_clear_pte(*pte);
+        iommu_sync_cache(pte, sizeof(*pte));
+
+        *flush_flags |= IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+    }
 
     spin_unlock(&hd->arch.mapping_lock);
-    iommu_sync_cache(pte, sizeof(struct dma_pte));
 
     unmap_vtd_domain_page(page);
 
@@ -2182,8 +2210,21 @@ static int __must_check cf_check intel_i
     }
 
     *pte = new;
-
     iommu_sync_cache(pte, sizeof(struct dma_pte));
+
+    /*
+     * While the (ab)use of PTE_kind_table here allows to save some work in
+     * the function, the main motivation for it is that it avoids a so far
+     * unexplained hang during boot (while preparing Dom0) on a Westmere
+     * based laptop.
+     */
+    pt_update_contig_markers(&page->val,
+                             address_level_offset(dfn_to_daddr(dfn), level),
+                             level,
+                             (hd->platform_ops->page_sizes &
+                              (1UL << level_to_offset_bits(level + 1))
+                              ? PTE_kind_leaf : PTE_kind_table));
+
     spin_unlock(&hd->arch.mapping_lock);
     unmap_vtd_domain_page(page);
 


