Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961B56F65FE
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 09:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529589.824127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTdL-0003WW-4b; Thu, 04 May 2023 07:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529589.824127; Thu, 04 May 2023 07:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTdL-0003TQ-18; Thu, 04 May 2023 07:44:11 +0000
Received: by outflank-mailman (input) for mailman id 529589;
 Thu, 04 May 2023 07:44:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puTdJ-0003TK-E1
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 07:44:09 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe13::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72f7c0da-ea4f-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 09:44:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 07:44:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 07:44:05 +0000
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
X-Inumbo-ID: 72f7c0da-ea4f-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7JJucWs7/ZMt+VkgeBDHTPXL1Ll1z8h7etz+PqaD5tjrmdTFOCr05jlcVzyOdCNPP1AZYEtLk9hw0EZC4lygBCUoKAabf/08sKKV6pX8+sdDiMQt57QUxbf4+g4C45oeav0KRArbwZV2oRwvqQXtgCTlJlriidHFss74xnkrSE3M1Q+OrC0FXu3HYszADolR4ywfBEXehBhu2nibtMrMQph9PJ7cdRqu/3o9y104csVD1qHEgw+BrR6ndf3Rh1T3jMYwbYfhnc1kmx5ZBNktOon4csX1t0jemxyV3b85RL3o9WBYmL3ZEfHtV/CSEDiLodRNN3UajuviPGHI5ReZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CiAMrpXGLanBsbatUg3PQiFHBMR9ut/YXD3WLXe1lg=;
 b=GNwk/IJnwT9S5yUHg6+vNXgtmRSAX2HY2d3hXx/FHAtjiKWcZH/SEq472dNGtlIe5yUbzmsbkshhNTrBEF91HB3AGJRsvQ3HUahdrJDApYg+5jqVihBfRue0X37lVUPTpIq8NERHD4OSZar8SzqX3QNdGSEhIdLvVH6MOFs7wxlTSEpOyBarI/i7UECj9gNRRkeAd8KiwcepGK6vuJWV3lm2qWTyGTBB9232wf0h0A/sX76ZBEO93EI+KUmFQEykZox3idWqA6ViBnlVotCbyO1gMdQ+F15GMGAA2qNFrXGAqXhy2cofIPFeyn8z0ypTzh9fjXsdVOONqoCXGCAuUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CiAMrpXGLanBsbatUg3PQiFHBMR9ut/YXD3WLXe1lg=;
 b=VrGgZnuvs3LU4SEo0wPh0Fn58qtBqm6Pd0xgvujRqK0o4dQJFR/GBJd2aqRfV5Fv+CNSGqMSeOuA67QTi5z8Idvzwg1g/WMFCoUjhf11hXxLKhlB6iJq/r9ZUS/np3T3xUpQx9FK0SmDydKSGfsXqYkl1Cme0bm7cMdoKHhxPmO4d1naFaN+rUje0zSa01DowB49hCtaZ7TX17IwPYXA1bQtSGfTf7csNprAnLpdZqd9YWdFag8s3/CtHBAHZMa+h7F4l0JrxYfU9F3u9+qZYGzIlsuTMQaFlXcM7MTqJcCOQzQTtx4BBLOXbKoLdvtoiH3XpnvthK2r+IslcgwRmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5f2ee35-0f5e-da04-9a28-aba49d2aba29@suse.com>
Date: Thu, 4 May 2023 09:44:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 4/8] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <a79d2a8b-6d6e-bd31-b079-a30b555e5fd0@suse.com>
 <CABfawhn4CRnctzV-17di4eYyNhSGTSMckZjgphS1Rg6HUGOtHw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhn4CRnctzV-17di4eYyNhSGTSMckZjgphS1Rg6HUGOtHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8644:EE_
