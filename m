Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B65442E57
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 13:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220204.381377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mht4b-0006DC-KX; Tue, 02 Nov 2021 12:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220204.381377; Tue, 02 Nov 2021 12:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mht4b-0006BP-GP; Tue, 02 Nov 2021 12:39:29 +0000
Received: by outflank-mailman (input) for mailman id 220204;
 Tue, 02 Nov 2021 12:39:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mht4a-0006BJ-GJ
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 12:39:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1c991e0-a716-49ac-8fb6-900cfadfd7ba;
 Tue, 02 Nov 2021 12:39:27 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-_TxZn0y-NTOa946-ZI2BjQ-1; Tue, 02 Nov 2021 13:39:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 12:39:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 12:39:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0170.eurprd04.prod.outlook.com (2603:10a6:20b:331::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 12:39:23 +0000
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
X-Inumbo-ID: e1c991e0-a716-49ac-8fb6-900cfadfd7ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635856766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eG5RqtAInVJ4hHUOj/Qg/9qsC+6jqjTP3TBobnHtkHA=;
	b=hEe1H0i57qGJsMfMRjIhICzc0BlOJnzU2SvwDWNq5ffs1mFyGXjySa8rVAU9VXWs4muD4i
	cqfHq1GU57CpR0dEvbsODN2hsQQow1eSaoIw/DvBQu2PyoheFjqGnwRtAZF8G7R6iAoMM8
	FTcYUe0KgWh+gUMJQwxSq28CLIG6lHc=
X-MC-Unique: _TxZn0y-NTOa946-ZI2BjQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhKwoar0xwTqCvLNQ7NnHc+gQTtCLWN/iEhQTHnr/XPbLhKqferyG562WvpzsK00Vj/N/PWrktSSROzKufaJXo+D2DjO8a365g/Ix50t7rMtTTm/EBl0q0gJtyRgAyknlMt8GhxWm43Rffcy+lNAucWVazWyZc32AieV2gSXEH8sAN/rJirCP5pfwBot9DlSgom9BIPm6fKI7u5XDViKEFuqbIsMiQfCpWSOOEIuyahP4RgAYuUxb4ZJutqjLdvlEblSl9xoxaKUPQ2m0J8prZ1Jsouebf7755CSaDlkkOFa0Jgpd5frbHGFwR5KrGOwW19ueceLJ9qkMAGhxwGtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eG5RqtAInVJ4hHUOj/Qg/9qsC+6jqjTP3TBobnHtkHA=;
 b=bA7Bt9KuFgfzTqLeq/H4xc9oq/oRxWFltR2pyCmPUASOtYvJ2Vue7Bwvb0TZV4a0K3UNCRWiQqTfE4qa9Qpdg6C4Mn5oodl7Za21HsN0tyCw8uQAX/g5mH8cJKDMBfNZTulOPPAHAOuEWSCyD14p8apKOtk7IHqQXD/4gwYJ3bzwkxaHlN7n8M+5xQYtuWfSVrcVvt9djGc0XIybhMB+Hszd/x+LjhiImm37cfylDACLZCw+LmKE4d/hUmYnGaAY3phuB5DNQY2116ozx6c6RtL0s8jrbgQlC1HUosuRX1zvMZDmJaoZlMtV1YdZ9QDkffCNhNq9Uw3W/AJ+6ukfjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
Date: Tue, 2 Nov 2021 13:39:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] x86/passthrough: Fix hvm_gsi_eoi() build with GCC 12
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211027200713.22625-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0170.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d40c4d0b-807e-4695-67d5-08d99dfdcce8
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3118F77C2619F9BFFF1EB7BFB38B9@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	trbySBlBOzZ4+FHRxh8azOpag4R4ZmFciRPtc39oceAfQtv4d3dJ4KJT2hzN+RxhEQ5GzP/ru+/+HVkF18BehlNlLmJ5jnwvjKcPy7qMklyxUTfYgICIbLfhN0Wf215QYOKSone88jWGWnQcd02m6fPCjbxU2nKG80PJEOZ65XE+ztlOyFnX7OTfwVpnzo09qzinydddXzyFKYtBSaR/oUecyGsEHQ9qDg/Wr3UHL9hbcjh9TQfvFeefbHaan5rhvhN0N+dR+1DODSLSu3w0IiYMuQBD4Nbi9rz9KE11g5x6uyNZQdY0ZpTMoz2uRocZkpo396gn+VHH2Eqd5TU1tOETG8oPBjrzCs3827ob4C+Gm7V7aPy1J9sNoK9IVuWKmTXNF8TTRcI4LZVUXxtqtFTg0grigutflc/fe90zWqHyE80iQY7aBcJ4nt0Phojyoa9Ph6vLsQF0fxcvILEsrfiBNugyFwhJX31Y1UJhE9O/7jV4kgF3Tmckae3bFJbukquj+wJRLO9kSYwESrE+SG9HI5fBvrg4YAKh4QqXyezLrgl8dJOaUvOyV4GYrfZvg2WFGYIEQ3hgoQAWPs8RrBKq5GqJ0WY/83nWhcWFFDtytnZjv6aHvneF1+HSghIdtiC4CXdmCYsbGhuIG29GQmvTTN4WUWm9O0igaplGzObjzprbcpdO3EY+otjBF6ILnlgaO6DN+0g+B2R1TJwMiA3TqLxqU1bPkWRLqQYsTHsshuoMJjmF02fKRPIER/I8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(31686004)(8676002)(508600001)(6916009)(316002)(66476007)(66946007)(54906003)(16576012)(31696002)(6486002)(36756003)(2616005)(956004)(38100700002)(8936002)(26005)(4326008)(5660300002)(86362001)(186003)(2906002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1MydUhvWXRPQldHRjkwUW9qb21Vc1NnTUcyUmJqSmNzNGt2OXhDV3VBWGNa?=
 =?utf-8?B?Q0FwZ3dXMGc0eVdDVVJkSWp4Q0xNZXdlclI0NCtFOVhKanQ4TEc1eVFGRDZw?=
 =?utf-8?B?cmJpQStkOGZKOWZ1SHoxcnpQamFBaTFza1p1NWJ0N0w1ZDN5c0dDU3FOc0ZZ?=
 =?utf-8?B?T0drU20rMGpteUJ3bjBIK09OOG5ZeGlrU1pUS0tYcGhPQnZERHN4ZHZ6Nitn?=
 =?utf-8?B?eFp2UnRCQVZJeURCQUFCRWJpcXYwMit0U0IxQUlyaGhnQm5md0d4MFQ0NW9h?=
 =?utf-8?B?MUhnRmhXTjlOK3hqc0tKa0ZHM1BnR28xcCsxN05iWThUSXBQbXkrUm00bExM?=
 =?utf-8?B?MGRDb0xkOVJHWU42L2ZNbjB6NFM0QzR4S1hkOHFoY2VnbHA0VTNFeGxrSWNT?=
 =?utf-8?B?S2dvSzlSZklMYVhzNUJlUWcwdjdvRmFwZWYxRGEweitDaTZsQ0UzWkM5Z2hj?=
 =?utf-8?B?WCtYalhraWh0eVlmTDUySGsyc2Q1TVNWTTFBaW56ZndLNmFnRE4wQzJoQ1B2?=
 =?utf-8?B?R1QxRVU4Y3dkclYwWERnYkRSYzBDWkJpVUJyMjcwZ0NYM0EyQk56WFFEVHRr?=
 =?utf-8?B?VmNRdXlYZitqZlloblZ6YUxleVlKQ29OV1pPSUdzT3U2dXdmdC9OdWJZLzlC?=
 =?utf-8?B?cEw2UmN1bU5OU2JYRktCeXpUQkhWdWllOURsR09GUVRrcVZIQzZXTEZ4Qnp0?=
 =?utf-8?B?UFBpS2M3ZitOL2Jud2FrWVNNa3RSc1RLTkM0emYyRW5mT00xYWlRMGtseHNn?=
 =?utf-8?B?SitZNlhoOVkxOEtEeUtIS3ZsOUtaS3dIczlGcldQK05FTzU5UzZGZE5xWEpI?=
 =?utf-8?B?NW5qbCtYbjNqK1I2U1VlN3VWblJkZEt3QUFqbC9MVWR2WmJSelB5dmlqeTRE?=
 =?utf-8?B?aHM1SW1jbm1tUjRxRW9WSEk0RHhlOGZTWVZWSnk0dmtVTUpPMHMrNnV1OWZo?=
 =?utf-8?B?VFZsUEQwWUFubVhpV3AxdHl2UUNqUFNLdEJMMDJmNDlTTHkxaTk0R3ZCZ0NT?=
 =?utf-8?B?NFNtVERaOHhESlZlQkF4MEt1U3Fma3lGOVZBQm5nR1FOMzN6NW1CZWlDUWZZ?=
 =?utf-8?B?K3pSUGx2RUxVWHFaT2hnWXlyclZ3K2xBRHJNVE80dTJRWDZibTdTNjNUMUh0?=
 =?utf-8?B?eWlFeXF6MUNVNkRJN1pZcDVKbDVUWWYrbGpMZ05UeEtHMDc1OUdJY3pRWnRB?=
 =?utf-8?B?Ylcwc2w2dmU5YVhWUHFZMEJBcEVEeHh3WDR6SXZ4ZmRBbzliN1pxcGswRjF2?=
 =?utf-8?B?dk82VTZERFlmeWJaazRnMlVUWHhrejY4NHJuWVo0RmZJb3NDaWpTb01HajFp?=
 =?utf-8?B?RHRjYWNpS2RBOFI5MmxmVDRBQXJNeXJaU040TkdVUlVHeWNnVzlWOTVMRGN4?=
 =?utf-8?B?Y1FvcmRsZ3ErT3ZNM0ZxM1grak1INzh3bnNDblpUTmk2Q20yYnFBY2hHa0lw?=
 =?utf-8?B?N093Ujh4WVV2Y1NZdEdzQnVXYzhGK256Zks1K0syREdwM0xqbytodUJpOSsy?=
 =?utf-8?B?UC9jZnorVU52SFFxN1crTk1mZ3MwbzBYSzYzdHBobzlzVk1YS2ZSalphQUhi?=
 =?utf-8?B?U3VGalVyRUM2UWJpQTZvcjN0Q0FnNzhEbE1aUlorb0x3TzVHRHZyQXFYbVl5?=
 =?utf-8?B?enF2Q2JEdGI0dG5saXNWOFJHMmlCV1l3ZXc3YmJxQmg3Z0k0Z3RJSU11OC9H?=
 =?utf-8?B?TnVuM0dmL2pyaWlTb292UDJyZmxTMUdNeHpDc3l5TGFLdlBnaWxST3NRWG9R?=
 =?utf-8?B?eGllYk9qTHBCL1ZUS282b2RuRXkxS2xHeFN4MlRVTyt0dHRyTmRCUXl4bmJm?=
 =?utf-8?B?dElTTnYzUWRtWnN0QXN6REFiTlVreUxVK1BNTTB3M3lXR2l4ZHVVRGxJWjVW?=
 =?utf-8?B?L1VsSmpmc1p0VkZVVEtmd2RVMGpTRXVqUnNaMU11UUdST25JM01jOFpWNkRK?=
 =?utf-8?B?Q2h6bGhkY2RxVXovM3Q3SXNqTzl5c3FhOFJvc0s4RGs3NHYvZTlWbDlqMUVR?=
 =?utf-8?B?aUJ4N2dMQzYyWmR3aGVlOTJDYUQrOXBCNElMZ0loUDJ2N2gvamZMeTNzVEpr?=
 =?utf-8?B?V01aMzZCeUlwSEFyVGEwV2FHR2sxcGt1M285dC9nS1BMS0pld0o1bnVCT1Bh?=
 =?utf-8?B?U2MwN1Zxa0QzUkZZamF5d3pJanptNXlyZFdNTEttaHZZK1VNSzNxMmpkRTJF?=
 =?utf-8?Q?qFIgP7EAp3fBYzaPtF0B/Ek=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d40c4d0b-807e-4695-67d5-08d99dfdcce8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 12:39:24.0964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2kJj5uxmsHTKpRsoBgMKMGRK842HcODevhsUwWJjmoV6ynXx+Ti6GnQFOCLB3K8YKE0EZnxEfP7sHDMhmU4AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

On 27.10.2021 22:07, Andrew Cooper wrote:
> GCC master (nearly version 12) complains:
> 
>   hvm.c: In function 'hvm_gsi_eoi':
>   hvm.c:905:10: error: the comparison will always evaluate as 'true' for the
>   address of 'dpci' will never be NULL [-Werror=address]
>     905 |     if ( !pirq_dpci(pirq) )
>         |          ^
>   In file included from /local/xen.git/xen/include/xen/irq.h:73,
>                    from /local/xen.git/xen/include/xen/pci.h:13,
>                    from /local/xen.git/xen/include/asm/hvm/io.h:22,
>                    from /local/xen.git/xen/include/asm/hvm/domain.h:27,
>                    from /local/xen.git/xen/include/asm/domain.h:7,
>                    from /local/xen.git/xen/include/xen/domain.h:8,
>                    from /local/xen.git/xen/include/xen/sched.h:11,
>                    from /local/xen.git/xen/include/xen/event.h:12,
>                    from hvm.c:20:
>   /local/xen.git/xen/include/asm/irq.h:140:34: note: 'dpci' declared here
>     140 |             struct hvm_pirq_dpci dpci;
>         |                                  ^~~~
> 
> The location marker is unhelpfully positioned and upstream may get around to
> fixing it.  The complaint is intended to be:
> 
>   if ( !((pirq) ? &(pirq)->arch.hvm.dpci : NULL) )

I disagree with the compiler's analysis: While &(pirq)->arch.hvm.dpci
indeed can't be NULL, that's not the operand of !. The operand of !
can very well be NULL, when pirq is.

> which is a hint that the code is should be simplified to just:
> 
>   if ( !pirq )
> 
> Do so.

And I further agree with Roger's original reply (despite you
apparently having managed to convince him): You shouldn't be open-
coding pirq_dpci(). Your observation that the construct's result
isn't otherwise used in the function is only one half of it. The
other half is that hvm_pirq_eoi() gets called from here, and that
one does require the result to be non-NULL.

Jan


