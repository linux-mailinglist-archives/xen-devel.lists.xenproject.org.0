Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EF341D9EA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199867.354179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvHe-0002oW-8d; Thu, 30 Sep 2021 12:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199867.354179; Thu, 30 Sep 2021 12:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvHe-0002mj-3Q; Thu, 30 Sep 2021 12:35:30 +0000
Received: by outflank-mailman (input) for mailman id 199867;
 Thu, 30 Sep 2021 12:35:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVvHc-0002kX-VO
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:35:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7087557a-fe7b-48c5-8378-b1e43e0c7094;
 Thu, 30 Sep 2021 12:35:27 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-aoc0CG_oOqS0JfWrqru6WQ-1; Thu, 30 Sep 2021 14:35:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Thu, 30 Sep
 2021 12:35:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:35:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0219.eurprd06.prod.outlook.com (2603:10a6:20b:45e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 12:35:24 +0000
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
X-Inumbo-ID: 7087557a-fe7b-48c5-8378-b1e43e0c7094
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633005327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eWRvbp7ta3owYpcdKj7PO7T0r2HXZ7zs9WVfAD35Uvw=;
	b=UXXlauToOjHhrRu8X3wJHT8P7ehbax9MC1OeZ3RsHo86vGKJB0it7YUxco6xoxXbkgaw3S
	ztAjrHLkaA1JeyHZxaaQ5wHEoNMwZX1QGNvQN1IEDv9/H0rHnt0ku5QsTmpa9foc2KLImI
	MA1BJaalnudb+f5VWlA01VsvQSia5Sg=
X-MC-Unique: aoc0CG_oOqS0JfWrqru6WQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHkFibb5LYshIVpl0Jp9XnQZEGUsmW7OWVWVt0BujZRFHmCG+Bc50cgQqtzeRjcbiYLLLyPp0v7NQqVfrtBiNOqdMjnNKS6XkdwG0hx0DPY9PKuUk97H+nWKvlabCeMYG0nO6Cv3dX40QvfHKH3weYlGrh0gofHGLkrCYCtRRdQpVpZyWSlxBSEjB/JHVZyboqadYFIGEYsDJIR/N9YdBetu/2osTnEew84x+VfLMq3lcMVRoDoEK+7uwwI/2+I3z7XD5GHGfSHJTOznViGOtsnJKSWNmsn7GF/fhTZiPrN19YwZsuiqmddGoZr/i4zUXs4sWaQ8xhoRPc6WEvFh8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eWRvbp7ta3owYpcdKj7PO7T0r2HXZ7zs9WVfAD35Uvw=;
 b=YsImSKohjx7Tx5XUvZCvBF0KUB/FrYqV17rGkQVV+9k75XwtAkVl8oe8qcsDUAD0lvstAt1+cYkDhiTXIoYMHE0DnpWyPbXLceIXXlEi0QICl3TcgypmmsBapKE59xmxL/anh/vyg+M0BjWzHKOrgvll6/aMGFQLIyEYnl7dw5tt0y/rd8xPZQI/GwpYH6WK2E7BLRFMCOnsMvRps7GY0/EMEmflRe7xvtpwfqbUb0Vc9MeFe+lAtlwTkSwR/4uxHmbgoZvgRIZjhb3tYtq9STA4tIjUjf9s+SJCOsrclV63PQ48ZXwH/Myqx2KVt1iZhJ0XmcF0nv6BARaYO4wCbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 2/6] xen/x86: restore (fix) xen_set_pte_init() behavior
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Message-ID: <57ce1289-0297-e96e-79e1-cedafb5d9bf6@suse.com>
Date: Thu, 30 Sep 2021 14:35:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0219.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74700795-3594-4d3b-fd63-08d9840ec687
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB638392EFAC473C948BD49794B3AA9@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w3I5bU96eYptQzelHHw9QkIo2SbqWLNurMYmpBlW2DK5UVBHPgPgtxQg9tSYuQ1lObrEXgzpRgOfhMx4S2WELbT6wKE1zE0/fE66OBbI4c2JDgnoAcsWUMN3f6Qlo4hAJ382EcUf2prMHo5u6YCXoNDZyv9NBzCZyZewBA1AdH29qlEZaez7fVEfR7Hu+p9HEs1+C9AWlDjsfCIJz9KVgIII8PNMR6pLwAcL7Ie5bUqxWgYza07SitTUTdY/P1Ca2ATtd/A6dyk7aCQ1LHPGL9SS56Iv4bL0ZiY2K+5TW59ElCM4kaHi+9Rf+JALzQebeV5WYeid90F9gDrQVdjMihv239FLVaMqfYu6/2G4S8oDfpoIZZVDLCiD24m7SR6/in71fd22+YeL7VfC30TPdEiuQGCkeUZNMmHHcirbqkqsWSI12lfu7wI1ycT0RpeXdwnRiMLpNmspBYyfzAkLOsMTdBLYjVqHKV8Uq6NdiuTeqHzTAcLP8OC0Fxy5JU1uz58MH6FBWGQfqln/WjRoidjfFoFigOVwXBjbzqPFKrgXm0zChU4PaZZ7qP3BwbKSoIj6/9UJAhAwj0p30VywGdGiiUNUzd8tn1+EO3lehmpuFrKu3PpmH+shMcfWeE8a1yz+7N7F/iF8YXYmIEqtS+wgayvOWBFLZbFq+LZJW2OSEZECzQ2FjhlKRORfS4JHGLxI/x95rUKr2pK36L+m69sRDzxNdXDqPgBH7L+dstoBoQzCJZEYIQLtmU+xnYIh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(2616005)(186003)(956004)(508600001)(31686004)(66946007)(83380400001)(8936002)(86362001)(2906002)(31696002)(16576012)(316002)(38100700002)(110136005)(8676002)(36756003)(6486002)(66556008)(66476007)(54906003)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFRnVmthazE2TnZIdTNjRWltRXNxVFRDbDdINzFXWlMvUFV6QzFIRFBEN2sr?=
 =?utf-8?B?dFFMOThPbDZqdkptU1FGWkkvUTc4RERYTThkVDlVSUpGWFBsR1RnNXdOc3lm?=
 =?utf-8?B?Z0l6NTJna2FkSEhZQUVYdEhuZll6UU5sUEVQQ2ZwWHF0YVpScDBmUVNyRnBQ?=
 =?utf-8?B?aytWWnFNa01GU0RFR0M1S3lrd0dqQVc1R1RhK3l1MDRIY0kzTHZVdXc2VEN5?=
 =?utf-8?B?NjhqOEw0YUdlajluUFdZRjlvYTRFRUxoL1hicGw3WnNqbnlJcjJrZHdET2pt?=
 =?utf-8?B?ZUJUVS9xNHJHTVJHbEcrWDQvdG9EOUJoZjBVNTR3dGgxSnRKYXliMDJ5Zkc2?=
 =?utf-8?B?U3g0ZFl6NkFsUldwT2FocHN2MDN6MmFiVFl1djBTSm9Gck5SM2VobzR1TUk1?=
 =?utf-8?B?WGp5UEFnc2gvSzNnSGtSYlJRWGlDNFE1UXlFU1UxaGVBdFpvM0pCMVlBL1FD?=
 =?utf-8?B?TVZ2RU1Sdmo4ZS9aSzRSc0FJc3RCYU5hcUVnMGxGaFVtS0xBSTlZL1NaWm1Y?=
 =?utf-8?B?NW91WUZmckhMbVJHYy8vb1FaemkxQTQzWDVHTHh3R1JOVkhQZ0xRYjljdjg3?=
 =?utf-8?B?ZnRIZDVaRDQvazRFT2Y2RHpzUm40c29DanVYdUVNNFdRTkxUWnFEeDY0Zmx1?=
 =?utf-8?B?cGZObjVDZFlYNEc5em1vMzZCN0Z0SUg1aG8ycDFGMVpFbVVOWnFrREthUmww?=
 =?utf-8?B?N1QwUlprc3BHcVlEbFFmZzNqY2lTWlhYSGtOZjFMNHhzWVhVZU5IT3VlUUdW?=
 =?utf-8?B?UlBGd29RdFA4Nnk0UDREallOZ1N4bkFLRTRHN0Ezb1dQZTRxRTJRQUdpL05Y?=
 =?utf-8?B?RmpFYnoyaDlYTkFDOUsrU2JMT3JXMndoaUxjT1hiOUdsTU1IS2pJNU5uQnZX?=
 =?utf-8?B?UDJhbkJwK0QyN3ZZeEx0cWs4S2l5NTNWQzRKUWNlK05iaG16c0swdkxLQXJt?=
 =?utf-8?B?V0lWNTI4b2tpMm5xdUFzWlhCOXY4YnhtelkveUd5bU5HOVYybnp3OGJvaDJ0?=
 =?utf-8?B?WFNRWVFhVDg5Zmo0Q1d0eElHMGtTSTkrM25vZlRUT3lpNkJNZGZJTE41WnJC?=
 =?utf-8?B?bjE5MlVVTXVlMm8va1BNSHlRYk5OOFdkTE9ZcFRvNGIxdDVmNm9ua25keHB1?=
 =?utf-8?B?bCtIbXpKaFAvTEl5cHppSEFSdTVEeEpQdzRLN3JjT2paREw2QTU3bFJMcW5l?=
 =?utf-8?B?SWxNUG1aVThySDVlQXVobkIrZFNNcTJ4M2xFWVhFVm52NXlpZ3MxYnZkMm1J?=
 =?utf-8?B?M0xJTUN6V1NWdmFPQmVGVmhYZHNTQUJDTWlZYjJpRi9kRy8xRUVKZ3R4MndR?=
 =?utf-8?B?cCtJSkZjekRxUU04U2RpZUEvb2VMZkpWQ2Q2VlRtaTdBblI1Y3VUTlJjajhu?=
 =?utf-8?B?WnF2NFkvTko4dkVqY0JRdzdVbFRleGx1MkFPWU9YbnRZYU03b3FYWjZ0Slg3?=
 =?utf-8?B?WDFBZHN2Ync5OWNGQjJPcCtjTm5HR0FyRWE1aVdlRkJ2aE5WZ2lkbWxWYUNu?=
 =?utf-8?B?OXlESCtpb1hqblhXZlptaEk5QitYU3phY2g3cGd6a0lwZVYxMEhwMUlGM1pY?=
 =?utf-8?B?aUtzWFJuMmJiMVNMeCtHemh0dHNjcVN1Q2poeW9SQWIwWUpJY1BrSU5TaFFz?=
 =?utf-8?B?RSt0S3ZUd3lVa2JvMHo1NHlTV1lRdE1DTEgxYWY3MGREZnRxS24zNXFEUzBy?=
 =?utf-8?B?MTA4Sk1raGszWXljSVN4RU83MzlqZWlST1A0dkJFQUczU2QrNnhxcVNISEg2?=
 =?utf-8?Q?dlV7EnSH3Vo+EakO3a/jG/FhhROjRzqBJAxvm2V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74700795-3594-4d3b-fd63-08d9840ec687
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:35:24.5804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+QpJ6hdD1dvtUjfh20b2SeBFtCK/5mrepLbPm7M8obAJPEYT8rkLVValbSZp1jWDTxr/UUqZCjnonlfRIpSDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

