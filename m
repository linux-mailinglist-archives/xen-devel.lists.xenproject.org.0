Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E75641D9F3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199891.354212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvJA-0004kg-7B; Thu, 30 Sep 2021 12:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199891.354212; Thu, 30 Sep 2021 12:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvJA-0004it-2o; Thu, 30 Sep 2021 12:37:04 +0000
Received: by outflank-mailman (input) for mailman id 199891;
 Thu, 30 Sep 2021 12:37:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVvJ8-0004hO-J1
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:37:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14e64bfa-0714-4185-8266-1e86bbc43d80;
 Thu, 30 Sep 2021 12:37:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-DpP6b-ieMKKti2mFjHTOAQ-1; Thu, 30 Sep 2021 14:36:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Thu, 30 Sep
 2021 12:36:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:36:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:20b:310::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 12:36:57 +0000
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
X-Inumbo-ID: 14e64bfa-0714-4185-8266-1e86bbc43d80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633005420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kQLmBvAO/NkPEGuiu0F/4ldlzMcypIF4EQud5MBiHsY=;
	b=KPMhD+ubwGcbeJ0Z2FbrprXjSue7JAAg7cG2m0GyPJ+FF4jtAEloLuVzW74wOw1nzDRigx
	DrwceYg5vXeKkTYgP8kP9NtGOUyOqdn/xJ6gDJ+hp1RAwwdlQJxRzuWk/1pLLb69h/OX7d
	Ie6o1qBwoizJS8rH2L8wai7I7wK0/FA=
