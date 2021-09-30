Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3CD41D9EC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199881.354201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvIY-0003zH-Pi; Thu, 30 Sep 2021 12:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199881.354201; Thu, 30 Sep 2021 12:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvIY-0003xD-L3; Thu, 30 Sep 2021 12:36:26 +0000
Received: by outflank-mailman (input) for mailman id 199881;
 Thu, 30 Sep 2021 12:36:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVvIW-0003qN-Gm
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:36:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04402960-21eb-11ec-bd4c-12813bfff9fa;
 Thu, 30 Sep 2021 12:36:22 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-6eL9DEv_Pv2FjHTNjZfUMA-1; Thu, 30 Sep 2021 14:36:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Thu, 30 Sep
 2021 12:36:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:36:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P250CA0002.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 12:36:18 +0000
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
X-Inumbo-ID: 04402960-21eb-11ec-bd4c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633005381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8zK1TzXB8klvX7+Pkf65I5+DzQn9KW4HMfyUQ+KytU=;
	b=VKRTLO8jAajIVo5wGOmhq2mOiqO36DXcIbBucVZF1lFsuk16nm/EKLu9dy28xKnFdfhEpA
	goRqEtecj/e4FeXVorWtHtjX7XDcKKuwu7n1GKIFQjiRvcy9DrF+nzEwjp08VtCqeRm2ir
	lNS3fC7eJMcsmofeghsixzjiN8eAh64=