Commit f7c90c2aa400 ("x86/xen: don't write ptes directly in 32-bit PV
guests") needlessly (and heavily) penalized 64-bit guests here: The
majority of the early page table updates is to writable pages (which get
converted to r/o only after all the writes are done), in particular
those involved in building the direct map (which consists of all 4k
mappings in PV). On my test system this accounts for almost 16 million
hypercalls when each could simply have been a plain memory write.

Switch back to using native_set_pte(), except for updates of early
ioremap tables (where a suitable accessor exists to recognize them).
With 32-bit PV support gone, this doesn't need to be further
conditionalized (albeit backports thereof may need adjustment).

To avoid a fair number (almost 256k on my test system) of trap-and-
emulate cases appearing as a result, switch the hook in
xen_pagetable_init().

Finally commit d6b186c1e2d8 ("x86/xen: avoid m2p lookup when setting
early page table entries") inserted a function ahead of
xen_set_pte_init(), separating it from its comment (which may have been
part of the reason why the performance regression wasn't anticipated /
recognized while codeing / reviewing the change mentioned further up).
Move the function up and adjust that comment to describe the new
behavior.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -1194,6 +1194,13 @@ static void __init xen_pagetable_p2m_set
 
 static void __init xen_pagetable_init(void)
 {
+	/*
+	 * The majority of further PTE writes is to pagetables already
+	 * announced as such to Xen. Hence it is more efficient to use
+	 * hypercalls for these updates.
+	 */
+	pv_ops.mmu.set_pte = __xen_set_pte;
+
 	paging_init();
 	xen_post_allocator_init();
 
@@ -1422,10 +1429,18 @@ static void xen_pgd_free(struct mm_struc
  *
  * Many of these PTE updates are done on unpinned and writable pages
  * and doing a hypercall for these is unnecessary and expensive.  At
- * this point it is not possible to tell if a page is pinned or not,
- * so always write the PTE directly and rely on Xen trapping and
+ * this point it is rarely possible to tell if a page is pinned, so
+ * mostly write the PTE directly and rely on Xen trapping and
  * emulating any updates as necessary.
  */
+static void __init xen_set_pte_init(pte_t *ptep, pte_t pte)
+{
+	if (unlikely(is_early_ioremap_ptep(ptep)))
+		__xen_set_pte(ptep, pte);
+	else
+		native_set_pte(ptep, pte);
+}
+
 __visible pte_t xen_make_pte_init(pteval_t pte)
 {
 	unsigned long pfn;
@@ -1447,11 +1462,6 @@ __visible pte_t xen_make_pte_init(pteval
 }
 PV_CALLEE_SAVE_REGS_THUNK(xen_make_pte_init);
 
-static void __init xen_set_pte_init(pte_t *ptep, pte_t pte)
-{
-	__xen_set_pte(ptep, pte);
-}
-
 /* Early in boot, while setting up the initial pagetable, assume
    everything is pinned. */
 static void __init xen_alloc_pte_init(struct mm_struct *mm, unsigned long pfn)


