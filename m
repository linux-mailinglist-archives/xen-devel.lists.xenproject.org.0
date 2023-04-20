Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BE06E8D4A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 10:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523982.814467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppQ4I-00030i-QM; Thu, 20 Apr 2023 08:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523982.814467; Thu, 20 Apr 2023 08:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppQ4I-0002y3-NR; Thu, 20 Apr 2023 08:55:06 +0000
Received: by outflank-mailman (input) for mailman id 523982;
 Thu, 20 Apr 2023 08:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppQ4G-0002xx-GU
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 08:55:04 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09c5ea9a-df59-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 10:55:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Thu, 20 Apr
 2023 08:55:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 08:55:00 +0000
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
X-Inumbo-ID: 09c5ea9a-df59-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rk+34WOiU3m+Cxm5lARyaX2feDHnb6yVoH3+l9VBuR4EyFYLR8Vt4u+XDuI6J/kmMZdDWnHB3N4PZxdmXcdU7Kkt2BQV4NfRC/3UA1SZjMDSRi4U8JxBbrP6YHs8JFlErdbrxI3nczo7mCJX1bIq13hLMMXaqd5tDdK4EJjEhgPpuLQy+DLGxlDb5W/HDQx822K87a+vclc9EK7Ig7k+A9ISbzfTH7AqvMrGegEiR/5GOVNIg/6fxGlJEB736FIQxPlAo+0FOrzRfQjA84yTXZGwbmfOGp7oZJftdBxR/8CaQxZugYB9WJ2Q7g7hKRBUkwRcCgdDbli+FdZjt0wPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzHe1lBJgLijKLEEgidhwjdq1Ta8y0+4RrHR7zra7tE=;
 b=RqKqh5qET2C04a0vXZJ44ygx6br1+ZDI4xgZwwzwPts61JmvHQ4WE5uMTsQ7qpOhTr8d2I9mR/Un1jz0sXr/Ve1LnmK7a+XCiT7VVjQ9/nArgXdAkqXAq6Cy5GhGfJCiO4QErq75y+x/q46DnEIL8KSWwhkb/cek/C1UVWdGxtQxx/bPZNkCs4eeU4uNmOib5d16gakg4ONAKmhPQvFG6VpzEvDk+2njJTeq8FLPBfMVC4ouW8iWziv+snxV3MERxT+E5CoJ67rSz/caF4lqJYmWgEPHgwx90UeBBwxmVWBWFT+Y64TnAAjoKFDmOrzw6P/wEWM3pJxtXFIk6ea9Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzHe1lBJgLijKLEEgidhwjdq1Ta8y0+4RrHR7zra7tE=;
 b=XqlMdMlMp33BgXt6IizvrPaiMIX8JQ0VLbDlYxjjIpEbpg7xmfzKSY4NEBFOI3YDFAlfj4ZQY0+aBjpqiyvwjfb294SGRzAdPRpGwu3Gi8PAC+r/33M0kGstJAsNBAqImjJXTgokDq8ztUm38kabCuvrhr8U3Hg9zHOJa/Hg0zHLpl7BfShaSYxD23jDauJ+D/572ASjXfqMocIvObJr0PlnkWCMeLlehg8+DvQvKUAXE0xMRFpPl/I/MxbkkuKSSdqRzIhLY12esmGUHEMxLd0lohyNZLitSBwqB8Vj7Q/usHBPE5QdlU8SiGZvtD2+Dm1Gat9DT5ukUuVyQaLaPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab185590-910b-6ada-d607-cc91e9002cfb@suse.com>
Date: Thu, 20 Apr 2023 10:54:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] x86: support cache-writeback in flush_area_local() et
 al
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
 <ee33ad20-ef6e-504d-6987-59ccb166f8e4@suse.com>
 <53204261-3dac-579f-ede5-7acffd04f4db@citrix.com>
 <6f3726d6-60af-3db7-40cc-63308e427e85@suse.com>
