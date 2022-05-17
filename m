Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8D652A135
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 14:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330753.554132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqw22-0006gS-SR; Tue, 17 May 2022 12:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330753.554132; Tue, 17 May 2022 12:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqw22-0006dr-PU; Tue, 17 May 2022 12:10:30 +0000
Received: by outflank-mailman (input) for mailman id 330753;
 Tue, 17 May 2022 12:10:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqw21-0006dl-7t
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 12:10:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56d902d4-d5da-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 14:10:28 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-YGrzqFWMNq6E67D25y4CgA-1; Tue, 17 May 2022 14:10:24 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6212.eurprd04.prod.outlook.com (2603:10a6:208:148::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 17 May
 2022 12:10:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 12:10:22 +0000
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
X-Inumbo-ID: 56d902d4-d5da-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652789427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7KyFlXyeZj0w1d0ytb3pft9xzbQ622Z4wOUPFhMFNN4=;
	b=FDYhtBsWGrccFPrqYaSC+2vwEgFas0VkvPSLP8gPgZsUgSeDBHTiTs7arOekMLQ0XeMajz
	Fi5PmSGWF/P5/EOPXEVKI5do0XTtOxGZexts52KKp/84e+S96QcA8CZLSxlgxRZjpq9kW2
	K9gbbnDOZNh0Eznm+/4RljuuiMTsDx4=
X-MC-Unique: YGrzqFWMNq6E67D25y4CgA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZMnvXYm8nt92Uo8CprFw4LTmGvBc1A8i6IZ8LYMkoiEB2eHoBmt4pBAUAIjKA0lvU3jpiUzMBNQ/8VVpf2ympDTnFcnWqRS2eWG+vg8TUDM1DcY5dJ/d05nt5xodg/ml+nYhCA9qRVYYVTo1z008orn1hKibhYrtjt+R0QUSiXOECwvHp2TSTqpgSUF+VwLnufI85wgmJSDpYKBQESFjJPl36CLsA+cwRJ3eD6aypSqLBe8UJYk16XryzNwZC4nfclStVlFjUns7OFIL40onLMYNd6vd7nr2BawORRUKl5bF3EC+Tfzj0oCvz9EHOEhoI+z6V/yOOY9RwpjeeCEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdqr8pGuGQEeW07KJbDB3s74JnBbr6SzGo6vipH58jk=;
 b=iqrjb3Op8nmYcnvo3PpSmSzqln71yXirANA6us/U/WevC3par85vYbZMeBTtZYgJIjNNYfM5PI6s+EgsQn7KCUhjzKz+YQf61hHcK6EZs9JVmz6oLSxtyIfGb3mF2umAjIaBRKVxZ4kh/JwMpOYL0emf5JT4VWD9SYvakUa1hGiZjA+rj+vGOYIsqsDyE2qmUkhyky7m6U9T61sXaBE/Hm6iT0Xke/DHYw3tAxdJiGPAboBrzAeiO3vDysMW4aArTX5wD7+oaO/aiwzeXq/cqsNjAVpaOG4i6SL7PS4HswCoF5jGR9dy95Seg937PtBLKzwkKPjNRJD9uX2cFUyzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ba9bc92-6cb3-7d7e-150f-077c709acc3a@suse.com>
Date: Tue, 17 May 2022 14:10:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for
 HVM guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220503082650.23049-1-roger.pau@citrix.com>
 <20220503082650.23049-3-roger.pau@citrix.com>
 <7525a9e0-2334-7b6d-5d42-fb68fc6ef0c1@suse.com>
 <YnjrrG6iQmUgB1r/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnjrrG6iQmUgB1r/@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0069.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9d77907-96b6-4f58-080f-08da37fe37e6
X-MS-TrafficTypeDiagnostic: AM0PR04MB6212:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB62122DBFB48F89D8336B2DABB3CE9@AM0PR04MB6212.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A2U7Gp4iJ494LqSeHSQZj1X63ATk6L1DYeC+kAJsDIEeFzqZrOQguJFTdhSkTf9D4wOkrsSPbzSXLemzD8wFULcDz56gnnZNLnNa9ypQAvQA1rNmahbIng65oFSNjxHAXNQeNNn2RJ6G3FRpAkbyNwS/qQXOOoaBC3baLmXmVyfwgR/WZ7M/VckgMAgRMF+yz2NSHdLcgMro9WYa4EhHFJ9Kfe1iriCC121vZI/iwdrP5xIdJ0PXE9hpR+mEfgd19X+hC3h2UFPdawgjwnxAgFaaLagrz9H/HMWGRMVnH77nMe0catx2vDFF9PSDf+InIieVdGkcElri7SoNZuJ3wI/da5VIeyiyvn7YXfLmf3Id37QJCWvN7P9mgNZvFMOLU6dYfbJju0yATM9B2O2bOLdzWOaG96WOEVAeULnmb1ez6Q5DGFML9kZuHr/KRzrpJj4FY9D9fmpchqtba5xmq6PMAW2hRPq9lA+ei++QykECn3oTXTcODf2xLP7+DeT4bRepGsZMcVN2AQzurxft+u9P3tOXpCA9URfaaJ2uP/Kc8PB231RKxnxju/d/oDhUtSz3czysjGMelFxSbfrcMRTxNFUeeokAJl9wJ+tPou9UWq+ydP+OdXYbO3yYNNr4JPk5CS4lC+sBjG0OM2pTdMBLzGGGQdibA7CJcZerEH000Zn2nlLL1GTW5dEPJ9Y4Uh3lVi7qHY5S4qUUzJQlyvP67pqniuY8ZdQDzJurkvY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(6486002)(508600001)(36756003)(2906002)(316002)(6916009)(31686004)(54906003)(31696002)(66476007)(53546011)(6512007)(26005)(2616005)(186003)(6506007)(66556008)(86362001)(8936002)(5660300002)(66946007)(8676002)(4326008)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7bowWNZSqd8YUUArFaNh63Mf2h5U1mYTJnqWk5PcW9jzp3B4pyOTXL/BSzeq?=
 =?us-ascii?Q?1dv49KQbwBwuPDIYaFMAThu7qGJlVQYvQQ+Cz7ddcZ3L6hm/jlpwd892mvSy?=
 =?us-ascii?Q?3xb7p6SlKdLTzJQQqKEZp4Uqw4caGPkLkt/t9i3qP8jRHcpreWpCTT/FbDHj?=
 =?us-ascii?Q?15wzlgbzm335oiX24Z9R9uGC6LL7XY9QEwim8XD2q/Bqtu5xiMUuw3a4Z/c7?=
 =?us-ascii?Q?ABVbDjF92G9ccl4888XjR4uTeAbfk+MaHPepDObUa4sXqxt+jRmdsLW9N+YA?=
 =?us-ascii?Q?7WelFk9wfsyKC3jsV0PS3tH8m/MjMjUTSEcm9sG/HhNZSnG+jUH2ClZZtuw8?=
 =?us-ascii?Q?Yf/QbXyQQFooLQgy8kleEcBU7mjD+hounZuCCeh6SCwwYHVLgYuHmcN1rtuc?=
 =?us-ascii?Q?OC6DdfhuX3S1D59lNY+nOffAu7xra5P/FefgRAVRSEczrZYvhokpk9mhfaRS?=
 =?us-ascii?Q?hUGFKV/kYjt3YUust8LidRSW64XmekaeY3ieMqq4lWRdGPTQ1ARQ/MKK0dqd?=
 =?us-ascii?Q?FlX24BFCDjj0zPRlALInM02jDK5BLihz4GaVvRYCC2UErPcbmKPr/oZzs3II?=
 =?us-ascii?Q?eZWvnAVP0xFebQ9L3uq41SI78i9IT8/Tu+xEzB4QmGfvOVdhwXmjjNOUtwdT?=
 =?us-ascii?Q?BNi90pf03L9BKWyqsHsTtpFIAesxcnn4EMs+pkWaAdRwHv7BxGHGpMZSZ3Jl?=
 =?us-ascii?Q?rik0uirpsR03d0Wfjh7NT4+p7bbGGl9LEZ/gLEodA9dzLmvQgq1mcdly13dF?=
 =?us-ascii?Q?YAIzV2ZfRIlVj5DbV7aPMO50i3OrZCxUIoR/LoX3xoID/CyDQdhNSXZrt5MM?=
 =?us-ascii?Q?K9eTpYLSdjgmQjiEjcIirorTYrmg7APhiqcruA5qDW/3TLpPANEln97cOkfF?=
 =?us-ascii?Q?gdH0rwWfJNL8Hyi1AK5O9zkv+e39R8Z4ak4nUKOhUau0548t7iR0wImePrO8?=
 =?us-ascii?Q?PMMwDQAqm/AHHdr605jiRyz4Z8WCFAgMHrJZGOc60/OusVFuMifGIgYUGkzH?=
 =?us-ascii?Q?yGq6GA2V2dPuWQ2xsL7DATUqAXITALbVSBpTvFNgpfxUd1BgnqsoEU/jQc8+?=
 =?us-ascii?Q?+7x6/K8dHBigdCZMkXhvGUQtKvmqanj8SncAIEBuPxaMCAQYHDxztpcayRF9?=
 =?us-ascii?Q?IHrraj5UtGpk3GoZ25QEntUm/+pm+9nYCavyhdLltEbqZliTSsCsNjAkW1cS?=
 =?us-ascii?Q?ielSPLvBCSLbD2RwXkS6HbVTWXTu+doS1/JfGX1NIQJgxW1nXtuG4xlobZY8?=
 =?us-ascii?Q?8IafH5YkHWeixLbFt76rJ3oI81RHlAnuCsYI5J7gP9uh6lJJHmb3vTAS+9iJ?=
 =?us-ascii?Q?zLIDBvSSk9RO7w3Zjg8p1XjZ2SNBK4Mm+3RtiqVARtGjM4X1ifM4xaMakITH?=
 =?us-ascii?Q?GZhJysGxAvZPolfUyv4U9/0VdarH1p6TcCcCfoCcQFMcgvRLzAvyfomO0VwC?=
 =?us-ascii?Q?luU0QfvSKvDe9iVtt66bpI8XpQUYzAzJg7zMQ3eDTuW/yRaFzj998rNqZqBs?=
 =?us-ascii?Q?gQoAVEWW7aKwxw0y9oeQHMZgJboNy4LrRmo6nwkuTK5UxtiFetOyJeBJ8WdD?=
 =?us-ascii?Q?DV//XyNSW7Dg2/dHCb+lQSV9jYn9gBd/mWQSBox6tagD83k33E8aXsjo/ZN8?=
 =?us-ascii?Q?xgrGEBqb4ZjIn8AX189is8ukrc8qeYzZyohNNBRIvckeddDXVNSJLi0SZhHd?=
 =?us-ascii?Q?ylOgMeK0COHx7KnOFz4hAs05xF8fmSAhGXoJE8KmfRwYaPruukOnMqmiTKzr?=
 =?us-ascii?Q?L+0KwJu2UA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d77907-96b6-4f58-080f-08da37fe37e6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 12:10:22.6639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XWEmxH9yjl6MSVAs+gKRvuPregv07v0TKypSfFSg6rtJW/3IFuOYKMNPlodEIgTc418QkW75xcjmyrzyyN8EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6212

On 09.05.2022 12:23, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 06, 2022 at 02:15:47PM +0200, Jan Beulich wrote:
>> On 03.05.2022 10:26, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/cpuid.c
>>> +++ b/xen/arch/x86/cpuid.c
>>> @@ -541,6 +541,9 @@ static void __init calculate_hvm_max_policy(void)
>>>           raw_cpuid_policy.basic.sep )
>>>          __set_bit(X86_FEATURE_SEP, hvm_featureset);
>>> =20
>>> +    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
>>> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
>>> +
>>>      /*
>>>       * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functio=
nal
>>>       * availability, or admin choice), hide the feature.
>>
>> Especially with the setting of VIRT_SSBD below here (from patch 1) I
>> don't think this can go without comment. The more that the other
>> instance ...
>>
>>> @@ -597,6 +600,13 @@ static void __init calculate_hvm_def_policy(void)
>>>      guest_common_feature_adjustments(hvm_featureset);
>>>      guest_common_default_feature_adjustments(hvm_featureset);
>>> =20
>>> +    /*
>>> +     * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
>>> +     * VIRT_SC_MSR_HVM is set.
>>> +     */
>>> +    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
>>> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
>>> +
>>>      sanitise_featureset(hvm_featureset);
>>>      cpuid_featureset_to_policy(hvm_featureset, p);
>>>      recalculate_xstate(p);
>>
>> ... here is about default exposure, so cannot really be extended to
>> the condition under which this is put in "max" (except that of course
>> "max" needs to include everything "def" has).
>=20
> Would you be OK with adding:
>=20
>     /*
>      * VIRT_SC_MSR_HVM ensures the selection of SSBD is context
>      * switched between the hypervisor and guest selected values for
>      * HVM when the platform doesn't expose AMD_SSBD support.
>      */

I'm afraid this doesn't explain what I'm after. In
calculate_hvm_def_policy() the comment explains why / when the feature
is exposed by _default_. Taking into account patch 1 (where another
maximum exposure of the feature was introduced), I'd like the
comment in calculate_hvm_max_policy() to focus on the difference
between default and maximum exposure (which could be as simple as "if
exposed by default, also needs exposing in max, irrespective of the
further max exposure below(?)").

Jan


