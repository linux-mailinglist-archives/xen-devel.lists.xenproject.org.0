Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CD74DD6C0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 10:02:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291957.495874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV8UX-0006xv-RX; Fri, 18 Mar 2022 09:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291957.495874; Fri, 18 Mar 2022 09:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV8UX-0006v7-OS; Fri, 18 Mar 2022 09:01:49 +0000
Received: by outflank-mailman (input) for mailman id 291957;
 Fri, 18 Mar 2022 09:01:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nV8UW-0006v1-7z
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 09:01:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a4c4088-a69a-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 10:01:47 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-YSUruNQIPra-hfQCULz-wQ-1; Fri, 18 Mar 2022 10:01:45 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB2906.eurprd04.prod.outlook.com (2603:10a6:3:d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 09:01:43 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 09:01:43 +0000
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
X-Inumbo-ID: 0a4c4088-a69a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647594106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBvfo5w8LlWNK7POjcgvlgJfeaTqYWkwCSgRq6O1O+8=;
	b=PaJSwmJBstANqlRZZ9gV/5Zj33CIrQXaf7tmLAceKRccGUvzRAw2NWWwFMPaWNtuwhgUX4
	UV2bTtD9aRXg0TwnrO52/BABOqvrJH/in111CXiEjUWCI02qrd9czvz2u7dW/iLBrQRw69
	wARc3zTPdnV4ekAzwwDVogKSTGpisGM=
X-MC-Unique: YSUruNQIPra-hfQCULz-wQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+3wEqQvYQHfpVp3q5eCMXeUL36C9RWFjo6GE3fvuK0uhy3iLox39PGtz7uSLE6VOZ0pYKRo/OePBVCR3RpZ9xqFaMY3wFBIv4uR3+tYTRkMVAGY0r4F9d4LVi69z+0KECluiWlA9VEcnTLbJTnlLchVgyqTgQ4pBn0dlZ9HeJGOs7ejpP6abuCbsdgwiP55yhMnqg6pVuyfYXX835sBG5QD1xTtG+VEZB+DdNU9IUw435tYk1t3i3LNgtdODcups6vlwcv9MwzXiuovCPu/Zg079Kusj72L1FpNN6gHPeP/+44K0m4V5x3nDP9sjgvp8Ss5u8Q18WBQGSoD0friYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBvfo5w8LlWNK7POjcgvlgJfeaTqYWkwCSgRq6O1O+8=;
 b=Gkcx8j62jb1spSVyxGiDF3vb6rlpzMm/A9hCiBkAM5BzT2S5jws99uvUMAZO+/itQRt+/PdbFcbEmthfxkymanvGAMrhbgUqXSOAdgoDOFP47Fw1PkjNc832WF7XiJLPiuMkO+NxEl5wNKJV2DfYyqrFH3om6Mlt7nYdI9ttX/GGvOubNNuALeCXagiL4VYJxmHtkCkED6SwtXSSS6wiASRFtMvNzdpr9UFLGAE3dIKVExHdJOUlk3ZkYUcKLgJJ5blIVMHVbsq7G2jaujSpGzvpON2VYkR86ldOGBFWYbR0UjuBP5iZz9d4G4PLH+Zn1/9nDPPVnMm3iF4tXwoh8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d295f593-6a4a-7676-a104-aeaffba71f0a@suse.com>
Date: Fri, 18 Mar 2022 10:01:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Nonsensical XSM Flask denial
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <CAKf6xpvk1zX3ZtzSOWBCasZOuS607-W_iqHbC=ZgTBQqo+btjA@mail.gmail.com>
 <ab5a7aea-cab1-f9d9-e3cc-58636c234a4e@citrix.com>
 <CAKf6xpuqzJ+YE9crAJCJCCaZRZRYkZ5snsOOLP8Yjc4Nyx=9=A@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpuqzJ+YE9crAJCJCCaZRZRYkZ5snsOOLP8Yjc4Nyx=9=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d552df94-de8c-46aa-3807-08da08bdec2c
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2906:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB2906516EAEC1EA75E2442955B3139@HE1PR0402MB2906.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v3DMXwWcFlHyQk8QnznX4T7j0J/pF6LSCbaagx3z5sXomXI+7pEOsQ/DTz+pbHfMMVJu3LOS9C47g6z1g1qXVKauaVyGsG7rWWI1Ih77DXkfbmWVYdrIMXOjKTVYmdk8dp3FdqIjnsLqE2rIXNVszw3wnpODj//+P/bAx2DVw5ZSZt2Wa8JUqFPkLSGEXuFZMbeNfPhvfclB43pZK+SH8lJa+ggTj4TbYJJNGZzztfw7RNq3xfngtYHAsO9QlDVXMj/W6J/SrK6SBvEFWi9HIUIoo7qQDg+oW9XO7t/chKCZrZa1zcFaD10K1cJJzCeRYn64heZvr1zvZdzN0xnPATwS6p34+Pn0PpkI38JpXwFPG+vIjwaSN292A0GGVnQ+FuRs6+KyKQqPCF/bzvDCisg029dUFCCFtPVJZBP298yKv4+gRsx4OLjgdEih0oe2LXQyVeLHLLIN++ZLi9eZj8N9skcKHBV7sRn3t5a3vHUPVwayFUCZqrMfC5miXZAEGKkv/K3oZ8rL2zNGwr7lNsFDLij34RQFi1aYWFjLT1xOrTPCrhjL+8KGM4lWnukmR0kPZnZyQxmjxBGKNA2HfgrBpAG3qBmpuyEb6LhkZuWn4WSFBM3nM4Cvs9Hrmv3/jWGp3IgPNnSqWfe3e8QHF/YO5CbBWNktma9qdOnTpyT+tFvDcgVBUQ0pqUGEdGPJjjUxQ3UDVXjdDlDSg9XmBvqQkuS4DagD4jnxT7qXzdebgt78nV9l8UhLW5AVKQdJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(38100700002)(6512007)(6506007)(2906002)(53546011)(26005)(6486002)(508600001)(86362001)(186003)(2616005)(4326008)(8676002)(66476007)(5660300002)(3480700007)(8936002)(6916009)(316002)(54906003)(31686004)(66556008)(66946007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVhvVWZZTFlxUXo3eklrMDl2eW5xakd1NzFVT0h6K1BnL3IzUFRHNFc3TUg1?=
 =?utf-8?B?dmdTdkZldzhFNkxMMjlmd2lUUEVGdGFpVUFVT2NVQTVuaDZqZmRLUXhEZGYv?=
 =?utf-8?B?amI0L1lDMEUyYW9hSWhLa2xGNnRKbW14RUMyRmVzL3VnZGNlM1hTWFpXV0FB?=
 =?utf-8?B?NEdId1g2aW5IdURPSk8zRUVaRmpVQWxLZUp2ZEw1OSsvSEdrZEZMdVpPNU1m?=
 =?utf-8?B?V1IyNW90cnByRWQvbkxNZHNTSDhDNVNTa0RHV0FoYzZFZEZMWURnajZVcENJ?=
 =?utf-8?B?QzVWS1c0T1hEZzZ1bHM5Nk9qUkhiMGFLWWx2K1EvOUFOZjFJQllXcGtMdnMv?=
 =?utf-8?B?ZHNCVWF5UUxWVnBsQjc2K1pxb2xOV2Ewd3QwWFU5ZURIQVdVbjQxSUo5dEZC?=
 =?utf-8?B?bzhzaGRmeWoxVGlHaWQxMlI1cVloNXBqVDdFSGhWL2hPaE01emxyVjhiVE55?=
 =?utf-8?B?YmV0eGdqcE1ZZUdDTHRwMUJYSzU0MGxyVTJ3a3dIbDd3Yk8raVFaUi9GTjhG?=
 =?utf-8?B?WHhjSUthWWZ1U0NVNHlLakZjWHVIbFBqQWE4WWQ4eTZqeDl1a2Zta3plQkc5?=
 =?utf-8?B?azVBZHIzVkRvTnhJNWJNYWZWNmhtdTBVM2tVcms5VmNieGJGSittcHFEYVRX?=
 =?utf-8?B?RnVxSFcyeXhPQzBmQnc5UVlOODRSY3VDUWd0UTV2ZFdkaFA5QXh3OGV5NE9a?=
 =?utf-8?B?RUx5YlFkN21saU5TWndEMUcxTHBaM2Uvb2FTMjlZZUdCMmdOUjBLYVY1RTlw?=
 =?utf-8?B?M0VVTkFSb3pXdHdMdElYemQyRkJweWZFUEN6ajNFb0cwVDdERU1XakpTTTYy?=
 =?utf-8?B?Q3JxajM2SVhDNnB1Y3RlUjdQM1d2UEtoYkJCVHl2TzJDbWlHSEgzOExSbFN0?=
 =?utf-8?B?RFlLZkthK0xDWWc1WVY2OG80a1BtRTdqNUhlQXJKWXB5RUM1dGVXUWZvSG5C?=
 =?utf-8?B?SEpmdDZnUExwcStLNnRCSFgyM1hYOFNTY0Vkb3BWVXJuT0U4RzVVeDFza2xM?=
 =?utf-8?B?VDBxWDE5b0wwc0ZJaXAzMzJXQjJ1UElJaUh1RXNtbklDZ09McXJFT1NocEJv?=
 =?utf-8?B?Y1VCNDRQQkRxMTV2Wk1xakx5RVJHeUlxVm1JODNCdXZhRWROWFBhOVNyY3FH?=
 =?utf-8?B?Q2RGSjZnQ3hsUHVTTU1TUlB6TXorK2Q0R3c3QWo0ZTNkVkM5KzJWdVdmL1Qy?=
 =?utf-8?B?UnQ3WTJWU3laRGFFdFR4YklxZUhXcnlUc1Y3cEpBSW1aaitZdFVqVDU3T2VR?=
 =?utf-8?B?ajY5YUMrdE50MHIrcmg5OGFRcEMxZnA2cXdFb05tVTQ4L0docnlGU2xDbkV3?=
 =?utf-8?B?UTg5MFcwUGJPUGdmdk1yTXBIQVZBT1MyNG5tdXFOSXNNQlU2d2s4enVBRkJu?=
 =?utf-8?B?UVlYUTQ2ZjdpcURSaHBjekVpT01UNFBPNkFyNkx0N3FUY1JoWFpuSzNCc2Iy?=
 =?utf-8?B?TWFWSnVUUkFIRTIrZzVrbHU0VTVYd0hxMy85bGlNVlF1ditHbFFrQm5ibTV6?=
 =?utf-8?B?dmJ3ZE1kbTAzSG9VSXZzTEZEc09mWWFxTUg0bUE2VDh0QWZQNzFYSE1kUUZN?=
 =?utf-8?B?NlovRVNPZlQzcE1nM1UrUTZkemNUWEIzMmJJNy90OGxSREJxajJMbzJYTGhZ?=
 =?utf-8?B?dTBxR2taU1lLUkVhMGhtRVZwWUxGWlMrblVnT3BlUmV1d2JUdlpEQzBRR1F4?=
 =?utf-8?B?a1RjdTVYOGJwUDJ5NllQdjNvbUJybzd5VWlPWitMbGJkNHZEM3JXQTVYeFNU?=
 =?utf-8?B?TkVQVE1KY2Z5KzZtT3BDT0JtZmFnR0ozb1JMT01wZlRqNzdVSHd4NFZIWWdQ?=
 =?utf-8?B?U0F1cGk1M1ZrazJ4UmlObnRDMWtLdnVjVk55ZWFrT0dTT0xyUnZ5ejM3K1VR?=
 =?utf-8?B?UmJnWHR2S0d6R0ljTGtPYUowNjY5dU5jOFd5U3NCVlREZFFON09iL3VwTktN?=
 =?utf-8?Q?i0/IrZFsosrdT4zkREtE65I3nJNvc1XF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d552df94-de8c-46aa-3807-08da08bdec2c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 09:01:43.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUM8MsSUrFoSOaVAc4P8u7n4WzffYD8+yVxaorOjEuvux81lSXJcEaYfogVjhAduCAuquQmMpC/mVuxkwdxq4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2906

On 17.03.2022 20:02, Jason Andryuk wrote:
> On Thu, Mar 17, 2022 at 2:14 PM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>>
>> On 17/03/2022 17:52, Jason Andryuk wrote:
>>> I shut down a domU (HVM dom9 w/ Linux stubdom dom10) with a single PCI
>>> device assigned.  Xen logged the following Flask denial for a second
>>> PVH dom5 (uivm) without any PCI devices assigned.  This is Xen 4.14.4.
>>>
>>> (XEN) avc:  denied  { remove_irq } for domid=5 irq=17
>>> scontext=system_u:system_r:uivm_t
>>> tcontext=system_u:object_r:shared_irq_t tclass=resource
>>>
>>> Domain 5 as uivm_t and irq 17 as shared_irq_t both look correct.  But
>>> it doesn't make sense that uivm would make a hypercall for an irq.
>>>
>>> Could this be from RCU calling complete_domain_destroy() when current
>>> is dom5 (uivm)?  What would current be set to when RCU runs its
>>> callbacks?
>>
>> RCU runs in softirq context, so yes - (almost) any use of current would
>> be bogus.
>>
>> But I can't spot any overlap between the physdevop_unmap_pirq XSM check,
>> and complete_domain_destroy().
>>
>> Any chance you can reproduce this with a WARN() in the AVC denied path,
>> so we can see what's going on here?
> 
> The path I found reading is:
> complete_domain_destroy
>   arch_domain_destroy
>     free_domain_pirqs
>       unmap_domain_pirq
>         xsm_unmap_domain_irq

I wonder whether an XSM check makes sense here at all for a dying
domain.

Jan


