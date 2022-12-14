Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E3664C794
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 12:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462072.720239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5PUk-0007DN-Gq; Wed, 14 Dec 2022 11:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462072.720239; Wed, 14 Dec 2022 11:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5PUk-0007AA-DC; Wed, 14 Dec 2022 11:00:14 +0000
Received: by outflank-mailman (input) for mailman id 462072;
 Wed, 14 Dec 2022 11:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5PUj-0007A4-3s
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 11:00:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061.outbound.protection.outlook.com [40.107.105.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a5da73c-7b9e-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 12:00:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7525.eurprd04.prod.outlook.com (2603:10a6:20b:29b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 11:00:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 11:00:09 +0000
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
X-Inumbo-ID: 7a5da73c-7b9e-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBtUCAwegMFkdSkKQxksu6RfYS2x7p5fg3HhDnx1CoudTPzGK5Ki7boRCxW0DJ/pdVndVoPTVERoVrdpjploReKXbpGfHzxg4BSgfozKR+JNWftbaMr6v3/E2rWgVNjpz6udKKm/3Fxe3tx30pOixNOhDEzWRRCB3Lf8MV3Tt/Sclk0jLEO4GTMLPRFfj+fH7lx8ExGrMD82q46L5VLqpg8Wu1DaznliEx541m9/I1YC4szvSdU+kHnYnCtwWUaWLyFeeVzwyr7RArDBb+JpFw3TuMB+rbHxEzMU3SpcxB5cWmDXKuMjLwFWP/4oQ7ksHpsdR7GGwbJObVaEuSrupw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFBsSfanF/G/8mwfNr9fgD43rwYBz3jtPGkAwp+2Pss=;
 b=f0TqE5fIMXIsiW572CU2wOZ/byXTkJBUvQjKT7CLq/mHfhKcukAYGJOZSN4NUJOz3Jp0fkLoaA1VmT2q5hQCgoqP/Ca6xGRigs34udx0to6IaavLXZ6vj9n9dD2kf21a2C78ga2FIPNsOF/ZVkNeXoqOBe86BViXNzMVmhdqM/6uXO24a8H9/MEyuzafL+lMDf7nwsQYpENRSpGaT4sLevoUnk0+MLJvOC6wd3+/n6mwePBPB2P0PTJPcLlMgxV2alHTmMxHTsNS7KQLTsnGUkyPd4teE9Awkg2+eJh3fusm0Qj7bXPqM7oUGhfYOg++pqQ4ZQa1O3lnI8IJILjojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFBsSfanF/G/8mwfNr9fgD43rwYBz3jtPGkAwp+2Pss=;
 b=Q4Za4g6QdWp2K726opHbcPtQSCOZhtVb4gy3/1kwIdKPEa9BpR6mqvtSr3wvstf4J4pasXqAV4lXHTeFFT2buoJdMuV1Py7N11quf//GYKnriizrKUv/SFGBlIqkdpSTE9fE0NV7HAFMWwN9RcY83JQ8nXdD3iD03q/Eir+rHe2iYjm1iL95aJdDoCb8H2LAzMjA7AuoU6XoZ/3Phs71aqJCAh2OMmINOSuBW3otKL554pvnUXE+Xt1hgKcf8ebmNNW8BabHegeOLOpvzADe2v1CKopUcWCbNBTKv2xHQ3vdx/wjvSV/eZ/3ojzcU23fwwJ8GacO6j9INbDY6GcvaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <874a6123-52e4-d5e5-7558-51525c04eddb@suse.com>
Date: Wed, 14 Dec 2022 12:00:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] efi: Relocate the ESRT when booting via multiboot2
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <a7336c832b0276a1bc7692c537cc14f6e70d65a4.1670972544.git.demi@invisiblethingslab.com>
 <e4935fb1-8223-a2c5-9700-b2277d78404f@suse.com>
In-Reply-To: <e4935fb1-8223-a2c5-9700-b2277d78404f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3b69de-42ed-451f-d052-08daddc25dca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S7KppL6y9YeQWCL8HlHpsvQaTa9jZ7he6S/eFgPkLlSaL25TSdhvRnVS0E60Izsv0jfEBIjQQoUuCh/oT/F6sS70gGk4QMOrizWod80XUNOFIOXSZWyGHzHHatsYuOriXRp9UL9/UAo0pan07LSLvMESEut8KhT4tMIrXSC8GxSVzVY7K3d8XZ45tM+EmIKrnefWnb6HzrKmHrcIGImsP7zwHNXGUkkUijw4cToC4pt4WPD5RabYjyPrOupbORC26mtVwAmjvR4R/X8E5o8nq7WfiR4mJGUwwOhq7nlFA6GLteIGuTmdMvnKqjI3PF6LAAXzk0uWdFe1juMzdAx6oT4AHIy4QukdxIKgpwvMfbCKtPdfQWwCtJ58psTGGk3bC2Pizo/AqHJ+5AswaOQwq2WRFSF/9GlNe3c8gfOD3biyXn8111jX6sU26i2S4KPagvNDpufr/3k/X53+fOd72fAH9CvYAlo8Gy5GpwHhtAGivMrUlJSaRIu3RrdTTfuEKvO3dkENZEoa0QdD86Ajs8CU1sSuUeLqfNVs7DpnBwM1y8ttdQhnNCe9cGAHjqlS8aEbK4ECnLu9l+qOPpjRedLT9UxB2eHju11wul+7RnUYY9NC1eHsrJuOruBSUGk3aA/bHvqVGs5hI4VU76NDNk/4u+a9OE6mStFAy8jk8Ow6M0vdZ75AdphyrPwxBS4zzOFJc0Np6R56UsR+QYMIBORCH2evw/ZKQpFalLw33Vo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199015)(316002)(2906002)(36756003)(5660300002)(26005)(4744005)(6512007)(186003)(8936002)(53546011)(6916009)(6486002)(6506007)(86362001)(31696002)(41300700001)(8676002)(31686004)(4326008)(66476007)(66556008)(66899015)(66946007)(2616005)(478600001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm1DcVR5QWtRMGhFMmtlSFBia0xVOGhEdTVidXRkenlpUGFQTkJuRVA2bUUr?=
 =?utf-8?B?c0hPRmxPUkNPWTg1VDFheTF4N01MNnhvdXBVczZidzNqSEFPU2FuWVg5d083?=
 =?utf-8?B?dkpHUitjUVRMVmw1N1phZWt0NHAzK2o1MUFzOVhQUGVJckROVlZ5SE4yZml6?=
 =?utf-8?B?UEI3KzhKdWZHdEN4NkpNVU9FbGtvTnUySHJXc0hnZ2o3aEhxNXRGRGl3ak12?=
 =?utf-8?B?YU9yUzVQcXpvQ2pqcVlDSko4N2pnL1BsK0JvMGR1d1Yxa01TdXFBaU9LTzZ0?=
 =?utf-8?B?UU53UlhXUzgrckxhOE81ZjZrd0VUTlFHTzlJdytENWxFUVNEREVldWdXK3BQ?=
 =?utf-8?B?WnVzb0xaeTJTSzdVa2o0a2dxWUtVNGYwNXB5c2RTVTA2NUREanZodFZtd1Vz?=
 =?utf-8?B?RDdGMjZiamt4ZFk0MVZWRGJMNS83SDRzZGdlM3ovc0ZuMjF5RHUvRG9TdElt?=
 =?utf-8?B?c1NMS285U3YxcjJ4VlVEMTkxZ09YTmdrdlVLc3o0SkRmamdPS3RuZmorbnhN?=
 =?utf-8?B?cU9lSk85UEYrZTI0RjdNUDZvNXF3RzhubHdCcXBIUFAxS0xXdTFBMExuMEZU?=
 =?utf-8?B?M0M5SDNkNTY5dnhreG5pcXhwcnBITGNsNDQ1YmZaTWt4eWlKQnN6SU1kRE5t?=
 =?utf-8?B?NUp2cDBJVnBKME1IU1JWcVJHRC9NZjNwTXJMbjVGK2pOZFJkVWlIMitvTnpI?=
 =?utf-8?B?SzlqMGZHVHl1Z2lSY2t4YWgyYWRzOEJuMys3RkhSN0RxK1ZQWVc4UFFESDV6?=
 =?utf-8?B?VTlpNVk2ZWRHMlJURnRuSGcyVHpObW00Y0lGT1NSalljckJVWk1HNFZMSGpI?=
 =?utf-8?B?YmtCcVE3c25HeHc2VUNiMjB0amI3SkcwaW9UeVBhOVl2bDNLYjhOTnVrU3M1?=
 =?utf-8?B?Q3U2enBKN09FUnFTWS80dVN6YVh6NmFhN2ZadkN6UklWUjZuTmkzaDVoMzQ3?=
 =?utf-8?B?ZXVPSlp4RnhYaElsbW50N3VDNlhXMWxaUGxCS1ZNK0ZYM2N2dG8vS2c5bWsz?=
 =?utf-8?B?ZWcyalVFMXgvT0d3cFRHay9TUy9ZVm9IK1JLYVhuMkRkYkdtdkhySEZ5TVlB?=
 =?utf-8?B?YTNLOEFnY2hRNUtoTjVRRDh6V3IzRU56RlpqNm0vR1BkOVZENjFMdXdyWEZu?=
 =?utf-8?B?OHFVV0FxcDlOeWJNTytrSDlENElFM0lETysvTnMrMHdwU3U2WldrVUt3cmNy?=
 =?utf-8?B?Y0tHV1B6OUExNHFYZTJlVmovMTlaYjVuRE9HckNHa0g5a2I4bE5sYmM3N3d3?=
 =?utf-8?B?eVRoaXlBMXZyQ3RoZkgzK1RZY25mZk1rd3creW0yZ3BKcVZqdWNMRzRXVTFH?=
 =?utf-8?B?K0d0WjBkTE1aRStJY0hmZ21ENVlEVUJKY3Y0aXBJcWRoYU9VYStENXhQYm1P?=
 =?utf-8?B?U1VLTXYyMDZVR1lOT2Q1aUw1ak1xemgwVWwrS3ArbWcwckJSb0Jsb2JHYUht?=
 =?utf-8?B?T3hPTHFleTNPL3RTMllvL1ViSUtWN2x1OXlCcTVtMmFlNzRpLzJiald2MkpO?=
 =?utf-8?B?YnV2UldWbC91Lzc2bDMrUmxtMm93SXVMVlNsUUR6SHB0bFQwZU9DMkovUEp5?=
 =?utf-8?B?WUUyVi9CS05qK0JpQ0p6NkhaUGYyQXBiYUd0UTVUbTZuQjJjREh5N0VsSStk?=
 =?utf-8?B?UG5KSkZ2SjU4R0g3V0RuclNPN3d6OFluSU9PSlNSajkrbWo5TWxHREpTOURy?=
 =?utf-8?B?N3hyR1QvU2VsZWhtRDRld3dXQU9qZ2tUbHFZRmhuR2JmT0lES0NlZWhnZGEv?=
 =?utf-8?B?MWtLYTJ5RGFrQWJXc2x5YlowN2hvckdpOHpaSzlNa1BTaHlmWnl2aGVVVjRj?=
 =?utf-8?B?dVF4R2VjU1FBKytmdUo2RWxvUUdsb1VlZWg5disrQ3pCVnZNMFJsU0t3eTFG?=
 =?utf-8?B?c1I2VVoybTROckZHbDFsRWczZ0d1b29RMi96N1VKWFQrZmsxNzJoZGRVdUs1?=
 =?utf-8?B?eFR0aTNpVVZtVytnOHdVZ25xWjB1MUZiTzBoRmhjMDR5elVKekRqc3N3N0I3?=
 =?utf-8?B?b2k5SEVtYitmdFBZc2w2cFpFNkcreUNBOGEwWlhJa3RSeU43TWJyNytlTmhX?=
 =?utf-8?B?VTFJakNranJ3Z3hTdHlpUjNHUklRUmN0NU9iNFp2SmxzUU9rWHB4dXM5dmNu?=
 =?utf-8?Q?gqvXaWqib8j2pDJJd2v1EOIX6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3b69de-42ed-451f-d052-08daddc25dca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 11:00:09.4563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLVN6qgmld9cVwEtj9xtIofApvgJTyUVt/qQ/gajZhiempojanBLPxuboPNdnegE/CzD+QSfs4GgAP4/a2EPOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7525

On 14.12.2022 10:34, Jan Beulich wrote:
> On 14.12.2022 00:03, Demi Marie Obenour wrote:
>> This was missed in the initial patchset.
>>
>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> 
> I'm sorry, but no: In a v2 submission you should address prior comments.
> On v1 I did offer to extend the description while committing, but you
> should not take this as an invitation to make the committer again put
> more time into getting this into the tree than should actually be needed
> (and reviewers to re-figure the unmentioned aspect).

So I thought I'd be kind and do what I said I didn't really want to do,
but things are worse: The patch again doesn't apply, this time because
of assuming an apparently private patch of yours to also be in place.
As it's merely patch context which is a problem, I'll edit the patch,
but only to be done with it rather than wasting yet more time.

Jan

