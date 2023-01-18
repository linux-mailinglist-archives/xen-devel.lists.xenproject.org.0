Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC9671CDE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 14:03:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480579.745061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI862-0007sY-9Z; Wed, 18 Jan 2023 13:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480579.745061; Wed, 18 Jan 2023 13:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI862-0007px-6o; Wed, 18 Jan 2023 13:03:18 +0000
Received: by outflank-mailman (input) for mailman id 480579;
 Wed, 18 Jan 2023 13:03:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI861-0007pr-2T
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 13:03:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77fc8483-9730-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 14:03:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8653.eurprd04.prod.outlook.com (2603:10a6:102:21c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 13:03:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 13:03:12 +0000
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
X-Inumbo-ID: 77fc8483-9730-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHbdEySkbNviMW7TmnRs3K5umPz7II0RDKr5wc7nTPBsETyj6abBGX4p2yplWvM+0VcrmzAUu+uhCNv5fnLCoWrZSvuWeMGVqMuR2oHr1vyUqmBXrMozcKLLWFt+ORv3Gb2drvYBtfnw/3qCmvF8WTfGsYEkGg5eAssRBfZCJoQTy6qbxDhNf0Zh0O+qepZAdB9jPPXfH3tsGyawDXdmYhWS5gWxWb5bZ2LwDaycDYvA9VR+HIzZn/k0kKTBYNXWvOj7Wz4prZj1HPT1tdTy+aMPjX94YIhlVzPNqCGS8Z3ZwA8Szp0XpmJNXXrWCcYdL/xo45zY/48RzvSZ6RS8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROA18NkkgxlIn3zt6/yd4Z78Lavp/FmGwZ9YUkqrthQ=;
 b=m5JUDWXdkYxXscSGFvsQkwVcdmIe5oR7mA8mXYK3Q5O2q4oFv4yGyOI9pOPCgF3WiXr03jin+zH+wV0w+UEjj/Z8EQEPQgoqx2gbakYa8aRj6Uols01pBKuZiF/4yzeCv0KZm1Ge1zB413hy+9DtQZmuhROw7qDqF3/oV+IudBWt7GfZJlxY9uF1qZ9mIjSF5n+f62KJNquY1Fxkuywjx7hWrFGiKNZ4ssR/z2Pi8oOPGYrCiy5cPw5KNtR75UtF4MRWPZNRBSLRtZQWVBUgXbp9vAN1FiP2E4K/6I9zKW+Hrn9YHGGEGONrfTBghY1mg6gdS/hG+sfgVItU+/A05w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROA18NkkgxlIn3zt6/yd4Z78Lavp/FmGwZ9YUkqrthQ=;
 b=ZcrzQKzdIDWRau90x8hN9DaGVdDt2+g4FfSsF7DUakhRJSUvje9i3gA8NmarYCqH56rzKfQ4Am5DBSCMblElZ+dDtG4exlJaONZkRFJ6iWx95ItLkBOISdBKSIKFRnwo7REUZFR221sNMNMlwP7kPSSFjnLE92MZBeWzJqAPADGQjtwvq300W+fQ6UwOmLPzbdzjYVr/vCpsd1q5WegtVDPggCDWR7V42ovXw2FIHAzOYkrHOfJEsBbeSykBJDk0VSyoGG1Kit1UBngZBP56WB7SASIwpRGHFfGATWsTMcRtpnpKHa1HrodoNDgu8fcCM8Qo80mPyt5HwszImnKxxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <57f691ee-666b-83eb-6136-d7d85aa92b89@suse.com>
Date: Wed, 18 Jan 2023 14:03:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/4] xen/riscv: introduce asm/types.h header file
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
 <2ce57f95f8445a4880e0992668a48ffe7c2f9732.1673877778.git.oleksii.kurochko@gmail.com>
 <e00512a6-5d32-6dbf-4269-429532f8a852@suse.com>
 <87107d8945c9f1513c305d115f24f488b87e088b.camel@gmail.com>
 <d871f9e2-5f00-1f0d-3297-0084d4a4af27@suse.com>
 <79e2670cdc74454045e653bd62fb4815cb8a7eb3.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <79e2670cdc74454045e653bd62fb4815cb8a7eb3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d191158-2df9-4930-2f2a-08daf9545a4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zaBeX2Q7xPza9laZRKLRM8tObI0/Fk6LDSZyrcpvtyVpCe29pKSLjALQYq9XiCQuszy6JOUnsk/VRlvzyzGsJ1gPl/iiI8l8Y0e1mr+Q2iBI5lWeMMv4RPEYjeQIENZeTt+sRC2aBR6GuNNp9/+9r1rg1NIYwXycVuRgFSP1c3g+r5CHSoNAiRwIjlOaK/OS4UhUWyNXfNH7V4ip2sRSyIxrI6dQGZ6FIap3JluuIuKnKYGzPnSdcGy6ZLCiVPrZV90TjAyTSdn9v8jxPrvNCKElQSs8nqD6SxgiYSfGAhzGxQ6u0iXaFuyD0TAZh+v6s7jIkfuGDOclbSJqHGidWlftvdWetgLMIgIAnM+18hXXv5RbWEAnHMpZU4EU8ndIH+SXMBjFRkwtHRwM9l5Ntuvoo8iRcgsqotd2cY9NCCcinj449Cszd7d7ZxAXcKqw4VALwOrr4EKsHX1tT+PpVG8ncu+t0udT0NPlrjj+cljZmX/7aurGwnO5vnRxQF094m2HcVCfcVn96S01D1piH8a8aWktWDZU+VX05I2e37cXp4DKWtTD7bOsBBxV0dwruGZLEbY5QYH5m5m4kMhTI7oN+/bBZTO9lGaLbNW0v7JTPbZFXihApxkG1VPqLERjF8mFhUGTACQIpslg/peSYrJMc2xqyUtPyhAyHZPAmRZ4L9wK7gy7MTlqUWB3C6yIxZWg50URELxo3TR1Np4ghcy4mtXei4323C1eCd9FXxrbW6594N/AedJ/btpLMYYHhRbB8MwqrmVUYmajauOCQhoI6x/pbgQgma7IyABenr0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199015)(38100700002)(54906003)(36756003)(31686004)(86362001)(31696002)(2616005)(478600001)(66899015)(186003)(26005)(6512007)(316002)(966005)(53546011)(6506007)(6666004)(6486002)(2906002)(66946007)(6916009)(8936002)(41300700001)(8676002)(66556008)(66476007)(4326008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVhOMWYrK3VJUG1DZ25kbkpoRHZEL3dPNEZtSm5COTlZU3Y0ZzkxMHJmMk1j?=
 =?utf-8?B?azk4b2FXZDJjN29EaUgrZEVHYWd0NWtPaW8zL1pITm9zZHZwNGRwY25MOW5o?=
 =?utf-8?B?OXVFRUlTdVdoSVRZOFE5eFM1ZW9yRVhGR1ZNZzlJT3RaVGFscmpFdFlEanVE?=
 =?utf-8?B?cFBjaUhPc0xxWU5CSVVkL3I5bmY5cXczdGlxdHRYUmN6TjVzK1VBZXNVVGVL?=
 =?utf-8?B?UTlWY2l1Y0Y3YU9NMDRQTmZEdXNQcEU3ZnloZ1ZKMEQ1ZXBmeGxBalJUK1dZ?=
 =?utf-8?B?OTRXSkJ1czJ1dkFhK2J2ZFI4MkFVU3djQ0d2UGZUQXJCUGNCUGtTZGU4T25O?=
 =?utf-8?B?b0FUZm9Qa2Z3UTJEODZmMzRUc1IvTkd0SExpSkV2bE9ITUcrMGNNYlVXR1dW?=
 =?utf-8?B?eXV6VEw5SU1PZVdBbVNGeXlaQTJUWTV6K3VmdnRBSnFydXc3WStKRGprcEVF?=
 =?utf-8?B?OWJ5Yk5MOWxoU2xDRWFYcXdVV2txcm14aExGR3hyYUNGUGtVRDBGaDZlSjhh?=
 =?utf-8?B?Q2lBT3dsN2QvalQzK1FzQnRBRW52blRQZk5qeGc3bHRNUW9PUVZuQkZoSVBG?=
 =?utf-8?B?bEovNUFpaWJxZU95Y1lZWjlpei95V3crVEZHVDlpbHZ1Q3lVWEZJWGtFZDdF?=
 =?utf-8?B?aEEzSHJPOEw1UGtGK0xwSy9FRXBGOFJrV0d6RHJ0cXE2bXdPLzhUZEJEeHpx?=
 =?utf-8?B?SUNJVWdPN2daWHRnV25Qc2ZRZzFwR3hiM3dCNitPd0U2d2tLaTg1M2Q0bXpQ?=
 =?utf-8?B?aUFFdlZrOHJtcTU0cTd6N2E4VURLdFZaOFhtWkNJOHpNRUZEa2ZTZm9Gc3RI?=
 =?utf-8?B?U3d1RVVkTnBWV2JDbnFqSGhjUFJoMGVKSjlaM0Uyc2dkeEVuOGtRWi9CVmpp?=
 =?utf-8?B?emx4TVBGMk9Td0dFdmUzcXBYS1pOUktjSFd4WDZ2SWMwSmkyV1ZHaXhVWGs4?=
 =?utf-8?B?Wis0SDhSb0UzREoyVVZ0R2dEc1ZIVGorN1dTWk9BWWlxTmpZcGY2K05sbjVl?=
 =?utf-8?B?OVJWNTZVSWo3RTQ2NTJPeUhQTjFJOXdDeGc0S205eXF6UVVKaysxZW8vSFNz?=
 =?utf-8?B?YW5iY3RSdDFMU3ZYZnVUSURTVGpWa3ovNTBrUmhKUVAvTGlPajZBYWtoNEda?=
 =?utf-8?B?S0tZVk9GTmpqZE55VnBVOXczS2hRTGlXbWxTNDF4a1I0ZzlIMmJxWkx2cUZh?=
 =?utf-8?B?MCtaOU5FYTZTRElYSEtKQVVVVWxBZllTMGpJdVgrS0VjbHpIOERoamliNExq?=
 =?utf-8?B?eVJnaFk4TFdqcll3ZW1vaVJ1Z2dNS3BTV0syUGV1am02WU1rb3BIbVhsVjZD?=
 =?utf-8?B?Z3pGbjJ1ZzFzM3VMU1ZnVWVhTDdxblp2RmhHM1d5clJzYzB0MlRtdDFLWThm?=
 =?utf-8?B?VVkzRzNJdTMrTnRUZkJHbVBnUXg3V2MwQk5zNjFBQ0hCL3lRbVp3dDZPTkt6?=
 =?utf-8?B?eEV4cUJxT2QzVy9Tcnoyd1pFNmoraHMwWUludkxPZUh3cWpWd3hwNmkyRHRX?=
 =?utf-8?B?ZmthdVpuejRSS2Z5YVBjd2NoZnViUVowMmMwQ1JjbVkwZFdpeXZGSk1tSzM2?=
 =?utf-8?B?UTZGOElnWHlrcTIrb2crME5MMlZJbStPbXpJc2RablRpMTc4S2NqOE9Lbldz?=
 =?utf-8?B?NW80dVhiT24zNDMyNjB0dGhITHBZcnpHUVRNbmdYdVYwN21IY1p0M0ViZXkv?=
 =?utf-8?B?d29nR2w1bmhqUXE5czRQSytoNjlHOUl1OGRNYmwya1pIY0NFTU9wZmF0Z0hx?=
 =?utf-8?B?d0JDS0ZTQzl6R21VcVE3YjRvSFpoM3Nydy92dXVncmpHUndYT0F0U2k3ak15?=
 =?utf-8?B?aHZKelJKQklrNWNxYWVwdmsva0VRN09lRWJlR2pUYVhlVmhkRzBSMzVJRURr?=
 =?utf-8?B?Vnp6YXJQSjNLTTQrK2o4cE0ySFJScGpqQ1FwQWsydUw2alU4aDJHblUyWnh4?=
 =?utf-8?B?YWd6eGpmZlZ2SlpTNjJmKzAwTWpUMHpMYW1pc1RLYWwrblYzMUZzUitwemE0?=
 =?utf-8?B?ejVvVXp1Z05scjdlNVJTNzBEMkNNcEpFWkl2R1Y2NStod1hNM2wwN2phZ2RV?=
 =?utf-8?B?ODVPMTEyYS9FNlhxeGRNdjJrcENTSGxFMjlGbS9nMUQyTTlmTnIvMGl2cVJD?=
 =?utf-8?Q?g2XBaRlWq960QKPlbRxu7tKhD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d191158-2df9-4930-2f2a-08daf9545a4b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 13:03:11.9104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCcRvBzFdawJUYg9HqBi3N165ryfxwNUt71w1qdW6u6cjSG9d6ERNenfUoBOeCdPY0oEBMB43H0jdMgCVOxxHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8653

On 18.01.2023 12:23, Oleksii wrote:
> On Tue, 2023-01-17 at 11:04 +0100, Jan Beulich wrote:
>> On 17.01.2023 10:29, Oleksii wrote:
>>> On Mon, 2023-01-16 at 15:59 +0100, Jan Beulich wrote:
>>>> On 16.01.2023 15:39, Oleksii Kurochko wrote:
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> ---
>>>>> Changes in V4:
>>>>>     - Clean up types in <asm/types.h> and remain only
>>>>> necessary.
>>>>>       The following types was removed as they are defined in
>>>>> <xen/types.h>:
>>>>>       {__|}{u|s}{8|16|32|64}
>>>>
>>>> For one you still typedef u32 and u64. And imo correctly so,
>>>> until we
>>>> get around to move the definition basic types into xen/types.h.
>>>> Plus
>>>> I can't see how things build for you: xen/types.h expects
>>>> __{u,s}<N>
>>> It builds because nothing is used <xen/types.h> now so that's why I
>>> missed them but you are right __{u,s}<N> should be backed.
>>> It looks like {__,}{u,s}{8,16,32} are the same for all available in
>>> Xen
>>> architectures so probably can I move them to <xen/types.h> instead
>>> of
>>> remain them in <asm/types.h>?
>>
>> This next step isn't quite as obvious, i.e. has room for being
>> contentious. In particular deriving fixed width types from C basic
>> types is setting us up for future problems (especially in the
>> context of RISC-V think of RV128). Therefore, if we touch and
>> generalize this, I'd like to sanitize things at the same time.
>>
>> I'd then prefer to typedef {u,}int<N>_t by using either the "mode"
>> attribute (requiring us to settle on a prereq of there always being
>> 8 bits per char) or the compiler supplied __{U,}INT<N>_TYPE__
>> (taking gcc 4.7 as a prereq; didn't check clang yet). Both would
>> allow {u,}int64_t to also be put in the common header. Yet if e.g.
>> a prereq assumption faced opposition, some other approach would
>> need to be found. Plus using either of the named approaches has
>> issues with the printf() format specifiers, for which I'm yet to
>> figure out a solution (or maybe someone else knows a good way to
>> deal with that; using compiler provided headers isn't an option
>> afaict, as gcc provides stdint.h but not inttypes.h, but maybe
>> glibc's simplistic approach is good enough - they're targeting
>> far more architectures than we do and get away with that).
>>
> Thanks for the explanation.
> 
> If back to RISCV's <asm/types.h> it looks that the v2 of the patch
> (https://lore.kernel.org/xen-devel/ca2674739cfa71cae0bf084a7b471ad4518026d3.1673278109.git.oleksii.kurochko@gmail.com/)
> is the best one option now because as I can see some work is going on
> around <xen/types.h> and keeping the minimal set of types now will
> allow us to not remove unneeded types for RISCV's port from asm/types.h
> in the future.

Well, as said before, I'd prefer if that header wasn't populated piecemeal,
but ...

> Even more based on your patch [
> https://lists.xen.org/archives/html/xen-devel/2023-01/msg00720.html ]
> RISCV's <asm/types.h> can be empty for this patch series.

... leaving it empty for now would of course be fine. Once the basic
fixed width types are needed, imo they ought to be populated all in one
got. But maybe by then we've managed to have that stuff in xen/types.h.

Jan

