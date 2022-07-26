Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1E85816F5
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 18:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375505.607936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN3E-0005Rs-Fp; Tue, 26 Jul 2022 16:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375505.607936; Tue, 26 Jul 2022 16:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN3E-0005Pd-Cw; Tue, 26 Jul 2022 16:04:52 +0000
Received: by outflank-mailman (input) for mailman id 375505;
 Tue, 26 Jul 2022 16:04:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGN3C-0004qN-RG
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 16:04:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acddf9ba-0cfc-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 18:04:49 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7532.eurprd04.prod.outlook.com (2603:10a6:10:207::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 16:04:48 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Tue, 26 Jul 2022
 16:04:48 +0000
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
X-Inumbo-ID: acddf9ba-0cfc-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Emh5IvoUsjG/La8T6T1iozSiR/dDOjnEO4hxifz5fnilXmNZgZCQkM0/FyxgA0oGoiAei9ib26eS3rmJpn8lJQeym4Ebutp4BOfRps8KFKkh23USjbk/au7CJLSlc6ToeD8u8XimOtHRSTQ9iqeLu22VQS5ILK4kV6ZrXyn5n5zyQacG75yux6/a3BLd6dykXVTDhtlLKvbMrz9YCvmIUUXKb8SP3OCx2GJlXf/myz+iFTdAvH4bsJM7q2EB193WZFAcE8ganldHK+NTE5LiujkELnfZS4YYf4/ILEbx/vatd9CbIx75NkbVAJoCwbhMJ3955QtL6LAMRslJjGGFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpdBYL7DGs8sd5XkLM9xP2jAqMKLzNp/KEuELZbnd8A=;
 b=GhQy2IGPiYtRfhJNQrv+kNx+Uo55l0MoyFtmmw9aBlzLqDNQVNEIrGB4lpsfRV+NMZOVQitWofIyVDNoMQjDQzv2Z9evjzljvyTS/pYV6M0lgTjFDI/E/7Kmw/YHXyppge+qiHKQEV5xz4Ep/lR0Ctfd2DAXijzrAabz6+1zrnD4BYIW4kfGXExVulT5JteDI9KuXr7CRV2OEZHYwS0SVzMS4mSA3o6J0dvou7ywtRzPThgl9ZNMqq0ae2Svbpx2hOmUW2ikCpR9FJGe+41SDsQeNr4aJ03r1bQ8cfSIIF6Hu6oUPsG72Fk01HsMtZG6wih+eX1wipPAXNq7sHFDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpdBYL7DGs8sd5XkLM9xP2jAqMKLzNp/KEuELZbnd8A=;
 b=lKcsJxSkbh4Z+awVEQv5uvkzGdVIL9YJdq+O6UNR181NPF3wcMR5pQrd9SS8Ww3KCuwyvOsRHNOAPkn79f+rCsNB3i7x8c+fz02LrRWLpPyCAjwYyEdgUW56+P6WZRX7gHinivbaY6IgwdWGaU2PAYha9OTYbYSH+t5efJhDlaa4yfwULDWwe9l3THTXwXM8JnOgBcIPWXqCHhLf6f35alb2EeiJnUWMloWx938ZJqDRrDc8/4gUGO0zQoM3+3ayzE3PK4+2SJW9//F2W8XTOeY4cOy87J9zafstx6Av2EL8SmiuOuy9yY9aFBlMpTKF31mBpHVOTWj/O2Q3KqJjqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cdb5c295-1b19-9337-678a-77f8320e9168@suse.com>
Date: Tue, 26 Jul 2022 18:04:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH 3/8] mm: enforce return value checking on get_page()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
In-Reply-To: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0104.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6957a700-7d7a-480e-3d42-08da6f2090ab
X-MS-TrafficTypeDiagnostic: DBBPR04MB7532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2gYGTyu7u//wFO9YVVleHJOi7fAi9QwGHGlNWnFqEAp6LzVwG37vDh/uvaUDio9yN7GjT7/6OK13VGWX/qJ5sJf0CivZfWbjffAS6uCkQtaZoMkNl/txIRUrDHLpd8G3XwPSIbVYojMlRORrRlbUp9gX9STW9L/hVb31A+tYRANqkc82U7tJUof2z3kpunZ/UFozcGWaqIFm+iZcdgbdVp/ayeC46DOmKrOaGTvhmPuSOioXVtye8d/W7oKbfiRNNdV6nbjq/wY5+On+kCya5Tbo9zyIgaeMdkA3IRsbvtbKEOXUpvs6d/f5mBzJW711BAVEmvBPhO8yXwOEsANftntyy5I66OXsUkgS63iDkdRSTMhF11oMVdiCpzl4/j8Zn16ZKIplEk/60so9Kt37ImDr8Xqn+QvkhrtLaXYKy5ca2ia5GeyuZ/BbxnHeNmUfkJvlzr1dT3wJ6csQvmDJZvLTS4YCL+sWm/YU7c2UuDU2K4alRbbC84AZekMIvNF6FvtbfNwMybvS/ARlfTxtE2DtTELs0XP0TgqbtrOi2U1eA2S3N1n4H0DFf76jt1eN2LR6QkW1PBbylyMt0uZ+MrYsizOentGvmmUKjhlpYV9lf8X0cQ4OXA8QEvBfPUBvqexWQ6RWyWNrCSAgrCGJ0DWzojUvKvWyqRRtXbqE04RDZJlAQBUiNn2oYzr/yN6HmPbLlEPFoPjD+bZHHoQrdXyxNlr6NWvZYL6+Ra1RByhd/OTCTZVZ5LuNEO1jLqG2kkOOgiL5fhdmZHkrNo32jJPgoQ8D1X65YgFwHQ2PRYCBQJWwLh7VdlynBdt3yaByDg6Dp9oLBLpCg04WuGjEEg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(376002)(136003)(39860400002)(2616005)(316002)(8936002)(38100700002)(2906002)(4744005)(36756003)(41300700001)(31686004)(6486002)(5660300002)(478600001)(6916009)(26005)(6512007)(54906003)(31696002)(66556008)(8676002)(66476007)(4326008)(86362001)(66946007)(186003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjR1ckQ4RXBhVVJHM1lkY1BrSnBURnRXRVVrc0hSSlB1dWRPdDN6Q0JnVitX?=
 =?utf-8?B?bk96OVZ0bGF2ZUhUaWhaRnFnSjRiV292VCtiL0QycHRvRDBYQ29xcU9Od2Jx?=
 =?utf-8?B?cEEyVWphSXJQb2wvSWFnVWloeE40RGJSc0ZKU3pTNVA1a2FHSDBrZTJpNmQx?=
 =?utf-8?B?M1lLajRzZDdjUGZaUlV3ajdsbGZTem4yQ1MzUTVUU1I3bm1MYU1RdDhGUU1K?=
 =?utf-8?B?YTJEZHFNaU41bVR5aklUSUNMN3hrU1BSbU1yb1NKbFpXM3VyUnZDeWdnL2s1?=
 =?utf-8?B?WWpFclZlNzAwSnNIa0hDQXEyZklFdXphbmNMd0xnWkNpRjEyODVRTFFnOVlj?=
 =?utf-8?B?Ry9vejQ4UkU1RUNHSzBzMlZqWXRvZnYycjFSOGNhRTJGNzJ5aHlKdVlXZzBx?=
 =?utf-8?B?M3pXSHlTVjZiVjJodXc2WGVRT3R2OXM3RS9xTUl1L0I0ay93TFFub0dxNjJQ?=
 =?utf-8?B?R0M0YUN6UEgwa05iaS92TWJpYzNzb2N0WGlrK1NkOUJuRjRqNjNORDExY20w?=
 =?utf-8?B?U1NibXBWMUtreFNKRGFJNUtTaFJkS3QzcmswMGtTSlNBQ3d6cThOTDVCa1lO?=
 =?utf-8?B?TENKYyt6d0VXL0pmYTJhQXBEaWVlNHhUVjNXZnVpajVEaVdQZFFKWXJ2eTJE?=
 =?utf-8?B?U015Z0o5aTNtMmJLRHMwZmZQVVVSVGxLRXFoc3o4enZvY3N6dFAySVE5ajd4?=
 =?utf-8?B?Q1hpelU3d2dHc3FNMmMyUDNPWXoyTTluQ2J4azArS1g2U1ppZDRxczErNDVQ?=
 =?utf-8?B?VVA4cnFjKzIvZFA3VUxHazhGa0hQd0ovcVFDMnJ6aUlDUlYrNnJMcWcyYUtZ?=
 =?utf-8?B?eEVqYkJzejlDY2hDVGNITVkzV2FXSnVJQjFoNklpTlJiNEVySXVSTnVxbGZU?=
 =?utf-8?B?MnJySXZJV0FQbm1BdTA0OGJsQ28rU0U4NzcvZVFyRFdyUi9yOVZWMER6OU15?=
 =?utf-8?B?Z3phM2M4dTI2QXRmV2Mxd1BHakM0VlRBR2E0SU1CUkhGaGFaK2I4K2h4OFpR?=
 =?utf-8?B?VVZHZWRhNFhmUnRMNlBOaDJxVkhmaDBMdHVQSG1sSnhDZXE5SXdTL3IvMjRp?=
 =?utf-8?B?R01ZdDhzRXlTT29XbDRpbjA1YXhjWDZpMTJQQ0NBK3B6OEJIdjMvd1hMY0wy?=
 =?utf-8?B?SHlVVGt6eTZzdk9MOWlvVDM1TWw4M1JFMFJrRk1QeEpxZ2tXS3NTc0s2TXRv?=
 =?utf-8?B?SDB1dXRlWUVjbUlXSkFOanVybWhxU2RxVGt1VEtUZEhBL3JZbU5PeWpyRENw?=
 =?utf-8?B?djNrMFJsWEJOaGhNcStxSlpwOEpXTVhTSElJK1Vjd0Y5dU5SejNDSmlzRFBn?=
 =?utf-8?B?cUZmNFFNTHdJTmNPUFh1Q1JDZHVkZmhJRzM1M0E4TzJUMThZRmw5c2hOVlMr?=
 =?utf-8?B?a0dkOTFTQS84c3A3Yjh4bUJOUTZGRWt0K3pVMkJkTTBoRkJFOVJrSGU1QWFX?=
 =?utf-8?B?RGxBSVYzamVwK25ieXMrLy9QTVJXUkpwUkQ1WWV3NVBkQzdvSUJuSGp4NmZU?=
 =?utf-8?B?M0hPYUdnRFN3ZHlXVjYyQzl4cm5LakhSbTNBd2VWd24xU3BraFExdit0dk1j?=
 =?utf-8?B?eGh6ZUpEV1NYY0RSdStvaFdGUThLbisxWUN5SmNGdVVveDVNMW5DaEtoakRC?=
 =?utf-8?B?M0prVjlSSkNDcVVRVGpUT0FiTlpSRzVnNWhZdVV1b3hzNnovL0lYbEpUL1Av?=
 =?utf-8?B?bTV3N00vU1c0citLclFvbnJPcGdWNnpOSHRpNmJCNFJqaDQrTjFtM2lBOG1m?=
 =?utf-8?B?NzNOcVRPbUNRa3orVUl1d0o1MmRJRGNXTTVRODFXMlRPNVJYb1RrTm9QSFdj?=
 =?utf-8?B?b2IzTzlaaUxEclBOUXNiTStRMFd0MVVKSHpiT3IwVzNRLzkxSDNhM29NelZr?=
 =?utf-8?B?K3VXY3lNUVNOZC9jZ25YTzJ1K055akFIOE5UdjMrL0Z6NStqa29iTnVNcmty?=
 =?utf-8?B?UWNyRmp6ZnMvWHp0NmlqdTd2czlxNDBNR3V6VEp6U3BXYnVhTW5QYkMxMGkx?=
 =?utf-8?B?a1lmYmZnQ04yR2xoTzJFOEt3T3hBQy9uT1hsWHlzYk9iS2c4dzhjM2xWTVF6?=
 =?utf-8?B?dkE4cEk2aytYK1FKOFBHK09wUHZRVFdmeDJ4U3RRVy96K0NGWmFiTStVbndY?=
 =?utf-8?Q?Sm+HfJ1Xg3djDNQ9ZBka3wJwi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6957a700-7d7a-480e-3d42-08da6f2090ab
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 16:04:48.4218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fSvm2rAanrlQVrj0raNTWzGWKubM5EgVgM75YZ0S3eqrqEK/xjOoZ6eamcxnv4v4LiDsYMG9prw45fW+vcTdKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7532

It's hard to imagine a case where an error may legitimately be ignored
here. It's bad enough that in at least one case (set_shadow_status())
the return value was checked only by way of ASSERT()ing.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -61,7 +61,7 @@
 struct page_info;
 
 void put_page(struct page_info *);
-bool get_page(struct page_info *, const struct domain *);
+bool __must_check get_page(struct page_info *, const struct domain *);
 struct domain *__must_check page_get_owner_and_reference(struct page_info *);
 
 /* Boot-time allocator. Turns into generic allocator after bootstrap. */


