Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732D155B8B0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 10:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356321.584468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5kLB-0000pn-WD; Mon, 27 Jun 2022 08:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356321.584468; Mon, 27 Jun 2022 08:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5kLB-0000mp-Si; Mon, 27 Jun 2022 08:43:29 +0000
Received: by outflank-mailman (input) for mailman id 356321;
 Mon, 27 Jun 2022 08:43:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5kLA-0000mj-HT
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 08:43:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 368aefd0-f5f5-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 10:43:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 08:43:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 08:43:25 +0000
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
X-Inumbo-ID: 368aefd0-f5f5-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMKRNfRyzcLFeIu1Z6zKhd7ihaT/py2b/8yHi1CDwzJ9XlyhdTjxlNkJc633C/Nap9veWYr9Mab1mTNUhYUoVJnidoLnHMUDiX6sL/Bf15CC00vuuUSqu1O701GSnCmqwzTaKXW2jVMESBhdanj6IrsUnLLX2O7XPrUoLr+4WFZENYYoRt0DYQGp7gtuovDpijrhf/5jWXNTvLEBpXdbLjAdpr0YHrQXshREhSr0QhfS4FZB37u7kPCgQXGfNctUt0W1n9pALjizJjck5elTh/byQWJxnG+IK0FMJ5imwSCNdikAAkRAUgQ9EPW+ZoVG/qcadPOd+WMd8U+OF8zqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfltGx2auh8LrZ8MpCLr3L09480H6JeUQ4eexV7wzwM=;
 b=VIv+AKenQ9gWo5mTqXJ8WAl71TKxyZ6ERrvaLualXRfDOOnaPusKZuXtIVm1l5PeJOd4EvY30Tt8cJpvukZ6qNk0XsA1br3C8085YQUXz8QLMU0xGQlGedaRNPqKNWwItwoZZ9nvHOdEisRTYx7/u23nUgUoyaOUfnuO3bso2JyRG1HgVGptvNHVsYiLN+ts3lNb27YEr52PTAap9SMLlo0fM5IdCLHW9j8UGJwcUtvLdnAgxUyjKRgW3tSLXImzKrYTemDY9u5RnddN/x7J2F6j114YjX91JL1YsmkTeOfpabJDXXzYuCYZqlozL9I3FQ7KPPSQBnR747jQKsLRJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfltGx2auh8LrZ8MpCLr3L09480H6JeUQ4eexV7wzwM=;
 b=FVao5dCME0nykdWIsXPteku3vtfYgfiSXwezSlMJxKmg7l2h3ZJmTif9Hb0zBCAdxq27H4y3hBP21VBw5chtBXAq4wyQ0Lbq3BuVjJ/LiCIgA0Br0zsD8GvNkT/ep/YZ0lKBVPOk2UvQZ+kqrBtvMcRdWERECgVINwvvIfmg7Ypv4Sr9n2CPCR9itV8zqTM5HRwKHvPu28nsd0aNqhxNP7+L5YCui3MmGA16OXrUWnaBIjq50Nw4lHAZAYdvnTSNjbU5FDjW58nfk96u+2PrU6OlRPrWnL5E0m1RiuNCXfwBLKZvo3kaUkNwB+0OrMp7hP8I55kkDIPRNZMTnE7fww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5e958aa-a616-115e-29e2-fe410b708583@suse.com>
Date: Mon, 27 Jun 2022 10:43:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] xen/common: vm_event: Fix MISRA C 2012 Rule 8.7
 violation
Content-Language: en-US
To: xenia <burzalodowa@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20220626211131.678995-1-burzalodowa@gmail.com>
 <20220626211131.678995-3-burzalodowa@gmail.com>
 <61094b37-4075-e362-7fc6-ce28f965bb05@suse.com>
 <cb50eba7-bbc5-3100-2be3-98587766c240@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cb50eba7-bbc5-3100-2be3-98587766c240@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0041.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcc39205-00ee-4d56-c542-08da5819195d
