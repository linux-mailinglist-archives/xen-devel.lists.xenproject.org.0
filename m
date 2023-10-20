Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC357D1083
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 15:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619782.965424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpXu-0000nc-Du; Fri, 20 Oct 2023 13:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619782.965424; Fri, 20 Oct 2023 13:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpXu-0000lG-AO; Fri, 20 Oct 2023 13:28:10 +0000
Received: by outflank-mailman (input) for mailman id 619782;
 Fri, 20 Oct 2023 13:28:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lwx=GC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtpXs-0000kr-Og
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 13:28:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8167cd4b-6f4c-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 15:28:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Fri, 20 Oct
 2023 13:28:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 13:28:06 +0000
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
X-Inumbo-ID: 8167cd4b-6f4c-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UotGr4AxyMPup4fg96OiMG0TCatAxHYs7zsFFC5hHv1u74BSpCEralVK/iGkI+rutDTBvG67s+X0C3tw3rVnay6brln+0qdrZHk/jsHol/KOnE1WkQ4iapvqwXvqGwKZNdbQauh4CCKF2Uxc5MqiguFpLiMuOp4PEczbitSNFMueR3+2rSu0iNc4qcgVr977OhFwZGKLMAVuPbUWB6WmNPdpEHPGBUa0eE9b975bZGdlwBrTMCcrkf07XSON+87C6VON/63XAGBvImoIipIzee6Z89yB8HH30nEM2Ms4FFdPJPK5V0Zxfj6ZpjNsckG+ix9mlnw/lVX1jJ33QmPAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9ciP7iJDMYNK8OJneVvRtRoSN0Ii4ttLfdNpeGHzU4=;
 b=gyEzg0AEcCSo74jYinN9CDZ17FacHcPoHyggFZVr3hIl/J5FV4iqVYMlt8UuDYgRU64vSmWw4Q/ieuni48gkUvxB6E/OwwgcKjWe7fZI0V3P05SIMaU24Gvb9CA+2Xh6CiOKzP4y4+SSRMLC2quPD2NMH06Pj2s0Rs6alZzHhxdt7dlWbmip8baId8K2hrrZn3xT2euCGSmYVBJmN9F+YLaoDajnZ5xMKhNTsXSYMGiZTjaUpuZHC49M8R/kWqVRZO7A36ZwA8My5iVMqCenjIe2AW1RhgnHBATw+ZtNJJh2cF1a9aO5dt9DpsPggVx84csjJaV+/rJEJozu0Dc5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9ciP7iJDMYNK8OJneVvRtRoSN0Ii4ttLfdNpeGHzU4=;
 b=2TdNTD1o3EsfFD0BhZ+Rk9vzGt40hxq4qA6oIlEoOLBORCDhHcDsO7MdDU+tDrqX7g5aNSMMLXR1nfWkfbF0JzzH4U2IdAmF/9FOdQxmHtmE/F7pfgL2nMXWXp8Ag1UBVTuy2WmBX8r1cR73ILnNtubueY/nF6ZkzLl9sf3KO3SFcO2bCjB/hUHF0jAGDP4l0h50VHfqW5imSxjvDToyJbewimRux9l2MjNZNYYdzp7YQ3cePoozTMYOjhxz5EbuEFLsj2Ai7/fezaQhJD5FKef/Q9bOQNgI3rzlgVs2DyE42fU2E8sd3iuClzCuA6Td9MpCc/DrY39uDhwZrhJBQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0bc4115-ea8f-6afc-e469-12e2c3ae50b8@suse.com>
