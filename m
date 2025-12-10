Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A254CB3238
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 15:26:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182972.1505769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTL8Y-0000nL-6a; Wed, 10 Dec 2025 14:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182972.1505769; Wed, 10 Dec 2025 14:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTL8Y-0000lm-3o; Wed, 10 Dec 2025 14:25:50 +0000
Received: by outflank-mailman (input) for mailman id 1182972;
 Wed, 10 Dec 2025 14:25:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyob=6Q=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTL8X-0000lg-BN
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 14:25:49 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e4e4872-d5d4-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 15:25:46 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6470.namprd03.prod.outlook.com (2603:10b6:a03:396::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 14:25:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 14:25:42 +0000
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
X-Inumbo-ID: 1e4e4872-d5d4-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtAMVmasVF0kYFV4PSXLlBHjHVcYHXfyJOi9UlqNPn2xTZbfQ36+8kUT6OtDt76YYEPCLaR9jUzia9HySkbvS1eYFWYC4C4PLJCs35kz2bjEPQgR+Jeze9TRbvmBh0Z6yTl4ZfphYSBK8eCUypYs3JnE+jV/3ODMXQgQ0UGNjvVNRTo6uQ0FcNvvnT9HYM5HmoK6ku0cvxgMWmBYw3Sj6ltB/ivdZ6cgrKnOae143+SRSGMoa6visbtUvWp9Fz/TElG6eIVer9HO/s5sPMQnGf9WhlqLGmAonx4A+YSwBPPhbTfSbVlk0OhsyhKGBZb6Laaw6U+0ZX28sTRBe/dMWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8TNQVSPDwOmt6QrrQxc44Yx+ZH1JFmJCNBMh0/qR/w=;
 b=N0pglvEEYv5vV9EezMYGbk1GKT80/jII/bvxB+qRY4y/cfObb3TqFZGOlq7WWesJWP6CupSfSrH8Pvm4w5AYOSc6O+Zstymc/aeBU5II5dANSKxTwvD3AI7KAcuy2kafhe8xYd/UpZ/p75VEvnBBuEdP4UePdd4QMlC4DC/kmD5v11PwO7sq8wjOvmkZ5YKlBdsBT73WuMDkNObNo1TvzqKMzYy5mdSwwqfj15kaIvpOsxkgX04F600Vnw0+zItfjyCS2ZoVPkWDAoCGPzeFIFb7j0jC0cFTnA68kVs1W6sNLFBA8q6ZwpK3KXrra2g4YyzDf8tzMFxFC7s98oxj/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8TNQVSPDwOmt6QrrQxc44Yx+ZH1JFmJCNBMh0/qR/w=;
 b=veIdHG+yzafPwI6rtWi7DmsI5tCgfkAScLBz6RcheBjGjltkljEy6NoDpRHbknFOF79aRxxB925xdGxW9xLhPiKibG7S7F4NBIcExymkN9grZ1iusNtyzEAQdud74MkF3BXXX9eSsMzzoDyqKuuizdSX3qIv/l6GQ1qstoknUHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <eef80a07-ccde-4948-8213-3ef5352c5283@citrix.com>
Date: Wed, 10 Dec 2025 14:25:39 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/svm: Make vmcb_struct private to svm/
To: Jan Beulich <jbeulich@suse.com>
References: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
 <20251128201937.1294742-2-andrew.cooper3@citrix.com>
 <373f19eb-39fc-4a76-95fe-4acb95ba71d8@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <373f19eb-39fc-4a76-95fe-4acb95ba71d8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0655.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: a08ce6de-0eda-430e-bdb1-08de37f80011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkxTWmFPQjhpSDVlOTlHTjB2bmg4SmZ5ZDc3aHZ2NlB6N3dJc0c4N05mSjJT?=
 =?utf-8?B?cnVDbElVVVZGd2twY1Mva3NSV2pTTXgwUjZiRWtCM1phOGtYU3Q1OGVNS2tX?=
 =?utf-8?B?RURKalIva2hMWUZHV2twVU5aSVJvY3FsbjFoODV6Zmkva3YvUjM3V1hPRUdH?=
 =?utf-8?B?ZWlheXptSXJsMExlcEp1SzZGNGhSbFVSNHRMSzFoMEJBMGY4SGg3SG5ZQVl2?=
 =?utf-8?B?bnMwUDdjcnE1aFA5OUVoVFU5ejFiU1N3UU1qSlY3RnRrWmJTWElnak1hN29p?=
 =?utf-8?B?bXVZRGVQM2xNbnB5VmMwRkYrV2tDT0s3MERtcVZKd3JNU3dMQVZ5MjdXYTZB?=
 =?utf-8?B?ekdoL3NhaFppS3EwR1lWZWNxTkl2U3VLcnNiK3VUeTZmb0Rrby8rYUhhQUFV?=
 =?utf-8?B?a3IvL3FHaUdId3B0ZGpUcklYdGVWU2UvM1l2aU9GdGhlRll2dXA3ZWNlVllU?=
 =?utf-8?B?cFFDM1JLNWNialFXcUpHYUdhcEczTVdhVGVjcHl5UEdqRjArdDBHbGN6V0JD?=
 =?utf-8?B?b1FsZDhZVWhJWkRNSG5ZTG56OTF2YjlxanJ4bkd3Z2RGcmFWci8yMFV0NUVE?=
 =?utf-8?B?RTdMQ3k0LzlrWTdkazN5SXYxSnZjSnduYlgxLzNRY0xwR2dmVDBvUndJK2Rp?=
 =?utf-8?B?WVR4NjNHWTVEWGZLTGpndG5sU0FMY0NZR0c3M1QyVWYzSEtBNTdibHc4aGJW?=
 =?utf-8?B?Ym9oRTdOa2RKdENHOC83aXl2aXBhWDhUMGhZWUhnTWRoOFZ1cjc5clpSRXFw?=
 =?utf-8?B?ejdjUmErNVY2MkhLQXQ0WjFLNURsSG1wdm5QdmpoaU1qd21wYit2MjUzL2to?=
 =?utf-8?B?ZHZ0bllaVURNMkJVNFNlWElFbmtsUmhmbnRpQlZBc0pKVUQ1WUhyRTFRNE1S?=
 =?utf-8?B?aTgxY3lIa1JDem5VWFdYcUVzNTV0c3UzMG1YOExxbW9QcjZUUWowYmNCcGVo?=
 =?utf-8?B?R1Z5ZWZKYWQwcDk1eFR6bVhhNEUwZzFUd3hjVmpMK29td1pkdmlBckFCL3Zt?=
 =?utf-8?B?eWpvbHpKTFNnTDc5S20zNU9GaFkvTEtQM1g2b1I5SkR6NjRkTVdTckdCVStm?=
 =?utf-8?B?MHAzK2RtWEMvTnl2YXByd1JnZzBKZlFGMmpZYzU4dlNQdDhraUo5WFFjY1B5?=
 =?utf-8?B?ZzJmZE4yajVtTmR3WGVoQ1A2K3BFb3luNFhtSjhsdEMrS3hkaG9PcnhCUzAr?=
 =?utf-8?B?VFRlVHdIN0p4SlV0c0xRRUYrdURBREtUREJkSUNwcUFtTFlSTmJKa2prTU9H?=
 =?utf-8?B?NHVRM0U0M1psbTNrdDZWYXpnRVM0T3d6SlUyMVNiMnFEdDZOVU1KUzlMTm9G?=
 =?utf-8?B?dUZMQ0pxWnpxd2JxbjhlV3hDbnpkYmFiQnRrNmxwVXY4VCtuR1B3VUlwVXMx?=
 =?utf-8?B?dHVheEdMbHkxY0xuekZ3aE9DbHkzemd1VXI0YnVLVmpCYXFSTm1YZnlvaTQr?=
 =?utf-8?B?b1N4SzJ2YVFEK3ZJNVk5N2lmR0RTdGkyQmIwcWNWVHFHYnlDT0VaMklsVUEx?=
 =?utf-8?B?dnVRSGFsTmNVRWFYeXBueVpZTG5iV2NTTVArRHVqamhqN1pkM3NBLzVpZHhq?=
 =?utf-8?B?N1FDUGJYUThLWFYwS1RaR2Q5b0pZWWZsNk0zRjZzV0w5blFCTm8xT3Y5bnVF?=
 =?utf-8?B?VjkrSis0VlYvVjVCR3pmSkZSajE3d0xLOXlZd1cwOElPY0MxTXhLTVBPU1JL?=
 =?utf-8?B?b2NkMW4rcjNyb1owelVQNFlieCsyZ0c0bnk1aFZ3Qi9BcnBJeXBNa0RlWEhk?=
 =?utf-8?B?RElmNHZGUkx0YlBkd24vMHE2MzN4eXBreDFFQlJXOUxRUi9WMUZQc2hLTklz?=
 =?utf-8?B?eHl2SDBmc1gvblpqNEdsNGpJOWJZempCRWxZc2R6dE5XY1Q0Y1hadnF0Yjdm?=
 =?utf-8?B?c1JOWllKcjNMSk1uaDJGcU9SWjRWbXh6alZNNnpXczFoNG9XQkJCc2hZNGFu?=
 =?utf-8?Q?ClwDS0cjTVXoJahqpESDoL5N5rGaQLWk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SytMN2NwbGFvMkNSRkJRSmlCVEFWTlEyLzZVRlY2ZXlubUQ5RGhES3poOE9J?=
 =?utf-8?B?SmxRbGs0dUV3RVdqK2lLVmVERit2c1hTZUdqckNCaHFPYTlxdG4yUTgwT0ww?=
 =?utf-8?B?UHBQalJUYnlJUnl3VW9YN1VhM0ErSG5mb2tzblFLSnBTQjVybjgxbXE4S0JK?=
 =?utf-8?B?WUVzMjFnMy85UzJsek9SSmlJZFV0N0YweisxOHNtUUM4NUhMem5MaFhEbFZU?=
 =?utf-8?B?L01ZaXVTYllqa29CUFNYK2s2QlJRMWplNEM4TTlicXR5a3ZzYzM5L0d1QU10?=
 =?utf-8?B?K0RuSTFWUTJHR3RTNzNpS2YvYjhadVk0WmNsTk14Z1RvY2VYNUF4ZThWWGtR?=
 =?utf-8?B?M1M4Y1FlZ1dka3E5VVhqWndzN05CYWhiTDA3OXdsSlNteHRQQzByRU1tMGt0?=
 =?utf-8?B?UUxsSkxLNHcxQmx4RkY5ekl6L3FqbGRjOGppTG84U3lJT0JyMXdwU0J6WUlV?=
 =?utf-8?B?WmZZaTRUTnZjeTVaOFV2OTRScGQwVnpFai9tQzB5ZXhDM3FOOS9TbldtdExQ?=
 =?utf-8?B?VUhVZ3dzczl3OUJHNkNieUt4cCtUZnlDRlFGaWFXYXNoSDFkR1YrVWdhRlc0?=
 =?utf-8?B?cVhZYk5YRkptZkdTUEdsdXVIaHBtOVJ6MCt1S0htMDlYMmFDd2prY1c4RUZZ?=
 =?utf-8?B?SkIvRTZhTjlITGtaYTNWT3MwSU5wVWlXZmJmUGpyNHhPV3NNdXlWTW9BS3lw?=
 =?utf-8?B?eG43ZGlvYmhGMzlDV2xoWFp1UnRNeE9nRVJydGVORDFrOWN1SmNqWWgzZmZO?=
 =?utf-8?B?c2N1OGJ2M0s5cU5URlUyRlE0eG5kb0NIdHAwd3pnSmd6Y2VVcGNRYlNSaU9V?=
 =?utf-8?B?MDIydXFWWVlmUnU1eHRDV3ZDa21vTEN5czFiVWd4YzNqOFVvbG45dFRRT3RO?=
 =?utf-8?B?eXg1TFRuQ1IyR1p2ZFJ4WEZiU0pVREIzYnR6cGtHSlp3ZmlqSWgrVCtMUVp3?=
 =?utf-8?B?N0Z1WVVMem9ybHUxbGxWMndmZmFPd2wxanB2S0lsbzU2c0tqTGoxM0NJTXds?=
 =?utf-8?B?NndPY0pCRUhlODRjdXNueTdCeG9MN3Rkem5yOXBBd3pWVHRRWjFIZ280QnEx?=
 =?utf-8?B?aUMyUXFUVTcyQUZCNGlLdFo2WEdNWW5aNndhTDlkZzQzZ0d3VFVmS052YWtw?=
 =?utf-8?B?dGZFVy8yenNVc1YzWW84b2FrQmxSbUZRY0pkTDNZMVpnRlpOakMvSnlFenov?=
 =?utf-8?B?dERSUVN5Z0Q3U0FjSGc0QkIxL0wxTDFJMXRRUVFWdUxZTUZteTFLVWFrZ08x?=
 =?utf-8?B?Nll1Wkg5YWNmaE43eUNLNUlwZEZETU90Z1IyS2xrbUJrRkdoZXM5ZFk4am5t?=
 =?utf-8?B?a2NDYnBPVENyNDdHTnBOUVBuN052UnlodGVPa1ZJczVCUkxPd2htRFNUblJz?=
 =?utf-8?B?NHArRHI3N3BkSHdzT2luTWg0WGJPWEdEMFF2NTM1WHBnM1NaK081QmFNd2ov?=
 =?utf-8?B?UGVDYTRyYXdxTFRUV3ZLS0E3cEtwVU84Y0NJMlFHNXZidUtKYUhzMlV1RW93?=
 =?utf-8?B?VlFDeFJFclU0QzU1N0V4a01GdGxPQXRHT0tNSm8wR1ZLNTlvbCt6MmtGS3B0?=
 =?utf-8?B?UktnL2xsZ3VldzRiVFBkZ3BRSFVDSlUwRXl1citMVS93SXRqRzZXbVZPZTRu?=
 =?utf-8?B?Zkt5cnZBYi8vMloxbjNmL1NoWHFXNmpTL2FSOXFhWlZNT05EbHRQaUsyNnhj?=
 =?utf-8?B?U0hZaGhoQSsrSnZvV1NVdHNEZTZSY2ZKVFgwQUpPTE1Gb2QvVXdTbUtNYnBY?=
 =?utf-8?B?TnRUcjlydElMbVVJNHBjZCtTOTNud0hPRkZFc2sxcXp5OHVkV3hpc1UzaGVw?=
 =?utf-8?B?ZE1kdDBqNHMyZnJNQlY3WGI4NU9DWXZtbEtQV2FmOU1pbzRVN2F1T0ZqM1Bp?=
 =?utf-8?B?M0JFSGJOekVNMFNNOWNGaG9tSjg3NVl5am5hSnpWQ3k5ODFxQmxRbHNiT2Ri?=
 =?utf-8?B?c3Vwa3I0OXFHV2RPUlJrZXJ4YWE0VmFBL3MyUGFQaFFIcmUva2w1YWN4TEZ6?=
 =?utf-8?B?NUdFRnIraHNadEF3U1duTlI3Qzh5L2hPaGlSdmlwamZwMEp3eVBxLzFZcVUy?=
 =?utf-8?B?bmpkeWM1QzlSNnlvNnR4Q0pUbVhGL01JS3lGMUNDSnVhTGNuOERXazJ3THBj?=
 =?utf-8?B?Zk9iV1k2ZXBiVTI0U1lsV25XS2x0TFkvQ29MWC9oY3pBdGpnQmlhZXdEbzdS?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a08ce6de-0eda-430e-bdb1-08de37f80011
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 14:25:42.7650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0bfB2M4k3Sb21mgBkmb6xTbIgjaGtucg+sr98IeymXwLj7sViWVdJvk9iecxma8+40pKyovEE5rKLR7+qAX4hQCoq4DGZTPPnbfi5rQl2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6470

On 08/12/2025 9:05 am, Jan Beulich wrote:
> On 28.11.2025 21:19, Andrew Cooper wrote:
>> The rest of Xen has no buisness knowing this structure, and it is currently
>> included via xen/sched.h into most code.  Create a new private svm/vmcb.h.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/hvm/svm/asid.c             |   1 +
>>  xen/arch/x86/hvm/svm/emulate.c          |   1 +
>>  xen/arch/x86/hvm/svm/intr.c             |   1 +
>>  xen/arch/x86/hvm/svm/nestedsvm.c        |   1 +
>>  xen/arch/x86/hvm/svm/svm.c              |   1 +
>>  xen/arch/x86/hvm/svm/svmdebug.c         |   2 +
>>  xen/arch/x86/hvm/svm/vmcb.c             |   2 +
>>  xen/arch/x86/hvm/svm/vmcb.h             | 617 ++++++++++++++++++++++++
>>  xen/arch/x86/include/asm/hvm/svm/vmcb.h | 606 -----------------------
>>  9 files changed, 626 insertions(+), 606 deletions(-)
>>  create mode 100644 xen/arch/x86/hvm/svm/vmcb.h
> I was actually hoping for the file to be moved. I notice that a few things are
> left in the original file, and I wonder if they couldn't be moved elsewhere up
> front.

No, they can't be moved yet.  There's other cleanup on the list, and
more header dis-entangling needed first.

But I do agree the name is wrong and wants to go.

I intend to end up with svm-structs.h and svm.h only, dropping the subdir.

>> --- a/xen/arch/x86/hvm/svm/asid.c
>> +++ b/xen/arch/x86/hvm/svm/asid.c
>> @@ -9,6 +9,7 @@
>>  #include <asm/hvm/svm/svm.h>
>>  
>>  #include "svm.h"
>> +#include "vmcb.h"
> Instead of repeating this in every .c file, couldn't svm.h include the new file?
> Or are you foreseeing some of the .c files requiring svm.h to (later) not need
> this include anymore?

The other option is to merge all the current header files into one
private.h first, before moving this.

~Andrew

