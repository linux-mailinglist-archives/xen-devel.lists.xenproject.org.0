Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D9731529
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 12:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549519.858095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9kAg-0000Sk-9o; Thu, 15 Jun 2023 10:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549519.858095; Thu, 15 Jun 2023 10:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9kAg-0000QC-71; Thu, 15 Jun 2023 10:25:42 +0000
Received: by outflank-mailman (input) for mailman id 549519;
 Thu, 15 Jun 2023 10:25:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+p7=CD=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1q9kAe-0000Q6-Pw
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 10:25:40 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f821e251-0b66-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 12:25:39 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4579.namprd12.prod.outlook.com (2603:10b6:5:2ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 10:25:34 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6477.028; Thu, 15 Jun 2023
 10:25:34 +0000
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
X-Inumbo-ID: f821e251-0b66-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+srvkMUAi6To3AveVf6kGt74nv2EIago9OcpwMHWnHTBP6njsu1vZfhZ+Rk5PW5dHRIr1GbMZ3i9Fmmvu4KpsIG4UR9XUtFofzTISQlwnZzORaCH7stTgHwrBxNCMu7sd4v+lr9qOsjSk5WmXramkrHLRGW7EOZ9aCPLRhqC/3n6XN0+xFCh1hJXIuWzxd9OODsl0qhfhlAO5ZGy8C4dvLhgLDL4qtEA/E+NUeO5bo3di95VpY/PzLEc8ECf+kAr2O52hq4YtOSFN2UFJGk5HlZgkasrrE+jnhEUxjMnoVcTjuEnTdFBaf51jUWFckIM3x1eotAxJJUwVBQfGwh2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZ3kod+gYclj2c63iWXLJqlG07+b/S5pELG7wjaa8RE=;
 b=kQD5c3b7qusWN/BapM4DjRHmjspZM1DPn8X9JWf5/vyXKeDMwEV8cVjXTff3RUnYzTInM5Fs87gY1POiM1YjrNqaOfbBH+OuThDh96CXFGDoHvFE84VuzEynU2O+54MxpOw4AkM2Wq2EkE56HaXZfz9ylXg+ig7pWGySVffO7QvEG10VO5vnu20wJzpzM1w8TPRKx2fz7bOso2C9XvM2kkyb8ryt1PsXz38HfaS8cMlKKKLUOoMldIqPYTsFrHTSkqn7f29nOdYNRVmFBCcbtD8Ty6loBl8ATiWuiO8/NxuCgU4rVH2YJAkQ51av7FUcLJhPXCdLwkUuuyzm9zh/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZ3kod+gYclj2c63iWXLJqlG07+b/S5pELG7wjaa8RE=;
 b=O2CVhEQdjyMrvF1uHdPpwS2/IpBl5fbckDb4Of6xqHcjAemgqWfNtuq4Yytxt4IR2TVsR0jOHdMpptWN43DCREBEs783hLLFGAp5gC9kQl1poRT/FzkyzEfjNK+xbTEVVWH6iNeL9UvxzAMzmNd4tM+2ne0zhgZ46jWrzh//Q/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7b52a2bb-b34c-f659-52b2-53b730351de4@amd.com>
Date: Thu, 15 Jun 2023 11:25:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [XEN v8 1/5] xen/arm: p2m: Use the pa_range_info table to support
 ARM_32 and ARM_64
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
 <20230602120754.23817-2-ayan.kumar.halder@amd.com>
 <c48d763b-4b58-69f1-4cce-2f9855aa8ee0@amd.com>
 <35d0fd4a-4afe-6203-183b-d0a1f2f5d5ba@amd.com>
 <bd8911e1-a896-120b-e2f1-add33524bc1f@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <bd8911e1-a896-120b-e2f1-add33524bc1f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::22) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4579:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb629b2-3db8-45cf-62c6-08db6d8ada68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1h5E1F3aP+AZF2qHIwmQ9cCApV07VtwNl1oxp70o137izcYGtBwJNQVSWpjSZe2FmbWXoshCvGxfzPN3bfX2U93QInwsfHUAogOAjkLKAWZeIS2e4sXUkIPCrnQ1YVF/tpnLFyLb/Bcrdl64Z47EavfYvMmoQkEhYre3ikFQ/9Bxou7UoahockAsdFvrG7PfKTfmbt4lN0SOspgui1xyxRWaw6dDawmc4qPNeOlcyYUV7wqlH5Z+cyTQhKZSjij4HggboOfMEejCaYe56NuFh6PW+ZXRqkTSeN5PsGpzsNiaQkvFrXWdHPogSYtA2jV2ztNbe+L+SgIBDEnXdxVwlCq3Qkn3dJjoMtYLbhaDscDKh8mUlt1GnVlhXNoGyj2LygeO1UJ9ukOM92bZWYzV3o9SFxvFV1SmLojYgN5Poxl8DuJHfioaSVbvA8DOToSQI3tHU5x8gMISBOABkU2sZiFKg8fWbo2ptxp+9/y9auDPS5RV/D0W+djuPV7EPMiE0QmAZ2t8YmgMK7K103GvB2pDi5qMXHzGG++6M10anNlQ9QPWFS2jJ/Y0z6iZBArvprZUzg+a7aKc2xKy7c1TM2g5U9Ss+gks2mm04Y+EwdSqq/I+gkYeevZ4V8j+8WgFQkqEQdFO461QDoWyydvGWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(2906002)(26005)(6512007)(186003)(83380400001)(2616005)(66946007)(66476007)(66556008)(31686004)(4326008)(41300700001)(8936002)(8676002)(6486002)(316002)(6666004)(110136005)(31696002)(36756003)(38100700002)(478600001)(7416002)(53546011)(6506007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlE5MUo2U0FFeC9USVpQRUdMejZrWkxyTzhSeXVRYWJMNGJodUE4STJ1ckgz?=
 =?utf-8?B?cjQ4c2dleHVSbXd0QndmckpXU04wbjIvbFhXMisvUDBTelpKMVN5a3ZKS2Vy?=
 =?utf-8?B?bW9iblVRc0l0Q3F6WWJBUmQ1dlByM1cvbldtRC8zaU5YajZyTTdBQWNPZGNH?=
 =?utf-8?B?Yi8vUm0vUTErUWE1dWRyZnpCZnlBc2tKL0V0d2JyT1IzaG5OblBIQUdvanJ3?=
 =?utf-8?B?aXFLRExZWXB2RWJMdmdUblNQeXZ5cnBaTDJSL04zekV2akVxakdBUkNiYkZH?=
 =?utf-8?B?NzdORkNyK0hxWVRoV0NjWDR4NjhnV2w4T01qUWxzY1VoZTM5djVqSVQzdVhE?=
 =?utf-8?B?T1pPSGlyTFBZRFlWU01CaWVpQWJXMUpMM2x5QjYweWNtM1dOQ2RhY2RRc3Rp?=
 =?utf-8?B?cGwzNTNGSzVYU0huandmc0hnUWEzaS8vakcvMnhWV1RYazJmTjVCQ2o1dlBS?=
 =?utf-8?B?NmVKUlIwaWRFamNQYmwycmpaR2VyczUrRm5NemxGQWVRZ3QvTU95b1h3ZmRi?=
 =?utf-8?B?ZVpCY1BDQWZVUjlhSWdUWUdRQnVWV2Y5anlRTXRoVDRWWVZrTXJZbHpnaGw1?=
 =?utf-8?B?dW9MUWJybHdQUm5VTzdwWnZxQ1VSZUgreTcwbE93Qm9KZUpveG41anFLV29x?=
 =?utf-8?B?eDhnbndqWWlQWkhhMlNtcExlSmZndFZ0cVhJTElMQVE2RSs1SW02SmhIMFFt?=
 =?utf-8?B?NE9FMDFUYU0zWHc5eGRVbkk1cXBCMjdEbWtZRTYvMVlPanhSYmFTbHR5TDN1?=
 =?utf-8?B?VjE2WTZjL09FWEZNSzZoVkxTa1NCS3NwY25xVVVVVEo5SWJDSS9TanVFVEh2?=
 =?utf-8?B?RnIreHlJOFgrR2JiODJKc2E4V3ozbG1xdVdrcThkTDJiZHV3eEN3MXByU2JC?=
 =?utf-8?B?MXFOd0hlcnAwRUp3bG5DdTM4QUxkUFhaMWcvQlZmR0tobjhPQU9hUjZWYXBl?=
 =?utf-8?B?QUVOUCtJdFdWQ0pkMlVPQ1lDdUtpelN4UUtFNUxGT1JxcjVrdlRreEVWemgw?=
 =?utf-8?B?V0diaFZsR05SMHRDV2UrZWxDMGRmZklTZnlaQnBaT2JsNStXcFYzWCs0aEg0?=
 =?utf-8?B?ak50dnpiWnZiR1ZMeHJJU09XNHlIalBmVlQrcGs3cTI2cm5DVXppUTk4QU1y?=
 =?utf-8?B?R3luZ3BGc1VYaDYzK1l6WGhncEo0TGs1VlJvUnlyVWlZeVNKU1pSWGZWT2Q5?=
 =?utf-8?B?L2NqY0hKVWR2V0JrejU3VG5IL1NJcjI3TE5PcnVpZDhETnNvNTBHeDN6S0xm?=
 =?utf-8?B?UTRPdlFRa3VvaFFmYThaemZJeGVDQ3VEUTZhSndQRUhrZ2JkN2dVUXFCUlNl?=
 =?utf-8?B?dmQ3MkNacG9xa1VJL2EwVXpLNUQwcjBVOFkwZ2M2cXFFb1RZRnBrSVNMRXFo?=
 =?utf-8?B?ZjBEcXZsZGFCN1BydG41MmpvWGRDSzBsR0dobkNzRytTN1AvcW01SHNWQ3VU?=
 =?utf-8?B?LzR6SlhUU3hRUmxUWUhsWXNqb2lJTGVsVytOaTVxNlJJZmI0RDF0VWxiTDAw?=
 =?utf-8?B?MHNpTmdBM0pmb2FGSHFMNTBkZGxYWGEwVzF2Mzd5Q2lKcm5WSXVyd29pUDlo?=
 =?utf-8?B?SWhvWW5IY0RoVTBXaHFYV2JQSi9pbUJyVUlXS0J3dnEzaWxBUXBNSEVKcnZB?=
 =?utf-8?B?cldQRHQvdlNzYU9pTmVFOWRzN09ndDFnd3djaG5nc1A1OXRaNE1MaUlveU5l?=
 =?utf-8?B?UXFmdFVzblV2MU4wMUpWa2NZcXFacENaTDhoVUJoalNDeExRYXV2aEkrRlFU?=
 =?utf-8?B?V2kyNEloeWJ4LzFwRWZTUWFWNWNDYkNKdk8wN25LL2R6WVQ3QWN0azNKVkJh?=
 =?utf-8?B?Z3JGcEdoL2V6K253MFNEdGl0M2w5eHcrSEFqdU9Ia29pTFhhbVBGMHh0SUdm?=
 =?utf-8?B?ZSt6OTFsaXVKSkRwczIyUEZMUERhWHoyUyt3STM2OGtPVDh0bmpuZi9OZ1o4?=
 =?utf-8?B?bmpFZ0xxRmNjTkcyaldML0gvcmZKS0QrT3d5S3hUc1pmQnR4OGpOTG9SOFpY?=
 =?utf-8?B?S29sMjl0YjdsdDJMMVN6anlwQ3ZCT0FtQmRpOTNtWmpOT2t3TGdENjdVWDZ1?=
 =?utf-8?B?ZGNhS3E4YWJ1OGlDSjFkWHZZNDFWZ2VENkFDSXpkUURyVlc0Sjl3NHFCbHBh?=
 =?utf-8?Q?5aUyCPSEyYBqEtvRdw3YU8WtQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb629b2-3db8-45cf-62c6-08db6d8ada68
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 10:25:34.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1B0Ga+soP7MNYgBKR9mUkh9vfvAnymwgPOIKJNFWjQS5d48xHMtxTMUOX30/CWxI9G34wA1m6G9TDjxUYRsXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4579


On 15/06/2023 10:40, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 15/06/2023 10:29, Ayan Kumar Halder wrote:
>>
>> On 15/06/2023 09:05, Michal Orzel wrote:
>>> Hi Ayan,
>> Hi Michal,
>>>
>>> On 02/06/2023 14:07, Ayan Kumar Halder wrote:
>>>>
>>>> Restructure the code so that one can use pa_range_info[] table for 
>>>> both
>>>> ARM_32 as well as ARM_64.
>>> I grepped for ARM_{32,64} in our code base and could not find any 
>>> use in source files except for things
>>> introduced by this commit. While I'm ok with it in a commit message 
>>> I think for consistency we should be
>>> using arm32/arm64 in the code.
>>
>> AFAIU, arm32/arm64 refers to the Architecture. ARM_32/ARM_64 refers 
>> to the configuration.
>>
>> If you see the original code (xen/arch/arm/include/asm/p2m.h, 
>> xen/arch/arm/p2m.c)
>>
>> ARM_32/ARM_64 has been used.
>>
>> Thus, I used ARM_32/ARM_64 in this commit. Let me know if it makes 
>> sense.
>> The rest of your comments look sane to me.
> In text, we commonly don't use the name of the config. Instead we use 
> the name of the architecture (i.e. arm32/arm64) because this is a 
> strict correspondence.
>
> I agree with Michal, about using arm32/arm64 rather than ARM_32/ARM_64 
> in the comments at least to stay consistent with the rest of the code.
I see what you mean.
>
> Assuming there is no other changes required in this patch (I haven't 
> looked at it yet), then I am happy to handle this request on commit if 
> you are OK with it.

I see that the rest of the comments from Michal are related to style (ie 
no functional changes). Thus, I am happy for you to fix them on commit.

- Ayan

>
> Cheers,
>

