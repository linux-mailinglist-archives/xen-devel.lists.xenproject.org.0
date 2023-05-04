Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810E16F6729
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 10:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529627.824207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puUDT-00048W-CD; Thu, 04 May 2023 08:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529627.824207; Thu, 04 May 2023 08:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puUDT-00046c-9G; Thu, 04 May 2023 08:21:31 +0000
Received: by outflank-mailman (input) for mailman id 529627;
 Thu, 04 May 2023 08:21:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puUDS-00046W-B4
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 08:21:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaa7fda9-ea54-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 10:21:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7479.eurprd04.prod.outlook.com (2603:10a6:10:1ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.25; Thu, 4 May
 2023 08:21:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 08:21:25 +0000
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
X-Inumbo-ID: aaa7fda9-ea54-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzZ7YQWEJzZZfabhrbsKP041Xp5luhcZjaLYohDTM1Mkxrc/P/+JX/vwsLwyu7Oy2ke3gnKmcaxcSscIj5qQBcAu6dvwxBKIi4lZYYX4MGX/g4kyoCDs0ono0QFRjbvBICd5JEDyj1tmj9pLuq+UCLkxU2/29k4A8bAPugjHYF13watgpav5+2AnhVLC8GLVd8RmYzVPzMWu7TkS9nd519DBqrkPiCi04QqHHmKMdxsKLoZeGuYS3Qs6Ah3MZyY86O0osBqd6B/jlDKpukKKrXBcwIGDcH/jjNtDtePu642bBpBYyE4dAp1jhDKAv5jhHsx1rjXWOAwI0rdFSKOYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aI0/JyEON9kCkhqTyTPi7ggRbwp5JhYQG2jo6txVfvQ=;
 b=h/0hiF3Jdjz5YAuen/QLsYPpCzLbDT1R/vFWhY20TSJvDuMC9xPiGIk8jBiieztAOSmAFCiyvfTplIqn0fPUaXTbpdhAErZIocPPqJq6VFHIK74ETQtodEJPo+0cGmN18nlq6CaC0YZ9IieOQSWGg54rswrBXLay94N9zgizjfxWDgdvFs5me0P7SWvdD3igYij11b26cug+2TAa902S51OreP97fMYlclotRM0hX8JcXM9u5zSpwJBbaAp6rN8m6FmlNkJEwNw1XVCmffg3NMSFC+5d308PC1Mp23de6UwxNDvrtLsFaBHqbHkkJB1nvuZXc8VB3z5+1urPqfLdKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aI0/JyEON9kCkhqTyTPi7ggRbwp5JhYQG2jo6txVfvQ=;
 b=pFYKFDSuauBvx32KLRw76S+hJ17h9l2Gf6sXBlld95hgDUeHG3Qz/QcbUwopNU/9tc3zYYj7qECE/lyP4VoenNiNvcxESM+F/ubvyLX3Z2grn+9aPRgWFYozvZf92YKm81p+H0DKWKOwXWDgCBfvmn9nj6563+kTBOGmEgE5oL9/uB7iO2j4rR/flHM73Her2TEcsOqPxNTC93+Ab/2nQKYy5jG0iw8gYQNwBK/0IWQ895T0igcqZVFNNBHzJOzDxguhhqBWt4ruVGVHVNmdLUV9QoGEsgVpgPgCFjDkapPjZ0DXXOT1cXsXDbFgFJrXCfkeyGkb0nkoqMMLMeKFTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf8bb56f-8fc5-77a6-40c1-a2f10970a094@suse.com>
Date: Thu, 4 May 2023 10:21:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] restrict concept of pIRQ to x86
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
 <ZFNiS8oxfozlxCz6@Air-de-Roger>
 <2a46c7df-b380-cc41-5582-70b4829d7f47@suse.com>
 <ZFNpI929Zk61sZ5X@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZFNpI929Zk61sZ5X@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 10202286-02d4-4af8-4f1d-08db4c788d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G/BJ2udFc8x9GiqZWgq9MxCsX3EPfOEFb74NCUcsfMEGRwuQvsEpXoB5LK96SbyicUz8QjhWqBRFtFsoPCEamB8zzetsDX4sOLHasx8gk+tLo8kbsTtZedE6zV8NU/81YL4ThZKQNBRXeYie2xeJQVD8fxRH7lb9CmoeUD28atm5/KML6h0qLKrL4W3HfUfqPkO322PeYhta4VECjhg1+DpOAMzHJhZosLakDYNPsXH2lXVu6ldEbOeK38fn0+TBWC9RRExYW6PoW8ANN0pcynxXNq4jG1FbT27iM7AcOmK1sUy/aqBNyFi2IloTN6/NIf3JSDPa86K5A7mydJUdzx7A3/moBBHt6QMW+snvDNxsYpAejfJL/DuVarvUJaeqbneARhH/jNuglGQHMFuwLYEfg5DjICKC9HfsW1c7OyzhoSn0cqxt8yBw7hZUI0M2hVfhr5Y4yUjiidqgUniqOlhB821qbU1UdzT2OjOzL/fdo2StxvG2JIv5Q1VMLRjk15yX11qVykQ94Ujq7I1x0msxogD+kPuEeCiyIvd0yrwG2l9zBUpjkoLM8IHTrps9sD61/fzAXBIUVWMd/nqPJhLqoFeTjOoCC1g8qrljiV122jTLkb7hMcFb3sKc4Z9hzRFzgkImB8aD3QE5YCg7mw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(966005)(6486002)(83380400001)(6512007)(36756003)(2616005)(186003)(31696002)(38100700002)(86362001)(6506007)(53546011)(26005)(54906003)(2906002)(66476007)(66556008)(4326008)(6916009)(8676002)(66946007)(316002)(8936002)(478600001)(41300700001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkFwOEh1VGRnMy9wWS9IWWVwcWJwaldJSnJ6V2pRSmRGUi9SM0NiOG5tYWty?=
 =?utf-8?B?dEVLVlZnRlNtY1dxVm1TdGVuanp5UzAvR1VpSERjMURnWnY0RVpubnRWYllt?=
 =?utf-8?B?S3cySWNpa1FvRUpxSFlsTFkwVVBkMERUQjBvT2FIbmxER3h3SEpSQ1hqaWJ2?=
 =?utf-8?B?d1RDeXN3MzZEb0hwL0N1aXB5TmVVSXNVTzFaTTdreVBoaSt5YjJSUVF3R1pq?=
 =?utf-8?B?bnYxcEZPUWl0Mm03ZXVreXdwSThmT293N2tFeGpLVmx3UjRYTzdyemxiejFy?=
 =?utf-8?B?U2J1WXorR0JUQmFZZXRaZXhMdjV2eE1JVUpSbU5DU1h5VlNhc3czWmNlNUxW?=
 =?utf-8?B?M2hVRkJxMlE3RzJSL3dJNVhPS0JKYnlrQnkvcDBTNnNLemphbHdBM0ZneW1M?=
 =?utf-8?B?UzJDTk1ycGxYdkg1QndLaXBrWjRodFZuTHJKcndlTS9XcU5PZDhiT0F4bjFM?=
 =?utf-8?B?MVBoOXk4aUVKM2Q1MXB6MDBCeXpEZHNIeUs2QzU0WEhWVG9NNXNBWFV3T2Z5?=
 =?utf-8?B?M3grSXJ0VnhETVozczIrWlhYU081VnB0MVA5SCtPNUNmbk5VZG1pQUoxR2dG?=
 =?utf-8?B?N3QzV3ZMMjlyckVsTERLWXlGU3RTV3IrVklRMHMwakQ0R2Q3T0hsOHZuVCtw?=
 =?utf-8?B?REpVT2RTemxBVEVvWGRnU2U2eVBSWnc3S3pzVEh5QnNrYndZdC9CWE0xTFZs?=
 =?utf-8?B?VTBRYVlZekZ4dUNkaWZZYXFxL1Y3SkJOUzRiQmNmbmphU08xcUJCOGpiVVhh?=
 =?utf-8?B?cjFSR1dEa3FqVTBVZlk5TzNOUi9lUWlqaG1US0l1SWZwWnBGUGZrQ2lDcmdP?=
 =?utf-8?B?Zm4rTVM4WTh3Nm1KendNam1oRHhJajAySkIyd3c0NkFGUHBCcVhiUXl6c2w2?=
 =?utf-8?B?L1lMMXJsanNlU2p4Y3V1eDdHR09BV3ZNSjczRjZWSXYxelRlVllVZ3JRaGxv?=
 =?utf-8?B?MXlER3VhK2dUOWJMQkRia0FsZFFWbktoZFVzSExuU1hoRFcwOXdNaEN6VW5P?=
 =?utf-8?B?cnJRd0lQRUZHbXJLNzFmMU9BY2lxTGpTWEVEOUxETjlYbTVSUmJ2Wk5SbmpJ?=
 =?utf-8?B?VTBGNmFDMWI5Nk5lNCtJaFY0YUVTMGI3eWQzZHBaVGFUQWs2Zjc0YjUxK21w?=
 =?utf-8?B?ajdtMjV0bFp6a3M3WUYvZHFlZ1NWZWdsRnRrcUFhL2pldG9RZDFJYlJWbjhD?=
 =?utf-8?B?dTVRTXdVNE1MTnhvejFuV1JVblJPNHAvRFNNRFBFSnNWTHM0dktMcDBJcmZx?=
 =?utf-8?B?YXA3NFV4enlDZG1EU3dqT0xLTmRkanRLaUdWM3lPZmM1MWlPOWJ3cTA1Zkdp?=
 =?utf-8?B?NHVRWC9nZXdwTzU5d1ppbU1GQlZLS0dkVVdvcGhCa3NSdkVBemFieE8xOG9I?=
 =?utf-8?B?eW12d1RCSEJtUUVjV0tNWThBOElIUFVtTFpJRG1sREtCTW56WkFuZlRGTFJq?=
 =?utf-8?B?cVFmeVgreG1sa1dIN3ZhVFV3ZWdNTGlreDF0aGNiajNhcGN4UjNueVg5bWxC?=
 =?utf-8?B?amV6eGVkZ2E5VFA4dXluQmEzWDd2MzFuZVlLVk1iNDdmQS9mRXI3YXRPRStD?=
 =?utf-8?B?WnN6a1JBZk1CUlRuTGFWUys4a1VxYndhWU1wU0R6VFJKNnlDUzJXck0vY25w?=
 =?utf-8?B?YVdHeWkvSWJrY1YxU1ZncUQ1cENEUU1pb3p2eGNBSW1SaFJvcnYvK1VlQkRW?=
 =?utf-8?B?cjE3RE1TTy9wUGNMNnhKM0pHQ2pERGJSVWRyUmRiRG00VU9YM1NPeVZaQWk2?=
 =?utf-8?B?ZkNwNUZrMitORGtqRDVNUnRRQS9yUitTZm5QME9uRGswSlVmM25MMHVyRnlM?=
 =?utf-8?B?VW1vV0Q1RllYWDNVNVRYYU85Vi81SkJPcXdPYVVoeTZKU2NUSFNVd2FHanNx?=
 =?utf-8?B?M1RLdVZqU0h6YnJnVlowQzRSVDVmdWNMNXVkRUpOcFB1S2dNM29DcVVkZm5I?=
 =?utf-8?B?anc4cC9mSUFydVJGWlhrUFFYQjhhUjVwTDJybzlJRy9OeFRpWllzZEJHNXdT?=
 =?utf-8?B?Sm40Y0ZzTktkdjFLd29zT3JRbVlXZEhIZjFGSy9SMCtFQ0l6UlB4Sm5Eb1hS?=
 =?utf-8?B?cC9aV2xRZGRvd1BoS09pR1BIQk4vcE5XT1c3QkJKc0dpYmNpVkdHTWtxdGVI?=
 =?utf-8?Q?bA5hhd7UgfEyoh/nAbNQir5j5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10202286-02d4-4af8-4f1d-08db4c788d60
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 08:21:25.6542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWy9DL/NesyFekUOBuEiyZ78OyEGMBT3BBYu+zFdIEibvDHKMZn5rXrJ+I2xZkqEknvXqZRySGXoCLUOmflxYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7479

On 04.05.2023 10:13, Roger Pau Monné wrote:
> On Thu, May 04, 2023 at 09:50:27AM +0200, Jan Beulich wrote:
>> On 04.05.2023 09:44, Roger Pau Monné wrote:
>>> On Wed, May 03, 2023 at 05:33:05PM +0200, Jan Beulich wrote:
>>>> --- a/xen/include/xen/sched.h
>>>> +++ b/xen/include/xen/sched.h
>>>> @@ -438,12 +438,14 @@ struct domain
>>>>  
>>>>      struct grant_table *grant_table;
>>>>  
>>>> +#ifdef CONFIG_HAS_PIRQ
>>>>      /*
>>>>       * Interrupt to event-channel mappings and other per-guest-pirq data.
>>>>       * Protected by the domain's event-channel spinlock.
>>>>       */
>>>>      struct radix_tree_root pirq_tree;
>>>>      unsigned int     nr_pirqs;
>>>> +#endif
>>>
>>> Won't it be cleaner to just move this into arch_domain and avoid a
>>> bunch of the ifdefary? As the initialization of the fields would be
>>> moved to arch_domain_create() also.
>>
>> That's hard to decide without knowing what e.g. RISC-V is going to
>> want. Taking (past) IA-64 into consideration - that would likely
>> have wanted to select this new HAS_PIRQ, and hence keeping these
>> pieces where they are imo makes sense.
> 
> I'm kind of confused, what does Arm do here?  AFAICT the pirq_tree is
> used by both PV and HVM guests in order to store the native interrupt
> -> guest interrupt translation, doesn't Arm also need something
> similar?

According to [1] they don't, hence the (new in v2) change here. Aiui
they simply map IRQ to pIRQ 1:1.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-05/msg00258.html


