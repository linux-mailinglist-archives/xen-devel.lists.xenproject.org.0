Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02673C880B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 17:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156094.288029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3hDX-0000ej-4s; Wed, 14 Jul 2021 15:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156094.288029; Wed, 14 Jul 2021 15:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3hDX-0000bt-1a; Wed, 14 Jul 2021 15:54:35 +0000
Received: by outflank-mailman (input) for mailman id 156094;
 Wed, 14 Jul 2021 15:54:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM3W=MG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3hDW-0000bj-9M
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 15:54:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c764c77e-e4bb-11eb-882d-12813bfff9fa;
 Wed, 14 Jul 2021 15:54:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-Ldhk52UTN42QUGLfAC6mhg-1; Wed, 14 Jul 2021 17:54:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 14 Jul
 2021 15:54:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 15:54:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1PR01CA0020.eurprd01.prod.exchangelabs.com (2603:10a6:102::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 14 Jul 2021 15:54:28 +0000
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
X-Inumbo-ID: c764c77e-e4bb-11eb-882d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626278071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IFVZgTZ3OroZ/oUWC9+lEa5llWzdCz4hmlnk383hato=;
	b=m+S2H/wj4zia364KaB0xjLr5hu5hm+em3jkEhN2jKGEH2fbSDPG/oIuGSOArVaCqAySq0I
	oNftG2FQ4EreF2tHkv1vQRT8CrKZvyVvVkSAhYAF9JDnk2AYaYjJVxJEe40W0qS60nS5NV
	Bgj6eZmGhyB9zDTmMqGNwQTT8LjSIPc=
X-MC-Unique: Ldhk52UTN42QUGLfAC6mhg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kd4RJnHbwl8C7Nh1Jt9nr0W7ctY+NeEq9uRkDcb5/nZbMfeqNnx4pQfk81WvXgrtZDDNjFanIkJ60HRnVQHnS1FOjqY+X75HiTnTKaEtg+/sIWygaV7wP/dIp9zITKiEAJv4eJcgj9apgcrDcoP0TzzXZ2qgMw03tWV3kTHpWEpz9WFM7X6QKYA5iTgkmD4OatnE80HQkt+3HxP6hYi2ufh7FHen0jKgFFgyb80vZzgjC8gNJeKUaCAvp5RvBOp/dSv0etCi/jkeIEmlyOGuy6qce11Cmdkx9NHLdhVZS9h1WRS+gUuksWbmUmEHKcqwbC+1CVPF5GXViTiMDc6RyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFVZgTZ3OroZ/oUWC9+lEa5llWzdCz4hmlnk383hato=;
 b=joUrdrPbhUNc9vR/Z/1akXEZv5zQinkGecqzMfrISgEFvS77uzEMtIohYl2/Fmr7SliaPw1YdVFPLxTmGV28NTNbaLifUCvmNqLScQq4pA963Ovggic+vShpa0T9wCGTiDAkc7pspgN2rccyaK/xCDNaWLHmGcYNgwBXWrm7P50270qdFGn4EhwZD+prGl5rsSoUfXBlCr5aYXIEspqjmX6nKLPtfYEjSGUxYq/nUqR4bLe68F3G4Fc5iYSXVhx2qwTNz3hpOuxVeLofy8k1yKx+tFXoSc9LMPCQIRTJvuTzT215O83NOHhZcUkjiOo/uWLSu7r+7Y5Zv0FMjVRwOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 02/10] xsm: refactor xsm_ops handling
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-3-dpsmith@apertussolutions.com>
 <1638ecbe-59a2-1ef1-f18e-dc63e1740168@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <386d3846-a4d8-5c40-498b-1b4adae68687@suse.com>
