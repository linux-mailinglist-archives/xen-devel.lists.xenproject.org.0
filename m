Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308C24674C1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 11:27:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237269.411486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5mq-0007JD-JP; Fri, 03 Dec 2021 10:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237269.411486; Fri, 03 Dec 2021 10:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt5mq-0007HQ-GK; Fri, 03 Dec 2021 10:27:28 +0000
Received: by outflank-mailman (input) for mailman id 237269;
 Fri, 03 Dec 2021 10:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt5mo-0007HK-Va
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 10:27:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ba845a4-5423-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 11:27:25 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-JRSZj1emOoa2WVAMWPpPlg-1; Fri, 03 Dec 2021 11:27:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 10:27:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 10:27:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 10:27:21 +0000
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
X-Inumbo-ID: 9ba845a4-5423-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638527245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qd/TigLIzjUj24lc/Dw5lF5QbUtrPKoswGl6ERzbPRs=;
	b=UrvHToatpmM+p4sLHqTU8mrKSA0HOcXRfNbuPjdVo0l2V3wTnjJyRu3MsPxNH91IeX1TJX
	I5TYg/WAHvrlsmgP/3sTdjOb4g0gvy01uvtOHVheIPX51AsQdLaVvuGf3FJsis9Y2pJlz9
	u1IzLRTsjNp0M5VsKl+GHajug80ozHk=
X-MC-Unique: JRSZj1emOoa2WVAMWPpPlg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Me9qDNkpOm+Z6qAOZZIXFkxSH3Sw3iI7yWCzcp7APS9afkd+7H7EZXMBmYeUoCWYrKipoZWbfzcdHJxmYNk/aKSgawqKnqCuiilFWNnqlnocNqMARS3ETnUvdo8+sh+YegtUYpRGq9+bANgBmQhH4J7ggOJXPmrmTRAa1YGpWuCfKZ4Z6s5xJaXM8fkpRIRxWmLSyHN/nMXVzZb18n1nIB6WdL7bV4RS9zXrt9JY1ABU3DVO1vapxgUioald6+D8XEU850dUlrHF7LRuC/ZQXCyp74ndUd66RXDH/P5DL0dywjx6AWZ0dnDRUJ7Iqix/xnea7yLeYp/rIhJXTPQxcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qd/TigLIzjUj24lc/Dw5lF5QbUtrPKoswGl6ERzbPRs=;
 b=HbIEi2/UoJgSMaVAXy/Swj0w39Ogk0889fSdbxcp0SzBiyuCZCLw+NcF911EwWzYwMa4oM1pSNZalX2Cqd5Ey4OVdk/0pHo0CRbbHCqP/0CVyT6oz66oB5b3E0B64yuzgPaf9iCCVlm4fcx7hCn5e5btosF9ZCwDhcucRxjmiVPjbsKbmDJjaaut7Dk7T8UxlabrnqKsrPwZ+bdTdGEhUKsg+NRDIeKnIetvI396OsR2UrA6aYIHt4Z6in3zB92cCoqciCfxbQgJc1C5X8Fi0JIuhMD/4BONYMPzFhwCTmOn3Vh+mlNPW1AZ788LsYwztuCnUcy7xEYeI6mT2aWNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d675c6c-8cb1-f218-75d7-cb13f8b2e669@suse.com>
