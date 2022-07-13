Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B857316E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 10:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366297.597026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBY0Z-0000LK-3s; Wed, 13 Jul 2022 08:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366297.597026; Wed, 13 Jul 2022 08:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBY0Z-0000JQ-0o; Wed, 13 Jul 2022 08:46:11 +0000
Received: by outflank-mailman (input) for mailman id 366297;
 Wed, 13 Jul 2022 08:46:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBY0X-0000JK-Gb
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 08:46:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60071.outbound.protection.outlook.com [40.107.6.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c5728c9-0288-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 10:46:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5169.eurprd04.prod.outlook.com (2603:10a6:208:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 08:46:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 08:46:05 +0000
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
X-Inumbo-ID: 3c5728c9-0288-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVBuePYyv8aocHnaBwGsWuGh5RrJ/ZoMf5XmHTrvLkaJ2T7JQfa2odrDQ+i+tO9+GrLS3GvcaNGfrJ6Z0bq6TnvozUHHGYfceYFyR20sgSpI01RDlBnpzDIminlT9frRK2Ju1wYIM7WfLQoDC5QeR1EkPn4BmEprLnfr2CF608Y11EwkMtgfaTpj5PNud141KV3ZfMH43eYRWgmi7dPsvSIL9xcUF23NL1BwMLddLk3OuT5JhRTqVki/P5ZspOJYMJvhkGaHO4iliWRNQVr8CAGsLaYOdlsDzCKsHKIAGE5GoUS7hIP+KcLgvLLpUMh8RmRkL1KSU2iLs8ELQfc40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Rn3jlhiy3YGmRIPv/ywRR1F7r6dFOFb592jJ/QvfwQ=;
 b=CNzdvTYiESVrvy4GNJFpQV35BUK4NKTAfEqG4cY1n+lqO6u7x70Rqn43N8pXe8p+HQrL+ImgBnN7wwj874E7zAm03mVw/5MWh15+gwpKWnb9fePsE3SokDVQhCJY4TMuZAq5xcK7VNQR3Clj69fMEkU9pFOoG3qcw/Gut4bF+QlH1lctCy+0cr11scVrjm/FEy9bRjuySezkm+RnbEbnuX9NvX+TeSnmShReEyQpX8Az8uQjDn6mvLokayncdQabY7lUxIeR3kZIfcZMmvdihNSj0+NCvsbbUkMLHLKLVqxZ2bLwvCOZY4H2XIXTAX800Vb2lMekOl0N71gDgliKBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Rn3jlhiy3YGmRIPv/ywRR1F7r6dFOFb592jJ/QvfwQ=;
 b=ua5Urw8/yYFZatsbZ3X62En6Eu47DZxYL7I9B5+Q+Tsafp+hmbE/C1s0ghE+k8xwzgOzQrHGuU0C/iNL9uHMet07Kd3QMRhr6pe92kvzkoqaCeFJzfAyXxC3Z+iT5xws3tUVfQd8q/jz6N9kIKkdhEYzYIyrCoDiF++R7UpytesMZ5rkcKprsVLdFk2FThy8bTT2zloyBHAhgc4YdLrCRunQVLLu53xeah2Bl4kLaHsCsEZOXRDJ8J3plZCRAJr3fHGPu04qUzb6I62+Sbpu9HP1snFV+/fJCZVd0PadZmOKv7pZzi21Q07h6ZZkcJ6y9r6mExVSl/LTCo6ITtEdwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c979e069-bd2b-ae8e-8bff-79e5929f7227@suse.com>
Date: Wed, 13 Jul 2022 10:46:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/9] xen/x86: introduce a helper to update memory
 hotplug end
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-2-wei.chen@arm.com>
 <115e36f9-fb73-9692-a6c6-35ad683805bd@suse.com>
 <PAXPR08MB74209F2975388E5A181C12B09E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74209F2975388E5A181C12B09E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0062.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::39) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ded3ab07-8e39-4800-c2fa-08da64ac1f47