X-MS-Office365-Filtering-Correlation-Id: cfbfd59d-2789-46c2-3124-08db4c735647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ab44n/bbzDb0iWahSJ6e2Io39H6bdzUL2SnD3ANzJRj28T7sw6qjO9nzWpRVGfL/KxT5gcRAJKc79YgX3ZFA7cMQqin80Kpo+MkvxNkjaFkeF9VhX5BUOqyVJpZvLrUAAGR/MgkOB5izRFFqpvaTuwn0kBx50t6YXvLCbyRGRFY7+ZZRYBkQ6LeBzXRtFMQ6C12JJUOThYkWa9/450wTfbYyrV4qB2GOEZg74KcvoNT/JyFcfE9qiRkLj+z9z+XDsYKBwuelsaDFGdWfmw2faoarNsPHrEHxPKoRA3mo932TCHC+RRnxkpNZ/G6kfX4I1wbWCAMWMOg9Xj4/nSuOZvFHYjipxgHjPc8GoHzPhVYKOdixQXx2LYVi58+e7xNXLuHs5t512Y4A8DzrrXmEJy7+C6rnMOss0/EYvA4zq3La6e5FWOTa2lGclUHEaoQGLkkNPR1NWPhSA0m9GgMhMZbqSuxuZ6cb0y+sJFkmU5lDbqec+kCBI3DwuQXPRA+Q6XzzWQvWCIRCzJiYXy5mhQCjG0GPSDRei6KLnl815U0HlFRX5Fal4WaJiwQ96Tq1nGPAfANrMqBLmk4r/wHhcjWO7+OZR5VVEWexlF84zTI48g5Tg4UXKzJXOqqK74CraZCZDRWAFLu7EoS+Cy9mA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199021)(26005)(6506007)(6512007)(53546011)(186003)(2616005)(66899021)(31686004)(54906003)(83380400001)(6486002)(36756003)(316002)(5660300002)(478600001)(2906002)(6916009)(4326008)(31696002)(38100700002)(86362001)(41300700001)(8676002)(8936002)(66556008)(66946007)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enk5V2g3K2V5WmJBelg2aUd4ZFdFQkhtc0RaWVFPNUpRYVNWNndicTVsTGlF?=
 =?utf-8?B?bmFPQWtwSk1QUXZQbHNzU21aUytzVEZaRWRUczBwY2M3OHo1T09TSjdhelZI?=
 =?utf-8?B?Q3A0SE1XcGpQSXIxU2FrVTNjWXBrZHpTUVhmSDV3NFJkekpDcDNMOTZ0cXhh?=
 =?utf-8?B?OTVFRHptMzQ3MUE4NTdhRHVKWnRaRGJWcEFvM2d3WTI1YktrR3JaR1Z1aUdU?=
 =?utf-8?B?OWJTN3ZVdE1icmdONGwxMlJJMG40MUMvR1RxUHBjN1ZzejQvVkxUcXdTTjVt?=
 =?utf-8?B?NzNxd2JWQU9JblVab2FxSlNkdmRoQUp5RTU4UUhBTGsvQWZwQUhWTjd1NXpy?=
 =?utf-8?B?SkdYclBqSFJhMm4weW93cE9rR2lFVjMvSEZvdjdwc084SVJOQWFzVTRBb01a?=
 =?utf-8?B?L05IQXF1MFhJZ1llNm1nRWUyT3cxd0VPQ1d2Z0NTM1ZITDJ3RDhXd2pqMkdv?=
 =?utf-8?B?OE5meFRyOTYvWmpSWktjbk8vM2toUXZWTDdpYjlsSGFIRnlQcmcrNk9sWStQ?=
 =?utf-8?B?NjJEWm9Jd0REMmtSb01yT1JscHJHTkxBbWhKZzNKVlhmV2x0Wi9scFY4OUdP?=
 =?utf-8?B?Z0NzTnJ6QUFzNWhUYit0YmRBK3M0OWRYTUpvWTMvVCtVWmZxVUVxOXZIUGxM?=
 =?utf-8?B?SDI4cVFaMFRXdFpIWG5kYUxwSGJMRlBqNUluUW81VWxaWGJrZFhSSy92SDI0?=
 =?utf-8?B?R3E0UEZ1Z21saHFaY3Y5RldVYUp6Mkdxc1pMVTYrbHVMMU0xYU9LQmNpUFJv?=
 =?utf-8?B?T2JJUkYrSmk2cDltZFo1Y2k0aG1uaGt1d3BkZTVEWHU0UmpvY1hPOXJjdmNu?=
 =?utf-8?B?VDNQUjVCNHhsUWRuTWVMNkpaS2Y2bFd5Qm5yeWI2dWRjQ0VmMEd2Rnd6Z3Yv?=
 =?utf-8?B?d3NGanpkM3I0aXNnNEp0MXp3K2FTbUVsalNiMmg3QkZ1TUJGdEdtbGp6bWF6?=
 =?utf-8?B?dWlzWk5zVzlmS0hGWUZwcTc0YkZZNGRUbmZTdEhSUWZtNjM3eFN0LzdpTXA3?=
 =?utf-8?B?SkU3QVJqSjFxSkJRR1ZsbWxwNFdLZCs0bVh1N2M4bTFid1B6Q21RMyszemhW?=
 =?utf-8?B?bUFSRS9FblpSbEVQbFNXYUxCUTdDZmdFeHJTS1FHbDYrOFNaRXhMbU5oVnU2?=
 =?utf-8?B?blAyYldqOTd2WjVkaEZNQXJxYkpKMzJJQnFRTEFDbXF4WE9WbUhTcEloVG4v?=
 =?utf-8?B?ekZOMGZxNmQ1WFYvellZY2lKZVVwdFJsUTlHQ1BFUWx6cEpqSWJueFVLWkxo?=
 =?utf-8?B?TEtySC8xU2pISW5INGFhU3dFZnNVWVdjbEs0aGYzTHNjTmw5Q2NUU044UkZN?=
 =?utf-8?B?eGVpaGhMOWJnZk9uMlV1ckorM3Y2bHprcGlFNnhJbXAwK2tqeCs5dGREYS93?=
 =?utf-8?B?R242NzJkQnpkbzNjMS8reTE1THdsb3hFZENTV0xMeVV3MFB1akcyWFBsUTkr?=
 =?utf-8?B?bFNyQVRYTlJ3cFp6amp6OTJJZWlwN29lYWgyQlVPVHo2SHRVcisyZTErbEFx?=
 =?utf-8?B?NGdjWlI1NnJ6bEVscitVVUs1YS9FYlhCenZJUVBnVjk5VEd4T2U4RHY4MzRH?=
 =?utf-8?B?emVyaVZIMHB5WFhRL3YxSklpK3lLN09NNCtVMWc2MWtYTDVUaGl0UTJPc2hm?=
 =?utf-8?B?T1Bna3lXVnc4ZEVvMVVaaGFuVmZNdFY1WG1ETE44RWVFMFlTNEprUk56Wmkz?=
 =?utf-8?B?aWU2b3gzQjhwakJpck9SaUNkVzJaSTRHdmR3NEdUTjhuUDRxSHlWMlI1cjd0?=
 =?utf-8?B?Mjl4Z21pYm9YSng2d3dNVWsydnpuWnRTY2w1aHB2cmpORnpyYXdJZEZJdHBE?=
 =?utf-8?B?RjF1Qjd5NUErTlNESnU4dEFYdS9hTlRYOVRJVlk2K1VEKzRMQk1PaURWb0lo?=
 =?utf-8?B?SnN0eThkMFdaN1BJdWFuaHBpMmUyY0VFamt1ZDNaUGx3L1JtVG5Jdi85U1p5?=
 =?utf-8?B?T29TRXVTM1BiRXRSZWN4U0FFSGJpRUJCM2dodHNyVzFOdWovR05aWWNqME1J?=
 =?utf-8?B?WnlSbkFlU1lxMkZSSVpsQXVCNEZjWnV4ZFJlSGRyL1d4VEx6OFJyOHJNWVNB?=
 =?utf-8?B?Nm8wK1NPSFpFRy9mWDMvb2hCNHJJVEN3SXhtV0ZwaXR0STRHZTU3cDlpd2ly?=
 =?utf-8?Q?FXUmKovkzkYfnqTCSIyIx54Cz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbfd59d-2789-46c2-3124-08db4c735647
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 07:44:05.6629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OifVk2omLdFPV3VmcdQcMIZh/W0NDMcF4YPg9MLA8agIG4deKMoGq+16z5mfww1lHmox6YQbSgEGSD0jzCHwng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8644