X-MS-TrafficTypeDiagnostic: AM9PR04MB8081:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ff0gDulTQg2S4FbinbhlgIkOgRPzWD/9nwOEjhFA9bzZG3Sl/mE53+/PzO4+rShZvAuuWhx3yuzWnntQLWS8S84ESH1D2qKqHQFUuuX28DbayTzAQiIzEAhTmHAF3dKbzRvj7/f2C3Ej+w9Nc79Tq0NXdKiFJLnbJKcETborYswMh/2rzVktVHh+8IHZOR+PW1ZyTb+dcBEvAzr+ROIN8DlpiOXnSwE9qSjSmkmANqjeRjFH1SHZElBVHVDvPhaiJ3i8v98GqmS1XCHxxP7LelIEXuqnXC+qABgtpD9eA9obiKOMjZkv9jlrU1mFrXowMLoA5qdGOiORYt6iDX3DQdCsMsx4b6wm2vhzJ8h+w2PpYJ+6st27RNnn4NydJq7Kt2/Rqz9kF4FGUSRwofWAvQHt3hJGlkI5oX2cy4zmTate6VtT0PIG1AbpGnVtEr8RTzBI1ufJt6yOpezVEjsGhCCA5B3PwE3My9ZNFptK++WrcYdCCzF3qOHIY1EaiVtWpQnBHI59trBkkmZJEVsm/xkLFTHrLMKUIDOPHeAovCHbQOv80KAcj12qBZJPkMgcDtwy4TubLQBlrFkRiAO+6skqfRyz+Co0GtCZCNcdkisr2EiwE95bWLU3xESb8MBgD60VJEFNkvu5vfaeWLfg1CbFHchfIdZyFdaQFpNvr90lh+IsAslKyY8gFgJaxJTk/P32taAGL/nLTkbqyXfC9KNNFksfT/f+cFBl6P9tDl3xu1CfW5CY+lo81pYYI0RAVeFRZxDiIm1NeCKs9KsYA0+tY0k+C5KPzlCA0E6kU39NSKqLr7txteWshw2nTPTe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(39860400002)(346002)(396003)(376002)(38100700002)(316002)(6486002)(86362001)(8676002)(6512007)(4326008)(66476007)(6506007)(31696002)(53546011)(6916009)(478600001)(66946007)(66556008)(26005)(2906002)(5660300002)(41300700001)(54906003)(36756003)(186003)(2616005)(8936002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmpKOFdwT2JSS082c0U0VWxxWGMvS2cxallGbCtxV3gvVzI3WmxuWmFvQ2h1?=
 =?utf-8?B?RkZ4eVZQN2grMmQrUjlTcnFsSmE3a2dUclVkb2R3bEpNUjJwdGVVRHRhWWkx?=
 =?utf-8?B?SThXOEEvb0ZrOVlMVWJyZDRtYTJJVmkvOU5RY2x5SkZSZmZMZmpCNG9WTFha?=
 =?utf-8?B?V081Q2dDZWRGRGxMeG1GMlJWSnFTbkpJUUcwRWhSNWptVVYzRks4aDdvZlpB?=
 =?utf-8?B?T3NobVRkS0ZJdTZncS9wQlo0YkpVbUZEMkw5V1Btd05lY3F2NXZ5dG42aWow?=
 =?utf-8?B?dSt5Y0tsZGdseFNhbHQ5dXFSU054MFpCZ3lqbzFqb0Exb0hrMWdlbS9NKzUx?=
 =?utf-8?B?UEJLZ1dxWUJkaGhzMG1LNExVVjl0cXFuM1l1TENNd0RTZDh1QzhUQWhudlUy?=
 =?utf-8?B?eE5yRDB5S1AxWC8wYjVGcXdqYUUyY2hVbXRGTStrMTdCTFhobi9uQXZ6TXdm?=
 =?utf-8?B?dy9SbnJYODc4WlhkNURta3FRYjg1Q21ORU5wNmpXYlJSbGM3dGNzZld6SWxD?=
 =?utf-8?B?aVNuNnBjR3ZzKys1NUZsRE4wVEhmcTdObTZZUndTUzVnTXdXODZXbXpmY0dO?=
 =?utf-8?B?eUhSR3JYOW82L3VmN2tWN3IrKzBydm9aUFpCazhmZzFibWJ0SXdEMlEvZmZS?=
 =?utf-8?B?a2VuaUQxUFBjZi96NmowY3JyVzd4RmdJVWpBRDd1UjF1K2tTR3FGZi9jS09z?=
 =?utf-8?B?V2dLVkNrLzlJSEF5eGVJcGRQNi8zazZCTGR4STJkWU9uTzRIcmkvMXcvanU5?=
 =?utf-8?B?QzRjUSt3dVhrcHpOc1hBemdqa0p1VGFYeTNXdUpDVUJrZnp5YU9oWjVxRGtN?=
 =?utf-8?B?M2RTYzR1UENrSTFja2pBY3k0OTlUU1pIWUVFNm5UazNJMEp3WktmYnprQXg5?=
 =?utf-8?B?ZUpJdU8yV0Y1dHR0eVYzTTR0eDgyZlNQRWEyRGFmVGJaeG9kdEFabHJyZE9T?=
 =?utf-8?B?ZkNpUHNjaHpzVjhDOVIrTVpaVk81Y2Z4eFB3MGlpOE5sQitjdXhSUmtWelkw?=
 =?utf-8?B?TmdabDNOUHdXeWNlQTBYeHZqR3k5TTZBbVptZnN0dTZ4Szk4cUhNZURTcnZQ?=
 =?utf-8?B?L1RmS2lsRjh3Q3VBaHo0TExhMnc0MWhZc05OM0NtM2VSWlUyczYxTXRTT05m?=
 =?utf-8?B?OWFSUE1sTHh3cUVPQ1dZNlJ1Vk5HVHg2UHptS09JQkdON1d2c0t1TC9vSlh4?=
 =?utf-8?B?ZWlsRy9xQ1lHcnJYUFF2Q3gvU2hIdm1ESTBiMGw1aVlSenZ5Wno0VjkrR0RI?=
 =?utf-8?B?TlV5b2RXanQvNG1PdnBiR2l5bEFBMUlicEZTYjVNaDlYdnZJTXgrbVJjT0VO?=
 =?utf-8?B?WEhYZkUxYi9TYWJabW93NXdrV0Fpbzdkbjd0ejVUZXRENStTL1BlVzBKcXJj?=
 =?utf-8?B?bERYSGtEdENhK0o4K2xlbENYWDQ4YVhteSswTHRMRkVaWWxRUDMyaEVIaGhr?=
 =?utf-8?B?ZVVhV0psRW43dFl5eDB6S2tyOW92K0VvMGpjN1VOakNHNVhvenJ1SEFUN0E4?=
 =?utf-8?B?SU1GU05IK2gra0F4M0NLZGVpMVExbWNhZ24xdU0xUWpLN0tEZWIxTVVVbzgz?=
 =?utf-8?B?bjA2Y1JsaHIySUhrM2loYm1yNk5VcjY2RG1JUkFSZTBBbGJlZjVBMldUNUo0?=
 =?utf-8?B?ek5qWDN2Z0ZuMndFQm5qWHI3UEpHU2h4bktrNGQ3MUNjb2w2ODR3NnZJTFZi?=
 =?utf-8?B?UlQzS2tnbGVPVysxajFqSEZjejZBYWpWVlE0TkpLS1Rnaml6L1hLQWNGZVBT?=
 =?utf-8?B?NStwdHJ3LzNIUXEzT1hFbmdwS3lmYjhJT2VPUmhKeUY4dEdLdklZRzRseU9C?=
 =?utf-8?B?YThFZWxqR0IyQ2dMSjdIaGgyd1cwMC94a1RoWURBb20rbjQrbVFJbFBpYlhh?=
 =?utf-8?B?VUdXbEt2R2VXc3ZEQ0U3UURwNE1nb05tTWhCVUxROG5vcmJXU3JBKzdFUGo1?=
 =?utf-8?B?bWxIOFhlQjgrTmM1ZVB5YVhnRUtiSklrL1hJZVNaQWUwbEtaNXl4emUzU0g3?=
 =?utf-8?B?WnpoOElZSGQ5Rnd1RUh3MHVSdE81cWJQcGlheUVzWXc5Rkx4UktrUnNoQ1E5?=
 =?utf-8?B?UjFHRmFwb2ZxQ3pmYVlROEJFc0xmdzdnWi83TXdDZy9yWUEwQ212ZHo1M2Zv?=
 =?utf-8?Q?SZw3kZXVeHwHxIwBuCmhiTeAZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc39205-00ee-4d56-c542-08da5819195d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 08:43:25.0755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sf0gDh8brhcnEkovij5v7cBcJRSN8/A9VcDEJLXvPX4bdBf96EtNcKP7lra9r//Vtl6wE2aYjcn8qeTrTLTCrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081

On 27.06.2022 09:54, xenia wrote:
> On 6/27/22 10:11, Jan Beulich wrote:
>> On 26.06.2022 23:11, Xenia Ragiadakou wrote:
>>> The function vm_event_wake() is referenced only in vm_event.c.
>>> Change the linkage of the function from external to internal by adding
>>> the storage-class specifier static to the function definition.
>>>
>>> This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.
>> Actually also for patch 1 - this is slightly confusing, as the title
>> talks about 8.7. At first I suspected a typo. May I suggest to add
>> "also" (which I think could be easily done while committing)?
> 
> 
> This is actually a violation of MISRA C 2012 Rule 8.7 (Advisory), which 
> states that functions referenced in only one translation unit should not 
> be defined with external linkage.
> This violation triggers a MISRA C 2012 Rule 8.4 violation warning, 
> because the function is defined with external linkage without a visible 
> declaration at the point of definition.
> I thought that this does not make it a violation of MISRA C 2012 Rule 8.4.

I think this is a violation of both rules. It would be a violation of
only 8.7 if the function had a declaration, but still wasn't used
outside its defining CU.

Jan

