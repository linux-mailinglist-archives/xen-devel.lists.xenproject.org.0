Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9106416F28
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195066.347557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThgI-000284-Pu; Fri, 24 Sep 2021 09:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195066.347557; Fri, 24 Sep 2021 09:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThgI-00026K-Kk; Fri, 24 Sep 2021 09:39:46 +0000
Received: by outflank-mailman (input) for mailman id 195066;
 Fri, 24 Sep 2021 09:39:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThgH-00025k-GO
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:39:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58f8a16e-1d1b-11ec-bab8-12813bfff9fa;
 Fri, 24 Sep 2021 09:39:44 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-sDFkuKTQPfKHbNhopJ82oA-1; Fri, 24 Sep 2021 11:39:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 09:39:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:39:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Fri, 24 Sep 2021 09:39:40 +0000
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
X-Inumbo-ID: 58f8a16e-1d1b-11ec-bab8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632476383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sAh4qxCYW2BkeZSUGmjdagQLfFE+wJDwsdXfXjxI/CY=;
	b=AMAk4YVJyJN16+V/PeBPWnhYo7oSW8xBL9XiSSBcBVbL2V9LIEHGiUVh2Oni09YUVKaaGu
	hzYdb1l55YUJCXB+afZAUarqRE6JdtaHqBN/BbxPZgJwcq8MtYfsRfgUvhTK41OEGMCJgW
	pdHPjd3fnlLHQYRlMa1ct5AseW315OI=
