Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 396973F14C4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 10:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168421.307500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGd2C-0004P5-8k; Thu, 19 Aug 2021 08:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168421.307500; Thu, 19 Aug 2021 08:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGd2C-0004M7-5D; Thu, 19 Aug 2021 08:04:20 +0000
Received: by outflank-mailman (input) for mailman id 168421;
 Thu, 19 Aug 2021 08:04:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGd29-0004Lm-UN
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 08:04:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dec65e1a-001f-4a55-baf5-e0d4feacb6c9;
 Thu, 19 Aug 2021 08:04:17 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-Jd0r1s6wOz2BRnBguWTHbQ-1; Thu, 19 Aug 2021 10:04:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Thu, 19 Aug
 2021 08:04:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 08:04:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.18 via Frontend Transport; Thu, 19 Aug 2021 08:04:13 +0000
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
X-Inumbo-ID: dec65e1a-001f-4a55-baf5-e0d4feacb6c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629360256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3qHfb5KJ+gqoZnXo/WTxBUAAv7PLQTTe/68/DQABjjw=;
	b=UB1FuljJ0gaSCjzoid1Lgzk9WO+LW6fXbDfjz4QHSREgh/Vs8aoSXV/ro3KxP0yLDywajs
	Ws7QqEQhF23SGqys4Chcj5G1e2vq2vSzH0zozGcux12SeMxJR6QJTvQ9kgSVCs2dDCd4j9
	UJaid+5zbBycPiqhInQXvdj8K/ejA5o=
X-MC-Unique: Jd0r1s6wOz2BRnBguWTHbQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/iZvSkYOSu0VEOByEKRjtigLEip5w6Toxlakxaeybq5wNeQrKMlEk8oW3zzDFACFH2nW0snBGNy4g3zXTOYezlM8zYCx3I7WpTms6krwKNR+cPoFjLUmSz4No2daPn6OEBH8x67SExPwsg0Iu42UMnGGIwK/wWguqj5ipOghHZ8pJqIWhttpBz9UaSG9C02Xo8ZzkkADvzqu9jwrYKSRS7ebhfIZWTlvFeJVZWXAgc8FMpN4TaY7eVKML95vEsAY9vT//GyUOicPvJv4NtTeksgAeAUB4N+ConZM8QRlWK1rfG0I43FZ/Bx42rmBI9RbeUNfFywUwUkh1J0maw4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qHfb5KJ+gqoZnXo/WTxBUAAv7PLQTTe/68/DQABjjw=;
 b=kUELKvvrFoQxqhou8wCY+/gFwrqVDr/NbWDtxILnNBtlhTVjtvuYYop6mJthagLjSw0NuiXwKf5IcohysPM9VfcUvM0erzwGd9snp9VWyjaBAUIXD64VBubhaswvifQUPvLMobKKYu5qLRrLv3jyFm6oRJ5lvtW+gfzVgblxuEpyBeANlwuBxj953kzN+Q3bAKZ1QRcDoQKuPFgv1yqRG6J2TO/LlAPhbTjQPcB811tsGnbfJeL6aAUccP0Stf9WzsA9WLqR/5e+tEu7aInTw+q7+SzgTtgBUCK8yrdktp8hDTmcWS+F0fXQHFCGyqIAgk6ud8ZgSv8yVlXRCF43Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] AMD/IOMMU: don't increase perms when splitting superpage
