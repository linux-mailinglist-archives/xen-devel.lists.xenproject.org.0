Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4249E7BF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 17:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261637.453184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7o2-0007Qq-8D; Thu, 27 Jan 2022 16:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261637.453184; Thu, 27 Jan 2022 16:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7o2-0007On-4K; Thu, 27 Jan 2022 16:39:30 +0000
Received: by outflank-mailman (input) for mailman id 261637;
 Thu, 27 Jan 2022 16:39:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD7o0-0007Oh-FD
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 16:39:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0861af2-7f8f-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 17:39:26 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-2FRnBAsqO6eDIGH_oIdcIQ-1; Thu, 27 Jan 2022 17:39:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5330.eurprd04.prod.outlook.com (2603:10a6:208:5d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 16:39:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 16:39:23 +0000
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
X-Inumbo-ID: b0861af2-7f8f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643301566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tj2ke7WSkHngM11L1o1J/VnnjX97LkyHEKI8AW/no1k=;
	b=DOeaDhn9TaY8BgR2SUruyNpDf8bJeWbFuSAfvGXyoc78r0e5PR9zQgs18Pk9fPvR9oxCNZ
	sb0ezSNmKfGjKjogxaq7EHxjFYQkNfAgR6FPMwsujFKWIVW3Y2epeN0VSV7ayHrkRe5/up
	g3qlMyqncr6SJ3xRhVa6Ii3kRvCm3VQ=
X-MC-Unique: 2FRnBAsqO6eDIGH_oIdcIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z36YBVAR6QYkNkZmPQ+gMCRH+DV0PhA9jn7YfdeQrKcuhkWvMGVIss9nQkxNME9l3z67VMGkK7URJ5PmGDTH6H4tXzG4J03M4lRio0DNMFhWvRd98xV07VlSyQwgFh4bVVVif+mL4UihVWtOIyxrxdeDxAB0qXCefKuLm7nwfuHn61uElcEAlOLtU6idsobuLAygYFC/NQJsdJBoYy7ut4zEUv3cm5XpZLTv39h/xh7H2yNoH8ZVfkBcuTjHJT7qMd9HL/s32wLxMiRbEfC9mgdqGkXZOFdEorwA86JuJY73b6J7J7v9GMs8GK+bDWOwVJm0A+Ap6Oh4xLgWix9f9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj2ke7WSkHngM11L1o1J/VnnjX97LkyHEKI8AW/no1k=;
 b=HJTS/Zh4avP3GHf9kJ1Izrze4kzWCmLbBLJsC1M1iu/SO8wqQhLVYvcLLdkl2tgvbIYG+G2OOMb45CxwbFGHzLtlce4N8k3oG7jRo4cVfqZon3XqJUjdJlOIZFBjPTkdLt4LP3MrJQ/NJlPwzhNqUUcqMqlv/G8L45Anwfx0fnco9yTGUfG2dhKLgB23yBVAGin2tA/y+rWdBQDYk4HchSE2c7D2l879joE9LrSrDgDpZ/hlb/ktYsiZiJH6Mof6QyKGyTp+MBw57OBY1wiIVHDl1v/J2eJPiFfIOK7Yk7M/5Vg9MNzbcbH+wwti7nf3rl37jo4QRXpvcWcZkAOUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8de571a4-0c66-cda5-bec6-60b3fc229f95@suse.com>
Date: Thu, 27 Jan 2022 17:39:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] x86/cpuid: Disentangle logic for new feature leaves
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220127160940.19469-1-andrew.cooper3@citrix.com>
 <20220127160940.19469-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220127160940.19469-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0045.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7e71569-c637-41ef-1ef9-08d9e1b392e3