X-MC-Unique: sDFkuKTQPfKHbNhopJ82oA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVK3FASUw85h6qK8WZk/uv0Y9e8+D4ac3zipZ28Gjj13aPWlhKWTxvIIOkwJSntuU4YDbWD8jJuWgMjrfH5OlvCzhlG3FKFS/un3Zf/SyXssNp3cDbQKXvCO54CIr9w8EfnE8VSfiNVJviGCyR+OIhqJdo41BihWKK0KXud/2c6qEGebIb6VsOYNblz5hH/4yKpptZEVZCcX94eF8j5TCK8P2ZrhM9pqBKkAiNWCvdR8Ws4hJV74xI4kl8rRrjOvXHRkAZwEF/CZyvuabSF8k1dFLoP9R7nUHkVhb529UtseKgND5T3NmM3oSBG6ao8vN6nMS9JZGLtlwXkm6zQdxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=sAh4qxCYW2BkeZSUGmjdagQLfFE+wJDwsdXfXjxI/CY=;
 b=ciw3/yDfpd8ZR31w9h0em2oW1DTy5GzO4pgW6YLrohKmio2D2bQODcUvutnv7SJPHXy/T9U/Ix3rizn4ufwbPpTC7ESTZrivsgNUvZYYiPUGDWL/XwmDhLIlyHW1QgD8WiEId0C/mV42SXnuWTXkOWXPZa3DVV+rLsCxw3JMq0G0viXMOPPdIzM/kIJyCtZz3O8wO6i8PDu4yBjhYYtGUeXG+5BKeVJZtRb8c7ly5JxaqizZxt8UBsEKbZPsRKGH70RMf5nOo4Ydwh/L0pt/p25oGQ7dnrjACMh/3VBJS0w5Sk6msBh2lixj96UuYr+VVCo861apbeZeQw7HW4JKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/18] IOMMU: superpage support when not sharing pagetables
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Message-ID: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Date: Fri, 24 Sep 2021 11:39:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40504fd2-599a-429c-ac23-08d97f3f3b28
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23344F5D079B49F80249FBC6B3A49@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZL02RNxQ0IkV3a83cKEJ3BKvyEQKJU0cTEpCIADaNBRMwHKdTMPuAh66VfNUc2TmHxl3i0zfI5mZIgVD5PmWvxTsBOJcYNVn10VWXE8fieOuyc4GItW3439quMamNdYCLnGCtvS+9Hvb9JNTRUSev3tmFf/vtrACvdBIEYRldJn6d0qa+AExN0saj596low/NSuk7OI5lHZCmp7eisI8L5FqcbmCGKwQU4FNwp+OpyuHHkTqtWYZdo86Qm3+AdxI3gnp6Qsn12jMwr4Kh/JQssHcplukV3MCksvs9i5E0/Ivo7CDt93i/UxFi1L4Ve5Gitr7RsUVKvY3/9Uo/+MePIuZzJWft8wU0vshnPuvS0fST/OD67k8LHNscCchQ0VaTWy/icIEAjrUj5qI7C8X+Ubtx17+UUUbijz6Hw2t9O6V2HXOvbvwFnvtorJAnGR3INYrcy/Cmoe19Gd7SthI+b22EKWbOzddwSO0FK5Ml867yU8wIUTR4QDfHfe40dxTKQXj/ueJZnnOlc0JNjUIxmQAdQbt50Ns/tcnJFJ+ZiqcezsNCgnm9xVplcod2QsfN+cJUuRm/JW1FH9TFt5/SppQVelUaYYlx7SDT+TLWZh0X4LMJBbjY0JKToaTSyb7N0q197gyi2wjSxrKYYV6H3mAfciDLQ4Myai5UYCplXpyEOf44JhikjVUCTr1tG6BgMLJmWl++BZ/9e0wd/0mjev4fACZS49Ryj4BSld2J9FxP470D5XGIRL3AQNrXJxiwtMQDUDY7pXPZ7SlWzDJNRwD/m1JvO7BL+gzTO01IFjb5CHEsAsa4FlKGhSdLLiI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(54906003)(4326008)(66476007)(2906002)(31686004)(83380400001)(38100700002)(6486002)(16576012)(66556008)(316002)(8676002)(66946007)(8936002)(86362001)(186003)(26005)(36756003)(956004)(2616005)(6916009)(966005)(508600001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3ZHWTJvL1dPaE5Ub2VucHVIZkJnVTJTS2NiV3dTV09QTGVKUkFrOWRwbUs2?=
 =?utf-8?B?Z3ZqWCsxMksyeExvc2xHS2JCWW9FS0dRdzQxcHJWbHgzcERlaExMOUtlZWc3?=
 =?utf-8?B?SVJhRnRuREJheUQ2WGdKOThjYWFqcHNRNkdoQlN1U0lEcFJ2V041Rnk1aGJE?=
 =?utf-8?B?RS9GM1l0R09ZOXByT3QxcVRvSDdnblBQcjFtdW0wRTVMWjRTaXBpd0xFZ0ZR?=
 =?utf-8?B?RlorTEZIUiswOVdxcmZxTkhNajUyVDVDa0V6V0JnbTM4SVBvSm9ub2JpbzI2?=
 =?utf-8?B?QnJtZU9qM1VVNXAyZzkyVW9qWlI1L0hRMmNIYVRkMTQxTWNRZGJwREo2Qy9p?=
 =?utf-8?B?bmh2Z3dObXA1Y0s0TmxZRFA5VmRHb3ZzMm5GckpCL2dhQ3hyeTNsSnRWR3hD?=
 =?utf-8?B?em5sYnZrYWVrM2k4NW9VV1A4RU5JYWIwc2VjR0pyM0s5RHQrYnAxWThFa3Bm?=
 =?utf-8?B?SERhdlZGNUg5bXZRQnVZRE9iVTlWOXdmMWZMMFFhN2QyRlZkUUZkajBpV0pZ?=
 =?utf-8?B?eFNoT0F2Sno3eGxVdndmSTFRbTNEUEluVDNBYjdqWjZBem1rKzdzZmNuNkZ5?=
 =?utf-8?B?eURiZTJtdlEzZ1JSY0JaR0J2cWdrODV1TjRnbytpOGxpbGNPaTlLUmFFaXFB?=
 =?utf-8?B?SkQzWGRHUFRkbDQ5OFRhUEFKWmNZWlU1bkFzYmZ4R1JuSzdwUWFSTjlMMnpz?=
 =?utf-8?B?ZEkrMm80bFVmRjlhRTVqOFFwcXNXb2NtajliWjFzT0FPMHphTjZrNUZVVkZS?=
 =?utf-8?B?WTQ4ZUJCbTR5b2daT1g0RlFiSStHajJ6eWFuY3ZyN1hwOWh5MVZITXBpaHR5?=
 =?utf-8?B?VkRHcm0xbS9QMUI1VWQwV2ZuY3RSYTBPbGFNa0grMlQxalZmbUFMbzNWTkI0?=
 =?utf-8?B?Z1N0MTZPV2UycXlUMFVMa1NiVTZ2NXVSZ011emVQenI3NEVBbDQzOVgwZko0?=
 =?utf-8?B?dEdSdzNuTVl1OG5lWGRLazlKVXkrQmFRam81bHdyQ1V4d2pEWmxYWWRZYjZp?=
 =?utf-8?B?TjBuYllCZUh5NzYzUzQ5SElDekhsbnRCOHZDTDh6SS9LeFRsZXN0ZjU5d2U4?=
 =?utf-8?B?WmFua1J2clFCSXNqa1kyNUNXMTNZZG5CQkxnU3JWcjFEQ0dzSjdzM3k4dEFx?=
 =?utf-8?B?a2I1YjNXdmw4dHI2MHZhMGxDSHRVSFpVVjBIcGVLbkY0cU9Tc1hYN1g3aXVr?=
 =?utf-8?B?RnJBa09VYlhRRS9VSk96TmdpbHBxdXlMMmp4dVhRaDFOVDBlYTUzVnd1ZzhD?=
 =?utf-8?B?VGNxRGZZMDVJbHhBSFdCVWJDSmhzWnR1VVh5UUNBL2VRS2Z0UlA5T3pUd2c3?=
 =?utf-8?B?dWQyZHZHeUl5U0FkOE42cEZZNTZiZ3BVRGZVUHBYRUd4UGI5SUFvbEtQb21P?=
 =?utf-8?B?R2hJeEJaRkZOSmdkQ0VSeFZGWXZoUDdzODRudE5SaTJxdDJ5WkVJWTNOeXlN?=
 =?utf-8?B?VktBOVpXZytEd0FpYXcrZXRzMHFkWityQjZGUmN3bkR6OCtETitsSGFhNlla?=
 =?utf-8?B?TzdlSVZhSnF3aEtpY0pKbHptL2hZQXhra1h1VUNCMXJIZEN5OHBFK1hYcFdV?=
 =?utf-8?B?enVOQkdvNjlJbm1sa2dveGtqM0VkRGE3bEwvOU1zcnF2NTV4SEZ6WlZLS3Z2?=
 =?utf-8?B?YkREY0h4Q1ZLTU1vT21iMlBTd3M2eXpwVGFkUDVUNXlncnhKWER1dnFWbTVE?=
 =?utf-8?B?WnZ3THNqWkRvVHJEQWNTaTN2MzVhZnlHaXFYaU9nRHdaREU0OU15S0M5RmFZ?=
 =?utf-8?Q?e6OUxkLUrWfQ2JGBF9npvyUwWbNEM45vLNIo9Va?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40504fd2-599a-429c-ac23-08d97f3f3b28
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:39:40.4712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFt/n/+njX4tJ/S7hTOwsmMi93knT/Re6zOF6CvQHe2pR0+1vHOox4ndm4+LM9JRYWjwy6Gaashj00JtrZ9vcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

For a long time we've been rather inefficient with IOMMU page table
management when not sharing page tables, i.e. in particular for PV (and
further specifically also for PV Dom0) and AMD (where nowadays we never
share page tables). While up to about 2.5 years ago AMD code had logic
to un-shatter page mappings, that logic was ripped out for being buggy
(XSA-275 plus follow-on).

This series enables use of large pages in AMD and Intel (VT-d) code;
Arm is presently not in need of any enabling as pagetables are always
shared there. It also augments PV Dom0 creation with suitable explicit
IOMMU mapping calls to facilitate use of large pages there without
getting into the business of un-shattering page mappings just yet.
Depending on the amount of memory handed to Dom0 this improves booting
time (latency until Dom0 actually starts) quite a bit; subsequent
shattering of some of the large pages may of course consume some of the
saved time.

Known fallout has been spelled out here:
https://lists.xen.org/archives/html/xen-devel/2021-08/msg00781.html

I'm inclined to say "of course" there are also a few seemingly unrelated
changes included here, which I just came to consider necessary or at
least desirable (in part for having been in need of adjustment for a
long time) along the way. Some of these changes are likely independent
of the bulk of the work here, and hence may be fine to go in ahead of
earlier patches.

While, as said above, un-shattering of mappings isn't an immediate goal,
teh last few patches now at least arrange for freeing page tables which
have ended up all empty. This also introduces the underlying support to
then un-shatter large pages (potentially re-usable elsewhere as well),
but that's not part of this v2 of the series.

01: AMD/IOMMU: have callers specify the target level for page table walks
02: VT-d: have callers specify the target level for page table walks
03: IOMMU: have vendor code announce supported page sizes
04: IOMMU: add order parameter to ->{,un}map_page() hooks
05: IOMMU: have iommu_{,un}map() split requests into largest possible chunks
06: IOMMU/x86: restrict IO-APIC mappings for PV Dom0
07: IOMMU/x86: perform PV Dom0 mappings in batches
08: IOMMU/x86: support freeing of pagetables
09: AMD/IOMMU: drop stray TLB flush
10: AMD/IOMMU: walk trees upon page fault
11: AMD/IOMMU: return old PTE from {set,clear}_iommu_pte_present()
12: AMD/IOMMU: allow use of superpage mappings
13: VT-d: allow use of superpage mappings
14: IOMMU: fold flush-all hook into "flush one"
15: IOMMU/x86: prefill newly allocate page tables
16: x86: introduce helper for recording degree of contiguity in page tables
17: AMD/IOMMU: free all-empty page tables
18: VT-d: free all-empty page tables

While not directly related (except that making this mode work properly
here was a fair part of the overall work), at this occasion I'd also
like to renew my proposal to make "iommu=dom0-strict" the default going
forward. It already is not only the default, but the only possible mode
for PVH Dom0.

Jan