X-MC-Unique: 6eL9DEv_Pv2FjHTNjZfUMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMBiKcdZwFUlZCDUnusQJqhHEl01m6RqnYCQoiilh8RcBq/yikADO0kZd0xNg4SRVIKUfYrq3iKxYe2uIDcPYkXsF6DZ94GX96k3TiSRJF5DAWdBqeNHteF61SANsoROfAvZMzJ3kae/FwIlJArqXovkYearrU7oM6ninbUbuDN0vwNNtgQzrZAB/HOYaWGVypJMktV+Gs6kySnj9ggFTaLWU0orM1ppMs7qUG9k9H+BaQvRbOkVxB7qm9mkmeCylmCA6TdYsm4Z1NberxqPJztMOdgJ9CmbEGHzVg4Bvw+XdAIatVVtnW32e+eBo4d62Xf+16J+TIlrvn3c45fUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=o8zK1TzXB8klvX7+Pkf65I5+DzQn9KW4HMfyUQ+KytU=;
 b=Z3p//lghpU4IxqbBK0J98DcyYeBPPdwrJ+g9NIcykIvo1f4Xl8DNMQ0WxUm7bPn9w+vSSJ67JFv9GYVNpnBRL85w1XESnDYbTgTDEaMgTuVLbXYmvLUt+jll4pO9gU537gQ9powSL35qzc+jEZ7Aa4gCM65fm6Bka/YeGTzc9IgzYm95vVidqI9pXsKe7wQzZHm22EoA1Q2UlB2dijg7eFaVw9FhcddpiRrQSRrhUk/L08HNoFOm7hh9B+AGFIeGjeVosuX0AO+WPcaRP3uYlvCQty5JhWZeBh4pqxTYt5Tym6mVr45aa6BJO5YjD5egEeno1ll6xSxkARnUTKQ3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 4/6] xen/x86: adjust handling of the L3 user vsyscall special
 page table
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Message-ID: <1048f5b8-b726-dcc1-1216-9d5ac328ce82@suse.com>
Date: Thu, 30 Sep 2021 14:36:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b717692-eea2-41fb-d7d2-08d9840ee6e7
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB638371F6C3E5AD73B331DBB7B3AA9@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gdR4A6Abb/a+iWFzTqvPecxY4Eub29t75bTxiVjq2QZn305HQ4ddz4Bc1OOb+VFCCGL1cNjCrrFtwyUFu8RPc/a2VvspELkOFrkoFe5UHbH7s742kuTdaJkq2rIO21WFXEFMVFH6mXtLcqA6wUPm+BJTpZNqlJuJUGHnLB0r3wqOZBelOEe1ptaH461vAnjkoU7g6fj56UYk5uwye9lRJTh1MfD3DfRyrlRAyM2G37N7zKuVs1r99N3LWmqaDKc+nmyfSs0lPo/6C5WEE1eH+aHNBMIIXTZHwgT9UYpm+IPndP03GvQ77PnOgoGZ/0d26dFf2JUbTiIqzkvsgK0IUfo0sITIiOXLSautuuecisOIm3hJisPM2MjUKokGbbWSzqG6+1+Fdq2mnIr4Nzb9MH8Mf7hy1VyWqMfQ8vHzZxK1hfSseDVkTOdsehd50rLlEmHtE0BcjXdE3q5IsTqw/4LW65Aobf/dkBhcHd9HdLyQXU6WZhARRxPx64w+FPirP9NBPJ8DKwFLDaJZn8GiLTayTQemhdblCBWVFjm4zGo9LAwxpl6wMbTVkB3TNkieRUJcxECQWYmyu0uZPd1COwAurTTcqRwwjPes3uvSbJRQBmhCXN/OG5HhcEgBZ63uc1T5H90dlEE/0LLJV1dSlGgqJ7YBBlOuWm0ZWDqsxbdJKR+DeZR1cKm6wSQxZlE6TX+Na4ILH5aoalSx2sScWmmeDrf3gSpg8H4ubVDFgQHEAGUQQyo71vYynd9FrUAZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(2616005)(186003)(956004)(508600001)(31686004)(66946007)(83380400001)(8936002)(86362001)(2906002)(31696002)(16576012)(316002)(38100700002)(110136005)(8676002)(36756003)(6486002)(66556008)(66476007)(54906003)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTAwNm9TS1RoekNsWmJkVWdpeW9PRkNqb2cxVmRFTnl5ZjZwUjJDWDJtNC9Y?=
 =?utf-8?B?bDkxdU1tczhwNHpmVXdCSDltUWg0S2xzaC9uUUcycG9yMjd5S2V5b20wWlRV?=
 =?utf-8?B?Vk9FZG5sUlc0dmRFUHZ5Q083NVgzTHlSMWxwOGNzZ0pwWVJvM3k5MWdmWlFt?=
 =?utf-8?B?SGQ0TjdVNHh5eUJyRXpGZFJ6eDVmbW5OcFpCSWc2ajlsK2p1SThaZDYwSWdo?=
 =?utf-8?B?NmdWNkcrTFVhUHk2UGxKRWFQN3VDOXQxREt6MTBjaE82c1dqazFHcEN1eUVz?=
 =?utf-8?B?QWt6eU1MK3BaMnoyRGRzSkxCWElpK0h2bEMrdDVrL1NDM0I4d3F6Y2UwVmpP?=
 =?utf-8?B?dDFraFhnVHlsanRQS1RjTDZMSTJONzFyTFZpc1RuV1ZCSmpyN0hhUko3TU5v?=
 =?utf-8?B?cWRoSVZZZWRocytRMHAwMUUrSUREZTlHcjRMMzlKTUM1ZStYYmQ2TU1yRThE?=
 =?utf-8?B?d21NZ1dSV2J4WE1WOEdBZlE1UjlUZTZXS1VZK2ZDelNzWVhBSVdVUWZDL2h4?=
 =?utf-8?B?RDdqb2NvNTVzM2s3dlVKS3RUOHhZTVVoUGQvQTFPandFWXZIRVA2Q09qNUZP?=
 =?utf-8?B?VnJWcGRuQnVycFJKUW1aN3JlK0k2M3VBWU9icXNrRGdSNTBYUUErNWx6clMx?=
 =?utf-8?B?NmxEK0dQemZNc2ZydTVkRnFudlFmdTJJYktrNnZneENIOUhiQ3pIckpoWTl6?=
 =?utf-8?B?R28ybTU4dTN2TGFxM2lKY0pDZEpVTzc2UkNlQ1p2VEp0UEN4UzVML1VRbFhY?=
 =?utf-8?B?VU0rck5TZEw4MTZ5Y05EUzNweW5FQkEwUzhFeDQrd3BxRFdaMVg1dUhmZTJz?=
 =?utf-8?B?bkQ4V29tQUk2T0MrZzVJWmptbVRLUCtUbXk2OWRMOTFPL2ZFdVNtNVE1SzJn?=
 =?utf-8?B?QmpuUTZxbTRpY3pKNGdwYk9ZMUtCT0kyWDBxTTB4K0plWTYvOEV0YUNQRmZa?=
 =?utf-8?B?d3V1NFJQTVRZVlFLQUpPQkFiUjhrMFVUMmJsMldvQjNaS0E4QWZnOW9uMlRn?=
 =?utf-8?B?Q0EyUnBMM1FESWkzVUkvTS9KQkpJc2tzQkYzMWdidGEyMFpnY2xQVTg4RjA5?=
 =?utf-8?B?c2N2NWhVeEc5TFRMbGVscC9DQm5nczA3TlJwMUFBTnpzQjAyU0hvRFBTeVdE?=
 =?utf-8?B?TDRDVk9tWTluSzNQK0Y1eGFjcDc4NUxZVjl0alFMZlNiM0QyamZ3SC81NWl0?=
 =?utf-8?B?Q3FtbmtSRktlRDJtOWVlOGNFeVhUOGcxOExNWVZ4ZVlkV282Tnh3cEljKzVG?=
 =?utf-8?B?WTNSMzRtS0FEeDJZMmw1V2MyWWtDQmU3alNjTGtvTTNPMHE3TmUwVjloOWFo?=
 =?utf-8?B?M3VISXVDOUJqSWQ2bEpCek4wSks4OWl6MWZPTXQvWDB4V1hET1BCTFJwY2Uw?=
 =?utf-8?B?QkJjUENPVm84eFV5amhlblFjMEJXREg3RlhwczU5cG15cHVtTHo5TWdLbmk3?=
 =?utf-8?B?QUlSMXdaY2RwTVpMM2tXMEhZdWJlb2tYZmVHRnBXSHpSTE9PMGhaZy9mYlNJ?=
 =?utf-8?B?VS9aWktHd2xpUW54L3BodDhoeDFZRGhEOW00OEpXcUNyS3MzV2htTk9BaDJr?=
 =?utf-8?B?SHdmeGVrai8xcnk3NTJlSGgyVXZxQjk3anNBN25hY2docnZRVVZHYnA3VllW?=
 =?utf-8?B?MGpsUlhsbERiYkZZb0NrYWpxME9yVlE4QklMQkFIODBOOFQyMlIwemlqYnpJ?=
 =?utf-8?B?VDlYUWoyQ0JtTzZsZGQyaXRUTysxYWxxRTcvczlJMDZiamV3Zmx2eHVQajVO?=
 =?utf-8?Q?c9peOGsyC02fuM45TWZ2tI0IDfAblxG1zFUz95G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b717692-eea2-41fb-d7d2-08d9840ee6e7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:36:18.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/UVvcBHTex3EDann2EoFsoQf08BAYRzVOqe4nNdq8gQITWVXi39PUQVG29gmdW3u5gyJ6YEe5ipqfbkTqb8sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