In-Reply-To: <6f3726d6-60af-3db7-40cc-63308e427e85@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: 13da261c-21f2-4ea3-95e1-08db417cec3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6/A2VLXOFW4zNpWBSLO2oRgHfdVZzrdm0mwt9+0pTV3jYxInO2yaqaMesetPjFhwgaWu1eouAZ3RXNW2DYFFlyKQ2u9WtuKDixFd4o9E8bXbZsH5w/pMF0yKGcBSdM3YyafKpVwvXcB33opCSk4g7025nPCWvKFi7hMNKrsZqQkeo99vWYi8Cj4feS53xThyVdiP1UWlGKfFpOwwUl0K+U8Q7/3Got+fjDOXB6uaNP2cD8jSsngcSjrx0wDSfVmTYlQeL9A6yLwbWrNV3tx5JX6ec0S21kdovtO8CMFUODigFy2AODvTbCVy8KCc99RnLWs+jlhGamUjYZo62Xyo09tTi13KAt6wsVu9oJYKBA+qp0b6ZAcJxOznrjhm6tXlt+PT5jXKTy0v++t5m3Xbj12WHQLfRH1AmLEbgoZUEXqKz1gBBdieqJpJxJnGDfkaAv9kdpU6KqWVcra+MEgPWORP2+FymkyXj6GGalComFU+NH7sYT/zOfRUO7OMrP2SvAtNlurpcHW0HKBnKC/QwJ0TdR5Mg9V/X0LIJM31RC3F5AiMv7yo4vJxBJVJl4ZBBPS2tBgBzLN1nl2CTrHf6RJEKVPAVtjzSM9SaGUX/4puV7xwv4jeK8YZPsoTTh0ZfFXz9YOBP77AExlYQ/hKCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(38100700002)(6506007)(6512007)(26005)(186003)(53546011)(2616005)(8676002)(8936002)(5660300002)(2906002)(86362001)(36756003)(41300700001)(478600001)(6486002)(4326008)(6916009)(66946007)(31696002)(66476007)(66556008)(54906003)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjJXUkxndkRQTE9Nbmo2Z2VralFvbUR6azVIeXJ5TjZ1ZURnWjF5UStRNlQ2?=
 =?utf-8?B?RXVXY1dJcGV4QlI1SFBLM2ZiZ1g2blFVRnAxdDFSampPcmxmWWtmUUk0Nmc2?=
 =?utf-8?B?am0weEdsYjlXM1czdzNoczhiVFhzeFV5NklOSkw1dys2Y1ZxSVd1VlJyN2J6?=
 =?utf-8?B?Ulo1U0V0NjdlR1YyV3pZREJVY3JTZU5yQzNpOUxVcmVWR0d3RDV0MEE3RzRN?=
 =?utf-8?B?aHNtSTVBSG5vS08zTVYzeitCRFJoM3B5NXhvMzFtTGgrSU44cm9NNTV3VEZi?=
 =?utf-8?B?K2FVOHpUNWpmOXdqaER1bE1hNlpUZ25ONEY4Uk5hRXdoN0RRa3ZIMWFoelk4?=
 =?utf-8?B?YlJaWHhzQmtINkdLR295d3ZYMklIeTQxTlUxSjhRSW1BSkQwUkE2c1QwL1ds?=
 =?utf-8?B?RDBlc1Mvd09EbVZ1YUowT3IvWlQ4RklXSFVYeVlqWnJjb1dmb1RDTDVhR2JQ?=
 =?utf-8?B?SmhJUzJmcUdEd0RCQm03QTU3cTNjalZWYUZqSEhSZ1FmY3k4cHVzcE1TQ3Ji?=
 =?utf-8?B?RkhUaUZ2SUVBdkEzYkRHdVovMHFoYnBpOStBU01UMWlLMWJzTnFaSnhQdzlq?=
 =?utf-8?B?ZjB6RkFrYVB5cTlXKzZDRitxQWwxR1I5dUh6Q0ZRUFhxNzVocnNlNEVieVI3?=
 =?utf-8?B?RTZwYW9QR3gvUTZMZjBiekg0T3o5SDdIai8xS1ptejZVQkNSZWRhTEphVEF1?=
 =?utf-8?B?eEFTVzdiVUl4bi9hcmJHcDJGVHh6MlFwYloxaVpHLzg3WGRvZmpwK29WZURI?=
 =?utf-8?B?dlE4NFZCWVlxc1poenFaQTJkOUMybTIxdmlvYVJCTXJFREN1V2NWZ3orWWcy?=
 =?utf-8?B?MVhqcVovWEVlcTVMMjAxLzVEZTNhcGlxeW5HMlJYZjFpN0FqK0FZS2VEMnJM?=
 =?utf-8?B?SVVIVDVRN2wrYUxvNmo1bmRkc2wxQ3FnT0poWlR2WHRBMUJERm5taDFoVXFC?=
 =?utf-8?B?NnAxRnUrYnFudjY5bFplTk83Z3ZIWWllRXN5ZDZ2bFBsMGxSZ0w1a2NIeU1u?=
 =?utf-8?B?Vkg4QVpDNy9VdTNtM1g1Unl4dDBRV1ZTMWhnbFRIcXpKam1JbmtIbmNqWFZv?=
 =?utf-8?B?dWhVNlA5QThaNG95YkpRZWRBdEl0YjFZcTc5QlY2ekE1Sk40eTI4eFp6Z2F2?=
 =?utf-8?B?V3R3b0hPdkk1d0JtZGE0Y0xaZzNKQWw4WWdUcjdBZWE5dTVUQkdiM3ROeWYz?=
 =?utf-8?B?VDJOUFd2cGVMbVlUT05FUnViL2thM3c5Q0c3NWdMUmZWeVpFVGtMaXFaaDky?=
 =?utf-8?B?ZkFIbHhMR0NQeEk5VFBseDJYUVVsdGh6b3BnYVhJTlAyelZQaWYxa3Bpd3ZB?=
 =?utf-8?B?NDg5UXFrUWsxMWhlRnZ3bTZBSXZPMDlTVVl3OWxkSVRXQ1pmREZtaGhUYkU5?=
 =?utf-8?B?QjB4Y1FxT0lSMlNxUlREcG40QjAzTzNGamVVSnMxbndzRi9tTGQvei9YcHUw?=
 =?utf-8?B?WDdwMDd1c2xqSFJuN2ZaVUlTUVNLRjVRVjkzTVhnSEIreDRFNjFHcWpkcmgw?=
 =?utf-8?B?ZEU1RVlvN0JBUm1NY3kxbnIxSU41dmpMd3MzajZjTlBFQmNvanpYRGgyNWRG?=
 =?utf-8?B?VjJLVWlzRG9hU1hqSnY5ck9ENXlRaTZGSjJVcUczUVV6UldwdnhPS3ArTWNL?=
 =?utf-8?B?U2owQjFWSitoTlpjNnZyR3hsNUE2bEpBNlMydk1aK3hKN2NNMzRaUDg0d1JM?=
 =?utf-8?B?RDZ0YUVCYzB4N1VRNFVTb0VSYzJnTTBMODZXazNaNkQrdUNEY2Z6Z0d3TExN?=
 =?utf-8?B?LzVPdlEzaWFwN0l0SjdsS1YzUWxQbW9XTjJXNlF6ZE1NRkdTOU1CR3lxb2V1?=
 =?utf-8?B?elc2dkNsd3pMOGd2YmR5V0Q0MU1EclVGOFBrd3Rpb3JmMkI1ZFNKZUMvc3F5?=
 =?utf-8?B?cUpBRy9XOVp3bEpxNU93cmFkTzlINkVWVTZVSEp4dkloNC9TaU1ySHZMaWJG?=
 =?utf-8?B?OEEybzZDcG1aVy9mSk0xeVB4Y21CbEw1ZHFLb0xzS2N3QTJCWkljUTR6cldJ?=
 =?utf-8?B?dmUwa3pCcHNROTVtekFQdjdJRitRZ3A3Vll0ZTdjTWNJek9RZGswVTVDSWxt?=
 =?utf-8?B?dk9FcFpvd3AzcThHRUJnZWFIVW5mQlBrSXZQSzNqWVgwc281OUJTeHFvcUNr?=
 =?utf-8?Q?cghvBcMY8mp70teqFNuldjDrF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13da261c-21f2-4ea3-95e1-08db417cec3a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 08:54:59.9957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BH68eD9pvUObDd0kVcN3EJy7EeOmdH8Uu8Qb7RfnMfMDy52C6Q8MIgQ/j3tRVfjK1ENcYc5sgsx9xsr8hSOwzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659

On 20.04.2023 10:50, Jan Beulich wrote:
> On 19.04.2023 21:56, Andrew Cooper wrote:
>> But on to the main thing which caught my eye...
>>
>> The FLUSH in FLUSH_CACHE means the flush infrastructure, not "cache
>> flushing", and FLUSH_WRITEBACK is nonsensical next to this.
> 
> I agree; I chose the name simply to avoid further changes, while still
> fitting the naming scheme (i.e. the FLUSH_ prefix). I'm okay to change
> to ...
> 
>>   All other
>> things we flush have a qualification that makes them clear in context.
>> (other than the assist one which I'm going to time out objections to and
>> revert back to name which made more sense.)
>>
>> At an absolutely minimum, FLUSH_CACHE first needs renaming to
>> FLUSH_CACHE_EVICT and then this new one you're adding needs to be
>> FLUSH_CACHE_WRITEBACK.
> 
> ... these, but I don't think they're much better (still primarily
> because of the FLUSH_ prefixes).

Actually - are you going to insist on "first"? There would be less code
churn if first I introduced and used FLUSH_CACHE_WRITEBACK, and only
then renamed the few remaining FLUSH_CACHE to FLUSH_CACHE_EVICT.

Jan

