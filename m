Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F91C533F8B
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 16:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337272.561821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntsJL-0002N0-MQ; Wed, 25 May 2022 14:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337272.561821; Wed, 25 May 2022 14:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntsJL-0002Kp-JJ; Wed, 25 May 2022 14:48:31 +0000
Received: by outflank-mailman (input) for mailman id 337272;
 Wed, 25 May 2022 14:48:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntsJJ-0002Kj-83
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 14:48:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc6e02e9-dc39-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 16:48:27 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-nV7BKBFiNMOZ4g5pt7STPw-1; Wed, 25 May 2022 16:48:26 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6031.eurprd04.prod.outlook.com (2603:10a6:803:102::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 14:48:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 14:48:24 +0000
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
X-Inumbo-ID: bc6e02e9-dc39-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653490107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VoLg7KkUvN4T6plljhmP/C3HAVtKOnA771k1gixyZaI=;
	b=nqAMzsoddcd5xFlLgPZV+jmUQizGYGxOqzoZcQPwBIbHb94rggBPX0W2bko/7WKuNEuqSE
	R5E+WTap4SSaP/HuiWFnw3KVf/Wx5QTvXej0eE4RS04GwOFa3+cXPQzoIaLBAcRzHN5iww
	zl3jw/pNZQlvo0kymI/YfKQhh31/g08=
X-MC-Unique: nV7BKBFiNMOZ4g5pt7STPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mU/8kShQOOdFkJ5LbDL6tpj9FagSLXnZXgPd4wCJ91IHQH78qunYTTOvC14wsh8Xvk60/b8SfmfsvbJtjrEDydZ00rJl3Co4TxyCCupFdaxrrQE9kgquuoY3oDbiQbXwENQWl8m+zLUES1VI7FuYrHemT8LreXTAAC5xdZJ8MSH+s2vC06DfsA+0VVXfIvrLRiP7z7iT5KP7n7Ye7gpdcBVKSNMplamZla2545tKLHU96lSf90D3t8UnSEYlMN23PVuF5w1grtBo0N6nvgpmWkfaaFv38AAttElJpap6GhftWyJmTlc8lZj/5BDMpUHtOmiiX09Icf9ufK/m4QY6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoLg7KkUvN4T6plljhmP/C3HAVtKOnA771k1gixyZaI=;
 b=BJOMsUCrIlDP34tBUsxC5lpR8LzfV3uxpQkN+skDPW9qtG6Dd09FQ325Nex5F0XJI4SaDOfNIKhXUGWkcrsw4l7J507Eu+N2VUpzuWWSAXsLiq/RqCKgTSGRwEibkikShduWXqHnBSMTiD2mr19JSVuTzFUrXUyXSMB0uNhGzeXdxxxO1k842tH4Kz06X8zidpEujSGby5VuSaWBqwukpkU91S9U0ocuvRBSRu45n7GS5F3S30Pn9mdNUyOAjvPke1VhZjVPpIIZJpoMqt6KXqSRiGei3BJSyQvQXyK7FdH7sD4aMNVVScdvI6qkvQp3OFG8g1gETVL+GbwqiQEbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3685076-1f12-b051-b52b-e67186120388@suse.com>
Date: Wed, 25 May 2022 16:48:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xsm: refactor and optimize policy loading
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220523154024.1947-1-dpsmith@apertussolutions.com>
 <dc50678e-0a35-e3a2-110b-9b5ba7f7364b@suse.com>
 <db5c23cc-074f-2c7f-8033-a4b6aaf8443e@apertussolutions.com>
 <8aebc234-e870-9435-9f60-3c06013421d9@suse.com>
 <4d3a8914-a505-230c-5807-8ca295c3b60a@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4d3a8914-a505-230c-5807-8ca295c3b60a@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3883268-3697-4abf-d4a6-08da3e5d9e80
X-MS-TrafficTypeDiagnostic: VI1PR04MB6031:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB60310A59FD65A36F45211AB6B3D69@VI1PR04MB6031.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GiN6r3XMKOr4Cr+gYjablkAgjPnhDvxRF8iFH11n+1ajTrt9qbuTZOctkoraivrknpch9fqZsOyM4eoCgh/7Zd4rcu8kA0Ib0hcPsttLQdBJzknDeAqFIFhbcTtlZC6VUGI7/Odtmq9CfuYwgguwyRf5yu6DUgB5pah+CkpL74Rj0h9TkzavZdLT/+q6SnWzMtJwbLqLR1jQQOpq822zecCo6D0O+S1+vFBATP3IlrT6p+AQMen/F342REw74EelBCtWCdFx/bbQblkUExAsOKlRvtta9Zih5tmqHQRo6V/Z8Y4RiP44sAyo8tBJkoN3eyGUe2i6iuLyzO8hmuKBqSYgi9xnlPlRW/e+zgK10f1cQ0/W6PrzR6fXeO/wDhvwrSlrPzR+MKaNyHSyFZEJZyWs7W9AjxrtNqxjEsfRWWvKGW7FWypYTfRlPW307J95DzYZicwkGXF3XH+O3/bQf3dbRolyUeK0liwZVdvph/Uj7HbkFWgf4twIiwj7r7BYaevzKIXizMsRT1T95mrTJkP0SLmwvuoR9s5VW9srftuexX3xwrl5FraLHXx4/LZN0jN2EWTMWmfuiwQT6CCRQfEuDj3KTeE0ywHnZXO2ivEc08Kb6GXzf3ZTMI4olSCVDFcqppxBXBlB3RrTqLcyB385EytaMJe+YnQYt/yZUiOm5ySndSdz+wugYkWyXyT3ZWhOTBf2CB0h+g91LQaHB1T1Z+CL2rIuLT0/gUEc+qELF6Sv6Gn7o2NusY2KUow9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(86362001)(26005)(6506007)(31686004)(2616005)(6486002)(31696002)(316002)(6512007)(508600001)(6916009)(2906002)(5660300002)(38100700002)(36756003)(4326008)(83380400001)(53546011)(8676002)(66556008)(66946007)(66476007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGtkRk9UZDFHdkRPVUQ2aCtSUTByNVJESVFLaTQ2Tk5QWTNnQ2xuemZKa1VB?=
 =?utf-8?B?amw0Q0psU0k1aEpram1pT2tKeHdWQlpOUVZ2SE5tc01pcmRRM3lIb3VtUXQ2?=
 =?utf-8?B?UkRvRXVNQlNmRkNIRjdKa0RNUi9hQnBEaGhqaVNjMm0ySVh6Q2hUTElST2h4?=
 =?utf-8?B?YXdFd3dPeklFdnhCak1QNDJMM0pkYXZnZERsWHBTWW9uRDdHZHgxMWZZcmM1?=
 =?utf-8?B?c3dHSVBld3VpSzFIaVV1bGZ1WjcrQ1ZneHMwakIyRmR6Z3FGMjhnYWVDaWVP?=
 =?utf-8?B?QlIwQVZyM0tSaXM0WXNHVjAyT3BHRXluSy9KRm1KVlFxQ1hhMC9mY2kvelZr?=
 =?utf-8?B?WDRzajBTa3Q2anE2Y1FoTVZoa2dBdGd3amNmYnl0ejFFRXlGQnNRN2FsKzFP?=
 =?utf-8?B?Rm12cENsY1A4NkVicjdQV1pvbTlHdUwyMHhDOUxyV0tlZDZqWklOcGNrdDVM?=
 =?utf-8?B?akVrL1ZnZkh2T2d0N1BEMFI0cU1SZkEyMEMreGRQZEhMaUt0akUvYTgwM1Ir?=
 =?utf-8?B?SGZ1M0RZblN6dG9paGZ5N0dpVzh6RzVtZ3N6ZjZPTUVmUTcxZnZNODhOa2Rn?=
 =?utf-8?B?Z25HSE9SYUZ3aVFZYndKL3V2blRnT3NBNXBTbENLUjNUeUMydVVKUEhhYkNX?=
 =?utf-8?B?N1VBemp4ek91eEZtS1QyY2ZnaEVEK1dBczRJanFsMWMyS3NsN0c1d3dybi9L?=
 =?utf-8?B?QU05L1NxQ0tia21talpHL2VpRVRZUFhlYVNmR3ZydmVBc2p1c1R4U05IYlBI?=
 =?utf-8?B?VEpJTDdSNkkvN29IYXhzWmpEUjQwRGZnRmhBNmNQUUZQelczS0RETUpQcG11?=
 =?utf-8?B?d29PakJ5U0VQVDAwcFZUYlcvZmFrRVJQVUM2Tnd0OE1OUUVRbllRU1pLaFRC?=
 =?utf-8?B?cGw0dGI2QXAxdXZiUEIrZG4yWnVQVDNEa3NsYVNQN0VZR2FJcXRwSVlqNm8y?=
 =?utf-8?B?TnB4anQvTWwrbGVvMUQ0Q1lmYzhMMk0zWUM4UlBNb1RvbTljQkpyQTRXUFdr?=
 =?utf-8?B?S0R4SGlnYm9EaW91Zm8wSC9YM2ZkZGpwWUN1aEhJNGxud0hBZWx1K0oyak9v?=
 =?utf-8?B?ZEpSRHpkeUxCK29wUU5oNk9kbkhlbGNEcXdHekdBeGRwSThJdzZ1OHNaV2U2?=
 =?utf-8?B?QU1NUVQzNzdnL2lxUnRsT1ZRUlExK1JMdU00Rm5qZFlJVHRDSjVrY1k4RGlR?=
 =?utf-8?B?TGRkaFpPSXhPMlJoVnB6R1IzUEorQmtXSHp5MU9WYzVmenNwS3NwNnpIVUQx?=
 =?utf-8?B?VmJ4V3RUTDBONEV4U0V5MXJuUGI3a3ExbXhsa2M1ekUvM2s5VUFMdjdVa3dK?=
 =?utf-8?B?V2U0K0ZiZXFHR09maENCZnN3eW5ud3lIZmdyNEc1bEY0L0N2bXJIRFdtaGFi?=
 =?utf-8?B?ZERJSWZackRHTG9qUlJvTnBFYU1lUERUbWU2aEg5R3FqUHNRVjdJbGFCV0cy?=
 =?utf-8?B?Nk9mWEtnNjlZMGNPWGNPbWlmbXFXWlMydWp0VzN4RXRybGt4N1pnaE16eGhU?=
 =?utf-8?B?R2dWZGo1YTNjdVFFRmdRNWh1dlZIQ3hzNnNUZUJPdGtTYlYrZFgrbkhFQzd0?=
 =?utf-8?B?MDhTTE15c2M3dm4yZGtHWitPQTJhWXlKaWxrZGJWbU1YSUpHTjZYSlYxMXZC?=
 =?utf-8?B?clZHNTR1MHVUVDFtdU5KRHFwZFZpRHVjS3pmRW42OHZaTWYvWGJQOGRGS3FM?=
 =?utf-8?B?YXFsRlk4NTZRNldXQ2hGNHZNczgxekxtUURxSXF3djA0RStMbFRPcGtKU3R2?=
 =?utf-8?B?WHN0c1JpR2E5b1l2d0pobTk2a2VRajZISVFMaEh6ODhnV0Q0SVcyUjJqaGNz?=
 =?utf-8?B?a0wzL01Qa2Jod2xBNnZkQTNZSnZubFFGRFNEYXlDQzhpZHN0bnRpdEZCdUYv?=
 =?utf-8?B?NHNmMk9YbkJReFpJMW50RDEvdExwMXRtcm1mcVRCRlFjb016SHNDMk5BSHNh?=
 =?utf-8?B?OWMwMWVlNDdEWTgxck95Ylg4VnVZbmZqWVVlR20vOWlKSzZJVUFBZU1KNjRP?=
 =?utf-8?B?RjNHTmxodkczNm1yc2l4Y1hHWnNnWUsyUUlnd2V2QnJEbi9jSlJlbWRkOS81?=
 =?utf-8?B?OU93MlR5Y1c3YlUvVVprZ3ZMN3o5cEVZT3B6YnczSDVxc3dXcEJHUkRFNkty?=
 =?utf-8?B?MzFaUTNVRzlNbVhnbytOaWJFVE1JYUtnUlM4TnU5WHYvazl3eXBTdTdTeU5l?=
 =?utf-8?B?TGJESmlaTFVCV3Z4emVhYXNBVlhjVzVRY0d5RythaThsaFY1ZTZYVzNWdDRu?=
 =?utf-8?B?T0xldmtGREY3MXVSRlZ6S0dHUGViK2NnRzArUkdCSHRCa2hleTIxazJoaVpD?=
 =?utf-8?B?THAyQjhkL1FBalZXVmY0dWw0ZStYYkJYREI2Z1NsVlJRZjNVMnAxdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3883268-3697-4abf-d4a6-08da3e5d9e80
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 14:48:23.9720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekXACo4k9oypjARm0jDj1Ev/2K5cYaPomMybHybv1J3yzYb/9eHTFIOIa2QJnBifWiBpEUDt/xeClQwDMttLhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6031

On 25.05.2022 16:11, Daniel P. Smith wrote:
> On 5/25/22 02:37, Jan Beulich wrote:
>> On 24.05.2022 19:42, Daniel P. Smith wrote:
>>> On 5/24/22 11:50, Jan Beulich wrote:
>>>> On 23.05.2022 17:40, Daniel P. Smith wrote:
>>>>> @@ -36,10 +36,17 @@ int __init xsm_multiboot_policy_init(
>>>>>  {
>>>>>      int i;
>>>>>      module_t *mod = (module_t *)__va(mbi->mods_addr);
>>>>> -    int rc = 0;
>>>>> +    int rc = -ENOENT;
>>>>
>>>> I'm afraid I can't easily convince myself that this and the other
>>>> -ENOENT is really relevant to this change and/or not breaking
>>>> anything which currently does work (i.e. not entirely benign).
>>>> Please can you extend the description accordingly or split off
>>>> this adjustment?
>>>
>>> Let me expand the commit explanation, and you can let me know how much
>>> of this detail you would like to see in the commit message.
>>>
>>> When enabling CONFIG_XSM_FLASK today, the XSM_MAGIC variable becomes
>>> defined as a non-zero value. This results in xsm_XXXX_policy_init() to
>>> be called regardless of the XSM policy selection, either through the
>>> respective CONFIG_XSM_XXXXX_DEFAULT flags or through the cmdline
>>> parameter. Additionally, the concept of policy initialization is split
>>> between xsm_XXXX_policy_init() and xsm_core_init(), with the latter
>>> being where the built-in policy would be selected. This forces
>>> xsm_XXXX_policy_init() to have to return successful for configurations
>>> where no policy loading was necessary. It also means that the situation
>>> where selecting XSM flask, with no built-in policy, and failure to
>>> provide a policy via MB/DT relies on the security server to fault when
>>> it is unable to load a policy.
>>>
>>> What this commit does is moves all policy buffer initialization to
>>> xsm_XXXX_policy_init(). As the init function, it should only return
>>> success (0) if it was able to initialize the policy buffer with either
>>> the built-in policy or a policy loaded from MB/DT. The second half of
>>> this commit corrects the logical flow so that the policy buffer
>>> initialization only occurs for XSM policy modules that consume a policy
>>> buffer, e.g. flask.
>>
>> I'm afraid this doesn't clarify anything for me wrt the addition of
>> -ENOENT. There's no case of returning -ENOENT right now afaics (and
>> there's no case of you dealing with the -ENOENT anywhere in your
>> changes, so there would look to be an overall change in behavior as
>> viewed from the outside, i.e. the callers of xsm_{multiboot,dt}_init()).
>> If that's wrong for some reason (and yes, it looks at least questionable
>> on the surface), that's what wants spelling out imo. A question then
>> might be whether that's not a separate change, potentially even a fix
>> which may want to be considered for backport. Of course otoh the sole
>> caller of xsm_multiboot_init() ignores the return value altogether,
>> and the sole caller of xsm_dt_init() only cares for the specific value
>> of 1. This in turn looks at least questionable to me.
> 
> Okay, let me change the view a bit.
> 
> The existing behavior is for xsm_{multiboot,dt}_init() to return 0 if
> they did not locate a policy file for initializing the policy buffer. It
> did so because it expected later that xsm_core_init() would just set it
> to the built-in policy. BUT, it also served the purpose of succeeding if
> it were called when either the dummy or SILO, neither of which needs the
> policy buffer initialized, is the enforcing policy.
> 
> This change starts with moving the lines that set the policy buffer to
> the built-in policy into xsm_{multiboot,dt}_init() respectively and only
> return success if it was able to populate the policy buffer. In other
> words, if there is not a built-in policy and a policy file was not able
> to be loaded, it returns -NOENT to represent it was not able to find a
> policy file. This change makes these functions do as their name
> suggests, to initialize the policy buffer either from MB or DT with a
> fallback to the built-in policy otherwise fail.
> 
> Upon making the function behave correctly, it exposes a valid set of
> conditions that under the current behavior succeeds but will fail under
> the correct behavior for xsm_{multiboot,dt}_init(). With flask enabled
> in the build but not the built-in policy and either dummy or SILO is the
> enforcing policy, then xsm_{multiboot,dt}_init() will be called and
> fail. This is where the second half of the change comes into effect,
> which is to introduce a gating that will only attempt to initialize the
> policy buffer if the enforcing XSM policy requires a policy file. With
> this gating in place, under the above set of conditions
> xsm_{multiboot,dt}_init() will not be called and XSM initialization will
> succeed as it should.
> 
> Now to your question of whether these changes could be split and given a
> focused explanation in their respective commits. Yes, I can split it
> into two separate commits. While the gating of the call to
> xsm_{multiboot,dt}_init() is an independent change, the change to
> xsm_{multiboot,dt}_init() itself is not and must proceed after the
> gating change. This means it is possible to backport the first commit,
> gating, independently. If the desire is to backport the second commit,
> xsm_{multiboot,dt}_init() behavior, then it would require both commits
> to be backported.
> 
> I hope this helps better clarify my reasoning and if you would like to
> see the changes split how I highlighted, just let me know.

I'd like to leave to you whether to split. All I'm after is that from
the description it becomes clear what the (intended) effect of the
added -ENOENT errors is, which didn't exist before. Now that we're
about to start adopting some Misra-C rules, this may even need to
extend to cover the case of so far missing error checks potentially
being added up the call tree.

Jan


