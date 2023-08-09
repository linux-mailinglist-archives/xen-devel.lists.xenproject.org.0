Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36544775346
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 08:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580712.909101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTd4z-0000mr-DU; Wed, 09 Aug 2023 06:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580712.909101; Wed, 09 Aug 2023 06:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTd4z-0000kc-9z; Wed, 09 Aug 2023 06:54:01 +0000
Received: by outflank-mailman (input) for mailman id 580712;
 Wed, 09 Aug 2023 06:53:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTd4x-0000kW-85
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 06:53:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 839877b8-3681-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 08:53:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8890.eurprd04.prod.outlook.com (2603:10a6:20b:409::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 06:53:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 06:53:57 +0000
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
X-Inumbo-ID: 839877b8-3681-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAjVfmc2NPp8OhBdXYg+YrtvZVXDXUpiNqQU7jNZ0VTUt0O6bmOWWs2qMA/FOI57yUCHy6difOPeqIuPyXtdMWSk5bNTwajLCKL68t9ZAHUK35Mj4zr9ihPRKkmOAlOE0QDsrXtB3k3Epo25Vjy5rlTluhEnl56M6KRS+9jnNb2CqBFfb2ImU+S+vFb5kcdlEKfuPZ5lL/7UGwYglE0ddB1IggMrBl7svrZJizByD25eYuY8TcDkNJBat5EJysy9k+KSjdMTtak76hGMyzpsP8GJKZRd1bTLS5ixE5sorcemd65NYz9WwxqzuzbYTUFgYtZ9nu/cpEiW9RB6GFcnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1cFDW0cxg+T7WdovLB28zEgLcbGf1NgCosVjYcqQDk=;
 b=KsVAcxBSiLqmIPJuxxsjnKVqCKbAGT7nUc5RShFYYkDNUWva6H17IptvBErgoTM9kyZ3Od/4qn4nlQuRruNgE9IMvw0FUNGIy2wZpttXs7DM3BlXY5Bp9DuYiIsSQmYVxqGDKIAkBJm52yagbP6NhK692FzNd3KGej0G722UaXYgvocvbvxhHVThcYfj/dOGjOBo4X4FvSlVv50vAmYMExKrfnYsj5ObDCXtV13iOcrfjGbPXhps/qQFdLQtXtP3otaxXygWDIE6mLdF6a3vttpr3j+AQo6aeAXNzZuhqDAb6GQuwTFmBKv2XmGKvgK95Te/zBHvmW1yokjySSxPKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1cFDW0cxg+T7WdovLB28zEgLcbGf1NgCosVjYcqQDk=;
 b=29AHdEEq+LcPoE9n5bsnd2Z2qR6tCqOHQtYqVyffgY97Kj66hz9dJt2ci+dje9LiBnjalwGRUL1TCgHHoxXBk6W+q4fgyQvjLErpRq+6NnlbupAf4wsiIeCb86RWwxTylIp8qIFK61YUyuY+okd6Q+/b7x5ygANap+xEfzVOf8NvJ0WYvCCLwCp2JM9BsvmR6jXjVP2OPq7iWeSBG9pTgZ6b0YdecGhthfXKQQ+Ad4rU+dgFwAi1aOIi8AKgVWW7Jrpu9bJ7QV7Ys9pakbpE/tvl90ICcOwgeYpnfZ9HFzI4Ek8cHBa4vUSevvO5IrTgCne9SSORaslwunDT0cqreQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc6c7291-117e-b597-6306-d3cce14f5736@suse.com>
Date: Wed, 9 Aug 2023 08:53:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC 5/6] capabilities: add dom0 cpu faulting disable
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-6-dpsmith@apertussolutions.com>
 <93750d64-07b3-2a92-4851-bcd5bda9a0a5@suse.com>
 <331ee5de-3c90-2e3f-ef1c-914a2cbf14cf@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <331ee5de-3c90-2e3f-ef1c-914a2cbf14cf@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ceee960-efdd-4e70-94f7-08db98a56749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BXg+yH/9oqhiLcxs9iVN2YpC+hvIgD6Z+3ycQ3WID3wLC0U0TtAf9dxUPZ2CpDIV6j3jp2I11/FJhPYrP5F2JIjDnGXuI3Ar6a9fSjbac+wtBC1jmOkwMB0JQfYFEvg0vLY/3icJLNT8vKRwoXXE4wCPzw9J+RDBeZQrgbBCPZQZk+dQSYkGoaJwN+iwTXNdvndDuA/cIg67+Ih2T+041nw2gCFJcRPFWUiqQoe4ZTwgvoPQPIT1ZZL/8QKZJhbm6ocMr6HhUATc4SgOLVvUQ9oGr40wk7OvEZHZrvNmidyKv/TyKaH7fLFPtFPtmzxpGWylyDmLGWPWd5PI5q9hDEYmani2LGTVciyDifoX1jXpGSVrfnFZNWGeoVsqaABn4HPN+cZHAJdyecnsQIauiUPkorqPTCWNfRp6msJmc4meP5Y4leUEEJT5IN9+WicaEaj8tB3efBCcEHuFRUwewuBl9E7KjaX1L2GD+6eyHfe85TyNteyZKnYraOpULegokBa/L7o8OePs2qtNp3fUSwjVsmGA+b4L69poUa4yY09v/ii8ismd+0rERkGkTiVCGNQnA68sVa1knDsoC9CL5/V59Tft8mHw1ZzRI2dTB2VThTfRNffwspzX5WfEmcXQYNWZEAGB3it1imLCskFugw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(39860400002)(376002)(136003)(1800799006)(186006)(451199021)(2616005)(6486002)(478600001)(31686004)(83380400001)(66556008)(6512007)(53546011)(26005)(6506007)(8676002)(316002)(66946007)(8936002)(4326008)(31696002)(2906002)(6916009)(54906003)(66476007)(38100700002)(86362001)(41300700001)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWlpMVJGNEZmKzZYcHNjTThGdm42bFJCZ3lnTzFVbDBlYVhGdHJpMTBYd0FD?=
 =?utf-8?B?enF1MFFRcW1OTGJlTElzc2prOUpOY3pMa1lrQWQzSDZpUE5nS0tkdmp0ci9n?=
 =?utf-8?B?aEFqSkIrVE9ZdEJreDlEQXNpL1dmc05XeEVOdC9KV3hpeXpUTHk5L3JpdDFV?=
 =?utf-8?B?L0x2c0xsOWZhRFVOS3JSQWJ0bjAxdkNIYW5YRmRCN3pPOXBTYkNHSDAvVitG?=
 =?utf-8?B?N3ZvRWc5NW5IVXJyV21ib3U1MXFOOWJnUUlJa2Q3dk5sRmdUbTJCRk9rSXhZ?=
 =?utf-8?B?NkxLWnBxa0FQWlM0OU5LK3VZWmliSU9NZk0zOTdTaSt1aXJEK2JFR25ROVp6?=
 =?utf-8?B?dkgvVzlPNTZBUmNTd0V5cTRwdUxBSFBRdnlkMFRaNCsweXJNU2Y5ZnpXZmg4?=
 =?utf-8?B?Z2N5b1NGYloyckF1NUREMU9tODk5V3AwbU0xQlpmazE2R2J5bGx2SGkrQmtx?=
 =?utf-8?B?RGdrTkQ1MmF3VHBveVl5OG41ZG94dWNXdHVXR3d1RVJzOWh2ZnNOQWlrNHBD?=
 =?utf-8?B?aW8xZWZIYUU3WFRvdFN6QlNKRytYdkRlMmdMUkJuTVJYTWZqdUtTUTQ3aXg3?=
 =?utf-8?B?eUhKMlBiSm1OditvK1pKWDlkcktBNUJ0QVlZcmF1MXdCQkh2WE8vSVRWYm5h?=
 =?utf-8?B?SUlMMWRpYUp2cVhSNExnNnUwMENUeXJ1NnY4YWdPYjI3cmtHOVYxY0VoZFdU?=
 =?utf-8?B?VUJGQ0g0blFmcEY0OG0vbjVwaitkQ1FhKzc4Tk5YcWM2d3U1QlVSMGVFajVM?=
 =?utf-8?B?MGxNRzU0L3I3RTJJNkRXU0VyMHN3QUE0bEJKSm5vZGViNHVPc2hBRnVNSVR3?=
 =?utf-8?B?SVNMc3RvclV3WmNpdjZFNDRqeDU2OGlkZG5SS3dkRFpSSGhEZm9MRFJ2QTg5?=
 =?utf-8?B?ak53ZFVGWlMrb3ZHZm1mTzZ5eE44ckc4c0ZmQ3k0T0c1ZTRiYnNKVkhyY0po?=
 =?utf-8?B?RTFRc1R5T0R2YmhIa2FFZVZNYnZqSjNnemxuT25STG1BeUtHdVk5U2ZqY3VV?=
 =?utf-8?B?RUVVdE1wU3dKRk55bDFobG0rYmhBN2VZZTU2eHdmbitVMzBFN1VUWFZwbXZx?=
 =?utf-8?B?VUIxenRUTWp3d29jTGhXMnMrVXdNY2pyQUIvdDNvQ2U4cHFrWm5uNmhES2No?=
 =?utf-8?B?aEFnb3c0SlNENk1TcXk4dlo5YVhVdVIyNkZOYVliRzZnYmMvbEcySUJIS2NV?=
 =?utf-8?B?c09qbk80ckRSdzY3NGdYaHRwcE1JSEJub2ZrQVlEazBqR29xdkF2RzEyZ0Jw?=
 =?utf-8?B?RSsrOVNrSHFlZXFEYWpZZTdNK08zbmorMzJBWjBqQUhNWEU2cTFpbzJFRWF2?=
 =?utf-8?B?a0ZzVGxnazJXT0Vqa0hmb2V3NzBMb1lNcFozUEZIRW10V2hyL2FNKy8yTUZl?=
 =?utf-8?B?RFpsdjFENGVYZWNCUWd1dVhYY3d1b3hHV09FaHR2aGt0UG5xd21sR21Rdm1T?=
 =?utf-8?B?TlFCT1BOcnAxa1Vac2o1Ny9kZHdzUVpEZ1RDaXhxRVVKUU5ZQ29wMjM1Mzgx?=
 =?utf-8?B?dXd2NVBWbEdxVmZUMjZpbTFTSGxzZW12Zmg4d2tBZW1LL2JoNkVrWmZPamxk?=
 =?utf-8?B?RXRmVjJpMWJneWNFd0I4VXBCY3U5ZEp6RmhKWWxyUitLSGpMMXIyaG4wUytI?=
 =?utf-8?B?d1FVd09EdHZEYWtVWUJHcXR6aFIya1RUSWVrKzd2Q3gxc0xMU3ZxUGt0V0Fs?=
 =?utf-8?B?eSt4L0w5dzNUNTk2c2h2NEU3aWpadVlGVmhMZGVTK0lNQzg2a2pheTFHUk9l?=
 =?utf-8?B?K043SjM1Y2RTMHBLYXV4Tm5Sa1JVNWhQdXpTMzRTbGhwUEcvQlVxQ2VjMFRm?=
 =?utf-8?B?bEo0bTc5OG9UemVsbFVaRGUrOG5HcVZWWk9SWUsrYVFaVVdQdytnYlVjakFO?=
 =?utf-8?B?KzNDM3dpaFNKcURRQnlrWEdnOU5NY0hDSGRwWnVyUEl4Q1ZiWUJzYVJOdVFy?=
 =?utf-8?B?NkxSWTI4WW4va2dQSk9vdUkvVHY1L2U0d3QrMXhyWjVSc2NuR2hXZTNtK1pK?=
 =?utf-8?B?a2dtM1ZSUndzRTlHSXFnejdFdXVxbXpYdCtSR2p6TVNab29CdXJ5QVZXck4z?=
 =?utf-8?B?RDhWVnQzZ0dabnZSWHJuRUFKbUJkV0JTRG1FSDRlWXJnT0lrZ2toUndPaGRL?=
 =?utf-8?Q?f9RjfzowxgdS2SUTyHqaWQP2d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ceee960-efdd-4e70-94f7-08db98a56749
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 06:53:57.4268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JovA9z3cAvJqqKhMFkhoetVgowyUzQ6kyCgGkXlOqE6fkEJ0zyZqGN5wpWkLbW/n3xGrTs4E/EjFYqBG6kMoDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8890

