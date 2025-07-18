Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D20BB0A1D0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 13:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048565.1418778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucj9A-0000eY-R9; Fri, 18 Jul 2025 11:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048565.1418778; Fri, 18 Jul 2025 11:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucj9A-0000bz-Nj; Fri, 18 Jul 2025 11:21:00 +0000
Received: by outflank-mailman (input) for mailman id 1048565;
 Fri, 18 Jul 2025 11:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=34x3=Z7=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ucj99-0000bs-OI
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 11:20:59 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 474fc067-63c9-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 13:20:58 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DBBPR03MB10464.eurprd03.prod.outlook.com (2603:10a6:10:53c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 11:20:55 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 11:20:55 +0000
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
X-Inumbo-ID: 474fc067-63c9-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPGsIwHBORyTnRJxhJQD2m2fVwFabL5QTzHV1IpGQkVnNgsXlgBRVbZnx137iII/5W0UjaAyTuRWxIspwTR4u2JYTE2H4Imuxr9VHjh9yjThza5IKwDcuRQOfnHqfnwZGuyHEfPE56lLTYM3nIj577y9OFGCb3RMk2rcTh11OG2au6NghKY0NjuFczcDts5A7Tl1b1rtsSId7DyQWZtZXnwQ2geRD+j1B76gW2LekyQ+l/8GqVG/Emfm5UYJduHBIkWQtx/7HgRrWqV/j/V/DwXfPd7nRgfPheqqSZLnqt5HYVgXZ43y9Deos5jJx+RngDL9VNYZPdpI3zS/pQVxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOmNManEAEwYI2YaFHRMLRsY+uOP8zzKlEEdtLQ0WeM=;
 b=ER3+h4PHIwQ0kMpawDKg0PhBmqSMi4slX79EZdM+BEzuq0sD0IqD8mtZrUEpg3s62HA3xOeSkGq/sadfJ2aXoHhlsuy8r61wuDNM3kuPtw0/i1uPJZ5IzUMIeLuZm14mBeQ3Jq7VmBPfVaKM1qIknalJeREMrWu2Ufq6jC9nd/U+ksd5YkDebUQjoRVviBRkIAAqaY/9uXm5nEN0ZdWCJzmAccz+CcY0UUz7Zmls435GtxP0UWbp+OctFbFMXY+GHJQYXG7efyS9H4KBHqyTo/r+8vzgTxvS30MiBmrrcUEDisPzjM4czsyXeVjB+h5Wt3qsubRAG0/21UITuZmyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOmNManEAEwYI2YaFHRMLRsY+uOP8zzKlEEdtLQ0WeM=;
 b=qrjZZeT0jHsSTgrWTLS6pIni8IRvbZHYLZxHKEtKMmUwTM5I+vk5riZZ8WwQzCU/n4kIf3ZtRm7OpQ0puWF5Vtvab24mXpl9FE3fBvel8RA+h4VHoHHr7atQqRMFbl/2boP0uikmxejgbZRf0nrKMMT9pLuyRMPplEgvlaIOtcSwKxZ6Xh0V5W0De8MnS2GQA4thkD11kEx5H84D2uYWU5JtgF8BqPdTwMPSCHE1yxNgvQzvPWjM7dzKzQt60ZX2qwlk0UQsrQbdxgTWOPclYH5xm1mUZBiKhquTHbJF28J5cFRFHnurJkyhVSfK/TW6Oj1cM+YjYiiAHWBoXsOtyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <77f6e0fb-fd3a-4abf-8346-e7281b6bccaf@epam.com>
Date: Fri, 18 Jul 2025 14:20:53 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] xen/domain: update create_dom0() messages
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20250623182721.194238-1-dmukhin@ford.com>
 <20250623182721.194238-3-dmukhin@ford.com>
 <c76704bb-f1b6-458d-8a43-475b161470c1@epam.com>
 <d0647b6b-ae49-4f04-93ca-545799a3c0de@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <d0647b6b-ae49-4f04-93ca-545799a3c0de@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0362.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::14) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DBBPR03MB10464:EE_