Date: Fri, 3 Dec 2021 11:27:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5] x86/PVH: improve Dom0 memory size calculation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11b10955-8600-4235-efc4-08d9b6477ddd
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4352E591C86796834D550CABB36A9@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H968a875WSSATk4y6pGNmAODxk17gjzR3Qxk2prr/nU4FIstP12GCy3wndP454BRwQLfk6Oel4cw5GTySqXBN0VKk0RKRbNeJW7E2Z9IuMZWLmMWTkV8JH7vjM58ffJTOKFPeSoeNhpwalFPu8ovSy4/Z2Y13TV9np6gHoaC5PKXGuOfsA5uHaLbp6ouGK+a4Ll4kP+dw7B5NQZAuDk1myMrx1oCxU/dJlEY15z7GtuhbBqfkYd5CzFcFHKXDZ5njsZeJdeuNYhsx5nVazjBwp5s478mwV498LIwPvWmY9RpbxGxNn+rOQdMFiq9Hrzs9UOOG6NxmP/U4ueHlrW1H5Y5LQHTVaRysg2HHm6nIiJJ3/ecaLw4YVWk2GdHzx0WiGdj//e7N9rbQO8vp8XVJQ64UdnrDCOUIQT+6iUDARg6IbhkqTBM/yNrK4dn6yIlvnNaXb5BltK0eYF6pWtsPzvVf9IN3ezZMPca+7FLFXEHVd0wstcaiIpWy4U3344UkYcv/7fNNXUzXkK/pfBguoGLTpIEW0tdFtMF1iJX9G3sHx/nXplOTqXlvP336d6brr1ZkxUGj2erJMzSMIqKFO68EefdhfZogegrlB+Hlty5T3qqAjTdbnaSk6QReR1kbJ9aZOx3PxS54lfxdvdIgIT3LbBtLdeaeCkKZt26dw6N+pWayIL0Fr60NZEdxIt6CqiHm/CWNPHVG2M3oENzBz1A/BRhzO5kIkGvyNCjn6RwjSEmT37U4MGY4OIBCVeMxY1VPseEolo2SgKKAlPJTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(2906002)(31696002)(31686004)(956004)(8936002)(508600001)(36756003)(54906003)(86362001)(16576012)(316002)(26005)(186003)(83380400001)(38100700002)(66556008)(66946007)(5660300002)(66476007)(8676002)(6916009)(6486002)(4326008)(25903002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVFYZm16SUJNZnRlYi8zRlFudFExeW5nMkZKS0hLTWRWZWYvRmlkS1dYenRr?=
 =?utf-8?B?RjFQNHpaYXNpTm5XUlZIejVBVy9ZNGFOZkdaTm8wSDlESHNYWklwUXBuejAr?=
 =?utf-8?B?RlI0K0dJWXdUVmNoeWZzTXV5bldhSVdINWd0c3pkc2xZVmxWdHoyNUtKRnRr?=
 =?utf-8?B?QjFhQnVmRThZS0M2TmdHOXJsRG5MaFFoY1AyUXhFYXdkN2RxTWtZZTM4aGNl?=
 =?utf-8?B?OThoZzZsMGhzMW1HRmxkVjd4M1pTeHpCNVk3UXFOdUU0WWoxV1F4VFgrOGI2?=
 =?utf-8?B?K1V6Z1IzNE9hdmNKLzFWK0FKMGFKcXlZdUkyMzcvNE5zQzFpRHdiYTdXS3pC?=
 =?utf-8?B?MExwWjBDNkVheGNOZDhjQVlzRlZRSmIrUWRUQU5MNk5kV3EzbURiaGJhUGUy?=
 =?utf-8?B?THcxUHdrNlBackNOWUtxdzIvL1JETkdmaFlBWWVCcFd1TzdqSm0vcUJFMnNF?=
 =?utf-8?B?R3hDTmZadDVHaDRpMVIyOFhBc0JoQXptVExRUWxISVU4MnEvNG5MS2ZvRWV1?=
 =?utf-8?B?QjllWEVPUUYzSmd6ZFpEUUJRRFB2ODdvRWNNUU5pOWxxSWR2THRoV0RLSnpz?=
 =?utf-8?B?amVBMDJvaVBVTmFZUEUxTGtxc205aW5Ec1RIODZidmdUK20xMEhmYytGQmRY?=
 =?utf-8?B?OGxGa2hGWTAydEpxMnVOK1NHdU0vYTNpSzM3dkZGdTl5a01vMzlTdEFKVEht?=
 =?utf-8?B?aU5GeW05OW82TEpCSDNyTWVzcmt0S1phdkt0aWxFM0RQMHJ2a1pGT1dVQUF1?=
 =?utf-8?B?a2wzaStIRzlFcGgyVEs1TUhlS25TaUl5UjByL2hMUHJHYTJFbmp0NUx5YUx3?=
 =?utf-8?B?SVdFS3h2UU80ZndaQU1hZkprYkJrbE5ScFUyVU1KWTR6NlNlSnFqVUx3cWJD?=
 =?utf-8?B?MkkvR1h4VFlwQWNKd3duQnhQeU9tcVN0dlN6R2l3ZGY2d1ZEVzNMR1hrbFNj?=
 =?utf-8?B?dXRSekI0MHJlWDJwZEg2VXZhSUQ4eHY2NHpKdm5MQ1NkQkVVN2o2MGVkL1d4?=
 =?utf-8?B?QU5MOWxua2dPd3c0dWUrZDV6RmVXV0VvcG82dDZrY1hVSDdqbThaMkJmVjFw?=
 =?utf-8?B?WDFWS0FtbnEzQkVRVzBXWDd6UkV4ZElubSthWlBiQ3VzWDErUGorNFp1L0Rq?=
 =?utf-8?B?NUdDeCtvMys0Ym9pUGhwNi8yejlxbUxFaXJvZnI5Vm85VlRtS0ZnbWRwTzRh?=
 =?utf-8?B?b0JnUC9OS2dlVVErVXhDK1FGOVEzaHpDb3pHdHBqV2pYc09SSFQyZldTQmVl?=
 =?utf-8?B?WEw5MFl4NWdXTFcwRitqY0ZrSk5YS1ZwNzkwa05tcEw5alhydFh1cFcwNGQr?=
 =?utf-8?B?eVRKeHFMNHNqNzF1NjEveHk0YVd0RDRaUGhQd0dqZjhBQUxIdFpZQkhLNGJR?=
 =?utf-8?B?SEJHNVdKU1lMRk9Ob3hLcXNiU0VpdlVCbGRLaUp6cHI3dWFaNWRnd3FPMWl6?=
 =?utf-8?B?bHR0eWc0NUhJby8yRUxEYWFkVVZKSDlWdGxIQS9ZRHVWTTF1b3h4ZFkwSUVC?=
 =?utf-8?B?RVVLV3pZYjI0V3cvT2N4dEo1Rk0vSGtyMTRkOXRabmVYeHh2dndGRlA0NWpi?=
 =?utf-8?B?NkluMDY1aXdiZDhKWlk3SVZWMGZaWnFDS1dJSm9RdThENCsyQ3R2NnIxWHc1?=
 =?utf-8?B?TVBKNlB1K0hieGEvSGFxVG53am91eGFQTWdOd2JudEJtQndrRVVyMUNBTG5K?=
 =?utf-8?B?ZzVPRU41YjlMeTd6clNsRFRFOWVDbFZlU3ZDSUY4NE1sZ01XM0YwcmJBUjFY?=
 =?utf-8?B?dkxVcUxDT2lvWS9Od05xUXo4bytPLzRYN1U1cjRYTksyMDlPQUgzVEUzOWY3?=
 =?utf-8?B?SEVhcFZrb2Rmcmw4RHVPdm03Y3plc3N5VUkvMTFRajBpc1pSY0FxSkZGN1Jl?=
 =?utf-8?B?MnFJdWhCdzl2Ry9QV1NBOGwxMTlJZ3pUdjFXc3dQT3g0ZStKUndmcFA3V2hE?=
 =?utf-8?B?dnIxOUl2NnhHSkJFcFhvejQ0SVY5UGtiQ0UxdWdpVHZJa3NJM21TeXVqOG91?=
 =?utf-8?B?NWk1RTdGbENqdFBqbWwzZnNubWdmaWJieFRIMWUydlJ5dHRYeTdlWE4reW9C?=
 =?utf-8?B?Q01qdStlaHV3ajBIeTJIS1VzRjVWeDNsUTBGbUxqR3diWkFGVEZlVUp4K2V1?=
 =?utf-8?B?cUQxcVlvcDNUaExISmRBeXlGbmRxdXMvZXhtNmR5SWh4eVl4QWNMd3FBcGFa?=
 =?utf-8?Q?HfDwxmg7Et1yVRhaCN6MjUI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b10955-8600-4235-efc4-08d9b6477ddd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 10:27:22.1315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6usmQgYID0yeUgHE/pkw7qxr/rlwmRN9b7VkPfIb6o2xXi+MXApcjelLPew1mKYHpC2eWddAuOLbUOR4iAZNeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

