Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD01E7851A9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 09:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589010.920690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYiPD-0001eq-2O; Wed, 23 Aug 2023 07:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589010.920690; Wed, 23 Aug 2023 07:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYiPC-0001cL-W4; Wed, 23 Aug 2023 07:35:54 +0000
Received: by outflank-mailman (input) for mailman id 589010;
 Wed, 23 Aug 2023 07:35:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYiPA-0001cF-ON
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 07:35:52 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2049.outbound.protection.outlook.com [40.107.13.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af787201-4187-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 09:35:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 07:35:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 07:35:22 +0000
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
X-Inumbo-ID: af787201-4187-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tj/tTMR+enkLQSjP4onIBkoJtvRBEPq6vl0O3+ERKWhd3duFBvbrxi7y/mF1xXP4wbGq5k23JMDf/YDLQyjCuscADNh1+nrzzU+148FvOqXITi7nb1y4p3DOA5Bamme4NcYTVwNVR5SBoBR4uOnXibAHicpCghdTT89dB3OF7dejhC8L+328nZIfgoFxkN7Bv6WfdvpgDao+A3s+a/yivKcFqKSeHqQFGPDVMPX5oypAENRRk1SgydCNtFamp2DVPgbdBgJYd8KwwoX9Pc9pVx/I+vCPI14tBUoNQuwQbphF7tKm4WCdXs1v3k45D3vp2w5AiYl1bhv8rpCxd51zSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+aZsetn+lvqpKkoMc4QhTq7SuYbTqfyPzocRjaN3Ps=;
 b=oZV+alpj4n56H1Jv42LYBItSqGDn6+Ny9HfCXcZtz15VWy0ipnVYuvgNoheuGormX8Er2K81Lbi5aOKNKlodhvsZrZwrQ7cXhn7aD2/Ny+bGiNYFmeUf23M+ScuwfYg3BGf2Zl23mAS4SFhtUJ9W9xfwcV9KImCGSzDftankbZ+AFAkl6Gw8YHasDsFVP8ZypIVOXQzwa9wliTe4v/6KwJ38zI0zWA99VeF6X0Hh3xCLkfgiL9kcm4bJOMpkxr2Rw3W9zYfIdzO3ZQJCfFPz0t5FxnmtozOiVRpFRoo9A8twuiEg5sMKKIhb18p4hW2QI07muVGgIbC/CJ7If2ghxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+aZsetn+lvqpKkoMc4QhTq7SuYbTqfyPzocRjaN3Ps=;
 b=0WhQ9/RarAlGjZf7zv5i1mZixFim5wXYdX2Y08/R90s9c0d1Sckt015EHiuhJc6DpGVqJcPhM+4fleOLArIEiugyC802AY/InGplGuOSYblIYt5feeho1aX+EcrzAw3WWUZ+xjnOxLHZhEbuj4HLsIUT1lSZ6TG1RNpOpbcLkvDjoCyRWyU0kDeAeN9Y4vnNAiT8UuTV3BHN20z0TGuXg5+MMD1yvH2GkkeQaaPdkyrRqjI14pe7aMCFGS/FZCkc6sxqpZd9WAR2UUwV13kDJh4JRZDc4ZXW858w3+v4ty0GFvLOwY07v6OJ474w3kgkKpCp6hFX6nq758ihDTMvWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95703b82-4e3d-9be4-63c0-adf16efa03d2@suse.com>
Date: Wed, 23 Aug 2023 09:35:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com>
 <694049ad-e259-6cdd-19a1-dc4b3c4a57d7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <694049ad-e259-6cdd-19a1-dc4b3c4a57d7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: 07025aae-7b10-42aa-ad79-08dba3ab8225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BEZ1bqtJQPtyzz0ZQm96GgPJc2W+7gjDifqxFxyZ2fIA58HjdOxn3rXnhoJClTwxfyCyeU4hxoL2p1ZkzMcK+G+8JFFdXqhH+YPmAUCCDFmX7gyruV0sMyvA1VGCexIhgDnrY4wcJ8ksU3qBQRu434NMxtOk5Z7tFisTLJiG7NTQ8InaBdVK8HBQF965qGlSsO4Ad/aNOWPDxjPEkDNAzJECcbGNvO7klKahyxnrtPF8rXeUClwS7HOVj8vZHr/Vi8UPO8vfuJbrT4h1623U3+OBvZzd1WQMvO8rxkknE4BT70J3V7LzoJgWu8tT3QdzavkL40BhpVQaiZHiRx9yMhRdwGWgUSPeE6sRRIxvWq7h4u/inuSJYWezuLedoqWGr3+ZOButu5N/zq2yr+1wZq76bV2KuBAvxzigsDKIw1NsThNeTr1+mx+the9DzM3eK7ivh0WHvIL8r4KcBB+e9gSto0UA5zedPADzXV/QWXY924HR2cH6hTsq7/xO/SHjjskkSsrMs66NOEQlVVrAUuwCzRcYN0GTGee/cPpQLbIoaGSodCIp3IjIXdlB/vP0k4bPiDTbo0kdKS6ixS/UHF8vCj6yTqbylWp3mAhv9Utf1mQn8SmBep0yfzcbXg873o4aQKRb8t0p1gWj3qZiFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(66476007)(6512007)(66946007)(54906003)(316002)(66556008)(110136005)(8676002)(4326008)(8936002)(2616005)(36756003)(41300700001)(478600001)(6666004)(6506007)(53546011)(6486002)(38100700002)(2906002)(83380400001)(31686004)(86362001)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2xIcmZDS1RNNktOSkRDVGp4UHE1dEJqTCszaHNEWG5MUWlNSUVESWRNM0Qw?=
 =?utf-8?B?bW5QdDhYMVc0THh2NkVKbllSbStIcm13Z2RHYVpvSlJwcU1Vem00TzhPMWtM?=
 =?utf-8?B?aHdRRjVTd1BUeWlsZ0dVZDBwM01pZEU0aWFHMHBkZ2RTZXI2M0poYzlTdzFm?=
 =?utf-8?B?cHdIakZMYVVRdHlzTWlzcWgzQWtLL3JOUWl0OSs4cVFvWkNyeFBzU1ZVbWkx?=
 =?utf-8?B?Wnh0UXhrUDlXK2tpL3YzNWgrU0JTRkNtd0Nyb2M3WXdUQ3lZdE54NG9uRVd3?=
 =?utf-8?B?Mng2Q2ZENEJ5VUN1TVhEL2x1ZEU1S1l3aEJmNUExSnAzcFkyWVh0ekFLRjBu?=
 =?utf-8?B?bHpKYjloZGNYNzdJVE9TajlzRFQ2QWNoS1dzNGdNYnVndlh1T3NON3BUOGlB?=
 =?utf-8?B?UnJzS0ZBajdwckFacXZMT0lEWkk5TE9HbXhpOG1qK3JJN2VwWmwwT3k2d3V1?=
 =?utf-8?B?VkJieExaNmt0dGtOTDluKytZbG5Fdml3dVB5SWNKenQ5SWdBaS9lQWJCbXRN?=
 =?utf-8?B?YjJ6YWd2UC9uaW0yTm9iVFc4aGFEd2JuZ1ppb2Q3aHRkOUNOamZxZ0UvSktZ?=
 =?utf-8?B?ZnBySzRPNW5pZFluRzZYSnRlR2JKVC9QSUh0WCtUc3FnK1dvR1RpZEMvUG5W?=
 =?utf-8?B?eWZ4K0FoNENHWUFPSXdtSE1BbEUweWZCU25wVlZkTktXNjcyMm5BcXR3eUFH?=
 =?utf-8?B?ZEVMUlFNRXgyakpCYU1SRWhlbTNoNmp6Z2QrNWUrbXZIaU9Kd1MyS0N5UnZi?=
 =?utf-8?B?cjZvMkRhRnBVbGdlNWp1OFpwTFVnaFIvdnkyL2xYMlJRcnlma0F6YTZ1T0o3?=
 =?utf-8?B?M25GMm1laVZCcEo4a1ppQm1WSE5weVZhd1NDU0dpcTJlWTlhc3FreU9QZGNo?=
 =?utf-8?B?ZldSSjAwMTNOOStXdzRGWGVMc1l4RGJyT2EzQ0JLUGVNNHdmMzQyZzM5YmNx?=
 =?utf-8?B?K2pIQmFmVlRBOU1UcUd2NUdva1dsVm5RVVpRYVVuNGFhUUs2T2k0Z1czSmFm?=
 =?utf-8?B?ejRRTFR2T2FRem5sd2JXYm03bCtndWIybk55eVRiZG1HWERhTm5pNkFFWFNz?=
 =?utf-8?B?TFVIaWNCVWptWHBveitZODNZNzVFOUwrOHcvbXliNEZMMVJhSTE3WTB0NS9s?=
 =?utf-8?B?WlRHSmIvMlRVUG1mL2VTWnFIRktaR0RyQkw3dmdOdVJGUWxiSXJaRkgzczl1?=
 =?utf-8?B?VDg1b1R0SXJzczBSNVBVdXZCK09yWUZMVkRRYUlPUld1VVJnQzE1VnhsSzlO?=
 =?utf-8?B?YytXMVYwRGU0VFJvOW5FM3ZDamJjcXVhVndwZWxGbDJscHZNcWVpeFpFY05p?=
 =?utf-8?B?Tm56RlVORm9jRytWTXErK3p3ZVlkckRTWVFaOGtrVnhNMGpxYUdzWHo1cFNi?=
 =?utf-8?B?N0JHLzc0ZTArNmR4c24wUDh6cVdaT1hGU0RQUWhJZklNUmsvU20veW1talhY?=
 =?utf-8?B?clZGWDNYTnJmZElaaXRPMEt5MUhhVGh1bEllL3J5ZmVkTTUxWnV0eUZsK0Jq?=
 =?utf-8?B?V3hjRi9IOUtQcnhjVUoxN0ljcFk3aHhmSThpenRFY2VsdEZDd1NMNk5sQUNI?=
 =?utf-8?B?eWR3Vnpyd25BMkxoR0tTNk0wRGNKczFlaHpFZ3BodWh0L1JZNGw1Y0FuVC9G?=
 =?utf-8?B?Wk9FUkxUMEJHNnE5UUJiQ1BiMjFzSjFNL3RtQjlEVFl6eFVwMkl5aG9DeHdz?=
 =?utf-8?B?Syt3RURaU0xmQWFoamlsdDZVN0Nrd1NYNjdjY2oweERlcVBHdkNqck1LU1I4?=
 =?utf-8?B?bTVtQWhRaHVGZzdTVmlEaEN4YS9XV1F2Q1pIeDhlSE1tYzMrR0RYa0tML0o3?=
 =?utf-8?B?SHRtREc1cHBwTmY5SWxMZkIyQkE5cmpLMElyTHpMWnRGQmhhVkNHRm9JeVNI?=
 =?utf-8?B?ajdzUWJxU0ZkTmVJUmNQY3BtY1E2VXVhdjdUTmExOG9HaHdZT0hCanFPVlRG?=
 =?utf-8?B?VjZLTEwvNVhPKzh5NytFNS9LVmNPbzY2Y1B0V2ZuUWUrR1BVbnJSWlJaK1F5?=
 =?utf-8?B?M2oxSnBVdnM3dlhZM3pyd2ZYeWQzaDZHZ3ZXMW1CeUVzbGE0Q0ZpdnpIWWY4?=
 =?utf-8?B?V2txWlBIL3BvVTNJMFJUcUdPSEFVQ3NkbzcwaXlSR3V0dGhZSWt4UUs1WFcx?=
 =?utf-8?Q?kbreoBmGlTvTXlria1lu2edxN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07025aae-7b10-42aa-ad79-08dba3ab8225
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:35:22.2327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxpl7pOi31DqUaF+RhGK48dWg7s9mZ1aw41sB3k7BUoV9ROduXiuTGu5iA885BrbXhAwrVnABrDPGpaXORtxxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9626

On 23.08.2023 09:28, Andrew Cooper wrote:
> On 23/08/2023 8:04 am, Federico Serafini wrote:
>> Make function declarations and definitions consistent to address
>> violations of MISRA C:2012 Rule 8.3 ("All declarations of an object or
>> function shall use the same names and type qualifiers").
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>> Changes in v2:
>> - change compat_grant_table_op() definition instead of the declaration;
>> - use unsigned int for multicall()'s parameter in accordance with XEN coding
>>   style.
> 
> Nack.

Oh, I'm sorry, I committed this just before seeing your reply. I'll
revert right away, until we can settle the discussion.

> You were correct in v1, and the request to change it was erroneous.
> 
>> diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
>> index 6d361ddfce..d1892fd14f 100644
>> --- a/xen/include/hypercall-defs.c
>> +++ b/xen/include/hypercall-defs.c
>> @@ -135,8 +135,8 @@ xenoprof_op(int op, void *arg)
>>  #ifdef CONFIG_COMPAT
>>  prefix: compat
>>  set_timer_op(uint32_t lo, int32_t hi)
>> -multicall(multicall_entry_compat_t *call_list, uint32_t nr_calls)
>> -memory_op(unsigned int cmd, void *arg)
>> +multicall(multicall_entry_compat_t *call_list, unsigned int nr_calls)
> 
> This, unfortunately for many reasons, is an ABI with guests.
> 
> It is buggy that the entire file doesn't use unsigned long (i.e. one
> full GPR width) to begin with.  It these types alone which cause
> explicit truncation of the guest-provided hypercall parameter values.
> 
> But it is even more buggy to take something that at least truncates to a
> fixed width, and replace it with something that explicitly does not have
> a fixed width.

I disagree on all the points you make. Handling compat guests is quite
fine to use unsigned int in hypercall prototypes. Fixed width isn't
needed (just like you don't demand uint64_t, but suggest unsigned long),
and wider than 32 bits (i.e. long) isn't needed either because can't
pass in wider values anyway.

Jan

