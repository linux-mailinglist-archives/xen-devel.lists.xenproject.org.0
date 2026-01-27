Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAScOcHxeGmGuAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 18:11:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1519843A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 18:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215096.1525350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkmap-0001fv-FM; Tue, 27 Jan 2026 17:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215096.1525350; Tue, 27 Jan 2026 17:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkmap-0001dN-Bf; Tue, 27 Jan 2026 17:11:07 +0000
Received: by outflank-mailman (input) for mailman id 1215096;
 Tue, 27 Jan 2026 17:11:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vkman-0001dF-Nw
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 17:11:05 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 292be341-fba3-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 18:11:04 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB7776.namprd03.prod.outlook.com (2603:10b6:8:1f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 17:11:01 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 17:11:01 +0000
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
X-Inumbo-ID: 292be341-fba3-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bF23f3ML7UJ1O0ljyYF5rJV5MAKxs15rPaytagg3X9c1EjYPPYK/9UkYitvB9XZg+IGPX5SsYzwLgVRcbQliYItYJEEpHr6ph4g4yaoF265y+YB/oNOYAvs9ero/esdna9hs5+pY2CuZBvLrvu64o729SlFdmSKRhWjj36T3pIKCQvz1NZuvimch+bi2TRnOe2Jeead+E45UIlHxRz+dM6dA9HJgdUAk/2csDIqa9TQsxSdjTwzU5uqHDaTGpabs/UN/fDKjgWLG8RA9x6mvADp72y4n8xxVZuvhKNEJids5iIHb6zzJ/ikyz15IH7gAa/y/CHddn9oT5T0yC/y9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29EKGrTpStd6wnpmTvhslbg04JoVHcF9rqVLaHKnQ6g=;
 b=mDWjGdFCXN2yHP2VA+7xg7JuJf/cy9mjNow77j5zPj0ltRRhDU+8mqIl80OVIRYjHbfYNDJa4dfpWtKRK/0Ww+ss2E/i4rWXdyzl6bYH4ocSdXKIbe7+tnDJ/ZfeHPTeGE0dq3NfXJJXOBWllelXnIbF/rLgF9yJYe5HaWbSNUS+ZTLcpYjYEDCiyV/cEj0/L8TJuaLX9eeNRqw/E5d23xytgxK34cSeqHo0HoGKSQ6mSaQWaC91w7B466ObXJfu/pjV9PyCOwZN8wmrXfdFIXqI7Fm1lIA0/rozt2QvggyBvypXGPT5A5iqw5fyBy2b4ovYUlW5qd0p4QyeYPO5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29EKGrTpStd6wnpmTvhslbg04JoVHcF9rqVLaHKnQ6g=;
 b=oAsqAMJ96NZPfl691inRKsUAEIiv2azzk00kxnA5sCQmpV+NlW36QP3QXITPpGWZpNMmP6EBptrO6vj1aIySsSGXR9IF3Ume7h0HMu+3bGsB5rHokIcQ7oOYHeFYqx7Fx9BH1WcrZG73jbnzFoUY0WTgD24zP5xfcbgOjQYTLP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b9202688-5bff-44b3-bb10-24d05520377a@citrix.com>
Date: Tue, 27 Jan 2026 17:10:57 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/treewide: More typeof() -> auto conversions
To: Jan Beulich <jbeulich@suse.com>
References: <20260127101841.2213758-1-andrew.cooper3@citrix.com>
 <18aee854-2e08-4a45-9df7-1c622136afde@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <18aee854-2e08-4a45-9df7-1c622136afde@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0035.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: bc942b22-9e86-4f94-2967-08de5dc70bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjJWUVByZ2huN2NPZ3MvRmJkQ1c3YWhnb0RtU3RUbitnS1VOTWh3T3NMQnB1?=
 =?utf-8?B?K0U1YkRJK21Dc0ZzV1Rja0NUVDEreU94VytLVUpGYlJtUVZtMW11aWJiM0Mw?=
 =?utf-8?B?RDJvVzdMWkx4UUEvZnpQQVkrZm1wcGw2M2JTb21PNEE3dkpTVDQ5VkNBa1BE?=
 =?utf-8?B?MDhiVWFZQkpzVmJEUTJ5ZUJsWTFlUEFnVG5CN0xEYnJja2FieXk4TE9jWU5T?=
 =?utf-8?B?RmJ0OFp0K055K0gvVHlYYVE2WWZNYnZINHVrMmhNdEpEV2ZBc1paeFNjTXpx?=
 =?utf-8?B?V05xbG1vQlgzT2ZQS0NaSWtLeWplbEN3V2w4R0hHMnEwTTZkNUxvZktidEVS?=
 =?utf-8?B?dUxxSWpSejZTeEZwZU1nMUFGWms5cE8zTkJsZ2FkcEs5cTdibXRPaGlCK2VH?=
 =?utf-8?B?SE55UWFFMzFBY2VOYmJJdzRxZVZUTFhyV3I4TEh2aTlVRHhRUW1GbUN4bHlE?=
 =?utf-8?B?QTJ6TExCWExTOS9rVEFKRHV6M0IvK3UrMExwRTZzMDIydnZUR2xScFZqMncr?=
 =?utf-8?B?d1dsSmF3KzJxbW55N3BzZXV6c0ZGcW9HRlJETk9yb2RuRWFPNis3YVRPYzRh?=
 =?utf-8?B?U01kY1VZcGZXanM2aS9DL0lDWGtyT1VhQWtIYW9BWmU1VnB3UUw2MVE1NEFw?=
 =?utf-8?B?bzQzSjdxQWN4VjZXRFVxWm1DMWRwakRGcC9tcTdBZFU5bUZqb21Wd1JjcjBx?=
 =?utf-8?B?TUJsQWZNZkV4MlZLWExUc1R0SWFtVWhyeFNQclo5bE5OZVRVZ2ZJRDh6MXVn?=
 =?utf-8?B?Vk5PSklZRDNDNjc5R2lxS2hsY2w3R0hMTE9kQmZVZlMxK2NPVGJoanQzQzNF?=
 =?utf-8?B?M2ZKTE1BZ0d3eVNUazZZQTMzV25nQ2R1LzlocUhkeGtMY2JpQU4xZ0JFMzRD?=
 =?utf-8?B?SzBxVkxHYUtvQ1ltQzc0VFJ2aEttdDlmekxWWVR1TWd0M2dsY1Y3K1BKNmtY?=
 =?utf-8?B?S3R0eGphdFBPM1NmbGtmOVZtdi9hSVh6bHF4dmN4cEcyc28wT0NueHV6ckc4?=
 =?utf-8?B?UmhlREZIWHZ5RExmOUVJa0d6aFIxTHZSWEVuZThnVDl4ZWlqeFpGUHQ5V3lw?=
 =?utf-8?B?dENuek5aZWV4SW1HQmdtY2gvd2V3M2pCS0I2U1lGenJlVllHT1UxWTNkVkdh?=
 =?utf-8?B?Q1htcy9za2kxbEkvZTE4dzBPbUdDdzl3LzZ0Umd5YVdlOUovbTZWTmxISTdu?=
 =?utf-8?B?MUpxeSswRHhnSzFWSGYrZ3B4V0lLK1RBR0czYU1aTkQ5RkxLeDdTVDNFWWFH?=
 =?utf-8?B?a0t5eG1weDdFQUpxMCtPSFZXYkQzeHhrWTc0NU40ZStpRERsZjRnTFp2bHUr?=
 =?utf-8?B?VGN0OGszcXlYdS80V0RQWkY4YTcwSkJ2eEc1VzFuUkdDejNHRWx5bFgzWmh3?=
 =?utf-8?B?eUV2WWExenpvU2ZZczNrTDBZTml2U0xaemJCUmVHYjFvVjYvMDYwRWdLeE0v?=
 =?utf-8?B?QVV3QXVjZEYzVjRoLzBaY3d5bThIbU1vcC9qYmgrSjhFN1o2SXNXMVNqc3Ev?=
 =?utf-8?B?WGtFR1NubUhxTGpmTXRKZGExNlpPRUozREpmd3FHbXA5M0lvdzNXenAxdFR6?=
 =?utf-8?B?KzJWMGQxbHJGK1ZwWWg1RVJTTUdEaWVYNGZ1U3JQYWVyVDVvMnRneGVuNUlw?=
 =?utf-8?B?WkZvUHY5VUlMOEM5WDRsekRvM2NwdkRsd1JrbGxhK2VRRHdFZWdSQlBCMjh3?=
 =?utf-8?B?eWt2WFlIOEJVOEl4aG9USkhieWNEZzVXMms3Qnk1bklQeUZtUTVsQ01ocndy?=
 =?utf-8?B?UGRsM014Zk1xZnV4SmVlbHBIN25wWHRSVjJ6OGVERWpFTVk4ODZMYzBLY3ky?=
 =?utf-8?B?aFJyaVZFNVFycTh4WXJ0Z3BEU3VvRGxxYnVlQ0hxOVdEd0tVS3pFcVlOa0Jp?=
 =?utf-8?B?QlpxL1U3ellBSDdnUTlSeTNEUjZsekpNSGk1RUw2Zi9leDZxV1RRTHlOOW96?=
 =?utf-8?B?eExPcm9aVVhCNmxNaGp2VXFndS9aeEp5Y1RkK2hiMGdZd0Z2SXFKa3RyWm5J?=
 =?utf-8?B?WlFDdlhjcW40V1ZBdU5TUkd6elh0ZmZhUGV4SC9kMmxISWV2WlFpL21nVU5v?=
 =?utf-8?B?WHE4cGVrZHVkVUpTbHV1cGFtVmQzTmF3UUpmVnJPS0I4ME04OUtNU0l1Qm1h?=
 =?utf-8?Q?ivx0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUVQVkNiMnJhdTlWQWlBZTloQlZROUNuQWlHNnJIanFFb1dUcyt1S2NxNTkw?=
 =?utf-8?B?dFA5dEh5MW1MVmk1bFUzREx2TEREb2piNUFCaEpxeXlJa3UxeGhKQmN2ek1u?=
 =?utf-8?B?ay9xU1laMzZsYkpqWlJWWm55RklGdHRpb0xMZjBCMUVlRUhOakwvSURxNVFJ?=
 =?utf-8?B?VHFlTWtWRDNDNEhxQlF1Wll5TnJ1SmVWUEpiNWM4b0d4dnNZSzhCVHF5S1Jo?=
 =?utf-8?B?Q0ZqRG1zdERicjJ6K3JYaFViZ2YzdHlWNFEzWDFJTllCbWQ2K2FUYW1vVzJT?=
 =?utf-8?B?NndHUGkzVnhOVDlYYnBwSEtjcTN5OW55bkY1MnFEc1NUNXJJRlNzSEh6R0N2?=
 =?utf-8?B?NWlBQmY1WDVwT2xXcFRxWDluVzlPMGkzYTk2QkVnb0s2NVBQRFlLa1orbHEy?=
 =?utf-8?B?d3QvTGNDN0ZqOFYvWDRkK0haZWJ1N3NoaTIxZFIwTUxyWmlDbWtIQzBCL3pi?=
 =?utf-8?B?b1lNNHZIelo2SHNMQTQzWnFZNTJZRmJ6akU4c1lWYkw0bzE3UTFnZGVBdHg5?=
 =?utf-8?B?bWhoanZ3bWNZVUNUa0tYNWoxV1FIK2wrS1hRamI0Uis5OFg4OGYySkpWRzhE?=
 =?utf-8?B?SmtYU1RMTEFJbVhzYWlKYkdQbDJCQnpBOENuVmRxVW43YU1OQzJqWkM5RGdN?=
 =?utf-8?B?VURMWTdiaHNWSTNjOElMNktqWFU5RytpZmVMckxvMWNXT0tnMVFTaGNoL01P?=
 =?utf-8?B?ekN6R0FxL0FtZERHSW9rbERuaWRPSHh4WFExT0tNd3RyNTFNbDR4K2ptaTYr?=
 =?utf-8?B?RG1mVlRuRU9RUEpJQ0t4NG9NRUZNTzNGZjd5WEVSQUtaY1RtM1dkNElDS2RM?=
 =?utf-8?B?MHFCdGFzb3AvclFMcFRycmsrU1d3TGJoMzQ3QTFQS2JmQjRvS3hJbW16VHVx?=
 =?utf-8?B?QTBMdlRTVHdXejdoZ1RuNng5NFNFVVk1L2poZGdhbU5lNU1jc2VVZGZhK2xE?=
 =?utf-8?B?aGZUSmFackZBeVNWNHpRd0xzOHhRRStVZVE0VERaenM0N2FqeGJhYTgvR0lZ?=
 =?utf-8?B?aDRjOFhCbXJIVjdyaXdTdWxDV0JZd1VxNTIyZGg5UmI3dTJaTEY0ZEpUS1Ev?=
 =?utf-8?B?ekdEOEJPS1Z1N1E2MFVVNkVVM0hnbkR0MnVNV3BVU0VkdXZzWlhjdk5HMDhG?=
 =?utf-8?B?bVdOd05FK2ZRUEtleWVOQXBDdWd3ZXpneFdwc2RUU01Kc3c4cktCejZPbFpn?=
 =?utf-8?B?eTZmMUpmWEFlelhyT05VSU1za0dRMGNxbmovMjllUWJxQmZNRzYrdTZVaE5x?=
 =?utf-8?B?ZFVScFZ0Umt6V295a0lwVHk4ZjdDSVFYR2VlRnZMbElXQnY5WEhDT0Zndk13?=
 =?utf-8?B?djR0N1g3a1Y5cGpHOUl4TGhNM2N1L0FSRUZEM3BYb28rMEhGdXQ4dkFTVkdH?=
 =?utf-8?B?TTJHL0J4eVlVZDM4b29KY01zRkZ2QjdsQ3NOdkh4MmRMR21IYTQ1N3Fna3ZN?=
 =?utf-8?B?b1hHN0Jvdmc4RE1Nc25qQVRZMGNCMjVQV2lZcDNrZlBKU3RVWmRKc05SK2dX?=
 =?utf-8?B?dEk0ejhGaUpaNmdmRGc3ME5HVkhTZWRaWTUyREJyVFY0NUpROGtLbFZOUklC?=
 =?utf-8?B?NHQvNE8wSEdjeUtKZDZlRkJYc3FjZTVpd2pCY2Fsb3U4dm9OSDhzdHRoRWZI?=
 =?utf-8?B?bHhXRDBqWXEzTERXM0Uxb050TldkR2daTVVNTENyT2F3czNwYitoNW9JVFpR?=
 =?utf-8?B?Sm5CaFFTaVNTaUE1am9EU0cyM1ZyWlBDb3ppVGdJeTM2TkZRRkthSnk0VXgw?=
 =?utf-8?B?dEIwVjR3UmlDVExOeWVFUVplQ3dLVGMwZ2VYRjFCNEk2aEFIRzJBZWVjNnE3?=
 =?utf-8?B?MmlwdFprSXBNS0FZekFrUGNxb2ZRRG9vcTBSL2xPSEsydlRFVFFpYmFJRTky?=
 =?utf-8?B?bVZqeHNSVnFjMzkwdVFEMzJBWW4xdlY1Y1JTeldtZ2dBQ0lNYkJobTZyVEpU?=
 =?utf-8?B?SnorOEFnNXM3dlRKL2UyNElManFvRkJQVTh1eEZMdXVrc0xJY1pMNVNQVW0x?=
 =?utf-8?B?T25ZYnFxZmU2SU1Ib05yS1ZxSm5nbEZYQVNsSFN0VU8xL1RlTnR0N0R5ejFC?=
 =?utf-8?B?bkticnJPWHNYazBOaEVXSXdlOTdzc1JzSnkzdGVzOERwWEdXak45TWhLS0d4?=
 =?utf-8?B?MFZ3NjdDYWhTbUJUVkNLaW84MEVDUnZ1ZjhZcDNrVjB0ZUxRNStTblNnRnBq?=
 =?utf-8?B?alBXbHhKOW00YkgzVlo4V2FMbTFNanJjSjJkUGc2dVYwL1JMWG52QytmOFlD?=
 =?utf-8?B?ckpPdnhCUitqd1hLckxiaFh2anJOTmlEMVpiL3I0UHZtOXUxbExXUnBacVQ1?=
 =?utf-8?B?Z0pJcXhhM2RXR3RtNnpMZTJvVi8wblJ3aEJtVmpKdjhITWJmcnp5dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc942b22-9e86-4f94-2967-08de5dc70bce
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:11:01.2898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yteQ4dKiKbK4Vcd0ur81h1YQMCVpmiEDvWc4TBGJKAoyShJYgDXp99jGyWIQcZir0WruTKj2vePnV1RO2wGR6EFcoPF7lNANCAbcumA9NiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7776
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5A1519843A
X-Rspamd-Action: no action

On 27/01/2026 5:01 pm, Jan Beulich wrote:
> On 27.01.2026 11:18, Andrew Cooper wrote:
>> All of these are simple cases of using typeof() to avoid multiple parameter
>> evaluation.  Using auto avoids multiple textural expansion also.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

While I've got people's attentions, there's a secondary pattern we use
that's a bit less clear to convert.

    typeof(a) *_ptr_a = &a;

With auto, you're required to write this as:

    auto _ptr_a = &a;

rather than the more-nomal-looking:

    auto *_ptr_a = &a;


So far I've only found two examples, and I'm debating leaving them as
are seeing as auto (in this form) is still a new concept to most.

Thoughts?

~Andrew