On 03.05.2023 19:14, Tamas K Lengyel wrote:
>> @@ -1974,7 +2046,10 @@ int mem_sharing_fork_reset(struct domain
>>
>>   state:
>>      if ( reset_state )
>> +    {
>>          rc = copy_settings(d, pd);
>> +        /* TBD: What to do here with -ERESTART? */
> 
> Ideally we could avoid hitting code-paths that are restartable during fork
> reset since it gets called from vm_event replies that have no concept of
> handling errors. If we start having errors like this we would just have to
> drop the vm_event reply optimization and issue a standalone fork reset
> hypercall every time which isn't a big deal, it's just slower.

I'm afraid I don't follow: We are in the process of fork-reset here. How
would issuing "a standalone fork reset hypercall every time" make this
any different? The possible need for a continuation here comes from a
failed spin_trylock() in map_guest_area(). That won't change the next
time round.

But perhaps I should say that till now I didn't even pay much attention
to the 2nd use of the function by vm_event_resume(); I was mainly
focused on the one from XENMEM_sharing_op_fork_reset, where no
continuation handling exists. Yet perhaps your comment is mainly
related to that use?

I actually notice that the comment ahead of the function already has a
continuation related TODO, just that there thought is only of larger
memory footprint.

> My
> preference would actually be that after the initial forking is performed a
> local copy of the parent's state is maintained for the fork to reset to so
> there would be no case of hitting an error like this. It would also allow
> us in the future to unpause the parent for example..

Oh, I guess I didn't realize the parent was kept paused. Such state
copying / caching may then indeed be a possibility, but that's nothing
I can see myself deal with, even less so in the context of this series.
I need a solution to the problem at hand within the scope of what is
there right now (or based on what could be provided e.g. by you within
the foreseeable future). Bubbling up the need for continuation from the
XENMEM_sharing_op_fork_reset path is the most I could see me handle
myself ... For vm_event_resume() bubbling state up the domctl path
_may_ also be doable, but mem_sharing_notification() and friends don't
even check the function's return value.

Jan

