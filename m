Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E40B6E73A9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 09:08:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523167.812963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1uv-0000xz-51; Wed, 19 Apr 2023 07:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523167.812963; Wed, 19 Apr 2023 07:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1uv-0000w7-15; Wed, 19 Apr 2023 07:07:49 +0000
Received: by outflank-mailman (input) for mailman id 523167;
 Wed, 19 Apr 2023 07:07:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp1ut-0000w0-Kl
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 07:07:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2df8140-de80-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 09:07:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7798.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 07:07:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 07:07:44 +0000
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
X-Inumbo-ID: e2df8140-de80-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htQTAAA10KK5xflJ7o6kU8iqdMhFeJoRH6OjcqdDkOWkVq+FzkhzfFFs87Vv+4w4hENKTDfrSQmZ1OCp8qpZdPQ2fnbgovyhEo0zQJwy8Xk0oirCb+XnYBBtG+9+E1laP186tZ219nYE9Jn5HVaee9QGKcpCd/N+fxyzljdrKsKMATQaOp9hSDkb1JY7+Jlp53lNRpaLvkPr0XPD8dgs2gIZJc4sA/1ofAwAbV0cavDBNnW87f5N8wz5cA/ZuLhjQECdFmExDZUQjy0Q76sPdvs1SzmmtSYnGd7fsaY+l04DYt/R63RYrH5jPUW1Ir0BMz06wbBCGJ2UH4L+KxNQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r35Rb35zAHx8L0l0T4lYDIXwIFCBnnjs+xh5DuqE/4w=;
 b=Nzz4Pjy9sap1ZMsr0EMEt/NQWiJAjVsXm9nQoFUbz8kZb9kPTJJsNjWHSRmVhjari+Uxf+PQxlZrKV6Xd76I2TiJD8wvpWl8VkSb+In6Ab5o9Wc6oeh2Zkufe8Lf+m++Z3HnmF2wRieaIomxPGGF0FFdgisAxyKvt5hhL47VKEMJ76hxmYleYGLEqIyvZvwHKAznIPoe8xYsSfVEDxfrnIgSXP2kZK1553evbapgUO8q5lFfwBM0TeQvboLj9EZeayK1jg9m+af/gafrjOS3lJnMYgoTfvDEiOualOdot8OppBd2zLaBEkTOZpOHczlAiIUu8ACRUjpojyNjuZYQIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r35Rb35zAHx8L0l0T4lYDIXwIFCBnnjs+xh5DuqE/4w=;
 b=4qyiLa51KiNAvvC3hVEJb/lFS4Z2Bs75gDivRuHfhu5CtJQVvpqOT468+ug9YlMfaq1twalc6KMZ5dg2lpo2MrZRPACl0Xe7+DNcKccNHVJ71u+EV0Rxzx9QyDUn2gwkcDWLCv2kNee2EsRrfx5VJ/NR+0kg6Q94gv7FlxyAQuwwwhpG/8lvnDuxTXAap+3kR9q9CTczIqLLsFTnF0bpj1cWT1KfoZDyE7MNWP8/wwIfRXzHKjhmkWDmS3jIwf51oN/pQ4Jxm5Drg4COJ34I4xBT3uq3FYFIOdtbChVSq1aMBvY2X0K6cb+T6srezVjnbgMlaoIR519rNfU1XkIuLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7452a070-48b8-03fb-26c7-3dc7d652dcba@suse.com>