Assuming that the accounting for IOMMU page tables will also take care
of the P2M needs was wrong: dom0_paging_pages() can determine a far
higher value, high enough for the system to run out of memory while
setting up Dom0. Hence in the case of shared page tables the larger of
the two values needs to be used (without shared page tables the sum of
both continues to be applicable).

To not further complicate the logic, eliminate the up-to-2-iteration
loop in favor of doing a few calculations twice (before and after
calling dom0_paging_pages()). While this will lead to slightly too high
a value in "cpu_pages", it is deemed better to account a few too many
than a few too little.

As a result the calculation is now deemed good enough to no longer
warrant the warning message, which therefore gets dropped.

Also uniformly use paging_mode_enabled(), not is_hvm_domain().

While there also account for two further aspects in the PV case: With
"iommu=dom0-passthrough" no IOMMU page tables would get allocated, so
none need accounting for. And if shadow mode is to be enabled (including
only potentially, because of "pv-l1tf=dom0"), setting aside a suitable
amount for the P2M pool to get populated is also necessary (i.e. similar
to the non-shared-page-tables case of PVH).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Fix the case where no command line (or built-in) option was given.
    Further re-work of what was done for v4. Also check
    opt_pv_l1tf_hwdom. Actually remove the warning message.
v4: Rework to eliminate the up-to-2-iteration loop.

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -19,6 +19,7 @@
 #include <asm/io_apic.h>
 #include <asm/p2m.h>
 #include <asm/setup.h>