Marking the page tableas pinned without ever actually pinning is was
probably an oversight in the first place. The main reason for the change
is more subtle, though: The write of the one present entry each here and
in the subsequently allocated L2 table engage a code path in the
hypervisor which exists only for thought-to-be-broken guests: An mmu-
update operation to a page which is neither a page table nor marked
writable. The hypervisor merely assumes (or should I say "hopes") that
the fact that a writable reference to the page can be obtained means it
is okay to actually write to that page in response to such a hypercall.

While there make all involved code and data dependent upon
X86_VSYSCALL_EMULATION (some code was already).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -86,8 +86,10 @@
 #include "mmu.h"
 #include "debugfs.h"
 
+#ifdef CONFIG_X86_VSYSCALL_EMULATION
 /* l3 pud for userspace vsyscall mapping */
 static pud_t level3_user_vsyscall[PTRS_PER_PUD] __page_aligned_bss;
+#endif
 
 /*
  * Protects atomic reservation decrease/increase against concurrent increases.
@@ -791,7 +793,9 @@ static void __init xen_mark_pinned(struc
 static void __init xen_after_bootmem(void)
 {
 	static_branch_enable(&xen_struct_pages_ready);
+#ifdef CONFIG_X86_VSYSCALL_EMULATION
 	SetPagePinned(virt_to_page(level3_user_vsyscall));
+#endif
 	xen_pgd_walk(&init_mm, xen_mark_pinned, FIXADDR_TOP);
 }
 
@@ -1761,7 +1765,6 @@ void __init xen_setup_kernel_pagetable(p
 	set_page_prot(init_top_pgt, PAGE_KERNEL_RO);
 	set_page_prot(level3_ident_pgt, PAGE_KERNEL_RO);
 	set_page_prot(level3_kernel_pgt, PAGE_KERNEL_RO);
-	set_page_prot(level3_user_vsyscall, PAGE_KERNEL_RO);
 	set_page_prot(level2_ident_pgt, PAGE_KERNEL_RO);
 	set_page_prot(level2_kernel_pgt, PAGE_KERNEL_RO);
 	set_page_prot(level2_fixmap_pgt, PAGE_KERNEL_RO);
@@ -1778,6 +1781,13 @@ void __init xen_setup_kernel_pagetable(p
 	/* Unpin Xen-provided one */
 	pin_pagetable_pfn(MMUEXT_UNPIN_TABLE, PFN_DOWN(__pa(pgd)));
 
+#ifdef CONFIG_X86_VSYSCALL_EMULATION
+	/* Pin user vsyscall L3 */
+	set_page_prot(level3_user_vsyscall, PAGE_KERNEL_RO);
+	pin_pagetable_pfn(MMUEXT_PIN_L3_TABLE,
+			  PFN_DOWN(__pa_symbol(level3_user_vsyscall)));
+#endif
+
 	/*
 	 * At this stage there can be no user pgd, and no page structure to
 	 * attach it to, so make sure we just set kernel pgd.