On 09.08.2023 01:59, Daniel P. Smith wrote:
> On 8/8/23 11:30, Jan Beulich wrote:
>> On 01.08.2023 22:20, Daniel P. Smith wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -907,6 +907,10 @@ static struct domain *__init create_dom0(const module_t *image,
>>>   
>>>       d->role |= ROLE_UNBOUNDED_DOMAIN;
>>>   
>>> +    if ( !opt_dom0_cpuid_faulting &&
>>> +         !domain_set_cap(d, CAP_DISABLE_CPU_FAULT) )
>>> +        printk(XENLOG_WARNING "failed to set CPU faulting on Dom %pd\n", d);
>>
>> No "Dom" please when you use %pd. Also I don't think you mean "set". Plus
>> we commonly use "%pd: xyz failed\n".
> 
> Ack on the "Dom" removal and "%pd:".
> 
> As for set, it failed to set the capability on the domain. You could say 
> enable but that is nothing more than synonyms, not changing the meaning 
> of the statement.

But you don't say "capability" in the message. That's what is being set.
But what you do instead is disable CPUID faulting. In fact I wonder
whether expressing that as a capability actually makes sense. To me a
capability is something a domain may make use of, but doesn't have to.
That's not the case here: CPUID faulting is either active for a domain,
or it is not.

Jan