+#include <asm/spec_ctrl.h>
 
 struct memsize {
     long nr_pages;
@@ -321,12 +322,22 @@ unsigned long __init dom0_paging_pages(c
     return ((memkb + 1023) / 1024) << (20 - PAGE_SHIFT);
 }
 
+
+/*
+ * If allocation isn't specified, reserve 1/16th of available memory for
+ * things like DMA buffers. This reservation is clamped to a maximum of 128MB.
+ */
+static unsigned long __init default_nr_pages(unsigned long avail)
+{
+    return avail - (pv_shim ? pv_shim_mem(avail)
+                            : min(avail / 16, 128UL << (20 - PAGE_SHIFT)));
+}
+
 unsigned long __init dom0_compute_nr_pages(
     struct domain *d, struct elf_dom_parms *parms, unsigned long initrd_len)
 {
     nodeid_t node;
-    unsigned long avail = 0, nr_pages, min_pages, max_pages;
-    bool need_paging;
+    unsigned long avail = 0, nr_pages, min_pages, max_pages, iommu_pages = 0;
 
     /* The ordering of operands is to work around a clang5 issue. */
     if ( CONFIG_DOM0_MEM[0] && !dom0_mem_set )
@@ -344,53 +355,47 @@ unsigned long __init dom0_compute_nr_pag
         avail -= d->max_vcpus - 1;
 
     /* Reserve memory for iommu_dom0_init() (rough estimate). */
-    if ( is_iommu_enabled(d) )
+    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
     {
         unsigned int s;
 
         for ( s = 9; s < BITS_PER_LONG; s += 9 )
-            avail -= max_pdx >> s;
+            iommu_pages += max_pdx >> s;
+
+        avail -= iommu_pages;
     }
 
-    need_paging = is_hvm_domain(d) &&
-        (!iommu_use_hap_pt(d) || !paging_mode_hap(d));
-    for ( ; ; need_paging = false )
+    if ( paging_mode_enabled(d) || opt_dom0_shadow || opt_pv_l1tf_hwdom )
     {
-        nr_pages = get_memsize(&dom0_size, avail);
-        min_pages = get_memsize(&dom0_min_size, avail);
-        max_pages = get_memsize(&dom0_max_size, avail);
+        unsigned long cpu_pages;
+
+        nr_pages = get_memsize(&dom0_size, avail) ?: default_nr_pages(avail);
 
         /*
-         * If allocation isn't specified, reserve 1/16th of available memory
-         * for things like DMA buffers. This reservation is clamped to a
-         * maximum of 128MB.
+         * Clamp according to min/max limits and available memory
+         * (preliminary).
          */
-        if ( !nr_pages )
-        {
-            nr_pages = avail - (pv_shim ? pv_shim_mem(avail)
-                                 : min(avail / 16, 128UL << (20 - PAGE_SHIFT)));
-            if ( is_hvm_domain(d) && !need_paging )
-                /*
-                 * Temporary workaround message until internal (paging) memory
-                 * accounting required to build a pvh dom0 is improved.
-                 */
-                printk("WARNING: PVH dom0 without dom0_mem set is still unstable. "
-                       "If you get crashes during boot, try adding a dom0_mem parameter\n");
-        }
-
-
-        /* Clamp according to min/max limits and available memory. */
-        nr_pages = max(nr_pages, min_pages);
-        nr_pages = min(nr_pages, max_pages);
+        nr_pages = max(nr_pages, get_memsize(&dom0_min_size, avail));
+        nr_pages = min(nr_pages, get_memsize(&dom0_max_size, avail));
         nr_pages = min(nr_pages, avail);
 
-        if ( !need_paging )
-            break;
+        cpu_pages = dom0_paging_pages(d, nr_pages);
 
-        /* Reserve memory for shadow or HAP. */
-        avail -= dom0_paging_pages(d, nr_pages);
+        if ( !iommu_use_hap_pt(d) )
+            avail -= cpu_pages;
+        else if ( cpu_pages > iommu_pages )
+            avail -= cpu_pages - iommu_pages;
     }
 
+    nr_pages = get_memsize(&dom0_size, avail) ?: default_nr_pages(avail);
+    min_pages = get_memsize(&dom0_min_size, avail);
+    max_pages = get_memsize(&dom0_max_size, avail);
+
+    /* Clamp according to min/max limits and available memory (final). */
+    nr_pages = max(nr_pages, min_pages);
+    nr_pages = min(nr_pages, max_pages);
+    nr_pages = min(nr_pages, avail);
+
     if ( is_pv_domain(d) &&
          (parms->p2m_base == UNSET_ADDR) && !memsize_gt_zero(&dom0_size) &&
          (!memsize_gt_zero(&dom0_min_size) || (nr_pages > min_pages)) )