X-MC-Unique: DpP6b-ieMKKti2mFjHTOAQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLgF1NznO7aBcsrf6Z1TOlaQBeHNNiUvPb2gb58YMwWGMdmcyr53JQqCdpcreZ7Mjb/r45nbJqKRFxjSMVd2QOxHKosrUQFuTwT+EVoUjNVyMS0PnkPMXSesUtCjVATBVJxx7gfyithJ2fp/wuINmACD9+GToLPPAIuYsWgu+3sPgOBFlVp4bumGgND9EYYPXXHC3Omys6Gff0HXtaCoCX+SKwbru80+fbcMq3mUvkBoQn9Nej8YmFuUW14Z/B0hnY52aQZHLj6eH/boVdwg1uuUFBMr0cpLDBtUQwMyzvER+c6XOE9unB1CzuUQ/3nz4fhX/TZCmjUB2N/1dAscrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kQLmBvAO/NkPEGuiu0F/4ldlzMcypIF4EQud5MBiHsY=;
 b=WjwgnqVCBjNuQzXULQV5ichQfsGruTlopM3javsrTOXEu+Z9uY6ZPwGMPhlLJM5n2tqvRorzSHXGxZXHrF7Nmn25LCE5saLTdE2VldA3Ms6G2pzc8g5xc1HAQu4GnHedfbjHbzblLVVXm3e4zUrPBCsNTEoLjQhYwUTjqyGSIOnDInLJkqiUFfjSnBb1dxe8WxDbOw0iW2y77A4c/R7u8UMeAaKUG5jb66LenCx9nC0isclvQMvtEO7DU2bf0C3LkjqAQ8vaDIIBqAWjUgVLmtgu4B5JCtWGlwGSFt28vfOqvyc3vF7JkDMw8BKeyXO67qz7j/8a+sIDxs/mUnfVng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 5/6] xen/x86: there's no highmem anymore in PV mode
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Message-ID: <ba6e0779-18f4-ae64-b216-73205b4eec3c@suse.com>
Date: Thu, 30 Sep 2021 14:36:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <022b1a5e-4121-6bae-f07c-4ad5eac12481@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0006.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0612504c-decf-405b-a082-08d9840efe61
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63832D0048136F8F301FF155B3AA9@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R4UcBi46QwQHaVjkTAZQCfIupTQMqrpyBx9n7ju4hxbxhJQkdJVISVHTlCeCjp0PFqqT18cQXi5Br8YkyrctwK6p4eIjkHXb2VeOBBLWk+DVHVtVmUNLSC5t9giu8zkNZkkWUG6JQabWTd804QPntlKBrEba+0qEI9boaajzUrwVXWM+nvk1dYGj/60hq+hhxGN8XnUgbFGEicwvyedCnP+AjMnIiHywhqSBPSfK8HcH77XBaNQrMG/scSsBW7BbTLhr54CLGpqVDPB1khY1bkLtO28R/m8iVrRanDHjeTfGHh13sanFzW/cwvE2XCh+aQM+PqyqefjUBftXJmwQM3ri9hVlwqu4KOPDmQhtspyVl1iK+VB8QuyhsIEE9o91TU43LWh39uVYFaUdFTMg008Q/obFHIqvGpgCaOsJNhZWgCr+hhJAKzx7XlnRm1L/WXQANRPXGfR0s16utEEr95IPWhGB5sxlUOTPgGZ2xBybR3gjKsJ+B1QVciSRCpBZ8Opw+mgBZCltRvCAO3DPEWNjOAhQavCdMXkCdj3mepDdjeLFmwtZB19g5H9gfzKGG9AzEu0pGUOQ2i3nKkC0l19YiQmNDhTQ1BDQtHd4nD7gUBCM5mvmVbWQMFhz6fA/UKzA0KI25SJ76/kk9CxorPwfuHBng3FI5ix6dipLk1iW/OXP8D/gABOvQOINqK48t0OY1fqCKeYPEOo1S9fyQy1/FYGrM6iI7U2aAubCwoI2hx7HxILDmXIiRqZ6dIgy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(2616005)(186003)(956004)(508600001)(31686004)(66946007)(83380400001)(4744005)(8936002)(86362001)(2906002)(31696002)(16576012)(316002)(38100700002)(110136005)(8676002)(36756003)(6486002)(66556008)(66476007)(54906003)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVNIQVdJUFNvZEhPTE4zZ2Y2U2lwdnh4ampJcHA4ajB3UWtnR2JMR2hOa1FB?=
 =?utf-8?B?NXVJWDcwQ3pkTXliMU5jdDMyeWtmam8yV2QydHp1bURsWGhvT1cxUW96c2M2?=
 =?utf-8?B?dUpsKzRJb0lIRzNrSVAyVjYrcnRQSWpabnQ2WU9PMC93TVhnTkFLakdRT2lT?=
 =?utf-8?B?b3pEcXB5Zm9qN3E1TkV3dklqVnBLWE9QaWhORWh3MmtlbFpSMGhFcFExQTVa?=
 =?utf-8?B?TFVzOTcvWEJNY29NamRGRy92RXM3MzY3ejk2RWpTUzU0eWNzdC9yL1Ezanov?=
 =?utf-8?B?bkErZEhvQWR4VndmNlRrZEkySE5mdjZGRVNlTjZ1ZHpUTElIOWdabkRiL004?=
 =?utf-8?B?NnBUSGFHRlJnaUY2U2hKWDZoQ3FHTkpzUjI4RGxQaDhJWFV3anZtY0FVcm9C?=
 =?utf-8?B?aW9jdXQya2dWcGF6VEZGK2I2NDFaSEJhQ28vd0dQTWIzTE9QTDZOUUk0RlFj?=
 =?utf-8?B?S0ZZVjU2ZTRhUzV5b1FWOFQvUzUxc1R6SEdqSEhabVNDbksrNTM2MUlBck8v?=
 =?utf-8?B?dGtLNE9oa29kQ2UrWmNYU0N6T00raEtoaHEwWUg5V3JZNzg2SDQzMml0VCtY?=
 =?utf-8?B?U09zWDNEUGVjQ0NKbnM1STdtbTE1UDdlMjZLcEYvY1NVdXdkTUU1aUhzUFVo?=
 =?utf-8?B?bGJnUkpSZ1I1RjFXaXJEUVh1S2hDVEwvUk41Q3ZkNEFoR3hSK0k2VTdTT1Bq?=
 =?utf-8?B?UEJ4cllINXg0c01rT21kL0dCVHV3dG9PVVlBcHNGWmg4VVp4cFdkQjJTTy9j?=
 =?utf-8?B?U2t2Ri80bkp1RitYN3c5dzJ6ZG9paGFDeUh2eUdTL1hTTGo2QXZGV2krYUR2?=
 =?utf-8?B?dmZqblZ1ZTliTjdzZ2laOFMrTHlFb09tOFNpNnZIdCszMFVqWjFpU0xQampw?=
 =?utf-8?B?Z29XUitya3dmTC9nb0pqcXkwTjlxRDhrWFRMSEY1bUtuazZEdzJ1UHpTTy8r?=
 =?utf-8?B?b3E3T1FUd3lhSkRIR1dRSDdOWks2VEU2dlR5WFQzNFpON0VIaWRkWVJNd2c4?=
 =?utf-8?B?eld4aUxvY0dFMDUzdFN5ZEwxWEM3M213dGlGaHJqR056VkVua1BaWHhRT1ZQ?=
 =?utf-8?B?eHVHWld5VXY0dW9GMFVvS05DWkhldnJXck9tU0JwNkxLTVQrRUk5Zk9FQlNa?=
 =?utf-8?B?SzR3aC9MeDVwUHZEbWFwK1k0a2orcGxhVCtrbXBxTk1ObjZLd2VHc2VTYTRk?=
 =?utf-8?B?bFJPaDBxZm5nWjhjV1FQeUczNDIxbTlrSW8yOVlxMlpOM3BkTTdQcmFJQmQ1?=
 =?utf-8?B?b0E0MnVLbkVDRSsvV09oTUJVOWQwbFgxRXVUTzhwM1lHQ2xxcTMvQlhaOUdh?=
 =?utf-8?B?VkIyMkc5V0pjRUkzTkpxd05NUitnTTErTVlyUjVHeDBVZXg4UWZCWGpYRjR1?=
 =?utf-8?B?bC9oRXQwazZoWXZIOWpJZFRtNTJVK1F0T1djMjg0a2pKZVlzb2QwWDBSMDNJ?=
 =?utf-8?B?NEFUVmtucVBWTEhPRnJ6eDhhMlJJbDliOXFsZGk3NEh3VVpHcm54eC8vUWhQ?=
 =?utf-8?B?blNQZWxBWGhHdzZGWlNHb3dyeklhSjkvc1h3MXN2QnFvSEpPdkFrdVFZaFp2?=
 =?utf-8?B?WElKZzlNN2poT2NSYjUrTW5NdFErSzcvbEZDNjlrTDNqWjlwdkZqZkVkWnZ0?=
 =?utf-8?B?cWExVlpGS1dxQ2VJWjB1YXVhUUxzTWxxQXc3dEdEUld1cVU3Q01lRHZpZDJi?=
 =?utf-8?B?TThyV2JoZjlmOU90enhZTEROcTRkTVBTdFczUmsxNVduZ1M5eVNuTG8zN3Ux?=
 =?utf-8?Q?Jg+1OiP19zLbircV4luKpuR4I3O06jn9mVVG5eH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0612504c-decf-405b-a082-08d9840efe61
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:36:58.2824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lorDMFZEw33I+PbNj/8V+X2Uh+khFHY8f/LF/MBUkcYTQgNai/Ztpy/5HDhjm0hmyow0lZj1JBun0R3ePZGdVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

Considerations for it are a leftover from when 32-bit was still
supported.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -306,10 +306,6 @@ static void __init xen_update_mem_tables
 		BUG();
 	}
 
-	/* Update kernel mapping, but not for highmem. */
-	if (pfn >= PFN_UP(__pa(high_memory - 1)))
-		return;
-
 	if (HYPERVISOR_update_va_mapping((unsigned long)__va(pfn << PAGE_SHIFT),
 					 mfn_pte(mfn, PAGE_KERNEL), 0)) {
 		WARN(1, "Failed to update kernel mapping for mfn=%ld pfn=%ld\n",