X-MS-TrafficTypeDiagnostic: AM0PR04MB5169:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tZC/m1a4ZruhIEBi06ZdwRvVhQF4fsrzrzk2E8x0N+I6Kmw7wqrsWtc0vU40KbTdVkmNH8h1PGfYzwfxWOQcS3PK9Bs8zjT8AHnGn9eJrXO+mSZlyVRw5bJWoXWMUI4KLlp+SEndMxJ6msDqOMnttGJM9ui/fOaBSuPasvRsOCX3Z+YTKFsu9RG1W1u5Jta91KXy3MF0ty7Ttb2lBBlpZxW0jL80J2O6irTwfbv1lxzXAOxW41G2fiXpYkSObrPgCQKJZNFyDyW34efO/ppcm+W0qWh0Exw/b1bSyKOWjh6keEnXt+4HBSOCkRlvGfiYPWmwxhW+2vqt0bewrFsAbonVoCo8zYA6tSv5UPXhC5WskMMETz9+dtPKd8UU17U4Hv83FcwJBelsjNChK5xLKZ6+Y8fCS8Fo7RUENNzqBCB+Eg3/4GqXXUgShOfd/zztKl+HDgXO1gwt1Pc1iBPg/F5Y6sujZJzi3BUZwgt8akm9Row9OR+MWNdueMNm4XXmsleBfd8e2kUlyRoYQR2Xo9wDpyxQzrzrx9MpEcQSeohwEqCRMgD4wYolQsARWsoKJnDMS72eT+0wHNGLKnHiLwZlFx0xPGChsXgM40VyrIXjhokqDYO/LPYZl8aWw80Cy3qZjW+bq7WMJ1v+w4wh1/CQaOwiqAdUACJvi+oWKrxQMgTPTDe855mq5EFH9soRzDAY76QOzTSRsXGenROAZCcYGqtr86Vxi26ftB1FrUCiv+DZCcOxHco8zBB9Ff0i3gi5lmJb85g4e3qqQtSQoYY6uZgyu93u3S0Abe6vxsnGE9AiUEuZyKYn8qpqgzq31+I0272WgbAQtzyhLg/H038m0Z0U5l8GMyIIGYlWTQ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(366004)(136003)(376002)(396003)(6666004)(53546011)(478600001)(8936002)(6512007)(31696002)(2906002)(6486002)(54906003)(6862004)(41300700001)(2616005)(15650500001)(6506007)(86362001)(26005)(83380400001)(38100700002)(316002)(186003)(5660300002)(66556008)(4326008)(8676002)(36756003)(66476007)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk5BTS94UVpDK2c3YWZrcDlQQmY5RzVwdUJKRnRDRU8rWTRkbWYxby93aEV1?=
 =?utf-8?B?YTkwVjVJOXRKM2x4Y3Izd3pvZ040QVlGVXJUeW93TlVQSDRqSHVMOUFVZkFi?=
 =?utf-8?B?VHl4dlZXb2Nwc3Q5dkplTUF2QVBEbStsN3E4RmVHYm5oUERXUzFQWnorWVk3?=
 =?utf-8?B?TmdGTGhicGhuL25YeTVTSy9FYktqZTQ5L203U3BmUDR1dk41a09JMUpERmdi?=
 =?utf-8?B?WjlWa01ZWWhqS04wbmpIYnJod1dJMW52VGc1bFh1WURvVE5HWnhYT2ZsTGNz?=
 =?utf-8?B?SFl5YXBaOSt5L3BQc2gyaXprbndZRWZTZVcreW9wam9ZbW4rZ3VxaTd2WTdU?=
 =?utf-8?B?QWJpVVhaZXBzanBlVDBGWExWY2lvSGkwQ3FXZGN2c1dmRVJLV1REM3FnaFFS?=
 =?utf-8?B?Tnh4V1JDSHY3U2pBV3A0MzRoOEdkNXIwMmxkbVcwNnhrZHlXVVBtK2N2YmQv?=
 =?utf-8?B?SkFSeEJzS0UraTEwRjFEVzY5UEkzTUpMWXQrSGtocWV3T3JaWGVBQjFNZCtx?=
 =?utf-8?B?MHRtK0ZRaHFxQWt0M01tM3p6aFdqa0N1bU9ZQi9GellBMHM2a3ZCdHJ0TGVn?=
 =?utf-8?B?dUJJT3J3Wk9Ic2ZEM1B4Nk5lNkN2dzRKOWRlSEFlSXc4UXIvL2E1bGdTcVRD?=
 =?utf-8?B?OHkrdmh6R1M5d1l2SkNJRUxndFdCYXJWZ1BrdW9xcVNvUnVQYzFnQmxXNm5n?=
 =?utf-8?B?SEgxeWdQdTJiNVhBWnU2OTNSV2h1YUV2alhOUXI3cWZKN3lVNjdhS1BwbVVZ?=
 =?utf-8?B?NzBTVXZhSzN4UlUxb0NMWkRIUmZBRVRxQlZ2Q09uTkR4Y1lXM0VqZnorbk9y?=
 =?utf-8?B?bVAyVzBSckF6bmN5dDBET3AzMEExcWFHYnJmUERhdDJ4bU1nUXNJTml4Tkwz?=
 =?utf-8?B?QjBuNHp5c2VPcmZJTkhTdDJHRC9GdlRITE0ydStGS0loTnZJRWg5a2x1VzRh?=
 =?utf-8?B?UHNxaDg4WG9hRllSOGlQUUdQbHFtL1BQT2JnNmplNUFVRXozdHFMNllQM1l5?=
 =?utf-8?B?KzNvSGpTcDZoemVxeGJTM2VxZkw4a3pMMmlpbTdCd0dmeXNySFJhT3NvanBo?=
 =?utf-8?B?OU94Z3ZTRzFRbks3V002VnQ4VXhUaHNRdW5XbzNORlVlUDcyYkNablhkaFQ3?=
 =?utf-8?B?cW51bTB2dEZ1eitaMkFNalhyaEt5M2tvaTIrbmJ4RExlZ0pNTy9BcnFIc2RE?=
 =?utf-8?B?NkZmdUh5Q2NEc0ZTMTRlamNxRUd5Nkt1Vi9abkRvZkEzM2ZsRDlqcHlTM29t?=
 =?utf-8?B?eVFGcUQ1Z2xHKzNLMU1OWlcxNFl3VVVzbnZ2UFNVTmwvOThudGZnek5LeVV6?=
 =?utf-8?B?bmdKRDRQVlVtNXJudTRUY3JvTzRuRkhxRDR6L1BKWUU5NXRyVjh0U0VTMEZC?=
 =?utf-8?B?RkJPODNXd2xQOUlGZFFLWEIyZVJQamRmSVFmeW5DM3dxbklwWXcwTUJjOFU3?=
 =?utf-8?B?dUV2ZGZTVXRsN0FnN1RRSk1vS01VV0NtUWFqdnFTWVJnNnpWZXk4c1lzS3pO?=
 =?utf-8?B?NmRHTXpqZ3dTYkRQV28wTWpuQnVNRG1BYTM4ZU5UeDlnbHluVS93aTBKd1RK?=
 =?utf-8?B?MXRjU29mMmNLUmEyT0RXQ2hHSUZZcHpTWVEzdWR4cTh4T2dHM3pnNkhyYnJo?=
 =?utf-8?B?NUh3SXc3L1VMaVcyVUpDblBsc1V6blBTa3VuZHlpTFhFb1UwMmVEa2Jpb1JF?=
 =?utf-8?B?VkQyTHFIYWk1TEY2ZTkvd21BaHFNVFhtM20yTmJJS2laWEROdWFVWnJmTWU3?=
 =?utf-8?B?bm83RkZxR0RPbXBQT2s4RDM3WFpDY1kzZHhtQkNJbFZ2VGdBSXkvdm5POGMr?=
 =?utf-8?B?dFZsL0hxcWVPbXRWMVF1WkZWZUVabTVVWmMwVUhmWmpNYkFtem9SWWVuTEhO?=
 =?utf-8?B?YUJVTDVjY1BzcVBsUE93NDBjbzFhKzdTeWdFV1huUS81bjVwd3ZnYWlnWmhH?=
 =?utf-8?B?a0RMcWVGckNKN3VBWDVoMjM3Q1d6S1JpTkFERWJKQ1pvdktRRXZ4MXR6RTdi?=
 =?utf-8?B?dXhVS0dodDJtdjZ1L215R3R4Mm5aZE9HbDZtUDJDQTdyMmRwZzlnTmtyY2ZM?=
 =?utf-8?B?SVAvU2ZCOFY1RnpuZE1uY1RKUVVRMTEwRWx4WGlPKzArL000b0RteEFrM2p2?=
 =?utf-8?Q?EJ2uK0LtmQbBEGnXkunlbMgQS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded3ab07-8e39-4800-c2fa-08da64ac1f47
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 08:46:04.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjgsL3Nrx0wJCiRyj1fqdBVNnxnqSDfFN7UyA3DgU/Oks3SBNF/N7NHCJqYxeHwqzNc4IsCUDMhOPrQpx18xtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5169