Date: Wed, 14 Jul 2021 17:54:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1638ecbe-59a2-1ef1-f18e-dc63e1740168@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dcf639b-4605-4296-b20d-08d946dfa9aa
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB295801AAED207A6BDF21CE0CB3139@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TjBg864nLYLZAMFpqpeS1q0d6KPy6e0l/PZBOfDo/ut+7XYYkYQO7c8LXFbuYRR5sLD19SG+Yqw0IPPm4OzL7Ku6C1w3bqPbvKVJUdXXPCbULfXzrdNzj9G95ns0rTNbuUthvbiUs70+Xq3Degs+xj9nfhMq4WSzat8Nj44EDoBIxm2nl/pcjrEaoBzmQSsN8haAEc01u6S4LMdjK3cEIuOwWD2N3EBeXnMhQy/2gBDCFNXgt/jG1aeY0NibDnwchL/hCReimAin3AHgFVa6K55xAmERsACg6PkrkN9SHsKZY2JQW0dU7sHQRo4ysf88w42qER8tmWW4uhCPWvSV02nUofMr+d8zya8Fma09WDhvNsf/OhNpG9Pe19uCQjqAco/oLYfMr5IhLhDUsHYiWtrCUhJuysJPcPx+EY1eMUOfoV7VhXfDX6hTnjFOOT+4X7JNC+w+bgW6/OTMQxEq2bx6eSRALFTKuXWGi23uM2jk9eEMMFcxgsp7Ym0IVA8h+1S3RCdkiXMbBZvJbwycCr0DRrK/btSWOtS1TSUlHA5RYmYX8XpYAaeV33wgd9OdeT5070RVEWRHjYiaMDIWfOGZXd7LZCLpAHFQYpwvqyMtv/GqRVXN6XMeo6m69hPPGboKkMt5qBXKiI0lrGfhwwOXPlLkrBe4EeX5jxJ4/avq+RP5z6JLZ67RuwOS7vnh85bLYM6fO4HekfIIBScl8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(346002)(366004)(376002)(396003)(136003)(16576012)(53546011)(316002)(2616005)(31686004)(186003)(26005)(6486002)(956004)(36756003)(110136005)(8676002)(66556008)(66946007)(8936002)(4326008)(478600001)(38100700002)(83380400001)(31696002)(86362001)(66476007)(2906002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2FuWit0NndwMTFaUXNRcDZsS0dWQ0tyREUzLzYvVFZEWjdSMk9PRnBvakFy?=
 =?utf-8?B?WDdtTlpXaDM3UXgzam1tQmpEK3dhenJBUjhDTExOYTg1WVVlTC9qMUxSdUJt?=
 =?utf-8?B?Z2RqTGRnYVRTOGJsY1pEUllnbG8xdWdrRU03aGNYMmNTTlhRWmcxK2Z1SXRW?=
 =?utf-8?B?VUNRVXNNeWpkTkVJaVp4YWJra0tvOTJteG9TVy9jMEhUc1ltWkl0V0g4Ymtp?=
 =?utf-8?B?WDhVZ1ZSSHdsNWxxWm1jYjRVd1o0U2Jhc0Q1WDB4OUNjWW0zUWZ1YWRRWjE2?=
 =?utf-8?B?djhzL3Fya0p2NzJYL1gzZ0EwbHpaTkc3MzVTVCsxUUdMbTQwbVZmaUZIMmp0?=
 =?utf-8?B?VnI3d05BMStZMDhkY2tMMTdSUFFoQmM5NHk1aFhLampUbFdWeW15VFF4cW84?=
 =?utf-8?B?M1dRdUxHZWVMOUIrRStYK3BLRXFjR3d5MytlTFZnMDdvNWpvYzNpOW8rOWsy?=
 =?utf-8?B?cjIrZEZTQzFpVzFZWXJIZldHT0xROXFRcjRNRVBqazZ0bytxenhhWFNJSEpr?=
 =?utf-8?B?ZzlTZUpJQTVadVQ4Uys5dUY3aDlLZmgxVUJtWXFZQjRuclZWTHdDU0xVQy9m?=
 =?utf-8?B?NmxOWXFqQ0VIVEJCWlZHRTgwZVR5WnZtNVVmVnQyRm8yWlhrMGIxcXFFM0NY?=
 =?utf-8?B?L3QrSzI5K2R5WTNRM3phV1JiSzE3eUJFRmdvQUtkNHV3a1JMT0Q3dVgyVy9j?=
 =?utf-8?B?VVFXb3pnUVd5VEdiNDlzcm53dHM1YnFaKzdLQzIwaG9WLzA1SkppM1Joa01X?=
 =?utf-8?B?d0FEaDBLdFlqSTg4K3NEU3lCbGNmckdQaThzeDFMcGZnMHl6RkVySDJQSk1T?=
 =?utf-8?B?Z3ViNGJlRmlLZENrSUJLMjNjYTZ4ZmhyZFNzSVN0UXBia2hVVWdZbDFmZTFK?=
 =?utf-8?B?MTJnWjU2RXlGbVRZbERVNHZ5M0xBZ0ZlNGNwUkxCVEhsTFpHM0orQjlaaHpo?=
 =?utf-8?B?N0hiR2ZrWDJKdkRBTkZRTVA3VzRzSm1OSkwxTGx5YXBxTUVOMGJQUDRvUTlF?=
 =?utf-8?B?clVaRk5JMzk5NXROYkFCL1BNWnh1OE1VWmdDNEovK2VKRDZSSzB1QUFUMkx3?=
 =?utf-8?B?aitVU05mYWRzZ1ptcmtmeHQ2TnBjYUpMalJZWEY2WjRwK3dCV0puSjcxeVdH?=
 =?utf-8?B?MG9VK0N4MkZpWk44RDZZODJHWm5nNkw1Y0IwUnBYdURXdUZJenp0N2xNWE14?=
 =?utf-8?B?SUROTGlvYVRWQTJ0ZU5TcUxpbVVqZUtNZ1AyQjNxMnJSbzlEUTdQQ2pOY1Jx?=
 =?utf-8?B?RnNjdCtOaHp6YVBLUlN6YVMvNU9iOU13b0dZSXU4a2Q5RlA1Rlo3azk3N0xj?=
 =?utf-8?B?aTdORDRsdTJTM1dWTHIvcXF4OE51N3RyZENYMDBnS0ZKMmZHRnp6ZUhScDZk?=
 =?utf-8?B?aVR0ZXlDTE93UWlHcHB6bTdsMDBMamZLbkpMU20ySzZVTjRWanRpYlB5eTZH?=
 =?utf-8?B?ZUVRVnZTVnZnd3pQYVIzdS9Gcy8rcjk2b0t5TS9BODZsTzA0OGlvZHA4V2JQ?=
 =?utf-8?B?ckFSWXpaY3JpWXJucWpPdi9OaGhGNmlsYUVHVUxBdWIvZy8zK1ZEUklpK1VG?=
 =?utf-8?B?aVZ5ZWVzUTcwUEhFcU9KY1lZM0FLclZPamFwSU9yd2FTd1QvdU1iZVUzWlFn?=
 =?utf-8?B?Lytaa25OWkdpdUlUcm8xMXJXTWJnMy93c25abUNCVVRpcjNOb1ZyMkRHeFhR?=
 =?utf-8?B?MFBkTjJuY0tJYVBmNCtWWlRDWkoxUXMxTFBXYmhlb1NZdDB4QXRUMytxamZD?=
 =?utf-8?Q?4gjJ3rNWD/viTtRDjuIpD8FocrqeRYGA8lB0l6F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcf639b-4605-4296-b20d-08d946dfa9aa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 15:54:29.0142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTAE90l/Qu9xJ2DbLTdrxCJ8+b0WDLPcDSmhlyYmhBWB1NGOmcltKy1GP2AEb4R+oRJ3VGYg94abbO3wGRuHDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

On 13.07.2021 01:39, Andrew Cooper wrote:
> On 12/07/2021 21:32, Daniel P. Smith wrote:
>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>> index ad3cddbf7d..a8805f514b 100644
>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -747,16 +747,14 @@ extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
>>  extern bool has_xsm_magic(paddr_t);
>>  #endif
>>  
>> -extern int register_xsm(struct xsm_operations *ops);
>> -
>> -extern struct xsm_operations dummy_xsm_ops;
>>  extern void xsm_fixup_ops(struct xsm_operations *ops);
>>  
>>  #ifdef CONFIG_XSM_FLASK
>> -extern void flask_init(const void *policy_buffer, size_t policy_size);
>> +extern struct xsm_operations *flask_init(const void *policy_buffer, size_t policy_size);
>>  #else
>> -static inline void flask_init(const void *policy_buffer, size_t policy_size)
>> +static inline struct xsm_operations *flask_init(const void *policy_buffer, size_t policy_size)
>>  {
>> +    return NULL;
>>  }
>>  #endif
> 
> As you touch almost every current user of xsm_operations and introduce
> quite a few more, can I recommend taking the opportunity to shorten the
> name to struct xsm_ops.

+1

>> --- a/xen/xsm/flask/flask_op.c
>> +++ b/xen/xsm/flask/flask_op.c
>> @@ -226,6 +226,7 @@ static int flask_security_sid(struct xen_flask_sid_context *arg)
>>  static int flask_disable(void)
>>  {
>>      static int flask_disabled = 0;
>> +    struct xsm_operations default_ops;
>>  
>>      if ( ss_initialized )
>>      {
>> @@ -244,7 +245,8 @@ static int flask_disable(void)
>>      flask_disabled = 1;
>>  
>>      /* Reset xsm_ops to the original module. */
>> -    xsm_ops = &dummy_xsm_ops;
>> +    xsm_fixup_ops(&default_ops);
>> +    xsm_ops = default_ops;
>>  
>>      return 0;
>>  }
> 
> These two hunks will disappear when patch 3 is reordered with respect to
> this one.
> 
> ... which is good because you've just pointed xsm_ops at a
> soon-to-be-out-of-scope local variable on the stack.

Not really, it's a structure copy now. What I'm concerned about is
the size of that on-stack variable and its lack of an initializer,
undermining the many set_to_dummy_if_null() that xsm_fixup_ops()
uses. Can't xsm_fixup_ops() act on xsm_ops directly, perhaps after
memset()-ing it here first (if nothing else then just to be on the
safe side)?

>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>> index f1a1217c98..a3a88aa8ed 100644
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -1883,7 +1883,8 @@ static struct xsm_operations flask_ops = {
>>  #endif
>>  };
> 
> flask and silo ops should become:
> 
> static const struct xsm_ops __initconst {flask,silo}_ops = {
> 
> as they're neither modified, nor needed after init, following this change.
> 
>>  
>> -void __init flask_init(const void *policy_buffer, size_t policy_size)
>> +struct xsm_operations __init *flask_init(const void *policy_buffer,
>> +					 size_t policy_size)
> 
> struct xsm_ops *__init flask_init(...)
> 
> Otherwise you've got the __init in the middle of the return type, and
> some compilers are more picky than others.

Also, even if {flask,silo}_ops couldn't be const for some reason,
these init functions now want to return a pointer-to-const, as
the caller isn't supposed to modify the struct-s any further.

Jan


