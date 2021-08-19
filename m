Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96443F1890
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 13:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168574.307787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgbj-0006zy-Iq; Thu, 19 Aug 2021 11:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168574.307787; Thu, 19 Aug 2021 11:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgbj-0006xo-FU; Thu, 19 Aug 2021 11:53:15 +0000
Received: by outflank-mailman (input) for mailman id 168574;
 Thu, 19 Aug 2021 11:53:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGgbi-0006xi-KD
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 11:53:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f2b3553-8693-4eb9-8abc-8bd53a11c5ed;
 Thu, 19 Aug 2021 11:53:13 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-5KC0vqC0PJiZdiHAZJGTNw-2; Thu, 19 Aug 2021 13:53:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3935.eurprd04.prod.outlook.com (2603:10a6:803:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Thu, 19 Aug
 2021 11:53:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 11:53:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0201.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 11:53:08 +0000
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
X-Inumbo-ID: 9f2b3553-8693-4eb9-8abc-8bd53a11c5ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629373992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NDFOGwrf/co0cRw12K7EfTghWh+uwqSNo0qfEp5rEbw=;
	b=fzRZg/zJZtGGUoCEfY7g9xVNGVPOCsBoWjyCqYAaUFkKiYzrhTthRQzAMGyx3dkpvO8XHd
	QNxLzb6ZDLvY4i1KV2nInN5f8rS/EsagJrRJp3yU/fRkA/nWi2b1qxwdVKbDqTFncdwlIn
	OTDOCGIX88WbyuuQiG7EZHrZrULNm5U=
X-MC-Unique: 5KC0vqC0PJiZdiHAZJGTNw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kl+D6HhC6+TxWjYAD9SBHnf8yD1C08DnqOfVAqOswBmKQIOY/OQlubtzEGaM0Yy3r5PGUVTMjMcCCbcCtsgI1SxqnISoua/GK14g5wfbZoSbz2sTFtXmZjRX+p5IBo6uaFvsSC/KoxHSpAEPlFI2+eRmBeJWJ+rXJ0g8aso0/d30O7EdwNGWzY/lfSsyRtLE5PT4tmt0pcibJoP8/J2x0IrAslfYoqs06ziAFuAz4npEqFwrZhYZ1RO1shmG3OFsEGT05+e40SfVKT2QtnsPBgvYrml+FksSj+oiXUcs8B69S9uuJ7UAJfhYTdPoCU9t+WRYfU6f+MqQXvYAecSd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDFOGwrf/co0cRw12K7EfTghWh+uwqSNo0qfEp5rEbw=;
 b=D25paQ8hQEX7f/qhGpXjKOULj70XF10ORfgGfqssLfZsoNOzJ8K2HBksdWaHEgYMW23ciU3hhbLEh3MsyRdHV0HfZPOmO0FiCsbN9PcqaWPT758VH2UagJklv8MyU6dI9jT/MhsUn2j1A3QtESxiPBv4CBfXW2GWINU1n2kBrEeaJwEZeuTDKsiSaL238D8T0XuC1tvzVWuBo+ch+aF0vgdiIEi8/fTZ8jz8aB/lGhOB4RSND/QlVDZEj5G4PRh+1ixtXtY5N8WIuh7NuBbLW0wZFkgAvoOwb9sGn2/FIv2ONFMRWwsqF2InJg7WHuParJkUFQqjAwCJRDQsc4dnEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
 <f69e5a2b-cd8c-3534-ab7b-427fb1fc1cdc@suse.com>
 <f0e9c8ad-dfa2-77ac-b3db-02cba59e843c@suse.com>
 <347edc1f-a104-1bc3-0cb2-2cfffcb6214a@suse.com>
 <a9fbd7c1-1675-50ae-6106-8a8625643930@suse.com>
Message-ID: <6d8b3104-f7e6-494c-30e1-1c06419fbfb0@suse.com>
Date: Thu, 19 Aug 2021 13:53:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a9fbd7c1-1675-50ae-6106-8a8625643930@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0201.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acb69187-2ead-4a8e-6426-08d96307e9ec
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3935:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3935A83C36730C1518227608B3C09@VI1PR0402MB3935.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jORyekUacPGcU8jnw+QH0HIJmvvyShAjDd/6wKr3V2iiZIFPJDmPbkl4Om2Pn+ttJ43Lr5N4fJN8XMZ3JSTpe76dVnlJN0hihxB96FVRl/tJVsgBI1fr4GIP7rADh6wXEEmBzbbe63Z9tpl1Jw5UVxj5aGPu8JNi95q7p6yZZyh9+KX28UHXB1vFRWIaxNz0MyGfwMwhPj027VE+B+gXBiXrUByAU9bNWwtLLlEVsZW7Lh49zQdiUe9DxnDAqghfamliIzPN38D8fxa5plXZJSbSTa6ojCJsP/EucrNv3yutwiYNg4NNNqVfp9QAkC4dbV8rkYX+k6XphOZwM594jYZiiE5pf8f80Bbn/KvfAuOHKph5yomQLhhaO6Q6vTvIUWWloyfi2kCkofrYpWVv2pqWIJm7e1C9Np27WiDM+ZOwdkhrg+/fhIWxRPTDRjwCiFkrN9kIAxuDjbenY5zUKrXuCo52nZVNwBtJ5JQcjpj+gAKe8Mtron2ZKQqV55mJQ1aBkEWahRfHXz8f0p+w9Mqz9e9M5Gfb2rF/MHvZByBIsg+AgKv9o8wvyvJUosLoe6qSGSj0Kmd1KTEbRfjMBhE2BhWG3p6emjXQOE5bfcnRaATm7QsylzgBU4UzEpHkN0KkHLX7Pj0Oe7eAq9oNz4rDfCkwNHifohLd9q7Vx6efCmEyglScat6ZUIBD9/iqYy3KwGiK4ISEF+5TBkcdKfgRTtapMkpEEiRy9esstwKuUfLR2UY6/97qBA1c4ArvdmxSDJXYwzR4mO2wagJykw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(39860400002)(376002)(136003)(366004)(478600001)(956004)(37006003)(66556008)(16576012)(2616005)(31686004)(54906003)(4326008)(6636002)(316002)(66476007)(6862004)(66946007)(31696002)(36756003)(8936002)(6486002)(2906002)(8676002)(5660300002)(186003)(38100700002)(53546011)(26005)(86362001)(83380400001)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODJWVm05eE53THhkSG9OVnBDTjEycngzNWJtWG9VUlNFYlljSXAveER3b0tj?=
 =?utf-8?B?Mnl1aWQ0bEd1R0o4R3NtMEZ1QTZCYitSM1FDekhEMEhoMWlJUjE3b2JkYXBh?=
 =?utf-8?B?Q2RIRFYyK1o1alR5V09GZkVFS2lTOGtubEMzbUMvSCtUQmZXNVo3eXg5NFFY?=
 =?utf-8?B?RHZhREk0WTYxbHhXcUVmN2IvZ0dSYURPeXBoZ1ZyVEt6VWRpcytWdjdNUnpq?=
 =?utf-8?B?ZU1mUEd5K09Xd2RJRWZINmh0eWhhQkxERHB6M29oT0JIdzF2N1BudFBHaTZu?=
 =?utf-8?B?YmhXRGRDekxEZThPaVZTcURBSERheHk2Rml0V2tyRUdYMmlyOEg0UzRBUDBV?=
 =?utf-8?B?RmZhbkhyVDc2SlFjV0kvTm5PS3dUTzNxTERuY2tjVnJkZGlMZ081QnVHTHZG?=
 =?utf-8?B?aDlnamVRQkdXc2J6QkpEQWJqalB2WjVzRzZpeW40djVhdmNyTHpzZnJXbVpR?=
 =?utf-8?B?T2ZBUkpySCtia2lyZHJxbmtEYnIrdk9MSXh1cnczWHREM0RsMDJ4d3lrT0dk?=
 =?utf-8?B?T0lWaVEzNURXNSt2NDFuQXJHL2w3UFZQTzBZd3hTRi8raEU3MGZXMnVsbFA3?=
 =?utf-8?B?L2dMWTFVSHpPYU40VUcxL1cyUE5ieGtmVWFPZE1PTlZENFdreHQxd3lkUi81?=
 =?utf-8?B?MWNyczFzRXhocnl5MTJROEx2d3F5T01vV1FQcnRFN29WZlJ1RktYZHRKZFd6?=
 =?utf-8?B?VEJQZjhzUXhxNnI2MW4zM0FTOS9XVXdLZllESWxSQ0VlekdGUEdKK2pLZEtF?=
 =?utf-8?B?TWM1TUlSUE1uVVFVMWswNGpnTHFaR2NaWHkrMlNpbGY5eDdjRjVGUDN6dG9Y?=
 =?utf-8?B?WGlHVDF3bnVpVS9WTHpJVG4zVkpiMTZ3NW8zcm5lNGQxU3JkY0ZDSUJ5OVND?=
 =?utf-8?B?bk8xL1kyVGNHblkvU29JT1VQc3hiOUJTOC81Q1Y4MDVic2xMT1JMWG9TM2pC?=
 =?utf-8?B?LzhkUzNXOVFYWlBqVkNaNys1Qmwwb25ndG10NHdHaElVNjZjQmxGc2MrODVJ?=
 =?utf-8?B?Y0pOR29tNTFWcmpCalBmUnFzb0RDcWN1VnQ2TTFDeFVvd0tXUytnME1Oci8x?=
 =?utf-8?B?Tlc3UTB0Z3hPMzhOeTdzN2VXTk9FTHR4K2Y0LzVlSEo3Z0Y3aGplY0FpRHdN?=
 =?utf-8?B?TWdkSkxVeEk1azgraWVnWEFOUE5jWVI1bm5SY0UvWXI0c3grLytTYmdCY1h3?=
 =?utf-8?B?bDh4bFNGNWFuMDlyZ2x0SHRXSm1kbUs2Uk1xZWcyWmhVSkFYa2NUa2lOMmVs?=
 =?utf-8?B?QUQ2RWt2dEUrL2I0SzJtd25leWg3cWVCaGVISHBvcHJraWE3QlU0NmppZUh1?=
 =?utf-8?B?YWZzNWw1U0R1Q09xUUdhMDdhL21LVjJzam9rOGY3Y1hiQS8xMVRhMi80SkpO?=
 =?utf-8?B?QjF5TWd5aVp4OWFuZk9kVkJzb2dRT3NuSnQwcnFUY1MwL2paaHBJNlRtajZB?=
 =?utf-8?B?WVN4U2MySWV3U1EzRWlJcEJ6S0FFMGUzT09yaFNrMUducm01QjFzZGFLM21M?=
 =?utf-8?B?U3loQ1JxTDJMTG16dEoxVWE3ZnVuQVFaazVFMktwK1E2aXMzQWVMamhPbXVP?=
 =?utf-8?B?c3FpSndIeC85QTFMU25GcjVYS1JCbUhDOTMvRXRuclNWRTdYNU1DRDYvQ285?=
 =?utf-8?B?SUV5Y0g4OENpUEhsNnQzR1ZkTkVaOVhjRXh0QlEwTVV6eHhDSWdjZEQ0SkxY?=
 =?utf-8?B?ekdIL2d6NGZLSEdGU2UyM3hxR09GSitWVGZ4N204QTFpYWNIV0ppVithRmo4?=
 =?utf-8?Q?y5y5tvT7t3qHX7j2vc9FNz9F6lZmVvfxddR/8iD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb69187-2ead-4a8e-6426-08d96307e9ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 11:53:09.1229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tYXir6VsFVYBLWtGzH418BjAtbVxKo4+uAntwWgseE2a14LOmPj81H1oOG6ikm8ssLtGQ5CHgXMfsfuGbnlsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3935

On 19.08.2021 13:51, Jan Beulich wrote:
> On 19.08.2021 13:25, Juergen Gross wrote:
>> On 19.08.21 13:06, Jan Beulich wrote:
>>> On 19.08.2021 12:20, Juergen Gross wrote:
>>>> On 05.07.21 17:13, Jan Beulich wrote:
>>>>> In send_memory_live() the precise value the dirty_count struct field
>>>>> gets initialized to doesn't matter much (apart from the triggering of
>>>>> the log message in send_dirty_pages(), see below), but it is important
>>>>> that it not be zero on the first iteration (or else send_dirty_pages()
>>>>> won't get called at all). Saturate the initializer value at the maximum
>>>>> value the field can hold.
>>>>>
>>>>> While there also initialize struct precopy_stats' respective field to a
>>>>> more sane value: We don't really know how many dirty pages there are at
>>>>> that point.
>>>>>
>>>>> In suspend_and_send_dirty() and verify_frames() the local variables
>>>>> don't need initializing at all, as they're only an output from the
>>>>> hypercall which gets invoked first thing.
>>>>>
>>>>> In send_checkpoint_dirty_pfn_list() the local variable can be dropped
>>>>> altogether: It's optional to xc_logdirty_control() and not used anywhere
>>>>> else.
>>>>>
>>>>> Note that in case the clipping actually takes effect, the "Bitmap
>>>>> contained more entries than expected..." log message will trigger. This
>>>>> being just an informational message, I don't think this is overly
>>>>> concerning.
>>>>
>>>> Is there any real reason why the width of the stats fields can't be
>>>> expanded to avoid clipping? This could avoid the need to set the
>>>> initial value to -1, which seems one of the more controversial changes.
>>>
>>> While not impossible, it comes with a price tag, as we'd either need
>>> to decouple xc_shadow_op_stats_t from struct xen_domctl_shadow_op_stats
>>> or alter the underlying domctl. Neither of which looked either
>>
>> I was thinking about the domctl.
>>
>> Apart of struct xen_sysctl_page_offline_op this seems to be the only
>> left domctl/sysctl structure limiting guest or host size to values
>> being relevant. Changing those would be a sensible thing to do IMO.
> 
> Yet in the context of v1 of this series, which included "x86/paging:
> deal with log-dirty stats overflow" (now commit 17e91570c5a4) we
> settled on these fields not needing widening. This doesn't prevent
> us doing what you suggest, but it would look pretty odd to me at
> least.

And - just to make it very explicit - even if I went this route to
address a controversial point, I'd still like to understand the
reason for the original objection - if only for my own education.

Jan