Message-ID: <f642d06e-77cc-7c45-0e1e-9cf694712d42@suse.com>
Date: Thu, 19 Aug 2021 10:04:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 724a96c9-f8ac-42ac-e8b4-08d962e7ef2b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335D6D68409302FA48F4691B3C09@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MVGq+lzkk5+to9dmWHxUEn8l2HHiJf/a+/Vs6qYf+Yvk4LJXdpWvu+RNYwlM1XZnTxXLzuUiMFKNqRwA3nzgLnxzemk7SHJTDfGpY8XlvQRaLu3fGHsT2KHYohx/BmgEUp72WSiAoFDJjt/WjH+v5cRdgkK6i3e/KTY1RfMDWNLEHk8lr6QFocSeLWs5UPSG6GldsIsHdMR3O7Vz6PaJGXd/aR69vbhvwFvkATOt8ut6HX2He/COtsb8mvLZKTf4XEdABSaJ63ov59yLdXLCsLqaWQkPretgiEgHHKovjw5L6IWO3FIIJDxvpLpZH4hsiSah3DOtxHwDsNT9Da2Xj8cYLnNEhZwefOs3hoquQ+mambp1Voj/wEOHS7brjFEhLK6sPtdVka5bNoBQS/C9196r7/Nu6WmjOCi8f0GC4USguxg8VMhB+doOdnfQYXN1SlS/1txYZ0oVcjccsuuhvigfM9z3PzVnj7gFpVQGunfc0QC4ZdWCEt2hljVChDhwy6dvHshJorYXBOUEmjdBMlErqM00MfHGx5XJONqpK1o5YQ1O0oSwTDpm3iawmxq2jnQhxxQ6e8TNwyhs1UcnHcwrtF4CxJyhTCgjyDnDDWsUa44Xq/r1ZIr6WXpaW80QBs96AmsFJ2aqfNRzl3JtLps0ekawrAA7S32DGSIAqRL54cW4DKihmUCKYMQzphBZtkF9rTjmzElGQdL1qgYRhQ4JBqzC35UDA5nIumlmY/E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39850400004)(346002)(396003)(376002)(16576012)(66946007)(38100700002)(26005)(8676002)(66556008)(31686004)(66476007)(8936002)(478600001)(5660300002)(316002)(186003)(6486002)(4326008)(86362001)(6916009)(31696002)(956004)(2616005)(54906003)(36756003)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGJlcUhVelIraXRtaTFEMlRtVGpZbTRhZnNTS0RhTHB5Q3BDb25kOVYwcEdG?=
 =?utf-8?B?OTNsdUt5RWRQeVpXYXNsT3pSMDBoNjN6SUl4YlhyTlZ0WUlXODE3TENSczVk?=
 =?utf-8?B?d3A3QnZVZ3d4c01QeTVXZkFOZ3VFdGlPTHY1RmZiWnRnOTNZK2RQd1Fmc3lV?=
 =?utf-8?B?WWxnTFNqd0hRRGVaU3g2amJMa1JRaDVOUW9GN3NpZ2ppOWwrdDJuTG1EWW5J?=
 =?utf-8?B?TnFwNzZqLzhqK1YvU3hRUTVzQ1poNFRZZ3RvMGs2VkR6dmZjR0U0VVkvdFBu?=
 =?utf-8?B?MG1vYmZ2bVhSRGVweEVBWUxUdVBtWEViUFExdXZKYW1rMklhVGxTM29DMEJG?=
 =?utf-8?B?bGE3TThPdGJ2U0hveFBNcWxsbll1aFdtTzMvbFFrRmtyRTMxd3JqWWlPQmdy?=
 =?utf-8?B?YVBZNlhpZ3pFRHV6dU1PZGZNR2U1U3BJbzFvd1d2cmJoOEdrdFEwZkIySUNv?=
 =?utf-8?B?SFpibU5FUDVOdEhJRTJQY1ZuWHp4NEo1Mm13MXRBNW5RcldhRUVNN21jVVVR?=
 =?utf-8?B?UGpTb1liczlETjY0MTQ0NHh0UzBiMkdwVFBJSTBNa3NESlpYK0tPMjlTb0dV?=
 =?utf-8?B?TWZ4MTBMS3oySmpSVll3Q1BhMWIzTk9uaWVsY3RkajRUMlhabnZMejRJblNl?=
 =?utf-8?B?bW0wU3ZLbDNWeFFVakdRZmFScng0R3VwNm42RlBKZ3phRHdKYSs3YTA1Nng2?=
 =?utf-8?B?TzZOZ1pBZUJkRE43VWlnOFo4Y2lyT1VESis2UGdIMUZUV1JUdVFXdmJlQ1N3?=
 =?utf-8?B?enJzRFlkeGU4ejYrVGh1QWFWWmNkakR1YTJvTy9GV0lQN2VMcXlqbHJmMzZJ?=
 =?utf-8?B?Yk1zZWt3ZUYwLzh1NlRyQktmZHA2UGd1dkgyUzl3ejBuaDNpN3Rjajc1OWF5?=
 =?utf-8?B?U013WFVDKy9QWElTM2tweTEwaXBSZEdTVkg3Y1U1OWE0OWc0VndYSGFJMzJE?=
 =?utf-8?B?WUVKNERyMERQdE9yMzRud0F0WnRiV3cweklWbWFiOUh1enRuNzk3WDhYS2JE?=
 =?utf-8?B?bU01Z2N3Q2lieXNUSVpGWnZBNU9iVXBjaGhWcG9uWFFuRGFHS0lWbklrd0d4?=
 =?utf-8?B?bVRQd1hrdGRJSTlicnhOUS9zenp1TTFCcjE1SEE4MVlVbVF5YnhDRWxDUVpS?=
 =?utf-8?B?U214OVFxMk1ycytnOXVEbHBkeVBjVG5TWklUbVd6WWRBRlU0MGRPNmJObGJ5?=
 =?utf-8?B?T2cwdkJpWmEzOUgzNXUrWUlTdlhybjU3NEozMWlNZ3d2MHJRdlk0QXZPbHpX?=
 =?utf-8?B?UWI3YXRXN2JSK3B4VCt2L3FsU3JvTzV2MVRnRVJFTWZaR2sxS0ErTmpjazlH?=
 =?utf-8?B?bzFyMThydkcwTVMySzUxdU1maDUvTDEvN2oxQnlXT1Brb3ZWNEw3QnhBRHA1?=
 =?utf-8?B?OUV1N1l1Z3p1VFlybHAyY3BBVUlLMmJoRnZrTXltcTdzOHlSL3E1MG5ubkJv?=
 =?utf-8?B?eXE3MTMrdFNVOGprTVY4elBIMjF2UHJMc3JzdHVOaU96S1hsRWpuWEs3QmNm?=
 =?utf-8?B?NkNBY1R4d3A4Y0czTzRXYmlQTlVpWUZ2Wmh2dXAwU2V4QzdZaWcxWnozMEIy?=
 =?utf-8?B?dEtCSjIwZFFORWpaSElaLzlGVkVUcTFVYVN2OTdQMERlK0hkejZsT295WXJa?=
 =?utf-8?B?NTFCRXd0OXVSUVlQWGJvd3RmVlpoazNkUE9QdmRjSk4waHgvQkZNd3JBbWFE?=
 =?utf-8?B?UUduMjNrSDRZSE9aS0FBcGZCZ1F2RXNpYmlnRU4rWVZsMWR2Zk5jMXhzRkRu?=
 =?utf-8?Q?zm2jY+tLcH1+JzDmWrRTkU1aKKnJLbVZ2VwYf+/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724a96c9-f8ac-42ac-e8b4-08d962e7ef2b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 08:04:14.0164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ol5NZxCjZO/MnOHb5O/ZPQFcpW3KDOUk99ySjo82NdE7hvLJwWYHX/k8DzRuzbJ9mA1JY9fAhofB8dIaB/+VUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

The old (super)page's permissions ought to be propagated, rather than
blindly allowing both reads and writes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -231,7 +231,7 @@ static int iommu_pde_from_dfn(struct dom
             next_table_mfn = mfn_x(page_to_mfn(table));
 
             set_iommu_ptes_present(next_table_mfn, pfn, mfn, PTE_PER_TABLE_SIZE,
-                                   next_level, true, true);
+                                   next_level, pde->iw, pde->ir);
             smp_wmb();
             set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                   true);


