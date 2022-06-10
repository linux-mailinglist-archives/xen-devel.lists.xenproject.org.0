Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0194E545D4F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 09:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345899.571579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzZ2i-0006Lh-Es; Fri, 10 Jun 2022 07:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345899.571579; Fri, 10 Jun 2022 07:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzZ2i-0006J0-AI; Fri, 10 Jun 2022 07:26:52 +0000
Received: by outflank-mailman (input) for mailman id 345899;
 Fri, 10 Jun 2022 07:26:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LSau=WR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzZ2g-0006Iu-EN
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 07:26:50 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe06::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0ae3f70-e88e-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 09:26:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8464.eurprd04.prod.outlook.com (2603:10a6:10:2c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 07:26:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 07:26:47 +0000
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
X-Inumbo-ID: b0ae3f70-e88e-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqXZusYFeC2YU9uxhk7Mndq1NH99RvYYZKpRuyAe+fYj8UkXBJcH/SjDSmzygqPayYTb5UeaWhb/vL6Wdgusoh4Muinc7HhesY20x+1N8OBV4s+YFnlzKThSrT+fSo50JbNMjVwL5khU82mUn/1xfjqcbX3hfjAK1rJsIZSA+b2++zLpu2bDyvlNicNwZ0WK59yiTsetUoX6a1q1citI12AkqG+NlPjTZtBYP0VOby1mBhFn46W+T4yp0eJjz30mryRpsDzeKg/gi7pinPINuYzAC/dLzy9jMLosEeUvTeHfMyLz+lPbJ/xOh/2MkzpqVcBFXwNnS3No3sMuy7eWWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUi+/aZOqk6Pk2CluuFgLnlx0BJ86/N14ldIJ05RjQA=;
 b=EblOnEHW6lgnDKjgHeZraMEttlhHcwFJhQ+nezDLTjk5HonLYdEwOHZtxApEchHJApVLLjPKfBBCKArF1mxOpKEsdMfpCcloWWVx187NKsyrPkTckx0jr9Fj2Ldp9KnlascCNeNtsenB+Misqxc3DMDJuYfFZaC7N1Vo5WBt0MPPulczLIl9rRVKACyy5gXmSJvLVASYDERzo+5Kh1pxzL7gG6Wd8mGRfyoKd11g3PmFUuLoCJ+G2bVR/bK6SH9UW7FDAPC0ycKG7ut9Vl57Rg+6ZEmUCPwEF7FJLIKrTRJUh5e7xiPGmYCCKdp+067kpr/dFdS5CP21cLOt6w5CJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUi+/aZOqk6Pk2CluuFgLnlx0BJ86/N14ldIJ05RjQA=;
 b=ORtCneGjBpi12ZfIzIMVfhJ2i2vXE4eRo0ZIaDAmaaCyKidlzQYNvRBj4F3gX/FrGuNRR8EMkW6AYfTUEJ8ky8WO48+036bSGPpX9nvys1d915cfhIW9KR3Ri7c3SgzadhIjsjMNYiddhdcCTtwTfnbg/BPh/1n6wD+jhYJMG0cJ4SCPz6rZhrLXJSMSgEYxsIR0OjFnvrgXjwDsRkoqnPBOl61XroBiYAvMQa1o+ZhEEM8zqfGCQoTRUgSSKKeIdX60uw+ZD7QAJtm2KZbH45Gx2Ud0+me1P5lt2u9yKdRHJbxaLW1RIQet04I3o2s74RiNg2JHL/1OBxc4G4gOEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee7e7e1f-8d3c-0d8f-24ef-c281b09faa25@suse.com>
Date: Fri, 10 Jun 2022 09:26:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: account for PGT_pae_xen_l2 in recently added
 assertion
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CWLP123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:19e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0f6b4aa-7c79-4c14-42af-08da4ab293c9
X-MS-TrafficTypeDiagnostic: DB9PR04MB8464:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB84640B8C9A697623DB24E317B3A69@DB9PR04MB8464.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m1Qylz/mImGzH9trS9b872tXjKIM3yKG3G9x1YB1Y2Nf+ILAzNExOYrMCesFEKfG9/DhRQbshaZHjLagqzv0No0+qN8wLsfbWuzlqn5RvwWq6t3oou3lVqTTpDfcQhhVF8pfLfdypR8dzjkBN+CT3rEn9Ud/FJvLy/YisP2xtuJcqXKY5p2IUYuTxTM9edA914BnKM85c90ElWvt4miIF6TfMXEHvyRYIFS/hTkuHSYG8y4L1wW6FbWKkWQEW+sxR9F66RlOHMGUi/J1tr3JTKV7fuMEq25MYCIPFX0ezYGBVfbKv1Bh9v5M/xPLq0HoFsZ30gg8zgBhz8Cxi8L2yVksYMY7ol/DnmZvntvT7Z3kCLgvuoskm6hpsDzDbtDrmG4wez3Jo9vBaRh1760hlAx5bv+whFyKA/2kZSLJdf+QexyCQDDz2eXDzMf/kYFtn5jDBYzRNqqyp+M1vmZLMOfgBtG7AG6ttUdKfGxt1hSfuIW/x5o5D6ODFqlr+ue8jJmvS59gkC2LqNGUZDA9b5Ct/kVKYGN415JhWxwYUrO8clAkddmFbif+06kJxj8YHFNNhgx657FzR5OH/z15AidN/Zs3Jbp3ihjktAqfybrq7NuI4Nq4GgkIMfER8CkPz2PtoqeC0SIbKTsAN4oFwADntS9Gf4qeiH3KnfUemUCG7RhjOX4A7GUQGgHUNnQWfLlRQniOZ+9EPXoPSWTlL9pESon9s7Mx8PfCqcH+Trs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(186003)(316002)(6916009)(66556008)(4744005)(4326008)(8676002)(66946007)(66476007)(31686004)(6512007)(5660300002)(8936002)(2616005)(26005)(6506007)(31696002)(86362001)(508600001)(38100700002)(2906002)(36756003)(6486002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1luUE1JSE50MERWajVWTVpoKzhKcFVZT0JPVm9iMnRGOHlDdE1TYWtRdEFw?=
 =?utf-8?B?eEIva0pxNFUzaUNick9kMEFka1BHbFpOMzhxb2pDemVHN3ZjcitYSEZtV2p3?=
 =?utf-8?B?OVhydlppanBZTDZyZXNZVllWdFZ2OXlLNFZ3bkkva0RrYjRLNVJtTzFiNlUr?=
 =?utf-8?B?eVBZOXY0eUo0c1g5MzloVzhUZGFoNStOUHBHZk5oNzMvL1dodTJHd1RZWE00?=
 =?utf-8?B?QnF1RS81TWw0RWlFc3BxNUFyR0RQN1ZuR0ZzYjcwRWZZWFdDVGxVanhJTGJo?=
 =?utf-8?B?VHI5cFNPL2RxRWRZRk1HcGxUZ0dwVFF4OU1WWnhUSFBBVyttQ25mcnhlbnZ6?=
 =?utf-8?B?VXkyVjRRcCtkTk16dWdxanUyQ1lNS3JCcTRFQVF5RUh4a1I5RXFZRGc4TmRa?=
 =?utf-8?B?UXpqU3d5eGplNDd0TkxRKzRvaFVOa1BDckUvVGVjWU1jWXVYQnQvQ3FjY2p0?=
 =?utf-8?B?TXZOdXJFQUtsV21SZVkrcW1CSkd3dDQ1Q3pUWUl6cUtEUWtxSmZ4NlQvUUhy?=
 =?utf-8?B?VXFZR1lPclR6dkVLeXFJYzdCM1ZXSmVNSXJlTlQ5S3NZNnh2aFpUeTZTRXJC?=
 =?utf-8?B?dlJGMXJ4R0dCaFhzUXlnTnhybE15bE9BWE9NNlE0ZWo1N3J3aHFZelRpNXNJ?=
 =?utf-8?B?SnBGYVB6ZGo1cHh3UVNhV3FiNU9adXhRK0U3R0lESU8weXk5MUxVZWliTWRq?=
 =?utf-8?B?NU42Z0lHTUJrRmg4NUU4alZmd1Rmd2R5ZGJoNzAxdHlKalZsZUV1OE50b1lY?=
 =?utf-8?B?cU1VR3dKc0x2ZWUwSVA5NXFSbUVzRm1qdFdFL2FrRXU4VlFzeVdpZFhSL0Vn?=
 =?utf-8?B?TnNPOEFkNkNNaE41V0JYbENVc3gxbWxoZkxxU0tjN2x3c001bmt4aFgyeUcw?=
 =?utf-8?B?V1kzRkNTTmZOdXVzWVBZMmJrdXBtdUZNWDhHSDJrWWQ3NThCS2M3R0Z0WlRY?=
 =?utf-8?B?WTJ2ME0vV2hGOUJmNlBqeTV6dExDRVp6WlFGT0F0UmU5Z2VpTnlJZDFDZlhU?=
 =?utf-8?B?MlBQZkE0cWozTEVDUFM5RlVqOUwrSVR2M0ZUaU1tYUMxV1FzMWJROGJhcm9Z?=
 =?utf-8?B?c3orTmpVWkpHa0RTb0YxUitXQm5xYWdLMlFmaUFOaGI0UmpUaXkvSExBNEdU?=
 =?utf-8?B?R1VjRzhYK0JHY1pPWDk3QWJ4MVpYL0tXUEtzeDVURG9NUWRZRlFDVFdrMzJP?=
 =?utf-8?B?QTAzby9hcUZPSXh1SG0xNlk0WFJXOVpQekJldWx6dnNWM0FpenBSRXV4UnRN?=
 =?utf-8?B?c3BMQ0M1KzJvRnQ1ZFV5L3EwRVR3dWZuekhNc21UZmhUZG11OVhXNGtvdm93?=
 =?utf-8?B?cnJ3eXRVWW1YVnNXWGpuOFRJdmtDK2pmZDVleEJzdmtaL05pK0ordWcrNnov?=
 =?utf-8?B?Sk1RTFFYUUY2a1NZVGlaRWNWQ2p0U2tRdXdMemNmTHJTeDl4Wk1oT1hKb2Jx?=
 =?utf-8?B?UjdtdW02ZTRkOForbStrZ0ZzVHNrYWFjNWFCYnVVQmRZTVZBRU5NeC9Qc2E0?=
 =?utf-8?B?cmlYQVJwV0lPU2EzVGdXZ2lyRjhoaWUwMm9mM2xMcktRSHVyL29Wd09lVEZL?=
 =?utf-8?B?dVEwWi9NVTBUQThnVmN6N3hUM0tmeEhUd244WjV2Q2k2QnU5ZVV3dUpoYzRN?=
 =?utf-8?B?d3ppQ04ramZGOWYyVEd4ZWtLZmJUd3haUnhUZjZZZ3BsYTdaRDFycjJlSnFJ?=
 =?utf-8?B?cGdxS2g1b0oxdlBVWVNxdk5zV0FPeWx2VG42aDAxTU9Nb2EvK0ZvMHlZUWV2?=
 =?utf-8?B?RG52SU0rdGl5NGFmcGFuaWpQREVZOCsxZnQrc2xDZ2tBRFMyWmdKdDBSTUpk?=
 =?utf-8?B?bDJ0NkRsMkdFbnAxSmhOV0tHdGhMdlZzNVhBd0xWemZWZSs5MkhCWThFU0JS?=
 =?utf-8?B?a2RLSTdHUlRFUnpyNHBySm80VDhCYTBwcGxPcG1KR0wyVytiL3VxN0RKb25z?=
 =?utf-8?B?VWtGZEJPVHJGbVFmRyt1VGlXVm5EKzB2dk41OVJWdjdjMGNhbTlXLzRYSGFG?=
 =?utf-8?B?R2FGSmlDbkFIY3Bmc2ZtOUQwU2c1bE9uWEVuVzM5Tit4YUVuK0ZZMTNWdm95?=
 =?utf-8?B?YjdHMWtvMW9YRjV3bUV2cGJoWUlmRjUzdTNlbHN1TGZHSG80OUNnS1dIaUR2?=
 =?utf-8?B?c2dic1NYbzdEUjk3ZDhCSkJVa21aYXZnd1BMUGNwR2lHcmFFUHQ2R0h2QmUz?=
 =?utf-8?B?MFJETm9mejVxNXdLS2FOQW9BK1czSXlCMDdHSU5OcDNKT3VkYVVCQ0liUEkv?=
 =?utf-8?B?OUtiYWdWWGd5cWZnTHZveGtEVU5QNWN0TFVacG91VHNRdGhSS2dudm5LenBY?=
 =?utf-8?B?aWNBdkRFOGdsVHM1TGthRVNId284Y0xHMkQ4TmF0K2N0QWFpaDZjZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f6b4aa-7c79-4c14-42af-08da4ab293c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 07:26:47.2452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11kZaHzOeLKE4Qtw5jceJS5+qAIP29m9hEIfjPM7KV0INRI79o88qVY6ihE8ZZMa/iimRlkC4/n9hvkXRgw9Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8464

While PGT_pae_xen_l2 will be zapped once the type refcount of an L2 page
reaches zero, it'll be retained as long as the type refcount is non-
zero. Hence any checking against the requested type needs to either zap
the bit from the type or include it in the used mask.

Fixes: 9186e96b199e ("x86/pv: Clean up _get_page_type()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The check around the TLB flush which was moved for XSA-401 also looks to
needlessly trigger a flush when "type" has the bit set (while "x"
wouldn't). That's no different from original behavior, but still looks
inefficient.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2956,7 +2956,8 @@ static int _get_page_type(struct page_in
              * The page is in one of two states (depending on PGT_partial),
              * and should have exactly one reference.
              */
-            ASSERT((x & (PGT_type_mask | PGT_count_mask)) == (type | 1));
+            ASSERT((x & (PGT_type_mask | PGT_pae_xen_l2 | PGT_count_mask)) ==
+                   (type | 1));
 
             if ( !(x & PGT_partial) )
             {