X-MS-Office365-Filtering-Correlation-Id: b13b461d-6f68-4fdf-81f1-08ddc5ed2978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WU9aMmtxQWlBa0FLTVQ0ekQvUXhNV3c3d1BvYXpGeWRuWk9NZnVFSDl5d2RZ?=
 =?utf-8?B?UXlZQy9NQlYvZGlRRnlHTzg4MnMwcDFFbW1rdE54bGNUUGFlaDhyQkxEaGJz?=
 =?utf-8?B?d3FuZXgvUFhPcnFYMk8yUUhFWHdQSkdFV3lSeDVoRnIyMGVqTWhWaXVhM1B6?=
 =?utf-8?B?c1RqKzV4L1BZQkNrZnNFNlRSRHlEamZyejFPSk0vMWY0c1dRUGpMSlpWVGJN?=
 =?utf-8?B?M2tCYmZsSWNlSWtLdE1STktMOUNCa3o1OTNaclYydEZhWHNqVnRKVEllK2lL?=
 =?utf-8?B?Q00yL01iVkhXTElDUnBTTEN4UlNMczRlVDNDOEZQNHVKQkZ3Z2pXL25QMnJ3?=
 =?utf-8?B?NG5SUDErN3hnSE1YbW5XTTlHTlo3eFRCOUVnTlhTOHA3UlhRNXNkUlFhazdW?=
 =?utf-8?B?c3FNVGVjOWdmYklOOGYzQ20xTHVLdGJtRWR4UGxnWkZkM3laaHdpdWxxSWFP?=
 =?utf-8?B?RGdqZXpoKzYxbFpOV3RRbzJteGRNQ3NmZ0U2T2hycjJUSVZaQXk4NXF6TGx4?=
 =?utf-8?B?dFF6SUhyR1Q2bGdpOGQ2eUtTT0ZDVHdzNWVEZEw4RnBKRVFTSGEreStZOW9t?=
 =?utf-8?B?NS9IbEpVOUdYZ3RVSEJ1YjE5RXR2KzhyQXhSUDA1aGJqVmJnY2QvZ0cyc3h3?=
 =?utf-8?B?dWRIWWtHNmhtVHBPVi9GVzgzOCtrQWQyVHlRb3hoajV0N0xYejJOQ255WjZr?=
 =?utf-8?B?ZWxzNnl3SmdpbzBudmswekhDVDdGUkM4L0ljMWljQktiRUpJWFFzZjR6QmJq?=
 =?utf-8?B?WnZROTNKMG5ENThjNFAvSGFFcUFOeVhNNnAyTG9BdC9XaWdmM3hDL1huTm9v?=
 =?utf-8?B?TjZ2bWF3RGJWbVVHYjRsT2lWQk81YzB0aUE5cVpSVHFMUTVYcjZQSkZZR0V1?=
 =?utf-8?B?M0wxeGplUjVvT1pJaEZ6Mk9ha3l4dExwdXVKK09FWjdZNmRRVTFCWGFVZ25r?=
 =?utf-8?B?dkg1N1VST0FrRzVvUWVKZGtwWWJFanpsYjNUSlhFT2JqOFppZjBtYVNLbjJm?=
 =?utf-8?B?YTgvcFhYcGhCSUpMYUZTOUJ3SXE3RmtVUkYybkxrY1RWcG1kZ0FYTCtrNFk2?=
 =?utf-8?B?SXgyZERQYTNZZDgwY21Dem54eFRURWtZUEQ0ZVY1RytJQ1dab21KdnJldytv?=
 =?utf-8?B?T0lOMTNxRWtWVnU0V0ovd1NoNFNaSG5wTXQwYmxRMWlhRyswMFBlNkExYURZ?=
 =?utf-8?B?QzdTU3NvY01NMzRya1JUYXBnNFpHOVV5OEROSGpZWkNzVC9mcS90L3l2MXpW?=
 =?utf-8?B?ano4UkRmWjNFejZWMEhsWUM2RTd6SHZnNmJuTk1NZ1JXNGFUang5a3YvRFdG?=
 =?utf-8?B?N0N3czlzUGxqb0xoODAzZTg3NUJPaUJJTndNNmJmMHpnLzUzdElFY29PNnky?=
 =?utf-8?B?eXVRcjQzbDV5Y044a24xWFVhR2FUVWNGQWNna2JBOU1NMXFMR28yNEFUbTdH?=
 =?utf-8?B?eGpuY3hObnovanVsWHJDdnA2V0duTjhiN3VMUUx6cjJuRi91UXhZZ0h5TEFM?=
 =?utf-8?B?RnViZHdTek1yV1hpM0ZtUUxuQzk0azhaU3RpRFcyMldQeUVTRlpCcmt3ZE5i?=
 =?utf-8?B?dmdBZ0JjV0xhaXNUOUsvYmdqQkZORjVwU1R0R284a3d4aDhWL1l0UDgzd0F3?=
 =?utf-8?B?MHFQeURvS1pOenZVYUMvZmc5a3dBR09MR1d3ekJjTVM5bnZBNGF1Yk5kU1cy?=
 =?utf-8?B?T2hSQlVzOHdydVc1ckVZaHdNb0xhZzN3WnJzVDdBY3V4azgwOC9HQk9Vbk1H?=
 =?utf-8?B?NVlPUXpyY0dDbmtNdGJIUzlmV2Q2d1hYUWEweWFDSTJHY3FlekowNFRLOWhJ?=
 =?utf-8?B?MVFsZ0dPSXYrRGlWRHBxTGdITjdna2Z6UjdlaDZ3NHpsYTZVandKanpGL2ha?=
 =?utf-8?B?UDJlWklFc3ZuNVphalRWM1dOcERLSDMwSnRieVk1bXNaN2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWtka1ZtTzRUcGk0Q0tJaG5kNkFGQ1pDeTFOYmNEV05RZFdFWDQ3VkhCYnI0?=
 =?utf-8?B?V283dUFWZ0ozcHVNMVRuemxKT0cweFVYSnJ1TjFPOUVZZzlNbElHdlQ2UVVx?=
 =?utf-8?B?Ry9wd2JIMFB1VlhHNDZTSWN0T3diYVkzSXMwN1VHTmxRREtaVi9LMHBZVlAv?=
 =?utf-8?B?cXhYVEdBbkVlWnFkcjc4NzhEWWxDZ0lwVnQ3Nm5KeXRhMnpML1VOc3dDb0hr?=
 =?utf-8?B?VjM3Vkd4UXJEVEhnaTBqZGlyUE03NStvbW5WN2VEajQybFJNTmN4NkNHT1lq?=
 =?utf-8?B?VlJnclA1OVd0L3kyZ1lPamU2eDNFUk9OTWxJV1JRK3hLRHVoR1NZWmpsZVdx?=
 =?utf-8?B?bmVaOVVWQlk4SGc5NDhEWkR5VTZQMGg4aGhZSk1yYjM2M0haTVViak56cjFm?=
 =?utf-8?B?R1A5THBpMnNRRkxvRlJsWFlNM0VDYVZ6VkdEa3NXM1dHazdwU1A5S1pTMkdr?=
 =?utf-8?B?emhDVXYwUDQ5ZEh5WE14OG93Mk12KzUzaWJyZlJVV3VheDViNXNod3o5L1FZ?=
 =?utf-8?B?VUw4QkNPZml2TUhIVlNic25INnY3c3Y1N2Vzd2tNR1hOQklabVFnUEZLbjB6?=
 =?utf-8?B?OFp5S1RvRW9oV3ZFZWkzZU0xd3htUDl4R005cmVnT3AreDZNSDh5cTM1YzJK?=
 =?utf-8?B?eC9NaFVUY0kvLzJRdzdUNDNTZDhFTmlyZWNZNDMzZTIyNnJHZ3NybTFZY0JG?=
 =?utf-8?B?VTRDblNtaGprU3c1TjcxRnNDN296VnpNbFZmZHh4Y3BVR0t5Mm4yQjk0cmN4?=
 =?utf-8?B?SjErT1JKUHMxTHBiUXFNWlpFUk13QmJTL3VhMmlRWVJmbUUyYUFoQ3NnZmx5?=
 =?utf-8?B?QWZjTXUyR1MyZEcvN3ZTVUF6UitUelZOR04zcDIvc1h3a0hOODd3UkYyUllX?=
 =?utf-8?B?SDlld0hKb0ZUTDhmUVNycm1hTzVNN3VJbm9xMmVMR1o1SkxIQ1hoNUZyK0NU?=
 =?utf-8?B?Z2w3aUlOU0lGb244ekdFYlhQdlBRNENKR3ZVSWxyYUsrRkdsdlMxUmFqSjlP?=
 =?utf-8?B?N3Q1MmhRS2xRcmFFOEVkQ09DL3FydGs0NllmNUdSakUwdlVDU3NOQ2RJUEFq?=
 =?utf-8?B?K3FjNHEwdk5Cb3haU2dTeDFaY0NKZURxejVGV294MEdzZWxUQ0hWV09vSWt4?=
 =?utf-8?B?OTRhSDd3N2JUUmlRaFByMnFwNXlPRUV5VnpaY0Vmd3dOWEFPOHpHcUVFMGE3?=
 =?utf-8?B?b1hMSHU1N0xRMjh0aGpnMkZJZW5KTHBnUUdZVUNnRXBCSE54KzV1ZlpIeVJu?=
 =?utf-8?B?aVdCUEhJWFV0RHdtdmJ0UzJlK2hla3lIZGRISk1jQkdOZWVJZkxVKy9BV0tm?=
 =?utf-8?B?bElmUUMwd3lLeUFBWUkrTTJtSEd4MytMbHgvcHlIaHZxNG5yTTZNLzk5S2FQ?=
 =?utf-8?B?WXZvcW5MVUJLNjA4K1RWQkEzalE2YnV3eVBaQmZqOHhRRm5XbEFiNlBSYUp1?=
 =?utf-8?B?eStBeU1ERXVMNE5uU1N0MnNKeVZhbkI3QVhoNWhxMDNQczhvM3VrbVpDOTU2?=
 =?utf-8?B?aTBpbXRoc2JzTmkwejczRGJLaHlBMnFqK2FIOWVWalJEeUZ3aDJGOXdQTm5x?=
 =?utf-8?B?NFM4SE1vNlY2RlNUcy9aL1ZtdG1kTlp0T1E3VzltYVZuSDllWXIzcCtTVUts?=
 =?utf-8?B?d3pJYXNJYWNpM0FaY1FjNnNJOVlzVnVuY2VqYUxoWTM1MVVGRXRBRGVrSFNH?=
 =?utf-8?B?dmlhM09DYnhQZ04wcERzV1ZQWmMxZDMydWxybFRaWjh6Mkd5MFVVUVBoc0ZY?=
 =?utf-8?B?aE9xRkxhOUp3WWtPemoxLzczb2VHaUhQRHlDVjdDamlxT3NLTEhOSmhLcnpS?=
 =?utf-8?B?SklWMXpMTy9qOVJIWlhjVTZQUk5HNHNkc3l2eWNScTJSM0lMaFduVWlBK2Nt?=
 =?utf-8?B?aUNYN3Jvdk9neTgweVFNL3dwcE9QcFpsd0IrY3hLRlRWNnp3eHdPMzVTTGx5?=
 =?utf-8?B?QjVJMEhrTmRyRUxyWTI0ZUJNTGUwbmpxTjcvVnBiUWVHZkxiTHl4QlowZE5G?=
 =?utf-8?B?Mm1SWFhGT21LVEpSUkhiRit2OEdiejlCMWwzNTA5M2g2YktsZDhsQTVZRlZX?=
 =?utf-8?B?OEp5cFVvVzZBOC9MdlM4WXp6WnRPS1JsbXZvbXhYV2tyWG93blAzRkNkS29X?=
 =?utf-8?B?RVZjYW1QT0NnYlBIQXgwTk9rdnYxdjR6VFR5enlsaEJlL1hJeDkwR2RMcjhH?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13b461d-6f68-4fdf-81f1-08ddc5ed2978
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 11:20:55.1870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcIkgbKQOP7d9oOP85v8pJk5L4GqEP4fY3lth62tsWpCJbyGn+/yeteHySRNbjH5QdPiqtRbOnGk+RrX3z9+rclYuBosNfopJPwXnMWnomo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10464



On 17.07.25 16:03, Jan Beulich wrote:
> On 17.07.2025 14:58, Grygorii Strashko wrote:
>> On 23.06.25 21:28, dmkhn@proton.me wrote:
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -2080,17 +2080,17 @@ void __init create_dom0(void)
>>>    
>>>        dom0 = domain_create(domid, &dom0_cfg, flags);
>>>        if ( IS_ERR(dom0) )
>>> -        panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
>>> +        panic("Error creating d%d (rc = %ld)\n", domid, PTR_ERR(dom0));
>>
>> May be you meant %pd, not d%d?
> 
> Certainly not, as the argument is a number (and dom0 isn't a valid pointer).

Right, sorry.

-- 
Best regards,
-grygorii