Date: Fri, 20 Oct 2023 15:28:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org, Luca.Fancellu@arm.com
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
 <93408661-721b-c4b3-d504-e65142bbdaea@suse.com>
 <42ee4de54f6d9bd80fb50db3545cbaf4@bugseng.com>
 <08286993-6a83-b928-6398-e129397927a0@suse.com>
 <9002a10f872fccc5217faab2f20ad5ba@bugseng.com>
 <alpine.DEB.2.22.394.2310191253440.2099202@ubuntu-linux-20-04-desktop>
 <9ab86d00-b539-25d1-4830-80932babcfbc@suse.com>
 <0b87c8229ad041d62360ac39d58ada00@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0b87c8229ad041d62360ac39d58ada00@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: b75fb32b-884b-4b2f-de75-08dbd17064b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H5a31mFCrC+QYLkwyOeOR9GIm8e06BxFJw1NLBXfKRPmWQ7ie74pGiV657a5mihHPFLAXkO8g0C+KuqTnE0SbdWK4fs7UtAEql1aEvIStns89usYcVblBi5x7XitPKDN//0MVZOJdYr0GX8Jsfxj8TNixI/SfY6vj0bZT+StbR1GWsikBcohXqYh37Jp2NPQPgVtF3uCAs/yRfBPUnarmozk7juc2RaXDdL0ErXywQVgmhJvY/i4CKftAJJf8DWkikn+gL7rRudF0YN48/qLzf+GltHD6kwEUeDswID/amNI9q9FYxumkXlE/MSjk0XQv0L5MomFwC3V0TLrYvmpmvyqN01S+3NeCk7Qt+O5CuvrywppGWW8W5twJ5QqyV1og1GT9jHQ93yK+o7meRaqcrqHTsEyFsF2YmVWC8WJEUDZu0Vlmar/eDO6EeJO4s/CxXc1VXVj/Wg4fYmDjRHBmaTM044qpCs6losUxMC/iUX2y8QNnVBHaCvG/eeZ+dtWA8VdhODgsBw+42nq7AId9o9xY/jnuGesr1PPeLs2P+x4k1LYip4JPlyhStPgV2f2F2+VU6teR0DskdNc+YEpdJlJIyMmWrYmni1OiqTHUhkjyIwAKgy4vU8B4vfXHUfn2wP1FpD60vk8oTVxZbhjgw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(39860400002)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(41300700001)(7416002)(5660300002)(4326008)(8676002)(8936002)(2906002)(31696002)(86362001)(36756003)(6486002)(478600001)(6512007)(31686004)(26005)(2616005)(53546011)(83380400001)(6506007)(66556008)(66476007)(66946007)(6666004)(38100700002)(316002)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SCtVcXhOc3hxOERaQmpuajZqT3FJUkt2YUNScHM5blFqQXROTzhScEJaZG96?=
 =?utf-8?B?MnNBQ0c4akEvb1NXY2NNR3NUbzBwVEhCdnl1WGtxNXJnUUdoTG9HMWdXS0lJ?=
 =?utf-8?B?VnJYNjd3T1QvK3A3K01sUE1aK3ByaVVCK3FnQXNUTmp6YVZ6c3FCRVBFQlhr?=
 =?utf-8?B?Q1BVSEJrYzdBdS8za1pVajgybFRJUGJOWW9mWlEyM01iMmJReTN4NTRIcTdv?=
 =?utf-8?B?N2o5azZTQkRNbUZTUjNrZTM4bkNVMmkxY09xNWRia3A1c2poSUE5dUVmaytP?=
 =?utf-8?B?RGRKVWJQUzMzcGdodE5MV2hhT3IxWVJzQ2wvZlY0S0tGYzhaOEkwZkFDY1Ax?=
 =?utf-8?B?NFJwLzdOMlBFQmpOZHNtY2hHdDQrNE1FTjlZa2ljdkJlTnltbXlONlVyeEVX?=
 =?utf-8?B?RHJPVUR1U0tncXlTb09IWHFvRys2bTk3ZzZmNlVYV21seXRZV0pCYm1YQkcw?=
 =?utf-8?B?NHk2eHhaM0xpM1hqdGFVWDRTQ2pUb09TVWlFcU8zWUtUSmdKRnM4dUNxdUxU?=
 =?utf-8?B?VUZ1bVdnUm1ZNnN2Z2JmenJtMisvVjBqOUdoRWRZeU5XbEEzRk85cFVkdU01?=
 =?utf-8?B?ZHdKcDRuNTJZSlpPV2FrYWNOdk9Zb3ZBNkV2M2IxY1BoeDNFYy83c2hpbzhH?=
 =?utf-8?B?NlN5dnZrUCs2UjN4WjA4T3NJa2dLVlBCNUIxNHdNWG1oeVVMQ2EvNnNPckF6?=
 =?utf-8?B?TVNyZnhpVEQzYWR6VU9tRmtqcExIbXZkTllSQnlTNVBWeEM3ZTZnRWFLWk1q?=
 =?utf-8?B?czdranMvYW1NME1WWTV6eVJRYzZkNXFWYmNjaTB0a05LbmIwTVZSaEc5azZ5?=
 =?utf-8?B?cHZHeFJrUUdTb3dXSzBjNE5rbHlna0dKN2hsNjQ2b0FjSmZsMTc4RDJudFRk?=
 =?utf-8?B?V2FpMnRkbE93Rks2MEtUUnFuTGY1aVREVHdXekZZeWJGTjVEZXk1NDVxZFR0?=
 =?utf-8?B?WERuNW9uUFNZUlBOT1FHZWRwdEQ3Q29ob1lUUVNlTEdNSkZKajBoMFR1UGRP?=
 =?utf-8?B?UzZOSHJLTzFDcmR3V0hScDhQOWV1b1JBM2F0dTlqUzRyQ2l4RHUycjQ2RGxI?=
 =?utf-8?B?LzZXTGNwc0doQzJMcGVXTGgycmR3MWxReDlMYzVKSDVDeXpWUG5TbitQYUtk?=
 =?utf-8?B?eWdTSHA3aXh2OUh3MlpoUnhMSXFSTEp6UXJnL3BGNGlna1Y1Nzhyb21RTWpr?=
 =?utf-8?B?Q1NhaDViZ2dHRFNUNGlLaTJZbUllNDFiMnQzdmIwSDBzSmpYWXR2aytlT3N6?=
 =?utf-8?B?cHNxZ2dGOVBMV1dPREw0MjFkNEs2bWFJWjNuTjdjNWxJd3pPaUNiVk5lS2NM?=
 =?utf-8?B?djVPcnAwZEp3clptS1RBMm9yOTVDOStqK3dZN3ZzeWVhL1FsL1VJNEEzVFpH?=
 =?utf-8?B?ZDhOTzJQY084aWVrUTlWTFZ3cExVZEpYOTVVbHJlTFZuN1I3UnRyMlNNT2tX?=
 =?utf-8?B?bklBUjgwbDNwaEJCZHljaklSeHN4ZWtGSFAzUUhNSXdzL3QybW5CVzNMMWRn?=
 =?utf-8?B?ZUdCOUh4alBYSFk4UnhncGZaN3dvMzBWZjViL2Z1d0k0Yy8zUjhYNUhRN0Ix?=
 =?utf-8?B?dE5QZytEN0p3OVFwM2ZQdUlVa21aWnEvQ21QZElMR01rc2VLSWNJNEdxUU1R?=
 =?utf-8?B?SHhqRXFaQ3VVQXBGU2p0Zm9qNlhoRklmT01TVkRQTnRkR2V4eklUK0dwUFpK?=
 =?utf-8?B?WnN6TjRXcnBaWjE4Q2U5cENEaGdXOFdNU2sxVW4yc1grbGNxMHBudFhtQXBz?=
 =?utf-8?B?ZG1UVDZUYllYSE9OeGQraHlIUkdWRGlqWDIydnEzY1c4dEFVcE1xMFhUSjhq?=
 =?utf-8?B?REtOanRKM2N4R2R6dEE5M0loUXZzTVJWOHJFak1VRytUbGo3TlQ1TzAzRE5m?=
 =?utf-8?B?QU1EVklRdlVDZTB4K2NYRm92ZnJNTzdEc0VRdTMrN2FTclM5TURzOWt1eUlt?=
 =?utf-8?B?U3hCWWpiK3VEaVFDUGZmZ3Z1aWN4dGI5S1A3clZkaG80NnYrd29YOGJaMTNK?=
 =?utf-8?B?S3ZDMlhUanpmeHh0YkNtdmFkakZ4VWFSTFRCdmV5OFFiWU5wcnE0Q1oxNkgy?=
 =?utf-8?B?YU1ZVHNwL0RZcUM2U1dwc1RPUnBpWUYwQXNZNGhkakhSL1dmbXNCeUJhRVFs?=
 =?utf-8?Q?rRGP71R0B8l4epzteKzGO1TMt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b75fb32b-884b-4b2f-de75-08dbd17064b2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:28:06.0353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTOOql8psImwXGTEZV0zkBKynj2S4WCzUtT8PRqH0yVaTWX0TanLJ12zV8B95DIkEnenhhZKLU+VNty5DzFAHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9080