On 13.07.2022 10:22, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年7月12日 19:54
>>
>> On 08.07.2022 16:54, Wei Chen wrote:
>>> x86 provides a mem_hotplug variable to maintain the memory hotplug
>>> end address. We want to move some codes from x86 to common, so that
>>> it can be reused by other architectures. But not all architectures
>>> have supported memory hotplug. So in this patch, we introduce this
>>> helper to replace mem_hotplug direct access in these codes. This
>>> will give the ability of stubbing this helper to those architectures
>>> without memory hotplug support.
>>
>> What remains unclear to me is why Arm can't simply gain the necessary
>> variable. Sooner or later you'll want to support hotplug there anyway,
> 
> I am not sure my limited memory hotplug knowledge can answer your question
> or not. As memory hotplug depends on hardware and firmware support. Now
> for Arm, we only have ACPI firmware that can notify OS through GED event
> (not very sure). But ACPI and device tree couldn't be enabled at the same
> time from OS booting. In device tree based NUMA, we will enable device
> tree, ACPI service will not be initialized, that means we can not get
> notification of memory hotplug events from ACPI firmware. 
> 
> Of course, adding GED device nodes to the device tree, and getting these
> events through GED interrupts should not be a big technical problem. But
> there may be other reasons, and no one is planning to add memory hotplug
> support to the device tree (perhaps need an ACPI-like specification or a
> firmware abstraction interface). So if we want to implement Xen Arm memory
> hotplug, it should also start from ACPI. So currently even if we gain the
> variable in Arm, it will not be used. Device tree does not have property
> to indicate a memory block can be hotplug or not.

But ACPI is possible to be enabled for Arm64, and hence hotplug could be
made work that way. Therefore I view the variable as potentially useful
on Arm as well, and hence introducing the variable might be less trouble
than introducing the per-arch helper.

>> I suppose. Mechanically the change is fine. Albeit maybe "top" instead
>> of "boundary", and maybe also pass "node" even if x86 doesn't need it?
>>
> 
> Sorry, I am not very clear about these comments:
> It makes sense to use mem_hotplug_update_top instead
> of mem_hotplug_update_boundary. But how can I understand pass "node"?
> did you mean mem_hotplug_update_top(node, end)? But mem_hotplug is
> a global top for memory hotplug ranges. I don't think pass "node"
> to this function can be useful.

Please separate "current implementation" from "abstract model". In the
latter it would seem quite reasonable to me to have per-node upper
bounds (or even per-node ranges). Therefore adding node (and, on top
of what I did suggest before, region start) to the parameters of the
new per-arch hook would seem a good move to me, even if at present
only / at most the "end" parameter would actually be used.

Jan