Date: Wed, 19 Apr 2023 09:07:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20230418154223.20181-1-roger.pau@citrix.com>
 <225aeacd-7d8d-3832-8043-4f565403c2d7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <225aeacd-7d8d-3832-8043-4f565403c2d7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0259.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: e70aae77-990c-4afc-e043-08db40a4c5b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N4r5hjUMlcl2FMXyES2PJX1o+Bvlg+TOpmsDA4IWAOLjBB2nfnkPpDnmrNQ7idDi8VbdiayzQ0OD+SsQgIjaN8zpkshUizfwk4rQfKM/gMBSmGONbi9Ut6PW5QewBF42XTcQj7IHl/ijDWdCz230t3pqxPrAuFKwo2M6Z7e1i9VtlerZFU9sCq4gjBerj2bMGWjAxLhCO/cVDi5XnLExioWegObNTwM7qKLm4VFRNJq9+GNQ+0489o/4OMPPqhsZyC10/y9ygYBbOevP3tiiStnCxyQF097LB0xEkaogeAwoWFGeW1urW06Pe1RgJ8t3es1BQEQQGPJ9nqXazbSya7917cvpT1uZoFs+x2Cjl62aVzLgcwbw0TNezr6jziS6lhvrL8kl3JTgUA6L3//LlsYlAHbDRX35ER7eXEmq+c3yoYzIErmYcHae+97W2+tUzSyaELj8rfCc8pCd8TKOoWChx/8V8P3txNZ7+uTaPZxL+WilPpxbtpBGGMGxCfe3YmPhoxnXBe8SRwsMbXeu3sNM/t2CRntsBLvLkvHriadY+duZC5OuXsvpwNLFQpWfV74RdsjpJdIFKn1+Jw+yFQN5+LKwx4yD4ehmDMhtDkA93vSMioS4a5SNfggnG8G/dV2x6tbKZ00L+grm34wdug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(66946007)(66556008)(66476007)(6916009)(4326008)(478600001)(316002)(54906003)(8936002)(8676002)(5660300002)(41300700001)(38100700002)(186003)(53546011)(2616005)(83380400001)(6486002)(6666004)(6512007)(6506007)(26005)(31696002)(86362001)(36756003)(2906002)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnJyMVUyUjNnbGJCanBuaGpSMEc0Mjk4djlhbHAveWNBcUFoQ3RGeVhMaGQ3?=
 =?utf-8?B?alBzZVUwSWVoQWJJZ3kza3RSTmlsVE5yUEMwaVdDbzBPalhpb2Zqbk1LWTdW?=
 =?utf-8?B?bllpNktWMnhWSlB6OFI0b0lJeGxha0ErY3REaitSdTlPSTVLVERnampPVnp1?=
 =?utf-8?B?UW82eXlsUGU0SDNlN1R0WEpxVCtYenpuc2k0UTg0OEtob2FEQnBzYzlvS3pZ?=
 =?utf-8?B?aGpiaWd2NjZxVFlPMEVXNExYSG5yN2JObllsU1BiRXBqdEpqeklJQjNzNGky?=
 =?utf-8?B?dHNCZUt1OGpNcVhpR29BSFJWVnRuc1hTVG5ReUZpZXlFQlozZG5JT2Zobysy?=
 =?utf-8?B?cmh4bE0vd1BqclB1U0RqVFBsd3daSVlRc0tjK2lQN2FNaDBwanRrSlUxVHRz?=
 =?utf-8?B?Nkd2V2ZOYnRnazU0Q2RESk1xUlM4VVhBUmZuaThWNkdqdldwSURmMEtHNlp5?=
 =?utf-8?B?QVFBaVdybkE5OHptbEhrT1N0REI2Ym1lM3crQUFFWTRBNnhhcjdxNjRqTFFQ?=
 =?utf-8?B?S3piK0FIT0JJc2d2ZTdwT1QvZlorSSs0M0hKS2dRNkt1RUFwV3hZYmJmVmZ5?=
 =?utf-8?B?YlE0M3VKOVhtTjFCOG9TSE9KM1huTlA3MklMbFBpcWlYNmttdkJROEcxc21V?=
 =?utf-8?B?VGZKWFowOW8yam05REdtaEx5R2dWM2l2RHRaNTd5Ymo4MitML0FIaHlXQ254?=
 =?utf-8?B?a3pyVEJIZFk3RHVUK2ZrWGcrSTVDZkN5a01TdE1iNXJ4TXpPbE5FUUZ4NVF1?=
 =?utf-8?B?U251dnNNVGRqcndxTlRzUXhqRjE3TTd6QjlvaUtqWE9OU1orV1A2eU50SVFC?=
 =?utf-8?B?eXEvc2NXcFBsbVF0SUowdEJ0V1FFVWNyaVBaSmpvUUNhZ3BzdDNCdnVXYjRG?=
 =?utf-8?B?a0YwZzFhTHkzU28yaERnc2kxN3BuVXRsdk1IN3FKRHhKVnVoUTdoQ0p4Zno5?=
 =?utf-8?B?SUk1MWJLenFPU1VmVmdYZXpFVEF5TnZmRi9DTmprQnF5UUEvL0lHU1lOSkhy?=
 =?utf-8?B?cVV5ZmQ0NVBWYXNPbjdPQm9sNjhNU3ZwSGpkWnBwUmZic29tUngycEloVklQ?=
 =?utf-8?B?N0F1VlNRM0k5Ui9xZjJIc0NocThDMTNHSStScDJzelJxVjhCUGFIem9lZnVi?=
 =?utf-8?B?UEhpc3NJVWw1N3czNE9RZW1xWHpCWVVsT1hMMnRoMTJERkt1VE8wOFNnVEJp?=
 =?utf-8?B?RG5qN1IrY2xuRDYvL3FQOVY5YUlueTlOaDBGbEYzWVZMNlRWYkFiVXBadERq?=
 =?utf-8?B?clVNVXFvQksyNUx3ZFlsMFR1L3IwTGRUdlhlVTl3cVZsc3FkZytqWlhzazhD?=
 =?utf-8?B?MnJ0ejVjNXFTRFRkbjJJTmh3RTlMNHBHRUhSU0RIM2VadkozMjlvRkVieEhE?=
 =?utf-8?B?ejBFNG5rSyt2bmgyWkZUcnFRVERoSmVodHJBNVBOTkFXMktPRk5PRlJwY2pt?=
 =?utf-8?B?anRETEJnMDZXOWJzQmZTL1Uza2lvNThiZHF2UngyV05CMllRblBWVGxtWHU2?=
 =?utf-8?B?ZFk0YzJiTnNQL1lmeGl5LzcwR1czcXdmZS8vaEs0bTJZYkFpcFJVd1Voei8z?=
 =?utf-8?B?UFZyUEZJeUN1bkVmQStma2g5RVJkS1F2VXNoeGhrMGRpbTN6M1NNRk5hckN3?=
 =?utf-8?B?UkFYb1pYZzc0aWp3SEl6RFd6dUNtUGN6cUZ1dThmWjZ6N0NLNzFZd1Z2Vk4r?=
 =?utf-8?B?aURxTUx2WnlFRDVQR0o3dTRkOXBMY0RXa3JnSmpOVUlvNm51SEM0OE5XaUwr?=
 =?utf-8?B?RWR4V3hDRkNGWXRVdURRWlpHOCsrK0JjNWwvZ21DTkh0WFQ2aFowQ2RxajJN?=
 =?utf-8?B?LzVVUXV3SE8yRDhML2pkWnNNeWJzVlVXN3ZwemgrU0hkMXBsSURMclNWZHNB?=
 =?utf-8?B?NFM4NXI4ZU56ZmhGOGZtTWQ4NUQyL3ZyU1pPdW5sbUsyNUNwWUtZUktlV0Fl?=
 =?utf-8?B?ZkU0Q29kcFBsYmFGUHhJSEVqOFQ4TXRQNEtDM0Jad2FQakRzMkJaOWJ0U2Fy?=
 =?utf-8?B?WjFjSDhieFRlOG45UTZaZ1JDTDliZDZENUpDRzl3b2F3TjJhT092aVl0RkdD?=
 =?utf-8?B?dGhqZ2lYODZqdDRRT1h3aFV5dHRiclE5cHJCaFJIeVZrWFQ1UG1GV3kyeWMw?=
 =?utf-8?Q?dsiasRTJdXgUAPppoJSeBJbPs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70aae77-990c-4afc-e043-08db40a4c5b3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:07:44.0365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Kvx03GiMOKVmOMrG/pM9mragmNHeOSk9b29QNXOGl7TiPCVNpvvdPI94qx5N4swI//5PQ+wVYSOFe9qc/YCVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7798

