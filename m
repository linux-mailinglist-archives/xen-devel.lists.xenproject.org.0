Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FCB3F9789
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 11:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173553.316657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJYPu-0001T5-SF; Fri, 27 Aug 2021 09:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173553.316657; Fri, 27 Aug 2021 09:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJYPu-0001RA-Ot; Fri, 27 Aug 2021 09:44:54 +0000
Received: by outflank-mailman (input) for mailman id 173553;
 Fri, 27 Aug 2021 09:44:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVCk=NS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJYPt-0001Qo-6A
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 09:44:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 475d56d5-cde9-45cc-9454-027da35a77f3;
 Fri, 27 Aug 2021 09:44:52 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-sS7YUClEP4qmjm3btYe9hg-2;
 Fri, 27 Aug 2021 11:44:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3773.eurprd04.prod.outlook.com (2603:10a6:803:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 09:44:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 09:44:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0185.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 09:44:46 +0000
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
X-Inumbo-ID: 475d56d5-cde9-45cc-9454-027da35a77f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630057491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s1QdbS4tKCTVY5euqHq5INmSh+p8Ty/tdguKddlvNbk=;
	b=ELJ45UZm93/fI3Hjrc09JZOZ7a/A3tjc5SIy3WZ1uKWC2z2FuGze7wcK4nIyUDcUS4alS6
	1ctrjYdRN8XPbTe1M+jBqP9gS8WRVYZkjqwaZJR2rVS9Xfs9378K+XLkLD/gs3OKfvTMTX
	ZPVb9360R08hktwHHLFnO54uJ2ZDGlY=
X-MC-Unique: sS7YUClEP4qmjm3btYe9hg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TekHBTCSzQw1QwxGukn5FaDoN86HiX9ASr5jqJMMDF4vDX8k5f0BaluNq6Lu68rafziesJk4cIu8r68f77eFfyAbnnxh0ZUklEmBhCePuLmeOYJ4Jtb9KFcV9Dpia5AiX3aMGxmt796/DmxqrbqPmR9pY5Mcom9X/cKqvlfQSgecl3cCIf/RuI6z89H74iKSq1JPyVVkaQTwarWAEK+IdGnX391bb0h5W9HAEdxJeK7B3v0WuiJldeZZ/3q26ufLTS8VIIu2ZgEMp9vamF+9r2FC/z29I2YQqwMRfLLrDKcZPig7nzMpVlmzF0HICpaASuVl/FsW8B/8nc0ZMn4RWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1QdbS4tKCTVY5euqHq5INmSh+p8Ty/tdguKddlvNbk=;
 b=WB4XuBiIdNREeexiJqe1gjmB6cTT+SojwgyyhM4SbQQWshd9RhGfEj2sh3AoZVqlF1khgWJFXDvMm65iXHdflLwo5hDTxAna3Xw0mBPywYkfzVgkz9f/Jr3JRdVy1RAgtVuczojFiiO826YRxd45OzJH1YYLjwXyD6g3Brz3wBHF89KNMclscHhy/phB+laTRphgUcSonutQUZOMydo7zQaenKrq1H2qS83Z6Gue80+W3JP4fnpWe87jIDYi9QF+taegefGib75nr40SQQAMPHTHLLb6P2OtBBaq7KSrMCzkB+xTSpChrjg+t7dfdrQCR+IGQMKPz5g/1OQSPAn+oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Linux: balloon_process() causing workqueue lockups?
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2bfd9396-0967-df51-298b-22a91f570c48@suse.com>
 <744feab4-44a8-bb57-a03a-4cc2b8a78f88@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b651d091-973c-f533-43b5-765aeb3b10c9@suse.com>
Date: Fri, 27 Aug 2021 11:44:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <744feab4-44a8-bb57-a03a-4cc2b8a78f88@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0185.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 952016b9-d85b-4044-8284-08d9693f4e5a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3773:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3773DABA34F659BC14138050B3C89@VI1PR0402MB3773.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lAtbnw1XTrj+B6DkvlkpMW/Bs/9ykaagae5lOkEEpmDqk3yyIrBxP2R/zIkRT28POWWECei88FP/tNLAoz8lqWpSmu1XjPFC+Cc8smJFZfqp3QTaHTklDriLt4rcy2XIy+eYqFzGWaU/AAKku1aRBw5B2b4mZPnatB/W712LpfPRz6fYyUFdV86Gs7cE0uGEJewHEQpYsBr/6b0lItadSNrLZ5zYnatqKGCgPudikQUy1hlRsC7wzNq95dZSKwV2a7thdaQWyRsEZ5aHNiRGuYNfLxDDL4wTvzQo9FX+weuklQ8//gr0kj05g2Omqp7/CKEqjq0/wjJRAIIdBZ231skT5vrBk4g5pxHwGvEbC++9e+0wwsTed7gFUuhN/ZaPxThU2jBRM9y8vb1fOt47poKFktRqlCwhwNdDrTHfWf6qSfNu7F4QZdy9SX1xXdU3wanp/jMGRVphz62jObdNAoEz+GZ5O0aagbXA7sj1V2vAiwx3jmjzM44hqQu/NaH8q5YFmMSeTq12Sgww+1VkmPY4tr0GWiaOCyvTtiywaU66jrIRvdt3Lm49JN/HdCBaVr4ScscrxShfrJyBVxm3OFHapY6JsXg5Wk9NYP2Yia5rGzZtqqycgJmWOjwxx0di2bKfpU7+f5MhF4FY9E3o92mZD7sezNMm1Kkdpv+KwNzVMZoKJsVgEMB6HjifnVMWaYOD+KKkmW1v703NjsrZfnVs0CpZok7Qri7L01tSxLw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(508600001)(16576012)(110136005)(31696002)(66476007)(316002)(2616005)(36756003)(4326008)(8676002)(6666004)(38100700002)(956004)(66946007)(2906002)(186003)(86362001)(83380400001)(5660300002)(8936002)(53546011)(6486002)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmM4a2pSa1JiYjNwYjdzMm8wU0lPeFpCeE5wNEZkSmRlNXgrbktCUmtvUFFE?=
 =?utf-8?B?RHBDRVdnUXFqRjFxc0NLQmdmK3IxQ2FHOElndmIvc1BLNUlZMWZZSitWb0lM?=
 =?utf-8?B?WnNIT0ZBMEJlUFlRWWszQ2MyUjNxK1MwT1ErR2wyNHRST3JyWU43QkdVa1Uy?=
 =?utf-8?B?amNrY0dKRk44TE1qcER1NTFjdUhEQUhSNkxhZE5URWdQQzJyRkpFUjc1NE9L?=
 =?utf-8?B?MklMZHNvYjVOaFhFenArU0UzdUVqUzJJeDFUM0pMdS9LVTFBQVZjOWU4eVlE?=
 =?utf-8?B?VjBxU0p1T1BkTzlwQ0pjc2d2a0ZkVXpURitHdlNkUytqKzNsMlZSKzd1TXpO?=
 =?utf-8?B?cGIwNjFRYlZDZnEwSm5hU1JDVm4yL3RSdGdjUkVTYjRlbENPVDdqNDFEeUJZ?=
 =?utf-8?B?dWNmS2laMnA2OWxFd2NpcW10QTVuc0c4UkFUeEFpK2VvRUdXdGsvY0NJbDRp?=
 =?utf-8?B?S3Q3cmFhZmVHWUoySXpnenFpam9sbzdiTHE1WTBJd0I5aTlyd1d5aG9pTzdj?=
 =?utf-8?B?QlZEQlZsbUg3OEtDSUlFVlF6SXUrYVEzVWZ5OXVPVEMxUE5iWDdsVXNlU0dn?=
 =?utf-8?B?YmE5UU5TZkdJVkplRjhSYkY5QW9LK0hva0RUNHVqMEY1bFJDUkZSSGg5Y3FH?=
 =?utf-8?B?dHZBTERVTGsvT1BGTE5iM2l3SFpmNWdINmNOY2RjUmtYd29VSHI1WExxVTlz?=
 =?utf-8?B?K1Fjb2h2QjdjT29qVXRJY3JtVEV1Z3Z0emVSbWdCL3dlVU4xZ1FxckZKaXFX?=
 =?utf-8?B?c3FnVU1tbUxMcHpGLzVtVm9Xd29udTVLTEhvWmtRL096d3Q4NzRJQUlERURZ?=
 =?utf-8?B?YkhpNjcvNUkrTFAvNTU0UEhaazY3aTBjeE10TDBWN3RTVzNiNWd4MlBTNGpV?=
 =?utf-8?B?TUgwVmNTeXVhQk5CNjl5OElKbTlLTjQ0RVVKVHMySXdpTlNtUldFUVJ4Vmh0?=
 =?utf-8?B?bVJpRlA5d21nUi8ycDJsVktwTXZqRk94YVdIek5zU0dQTEVYYjVTTzM3MUVM?=
 =?utf-8?B?Mkt4QnYxUmkrSm05UEtvRjBFOW9IaHpZVkFhUXdpaHNPZzl3ZmhmeXByTDkz?=
 =?utf-8?B?TFRVUWJYWURFTS9FUzNQMXdEeDNFOXA2cTY4YS9TVWR1RjdibjJpV1F3cTM3?=
 =?utf-8?B?RjhDQkQzOGF6WG9pdTRaMkdITU5DVnR4aVhWMzVEUnJrNjdJT1N6VFRxTFJu?=
 =?utf-8?B?WUJMbjFmWWpHQUVsRkJ5c2lac3Jwa0JmZUdoRGl2cDNDQUdkWDdxSnUyWjNt?=
 =?utf-8?B?OGdENURkY1gwNldOYWdHaysvQ0s4WUNLVjIxK1NhejVpRnQ3bTN4VXg1cGd5?=
 =?utf-8?B?ckg4U2RGRWhkVGpacGtXUmtpcFJNTjUwNllRampPK1lBU3RxYUhFanpSVmU0?=
 =?utf-8?B?QUVjMHR1ekE4U0krNW1iQmsrSHpkZTBwemJkbnhEVzZZa0ZlK2lrMk82aGFI?=
 =?utf-8?B?NFBEYWRHeUlRLzlKSW9ZT0oweC9WTHR4VE80dUFlbnROVTZqR1ZhWEthOXBX?=
 =?utf-8?B?N3BXTUxYUFBnaFlyQTgySjRCeVMxa1hUdTFWRjRsR0tHUjk1QlZDWWJ1cVdw?=
 =?utf-8?B?RkFjZ2J6Zmp5VEJBUU1sMWs0VWJyejA5MEZvak9PNVZLeUZrbUFSQ1dpamFo?=
 =?utf-8?B?K1NOSWtEemdYZ3FNOWhsSHpPSlZnUWc2YnZDNll6Si8xRXIzR2g5WC81RTdN?=
 =?utf-8?B?b2p0Y1BPNmpuUkMrQTF6a0RpUXV5aEJ3ZjEycENsaFo0Z09IS1Exd1VxQUxT?=
 =?utf-8?Q?G3iOlT2RmyKoKkdH+0GXGRLAxUGooPUBNbbKSQY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 952016b9-d85b-4044-8284-08d9693f4e5a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:44:46.9815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0d/KJpEqOtBXCRU5m+ams1hHgGDxaU7NyZHbEnTS5xCRRgzG/EAdEvI4nWbUlcNkI3W2HSUMeZHg7DH5xbdwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3773

On 27.08.2021 11:29, Juergen Gross wrote:
> On 27.08.21 11:01, Jan Beulich wrote:
>> ballooning down Dom0 by about 16G in one go once in a while causes:
>>
>> BUG: workqueue lockup - pool cpus=6 node=0 flags=0x0 nice=0 stuck for 64s!
>> Showing busy workqueues and worker pools:
>> workqueue events: flags=0x0
>>    pwq 12: cpus=6 node=0 flags=0x0 nice=0 active=2/256 refcnt=3
>>      in-flight: 229:balloon_process
>>      pending: cache_reap
>> workqueue events_freezable_power_: flags=0x84
>>    pwq 12: cpus=6 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
>>      pending: disk_events_workfn
>> workqueue mm_percpu_wq: flags=0x8
>>    pwq 12: cpus=6 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
>>      pending: vmstat_update
>> pool 12: cpus=6 node=0 flags=0x0 nice=0 hung=64s workers=3 idle: 2222 43
>>
>> I've tried to double check that this isn't related to my IOMMU work
>> in the hypervisor, and I'm pretty sure it isn't. Looking at the
>> function I see it has a cond_resched(), but aiui this won't help
>> with further items in the same workqueue.
>>
>> Thoughts?
> 
> I'm seeing two possible solutions here:
> 
> 1. After some time (1 second?) in balloon_process() setup a new
>     workqueue activity and return (similar to EAGAIN, but without
>     increasing the delay).
> 
> 2. Don't use a workqueue for the ballooning activity, use a kernel
>     thread instead.
> 
> I have a slight preference for 2, even if the resulting patch will
> be larger. 1 is only working around the issue and it is hard to
> find a really good timeout value.
> 
> I'd be fine to write a patch, but would prefer some feedback which
> way to go.

Was there a particular reason that a workqueue was used in the first
place? Otherwise using a kernel thread would look like the way to
go, indeed. The presence of cond_resched() kind of indicates such an
intention already anyway.

Jan


