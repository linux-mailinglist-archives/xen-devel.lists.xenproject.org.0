Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E786CB33C9
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 16:01:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183006.1505798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTLgu-0007Al-AO; Wed, 10 Dec 2025 15:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183006.1505798; Wed, 10 Dec 2025 15:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTLgu-00077x-7a; Wed, 10 Dec 2025 15:01:20 +0000
Received: by outflank-mailman (input) for mailman id 1183006;
 Wed, 10 Dec 2025 15:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11gW=6Q=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vTLgs-00077r-RR
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 15:01:18 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 112e07e6-d5d9-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 16:01:13 +0100 (CET)
Received: from BL1PR13CA0132.namprd13.prod.outlook.com (2603:10b6:208:2bb::17)
 by LV3PR12MB9402.namprd12.prod.outlook.com (2603:10b6:408:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:01:09 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::cc) by BL1PR13CA0132.outlook.office365.com
 (2603:10b6:208:2bb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Wed,
 10 Dec 2025 15:00:55 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 15:01:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 09:01:09 -0600
Received: from [172.17.249.106] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 07:01:06 -0800
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
X-Inumbo-ID: 112e07e6-d5d9-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNcm3scEVGQcpEMuXKvxhVwFOz2MefadcV/LSZTNJJGQm4XXfWahzJaiHOczNyHk0xCV44ymDr7qiF1XqYdCY65mNOevjNCQcSmcGSQfKeszm5OrKzDdn8YBaUc7hH+KH0DYdH0G53SqMWfcXSpLk/kS2Jkri5sLjRRUBTWp6/Ldh9CttwWfEsf6LtnOFJTPfsl12rJqq0yBn1rPDzZFA0xbz+hiWabeItgrYLS/lGGfIb30jGZ2tDrzAbkOc20lyHd5xI4IAjh1viOWbFHiU/mPCNPkwzkZPblgGY4w0DiMy6WN8guDHeETalVlmEJV8jKEEgt/L3EJp5PURLTZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HdBSoDWVoCeGNZL9em0WXTbkxGGql0y7gGYJFwfo+s=;
 b=FUKBE2icICzbURkEDuHauFi+EoOVUmHVrDucMniVVHlTT6MzmGXGTgiCN3b6OHdmSeIceuf7saRCE+gh4YOuu5G31Gjsl3YiltPvMauSal8nmNw2RTP0usY1oZ143E1krh/6EIVXPSwiSHScKnh6hN3Eq+Be8B7zRljXGSPOnJcE9h/8d9ApLXYWd90tbLT9gpzeTMJHC0WgwFcpjs8YqyzjYulBInLYmPzuEiW7lkb87RL25HZRvuTYKivhHR3jNS8xXDyDR5hJsON8KFwLvVfGQewWwS4NeF/VteikqkBlXBe7TfF1HnnmF0/pt5z+I03pV0fhoGXqVOtXHn7ZKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HdBSoDWVoCeGNZL9em0WXTbkxGGql0y7gGYJFwfo+s=;
 b=WrvXqgsRf84V3LrJJIGKQYk3spn6C4nqihfgxHNVjIrZAuQHCOjHvdZtHvCm9kUGv0FgKtXlmhblEmAR5/FxTzOwny2xl2amAgPvfvQsfjx4zv/PXupeC8vCdANqsA9b0FmTpSN8AO9xkGHjeeif6Kd1+xJ86eH4aXYHdpAD3Hs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <6f375bb4-19bf-4a86-bbb1-9b26676a7a65@amd.com>
Date: Wed, 10 Dec 2025 10:01:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Grygorii Strashko" <grygorii_strashko@epam.com>,
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251205222813.277164-1-jason.andryuk@amd.com>
 <8dce8443-5a97-42c4-b867-27b83415b3d1@citrix.com>
 <32f54604-706b-4377-b59a-b287ef1afb3a@suse.com>
 <049bb40b-13f6-4b5c-9105-aeac03680f86@amd.com>
 <2bf5c46b-0b95-46ef-9c25-849fcba0f170@suse.com>
Content-Language: en-US
In-Reply-To: <2bf5c46b-0b95-46ef-9c25-849fcba0f170@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|LV3PR12MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: ec770e28-751a-4a5e-deeb-08de37fcf3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGl0eU8wYzVNVmFRWVBTL0tLcnQrSXBFdUVuQk96a0VHc3hhQTE2YVM5UkJ3?=
 =?utf-8?B?S2ZrZXNZMFhxRFBFTVhDWXpjNE4vV1lrT24zVmg4TUx3V2hTbnV6QXBwZnZE?=
 =?utf-8?B?bmY0cjFMUklEN1dLTFdwcWJCWWRhdUoyd0FCNTRmS1U3N3ZUQThPM2Q4b1Ax?=
 =?utf-8?B?d0dQSlVjcnMvVWsxd3Y0aWRYSUc0TTlVNzdUUEFqd2lEV0hKSnptSTFGVDNl?=
 =?utf-8?B?ZUxsYjUxemdzRVVObFk1UHl6dmFhdkZLQ05BMUloVUtaTUN4Zm52VWpKZkhH?=
 =?utf-8?B?M1RnNytsZGxMOGlJUWRDdzVuZWdVZnAzdHVwR3JRVWlUMlRrRlZEaTdzczVP?=
 =?utf-8?B?cnd1U0xuaDhqcnQwYkE0dW1LbEtEdXRMRjVQU2p6NURVRUkzS2NGcXZoSkJT?=
 =?utf-8?B?cGwwZ0JCdXF2SUg4VkExM2piWmNmRWhVaTA1QnppcW1YNmdHK1M4Z3E2ajJV?=
 =?utf-8?B?RUFaZi9BUVV6UXBlSVJCbGdydXFCRmVWZ3lTV0FKTEF3dktmTG1ueEY2Tm5i?=
 =?utf-8?B?blhxMWdtM0tWWHZIdzRncjQrRXdmRGZ5b0svdW9GRzNFdnZwRDN1b05jSkJS?=
 =?utf-8?B?Qy9INHBmclhpMzVZWmlsaXQ2MXZIRVBVVG1WWldwcENCZ3dPOUprYlgyOERX?=
 =?utf-8?B?TTNJbUhXQzh5VWg0bzgzRVZYZWFJMng0STJwc3piSmZnKzNvMDYxUWpaR0kw?=
 =?utf-8?B?Z3B4SU5CSUpWUll0TVdqd0tvbWlrNUZnVHJBVkc4cUJHeUFmdUhlNE9yeG43?=
 =?utf-8?B?cG1RdXFMb0RDUmcwb1luSm9ySFF6TEh5dmJXcXNRbzhLSzVNRzNFRWxtbmdU?=
 =?utf-8?B?cWRiOG05cklJU3NqU3UvdDFmY0IvUUdMYWE2dXluUEYyc2Y4VUJhZGpjVkF6?=
 =?utf-8?B?Q0xIWWxHdzJTb3l0c1hMU3JraWsyTG1vMDViQ1g0cXNoN3Q3Z2tZbHBNUnNq?=
 =?utf-8?B?UjVCaXhLaE9MK3gvSXdwb3VVV0szWFZ1RkNHRVF0T0pCSmJjaVAzN1VuOTBZ?=
 =?utf-8?B?NVpHVlZtRzRrcFRJRFQ2ZFh1Y0VLZFM4dGdQQWN2RUhmUWtXbHJqTllKbDdx?=
 =?utf-8?B?aXNxZFFWcHNFQ0hlK1JLb3dIc1pNVWs4R1VOcExPNytCNFdDeG90N25idTY2?=
 =?utf-8?B?OVVkL0QyNHFIaFcxaW9MR2JxVW55L3BVZGFNcGVKZldEVFJPa2MyWlJrY01o?=
 =?utf-8?B?Unh0dExmVnRRbktLdFQrVFVSSEcyWFRmSFZSbEtLN3dtMWdSZ2tYYk11RjFa?=
 =?utf-8?B?c0N3Z0g5NDAwUWVPR3YrMzVLbCtOQlVLMDRwb0JlMktEaU9odXg4Mi9LbG5q?=
 =?utf-8?B?dkNTdjNZQTZUU3NKZ0NjcHNxdFdyRjRjaXAyRExyeHlFdTl5RkhYdnR0dXJj?=
 =?utf-8?B?U0RqQVczNW9iWlRzcFVQbEF6ZnU4cVppeWxTaElZNGpRdFEwRmNNdzduMFVh?=
 =?utf-8?B?WmxZOXN4NUxEc2tTSmFhWFM4QlNBZkpNRFVzQXVCbmlLRi91bjUraG04anFw?=
 =?utf-8?B?aWZJMUplMkZTbC9vRndtN1RJQXVVK3NFUUh6UDE1T2hOaHlqZEFvMVhyN3Rq?=
 =?utf-8?B?L3l2UFRlakFURTV1bVFUVFk4cWR3WEJxZllOa3hoclYvQVBaV2tUaGozMmR5?=
 =?utf-8?B?bm9zNFprK0RVaEdCYXJ1T0FiMjFXejdJblBONndzRmZXOWN2TEd5dXdtUjRX?=
 =?utf-8?B?SFg5VDdpMStsenlmNlpXcWEzMGJNbVRsMytqRWN0NWVhZE1nN29LWmNwQWhK?=
 =?utf-8?B?aUZzNTRwY3BEeGNsNDFZZGFIU2JCRHhJKzBaTTRZbkV3dEtYUzh1d01jY1JV?=
 =?utf-8?B?UlV2dm1Bd2xuUVEwSkdCWVhhbTNoa2VxNDlZUS8yOVZHVVR4R2VJMWtTYjNF?=
 =?utf-8?B?OTlQOEFjaUxEWE82Qm9MUW5wMDdoZEVTdm9ZQ0pKalNVL0dCME5vTy9XSEh3?=
 =?utf-8?B?elJjenpDQjBmMnhkWWpXV0RmM21vcEdmeGMrRUJQQ3p5T2lTZmJQT1BPYWov?=
 =?utf-8?B?eG1Ya0Rlc201ZEFEWkdmNmVNby9DZzlpUWQvY0wwQndabWJpSGZGVmNBMXJ5?=
 =?utf-8?B?WXZGc1BtbEowdDdoOGhkaTFLZzh3T1NLR3RDVGd6K25KYXZTYzhjVHFEalM3?=
 =?utf-8?Q?ljAM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:01:09.5898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec770e28-751a-4a5e-deeb-08de37fcf3e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9402

On 2025-12-10 02:09, Jan Beulich wrote:
> On 09.12.2025 22:55, Jason Andryuk wrote:
>> On 2025-12-08 03:46, Jan Beulich wrote:
>>> On 05.12.2025 23:40, Andrew Cooper wrote:
>>>> On 05/12/2025 10:28 pm, Jason Andryuk wrote:
>>>>> When linking to create xen-syms, add --gc-sections to garbage collect
>>>>> unused stuff.  Relies on CONFIG_CC_SPLIT_SECTIONS
>>>>>
>>>>> We need to add KEEP() to the linker script in assorted places to retain
>>>>> appropriate data - especially the arrays created therein.
>>>>>
>>>>> Something is off though.  In a test where memory_add() is unreachable,
>>>>> it is still included.  I'm not sure, but I am wondering if it's the
>>>>> alternatives somehow keeping a reference to it.
>>>>
>>>> Yes, .altinstructions contains relocations against the origin patch
>>>> site, which will cause it to appear to be referenced. The same will be
>>>> happening with a bunch of other sections.
>>>
>>> We will need to derive helper section names from base section ones. See
>>> e.g. HAVE_AS_SECTNAME_SUBST as introduced by "common: honor
>>> CONFIG_CC_SPLIT_SECTIONS also for assembly functions", controlling the
>>> use of the --sectname-subst asssembler option, to in turn be able to use
>>> %S in section names (available from gas 2.26 onwards).
>>
>> I tried to add your patch and change ALTERNATIVE to:
>> ".pushsection .altinstructions.%S, \"a\", @progbits\n"
>> but it fails to build.  One example:
>> ./include/xen/compiler.h:62:21: error: invalid 'asm': operand number
>> missing after %-letter
>>      62 | # define asm_inline asm __inline
>>         |                     ^~~
>> ./arch/x86/include/asm/pdx.h:13:5: note: in expansion of macro ‘asm_inline’
>>      13 |     asm_inline goto (                               \
>>         |     ^~~~~~~~~~
>> ./arch/x86/include/asm/pdx.h:22:5: note: in expansion of macro
>> ‘PDX_ASM_GOTO’
>>      22 |     PDX_ASM_GOTO(skip);
>>         |     ^~~~~~~~~~~~
>>
>> ".pushsection .altinstructions.%%S, \"a\", @progbits\n" ends up creating
>> section ".altinstructions.%S" which doesn't helpful.
>>
>> Is %S expected to work with inline asm, or only standalone?
> 
> Both, as long as --sectname-subst is passed to the assembler. My patch adds
> that option to AFLAGS only, whereas for inline assembly it would need adding
> to CFLAGS. Did you perhaps overlook that?

Yes, you are correct - I had not changed CFLAGS.  With that updated, the 
%%S form creates sections:
.altinstructions..text.set_domain_state_info

Thanks,
Jason