On 20.10.2023 12:40, Nicola Vetrini wrote:
> On 20/10/2023 08:00, Jan Beulich wrote:
>> On 19.10.2023 21:58, Stefano Stabellini wrote:
>>>>>>>> --- a/xen/include/xen/macros.h
>>>>>>>> +++ b/xen/include/xen/macros.h
>>>>>>>> @@ -8,8 +8,10 @@
>>>>>>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>>>>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>>>>>>
>>>>>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>>>>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>>>>>>
>>>>>>> a SAF-<n>-safe comment here?
>>>>>>>
>>>>>>
>>>>>> One reason is that now that violations only belonging to tool
>>>>>> configurations
>>>>>> and similar are documented in docs/misra/deviations.rst (committed 
>>>>>> in
>>>>>> Stefano's
>>>>>> branch for-4.19 [1]).
>>>>>
>>>>> But tool configuration means every analysis tool needs configuring
>>>>> separately. That's why the comment tagging scheme was decided to be
>>>>> preferred, iirc.
>>>>>
>>>>>> Also, there were disagreements on the SAF naming
>>>>>> scheme, and
>>>>>> patches like those would not be accepted at the moment.
>>>>>
>>>>> Well, that needs resolving. The naming there shouldn't lead to 
>>>>> patches
>>>>> being accepted that later may need redoing.
>>>>>
>>>>> Jan
>>>>
>>>> While this is true, in this case I'm not willing to deviate with a 
>>>> SAF, given
>>>> that
>>>> some ECLAIR-specific configuration would be needed anyways, given 
>>>> that I'm
>>>> deviating a macro definition, rather than the line where it's 
>>>> actually used
>>>> (and maybe other tools would need
>>>> that as well).
>>>
>>> Did I get it right that the problem with using SAF in this case is 
>>> that
>>> it wouldn't be sufficient to add a SAF comment on top of the MACRO
>>> definition, but we would need a SAF comment on top of every MACRO
>>> invocation?
>>>
>>> If so, then not just for this MACRO but in general basically we have 
>>> to
>>> use deviations.rst.
>>
>> That would be pretty sad.
> 
> Local deviation comments are for local deviations; deviating patterns is 
> a tool configuration.

That's orthogonal. A deviating comment on a macro definition, when it is
about an aspect that's meaningful only after the macro is expanded (i.e.
not violating some rule concerning macro definitions only), would be
quite helpful to limit the number of such comments that need sprinkling
across the code base.

Jan