On 18.04.2023 17:54, Andrew Cooper wrote:
> On 18/04/2023 4:42 pm, Roger Pau Monne wrote:
>> The addition of the flags field in the vcpu_set_singleshot_timer in
>> 505ef3ea8687 is an ABI breakage, as the size of the structure is
>> increased.
>>
>> Remove such field addition and drop the implementation of the
>> VCPU_SSHOTTMR_future flag.  If a timer provides an expired timeout
>> value just inject the timer interrupt.
>>
>> Bump the Xen interface version, and keep the flags field and
>> VCPU_SSHOTTMR_future available for guests using the old interface.
>>
>> Note the removal of the field from the vcpu_set_singleshot_timer
>> struct allows removing the compat translation of the struct.
>>
>> Fixes: 505ef3ea8687 ('Add flags field to VCPUOP_set_singlsehot_timer.')
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> While everything said is true, this isn't the reason to to get rid of
> VCPU_SSHOTTMR_future
> 
> It 505ef3ea8687 does appear to have been an ABI break, that's
> incidental.  It dates from 2007 so whatever we have now is the de-facto
> ABI, whether we like it or not.
> 
> The reason to delete this is because it is a monumentality and entirely
> stupid idea which should have been rejected outright at the time, and
> the only guest we can find which uses it also BUG_ON()'s in response to
> -ETIME.

The instance in Linux (up to 4.6) that I could find was

	BUG_ON(ret != 0 && ret != -ETIME);

i.e. not really dying when getting back -ETIME. (And if there really was
a BUG_ON(ret) somewhere despite setting the flag, it would be a bug there,
not something to "fix" in Xen.) I'm afraid I also disagree on "stupid
idea" as well as ...

> It can literally only be used to shoot yourself in the foot with, and
> more recent Linuxes have dropped their use of it.

... this: If used correctly, it can avoid injection of a pointless event.
Clearly the Linux change dropping use of the flag indicates that its use
wasn't correct (anymore?), likely because of not properly dealing with
-ETIME up the call stack. I'm willing to trust Jeremy / Keir that at the
time of its introduction such a problem didn't exist.

Jan