X-MS-TrafficTypeDiagnostic: AM0PR04MB5330:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB53300B7F63388BE3DB1D3AC9B3219@AM0PR04MB5330.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nBhJdFeyIbHu22LmUUm+9bLDdr0JI4HXaOqovVawUoTBNouHfuG9Bnaj7qtmZew0fbz+PPbnTGFSBn1CLYiCfzq56fs78aDqc64o7K2mIKYmxjAgTR8VD8jPO5tMnt7GVu4yQ9OZPee0LdqheaTdtD/OkcBj3jk3xRDjx86nNbdASnEpyUHNwrEemEnlMQRaALLNX/M+l4nF9grOZnia3qR8A0i/Phxkc74JqFWNymcE/2+9zWsljoGgLYns8RyXVxLiOpi+01Nl2S1ssefNZOR50O+8ROds8oM9869Mr+xR6Ko8t0o/wHdrGVGSBrbAAFfPookDtsnYlCbxWUYkavQTU/1cqXaBAAnw3EQfjSjGKwjiCZl+sQrnnEACZutUYfc8ytWHxSOWHH2TjL/R/3hbsBVWXt3/H+JMlL7cxxE9DBtbSy87oRjusJKiPTKl4AP31uWbrnbiofZ7OYgifc7qF3wm37DzzTAiRWcteyUMxGvZKC0cu5FTIgDz0FDDKAwRlvZCJ6VqJAIsWqtWSIcOCh01zC++YoOrGMzV/UBA5F1T57EQhbLiYhsPC6v26ReYV0R7troZA2FPKxcTBgFlhQHuBu7Wi+R5IlFhnyhinf1+ljSiJvXJ/g+KqKUz/c4GJtVVLwMFoOo6GQLKazkVxflCooNyfBHG1+HvMcPTp5LI9LOZoMjZwjEj7jRhGrzHbhGfxv1gerur85sTw0R+A8EbgkXRAOs5i/TlME95tnz1GORx4N6YILl81gwJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(36756003)(8676002)(6916009)(8936002)(31696002)(66946007)(5660300002)(66476007)(66556008)(38100700002)(316002)(4326008)(2616005)(26005)(186003)(6486002)(86362001)(508600001)(31686004)(53546011)(6506007)(2906002)(6512007)(83380400001)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW9CVHZyOVFaUkEvOUh4aUZ3ZmhmUFhxbHdia0xSWHI2bFBzdDhjems5emlu?=
 =?utf-8?B?dzc3a1liYWUzdTZ6TU1iTGsxb1lVWTF2WWpyTWdhM1U4V3gyMGJZL1U1SGpo?=
 =?utf-8?B?UG5pR2k0SzU2R2x0a0I0ZDM0US9aK1JWdnZaN1BoTkt4REl4YWk1WlVEcWxh?=
 =?utf-8?B?WXV6YWR5V0V4bDBXdVIzRVZxdHN5U1dWbDdqMm1jWHBPUHFHRTRWc0IwQ3Fm?=
 =?utf-8?B?emxZcDBzdkRrNEdBM21FSkhuWWdrZEhiY3pJVnJOc2d6b1NQYmhORXJiNGpk?=
 =?utf-8?B?MU80WTE5elliUklPd2ZHZGxObGhCa2FqVHcwUVlDRjJFcjd6TzFPZlpNTUNn?=
 =?utf-8?B?R3RQeUFtb3FBZ0JkQkpiYjJ1dXFUUTRsMWlzU3RObmFvQ0plQ29qNEF5V0Vr?=
 =?utf-8?B?NVBiWnF6NHRKZmpmc2MyZytJQW9MVmRFN0M3UWNUNk1iQ3NHME9kN2xvRlNu?=
 =?utf-8?B?bFVhRUhoaThSZWkzUXR0aEc2cXd3RGNUUHo3TC95YlRQbDBXbTRhRTBJUWti?=
 =?utf-8?B?b0cwbVFPMEw3MEZsZWZmQ0MyT1JBRFdLM2V4eHd5NkRMMmZRenlKNkYySHg3?=
 =?utf-8?B?YXA5MWY0TG5IdGRxZnAyZWRDVThrdzFFVXpmV3FRUFJPY3IzY3JycDl1T2Z4?=
 =?utf-8?B?NVE2QXE2VC9BbWZORElKMjZoa1FPUHEzbFRKWGZMV0F4TjBSWDBLNFpVWkZy?=
 =?utf-8?B?ZU5rNDY0LzQ4dFRTM20xNllOSzIzQUwxNjBZc0J6NE4yclJjQTJCSFpnTGhk?=
 =?utf-8?B?bGdRVTdPcVk3ZDFMV3VtejVJRzgzWXVCbEZPL2hOaHY5cGJ4N0JjRjRaYW5G?=
 =?utf-8?B?MTUxVGdXZjFJd3lYM0VPby9sM2RpKzV5R2MyRmpVTFRLNk55TzZmSkJqV0F4?=
 =?utf-8?B?Z1BTNHVYb2ZWdmFVeGRsY2lmV0RWQU9iZGE2eERFblMwUW1rWEZQUFVMQ0tU?=
 =?utf-8?B?Z0dxbHgzdWxWQk5PY0NMRFdNeXRGZHR1VFpHM05UZ1JLRU1QQ0syRnl1d3d0?=
 =?utf-8?B?d09TOHI4eDBWZlZueUlySnprbit3SVNOd3VmcDIvRHgyTnVQTVlIUjJFK3Zh?=
 =?utf-8?B?MDhyMFd3dmlpbHRxeG1pRDV6N3VRRitFUVhjYi91TzRJZ1BJYWFNbWV3am81?=
 =?utf-8?B?LytDTzRlU09YS1V4ZHlNQ3JvODFaWkphWm9RcGpudlErdk94bERSYWo4Mlor?=
 =?utf-8?B?VjZBd3J1V0dUR3FMZmVSa1p6T01XaXZqMmR6ZE9pQTh0UW1UYTU3cE1mUjdD?=
 =?utf-8?B?dTA4T2ZMc2hOa1k2dUl5NTlnWi9iNTFPcnJjekR2b2UwTG9JNGs4Y1QxNzVT?=
 =?utf-8?B?RGZhRFdLcFg0cUo5d0JOU2ROMnkrMm5ZRnI3Q2hBMzNGcW9IcDdmaFg0WElF?=
 =?utf-8?B?WWNVMUg1SFFCZ3hOQklWU2owZjFqVHVieWc1ZEI3MFM0QVVsald0WE5sUTJ2?=
 =?utf-8?B?Zzloc1NMU25ZbVFrZ3ZLR1ZWaFJyYnNZWnY0KzhiaGxydVpWVzlxM1ovOWV0?=
 =?utf-8?B?YUpGL0JWdE85azZDWEtzeWpxYlRpYUIxZ2w5TUEzMmY3R3pacVVTbmJRdGh6?=
 =?utf-8?B?eUxISmtPWFI2VEpEMTRxbHpJSjN0NGhvOHBaanM3a2NseTVlaTFhK0NQUmdT?=
 =?utf-8?B?ODZ2OWVWeFZ1amQ0SFN4bVhGQm9RWXh0ZFdMMXBJUXY0MUliMFoyQm10aUhS?=
 =?utf-8?B?MEtycG1CRWcxb01hWkhmRlFKcCtVNi9EVzVGb1JTektSelM3bVlmSzd1a1Q0?=
 =?utf-8?B?Zzc2YWoxaHd0YkVFaVk4QUFncFhJM3lVNEszZGwrcWpWY091dG9aRWZzeEFa?=
 =?utf-8?B?eXh2ZkNmOVp0V0xzTWxOekVOR0pnN0RlT0ZlcFppOG5zNDBoNkc4TkVuUm9v?=
 =?utf-8?B?cW9JcWVHRmZrY3UzYkRLQmtVbGdjUDRWbklHSmhFSHJuSFpwOVNLV3NJVkQr?=
 =?utf-8?B?d1JuQ2g1Zm9SUlZ1YlEwVGtxWjlhRkwzQWVwNkZlSEd0dXJqbVhkdCsrWWdi?=
 =?utf-8?B?OThscGdqdGtuVERHTDhNMXVaNlV0QlNvZkNHLzArek5wZ0pTYjFvM0JpWVRP?=
 =?utf-8?B?ZXc1QTB6YVlWQm04ZWF3UWFpcDI5WnlkKzF4K1pXdU4xblg1WW15eCt3d3JU?=
 =?utf-8?B?bE1hZ0l5RkZ5QzhKbGlwSFhuZy9FbTA0eGJ5Zk1BTVNJZTBkWVRpTnVOTnc1?=
 =?utf-8?Q?55rCv9RjuS13IAu+Iuim3E8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e71569-c637-41ef-1ef9-08d9e1b392e3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 16:39:23.1889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlmBNHIpS7+DsUj/0VENc0CB34ObvH/XB9Dzs82Jj7nq+ezRdqRkCUnrvEK8CfHiDvIn3CriM1VJQYMItE01zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5330

On 27.01.2022 17:09, Andrew Cooper wrote:
> Adding a new feature leaf is a reasonable amount of boilerplate and for the
> patch to build, at least one feature from the new leaf needs defining.  This
> typically causes two non-trivial changes to be merged together.
> 
> First, have gen-cpuid.py write out some extra placeholder defines:
> 
>   #define CPUID_BITFIELD_11 bool :1, :1, lfence_dispatch:1, ...
>   #define CPUID_BITFIELD_12 uint32_t :32 /* placeholder */
>   #define CPUID_BITFIELD_13 uint32_t :32 /* placeholder */
>   #define CPUID_BITFIELD_14 uint32_t :32 /* placeholder */
>   #define CPUID_BITFIELD_15 uint32_t :32 /* placeholder */
> 
> This allows DECL_BITFIELD() to be added to struct cpuid_policy without
> requiring a XEN_CPUFEATURE() declared for the leaf.  The choice of 4 is
> arbitrary, and allows us to add more than one leaf at a time if necessary.
> 
> Second, rework generic_identify() to not use feature leaf names.
> 
> The choice of deriving the index from a feature was to avoid mismatches, but
> its correctness depends on bugs like c/s 249e0f1d8f20 ("x86/cpuid: Fix
> TSXLDTRK definition") not happening.
> 
> Switch to using FEATURESET_* just like the policy/featureset helpers.  This
> breaks the cognitive complexity of needing to know which leaf a specifically
> named feature should reside in, and is shorter to write.  It is also far
> easier to identify as correct at a glance, given the correlation with the
> CPUID leaf being read.
> 
> In addition, tidy up some other bits of generic_identify()
>  * Drop leading zeros from leaf numbers.
>  * Don't use a locked update for X86_FEATURE_APERFMPERF.
>  * Rework extended_cpuid_level calculation to avoid setting it twice.
>  * Use "leaf >= $N" consistently so $N matches with the CPUID input.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I will admit that I'm not sure yet whether I will want to break up the
KeyLocker patch just like you did with the PPIN one.

The one thing that worries me some that there's still the unvalidated
connection between FEATURESET_* and the numbers used in the public
cpufeatureset.h. But I have no good idea (yet) for a build-time check.

Jan


